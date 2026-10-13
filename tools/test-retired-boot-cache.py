"""Execute the production exact-path retired bootstrap cleanup in isolated fixtures."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'android/app/src/main/java/ls/augment/com'
JAVA_HOME=Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
BASH='C:/Program Files/Git/bin/bash.exe'
# Compile the shared pure helper so Java escaping and the emitted shell are real.
with tempfile.TemporaryDirectory(prefix='retired-boot-helper-') as compilation:
    build=Path(compilation)
    emitter=build/'RetiredBootCacheEmitter.java'
    emitter.write_text('package ls.augment.com; public final class RetiredBootCacheEmitter {'
                       'public static void main(String[] a) {'
                       'System.out.print(RetiredBootCache.command(Boolean.parseBoolean(a[0])));}}',encoding='utf-8')
    subprocess.run([str(JAVA_HOME/'bin/javac.exe'),'-encoding','UTF-8','-d',str(build),
                    str(SOURCE/'RetiredBootCache.java'),str(emitter)],check=True)
    def emitted(report):
        return subprocess.check_output([str(JAVA_HOME/'bin/java.exe'),'-cp',str(build),
                                        'ls.augment.com.RetiredBootCacheEmitter',str(report).lower()],text=True)
    silent_script=emitted(False)
    report_script=emitted(True)
script=silent_script+'echo LSA_BOOT_CACHE_RETIRED\n'
def posix(p):
    s=p.resolve().as_posix()
    return '/'+s[0].lower()+s[2:] if s[1:2]==':' else s
checks=0
def check(value,label):
    global checks
    assert value,label
    checks+=1

check('RetiredBootCache.command(false) + "echo LSA_BOOT_CACHE_RETIRED\\n"' in
      (SOURCE/'ExternalStorageMigration.java').read_text(encoding='utf-8'),'upgrade uses shared cleanup')
check('RetiredBootCache.command(true)' in (SOURCE/'ModuleExternalReset.java').read_text(encoding='utf-8'),
      'reset uses shared cleanup')

with tempfile.TemporaryDirectory(prefix='retired-boot-cache-') as temp:
    base=Path(temp)
    def case(name,**flags):
        root=base/name/'data/system/ls_augment';root.mkdir(parents=True)
        (root/'boot-config-v1').write_text('LSA module snapshot')
        (root/'boot-config-v1.tmp').write_text('interrupted private publication')
        (root/'unknown-user-file').write_text('retain')
        if flags.get('hardlink'):os.link(root/'boot-config-v1',root/'hardlink')
        if flags.get('oversize'):(root/'boot-config-v1').write_bytes(b'x'*262145)
        if flags.get('directory'):
            (root/'boot-config-v1').unlink();(root/'boot-config-v1').mkdir()
        adapted=(report_script if flags.get('report') else script).replace('/data',posix(base/name/'data'))
        # NTFS cannot model Android ownership or directory fsync. All filesystem
        # traversal, file sizes, link counts, exact deletion and rmdir are real.
        adapters=r'''
fsync(){ [ "$sync_fail" != 1 ]; }
test(){ builtin test "$@"; }
[(){
  if [raw "$1" = '!' ] && [raw "$2" = -L ] && [raw "$linked" = 1 ]; then return 1; fi
  builtin [ "$@"
}
[raw(){ builtin [ "$@"; }
stat(){
  if [ "$1" = -c ] && [ "$2" = '%u:%g:%a' ]; then
    if [ "$bad_owner" = 1 ] || { [ "$bad_tmp_owner" = 1 ] && [ "${3##*/}" = boot-config-v1.tmp ]; }; then echo 123:123:777;
    elif [ -d "$3" ]; then echo 0:1000:750; else echo 0:1000:640; fi
  else command stat "$@"; fi
}
'''
        prefix='\n'.join(f'{k}={int(bool(v))}' for k,v in flags.items())+'\n'
        result=subprocess.run([BASH,'-c',prefix+adapters+adapted],capture_output=True,timeout=45)
        return root,result

    root,result=case('valid')
    check(result.returncode==0,result.stderr.decode())
    check(result.stdout.strip()==b'LSA_BOOT_CACHE_RETIRED','success receipt')
    check(not (root/'boot-config-v1').exists() and not (root/'boot-config-v1.tmp').exists(),'known files retired')
    check((root/'unknown-user-file').read_text()=='retain','unknown file retained')
    root,result=case('reported',report=True)
    check(result.returncode==0,'reset reporting mode succeeds')
    check(result.stdout.decode().splitlines()==[
        'LSA_RESET_REMOVED:'+posix(root/'boot-config-v1'),
        'LSA_RESET_REMOVED:'+posix(root/'boot-config-v1.tmp')],'reset per-file count receipts preserved')
    for name in ('bad_owner','bad_tmp_owner','linked','hardlink','oversize','directory'):
        root,result=case(name,**{name:True})
        check(result.returncode!=0,name+' rejected')
        check((root/'boot-config-v1').exists(),name+' source retained')
        check((root/'unknown-user-file').exists(),name+' unknown retained')
    root,result=case('sync',sync_fail=True)
    check(result.returncode!=0,'fsync failure cannot acknowledge migration')
    check((root/'unknown-user-file').exists(),'fsync failure cannot remove sibling')
    absent=base/'absent/data/system';absent.mkdir(parents=True)
    result=subprocess.run([BASH,'-c',script.replace('/data',posix(base/'absent/data'))],capture_output=True,timeout=45)
    check(result.returncode==0,'missing legacy directory is idempotent')
print(f'PASS: retired boot cache {checks} checks')
