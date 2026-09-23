"""Observe actual OEM trial jobs and applied resources without changing device time."""
import json
import sys
import time
from datetime import datetime
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, shell
from theme_device_helpers import state

stage = sys.argv[1]
out = OUTPUT / (stage + '-expiry-results')
out.mkdir(exist_ok=True)
resume = '--resume' in sys.argv[2:]
assert not (out / 'results.json').exists(), 'Completed observation already exists'
assert resume or not (out / 'before.json').exists(), 'Existing observation; inspect its live handle before --resume'


def adapter_process():
    pid = int(shell('pidof com.zte.beautifyadapter'))
    for attempt in range(5):
        raw = shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)
        try:
            root = ET.fromstring(raw)
            break
        except ET.ParseError:
            if attempt == 4:
                raise
            time.sleep(.2)
    rows = []
    for node in root:
        try:
            value = json.loads(node.text or '')
        except (ValueError, TypeError):
            continue
        if value.get('process') == 'com.zte.beautifyadapter' and value.get('pid') == pid:
            rows.append(value)
    assert rows, 'No current adapter process witness'
    return max(rows, key=lambda r: r.get('snapshotAt', 0))


def calls(process):
    return next(h['callbackCalls'] for h in process['hooks'] if h['id'].endswith('.adapter_expiry_job'))


if resume:
    original = json.loads((out / 'before.json').read_text(encoding='utf-8'))
    before, baseline = original['state'], original['process']
    observations = json.loads((out / 'observations.json').read_text(encoding='utf-8'))
    now = state()
    elapsed = datetime.fromisoformat(now['at']).timestamp() - datetime.fromisoformat(before['at']).timestamp()
    (out / 'observation-resumed.json').write_text(json.dumps({'at': now['at'], 'lastObservedAt': observations[-1]['state']['at'],
        'reason': 'Previous reader terminated on partial XML while diagnostics were being saved; no trial reapplied.'}, indent=2), encoding='utf-8')
else:
    before = state()
    assert before['settings']['beautify_unlimited_trial'] == '1' and before['settings']['app_master'] == '1'
    assert before['adapter']['trial_key'] == '257'
    baseline = adapter_process()
    (out / 'before.json').write_text(json.dumps({'state': before, 'process': baseline}, ensure_ascii=False, indent=2), encoding='utf-8')
    observations, elapsed = [], 0
start = time.monotonic() - elapsed
complete_at = None
while time.monotonic() - start < 480:
    value = state()
    process = adapter_process()
    same = (value['selection'] == before['selection'] and value['wallpapers'] == before['wallpapers']
            and value['adapter']['trial_key'] == '257')
    row = {'elapsed': round(time.monotonic() - start, 2), 'state': value,
           'pid': process['pid'], 'expiryCalls': calls(process), 'appliedResourcesRetained': same}
    observations.append(row)
    (out / 'observations.json').write_text(json.dumps(observations, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({k: v for k, v in row.items() if k != 'state'}), flush=True)
    if not same:
        raise AssertionError('Trial resources changed; observation retained')
    if calls(process) >= calls(baseline) + 2 and complete_at is None:
        complete_at = time.monotonic()
    if complete_at is not None and time.monotonic() - complete_at >= 45:
        break
    time.sleep(10)
else:
    raise AssertionError('Both actual expiry callbacks not observed within bounded wait')
jobs = shell('dumpsys jobscheduler')
(out / 'jobs-after.txt').write_text(jobs, encoding='utf-8')
(out / 'configuration-after.txt').write_text(shell('dumpsys activity activities'), encoding='utf-8')
result = {'case': 'Real-theme-and-font-trial-expiry-with-unlimited-enabled',
          'pass': same and calls(process) >= calls(baseline) + 2,
          'initialExpiryCalls': calls(baseline), 'finalExpiryCalls': calls(process),
          'observationSeconds': row['elapsed'], 'nativeMinimumLatencySeconds': 270,
          'postCallbackObservationSeconds': round(time.monotonic() - complete_at, 2),
          'before': before, 'after': value, 'currentProcess': process,
          'timing': 'Native JobScheduler ran the two jobs; no clock change or forced run.'}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps({k: v for k, v in result.items() if k not in ('before', 'after', 'currentProcess')}, ensure_ascii=False), flush=True)
