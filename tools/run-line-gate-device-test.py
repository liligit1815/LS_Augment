"""Use the actual module switch to restore/re-enable OEM line eligibility."""
import json
import sys
import time
import numpy as np
from PIL import Image
from adb_regression import OUTPUT, shell
from fan_device_helpers import prefs
from module_ui_helpers import hierarchy, visible, tap_node
from game_device_helpers import capture

stage = sys.argv[1]
out = OUTPUT / stage; out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
baseline_enabled = shell('settings get global gamehelperline_enable_pkgs').strip()
assert 'com.tencent.tmgp.sgame' in baseline_enabled
phases = []
for i, enabled in enumerate([False, True, False, True]):
    label = stage + '-' + str(i) + ('-on' if enabled else '-off')
    shell('am start -W -f 0x10008000 -n ls.augment.com/.FeatureActivity --es module shoulder', root=True)
    root = hierarchy(label + '-page')
    switches = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.Switch'
                and n.get('content-desc') == '全应用肩键']
    assert len(switches) == 1
    if (switches[0].get('checked') == 'true') != enabled:
        tap_node(label + '-switch', switches[0])
    time.sleep(1.5)
    config = prefs('ls_augment_config_v2')
    assert config['ls_augment_shoulder_enabled'] == ('1' if enabled else '0')
    shell('am start -W -n com.tencent.tmgp.sgame/.SGameActivity')
    time.sleep(4)
    capture(label + '-actual')
    pixels = np.asarray(Image.open(OUTPUT / (label + '-actual') / 'screen.png').convert('RGB')).astype(np.int32)
    yy, xx = np.indices(pixels.shape[:2]); radius = np.sqrt((xx - 1145)**2 + (yy - 657)**2)
    green = (pixels[:,:,1] > pixels[:,:,0] * 1.7 + 10) & (pixels[:,:,1] > pixels[:,:,2] * 1.7 + 10)
    count = int(np.sum(green & (pixels[:,:,1] > 30) & (radius > 358) & (radius < 384)))
    native = shell('settings get global gamehelperline_enable_pkgs').strip()
    record = {'enabled': enabled, 'greenStrokePixels': count, 'nativeEnabledPreserved': native == baseline_enabled}
    record['pass'] = record['nativeEnabledPreserved'] and (count > 1000 if enabled else count < 10)
    phases.append(record)
    (out / 'progress.json').write_text(json.dumps(phases, indent=2), encoding='utf-8')
    print(record, flush=True)
    assert record['pass']
result = {'pass': all(p['pass'] for p in phases), 'phases': phases}
(out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
