"""Change actual phone pixels while native AI recognition keeps running."""
import json
import re
import sys
import time

from adb_regression import OUTPUT, adb, shell
from game_device_helpers import COMPONENT, PACKAGE, capture
from fan_device_helpers import prefs

stage = sys.argv[1]
out = OUTPUT / stage;out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
config = prefs('ls_augment_config_v2')
assert config['ls_augment_ai_trigger_enabled'] == '1'
assert config['ls_augment_ai_template_scan_ms'] == '180'
assert config['ls_augment_ai_click_ms'] == '25'
assert config['ls_augment_ai_cooldown_ms'] == '180'
service = 'am startservice -n com.zte.game.plugintrigger/.service.PluginTriggerService -a com.zte.game.plugintrigger.'
sequence = ['normal', 'hidden', 'normal', 'blank', 'normal', 'alternate', 'normal']
marker = int(float(shell('cat /proc/uptime').split()[0]) * 1000)
commands = []
try:
    for i, mode in enumerate(sequence):
        result = shell('am start -W --activity-single-top -n ' + COMPONENT + ' --es template_mode ' + mode)
        commands.append({'phase': i, 'scene': mode, 'output': result})
        if i == 0:
            shell(service + 'ACTION_START --es packageName ' + PACKAGE, root=True)
        time.sleep(5 if i == 0 else 3)
finally:
    shell(service + 'ACTION_STOP --es packageName ' + PACKAGE + ' --ez close_window true', root=True)
time.sleep(.6)
raw = adb('logcat', '-d', '-v', 'epoch', '-s', 'LSA-GameValidation:I', '*:S').decode('utf-8', 'replace')
(out / 'fixture-log.txt').write_text(raw, encoding='utf-8')
(out / 'actual-scene-commands.json').write_text(json.dumps(commands, indent=2), encoding='utf-8')
scenes = [(m.group(1), int(m.group(2))) for m in re.finditer(r'scene=(\w+);now=(\d+)', raw) if int(m.group(2)) >= marker]
events = []
for line in raw.splitlines():
    match = re.search(r'target=(\d+);action=(\d+);eventTime=(\d+);now=(\d+)', line)
    if match and int(match.group(4)) >= marker:
        events.append(dict(zip(['target', 'action', 'eventTime', 'now'], map(int, match.groups()))))
assert [s[0] for s in scenes] == sequence, scenes
end = int(float(shell('cat /proc/uptime').split()[0]) * 1000)
phases = []
for i, (name, start) in enumerate(scenes):
    finish = scenes[i + 1][1] if i + 1 < len(scenes) else end
    downs = [e['now'] for e in events if e['action'] == 0 and start <= e['now'] < finish]
    late = [value for value in downs if value > start + 200]
    # An already captured old frame can finish its click during the short handoff.
    # No new actions may continue after that; a restored pattern must be recognized promptly.
    passed = (len(downs) >= 2 and (i == 0 or downs[0] - start < 750)) if name == 'normal' else not late
    phases.append({'scene': name, 'start': start, 'end': finish, 'downs': downs,
                   'firstClickAfterSceneMs': downs[0] - start if downs else None, 'pass': passed})
checks = {'everySceneMatchedExpectation': all(p['pass'] for p in phases),
          'onlyTargetB': all(e['target'] == 1 for e in events),
          'orderedTouchPairs': len(events) % 2 == 0 and all(events[i]['action'] == 0 and events[i + 1]['action'] == 1
                                                         for i in range(0, len(events), 2))}
result = {'pass': all(checks.values()), **checks, 'phases': phases}
(out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
capture(stage + '-after')
print(result, flush=True)
assert result['pass']
