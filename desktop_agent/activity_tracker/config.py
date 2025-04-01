# Desktop agent configuration
API_URL = 'http://127.0.0.1:8000/'  # Change this to your Django server URL when deployed
API_ENDPOINTS = {
    'activity': '/api/tracking/record-activity/',
}

# Activity tracking settings
IDLE_THRESHOLD = 300  # 5 minutes in seconds
UPDATE_INTERVAL = 60  # Check status every minute
SYNC_INTERVAL = 900   # Sync with server every 15 minutes

# When to send data (in seconds)
SEND_TRIGGERS = {
    'STATUS_CHANGE': True,      # Send when status changes (active/idle)
    'IDLE_MILESTONES': [300,    # 5 minutes
                        900,    # 15 minutes
                        1800,   # 30 minutes
                        3600],  # 1 hour
    'MINIMUM_SYNC_INTERVAL': 900  # Don't send more often than every 15 minutes if no changes
}

# Debug settings
DEBUG = False  # Set to False in production