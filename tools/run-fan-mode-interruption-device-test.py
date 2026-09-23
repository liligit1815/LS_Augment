"""Change the actual OEM mode during calibration and retain the new native setting."""
import json
import sys
import time

from adb_regression import OUTPUT, shell
from fan_device_helpers import native_enabled, native_mode, open_module, sample, texts
from module_ui_helpers import hierarchy, tap

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists()
native_enabled(stage + '-on', True)
native_mode(stage + '-extreme', 0)
time.sleep(2)
before = sample()
assert (before['enable'], before['level'], before['mode']) == (1, 4, 0)
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
try:
    open_module(stage)
    tap(stage + '-request', '检测本机风扇转速')
    tap(stage + '-start', '开始检测')
    for _ in range(14):
        running = sample()
        if running['level'] == 1 and running['settings']['ls_augment_fan_calibration_request']:
            break
        time.sleep(.5)
    assert running['level'] == 1
    hierarchy(stage + '-running')
    native_mode(stage + '-native-balanced', 1)
    shell('am start -W --activity-reorder-to-front -n ls.augment.com/.FeatureActivity --es module fan_control', root=True)
    observations = []
    for i in range(8):
        root = hierarchy(stage + '-returned' + str(i))
        actual_texts = texts(root)
        after = sample()
        stopped = any('检测已停止：原厂风扇设置已变化' in t for t in actual_texts)
        observations.append({'state': after, 'texts': actual_texts})
        if stopped and not after['settings']['ls_augment_fan_calibration_request']:
            break
        time.sleep(1)
    checks = {
        'newNativeModeAndLevelRetained': (after['enable'], after['level'], after['mode']) == (1, 2, 1),
        'oldMeasurementRetained': after['settings']['ls_augment_fan_measurement'] == before['settings']['ls_augment_fan_measurement'],
        'requestCleared': not after['settings']['ls_augment_fan_calibration_request'],
        'originalDialogStopped': stopped,
        'noFalseProgress': not any(t.startswith('正在检测') for t in actual_texts),
    }
    result = {'case': 'Actual-native-mode-change-during-calibration', 'pass': all(checks.values()),
              **checks, 'before': before, 'after': after, 'observations': observations}
    (out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print({'pass': result['pass'], **checks}, flush=True)
    if '完成' in actual_texts:
        tap(stage + '-close', '完成')
    elif '取消' in actual_texts:
        tap(stage + '-cancel', '取消')
    assert result['pass']
finally:
    native_mode(stage + '-cleanup-balanced', 1)
    native_enabled(stage + '-cleanup-off', False)
