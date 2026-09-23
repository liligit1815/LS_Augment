"""Repeated real slider transitions with independent hardware feedback checks."""
import json
import sys
import time

from adb_regression import OUTPUT, instrument
from fan_device_helpers import native_enabled, open_module, sample, select_target
from module_ui_helpers import hierarchy, tap

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists()
native_enabled(stage + '-on', True)
open_module(stage)
before = sample()
assert (before['level'], before['mode']) == (2, 1)
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
medians = [int(p.split(',')[0]) for p in before['settings']['ls_augment_fan_measurement'].split('|')[3:]]
assert len(medians) == 5
cases = []
complete = False
try:
    tap(stage + '-fixed-on', '固定风扇转速')
    for i, fraction in enumerate([.55, 0, 1, 0, .55, 1] * 3):
        name = 'transition-' + str(i + 1)
        select_target(stage + '-' + name, fraction)
        rows = []
        streak = 0
        deadline = time.monotonic() + 22
        while time.monotonic() < deadline:
            value = sample()
            rows.append(value)
            target = int(value['settings']['ls_augment_fan_target_rpm'])
            expected = min(range(4), key=lambda index: abs(target - medians[index])) + 1
            diagnostic = value['diagnostics'].get('ls_augment_fan_control_active', '')
            passed = (value['enable'] == 1 and value['level'] == expected
                      and abs(value['rpm'] - medians[expected - 1]) <= medians[expected - 1] * .15
                      and 'controlled;kind=fixed;' in diagnostic and ';restore_level=2;' in diagnostic
                      and not value['diagnostics'].get('ls_augment_fan_control_last_error'))
            streak = streak + 1 if passed else 0
            if streak >= 2:
                break
            time.sleep(.4)
        result = {'name': name, 'fraction': fraction, 'expectedLevel': expected,
                  'pass': streak >= 2, 'after': value, 'observations': rows}
        cases.append(result)
        (out / 'cases.json').write_text(json.dumps(cases, ensure_ascii=False, indent=2), encoding='utf-8')
        print({k: result[k] for k in ['name', 'fraction', 'expectedLevel', 'pass']} | {'rpm': value['rpm']}, flush=True)
        assert result['pass'], name + ': inspect ' + str(out / 'cases.json')
    tap(stage + '-fixed-off', '固定风扇转速')
    for _ in range(16):
        after = sample()
        if after['level'] == 2:
            break
        time.sleep(.5)
    restored = all(after[k] == before[k] for k in ['enable', 'level', 'manual', 'mode'])
    result = {'case': 'Actual-slider-repeated-transitions', 'pass': restored,
              'transitionsPassed': len(cases), 'nativeRestored': restored, 'after': after}
    (out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    hierarchy(stage + '-finished')
    assert result['pass']
    complete = True
finally:
    if not complete:
        instrument('set', stage + '-failure-disable', {'ls_augment_fan_fixed_enabled': '0', 'ls_augment_fan_unlock_max': '0'})
        native_enabled(stage + '-failure-off', False)
