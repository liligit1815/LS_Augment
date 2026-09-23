"""Operate the real hidden-entry and tile settings pages through ADB."""
import json
import re
import time
from adb_regression import OUTPUT, shell, snapshot, tap
from module_ui_helpers import hierarchy, matches, tap_node


def open_tile(label):
    shell('cmd statusbar collapse')
    shell('am start -W -n ls.augment.com/.SettingsActivity')
    for i in range(6):
        root = hierarchy(label + '-home' + str(i))
        icons = matches(root, '连续点击版本图标进入消失吧APP')
        if icons:
            break
        shell('input keyevent 4')
    else:
        raise AssertionError('Module overview unavailable')
    if not matches(root, '进入消失吧APP'):
        assert len(icons) == 1
        for i in range(7):
            tap_node(label + '-version-tap' + str(i), icons[0])
    tap(label + '-hide', '消失吧APP')
    tap(label + '-tile', '快捷磁贴')
    return hierarchy(label + '-page')


def edit_field(label, index, value):
    root = hierarchy(label + '-before')
    fields = [n for n in root.iter('node') if n.get('visible-to-user') == 'true'
              and n.get('class') == 'android.widget.EditText']
    assert len(fields) == 2
    field = fields[index]
    tap_node(label + '-field', field)
    shell('input keyevent 123')
    old = field.get('text', '')
    if old in ('磁贴名称', '磁贴说明'):
        old = ''
    if old:
        shell('input keyevent ' + ' '.join(['67'] * len(old)))
    if value:
        import shlex
        shell('input text ' + shlex.quote(value.replace(' ', '%s')))
    shell('input keyevent 4')
    time.sleep(1)
    root = hierarchy(label + '-after')
    fields = [n for n in root.iter('node') if n.get('visible-to-user') == 'true'
              and n.get('class') == 'android.widget.EditText']
    return fields[index].get('text', '')


def panel(label):
    shell('cmd statusbar expand-settings')
    time.sleep(1)
    return snapshot(label, verbose=False)


def wait_tile(label, description, state):
    """Wait for the app's asynchronous native tile update, then retain its UI."""
    deadline = time.monotonic() + 25
    observations = []
    while time.monotonic() < deadline:
        raw = shell('dumpsys activity service com.android.systemui/.SystemUIService', root=True)
        line = next((s.strip() for s in raw.splitlines()
                     if 'State[spec=custom(ls.augment.com/.AugmentTileService)' in s), '')
        match = re.search(r'(?:,| )state=(\d)', line)
        observations.append(line)
        if description in line and match and int(match[1]) == state:
            time.sleep(.6)
            folder = snapshot(label, verbose=False)
            (folder / 'native-state-readiness.json').write_text(json.dumps(observations, ensure_ascii=False, indent=2), encoding='utf-8')
            assert description in (folder / 'window.xml').read_text(encoding='utf-8')
            return folder
        time.sleep(.5)
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    (folder / 'native-state-readiness.json').write_text(json.dumps(observations, ensure_ascii=False, indent=2), encoding='utf-8')
    raise AssertionError('Expected native tile state not reached: ' + description)
