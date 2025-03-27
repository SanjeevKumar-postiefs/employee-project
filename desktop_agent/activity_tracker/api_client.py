import requests
import logging
from .config import API_URL, API_ENDPOINTS

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class APIClient:
    def __init__(self):
        self.base_url = API_URL
        logger.info(f"APIClient initialized with base URL: {self.base_url}")

    def send_activity_data(self, activity_data):
        """Send activity data to the server"""
        try:
            endpoint = f"{self.base_url}{API_ENDPOINTS['activity']}"
            logger.info(f"Sending activity data for email: {activity_data.get('user_info', {}).get('email')}")

            response = requests.post(endpoint, json=activity_data)
            response_data = response.json()

            logger.info(f"Server response: {response_data}")
            return response_data

        except Exception as e:
            logger.error(f"Error sending activity data: {e}")
            return None