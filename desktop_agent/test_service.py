import win32serviceutil
import win32service
import win32event
import servicemanager
import socket
import time
import win32ts
import win32api
import logging
from datetime import datetime
from activity_tracker.activity_tracker import ActivityTracker
from activity_tracker.config import *

# Set up logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger('TestActivityTracker')


class TestActivityTracker(ActivityTracker):
    def __init__(self):
        super().__init__()
        self.debug_mode = True

    def is_user_idle(self):
        try:
            last_input = win32api.GetLastInputInfo()
            current_tick = win32api.GetTickCount()
            idle_time = (current_tick - last_input) / 1000

            logger.debug(f"Current idle time: {idle_time:.2f} seconds")

            if idle_time > IDLE_THRESHOLD:
                if not self.is_currently_idle:
                    self.idle_session_start = time.time() - idle_time
                    self.is_currently_idle = True
                    self.last_idle_report = None
                    logger.info("=" * 50)
                    logger.info(f"User became idle at: {datetime.fromtimestamp(self.idle_session_start)}")
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


def main():
    logger.info("Starting test activity tracker...")

    # Print system info
    logger.info(f"Computer Name: {socket.gethostname()}")
    logger.info(f"Current Session: {win32ts.WTSGetActiveConsoleSessionId()}")

    tracker = TestActivityTracker()

    # Print initial info
    logger.info(f"Email: {tracker.user_info['email']}")
    logger.info(f"Login: {tracker.user_info['login']}")
    logger.info(f"Hostname: {tracker.hostname}")

    try:
        tracker.start()
        logger.info("Activity tracker started. Press Ctrl+C to stop.")

        while True:
            time.sleep(1)

    except KeyboardInterrupt:
        logger.info("Stopping activity tracker...")
        tracker.stop()
        logger.info("Activity tracker stopped.")


if __name__ == '__main__':
    main()