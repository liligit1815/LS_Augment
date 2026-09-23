"""Build the isolated game input fixture; no phone installation or UI mutation."""
import hashlib
import json
import subprocess
import zipfile
from pathlib import Path

root = Path(__file__).resolve().parents[1]
source = root / 'tools/game-fixture'
out = root / 'out/full-device-regression-20260908/game-fixture'
out.mkdir(exist_ok=True)
classes = out / 'classes'
classes.mkdir(exist_ok=True)
sdk = Path.home() / 'AppData/Local/Android/Sdk'
build = sdk / 'build-tools/36.0.0'
android = sdk / 'platforms/android-36/android.jar'
java = Path('C:/Program Files/Java/jdk-17/bin')


def run(*args):
    result = subprocess.run(list(map(str, args)), capture_output=True, text=True, encoding='utf-8', errors='replace')
    assert result.returncode == 0, result.stdout + result.stderr


run(java / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', android, '-d', classes, source / 'GameActivity.java')
run(build / 'd8.bat', '--lib', android, '--min-api', '28', '--output', out, *classes.rglob('*.class'))
unsigned = out / 'unsigned.apk'
aligned = out / 'aligned.apk'
apk = out / 'LS-game-validation.apk'
run(build / 'aapt2.exe', 'link', '-o', unsigned, '-I', android, '--manifest', source / 'AndroidManifest.xml')
with zipfile.ZipFile(unsigned, 'a') as archive:
    archive.write(out / 'classes.dex', 'classes.dex')
run(build / 'zipalign.exe', '-f', '4', unsigned, aligned)
run(build / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore', '--ks-pass', 'pass:android',
    '--key-pass', 'pass:android', '--out', apk, aligned)
run(build / 'apksigner.bat', 'verify', '--verbose', apk)
inventory = {'package': 'ls.augment.regression.game', 'component': 'ls.augment.regression.game/.GameActivity',
             'apk': str(apk), 'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'bytes': apk.stat().st_size,
             'installed': False, 'ownedDisposable': True}
(out / 'inventory.json').write_text(json.dumps(inventory, indent=2), encoding='utf-8')
print(json.dumps(inventory))
