"""Exercise clock typography against actual status-bar pixels on the connected phone."""
import json
import time
import numpy as np
from PIL import Image
from statusbar_device_helpers import *

folder = OUTPUT / 'round14d-clock-style-results'
folder.mkdir(exist_ok=True)
results = []

def sample(name, values):
    configure('round14d-' + name, values)
    observed = observe('round14d-' + name)
    image = np.array(Image.open(OUTPUT / ('round14d-' + name) / 'screen.png').convert('RGB'))[:260]
    mask = image.max(axis=2) < 180
    y, x = np.where(mask)
    item = {'case': name, 'text': clock(observed)['text'], 'window': observed['window'],
            'ink': [int(x.min()), int(y.min()), int(x.max()) + 1, int(y.max()) + 1],
            'pixels': int(mask.sum()), 'result': 'observed'}
    results.append(item)
    (folder / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    print(name, item['text'], item['ink'], flush=True)
    return item

def passed(item, condition, detail):
    item['result'] = 'pass' if condition else 'failed'
    item['check'] = detail
    (folder / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    assert condition, item

base = sample('base', {'systemui_master': 1, 'statusbar_grid_v2': grid({'clock': {'zone': 'CS'}}, only=['clock']),
        'statusbar_height_dp': 80, 'statusbar_clock_custom': 1, 'statusbar_clock_rows': 1,
        'statusbar_clock_pattern': "'Mi1W'", 'statusbar_clock_pattern_second': '',
        'statusbar_clock_size_sp': 0, 'statusbar_clock_font_family': 'sans-serif',
        'statusbar_clock_weight': 400, 'statusbar_clock_letter_spacing': 0,
        'statusbar_clock_line_spacing_dp': 0, 'statusbar_clock_width_dp': 0,
        'statusbar_clock_text_align': 'center'})
passed(base, base['text'] == 'Mi1W', 'Literal clock displayed')
serif = sample('serif', {'statusbar_clock_font_family': 'serif'})
passed(serif, abs(serif['pixels'] - base['pixels']) > 30, 'Serif produces different glyph pixels')
mono = sample('monospace', {'statusbar_clock_font_family': 'monospace'})
passed(mono, abs(mono['pixels'] - serif['pixels']) > 30, 'Monospace produces different glyph pixels')
weight = sample('weight900', {'statusbar_clock_weight': 900})
passed(weight, weight['pixels'] > mono['pixels'] * 1.2, 'Heavier weight increases ink')
spacing = sample('spacing02', {'statusbar_clock_letter_spacing': 0.2})
passed(spacing, spacing['ink'][2] - spacing['ink'][0] > weight['ink'][2] - weight['ink'][0] + 10, 'Letter spacing increases actual width')
large = sample('size26', {'statusbar_clock_size_sp': 26})
small = sample('size13', {'statusbar_clock_size_sp': 13})
ratio = (large['ink'][3] - large['ink'][1]) / (small['ink'][3] - small['ink'][1])
passed(large, 1.8 < ratio < 2.2, '26 sp / 13 sp ink-height ratio = ' + str(ratio))
passed(small, abs(small['ink'][3] - small['ink'][1] - spacing['ink'][3] + spacing['ink'][1]) <= 2, '13 sp returns to the original size')
left = sample('align-left', {'statusbar_clock_width_dp': 100, 'statusbar_clock_text_align': 'left'})
center = sample('align-center', {'statusbar_clock_text_align': 'center'})
right = sample('align-right', {'statusbar_clock_text_align': 'right'})
for item in [left, center, right]:
    passed(item, left['ink'][0] + 50 < center['ink'][0] and center['ink'][0] + 50 < right['ink'][0], 'Fixed-width text follows left / center / right alignment')
lines = sample('line-gap0', {'statusbar_clock_rows': 2, 'statusbar_clock_pattern': "'A'",
        'statusbar_clock_pattern_second': "'B'", 'statusbar_clock_width_dp': 0,
        'statusbar_clock_text_align': 'center', 'statusbar_clock_letter_spacing': 0})
gap = sample('line-gap8', {'statusbar_clock_line_spacing_dp': 8})
passed(lines, lines['text'] == 'A\nB', 'Both custom rows displayed')
passed(gap, gap['text'] == 'A\nB' and gap['ink'][3] - gap['ink'][1] > lines['ink'][3] - lines['ink'][1] + 20, '8 dp line spacing adds at least 20 px on this device')
legacy = sample('legacy-ganzhi', {'statusbar_clock_rows': 1, 'statusbar_clock_size_sp': 13,
        'statusbar_clock_pattern': 'NN II N e', 'statusbar_clock_pattern_second': ''})
date = shell('date +%Y-%m-%d_%H').split('_')
assert date[0] == '2026-09-09', 'This dated actual-display oracle must be refreshed on another day'
branch = (int(date[1]) + 1) // 2 % 12
expected = '丙申 ' + '甲乙丙丁戊己庚辛壬癸'[(4 + branch) % 10] + '子丑寅卯辰巳午未申酉戌亥'[branch] + ' 七 廿八'
passed(legacy, legacy['text'] == expected, 'Matches HKO September 9 almanac and hour-stem table')
off = sample('custom-off', {'statusbar_clock_custom': 0})
passed(off, '\n' not in off['text'] and '丙申' not in off['text'], 'Disabling custom clock restores native text')
master = sample('master-off', {'systemui_master': 0})
passed(master, master['window'] == '[0,0][1216,107]', 'Disabling the master restores the native window height')
print('Clock style cases passed:', len(results))
