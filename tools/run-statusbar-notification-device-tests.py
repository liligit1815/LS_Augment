"""Real notification-icon count and pixel checks with six isolated fixture apps."""
import json
import re
from pathlib import Path
import numpy as np
from PIL import Image
from statusbar_device_helpers import OUTPUT, configure, observe, grid

folder = OUTPUT / 'round13b-notification-results';folder.mkdir(exist_ok=True)
results = []
cases = [
    ('shown', {'statusbar_notification_hide': '0', 'statusbar_notification_max': '20'}, 10),
    ('hidden', {'statusbar_notification_hide': '1'}, 0),
    ('shown-again', {'statusbar_notification_hide': '0'}, 10),
    ('limit3', {'statusbar_notification_max': '3'}, 3),
    ('limit1', {'statusbar_notification_max': '1'}, 1),
    ('limit20', {'statusbar_notification_max': '20'}, 10),
    ('single-row', {'statusbar_notification_two_rows': '0'}, 10),
    ('dual-row', {'statusbar_notification_two_rows': '1'}, 10),
    ('gap8', {'statusbar_dual_row_gap_dp': '8'}, 10),
    ('gap0', {'statusbar_dual_row_gap_dp': '0'}, 10),
]
for name, settings, count in cases:
    label = 'round13b-notif-' + name
    configure(label, settings)
    screen = observe(label)
    icons = [n for n in screen['nodes'] if '通知' in n.get('description', '')]
    image = np.asarray(Image.open(OUTPUT / label / 'screen.png').convert('RGB'))[:156].astype(np.int16)
    colored = int(((image.max(2) - image.min(2)) > 65).sum())
    positions = [list(map(int, re.findall(r'-?\d+', icon['bounds']))) for icon in icons]
    rows = sorted({(b[1], b[3]) for b in positions})
    good = len(icons) == count and (colored == 0 if count == 0 else colored > 300)
    if name == 'single-row': good &= len(rows) == 1
    if name in ('dual-row', 'gap8', 'gap0'): good &= len(rows) == 2
    if name == 'gap8': good &= rows[1][0] - rows[0][1] == 26
    if name == 'gap0': good &= rows[1][0] == rows[0][1]
    results.append({'case': name, 'pass': bool(good), 'iconCount': len(icons), 'coloredPixels': colored, 'rows': rows})
    (folder / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(results[-1]), flush=True)
    assert good, name
