"""Verify the real slider against actual driver levels/RPM and OEM restore behavior."""
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
native_enabled(stage + '-native-on', True)
open_module(stage)
before = sample()
assert before['mode'] == 1 and before['level'] == 2
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
data = before['settings']['ls_augment_fan_measurement'].split('|')
medians = [int(part.split(',')[0]) for part in data[3:]]
assert len(medians) == 5
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
cases = []
completed = False


def verify(name, predicate):
    observations = []
    streak = 0
    deadline = time.monotonic() + 25
    while time.monotonic() < deadline:
        value = sample()
        observations.append(value)
        streak = streak + 1 if predicate(value) else 0
        if streak >= 2:
            break
        time.sleep(.6)
    result = {'name': name, 'pass': streak >= 2, 'after': value, 'observations': observations}
    cases.append(result)
    (out / 'cases.json').write_text(json.dumps(cases, ensure_ascii=False, indent=2), encoding='utf-8')
    print({'case': name, 'pass': result['pass'], 'level': value['level'], 'rpm': value['rpm'],
           'target': value['settings']['ls_augment_fan_target_rpm']}, flush=True)
    assert result['pass'], name + ': inspect ' + str(out / 'cases.json')
    hierarchy(stage + '-' + name)


def fixed(value, endpoint=None):
    config = value['settings']
    target = int(config['ls_augment_fan_target_rpm'])
    expected = min(range(4), key=lambda i: abs(target - medians[i])) + 1
    return (config['ls_augment_fan_fixed_enabled'] == '1'
            and (endpoint is None or target == endpoint)
            and value['level'] == expected and value['enable'] == 1
            and abs(value['rpm'] - medians[expected - 1]) <= medians[expected - 1] * .15
            and 'kind=fixed;' in value['diagnostics'].get('ls_augment_fan_control_active', ''))


try:
    tap(stage + '-fixed-on', '固定风扇转速')
    verify('saved-target', fixed)
    select_target(stage + '-middle-before-minimum-touch', .55)
    verify('middle-before-minimum', lambda v: fixed(v) and v['level'] == 3)
    select_target(stage + '-minimum-touch', 0)
    verify('minimum', lambda v: fixed(v, medians[0]))
    select_target(stage + '-middle-touch', .55)
    verify('middle', fixed)
    select_target(stage + '-maximum-touch', 1)
    verify('maximum-limited-to4', lambda v: fixed(v, medians[4]) and v['level'] == 4)
    tap(stage + '-unlock-on', '解除原厂极限转速限制')
    verify('unlock-still-respects-balanced', lambda v: fixed(v, medians[4])
           and v['settings']['ls_augment_fan_unlock_max'] == '1' and v['level'] == 4)
    tap(stage + '-fixed-off', '固定风扇转速')
    verify('fixed-off-restores-native', lambda v: v['settings']['ls_augment_fan_fixed_enabled'] == '0'
           and v['level'] == before['level'] and v['enable'] == 1)
    tap(stage + '-unlock-off', '解除原厂极限转速限制')
    verify('both-off-native', lambda v: v['settings']['ls_augment_fan_unlock_max'] == '0'
           and v['level'] == before['level'] and v['enable'] == 1)
    completed = True
    result = {'case': 'Real-slider-level-RPM-and-native-restoration', 'pass': True,
              'cases': cases, 'measuredMedians': medians}
    (out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
finally:
    if not completed:
        instrument('set', stage + '-failure-disable', {'ls_augment_fan_fixed_enabled': '0',
                                                       'ls_augment_fan_unlock_max': '0'})
        native_enabled(stage + '-failure-native-off', False)
