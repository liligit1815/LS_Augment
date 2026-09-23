"""Read the real three-step trial ledger while the health UI stays closed."""
import io
import json
import re
import shlex
import sqlite3
import sys
import tarfile
import time
from datetime import datetime
from adb_regression import OUTPUT, adb, shell
from health_device_helpers import diagnostics

stage = sys.argv[1]
out = OUTPUT / stage
before = json.loads((out / 'before-private.json').read_text(encoding='utf-8'))
plan_id = before['planId']
due_ms = int(datetime.fromisoformat(before['due']).timestamp() * 1000)
observations = []
while True:
    sample = out / ('sample-' + str(len(observations)))
    sample.mkdir(exist_ok=True)
    command = 'tar -cf - -C /data/user/0/com.mi.health/databases ls_augment_steps_v1.db ls_augment_steps_v1.db-wal ls_augment_steps_v1.db-shm'
    raw = adb('exec-out', 'su -c ' + shlex.quote(command))
    (sample / 'ledger-private.tar').write_bytes(raw)
    with tarfile.open(fileobj=io.BytesIO(raw)) as archive:
        for member in archive:
            assert member.name in ('ls_augment_steps_v1.db', 'ls_augment_steps_v1.db-wal', 'ls_augment_steps_v1.db-shm')
            (sample / member.name).write_bytes(archive.extractfile(member).read())
    c = sqlite3.connect((sample / 'ls_augment_steps_v1.db').resolve().as_uri() + '?mode=ro', uri=True)
    c.row_factory = sqlite3.Row
    events = [dict(r) for r in c.execute('select day,time,steps,admitted from events where id=? order by time', (plan_id,))]
    c.close()
    activity = shell('dumpsys activity processes')
    health = [b for b in re.split(r'(?=  \*APP\*)', activity) if re.search(r'^  \*APP\*.*com.mi.health', b)]
    (sample / 'processes-private.txt').write_text(activity, encoding='utf-8')
    d = diagnostics(stage)
    now = int(shell('date +%s%3N'))
    row = {'phoneMs': now, 'secondsAfterDue': round((now - due_ms) / 1000, 1), 'events': events,
           'allHealthProcessesFrozen': bool(health) and all('isFrozen=true' in b for b in health),
           'heartbeatAgeDeviceMs': now - int(d.get('ls_augment_health_heartbeat', '0')),
           'background': d.get('ls_augment_health_background_runtime')}
    observations.append(row)
    (out / 'observations.json').write_text(json.dumps(observations, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(row, ensure_ascii=False), flush=True)
    if now >= due_ms + 95000:
        break
    time.sleep(10)
added = sum(e['steps'] for e in events if e['admitted'])
result = {'case': 'Background-three-step-plan-on-20242', 'pass': added == 3,
          'freezeFailureReproduced': added == 0 and row['allHealthProcessesFrozen'] and row['heartbeatAgeDeviceMs'] > 90000,
          'expectedSteps': 3, 'admittedSteps': added, 'planId': plan_id, 'last': row,
          'timing': 'Original device time; no UI launch, forced scheduler callback, or sensor injection.'}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(result, ensure_ascii=False), flush=True)
