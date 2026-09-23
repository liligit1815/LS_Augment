"""Verify a scheduled tiny plan and native upload without opening health UI."""
import json
import argparse
import re
import sqlite3
import sys
import time
from datetime import datetime
from adb_regression import OUTPUT, shell
from health_device_helpers import diagnostics, plan_events, databases

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('stage')
parser.add_argument('--upload-deadline', help='Actual native sync interval deadline, in ISO format')
args = parser.parse_args()
stage = args.stage
meta = json.loads((OUTPUT / (stage + '-background-plan/before-private.json')).read_text(encoding='utf-8'))
out = OUTPUT / (stage + '-background-outcome')
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
due = int(datetime.fromisoformat(meta['due']).timestamp())
deadline = int(datetime.fromisoformat(args.upload_deadline).timestamp()) if args.upload_deadline else due + 300
assert deadline >= due + 95
observations = []
last_print = 0
first_admitted = None
last_state = None
while True:
    events = plan_events(stage + '-ledger-' + str(len(observations)), meta['planId'])
    d = diagnostics(stage + '-background-outcome')
    now_ms = int(shell('date +%s%3N'))
    admitted = sum(e['steps'] for e in events if e['admitted'])
    runtime = d.get('ls_augment_health_runtime', '')
    pending = re.search(r'待同步 (\d+) 段', runtime)
    activity = shell('dumpsys activity processes')
    health = [b for b in re.split(r'(?=  \*APP\*)', activity) if re.search(r'^  \*APP\*.*com.mi.health', b)]
    row = {'phoneMs': now_ms, 'secondsAfterDue': round(now_ms / 1000 - due, 1),
           'events': events, 'admittedSteps': admitted, 'pendingUploads': int(pending[1]) if pending else None,
           'heartbeatAgeMs': now_ms - int(d.get('ls_augment_health_heartbeat', '0')),
           'unfrozen': bool(health) and all('isFrozen=true' not in b for b in health),
           'healthProcesses': ['\n'.join(l for l in b.splitlines() if any(s in l for s in
               ('*APP*', 'oom adj:', 'curProcState=', 'cached=', 'isFrozen='))) for b in health]}
    if admitted == 3 and first_admitted is None:
        first_admitted = now_ms
        execution = {'planId': meta['planId'], 'admittedSteps': admitted,
                     'secondsAfterDue': row['secondsAfterDue'], 'healthUiOpened': False,
                     'pass': now_ms <= (due + 100) * 1000,
                     'uploadPending': row['pendingUploads'], 'uploadDeadline': args.upload_deadline}
        (out / 'execution-result.json').write_text(json.dumps(execution, ensure_ascii=False, indent=2), encoding='utf-8')
    observations.append(row)
    (out / 'observations.json').write_text(json.dumps(observations, ensure_ascii=False, indent=2), encoding='utf-8')
    current_state = (admitted, row['pendingUploads'], row['unfrozen'], row['heartbeatAgeMs'] < 90000)
    if current_state != last_state or now_ms - last_print >= 60000:
        print(json.dumps(row, ensure_ascii=False), flush=True)
        last_print = now_ms
        last_state = current_state
    if admitted == 3 and row['pendingUploads'] == 0 or now_ms >= deadline * 1000:
        break
    time.sleep(15)
paths, _ = databases(stage + '-background-native-records')
c = sqlite3.connect(paths['fitness_data'].as_uri() + '?mode=ro', uri=True)
native = [{'time': r[0], 'steps': json.loads(r[1]).get('steps'), 'uploaded': r[2], 'deleted': r[3]}
          for r in c.execute("select time,value,isUpload,isDeleted from step_record where key='steps' and time>=? and time<?", (due, due + 60))]
c.close()
result = {'case': 'Real-cold-boot-background-plan-and-native-upload', 'planId': meta['planId'],
          'pass': admitted == 3 and len(native) == 1 and native[0]['steps'] == 3 and native[0]['uploaded'] == 1 and native[0]['deleted'] == 0,
          'nativeRows': native, 'last': row, 'healthUiOpened': False,
          'firstAdmittedPhoneMs': first_admitted, 'uploadDeadline': args.upload_deadline,
          'timing': 'Actual device clock and app workers; no forced scheduler or sensor calls.'}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(result, ensure_ascii=False), flush=True)
