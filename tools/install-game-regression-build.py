"""Verify and install a game fix, then use the actual game-scope restart button."""
import hashlib
import json
import re
import shutil
import subprocess
import sys
import time
from pathlib import Path

from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs
from module_ui_helpers import hierarchy, tap, tap_node, visible

out = OUTPUT / sys.argv[1]
out.mkdir(exist_ok=True)
assert not (out / 'installed.json').exists()
version = dict(line.split('=', 1) for line in Path('android/version.properties').read_text().splitlines() if '=' in line)
base = Path('android/app/build/outputs/apk')
main = out / ('LS_Augment-test' + version['versionCode'] + '.apk')
test = out / ('LS_Augment-test' + version['versionCode'] + '-androidTest.apk')
shutil.copy2(base / 'debug/app-debug.apk', main)
shutil.copy2(base / 'androidTest/debug/app-debug-androidTest.apk', test)
aapt = 'C:/Users/lilil/AppData/Local/Android/Sdk/build-tools/36.0.0/aapt2.exe'
badging = subprocess.run([aapt, 'dump', 'badging', str(main)], capture_output=True, text=True, encoding='utf-8')
assert badging.returncode == 0
assert "versionCode='" + version['versionCode'] + "'" in badging.stdout
assert "versionName='" + version['versionName'] + "'" in badging.stdout
(out / 'artifact-package.txt').write_text(badging.stdout, encoding='utf-8')
for name in ['check-modern-xposed.py', 'check-binary-manifest.py', 'check_apk_alignment.py']:
    run = subprocess.run([sys.executable, 'tools/' + name, str(main)], capture_output=True, text=True, encoding='utf-8')
    (out / (name + '-apk.txt')).write_text(run.stdout + run.stderr, encoding='utf-8')
    assert run.returncode == 0, run.stdout + run.stderr
signer = 'C:/Users/lilil/AppData/Local/Android/Sdk/build-tools/36.0.0/apksigner.bat'
certs = []
for file in [OUTPUT / 'round43o-fix/LS_Augment-test20249.apk', main, test]:
    run = subprocess.run([signer, 'verify', '--verbose', '--print-certs', str(file)], capture_output=True, text=True, encoding='utf-8')
    assert run.returncode == 0, run.stdout + run.stderr
    certs.append(re.search(r'Signer #1 certificate SHA-256 digest: (\S+)', run.stdout).group(1))
    (out / (file.stem + '-signature.txt')).write_text(run.stdout + run.stderr, encoding='utf-8')
assert len(set(certs)) == 1
for file in [main, test]:
    result = adb('install', '-r', '-t', str(file), timeout=90).decode()
    assert 'Success' in result, result
    print(file.name, result.strip(), flush=True)
packageState = shell('dumpsys package ls.augment.com')
assert 'versionCode=' + version['versionCode'] + ' ' in packageState
assert 'versionName=' + version['versionName'] in packageState
installed = {'pass': True, **version, 'certificateSha256': certs[0], 'artifacts': [
    {'name': file.name, 'bytes': file.stat().st_size, 'sha256': hashlib.sha256(file.read_bytes()).hexdigest()} for file in [main, test]]}
(out / 'installed.json').write_text(json.dumps(installed, indent=2), encoding='utf-8')
# The ADB NEW_TASK default can reuse the previous feature page regardless of its extras.
# Clear only this module's activity task so the requested page is actually created.
shell('am start -W -f 0x10008000 -n ls.augment.com/.FeatureActivity --es module ai_trigger', root=True)
root = hierarchy(sys.argv[1] + '-ai-page')
switches = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.Switch']
assert len(switches) == 1 and switches[0].get('content-desc') == 'AI 触发器极速响应'
if switches[0].get('checked') != 'true':
    tap_node(sys.argv[1] + '-ai-on', switches[0])
time.sleep(1.2)
assert prefs('ls_augment_config_v2')['ls_augment_ai_trigger_enabled'] == '1'
tap(sys.argv[1] + '-restart', '重启作用域')
root = hierarchy(sys.argv[1] + '-restart-dialog')
checked = [n.attrib for n in root.iter('node') if visible(n) and n.get('checked') == 'true']
assert len(checked) == 1 and checked[0].get('text') == '游戏增强（游戏空间与风扇）', checked
(out / 'scope-selection.json').write_text(json.dumps(checked, ensure_ascii=False, indent=2), encoding='utf-8')
tap(sys.argv[1] + '-restart-confirm', '立即重启')
time.sleep(3)
print(installed, flush=True)
