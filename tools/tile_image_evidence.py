"""Find the saved transparent test shape inside the actual QS icon view."""
from pathlib import Path
import json
import re
import xml.etree.ElementTree as ET
import cv2
import numpy as np


def compare_alpha(folder, label, reference, expected=True):
    folder = Path(folder)
    root = ET.fromstring((folder / 'window.xml').read_bytes())
    tiles = [n for n in root.iter('node') if n.get('visible-to-user') == 'true'
             and n.get('content-desc', '').startswith(label + '，')]
    assert len(tiles) == 1
    icons = [n for n in tiles[0].iter('node') if n.get('resource-id') == 'android:id/icon']
    assert len(icons) == 1
    box = list(map(int, re.findall(r'-?\d+', icons[0].get('bounds'))))
    screen = cv2.imdecode(np.fromfile(folder / 'screen.png', dtype=np.uint8), cv2.IMREAD_GRAYSCALE)
    source = cv2.imdecode(np.fromfile(reference, dtype=np.uint8), cv2.IMREAD_UNCHANGED)
    assert source.ndim == 3 and source.shape[2] == 4
    area = screen[box[1]:box[3], box[0]:box[2]].astype(np.float32)
    best = {'correlation': 0}
    for size in range(60, min(area.shape) + 1):
        alpha = cv2.resize(source[:, :, 3], (size, size)).astype(np.float32)
        scores = cv2.matchTemplate(area, alpha, cv2.TM_CCOEFF_NORMED)
        low, high, low_at, high_at = cv2.minMaxLoc(scores)
        correlation = max(abs(low), abs(high))
        if correlation > best['correlation']:
            best = {'correlation': correlation, 'size': size,
                    'position': low_at if abs(low) > abs(high) else high_at,
                    'polarity': 'dark' if abs(low) > abs(high) else 'light'}
    result = {'label': label, 'bounds': box, 'expectedCustomShape': expected,
              'match': best, 'pass': best['correlation'] > .90 if expected else best['correlation'] < .80,
              'scope': 'Shape comparison only; system tint is expected. Visual review accompanies this evidence.'}
    (folder / 'alpha-comparison.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    return result
