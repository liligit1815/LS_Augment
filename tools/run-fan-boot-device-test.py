"""Normal full-device reboot with fan enhancements armed and the native fan OFF."""
import json
import re
import sys
import time

from adb_regression import OUTPUT, adb, instrument, shell
from fan_device_helpers import native_enabled, open_module, sample
from module_ui_helpers import hierarchy, matches, tap
from statusbar_device_helpers import require_systemui_build

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists()
native_enabled(stage + '-native-off', False)
before = sample()
assert (before['enable'], before['level'], before['mode']) == (0, 2, 1)
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
maximum = before['settings']['ls_augment_fan_measurement'].split('|')[-1].split(',')[0]
assert maximum.isdigit()
instrument('set', stage + '-prepare', {'ls_augment_game_master': '1', 'ls_augment_fan_fixed_enabled': '1',
                                     'ls_augment_fan_unlock_max': '1', 'ls_augment_fan_target_rpm': maximum})
before = sample()
before['bootId'] = shell('cat /proc/sys/kernel/random/boot_id')
before['usbFunctions'] = shell('getprop sys.usb.config')
before['chargeOnlyAllowed'] = shell('settings get system allow_debug_in_charge_only_mode')
before['launcherVersion'] = re.search(r'versionCode=(\d+)', shell('dumpsys package com.zte.mifavor.launcher')).group(1)
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
(out / 'reboot-command.txt').write_bytes(adb('shell', 'svc power reboot', check=False, timeout=12))
print('Normal reboot dispatched; native fan OFF, fixed/unlock armed.', flush=True)
start = time.monotonic()
rows = []
while time.monotonic() - start < 160:
    try:
        boot = shell('cat /proc/sys/kernel/random/boot_id', timeout=4)
        done = shell('getprop sys.boot_completed', timeout=4)
        row = {'elapsed': round(time.monotonic() - start, 2), 'bootId': boot, 'completed': done}
        rows.append(row)
        if boot != before['bootId'] and done == '1':
            break
    except Exception as error:
        rows.append({'elapsed': round(time.monotonic() - start, 2), 'pending': type(error).__name__})
    (out / 'boot-observations.json').write_text(json.dumps(rows, indent=2), encoding='utf-8')
    time.sleep(2)
else:
    raise AssertionError('New boot not ready; inspect the saved reboot journal')
(out / 'boot-observations.json').write_text(json.dumps(rows, indent=2), encoding='utf-8')
shell('input keyevent 224')
shell('input keyevent 82')
shell('wm dismiss-keyguard')
require_systemui_build(stage + '-systemui')
root = hierarchy(stage + '-ready')
if matches(root, 'USB 的用途') and matches(root, '取消'):
    tap(stage + '-dismiss-usb', '取消')
shell('input keyevent 3')
observations = []
observe_start = time.monotonic()
while time.monotonic() - observe_start < 65:
    value = sample()
    observations.append(value)
    (out / 'off-observations.json').write_text(json.dumps(observations, ensure_ascii=False, indent=2), encoding='utf-8')
    assert value['enable'] == 0 and value['rpm'] == 0, 'Fan must not start automatically'
    print({'offElapsed': round(time.monotonic() - observe_start, 2), 'enable': value['enable'], 'rpm': value['rpm']}, flush=True)
    time.sleep(5)
native_enabled(stage + '-actual-on', True)
for _ in range(24):
    controlled = sample()
    diagnostic = controlled['diagnostics'].get('ls_augment_fan_control_active', '')
    if controlled['level'] == 4 and 'controlled;kind=fixed;' in diagnostic and ';restore_level=2;' in diagnostic:
        break
    time.sleep(.5)
assert controlled['level'] == 4 and ';restore_level=2;' in diagnostic, controlled
open_module(stage + '-disable')
tap(stage + '-fixed-off', '固定风扇转速')
tap(stage + '-unlock-off', '解除原厂极限转速限制')
native_enabled(stage + '-final-off', False)
after = sample()
checks = {
    'newFullBoot': boot != before['bootId'],
    'noAutoStartFor65SecondsAfterReady': all(r['enable'] == 0 and r['rpm'] == 0 for r in observations),
    'armedConfigSurvivedBoot': observations[-1]['settings'] == before['settings'],
    'manualOnReachedFixed4WithOriginal2': controlled['level'] == 4 and ';restore_level=2;' in diagnostic,
    # The actual OEM OFF switch records manual=0; controller startup uses
    # -100 for its neutral state. Neither value is written by this module.
    'nativeOffRestoredOriginal': (after['enable'], after['level'], after['manual'], after['mode']) == (0, 2, 0, 1),
    'chargeOnlyAdbAvailable': shell('getprop sys.usb.config') == 'adb' and shell('settings get system allow_debug_in_charge_only_mode') == '1',
    'launcherVersionPreserved': re.search(r'versionCode=(\d+)', shell('dumpsys package com.zte.mifavor.launcher')).group(1) == before['launcherVersion'],
}
result = {'case': 'Normal-reboot-fan-off-and-manual-session', 'pass': all(checks.values()),
          **checks, 'bootId': boot, 'after': after, 'controlled': controlled}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print({'pass': result['pass'], **checks}, flush=True)
assert result['pass']
