"""Compatibility entry for the current page-local ordering regression. Native 20593 evidence is archived."""
from pathlib import Path
import runpy
if __name__ == "__main__":
    runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-app-order-touch.py")), run_name="__main__")
