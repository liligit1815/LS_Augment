"""Verify a real force-stop is respected while health features are enabled."""
import json
import re
import time
from adb_regression import OUTPUT, instrument, shell
from health_device_helpers import diagnostics, plan_events

out = OUTPUT / 'round39zc-force-stop'
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
before = json.loads((OUTPUT / 'round39zb-disabled-plan/before-private.json').read_text(encoding='utf-8'))['config']
config = {k: v for k, v in before.items() if k.startswith('ls_augment_health_')}
spec = config['ls_augment_health_plan'].split('|')
assert spec[0] == 'SP2' and spec[7] == '1' and spec[8] == '3'
assert config['ls_augment_health_multiplier'] == '100'
instrument('set', 'round39zc-reenable-completed-plan', config)
start = time.monotonic()
while True:
    d = diagnostics('round39zc-force-stop')
    if d.get('ls_augment_health_background_runtime') == '原生数据服务已连接':
        break
    assert time.monotonic() - start < 75, 'Health did not reconnect after re-enabling the completed plan'
    time.sleep(3)
before_events = plan_events('round39zc-ledger-before-stop', spec[1])
assert sum(e['steps'] for e in before_events if e['admitted']) == 3
shell('am force-stop com.mi.health')
print('Actual native health force-stop dispatched; observing at least one complete 60-second retry interval.', flush=True)
start = time.monotonic()
rows = []
while True:
    package = shell('dumpsys package com.mi.health')
    user = next(l.strip() for l in package.splitlines() if re.match(r'\s*User 0:', l))
    assert 'stopped=true' in user, user
    processes = [l for l in shell('ps -A -o PID,NAME').splitlines() if re.search(r'\scom\.mi\.health(?::\S+)?$', l)]
    assert not processes, processes
    d = diagnostics('round39zc-force-stop')
    row = {'seconds': round(time.monotonic() - start, 1), 'stopped': True, 'healthProcesses': processes,
           'backgroundStatus': d.get('ls_augment_health_background_runtime', '')}
    rows.append(row)
    (out / 'observations.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')
    if len(rows) % 3 == 1 or row['seconds'] >= 70:
        print(json.dumps(row, ensure_ascii=False), flush=True)
    if row['seconds'] >= 70:
        break
    time.sleep(15)
after = plan_events('round39zc-ledger-after-stop', spec[1])
result = {'forceStopRespected': True, 'observationSeconds': rows[-1]['seconds'],
          'sameCompletedPlanUnchanged': after == before_events, 'last': rows[-1],
          'manualReopenStillRequired': True, 'pass': after == before_events}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(result, ensure_ascii=False), flush=True)
