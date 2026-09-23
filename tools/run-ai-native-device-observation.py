"""Run the owned native AI policy and measure actual app input plus native engine traces."""
import argparse
import collections
import json
import re
import statistics
import time
from pathlib import Path

from game_device_helpers import PACKAGE, COMPONENT, capture, input_events
from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs

parser = argparse.ArgumentParser()
parser.add_argument('stage')
parser.add_argument('--seconds', type=float, default=12)
parser.add_argument('--expect-clicks', action='store_true')
parser.add_argument('--expect-no-clicks', action='store_true')
parser.add_argument('--scene', choices=['normal', 'hidden', 'blank', 'alternate'], default='normal')
args = parser.parse_args()
out = OUTPUT / args.stage
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
shell('am start -W --activity-single-top -n ' + COMPONENT + ' --es template_mode ' + args.scene)
config = prefs('ls_augment_config_v2')
marker = max((e['now'] for e in input_events(args.stage + '-before')), default=0)
start = float(shell('date +%s.%N'))
service = 'am startservice -n com.zte.game.plugintrigger/.service.PluginTriggerService -a com.zte.game.plugintrigger.'
try:
    shell(service + 'ACTION_START --es packageName ' + PACKAGE, root=True)
    time.sleep(args.seconds)
    runningPids = {package: adb('shell', 'pidof ' + package, check=False).decode().strip()
                   for package in ['com.zte.game.plugintrigger', 'cn.nubia.gamelab']}
    (out / 'engine-pids-before-stop.json').write_text(json.dumps(runningPids), encoding='utf-8')
finally:
    shell(service + 'ACTION_STOP --es packageName ' + PACKAGE + ' --ez close_window true', root=True)
time.sleep(.6)
events = [e for e in input_events(args.stage + '-after') if e['now'] > marker]
downs = [e for e in events if e['action'] == 0]
ups = [e for e in events if e['action'] == 1]
intervals = [b['now'] - a['now'] for a, b in zip(downs, downs[1:])]
holds = [up['now'] - down['now'] for down, up in zip(downs, ups)]
raw = adb('logcat', '-d', '-v', 'epoch', '-s', 'LS_Augment_AI:I', '*:S').decode('utf-8', 'replace')
lines = [line.strip() for line in raw.splitlines()
         if re.match(r'\s*\d+\.', line) and float(line.split()[0]) >= start]
(out / 'ai-trace.txt').write_text('\n'.join(lines), encoding='utf-8')
expected = dict(line.split('=', 1) for line in Path('android/version.properties').read_text().splitlines() if '=' in line)['versionName']
current = []
for attempt in range(6):
    records = []
    for value in prefs('hook-processes').values():
        try:
            records.append(json.loads(value))
        except (ValueError, TypeError):
            pass
    current = []
    for package, pid in runningPids.items():
        current.extend(r for r in records if r.get('process') == package and str(r.get('pid')) == pid)
    if len(current) == 2:
        break
    time.sleep(1)
(out / 'current-process-builds.json').write_text(json.dumps(current, indent=2), encoding='utf-8')
checks = {
    'currentBuildInBothEngines': len(current) == 2 and all(r['moduleVersion'] == expected for r in current),
    'allInputsReachOwnedTargetB': all(e['target'] == 1 for e in events),
    'balancedDownUp': len(downs) == len(ups) and all(0 <= hold <= 1000 for hold in holds),
    'orderedTouchPairs': len(events) % 2 == 0 and all(
        events[i]['action'] == 0 and events[i + 1]['action'] == 1 for i in range(0, len(events), 2)),
}
if args.expect_clicks:
    checks['repeatedActualClicks'] = len(downs) >= 4
if args.expect_no_clicks:
    checks['noInputForNonmatchingScene'] = len(events) == 0
result = {
    'pass': all(checks.values()), **checks, 'scene': args.scene, 'durationRequestedSeconds': args.seconds,
    'config': {k: v for k, v in config.items() if k.startswith('ls_augment_ai_') or k == 'ls_augment_game_master'},
    'downCount': len(downs), 'upCount': len(ups), 'intervalMs': intervals, 'holdMs': holds,
    'medianIntervalMs': statistics.median(intervals) if intervals else None,
    'medianHoldMs': statistics.median(holds) if holds else None,
    'traceStageCounts': dict(collections.Counter(re.findall(r'thread=\S+ (\w+)', '\n'.join(lines)))),
    'diagnostics': {k: v for k, v in prefs('ls_augment_diagnostics_v2').items() if 'ai_trigger' in k},
}
(out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
capture(args.stage + '-stopped')
print(result, flush=True)
assert result['pass']
