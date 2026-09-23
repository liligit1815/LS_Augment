"""This run's observed standard Recents entry; no forced windowing mode."""
import json
import re
import time
import xml.etree.ElementTree as ET
import numpy as np
from PIL import Image
from adb_regression import OUTPUT, adb, shell, snapshot
from freeform_device_helpers import observe

def enter(number, label, launch=True):
    package = 'ls.augment.regression.window' + str(number)
    if launch:
        result = shell('am start -W -n ' + package + '/ls.augment.regression.ProbeActivity')
        assert 'Status: ok' in result, result
        time.sleep(.4)
        shell('input keyevent 187')
        time.sleep(.7)
    actions = []
    for attempt in range(5):
        folder = snapshot(label + '-recents-' + str(attempt), False)
        root = ET.fromstring((folder / 'window.xml').read_bytes())
        found = [n for n in root.iter('node') if n.get('content-desc') == 'LS ADB window-' + str(number)]
        assert len(found) == 1, len(found)
        bounds = list(map(int, re.findall(r'-?\d+', found[0].get('bounds'))))
        if bounds == [234, 532, 982, 2185]:
            break
        if (bounds[0] + bounds[2]) / 2 > 608:
            shell('input swipe 1050 1400 350 1400 400')
        else:
            shell('input swipe 300 1400 1000 1400 400')
        actions.append({'scrollFromObservedTargetBounds': bounds})
        time.sleep(.7)
    else:
        raise AssertionError('Target Recents card did not reach center')
    # The native icon was inspected on 126g. Confirm that exact control remains
    # visible here, so an absent eligibility button is never blindly tapped.
    box = (794, 395, 855, 475)
    reference = np.asarray(Image.open(OUTPUT / 'round126g-on-centered/screen.png').convert('RGB').crop(box)).astype(float)
    actual = np.asarray(Image.open(folder / 'screen.png').convert('RGB').crop(box)).astype(float)
    diff = float(np.abs(reference - actual).mean())
    assert diff < 2, ('Native small-window icon differs from observed entry', diff)
    actions.append({'tap': [824, 435], 'target': package, 'iconMeanPixelDifference': diff})
    (folder / 'action.json').write_text(json.dumps(actions, ensure_ascii=False, indent=2), encoding='utf-8')
    shell('input tap 824 435')
    time.sleep(.8)
    result = observe(label + '-result')
    (OUTPUT / (label + '-result') / 'screen.png').write_bytes(adb('exec-out', 'screencap -p'))
    return result
