"""Verify visible tile text, saved text and Unicode limits on the actual phone."""
import base64
import json
import shlex
import sys
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, shell, snapshot
from tile_device_helpers import open_tile, edit_field, panel
from launcher_icon_device_helpers import saved

stage = sys.argv[1] if len(sys.argv) > 1 else 'round34c2'
out = OUTPUT / (stage + '-text-results')
out.mkdir(exist_ok=True)
records = []


def record(value):
    records.append(value)
    (out / 'results.json').write_text(json.dumps(records, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(value, ensure_ascii=False), flush=True)
    assert value['pass'], value


open_tile(stage + '-open')
for index, key, length in [(0, 'tile_label', 30), (1, 'tile_description', 60)]:
    typed = ('N' if index == 0 else 'D') * (length + 1)
    visible = edit_field(stage + '-ascii-' + key, index, typed)
    actual = saved(key)
    record({'case': 'ASCII-' + key, 'typedLength': len(typed), 'visible': visible,
            'saved': actual, 'pass': visible == actual == typed[:length]})

for index, key, typed, expected in [
        (0, 'tile_label', 'A' * 29 + '🧭🧭', 'A' * 29 + '🧭'),
        (1, 'tile_description', '中文🧭' * 21, '中文🧭' * 20)]:
    encoded = base64.b64encode(typed.encode()).decode()
    raw = shell('am instrument -w -r -e fieldIndex ' + str(index) + ' -e textBase64 '
                + shlex.quote(encoded) + ' ls.augment.regression.ui/ls.augment.com.UiTextRunner')
    (out / (key + '-unicode-input.txt')).write_text(raw, encoding='utf-8')
    assert 'status=pass' in raw, raw
    folder = snapshot(stage + '-unicode-' + key, False)
    root = ET.fromstring((folder / 'window.xml').read_bytes())
    fields = [n for n in root.iter('node') if n.get('visible-to-user') == 'true'
              and n.get('class') == 'android.widget.EditText']
    actual = saved(key)
    visible = fields[index].get('text')
    record({'case': 'Unicode-' + key, 'typed': typed, 'visible': visible,
            'saved': actual, 'expected': expected, 'pass': actual == visible == expected})

for index, key, expected in [(0, 'tile_label', 'LS_Augment'), (1, 'tile_description', '应用隐藏')]:
    edit_field(stage + '-empty-' + key, index, '')
    actual = saved(key)
    record({'case': 'Empty-' + key, 'saved': actual, 'expected': expected, 'pass': actual == expected})
panel(stage + '-default-text-panel')
shell('cmd statusbar collapse')
edit_field(stage + '-fixture-title', 0, 'ADB_HIDE')
edit_field(stage + '-fixture-description', 1, 'SPACE_TEST')
folder = panel(stage + '-fixture-text-panel')
record({'case': 'Actual-QS-custom-text', 'evidence': folder.name,
        'pass': 'ADB_HIDE，SPACE_TEST，未配置应用' in (folder / 'window.xml').read_text(encoding='utf-8')})
