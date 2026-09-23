"""Verify real selected trial theme, rendered wallpaper and system font after full boot."""
import json
import re
import sys
import time
import xml.etree.ElementTree as ET
from adb_regression import ROOT, OUTPUT, adb, shell, snapshot
from module_ui_helpers import hierarchy, matches, tap
from theme_device_helpers import state
from statusbar_device_helpers import require_systemui_build

stage = sys.argv[1]
out = OUTPUT / (stage + '-boot-results')
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists(), 'Existing boot journal: inspect rather than reboot again'
before = state()
before['bootId'] = shell('cat /proc/sys/kernel/random/boot_id')
assert before['adapter']['trial_key'] == '257'
assert before['settings']['app_master'] == before['settings']['beautify_unlimited_trial'] == '1'
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
(out / 'reboot-command.txt').write_bytes(adb('shell', 'svc power reboot', check=False, timeout=12))
print('Normal full reboot dispatched; original trial checkpoint saved.', flush=True)
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
assert ready, 'New boot not completed; retain journal'
shell('input keyevent 224')
shell('input keyevent 82')
shell('wm dismiss-keyguard')
require_systemui_build(stage + '-systemui')
root = hierarchy(stage + '-ready')
if matches(root, 'USB 的用途') and matches(root, '取消'):
    tap(stage + '-dismiss-usb', '取消')
shell('input keyevent 3')
time.sleep(2)
snapshot(stage + '-desktop', verbose=False)
after = state()
configuration = shell('dumpsys activity activities')
(out / 'configuration-after.txt').write_text(configuration, encoding='utf-8')
font = '/data/resource-cache/font/' + before['selection']['selectedFontId']
current_font = re.search(r'customFont=([^\s}]+)', configuration)[1]
expected = re.search(r'^versionName=(.+)$', (ROOT / 'android/version.properties').read_text(), re.M)[1].strip()
adapter_pid = int(shell('pidof com.zte.beautifyadapter'))
for attempt in range(5):
    try:
        records = [json.loads(n.text) for n in ET.fromstring(shell(
            'cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)) if n.tag == 'string' and n.text]
        break
    except (ET.ParseError, json.JSONDecodeError):
        if attempt == 4:
            raise
        time.sleep(.2)
adapter = next(r for r in records if r.get('pid') == adapter_pid
               and r.get('process') == 'com.zte.beautifyadapter' and r.get('moduleVersion') == expected)
(out / 'current-adapter.json').write_text(json.dumps(adapter, ensure_ascii=False, indent=2), encoding='utf-8')
result = {'case': 'Actual-trial-theme-font-normal-full-boot',
          'pass': after['selection'] == before['selection'] and after['wallpapers'] == before['wallpapers']
                  and after['adapter']['trial_key'] == '257' and current_font == font,
          'before': before, 'after': after, 'bootId': boot,
          'actualGlobalFont': current_font, 'loadedAdapterVersion': adapter['moduleVersion'],
          'fontBytesAfter': shell('sha256sum ' + font, root=True),
          'usbFunctions': shell('getprop sys.usb.config'),
          'chargeOnlyAllowed': shell('settings get system allow_debug_in_charge_only_mode')}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(result, ensure_ascii=False), flush=True)
assert result['pass'], result
