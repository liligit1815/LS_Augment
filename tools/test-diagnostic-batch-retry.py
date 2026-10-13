"""Exercise DiagnosticStore retry identity and partial-write progress without a device."""
from pathlib import Path
import argparse
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--java-home', type=Path, default=Path('C:/Program Files/Android/openjdk/jdk-21.0.8'))
parser.add_argument('--json-jar', type=Path, required=True)
args = parser.parse_args()

STUBS = {
    'android/os/Bundle.java': '''package android.os;import java.util.*;public class Bundle{final Map<String,Object> values=new HashMap<>();public void putString(String k,String v){values.put(k,v);}public String getString(String k,String d){return (String)values.getOrDefault(k,d);}public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);}}''',
    'android/os/SystemClock.java': '''package android.os;public class SystemClock{public static long now=100000;public static long elapsedRealtime(){return now;}}''',
    'android/os/Binder.java': '''package android.os;public class Binder{public static int pid=321,uid=1000;public static int getCallingPid(){return pid;}public static int getCallingUid(){return uid;}}''',
    'android/content/SharedPreferences.java': '''package android.content;import java.util.*;public class SharedPreferences{final Map<String,Object> data=new HashMap<>();public Map<String,?> getAll(){return data;}public long getLong(String k,long d){return ((Number)data.getOrDefault(k,d)).longValue();}public Editor edit(){return new Editor();}public final class Editor{public Editor putString(String k,String v){data.put(k,v);return this;}public Editor putLong(String k,long v){data.put(k,v);return this;}public Editor remove(String k){data.remove(k);return this;}public void apply(){}}}''',
    'android/content/Context.java': '''package android.content;import java.io.*;import java.util.*;public class Context{final Map<String,SharedPreferences> prefs=new HashMap<>();public boolean failRetention;public int filesCalls,failFilesAt=-1;public SharedPreferences getSharedPreferences(String n,int mode){if(failRetention&&n.equals("diagnostic-retention"))throw new IllegalStateException("retention metadata");return prefs.computeIfAbsent(n,k->new SharedPreferences());}public File getFilesDir(){filesCalls++;if(filesCalls==failFilesAt)throw new IllegalStateException("before append");return new File("unused-fixture-files");}}''',
    'ls/augment/com/ResetWriteFence.java': '''package ls.augment.com;final class ResetWriteFence{static boolean blocked;static boolean blocked(){return blocked;}}''',
    'ls/augment/com/RuntimeEnvironment.java': '''package ls.augment.com;final class RuntimeEnvironment{static int bootCount(Object c){return 7;}}''',
    'ls/augment/com/AppConfig.java': '''package ls.augment.com;final class AppConfig{AppConfig(Object c){}boolean getBoolean(String k){return false;}}''',
    'ls/augment/com/ConfigSchema.java': '''package ls.augment.com;final class ConfigSchema{static final String AI_TRIGGER_DIAGNOSTICS="ai",SHOULDER_DIAGNOSTICS="shoulder";}''',
    'ls/augment/com/BoundedLog.java': '''package ls.augment.com;import java.io.*;import java.util.*;final class BoundedLog{static final List<String> lines=new ArrayList<>();static int attempts,failAt=-1,failAfterAt=-1;static boolean rotate;static boolean append(File f,String line,int max,int keep)throws IOException{attempts++;if(attempts==failAt)throw new IOException("fixture write boundary");if(attempts==failAfterAt){lines.add(line.substring(0,line.length()/2));throw new IOException("fixture partially committed write");}lines.add(line);return rotate;}}''',
}

TEST = r'''
package ls.augment.com;
import android.content.*;import android.os.*;import java.lang.reflect.*;import java.util.*;import org.json.*;
public final class TestDiagnosticBatchRetry {
 static int checks;static void yes(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
 static JSONObject event(String value)throws Exception{return new JSONObject().put("feature","LIFTARC").put("level","INFO").put("value",value);}
 static Bundle request(String id,long started,String... values)throws Exception{
  Bundle b=new Bundle();b.putString("eventBatchId",id);b.putString("snapshot",new JSONObject().put("pid",Binder.pid).put("moduleLoadedElapsed",started).put("process","fixture").put("moduleVersion","test-current").toString());
  JSONArray events=new JSONArray();for(String value:values)events.put(event(value));b.putString("events",events.toString());return b;
 }
 static Map<?,?> ledger()throws Exception{Field f=DiagnosticStore.class.getDeclaredField("detailBatches");f.setAccessible(true);return (Map<?,?>)f.get(null);}
 public static void main(String[] args)throws Exception{
  Context context=new Context();Bundle original=request("session-a:1",10,"first","second");
  yes(DiagnosticStore.record(context,original).getBoolean("ok")&&BoundedLog.lines.size()==2,"initial batch accepted");
  // Simulate the caller losing the first reply after the provider completed its work.
  Bundle replay=DiagnosticStore.record(context,original);
  yes(replay.getBoolean("ok")&&replay.getBoolean("duplicateBatch")&&BoundedLog.lines.size()==2,"lost reply retry does not append accepted events again");
  yes(!DiagnosticStore.record(context,request("session-a:1",10,"changed")).getBoolean("ok")&&BoundedLog.lines.size()==2,"same identity with different payload is rejected rather than swallowing new events");
  yes(DiagnosticStore.record(context,request("session-a:2",10,"new batch")).getBoolean("ok")&&BoundedLog.lines.size()==3,"new identity delivers new events");
  Binder.uid=1001;yes(DiagnosticStore.record(context,original).getBoolean("ok")&&BoundedLog.lines.size()==5,"different authenticated UID is independent");Binder.uid=1000;
  Binder.pid=322;yes(DiagnosticStore.record(context,request("session-a:1",10,"first","second")).getBoolean("ok")&&BoundedLog.lines.size()==7,"different authenticated PID is independent");Binder.pid=321;
  yes(DiagnosticStore.record(context,request("session-a:1",11,"first","second")).getBoolean("ok")&&BoundedLog.lines.size()==9,"new process start is independent even if PID and token recur");
  yes(DiagnosticStore.record(context,request("session-b:1",10,"first","second")).getBoolean("ok")&&BoundedLog.lines.size()==11,"new sender session is independent");
  int before=BoundedLog.lines.size();Bundle partial=request("partial:1",10,"partial-first","partial-second","partial-third");context.failFilesAt=context.filesCalls+2;
  yes(!DiagnosticStore.record(context,partial).getBoolean("ok")&&BoundedLog.lines.size()==before+1,"known pre-write failure after a prefix leaves the batch unaccepted");context.failFilesAt=-1;
  yes(DiagnosticStore.record(context,partial).getBoolean("ok")&&BoundedLog.lines.size()==before+3,"retry resumes after the successful prefix");
  yes(BoundedLog.lines.stream().filter(line->line.contains("partial-first")).count()==1,"partial-write retry never duplicates a confirmed prefix");
  yes(DiagnosticStore.record(context,partial).getBoolean("duplicateBatch")&&BoundedLog.lines.size()==before+3,"completed partial batch is subsequently deduplicated");
  before=BoundedLog.lines.size();Bundle uncertain=request("uncertain:1",10,"confirmed-before-error","uncertain-write","unattempted-tail");BoundedLog.failAfterAt=BoundedLog.attempts+2;
  Bundle terminal=DiagnosticStore.record(context,uncertain);
  yes(!terminal.getBoolean("ok")&&!terminal.getBoolean("retryable",true)&&terminal.getString("detailFailure","").equals("APPEND_COMMIT_UNKNOWN")
    &&BoundedLog.lines.size()==before+2,"partial write followed by IOException returns a terminal commit-unknown outcome");
  int attempts=BoundedLog.attempts;BoundedLog.failAfterAt=-1;
  // Drop the terminal reply, as could happen after Binder transport failure, then replay it.
  terminal=DiagnosticStore.record(context,uncertain);
  yes(!terminal.getBoolean("ok")&&!terminal.getBoolean("retryable",true)&&terminal.getString("error","").equals("IOException")
    &&BoundedLog.attempts==attempts&&BoundedLog.lines.size()==before+2,"lost terminal reply replay cannot append the uncertain event or the remaining batch again");
  yes(!DiagnosticStore.record(context,request("uncertain:1",10,"changed")).getBoolean("ok")&&BoundedLog.attempts==attempts,"terminal identity still rejects changed payload");
  Bundle beforeWrite=request("uncertain:2",10,"append failed before commit");BoundedLog.failAt=BoundedLog.attempts+1;
  yes(!DiagnosticStore.record(context,beforeWrite).getBoolean("retryable",true),"an IOException from inside append is conservatively terminal even when the test knows it wrote zero bytes");BoundedLog.failAt=-1;
  before=BoundedLog.lines.size();Bundle metadata=request("retention:1",10,"metadata-first","metadata-second");BoundedLog.rotate=true;context.failRetention=true;
  yes(!DiagnosticStore.record(context,metadata).getBoolean("ok")&&BoundedLog.lines.size()==before+1,"retention-stat failure after append remains a failed response");context.failRetention=false;BoundedLog.rotate=false;
  yes(DiagnosticStore.record(context,metadata).getBoolean("ok")&&BoundedLog.lines.size()==before+2,"progress is recorded before optional retention metadata can fail");
  before=BoundedLog.lines.size();ResetWriteFence.blocked=true;Bundle fenced=request("fenced:1",10,"after reset fence");
  yes(!DiagnosticStore.record(context,fenced).getBoolean("ok")&&BoundedLog.lines.size()==before,"write fence rejects without accepting or consuming the batch");ResetWriteFence.blocked=false;
  yes(DiagnosticStore.record(context,fenced).getBoolean("ok")&&BoundedLog.lines.size()==before+1,"same batch can recover once the fence clears");
  before=BoundedLog.lines.size();Bundle invalid=request("invalid token",10,"bad");
  yes(!DiagnosticStore.record(context,invalid).getBoolean("ok")&&BoundedLog.lines.size()==before,"invalid bounded identity is rejected");
  yes(!DiagnosticStore.record(context,request("valid:1",0,"bad start")).getBoolean("ok"),"retry identity requires a process start");
  before=BoundedLog.lines.size();Bundle legacy=request("",10,"legacy");DiagnosticStore.record(context,legacy);DiagnosticStore.record(context,legacy);
  yes(BoundedLog.lines.size()==before+2,"legacy requests keep their existing non-deduplicated behavior");
  for(int i=0;i<300;i++)yes(DiagnosticStore.record(context,request("bounded:"+i,10,"bounded "+i)).getBoolean("ok"),"bounded insertion "+i);
  yes(ledger().size()==256,"ledger has an absolute 256-entry cap");
  SystemClock.now+=60001;yes(DiagnosticStore.record(context,request("fresh:1",10,"fresh")).getBoolean("ok")&&ledger().size()==1,"inactive ledger entries expire after 60 seconds");
  // Expiry and provider death intentionally permit re-delivery: there is no durability claim.
  before=BoundedLog.lines.size();yes(DiagnosticStore.record(context,original).getBoolean("ok")&&BoundedLog.lines.size()==before+2,"expired identity can be accepted again within the documented bounded suppression model");
  System.out.println("PASS actual DiagnosticStore retry ledger: "+checks+" checks (caller identity, reply loss, partial writes, rejection, bounds)");
 }
}
'''

with tempfile.TemporaryDirectory(prefix='duo-diagnostic-batch-') as folder:
    work = Path(folder)
    sources = []
    for relative, text in {**STUBS, 'ls/augment/com/TestDiagnosticBatchRetry.java': TEST}.items():
        path = work / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf-8')
        sources.append(path)
    main = ROOT / 'android/app/src/main/java/ls/augment/com'
    sources += [main / 'DiagnosticStore.java', main / 'ShoulderSwitchLogPolicy.java']
    subprocess.run([str(args.java_home/'bin/javac.exe'), '-encoding', 'UTF-8', '--release', '17', '-cp', str(args.json_jar), '-d', str(work), *map(str, sources)], check=True)
    subprocess.run([str(args.java_home/'bin/java.exe'), '-cp', str(work)+os.pathsep+str(args.json_jar), 'ls.augment.com.TestDiagnosticBatchRetry'], check=True, timeout=30)
