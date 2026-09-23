"""Observed OEM game UI and private input evidence on the connected phone."""
import json
import re
import shlex
import sqlite3
import time
from adb_regression import OUTPUT, adb, shell, snapshot
from module_ui_helpers import wake
from native_ui_helpers import all_windows, nodes

PACKAGE = 'ls.augment.regression.game'
COMPONENT = PACKAGE + '/.GameActivity'


def capture(label):
    wake()
    snapshot(label, verbose=False)
    return list(nodes(all_windows(label + '-windows')))


def compact(observed):
    return [{k: n.get(k) for k in ('id', 'text', 'description', 'bounds', 'clickable', 'checked')}
            for n in observed if n.get('visible') and
            (n.get('text') not in (None, '', 'null') or n.get('clickable'))]


def touch(label, identity=None, text=None):
    observed = list(nodes(all_windows(label + '-before')))
    found = [n for n in observed if n.get('visible') and
             (n.get('id') == identity if identity else text in (n.get('text'), n.get('description')))]
    assert len(found) == 1, {'identity': identity, 'text': text, 'count': len(found)}
    b = list(map(int, re.findall(r'-?\d+', found[0]['bounds'])))
    assert len(b) == 4 and b[2] > b[0] >= 0 and b[3] > b[1] >= 0, b
    x, y = (b[0] + b[2]) // 2, (b[1] + b[3]) // 2
    shell(f'input tap {x} {y}')
    (OUTPUT / (label + '-before') / 'action.json').write_text(
        json.dumps({'x': x, 'y': y, 'observed': found[0]}, ensure_ascii=False, indent=2), encoding='utf-8')
    return found[0]


def database(label, directory, name, tables):
    """Capture the actual native database and WAL, then read the local copy."""
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    names = shell('ls -1 ' + shlex.quote(directory), root=True).splitlines()
    selected = [n for n in names if n in (name, name + '-wal')]
    assert name in selected, selected
    for attempt in range(5):
        before = shell('sha256sum ' + ' '.join(shlex.quote(directory + '/' + n) for n in selected), root=True)
        for n in selected:
            (folder / n).write_bytes(adb('exec-out', 'su -c ' + shlex.quote('cat ' + shlex.quote(directory + '/' + n))))
        after = shell('sha256sum ' + ' '.join(shlex.quote(directory + '/' + n) for n in selected), root=True)
        if before == after:
            break
        time.sleep(.2)
    assert before == after, 'Native database changed during capture'
    connection = sqlite3.connect((folder / name).resolve().as_uri() + '?mode=ro', uri=True)
    connection.row_factory = sqlite3.Row
    assert connection.execute('pragma integrity_check').fetchone()[0] == 'ok'
    result = {table: [dict(r) for r in connection.execute('select * from "' + table + '"')] for table in tables}
    connection.close()
    (folder / 'rows-private.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    (folder / 'source-sha256.txt').write_text(after, encoding='utf-8')
    return result


def input_events(label):
    raw = adb('logcat', '-d', '-v', 'epoch', '-s', 'LSA-GameValidation:I', '*:S').decode('utf-8', 'replace')
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    (folder / 'input-events.txt').write_text(raw, encoding='utf-8')
    events = []
    for line in raw.splitlines():
        if 'target=' not in line:
            continue
        parts = dict(re.findall(r'(target|action|eventTime|now|down|up|x|y)=([\d.]+)', line))
        if len(parts) == 8:
            events.append({k: float(v) if k in ('x', 'y') else int(v) for k, v in parts.items()})
    (folder / 'input-events.json').write_text(json.dumps(events, indent=2), encoding='utf-8')
    return events
