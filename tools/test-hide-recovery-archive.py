"""Execute production recovery archiving in isolated Git Bash directories.

Compiles HideRecoveryArchive and RootShell; never calls real RootShell.run or su.
A host fsync shim flushes regular files with Python os.fsync. Directory calls
are recorded only: NTFS tests cannot establish Android directory durability.
"""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
BASH = Path(r'C:\Program Files\Git\bin\bash.exe')
ROOT_ASSIGNMENT = "ROOT='/data/adb/ls_augment/v2'"
SUCCESS = b'LSA_RECOVERY_ARCHIVE_OK'
SOURCE_FILES = {'targets': 'targets.conf', 'backup': 'targets.backup.conf',
                'script': 'emergency_restore.sh'}
CATEGORIES = (*SOURCE_FILES, 'selection')


def quoted(value):
    return "'" + str(value).replace("'", "'\"'\"'") + "'"


def bash(script, *, stdin=b'', env=None, cwd=None):
    if '/data/adb' in script:
        raise AssertionError('Refusing a script containing an executable device path')
    if env is not None:
        env = dict(env, LSA_TEST_PATH=env['PATH'])
    return subprocess.run(
        [str(BASH), '--noprofile', '--norc', '-c', script], input=stdin,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=env, cwd=cwd,
        timeout=40,
    )


def posix(path):
    # absolute(), rather than resolve(), keeps a symlink under test a symlink.
    result = subprocess.run(
        [str(BASH), '--noprofile', '--norc', '-c', 'cygpath -u -- "$1"',
         'archive-test', str(path.absolute())],
        capture_output=True, check=True, timeout=10,
    )
    return result.stdout.decode('utf-8').strip()


def digest(content):
    return hashlib.sha256(content).hexdigest()


def description(result):
    return (f'exit={result.returncode}, stdout={result.stdout!r}, '
            f'stderr={result.stderr!r}')


class ArchiveTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if not BASH.is_file():
            raise RuntimeError(f'Required real Git Bash is unavailable: {BASH}')
        cls.temporary = tempfile.TemporaryDirectory(prefix='ls-hide-archive-')
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.workspace = Path(cls.temporary.name)
        probe = cls.workspace / 'ls/augment/com/ArchiveCommandProbe.java'
        probe.parent.mkdir(parents=True)
        # Real RootShell is compiled only; the probe invokes just command().
        probe.write_text('''package ls.augment.com;
public final class ArchiveCommandProbe {
    public static void main(String[] args) {
        System.out.print(HideRecoveryArchive.command());
    }
}
''', encoding='utf-8')
        classes = cls.workspace / 'classes'
        subprocess.run([
            'javac', '-encoding', 'UTF-8', '--release', '17', '-d', str(classes),
            str(JAVA / 'RootShell.java'), str(JAVA / 'HideRecoveryArchive.java'),
            str(probe),
        ], check=True, timeout=30)
        generated = subprocess.run([
            'java', '-cp', str(classes), 'ls.augment.com.ArchiveCommandProbe',
        ], check=True, capture_output=True, timeout=10)
        cls.command = generated.stdout.decode('utf-8')
        if cls.command.count(ROOT_ASSIGNMENT) != 1:
            raise AssertionError('Expected exactly one fixed ROOT assignment')
        assignments = [line for line in cls.command.splitlines()
                       if line.lstrip().startswith('ROOT=')]
        if assignments != [ROOT_ASSIGNMENT]:
            raise AssertionError(f'Unexpected ROOT assignments: {assignments!r}')
        cls.shell_path = bash('printf %s "$PATH"').stdout.decode('utf-8')
        if not cls.shell_path:
            raise AssertionError('Unable to discover Git Bash PATH')

        # fsync is not normally available in Git Bash. This deliberately explicit
        # host adapter provides real regular-file fsync and logs directory calls.
        cls.fsync_bin = cls.workspace / 'fsync-bin'
        cls.fsync_bin.mkdir()
        cls.fsync_log = cls.workspace / 'fsync-calls.log'
        adapter = cls.workspace / 'host_fsync.py'
        adapter.write_text('''import os
from pathlib import Path
import sys
for arg in sys.argv[1:]:
    path = Path(arg)
    with open(os.environ["LSA_TEST_FSYNC_LOG"], "a", encoding="utf-8") as log:
        log.write(("directory-call-only " if path.is_dir() else "file-fsync ") + str(path) + "\\n")
    if not path.is_dir():
        # Windows _commit requires a writable descriptor.
        fd = os.open(path, os.O_RDWR | os.O_BINARY)
        try:
            os.fsync(fd)
        finally:
            os.close(fd)
''', encoding='utf-8')
        shim = cls.fsync_bin / 'fsync'
        shim.write_text('#!/usr/bin/bash\nexec ' + quoted(posix(Path(sys.executable))) +
                        ' ' + quoted(posix(adapter)) + ' "$@"\n',
                        encoding='utf-8', newline='\n')
        shim.chmod(0o755)
        startup = cls.workspace / 'bash-env'
        startup.write_text('export PATH="$LSA_TEST_PATH"\n', encoding='utf-8')
        cls.env = dict(os.environ, BASH_ENV=posix(startup),
                       PATH=posix(cls.fsync_bin) + ':' + cls.shell_path,
                       LSA_TEST_FSYNC_LOG=str(cls.fsync_log))
        print('Compiled real HideRecoveryArchive.java and RootShell.java; '
              'executing only command() output, never real RootShell.run.', flush=True)
        print('Host fsync shim: real regular-file os.fsync; directory calls logged '
              'only. No Android, SELinux, directory durability, or power-loss test.',
              flush=True)

    def setUp(self):
        self.case = self.workspace / self._testMethodName
        self.case.mkdir()
        self.root = self.case / 'root'
        self.root.mkdir()

    def seed(self, generation=b'A', root=None):
        root = root or self.root
        result = {}
        for kind, name in SOURCE_FILES.items():
            content = generation + b':' + kind.encode() + b'\n'
            (root / name).write_bytes(content)
            result[kind] = content
        return result

    def source_snapshot(self, root=None):
        root = root or self.root
        return {name: (root / name).read_bytes() for name in SOURCE_FILES.values()
                if (root / name).is_file()}

    def run_archive(self, selection=b'proposed\n', *, root=None, env=None):
        root = root or self.root
        rewritten = self.command.replace(ROOT_ASSIGNMENT, 'ROOT=' + quoted(posix(root)))
        self.assertNotIn('/data/adb', rewritten)
        return bash(rewritten, stdin=selection,
                    env=self.env if env is None else env, cwd=self.case)

    def assert_success(self, result):
        self.assertEqual(result.returncode, 0, description(result))
        self.assertEqual(result.stdout.strip(), SUCCESS, description(result))
        self.assertEqual(result.stdout.splitlines()[-1], SUCCESS, description(result))

    def assert_failure(self, result):
        self.assertNotEqual(result.returncode, 0, description(result))
        self.assertNotIn(SUCCESS, result.stdout.splitlines(), description(result))

    def archived(self, kind, content, root=None):
        return ((root or self.root) / 'recovery-history-v1' / kind /
                (digest(content) + '.raw'))

    def assert_archived(self, kind, content, root=None):
        path = self.archived(kind, content, root)
        self.assertTrue(path.is_file(), str(path))
        self.assertFalse(path.is_symlink(), str(path))
        self.assertEqual(path.read_bytes(), content)

    def test_a_b_c_retention_and_repeated_idempotence(self):
        expected = {kind: set() for kind in CATEGORIES}
        for generation in (b'A', b'B', b'C'):
            old = self.seed(generation)
            selection = b'proposed:' + generation + b'\n'
            before = self.source_snapshot()
            self.assert_success(self.run_archive(selection))
            self.assertEqual(self.source_snapshot(), before)
            for kind, content in {**old, 'selection': selection}.items():
                expected[kind].add(content)
            for kind, versions in expected.items():
                for content in versions:
                    self.assert_archived(kind, content)
        history = self.root / 'recovery-history-v1'
        before = {p.relative_to(history): (p.read_bytes(), p.stat().st_mtime_ns,
                                          p.stat().st_ino)
                  for p in history.rglob('*.raw')}
        for _ in range(3):
            self.assert_success(self.run_archive(b'proposed:C\n'))
        after = {p.relative_to(history): (p.read_bytes(), p.stat().st_mtime_ns,
                                         p.stat().st_ino)
                 for p in history.rglob('*.raw')}
        self.assertEqual(after, before, 'An idempotent save rewrote a history record')
        for kind, versions in expected.items():
            self.assertEqual({p.name for p in (history / kind).iterdir()},
                             {digest(value) + '.raw' for value in versions})
        self.assertFalse(list(history.glob('.pending.*')))
        self.assertFalse(list(history.glob('.input.*')))

    def test_old_rotation_negative_control_loses_a(self):
        # Real cp/writes model the former single-backup rotation. This is an
        # explicit simulation of the old algorithm, not execution of old Java.
        result = bash(f'''ROOT={quoted(posix(self.root))}
printf '%s' A >"$ROOT/targets.conf" || exit 1
for next in B C; do
  cp "$ROOT/targets.conf" "$ROOT/targets.backup.conf" || exit 1
  printf '%s' "$next" >"$ROOT/targets.conf" || exit 1
done
''', cwd=self.case)
        self.assertEqual(result.returncode, 0, description(result))
        retained = [p.read_bytes() for p in self.root.iterdir() if p.is_file()]
        self.assertEqual(set(retained), {b'B', b'C'})
        with self.assertRaises(AssertionError):
            self.assertIn(b'A', retained, 'The old rotation discarded generation A')
        print('Negative control executed: simulated old A -> B -> C backup '
              'rotation loses A; retention assertion rejects it.', flush=True)

    def test_malformed_binary_and_empty_raw_are_not_normalized(self):
        raw = b'\xff\xfe\x00bad package\r\nuser=-9\n{"broken":\n\x80\x00tail'
        old = {kind: raw + kind.encode() for kind in SOURCE_FILES}
        for kind, content in old.items():
            (self.root / SOURCE_FILES[kind]).write_bytes(content)
        selection = '坏格式 selection\r\npackage=???\n'.encode('utf-8') + b'\x00'
        self.assert_success(self.run_archive(selection))
        for kind, content in {**old, 'selection': selection}.items():
            self.assert_archived(kind, content)
        self.assert_success(self.run_archive(b''))
        self.assert_archived('selection', b'')
        self.assertEqual(self.source_snapshot(), {SOURCE_FILES[k]: v for k, v in old.items()})

    def test_missing_sources_and_oversize_rejection(self):
        self.assert_success(self.run_archive(b''))
        self.assert_archived('selection', b'')
        self.seed()
        before = self.source_snapshot()
        self.assert_failure(self.run_archive(b'x' * (1048576 + 1)))
        self.assertEqual(self.source_snapshot(), before)
        (self.root / 'targets.conf').write_bytes(b'x' * (1048576 + 1))
        before = self.source_snapshot()
        self.assert_failure(self.run_archive())
        self.assertEqual(self.source_snapshot(), before)

    def test_copy_hash_publish_and_fsync_failures_preserve_sources(self):
        for tool in ('cp', 'sha256sum', 'cmp', 'ln', 'fsync', 'ls'):
            with self.subTest(tool=tool):
                root = self.case / tool
                root.mkdir()
                self.seed(root=root)
                if tool == 'ls':
                    (root / 'targets.conf').unlink()
                before = self.source_snapshot(root)
                injector = self.case / (tool + '-bin')
                injector.mkdir()
                marker = self.case / (tool + '-called')
                wrapper = injector / tool
                wrapper.write_text('#!/usr/bin/bash\n' +
                                   f'printf x >> {quoted(posix(marker))}\n' +
                                   'exit 74\n', encoding='utf-8', newline='\n')
                wrapper.chmod(0o755)
                env = dict(self.env, PATH=posix(injector) + ':' + self.env['PATH'])
                result = self.run_archive(root=root, env=env)
                self.assertTrue(marker.is_file(),
                                f'{tool} injection did not execute: {description(result)}')
                self.assert_failure(result)
                self.assertEqual(self.source_snapshot(root), before)

    def test_checked_fsync_file_directory_calls_and_directory_failure(self):
        old = self.seed()
        selection = b'proposed\n'
        calls = self.case / 'checked-fsync-calls.log'
        env = dict(self.env, LSA_TEST_FSYNC_LOG=str(calls))
        self.assert_success(self.run_archive(selection, env=env))
        recorded = [line.split(' ', 1) for line in calls.read_text(encoding='utf-8').splitlines()]
        actual_files = {Path(path) for kind, path in recorded if kind == 'file-fsync'}
        actual_dirs = {Path(path) for kind, path in recorded if kind == 'directory-call-only'}
        self.assertEqual(actual_files, {self.archived(kind, content)
                                      for kind, content in {**old, 'selection': selection}.items()})
        history = self.root / 'recovery-history-v1'
        self.assertEqual(actual_dirs, {history, self.root, self.root.parent,
                                     self.root.parent.parent,
                                     *(history / kind for kind in CATEGORIES)})
        injector = self.case / 'directory-fsync-failure'
        injector.mkdir()
        marker = self.case / 'directory-fsync-called'
        wrapper = injector / 'fsync'
        wrapper.write_text('#!/usr/bin/bash\nfor arg in "$@"; do\n'
                           '  if [ -d "$arg" ]; then\n'
                           f'    printf x >> {quoted(posix(marker))}\n'
                           '    exit 74\n  fi\ndone\n'
                           f'exec {quoted(posix(self.fsync_bin / "fsync"))} "$@"\n',
                           encoding='utf-8', newline='\n')
        wrapper.chmod(0o755)
        before = self.source_snapshot()
        result = self.run_archive(env=dict(self.env, PATH=posix(injector) + ':' + self.env['PATH']))
        self.assertTrue(marker.is_file(), description(result))
        self.assert_failure(result)
        self.assertEqual(self.source_snapshot(), before)

    def test_missing_fsync_fails_closed(self):
        # A complete PATH sandbox avoids depending on whether fsync happens to
        # be installed elsewhere on this host.
        tools = self.case / 'without-fsync'
        tools.mkdir()
        for tool in ('cat', 'chmod', 'cmp', 'cp', 'ln', 'mkdir', 'mktemp',
                     'rm', 'sha256sum', 'wc', 'sync'):
            wrapper = tools / tool
            wrapper.write_text(f'#!/usr/bin/bash\nexec /usr/bin/{tool} "$@"\n',
                               encoding='utf-8', newline='\n')
            wrapper.chmod(0o755)
        env = dict(self.env, PATH=posix(tools))
        self.assertNotEqual(bash('command -v fsync', env=env).returncode, 0)
        self.seed()
        before = self.source_snapshot()
        self.assert_failure(self.run_archive(env=env))
        self.assertEqual(self.source_snapshot(), before)

    def test_corrupt_existing_digest_is_rejected_without_overwrite(self):
        for kind in CATEGORIES:
            with self.subTest(kind=kind):
                root = self.case / kind
                root.mkdir()
                old = self.seed(root=root)
                selection = b'proposed\n'
                content = selection if kind == 'selection' else old[kind]
                bad = self.archived(kind, content, root)
                bad.parent.mkdir(parents=True)
                bad.write_bytes(b'corrupt existing record\x00')
                before = self.source_snapshot(root)
                self.assert_failure(self.run_archive(selection, root=root))
                self.assertEqual(self.source_snapshot(root), before)
                self.assertEqual(bad.read_bytes(), b'corrupt existing record\x00')

    def test_concurrent_writers_keep_all_selections(self):
        old = self.seed()
        before = self.source_snapshot()
        selections = [f'writer-{index % 5}\n'.encode() for index in range(10)]
        with ThreadPoolExecutor(max_workers=10) as executor:
            results = list(executor.map(self.run_archive, selections))
        for result in results:
            self.assert_success(result)
        self.assertEqual(self.source_snapshot(), before)
        for kind, content in old.items():
            self.assert_archived(kind, content)
        for selection in selections:
            self.assert_archived('selection', selection)
        self.assertEqual(len(list((self.root / 'recovery-history-v1/selection').iterdir())), 5)

    def test_non_directory_archive_paths_and_directory_sources_are_rejected(self):
        for relative in ('recovery-history-v1',
                         *(f'recovery-history-v1/{kind}' for kind in CATEGORIES)):
            with self.subTest(path=relative):
                root = self.case / relative.replace('/', '-')
                root.mkdir()
                self.seed(root=root)
                obstacle = root / relative
                obstacle.parent.mkdir(parents=True, exist_ok=True)
                obstacle.write_bytes(b'keep obstacle')
                before = self.source_snapshot(root)
                self.assert_failure(self.run_archive(root=root))
                self.assertEqual(self.source_snapshot(root), before)
                self.assertEqual(obstacle.read_bytes(), b'keep obstacle')
        for kind, name in SOURCE_FILES.items():
            with self.subTest(directory_source=name):
                root = self.case / ('directory-' + kind)
                root.mkdir()
                self.seed(root=root)
                (root / name).unlink()
                (root / name).mkdir()
                before = self.source_snapshot(root)
                self.assert_failure(self.run_archive(root=root))
                self.assertEqual(self.source_snapshot(root), before)
                self.assertTrue((root / name).is_dir())

    def test_real_symlink_sources_and_directories_are_rejected(self):
        outside = self.case / 'outside'
        outside.mkdir()
        target = outside / 'evidence'
        target.write_bytes(b'outside evidence must remain untouched')
        probe = self.case / 'symlink-probe'
        try:
            os.symlink(target, probe)
        except OSError as error:
            self.skipTest(f'Native Windows symlinks unavailable: {error}')
        if not probe.is_symlink() or bash(f'test -L {quoted(posix(probe))}').returncode:
            self.skipTest('Git Bash cannot verify a true native symlink on this filesystem')
        for relative in (*SOURCE_FILES.values(), 'recovery-history-v1',
                         *(f'recovery-history-v1/{kind}' for kind in CATEGORIES)):
            with self.subTest(symlink=relative):
                root = self.case / ('link-' + relative.replace('/', '-'))
                root.mkdir()
                self.seed(root=root)
                link = root / relative
                link.parent.mkdir(parents=True, exist_ok=True)
                if link.is_file():
                    link.unlink()
                is_directory = relative.startswith('recovery-history-v1')
                os.symlink(outside if is_directory else target, link,
                           target_is_directory=is_directory)
                before = self.source_snapshot(root)
                self.assert_failure(self.run_archive(root=root))
                self.assertEqual(self.source_snapshot(root), before)
                self.assertTrue(link.is_symlink())
                self.assertEqual(target.read_bytes(), b'outside evidence must remain untouched')
        root_link = self.case / 'root-link'
        os.symlink(self.root, root_link, target_is_directory=True)
        self.seed()
        before = self.source_snapshot()
        self.assert_failure(self.run_archive(root=root_link))
        self.assertEqual(self.source_snapshot(), before)
        old = self.source_snapshot()
        raw_link = self.archived('targets', old['targets.conf'])
        raw_link.parent.mkdir(parents=True)
        os.symlink(target, raw_link)
        self.assert_failure(self.run_archive())
        self.assertTrue(raw_link.is_symlink())
        self.assertEqual(self.source_snapshot(), old)
        self.assertEqual(target.read_bytes(), b'outside evidence must remain untouched')

    def test_permissions_when_filesystem_enforces_posix_modes(self):
        probe_file = self.case / 'mode-probe'
        probe_file.write_bytes(b'')
        probe_dir = self.case / 'mode-directory'
        probe_dir.mkdir()
        result = bash(f'chmod 0600 {quoted(posix(probe_file))} && '
                      f'chmod 0700 {quoted(posix(probe_dir))} && '
                      f'stat -c %a {quoted(posix(probe_file))} {quoted(posix(probe_dir))}')
        if result.returncode != 0 or result.stdout.splitlines() != [b'600', b'700']:
            self.skipTest('Git Bash/NTFS does not expose enforceable 0600/0700 POSIX modes')
        self.seed()
        self.assert_success(self.run_archive())
        history = self.root / 'recovery-history-v1'
        for path in (self.root, history, *(history / kind for kind in CATEGORIES)):
            result = bash(f'stat -c %a {quoted(posix(path))}')
            self.assertEqual(result.stdout.strip(), b'700', str(path))
        for path in history.rglob('*.raw'):
            result = bash(f'stat -c %a {quoted(posix(path))}')
            self.assertEqual(result.stdout.strip(), b'600', str(path))

    def test_preserve_wrapper_strict_success_and_transport_arguments(self):
        # A separate compilation uses the real wrapper with a stub transport.
        # The real RootShell class is deliberately absent from this classpath.
        package = self.case / 'ls/augment/com'
        package.mkdir(parents=True)
        transport = package / 'RootShell.java'
        transport.write_text('''package ls.augment.com;
final class RootShell {
    static Result next;static String command,stdin;static long timeout;static int maxOutput;
    static Result run(String value,String input,long seconds,int limit){
        command=value;stdin=input;timeout=seconds;maxOutput=limit;return next;
    }
    static final class Result {
        final int exitCode;final String output;final boolean timedOut;
        Result(int code,String text,boolean timeout){exitCode=code;output=text==null?"":text;timedOut=timeout;}
        boolean isSuccess(){return !timedOut&&exitCode==0;}
    }
}
''', encoding='utf-8')
        probe = package / 'PreserveWrapperProbe.java'
        probe.write_text(r'''package ls.augment.com;
public final class PreserveWrapperProbe {
    static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
    public static void main(String[] args){
        String footer="LSA_RECOVERY_ARCHIVE_OK";
        Object[][] cases={
            {0,"",false,false},{0,"missing footer",false,false},
            {0,"extra\n"+footer,false,false},{0,footer+"\nextra",false,false},
            {0,footer,false,true},{0," \n"+footer+"\n ",false,true},
            {0,footer,true,false},{1,footer,false,false},{-1,footer,false,false}
        };
        int count=0;
        for(Object[] c:cases)for(String selection:new String[]{"", "包名:0\nsecond"}){
            RootShell.Result supplied=new RootShell.Result((Integer)c[0],(String)c[1],(Boolean)c[2]);
            RootShell.next=supplied;
            RootShell.Result result=HideRecoveryArchive.preserve(selection);
            check(result.isSuccess()==(Boolean)c[3],"incorrect commit gate for case "+count);
            if(!supplied.isSuccess())check(result==supplied,"transport failure was replaced");
            if(supplied.isSuccess()&&!(Boolean)c[3])check(result.exitCode==74,"unverified success did not fail closed");
            check(RootShell.stdin.equals(selection.isEmpty()?"":selection+"\n"),"stdin changed");
            check(RootShell.timeout==30&&RootShell.maxOutput==4096,"transport bounds changed");
            check(RootShell.command.equals(HideRecoveryArchive.command()),"wrapper used a different script");
            count++;
        }
        System.out.println("Production preserve(): "+count+" strict-footer/transport/input cases passed using a stub RootShell; no su.");
    }
}
''', encoding='utf-8')
        classes = self.case / 'wrapper-classes'
        compiled = subprocess.run([
            'javac', '-encoding', 'UTF-8', '--release', '17', '-d', str(classes),
            str(JAVA / 'HideRecoveryArchive.java'), str(transport), str(probe),
        ], capture_output=True, timeout=30)
        self.assertEqual(compiled.returncode, 0, description(compiled))
        result = subprocess.run([
            'java', '-cp', str(classes), 'ls.augment.com.PreserveWrapperProbe',
        ], capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0, description(result))
        print(result.stdout.decode('utf-8').strip(), flush=True)


if __name__ == '__main__':
    unittest.main(verbosity=2)
