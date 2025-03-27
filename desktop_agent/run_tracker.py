from activity_tracker import ActivityTracker
import time

def main():
    try:
        tracker = ActivityTracker()
        tracker.start()
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        tracker.stop()
        print("Activity tracker stopped.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()