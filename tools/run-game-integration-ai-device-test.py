"""One real native AI run followed by its identical non-game isolation case."""
import json
import re
import sys
import time
from PIL import Image, ImageChops
from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs


label = sys.argv[1]
folder = OUTPUT / label
folder.mkdir(exist_ok=False)
game = 'ls.augment.regression.game'
other = 'ls.augment.regression.nongame'
service = ('am startservice -n com.zte.game.plugintrigger/.service.PluginTriggerService '
           '-a com.zte.game.plugintrigger.')
phases = []
config = prefs('ls_augment_config_v2')
assert config['ls_augment_ai_trigger_enabled'] == '1'
assert config['ls_augment_combo_speed_enabled'] == '1'
(folder / 'config.json').write_text(json.dumps(config, indent=2), encoding='utf-8')


def uptime():
    return int(float(shell('cat /proc/uptime').split()[0]) * 1000)


def phase(name, package, seconds, start=False):
    row = {'name': name, 'package': package, 'before_launch': uptime()}
    row['launch'] = shell('am start -W --activity-single-top -n ' + package
                          + '/.GameActivity --es template_mode normal')
    row['start'] = uptime()
    row['pid'] = int(shell('pidof ' + package))
    if start:
        row['native_start'] = shell(service + 'ACTION_START --es packageName ' + game, root=True)
    time.sleep(seconds)
    row['end'] = uptime()
    row['foreground'] = '\n'.join(x for x in shell('dumpsys activity activities').splitlines()
                                  if 'topResumedActivity' in x)
    row['enabled'] = shell('settings get global plugintrigger_enabled_pkgs')
    (folder / (name + '.png')).write_bytes(adb('exec-out', 'screencap -p'))
    phases.append(row)
    (folder / 'phases.json').write_text(json.dumps(phases, indent=2), encoding='utf-8')
    print(name + ' observed', flush=True)


try:
    phase('game', game, 12, True)
    phase('non-game', other, 6)
    live = {p: shell('pidof ' + p + ' || true')
            for p in ['com.zte.game.plugintrigger', 'cn.nubia.gamelab']}
    (folder / 'engine-pids.json').write_text(json.dumps(live), encoding='utf-8')
finally:
    stopped = shell(service + 'ACTION_STOP --es packageName ' + game + ' --ez close_window true', root=True)
    (folder / 'native-stop.txt').write_text(stopped, encoding='utf-8')
time.sleep(.8)
raw = adb('logcat', '-d', '-v', 'epoch', '-s', 'LSA-GameValidation:I', '*:S').decode('utf-8', 'replace')
(folder / 'input-log.txt').write_text(raw, encoding='utf-8')
(folder / 'ai-trace.txt').write_bytes(adb('logcat', '-d', '-v', 'epoch', '-s', 'LS_Augment_AI:I', '*:S'))
(folder / 'hook-processes.json').write_text(json.dumps(prefs('hook-processes'), indent=2), encoding='utf-8')
(folder / 'services-after-stop.txt').write_text(shell('dumpsys activity services com.zte.game.plugintrigger'), encoding='utf-8')
(folder / 'window-after-stop.txt').write_text(shell('dumpsys window windows'), encoding='utf-8')
(folder / 'stopped.png').write_bytes(adb('exec-out', 'screencap -p'))
events = []
for line in raw.splitlines():
    match = re.search(r'\s*\d+\.\d+\s+(\d+)\s+\d+\s+I\s+LSA-GameValidation\s*:\s*target=(\d+);action=(\d+);eventTime=(\d+);now=(\d+)', line)
    if match:
        event = dict(zip(['pid', 'target', 'action', 'eventTime', 'now'], map(int, match.groups())))
        if event['now'] >= phases[0]['before_launch']:
            events.append(event)
for row in phases:
    row['events'] = [e for e in events if row['start'] <= e['now'] < row['end']]
game_events = phases[0]['events']
non_game_events = phases[1]['events']
ordered = (len(game_events) >= 8 and len(game_events) % 2 == 0
           and all(e['action'] == i % 2 for i, e in enumerate(game_events)))
images = [Image.open(folder / (name + '.png')).convert('RGB') for name in ['game', 'non-game']]
checks = {
    'both_real_foregrounds': all(row['package'] in row['foreground'] for row in phases),
    'same_landscape_size': all(im.size == (2688, 1216) for im in images),
    'same_template_pixels': ImageChops.difference(*[im.crop((534, 439, 859, 764)) for im in images]).getbbox() is None,
    'at_least_four_ordered_pairs': ordered,
    'game_events_own_target_B': bool(game_events) and all(e['pid'] == phases[0]['pid'] and e['target'] == 1 for e in game_events),
    'no_continuing_non_game_clicks': not [e for e in non_game_events if e['now'] > phases[1]['start'] + 350],
    'native_enable_list_empty_after_stop': not shell('settings get global plugintrigger_enabled_pkgs'),
}
result = {'pass': all(checks.values()), 'checks': checks, 'phases': phases, 'events': events}
(folder / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
print(json.dumps({'checks': checks, 'event_counts': [len(row['events']) for row in phases]}), flush=True)
assert result['pass'], 'Actual AI observations failed; native STOP already executed.'
