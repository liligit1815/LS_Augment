"""Verify native expanded candidates and real per-user clone data after graceful reboot."""
import json
import sys
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell, tap
from doubleapp_device_helpers import open_module, open_oem, candidates
from launcher_icon_device_helpers import saved
from module_ui_helpers import hierarchy, matches
from statusbar_device_helpers import require_systemui_build

stage = sys.argv[1]
out = OUTPUT / (stage + '-boot-results'); out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists(), 'Existing boot journal; inspect without reissuing reboot'
package = 'ls.augment.regression.clone'


def data():
    result = {}
    for user in [0, 999]:
        raw = shell(f'cat /data/user/{user}/{package}/shared_prefs/clone-probe.xml', root=True)
        result[str(user)] = {n.get('name'): n.text or n.get('value') for n in ET.fromstring(raw)}
    return result


open_module(stage + '-enable')
assert saved('doubleapp_any_app') == '0' and saved('doubleapp_low_memory') == '1'
tap(stage + '-enable-any', '扩展第三方 App 双开候选')
for i in range(25):
    if saved('doubleapp_any_app') == '1':
        break
    time.sleep(.4)
assert saved('doubleapp_any_app') == '1'
before = {'bootId': shell('cat /proc/sys/kernel/random/boot_id'), 'data': data(),
          'settings': {k: saved(k) for k in ['app_master', 'doubleapp_any_app', 'doubleapp_low_memory']},
          'at': shell('date -Iseconds'), 'rebootCommand': 'svc power reboot'}
(out / 'before.json').write_text(json.dumps(before, indent=2), encoding='utf-8')
(out / 'reboot-command.txt').write_bytes(adb('shell', 'svc power reboot', check=False, timeout=12))
print('Graceful device reboot dispatched; clone data checkpoint retained.', flush=True)
start = time.monotonic()
observations = []
ready = False
while time.monotonic() - start < 160:
    try:
        boot = shell('cat /proc/sys/kernel/random/boot_id', timeout=4)
        done = shell('getprop sys.boot_completed', timeout=4)
        observations.append({'elapsed': round(time.monotonic() - start, 2), 'bootId': boot, 'completed': done})
        if boot != before['bootId'] and done == '1':
            ready = True
            break
    except Exception as error:
        observations.append({'elapsed': round(time.monotonic() - start, 2), 'pending': type(error).__name__})
    time.sleep(2)
(out / 'observations.json').write_text(json.dumps(observations, indent=2), encoding='utf-8')
assert ready, 'New boot not completed; preserve journal'
shell('input keyevent 224')
shell('input keyevent 82')
shell('wm dismiss-keyguard')
require_systemui_build(stage + '-systemui')
root = hierarchy(stage + '-unlocked')
if matches(root, 'USB 的用途') and matches(root, '取消'):
    tap(stage + '-dismiss-usb-choice', '取消')
open_oem(stage + '-oem', restart=True)
listing = candidates(stage + '-oem')
expected = json.loads((OUTPUT / 'round36b-oem-on-results/candidates.json').read_text(encoding='utf-8'))['allNames']
after = {'bootId': boot, 'data': data(), 'settings': {k: saved(k) for k in before['settings']},
         'usbFunctions': shell('getprop sys.usb.config'),
         'chargeOnlyAllowed': shell('settings get system allow_debug_in_charge_only_mode'),
         'nativeCandidates': listing['allNames']}
result = {'case': 'Expanded-native-candidates-and-clone-data-after-boot',
          'pass': after['data'] == before['data'] and after['settings'] == before['settings']
                  and after['nativeCandidates'] == expected and after['usbFunctions'] == 'adb',
          'before': before, 'after': after}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(result, ensure_ascii=False), flush=True)
assert result['pass'], result
