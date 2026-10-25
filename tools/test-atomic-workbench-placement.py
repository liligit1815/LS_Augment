"""Execute the actual workspace model and exact placement across every supported capacity."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JDK = Path(r'C:\Program Files\Android\openjdk\jdk-21.0.8\bin')
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
with tempfile.TemporaryDirectory(prefix='duo-placement-') as directory:
    sources = [SRC / (name + '.java') for name in ('AtomicWorkbenchPoolTopology', 'AtomicWorkbenchWorkspaceModel')]
    sources += [ROOT / 'tools/TestAtomicWorkbenchPlacement.java', ROOT / 'tools/TestAtomicWorkbenchWorkspaceModel.java']
    subprocess.run([str(JDK / 'javac.exe'), '--release', '17', '-encoding', 'UTF-8', '-d', directory, *map(str, sources)], check=True)
    for name in ('TestAtomicWorkbenchPlacement', 'TestAtomicWorkbenchWorkspaceModel'):
        subprocess.run([str(JDK / 'java.exe'), '-cp', directory, 'ls.augment.com.' + name], check=True)
