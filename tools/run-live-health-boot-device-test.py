"""Normal device reboot: live trial retention and the enabled health service."""
import json
import argparse
import re
import sys
import time
from adb_regression import OUTPUT, adb, shell, snapshot
from module_ui_helpers import hierarchy, matches, tap
from theme_device_helpers import state
from health_device_helpers import diagnostics
from launcher_icon_device_helpers import saved
from statusbar_device_helpers import require_systemui_build

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('stage')
parser.add_argument('--small-plan', action='store_true')
parser.add_argument('--stable-seconds', type=int, default=180)
args = parser.parse_args()
stage = args.stage
assert 65 <= args.stable_seconds <= 900
out = OUTPUT / (stage + '-boot-results')
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists(), 'Inspect the existing boot journal'
before = state()
before['bootId'] = shell('cat /proc/sys/kernel/random/boot_id')
before['healthEnabled'] = saved('health_enabled')
before['healthMultiplier'] = saved('health_multiplier')
before['healthPlanEnabled'] = saved('health_plan_enabled')
before['wallpaperComponents'] = re.findall(r'^  mWallpaperComponent=(.+)$', shell('dumpsys wallpaper'), re.M)
assert before['adapter']['trial_key'] == '16'
assert before['settings']['app_master'] == before['settings']['beautify_unlimited_trial'] == '1'
assert before['healthEnabled'] == '1' and before['healthMultiplier'] == '100'
if before['healthPlanEnabled'] != '0':
    assert args.small_plan
    trial = saved('health_plan').split('|')
    assert len(trial) == 11 and trial[0] == 'SP2' and trial[2] == saved('health_account')
    assert trial[7] == '1' and 1 <= int(trial[8]) <= 3
    before['smallPlanId'] = trial[1]
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
(out / 'reboot-command.txt').write_bytes(adb('shell', 'svc power reboot', check=False, timeout=12))
print('Normal reboot dispatched; live wallpaper and health checkpoint saved.', flush=True)
start = time.monotonic()
observations = []
while time.monotonic() - start < 160:
    try:
        boot = shell('cat /proc/sys/kernel/random/boot_id', timeout=4)
        done = shell('getprop sys.boot_completed', timeout=4)
        observations.append({'elapsed': round(time.monotonic() - start, 2), 'bootId': boot, 'completed': done})
        if boot != before['bootId'] and done == '1':
            break
    except Exception as error:
        observations.append({'elapsed': round(time.monotonic() - start, 2), 'pending': type(error).__name__})
    time.sleep(2)
else:
    raise AssertionError('New boot not ready; inspect saved journal')
(out / 'boot-observations.json').write_text(json.dumps(observations, indent=2), encoding='utf-8')
shell('input keyevent 224'); shell('input keyevent 82'); shell('wm dismiss-keyguard')
require_systemui_build(stage + '-systemui')
root = hierarchy(stage + '-ready')
if matches(root, 'USB 的用途') and matches(root, '取消'):
    tap(stage + '-dismiss-usb', '取消')
shell('input keyevent 3')
time.sleep(2)
snapshot(stage + '-desktop', False)
after = state()
wallpaper = shell('dumpsys wallpaper')
components = re.findall(r'^  mWallpaperComponent=(.+)$', wallpaper, re.M)
(out / 'wallpaper-after.txt').write_text(wallpaper, encoding='utf-8')
theme_pass = (after['selection'] == before['selection'] and after['wallpapers'] == before['wallpapers']
              and after['adapter']['trial_key'] == '16' and components == before['wallpaperComponents'])
health_observations = []
health_start = time.monotonic()
connected_at = None
heartbeats = set()
while time.monotonic() - health_start < args.stable_seconds + 120:
    d = diagnostics(stage + '-health-private')
    services = shell('dumpsys activity services com.mi.health')
    binding = 'DeviceManagerService:system}' in services and 'flags=0x5' in services
    heartbeat = int(d.get('ls_augment_health_heartbeat', '0'))
    age = int(shell('date +%s%3N')) - heartbeat
    fresh = 0 <= age < 45000
    account = bool(d.get('ls_augment_health_account_runtime')) and d.get('ls_augment_health_account_runtime') == saved('health_account')
    processes = shell('dumpsys activity processes')
    health = [b for b in re.split(r'(?=  \*APP\*)', processes) if re.search(r'^  \*APP\*.*com.mi.health', b)]
    unfrozen = bool(health) and all('isFrozen=true' not in b for b in health)
    row = {'elapsed': round(time.monotonic() - health_start, 2), 'binding': binding,
           'freshHeartbeat': fresh, 'heartbeatAgeMs': age, 'sameAccount': account, 'unfrozen': unfrozen}
    health_observations.append(row)
    (out / 'health-observations.json').write_text(json.dumps(health_observations, indent=2), encoding='utf-8')
    print(json.dumps(row), flush=True)
    if binding and fresh and account and unfrozen:
        heartbeats.add(heartbeat)
        if connected_at is None:
            connected_at = time.monotonic()
    else:
        connected_at = None
        heartbeats.clear()
    if connected_at is not None and time.monotonic() - connected_at >= args.stable_seconds and len(heartbeats) >= 3:
        break
    time.sleep(5)
health_pass = connected_at is not None and time.monotonic() - connected_at >= args.stable_seconds and len(heartbeats) >= 3
(out / 'health-services-after.txt').write_text(services, encoding='utf-8')
(out / 'health-observations.json').write_text(json.dumps(health_observations, indent=2), encoding='utf-8')
(out / 'health-processes-after-private.txt').write_text(processes, encoding='utf-8')
result = {'case': 'Normal-full-boot-live-trial-and-health-background', 'pass': theme_pass and health_pass,
          'liveTrialRetained': theme_pass, 'healthBackgroundResumed': health_pass,
          'before': before, 'after': after, 'bootId': boot,
          'usbFunctions': shell('getprop sys.usb.config'),
          'chargeOnlyAllowed': shell('settings get system allow_debug_in_charge_only_mode'),
          'healthNativeLaunchAfterBoot': False, 'bindingFlags': '0x5', 'distinctHeartbeats': len(heartbeats),
          'minimumContinuousObservationSeconds': args.stable_seconds}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps({k: v for k, v in result.items() if k not in ('before', 'after')}, ensure_ascii=False), flush=True)
assert result['pass'], 'Inspect saved actual boot outcomes'
