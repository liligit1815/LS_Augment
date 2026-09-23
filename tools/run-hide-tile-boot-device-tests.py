"""Real reboot, native tile recovery, and screen-off hiding with the app stopped."""
import argparse
import json
import subprocess
import time
import shlex
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, ROOT, adb, shell, snapshot, instrument, tap
from launcher_icon_device_helpers import saved
from tile_device_helpers import wait_tile
from tile_image_evidence import compare_alpha
from statusbar_device_helpers import require_systemui_build

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('stage')
parser.add_argument('--resume', action='store_true')
args = parser.parse_args()
stage = args.stage
out = OUTPUT / (stage + '-boot-results')
out.mkdir(exist_ok=True)
targets = ['0:ls.augment.regression.launcher', '999:ls.augment.regression.launcher']
reference = OUTPUT / 'round34a-tile-results/alpha-cropped.png'
records = []


def record(case, success, **details):
    result = {'case': case, 'pass': bool(success), **details}
    records.append(result)
    (out / 'results.json').write_text(json.dumps(records, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(result, ensure_ascii=False), flush=True)
    assert success, result


def states():
    raw = shell('dumpsys package ls.augment.regression.launcher', root=True)
    value = {}
    for user in [0, 999]:
        line = next(s.strip() for s in raw.splitlines() if s.strip().startswith('User ' + str(user) + ':'))
        assert 'installed=true' in line
        value[str(user)] = 'hidden=true' in line
    return value


def usb():
    return {k: shell(command) for k, command in {
        'functions': 'getprop sys.usb.config',
        'chargeOnlyAllowed': 'settings get system allow_debug_in_charge_only_mode',
        'adbEnabled': 'settings get global adb_enabled',
        'developerEnabled': 'settings get global development_settings_enabled'}.items()}


def wait_persisted_hidden():
    # Android defers package-restrictions writes. adb reboot bypasses the
    # framework's shutdown flush; prove persistence before this cold boot.
    observations = []
    started = time.monotonic()
    while time.monotonic() - started < 35:
        value = {}
        for user in [0, 999]:
            raw = adb('exec-out', 'su -c ' + shlex.quote(
                f'cat /data/system/users/{user}/package-restrictions.xml'))
            (out / f'persisted-before-user-{user}.xml').write_bytes(raw)
            node = next(n for n in ET.fromstring(raw).iter('pkg')
                        if n.get('name') == 'ls.augment.regression.launcher')
            value[str(user)] = node.get('hidden') == 'true'
        observations.append({'elapsed': round(time.monotonic() - started, 3), 'diskHidden': value})
        (out / 'persistence-before-reboot.json').write_text(
            json.dumps(observations, indent=2), encoding='utf-8')
        if value == {'0': True, '999': True}:
            return
        time.sleep(.6)
    raise AssertionError('Native hidden flags did not reach disk; no reboot issued')


before_path = out / 'boot-before.json'
if args.resume:
    before = json.loads(before_path.read_text(encoding='utf-8'))
else:
    assert not before_path.exists(), 'Existing reboot journal: inspect it and use --resume.'
    shell('cmd statusbar collapse')
    instrument('set', stage + '-enabled', {'ls_augment_hide_master': '1',
               'ls_augment_automation_enabled': '1', 'ls_augment_automation_scope': 'all',
               'ls_augment_tile_enabled': '1'})
    instrument('hide-configure', stage + '-hidden-before', {'targets': targets, 'hidden': targets})
    shell('cmd statusbar expand-settings')
    folder = wait_tile(stage + '-tile-before', 'ADB_HIDE，SPACE_TEST，全部隐藏', 1)
    picture = compare_alpha(folder, 'ADB_HIDE', reference)
    assert picture['pass'] and states() == {'0': True, '999': True}
    wait_persisted_hidden()
    before = {'bootId': shell('cat /proc/sys/kernel/random/boot_id'), 'usb': usb(),
              'settings': {key: saved(key) for key in ['hide_master', 'hide_targets_v2',
                          'automation_enabled', 'automation_scope', 'tile_icon', 'tile_label', 'tile_description']},
              'at': shell('date -Iseconds'), 'rebootRequested': True}
    before_path.write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
    (out / 'reboot-command.txt').write_bytes(adb('reboot', timeout=15))
    print('Actual device reboot dispatched', flush=True)

started = time.monotonic()
observations = []
ready = False
while time.monotonic() - started < 160:
    try:
        device = adb('get-state', timeout=5, check=False).decode('utf-8', 'replace').strip()
        if device == 'device':
            boot = shell('cat /proc/sys/kernel/random/boot_id', timeout=5)
            completed = shell('getprop sys.boot_completed', timeout=5)
            observations.append({'elapsed': round(time.monotonic() - started, 2), 'bootId': boot, 'bootCompleted': completed})
            if boot != before['bootId'] and completed == '1':
                ready = True
                break
    except (RuntimeError, subprocess.TimeoutExpired) as error:
        observations.append({'elapsed': round(time.monotonic() - started, 2), 'pending': type(error).__name__})
    time.sleep(2)
(out / 'reboot-observations.json').write_text(json.dumps(observations, indent=2), encoding='utf-8')
assert ready, 'No completed new boot yet; inspect connection and preserve this journal.'
shell('input keyevent 224')
shell('input keyevent 82')
shell('wm dismiss-keyguard')
require_systemui_build(stage + '-current-systemui')
after = {'bootId': boot, 'usb': usb(), 'at': shell('date -Iseconds')}
(out / 'boot-after.json').write_text(json.dumps(after, indent=2), encoding='utf-8')
record('New-full-boot-and-charging-ADB', boot != before['bootId']
       and after['usb']['functions'] == 'adb' and after['usb']['chargeOnlyAllowed'] == '1', before=before['bootId'], after=after)
actual = {key: saved(key) for key in before['settings']}
record('Saved-settings-retained', actual == before['settings'], actual=actual)
shell('cmd statusbar expand-settings')
folder = wait_tile(stage + '-tile-after-boot', 'ADB_HIDE，SPACE_TEST，全部隐藏', 1)
picture = compare_alpha(folder, 'ADB_HIDE', reference)
record('Hidden-state-and-custom-tile-after-boot', states() == {'0': True, '999': True}
       and picture['pass'], states=states(), image=picture, evidence=folder.name)
tap(stage + '-recover-after-boot', 'ADB_HIDE，SPACE_TEST，全部隐藏')
folder = wait_tile(stage + '-visible-after-boot', 'ADB_HIDE，SPACE_TEST，全部显示', 2)
record('Actual-tile-recovery-after-boot', states() == {'0': False, '999': False}, states=states(), evidence=folder.name)
shell('cmd statusbar collapse')
shell('am force-stop ls.augment.com')
assert not adb('shell', 'pidof ls.augment.com', check=False).strip()
shell('input keyevent 223')
started = time.monotonic()
try:
    while time.monotonic() - started < 20:
        actual = states()
        if actual == {'0': True, '999': True}:
            break
        time.sleep(.5)
    power = shell('dumpsys power')
    (out / 'app-stopped-screen-off-power.txt').write_text(power, encoding='utf-8')
    record('Screen-off-with-module-app-stopped', actual == {'0': True, '999': True},
           actual=actual, elapsedSeconds=round(time.monotonic() - started, 2))
finally:
    shell('input keyevent 224')
    shell('input keyevent 82')
    shell('wm dismiss-keyguard')
    instrument('set', stage + '-auto-off', {'ls_augment_automation_enabled': '0', 'ls_augment_automation_scope': 'current'})
    instrument('hide-configure', stage + '-visible-restored', {'targets': targets})

shell('input keyevent 223')
started = time.monotonic()
try:
    while time.monotonic() - started < 12:
        assert states() == {'0': False, '999': False}, 'Disabled automation changed package state'
        time.sleep(.8)
    record('Automation-off-after-boot', states() == {'0': False, '999': False}, elapsedSeconds=round(time.monotonic() - started, 2))
finally:
    shell('input keyevent 224')
    shell('input keyevent 82')
    shell('wm dismiss-keyguard')
print('Boot and automatic hiding verified; fixtures visible, automatic hiding disabled.', flush=True)
