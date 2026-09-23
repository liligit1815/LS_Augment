"""Compare real card identities and open/dismiss behavior across native styles."""
import json
import re
import sys
import time
from adb_regression import OUTPUT, adb, shell
from module_ui_helpers import hierarchy, visible, tap_node
from recents_device_helpers import style, preferences

stage = sys.argv[1] if len(sys.argv) > 1 else 'round40x'
assert re.fullmatch(r'[A-Za-z0-9_.-]+', stage)
out = OUTPUT / (stage + '-card-entry')
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists(), 'Retain existing device results'
original_style = preferences().get('settings_preference_key_recent_style')
names = {'1': '标准样式', '2': '宫格样式', '3': '堆叠样式'}
cases = []


def bounds(node):
    return list(map(int, re.findall(r'-?\d+', node.get('bounds'))))


try:
    for code in ('1', '2', '3'):
        style(stage + '-style-' + code, names[code])
        for pattern in ('settled-home', 'repeat-home-fast'):
            number = 3 if pattern == 'settled-home' else 5
            package = 'ls.augment.regression.window' + str(number)
            title = 'LS ADB window-' + str(number)
            label = stage + '-' + code + '-' + pattern
            launched = shell('am start -W --windowingMode 1 -n ' + package + '/ls.augment.regression.ProbeActivity', root=True)
            assert 'Status: ok' in launched
            root = hierarchy(label + '-actual-app')
            assert any(package in n.get('text', '') for n in root.iter('node'))
            time.sleep(.8)
            shell('input keyevent 3')
            time.sleep(.8)
            if pattern == 'repeat-home-fast':
                shell('input keyevent 3')
            shell('input keyevent 187')
            time.sleep(.35)
            folder = OUTPUT / label
            folder.mkdir(exist_ok=True)
            (folder / 'early-screen.png').write_bytes(adb('exec-out', 'screencap', '-p'))
            time.sleep(1.2)
            root = hierarchy(label + '-settled')
            cards = [n for n in root.iter('node') if visible(n) and n.get('resource-id', '').endswith('/snapshot')]
            target = [n for n in cards if n.get('content-desc') == title]
            areas = {id(n): (bounds(n)[2] - bounds(n)[0]) * (bounds(n)[3] - bounds(n)[1]) for n in cards}
            largest = max(cards, key=lambda n: areas[id(n)]) if cards else None
            foreground = len(target) == 1 and (code != '3' or largest is target[0])
            result = {'style': code, 'entry': pattern, 'target': package,
                      'cards': [n.attrib for n in cards], 'frontCard': largest.get('content-desc') if largest is not None else None,
                      'targetReady': foreground, 'openedCorrectApp': False, 'individualDismissed': False}
            if foreground:
                tap_node(label + '-open-card', target[0])
                time.sleep(.7)
                root = hierarchy(label + '-opened')
                result['openedCorrectApp'] = any(n.get('package') == package and package in n.get('text', '') for n in root.iter('node'))
                assert result['openedCorrectApp'], 'Actual opened app differs from target'
                shell('input keyevent 3')
                time.sleep(.8)
                shell('input keyevent 187')
                time.sleep(1)
                root = hierarchy(label + '-dismiss-before')
                target = [n for n in root.iter('node') if visible(n) and n.get('resource-id', '').endswith('/snapshot') and n.get('content-desc') == title]
                assert len(target) == 1
                left, top, right, bottom = bounds(target[0])
                x, y = (left + right) // 2, (top + bottom) // 2
                shell(f'input swipe {x} {y} {x} 130 320')
                time.sleep(1.2)
                recent = shell('dumpsys activity recents')
                (folder / 'recents-after-dismiss-private.txt').write_text(recent, encoding='utf-8')
                result['individualDismissed'] = not re.search(r'realActivity=\{' + re.escape(package) + r'/', recent)
            result['pass'] = foreground and result['openedCorrectApp'] and result['individualDismissed']
            cases.append(result)
            (out / 'observations.json').write_text(json.dumps(cases, ensure_ascii=False, indent=2), encoding='utf-8')
            print(json.dumps({k: v for k, v in result.items() if k != 'cards'}, ensure_ascii=False), flush=True)
    result = {'cases': len(cases), 'passed': sum(r['pass'] for r in cases), 'pass': all(r['pass'] for r in cases)}
    (out / 'results.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    print(json.dumps(result), flush=True)
finally:
    style(stage + '-restore-style', names[original_style])
    shell('input keyevent 3')
