from setuptools import setup, find_packages

setup(
    name='employee-activity-tracker',
    version='1.0.0',
    packages=find_packages(),
    install_requires=[
        'psutil',
        'pywin32',
        'requests'
    ],
    entry_points={
        'console_scripts': [
            'activity-tracker=activity_tracker.__main__:main',
        ],
    }
)