"""Check the actual saved OEM line across real foreground app changes."""
import json
import sys
import time
import numpy as np
from PIL import Image
from adb_regression import OUTPUT, shell
from game_device_helpers import capture

stage = sys.argv[1]
out = OUTPUT / stage; out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
phases = []
for name, package in [('game-overlay', 'com.tencent.tmgp.sgame'),
                      ('non-game', 'ls.augment.regression.nongame'),
                      ('game-return', 'com.tencent.tmgp.sgame')]:
    if name != 'game-overlay':
        component = '/.SGameActivity' if package == 'com.tencent.tmgp.sgame' else '/.GameActivity'
        shell('am start -W --activity-single-top -n ' + package + component)
        time.sleep(6)
    observed = capture(stage + '-' + name)
    path = OUTPUT / (stage + '-' + name) / 'screen.png'
    pixels = np.asarray(Image.open(path).convert('RGB')).astype(np.int32)
    yy, xx = np.indices(pixels.shape[:2])
    # The saved owned line8 has center1145,657 and radius371; count its green stroke only.
    radius = np.sqrt((xx - 1145)**2 + (yy - 657)**2)
    ring = (radius > 358) & (radius < 384)
    green = (pixels[:,:,1] > pixels[:,:,0] * 1.7 + 10) & (pixels[:,:,1] > pixels[:,:,2] * 1.7 + 10)
    green &= pixels[:,:,1] > 30
    count = int(np.sum(green & ring))
    foreground = '\n'.join(x for x in shell('dumpsys activity activities').splitlines() if 'topResumedActivity' in x)
    record = {'phase': name, 'package': package, 'foreground': foreground,
              'greenStrokePixels': count,
              'nativeEnabled': shell('settings get global gamehelperline_enable_pkgs').strip(),
              'lineWindows': [{k:v for k,v in n.items() if k!='children'} for n in observed
                              if n.get('visible') and n.get('package') == 'cn.nubia.gamehelperline']}
    record['pass'] = package in foreground and (count < 10 if name == 'non-game' else count > 1000)
    phases.append(record)
    (out / 'phases.json').write_text(json.dumps(phases, indent=2), encoding='utf-8')
    print({k:v for k,v in record.items() if k!='lineWindows'}, flush=True)
result = {'pass': all(p['pass'] for p in phases), 'phases': phases}
(out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
assert result['pass']
