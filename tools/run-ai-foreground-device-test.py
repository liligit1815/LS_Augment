"""Observe real native AI across an owned game and its identical non-game twin."""
import io
import json
import re
import sys
import time
from PIL import Image, ImageChops
from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs
from game_device_helpers import COMPONENT, PACKAGE

stage = sys.argv[1]
out = OUTPUT / stage; out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
other = 'ls.augment.regression.nongame'
service = 'am startservice -n com.zte.game.plugintrigger/.service.PluginTriggerService -a com.zte.game.plugintrigger.'
config = prefs('ls_augment_config_v2')
assert config['ls_augment_ai_trigger_enabled'] == '1'
phases = []


def uptime():
    return int(float(shell('cat /proc/uptime').split()[0]) * 1000)


def phase(name, package, duration, start_native=False):
    record = {'name': name, 'package': package, 'beforeStart': uptime()}
    record['launch'] = shell('am start -W --activity-single-top -n ' + package + '/.GameActivity --es template_mode normal')
    record['start'] = uptime()
    record['pid'] = shell('pidof ' + package).strip()
    if start_native:
        record['nativeStart'] = shell(service + 'ACTION_START --es packageName ' + PACKAGE, root=True)
    time.sleep(duration)
    record['end'] = uptime()
    record['nativeEnabled'] = shell('settings get global plugintrigger_enabled_pkgs').strip()
    record['foreground'] = '\n'.join(line for line in shell('dumpsys activity activities').splitlines()
                                     if 'topResumedActivity' in line or 'mResumedActivity' in line)
    (out / (name + '.png')).write_bytes(adb('exec-out', 'screencap -p'))
    phases.append(record)
    (out / 'phases.json').write_text(json.dumps(phases, indent=2), encoding='utf-8')
    print({'phase': name, 'foreground': record['foreground'], 'nativeEnabled': record['nativeEnabled']}, flush=True)


try:
    phase('game-start', PACKAGE, 7, True)
    phase('non-game-identical', other, 6)
    phase('game-return', PACKAGE, 5)
    phase('game-explicit-resume', PACKAGE, 6, True)
finally:
    shell(service + 'ACTION_STOP --es packageName ' + PACKAGE + ' --ez close_window true', root=True)
time.sleep(.6)
raw = adb('logcat', '-d', '-v', 'epoch', '-s', 'LSA-GameValidation:I', '*:S').decode('utf-8', 'replace')
(out / 'input-log.txt').write_text(raw, encoding='utf-8')
events = []
for line in raw.splitlines():
    match = re.search(r'\s*\d+\.\d+\s+(\d+)\s+\d+\s+I\s+LSA-GameValidation\s*:\s*target=(\d+);action=(\d+);eventTime=(\d+);now=(\d+)', line)
    if match:
        event = dict(zip(['pid', 'target', 'action', 'eventTime', 'now'], map(int, match.groups())))
        if event['now'] >= phases[0]['beforeStart']:
            events.append(event)
for p in phases:
    observed = [e for e in events if p['start'] <= e['now'] < p['end']]
    p['events'] = observed
    p['actualDowns'] = sum(e['action'] == 0 for e in observed)
    p['lateDowns'] = [e for e in observed if e['action'] == 0 and e['now'] > p['start'] + 350]
    p['correctForeground'] = p['package'] in p['foreground']
crop = (534, 439, 859, 764)
images = [Image.open(out / (name + '.png')).convert('RGB').crop(crop)
          for name in ['game-start', 'non-game-identical']]
checks = {
    'realIdenticalTemplatePixels': ImageChops.difference(*images).getbbox() is None,
    'observedForegrounds': all(p['correctForeground'] for p in phases),
    'gameInitiallyClicks': phases[0]['actualDowns'] >= 4,
    'noOngoingInputIntoNonGameTwin': not phases[1]['lateDowns'],
    'explicitGameResumeClicks': phases[3]['actualDowns'] >= 4,
}
result = {'pass': all(checks.values()), **checks, 'phases': phases,
          'nativeReturnAutomaticallyClicks': phases[2]['actualDowns'] > 0,
          'config': {k: v for k, v in config.items() if k.startswith('ls_augment_ai_')},
          'allEvents': events}
(out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
print({k: v for k, v in result.items() if k not in ['phases', 'allEvents', 'config']}, flush=True)
assert result['pass']
