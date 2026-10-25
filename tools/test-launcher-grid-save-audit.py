"""Exercise actual AppConfig commit/rejection audit with durable preference faults."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
helper = ROOT / 'tools/test-app-config-async.py'
scope = {'__file__': str(helper)}
exec(compile(helper.read_text(encoding='utf-8').split(
    "with tempfile.TemporaryDirectory(prefix='ls-app-config-async-')", 1)[0], str(helper), 'exec'), scope)
sources = dict(scope['sources'])
sources.pop('ls/augment/com/TestAppConfigAsync.java')
schema = sources['ls/augment/com/ConfigSchema.java']
schema = schema.replace('values.put("flag","0");', '''values.put("flag","0");
values.put("ls_augment_rm_launcher_grid_enabled","0");
values.put("ls_augment_rm_launcher_grid_rows","6");
values.put("ls_augment_rm_launcher_grid_columns","5");''')
schema = schema.replace('return defaults().containsKey(key)?value:null;', '''
if(key.startsWith("ls_augment_rm_launcher_grid_")&&!value.matches("[0-9]{1,2}|true|false"))return null;
return defaults().containsKey(key)?value:null;''')
sources['ls/augment/com/ConfigSchema.java'] = schema
sources['ls/augment/com/AuditLog.java'] = '''package ls.augment.com;import java.util.*;
final class AuditLog {static final List<String> events=new ArrayList<>();
static void write(android.content.Context c,String event,String value){events.add(event+":"+value);} }
'''
sources['ls/augment/com/TestGridSaveAudit.java'] = r'''package ls.augment.com;
import java.util.*;import java.util.concurrent.*;import android.content.*;
public class TestGridSaveAudit {
 static int checks;
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static String last(String phase){return AuditLog.events.stream().filter(e->e.contains("phase="+phase+";")).reduce((a,b)->b).orElseThrow();}
 public static void main(String[] args)throws Exception{
  FakeContext context=new FakeContext();AppConfig config=new AppConfig(context);
  String enabled="ls_augment_rm_launcher_grid_enabled",rows="ls_augment_rm_launcher_grid_rows",cols="ls_augment_rm_launcher_grid_columns";
  check(config.save(Map.of(enabled,"1",rows,"8",cols,"7")).success,"enable/save succeeds");
  String committed=last("SAVE_COMMITTED");
  check(committed.contains("enabled=1;rows=8;columns=7"),"full effective saved values recorded");
  check(committed.contains("revision="+config.configSnapshot().revision),"committed exact revision");
  check(committed.contains("frameworkSync=PENDING;desktopApplied=UNCONFIRMED"),"save does not claim launcher application");
  check(committed.contains("version=host-test"),"version attribution");
  long previous=config.configSnapshot().revision;
  context.prefs(AppConfig.PREFS).failNext=1;
  check(!config.save(Map.of(enabled,"0",rows,"4",cols,"3")).success,"disk failure rejected");
  check(config.configSnapshot().revision==previous&&config.getBoolean(enabled),"failed commit preserves enabled generation");
  check(last("SAVE_REJECTED").contains("enabled=1;rows=8;columns=7"),"rejection records actual retained values");
  check(last("SAVE_REQUEST").contains("enabled=0;rows=4;columns=3"),"failed attempted values retained separately");
  check(!config.save(Map.of(rows,"private command\n$(secret)")).success,"invalid input rejected");
  check(last("SAVE_REQUEST").contains("rows=INVALID"),"invalid raw input represented safely");
  check(AuditLog.events.stream().noneMatch(e->e.contains("private command")||e.contains("$(secret)")),"no raw invalid payload in audit");
  check(config.save(Map.of(enabled,"0")).success,"disable succeeds");
  check(last("SAVE_COMMITTED").contains("enabled=0;rows=8;columns=7"),"disable retains configured dimensions");
  int gridEvents=(int)AuditLog.events.stream().filter(e->e.startsWith("LAUNCHER_GRID_CONFIG:")).count();
  check(config.save(Map.of("flag","1")).success,"unrelated save");
  check(AuditLog.events.stream().filter(e->e.startsWith("LAUNCHER_GRID_CONFIG:")).count()==gridEvents,"unrelated saves do not create grid audit noise");
  System.out.println("Actual grid save audit: "+checks+" assertions passed; durable enable/disable, rejected disk writes, generation attribution and safe payloads");
 }
''' + scope['fault_classes'] + '\n}\n'

java_home = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
javac = str(java_home / 'bin/javac.exe') if os.name == 'nt' else 'javac'
java = str(java_home / 'bin/java.exe') if os.name == 'nt' else 'java'
with tempfile.TemporaryDirectory(prefix='lsa-grid-save-audit-') as folder:
    files = []
    for name, code in sources.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(code, encoding='utf-8')
        files.append(path)
    files += [SRC / name for name in ('AppConfig.java', 'FrameworkConfigSync.java', 'DurablePreferences.java',
        'RuntimeStateStore.java', 'RemoteConfig.java', 'ResetWriteFence.java')]
    subprocess.run([javac, '--release', '17', '-encoding', 'UTF-8', '-d', folder, *map(str, files)], check=True)
    subprocess.run([java, '-cp', folder, 'ls.augment.com.TestGridSaveAudit'], check=True, timeout=15)
