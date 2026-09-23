"""Build a local disposable APK; installing/running it is a separate explicit step."""
import os
from pathlib import Path
import subprocess
import zipfile

root = Path(__file__).resolve().parents[1]
sdk = Path(os.environ.get('ANDROID_SDK_ROOT', Path.home() / 'AppData/Local/Android/Sdk'))
build = sdk / 'build-tools/36.0.0'
android = sdk / 'platforms/android-36/android.jar'
source = root / 'tools/device-fixture'
out = root / 'out/root-lsposed-rework/fixture'
out.mkdir(parents=True, exist_ok=True)
classes = out / 'classes'
classes.mkdir(exist_ok=True)

def run(args):
    subprocess.run([str(arg) for arg in args], check=True)

run(['javac', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', android,
     '-d', classes, *sorted(source.glob('*.java'))])
run([build / 'd8.bat', '--lib', android, '--min-api', '28', '--output', out,
     *classes.rglob('*.class')])
unsigned = out / 'fixture-unsigned.apk'
run([build / 'aapt2.exe', 'link', '-o', unsigned, '-I', android,
     '--manifest', source / 'AndroidManifest.xml'])
with zipfile.ZipFile(unsigned, 'a') as apk:
    apk.write(out / 'classes.dex', 'classes.dex')
aligned = out / 'fixture-aligned.apk'
run([build / 'zipalign.exe', '-f', '4', unsigned, aligned])
run([build / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
     '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', out / 'fixture.apk', aligned])
run([build / 'apksigner.bat', 'verify', '--verbose', out / 'fixture.apk'])
print(out / 'fixture.apk')
