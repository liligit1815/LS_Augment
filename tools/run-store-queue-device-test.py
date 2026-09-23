"""Resume three owned real store downloads briefly, observe byte progress, then pause."""
import json
import sys
import time
from adb_regression import OUTPUT, shell, snapshot
from module_ui_helpers import tap
from launcher_icon_device_helpers import saved
from store_device_helpers import new_downloads

stage, limit = sys.argv[1], int(sys.argv[2])
out = OUTPUT / (stage + '-queue-results')
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists(), 'Preserve the previous result'
before = new_downloads(stage + '-before')
assert len(before) == 3 and all(r['status'] == 'STATUS_PAUSE' for r in before)
initial = {r['_id']: r['current_size'] for r in before}
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
observations = []
tap(stage + '-resume-all', '全部继续')
try:
    start = time.monotonic()
    while time.monotonic() - start < 15:
        rows = new_downloads(stage + '-sample' + str(len(observations)))
        observations.append({'elapsed': round(time.monotonic() - start, 2), 'downloads': rows})
        if any(r['current_size'] > r['total_size'] * .6 for r in rows):
            break
        time.sleep(2)
    snapshot(stage + '-active-screen', False)
finally:
    tap(stage + '-pause-all', '全部暂停')
time.sleep(.5)
after = new_downloads(stage + '-paused')
growing = [r['package_name'] for r in after if r['current_size'] > initial[r['_id']]]
observed = max(sum(r['status'] == 'STATUS_DOWNLOADING' for r in x['downloads']) for x in observations)
expected = min(3, limit)
result = {'case': 'Real-native-download-queue', 'requestedLimit': limit,
          'pass': len(growing) == expected and observed == expected
                  and all(r['status'] == 'STATUS_PAUSE' for r in after),
          'growingPackages': growing, 'maxSimultaneousDownloading': observed,
          'settings': {'enabled': saved('store_download_enabled'), 'count': saved('store_download_count')},
          'before': before, 'after': after, 'observations': observations}
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print({k: v for k, v in result.items() if k not in ('before', 'after', 'observations')}, flush=True)
assert result['pass']
