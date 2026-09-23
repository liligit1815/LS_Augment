"""Observe the real health account privately and operate the module settings."""
import json
import shlex
import sqlite3
import tarfile
import io
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell
from module_ui_helpers import hierarchy, matches, tap


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
    tap(label + '-health', '步数修改')
    return hierarchy(label + '-page')


def diagnostics(label):
    out = OUTPUT / label
    out.mkdir(exist_ok=True)
    for attempt in range(5):
        try:
            xml = ET.fromstring(shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True))
            break
        except ET.ParseError:
            if attempt == 4:
                raise
            time.sleep(.2)
    value = {n.get('name'): n.text or n.get('value') or '' for n in xml if 'health' in n.get('name', '')}
    (out / 'diagnostics-private.json').write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')
    return value


def databases(label):
    """Copy native DB+WAL+SHM for local read-only inspection; never edit the phone DB."""
    out = OUTPUT / label
    out.mkdir(exist_ok=True)
    assert not (out / 'databases-private.tar').exists(), 'Preserve previous database evidence'
    files = shell('find /data/user/0/com.mi.health/databases -type f', root=True).splitlines()
    wanted = ('fitness_data', 'fitness_summary', 'ls_augment_steps_v1.db')
    paths = [p.strip() for p in files if p.strip().rsplit('/', 1)[-1].removesuffix('-wal').removesuffix('-shm') in wanted]
    assert all(any(p.endswith('/' + name) for p in paths) for name in wanted), 'Missing native health database'
    relatives = [p.removeprefix('/data/user/0/com.mi.health/') for p in paths]
    command = 'tar -cf - -C /data/user/0/com.mi.health ' + ' '.join(shlex.quote(p) for p in relatives)
    raw = adb('exec-out', 'su -c ' + shlex.quote(command), timeout=60)
    (out / 'databases-private.tar').write_bytes(raw)
    base = (out / 'native-private').resolve()
    bases = {}
    with tarfile.open(fileobj=io.BytesIO(raw)) as archive:
        for member in archive:
            assert member.isfile()
            destination = (base / member.name).resolve()
            assert destination.is_relative_to(base)
            destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_bytes(archive.extractfile(member).read())
            if destination.name in wanted:
                bases[destination.name] = destination
    review = {}
    for name, path in bases.items():
        connection = sqlite3.connect(path.as_uri() + '?mode=ro', uri=True)
        connection.row_factory = sqlite3.Row
        integrity = connection.execute('pragma quick_check').fetchall()
        assert [r[0] for r in integrity] == ['ok'], (name, integrity)
        tables = [r[0] for r in connection.execute("select name from sqlite_master where type='table'")]
        review[name] = {'quickCheck': 'ok', 'tables': tables}
        connection.close()
    (out / 'database-review.json').write_text(json.dumps(review, ensure_ascii=False, indent=2), encoding='utf-8')
    return bases, review


def plan_events(label, plan_id):
    out = OUTPUT / label
    out.mkdir(exist_ok=True)
    names = ('ls_augment_steps_v1.db', 'ls_augment_steps_v1.db-wal', 'ls_augment_steps_v1.db-shm')
    command = 'tar -cf - -C /data/user/0/com.mi.health/databases ' + ' '.join(names)
    raw = adb('exec-out', 'su -c ' + shlex.quote(command))
    (out / 'ledger-private.tar').write_bytes(raw)
    with tarfile.open(fileobj=io.BytesIO(raw)) as archive:
        for member in archive:
            assert member.name in names
            (out / member.name).write_bytes(archive.extractfile(member).read())
    c = sqlite3.connect((out / names[0]).resolve().as_uri() + '?mode=ro', uri=True)
    c.row_factory = sqlite3.Row
    try:
        return [dict(r) for r in c.execute('select day,time,steps,admitted from events where id=? order by time', (plan_id,))]
    finally:
        c.close()
