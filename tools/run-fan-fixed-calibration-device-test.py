"""Calibrate during real fixed-speed control, observe native restoration, then resume control."""
import json
import sys
import threading
import time

from adb_regression import OUTPUT, instrument, shell
from fan_device_helpers import native_enabled, open_module, sample, select_target, texts
from module_ui_helpers import hierarchy, tap

stage = sys.argv[1]
cancel_mode = '--cancel' in sys.argv[2:]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists()
native_enabled(stage + '-native-on', True)
open_module(stage)
before = sample()
assert (before['level'], before['mode']) == (2, 1)
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
rows = []
hardware = []
stop = threading.Event()
thread = None
completed = False


def record_hardware():
    while not stop.is_set():
        try:
            values = shell('cat /sys/kernel/fan/fan_enable /sys/kernel/fan/fan_speed_level /sys/kernel/fan/fan_speed_count', root=True)
            hardware.append({'at': time.monotonic(), 'values': list(map(int, values.splitlines()))})
        except Exception as error:
            hardware.append({'at': time.monotonic(), 'error': str(error)})
        stop.wait(.12)


def wait_fixed():
    for _ in range(25):
        value = sample()
        diagnostic = value['diagnostics'].get('ls_augment_fan_control_active', '')
        if value['level'] == 3 and 'kind=fixed;' in diagnostic and ';restore_level=2;' in diagnostic:
            return value
        time.sleep(.5)
    raise AssertionError('Actual fixed level 3 with captured native level 2 not reached')


try:
    tap(stage + '-fixed-on', '固定风扇转速')
    select_target(stage + '-middle-touch', .55)
    controlled = wait_fixed()
    (out / 'controlled-before.json').write_text(json.dumps(controlled, ensure_ascii=False, indent=2), encoding='utf-8')
    thread = threading.Thread(target=record_hardware, daemon=True)
    thread.start()
    tap(stage + '-request', '检测本机风扇转速')
    tap(stage + '-begin', '开始检测')
    started = time.monotonic()
    request_time = None
    shown_levels = set()
    while time.monotonic() - started < 115:
        value = sample()
        value['monotonic'] = time.monotonic()
        value['elapsed'] = round(value['monotonic'] - started, 2)
        rows.append(value)
        (out / 'observations.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')
        request = value['settings']['ls_augment_fan_calibration_request']
        if request:
            request_time = int(request.split(':')[0])
        data = value['settings']['ls_augment_fan_measurement']
        finished = bool(request_time and data and int(data.split('|')[2]) >= request_time)
        diagnostic = value['diagnostics'].get('ls_augment_fan_control_active', '')
        print({'elapsed': value['elapsed'], 'level': value['level'], 'rpm': value['rpm'], 'state': diagnostic}, flush=True)
        if cancel_mode and diagnostic.startswith('measuring;level=1;'):
            tap(stage + '-actual-cancel', '取消')
            finished = True
            break
        if finished:
            break
        if diagnostic.startswith('measuring;') and value['level'] not in shown_levels:
            shown_levels.add(value['level'])
            hierarchy(stage + '-level' + str(value['level']))
        assert not diagnostic.startswith('locked;'), diagnostic
        assert value['enable'] == 1 and value['batteryTenthsC'] < 500
        time.sleep(.35)
    assert finished, 'Five real levels did not finish'
    root = hierarchy(stage + '-completed-dialog')
    resumed = wait_fixed()
    stop.set()
    thread.join(5)
    # Native restoration must really occur after the level-5 samples and before
    # the fixed controller reclaims level 3; a completion string alone is insufficient.
    last_test_level = 1 if cancel_mode else 5
    max_times = [r['at'] for r in hardware if r.get('values', [None, None])[1] == last_test_level]
    restored = bool(max_times) and any(r['at'] > max(max_times) and r.get('values', [None, None])[1] == 2 for r in hardware)
    checks = {
        'realNativeLevel2RestoredAfterMeasurement': restored,
        'fixedLevel3ResumedWithNativeRestore2': resumed['level'] == 3,
        'requestCleared': not resumed['settings']['ls_augment_fan_calibration_request'],
    }
    if cancel_mode:
        checks['oldMeasurementRetained'] = resumed['settings']['ls_augment_fan_measurement'] == before['settings']['ls_augment_fan_measurement']
        checks['originalDialogClosed'] = '开始检测' not in texts(root) and '取消' not in texts(root)
    else:
        checks['allFiveMeasuredLevelsObserved'] = shown_levels == {1, 2, 3, 4, 5}
        checks['originalDialogCompleted'] = any('检测完成，已恢复原厂档位' in t for t in texts(root))
        tap(stage + '-close', '完成')
    tap(stage + '-fixed-off', '固定风扇转速')
    for _ in range(20):
        after = sample()
        if after['level'] == 2:
            break
        time.sleep(.5)
    checks['fixedOffRestoresOriginalNative2'] = all(after[k] == before[k] for k in ['enable', 'level', 'manual', 'mode'])
    result = {'case': 'Actual-calibration-during-fixed-control', 'cancelMode': cancel_mode, 'pass': all(checks.values()),
              **checks, 'after': after, 'resumed': resumed, 'durationSeconds': rows[-1]['elapsed']}
    (out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print({'pass': result['pass'], **checks}, flush=True)
    assert result['pass']
    completed = True
finally:
    stop.set()
    if thread:
        thread.join(5)
    (out / 'hardware-trace.json').write_text(json.dumps(hardware, indent=2), encoding='utf-8')
    if not completed:
        root = hierarchy(stage + '-abort-dialog')
        if '取消' in texts(root):
            tap(stage + '-abort', '取消')
        instrument('set', stage + '-failure-disable', {'ls_augment_fan_fixed_enabled': '0', 'ls_augment_fan_unlock_max': '0'})
        native_enabled(stage + '-failure-off', False)
