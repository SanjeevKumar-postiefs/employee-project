from django.core.management.base import BaseCommand
import os
import base64
from django.conf import settings

class Command(BaseCommand):
    help = 'Creates the notification sound file'

    def handle(self, *args, **kwargs):
        # Create the sounds directory if it doesn't exist
        static_dir = os.path.join(settings.BASE_DIR, 'employee', 'static')
        sounds_dir = os.path.join(static_dir, 'sounds')
        os.makedirs(sounds_dir, exist_ok=True)

        # Base64 string for a modified, less jarring notification sound
        sound_data = """
UklGRuQFAABXQVZFZm10IBAAAAABAAEAgD4AAAB9AAACABAAZGF0YcAFAAB/f39/f39/f39/f39/
f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/
f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/
f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/
AAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAQAA
AAEAAAAAAAAAAAAAAAAAAAABAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAgAAAAIAAAAAAAAAAAAA
AAAAAAADAAAAAwAAAAMAAAABAAAAAQAAAAEAAAAEAAAABAAAAAQAAAACAAAAAwAAAAIAAAAFAAAABQAA
AAUAAAADAAAABAAAAAMAAAAGAAAABgAAAAYAAAAEAAAABQAAAAQAAAAHAAAABwAAAAcAAAAFAAAABgAA
AAUAAAAIAAAACAAAAAcAAAAGAAAABwAAAAYAAAAIAAAACAAAAAcAAAAGAAAABwAAAAYAAAAHAAAABwAA
AAYAAAAFAAAABgAAAAUAAAAGAAAABQAAAAUAAAAEAAAABAAAAAQAAAAEAAAABAAAAAMAAAADAAAAAwAA
AAIAAAADAAAAAgAAAAIAAAABAAAAAgAAAAEAAAABAAAAAQAAAAEAAAAAAAAAAAAAAAAAAAAAAAB/f39/
f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/
f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/
f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/
f39/f39/f39/f39/f39/f39/f39/f39/f39/f39/
        """.strip()

        # Write the sound file
        sound_path = os.path.join(sounds_dir, 'notification.wav')
        try:
            with open(sound_path, 'wb') as f:
                f.write(base64.b64decode(sound_data))
            self.stdout.write(self.style.SUCCESS(f'Successfully created notification sound at {sound_path}'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Error creating sound file: {str(e)}'))