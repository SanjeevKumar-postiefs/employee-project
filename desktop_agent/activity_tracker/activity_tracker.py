import time
import win32api
import threading
import subprocess
import os
import socket
import logging
from datetime import datetime,timezone
from .config import *
from .api_client import APIClient
from .storage import ActivityStorage

logging.getLogger('activity_tracker.api_client').setLevel(logging.WARNING)


class ActivityTracker:
    def __init__(self):
        self.running = True
        self.user_info = self.get_windows_user_info()
        self.api_client = APIClient()
        self.storage = ActivityStorage()

        # Idle tracking
        self.idle_session_start = None
        self.is_currently_idle = False
        self.last_idle_report = None

        self.hostname = self.get_hostname()

        # Initialize sync thread
        self.sync_thread = threading.Thread(target=self.sync_data_periodically, daemon=True)

        # Print initialization info
        print(f"\nCurrent Date and Time : {self.user_info['timestamp_utc']}")
        print(f"User Login: {self.user_info['login']}")
        print(f"Email: {self.user_info['email']}")
        print(f"Hostname: {self.hostname}")

    def get_hostname(self):
        """Get the device hostname"""
        try:
            return socket.gethostname()
        except Exception as e:
            print(f"Error getting hostname: {e}")
            return "Unknown"

    def get_windows_user_info(self):
        try:
            return {
                'timestamp_utc': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                'login': os.getlogin(),
                'email': self.get_user_email()
            }
        except Exception as e:
            print(f"Error getting user info: {e}")
            return {
                'timestamp_utc': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                'login': 'Unknown',
                'email': None
            }

    def get_user_email(self):
        try:
            result = subprocess.run(['whoami', '/upn'], capture_output=True, text=True)
            email = result.stdout.strip()
            if email and '@' in email:
                return email
        except Exception as e:
            print(f"Error getting email: {e}")
        return None

    def is_user_idle(self):
        try:
            last_input = win32api.GetLastInputInfo()
            idle_time = (win32api.GetTickCount() - last_input) / 1000

            if idle_time > IDLE_THRESHOLD:
                if not self.is_currently_idle:
                    self.idle_session_start = time.time() - idle_time
                    self.is_currently_idle = True
                    self.last_idle_report = None
                    print("=" * 44)
                    print(f"User became idle at: {datetime.fromtimestamp(self.idle_session_start)}")
                    print("Status: Idle")

                return True, time.time() - self.idle_session_start
            else:
                if self.is_currently_idle:
                    total_idle_time = time.time() - self.idle_session_start
                    self.is_currently_idle = False
                    current_time = datetime.now()
                    # Convert to minutes and seconds
                    total_minutes = int(total_idle_time // 60)
                    total_seconds = int(total_idle_time % 60)
                    print(f"User became active at: {current_time.strftime('%Y-%m-%d %H:%M:%S')}")
                    print(f"Total idle time: {total_minutes} minutes {total_seconds} seconds")
                    print("=" * 44)

                    # Send the activity data with the correct total idle time when user becomes active
                    current_activity = {
                        'timestamp': current_time.isoformat(),
                        'email': self.user_info['email'],
                        'is_idle': False,
                        'idle_duration': total_idle_time,  # This is the correct idle duration for the session
                        'idle_start_time': datetime.fromtimestamp(self.idle_session_start).isoformat(),
                        'hostname': self.hostname
                    }

                    try:
                        self.api_client.send_activity_data(current_activity)
                    except Exception:
                        self.storage.store(current_activity)

                    self.idle_session_start = None
                    return False, total_idle_time
                return False, 0

        except Exception as e:
            if DEBUG:
                print(f"Error checking idle status: {e}")
            return False, 0

    def sync_data_periodically(self):
        while self.running:
            try:
                pending_activities = self.storage.get_pending_activities()
                synced_timestamps = []

                for timestamp, activity in pending_activities:
                    try:
                        response = self.api_client.send_activity_data(activity)
                        if response and response.get('status') == 'success':
                            synced_timestamps.append(timestamp)
                    except Exception:
                        pass

                if synced_timestamps:
                    self.storage.clear_activities(synced_timestamps)

            except Exception:
                pass

            time.sleep(SYNC_INTERVAL)

    def track_activity(self):
        while self.running:
            try:
                is_idle, idle_duration = self.is_user_idle()
                current_time = datetime.now(timezone.utc)

                if is_idle and self.should_report_idle_update(idle_duration):
                    self.last_idle_report = time.time()
                    current_activity = {
                        'timestamp': current_time.isoformat(),
                        'email': self.user_info['email'],
                        'is_idle': True,
                        'idle_duration': idle_duration,
                        'hostname': self.hostname
                    }

                    try:
                        self.api_client.send_activity_data(current_activity)
                    except Exception:
                        self.storage.store(current_activity)

            except Exception:
                pass

            time.sleep(UPDATE_INTERVAL)

    def should_report_idle_update(self, idle_duration):
        if not self.last_idle_report:
            return True

        time_since_last_report = time.time() - self.last_idle_report
        for milestone in [300, 900, 1800, 3600]:
            if (idle_duration >= milestone and
                    (self.last_idle_report is None or time_since_last_report >= milestone)):
                return True
        return False

    def start(self):
        print("Starting activity tracker...")
        self.sync_thread.start()
        tracking_thread = threading.Thread(target=self.track_activity)
        tracking_thread.daemon = True
        tracking_thread.start()

    def stop(self):
        print("Stopping activity tracker...")
        self.running = False
        self.storage.close()