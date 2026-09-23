"""Verify/install the locally built APKs and restart the real game/fan scope."""
import hashlib
import json
import re
import shutil
import subprocess
import sys
import time
import xml.etree.ElementTree as ET
from pathlib import Path

from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import open_module, sample
from module_ui_helpers import hierarchy, tap, visible

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'installed.json').exists()
version = dict(line.split('=', 1) for line in Path('android/version.properties').read_text().splitlines() if '=' in line)
code = version['versionCode']
base = Path('android/app/build/outputs/apk')
main = out / ('LS_Augment-test' + code + '.apk')
test = out / ('LS_Augment-test' + code + '-androidTest.apk')
shutil.copy2(base / 'debug/app-debug.apk', main)
shutil.copy2(base / 'androidTest/debug/app-debug-androidTest.apk', test)
for name in ['check-modern-xposed.py', 'check-binary-manifest.py', 'check_apk_alignment.py']:
    run = subprocess.run([sys.executable, 'tools/' + name, str(main)], capture_output=True, text=True, encoding='utf-8')
    (out / (name + '-apk.txt')).write_text(run.stdout + run.stderr, encoding='utf-8')
    assert run.returncode == 0, name + run.stdout + run.stderr
signer = 'C:/Users/lilil/AppData/Local/Android/Sdk/build-tools/36.0.0/apksigner.bat'
certs = []
for file in [OUTPUT / 'round42t-fix/LS_Augment-test20246.apk', main, test]:
    run = subprocess.run([signer, 'verify', '--verbose', '--print-certs', str(file)], capture_output=True, text=True, encoding='utf-8')
    assert run.returncode == 0, run.stdout + run.stderr
    certs.append(re.search(r'Signer #1 certificate SHA-256 digest: (\S+)', run.stdout).group(1))
    (out / (file.stem + '-signature.txt')).write_text(run.stdout + run.stderr, encoding='utf-8')
assert len(set(certs)) == 1
for file in [main, test]:
    result = adb('install', '-r', '-t', str(file), timeout=90).decode()
    assert 'Success' in result, result
    print(file.name, result.strip(), flush=True)
package = shell('dumpsys package ls.augment.com')
assert ('versionCode=' + code + ' ') in package and ('versionName=' + version['versionName']) in package
installed = {'pass': True, **version, 'certificateSha256': certs[0], 'artifacts': [
    {'name': file.name, 'bytes': file.stat().st_size, 'sha256': hashlib.sha256(file.read_bytes()).hexdigest()} for file in [main, test]]}
(out / 'installed.json').write_text(json.dumps(installed, indent=2), encoding='utf-8')
open_module(stage + '-scope')
tap(stage + '-restart', '重启作用域')
root = hierarchy(stage + '-scope-dialog')
checked = [n.attrib for n in root.iter('node') if visible(n) and n.get('checked') == 'true']
assert len(checked) == 1 and checked[0].get('text') == '游戏增强（游戏空间与风扇）', checked
(out / 'scope-selection.json').write_text(json.dumps(checked, ensure_ascii=False, indent=2), encoding='utf-8')
tap(stage + '-confirm', '立即重启')
shell('am start -W -n cn.nubia.fan/.components.GameFanSettingsActivity', root=True)
for _ in range(15):
    pid = shell('pidof cn.nubia.fan').strip()
    root = ET.fromstring(shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True))
    records = [json.loads(n.text) for n in root if n.text and n.text.startswith('{')]
    found = [r for r in records if str(r.get('pid')) == pid and r.get('moduleVersion') == version['versionName']]
    if found:
        break
    time.sleep(1)
assert found, pid
(out / 'current-fan-record.json').write_text(json.dumps(found, ensure_ascii=False, indent=2), encoding='utf-8')
(out / 'state-after.json').write_text(json.dumps(sample(), ensure_ascii=False, indent=2), encoding='utf-8')
print({'pass': True, 'pid': pid, **installed}, flush=True)
