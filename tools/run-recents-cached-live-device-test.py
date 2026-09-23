"""Real Home/live-app/cached entries with existing tasks, including same-size reorders."""
import json
import re
import sys
import time
from adb_regression import OUTPUT, shell, adb
from module_ui_helpers import hierarchy, visible, tap_node
from recents_device_helpers import preferences

stage = sys.argv[1]
assert re.fullmatch(r'[A-Za-z0-9_.-]+', stage)
out = OUTPUT / (stage + '-cached-live')
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
assert preferences().get('settings_preference_key_recent_style') == '3'
checks = []


def open_app(label, number):
    package = 'ls.augment.regression.window' + str(number)
    result = shell('am start -W --windowingMode 1 -n ' + package + '/ls.augment.regression.ProbeActivity', root=True)
    assert 'Status: ok' in result
    root = hierarchy(label)
    assert any(package in n.get('text', '') for n in root.iter('node'))
    time.sleep(.6)


def front(label, number):
    time.sleep(.3)
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    (folder / 'early-screen.png').write_bytes(adb('exec-out', 'screencap', '-p'))
    time.sleep(1)
    root = hierarchy(label + '-settled')
    cards = [n for n in root.iter('node') if visible(n) and n.get('resource-id', '').endswith('/snapshot')]
    def area(node):
        l, t, r, b = map(int, re.findall(r'-?\d+', node.get('bounds')))
        return (r - l) * (b - t)
    target = max(cards, key=area)
    result = {'case': label, 'expected': 'LS ADB window-' + str(number), 'actual': target.get('content-desc')}
    result['pass'] = result['expected'] == result['actual']
    checks.append(result)
    (out / 'observations.json').write_text(json.dumps(checks, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(result, ensure_ascii=False), flush=True)
    assert result['pass'], result
    return target


try:
    open_app(stage + '-prepare-previous3', 3)
    open_app(stage + '-prepare-current4', 4)
    shell('input keyevent 187')
    front(stage + '-from-live-app', 3)
    shell('input keyevent 3')
    time.sleep(.8)
    shell('input keyevent 187')
    node = front(stage + '-cached-from-home', 4)
    tap_node(stage + '-cached-open4', node)
    root = hierarchy(stage + '-cached-opened4')
    assert any('ls.augment.regression.window4' in n.get('text', '') for n in root.iter('node'))
    open_app(stage + '-reorder-existing3', 3)
    shell('input keyevent 3')
    time.sleep(.8)
    shell('input keyevent 187')
    front(stage + '-same-count-reorder', 3)
    open_app(stage + '-reorder-existing4', 4)
    shell('input keyevent 3')
    time.sleep(.1)
    shell('input keyevent 187')
    front(stage + '-rapid-home-reorder', 4)
    (out / 'results.json').write_text(json.dumps({'checks': checks, 'cachedCardOpensCorrectApp': True, 'pass': True}, indent=2), encoding='utf-8')
finally:
    shell('input keyevent 3')
