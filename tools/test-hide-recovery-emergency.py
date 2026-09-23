"""Execute safe recovery scripts only in temporary host directories.

Reuses the journal test's checked Git Bash harness and explicit file-fsync
adapter. Directory fsync is logged only; this is not Android durability proof.
Also compiles the real emergency Java wrapper against transport/archive doubles.
"""
import hashlib
import importlib.util
from pathlib import Path
import subprocess
import unittest

SPEC = importlib.util.spec_from_file_location('journal_harness', Path(__file__).with_name('test-hide-recovery-journal.py'))
J = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(J)


class EmergencyTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        J.JournalTests.setUpClass.__func__(cls)
        probe = cls.workspace / 'ls/augment/com/EmergencyCommandProbe.java'
        probe.write_text('''package ls.augment.com;
public class EmergencyCommandProbe {
 public static void main(String[] args) {
  System.out.print(args[0].equals("archive")?HideRecoveryArchive.command():
   args[0].equals("targets")?HideRecoveryEmergency.targetCommand():HideRecoveryEmergency.command());
 }
}
''', encoding='utf-8')
        classes = cls.workspace / 'emergency-classes'
        subprocess.run(['javac', '--release', '17', '-encoding', 'UTF-8', '-d', str(classes),
                        str(J.JAVA / 'RootShell.java'), str(J.JAVA / 'HideRecoveryArchive.java'),
                        str(J.JAVA / 'HideRecoveryEmergency.java'), str(probe)], check=True, timeout=30)
        cls.commands = {}
        for mode in ('archive', 'install', 'targets'):
            result = subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.EmergencyCommandProbe', mode],
                                    check=True, capture_output=True, timeout=10)
            value = result.stdout.decode('utf-8')
            if value.count(J.ROOT_ASSIGNMENT) != 1:
                raise AssertionError('Expected one replaceable ROOT assignment')
            cls.commands[mode] = value

    setUp = J.JournalTests.setUp
    injected = J.JournalTests.injected

    def run_command(self, mode, stdin=b'', env=None):
        command = self.commands[mode].replace(J.ROOT_ASSIGNMENT, 'ROOT=' + J.quoted(J.posix(self.root)))
        return J.bash(command, stdin=stdin, env=env or self.env)

    def assert_success(self, result):
        self.assertEqual(result.returncode, 0, J.description(result))
        self.assertEqual(result.stdout.strip(), b'LSA_RECOVERY_EMERGENCY_OK', J.description(result))

    def archive(self):
        result = self.run_command('archive')
        self.assertEqual(result.returncode, 0, J.description(result))
        for name, category in (('targets.conf', 'targets'), ('targets.backup.conf', 'backup'), ('emergency_restore.sh', 'script')):
            data = (self.root / name).read_bytes()
            self.assertEqual((self.root / 'recovery-history-v1' / category / (hashlib.sha256(data).hexdigest()+'.raw')).read_bytes(), data)

    def test_safe_notice_retains_raw_script_and_repeated_install_is_harmless(self):
        old = b'/system/bin/pm unhide --user 12 org.example.old\n\x00\xff'
        (self.root / 'emergency_restore.sh').write_bytes(old)
        self.archive()
        self.assert_success(self.run_command('install'))
        script = (self.root / 'emergency_restore.sh').read_bytes()
        for forbidden in (b'/system/bin/pm', b'content call', b'settings delete', b'rm ', b'--user 999'):
            self.assertNotIn(forbidden, script)
        for guidance in (b'user serial', b'reinstalling', b'uninstalling', b'Root is unavailable', b'do not prove ownership'):
            self.assertIn(guidance, script)
        executed = J.bash(script.decode('utf-8'))
        self.assertEqual(executed.returncode, 2, J.description(executed))
        self.assertIn(b'requires review', executed.stdout)
        self.assertIn(b'Current recovery is read-only', executed.stdout)
        self.assertNotIn(b'Choose Show', executed.stdout)
        self.archive()
        self.assert_success(self.run_command('install'))
        self.assertEqual(script, (self.root / 'emergency_restore.sh').read_bytes())
        self.assertEqual(old, (self.root / 'recovery-history-v1/script' / (hashlib.sha256(old).hexdigest()+'.raw')).read_bytes())
        self.assertEqual((self.root / 'targets.conf').read_bytes(), self.originals['targets.conf'])
        self.assertEqual((self.root / 'targets.backup.conf').read_bytes(), self.originals['targets.backup.conf'])

    def test_target_writer_changes_selection_without_recreating_automatic_script(self):
        self.archive()
        self.assert_success(self.run_command('install'))
        script = (self.root / 'emergency_restore.sh').read_bytes()
        proposed = b'0:org.example.new\n12:org.example.new\n'
        self.assert_success(self.run_command('targets', proposed))
        self.assertEqual((self.root / 'targets.conf').read_bytes(), proposed)
        self.assertEqual((self.root / 'emergency_restore.sh').read_bytes(), script)
        self.assertEqual((self.root / 'targets.backup.conf').read_bytes(), self.originals['targets.backup.conf'])

    def test_prepublication_io_failures_keep_old_script(self):
        self.archive()
        for name in ('cat', 'cp', 'chmod', 'cmp', 'mv', 'fsync'):
            with self.subTest(command=name):
                env = self.injected(name, 'exit 74\n')
                result = self.run_command('install', env=env)
                self.assertNotEqual(result.returncode, 0, J.description(result))
                self.assertNotIn(b'LSA_RECOVERY_EMERGENCY_OK', result.stdout)
                self.assertEqual((self.root / 'emergency_restore.sh').read_bytes(), self.originals['emergency_restore.sh'])

    def test_directory_sync_failure_reports_failure_but_retains_old_evidence(self):
        self.archive()
        env = self.injected('fsync', 'for p in "$@"; do [ ! -d "$p" ] || exit 74; done\nexit 0\n')
        result = self.run_command('install', env=env)
        self.assertNotEqual(result.returncode, 0, J.description(result))
        self.assertNotIn(b'LSA_RECOVERY_EMERGENCY_OK', result.stdout)
        old = self.originals['emergency_restore.sh']
        self.assertEqual((self.root / 'recovery-history-v1/script' / (hashlib.sha256(old).hexdigest()+'.raw')).read_bytes(), old)

    def test_nonregular_or_oversized_destination_is_rejected(self):
        destination = self.root / 'emergency_restore.sh'
        destination.unlink()
        destination.mkdir()
        result = self.run_command('install')
        self.assertNotEqual(result.returncode, 0, J.description(result))
        destination.rmdir()
        destination.write_bytes(b'x' * (1048576+1))
        result = self.run_command('install')
        self.assertNotEqual(result.returncode, 0, J.description(result))
        self.assertEqual(destination.stat().st_size, 1048576+1)

    def test_real_symlink_destination_is_rejected(self):
        destination = self.root / 'emergency_restore.sh'
        destination.unlink()
        result = J.bash('ln -s targets.conf ' + J.quoted(J.posix(destination)), env=dict(self.env, MSYS='winsymlinks:nativestrict'))
        if result.returncode or not destination.is_symlink():
            self.skipTest('Host cannot create real symlink; no Android symlink claim')
        result = self.run_command('install')
        self.assertNotEqual(result.returncode, 0, J.description(result))
        self.assertEqual((self.root / 'targets.conf').read_bytes(), self.originals['targets.conf'])

    def test_wrapper_archives_before_any_script_or_target_write_and_checks_marker(self):
        package = self.case / 'ls/augment/com'
        package.mkdir(parents=True)
        source = package / 'EmergencyWrapperProbe.java'
        source.write_text('''package ls.augment.com;
import java.util.*;
class RootShell {
 static final List<String> trace=new ArrayList<>();static String output="LSA_RECOVERY_EMERGENCY_OK";
 static Result run(String c,String i,long t,int n){trace.add(i==null?"install":"targets");return new Result(0,output,false);}
 static class Result {final int exitCode;final String output;final boolean timedOut;
  Result(int c,String o,boolean t){exitCode=c;output=o;timedOut=t;}
  boolean isSuccess(){return exitCode==0&&!timedOut;}}
}
class HideRecoveryArchive {
 static boolean ok=true;
 static RootShell.Result preserve(String value){RootShell.trace.add("archive");return new RootShell.Result(ok?0:74,"",false);}
}
public class EmergencyWrapperProbe {
 static void check(boolean v){if(!v)throw new AssertionError(RootShell.trace.toString());}
 public static void main(String[] args){
  HideRecoveryArchive.ok=false;
  check(!HideRecoveryEmergency.install().isSuccess());check(RootShell.trace.equals(List.of("archive")));
  RootShell.trace.clear();check(!HideRecoveryEmergency.writeTargets("12:org.example.app").isSuccess());
  check(RootShell.trace.equals(List.of("archive")));
  HideRecoveryArchive.ok=true;RootShell.trace.clear();
  check(HideRecoveryEmergency.writeTargets("12:org.example.app").isSuccess());
  check(RootShell.trace.equals(List.of("archive","install","targets")));
  for(String bad:List.of("","wrong","LSA_RECOVERY_EMERGENCY_OK extra")) {
   RootShell.output=bad;RootShell.trace.clear();check(!HideRecoveryEmergency.writeTargets("").isSuccess());
   check(RootShell.trace.equals(List.of("archive","install")));
  }
  System.out.println("PASS emergency wrapper archive/marker gates");
 }
}
''', encoding='utf-8')
        classes = self.case / 'classes'
        subprocess.run(['javac', '--release', '17', '-encoding', 'UTF-8', '-d', str(classes), str(source),
                        str(J.JAVA / 'HideRecoveryEmergency.java')], check=True, timeout=30)
        result = subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.EmergencyWrapperProbe'], capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0, J.description(result))


if __name__ == '__main__':
    unittest.main(verbosity=2)
