"""Exercise native balanced/extreme transitions, fixed priority, OFF/ON, and ownership return."""
import json
import sys
import time

from adb_regression import OUTPUT, instrument
from fan_device_helpers import native_enabled, native_mode, open_module, sample, select_target
from module_ui_helpers import hierarchy, tap

stage = sys.argv[1]
handoff_tail = '--handoff-tail' in sys.argv[2:]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists()
native_enabled(stage + '-native-on', True)
before = sample()
assert (before['enable'], before['level'], before['mode']) == (1, 2, 1)
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
cases = []
completed = False


def verify(name, predicate):
    observations = []
    streak = 0
    until = time.monotonic() + 28
    while time.monotonic() < until:
        value = sample()
        observations.append(value)
        streak = streak + 1 if predicate(value) else 0
        if streak >= 2:
            break
        time.sleep(.6)
    result = {'name': name, 'pass': streak >= 2, 'after': value, 'observations': observations}
    cases.append(result)
    (out / 'cases.json').write_text(json.dumps(cases, ensure_ascii=False, indent=2), encoding='utf-8')
    print({'case': name, 'pass': result['pass'], 'enable': value['enable'],
           'level': value['level'], 'rpm': value['rpm'], 'mode': value['mode']}, flush=True)
    assert result['pass'], name + ': inspect ' + str(out / 'cases.json')
    hierarchy(stage + '-' + name)


def controlled(value, kind, level):
    return (value['enable'] == 1 and value['level'] == level and value['rpm'] > 500
            and ('controlled;kind=' + kind + ';') in value['diagnostics'].get('ls_augment_fan_control_active', ''))


try:
    # Set up the saved maximum while both controllers are OFF. Slider effects
    # are separately exercised through the actual visible control.
    if not handoff_tail:
        maximum = before['settings']['ls_augment_fan_measurement'].split('|')[-1].split(',')[0]
        instrument('set', stage + '-maximum-setup', {'ls_augment_fan_target_rpm': maximum})
    open_module(stage + '-initial')
    tap(stage + '-unlock-on', '解除原厂极限转速限制')
    verify('balanced-keeps-native2', lambda v: v['mode'] == 1 and v['level'] == 2
           and 'waiting_for_oem_extreme' in v['diagnostics'].get('ls_augment_fan_control_active', ''))
    native_mode(stage + '-native-extreme', 0)
    verify('extreme-unlocked5', lambda v: controlled(v, 'oem_extreme', 5) and v['rpm'] > 18000
           and ';restore_level=4;' in v['diagnostics'].get('ls_augment_fan_control_active', ''))
    if not handoff_tail:
        open_module(stage + '-fixed-priority')
        tap(stage + '-fixed-on', '固定风扇转速')
        verify('fixed-maximum5', lambda v: controlled(v, 'fixed', 5))
        select_target(stage + '-minimum-touch', 0)
        verify('fixed-minimum-priority', lambda v: controlled(v, 'fixed', 1) and v['rpm'] < 6000)
        tap(stage + '-fixed-off', '固定风扇转速')
        verify('fixed-off-returns-extreme5', lambda v: controlled(v, 'oem_extreme', 5) and v['rpm'] > 18000)
        tap(stage + '-unlock-off', '解除原厂极限转速限制')
        verify('unlock-off-restores-native4', lambda v: v['level'] == 4 and v['mode'] == 0
               and v['settings']['ls_augment_fan_unlock_max'] == '0')
        tap(stage + '-cycle-unlock-on', '解除原厂极限转速限制')
        verify('cycle-enabled5', lambda v: controlled(v, 'oem_extreme', 5))
        native_enabled(stage + '-native-off', False)
        verify('native-off-restores-captured4', lambda v: v['enable'] == 0 and v['rpm'] == 0 and v['level'] == 4)
        native_enabled(stage + '-native-on', True)
        verify('new-native-session5', lambda v: controlled(v, 'oem_extreme', 5) and v['rpm'] > 18000)
    native_mode(stage + '-native-balanced', 1)
    verify('native-mode-change-keeps2', lambda v: v['mode'] == 1 and v['level'] == 2
           and 'vendor_state_changed' in v['diagnostics'].get('ls_augment_fan_control_last_error', '')
           and v['diagnostics'].get('ls_augment_fan_control_active', '').startswith('locked;'))
    open_module(stage + '-final')
    tap(stage + '-final-unlock-off', '解除原厂极限转速限制')
    verify('final-native-balanced2', lambda v: v['level'] == 2 and v['mode'] == 1
           and v['settings']['ls_augment_fan_unlock_max'] == '0')
    # The preceding native mode change locked the old session. OFF/ON must be
    # observed even when both module controls are disabled during that cycle.
    native_enabled(stage + '-disabled-cycle-off', False)
    native_enabled(stage + '-disabled-cycle-on', True)
    open_module(stage + '-new-session')
    tap(stage + '-new-session-fixed-on', '固定风扇转速')
    verify('disabled-off-on-clears-old-lock', lambda v: controlled(v, 'fixed', 1))
    tap(stage + '-new-session-fixed-off', '固定风扇转速')
    verify('new-session-off-restores2', lambda v: v['level'] == 2 and v['mode'] == 1
           and v['settings']['ls_augment_fan_fixed_enabled'] == '0')
    completed = True
    (out / 'results.json').write_text(json.dumps({'case': 'Actual-fan-native-modes-and-extreme-control',
        'pass': True, 'cases': cases}, ensure_ascii=False, indent=2), encoding='utf-8')
finally:
    if not completed:
        instrument('set', stage + '-failure-disable', {'ls_augment_fan_fixed_enabled': '0',
                                                       'ls_augment_fan_unlock_max': '0'})
        native_mode(stage + '-failure-balanced', 1)
        native_enabled(stage + '-failure-off', False)
