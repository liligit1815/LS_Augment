"""Stop a real in-progress measurement with the OEM switch and inspect its original dialog."""
import json
import sys
import time

from adb_regression import OUTPUT, shell
from fan_device_helpers import native_enabled, open_module, sample, texts
from module_ui_helpers import hierarchy, tap

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'before.json').exists()
native_enabled(stage + '-on', True)
open_module(stage)
before = sample()
assert before['settings']['ls_augment_fan_fixed_enabled'] == before['settings']['ls_augment_fan_unlock_max'] == '0'
(out / 'before.json').write_text(json.dumps(before, ensure_ascii=False, indent=2), encoding='utf-8')
tap(stage + '-request', '检测本机风扇转速')
tap(stage + '-start', '开始检测')
for _ in range(14):
    running = sample()
    if running['level'] == 1 and running['settings']['ls_augment_fan_calibration_request']:
        break
    time.sleep(.5)
assert running['level'] == 1
hierarchy(stage + '-running')
off = native_enabled(stage + '-native-off', False)
(out / 'return-activity.txt').write_text(shell(
    'am start -W --activity-reorder-to-front -n ls.augment.com/.FeatureActivity --es module fan_control',
    root=True), encoding='utf-8')
observations = []
started = time.monotonic()
for i in range(8):
    root = hierarchy(stage + '-returned' + str(i))
    actual_texts = texts(root)
    after = sample()
    stopped_message = any('检测已停止：原厂风扇已关闭' in t for t in actual_texts)
    observations.append({'state': after, 'texts': actual_texts, 'elapsed': time.monotonic() - started})
    if stopped_message and not after['settings']['ls_augment_fan_calibration_request']:
        break
    time.sleep(1)
result = {'case': 'Actual-OEM-fan-off-stops-original-measurement-dialog',
          'hardwareStopped': after['enable'] == 0 and after['rpm'] == 0,
          'capturedLevelRestored': after['level'] == before['level'],
          'oldMeasurementRetained': after['settings']['ls_augment_fan_measurement'] == before['settings']['ls_augment_fan_measurement'],
          'stoppedMessage': stopped_message,
          'noFalseProgress': not any(t.startswith('正在检测') for t in actual_texts),
          'requestCleared': not after['settings']['ls_augment_fan_calibration_request'],
          'originalRequest': running['settings']['ls_augment_fan_calibration_request'],
          'observations': observations, 'after': after}
result['pass'] = all(result[k] for k in ['hardwareStopped', 'capturedLevelRestored',
                                        'oldMeasurementRetained', 'stoppedMessage', 'noFalseProgress', 'requestCleared'])
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print({k: v for k, v in result.items() if k not in ('observations', 'after', 'originalRequest')}, flush=True)
if '完成' in actual_texts:
    tap(stage + '-close', '完成')
elif '取消' in actual_texts:
    tap(stage + '-cancel', '取消')
assert result['pass']
