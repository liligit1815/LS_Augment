"""Run the production legacy import and exact cleanup against disposable fixtures."""
from pathlib import Path
import base64
import hashlib
import os
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
JDK = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
BASH = 'C:/Program Files/Git/bin/bash.exe'

def posix(path):
    value = Path(path).resolve().as_posix()
    return '/' + value[0].lower() + value[2:] if value[1:2] == ':' else value

def quote(value):
    return "'" + value.replace("'", "'\"'\"'") + "'"

checks = 0
def check(value, message):
    global checks
    assert value, message
    checks += 1

with tempfile.TemporaryDirectory(prefix='hide-private-') as tmp:
    folder = Path(tmp)
    package = folder / 'ls/augment/com'
    package.mkdir(parents=True)
    probe = package / 'Probe.java'
    probe.write_text('''package ls.augment.com; public class Probe {
      public static void main(String[] a) { System.out.print(a[0].equals("export")
        ? HideLegacyStorageMigration.exportCommand() : HideLegacyStorageMigration.cleanupCommand()); }
    }''', encoding='utf-8')
    subprocess.run([str(JDK/'javac.exe'), '-encoding', 'UTF-8', '-d', str(folder/'classes'),
                    str(SRC/'RootShell.java'), str(SRC/'HideLegacyStorageMigration.java'), str(probe)], check=True)
    commands = {mode: subprocess.check_output([str(JDK/'java.exe'), '-cp', str(folder/'classes'),
                'ls.augment.com.Probe', mode]).decode() for mode in ('export', 'cleanup')}
    # Only root identity and fsync are adapters. All path/hash/link/deletion operations are real.
    adapters = r'''
id() { printf '0\n'; }
fsync() { [ "$sync_fail" != 1 ]; }
flock() { [ "$lock_busy" != 1 ]; }
stat() {
  if [ "$1" = -c ] && [ "$2" = '%u:%g:%a' ]; then
    if [ "$bad_owner" = 1 ]; then printf '123:123:700\n';
    elif [ -d "$3" ]; then printf '0:0:700\n'; else printf '0:0:600\n'; fi
  else command stat "$@"; fi
}
'''
    def run(mode, fixture, stdin='', **flags):
        script = commands[mode].replace('/data/adb/ls_augment/v2', posix(fixture/'data/adb/ls_augment/v2'))
        script = script.replace('for parent in /data /data/adb /data/adb/ls_augment',
                                'for parent in ' + ' '.join(quote(posix(fixture/p)) for p in ('data','data/adb','data/adb/ls_augment')))
        prefix = adapters + '\n' + '\n'.join(f'{name}={value}' for name,value in flags.items()) + '\n'
        return subprocess.run([BASH, '-c', prefix + script], input=stdin.encode(), capture_output=True,
                              env=dict(os.environ, MSYS='winsymlinks:nativestrict'))

    def fixture(name):
        case = folder/name
        root = case/'data/adb/ls_augment/v2'
        (root/'manual-targets-v1').mkdir(parents=True)
        (root/'recovery-history-v1/selection').mkdir(parents=True)
        (root/'manual-targets-v1/document').write_text('LSAT1|0|0\nLSAT_END\n')
        (root/'manual-targets-v1/lock').write_bytes(b'')
        (root/'recovery-history-v1/selection/abc.raw').write_bytes(b'private recovery evidence\x00\xff')
        (root/'runtime.properties').write_text('unknown sibling; retain')
        return case, root

    def manifest(export):
        lines = export.decode().splitlines()
        check(lines[0]=='LSA_HIDE_IMPORT1' and lines[-1]=='LSA_HIDE_IMPORT_END', 'export framing')
        output=[]
        for row in lines[1:-1]:
            fields=row.split('|')
            if fields[0]=='F':
                value=base64.b64decode(fields[5]);check(hashlib.sha256(value).hexdigest()==fields[4], 'exact content')
                row='|'.join(fields[:5])
            output.append(row)
        return '\n'.join(output)+'\n'

    case, root = fixture('normal')
    exported=run('export',case)
    check(exported.returncode==0, exported.stderr.decode())
    saved=manifest(exported.stdout)
    cleared=run('cleanup',case,saved)
    check(cleared.returncode==0 and cleared.stdout.strip()==b'LSA_HIDE_IMPORT_CLEAN',cleared.stderr.decode())
    check(not (root/'manual-targets-v1').exists(), 'legacy tree removed')
    check((root/'runtime.properties').read_text()=='unknown sibling; retain', 'unknown data untouched')
    check(run('cleanup',case,'\n').returncode==0, 'absent source is retryable')

    for kind in ('changed', 'new_file', 'incomplete', 'foreign_owner', 'hardlink', 'locked'):
        case,root=fixture(kind)
        exported=run('export',case);check(exported.returncode==0, 'baseline export '+kind)
        saved=manifest(exported.stdout)
        flags={}
        if kind=='changed': (root/'manual-targets-v1/document').write_text('changed')
        if kind=='new_file': (root/'manual-targets-v1/unexpected').write_text('concurrent')
        if kind=='incomplete': saved='\n'
        if kind=='foreign_owner': flags['bad_owner']=1
        if kind=='locked': flags['lock_busy']=1
        if kind=='hardlink': os.link(root/'manual-targets-v1/document',root/'alias')
        result=run('cleanup',case,saved,**flags)
        check(result.returncode!=0,'unsafe cleanup accepted '+kind)
        check((root/'manual-targets-v1/document').exists(),'source removed on refusal '+kind)
        check((root/'runtime.properties').exists(),'sibling removed '+kind)
    case,root=fixture('oversize')
    (root/'manual-targets-v1/document').write_bytes(b'x'*1048577)
    check(run('export',case).returncode!=0,'oversize accepted')
    case,root=fixture('sync_failure')
    saved=manifest(run('export',case).stdout)
    check(run('cleanup',case,saved,sync_fail=1).returncode!=0,'failed durable cleanup acknowledged')

    # Real Java migration: storage writes are real, root transport and Android directory fsync are doubles.
    stub=package/'RootShell.java'
    stub.write_text('''package ls.augment.com;
class RootShell {
 static String snapshot, input; static int cleaned; static boolean sync=true, clean=true;
 static String bash, failSyncPath; static java.io.File syncLog;
 static class CapturedOutput {String text;CapturedOutput(String t){text=t;}boolean reliable(){return true;}String text(){return text;}}
 static class Result {int exitCode;String output;CapturedOutput capture;Result(int code,String s){exitCode=code;output=s.trim();capture=new CapturedOutput(s);}boolean isSuccess(){return exitCode==0;}}
 static String quote(String s){return "'"+s.replace("'","'\\\"'\\\"'")+"'";}
 static Result run(String cmd,String stdin,long timeout,int limit){if(cmd.contains("echo LSA_HIDE_IMPORT_END"))return new Result(0,snapshot);cleaned++;input=stdin;return new Result(clean?0:74,"LSA_HIDE_IMPORT_CLEAN\\n");}
 static String posix(java.io.File file){String s=file.getAbsolutePath().replace('\\\\','/');return s.length()>2&&s.charAt(1)==':'?"/"+Character.toLowerCase(s.charAt(0))+s.substring(2):s;}
 static Result runProcess(ProcessBuilder b,String s,long t,int l,Object listener){
  if(bash==null)return new Result(sync?0:74,"");
  try {
   // Execute the actual production sync command. Only Android path syntax and
   // fsync itself are adapters; shell failure/pipefail propagation stays real.
   java.io.File cwd=b.directory();String script=b.command().get(2);
   script=script.replace(cwd.getPath(),posix(cwd)).replace(cwd.getParentFile().getPath(),posix(cwd.getParentFile()));
   String shim="fsync(){ printf '%s\\\\n' \\\"$1\\\" >> "+quote(posix(syncLog))+"; [ \\\"$1\\\" != "+quote(failSyncPath==null?"":failSyncPath)+" ]; }\\n";
   Process p=new ProcessBuilder(bash,"-c",shim+script).directory(cwd).redirectErrorStream(true).start();
   String output=new String(p.getInputStream().readAllBytes(),java.nio.charset.StandardCharsets.UTF_8);
   return new Result(p.waitFor(),output);
  }catch(Exception failure){throw new RuntimeException(failure);}
 }
}''',encoding='utf-8')
    java=package/'MigrationTest.java'
    java.write_text(r'''package ls.augment.com;
import java.io.*;import java.nio.file.*;import java.security.*;import java.util.*;
class MigrationTest {
 static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static String row(String path,String value)throws Exception{byte[] bytes=value.getBytes("UTF-8");String hash=HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));return "F|"+path+"|0:0:600|old|"+hash+"|"+Base64.getEncoder().encodeToString(bytes)+"\n";}
 static String frame(String s){return "LSA_HIDE_IMPORT1\n"+s+"LSA_HIDE_IMPORT_END\n";}
 static void reject(File root)throws Exception{int before=RootShell.cleaned;try{HideLegacyStorageMigration.migrate(root,true);throw new AssertionError("accepted unsafe migration");}catch(IOException expected){}check(RootShell.cleaned==before,"cleanup before validated private save");}
 public static void main(String[] args)throws Exception{
  File base=new File(args[0]);base.mkdirs();
  RootShell.snapshot=frame(row("manual-targets-v1/document","original"));File target=new File(base,"success");
  HideLegacyStorageMigration.migrate(target,true);check(Files.readString(new File(target,"v2/manual-targets-v1/document").toPath()).equals("original"),"private content");check(RootShell.cleaned==1,"cleanup after save");
  RootShell.snapshot="Root no longer authorized";
  HideLegacyStorageMigration.migrate(target,true);check(RootShell.cleaned==1,"durable receipt must allow private reads without root");
  File receipt=new File(target,".migration-complete-v1");check(receipt.isFile(),"durable completion receipt");
  Files.writeString(receipt.toPath(),"invalid");reject(target);Files.delete(receipt.toPath());
  RootShell.snapshot=frame(row("manual-targets-v1/document","changed"));reject(target);
  RootShell.snapshot=frame(row("../../outside","bad"));reject(new File(base,"traversal"));
  RootShell.snapshot=frame(row("unrelated/file","bad"));reject(new File(base,"unrelated"));
  RootShell.snapshot="LSA_HIDE_IMPORT1\n";reject(new File(base,"partial"));
  RootShell.snapshot=frame(row("manual-targets-v1/document","value"));RootShell.sync=false;reject(new File(base,"syncfail"));RootShell.sync=true;
  RootShell.clean=false;File retry=new File(base,"retry");try{HideLegacyStorageMigration.migrate(retry,true);throw new AssertionError("cleanup failure accepted");}catch(IOException expected){}check(Files.readString(new File(retry,"v2/manual-targets-v1/document").toPath()).equals("value"),"private recovery survived cleanup failure");
  RootShell.clean=true;HideLegacyStorageMigration.migrate(retry,true);
  RootShell.snapshot="invalid";int count=RootShell.cleaned;HideLegacyStorageMigration.migrate(new File(base,"secondary"),false);check(RootShell.cleaned==count,"secondary user claimed global evidence");
  RootShell.bash=args[1];RootShell.syncLog=new File(base,"sync-real.log");
  RootShell.snapshot=frame("D|recovery-history-v1|0:0:700|old\n"+row("recovery-history-v1/selection/record","real shell bytes"));
  File middle=new File(base,"real-middle-fsync-failure");
  RootShell.failSyncPath=RootShell.posix(new File(middle,"v2/recovery-history-v1"));
  reject(middle);check(!new File(middle,".migration-complete-v1").exists(),"no receipt after failed intermediate directory fsync");
  check(Files.readString(RootShell.syncLog.toPath()).contains("/recovery-history-v1/selection\n"),"depth-first child sync executed before injected intermediate failure");
  check(!Files.readString(RootShell.syncLog.toPath()).contains(RootShell.posix(middle)+"\n"),"sync stopped before root after intermediate failure");
  Files.delete(RootShell.syncLog.toPath());
  File parentFailure=new File(base,"real-parent-fsync-failure");RootShell.failSyncPath=RootShell.posix(base);
  reject(parentFailure);check(!new File(parentFailure,".migration-complete-v1").exists(),"no receipt after failed parent directory fsync");
  check(Files.readString(RootShell.syncLog.toPath()).endsWith(RootShell.posix(base)+"\n"),"first creation parent durability attempted before cleanup");
  Files.delete(RootShell.syncLog.toPath());
  File durable=new File(base,"real-sync-success");RootShell.failSyncPath=null;int beforeSuccess=RootShell.cleaned;
  HideLegacyStorageMigration.migrate(durable,true);check(RootShell.cleaned==beforeSuccess+1,"cleanup follows real successful directory sync");
  check(new File(durable,".migration-complete-v1").isFile(),"receipt after real successful directory sync");
  String log=Files.readString(RootShell.syncLog.toPath());check(log.contains(RootShell.posix(base)+"\n"),"successful import sync includes creation parent");
  Files.delete(RootShell.syncLog.toPath());
  File secondaryFailure=new File(base,"real-secondary-parent-failure");RootShell.failSyncPath=RootShell.posix(base);int beforeSecondary=RootShell.cleaned;
  for(int attempt=0;attempt<2;attempt++){
   try{HideLegacyStorageMigration.migrate(secondaryFailure,false);throw new AssertionError("secondary parent durability failure accepted");}catch(IOException expected){}
  }
  check(RootShell.cleaned==beforeSecondary,"secondary receipt never accesses legacy cleanup");
  check(Files.readString(RootShell.syncLog.toPath()).split(java.util.regex.Pattern.quote(RootShell.posix(base)+"\n"),-1).length==3,"secondary completion and receipt retry both sync creation parent");
  RootShell.failSyncPath=null;HideLegacyStorageMigration.migrate(secondaryFailure,false);
  check(new File(secondaryFailure,".migration-complete-v1").isFile(),"secondary receipt accepted after parent sync recovery");
  System.out.println("PASS private migration Java: "+checks+" checks");
 }
}''',encoding='utf-8')
    modeled=package/'HideLegacyStorageMigration.java'
    production=(SRC/'HideLegacyStorageMigration.java').read_text(encoding='utf-8')
    # NTFS cannot model Android owner-only chmod. Keep the complete import/parser/atomic-save code.
    modeled_source,count=re.subn(r'if \(!file\.setReadable\(false, false\).*?throw new IOException\("private (?:directory|file) permissions failed"\);', '// Android chmod requires device verification; NTFS adapter.', production, flags=re.S)
    check(count==2,'bounded NTFS permission adapter')
    modeled.write_text(modeled_source,encoding='utf-8')
    subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','-d',str(folder/'model'),str(stub),str(modeled),str(java)],check=True)
    subprocess.run([str(JDK/'java.exe'),'-cp',str(folder/'model'),'ls.augment.com.MigrationTest',str(folder/'private'),BASH],check=True)

print(f'PASS private migration production shell: {checks} checks; root identity/directory fsync modeled, Android verification separate')
