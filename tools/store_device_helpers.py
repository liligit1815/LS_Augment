"""Read the native download database and tap freshly observed store rows."""
import json
import re
import shlex
import sqlite3
import time
from adb_regression import OUTPUT, adb, shell
from module_ui_helpers import hierarchy, matches, visible, tap_node, tap
from native_ui_helpers import tap_id
from launcher_icon_device_helpers import saved


def downloads(label):
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    for attempt in range(5):
        raw = adb('exec-out', 'su -c ' + shlex.quote(
            'cat /data/user/0/cn.nubia.neostore/databases/appStore.db2'))
        connection = sqlite3.connect(':memory:')
        try:
            connection.deserialize(raw)
            connection.row_factory = sqlite3.Row
            rows = [dict(r) for r in connection.execute(
                'select _id,app_name,package_name,total_size,current_size,progress,status,file_name,file_path from download')]
            break
        except sqlite3.DatabaseError:
            if attempt == 4:
                raise
            time.sleep(.2)
        finally:
            connection.close()
    (folder / 'downloads-private.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')
    return rows


def row_action(label, title, action, companion=None):
    root = hierarchy(label + '-before')
    parents = {child: parent for parent in root.iter() for child in parent}
    buttons = {}
    for anchor in matches(root, title):
        node = anchor
        for _ in range(5):
            if node not in parents:
                break
            node = parents[node]
            candidates = [n for n in node.iter('node') if visible(n) and n.get('text') == action]
            if len(candidates) == 1 and (companion is None or matches(node, companion)):
                buttons[candidates[0].get('bounds')] = candidates[0]
                break
            if len(candidates) > 1:
                break
    assert len(buttons) == 1, (title, action, list(buttons))
    tap_node(label + '-action', next(iter(buttons.values())))


def new_downloads(label):
    baseline = json.loads((OUTPUT / 'round38c-queue-baseline/download-before-private.json').read_text(encoding='utf-8'))
    known = {row['_id'] for row in baseline}
    return [r for r in downloads(label) if r['_id'] not in known]


def open_module(label):
    shell('am start -W -n ls.augment.com/.SettingsActivity')
    for i in range(5):
        root = hierarchy(label + '-home' + str(i))
        if matches(root, '应用增强'):
            break
        shell('input keyevent 4')
    else:
        raise AssertionError('Module overview not reached')
    tap(label + '-apps', '应用增强')
    tap(label + '-store', '应用商店同时下载限制解除')


def count(label, number):
    root = hierarchy(label + '-before')
    slider = next(n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.SeekBar')
    left, top, right, bottom = map(int, re.findall(r'\d+', slider.get('bounds')))
    # This device's actual native track has 16dp padding at density520.
    x = round(left + 52 + (right - left - 104) * (number - 1) / 49)
    shell(f'input tap {x} {(top + bottom) // 2}')
    for i in range(25):
        if saved('store_download_count') == str(number):
            break
        time.sleep(.2)
    root = hierarchy(label + '-after')
    assert saved('store_download_count') == str(number)
    assert matches(root, '允许同时下载数量：' + str(number))
    (OUTPUT / (label + '-after') / 'action.json').write_text(json.dumps(
        {'node': slider.attrib, 'tap': [x, (top + bottom) // 2], 'requested': number}), encoding='utf-8')


def restart_and_open_manager(label):
    shell('am force-stop cn.nubia.neostore')
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    (folder / 'native-launch.txt').write_bytes(adb('shell',
        'monkey -p cn.nubia.neostore -c android.intent.category.LAUNCHER 1'))
    time.sleep(1)
    root = hierarchy(label + '-home')
    if any(visible(n) and n.get('resource-id') == 'cn.nubia.neostore:id/iv_ad_close' for n in root.iter('node')):
        tap_id(label + '-ad-close', 'cn.nubia.neostore:id/iv_ad_close')
    tap(label + '-my', '我的')
    tap_id(label + '-manager', 'cn.nubia.neostore:id/app_download_ll')
