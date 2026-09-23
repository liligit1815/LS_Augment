"""No real .android, adb executable, server, or phone is used by these tests."""
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import tempfile
import types
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('probe', Path(__file__).with_name('usb_auth_host_probe.py'))
probe = importlib.util.module_from_spec(spec)
spec.loader.exec_module(probe)


class RecoveryTests(unittest.TestCase):
    def setUp(self):
        for target, name in ((probe, 'adb_call'), (probe, 'host_snapshot'), (probe.socket, 'create_connection')):
            guard = patch.object(target, name, side_effect=AssertionError('Real host/ADB access forbidden in unit tests'))
            guard.start()
            self.addCleanup(guard.stop)
        self.directory = tempfile.TemporaryDirectory(prefix='lsa-usb-auth-unit-')
        self.addCleanup(self.directory.cleanup)
        self.home = Path(self.directory.name)
        self.root = self.home / '.android'
        self.root.mkdir()
        self.token = 'test-owned-token'
        self.key_dir = self.root / ('.lsa-usb-auth-' + self.token)
        self.key_dir.mkdir()
        self.normal_adb = self.home / 'platform-tools' / 'adb.exe'
        self.normal_adb.parent.mkdir()
        self.normal_adb.write_bytes(b'not-an-executable')
        self.test_adb = self.key_dir / 'adb.exe'
        self.test_adb.write_bytes(b'not-an-executable')
        self.state = {'key_root': str(self.root), 'files': [], 'adb': str(self.normal_adb),
                      'test_adb': str(self.test_adb), 'adb_sha256': probe.digest(self.normal_adb),
                      'token': self.token, 'serial': 'fake-usb-serial',
                      'original_server': {'pid': 101, 'created': 1, 'exe': str(self.normal_adb)},
                      'original_server_sha256': probe.digest(self.normal_adb),
                      'restored': False}
        for suffix in ('', '.pub'):
            current = self.root / ('adbkey' + suffix)
            current.write_bytes(('original' + suffix).encode())
            source = self.key_dir / ('generated' + suffix)
            source.write_bytes(('temporary' + suffix).encode())
            self.state['files'].append({'current': str(current), 'source': str(source),
                                       'backup': str(self.root / ('adbkey' + suffix + '.backup')),
                                       'retired': str(self.key_dir / ('retired' + suffix)),
                                       'original_sha256': probe.digest(current),
                                       'test_sha256': probe.digest(source)})

    def swap(self, count=2):
        for item in self.state['files'][:count]:
            if item['original_sha256'] is not None:
                Path(item['current']).replace(item['backup'])
            Path(item['source']).replace(item['current'])

    def assert_originals(self):
        for item in self.state['files']:
            self.assertEqual(probe.digest(item['current']), item['original_sha256'])
            self.assertFalse(Path(item['backup']).exists())

    def test_before_swap_is_noop(self):
        probe.restore_files(self.state)
        self.assert_originals()

    def test_full_swap_and_repeated_recovery(self):
        self.swap()
        probe.restore_files(self.state)
        probe.restore_files(self.state)
        self.assert_originals()

    def test_interrupted_between_private_and_public_swap(self):
        self.swap(1)
        probe.restore_files(self.state)
        self.assert_originals()

    def test_interrupted_after_original_move_before_test_move(self):
        item = self.state['files'][0]
        Path(item['current']).replace(item['backup'])
        probe.restore_files(self.state)
        self.assert_originals()

    def test_originally_missing_public_file_stays_missing(self):
        item = self.state['files'][1]
        Path(item['current']).unlink()
        item['original_sha256'] = None
        self.swap()
        probe.restore_files(self.state)
        self.assert_originals()

    def test_unknown_current_content_never_overwritten(self):
        self.swap()
        item = self.state['files'][0]
        Path(item['current']).write_bytes(b'foreign-key')
        with self.assertRaisesRegex(RuntimeError, 'Unknown file'):
            probe.restore_files(self.state)
        self.assertEqual(Path(item['current']).read_bytes(), b'foreign-key')
        self.assertEqual(probe.digest(item['backup']), item['original_sha256'])

    def test_corrupt_backup_never_overwrites_current(self):
        self.swap()
        item = self.state['files'][0]
        Path(item['backup']).write_bytes(b'corruption')
        with self.assertRaisesRegex(RuntimeError, 'Original backup'):
            probe.restore_files(self.state)
        self.assertEqual(probe.digest(item['current']), item['test_sha256'])

    def test_path_escape_refused(self):
        self.state['files'][0]['current'] = str(self.home / 'foreign-key')
        with self.assertRaisesRegex(RuntimeError, 'escaped'):
            probe.restore_files(self.state)

    def test_native_public_fingerprint(self):
        self.assertEqual(probe.public_fingerprint('YWJj user@host\n'),
                         '90:01:50:98:3C:D2:4F:B0:D6:96:3F:7D:28:E1:7F:72')

    def test_restore_orchestrator_discovers_owned_server_without_pid_receipt(self):
        self.swap()
        journal = self.home / 'journal.json'
        probe.write_json(journal, self.state)
        killed, commands = [], []
        new_identity = {'pid': 303, 'created': 10**19, 'exe': str(self.normal_adb)}
        test_identity = {'pid': 202, 'created': 2, 'exe': str(self.test_adb)}
        snapshots = iter([
            {'processes': [{'Id': 202, 'ProcessName': 'adb'}, {'Id': 909, 'ProcessName': 'adb'}], 'tcp': []},
            {'processes': [], 'tcp': []},
            {'processes': [], 'tcp': [{'LocalPort': 5037, 'State': 'Listen', 'OwningProcess': 303}]},
        ])

        def identity(pid):
            return {202: test_identity, 303: new_identity,
                    909: {'pid': 909, 'created': 9, 'exe': str(self.normal_adb)}}.get(pid)

        def adb(executable, args, **kwargs):
            commands.append(args)
            return types.SimpleNamespace(returncode=0, stdout=(args[-1] + '\n').encode()
                                         if 'shell' in args else b'', stderr=b'')

        with contextlib.ExitStack() as stack:
            stack.enter_context(patch.object(probe, 'require_windows'))
            stack.enter_context(patch.object(probe.Path, 'home', return_value=self.home))
            stack.enter_context(patch.object(probe, 'DEFAULT_ADB', self.normal_adb))
            stack.enter_context(patch.object(probe, 'journal_lock', lambda *a: contextlib.nullcontext()))
            stack.enter_context(patch.object(probe, 'host_snapshot', lambda: next(snapshots)))
            stack.enter_context(patch.object(probe, 'process_identity', identity))
            stack.enter_context(patch.object(probe, 'terminate_owned', lambda ident, exe: killed.append(ident)))
            stack.enter_context(patch.object(probe, 'adb_call', adb))
            stack.enter_context(patch.object(probe, 'smart_socket', lambda command, **kw: command.removeprefix('shell:echo ') + '\n'))
            result = probe.restore(journal)
            self.assertTrue(result['original_usb_shell_challenge_passed'])
            # A second recovery does no process/network work at all.
            self.assertEqual(probe.restore(journal), result)
        self.assertEqual(killed, [test_identity])
        self.assertEqual(commands[0], ['start-server'])
        self.assertEqual(len(commands), 1)
        self.assert_originals()

    def test_different_original_server_binary_is_restored(self):
        external = self.home / 'other-tool' / 'adb.exe'
        external.parent.mkdir()
        external.write_bytes(b'original-other-tool-adb')
        self.state['original_server']['exe'] = str(external)
        self.state['original_server_sha256'] = probe.digest(external)
        self.swap()
        journal = self.home / 'journal.json'
        probe.write_json(journal, self.state)
        commands = []
        snapshots = iter([
            {'processes': [], 'tcp': []}, {'processes': [], 'tcp': []},
            {'processes': [], 'tcp': [{'LocalPort': 5037, 'State': 'Listen', 'OwningProcess': 303}]},
        ])
        restored_identity = {'pid': 303, 'created': 10**19, 'exe': str(external)}

        def adb(executable, args, **kwargs):
            commands.append((Path(executable), args))
            return types.SimpleNamespace(returncode=0, stdout=(args[-1] + '\n').encode()
                                         if 'shell' in args else b'', stderr=b'')

        with contextlib.ExitStack() as stack:
            stack.enter_context(patch.object(probe, 'require_windows'))
            stack.enter_context(patch.object(probe.Path, 'home', return_value=self.home))
            stack.enter_context(patch.object(probe, 'DEFAULT_ADB', self.normal_adb))
            stack.enter_context(patch.object(probe, 'journal_lock', lambda *a: contextlib.nullcontext()))
            stack.enter_context(patch.object(probe, 'host_snapshot', lambda: next(snapshots)))
            stack.enter_context(patch.object(probe, 'process_identity', return_value=restored_identity))
            stack.enter_context(patch.object(probe, 'adb_call', adb))
            stack.enter_context(patch.object(probe, 'smart_socket', lambda command, **kw: command.removeprefix('shell:echo ') + '\n'))
            result = probe.restore(journal)
        self.assertEqual(commands[0], (external, ['start-server']))
        self.assertEqual(result['server']['exe'], str(external))
        self.assert_originals()

    def test_live_other_client_is_refused(self):
        snapshot = {'tcp': [{'State': 'Listen', 'LocalPort': 5037, 'LocalAddress': '127.0.0.1', 'OwningProcess': 101},
                            {'State': 'Established', 'LocalPort': 5037, 'OwningProcess': 101}],
                    'processes': [{'Id': 101, 'ProcessName': 'adb'}]}
        with self.assertRaisesRegex(RuntimeError, 'live ADB client'):
            probe.validate_host(snapshot, self.normal_adb, 101)

    def test_observe_requires_explicit_exclusive_confirmation(self):
        with patch.object(probe, 'require_windows'), patch.object(probe, 'adb_call') as adb:
            with self.assertRaisesRegex(RuntimeError, 'all other ADB'):
                probe.observe(types.SimpleNamespace(exclusive_use_confirmed=False))
        adb.assert_not_called()

    def test_smart_socket_only_uses_existing_server(self):
        class FakeSocket:
            def __init__(self, incoming):
                self.incoming = io.BytesIO(incoming)
                self.sent = []

            def __enter__(self):
                return self

            def __exit__(self, *args):
                pass

            def settimeout(self, timeout):
                pass

            def sendall(self, data):
                self.sent.append(data)

            def recv(self, count):
                return self.incoming.read(min(count, 3))

        response = b'fake-device\tunauthorized\n'
        host = FakeSocket(b'OKAY' + f'{len(response):04x}'.encode() + response)
        shell = FakeSocket(b'OKAYOKAYtest-challenge\n')
        with patch.object(probe.socket, 'create_connection', side_effect=[host, shell]), patch.object(probe, 'adb_call') as adb:
            self.assertEqual(probe.smart_socket('host:devices'), response.decode())
            self.assertEqual(probe.smart_socket('shell:echo test-challenge', serial='fake-device'), 'test-challenge\n')
        self.assertEqual(host.sent, [b'000chost:devices'])
        self.assertEqual(len(shell.sent), 2)
        adb.assert_not_called()

    def test_watchdog_parent_exit_invokes_recovery(self):
        journal = self.home / 'watchdog.json'
        self.state.update({'watchdog_ready': str(self.home / 'ready'), 'deadline': 10**12,
                           'parent': {'pid': 123}})
        probe.write_json(journal, self.state)
        with patch.object(probe, 'same_process', return_value=False), patch.object(probe, 'restore') as recover:
            probe.watchdog(journal)
        recover.assert_called_once_with(journal)


if __name__ == '__main__':
    unittest.main(verbosity=2)
