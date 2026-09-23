"""Measure retained numbered OEM preview marks from the native screen recording."""
import argparse
import json
from pathlib import Path
import cv2
import numpy as np

parser = argparse.ArgumentParser()
parser.add_argument('folder')
parser.add_argument('rate', type=float)
args = parser.parse_args()
folder = Path(args.folder)
video = cv2.VideoCapture(str(folder / 'native-preview.mp4'))
assert video.isOpened() and int(video.get(3)) == 2688 and int(video.get(4)) == 1216
previous = [None, None]
changes = []
frames = []
index = 0
while True:
    ok, frame = video.read()
    if not ok:
        break
    at = video.get(cv2.CAP_PROP_POS_MSEC)
    evidence = []
    for target, x in enumerate([691, 1996]):
        patch = frame[550:652, x - 53:x + 53]
        red = int(((patch[:, :, 2] > 205) & (patch[:, :, 1] < 70) & (patch[:, :, 0] < 145)).sum())
        glyph = frame[577:625, x - 18:x + 18]
        white = np.min(glyph, axis=2) > 190
        changed = int(np.logical_xor(white, previous[target]).sum()) if previous[target] is not None else None
        if red > 1000 and (previous[target] is None or changed > 45):
            changes.append({'frame': index, 'timeMs': at, 'target': target, 'glyphChangedPixels': changed})
            cv2.imwrite(str(folder / ('numbered-mark-' + str(len(changes)) + '.png')), frame)
            previous[target] = white
        evidence.append({'redPixels': red, 'glyphChangedPixels': changed})
    frames.append({'frame': index, 'timeMs': at, 'targets': evidence})
    index += 1
video.release()
span = changes[-1]['timeMs'] - changes[0]['timeMs'] if len(changes) > 1 else None
expected = 5741 / args.rate
passed = (len(changes) == 4 and [c['target'] for c in changes] == [0, 1, 0, 1]
          and span is not None and abs(span - expected) <= max(65, expected * .05))
report = {'method': 'Actual numbered-mark pixel changes with variable-frame-rate video timestamps',
          'rate': args.rate, 'marks': changes, 'spanMs': span, 'expectedSpanMs': expected, 'pass': passed}
(folder / 'pixel-observations.json').write_text(json.dumps(frames, indent=2), encoding='utf-8')
(folder / 'preview-results.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
print(json.dumps(report))
assert passed, 'Inspect actual video and mark images before classifying a feature failure'
