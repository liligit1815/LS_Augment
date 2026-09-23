"""Measure all real fan levels through the module's visible dialog."""
import json
import sys
import time

from adb_regression import OUTPUT
from fan_device_helpers import open_module, sample, texts
from module_ui_helpers import hierarchy, tap

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists(), 'Keep prior evidence; use a fresh stage'
open_module(stage)
before = sample()
assert before['enable'] == 1 and before['rpm'] > 0
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
tap(stage + '-request', '检测本机风扇转速')
tap(stage + '-begin', '开始检测')
start = time.monotonic()
rows = []
shown_levels = set()
completed = False
request_time = None
try:
    while time.monotonic() - start < 110:
        after = sample()
        after['elapsed'] = round(time.monotonic() - start, 2)
        rows.append(after)
        (out / 'observations.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')
        state = after['diagnostics'].get('ls_augment_fan_control_active', '')
        print({k: after[k] for k in ['elapsed', 'enable', 'level', 'rpm', 'batteryTenthsC']} | {'state': state}, flush=True)
        request = after['settings']['ls_augment_fan_calibration_request']
        if request:
            request_time = int(request.split(':')[0])
        data = after['settings']['ls_augment_fan_measurement']
        # The provider atomically clears the consumed request when saving data.
        completed = bool(data and request_time and int(data.split('|')[2]) >= request_time)
        if completed:
            break
        if state.startswith('measuring;') and after['level'] not in shown_levels:
            shown_levels.add(after['level'])
            hierarchy(stage + '-level' + str(after['level']))
        assert after['enable'] == 1 and after['batteryTenthsC'] < 500
        assert not state.startswith('locked;'), state
        time.sleep(.5)
    assert completed, 'Actual fan measurement did not complete'
    time.sleep(2)
    root = hierarchy(stage + '-completed-dialog')
    dialog_complete = any('检测完成，已恢复原厂档位' in t for t in texts(root))
    after = sample()
    parsed = after['settings']['ls_augment_fan_measurement'].split('|')
    levels = [list(map(int, p.split(','))) for p in parsed[3:]]
    restored = all(after[k] == before[k] for k in ['enable', 'level', 'manual', 'mode'])
    result = {'case': 'Actual-five-level-fan-calibration', 'dialogComplete': dialog_complete,
              'allFiveLevelsObserved': shown_levels == {1, 2, 3, 4, 5},
              'levelsMedianPeak': levels, 'originalNativeStateRestored': restored,
              'durationSeconds': rows[-1]['elapsed'], 'after': after}
    result['pass'] = dialog_complete and result['allFiveLevelsObserved'] and restored and len(levels) == 5
    (out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print({k: v for k, v in result.items() if k != 'after'}, flush=True)
    assert result['pass']
    tap(stage + '-close', '完成')
    hierarchy(stage + '-measured-page')
finally:
    if not completed:
        # The actual cancellation action must run even if an assertion failed.
        root = hierarchy(stage + '-abort-dialog')
        if '取消' in texts(root):
            tap(stage + '-abort', '取消')
        time.sleep(2)
        (out / 'abort-state.json').write_text(json.dumps(sample(), ensure_ascii=False, indent=2), encoding='utf-8')
