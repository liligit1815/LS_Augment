"""Execute actual private Target/Pending/Grant store commands in temporary paths.

The Java probe captures validated operations, never launches Root. The shell uses
the real generated commands, a private-root environment and current UID/GID.
NTFS mode reporting, flock and fsync are explicit doubles; bytes, hashes, CAS,
claim creation and terminal immutability are real. No Android durability claim.
"""
from pathlib import Path
from contextlib import contextmanager
from concurrent.futures import ThreadPoolExecutor
import os
import shutil
import subprocess
import sys
import tempfile
import uuid
from hide_private_test_support import private_storage_stub, PUBLICATION_HOST_SHIM

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
BASH = Path('C:/Program Files/Git/bin/bash.exe') if os.name == 'nt' else Path('/bin/bash')

PROBE = r'''package ls.augment.com;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
public class PrivateStoresProbe {
 static Path output;
 static RootShell.Result wire(String header,String body,String footer) {
  String text=header+"\n"+body+"\n"+footer+"\n";
  return new RootShell.Result(0,text,false,new RootShell.CapturedOutput(text.getBytes(StandardCharsets.US_ASCII),true,false,false));
 }
 static void save(String name,String command,String input) {
  try{Files.writeString(output.resolve(name+".sh"),command);Files.writeString(output.resolve(name+".stdin"),input);}
  catch(Exception failure){throw new RuntimeException(failure);}
 }
 static String uuid(int value){return String.format(Locale.ROOT,"00000000-0000-0000-0000-%012d",value);}
 public static void main(String[] args) {
  output=Path.of(args[0]);
  HideTargetStore target=new HideTargetStore(op->{
   save("target-"+op.mode,op.command(),op.stdin());
   return wire("LSAT_STORE1","ABSENT","LSAT_STORE_END");
  });
  target.compareAndSet(0,new HideTargetStore.Snapshot(1,List.of()));
  HideRecoveryJournal.Entry entry=new HideRecoveryJournal.Entry(uuid(1),uuid(3),0,10,42,"com.example.app",
      "a".repeat(64),123,HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
  HideRootPendingStore pending=new HideRootPendingStore(op->{
   save("pending-"+op.mode,op.command(),"");
   return wire("LSARTS1",op.mode==HideRootPendingStore.Mode.READ?"EMPTY":
       op.mode==HideRootPendingStore.Mode.CLAIM?"CLAIMED|"+op.record:
       "FINISHED|"+op.record+"|"+op.terminal,"LSARTS_END");
  });
  var claim=pending.claim(pending.read(10,42,"com.example.app"),entry);
  if(!claim.acknowledged||!pending.finishNotSent(claim))throw new AssertionError("pending probe receipt");
  var coordinate=new HideRestoreGrantLedger.Coordinate(uuid(4),uuid(2),uuid(1),1,10,42,"com.example.app",uuid(5));
  var proof=new HideRestoreGrantLedger.StatusProof(coordinate,"b".repeat(64));
  var restore=new HideRecoveryJournal.Entry(uuid(1),uuid(3),0,10,42,"com.example.app","a".repeat(64),123,
      HideRecoveryJournal.Stage.RESTORE_PREPARED,"HIDDEN",0,false,uuid(2),proof);
  HideRestoreGrantStore grant=new HideRestoreGrantStore(op->{
   save("grant-"+op.mode,op.command(),"");
   return wire("LSARGS1",op.mode==HideRestoreGrantStore.Mode.READ?"EMPTY":
       op.mode==HideRestoreGrantStore.Mode.CLAIM?"CLAIMED|"+op.record:
       "FINISHED|"+op.record+"|"+op.terminal,"LSARGS_END");
  });
  grant.read(restore);var claimed=grant.claim(restore);
  if(!claimed.acknowledged||!grant.finishNotSent(claimed))throw new AssertionError("grant probe receipt");
 }
}
'''

SHIM = r'''
LSA_FIXTURE_OWNER="$(command id -u):$(command id -g)"
stat() {
  if [ "$1" = -c ]; then
    case "$2" in
      '%u:%g:%a'|'%u:%g:%a:%h')
        owner="$LSA_FIXTURE_OWNER"
        [ -z "${LSA_TEST_WRONG_OWNER:-}" ] || owner='-1:-1'
        if [ -d "$3" ]; then mode=700; else mode=600; fi
        if [ "$2" = '%u:%g:%a:%h' ]; then
          links=$(command stat -c '%h' "$3") || return
          printf '%s:%s:%s\n' "$owner" "$mode" "$links"
        else printf '%s:%s\n' "$owner" "$mode"; fi
        return ;;
    esac
  fi
  command stat "$@"
}
flock() { [ -z "${LSA_TEST_LOCK_FAIL:-}" ]; }
fsync() {
  [ "${LSA_TEST_SYNC_FAIL:-}" != all ] || return 74
  local task_sync_path
  for task_sync_path in "$@"; do
    if [ "${LSA_TEST_SYNC_FAIL:-}" = directories ] && [ -d "$task_sync_path" ]; then return 74; fi
  done
}
mv() {
  case "${LSA_TEST_MOVE_FAULT:-}" in
    skip) return 0 ;;
    fail) return 74 ;;
    before-term) kill -TERM "$$"; return 74 ;;
    after-term) command mv "$@" || return; kill -TERM "$$"; return 74 ;;
    race) printf '%s\n' foreign-record >"${@: -1}"; command mv "$@"; return ;;
  esac
  command mv "$@"
}
'''


def posix(path):
    if os.name != 'nt':
        return str(path)
    return subprocess.run([str(BASH), '-c', 'cygpath -u -- "$1"', 'store-fixture', str(path)],
                          capture_output=True, check=True).stdout.decode().strip()


def local_path(path):
    # Grant coordinates legitimately exceed MAX_PATH. Verify their actual bytes,
    # rather than letting Path.is_file silently treat a long path as absent.
    path = path.absolute()
    return Path('\\\\?\\' + str(path)) if os.name == 'nt' and not str(path).startswith('\\\\?\\') else path


@contextmanager
def workspace():
    parent = (ROOT / 'out').resolve()
    parent.mkdir(exist_ok=True)
    folder = Path(tempfile.mkdtemp(prefix='hide-stores-', dir=parent)).resolve()
    try:
        yield folder
    finally:
        # Grant coordinates intentionally produce long paths. Use the Windows
        # long-path form only for cleanup, after checking the exact test root.
        assert folder.parent == parent and folder.name.startswith('hide-stores-')
        target = '\\\\?\\' + str(folder) if os.name == 'nt' else str(folder)
        shutil.rmtree(target)


def main():
    checks = 0

    def check(value, message):
        nonlocal checks
        checks += 1
        if not value:
            raise AssertionError(message)

    with workspace() as folder:
        package = folder / 'ls/augment/com'
        package.mkdir(parents=True)
        probe = package / 'PrivateStoresProbe.java'
        probe.write_text(PROBE, encoding='utf-8')
        names = ['RootShell', 'HideTargetCodec', 'HideTargetStore', 'HideRootPendingStore',
                 'HideRestoreGrantStore', 'HideRecoveryJournal', 'HideRootProtocol', 'HideRestoreGrantLedger']
        classes = folder / 'classes'
        subprocess.run(['javac', '--release', '17', '-encoding', 'UTF-8', '-d', str(classes),
                        *[str(JAVA / (name + '.java')) for name in names], str(probe),
                        str(private_storage_stub(package))], check=True, timeout=60)
        subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.PrivateStoresProbe', str(folder)],
                       check=True, timeout=30)
        commands = {}
        for source in folder.glob('*.sh'):
            command = source.read_text(encoding='utf-8')
            check(command.count('ROOT="${LSA_PRIVATE_ROOT:?}/v2/') == 1, 'private boundary missing')
            check('/data/adb' not in command, 'unexpected external storage path')
            commands[source.stem] = command

        def run(name, private, **changes):
            private.mkdir(parents=True, exist_ok=True)
            script = folder / ('execute-' + uuid.uuid4().hex + '.sh')
            script.write_text(SHIM + PUBLICATION_HOST_SHIM + commands[name], encoding='utf-8', newline='\n')
            return subprocess.run([str(BASH), str(script)],
                                  input=(folder / (name + '.stdin')).read_bytes(),
                                  capture_output=True, timeout=60,
                                  env=dict(dict(os.environ, LSA_PRIVATE_ROOT=posix(private)), **changes))

        def success(result, marker):
            check(result.returncode == 0 and marker in result.stdout, repr(result))

        def snapshot(private):
            private = local_path(private)
            return {str(p.relative_to(private)): p.read_bytes() for p in private.rglob('*') if p.is_file()}

        for kind in (() if '--publish-only' in sys.argv else ('target', 'pending', 'grant')):
            private = folder / kind
            success(run(kind + '-READ', private), b'ABSENT' if kind == 'target' else b'EMPTY')
            missing = run(kind + '-READ', private, LSA_PRIVATE_ROOT='')
            check(missing.returncode != 0, 'missing private root accepted')
            action = '-CAS' if kind == 'target' else '-CLAIM'
            before = snapshot(private)
            failed = run(kind + action, private, LSA_TEST_SYNC_FAIL='all')
            check(failed.returncode != 0, 'fsync failure acknowledged')
            check(all(snapshot(private).get(key) == value for key, value in before.items()), 'old evidence lost')
            check(not list(private.rglob('*.claim')) and not list(private.rglob('document')), 'failed prepublication published data')
            if kind in ('target', 'grant'):
                wrong = run(kind + action, private, LSA_TEST_WRONG_OWNER='1')
                check(wrong.returncode != 0, 'foreign UID/GID accepted')
            if kind in ('target', 'pending', 'grant'):
                busy = run(kind + action, private, LSA_TEST_LOCK_FAIL='1')
                check(busy.returncode != 0, 'busy transaction lock accepted')
            success(run(kind + action, private), b'APPLIED|' if kind == 'target' else b'CLAIMED|')
            published = snapshot(private)
            duplicate = run(kind + action, private)
            check((b'CONFLICT' in duplicate.stdout) if kind == 'target' else duplicate.returncode != 0,
                  'duplicate write created fresh authority')
            check(snapshot(private) == published, 'duplicate write replaced immutable records')
            success(run(kind + '-READ', private), b'DATA|' if kind == 'target' else b'TERMINAL|-')
            if kind != 'target':
                success(run(kind + '-FINISH', private), b'FINISHED|')
                completed = snapshot(private)
                success(run(kind + '-FINISH', private), b'FINISHED|')
                check(snapshot(private) == completed, 'completion retry replaced records')
                success(run(kind + '-READ', private), b'TERMINAL|LOCAL_NOT_SENT')
            durable = folder / (kind + '-uncertain')
            uncertain = run(kind + action, durable, LSA_TEST_SYNC_FAIL='directories')
            check(uncertain.returncode != 0, 'directory sync failure acknowledged')
            check(bool(list(durable.rglob('*.claim')) or list(durable.rglob('document'))), 'published responsibility discarded')
            success(run(kind + '-READ', durable), b'DATA|' if kind == 'target' else b'TERMINAL|-')
            print(f'PASS private {kind}: read/write, retries, failed durability and retained evidence', flush=True)
        for kind in ('pending', 'grant'):
            for fault in ('skip', 'fail', 'before-term', 'after-term', 'race'):
                private = folder / (kind + '-rename-' + fault)
                outcome = run(kind + '-CLAIM', private, LSA_TEST_MOVE_FAULT=fault)
                check(outcome.returncode != 0 and b'CLAIMED|' not in outcome.stdout,
                      'interrupted/skipped publication granted send authority')
                claims = list(local_path(private).rglob('*.claim'))
                if fault in ('skip', 'fail', 'before-term'):
                    check(not claims, 'failure before rename published a claim')
                elif fault == 'race':
                    check(len(claims) == 1 and claims[0].read_bytes() == b'foreign-record\n',
                          'concurrent foreign destination was overwritten')
                else:
                    check(len(claims) == 1, 'interruption after rename discarded responsibility')
                    retained = snapshot(private)
                    retry = run(kind + '-CLAIM', private)
                    check(retry.returncode != 0 and b'CLAIMED|' not in retry.stdout,
                          'retry after lost commit acknowledgement granted fresh send authority')
                    check(snapshot(private) == retained, 'retry overwrote the uncertain claim')
                    success(run(kind + '-READ', private), b'TERMINAL|-')
            private = folder / (kind + '-concurrent')
            with ThreadPoolExecutor(max_workers=2) as executor:
                results = list(executor.map(lambda _: run(kind + '-CLAIM', private), range(2)))
            check(sum(r.returncode == 0 and b'CLAIMED|' in r.stdout for r in results) == 1,
                  'concurrent identical claims did not have exactly one authority winner')
            check(len(list(local_path(private).rglob('*.claim'))) == 1, 'concurrent claims duplicated evidence')
            print(f'PASS private {kind}: no hard links, competing claims, no-overwrite race, skipped rename, and TERM before/after publication', flush=True)
    print(f'PASS private Target/Pending/Grant scripts: {checks} assertions; real bytes/CAS/claims, explicit mode/flock/fsync doubles')


if __name__ == '__main__':
    main()
