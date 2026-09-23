"""Build a self-targeted native-window observer without a launcher entry."""
import os
from pathlib import Path
import subprocess
import zipfile

root = Path(__file__).resolve().parents[1]
sdk = Path.home() / 'AppData/Local/Android/Sdk'
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Java/jdk-17')) / 'bin'
build = sdk / 'build-tools/36.0.0'
android = sdk / 'platforms/android-36/android.jar'
source = root / 'tools/ui-observer'
out = root / 'out/full-device-regression-20260908/ui-observer'
classes = out / 'classes';classes.mkdir(parents=True, exist_ok=True)


def run(args):
    subprocess.run([str(arg) for arg in args], check=True)


run([java / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', android,
     '-d', classes, *source.glob('*.java')])
run([build / 'd8.bat', '--lib', android, '--min-api', '28', '--output', out, *classes.rglob('*.class')])
unsigned = out / 'unsigned.apk'
run([build / 'aapt2.exe', 'link', '-o', unsigned, '-I', android, '--manifest', source / 'AndroidManifest.xml'])
with zipfile.ZipFile(unsigned, 'a') as apk:
    apk.write(out / 'classes.dex', 'classes.dex')
aligned = out / 'aligned.apk'
run([build / 'zipalign.exe', '-f', '4', unsigned, aligned])
run([build / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
     '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', out / 'ui-observer.apk', aligned])
run([build / 'apksigner.bat', 'verify', '--verbose', out / 'ui-observer.apk'])
print(out / 'ui-observer.apk')
