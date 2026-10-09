"""Execute extracted real post-CANCEL methods against a deterministic local preference/UI facade.
No device, Gradle, production edits or input timing changes. --mutations checks unsafe variants.
"""
from pathlib import Path
import os,subprocess,tempfile,sys
ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'android/app/src/androidTest/java/ls/augment/com/BackGestureCustomizationDeviceCases.java'
TIMELINE=SOURCE.with_name('BackGestureProbeTimeline.java')
JDK=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'

def method(text,name):
    marker=('private static ' if name in ('confirmedNativeTerminal','probeIdentity') else 'private ')
    start=text.rfind(marker,0,text.index(name+'(')); brace=text.index('{',text.index(name+'('));depth=1;i=brace+1
    while depth:
        if text[i]=='{':depth+=1
        elif text[i]=='}':depth-=1
        i+=1
    return text[start:i]

HARNESS=r'''
package ls.augment.com;
import java.util.*;
class JSONObject {
 static final Object NULL=new Object();final Map<String,Object> values=new LinkedHashMap<>();
 JSONObject put(String k,Object v){values.put(k,v);return this;}
 String optString(String k){return String.valueOf(values.getOrDefault(k,""));}
 int optInt(String k){return optInt(k,0);}int optInt(String k,int d){Object v=values.get(k);return v instanceof Number?((Number)v).intValue():d;}
 long optLong(String k){return optLong(k,0);}long optLong(String k,long d){Object v=values.get(k);return v instanceof Number?((Number)v).longValue():d;}
 boolean optBoolean(String k,boolean d){Object v=values.get(k);return v instanceof Boolean?(Boolean)v:d;}
}
class JSONArray{final List<Object> values=new ArrayList<>();JSONArray put(Object x){values.add(x);return this;}}
class BackGestureRuntimeObservation {int pid=19916,build=20460;long processStarted=84512673,revision=31,generation=14;}
class BackGestureProbeTrace{static final String KEY="probe";static final int PARTS=6;}
class SystemClock{static long now;static long uptimeMillis(){return now;}static void sleep(long n){now+=n;}}
public class TestPostCancel {
 static final String POST_CANCEL_OBSERVATION_POLICY="native-terminal-before-window-v1";
 static final String NONCE="a".repeat(32);static int checks;
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class UnsafeInputState extends Exception{UnsafeInputState(String x){super(x);}UnsafeInputState(String x,Throwable e){super(x,e);}}
 static class Snapshot{long revision=31;}static class Config{Snapshot configSnapshot(){return new Snapshot();}}
 final Config config=new Config();final Snapshot lastExpected=new Snapshot();
 final List<String> calls=new ArrayList<>();final BackGestureRuntimeObservation ack=new BackGestureRuntimeObservation();
 JSONObject head;long availableAt=0;int partReads;String badPart="",fault="";boolean hover,homeFails;
 JSONObject probeJson(String key){
  calls.add(key+"@"+SystemClock.now);
  if(fault.equals("read"))throw new IllegalStateException("local read failure");
  if(key.equals("probe"))return SystemClock.now<availableAt?null:head;
  partReads++;int part=Integer.parseInt(key.substring(6));
  JSONObject p=identity().put("phase","cancelled").put("part",part);
  if(!badPart.isEmpty())p.put("nonce",badPart);return p;
 }
 boolean shortcutVisible(){calls.add("WINDOW@"+SystemClock.now);return hover;}
 void prepareLauncher()throws UnsafeInputState{calls.add("HOME@"+SystemClock.now);if(homeFails)throw new UnsafeInputState("unknown foreground");}
 JSONObject identity(){return new JSONObject().put("schema",1).put("nonce",NONCE).put("pid",ack.pid).put("build",ack.build)
  .put("side",1).put("processStarted",ack.processStarted).put("revision",ack.revision).put("generation",ack.generation).put("downTime",1000);}
 TestPostCancel(long received,long returned){head=identity().put("part",0).put("phase","cancelled").put("cancelReceived",received)
  .put("cancelReturned",returned).put("lastMoveReceived",1050).put("lastWaveMoveReturned",1051).put("overflow",0).put("errors",0);}
 /*METHODS*/
 JSONObject run(JSONObject sample)throws Exception{return observeNativeCancelThenRecover(NONCE,1,1000,ack,1180,sample);}
 int index(String prefix){for(int i=0;i<calls.size();i++)if(calls.get(i).startsWith(prefix))return i;return -1;}
 static void unsafe(TestPostCancel t,String name)throws Exception{
  JSONObject sample=new JSONObject();try{t.run(sample);throw new AssertionError(name+" accepted missing terminal");}
  catch(UnsafeInputState expected){}
  check(t.index("WINDOW")==-1&&t.index("HOME")==-1,name+" no UI before terminal");
  check(t.partReads==0,name+" no old part parsing");
  check(!sample.optBoolean("launcherRecoveryAttempted",true),name+" recovery not attempted");
 }
 public static void main(String[] args)throws Exception{
  SystemClock.now=1337;TestPostCancel good=new TestPostCancel(1334,1336);JSONObject sample=new JSONObject(),v=good.run(sample);
  check(v.optBoolean("matched",false)&&v.optBoolean("terminalConfirmed",false),"real full terminal matches");
  check(good.index("probe_6")<good.index("WINDOW")&&good.index("WINDOW")<good.index("HOME"),"full probe before WINDOW before HOME");
  check(sample.optBoolean("nativeTerminalBeforeUi",false)&&sample.optBoolean("launcherRecovered",false),"terminal proof and recovery recorded");
  check(sample.optString("postCancelObservationPolicy").equals(POST_CANCEL_OBSERVATION_POLICY),"new policy named");
  SystemClock.now=1334;TestPostCancel late=new TestPostCancel(1546,1546);late.availableAt=1546;v=late.run(new JSONObject());
  check(late.calls.stream().filter(x->x.startsWith("WINDOW")).allMatch(x->Long.parseLong(x.split("@")[1])>=1546),"no WINDOW during213ms delayed native receipt");
  check(late.index("HOME")>=0&&!v.optBoolean("nativeCancelWithinDeadline",true),"known late terminal cleans up but stays invalid");
  check(late.partReads==6,"missing head is polled without reading any parts");
  SystemClock.now=1400;check(new TestPostCancel(1350,1350).run(new JSONObject()).optBoolean("nativeCancelWithinDeadline",false),"350ms still eligible");
  SystemClock.now=1400;check(!new TestPostCancel(1350,1351).run(new JSONObject()).optBoolean("nativeCancelWithinDeadline",true),"351ms return rejected");
  for(String field:new String[]{"schema","nonce","pid","build","side","processStarted","revision","generation","downTime","part","phase"}){
   SystemClock.now=1337;TestPostCancel t=new TestPostCancel(1334,1336);
   if(field.equals("nonce"))t.head.put(field,"b".repeat(32));else if(field.equals("phase"))t.head.put(field,"up_not_cancel");else t.head.put(field,-9);
   unsafe(t,field);
  }
  SystemClock.now=1337;TestPostCancel missing=new TestPostCancel(1334,1336);missing.head=null;unsafe(missing,"missing head");
  SystemClock.now=1337;unsafe(new TestPostCancel(999,1336),"preDOWN receipt");
  SystemClock.now=1337;unsafe(new TestPostCancel(1336,1334),"reversed terminal");
  SystemClock.now=1337;unsafe(new TestPostCancel(1334,10000),"future terminal");
  SystemClock.now=1337;TestPostCancel bad=new TestPostCancel(1334,1336);bad.badPart="b".repeat(32);v=bad.run(new JSONObject());
  check(v.optBoolean("terminalConfirmed",false)&&!v.optBoolean("matched",true),"known returned input with missing parts remains incomplete evidence");
  check(bad.index("WINDOW")>=0&&bad.index("HOME")>=0,"known terminal allows safe recovery even if parts unavailable");
  check(v.optString("status").equals("native_cancel_parts_not_observed"),"parts failure distinguished from missing terminal");
  SystemClock.now=1337;TestPostCancel read=new TestPostCancel(1334,1336);read.fault="read";unsafe(read,"read exception");
  SystemClock.now=1337;TestPostCancel home=new TestPostCancel(1334,1336);home.homeFails=true;sample=new JSONObject();
  try{home.run(sample);throw new AssertionError("failed recovery accepted");}catch(UnsafeInputState expected){}
  check(home.index("probe_6")<home.index("WINDOW")&&!sample.optBoolean("launcherRecovered",true),"failed native window recovery remains unsafe after confirmed terminal");
  System.out.println("PASS post-CANCEL real extracted methods: "+checks+" checks");
 }
}
'''

def build_source(source):
    names=('observeNativeCancelThenRecover','confirmedNativeTerminal','collectProbe','probeIdentity')
    # Find method declaration, not an earlier call site.
    parts=[]
    for name in names:
        import re
        m=re.search(r'    private (?:static )?\w+ '+name+r'\(',source)
        assert m,name
        parts.append(method(source[m.start():],name))
    return HARNESS.replace('/*METHODS*/','\n'.join(parts))

def run(source,negative=False):
    with tempfile.TemporaryDirectory(prefix='lsa-post-cancel-') as folder:
        p=Path(folder);(p/'TestPostCancel.java').write_text(build_source(source),'utf-8')
        (p/'BackGestureProbeTimeline.java').write_bytes(TIMELINE.read_bytes())
        compiled=subprocess.run([str(JDK/'javac'),'-encoding','UTF-8','--release','17','-d',str(p),str(p/'TestPostCancel.java'),str(p/'BackGestureProbeTimeline.java')],capture_output=True,text=True)
        assert compiled.returncode==0,compiled.stdout+compiled.stderr
        r=subprocess.run([str(JDK/'java'),'-cp',str(p),'ls.augment.com.TestPostCancel'],capture_output=True,text=True,timeout=15)
        if negative:
            assert r.returncode and 'AssertionError' in r.stderr,r.stdout+r.stderr
            return r.stderr.splitlines()[0]
        assert r.returncode==0,r.stdout+r.stderr
        print(r.stdout.strip())

def integration_checks(source):
    import re
    m=re.search(r'    private Shot gesture\(',source);g=method(source[m.start():],'gesture')
    assert 'shortcutVisible()' not in g and 'prepareLauncher()' in g[:g.index('input.begin()')]
    held_to_recovery=g[g.index('input.begin()'):]
    assert 'shortcutVisible()' not in held_to_recovery and 'prepareLauncher()' not in held_to_recovery
    assert held_to_recovery.index('input.finish()')<held_to_recovery.index('observeNativeCancelThenRecover(')<held_to_recovery.index('screens.put(sample);',held_to_recovery.index('observeNativeCancelThenRecover('))
    assert 'finally {persist();}' in held_to_recovery and 'if(active!=null)writePng' in held_to_recovery
    assert '.put("postCancelObservationPolicy",POST_CANCEL_OBSERVATION_POLICY)' in source
    assert 'if(!nativeProbe.optBoolean("nativeCancelWithinDeadline",false))' in g
    assert 'if(!nativeProbe.optBoolean("matched",false))' in g
    print('PASS actual gesture integration: no post-injection window/HOME before helper; acquired PNG persistence and original deadline/full-parts gates retained')

if __name__=='__main__':
    source=SOURCE.read_text('utf-8');integration_checks(source);run(source)
    if '--mutations' in sys.argv:
        cases=[
          ('missing-terminal-ui', 'if(!nativeProbe.optBoolean("terminalConfirmed",false))','if(false)'),
          ('window-before-terminal','try{nativeProbe=collectProbe(nonce,side,down,ack,firstStart);}','try{shortcutVisible();nativeProbe=collectProbe(nonce,side,down,ack,firstStart);}'),
          ('home-before-terminal','try{nativeProbe=collectProbe(nonce,side,down,ack,firstStart);}','try{prepareLauncher();nativeProbe=collectProbe(nonce,side,down,ack,firstStart);}'),
          ('no-head-before-parts','if(!confirmedNativeTerminal(head,nonce,side,down,ack,SystemClock.uptimeMillis()))','if(head==null)'),
          ('future-terminal','&&head.optLong("cancelReturned")<=now',''),
          ('wrong-nonce','nonce.equals(value.optString("nonce"))','true'),
          ('wrong-generation','&&value.optLong("generation",-1)==ack.generation',''),
          ('wrong-down','&&value.optLong("downTime",-1)==down',''),
          ('parts-become-pass','if(matched){return result.put("matched",true)','if(true){return result.put("matched",true)'),
        ]
        for name,old,new in cases:
            assert source.count(old)==1,(name,source.count(old))
            print('KILLED',name,run(source.replace(old,new),negative=True))
