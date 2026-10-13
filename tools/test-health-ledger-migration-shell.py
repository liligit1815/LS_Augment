"""Run the exact health-ledger migration shell in disposable, relocated sandboxes.

Only Android roots and Android service/UID replies are substituted. Hashing,
copying, link checks and removal execute against real local fixture files.
No device, system mount or real health database is accessed.
"""
from pathlib import Path
import hashlib
import json
import os
import re
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'audit-output/health-ledger-migration-shell'
OUTPUT.mkdir(parents=True, exist_ok=True)
SCRIPT = (ROOT / 'android/app/src/main/assets/health_ledger_migrate.sh').read_text(encoding='utf-8')
GIT_BASH = Path('C:/Program Files/Git/bin/bash.exe')
BASH = str(GIT_BASH) if GIT_BASH.exists() else shutil.which('bash')
assert BASH, 'A local shell is required for offline fixtures'
FILES = ('databases/ls_augment_steps_v1.db', 'databases/ls_augment_steps_v1.db-wal',
         'databases/ls_augment_steps_v1.db-shm', 'databases/ls_augment_steps_v1.db-journal',
         'files/ls_augment_steps.lock')

def posix(path):
    value = path.resolve().as_posix()
    return '/' + value[0].lower() + value[2:] if value[1:2] == ':' else value

def quote(value):
    return "'" + value.replace("'", "'\"'\"'") + "'"

class Fixture:
    def __init__(self, root, populated=True):
        self.root = root
        self.base = root / 'data/user/0/com.mi.health'
        self.stage = root / 'data/user/0/ls.augment.com/cache/health-ledger-migrate-fixture'
        self.stage.mkdir(parents=True)
        (self.base/'databases').mkdir(parents=True)
        (self.base/'files').mkdir()
        (root/'proc').mkdir()
        self.native = {
            self.base/'databases/fitness_data': b'native activity history',
            self.base/'databases/fitness_summary': b'native aggregate history',
            self.base/'databases/fitness_data-wal': b'native WAL',
            self.base/'files/account-login.json': b'original login',
            root/'outside': b'outside sentinel',
        }
        for path, value in self.native.items():
            path.write_bytes(value)
        self.original = {}
        if populated:
            for index, relative in enumerate(FILES):
                value = f'module ledger fixture {index}'.encode()
                (self.base/relative).write_bytes(value)
                self.original[relative] = value

    def digest(self):
        manifest = '\n'.join(name + ':' + hashlib.sha256(value).hexdigest()
                             for name, value in self.original.items())
        return hashlib.sha256(manifest.encode()).hexdigest()

    def preserve(self, allow_changed=False):
        for path, value in self.native.items():
            if path.parent == self.base/'databases' and (self.base/'original-databases').exists():
                path=self.base/'original-databases'/path.name
            assert path.read_bytes() == value, ('native/outside sentinel changed', path)
        for name, value in self.original.items():
            path = self.base/name
            if name.startswith('databases/') and (self.base/'original-databases').exists():
                path=self.base/'original-databases'/Path(name).name
            if name == FILES[0] and (self.root/'saved-module').exists():
                path=self.root/'saved-module'
            assert path.exists(), ('source removed before cleanup ACK', name)
            if not allow_changed:
                assert path.read_bytes() == value, ('source changed', name)

    def run(self, phase='snapshot', case='normal', expected_digest='', setup=''):
        root = posix(self.root)
        # Exact script, with fixed Android roots mapped into this disposable directory.
        body = re.sub(r'(?<![A-Za-z0-9_/])/data(?=/|[\s\'\"]|$)', root+'/data', SCRIPT)
        body = body.replace('/proc/[0-9]*', root+'/proc/[0-9]*')
        prefix = f'''set -e
fixture={quote(root)}
expected_user=0
expected_uid=10177
module_uid=10123
base={quote(posix(self.base))}
stage={quote(posix(self.stage))}
phase={quote(phase)}
expected_digest={quote(expected_digest)}
fixture_case={quote(case)}
id() {{ printf '0\\n'; }}
sleep() {{ :; }}
cmd() {{
 [ "$*" = 'package list packages --user 0 -U com.mi.health' ] || return 1
 if [ "$fixture_case" = wrong-package ];then printf 'package:com.mi.health uid:10178\\n';else printf 'package:com.mi.health uid:10177\\n';fi
}}
stat() {{
 if [ "$1" = -c ] && [ "$2" = %u ];then
  case "$3" in "$stage"|"$stage/"*) printf '10123\\n';;
   *) if [ "$fixture_case" = foreign-owner ] && [ "$3" = "$base/databases/ls_augment_steps_v1.db-shm" ];then printf '10178\\n';else printf '10177\\n';fi;;esac
 elif [ "$1" = -c ] && [ "$2" = %s ] && [ "$fixture_case" = oversize ];then printf '268435457\\n'
 elif [ "$1" = -c ] && [ "$2" = %s ] && [ "$fixture_case" = total-oversize ];then printf '134217729\\n'
 else command stat "$@";fi
}}
am() {{
 [ "$*" = 'force-stop --user 0 com.mi.health' ] || return 1
 printf stopped >> "$fixture/stopped"
 [ "$fixture_case" != stop-fail ] || return 1
 if [ "$fixture_case" = replace-directory ];then
  command mv "$base/databases" "$base/old-databases"
  command mkdir "$fixture/foreign-directory"
  command ln -s "$fixture/foreign-directory" "$base/databases"
 fi
}}
cp() {{
 command cp "$@" || return
 if [ "$fixture_case" = concurrent-copy ] && [ "$1" = "$base/databases/ls_augment_steps_v1.db" ];then
  printf changed >> "$1"
 fi
 if [ "$fixture_case" = respawn-snapshot ] && [ "$1" = "$base/databases/ls_augment_steps_v1.db" ];then
  mkdir -p "$fixture/proc/42";printf 'Uid:\\t10177\\t10177\\t10177\\t10177\\n' > "$fixture/proc/42/status"
 fi
}}
sha256sum() {{
 if [ "$fixture_case" = concurrent-cleanup ] || [ "$fixture_case" = respawn-cleanup ];then case "${{1:-}}" in "$base/"*)
  n=0;[ ! -f "$fixture/hash-count" ] || n=$(cat "$fixture/hash-count")
  n=$((n+1));printf '%s' "$n" > "$fixture/hash-count"
  if [ "$fixture_case" = concurrent-cleanup ] && [ "$n" = 6 ];then printf changed >> "$1";fi
  if [ "$fixture_case" = respawn-cleanup ] && [ "$n" = 10 ];then
   mkdir -p "$fixture/proc/42";printf 'Uid:\\t10177\\t10177\\t10177\\t10177\\n' > "$fixture/proc/42/status"
  fi;;esac;fi
 command sha256sum "$@"
}}
chown() {{
 [ "$1" = '10123:10123' ] || return 1
 case "$2" in "$stage/"*) ;;*) return 1;;esac
 [ "$fixture_case" != chown-fail ]
}}
restorecon() {{
 [ "$1" = -D ] && [ "$2" = -F ] || return 1
 shift 2
 printf called >> "$fixture/label-calls"
 for path in "$@";do
  case "$path" in "$stage/"*) ;;*) return 1;;esac
  printf '%s\\n' "$path" >> "$fixture/labels"
 done
 printf 'SELinux: Loaded file context from policy\\n'
 printf 'SELinux: Loaded file context from stderr policy\\n' >&2
 [ "$fixture_case" != label-fail ]
}}
fsync() {{
 printf '%s\\n' "$*" >> "$fixture/syncs"
 [ "$fixture_case" != sync-fail ]
}}
command() {{
 if [ "$fixture_case" = sync-missing ] && [ "$*" = '-v fsync' ];then return 1;fi
 builtin command "$@"
}}
rm() {{
 for path in "$@";do
  case "$path" in "$base/"*)
   [ "$phase" = cleanup ] && [ -f "$fixture/stopped" ] || return 1
   if [ "$fixture_case" = delete-fail ];then return 1;fi;;esac
 done
 command rm "$@"
}}
'''
        script = self.root/(phase+'-'+case+'.sh')
        script.write_text(prefix+setup+'\n'+body, encoding='utf-8', newline='\n')
        (self.root/'hash-count').unlink(missing_ok=True)
        run = subprocess.run([BASH, posix(script)], text=True, capture_output=True, timeout=60,
                             env=dict(os.environ, MSYS='winsymlinks'))
        return run

results = []
def record(name, run):
    results.append({'case':name,'exit':run.returncode,'output':run.stdout.strip(),'passed':True})
    if len(results) % 8 == 0:
        print(f'PASS health migration shell progress: {len(results)} cases', flush=True)

with tempfile.TemporaryDirectory(prefix='fixture-',dir=OUTPUT) as temporary:
    work=Path(temporary).resolve()
    assert work.is_relative_to(OUTPUT.resolve())
    fixture=Fixture(work/'normal')
    snapshot=fixture.run()
    assert snapshot.returncode==0 and snapshot.stdout.strip()=='HEALTH_LEDGER_DIGEST='+fixture.digest(), snapshot
    fixture.preserve()
    for relative,value in fixture.original.items():
        assert (fixture.stage/Path(relative).name).read_bytes()==value
    assert len((fixture.root/'labels').read_text().splitlines())==5
    assert (fixture.root/'label-calls').read_text()=='called'
    assert not snapshot.stderr.strip(),snapshot
    record('snapshot-copy-hash-and-private-label-source-kept-before-import-ACK',snapshot)
    cleanup=fixture.run('cleanup',expected_digest=fixture.digest())
    assert cleanup.returncode==0 and cleanup.stdout.strip()=='HEALTH_LEDGER_CLEANED=1',cleanup
    assert all(not(fixture.base/name).exists() for name in FILES)
    assert len((fixture.root/'syncs').read_text().splitlines())==2
    for path,value in fixture.native.items(): assert path.read_bytes()==value
    record('cleanup-after-ACK-digest-and-directory-durability',cleanup)
    again=fixture.run('cleanup',expected_digest=fixture.digest())
    assert again.returncode==0 and again.stdout.strip()=='HEALTH_LEDGER_ABSENT=1',again
    record('cleanup-idempotent-after-previous-delete',again)

    for case,marker,setup in (
        ('wrong-package','package_identity',''),
        ('foreign-owner','file_identity',''),
        ('oversize','file_too_large',''),
        ('total-oversize','ledger_too_large',''),
        ('stop-fail','force_stop',''),
        ('surviving-process','process_running','mkdir -p "$fixture/proc/42";printf "Uid:\\t10177\\t10177\\t10177\\t10177\\n" > "$fixture/proc/42/status"'),
        ('file-hardlink','file_hardlink','ln "$base/databases/ls_augment_steps_v1.db" "$fixture/alias"'),
        ('file-symlink','file_identity','command mv "$base/databases/ls_augment_steps_v1.db" "$fixture/saved-module";ln -s "$fixture/saved-module" "$base/databases/ls_augment_steps_v1.db"'),
        ('directory-symlink','directory_identity','command mv "$base/databases" "$base/original-databases";ln -s "$base/original-databases" "$base/databases"'),
        ('stage-target-exists','staging_target_exists','printf sentinel > "$stage/ls_augment_steps_v1.db"'),
        ('stage-target-symlink','staging_target_exists','ln -s "$fixture/outside" "$stage/ls_augment_steps_v1.db"'),
        ('stage-hardlink','staging_target_exists','ln "$fixture/outside" "$stage/ls_augment_steps_v1.db"'),
        ('label-fail','private_label',''),
        ('chown-fail','private_owner',''),
        ('concurrent-copy','copy_verification',''),
        ('respawn-snapshot','process_running',''),
    ):
        fixture=Fixture(work/case)
        run=fixture.run(case=case,setup=setup)
        assert run.returncode==73 and 'HEALTH_LEDGER_ERROR='+marker in run.stdout,(case,run)
        fixture.preserve(allow_changed=case=='concurrent-copy')
        record(case,run)

    fixture=Fixture(work/'replace-directory')
    run=fixture.run(case='replace-directory')
    assert run.returncode==73 and 'directory_identity' in run.stdout,run
    for relative,value in fixture.original.items():
        path=fixture.base/relative.replace('databases/','old-databases/')
        assert path.read_bytes()==value
    for path,value in fixture.native.items():
        if path.parent.name=='databases':path=path.parent.parent/'old-databases'/path.name
        assert path.read_bytes()==value
    record('directory-replaced-after-stop',run)

    for case,expected,marker in (
        ('wrong-digest','b'*64,'source_changed'),('short-digest','abc','source_changed'),
        ('malformed-digest','zzz','digest_format'),('concurrent-cleanup',None,'source_changed'),
        ('respawn-cleanup',None,'process_running'),
        ('delete-fail',None,'delete'),
    ):
        fixture=Fixture(work/case)
        run=fixture.run('cleanup',case=case,expected_digest=expected or fixture.digest())
        assert run.returncode==73 and 'HEALTH_LEDGER_ERROR='+marker in run.stdout,(case,run)
        fixture.preserve(allow_changed=case=='concurrent-cleanup')
        record(case,run)

    for case,marker in (('sync-fail','removal_not_durable'),('sync-missing','fsync_unavailable')):
        fixture=Fixture(work/case)
        run=fixture.run('cleanup',case=case,expected_digest=fixture.digest())
        assert run.returncode==73 and 'HEALTH_LEDGER_ERROR='+marker in run.stdout,run
        assert all(not(fixture.base/name).exists() for name in FILES)
        for path,value in fixture.native.items():assert path.read_bytes()==value
        record(case+'-never-claims-cleanup-success',run)

    for case,populated,setup in (
        ('empty',False,''),
        ('empty-live-process',False,'mkdir -p "$fixture/proc/42";printf "Uid:\\t10177\\t10177\\t10177\\t10177\\n" > "$fixture/proc/42/status"'),
    ):
        fixture=Fixture(work/case,populated)
        run=fixture.run(case=case,setup=setup)
        assert run.returncode==0 and run.stdout.strip()=='HEALTH_LEDGER_ABSENT=1',run
        assert not(fixture.root/'stopped').exists()
        fixture.preserve()
        record(case+'-no-source-no-stop',run)

    fixture=Fixture(work/'discard-stage')
    for relative,value in fixture.original.items():(fixture.stage/Path(relative).name).write_bytes(value)
    run=fixture.run('discard_stage')
    assert run.returncode==0 and run.stdout.strip()=='HEALTH_LEDGER_STAGE_REMOVED=1',run
    assert not fixture.stage.exists() and not (fixture.root/'stopped').exists()
    fixture.preserve();record('discard-only-owned-staging-without-source-or-process-mutations',run)
    for case,setup,marker in (
        ('discard-unknown','printf sentinel > "$stage/not-module-owned"','staging_unknown_entry'),
        ('discard-symlink','ln -s "$fixture/outside" "$stage/ls_augment_steps_v1.db"','staging_identity'),
        ('discard-hardlink','ln "$fixture/outside" "$stage/ls_augment_steps_v1.db"','staging_identity'),
    ):
        fixture=Fixture(work/case)
        run=fixture.run('discard_stage',case=case,setup=setup)
        assert run.returncode==73 and 'HEALTH_LEDGER_ERROR='+marker in run.stdout,(case,run)
        assert fixture.stage.exists() and not (fixture.root/'stopped').exists()
        fixture.preserve();record(case+'-retained',run)

report={'success':True,'scope':'OFFLINE_EXACT_SHELL_WITH_RELOCATED_PATHS_AND_ANDROID_SERVICE_DOUBLES_NO_DEVICE', 'cases':results}
(OUTPUT/'result.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
print(f'PASS health ledger migration shell: {len(results)} cases; native fitness/login sentinels unchanged')
