"""Exercise actual extraction Provider lifecycle/config fences without reading source content."""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-system-root-authority.py')))
JAVA = BASE['JAVA']
MEMBER = BASE['SUPPORT']['member']
SOURCE = JAVA['SRC'] / 'AtomicWorkbenchProvider.java'

HEAD = '''package ls.augment.com;import android.os.*;import android.os.Process;import android.content.*;import java.util.*;
public final class ExtractionProviderHarness {
 static final Context context=new Context();Context getContext(){return context;}
 static int cases,checks;
 static final class ResetWriteFence {static long epoch=7;static boolean blocked;static long generation(){return epoch;}static boolean active(){return blocked;}}
 static final class ConfigSnapshot {long revision;String checksum;ConfigSnapshot(long r,String c){revision=r;checksum=c;}}
 static final class AppConfig {static ConfigSnapshot snapshot;static Runnable during;static int reads;AppConfig(Context context){check(!Thread.holdsLock(ExtractionProviderHarness.class),"configuration read under Provider monitor");}
  ConfigSnapshot configSnapshot(){reads++;check(Binder.getCallingUid()==Process.myUid(),"caller identity reached local preferences");if(during!=null){Runnable action=during;during=null;action.run();}return snapshot;}}
 static final class AtomicWorkbenchExtractionSystemBridge {static Bundle state;static Runnable during;static int reads;
  static Bundle localState(){reads++;Bundle result=new Bundle(state);if(during!=null){Runnable action=during;during=null;action.run();}return result;}}
 interface Case{void run()throws Exception;}
 static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
 static Bundle local(boolean connected,String generation){Bundle b=new Bundle();b.putInt("module_uid",Process.myUid());b.putBoolean("connected",connected);b.putString("service_generation",generation);return b;}
 static void test(String name,Case action)throws Exception{Process.uid=10515;Binder.uid=1000;Binder.pid=555;Binder.clears=Binder.restores=0;
  ResetWriteFence.epoch=7;ResetWriteFence.blocked=false;AppConfig.snapshot=new ConfigSnapshot(19,"a".repeat(64));AppConfig.during=null;AppConfig.reads=0;
  AtomicWorkbenchExtractionSystemBridge.state=local(true,"b".repeat(32));AtomicWorkbenchExtractionSystemBridge.during=null;AtomicWorkbenchExtractionSystemBridge.reads=0;
  action.run();check(Binder.uid==1000&&Binder.pid==555&&Binder.clears==Binder.restores,"Provider Binder identity lost");cases++;System.out.println("PASS extraction Provider: "+name);}
 static Bundle request(){Bundle b=new Bundle();b.putInt("schema",1);b.putString("nonce","c".repeat(32));b.putInt("user",Process.myUid()/100000);b.putInt("module_uid",Process.myUid());return b;}
 static Bundle query(){return new ExtractionProviderHarness().extractionSessionState(null,request());}
 static void reject(String arg,Bundle b){try{new ExtractionProviderHarness().extractionSessionState(arg,b);throw new AssertionError("invalid query accepted");}catch(SecurityException expected){checks++;}
  check(AtomicWorkbenchExtractionSystemBridge.reads==0&&AppConfig.reads==0,"rejected caller read local state");}
'''

TEST = '''
 public static void main(String[] args)throws Exception{
  test("exact read-only state from actual local lifecycle, no Root or display required",()->{Bundle r=query();
   check(r.keySet().equals(Set.of("schema","nonce","module_uid","user","service_generation","connected","config_revision","config_checksum","reset_generation","reset_blocked")),"unexpected disclosure");
   check(r.getInt("schema",-1)==1&&r.getString("nonce").equals("c".repeat(32))&&r.getInt("module_uid",-1)==10515&&r.getInt("user",-1)==0,"identity changed");
   check(r.getBoolean("connected",false)&&r.getString("service_generation").equals("b".repeat(32)),"actual service not reported");
   check(r.getLong("config_revision",-1)==19&&r.getString("config_checksum").equals("a".repeat(64)),"configuration changed");
   check(r.getLong("reset_generation",-1)==7&&!r.getBoolean("reset_blocked",true),"reset state changed");});
  test("foreign UID rejected",()->{Binder.uid=10515;reject(null,request());Binder.uid=1000;});
  test("Root UID cannot impersonate system state reader",()->{Binder.uid=0;reject(null,request());Binder.uid=1000;});
  test("non-null argument rejected",()->reject("register",request()));
  test("null request rejected",()->reject(null,null));
  test("client cannot self-register connected lifecycle",()->{Bundle b=request();b.putBoolean("connected",true);reject(null,b);});
  for(String key:new String[]{"schema","nonce","user","module_uid"})test("missing "+key,()->{Bundle b=request();b.remove(key);reject(null,b);});
  test("wrong schema rejected",()->{Bundle b=request();b.putInt("schema",2);reject(null,b);});
  test("schema type not coerced",()->{Bundle b=request();b.putLong("schema",1);reject(null,b);});
  test("wrong module UID rejected",()->{Bundle b=request();b.putInt("module_uid",10516);reject(null,b);});
  test("wrong user rejected",()->{Bundle b=request();b.putInt("user",10);reject(null,b);});
  test("malformed nonce rejected",()->{Bundle b=request();b.putString("nonce","INVALID");reject(null,b);});
  test("disconnected lifecycle is not registered by state read",()->{AtomicWorkbenchExtractionSystemBridge.state=local(false,"");Bundle r=query();check(!r.getBoolean("connected",true)&&r.getString("service_generation").isEmpty(),"fake service connection");});
  test("reconnect during first local read rejects old generation",()->{AtomicWorkbenchExtractionSystemBridge.during=()->AtomicWorkbenchExtractionSystemBridge.state=local(true,"d".repeat(32));
   check(!query().getBoolean("connected",true),"mixed service generation accepted");});
  test("disconnect during config read rejects old lifecycle",()->{AppConfig.during=()->AtomicWorkbenchExtractionSystemBridge.state=local(false,"");check(!query().getBoolean("connected",true),"late disconnected service accepted");});
  test("reset active blocks connected state",()->{ResetWriteFence.blocked=true;Bundle r=query();check(r.getBoolean("reset_blocked",false)&&!r.getBoolean("connected",true)&&r.getString("service_generation").isEmpty(),"reset left lifecycle authorized");});
  test("reset generation changes during config read",()->{AppConfig.during=()->ResetWriteFence.epoch=8;Bundle r=query();check(r.getBoolean("reset_blocked",false)&&!r.getBoolean("connected",true)&&r.getLong("reset_generation",-1)==8,"reset race accepted");});
  test("config revisions cannot be mixed",()->{AtomicWorkbenchExtractionSystemBridge.during=()->AppConfig.during=()->{};
   AppConfig.snapshot=new ConfigSnapshot(19,"a".repeat(64));
   AtomicWorkbenchExtractionSystemBridge.during=()->{AtomicWorkbenchExtractionSystemBridge.during=()->AppConfig.snapshot=new ConfigSnapshot(20,"d".repeat(64));};
   check(!query().getBoolean("connected",true),"mixed config accepted");});
  test("wrong local owner is never connected",()->{AtomicWorkbenchExtractionSystemBridge.state.putInt("module_uid",10516);check(!query().getBoolean("connected",true),"wrong local owner accepted");});
  test("malformed local generation is never connected",()->{AtomicWorkbenchExtractionSystemBridge.state.putString("service_generation","not-a-generation");check(!query().getBoolean("connected",true),"invalid local generation accepted");});
  test("secondary-user service returns its own identity",()->{Process.uid=1010515;AtomicWorkbenchExtractionSystemBridge.state=local(true,"b".repeat(32));Bundle r=query();check(r.getInt("user",-1)==10&&r.getInt("module_uid",-1)==1010515&&r.getBoolean("connected",false),"secondary user mixed");});
  System.out.println("EXTRACTION PROVIDER RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''


def run(source, label):
    with tempfile.TemporaryDirectory(prefix='duo-extraction-provider-') as temporary:
        work = Path(temporary)
        files = {key: value for key, value in BASE['STUBS'].items() if key.startswith('android/os/')}
        files['android/content/Context.java'] = 'package android.content;public class Context {}'
        files['ls/augment/com/ExtractionProviderHarness.java'] = HEAD + MEMBER(source, 'private Bundle extractionSessionState(') + MEMBER(source, 'private static boolean extractionLocalState(') + TEST
        paths = []
        for name, value in files.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, encoding='utf-8')
            paths.append(str(path))
        result = subprocess.run([JAVA['JAVAC'], '-encoding', 'UTF-8', '--release', '17', '-d', str(work), *paths], env=JAVA['ENV'], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=60)
        if result.returncode:
            raise AssertionError(f'{label} failed to compile\n{result.stderr}')
        return subprocess.run([JAVA['JAVA'], '-Dfile.encoding=UTF-8', '-cp', str(work), 'ls.augment.com.ExtractionProviderHarness'], env=JAVA['ENV'], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=30)


if __name__ == '__main__':
    source = SOURCE.read_text(encoding='utf-8')
    result = run(source, 'production')
    print(result.stdout, end='')
    if result.returncode:
        raise SystemExit(result.stderr)
    mutations = [
        ('system caller', source.replace('if (Binder.getCallingUid() != 1000 || arg != null || extras == null', 'if (false || arg != null || extras == null', 1)),
        ('local service generation', source.replace('first.getString("service_generation").equals(last.getString("service_generation"))', 'true', 1)),
        ('reset race', source.replace('ResetWriteFence.active() || reset != checkedReset', 'ResetWriteFence.active()', 1)),
        ('configuration race', source.replace('snapshot.revision == checked.revision && snapshot.checksum.equals(checked.checksum)', 'true', 1)),
        ('self-reported lifecycle payload', source.replace('!extras.keySet().equals(java.util.Set.of("schema", "nonce", "user", "module_uid"))', 'false', 1)),
    ]
    for label, changed in mutations:
        if changed == source:
            raise AssertionError('mutation did not apply: ' + label)
        negative = run(changed, label)
        if negative.returncode == 0 or 'AssertionError' not in negative.stderr:
            raise AssertionError(f'negative control not killed by behavior: {label}\n{negative.stdout}\n{negative.stderr}')
        print('PASS negative control: ' + label)
    print('EXTRACTION PROVIDER NEGATIVE RESULT 5 killed')
