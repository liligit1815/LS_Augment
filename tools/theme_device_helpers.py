"""Operate real OEM theme image cards using their observed labels as anchors."""
from module_ui_helpers import hierarchy, matches, visible, tap_node
from adb_regression import adb, shell
from launcher_icon_device_helpers import desktop
from launcher_icon_device_helpers import saved
import json
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT


def unique_label(root, title):
    found = matches(root, title)
    # OEM ViewPager occasionally reports the same local page twice.
    unique = {n.get('bounds'): n for n in found}
    assert len(unique) == 1, (title, list(unique))
    return next(iter(unique.values()))


def tap_label(label, title):
    root = hierarchy(label + '-before')
    tap_node(label + '-action', unique_label(root, title))


def open_home(label, desktop_entry=True):
    # External am-start is rejected in this phone's existing activity chain.
    if desktop_entry:
        desktop(label + '-desktop', ['主题'])
        tap_label(label + '-launch', '主题')
    else:
        folder = OUTPUT / (label + '-launch')
        folder.mkdir(exist_ok=True)
        folder.joinpath('native-launch.txt').write_bytes(adb('shell',
            'monkey -p com.zte.beautify -c android.intent.category.LAUNCHER 1'))
    time.sleep(1)
    for i in range(12):
        root = hierarchy(label + '-home' + str(i))
        if matches(root, '本地'):
            break
        # A cold-start HomeActivity can be blank while its data initializes.
        # Back on that first frame closes the app before its tabs appear.
        if matches(root, '返回') or matches(root, '转到上一层级'):
            shell('input keyevent 4')
        else:
            time.sleep(.5)
    else:
        raise AssertionError('Native theme home not reached')
    return root


def open_local(label, category, desktop_entry=True):
    open_home(label, desktop_entry)
    tap_label(label + '-local', '本地')
    tap_label(label + '-category', category)
    return hierarchy(label + '-list')


def card(label, title):
    root = hierarchy(label + '-before')
    found = [unique_label(root, title)]
    parents = {c: p for p in root.iter() for c in p}
    node = found[0]
    for i in range(3):
        node = parents[node]
        buttons = [c for c in node if visible(c) and c.get('clickable') == 'true']
        if len(buttons) == 1:
            tap_node(label + '-card', buttons[0])
            return
        if len(buttons) > 1:
            break
        # Native system-font cards handle the enclosing touch even though both
        # the CardView and its sole preview image report clickable=false.
        previews = [c for c in node if visible(c)
                    and c.get('class') == 'android.widget.ImageView'
                    and c.get('resource-id', '').startswith('com.zte.beautify:id/details_image')]
        if len(previews) == 1 and found[0] in list(node):
            tap_node(label + '-preview', previews[0])
            return
    raise AssertionError('No unique observed image card for ' + title)


def state():
    def prefs(package, name):
        for attempt in range(5):
            raw = shell('cat /data/user/0/' + package + '/shared_prefs/' + name + '.xml', root=True)
            try:
                return {n.get('name'): n.text or n.get('value') or '' for n in ET.fromstring(raw)}
            except ET.ParseError:
                if attempt == 4:
                    raise
                time.sleep(.2)
    diagnostics = prefs('ls.augment.com', 'ls_augment_diagnostics_v2')
    adapter = prefs('com.zte.beautifyadapter', 'launcher_beautify_adapter_apply')
    hashes = shell('sha256sum /data/system/users/0/wallpaper /data/system/users/0/wallpaper_lock', root=True)
    return {
        'at': shell('date -Iseconds'),
        'selection': prefs('com.zte.beautify', 'SELECTION_CONFIG'),
        'adapter': {k: v for k, v in adapter.items() if k.startswith('current_') or k == 'trial_key'},
        'wallpapers': {line.split()[-1].rsplit('/', 1)[-1]: line.split()[0] for line in hashes.splitlines() if line.strip()},
        'settings': {k: saved(k) for k in ['app_master', 'beautify_unlimited_trial', 'rm_theme_no_login']},
        'diagnostics': {k: v for k, v in diagnostics.items() if 'beautify' in k},
    }


def save_state(label):
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    value = state()
    (folder / 'state.json').write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')
    return value
