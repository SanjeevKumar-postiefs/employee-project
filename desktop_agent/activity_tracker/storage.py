from sqlitedict import SqliteDict
from datetime import datetime
import json
import os
import threading
from pathlib import Path


class ActivityStorage:
    def __init__(self, base_path=None):
        if base_path is None:
            base_path = Path.home() / '.activity_tracker'

        self.base_path = Path(base_path)
        self.base_path.mkdir(exist_ok=True)

        self.db_path = self.base_path / 'activity_cache.sqlite'
        self.lock = threading.Lock()

        # Initialize SQLite storage
        self.storage = SqliteDict(
            str(self.db_path),
            tablename='activity_cache',
            autocommit=True
        )

    def store(self, data):
        """Store activity data with timestamp as key"""
        with self.lock:
            timestamp = datetime.now().isoformat()
            self.storage[timestamp] = data

    def get_pending_activities(self):
        """Get all stored activities and clear storage"""
        with self.lock:
            activities = list(self.storage.items())
            return activities

    def clear_activities(self, timestamps):
        """Clear specific activities by their timestamps"""
        with self.lock:
            for timestamp in timestamps:
                self.storage.pop(timestamp, None)

    def close(self):
        """Close the storage properly"""
        self.storage.close()