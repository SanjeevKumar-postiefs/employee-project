# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['service_wrapper.py'],
    pathex=[],
    binaries=[],
    datas=[('activity_tracker', 'activity_tracker')],
    hiddenimports=['win32timezone', 'win32serviceutil', 'win32service', 'win32event', 'servicemanager', 'socket', 'threading', 'win32api', 'win32con', 'win32security', 'activity_tracker.activity_tracker', 'activity_tracker.api_client', 'activity_tracker.config', 'activity_tracker.storage', 'win32ts', 'win32profile'],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=['add_dll_directory.py'],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
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
