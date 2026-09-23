"""ADB clicks against all real Android windows, including native overlays."""
import json
import re
from adb_regression import OUTPUT, shell


def all_windows(label):
    assert re.fullmatch(r'[A-Za-z0-9_.-]+', label)
    result = shell('am instrument -w -r -e label ' + label + ' ls.augment.regression.ui/ls.augment.com.UiWindowRunner')
    folder = OUTPUT / label;folder.mkdir(exist_ok=True)
    (folder / 'instrumentation.txt').write_text(result, encoding='utf-8')
    if 'INSTRUMENTATION_RESULT: status=pass' not in result:
        raise AssertionError(result)
    raw = shell('cat /data/user/0/ls.augment.regression.ui/files/ui-windows/' + label + '.json', root=True)
    (folder / 'result-private.json').write_text(raw, encoding='utf-8')
    return json.loads(raw)['uiWindows']


def nodes(windows):
    def walk(node):
        yield node
        for child in node.get('children', []):
            yield from walk(child)
    for window in windows:
        yield from walk(window['root'])


def tap_id(label, identity):
    observed = all_windows(label + '-before')
    found = [n for n in nodes(observed) if n.get('id') == identity and n.get('visible')]
    if len(found) != 1:
        raise AssertionError({'id': identity, 'matches': len(found)})
    node = found[0]
    bounds = list(map(int, re.findall(r'-?\d+', node['bounds'])))
    x = (max(0, bounds[0]) + min(1216, bounds[2])) // 2
    y = (max(0, bounds[1]) + min(2688, bounds[3])) // 2
    assert 0 <= x < 1216 and 0 <= y < 2688
    shell(f'input tap {x} {y}')
    action = {'action': 'tap', 'id': identity, 'x': x, 'y': y, 'observed': node}
    (OUTPUT / (label + '-before') / 'action.json').write_text(json.dumps(action, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({k: v for k, v in action.items() if k != 'observed'}), flush=True)
    return node
