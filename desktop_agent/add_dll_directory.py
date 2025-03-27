import os
import sys
import site


def add_dll_directories():
    # Get the virtual environment paths
    venv_path = os.path.dirname(os.path.dirname(sys.executable))
    venv_scripts = os.path.join(venv_path, 'Scripts')
    venv_libs = os.path.join(venv_path, 'Lib', 'site-packages')

    paths_to_add = [
        os.path.dirname(sys.executable),  # Python executable directory
        os.path.join(os.path.dirname(sys.executable), 'DLLs'),  # DLLs directory
        venv_scripts,  # Virtual environment Scripts directory
        venv_libs,  # Virtual environment site-packages
    ]

    # Add system Python paths
    system_python = r"C:\Users\SanjeevKumar\AppData\Local\Programs\Python\Python312"
    if os.path.exists(system_python):
        paths_to_add.extend([
            system_python,
            os.path.join(system_python, 'DLLs'),
            os.path.join(system_python, 'Lib', 'site-packages')
        ])

    # Add pywin32 paths
    for site_dir in site.getsitepackages():
        pywin32_system32 = os.path.join(site_dir, 'pywin32_system32')
        if os.path.exists(pywin32_system32):
            paths_to_add.append(pywin32_system32)

    # Add the directories to DLL search path
    for path in paths_to_add:
        if os.path.exists(path):
            try:
                os.add_dll_directory(path)
                print(f"Added DLL directory: {path}")
            except Exception as e:
                print(f"Failed to add DLL directory {path}: {e}")


add_dll_directories()