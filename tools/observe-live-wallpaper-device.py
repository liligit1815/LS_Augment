"""Observe a real live-wallpaper trial without forcing jobs or changing time."""
import json
import re
import sys
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, shell
from theme_device_helpers import state

stage, mode = sys.argv[1:3]
assert mode in ('on', 'off')
out = OUTPUT / (stage + '-live-expiry-results')
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists(), 'Inspect the existing observation first'


def process():
    pid = int(shell('pidof com.zte.beautifyadapter'))
    for attempt in range(5):
        try:
            xml = ET.fromstring(shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True))
            break
        except ET.ParseError:
            if attempt == 4:
                raise
            time.sleep(.2)
    values = []
    for node in xml:
        try:
            row = json.loads(node.text or '')
        except (ValueError, TypeError):
            continue
        if row.get('pid') == pid and row.get('process') == 'com.zte.beautifyadapter':
            values.append(row)
    assert values, 'Missing current adapter witness'
    return max(values, key=lambda r: r.get('snapshotAt', 0))


def calls(p, suffix):
    return next(h['callbackCalls'] for h in p['hooks'] if h['id'].endswith(suffix))


def current():
    value = state()
    wallpaper = shell('dumpsys wallpaper')
    value['actualWallpaperComponents'] = re.findall(r'^  mWallpaperComponent=(.+)$', wallpaper, re.M)
    return value, wallpaper


before, wallpaper = current()
baseline = process()
assert before['adapter']['trial_key'] == '16', before['adapter']
assert 'com.zte.livewallpaper/' in before['actualWallpaperComponents'][0]
assert (before['settings']['app_master'] == '1' and before['settings']['beautify_unlimited_trial'] == '1') == (mode == 'on')
(out / 'before.json').write_text(json.dumps({'state': before, 'process': baseline}, ensure_ascii=False, indent=2), encoding='utf-8')
(out / 'wallpaper-before.txt').write_text(wallpaper, encoding='utf-8')
(out / 'jobs-before.txt').write_text(shell('dumpsys jobscheduler'), encoding='utf-8')
observations = []
start = time.monotonic()
completed_at = None
while time.monotonic() - start < 480:
    value, wallpaper = current()
    p = process()
    assert p['pid'] == baseline['pid'], 'Adapter restarted; inspect before interpreting expiry'
    expired = calls(p, '.adapter_expiry_job') > calls(baseline, '.adapter_expiry_job')
    retained = (value['adapter']['trial_key'] == '16'
                and value['selection'] == before['selection']
                and value['actualWallpaperComponents'] == before['actualWallpaperComponents'])
    restored = value['adapter']['trial_key'] == '0' and 'ImageWallpaper' in value['actualWallpaperComponents'][0]
    row = {'elapsed': round(time.monotonic() - start, 2), 'state': value,
           'expiryCalls': calls(p, '.adapter_expiry_job'), 'resetCalls': calls(p, '.adapter_reset_job'),
           'retained': retained, 'restored': restored}
    observations.append(row)
    (out / 'observations.json').write_text(json.dumps(observations, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({k: v for k, v in row.items() if k != 'state'}), flush=True)
    if mode == 'on' and not retained:
        raise AssertionError('Live trial changed while unlimited was enabled')
    achieved = expired and (retained if mode == 'on' else restored)
    if achieved and completed_at is None:
        completed_at = time.monotonic()
    if not achieved:
        completed_at = None
    if completed_at is not None and time.monotonic() - completed_at >= 45:
        break
    time.sleep(10)
else:
    raise AssertionError('Expected natural expiry behavior not reached within bounded wait')
result = {'case': 'Real-live-wallpaper-natural-expiry-' + mode, 'pass': achieved,
          'before': before, 'after': value, 'currentProcess': p,
          'initialExpiryCalls': calls(baseline, '.adapter_expiry_job'),
          'finalExpiryCalls': calls(p, '.adapter_expiry_job'), 'observationSeconds': row['elapsed'],
          'postOutcomeObservationSeconds': round(time.monotonic() - completed_at, 2),
          'timing': 'Actual JobScheduler callbacks; no forced run or clock change.'}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
(out / 'wallpaper-after.txt').write_text(wallpaper, encoding='utf-8')
(out / 'jobs-after.txt').write_text(shell('dumpsys jobscheduler'), encoding='utf-8')
print(json.dumps({k: v for k, v in result.items() if k not in ('before', 'after', 'currentProcess')}, ensure_ascii=False), flush=True)
