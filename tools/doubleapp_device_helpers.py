"""Reach the OEM clone UI through Settings and retain actual candidate lists."""
import json
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, shell, snapshot, tap
from module_ui_helpers import hierarchy, matches, visible


def native_find(label, title, up=False):
    for i in range(7):
        root = hierarchy(label + '-find' + str(i))
        if matches(root, title):
            return root
        shell('input swipe ' + ('850 1000 850 2290' if up else '850 2290 850 1000') + ' 700')
        time.sleep(.3)
    raise AssertionError('Native settings entry not found: ' + title)


def open_oem(label, restart=True):
    if restart:
        shell('am force-stop com.zte.cn.doubleapp')
    shell('am start -W -a android.settings.SETTINGS')
    native_find(label + '-apps', '应用')
    tap(label + '-apps-open', '应用')
    native_find(label + '-clones', '应用分身')
    tap(label + '-clones-open', '应用分身')
    return hierarchy(label + '-page')


def open_module(label):
    shell('am start -W -n ls.augment.com/.SettingsActivity')
    for i in range(6):
        root = hierarchy(label + '-home' + str(i))
        if matches(root, '应用增强'):
            break
        shell('input keyevent 4')
    else:
        raise AssertionError('Module home not found')
    tap(label + '-apps', '应用增强')
    tap(label + '-double', '扩展应用双开')
    return hierarchy(label + '-page')


def candidates(label, maximum=18):
    frames = []
    names = set()
    previous = None
    for i in range(maximum):
        folder = snapshot(label + '-list' + str(i), verbose=False)
        root = ET.fromstring((folder / 'window.xml').read_bytes())
        current = [n.get('text') for n in root.iter('node') if visible(n)
                   and n.get('resource-id') == 'android:id/title']
        assert any('com.zte.cn.doubleapp' == n.get('package') for n in root.iter('node'))
        frames.append({'evidence': folder.name, 'names': current})
        names.update(current)
        if current == previous:
            break
        previous = current
        shell('input swipe 800 2220 800 1120 750')
        time.sleep(.4)
    else:
        raise AssertionError('Native candidate list end not reached')
    folder = OUTPUT / (label + '-results'); folder.mkdir(exist_ok=True)
    result = {'frames': frames, 'allNames': sorted(names)}
    (folder / 'candidates.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    return result
