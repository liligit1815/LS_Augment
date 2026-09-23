"""Actual module AI controls, using the observed slider row for each setting."""
import json
import re
import time

from adb_regression import OUTPUT, shell
from fan_device_helpers import prefs
from module_ui_helpers import hierarchy, scroll, tap_node, visible

CONTROLS = [
    ('ls_augment_ai_template_scan_ms', '模板扫描间隔 ms', 80, 2000),
    ('ls_augment_ai_click_ms', '点击队列间隔 ms', 10, 500),
    ('ls_augment_ai_cooldown_ms', '策略冷却 ms', 50, 2000),
    ('ls_augment_ai_yolo_scan_ms', 'YOLO 扫描间隔 ms', 150, 1500),
]


def configure(label, modes=None, enabled=True):
    shell('am start -W -f 0x10008000 -n ls.augment.com/.FeatureActivity --es module ai_trigger', root=True)
    root = hierarchy(label + '-page')
    switches = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.Switch']
    assert len(switches) == 1 and switches[0].get('content-desc') == 'AI 触发器极速响应'
    if (switches[0].get('checked') == 'true') != enabled:
        tap_node(label + '-switch', switches[0])
    expected = {}
    if modes:
        assert enabled and len(modes) == len(CONTROLS)
        for index, ((key, title, minimum, maximum), mode) in enumerate(zip(CONTROLS, modes)):
            if mode == 'keep':
                continue
            assert mode in ['min', 'mid', 'max']
            target = minimum if mode == 'min' else maximum if mode == 'max' else (minimum + maximum) // 2
            for attempt in range(5):
                root = hierarchy(label + '-slider' + str(index) + '-' + str(attempt))
                found = [n for n in root.iter('node') if visible(n) and n.get('text', '').startswith(title + '：')]
                if found:
                    parent = {child: node for node in root.iter() for child in node}[found[0]]
                    siblings = list(parent)
                    bar = siblings[siblings.index(found[0]) + 1]
                    if visible(bar) and bar.get('class') == 'android.widget.SeekBar':
                        b = list(map(int, re.findall(r'-?\d+', bar.get('bounds', ''))))
                        if b[3] - b[1] >= 35:
                            break
                scroll(root, short=True)
            else:
                raise AssertionError('Actual slider not reached: ' + title)
            x = b[0] + 1 if mode == 'min' else b[2] - 1 if mode == 'max' else (b[0] + b[2]) // 2
            y = (b[1] + b[3]) // 2
            shell(f'input tap {x} {y}')
            folder = OUTPUT / (label + '-slider' + str(index));folder.mkdir(exist_ok=True)
            (folder / 'action.json').write_text(json.dumps({'observed': bar.attrib, 'title': title,
                    'target': target, 'x': x, 'y': y}, ensure_ascii=False, indent=2), encoding='utf-8')
            time.sleep(.7)
            expected[key] = str(target)
            actual = prefs('ls_augment_config_v2').get(key)
            assert actual == str(target), (title, target, actual)
    time.sleep(1.2)
    config = prefs('ls_augment_config_v2')
    assert config['ls_augment_ai_trigger_enabled'] == ('1' if enabled else '0')
    assert all(config[k] == v for k, v in expected.items())
    hierarchy(label + '-saved')
    folder = OUTPUT / label;folder.mkdir(exist_ok=True)
    selected = {k: v for k, v in config.items() if k.startswith('ls_augment_ai_') or k == 'ls_augment_game_master'}
    (folder / 'actual-config.json').write_text(json.dumps(selected, indent=2), encoding='utf-8')
    return selected
