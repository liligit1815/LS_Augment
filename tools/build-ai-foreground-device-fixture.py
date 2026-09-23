"""Build a disposable non-game twin with identical real recognition pixels."""
import hashlib
import json
import subprocess
import zipfile
from pathlib import Path

root = Path(__file__).resolve().parents[1]
source = root / 'tools/game-fixture'
out = root / 'out/full-device-regression-20260908/ai-foreground-fixture'
out.mkdir(exist_ok=True)
package = 'ls.augment.regression.nongame'
java_source = (source / 'GameActivity.java').read_text(encoding='utf-8').replace(
    'package ls.augment.regression.game;', 'package ' + package + ';')
(out / 'GameActivity.java').write_text(java_source, encoding='utf-8')
manifest = (source / 'AndroidManifest.xml').read_text(encoding='utf-8').replace(
    'ls.augment.regression.game', package).replace(' android:appCategory="game"', '').replace(
    'android:label="LS 游戏验收"', 'android:label="LS 前后台验收"')
(out / 'AndroidManifest.xml').write_text(manifest, encoding='utf-8')
classes = out / 'classes'; classes.mkdir(exist_ok=True)
sdk = Path.home() / 'AppData/Local/Android/Sdk'
build = sdk / 'build-tools/36.0.0'
android = sdk / 'platforms/android-36/android.jar'
java = Path('C:/Program Files/Java/jdk-17/bin')


def run(*args):
    result = subprocess.run(list(map(str, args)), capture_output=True, text=True, encoding='utf-8', errors='replace')
    assert result.returncode == 0, result.stdout + result.stderr


run(java / 'javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', android,
    '-d', classes, out / 'GameActivity.java')
run(build / 'd8.bat', '--lib', android, '--min-api', '28', '--output', out, *classes.rglob('*.class'))
unsigned = out / 'unsigned.apk'; aligned = out / 'aligned.apk'; apk = out / 'LS-ai-foreground-validation.apk'
run(build / 'aapt2.exe', 'link', '-o', unsigned, '-I', android, '--manifest', out / 'AndroidManifest.xml')
with zipfile.ZipFile(unsigned, 'a') as archive:
    archive.write(out / 'classes.dex', 'classes.dex')
run(build / 'zipalign.exe', '-f', '4', unsigned, aligned)
run(build / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore', '--ks-pass', 'pass:android',
    '--key-pass', 'pass:android', '--out', apk, aligned)
run(build / 'apksigner.bat', 'verify', '--verbose', apk)
inventory = {'package': package, 'component': package + '/.GameActivity', 'apk': str(apk),
             'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'bytes': apk.stat().st_size,
             'installed': False, 'ownedDisposable': True, 'gameCategory': False, 'addedToGameSpace': False}
(out / 'inventory.json').write_text(json.dumps(inventory, indent=2), encoding='utf-8')
print(json.dumps(inventory), flush=True)
