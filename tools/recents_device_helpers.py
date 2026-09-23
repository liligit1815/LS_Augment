"""Actual launcher style controls and native recent-task observations."""
import json
import re
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, shell
from module_ui_helpers import hierarchy, matches, tap

PACKAGE = 'com.zte.mifavor.launcher'
PREFS = '/data/user_de/0/' + PACKAGE + '/shared_prefs/com.android.launcher3.prefs.xml'


def preferences():
    for i in range(5):
        try:
            root = ET.fromstring(shell('cat ' + PREFS, root=True))
            return {n.get('name'): n.text or n.get('value') for n in root}
        except ET.ParseError:
            if i == 4:
                raise
            time.sleep(.2)


def open_style(label):
    result = shell('am start -W -n ' + PACKAGE + '/com.android.launcher3.settings.RecentAppStyleActivity', root=True)
    assert 'Status: ok' in result, result
    return hierarchy(label + '-native-settings')


def style(label, title):
    assert title in ('标准样式', '宫格样式', '堆叠样式')
    root = open_style(label)
    for i in range(5):
        if matches(root, title):
            break
        # The native activity keeps its scroll position after the bottom memory
        # switch is used. Select the direction from the visible page content.
        toward_top = (title == '标准样式' or matches(root, '显示内存信息')
                      or title == '宫格样式' and matches(root, '堆叠样式'))
        shell('input swipe 608 850 608 2100 650' if toward_top
              else 'input swipe 608 2100 608 850 650')
        root = hierarchy(label + '-scroll' + str(i))
    assert matches(root, title)
    tap(label + '-select', title)
    expected = {'标准样式': '1', '宫格样式': '2', '堆叠样式': '3'}[title]
    for _ in range(20):
        if preferences().get('settings_preference_key_recent_style') == expected:
            return
        time.sleep(.2)
    raise AssertionError('Native style was not saved')


def native_memory(label, enabled):
    root = open_style(label)
    for i in range(5):
        switch = [n for n in root.iter('node') if n.get('visible-to-user') == 'true'
                  and n.get('resource-id', '').endswith('/recents_stack_memory_switch')]
        if switch:
            break
        shell('input swipe 608 2180 608 900 650')
        root = hierarchy(label + '-scroll' + str(i))
    assert len(switch) == 1
    if (switch[0].get('checked') == 'true') != enabled:
        tap(label + '-toggle', '显示内存信息')
    for _ in range(20):
        if preferences().get('ls_recents_stack_show_memory') == str(enabled).lower():
            return
        time.sleep(.2)
    raise AssertionError('Native memory control was not saved')


def overview(label):
    shell('input keyevent 3')
    shell('input keyevent 187')
    time.sleep(.7)
    root = hierarchy(label)
    assert any(n.get('package') == PACKAGE for n in root.iter('node')), 'Not in native launcher'
    visible = [n for n in root.iter('node') if n.get('visible-to-user') == 'true']
    cards = [n.attrib for n in visible if n.get('resource-id', '').endswith('/snapshot')]
    memory = [n.attrib for n in visible if 'GB' in n.get('text', '')]
    result = {'cards': cards, 'memory': memory,
              'style': preferences().get('settings_preference_key_recent_style'),
              'nativeMemory': preferences().get('ls_recents_stack_show_memory')}
    (OUTPUT / label / 'recents-result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({'label': label, 'style': result['style'], 'cards': len(cards),
                      'memory': [n['text'] for n in memory]}, ensure_ascii=False), flush=True)
    return root, result
