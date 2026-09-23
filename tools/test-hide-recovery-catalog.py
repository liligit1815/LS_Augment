"""Execute real catalog Java and generated read-only shell in temporary Git Bash paths.

Only ROOT is changed in generated commands. No su/adb/PM and no production
RootShell.run: wrapper tests compile a separate transport stub. Snapshot checks
cover file bytes/inodes/mtime and directory membership, not filesystem atime.
"""
import base64
import hashlib
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
BASH = Path(r'C:\Program Files\Git\bin\bash.exe')
ASSIGNMENT = "ROOT='/data/adb/ls_augment/v2'"
FOOTER = b'LSA_RECOVERY_CATALOG_OK'


def quote(value):
    return "'" + str(value).replace("'", "'\"'\"'") + "'"


def digest(value):
    return hashlib.sha256(value).hexdigest()


def bash(script, *, env=None):
    if '/data/adb' in script:
        raise AssertionError('Refusing an executable device path')
    if env is not None:
        env = dict(env, LSA_TEST_PATH=env['PATH'])
    return subprocess.run([str(BASH), '--noprofile', '--norc', '-c', script],
                          capture_output=True, env=env, timeout=60)


def posix(path):
    return subprocess.run([str(BASH), '--noprofile', '--norc', '-c',
                           'cygpath -u -- "$1"', 'catalog-test', str(path.absolute())],
                          capture_output=True, check=True, timeout=10).stdout.decode().strip()


def describe(result):
    return f'exit={result.returncode}, stdout={result.stdout[:300]!r}, stderr={result.stderr[:1000]!r}'


def journal(index, stage='PREPARED'):
    return f'journal:00000000-0000-0000-0000-{index:012x}.{stage}.record'


def frame(key, value):
    return f'S|{key}|{digest(value)}|{len(value)}|-|'.encode() + base64.b64encode(value)


def protocol(*rows, cursor='', warnings=0):
    return b'\n'.join([b'LSA_RECOVERY_CATALOG_V1', *rows,
                       f'M|{cursor or "-"}|{warnings}'.encode(), FOOTER]) + b'\n'


class CatalogTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if not BASH.is_file():
            raise RuntimeError('Real Git Bash is required')
        cls.temporary = tempfile.TemporaryDirectory(prefix='ls-hide-catalog-')
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.workspace = Path(cls.temporary.name)
        package = cls.workspace / 'ls/augment/com'
        package.mkdir(parents=True)
        probe = package / 'CatalogProbe.java'
        probe.write_text('''package ls.augment.com;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
public final class CatalogProbe {
    public static void main(String[] args) throws Exception {
        if(args[0].equals("command")){
            System.out.print(HideRecoveryCatalog.command(args[1],args[2]));return;
        }
        HideRecoveryCatalog.Page p=HideRecoveryCatalog.parseProtocol(new String(System.in.readAllBytes(),StandardCharsets.UTF_8));
        System.out.println("PAGE|"+p.success+"|"+Base64.getEncoder().encodeToString(p.message.getBytes(StandardCharsets.UTF_8))+
            "|"+p.nextCursor+"|"+p.sources.size());
        for(HideRecoveryCatalog.Source s:p.sources)System.out.println(s.key+"|"+s.sha256+"|"+
            Base64.getEncoder().encodeToString(s.bytes)+"|"+s.problem);
    }
}
''', encoding='utf-8')
        cls.classes = cls.workspace / 'classes'
        result = subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17',
                                 '-d', str(cls.classes), str(JAVA / 'RootShell.java'),
                                 str(JAVA / 'HideRecoveryCatalog.java'), str(probe)],
                                capture_output=True, timeout=30)
        if result.returncode:
            raise AssertionError(describe(result))
        cls.shell_path = bash('printf %s "$PATH"').stdout.decode()
        startup = cls.workspace / 'bash-env'
        startup.write_text('export PATH="$LSA_TEST_PATH"\n', encoding='utf-8')
        cls.env = dict(os.environ, PATH=cls.shell_path, BASH_ENV=posix(startup))
        print('Production Catalog + RootShell compiled; executing only generated shell '
              'with one temporary ROOT substitution and real Java parseProtocol.', flush=True)

    def setUp(self):
        self.case = self.workspace / self._testMethodName
        self.case.mkdir()
        self.root = self.case / 'root'
        self.root.mkdir()

    def java(self, *args, stdin=None):
        return subprocess.run(['java', '-cp', str(self.classes), 'ls.augment.com.CatalogProbe', *args],
                              input=stdin, capture_output=True, timeout=30)

    def parse(self, content):
        result = self.java('parse', stdin=content)
        self.assertEqual(result.returncode, 0, describe(result))
        lines = result.stdout.decode().splitlines()
        tag, success, message, cursor, count = lines[0].split('|')
        self.assertEqual(tag, 'PAGE')
        sources = []
        for line in lines[1:]:
            key, sha, data, problem = line.split('|')
            sources.append(dict(key=key, sha256=sha, bytes=base64.b64decode(data), problem=problem))
        self.assertEqual(len(sources), int(count))
        return dict(success=success == 'true', message=base64.b64decode(message).decode(),
                    nextCursor=cursor, sources=sources)

    def run_catalog(self, cursor='', single='', *, root=None, env=None):
        generated = self.java('command', cursor, single)
        self.assertEqual(generated.returncode, 0, describe(generated))
        command = generated.stdout.decode()
        self.assertEqual(command.count(ASSIGNMENT), 1)
        self.assertEqual([line for line in command.splitlines() if line.lstrip().startswith('ROOT=')],
                         [ASSIGNMENT])
        result = bash(command.replace(ASSIGNMENT, 'ROOT=' + quote(posix(root or self.root))),
                      env=env or self.env)
        # Root merges stderr into stdout in production; emulate that for handled
        # diagnostics so unexpected output cannot accidentally pass the parser.
        page = self.parse(result.stdout + result.stderr) if result.returncode == 0 else None
        return result, page

    def path(self, key):
        category, name = key.split(':', 1)
        if category == 'journal':
            return self.root / 'recovery-journal-v1/events' / name
        return self.root / 'recovery-history-v1' / category / name

    def seed(self, key, value=b'com.example:0\n'):
        path = self.path(key)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(value)
        return key

    def raw(self, category, value=b'com.example:0\n'):
        return self.seed(f'{category}:{digest(value)}.raw', value)

    def snapshot(self):
        values = {}
        for path in self.root.rglob('*'):
            if path.is_symlink():
                values[str(path.relative_to(self.root))] = ('link', os.readlink(path))
            elif path.is_file():
                stat = path.stat()
                values[str(path.relative_to(self.root))] = (path.read_bytes(), stat.st_ino, stat.st_mtime_ns)
            else:
                values[str(path.relative_to(self.root))] = ('directory',)
        return values

    def assert_ok(self, result, page):
        self.assertEqual(result.returncode, 0, describe(result))
        self.assertIsNotNone(page)
        self.assertTrue(page['success'], page)

    def assert_failed(self, result, page):
        self.assertTrue(result.returncode != 0 or not page['success'], (describe(result), page))
        if page is not None:
            self.assertEqual(page['sources'], [])

    def injected(self, name, body):
        directory = self.case / (name + '-bin')
        directory.mkdir()
        script = directory / name
        script.write_text('#!/usr/bin/bash\n' + body, encoding='utf-8', newline='\n')
        script.chmod(0o755)
        return dict(self.env, PATH=posix(directory) + ':' + self.env['PATH'])

    def test_pagination_fixed_category_order_no_duplicates_and_read_only(self):
        keys = [self.seed(journal(2, 'SHOW_OBSERVED')), self.seed(journal(1, 'FUTURE_STAGE'))]
        for category in ('script', 'selection', 'backup', 'targets'):
            keys.extend(self.raw(category, f'{category}-{i}\n'.encode()) for i in range(2))
        before = self.snapshot()
        order = {name: i for i, name in enumerate(('journal', 'targets', 'backup', 'selection', 'script'))}
        expected = sorted(keys, key=lambda key: (order[key.split(':')[0]], key.split(':')[1]))
        seen, cursor = [], ''
        for expected_size in (4, 4, 2):
            result, page = self.run_catalog(cursor)
            self.assert_ok(result, page)
            self.assertEqual(len(page['sources']), expected_size)
            seen.extend(source['key'] for source in page['sources'])
            self.assertTrue(all(not source['problem'] for source in page['sources']))
            cursor = page['nextCursor']
            self.assertEqual(cursor, seen[-1] if len(seen) < len(expected) else '')
        self.assertEqual(seen, expected)
        self.assertEqual(self.snapshot(), before)

    def test_read_one_exact_source_and_missing_is_failure(self):
        key = self.raw('selection', b'one\n')
        self.raw('targets', b'other\n')
        before = self.snapshot()
        result, page = self.run_catalog(single=key)
        self.assert_ok(result, page)
        self.assertEqual([source['key'] for source in page['sources']], [key])
        self.assertEqual(page['nextCursor'], '')
        self.assert_failed(*self.run_catalog(single=journal(99)))
        self.assertEqual(self.snapshot(), before)

    def test_checked_missing_directories_are_empty_without_creation(self):
        before = self.snapshot()
        result, page = self.run_catalog()
        self.assert_ok(result, page)
        self.assertEqual(page['sources'], [])
        self.assertEqual(self.snapshot(), before)
        missing = self.case / 'not-created/nested/root'
        result, page = self.run_catalog(root=missing)
        self.assert_ok(result, page)
        self.assertEqual(page['sources'], [])
        self.assertFalse((self.case / 'not-created').exists())

    def test_missing_parent_inventory_failure_is_not_empty_success(self):
        env = self.injected('ls', f'[ "$2" != {quote(posix(self.root))} ] || exit 74\n'
                            'exec /usr/bin/ls "$@"\n')
        self.assert_failed(*self.run_catalog(env=env))
        self.assertEqual(self.snapshot(), {})

    def test_valid_name_problems_are_preserved_as_non_operable_sources(self):
        mismatch = self.seed('targets:' + '0' * 64 + '.raw', b'bad digest')
        large = self.raw('backup', b'x' * (1048576 + 1))
        directory = journal(3)
        self.path(directory).mkdir(parents=True)
        binary = self.raw('selection', b'\xff\x00\xfe')
        before = self.snapshot()
        result, page = self.run_catalog()
        self.assert_ok(result, page)
        sources = {source['key']: source for source in page['sources']}
        self.assertEqual({key: sources[key]['problem'] for key in sources},
                         {directory: 'NOT_FILE', mismatch: 'HASH_MISMATCH', large: 'TOO_LARGE', binary: 'INVALID_UTF8'})
        self.assertEqual(sources[binary]['bytes'], b'\xff\x00\xfe')
        self.assertTrue(all(not sources[key]['bytes'] for key in (directory, mismatch, large)))
        self.assertEqual(self.snapshot(), before)

    def test_unknown_names_including_hidden_and_after_page_boundary_reported(self):
        for i in range(5):
            self.seed(journal(i + 1))
        directory = self.path(journal(1)).parent
        unknown = ['.hidden', 'bad name.raw', 'invalid.record', 'nested-directory', '$(touch owned).raw']
        for name in unknown:
            (directory / name).write_bytes(b'keep')
        before = self.snapshot()
        result, page = self.run_catalog()
        self.assert_ok(result, page)
        self.assertIn(str(len(unknown)), page['message'])
        self.assertEqual(len(page['sources']), 4)
        result, second = self.run_catalog(page['nextCursor'])
        self.assert_ok(result, second)
        self.assertEqual(len(second['sources']), 1)
        self.assertIn(str(len(unknown)), second['message'])
        self.assertEqual(self.snapshot(), before)

    def test_unknown_newline_names_when_host_supports_them(self):
        self.seed(journal(1))
        directory = self.path(journal(1)).parent
        try:
            for name in ('bad\n' + journal(10).split(':')[1], journal(11).split(':')[1] + '\ngarbage'):
                (directory / name).write_bytes(b'keep newline')
        except OSError as error:
            self.skipTest(f'Host filesystem rejects newline filenames: {error}')
        before = self.snapshot()
        result, page = self.run_catalog()
        self.assert_ok(result, page)
        self.assertIn('2', page['message'])
        self.assertEqual([source['key'] for source in page['sources']], [journal(1)])
        self.assertEqual(self.snapshot(), before)

    def test_missing_cursor_fails_and_insertions_require_refresh(self):
        for i in range(1, 6):
            self.seed(journal(i))
        result, page = self.run_catalog()
        self.assert_ok(result, page)
        cursor = page['nextCursor']
        inserted_before = self.seed(journal(4, 'OBSERVED'))
        inserted_after = self.seed(journal(6))
        result, next_page = self.run_catalog(cursor)
        self.assert_ok(result, next_page)
        seen = [source['key'] for source in next_page['sources']]
        self.assertEqual(seen, [journal(5), inserted_after])
        self.assertNotIn(inserted_before, seen)
        self.path(cursor).unlink()
        self.assert_failed(*self.run_catalog(cursor))
        print('Pagination intentionally is not a snapshot: inserts before cursor require a first-page refresh.', flush=True)

    def test_file_read_hash_and_pipeline_failures_are_problem_sources(self):
        key = self.seed(journal(1))
        before = self.snapshot()
        for name, expected in (('sha256sum', 'HASH_FAILED'), ('head', 'READ_FAILED'),
                               ('base64', 'READ_FAILED'), ('tr', 'READ_FAILED'), ('wc', 'UNREADABLE')):
            with self.subTest(tool=name):
                env = self.injected(name, 'printf failed >&2\nexit 74\n')
                result, page = self.run_catalog(single=key, env=env)
                self.assert_ok(result, page)
                self.assertEqual(page['sources'][0]['problem'], expected)
                self.assertEqual(page['sources'][0]['bytes'], b'')
                self.assertEqual(self.snapshot(), before)

    def test_content_change_during_read_is_rejected_without_returning_payload(self):
        key = self.seed(journal(1), b'before\n')
        path = self.path(key)
        # Explicit adversarial writer injection; production Catalog remains read-only.
        env = self.injected('head', ' /usr/bin/head "$@" || exit $?\n'
                            f'printf changed > {quote(posix(path))}\n')
        result, page = self.run_catalog(single=key, env=env)
        self.assert_ok(result, page)
        self.assertEqual(page['sources'][0]['problem'], 'SOURCE_CHANGED')
        self.assertEqual(page['sources'][0]['bytes'], b'')

    def test_directory_removed_after_inventory_cannot_become_empty_success(self):
        directory = self.root / 'recovery-journal-v1/events'
        directory.mkdir(parents=True)
        # This deliberately mutating test double simulates a concurrent writer.
        env = self.injected('ls', ' /usr/bin/ls "$@" || exit $?\n'
                            f'if [ "$2" = {quote(posix(directory))} ]; then /usr/bin/rmdir "$2"; fi\n')
        self.assert_failed(*self.run_catalog(env=env))

    def test_real_symlink_ancestors_categories_and_source(self):
        outside = self.case / 'outside'
        outside.mkdir()
        evidence = outside / 'evidence'
        evidence.write_bytes(b'outside')
        probe = self.case / 'probe-link'
        try:
            os.symlink(evidence, probe)
        except OSError as error:
            self.skipTest(f'Native symlinks unavailable: {error}')
        if bash('test -L ' + quote(posix(probe))).returncode:
            self.skipTest('Git Bash cannot recognize native symlinks')
        source_key = journal(1)
        source = self.path(source_key)
        source.parent.mkdir(parents=True)
        os.symlink(evidence, source)
        result, page = self.run_catalog(single=source_key)
        self.assert_ok(result, page)
        self.assertEqual(page['sources'][0]['problem'], 'SYMLINK')
        for index, relative in enumerate(('recovery-history-v1', 'recovery-history-v1/targets',
                                          'recovery-journal-v1', 'recovery-journal-v1/events')):
            root = self.case / ('root-' + str(index))
            root.mkdir()
            link = root / relative
            link.parent.mkdir(parents=True, exist_ok=True)
            os.symlink(outside, link, target_is_directory=True)
            self.assert_failed(*self.run_catalog(root=root))
        parent = self.case / 'linked-parent'
        os.symlink(outside, parent, target_is_directory=True)
        self.assert_failed(*self.run_catalog(root=parent / 'nested/root'))
        self.assertEqual(evidence.read_bytes(), b'outside')

    def test_maximum_four_file_page_stays_under_transport_bound(self):
        keys = [self.raw(category, (category[0].encode() * 1048576))
                for category in ('targets', 'backup', 'selection', 'script')]
        before = self.snapshot()
        result, page = self.run_catalog()
        self.assert_ok(result, page)
        self.assertLess(len(result.stdout), 8 * 1024 * 1024)
        self.assertEqual([source['key'] for source in page['sources']], keys)
        self.assertTrue(all(len(source['bytes']) == 1048576 for source in page['sources']))
        self.assertEqual(self.snapshot(), before)

    def test_strict_java_protocol_rejects_partial_forged_and_noncanonical_pages(self):
        key, value = journal(1), b'valid text\n'
        row = frame(key, value)
        good = protocol(row)
        self.assertTrue(self.parse(good)['success'])
        malformed = [b'', FOOTER, good.replace(FOOTER, b''), good + b'extra',
                     good.replace(FOOTER, FOOTER + b'\n' + FOOTER), good[:-10],
                     good.replace(b'V1\n', b'V1\r\n'), b' ' + good,
                     good.replace(b'V1', b'V\xff'), good + b'x' * (8 * 1024 * 1024),
                     protocol(row, row), protocol(*(frame(journal(i + 1), value) for i in range(5))),
                     protocol(row, cursor=key), protocol(row, warnings=-1),
                     protocol(row.replace(digest(value).encode(), b'0' * 64)),
                     protocol(row.replace(b'|11|', b'|011|')), protocol(row[:-1]),
                     protocol(frame('targets:' + '0' * 64 + '.raw', value)),
                     protocol(b'S|' + key.encode() + b'|-|0|SYMLINK|eA=='),
                     protocol(b'S|' + key.encode() + b'|-|0|UNKNOWN_PROBLEM|')]
        for index, content in enumerate(malformed):
            with self.subTest(case=index):
                page = self.parse(content)
                self.assertFalse(page['success'], page)
                self.assertEqual(page['sources'], [])
        binary = self.parse(protocol(frame(key, b'\xff')))
        self.assertTrue(binary['success'])
        self.assertEqual(binary['sources'][0]['problem'], 'INVALID_UTF8')
        self.assertEqual(binary['sources'][0]['bytes'], b'\xff')
        print(f'Production Java rejected {len(malformed)} malformed protocols with zero released sources.', flush=True)

    def test_transport_wrapper_and_invalid_keys_never_invoke_real_root(self):
        package = self.case / 'ls/augment/com'
        package.mkdir(parents=True)
        stub = package / 'RootShell.java'
        stub.write_text('''package ls.augment.com;
final class RootShell {
    static Result next;static int calls;static String input;static long timeout;static int limit;
    static Result run(String c,String i,long t,int l){calls++;input=i;timeout=t;limit=l;return next;}
    static final class Result {
        final int exitCode;final String output;final boolean timedOut;
        Result(int c,String o,boolean t){exitCode=c;output=o;timedOut=t;}
        boolean isSuccess(){return exitCode==0&&!timedOut;}
        String publicError(){return "test transport failure";}
    }
}
''', encoding='utf-8')
        good = protocol(frame(journal(1), b'ok\n')).decode()
        probe = package / 'CatalogWrapperProbe.java'
        probe.write_text('''package ls.augment.com;
import java.util.Base64;
import java.nio.charset.StandardCharsets;
public final class CatalogWrapperProbe {
    static int checks;
    static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}
    public static void main(String[] args){
        String good=new String(Base64.getDecoder().decode(args[0]),StandardCharsets.UTF_8);
        String key="''' + journal(1) + '''";
        for(int code:new int[]{0,74})for(boolean timeout:new boolean[]{false,true}){
            RootShell.next=new RootShell.Result(code,good,timeout);
            HideRecoveryCatalog.Page p=HideRecoveryCatalog.read("");
            check(p.success==(code==0&&!timeout));
            if(!p.success)check(p.sources.isEmpty());
            check(RootShell.input==null&&RootShell.timeout==30&&RootShell.limit==8*1024*1024);
        }
        for(String bad:new String[]{"../escape","targets:$(id)","journal:BAD",key+"\\n",key+"/more","x".repeat(264)}){
            int calls=RootShell.calls;
            check(!HideRecoveryCatalog.read(bad).success);
            check(!HideRecoveryCatalog.readOne(bad).success);
            check(RootShell.calls==calls);
            boolean rejected=false;
            try{HideRecoveryCatalog.command(bad,"");}catch(IllegalArgumentException e){rejected=true;}
            check(rejected);
        }
        int calls=RootShell.calls;
        check(!HideRecoveryCatalog.readOne(null).success&&!HideRecoveryCatalog.readOne("").success);
        check(RootShell.calls==calls);
        RootShell.next=new RootShell.Result(0,good,false);
        check(HideRecoveryCatalog.readOne(key).success);
        check(!HideRecoveryCatalog.readOne(key.replace("000000000001","000000000002")).success);
        RootShell.next=new RootShell.Result(0,good.replace("LSA_RECOVERY_CATALOG_OK",""),false);
        check(!HideRecoveryCatalog.read("").success);
        boolean rejected=false;
        try{HideRecoveryCatalog.command(key,key);}catch(IllegalArgumentException e){rejected=true;}
        check(rejected);
        System.out.println("Production read/readOne/command: "+checks+" transport/key assertions passed; stub only.");
    }
}
''', encoding='utf-8')
        classes = self.case / 'stub-classes'
        result = subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', str(classes),
                                 str(JAVA / 'HideRecoveryCatalog.java'), str(stub), str(probe)],
                                capture_output=True, timeout=30)
        self.assertEqual(result.returncode, 0, describe(result))
        result = subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.CatalogWrapperProbe',
                                 base64.b64encode(good.encode()).decode()], capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0, describe(result))
        print(result.stdout.decode().strip(), flush=True)


if __name__ == '__main__':
    unittest.main(verbosity=2)
