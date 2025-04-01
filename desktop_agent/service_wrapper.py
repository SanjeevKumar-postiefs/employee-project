import os
import sys
import time
import win32serviceutil
import win32service
import win32event
import servicemanager
import socket
import threading
import win32ts
import win32security
import win32profile
import win32api
import win32con
import win32process
import logging
from datetime import datetime
from pathlib import Path

# Set up logging
log_dir = os.path.join(os.environ.get('PROGRAMDATA', ''), 'EmployeeActivityTracker', 'logs')
os.makedirs(log_dir, exist_ok=True)
log_file = os.path.join(log_dir, 'service.log')

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(log_file),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger('EmployeeActivityTracker')


class ActivityTrackerService(win32serviceutil.ServiceFramework):
    _svc_name_ = "EmployeeActivityTracker"
    _svc_display_name_ = "Employee Activity Tracker"
    _svc_description_ = "Monitors employee activity and idle time"

    def __init__(self, args):
        try:
            win32serviceutil.ServiceFramework.__init__(self, args)
            self.stop_event = win32event.CreateEvent(None, 0, 0, None)
            self.tracker = None
            socket.setdefaulttimeout(60)
            logger.info("Service initialized")
        except Exception as e:
            logger.error(f"Service initialization failed: {e}")
            raise

    def SvcStop(self):
        try:
            logger.info("Service stop requested")
            self.ReportServiceStatus(win32service.SERVICE_STOP_PENDING)
            win32event.SetEvent(self.stop_event)
            if self.tracker:
                self.tracker.stop()
        except Exception as e:
            logger.error(f"Error stopping service: {e}")

    def get_user_email(self, session_id):
        try:
            # Get user token
            user_token = win32ts.WTSQueryUserToken(session_id)

            # Create temp file for output
            temp_file = os.path.join(os.environ.get('PROGRAMDATA', ''), 'EmployeeActivityTracker', 'temp', 'email.txt')

            # Run whoami /upn directly
            import subprocess
            result = subprocess.run(['whoami', '/upn'], capture_output=True, text=True)
            email = result.stdout.strip()

            if email and '@' in email:
                logger.info(f"Found user email: {email}")
                return email

            logger.error("Failed to get user email")
            return None

        except Exception as e:
            logger.error(f"Error getting user email: {e}")
            return None

    def SvcDoRun(self):
        try:
            logger.info("Service starting")

            # Wait for user session
            session_id = self.wait_for_user_session()
            if not session_id:
                logger.error("No valid user session found")
                return

            try:
                # Get user information
                user = win32ts.WTSQuerySessionInformation(None, session_id, win32ts.WTSUserName)
                domain = win32ts.WTSQuerySessionInformation(None, session_id, win32ts.WTSDomainName)
                logger.info(f"User context: {domain}\\{user}")

                # Get user email
                user_email = self.get_user_email(session_id)
                if not user_email:
                    logger.error("Could not get user email")
                    return

                # Set up user environment
                user_profile = f"C:\\Users\\{user}"
                activity_tracker_dir = os.path.join(user_profile, '.activity_tracker')
                os.makedirs(activity_tracker_dir, exist_ok=True)

                # Set environment variables
                os.environ.update({
                    'USERNAME': user,
                    'USERDOMAIN': domain,
                    'USERPROFILE': user_profile,
                    'APPDATA': os.path.join(user_profile, 'AppData', 'Roaming'),
                    'LOCALAPPDATA': os.path.join(user_profile, 'AppData', 'Local'),
                    'TEMP': os.path.join(user_profile, 'AppData', 'Local', 'Temp'),
                    'TMP': os.path.join(user_profile, 'AppData', 'Local', 'Temp'),
                    'ACTIVITY_TRACKER_DIR': activity_tracker_dir
                })

                # Create custom ActivityTracker class
                from activity_tracker.activity_tracker import ActivityTracker
                from activity_tracker.config import IDLE_THRESHOLD

                class CustomActivityTracker(ActivityTracker):
                    def __init__(self, session_id, user_email):
                        self.session_id = session_id
                        self._user_email = user_email
                        super().__init__()

                    def get_user_email(self):
                        return self._user_email

                    def is_user_idle(self):
                        try:
                            last_input = win32api.GetLastInputInfo()
                            current_tick = win32api.GetTickCount()
                            idle_time = (current_tick - last_input) / 1000

                            if idle_time > IDLE_THRESHOLD:
                                if not self.is_currently_idle:
                                    self.idle_session_start = time.time() - idle_time
                                    self.is_currently_idle = True
                                    self.last_idle_report = None
                                    logger.info("=" * 50)
                                    logger.info(
                                        f"User became idle at: {datetime.fromtimestamp(self.idle_session_start)}")
                                    logger.info("Status: Idle")
                                    logger.info(f"Idle time: {idle_time:.2f} seconds")

                                return True, time.time() - self.idle_session_start
                            else:
                                if self.is_currently_idle:
                                    total_idle_time = time.time() - self.idle_session_start
                                    self.is_currently_idle = False
                                    current_time = datetime.now()

                                    total_minutes = int(total_idle_time // 60)
                                    total_seconds = int(total_idle_time % 60)
                                    logger.info("=" * 50)
                                    logger.info(f"User became active at: {current_time}")
                                    logger.info(f"Total idle time: {total_minutes} minutes {total_seconds} seconds")

                                    current_activity = {
                                        'timestamp': current_time.isoformat(),
                                        'email': self.user_info['email'],
                                        'is_idle': False,
                                        'idle_duration': total_idle_time,
                                        'idle_start_time': datetime.fromtimestamp(self.idle_session_start).isoformat(),
                                        'hostname': self.hostname
                                    }

                                    logger.info(f"Sending activity data: {current_activity}")

                                    try:
                                        self.api_client.send_activity_data(current_activity)
                                        logger.info("Activity data sent successfully")
                                    except Exception as e:
                                        logger.error(f"Error sending activity data: {e}")
                                        self.storage.store(current_activity)
                                        logger.info("Activity data stored locally")

                                    self.idle_session_start = None
                                    return False, total_idle_time

                                return False, 0

                        except Exception as e:
                            logger.error(f"Error checking idle status: {e}")
                            return False, 0

                logger.info("Initializing ActivityTracker")
                self.tracker = CustomActivityTracker(session_id, user_email)

                logger.info("Starting ActivityTracker")
                self.tracker.start()

                logger.info("Service started successfully")

                # Wait for service stop signal
                while True:
                    if win32event.WaitForSingleObject(self.stop_event, 1000) == win32event.WAIT_OBJECT_0:
                        break

            except Exception as e:
                logger.error(f"Failed to start tracker: {e}")
                raise

        except Exception as e:
            logger.error(f"Service error: {e}")
            raise
        finally:
            if self.tracker:
                self.tracker.stop()

    def wait_for_user_session(self):
        while True:
            try:
                sessions = win32ts.WTSEnumerateSessions(None)
                for session in sessions:
                    if session['State'] == win32ts.WTSActive:
                        user = win32ts.WTSQuerySessionInformation(
                            None, session['SessionId'], win32ts.WTSUserName
                        )
                        if user and user != 'SYSTEM':
                            return session['SessionId']
            except Exception as e:
                logger.error(f"Error checking user sessions: {e}")

            if win32event.WaitForSingleObject(self.stop_event, 1000) == win32event.WAIT_OBJECT_0:
                return None


if __name__ == '__main__':
    if len(sys.argv) == 1:
        try:
            logger.info("Preparing to start service")
            servicemanager.Initialize()
            servicemanager.PrepareToHostSingle(ActivityTrackerService)
            servicemanager.StartServiceCtrlDispatcher()
        except Exception as e:
            logger.error(f"Service failed to start: {e}")
            raise
    else:
        win32serviceutil.HandleCommandLine(ActivityTrackerService)