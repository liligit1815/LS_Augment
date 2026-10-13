"""Read-only stable native launcher SQLite snapshots and private logical digests.

This development helper never stops/starts an app, changes settings, or writes to
the device. SQLite recovery runs only against verified disposable local copies.
"""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import shlex
import sqlite3
import time

ROOT = Path(__file__).resolve().parents[1]
PACKAGE = 'com.zte.mifavor.launcher'
DATABASES = ('LauncherSrc.db', 'app_icons.db', 'app_title.db', 'launcher.db', 'quickstep.db')
SUFFIXES = ('', '-wal', '-shm', '-journal')
LIMIT = 512 * 1024 * 1024
spec = importlib.util.spec_from_file_location('health_readonly', ROOT / 'tools/verify-health-private-migration-device.py')
health = importlib.util.module_from_spec(spec)
spec.loader.exec_module(health)


def manifest(user):
    names = [f'{domain}/{user}/{PACKAGE}/databases/{name}{suffix}'
             for domain in ('user', 'user_de') for name in DATABASES for suffix in SUFFIXES]
    lines = ['set -eu', '[ "$(id -u)" = 0 ]', 'cd /data']
    for domain in ('user', 'user_de'):
        base = f'/data/{domain}/{user}/{PACKAGE}'
        lines += [
            'base=' + shlex.quote(base),
            '[ -d "$base" ] && [ ! -L "$base" ] || exit 73',
            'canonical=$(readlink -f "$base")',
            '[ "$canonical" = "$base" ] || { [ ' + shlex.quote(domain) + ' = user ] && [ ' + str(user) + ' = 0 ] && [ "$canonical" = ' + shlex.quote('/data/data/' + PACKAGE) + ' ]; } || exit 73',
            'uid=$(stat -c %u "$base")',
            'cmd package list packages --user ' + str(user) + ' -U ' + PACKAGE + ' | grep -Fx "package:' + PACKAGE + ' uid:$uid" >/dev/null',
            'dir="$base/databases"',
            'if [ -e "$dir" ] || [ -L "$dir" ];then',
            ' [ -d "$dir" ] && [ ! -L "$dir" ] && [ "$(stat -c %u "$dir")" = "$uid" ] && [ "$(readlink -f "$dir")" = "$canonical/databases" ] || exit 73',
            ' printf "DIRECTORY\\t%s\\t1\\t%s\\n" "$dir" "$uid"',
            ' for entry in "$dir"/*;do',
            '  [ -e "$entry" ] || [ -L "$entry" ] || continue',
            '  case "${entry##*/}" in',
            '   ' + '|'.join(name + suffix for name in DATABASES for suffix in SUFFIXES) + ') ;;',
            '   cached) [ -d "$entry" ] && [ ! -L "$entry" ] || exit 73 ;;',
            '   *) exit 74 ;;',
            '  esac',
            ' done',
            'else printf "DIRECTORY\\t%s\\t0\\t%s\\n" "$dir" "$uid";fi',
        ]
        for name in names:
            if not name.startswith(f'{domain}/{user}/'):
                continue
            filename = name.rsplit('/', 1)[1]
            lines += [
                'file=' + shlex.quote(name),
                'if [ -e "$file" ] || [ -L "$file" ];then',
                ' [ -f "$file" ] && [ ! -L "$file" ] && [ "$(stat -c %u "$file")" = "$uid" ] && [ "$(stat -c %h "$file")" = 1 ] || exit 73',
                ' [ "$(readlink -f "$file")" = "$canonical/databases/' + filename + '" ] || exit 73',
                ' size=$(stat -c %s "$file");[ "$size" -le ' + str(LIMIT) + ' ] || exit 73',
                ' hash=$(sha256sum "$file");hash=${hash%% *}',
                ' printf "%s\\t%s\\t%s\\t%s\\n" "$file" "$hash" "$size" "$uid"',
                'else printf "%s\\t-\\t0\\t%s\\n" "$file" "$uid";fi',
            ]
    files, directories = {}, {}
    for line in health.remote('\n'.join(lines)).decode('utf-8').splitlines():
        name, value, size, uid = line.split('\t')
        if name == 'DIRECTORY':
            directories[value] = {'exists': size == '1', 'uid': int(uid)}
        else:
            if name not in names or name in files:
                raise RuntimeError('Unexpected inventory entry')
            files[name] = None if value == '-' else {'sha256': value, 'size': int(size), 'uid': int(uid)}
    if set(files) != set(names) or len(directories) != 2 or sum(entry['size'] for entry in files.values() if entry) > LIMIT:
        raise RuntimeError('Incomplete or oversized native snapshot')
    return {'files': files, 'directories': directories}


def digest_rows(connection, table, columns, where='', parameters=(), distinct=False):
    quote = lambda value: '"' + value.replace('"', '""') + '"'
    # Sort exact typed row encodings locally; do not depend on Android-specific
    # SQLite collations or expose application names, intents, or widget payloads.
    rows = []
    query = 'SELECT ' + ('DISTINCT ' if distinct else '') + ','.join(map(quote, columns)) + ' FROM ' + quote(table) + where
    for row in connection.execute(query, parameters):
        values = [{'blob': value.hex()} if isinstance(value, bytes) else value for value in row]
        rows.append(json.dumps(values, ensure_ascii=False, separators=(',', ':')).encode('utf-8'))
    digest = hashlib.sha256()
    for encoded in sorted(rows):
        digest.update(len(encoded).to_bytes(8, 'big'))
        digest.update(encoded)
    return {'columns': columns, 'rows': len(rows), 'sha256': digest.hexdigest()}


def summarize_layout(output):
    snapshot = json.loads((output / 'source-manifest-private.json').read_text(encoding='utf-8'))
    result = {}
    # Cache freshness, image cache bytes, unread counts, launch frequency, and
    # favorites.modified are recorded separately, never layout failure criteria.
    columns = ['_id', 'title', 'intent', 'container', 'screen', 'cellX', 'cellY',
               'spanX', 'spanY', 'itemType', 'appWidgetId', 'appWidgetProvider',
               'profileId', 'rank', 'options', 'appWidgetSource']
    for name, entry in snapshot['files'].items():
        if entry is None or not name.endswith('/launcher.db'):
            continue
        db = sqlite3.connect((output / 'local-working-private' / name).resolve().as_uri() + '?mode=rw', uri=True)
        try:
            db.execute('BEGIN')
            per_type = {str(kind): digest_rows(db, 'favorites', columns, ' WHERE itemType=?', (kind,))
                        for (kind,) in db.execute('SELECT DISTINCT itemType FROM favorites ORDER BY itemType')}
            result[name] = {'favorites': digest_rows(db, 'favorites', columns),
                            'by_item_type': per_type,
                            'occupied_desktop_pages': digest_rows(db, 'favorites', ['screen'], ' WHERE container=-100', distinct=True),
                            'ignored_favorites_columns': ['icon', 'modified', 'restored']}
        finally:
            db.close()
    if not result:
        raise RuntimeError('No native layout database found')
    (output / 'layout-summary-private.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    return result


def summarize(output):
    snapshot = json.loads((output / 'source-manifest-private.json').read_text(encoding='utf-8'))
    all_summary = {}
    for name, entry in snapshot['files'].items():
        if entry is None or name.rsplit('/', 1)[1] not in DATABASES:
            continue
        path = output / 'local-working-private' / name
        db = sqlite3.connect(path.resolve().as_uri() + '?mode=rw', uri=True)
        try:
            if db.execute('PRAGMA quick_check').fetchall() != [('ok',)]:
                raise RuntimeError('Local native database integrity check failed')
            db.execute('BEGIN')
            tables = {}
            for (table,) in db.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' ORDER BY name"):
                quoted = '"' + table.replace('"', '""') + '"'
                columns = [row[1] for row in db.execute('PRAGMA table_info(' + quoted + ')')]
                tables[table] = digest_rows(db, table, columns)
            all_summary[name] = {'quick_check': 'ok', 'tables': tables}
        finally:
            db.close()
    (output / 'logical-summary-private.json').write_text(json.dumps(all_summary, ensure_ascii=False, indent=2), encoding='utf-8')
    return all_summary


def collect(output, user):
    if not os.environ.get('LS_AUGMENT_DEVICE', '').strip():
        raise RuntimeError('Explicit LS_AUGMENT_DEVICE is required')
    output.mkdir(parents=True, exist_ok=True)
    if (output / 'stable-databases-private.tar').exists():
        raise RuntimeError('Refusing to overwrite an existing baseline')
    for attempt in range(1, 6):
        first = manifest(user)
        present = [name for name, entry in first['files'].items() if entry]
        if not present:
            raise RuntimeError('Native databases are missing')
        raw = health.remote('tar -cf - -C /data ' + ' '.join(map(shlex.quote, present)))
        second = manifest(user)
        if first == second:
            try:
                files = health.verify_archive(raw, first['files'])
                break
            except RuntimeError:
                if attempt == 5:
                    raise
        if attempt == 5:
            raise RuntimeError('Launcher databases are changing; no stable baseline obtained')
        time.sleep(0.5)
    (output / 'stable-databases-private.tar').write_bytes(raw)
    (output / 'source-manifest-private.json').write_text(json.dumps(first, indent=2), encoding='utf-8')
    for name, value in files.items():
        path = output / 'local-working-private' / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(value)
    summary = summarize(output)
    layout = summarize_layout(output)
    report = {'success': True, 'read_only_device_access': True, 'package': PACKAGE,
              'stable_snapshot_attempt': attempt, 'databases': len(summary),
              'files': len(files), 'archive_sha256': hashlib.sha256(raw).hexdigest(),
              'layout': {name: {'rows': data['favorites']['rows'],
                               'sha256': data['favorites']['sha256'],
                               'item_type_counts': {kind: table['rows'] for kind, table in data['by_item_type'].items()},
                               'occupied_desktop_pages': data['occupied_desktop_pages']['rows']}
                         for name, data in layout.items()},
              'tables': {name: {table: {'rows': data['rows'], 'columns': data['columns']}
                                for table, data in db['tables'].items()} for name, db in summary.items()}}
    (output / 'verification.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
    print(json.dumps(report, ensure_ascii=False))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--collect', action='store_true', required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--user', type=int, default=0)
    args = parser.parse_args()
    if args.user < 0:
        parser.error('User must be nonnegative')
    collect(args.output, args.user)
