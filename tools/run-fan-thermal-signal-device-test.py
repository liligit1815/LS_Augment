"""Real-device OS thermal-status override; this does not claim physical heating."""
import json
import sys
import time

from adb_regression import OUTPUT, instrument, shell
from fan_device_helpers import native_enabled, open_module, sample, select_target, texts
from module_ui_helpers import hierarchy, tap

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists()
thermal = shell('dumpsys thermalservice', root=True)
assert 'IsStatusOverride: false' in thermal and 'Thermal Status: 0' in thermal
(out / 'thermal-before.txt').write_text(thermal, encoding='utf-8')
native_enabled(stage + '-on', True)
open_module(stage)
before = sample()
assert (before['level'], before['mode']) == (2, 1)
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
checks = {}
rows = []
overridden = False


def override():
    global overridden
    overridden = True
    result = shell('cmd thermalservice override-status 3', root=True)
    state = shell('dumpsys thermalservice', root=True)
    assert 'IsStatusOverride: true' in state and 'Thermal Status: 3' in state, result + state
    (out / ('thermal-overridden-' + str(len(rows)) + '.txt')).write_text(state, encoding='utf-8')


def reset():
    global overridden
    shell('cmd thermalservice reset', root=True)
    state = shell('dumpsys thermalservice', root=True)
    assert 'IsStatusOverride: false' in state and 'Thermal Status: 0' in state, state
    overridden = False
    (out / 'thermal-restored.txt').write_text(state, encoding='utf-8')


def wait_for(name, predicate):
    for _ in range(20):
        value = sample()
        rows.append({'case': name, **value})
        (out / 'observations.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')
        if predicate(value):
            return value
        time.sleep(.5)
    raise AssertionError(name + ': inspect observations.json')


try:
    tap(stage + '-fixed-on', '固定风扇转速')
    select_target(stage + '-minimum', 0)
    wait_for('fixed-active', lambda v: v['level'] == 1 and 'controlled;kind=fixed;' in v['diagnostics'].get('ls_augment_fan_control_active', ''))
    override()
    protected = wait_for('fixed-protected', lambda v: v['level'] == 2 and 'thermal_unsafe' in v['diagnostics'].get('ls_augment_fan_control_last_error', ''))
    checks['fixedReturnedNative2AtSevereSignal'] = protected['enable'] == 1 and protected['mode'] == 1
    reset()
    time.sleep(3)
    after_reset = sample()
    checks['noAutomaticReclaimAfterThermalProtection'] = after_reset['level'] == 2
    tap(stage + '-fixed-off', '固定风扇转速')
    native_enabled(stage + '-cycle-off', False)
    native_enabled(stage + '-cycle-on', True)
    open_module(stage + '-measurement')
    tap(stage + '-request', '检测本机风扇转速')
    tap(stage + '-begin', '开始检测')
    wait_for('measuring', lambda v: v['level'] == 1 and bool(v['settings']['ls_augment_fan_calibration_request']))
    override()
    wait_for('measurement-protected', lambda v: v['level'] == 2 and 'thermal_unsafe' in v['diagnostics'].get('ls_augment_fan_control_last_error', ''))
    reset()
    for i in range(6):
        root = hierarchy(stage + '-stopped-dialog' + str(i))
        actual_texts = texts(root)
        after = sample()
        stopped = any('检测已停止：温度保护生效' in text for text in actual_texts)
        if stopped and not after['settings']['ls_augment_fan_calibration_request']:
            break
        time.sleep(.5)
    checks.update({
        'measurementStoppedWithThermalMessage': stopped,
        'oldMeasurementRetained': after['settings']['ls_augment_fan_measurement'] == before['settings']['ls_augment_fan_measurement'],
        'requestCleared': not after['settings']['ls_augment_fan_calibration_request'],
        'nativeLevelRestored': after['level'] == 2 and after['enable'] == 1,
    })
    result = {'case': 'OS-thermal-signal-on-real-device', 'physicalHeating': False,
              'pass': all(checks.values()), **checks, 'after': after}
    (out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print({k: v for k, v in result.items() if k != 'after'}, flush=True)
    if '完成' in actual_texts:
        tap(stage + '-close', '完成')
    assert result['pass']
finally:
    if overridden:
        reset()
    instrument('set', stage + '-cleanup-disable', {'ls_augment_fan_fixed_enabled': '0', 'ls_augment_fan_unlock_max': '0', 'ls_augment_fan_calibration_request': ''})
    native_enabled(stage + '-cleanup-off', False)
