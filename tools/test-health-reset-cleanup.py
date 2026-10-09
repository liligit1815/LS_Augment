"""Offline fixture for the production health cleanup body; never invokes ADB.

Only the fixed Android sandbox/proc roots are relocated to disposable fixture
directories. PackageManager, process identity, stop and numeric UID replies are
simulated; file validation/removal uses the real shell and real fixture files.
"""
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'audit-output' / 'health-reset-fixture'
OUTPUT.mkdir(parents=True, exist_ok=True)
SCRIPT = (ROOT / 'android/app/src/main/assets/health_reset_cleanup.sh').read_text(encoding='utf-8')
GIT_BASH = Path(r'C:\Program Files\Git\bin\bash.exe')
BASH = str(GIT_BASH) if GIT_BASH.exists() else shutil.which('bash')
assert BASH, 'A host shell is required for the offline fixture'
FILES = ('databases/ls_augment_steps_v1.db', 'databases/ls_augment_steps_v1.db-wal',
         'databases/ls_augment_steps_v1.db-shm', 'databases/ls_augment_steps_v1.db-journal',
         'files/ls_augment_steps.lock')


def posix(path):
    text = path.resolve().as_posix()
    return '/' + text[0].lower() + text[2:] if len(text) > 2 and text[1] == ':' else text


def quote(text):
    return "'" + text.replace("'", "'\"'\"'") + "'"


results = []
with tempfile.TemporaryDirectory(prefix='fixture-', dir=OUTPUT) as temporary:
    fixture_root = Path(temporary).resolve()
    assert fixture_root.is_relative_to(OUTPUT.resolve())
    for case in ('clear', 'empty', 'late-ledger', 'empty-surviving-process', 'wrong-package-uid', 'foreign-file-owner',
                 'file-symlink', 'directory-symlink', 'surviving-process', 'stop-failure',
                 'directory-replaced-after-stop'):
        root = fixture_root / case
        base = root / 'com.mi.health'
        (base / 'databases').mkdir(parents=True)
        (base / 'files').mkdir()
        (root / 'proc').mkdir()
        native = base / 'databases/fitness_data'
        native.write_bytes(b'native health history stays unchanged')
        native_summary = base / 'databases/fitness_summary'
        native_summary.write_bytes(b'native summary stays unchanged')
        real_login = base / 'files/account-login.json'
        real_login.write_bytes(b'original user login stays unchanged')
        for name in FILES:
            if case not in ('empty', 'late-ledger', 'empty-surviving-process'):
                (base / name).write_bytes(b'module fixture')
        if case in ('surviving-process', 'empty-surviving-process'):
            (root / 'proc/42').mkdir()
            (root / 'proc/42/status').write_text('Uid:\t10177\t10177\t10177\t10177\n', encoding='utf-8')
        outside = root / 'outside'
        outside.mkdir()
        external = outside / 'ls_augment_steps_v1.db'
        external.write_bytes(b'outside sentinel')
        fixture = posix(base)
        # Preserve the exact production allowlist/guards/deletion commands. The
        # only root replacement allows this host to test disposable paths.
        body = SCRIPT.replace('/data/user/$expected_user/com.mi.health', fixture)
        body = body.replace('/proc/[0-9]*', posix(root / 'proc') + '/[0-9]*')
        prefix = f'''expected_user=0
expected_uid=10177
base={quote(fixture)}
fixture_case={quote(case)}
id() {{ printf '0\\n'; }}
cmd() {{
    if [ "$fixture_case" = wrong-package-uid ]; then printf 'package:com.mi.health uid:10178\\n';
    else printf 'package:com.mi.health uid:10177\\n'; fi
}}
stat() {{
    [ -e "$3" ] || return 1
    if [ "$fixture_case" = foreign-file-owner ] && [ "$3" = "$base/databases/ls_augment_steps_v1.db-shm" ]; then printf '10178\\n';
    else printf '10177\\n'; fi
}}
sleep() {{ :; }}
am() {{
    [ "$fixture_case" != stop-failure ] || return 1
    if [ "$fixture_case" = directory-replaced-after-stop ]; then
        mv "$base/databases" "$base/old-databases"
        ln -s {quote(posix(outside))} "$base/databases"
    fi
    if [ "$fixture_case" = late-ledger ]; then
        printf 'late module fixture' > "$base/databases/ls_augment_steps_v1.db"
        printf 'late lock fixture' > "$base/files/ls_augment_steps.lock"
    fi
}}
'''
        if case == 'file-symlink':
            prefix += f'rm -f "$base/databases/ls_augment_steps_v1.db"\nln -s {quote(posix(external))} "$base/databases/ls_augment_steps_v1.db"\n'
        if case == 'directory-symlink':
            prefix += f'mv "$base/databases" "$base/old-databases"\nln -s {quote(posix(outside))} "$base/databases"\n'
        script = root / 'fixture.sh'
        script.write_text(prefix + body, encoding='utf-8', newline='\n')
        environment = dict(os.environ)
        if GIT_BASH.exists():
            environment['MSYS'] = 'winsymlinks'
        run = subprocess.run([BASH, posix(script)], capture_output=True, text=True, timeout=20, env=environment)
        success = run.returncode == 0
        assert success == (case in ('clear', 'empty', 'late-ledger')), (case, run.returncode, run.stdout, run.stderr)
        store = base / ('old-databases' if case in ('directory-symlink', 'directory-replaced-after-stop') else 'databases')
        assert (store / 'fitness_data').read_bytes() == b'native health history stays unchanged'
        assert (store / 'fitness_summary').read_bytes() == b'native summary stays unchanged'
        assert real_login.read_bytes() == b'original user login stays unchanged'
        assert external.read_bytes() == b'outside sentinel'
        if case == 'clear':
            assert not any((base / name).exists() for name in FILES)
            assert 'HEALTH_RESET_FILES=5' in run.stdout and 'HEALTH_RESET_LEDGER_PRESENT=1' in run.stdout
        elif case == 'empty':
            assert 'HEALTH_RESET_FILES=0' in run.stdout and 'HEALTH_RESET_LEDGER_PRESENT=0' in run.stdout
        elif case == 'late-ledger':
            assert not any((base / name).exists() for name in FILES)
            assert 'HEALTH_RESET_FILES=2' in run.stdout and 'HEALTH_RESET_LEDGER_PRESENT=1' in run.stdout
        elif case == 'empty-surviving-process':
            assert not any((base / name).exists() for name in FILES)
        else:
            assert (base / 'files/ls_augment_steps.lock').read_bytes() == b'module fixture', 'failure removed files'
        results.append({'case': case, 'passed': True, 'exitCode': run.returncode,
                        'result': run.stdout.strip(), 'nativeHistoryUnchanged': True,
                        'realHealthLoginUnchanged': True, 'outsideSentinelUnchanged': True})
report = {'success': True, 'scope': 'OFFLINE_RELOCATED_SANDBOX_NO_ADB_OR_DEVICE_MUTATION', 'cases': results}
(OUTPUT / 'result.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(report, ensure_ascii=False, indent=2))
