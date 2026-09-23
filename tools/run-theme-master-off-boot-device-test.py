"""Verify the overall app gate restores native trial resources across a real full boot."""
import json
import re
import sys
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell, snapshot, instrument
from module_ui_helpers import hierarchy, matches, tap
from theme_device_helpers import state
from statusbar_device_helpers import require_systemui_build

stage = sys.argv[1]
out = OUTPUT / (stage + '-master-off-boot-results')
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists(), 'Retain the prior boot journal'
before = state()
assert before['adapter']['trial_key'] == '257'
assert before['settings']['app_master'] == before['settings']['beautify_unlimited_trial'] == '1'
before['bootId'] = shell('cat /proc/sys/kernel/random/boot_id')
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
instrument('set', stage + '-disable-master', {'ls_augment_app_master': '0'})
configured = state()
assert configured['settings']['app_master'] == '0' and configured['settings']['beautify_unlimited_trial'] == '1'
(out / 'configured-before-boot.json').write_text(json.dumps(configured, ensure_ascii=False, indent=2), encoding='utf-8')
(out / 'reboot-command.txt').write_bytes(adb('shell', 'svc power reboot', check=False, timeout=12))
print('Normal full boot dispatched with overall app gate OFF and trial child ON.', flush=True)
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
(out / 'boot-observations.json').write_text(json.dumps(observations, indent=2), encoding='utf-8')
assert ready, 'New full boot not completed'
shell('input keyevent 224')
shell('input keyevent 82')
shell('wm dismiss-keyguard')
require_systemui_build(stage + '-systemui')
root = hierarchy(stage + '-ready')
if matches(root, 'USB 的用途') and matches(root, '取消'):
    tap(stage + '-dismiss-usb', '取消')
shell('input keyevent 3')
time.sleep(2)
snapshot(stage + '-desktop', False)
after = state()
configuration = shell('dumpsys activity activities')
(out / 'configuration-after.txt').write_text(configuration, encoding='utf-8')
font = re.search(r'customFont=([^\s}]+)', configuration)[1]
original = json.loads((OUTPUT / 'round37n2-original-theme-applied/state.json').read_text(encoding='utf-8'))
pid = int(shell('pidof com.zte.beautifyadapter'))
for attempt in range(5):
    try:
        records = [json.loads(n.text) for n in ET.fromstring(shell(
            'cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)) if n.tag == 'string' and n.text]
        break
    except (ET.ParseError, json.JSONDecodeError):
        if attempt == 4:
            raise
        time.sleep(.2)
adapter = next(r for r in records if r.get('process') == 'com.zte.beautifyadapter'
               and r.get('pid') == pid and r.get('moduleVersion') == '2.0.0-alpha1-test20242')
(out / 'current-adapter.json').write_text(json.dumps(adapter, ensure_ascii=False, indent=2), encoding='utf-8')
result = {'case': 'Overall-app-gate-off-child-on-normal-full-boot',
          'pass': after['settings']['app_master'] == '0' and after['settings']['beautify_unlimited_trial'] == '1'
                  and after['adapter']['trial_key'] == '0' and after['wallpapers'] == original['wallpapers']
                  and font == 'sans-serif',
          'before': before, 'after': after, 'bootId': boot, 'actualGlobalFont': font,
          'usbFunctions': shell('getprop sys.usb.config'),
          'chargeOnlyAllowed': shell('settings get system allow_debug_in_charge_only_mode')}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print({k: v for k, v in result.items() if k not in ('before', 'after')}, flush=True)
assert result['pass']
