"""Continue the real screen-off cases after a completed, independently verified boot."""
import json
import sys
import time
from adb_regression import OUTPUT, shell, adb, instrument
from launcher_icon_device_helpers import saved

stage = sys.argv[1]
out = OUTPUT / (stage + '-automation-results')
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists(), 'Preserve previous results; choose a new stage'
targets = ['0:ls.augment.regression.launcher', '999:ls.augment.regression.launcher']
records = []


def states():
    raw = shell('dumpsys package ls.augment.regression.launcher', root=True)
    result = {}
    for user in [0, 999]:
        line = next(s.strip() for s in raw.splitlines() if s.strip().startswith(f'User {user}:'))
        assert 'installed=true' in line
        result[str(user)] = 'hidden=true' in line
    return result


def record(case, success, **details):
    row = {'case': case, 'pass': success, **details}
    records.append(row)
    (out / 'results.json').write_text(json.dumps(records, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(row, ensure_ascii=False), flush=True)
    assert success, row


assert saved('automation_enabled') == '1' and saved('automation_scope') == 'all'
assert states() == {'0': False, '999': False}
before = {'bootId': shell('cat /proc/sys/kernel/random/boot_id'),
          'at': shell('date -Iseconds'), 'states': states()}
(out / 'before.json').write_text(json.dumps(before, indent=2), encoding='utf-8')
shell('cmd statusbar collapse')
old_pid = adb('shell', 'pidof ls.augment.com', check=False).decode().strip()
shell('am force-stop ls.augment.com')
new_pid = adb('shell', 'pidof ls.augment.com', check=False).decode().strip()
exits = shell('dumpsys activity exit-info ls.augment.com', root=True)
(out / 'force-stop-exits.txt').write_text(exits, encoding='utf-8')
# A bound native tile may immediately start a replacement process. Verify the
# old process died, instead of requiring the module to remain absent.
assert old_pid and old_pid != new_pid and ('pid=' + old_pid) in exits
assert 'subreason=21 (FORCE STOP)' in exits.split('ApplicationExitInfo #1:')[0]
shell('input keyevent 223')
start = time.monotonic()
observations = []
try:
    while time.monotonic() - start < 22:
        actual = states()
        observations.append({'elapsed': round(time.monotonic() - start, 3), 'states': actual})
        if actual == {'0': True, '999': True}:
            break
        time.sleep(.5)
    (out / 'app-stopped-screen-off-power.txt').write_text(shell('dumpsys power'), encoding='utf-8')
    record('Screen-off-after-real-force-stop-no-user-launch', actual == {'0': True, '999': True},
           observations=observations, killedPid=old_pid, nativeRestartPid=new_pid,
           modulePidAfter=adb('shell', 'pidof ls.augment.com', check=False).decode().strip())
finally:
    shell('input keyevent 224')
    shell('input keyevent 82')
    shell('wm dismiss-keyguard')
    instrument('set', stage + '-auto-off', {'ls_augment_automation_enabled': '0', 'ls_augment_automation_scope': 'current'})
    instrument('hide-configure', stage + '-visible-restored', {'targets': targets})

shell('input keyevent 223')
start = time.monotonic()
try:
    observations = []
    while time.monotonic() - start < 12:
        actual = states()
        observations.append({'elapsed': round(time.monotonic() - start, 3), 'states': actual})
        if actual != {'0': False, '999': False}:
            break
        time.sleep(.8)
    record('Automation-off-after-boot', all(r['states'] == {'0': False, '999': False} for r in observations),
           observations=observations)
finally:
    shell('input keyevent 224')
    shell('input keyevent 82')
    shell('wm dismiss-keyguard')
