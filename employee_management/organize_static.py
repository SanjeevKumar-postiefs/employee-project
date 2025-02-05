import os
import shutil
from pathlib import Path


def organize_static_files():
    BASE_DIR = Path(__file__).resolve().parent

    # Create new directories
    new_dirs = [
        'employee/static/employee/js',
        'employee/static/employee/sounds',
        'staticfiles'
    ]

    for dir_path in new_dirs:
        os.makedirs(os.path.join(BASE_DIR, dir_path), exist_ok=True)

    # Move notification files
    files_to_move = {
        'notifications.js': ('assets/staticfiles/js/notifications.js',
                             'employee/static/employee/js/'),
        'notification.mp3': ('assets/sounds/notification.mp3',
                             'employee/static/employee/sounds/')
    }

    for file_name, (src, dest) in files_to_move.items():
        src_path = os.path.join(BASE_DIR, src)
        dest_path = os.path.join(BASE_DIR, dest, file_name)
        if os.path.exists(src_path):
            shutil.copy2(src_path, dest_path)
            print(f"Moved {file_name} to {dest}")

    # Clean up old directories
    dirs_to_remove = [
        'assets/staticfiles',
        'assets/sounds'
    ]

    for dir_path in dirs_to_remove:
        full_path = os.path.join(BASE_DIR, dir_path)
        if os.path.exists(full_path):
            shutil.rmtree(full_path)
            print(f"Removed {dir_path}")


if __name__ == "__main__":
    organize_static_files()