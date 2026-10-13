"""Actual launcher reset controller/parser/script in isolated host fixture sandboxes.

Android package/user/UID and the owning-process ACK are doubles. XML parsing,
SHA transport and read-only shell validation execute production code. Only the
owning-process double clears its exact module page files in a host sandbox.
No ADB or personal launcher/module configuration is accessed.
"""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import json
import os
import subprocess
import tempfile
import sys

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
OUTPUT = ROOT / 'audit-output/launcher-reset-fixture'
OUTPUT.mkdir(parents=True, exist_ok=True)
JDK = Path(r'C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
BASH = Path(r'C:/Program Files/Git/bin/bash.exe')
assert BASH.is_file(), 'Fixture currently requires the existing Git Bash runtime'
sources = {
 'ls/augment/com/LauncherOwnedStateStore.java':'package ls.augment.com;final class LauncherOwnedStateStore {static boolean pendingGrid(android.content.Context c){return false;}static boolean pagesHistory(android.content.Context c){return false;}}',
 'android/content/Context.java': '''package android.content;public class Context{
 public Context getApplicationContext(){return this;}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public android.content.res.AssetManager getAssets(){return new android.content.res.AssetManager();}}
''',
 'android/content/pm/ApplicationInfo.java': '''package android.content.pm;public class ApplicationInfo{
 public String packageName="com.zte.mifavor.launcher",dataDir=ls.augment.com.TestLauncherResetRecords.mode.startsWith("de-")||ls.augment.com.TestLauncherResetRecords.mode.equals("dual-storage")?"/data/user_de/0/com.zte.mifavor.launcher":"/data/user/0/com.zte.mifavor.launcher";public int uid=10177;}
''',
 'android/content/pm/PackageManager.java': '''package android.content.pm;public class PackageManager{
 public ApplicationInfo getApplicationInfo(String name,int flags)throws NameNotFoundException{return new ApplicationInfo();}
 public static class NameNotFoundException extends Exception{}}
''',
 'android/content/res/AssetManager.java': '''package android.content.res;public class AssetManager{
 public java.io.InputStream open(String name)throws java.io.IOException{
 if(!name.equals("launcher_reset_records.sh"))throw new java.io.IOException("fixture asset");
 return java.nio.file.Files.newInputStream(ls.augment.com.TestLauncherResetRecords.asset);}}
''',
 'android/os/Process.java': 'package android.os;public class Process{public static int myUid(){return 10055;}}',
 'ls/augment/com/HideUserIdentity.java': '''package ls.augment.com;public class HideUserIdentity{
 public static Snapshot read(android.content.Context c,int user){return new Snapshot(true,0);}
 public static Snapshot match(android.content.Context c,int user,long serial){return new Snapshot(!TestLauncherResetRecords.mode.equals("identity-changed"),0);}
 public static class Snapshot{public final boolean success;public final long userSerial;Snapshot(boolean ok,long serial){success=ok;userSerial=serial;}}}
''',
 'ls/augment/com/LauncherResetRuntime.java': r'''package ls.augment.com;
import java.io.IOException;import java.nio.file.*;
final class LauncherResetRuntime{
 static int begins,ends;
 static LauncherResetPolicy.Session begin(android.content.Context c,int uid,int user,long serial)throws IOException{
  begins++;return new LauncherResetPolicy.Session(new LauncherResetPolicy.Request(
   "12345678-1234-1234-1234-123456789abc",user,serial,uid,20415,1,"a".repeat(64),0,20000,1));
 }
 static LauncherResetPolicy.Receipt await(LauncherResetPolicy.Session session)throws IOException{
  String mode=TestLauncherResetRecords.mode;Path root=TestLauncherResetRecords.root;
  if(mode.equals("ack-timeout"))throw new IOException("fixture owning-process ACK timeout");
  if(mode.equals("ack-failure"))return new LauncherResetPolicy.Receipt(false,"commit_failed",42);
  if(!mode.equals("ack-pages-remain"))for(String store:new String[]{"launcher","launcher-de"}){
   Path prefs=root.resolve(store+"/shared_prefs");
   for(String name:new String[]{"ls_augment_launcher_pages.xml","ls_augment_launcher_pages.xml.bak"}){
    Path file=prefs.resolve(name);if(Files.isRegularFile(file))Files.writeString(file,"<map/>");
   }
  }
  if(mode.equals("changed-grid-after-read"))Files.writeString(root.resolve("launcher/shared_prefs/ls_augment_launcher_grid_state.xml.bak"),"\n ",StandardOpenOption.APPEND);
  return new LauncherResetPolicy.Receipt(true,"pages_empty",42);
 }
 static void end(android.content.Context c,LauncherResetPolicy.Session session){ends++;}
}
''',
 'ls/augment/com/RootShell.java': r'''package ls.augment.com;
import java.nio.file.*;import java.nio.charset.StandardCharsets;import java.util.*;import java.util.concurrent.TimeUnit;
final class RootShell {
 static int calls;
 static String quote(String value){return "'"+value.replace("'","'\"'\"'")+"'";}
 static Result run(String command,String input,long timeout,int maximum){
  if(!command.equals("nsenter -t 1 -m -- sh"))throw new AssertionError("cross-app command must enter init namespace");
  if(input.contains("stage=clear")||input.contains("am force-stop")||input.contains("rm -")||input.contains("kill "))
   throw new AssertionError("root launcher transport must remain read-only while owning process is live");
  calls++;String mode=TestLauncherResetRecords.mode;Path root=TestLauncherResetRecords.root;
  boolean de=input.contains("base='/data/user_de/");
  String base=posix(root.resolve(de?"launcher-de":"launcher")),proc=posix(root.resolve("proc"));
  String body=input.replace("'/data/user/0/com.zte.mifavor.launcher'",quote(posix(root.resolve("launcher"))))
    .replace("'/data/user_de/0/com.zte.mifavor.launcher'",quote(posix(root.resolve("launcher-de"))))
    .replace("/data/user/$expected_user/com.zte.mifavor.launcher",posix(root.resolve("launcher")))
    .replace("/data/user_de/$expected_user/com.zte.mifavor.launcher",posix(root.resolve("launcher-de")))
    .replace("/data/user/0/com.zte.mifavor.launcher",posix(root.resolve("launcher")))
    .replace("/proc/[0-9]*",proc+"/[0-9]*");
  try{
   String shim="fixture="+quote(base)+"\nfixture_root="+quote(posix(root))+"\nfixture_case="+quote(mode)+"\n"
    +"id(){ printf '0\\n'; }\ncmd(){ printf 'package:com.zte.mifavor.launcher uid:10177\\n'; }\nsleep(){ :; }\n"
    +"stat(){ [ -e \"$3\" ] || return 1; if [ \"$2\" = %s ]; then command stat \"$@\"; return; fi; "
    +"if { [ \"$fixture_case\" = wrong-prefs-owner ] || { [ \"$fixture_case\" = de-wrong-prefs-owner ] && [ \"$fixture\" = \"$fixture_root/launcher-de\" ]; }; } && [ \"$3\" = \"$fixture/shared_prefs\" ]; then printf '10178\\n'; "
    +"elif [ \"$fixture_case\" = wrong-grid-backup-owner ] && [ \"$3\" = \"$fixture/shared_prefs/ls_augment_launcher_grid_state.xml.bak\" ]; then printf '10178\\n'; "
    +"else printf '10177\\n'; fi; }\n"
    +"am(){ printf 'forbidden system mutation\\n' >&2; return 79; }\n"
    +"rm(){ printf 'forbidden cross-process deletion\\n' >&2; return 79; }\n"
    +"kill(){ printf 'forbidden process signal\\n' >&2; return 79; }\n";
   Path script=root.resolve("stage-"+calls+".sh");Files.writeString(script,shim+body);
   ProcessBuilder builder=new ProcessBuilder(TestLauncherResetRecords.bash.toString(),posix(script)).redirectErrorStream(true);
   builder.environment().put("MSYS","winsymlinks");
   java.lang.Process process=builder.start();String output=new String(process.getInputStream().readAllBytes(),StandardCharsets.UTF_8).trim();
   if(!process.waitFor(timeout,TimeUnit.SECONDS))throw new AssertionError("fixture command timed out");
   if(input.contains("stage=read")&&mode.equals("truncated-frame"))output=output.replace("LAUNCHER_RESET_RECORDS_END","").trim();
   if(input.contains("stage=read")&&mode.equals("duplicate-role"))output=output.replace("file|pages|","file|grid|");
   if(input.contains("stage=read")&&mode.equals("bad-frame-hash"))output=output.replaceFirst("[0-9a-f]{64}","0".repeat(64));
   return new Result(process.exitValue(),output,false);
  }catch(Exception failure){throw new AssertionError(failure);}
 }
 static String posix(Path path){String value=path.toAbsolutePath().toString().replace('\\','/');return value.charAt(1)==':'?"/"+Character.toLowerCase(value.charAt(0))+value.substring(2):value;}
 static final class Result{final int exitCode;final String output;final boolean timedOut;
  Result(int code,String text,boolean timed){exitCode=code;output=text;timedOut=timed;}
  boolean isSuccess(){return exitCode==0&&!timedOut;}String publicError(){return output.length()>220?output.substring(0,220):output;}}
}
''',
 'ls/augment/com/TestLauncherResetRecords.java': r'''package ls.augment.com;
import java.nio.file.*;import java.util.*;import java.nio.charset.StandardCharsets;
public final class TestLauncherResetRecords{
 public static Path asset,bash,root;public static String mode;
 static final String GRID="ls_augment_launcher_grid_state.xml",PAGES="ls_augment_launcher_pages.xml";
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static void emptyPages(Path prefs)throws Exception{
  for(String name:new String[]{PAGES,PAGES+".bak"}){
   Path file=prefs.resolve(name);if(Files.exists(file))check(!LauncherResetXml.read(Files.readAllBytes(file),false).historyPresent,"module page records survived");
  }
 }
 public static void main(String[] args)throws Exception{
  mode=args[0];root=Path.of(args[1]);asset=Path.of(args[2]);bash=Path.of(args[3]);
  Path prefs=root.resolve("launcher/shared_prefs");
  byte[] grid=Files.exists(prefs.resolve(GRID))?Files.readAllBytes(prefs.resolve(GRID)):null;
  byte[] backup=Files.exists(prefs.resolve(GRID+".bak"))?Files.readAllBytes(prefs.resolve(GRID+".bak")):null;
  byte[] pages=Files.exists(prefs.resolve(PAGES))?Files.readAllBytes(prefs.resolve(PAGES)):null;
  byte[] pagesBackup=Files.exists(prefs.resolve(PAGES+".bak"))?Files.readAllBytes(prefs.resolve(PAGES+".bak")):null;
  boolean expectedSuccess=Set.of("owned", "backup-only", "original-only", "unowned", "empty", "no-prefs", "idempotent", "de-only", "dual-storage", "de-empty", "surviving-process", "stop-failure", "relaunch-after-read", "changed-grid-after-read").contains(mode);
  LauncherResetController.Result result=LauncherResetController.prepare(new android.content.Context());
  check(result.success==expectedSuccess,"unexpected result success="+result.success+" message="+result.message);
  if(expectedSuccess){
   boolean pending=!mode.equals("empty")&&!mode.equals("no-prefs")&&!mode.equals("unowned")&&!mode.equals("de-empty");
   check(result.pendingGridRestore==pending,"grid recovery evidence not detected");
   check(result.pageHistoryPresent==!(mode.equals("empty")||mode.equals("no-prefs")||mode.equals("de-empty")),"page backup history not detected");
   emptyPages(prefs);
   Path dePrefs=root.resolve("launcher-de/shared_prefs");
   emptyPages(dePrefs);
   if(mode.equals("de-only")||mode.equals("dual-storage"))check(Files.readString(dePrefs.resolve(GRID)).contains("original_rows"),"DE grid originals lost");
   if(mode.equals("idempotent")){
    var second=LauncherResetController.prepare(new android.content.Context());
    check(second.success&&second.pendingGridRestore&&!second.pageHistoryPresent,"repeat is not idempotent");
   }
  }else{
   if(pages!=null)check(Arrays.equals(pages,Files.readAllBytes(prefs.resolve(PAGES))),"failure deleted/changed page records");
   if(pagesBackup!=null)check(Arrays.equals(pagesBackup,Files.readAllBytes(prefs.resolve(PAGES+".bak"))),"failure deleted/changed page backup");
  }
  check(LauncherResetRuntime.begins==LauncherResetRuntime.ends,"ephemeral request was not closed");
  if(expectedSuccess)check(LauncherResetRuntime.begins>0,"owning-process ACK was bypassed");
  if(grid!=null)check(Arrays.equals(grid,Files.readAllBytes(prefs.resolve(GRID))),"grid originals changed");
  if(backup!=null&&!mode.equals("changed-grid-after-read"))check(Arrays.equals(backup,Files.readAllBytes(prefs.resolve(GRID+".bak"))),"grid backup changed");
  check(Files.readString(root.resolve("outside/sentinel")).equals("outside original"),"external link target changed");
  check(Files.readString(root.resolve("launcher/databases/launcher.db")).equals("OEM original layout"),"OEM database modified");
  System.out.println("PASS "+mode+" success="+result.success+" pending="+result.pendingGridRestore+" history="+result.pageHistoryPresent+" calls="+RootShell.calls);
 }
}
''',
}
cases = ('owned','backup-only','original-only','unowned','empty','no-prefs','idempotent','corrupt-grid','corrupt-backup',
         'invalid-boolean','duplicate-grid-key','unknown-grid-key','corrupt-pages','dtd','invalid-utf8',
         'wrong-prefs-owner','wrong-grid-backup-owner','grid-backup-link','prefs-link','prefs-file',
         'surviving-process','stop-failure','identity-changed','relaunch-after-read','changed-grid-after-read',
         'truncated-frame','duplicate-role','bad-frame-hash',
         'de-only','dual-storage','de-empty','de-corrupt-grid','de-wrong-prefs-owner','de-primary-missing',
         'ack-failure','ack-timeout','ack-pages-remain')
selected = bool(sys.argv[1:])
if selected:
    assert set(sys.argv[1:]).issubset(cases), "Unknown fixture case"
    cases = tuple(sys.argv[1:])
results = []
jobs = []
with tempfile.TemporaryDirectory(prefix='cases-', dir=OUTPUT) as temporary:
    work = Path(temporary).resolve()
    assert work.is_relative_to(OUTPUT.resolve())
    classes = work / 'classes'
    classes.mkdir()
    files = []
    for name, code in sources.items():
        path = work / 'src' / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(code, encoding='utf-8', newline='\n')
        files.append(path)
    subprocess.run([str(JDK / 'javac.exe'),'--release','17','-encoding','UTF-8','-d',str(classes),
                    *map(str, files), str(SRC/'LauncherResetController.java'), str(SRC/'LauncherResetXml.java'),
                    str(SRC/'LauncherResetPolicy.java')], check=True, timeout=20)
    for case in cases:
        root = work / case
        prefs = root / ('launcher/old-prefs' if case == 'prefs-file' else 'launcher/shared_prefs')
        prefs.mkdir(parents=True)
        (root/'launcher/databases').mkdir()
        (root/'launcher/databases/launcher.db').write_text('OEM original layout', encoding='utf-8')
        (root/'proc').mkdir()
        (root/'outside').mkdir()
        (root/'outside/sentinel').write_text('outside original', encoding='utf-8')
        grid = b"<map><boolean value='true' name='owned'/><int value='6' name='original_rows'/><int name='original_columns' value='4'/></map>"
        backup = b'<map>\n<boolean name="owned" value="false"/><int name="original_rows" value="6"/><int name="original_columns" value="4"/></map>'
        page = b'<map><string name="order">1,2,3</string><boolean name="keep_empty" value="true"/></map>'
        if case == 'backup-only':
            grid=b'<map/>'
        if case == 'original-only':
            grid=backup
        if case == 'unowned':
            grid=b'<map><boolean name="owned" value="false"/></map>'; backup=b'<map/>'
        if case == 'corrupt-grid': grid=b'<map><boolean name="owned" value="true"/>'
        if case == 'corrupt-backup': backup=b'<map><int name="original_rows" value="6">'
        if case == 'invalid-boolean': grid=b'<map><boolean name="owned" value="TRUE"/></map>'
        if case == 'duplicate-grid-key': grid=b'<map><boolean name="owned" value="true"/><boolean name="owned" value="false"/></map>'
        if case == 'unknown-grid-key': grid=b'<map><string name="unknown_old_grid_state">original</string></map>'
        if case == 'corrupt-pages': page=b'<map><string name="order">truncated'
        if case == 'dtd': grid=b'<!DOCTYPE map [<!ENTITY e SYSTEM "file:///outside/private">]><map><string name="owned">&e;</string></map>'
        if case == 'invalid-utf8': grid=b'<map>\xff</map>'
        if case not in ('empty','no-prefs','de-only','de-empty'):
            (prefs/'ls_augment_launcher_grid_state.xml').write_bytes(grid)
            (prefs/'ls_augment_launcher_grid_state.xml.bak').write_bytes(backup)
            if case != 'backup-only': (prefs/'ls_augment_launcher_pages.xml').write_bytes(page)
            (prefs/'ls_augment_launcher_pages.xml.bak').write_bytes(page)
        if case == 'no-prefs': prefs.rmdir()
        if (case.startswith('de-') and case != 'de-primary-missing') or case == 'dual-storage':
            de_prefs = root/'launcher-de/shared_prefs'
            de_prefs.mkdir(parents=True)
            if case != 'de-empty':
                (de_prefs/'ls_augment_launcher_grid_state.xml').write_bytes(b'<map>' if case == 'de-corrupt-grid' else grid)
                (de_prefs/'ls_augment_launcher_grid_state.xml.bak').write_bytes(backup)
                (de_prefs/'ls_augment_launcher_pages.xml').write_bytes(page)
                (de_prefs/'ls_augment_launcher_pages.xml.bak').write_bytes(page)
        if case == 'surviving-process':
            (root/'proc/42').mkdir()
            (root/'proc/42/status').write_text('Uid:\t10177\t10177\t10177\t10177\n',encoding='utf-8')
        if case == 'prefs-file':
            (root/'launcher/shared_prefs').write_text('unexpected plain file',encoding='utf-8')
        if case in ('grid-backup-link','prefs-link'):
            def posix(path):
                value=path.resolve().as_posix();return '/'+value[0].lower()+value[2:]
            def quote(text): return "'"+text.replace("'","'\"'\"'")+"'"
            if case=='grid-backup-link':
                link=prefs/'ls_augment_launcher_grid_state.xml.bak';link.unlink();target=root/'outside/sentinel'
            else:
                prefs.rename(root/'launcher/old-prefs');link=prefs;target=root/'outside'
            setup=root/'links.sh';setup.write_text('set -e\nln -s '+quote(posix(target))+' '+quote(posix(link))+'\n',encoding='utf-8',newline='\n')
            env=dict(os.environ);env['MSYS']='winsymlinks'
            subprocess.run([str(BASH),posix(setup)],check=True,env=env,timeout=10)
        jobs.append((case, root))
    def run_case(job):
        case, root = job
        run = subprocess.run([str(JDK/'java.exe'),'-cp',str(classes),'ls.augment.com.TestLauncherResetRecords',
                              case,str(root),str(ROOT/'android/app/src/main/assets/launcher_reset_records.sh'),str(BASH)],
                             text=True,capture_output=True,timeout=90)
        return {'case':case,'passed':run.returncode==0,'stdout':run.stdout.strip(),'stderr':run.stderr.strip()}
    # Every process has its own root, so fixtures may run concurrently without
    # sharing state. This keeps the Windows shell startup cost bounded.
    with ThreadPoolExecutor(max_workers=4) as executor:
        results = list(executor.map(run_case, jobs))
    for run in results:
        print(run['stdout'])
        if run['stderr']: print(run['stderr'])
report={'success':all(case['passed'] for case in results),
        'scope':'ACTUAL_CONTROLLER_XML_PARSER_READ_ONLY_SCRIPT_OWNING_PROCESS_ACK_DOUBLE_HOST_SANDBOX_NO_ADB',
        'cases':results}
(OUTPUT/('result-selected.json' if selected else 'result.json')).write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
raise SystemExit(0 if report['success'] else 1)
