"""Production archive/parser plus real Linux source/cleanup failure tests; never uses a phone."""
from pathlib import Path
import argparse, base64, hashlib, json, os, subprocess, sys, tempfile, time

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'android/app/src/main/java/ls/augment/com'
NAMES=['runtime/companion_install.state','runtime/summary.state','runtime/state.tsv','app_metadata.tsv','targets.backup.conf','targets.conf','tile.conf']
VALUES=[b'OK|installed|version=1|versionCode=1|path=package:/data/app/retired/base.apk\n',b'mixed|2|1|1|0|0\n',b'0|example.one|hidden\n0|example.two|visible\n',b'0|example.one|VGVzdA==|0\n',b'0:example.one\n',b'0:example.one\n',b'label=Old\ndescription=Archive\n']
checks=0
def check(value,reason):
    global checks
    checks+=1
    if not value:raise AssertionError(reason)

def shell_tests(commands):
    with tempfile.TemporaryDirectory(prefix='legacy-root-linux-') as tmp:
        base=Path(tmp)
        def fixture(name):
            case=base/name;root=case/'data/adb/ls_augment'
            (root/'runtime').mkdir(parents=True);(root/'v2').mkdir()
            for path in (root,root/'runtime',root/'v2'):path.chmod(0o700)
            for name,value in zip(NAMES,VALUES):
                path=root/name;path.write_bytes(value);path.chmod(0o666 if name==NAMES[0] else 0o600)
            return case,root
        def run(mode,case,stdin='',extra=''):
            script=commands[mode].replace('/data/adb',str(case/'data/adb')).replace('for dir in /data ',f'for dir in {case}/data ')
            adapters='''
id(){ echo 0; }
stat(){
 if [ "$1" = -c ] && [ "$2" = '%u:%g:%a' ]; then command stat -c '0:0:%a' "$3";
 elif [ "$1" = -c ] && [ "$2" = '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' ]; then command stat -c '%d:%i:0:0:%a:%h:%s:%Y:%Z' "$3";
 else command stat "$@"; fi
}
fsync(){ [ "${sync_fail:-0}" != 1 ]; }
ps(){ printf 'PID UID ARGS\\n'; }
pm(){ [ "$*" != 'list users' ] || printf 'Users:\\n UserInfo{0:fixture:0} running\\n'; return 0; }
'''
            return subprocess.run(['bash','-c',adapters+'\n'+extra+'\n'+script],input=stdin,text=True,capture_output=True,timeout=20)
        def manifest(raw):
            rows=raw.splitlines();check(rows[0]=='LSA_LEGACY_ROOT1' and rows[-1]=='LSA_LEGACY_ROOT_END','export complete framing')
            out=[rows[0]]
            for line in rows[1:-1]:
                fields=line.split('|')
                if fields[0]=='F':
                    data=base64.b64decode(fields[4]);check(hashlib.sha256(data).hexdigest()==fields[3],'export exact byte hash');line='|'.join(fields[:4])
                out.append(line)
            return '\n'.join(out+[rows[-1]])+'\n'
        case,root=fixture('success');export=run('export',case);check(export.returncode==0,export.stderr)
        saved=manifest(export.stdout);result=run('cleanup',case,saved)
        check(result.returncode==0 and result.stdout.strip()=='LSA_LEGACY_ROOT_CLEAN',result.stderr)
        check(not root.exists(),'only known empty roots removed')
        result=run('export',case);check(result.returncode==0 and result.stdout.count('A|')==7,'absent root exports all absent entries')
        for mode in ['changed','hash_race','added','hardlink','symlink','owner','wide_mode','installed','companion','secondary_companion','companion_error','service','hidden_service','lock','process','incomplete','duplicate']:
            case,root=fixture(mode);export=run('export',case);check(export.returncode==0,'initial '+mode);saved=manifest(export.stdout);extra=''
            if mode=='changed':(root/'targets.conf').write_bytes(b'0:example.changed\n')
            if mode=='hash_race':extra='sha256sum(){ command sha256sum "$@"; [ "$1" != "'+str(root/'runtime/companion_install.state')+'" ] || printf changed_after_hash >> "$1"; }'
            if mode=='added':
                # The archive said absent; a later source creation must not be removed.
                saved='\n'.join('A|targets.conf' if line.startswith('F|targets.conf|') else line for line in saved.splitlines())+'\n'
            if mode=='hardlink':os.link(root/'targets.conf',root/'hardlink')
            if mode=='symlink':(root/'targets.conf').unlink();(root/'targets.conf').symlink_to(root/'targets.backup.conf')
            if mode=='owner':extra='stat(){ if [ "$1" = -c ] && [ "$2" = "%u:%g:%a" ]; then echo 1:1:700; else command stat "$@"; fi; }'
            if mode=='wide_mode':(root/'targets.conf').chmod(0o666)
            if mode=='installed':(case/'data/adb/modules/ls_augment').mkdir(parents=True)
            if mode=='companion':extra="pm(){ if [ \"$*\" = 'list users' ]; then echo 'UserInfo{0:fixture:0}'; else echo package:io.github.lsf.augment; fi; }"
            if mode=='secondary_companion':extra="pm(){ if [ \"$*\" = 'list users' ]; then printf 'UserInfo{0:fixture:0}\\nUserInfo{10:fixture:0}\\n'; elif [ \"$4\" = 10 ]; then echo package:io.github.lsf.augment; fi; }"
            if mode=='companion_error':extra="pm(){ return 1; }"
            if mode in ('service','hidden_service'):
                service=case/('data/adb/service.d/'+('..old.sh' if mode=='hidden_service' else 'old.sh'));service.parent.mkdir(parents=True);service.write_text('sh '+str(root)+'/writer.sh\n')
            if mode=='lock':(root/'runtime/core.lock').mkdir()
            if mode=='process':extra="ps(){ printf 'PID UID ARGS\\n999999 0 /data/adb/modules/ls_augment/service.sh\\n'; }".replace('/data/adb',str(case/'data/adb'))
            if mode=='incomplete':saved='LSA_LEGACY_ROOT1\nLSA_LEGACY_ROOT_END\n'
            if mode=='duplicate':saved=saved.replace('F|targets.conf|','F|targets.backup.conf|')
            result=run('cleanup',case,saved,extra)
            check(result.returncode!=0,'unsafe cleanup accepted '+mode)
            check(all((root/name).exists() or (root/name).is_symlink() for name in NAMES),'deleted a source on rejection '+mode)
        case,root=fixture('unknown');(root/'unknown.dat').write_bytes(b'untouched');(root/'runtime/unknown.state').write_bytes(b'untouched')
        saved=manifest(run('export',case).stdout);result=run('cleanup',case,saved)
        check(result.returncode==0,result.stderr);check((root/'unknown.dat').read_bytes()==b'untouched' and (root/'runtime/unknown.state').exists(),'unknown siblings retained')
        case,root=fixture('syncfail');saved=manifest(run('export',case).stdout);result=run('cleanup',case,saved,'sync_fail=1')
        check(result.returncode!=0 and 'LSA_LEGACY_ROOT_CLEAN' not in result.stdout,'cleanup fsync failure cannot ACK')
        check((root/'targets.conf').exists(),'fsync failure stops further deletions')
        case,root=fixture('oversized');(root/'targets.conf').write_bytes(b'x'*(1048576+1));check(run('export',case).returncode!=0,'oversized source rejected')
        case,root=fixture('666parent');root.chmod(0o750);check(run('export',case).returncode!=0,'historical 666 requires root ancestor700')
        case,root=fixture('openfd')
        reader=subprocess.Popen(['bash','-c','exec 8<"$1"; exec sleep 30','reader',str(root/'targets.conf')])
        try:
            time.sleep(.05)
            extra=f"ps(){{ printf 'PID UID ARGS\\n{reader.pid} 0 sleep 30\\n'; }}"
            result=run('export',case,extra=extra)
            check(result.returncode!=0 and 'legacy_file_open' in result.stderr,'real existing open FD blocks retirement')
        finally:reader.terminate();reader.wait()
    print(f'PASS legacy root production Linux shell: {checks} checks (root UID/process inventory/fsync modeled; paths, hashes, links, open FD and deletions real)')

parser=argparse.ArgumentParser(description=__doc__)
mode=parser.add_mutually_exclusive_group()
mode.add_argument('--shell-only',type=Path,metavar='COMMANDS_JSON',help='Run Linux shell fixtures with previously compiled commands')
mode.add_argument('--java-only',action='store_true',help='Run only the local Java migration regression')
mode.add_argument('--validate-export',type=Path,metavar='SNAPSHOT',help='Validate an explicitly supplied private export locally')
mode.add_argument('--export-script',type=Path,metavar='DESTINATION',help='Write only the production read-only export script; never contact a device')
args=parser.parse_args()
if args.shell_only:
    shell_tests(json.loads(args.shell_only.read_text()));raise SystemExit()

JDK=Path(os.environ.get('JAVA_HOME',r'C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
JAVA='java.exe' if os.name=='nt' else 'java';JAVAC='javac.exe' if os.name=='nt' else 'javac'
STUBS={
'android/content/Context.java':'package android.content;public class Context {public java.io.File getFilesDir(){return null;}}',
'android/os/Process.java':'package android.os;public class Process {public static int myUid(){return 12345;}}',
'android/system/StructStat.java':'package android.system;public class StructStat {public int st_uid,st_mode;public long st_nlink,st_size;}',
'android/system/OsConstants.java':'package android.system;public class OsConstants {public static boolean S_ISDIR(int m){return m==1;}public static boolean S_ISREG(int m){return m==2;}}',
'android/system/Os.java':'''package android.system;import java.nio.file.*;public class Os {
 public static String wrongOwner,hardlink;public static StructStat lstat(String p)throws Exception {var v=new StructStat();Path path=Path.of(p);if(!Files.exists(path,LinkOption.NOFOLLOW_LINKS))throw new java.io.IOException("missing");v.st_uid=p.equals(wrongOwner)?99:12345;v.st_mode=Files.isDirectory(path,LinkOption.NOFOLLOW_LINKS)?1:Files.isRegularFile(path,LinkOption.NOFOLLOW_LINKS)?2:3;v.st_nlink=p.equals(hardlink)?2:1;v.st_size=Files.size(path);return v;}public static void chmod(String p,int m){} }''',
'ls/augment/com/RootShell.java':r'''package ls.augment.com;class RootShell {
 static String snapshot,cleanupInput;static int exports,cleanups,syncs;static boolean reliable=true,clean=true,sync=true;
 static class CapturedOutput {final String text;CapturedOutput(String t){text=t;}boolean reliable(){return RootShell.reliable;}String text(){return text;}}
 static class Result {int exitCode;String output;CapturedOutput capture;Result(int code,String s,boolean timed){exitCode=code;output=s.trim();capture=new CapturedOutput(s);}boolean isSuccess(){return exitCode==0;}}
 static String quote(String s){return "'"+s.replace("'","'\"'\"'")+"'";}
 static Result run(String cmd,String stdin,long timeout,int limit){if(cmd.contains("echo LSA_LEGACY_ROOT_END")){exports++;return new Result(0,snapshot,false);}cleanups++;cleanupInput=stdin;return new Result(clean?0:74,"LSA_LEGACY_ROOT_CLEAN\n",false);}
 static Result runProcess(ProcessBuilder b,String s,long t,int l,Object observer){if(b.directory()==null)throw new AssertionError("private cwd missing");if(!b.command().get(2).contains("fsync"))throw new AssertionError("no fsync");syncs++;return new Result(sync?0:74,"",false);}
}''',
'ls/augment/com/Probe.java':'''package ls.augment.com;public class Probe {public static void main(String[] a)throws Exception {
 if(a[0].equals("validate")){RootShell.snapshot=java.nio.file.Files.readString(java.nio.file.Path.of(a[1])).replace("\\r\\n","\\n");LegacyRootStorageMigration.migrate(new java.io.File(a[2]),true);System.out.println("PASS private captured export validates and archives byte-for-byte locally; adb PTY framing normalized; no phone write");return;}
 System.out.print(a[0].equals("export")?LegacyRootStorageMigration.exportCommand():LegacyRootStorageMigration.cleanupCommand());}}''',
'ls/augment/com/MigrationTest.java':r'''package ls.augment.com;
import java.io.*;import java.nio.file.*;import java.security.*;import java.util.*;
class MigrationTest {
 static int checks;static final String[] N={"runtime/companion_install.state","runtime/summary.state","runtime/state.tsv","app_metadata.tsv","targets.backup.conf","targets.conf","tile.conf"};
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static String hash(byte[] b)throws Exception{return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(b));}
 static String frame(String path,String text)throws Exception {StringBuilder out=new StringBuilder("LSA_LEGACY_ROOT1\n");for(String name:N){if(name.equals(path)){byte[] bytes=text.getBytes("UTF-8");out.append("F|").append(name).append("|1:2:0:0:600:1:").append(bytes.length).append(":3:4|").append(hash(bytes)).append('|').append(Base64.getEncoder().encodeToString(bytes));}else out.append("A|").append(name);out.append('\n');}return out.append("LSA_LEGACY_ROOT_END\n").toString();}
 static void reject(File base)throws Exception {int before=RootShell.cleanups;try{LegacyRootStorageMigration.migrate(base,true);throw new AssertionError("unsafe migration accepted");}catch(Exception expected){if(expected instanceof RuntimeException)throw expected;}check(RootShell.cleanups==before,"cleanup occurred before complete private validation");}
 static void resetReject(File base)throws Exception {int before=RootShell.exports;try{LegacyRootStorageMigration.requireResetSafe(base);throw new AssertionError("unsafe reset accepted");}catch(IOException expected){check(true,"unsafe archive blocks reset");}check(before==RootShell.exports,"reset guard does not touch external source");}
 public static void main(String[] args)throws Exception {
  File root=new File(args[0]);root.mkdirs();RootShell.snapshot=frame("targets.conf","# original\n0:example.one\n");
  File good=new File(root,"good");LegacyRootStorageMigration.migrate(good,true);
  check(Files.readString(new File(good,"original/targets.conf").toPath()).equals("# original\n0:example.one\n"),"raw target bytes preserved");
  check(new File(good,"manifest-v1").isFile()&&new File(good,".complete-v1").isFile(),"receipt only after cleanup");
  LegacyRootStorageMigration.requireResetSafe(new File(root,"absent"));LegacyRootStorageMigration.requireResetSafe(good);check(true,"absent and confirmed complete archives permit explicit reset");
  int exports=RootShell.exports;RootShell.snapshot="not available";LegacyRootStorageMigration.migrate(good,true);check(RootShell.exports==exports,"completed archive reads require no root");
  android.system.Os.hardlink=new File(good,"manifest-v1").getPath();reject(good);resetReject(good);android.system.Os.hardlink=null;
  android.system.Os.wrongOwner=new File(good,"manifest-v1").getPath();reject(good);resetReject(good);android.system.Os.wrongOwner=null;
  Files.writeString(new File(good,"original/targets.conf").toPath(),"0:example.corrupt\n");reject(good);resetReject(good);
  RootShell.snapshot=frame("targets.conf","0:example.one\n");RootShell.sync=false;File failSync=new File(root,"sync-failed");reject(failSync);check(!new File(failSync,".complete-v1").exists(),"no receipt on private sync failure");RootShell.sync=true;
  try{LegacyRootStorageMigration.requireResetSafe(failSync);throw new AssertionError("reset accepted partial archive");}catch(IOException expected){check(true,"reset refuses incomplete archive before storage clear");}
  RootShell.clean=false;File partial=new File(root,"partial");try{LegacyRootStorageMigration.migrate(partial,true);throw new AssertionError();}catch(IOException expected){}check(new File(partial,"original/targets.conf").isFile()&&!new File(partial,".complete-v1").exists(),"cleanup refusal preserves private archive and allows retry");
  RootShell.clean=true;RootShell.snapshot=frame("","");LegacyRootStorageMigration.migrate(partial,true);check(new File(partial,".complete-v1").isFile(),"partial source deletion retry retains original manifest");
  File conflict=new File(root,"conflict");RootShell.clean=false;RootShell.snapshot=frame("targets.conf","0:example.one\n");try{LegacyRootStorageMigration.migrate(conflict,true);}catch(IOException expected){}RootShell.clean=true;RootShell.snapshot=frame("targets.conf","0:example.two\n");reject(conflict);
  RootShell.snapshot=frame("targets.conf","UNKNOWN\n");reject(new File(root,"unknown-content"));
  RootShell.snapshot=frame("targets.conf","0:example.one\n").replace("F|targets.conf|","F|../outside|");reject(new File(root,"traversal"));
  RootShell.snapshot="LSA_LEGACY_ROOT1\n";reject(new File(root,"truncated"));
  RootShell.snapshot=frame("targets.conf","0:example.one\n");RootShell.reliable=false;reject(new File(root,"unreliable"));RootShell.reliable=true;
  int before=RootShell.exports;File secondary=new File(root,"secondary");LegacyRootStorageMigration.migrate(secondary,false);check(RootShell.exports==before&&!secondary.exists(),"secondary user does not claim global source");
  String[][] accepted={{"runtime/companion_install.state","OK|installed|version=1\n"},{"runtime/summary.state","mixed|2|1|1|0|0\n"},{"runtime/state.tsv","0|example.one|hidden\n"},{"app_metadata.tsv","0|example.one|VGVzdA==|0\n"},{"tile.conf","label=旧标题\ndescription=旧说明\n"}};
  for(String[] row:accepted){LegacyRootStorageMigration.validateContent(row[0],row[1].getBytes("UTF-8"));check(true,"historical shape accepted");}
  for(String[] row:new String[][]{{"tile.conf","label=a\nlabel=b\n"},{"runtime/state.tsv","0|example.one|RUN\n"},{"app_metadata.tsv","0|example.one|***|0\n"},{"runtime/summary.state","unknown|0|0|0|0|0\n"}}){try{LegacyRootStorageMigration.validateContent(row[0],row[1].getBytes("UTF-8"));throw new AssertionError("unknown shape accepted");}catch(IOException expected){check(true,"unknown content retained");}}
  System.out.println("PASS legacy root production Java: "+checks+" checks (Android UID/chmod and root transport modeled)");
 }
}'''}

with tempfile.TemporaryDirectory(prefix='legacy-root-java-') as temp:
    folder=Path(temp);paths=[]
    for name,value in STUBS.items():
        path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value,encoding='utf-8');paths.append(str(path))
    classes=folder/'classes'
    subprocess.run([str(JDK/JAVAC),'-encoding','UTF-8','-d',str(classes),*paths,str(SOURCE/'LegacyRootStorageMigration.java')],check=True)
    if args.export_script:
        exported=subprocess.check_output([str(JDK/JAVA),'-cp',str(classes),'ls.augment.com.Probe','export']).decode()
        args.export_script.parent.mkdir(parents=True,exist_ok=True)
        args.export_script.write_text(exported,encoding='utf-8',newline='\n')
        print('Generated read-only export script; no device commands executed')
        raise SystemExit()
    if args.validate_export:
        snapshot=args.validate_export.resolve()
        subprocess.run([str(JDK/JAVA),'-cp',str(classes),'ls.augment.com.Probe','validate',str(snapshot),str(folder/'captured-private')],check=True)
        raise SystemExit()
    subprocess.run([str(JDK/JAVA),'-cp',str(classes),'ls.augment.com.MigrationTest',str(folder/'private')],check=True)
    if args.java_only:raise SystemExit()
    commands={mode:subprocess.check_output([str(JDK/JAVA),'-cp',str(classes),'ls.augment.com.Probe',mode]).decode() for mode in ('export','cleanup')}
    command_file=folder/'commands.json';command_file.write_text(json.dumps(commands),encoding='utf-8')
    if os.name=='nt':
        def wsl(path):
            path=Path(path).resolve();return '/mnt/'+path.drive[0].lower()+path.as_posix()[2:]
        distro=os.environ.get('LSA_TEST_WSL_DISTRO','Ubuntu-26.04')
        subprocess.run(['wsl.exe','-d',distro,'--exec','python3',wsl(__file__),'--shell-only',wsl(command_file)],check=True)
    else:shell_tests(commands)
