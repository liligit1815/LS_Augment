"""Run the production recovery journal model, wrapper, and generated shell.

Requires javac/java and real Git Bash. All executable scripts use temporary host
paths; no su/adb/real RootShell.run. The explicit fsync adapter calls os.fsync for
regular files but only records directory requests. NTFS does not establish
Android directory durability, SELinux behavior, or power-loss safety.
"""
from concurrent.futures import ThreadPoolExecutor
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import itertools
import json

ARTIFACTS = Path(os.environ["LSA_JOURNAL_ARTIFACTS"]) if os.environ.get("LSA_JOURNAL_ARTIFACTS") else None
CALL_IDS = itertools.count(1)
if ARTIFACTS is not None:
    ARTIFACTS.mkdir(parents=True, exist_ok=False)


def captured_run(argv, **kwargs):
    result = subprocess.run(argv, **kwargs)
    if ARTIFACTS is not None:
        call = ARTIFACTS / "calls" / f"{next(CALL_IDS):04d}"
        call.mkdir(parents=True)
        (call / "input.bin").write_bytes(kwargs.get("input", b""))
        (call / "stdout.bin").write_bytes(result.stdout or b"")
        (call / "stderr.bin").write_bytes(result.stderr or b"")
        (call / "result.json").write_text(json.dumps({"argv": [str(a) for a in argv], "exitCode": result.returncode}, indent=2) + "\n", encoding="utf-8")
    return result

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
BASH = Path(r'C:\Program Files\Git\bin\bash.exe')
ROOT_ASSIGNMENT = "ROOT='/data/adb/ls_augment/v2'"
SUCCESS = b'LSA_RECOVERY_JOURNAL_OK'
OWNER = 'aaaa0000-0000-0000-0000-000000000001'


def quoted(value):
    return "'" + str(value).replace("'", "'\"'\"'") + "'"


def bash(script, *, stdin=b'', env=None):
    if '/data/adb' in script:
        raise AssertionError('Refusing an executable device path')
    if env is not None:
        env = dict(env, LSA_TEST_PATH=env['PATH'])
    return captured_run([str(BASH), '--noprofile', '--norc', '-c', script],
                          input=stdin, capture_output=True, env=env, timeout=60)


def posix(path):
    result = captured_run([str(BASH), '--noprofile', '--norc', '-c',
                             'cygpath -u -- "$1"', 'journal-test', str(path.absolute())],
                            capture_output=True, check=True, timeout=10)
    return result.stdout.decode('utf-8').strip()


def description(result):
    return f'exit={result.returncode}, stdout={result.stdout!r}, stderr={result.stderr!r}'


def record(index=1, **changes):
    fields = dict(magic='LSARJ1', operation=f'00000000-0000-0000-0000-{index:012x}',
                  owner=OWNER, owner_user='0', user='10', serial='42',
                  package='com.example.same', identity='a' * 64, created='123456789',
                  stage='PREPARED', state='VISIBLE', code='0', timed='0')
    fields.update(changes)
    return '|'.join(fields.values()).encode('ascii')


def batch(*records):
    return b''.join(value + b'\n' for value in records)


class JournalTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if not BASH.is_file():
            raise RuntimeError(f'Real Git Bash required: {BASH}')
        if ARTIFACTS is None:
            cls.temporary = tempfile.TemporaryDirectory(prefix='ls-hide-journal-')
            cls.addClassCleanup(cls.temporary.cleanup)
            cls.workspace = Path(cls.temporary.name)
        else:
            cls.workspace = ARTIFACTS / 'workspace'
            cls.workspace.mkdir()
            for name in ('RootShell.java', 'HideRecoveryJournal.java', 'HideRestoreGrantLedger.java'):
                (ARTIFACTS / name).write_bytes((JAVA / name).read_bytes())
        package = cls.workspace / 'ls/augment/com'
        package.mkdir(parents=True)
        probe = package / 'JournalCommandProbe.java'
        probe.write_text('''package ls.augment.com;
public final class JournalCommandProbe {
    public static void main(String[] args) { System.out.print(HideRecoveryJournal.command()); }
}
''', encoding='utf-8')
        classes = cls.workspace / 'classes'
        compiled = captured_run(['javac', '-encoding', 'UTF-8', '--release', '17',
                                   '-d', str(classes), str(JAVA / 'RootShell.java'),
                                   str(JAVA / 'HideRecoveryJournal.java'), str(JAVA / 'HideRestoreGrantLedger.java'), str(probe)],
                                  capture_output=True, timeout=30)
        if compiled.returncode:
            raise AssertionError(description(compiled))
        generated = captured_run(['java', '-cp', str(classes),
                                    'ls.augment.com.JournalCommandProbe'],
                                   capture_output=True, check=True, timeout=10)
        cls.command = generated.stdout.decode('utf-8')
        assignments = [line for line in cls.command.splitlines()
                       if line.lstrip().startswith('ROOT=')]
        if assignments != [ROOT_ASSIGNMENT] or cls.command.count(ROOT_ASSIGNMENT) != 1:
            raise AssertionError(f'Expected one fixed ROOT assignment: {assignments!r}')
        cls.shell_path = bash('printf %s "$PATH"').stdout.decode('utf-8')
        if not cls.shell_path:
            raise AssertionError('Git Bash PATH unavailable')
        cls.fsync_bin = cls.workspace / 'fsync-bin'
        cls.fsync_bin.mkdir()
        cls.fsync_log = cls.workspace / 'fsync.log'
        adapter = cls.workspace / 'host_fsync.py'
        adapter.write_text('''import os
from pathlib import Path
import sys
for arg in sys.argv[1:]:
    path = Path(arg)
    with open(os.environ["LSA_TEST_FSYNC_LOG"], "a", encoding="utf-8") as log:
        log.write(("directory-call-only " if path.is_dir() else "file-fsync ") + str(path) + "\\n")
    if not path.is_dir():
        fd = os.open(path, os.O_RDWR | os.O_BINARY)
        try:
            os.fsync(fd)
        finally:
            os.close(fd)
''', encoding='utf-8')
        wrapper = cls.fsync_bin / 'fsync'
        wrapper.write_text('#!/usr/bin/bash\nexec ' + quoted(posix(Path(sys.executable))) +
                           ' ' + quoted(posix(adapter)) + ' "$@"\n',
                           encoding='utf-8', newline='\n')
        wrapper.chmod(0o755)
        startup = cls.workspace / 'bash-env'
        startup.write_text('export PATH="$LSA_TEST_PATH"\n', encoding='utf-8')
        cls.env = dict(os.environ, BASH_ENV=posix(startup),
                       PATH=posix(cls.fsync_bin) + ':' + cls.shell_path,
                       LSA_TEST_FSYNC_LOG=str(cls.fsync_log))
        print('Compiled production Journal + RootShell; only command() is executed. '
              'No real RootShell.run, su, or device commands.', flush=True)
        print('Host adapter: real regular-file os.fsync; directories logged only. '
              'No Android durability, SELinux, or power-loss claim.', flush=True)

    def setUp(self):
        self.case = self.workspace / self._testMethodName
        self.case.mkdir()
        self.root = self.case / 'root'
        self.root.mkdir()
        self.originals = {'targets.conf': b'old targets\x00\xff',
                          'targets.backup.conf': b'old backup',
                          'emergency_restore.sh': b'old script',
                          'recovery-history-v1/selection/old.raw': b'old archive'}
        for relative, content in self.originals.items():
            path = self.root / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(content)

    def run_journal(self, content=None, *, root=None, env=None):
        command = self.command.replace(ROOT_ASSIGNMENT,
                                       'ROOT=' + quoted(posix(root or self.root)))
        return bash(command, stdin=batch(record()) if content is None else content,
                    env=env or self.env)

    def assert_success(self, result):
        self.assertEqual(result.returncode, 0, description(result))
        self.assertEqual(result.stdout.strip(), SUCCESS, description(result))

    def assert_failure(self, result):
        self.assertNotEqual(result.returncode, 0, description(result))
        self.assertNotIn(SUCCESS, result.stdout.splitlines(), description(result))

    def snapshot(self, root=None):
        events = (root or self.root) / 'recovery-journal-v1/events'
        return {p.name: (p.read_bytes(), p.stat().st_ino, p.stat().st_mtime_ns)
                for p in events.glob('*.record') if p.is_file() and not p.is_symlink()}

    def assert_originals(self):
        for relative, content in self.originals.items():
            self.assertEqual((self.root / relative).read_bytes(), content, relative)

    def assert_records(self, *values):
        expected = {}
        for value in values:
            fields = value.split(b'|')
            expected[(fields[1] + b'.' + fields[9] + b'.record').decode()] = value + b'\n'
        self.assertEqual({key: value[0] for key, value in self.snapshot().items()}, expected)
        self.assert_originals()
        journal = self.root / 'recovery-journal-v1'
        self.assertEqual({p.name for p in journal.iterdir()}, {'events'})

    def injected(self, name, body, *, directory=None):
        directory = directory or self.case / (name + '-bin')
        directory.mkdir()
        wrapper = directory / name
        wrapper.write_text('#!/usr/bin/bash\n' + body, encoding='utf-8', newline='\n')
        wrapper.chmod(0o755)
        return dict(self.env, PATH=posix(directory) + ':' + self.env['PATH'])

    def mksh32_env(self):
        # Explicit signed-32-bit numeric-test model. String/file tests stay real
        # Bash builtins; this is not an Android mksh or durability claim.
        startup = self.case / 'mksh32-env'
        startup.write_text(r"""export PATH="$LSA_TEST_PATH"
function [() {
  if [[ $# == 4 && $4 == ']' && $2 =~ ^-(eq|ne|lt|le|gt|ge)$ ]]; then
    local left="$1" right="$3" left_negative=0 right_negative=0
    [[ $left =~ ^-?[0-9]+$ && $right =~ ^-?[0-9]+$ ]] || return 2
    [[ $left == -* ]] && left_negative=1
    [[ $right == -* ]] && right_negative=1
    left=$((10#${left#-} & 4294967295))
    right=$((10#${right#-} & 4294967295))
    ((left_negative)) && left=$(((-left) & 4294967295))
    ((right_negative)) && right=$(((-right) & 4294967295))
    ((left > 2147483647)) && left=$((left - 4294967296))
    ((right > 2147483647)) && right=$((right - 4294967296))
    builtin test "$left" "$2" "$right"
  else
    builtin [ "$@"
  fi
}
""", encoding='utf-8', newline='\n')
        return dict(self.env, BASH_ENV=posix(startup))

    def test_unsigned_boundaries_under_explicit_mksh32_numeric_model(self):
        env = self.mksh32_env()
        # First reproduce the actual call53 numeric-test result in this model.
        probe = bash('[ 223 -le 9223372036854775807 ]', env=env)
        self.assertEqual(probe.returncode, 1, description(probe))
        function = 'unsigned() {' + self.command.split('unsigned() {', 1)[1].split('\n}', 1)[0] + '\n}\n'
        accepted = ['0', '223', '999999', '2147483647', '2147483648', '4294967296',
                    '1789291636275', '999999999999999999', '1000000000000000000',
                    '9223372036854775806', '9223372036854775807']
        rejected = ['', '-1', '-0', '+1', '00', '01', ' 1', '1 ', '1x',
                    '9223372036854775808', '9999999999999999999', '10000000000000000000']
        for value in accepted + rejected:
            with self.subTest(unsigned=value):
                result = bash('export LC_ALL=C\n' + function + 'unsigned ' + quoted(value), env=env)
                self.assertEqual(result.returncode, 0 if value in accepted else 1, description(result))
        print(f'Actual generated unsigned: {len(accepted)} accepted and {len(rejected)} rejected boundaries under explicit 32-bit numeric-test model.', flush=True)

    def test_actual_generated_journal_and_field_limits_under_mksh32_model(self):
        env = self.mksh32_env()
        # Exact LSARJ1 record recovered from stage18 call53 LOCAL_NOT_SENT evidence.
        actual = b'LSARJ1|743db700-ebf3-4c9a-a9a9-4b4f98821860|a927dcc6-312c-4bd9-a96c-15faf4337425|0|0|0|ls.augment.txvictim|14aa2b4d28a1c94c0279a3ec784b465cbfd546a9e4b315b4fb39e5b0b9077428|1789291636275|PREPARED|VISIBLE|0|0'
        accepted = [actual, record(41, owner_user='99999', user='99999', serial='9223372036854775807', created='9223372036854775807', stage='OBSERVED', state='ERROR', code='-2147483648'),
                    record(42, stage='OBSERVED', state='ERROR', code='2147483647')]
        self.assert_success(self.run_journal(batch(*accepted), env=env))
        self.assert_records(*accepted)
        before = self.snapshot()
        invalid = [dict(owner_user='100000'), dict(owner_user='4294967296'), dict(owner_user='9223372036854775807'),
                   dict(user='100000'), dict(user='4294967296'), dict(user='9223372036854775807'),
                   dict(serial='9223372036854775808'), dict(created='9999999999999999999'),
                   dict(created='10000000000000000000'), dict(created='01'),
                   dict(stage='OBSERVED', code='2147483648'), dict(stage='OBSERVED', code='-2147483649'),
                   dict(stage='OBSERVED', code='4294967296'), dict(stage='OBSERVED', code='-4294967296'),
                   dict(stage='OBSERVED', code='-0')]
        for change in invalid:
            with self.subTest(changes=change):
                self.assert_failure(self.run_journal(batch(record(99, **change)), env=env))
                self.assertEqual(before, self.snapshot())
                self.assert_originals()
        print(f'Actual generated journal accepted actual device record plus INT/Long bounds; {len(invalid)} invalid batches rejected without changing evidence under explicit 32-bit numeric-test model.', flush=True)

    def test_prepared_observed_and_replay_are_separate_immutable_records(self):
        prepared = record()
        observed = record(stage='OBSERVED', state='HIDDEN')
        self.assert_success(self.run_journal(batch(prepared)))
        first = self.snapshot()
        self.assert_success(self.run_journal(batch(observed)))
        self.assert_records(prepared, observed)
        for key, value in first.items():
            self.assertEqual(self.snapshot()[key], value)
        before = self.snapshot()
        self.assert_success(self.run_journal(batch(prepared, observed, prepared)))
        self.assertEqual(self.snapshot(), before, 'Replay changed record bytes/inode/mtime')

    def test_eight_entries_and_numeric_boundaries_round_trip(self):
        entries = [record(index + 1, owner_user='99999', user=str(index),
                          serial='9223372036854775807', created='9223372036854775807',
                          identity='unknown', stage='OBSERVED', state='ERROR',
                          code='-2147483648' if index % 2 else '2147483647', timed='1')
                   for index in range(8)]
        self.assert_success(self.run_journal(batch(*entries)))
        self.assert_records(*entries)

    def test_explicit_show_stages_are_distinct_and_replay_safe(self):
        entries = [record(21, stage='SHOW_PREPARED', state='HIDDEN'),
                   record(21, stage='SHOW_OBSERVED', state='VISIBLE'),
                   record(22, stage='SHOW_PREPARED', state='VISIBLE'),
                   record(22, stage='SHOW_OBSERVED', state='ERROR', code='-1', timed='1')]
        self.assert_success(self.run_journal(batch(*entries)))
        self.assert_records(*entries)
        before = self.snapshot()
        self.assert_success(self.run_journal(batch(*entries)))
        self.assertEqual(before, self.snapshot())

    def test_invalid_show_preparation_never_publishes(self):
        for changes in (dict(state='ERROR'), dict(state='MISSING'), dict(code='1'), dict(timed='1')):
            with self.subTest(changes=changes):
                self.assert_failure(self.run_journal(batch(record(stage='SHOW_PREPARED', **changes))))
                self.assertEqual(self.snapshot(), {})
    def test_invalid_fields_reject_whole_batch_before_any_publication(self):
        malformed = [dict(magic='LSARJ2'), dict(operation='../outside'),
                     dict(operation='ABCDEF00-0000-0000-0000-000000000001'),
                     dict(owner='x'), dict(owner_user='-1'), dict(user='100000'),
                     dict(user='00'), dict(serial='-1'), dict(serial='9223372036854775808'),
                     dict(created='+1'), dict(created='9223372036854775808'),
                     dict(package='single'), dict(package='com..app'),
                     dict(package='com.a;touch x'), dict(package='com.' + 'a' * 252),
                     dict(identity='A' * 64), dict(identity='a' * 63),
                     dict(stage='../OBSERVED'), dict(state='BOGUS'), dict(code='1'),
                     dict(timed='1'), dict(state='HIDDEN'),
                     dict(stage='OBSERVED', code='2147483648'),
                     dict(stage='OBSERVED', code='-2147483649'),
                     dict(stage='OBSERVED', code='-0'), dict(timed='false')]
        for fields in malformed:
            with self.subTest(fields=fields):
                self.assert_failure(self.run_journal(batch(record(99), record(**fields))))
                self.assertEqual(self.snapshot(), {})
                self.assert_originals()
        print(f'Actual shell rejected {len(malformed)} malformed-field batches before publication.', flush=True)

    def test_framing_and_limits_fail_without_silent_truncation(self):
        value = record()
        invalid = [b'', value, batch(value) + b'unterminated',
                   batch(value + b'\r'), batch(value) + b'\n',
                   batch(value.replace(b'com.example', b'com.\x00example')),
                   batch(value.replace(b'com.example', b'com.\xffexample')),
                   batch(value + b'|extra'), batch(value + b'x' * 2048),
                   batch(*(record(i + 1) for i in range(9))), b'x' * 16385]
        for content in invalid:
            with self.subTest(size=len(content), tail=content[-25:]):
                self.assert_failure(self.run_journal(content))
                self.assertEqual(self.snapshot(), {})
                self.assert_originals()

    def test_conflicting_duplicate_batch_publishes_nothing(self):
        self.assert_failure(self.run_journal(batch(record(), record(serial='43'))))
        self.assertEqual(self.snapshot(), {})
        self.assert_originals()

    def test_existing_conflict_never_overwrites_evidence(self):
        self.assert_success(self.run_journal())
        before = self.snapshot()
        self.assert_failure(self.run_journal(batch(record(serial='43'))))
        self.assertEqual(self.snapshot(), before)
        self.assert_originals()
        dest = self.root / 'recovery-journal-v1/events' / next(iter(before))
        dest.write_bytes(b'previous malformed evidence\x00\xff')
        before = self.snapshot()
        self.assert_failure(self.run_journal())
        self.assertEqual(self.snapshot(), before)

    def test_checked_copy_hash_compare_publish_permission_and_input_failures(self):
        for name in ('cp', 'sha256sum', 'cmp', 'ln', 'fsync', 'chmod', 'cat', 'mktemp'):
            with self.subTest(tool=name):
                marker = self.case / (name + '-called')
                env = self.injected(name, f'printf x >> {quoted(posix(marker))}\nexit 74\n')
                self.assert_failure(self.run_journal(env=env))
                self.assertTrue(marker.is_file(), f'{name} failure injection did not run')
                self.assertEqual(self.snapshot(), {})
                self.assert_originals()

    def test_checked_printf_failure_stops_record_staging(self):
        marker = self.case / 'printf-called'
        startup = self.case / 'printf-env'
        # PATH cannot override a shell builtin. This explicit injected function
        # fails only the canonical record write and leaves diagnostics intact.
        startup.write_text('export PATH="$LSA_TEST_PATH"\n'
                           'printf() {\n'
                           '  if [ "$1" = \'%s\\n\' ]; then\n'
                           '    case "$2" in LSARJ1\\|*)\n'
                           f'    builtin printf x >> {quoted(posix(marker))}\n'
                           '    return 74 ;; esac\n  fi\n'
                           '  builtin printf "$@"\n}\n', encoding='utf-8')
        result = self.run_journal(env=dict(self.env, BASH_ENV=posix(startup)))
        self.assert_failure(result)
        self.assertIn(b'recovery_journal:normalize_write', result.stderr)
        self.assertTrue(marker.is_file())
        self.assertEqual(self.snapshot(), {})
        self.assert_originals()

    def test_partially_published_batch_survives_later_link_failure(self):
        env = self.injected('ln', '''case "$2" in
  *000000000002.PREPARED.record) exit 74 ;;
esac
exec /usr/bin/ln "$@"
''')
        self.assert_failure(self.run_journal(batch(record(1), record(2)), env=env))
        self.assert_records(record(1))
        first = self.snapshot()
        self.assert_success(self.run_journal(batch(record(1), record(2))))
        self.assert_records(record(1), record(2))
        for key, value in first.items():
            self.assertEqual(self.snapshot()[key], value)

    def test_fsync_receives_files_and_all_parent_directories(self):
        log = self.case / 'calls.log'
        self.assert_success(self.run_journal(env=dict(self.env, LSA_TEST_FSYNC_LOG=str(log))))
        recorded = [line.split(' ', 1) for line in log.read_text(encoding='utf-8').splitlines()]
        dirs = {Path(path) for kind, path in recorded if kind == 'directory-call-only'}
        journal = self.root / 'recovery-journal-v1'
        self.assertEqual(dirs, {journal / 'events', journal, self.root,
                                self.root.parent, self.root.parent.parent})
        files = [Path(path) for kind, path in recorded if kind == 'file-fsync']
        self.assertEqual(len(files), 2)
        self.assertEqual(files[0].name, files[1].name)
        self.assertTrue(files[0].parent.name.startswith('.batch.'))
        self.assertEqual(files[1].parent, journal / 'events')

    def test_directory_fsync_and_post_publish_hash_failure_retain_records(self):
        record_sync = self.injected('fsync',
                                    'case "$1" in */events/*) exit 74 ;; esac\n'
                                    f'exec {quoted(posix(self.fsync_bin / "fsync"))} "$@"\n',
                                    directory=self.case / 'record-sync-bin')
        result = self.run_journal(env=record_sync)
        self.assert_failure(result)
        self.assertIn(b'recovery_journal:record_sync', result.stderr)
        self.assert_records(record())
        env = self.injected('fsync', 'for arg in "$@"; do\n'
                            '  [ ! -d "$arg" ] || exit 74\ndone\n'
                            f'exec {quoted(posix(self.fsync_bin / "fsync"))} "$@"\n')
        self.assert_failure(self.run_journal(env=env))
        self.assert_records(record())
        before = self.snapshot()
        env = self.injected('sha256sum', '''case "$1" in */events/*)
  printf '%064d  %s\\n' 0 "$1"; exit 0 ;; esac
exec /usr/bin/sha256sum "$@"
''')
        self.assert_failure(self.run_journal(env=env))
        self.assertEqual(self.snapshot(), before)
        self.assert_originals()

    def test_missing_fsync_fails_closed(self):
        empty = self.case / 'empty-path'
        empty.mkdir()
        env = dict(self.env, PATH=posix(empty))
        self.assertNotEqual(bash('command -v fsync', env=env).returncode, 0)
        self.assert_failure(self.run_journal(env=env))
        self.assertEqual(self.snapshot(), {})
        self.assert_originals()

    def test_concurrent_equal_and_distinct_writers_do_not_overwrite(self):
        entries = [record(index % 4 + 1) for index in range(8)]
        with ThreadPoolExecutor(max_workers=8) as executor:
            results = list(executor.map(lambda entry: self.run_journal(batch(entry)), entries))
        for result in results:
            self.assert_success(result)
        self.assert_records(*(record(index + 1) for index in range(4)))

    def test_non_directory_paths_and_directory_record_are_rejected(self):
        for index, relative in enumerate(('recovery-journal-v1', 'recovery-journal-v1/events')):
            root = self.case / ('obstacle-' + str(index))
            root.mkdir()
            obstacle = root / relative
            obstacle.parent.mkdir(parents=True, exist_ok=True)
            obstacle.write_bytes(b'keep obstacle')
            self.assert_failure(self.run_journal(root=root))
            self.assertEqual(obstacle.read_bytes(), b'keep obstacle')
        dest = self.root / 'recovery-journal-v1/events/00000000-0000-0000-0000-000000000001.PREPARED.record'
        dest.mkdir(parents=True)
        self.assert_failure(self.run_journal())
        self.assertTrue(dest.is_dir())
        self.assert_originals()

    def test_real_symlink_parent_directory_and_record_are_rejected(self):
        outside = self.case / 'outside'
        outside.mkdir()
        evidence = outside / 'evidence'
        evidence.write_bytes(b'outside remains untouched')
        probe = self.case / 'probe-link'
        try:
            os.symlink(evidence, probe)
        except OSError as error:
            self.skipTest(f'Native Windows symlinks unavailable: {error}')
        if bash(f'test -L {quoted(posix(probe))}').returncode:
            self.skipTest('Git Bash cannot recognize native filesystem symlinks')
        paths = ('recovery-journal-v1', 'recovery-journal-v1/events',
                 'recovery-journal-v1/events/00000000-0000-0000-0000-000000000001.PREPARED.record')
        for index, relative in enumerate(paths):
            root = self.case / ('link-' + str(index))
            root.mkdir()
            link = root / relative
            link.parent.mkdir(parents=True, exist_ok=True)
            directory = not relative.endswith('.record')
            os.symlink(outside if directory else evidence, link, target_is_directory=directory)
            self.assert_failure(self.run_journal(root=root))
            self.assertTrue(link.is_symlink())
            self.assertEqual(evidence.read_bytes(), b'outside remains untouched')
        parent = self.case / 'parent-link'
        os.symlink(outside, parent, target_is_directory=True)
        self.assert_failure(self.run_journal(root=parent / 'nested/root'))
        self.assertEqual(set(p.name for p in outside.iterdir()), {'evidence'})

    def test_permissions_when_host_exposes_posix_modes(self):
        probe = self.case / 'mode-probe'
        probe.write_bytes(b'')
        mode = bash(f'chmod 0600 {quoted(posix(probe))} && '
                    f'chmod 0700 {quoted(posix(self.root))} && '
                    f'stat -c %a {quoted(posix(probe))} {quoted(posix(self.root))}')
        if mode.returncode or mode.stdout.splitlines() != [b'600', b'700']:
            self.skipTest('Git Bash/NTFS does not expose enforceable 0600/0700 modes')
        self.assert_success(self.run_journal())
        journal = self.root / 'recovery-journal-v1'
        for directory in (self.root, journal, journal / 'events'):
            self.assertEqual(bash(f'stat -c %a {quoted(posix(directory))}').stdout.strip(), b'700')
        for file in (journal / 'events').iterdir():
            self.assertEqual(bash(f'stat -c %a {quoted(posix(file))}').stdout.strip(), b'600')

    def test_production_model_and_append_wrapper_with_transport_stub(self):
        package = self.case / 'ls/augment/com'
        package.mkdir(parents=True)
        transport = package / 'RootShell.java'
        transport.write_text('''package ls.augment.com;
final class RootShell {
    static Result next; static int calls; static String command, input;
    static long timeout; static int limit;
    static Result run(String c,String i,long t,int l){calls++;command=c;input=i;timeout=t;limit=l;return next;}
    static final class Result {
        final int exitCode; final String output; final boolean timedOut;
        Result(int c,String o,boolean t){exitCode=c;output=o==null?"":o;timedOut=t;}
        boolean isSuccess(){return !timedOut&&exitCode==0;}
    }
}
''', encoding='utf-8')
        probe = package / 'JournalModelProbe.java'
        probe.write_text(r'''package ls.augment.com;
import java.util.*;
public final class JournalModelProbe {
    static int checks;
    static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    static final String OP="00000000-0000-0000-0000-000000000001";
    static final String OWNER="aaaa0000-0000-0000-0000-000000000001";
    public static void main(String[] args){
        HideRecoveryJournal.Entry prepared=new HideRecoveryJournal.Entry(OP,OWNER,0,10,42,
            "com.example.same","a".repeat(64),123456789,HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
        String encoded=prepared.encode();
        check(encoded.equals("LSARJ1|"+OP+"|"+OWNER+"|0|10|42|com.example.same|"+"a".repeat(64)+
            "|123456789|PREPARED|VISIBLE|0|0"),"canonical encoding differs");
        check(HideRecoveryJournal.parse(encoded).encode().equals(encoded),"round trip failed");
        HideRecoveryJournal.Entry observed=prepared.observed("ERROR",-9,true);
        check(observed.stage==HideRecoveryJournal.Stage.OBSERVED && observed.state.equals("ERROR") &&
            observed.exitCode==-9 && observed.timedOut,"observation fields lost");
        check(observed.operationId.equals(prepared.operationId) && observed.ownerId.equals(prepared.ownerId) &&
            observed.ownerUserId==prepared.ownerUserId && observed.userId==prepared.userId &&
            observed.userSerial==prepared.userSerial && observed.packageName.equals(prepared.packageName) &&
            observed.packageIdentity.equals(prepared.packageIdentity) && observed.createdAt==prepared.createdAt,
            "observation changed operation identity");
        check(prepared.stage==HideRecoveryJournal.Stage.PREPARED && prepared.state.equals("VISIBLE"),"entry mutated");
        for(String initial:new String[]{"HIDDEN","VISIBLE"}) {
            HideRecoveryJournal.Entry show=new HideRecoveryJournal.Entry(OP,OWNER,0,10,42,
                "com.example.same","unknown",123,HideRecoveryJournal.Stage.SHOW_PREPARED,initial,0,false);
            check(HideRecoveryJournal.parse(show.encode())!=null,"show preparation rejected");
            HideRecoveryJournal.Entry done=show.observed("ERROR",-1,true);
            check(done.stage==HideRecoveryJournal.Stage.SHOW_OBSERVED && done.operationId.equals(OP)
                && done.state.equals("ERROR") && done.exitCode==-1 && done.timedOut,"show observation mapping lost");
            check(HideRecoveryJournal.parse(done.encode())!=null,"show observation rejected");
            for(String field:new String[]{"ERROR","MISSING"}) {
                String value=show.encode().replace("|"+initial+"|0|0","|"+field+"|0|0");
                check(HideRecoveryJournal.parse(value)==null,"show preparation accepted unknown state");
            }
            check(HideRecoveryJournal.parse(show.encode().replace("|0|0","|1|0"))==null,"show preparation accepted failed exit");
            check(HideRecoveryJournal.parse(show.encode().replace("|0|0","|0|1"))==null,"show preparation accepted timeout");
        }
        for(String state:new String[]{"VISIBLE","HIDDEN","MISSING","ERROR"}){
            HideRecoveryJournal.Entry entry=new HideRecoveryJournal.Entry(OP,OWNER,99999,99999,Long.MAX_VALUE,
                "Com.a_1.2","unknown",Long.MAX_VALUE,HideRecoveryJournal.Stage.OBSERVED,state,Integer.MIN_VALUE,true);
            check(HideRecoveryJournal.parse(entry.encode()).encode().equals(entry.encode()),"boundary round trip");
        }
        Object[][] bad={{0,"BAD"},{1,OP.toUpperCase().replace("000000000001","AAAAAAAAAAAA")},
            {1,"../escape"},{2,"unknown"},{3,"-1"},{3,"100000"},{4,"01"},{4,"+1"},{4,"-0"},
            {5,"-1"},{5,"9223372036854775808"},{6,"com..app"},{6,"single"},{6,"com.注入"},
            {6,"com.a;id"},{6,"com."+"a".repeat(252)},{7,"A".repeat(64)},{7,"a".repeat(63)},
            {8,"-1"},{8,"9223372036854775808"},{9,"prepared"},{10,"HIDDEN"},{11,"1"},{12,"1"},
            {12,"true"}};
        for(Object[] value:bad){String[] f=encoded.split("\\|",-1);f[(Integer)value[0]]=(String)value[1];
            check(HideRecoveryJournal.parse(String.join("|",f))==null,"accepted malformed field "+Arrays.toString(value));}
        for(String value:new String[]{"",encoded+"\n",encoded+"\r",encoded+"|extra",encoded.replace("com.","com.\0"),
            encoded+"x".repeat(2048)," "+encoded,encoded+" "})
            check(HideRecoveryJournal.parse(value)==null,"accepted invalid framing");
        check(HideRecoveryJournal.parse(null)==null,"null accepted");
        for(String value:new String[]{"2147483648","-2147483649","-0","01"}){
            String[] f=observed.encode().split("\\|",-1);f[11]=value;
            check(HideRecoveryJournal.parse(String.join("|",f))==null,"accepted invalid exit code");}
        boolean rejected=false;
        try{new HideRecoveryJournal.Entry(OP,OWNER,0,10,42,"com.example","unknown",0,
            HideRecoveryJournal.Stage.PREPARED,"HIDDEN",0,false);}catch(IllegalArgumentException e){rejected=true;}
        check(rejected,"constructor accepted invalid PREPARED");
        String marker="LSA_RECOVERY_JOURNAL_OK";
        Object[][] replies={{0,"",false,false},{0,"extra\n"+marker,false,false},
            {0,marker+"\nextra",false,false},{0,marker+"\n"+marker,false,false},
            {0,marker,false,true},{0," \n"+marker+"\n ",false,true},
            {0,marker,true,false},{74,marker,false,false},{-1,marker,false,false}};
        for(Object[] reply:replies){
            RootShell.next=new RootShell.Result((Integer)reply[0],(String)reply[1],(Boolean)reply[2]);
            RootShell.Result result=HideRecoveryJournal.append(List.of(prepared,observed));
            check(result.isSuccess()==(Boolean)reply[3],"incorrect marker gate");
            check(RootShell.input.equals(encoded+"\n"+observed.encode()+"\n"),"stdin changed");
            check(RootShell.timeout==30 && RootShell.limit==4096,"transport bounds changed");
            check(RootShell.command.equals(HideRecoveryJournal.command()),"wrong command");
            if(!RootShell.next.isSuccess())check(result==RootShell.next,"transport failure replaced");
        }
        int calls=RootShell.calls;
        check(!HideRecoveryJournal.append(null).isSuccess(),"null batch accepted");
        check(!HideRecoveryJournal.append(List.of()).isSuccess(),"empty batch accepted");
        check(!HideRecoveryJournal.append(Arrays.asList(prepared,null)).isSuccess(),"null entry accepted");
        check(!HideRecoveryJournal.append(Collections.nCopies(9,prepared)).isSuccess(),"nine entries accepted");
        check(RootShell.calls==calls,"invalid batch called transport");
        RootShell.next=new RootShell.Result(0,marker,false);
        check(HideRecoveryJournal.append(Collections.nCopies(8,prepared)).isSuccess(),"eight entries rejected");
        check(RootShell.calls==calls+1 && RootShell.input.equals((encoded+"\n").repeat(8)),"eight entries truncated");
        System.out.println("Production Entry/parse/observed/append: "+checks+" assertions passed; transport stub only.");
    }
}
''', encoding='utf-8')
        classes = self.case / 'stub-classes'
        compiled = captured_run(['javac', '-encoding', 'UTF-8', '--release', '17',
                                   '-d', str(classes), str(JAVA / 'HideRecoveryJournal.java'), str(JAVA / 'HideRestoreGrantLedger.java'),
                                   str(transport), str(probe)], capture_output=True, timeout=30)
        self.assertEqual(compiled.returncode, 0, description(compiled))
        result = captured_run(['java', '-cp', str(classes), 'ls.augment.com.JournalModelProbe'],
                                capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0, description(result))
        print(result.stdout.decode('utf-8').strip(), flush=True)


if __name__ == '__main__':
    unittest.main(verbosity=2)
