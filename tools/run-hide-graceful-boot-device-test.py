"""Real tile hide followed by Android's graceful reboot before its deferred write."""
import json
import shlex
import sys
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell, tap
from tile_device_helpers import wait_tile
from launcher_icon_device_helpers import saved

out = OUTPUT / (sys.argv[1] + '-graceful-boot-results')
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists(), 'Existing reboot journal; do not reboot again'


def states():
    raw = shell('dumpsys package ls.augment.regression.launcher', root=True)
    return {str(u): 'hidden=true' in next(s for s in raw.splitlines()
            if s.strip().startswith(f'User {u}:')) for u in [0, 999]}


def disk(label):
    value = {}
    for u in [0, 999]:
        raw = adb('exec-out', 'su -c ' + shlex.quote(
            f'cat /data/system/users/{u}/package-restrictions.xml'))
        (out / f'{label}-user-{u}.xml').write_bytes(raw)
        n = next(n for n in ET.fromstring(raw).iter('pkg')
                 if n.get('name') == 'ls.augment.regression.launcher')
        value[str(u)] = n.get('hidden') == 'true'
    return value


assert saved('automation_enabled') == '0'
assert states() == {'0': False, '999': False}
assert disk('shown-before') == {'0': False, '999': False}
shell('cmd statusbar expand-settings')
wait_tile(sys.argv[1] + '-tile-visible', 'ADB_HIDE，SPACE_TEST，全部显示', 2)
boot_before = shell('cat /proc/sys/kernel/random/boot_id')
tap(sys.argv[1] + '-hide', 'ADB_HIDE，SPACE_TEST，全部显示')
started = time.monotonic()
while time.monotonic() - started < 12:
    actual = states()
    if actual == {'0': True, '999': True}:
        break
    time.sleep(.2)
assert actual == {'0': True, '999': True}
pending = disk('pending-before-reboot')
assert not all(pending.values()), 'Deferred-write boundary already passed; no reboot issued'
before = {'bootId': boot_before, 'at': shell('date -Iseconds'),
          'memoryHidden': actual, 'diskHidden': pending, 'automationEnabled': saved('automation_enabled'),
          'rebootCommand': 'svc power reboot', 'secondsAfterTap': round(time.monotonic() - started, 3)}
(out / 'before.json').write_text(json.dumps(before, indent=2), encoding='utf-8')
(out / 'reboot-command.txt').write_bytes(adb('shell', 'svc power reboot', timeout=12, check=False))
print(json.dumps({'rebootDispatched': before}), flush=True)
start = time.monotonic()
observations = []
while time.monotonic() - start < 150:
    try:
        boot = shell('cat /proc/sys/kernel/random/boot_id', timeout=4)
        completed = shell('getprop sys.boot_completed', timeout=4)
        observations.append({'elapsed': round(time.monotonic() - start, 2), 'bootId': boot, 'completed': completed})
        if boot != boot_before and completed == '1':
            break
    except Exception as error:
        observations.append({'elapsed': round(time.monotonic() - start, 2), 'pending': type(error).__name__})
    time.sleep(2)
(out / 'boot-observations.json').write_text(json.dumps(observations, indent=2), encoding='utf-8')
assert boot != boot_before and completed == '1', 'No complete new boot'
shell('input keyevent 224')
shell('input keyevent 82')
shell('wm dismiss-keyguard')
actual = states()
persisted = disk('after-boot')
after = {'bootId': boot, 'memoryHidden': actual, 'diskHidden': persisted,
         'automationEnabled': saved('automation_enabled'),
         'usbFunctions': shell('getprop sys.usb.config'),
         'chargeOnlyAllowed': shell('settings get system allow_debug_in_charge_only_mode')}
result = {'case': 'Graceful-reboot-before-deferred-write',
          'pass': actual == persisted == {'0': True, '999': True}
                  and after['automationEnabled'] == '0' and after['usbFunctions'] == 'adb',
          'before': before, 'after': after}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(result, ensure_ascii=False), flush=True)
assert result['pass'], result
