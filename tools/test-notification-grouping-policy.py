"""Offline grouping and signed-config regression; no phone access or copied policy implementation."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path(r'C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
SOURCE = ROOT / 'android/app/src/main/java'

with tempfile.TemporaryDirectory(prefix='duo-grouped-policy-') as folder:
    tests = ['TestNotificationStackPolicy', 'TestNotificationLayoutPolicy', 'TestConfigSnapshot']
    subprocess.run([str(JAVA / 'javac.exe'), '-encoding', 'UTF-8', '--release', '17',
                    '-sourcepath', str(SOURCE), '-d', folder,
                    *[str(ROOT / 'tools' / (name + '.java')) for name in tests]], check=True)
    for name in tests:
        subprocess.run([str(JAVA / 'java.exe'), '-cp', folder, 'ls.augment.com.' + name],
                       check=True, timeout=20)
