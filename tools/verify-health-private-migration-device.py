"""Read-only post-upgrade health verification; never starts/stops apps or edits the phone.

Pass --collect only after the upgrade coordinator confirms migration has completed.
Remote reads use pre/post hashes plus archive-byte verification for a stable DB/WAL
snapshot. Busy writers cause bounded retries/failure, never a force-stop. All SQLite
recovery and digesting happen on disposable local copies, not the phone.
"""
from pathlib import Path
import argparse
import hashlib
import io
import json
import os
import re
import shlex
import sqlite3
import tarfile
import tempfile
import time

ROOT = Path(__file__).resolve().parents[1]
TABLES = ('records', 'plans', 'events', 'plan_awards')
MODULE = 'ls.augment.com'
HEALTH = 'com.mi.health'
LEGACY = 'ls_augment_steps_v1.db'
SUFFIXES = ('', '-wal', '-shm', '-journal')
LIMIT = 512 * 1024 * 1024


def ledger_name():
    source = (ROOT / 'android/app/src/main/java/ls/augment/com/HealthLedgerDatabase.java').read_text(encoding='utf-8')
    match = re.search(r'static final String NAME="([a-z0-9-]+\.db)";', source)
    if not match:
        raise RuntimeError('Cannot derive private ledger filename from production source')
    return match[1]


def logical_summary(path):
    # SQLite may recover a copied WAL/hot journal. Only this local working copy is writable.
    connection = sqlite3.connect(path.resolve().as_uri() + '?mode=rw', uri=True)
    try:
        if connection.execute('PRAGMA quick_check').fetchall() != [('ok',)]:
            raise RuntimeError('Local database integrity check failed')
        connection.execute('BEGIN')
        tables = {}
        quote = lambda value: '"' + value.replace('"', '""') + '"'
        for (table,) in connection.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' ORDER BY name"):
            columns = [row[1] for row in connection.execute('PRAGMA table_info(' + quote(table) + ')')]
            digest, count = hashlib.sha256(), 0
            query = 'SELECT * FROM ' + quote(table) + ' ORDER BY ' + ','.join(map(quote, columns))
            for row in connection.execute(query):
                values = [{'blob': value.hex()} if isinstance(value, bytes) else value for value in row]
                encoded = json.dumps(values, ensure_ascii=False, separators=(',', ':')).encode('utf-8')
                digest.update(len(encoded).to_bytes(8, 'big'))
                digest.update(encoded)
                count += 1
            tables[table] = {'columns': columns, 'rows': count, 'sha256': digest.hexdigest()}
        ready = None
        if 'migration' in tables:
            ready = connection.execute("SELECT value FROM migration WHERE key='legacy_imported'").fetchone() == ('1',)
        return {'quick_check': 'ok', 'tables': tables, 'migration_ready': ready}
    finally:
        connection.close()


def differences(before, after, selected=None):
    expected = before['tables']
    actual = after['tables']
    names = selected if selected is not None else sorted(set(expected) | set(actual))
    return [name for name in names if name not in expected or name not in actual or expected[name] != actual[name]]


def verify_archive(raw, manifest):
    files = {}
    with tarfile.open(fileobj=io.BytesIO(raw), mode='r:') as archive:
        for member in archive:
            if not member.isfile() or member.name not in manifest or member.name in files or member.size > LIMIT:
                raise RuntimeError('Unexpected archive entry')
            value = archive.extractfile(member).read()
            expected = manifest[member.name]
            if expected is None or len(value) != expected['size'] or hashlib.sha256(value).hexdigest() != expected['sha256']:
                raise RuntimeError('Archive bytes differ from verified remote snapshot')
            files[member.name] = value
    if set(files) != {name for name, entry in manifest.items() if entry is not None}:
        raise RuntimeError('Archive inventory differs from verified remote snapshot')
    return files


def remote(command, timeout=60):
    # Import lazily: self-tests and local comparison never contact a device.
    import adb_regression
    if not os.environ.get('LS_AUGMENT_DEVICE', '').strip():
        raise RuntimeError('Set explicit LS_AUGMENT_DEVICE before collecting')
    return adb_regression.adb('exec-out', 'su -c ' + shlex.quote('nsenter -t 1 -m -- sh -c ' + shlex.quote(command)), timeout=timeout)


def read_manifest(user, names):
    lines = ['set -eu', '[ "$(id -u)" = 0 ]', 'cd ' + shlex.quote('/data/user/' + str(user))]
    for package in (MODULE, HEALTH):
        lines += [
            'base=' + shlex.quote('/data/user/' + str(user) + '/' + package),
            '[ -d "$base" ] && [ ! -L "$base" ] || exit 73',
            'canonical=$(readlink -f "$base")',
            '[ "$canonical" = "$base" ] || { [ ' + str(user) + ' = 0 ] && [ "$canonical" = ' + shlex.quote('/data/data/' + package) + ' ]; } || exit 73',
            'uid=$(stat -c %u "$base")',
            'cmd package list packages --user ' + str(user) + ' -U ' + package + ' | grep -Fx "package:' + package + ' uid:$uid" >/dev/null',
        ]
        for name in names:
            if not name.startswith(package + '/'):
                continue
            relative = name[len(package) + 1:]
            lines += [
                'file=' + shlex.quote(name),
                'if [ -e "$file" ] || [ -L "$file" ]; then',
                ' [ -f "$file" ] && [ ! -L "$file" ] && [ "$(stat -c %u "$file")" = "$uid" ] && [ "$(stat -c %h "$file")" = 1 ] || exit 73',
                ' [ "$(readlink -f "$file")" = "$canonical/' + relative + '" ] || exit 73',
                ' size=$(stat -c %s "$file");[ "$size" -le ' + str(LIMIT) + ' ] || exit 73',
                ' hash=$(sha256sum "$file");hash=${hash%% *}',
                ' printf "%s\\t%s\\t%s\\t%s\\n" "$file" "$hash" "$size" "$uid"',
                'else printf "%s\\t-\\t0\\t%s\\n" "$file" "$uid";fi',
            ]
    parsed = {}
    for line in remote('\n'.join(lines)).decode('utf-8').splitlines():
        name, digest, size, uid = line.split('\t')
        if name not in names or name in parsed or not size.isdigit() or not uid.isdigit():
            raise RuntimeError('Invalid remote inventory')
        if digest != '-' and not re.fullmatch('[0-9a-f]{64}', digest):
            raise RuntimeError('Invalid remote digest')
        parsed[name] = None if digest == '-' else {'sha256': digest, 'size': int(size), 'uid': int(uid)}
    if set(parsed) != set(names) or sum(entry['size'] for entry in parsed.values() if entry) > LIMIT:
        raise RuntimeError('Incomplete or oversized snapshot')
    return parsed


def collect(baseline_path, output, user, before_upgrade=False):
    before = json.loads(baseline_path.read_text(encoding='utf-8'))
    native = sorted(name for name in before if re.fullmatch(r'fitness_[A-Za-z0-9_.-]+', name))
    if not native or LEGACY not in before:
        raise RuntimeError('Baseline has no native fitness or legacy ledger tables')
    private_name = ledger_name()
    names = [] if before_upgrade else [MODULE + '/databases/' + private_name + suffix for suffix in SUFFIXES]
    names += [HEALTH + '/databases/' + name + suffix for name in (*native, LEGACY) for suffix in SUFFIXES]
    names += [HEALTH + '/files/ls_augment_steps.lock']
    output.mkdir(parents=True, exist_ok=False)
    for attempt in range(1, 6):
        first = read_manifest(user, names)
        present = [name for name, entry in first.items() if entry]
        command = 'tar -cf - -C ' + shlex.quote('/data/user/' + str(user)) + ' ' + ' '.join(map(shlex.quote, present))
        raw = remote(command)
        second = read_manifest(user, names)
        if first == second:
            try:
                files = verify_archive(raw, first)
                break
            except RuntimeError:
                if attempt == 5:
                    raise
        if attempt == 5:
            raise RuntimeError('Health databases kept changing; no stable snapshot obtained')
        time.sleep(0.5)
    (output / 'stable-databases-private.tar').write_bytes(raw)
    (output / 'source-manifest-private.json').write_text(json.dumps(first, indent=2), encoding='utf-8')
    working = output / 'local-working-private'
    for name, value in files.items():
        path = working.joinpath(*name.split('/'))
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(value)
    summaries = {name: logical_summary(working / HEALTH / 'databases' / name) for name in native}
    if before_upgrade:
        legacy = logical_summary(working / HEALTH / 'databases' / LEGACY)
        summaries[LEGACY] = legacy
        report = {'success': True, 'read_only_device_access': True,
                  'stable_snapshot_attempt': attempt, 'before_upgrade': True,
                  'ledger_row_counts': {table: legacy['tables'][table]['rows'] for table in TABLES},
                  'native_databases_compared': len(native), 'archive_sha256': hashlib.sha256(raw).hexdigest()}
        (output / 'logical-summary-private.json').write_text(json.dumps(summaries, ensure_ascii=False, indent=2), encoding='utf-8')
        (output / 'verification.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
        print(json.dumps(report, ensure_ascii=False))
        return 0
    private = logical_summary(working / MODULE / 'databases' / private_name)
    summaries[private_name] = private
    mismatch = {'module_ledger': differences(before[LEGACY], private, TABLES)}
    mismatch.update({name: differences(before[name], summaries[name]) for name in native})
    old_files = [name for name, entry in first.items() if entry and name.startswith(HEALTH + '/')
                 and (name.rsplit('/', 1)[-1].startswith(LEGACY) or name.endswith('/ls_augment_steps.lock'))]
    report = {'success': not any(mismatch.values()) and not old_files and private['migration_ready'],
              'read_only_device_access': True, 'stable_snapshot_attempt': attempt,
              'module_database': private_name, 'migration_ready': private['migration_ready'],
              'legacy_files_remaining': len(old_files), 'mismatched_tables': mismatch,
              'ledger_row_counts': {table: private['tables'][table]['rows'] for table in TABLES},
              'native_databases_compared': len(native), 'archive_sha256': hashlib.sha256(raw).hexdigest()}
    (output / 'logical-summary-private.json').write_text(json.dumps(summaries, ensure_ascii=False, indent=2), encoding='utf-8')
    (output / 'verification.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(report, ensure_ascii=False))
    return 0 if report['success'] else 1


def self_test():
    with tempfile.TemporaryDirectory(prefix='lsa-health-readonly-') as folder:
        path = Path(folder) / 'fixture.db'
        db = sqlite3.connect(path)
        db.execute('CREATE TABLE records(id INTEGER PRIMARY KEY,value TEXT,opaque BLOB)')
        db.execute('INSERT INTO records VALUES(?,?,?)', (1, 'private fixture', b'\x00\xff'))
        db.commit()
        before = logical_summary(path)
        assert not differences(before, logical_summary(path))
        db.execute('UPDATE records SET value=?', ('changed fixture',));db.commit();db.close()
        assert differences(before, logical_summary(path)) == ['records']
        raw = io.BytesIO()
        value = b'fixture-only';name = MODULE + '/databases/' + ledger_name()
        with tarfile.open(fileobj=raw, mode='w') as archive:
            entry = tarfile.TarInfo(name);entry.size = len(value);archive.addfile(entry, io.BytesIO(value))
        manifest = {name: {'sha256': hashlib.sha256(value).hexdigest(), 'size': len(value), 'uid': 1}}
        assert verify_archive(raw.getvalue(), manifest)[name] == value
        manifest[name]['sha256'] = '0' * 64
        try: verify_archive(raw.getvalue(), manifest)
        except RuntimeError: pass
        else: raise AssertionError('Changed snapshot accepted')
    print('PASS: local logical equality/change and archive consistency checks; no device access')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--self-test', action='store_true')
    mode.add_argument('--collect', action='store_true', help='Read the phone only after upgrade completion is confirmed')
    mode.add_argument('--baseline-collect', action='store_true', help='Refresh the legacy baseline before installation, using only stable reads')
    parser.add_argument('--baseline', type=Path, help='Explicit private baseline from this verification session')
    parser.add_argument('--output', type=Path)
    parser.add_argument('--user', type=int, default=0)
    args = parser.parse_args()
    if args.self_test:
        self_test()
    else:
        if args.baseline is None or args.output is None or args.user < 0:
            parser.error('Collection requires explicit --baseline, a fresh --output directory and nonnegative --user')
        raise SystemExit(collect(args.baseline, args.output, args.user, args.baseline_collect))
