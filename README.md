# Employee Activity Tracker Desktop Agent

This is the desktop agent component of the Employee Activity Tracking system. It tracks user activity and sends data to the main server.

## Installation

1. Download the latest release
2. Run `install.bat` as administrator
3. Enter your credentials when prompted

## Configuration

The agent can be configured by editing `config.py`:
- `API_URL`: The URL of your Django server
- `UPDATE_INTERVAL`: How often to send updates (in seconds)
- `IDLE_THRESHOLD`: Time before considering user idle (in seconds)

## Development

To set up the development environment:

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Install in development mode
pip install -e .
```