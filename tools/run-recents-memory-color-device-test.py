"""Capture native memory colors under actual system light/dark changes."""
import json
import re
import time
from collections import Counter
from PIL import Image
from adb_regression import OUTPUT, instrument, shell
from recents_device_helpers import overview

out = OUTPUT / 'round40i-memory-colors'
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
before = shell('cmd uimode night')
results = []
try:
    for mode, night in [(2, 'no'), (2, 'yes'), (1, 'no'), (1, 'yes')]:
        label = f'round40i-mode{mode}-night{night}'
        shell('cmd uimode night ' + night)
        instrument('set', label + '-config', {
            'ls_augment_rm_recents_memory_style': '0',
            'ls_augment_rm_recents_memory_content': '4',
            'ls_augment_rm_recents_memory_portrait_top': '30',
            'ls_augment_rm_recents_memory_color_mode': str(mode),
            'ls_augment_rm_recents_memory_light_color': '#FFFF00FF',
            'ls_augment_rm_recents_memory_dark_color': '#FF00FF00',
        })
        time.sleep(1)
        _, result = overview(label)
        assert len(result['memory']) == 1
        node = result['memory'][0]
        bounds = list(map(int, re.findall(r'\d+', node['bounds'])))
        im = Image.open(OUTPUT / label / 'screen.png').convert('RGB').crop(bounds)
        counts = Counter(im.getdata())
        dominant = counts.most_common(12)
        color_pixels = sum(n for (r, g, b), n in counts.items()
                           if (r > g + 60 and b > g + 60) if mode == 2 and night == 'no') if mode == 2 and night == 'no' else 0
        if mode == 2 and night == 'yes':
            color_pixels = sum(n for (r, g, b), n in counts.items() if g > r + 60 and g > b + 60)
        if mode == 2:
            assert color_pixels > 300, (label, color_pixels, dominant)
        results.append({'mode': mode, 'night': night, 'text': node['text'],
                        'bounds': bounds, 'dominantPixels': dominant,
                        'customColorPixels': color_pixels,
                        'visualReviewRequired': mode == 1})
        (out / 'progress.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
finally:
    assert before.strip() == 'Night mode: no', before
    shell('cmd uimode night no')
(out / 'results.json').write_text(json.dumps({'before': before, 'restoredNight': shell('cmd uimode night'),
                                             'cases': results}, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(results, ensure_ascii=False), flush=True)
