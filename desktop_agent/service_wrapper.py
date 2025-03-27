import os
import sys
import win32serviceutil
import win32service
import win32event
import servicemanager
import socket
import threading
from datetime import datetime
import win32ts
import win32security
import win32con
import win32process
import win32api
import logging
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

    def SvcDoRun(self):
        try:
            logger.info("Service starting")

            # Add the current directory to Python path
            if getattr(sys, 'frozen', False):
                # Running as compiled exe
                current_dir = os.path.dirname(sys.executable)
            else:
                # Running as script
                current_dir = os.path.dirname(os.path.abspath(__file__))

            if current_dir not in sys.path:
                sys.path.insert(0, current_dir)
                logger.info(f"Added to Python path: {current_dir}")

            # Wait for user session
            session_id = self.wait_for_user_session()
            if not session_id:
                logger.error("No valid user session found")
                return

            # Import and initialize ActivityTracker
            from activity_tracker.activity_tracker import ActivityTracker

            logger.info("Initializing ActivityTracker")
            self.tracker = ActivityTracker()

            logger.info("Starting ActivityTracker")
            self.tracker.start()

            logger.info("Service started successfully")

            # Wait for service stop signal
            win32event.WaitForSingleObject(self.stop_event, win32event.INFINITE)

        except Exception as e:
            logger.error(f"Service error: {e}")
            raise

    def wait_for_user_session(self):
        """Wait for an active user session"""
        while True:
            try:
                sessions = win32ts.WTSEnumerateSessions(None)
                for session in sessions:
                    if session['State'] == win32ts.WTSActive:
                        user = win32ts.WTSQuerySessionInformation(
                            None, session['SessionId'], win32ts.WTSUserName
                        )
                        domain = win32ts.WTSQuerySessionInformation(
                            None, session['SessionId'], win32ts.WTSDomainName
                        )
                        if user and user != 'SYSTEM':
                            logger.info(f"Found active user session: {domain}\\{user}")
                            return session['SessionId']
            except Exception as e:
                logger.error(f"Error checking user sessions: {e}")
            win32event.WaitForSingleObject(self.stop_event, 1000)  # Wait 1 second
            if win32event.WaitForSingleObject(self.stop_event, 0) == win32event.WAIT_OBJECT_0:
                return None


def prepare_environment():
    """Prepare the service environment"""
    try:
        # Create necessary directories
        program_data = os.environ.get('PROGRAMDATA', '')
        if program_data:
            app_data_dir = os.path.join(program_data, 'EmployeeActivityTracker')
            os.makedirs(app_data_dir, exist_ok=True)
            os.makedirs(os.path.join(app_data_dir, 'logs'), exist_ok=True)

        # Add DLL directories
        if getattr(sys, 'frozen', False):
            base_dir = os.path.dirname(sys.executable)
        else:
            base_dir = os.path.dirname(os.path.abspath(__file__))

        dll_dirs = [
            base_dir,
            os.path.join(base_dir, 'activity_tracker'),
            os.path.join(sys.prefix, 'DLLs'),
            os.path.join(sys.prefix, 'Lib', 'site-packages', 'pywin32_system32'),
        ]

        for dll_dir in dll_dirs:
            if os.path.exists(dll_dir):
                try:
                    os.add_dll_directory(dll_dir)
                    logger.info(f"Added DLL directory: {dll_dir}")
                except Exception as e:
                    logger.warning(f"Failed to add DLL directory {dll_dir}: {e}")

        return True
    except Exception as e:
        logger.error(f"Failed to prepare environment: {e}")
        return False


if __name__ == '__main__':
    try:
        if len(sys.argv) == 1:
            logger.info("Preparing to start service")
            if prepare_environment():
                servicemanager.Initialize()
                servicemanager.PrepareToHostSingle(ActivityTrackerService)
                servicemanager.StartServiceCtrlDispatcher()
            else:
                logger.error("Failed to prepare environment")
        else:
            win32serviceutil.HandleCommandLine(ActivityTrackerService)
    except Exception as e:
        logger.error(f"Service failed to start: {e}")
        raise