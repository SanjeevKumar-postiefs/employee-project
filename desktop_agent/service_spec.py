# -*- mode: python ; coding: utf-8 -*-
import os
import sys

from PyInstaller.building.api import PYZ, EXE
from PyInstaller.building.build_main import Analysis
from PyInstaller.utils.hooks import collect_data_files

block_cipher = None

# Find Python DLL
python_dll = f'python{sys.version_info.major}{sys.version_info.minor}.dll'
python_dir = os.path.dirname(sys.executable)
python_dll_path = os.path.join(python_dir, python_dll)

if not os.path.exists(python_dll_path):
    # Try alternate locations
    possible_paths = [
        os.path.join(os.path.dirname(python_dir), python_dll),
        os.path.join(python_dir, 'DLLs', python_dll),
        os.path.join(sys.base_prefix, python_dll),
    ]
    for path in possible_paths:
        if os.path.exists(path):
            python_dll_path = path
            break

print(f"Python DLL path: {python_dll_path}")

a = Analysis(
    ['service_wrapper.py'],
    pathex=[os.path.dirname(os.path.abspath(__file__))],
    binaries=[(python_dll_path, '.')] if os.path.exists(python_dll_path) else [],
    datas=[
        ('activity_tracker', 'activity_tracker'),
    ],
    hiddenimports=[
        'win32timezone',
        'win32serviceutil',
        'win32service',
        'win32event',
        'servicemanager',
        'socket',
        'threading',
        'activity_tracker.activity_tracker',
        'activity_tracker.api_client',
        'activity_tracker.config',
        'activity_tracker.storage',
        'win32api',
        'win32con',
        'win32security',
        'win32process',
        'win32file',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='EmployeeActivityTracker',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)