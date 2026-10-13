"""Execute production AI adapters, decision witnesses and old combo cache validation."""
from pathlib import Path
import argparse
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOK = ROOT / 'android/app/src/main/java/ls/augment/com/hook'


def method(source, signature):
    start = source.index(signature)
    brace = source.index('{', start)
    end, depth = brace + 1, 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


AI_HARNESS = r'''
package ls.augment.com.hook;
import java.lang.reflect.*;
import java.util.*;
import android.os.Message;
public class TestAiHandlerScopeRuntime {
 static final String PLUGIN_PACKAGE="com.zte.game.plugintrigger",CLICK_HANDLER="click";
 static class Config {boolean enabled,diagnostics;Config(boolean e,boolean d){enabled=e;diagnostics=d;}}
 static Config current=new Config(false,false);static int replacements,traces;
 static class Chain {
  Object[] args;boolean rejectArgs;int calls;
  Chain(Object...v){args=v;}Object getThisObject(){return this;}
  Object getArg(int n){if(rejectArgs)throw new AssertionError("OFF read arguments");return args[n];}
  Object proceed(){calls++;return "native";}Object proceed(Object[] v){calls++;args=v;return "native";}
 }
 interface Hooker {Object intercept(Chain c)throws Throwable;}
 static class HookHandle {}
 static class Builder {HookHandle intercept(Hooker h){return new HookHandle();}}
 static class AugmentModule {
  List<String> names=new ArrayList<>();
  Builder prepareFeatureHook(Method m,String id,boolean before){names.add(m.getName());return new Builder();}
  void registerFeatureHook(HookHandle h){}void logFeatureInfo(String s){}
  void logFeatureError(String s,Throwable t){throw new AssertionError(t);}
 }
 static String safeId(String s){return s.replace('.','_');}
 static Config config(AugmentModule m,Object o){return current;}
 static int intArg(Object v){return ((Number)v).intValue();}
 static long longArg(Object v){return ((Number)v).longValue();}
 static Long replacementFor(AugmentModule m,Object o,int w,long d,String p,Config c){replacements++;return 25L;}
 static void traceTouchSchedule(Object o,String p,int w,long d,Long r){traces++;}
 static boolean alreadyQueued(Object o,int w){return false;}
 static boolean isTouchMessage(int w){return w>=101&&w<=104;}
 static void traceStage(String s){traces++;}static String traceError(Throwable t){return "";}
 // PRODUCTION
 static void yes(boolean b,String m){if(!b)throw new AssertionError(m);}
 public static void main(String[] a)throws Throwable {
  String[] pkgs={PLUGIN_PACKAGE,"cn.nubia.gameassist","cn.nubia.gamelab","other",null};
  int[] counts={3,2,0,0,0};
  for(int i=0;i<pkgs.length;i++){
   AugmentModule m=new AugmentModule();int n=installCommon(m,TestAiHandlerScopeRuntime.class.getClassLoader(),pkgs[i]);
   yes(n==counts[i]&&m.names.size()==counts[i],"registered scope "+pkgs[i]);
   yes(m.names.contains("dispatchMessage")==Objects.equals(pkgs[i],PLUGIN_PACKAGE),"dispatch belongs only to click engine");
  }
  AugmentModule m=new AugmentModule();
  for(boolean enabled:new boolean[]{false,true,false,true}){
   current=new Config(enabled,true);replacements=traces=0;
   Chain empty=new Chain(102,50L);empty.rejectArgs=!enabled;
   interceptEmpty(m,empty,PLUGIN_PACKAGE);
   yes(empty.calls==1&&replacements==(enabled?1:0),"empty live gate and native call count");
   yes(!enabled||empty.args[1].equals(25L),"empty changed delay");
   Message msg=new Message();msg.what=103;
   Chain message=new Chain(msg,450L);message.rejectArgs=!enabled;replacements=0;
   interceptMessage(m,message,PLUGIN_PACKAGE);
   yes(message.calls==1&&replacements==(enabled?1:0),"message live gate");
  }
  for(Config c:new Config[]{new Config(false,true),new Config(true,false)}){
   current=c;traces=0;Chain dispatch=new Chain();dispatch.rejectArgs=true;
   yes(interceptDispatch(m,dispatch,PLUGIN_PACKAGE).equals("native")&&dispatch.calls==1&&traces==0,"inactive trace dispatch fast path");
  }
  System.out.println("PASS AI registration matrix and disabled/live callbacks");
 }
}
'''

DECISION_HARNESS = r'''
package ls.augment.com.hook;
public class TestRapidDecisionEvidence {
 static void yes(boolean b,String m){if(!b)throw new AssertionError(m);}
 public static void main(String[] a){
  boolean[][] inputs={{false,false,false,false,false},{true,false,true,false,false},{true,true,false,false,false},{true,true,true,false,false},{true,true,true,true,true},{true,true,true,true,false}};
  String[] states={"MISSING","MALFORMED","IDENTITY_NOT_READY","ENVIRONMENT_MISMATCH","VALID_CURRENT","VALID_LEGACY_EQUIVALENT"};
  for(int i=0;i<inputs.length;i++){boolean[] b=inputs[i];yes(RapidFireDecisionEvidence.tokenStatus(b[0],b[1],b[2],b[3],b[4]).equals(states[i]),states[i]);}
  yes(RapidFireDecisionEvidence.disabledReason(false,true,"VALID_CURRENT",false).equals("GAME_MASTER_OFF"),"master");
  yes(RapidFireDecisionEvidence.disabledReason(true,false,"VALID_CURRENT",false).equals("FEATURE_OFF"),"off");
  yes(RapidFireDecisionEvidence.disabledReason(true,true,"ENVIRONMENT_MISMATCH",false).equals("TOKEN_ENVIRONMENT_MISMATCH"),"invalid identity");
  yes(RapidFireDecisionEvidence.disabledReason(true,true,"VALID_CURRENT",true).equals("FUSED"),"fuse");
  String old=RapidFireDecisionEvidence.describe("build",11,22,"PASSED",false,false,"ENVIRONMENT_MISMATCH",false,"TOKEN_ENVIRONMENT_MISMATCH","installed|sha256=private-native-hash|token=secret");
  yes(old.contains("|state=DISABLED|sessionState=PASSED|")&&old.contains("|effectiveEnabled=false|"),"stored pass is not an active decision");
  yes(!old.contains("private-native-hash")&&!old.contains("secret")&&!old.contains("fingerprint="),"no private identity material");
  String active=RapidFireDecisionEvidence.describe("build",11,22,"PASSED",false,false,"VALID_LEGACY_EQUIVALENT",true,"ACTIVE","installed");
  yes(active.contains("|state=ACTIVE|")&&active.contains("sessionActiveForTest=false")&&active.contains("effectiveEnabled=true"),"persistent token independent of test activity");
  String test=RapidFireDecisionEvidence.describe("build",11,22,"WAIT_LEFT",true,true,"MISSING",false,"TEST_OBSERVING","installed");
  yes(test.contains("|state=TESTING|")&&test.contains("effectiveEnabled=false"),"testing distinct from normal feature route");
  System.out.println("PASS rapid decision classification and private-field exclusion");
 }
}
'''

COMBO_HARNESS = r'''
package ls.augment.com;
import java.nio.file.*;
import java.nio.file.attribute.FileTime;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
public class TestComboCacheEvidence {
 static Path source,cache;static int checks;
 static void yes(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static ComboMotionPrivateScaler.Result scale(float rate)throws Exception{return ComboMotionPrivateScaler.scale(cache.toFile(),ComboMotionPrivateScaler.Request.capture(cache.toFile(),source.toString(),rate,0L));}
 static void write(Path p,String value)throws Exception{Files.writeString(p,value,StandardCharsets.UTF_8);}
 static String recording(long end){return "{\"name\":\"macro\",\"events\":[{\"sampleEventTime\":1000,\"downTime\":1000,\"action\":0},{\"sampleEventTime\":"+end+",\"downTime\":1000,\"action\":1}]}";}
 public static void main(String[] a)throws Exception {
  Path temp=Files.createTempDirectory("duo-combo-evidence-");source=temp.resolve("source.json");cache=temp.resolve("cache");Files.createDirectory(cache);
  try {
   write(source,recording(3000));
   ComboMotionPrivateScaler.Result first=scale(2);
   yes(first.success&&!first.cacheHit&&first.eventCount==2&&first.sourceSpanMs==2000&&first.outputSpanMs==1000,"fresh source metrics");
   Path output=Path.of(first.outputPath);String bytes=Files.readString(output);
   yes(new JSONObject(bytes).getJSONArray("events").getJSONObject(1).getInt("action")==1,"release event retained");
   ComboMotionPrivateScaler.Result disk=scale(2);
   yes(disk.success&&disk.cacheHit&&disk.evidenceSource.equals("DISK_CACHE_VERIFIED")&&disk.eventCount==2&&disk.sourceSpanMs==2000&&disk.outputSpanMs==1000,"old-format disk cache reconstructs evidence");
   yes(Files.readString(output).equals(bytes),"valid cache is not scaled again");
   ComboMotionPrivateScaler.Result memory=disk.asPublishedHit();
   yes(memory.evidenceSource.equals("MEMORY_CACHE")&&memory.sourceSpanMs==2000&&memory.outputSpanMs==1000,"memory retains metrics");
   JSONObject damaged=new JSONObject(bytes);damaged.getJSONArray("events").getJSONObject(1).put("sampleEventTime",1500);write(output,damaged.toString());
   ComboMotionPrivateScaler.Result repaired=scale(2);
   yes(repaired.success&&!repaired.cacheHit&&repaired.outputSpanMs==1000&&Files.readString(output).equals(bytes),"double-scaled cache rebuilt from original");
   damaged=new JSONObject(bytes);damaged.getJSONArray("events").getJSONObject(1).put("action",0);write(output,damaged.toString());
   yes(!scale(2).cacheHit&&Files.readString(output).equals(bytes),"wrong release action cache rejected");
   damaged=new JSONObject(bytes);damaged.put("name","other macro");write(output,damaged.toString());
   yes(!scale(2).cacheHit&&Files.readString(output).equals(bytes),"wrong OEM metadata cache rejected");
   damaged=new JSONObject(bytes);damaged.getJSONArray("events").remove(1);write(output,damaged.toString());
   yes(!scale(2).cacheHit,"missing release cache rejected");
   write(output,"broken");yes(scale(2).success&&!scale(2).evidenceSource.equals("UNKNOWN"),"broken cache recovers");
   FileTime saved=Files.getLastModifiedTime(source);write(source,recording(5000));Files.setLastModifiedTime(source,saved);
   ComboMotionPrivateScaler.Result changed=scale(2);
   yes(changed.success&&!changed.cacheIdentity.equals(first.cacheIdentity)&&changed.sourceSpanMs==4000&&changed.outputSpanMs==2000,"same-size and mtime content change invalidates identity");
   for(int rate:new int[]{1,2,10}){
    ComboMotionPrivateScaler.Result r=scale(rate);yes(r.success&&r.sourceSpanMs==4000&&r.outputSpanMs==4000/rate,"rate "+rate);
   }
   write(source,recording(1000));ComboMotionPrivateScaler.Result zero=scale(10);
   yes(zero.success&&zero.eventCount==2&&zero.sourceSpanMs==0&&zero.outputSpanMs==0,"zero span is real evidence");
   yes(scale(10).cacheHit&&scale(10).eventCount==2,"zero span disk verification");
   System.out.println("PASS combo old/disk/memory cache evidence and corruption recovery: "+checks+" checks");
  } finally {try(var files=Files.walk(temp)){for(Path p:files.sorted(Comparator.reverseOrder()).toList())Files.deleteIfExists(p);}}
 }
}
'''


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--json-jar', required=True, type=Path)
    args = parser.parse_args()
    source = (HOOK / 'AiTriggerSpeedHook.java').read_text(encoding='utf-8')
    begin = source.index('        int installed = 0;', source.index('static int install('))
    end = source.index('        if (PLUGIN_PACKAGE.equals(packageName)) {', begin)
    common = 'static int installCommon(AugmentModule module,ClassLoader classLoader,String packageName){\n' + source[begin:end] + '\nreturn installed;}'
    callbacks = [method(source, 'private static Object ' + name + '(')
                 for name in ('interceptEmpty', 'interceptMessage', 'interceptDispatch')]
    with tempfile.TemporaryDirectory(prefix='duo-log-evidence-') as folder:
        work = Path(folder)
        sources = {
            'android/os/Message.java': 'package android.os;public class Message {public int what,arg1,arg2;}',
            'android/os/Handler.java': 'package android.os;public class Handler {public boolean sendEmptyMessageDelayed(int w,long d){return true;}public boolean sendMessageDelayed(Message m,long d){return true;}public void dispatchMessage(Message m){}}',
            'ls/augment/com/hook/TestAiHandlerScopeRuntime.java': AI_HARNESS.replace('// PRODUCTION', common + '\n' + '\n'.join(callbacks)),
            'ls/augment/com/hook/TestRapidDecisionEvidence.java': DECISION_HARNESS,
            'ls/augment/com/TestComboCacheEvidence.java': COMBO_HARNESS,
        }
        files = []
        for name, value in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value, encoding='utf-8')
            files.append(path)
        files += [HOOK / (name + '.java') for name in
                  ('AiHandlerScope', 'RapidFireDecisionEvidence', 'ComboSpeedPolicy')]
        files.append(HOOK.parent / 'ComboMotionPrivateScaler.java')
        subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-cp', str(args.json_jar), '-d', folder, *map(str, files)], check=True)
        for name in ('TestAiHandlerScopeRuntime', 'TestRapidDecisionEvidence', 'TestComboCacheEvidence'):
            subprocess.run(['java', '-cp', folder + os.pathsep + str(args.json_jar), ('ls.augment.com.' if name == 'TestComboCacheEvidence' else 'ls.augment.com.hook.') + name], check=True, timeout=30)


if __name__ == '__main__':
    main()
