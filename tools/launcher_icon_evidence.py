"""Compare actual launcher screenshots with the saved custom image pixels.

Text labels alone do not prove that a custom image survived a restart. This
check locates an image signature only inside its matching Android text node;
it does not infer the icon's size from a possibly repetitive test pattern.
"""
from pathlib import Path
import json
import re
import xml.etree.ElementTree as ET

import cv2
import numpy as np


def read_image(path):
    value = cv2.imdecode(np.fromfile(Path(path), dtype=np.uint8), cv2.IMREAD_COLOR)
    if value is None:
        raise ValueError('Unreadable evidence image: ' + str(path))
    return value


def compare_images(folder, references):
    folder = Path(folder)
    screen = read_image(folder / 'screen.png')
    root = ET.fromstring((folder / 'window.xml').read_bytes())
    checks = []
    for label, reference in references.items():
        found = [n for n in root.iter('node') if n.get('text') == label
                 and n.get('visible-to-user') == 'true']
        check = {'label': label, 'reference': str(reference), 'pass': False}
        if len(found) != 1:
            check['reason'] = 'Expected exactly one visible label'
            checks.append(check)
            continue
        bounds = list(map(int, re.findall(r'-?\d+', found[0].get('bounds', ''))))
        left, top, right, bottom = bounds
        area = screen[max(0, top):bottom, max(0, left):right]
        original = read_image(reference)
        best = None
        for size in range(120, min(260, area.shape[0], area.shape[1]) + 1):
            scaled = cv2.resize(original, (size, size), interpolation=cv2.INTER_LINEAR)
            score = cv2.matchTemplate(area, scaled, cv2.TM_SQDIFF_NORMED)
            value, _, point, _ = cv2.minMaxLoc(score)
            if best is None or value < best['normalizedSquaredError']:
                x, y = point
                pixels = area[y:y + size, x:x + size].astype(float)
                best = {'normalizedSquaredError': value,
                        'meanAbsoluteError': float(np.abs(pixels - scaled).mean()),
                        'matchedRegion': [x + left, y + top, size, size]}
        check.update({'nodeBounds': bounds, 'comparison': best,
                      'pass': best is not None and best['normalizedSquaredError'] < .015
                              and best['meanAbsoluteError'] < 8})
        checks.append(check)
    report = {'checks': checks, 'pass': all(c['pass'] for c in checks),
              'scope': 'Saved custom-image signature inside actual visible launcher nodes; visual review remains required.'}
    (folder / 'custom-image-comparison.json').write_text(
        json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    return report
