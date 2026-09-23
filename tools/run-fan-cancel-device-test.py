"""Cancel an actual measurement after the hardware has changed to level 1."""
import json
import sys
import time

from adb_regression import OUTPUT
from fan_device_helpers import native_enabled, open_module, sample, texts
from module_ui_helpers import hierarchy, tap

stage = sys.argv[1]
out = OUTPUT / stage
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
native_enabled(stage + '-native-on', True)
open_module(stage)
before = sample()
tap(stage + '-request', '检测本机风扇转速')
tap(stage + '-start', '开始检测')
rows = []
for _ in range(14):
    running = sample()
    rows.append(running)
    if running['level'] == 1 and running['settings']['ls_augment_fan_calibration_request']:
        break
    time.sleep(.5)
assert running['level'] == 1
hierarchy(stage + '-running')
tap(stage + '-cancel', '取消')
for _ in range(14):
    after = sample()
    rows.append(after)
    if after['level'] == before['level'] and not after['settings']['ls_augment_fan_calibration_request']:
        break
    time.sleep(.5)
root = hierarchy(stage + '-returned')
result = {'case': 'Actual-calibration-cancel', 'requestCleared': not after['settings']['ls_augment_fan_calibration_request'],
          'oldMeasurementRetained': after['settings']['ls_augment_fan_measurement'] == before['settings']['ls_augment_fan_measurement'],
          'originalNativeStateRestored': all(after[k] == before[k] for k in ['enable', 'level', 'mode', 'manual']),
          'dialogClosed': '开始检测' not in texts(root), 'before': before, 'after': after, 'observations': rows}
result['pass'] = all(result[k] for k in ['requestCleared', 'oldMeasurementRetained', 'originalNativeStateRestored', 'dialogClosed'])
(out / 'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
print({k: v for k, v in result.items() if k not in ('before', 'after', 'observations')}, flush=True)
assert result['pass']
