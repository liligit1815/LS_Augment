"""Use raw ADB screenshots: am instrument changes rotation on this phone."""
import json
import time
import re
import sys
import numpy as np
from PIL import Image
from adb_regression import OUTPUT, adb, instrument, shell

stage = sys.argv[1] if len(sys.argv) > 1 else 'round40p'
assert re.fullmatch(r'[A-Za-z0-9_.-]+', stage)
out = OUTPUT / (stage + '-direction-parameters')
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
before = instrument('snapshot', stage + '-before')['settings']
instrument('set', stage + '-configuration', {
    'ls_augment_rm_recents_memory_custom': '1',
    'ls_augment_rm_recents_memory_style': '0',
    'ls_augment_rm_recents_memory_content': '4',
    'ls_augment_rm_recents_memory_color_mode': '2',
    'ls_augment_rm_recents_memory_light_color': '#FFFF00FF',
    'ls_augment_rm_recents_memory_portrait_size': '12',
    'ls_augment_rm_recents_memory_portrait_height': '65',
    'ls_augment_rm_recents_memory_portrait_top': '5',
    'ls_augment_rm_recents_memory_landscape_size': '18',
    'ls_augment_rm_recents_memory_landscape_height': '80',
    'ls_augment_rm_recents_memory_landscape_top': '20',
})
rows = []
try:
    for rotation in (0, 1, 3):
        shell('wm fixed-to-user-rotation default')
        shell('wm user-rotation lock ' + str(rotation))
        shell('am start -W --windowingMode 1 -n ls.augment.regression.window4/ls.augment.regression.ProbeActivity', root=True)
        time.sleep(.8)
        shell('input keyevent 187')
        time.sleep(2)
        folder = OUTPUT / (stage + '-rotation' + str(rotation))
        folder.mkdir(exist_ok=True)
        (folder / 'screen.png').write_bytes(adb('exec-out', 'screencap -p'))
        im = Image.open(folder / 'screen.png').convert('RGB')
        if rotation:
            im = im.rotate(90 if rotation == 1 else 270, expand=True)
        im.save(folder / 'physical-orientation.png')
        pixels = np.asarray(im).astype(np.int16)
        mask = (pixels[:, :, 0] > 200) & (pixels[:, :, 1] < 60) & (pixels[:, :, 2] > 200)
        y, x = np.where(mask)
        assert len(x) > 300
        box = [int(x.min()), int(y.min()), int(x.max() + 1), int(y.max() + 1)]
        target_y = (5 + 65 / 2) * 3.25 if rotation == 0 else (20 + 80 / 2) * 3.25
        assert abs((box[1] + box[3]) / 2 - target_y) < 12, (rotation, box, target_y)
        assert shell('settings get system user_rotation') == str(rotation)
        row = {'rotation': rotation, 'logicalImageSize': im.size, 'coloredTextPixels': len(x),
               'textBox': box, 'expectedRegionCenterY': target_y,
               'noUiObserverUsed': True, 'pass': True}
        rows.append(row)
        print(json.dumps(row), flush=True)
finally:
    shell('wm user-rotation lock 0')
    shell('settings put system accelerometer_rotation 1')
    shell('input keyevent 3')
    instrument('set', stage + '-restore-memory', {
        k: v for k, v in before.items() if k.startswith('ls_augment_rm_recents_memory_')})
portrait_width = rows[0]['textBox'][2] - rows[0]['textBox'][0]
widths = [r['textBox'][2] - r['textBox'][0] for r in rows[1:]]
assert all(1.38 < width / portrait_width < 1.62 for width in widths), (portrait_width, widths)
assert abs(widths[0] - widths[1]) <= 2
result = {'portraitFontSp': 12, 'landscapeFontSp': 18, 'actualWidthRatios': [n / portrait_width for n in widths],
          'cases': rows, 'rotationRestored': {'auto': 1, 'user': 0, 'fixed': 'default'}, 'pass': True}
(out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
print(json.dumps(result), flush=True)
