"""Local tests for exact runtime ACKs and the actual test-only input watchdog; no Android/device actions."""
from pathlib import Path
import os
import subprocess
import tempfile
import importlib.util
import sys

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / 'android/app/src/main/java/ls/augment/com'
TEST = ROOT / 'android/app/src/androidTest/java/ls/augment/com'
JAVA = r'''
package ls.augment.com;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
public final class TestGestureObservation {
 static int checks;
 static void check(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
 static long now(){return System.nanoTime()/1000000;}
 static void sleep(long millis){try{Thread.sleep(millis);}catch(InterruptedException e){Thread.currentThread().interrupt();throw new AssertionError(e);}}
 static Map<String,String> base(){Map<String,String> v=new LinkedHashMap<>();v.put(ConfigSchema.SYSTEMUI_MASTER,"1");v.put(BackGestureIconPolicy.ENABLED,"1");
  for(String key:BackGestureIconPolicy.parameterKeys())v.put(key,key.endsWith("asset")?"":key.endsWith("scale_percent")?"100":"0");return v;}
 static BackGestureRuntimeObservation ack(Map<String,String> v,boolean committed,int loaded){return BackGestureRuntimeObservation.create(73,v::get,8,531,20454,1200,100,committed,loaded);}
 static boolean confirms(BackGestureRuntimeObservation a,Map<String,String> v){return a.confirms(73,v::get,20454,531,100,1100,1300);}
 static void observation(){
  Map<String,String> v=base();String signature=BackGestureRuntimeObservation.signature(v::get);
  check(v.size()==20,"all twenty runtime controls are represented");
  for(String key:new ArrayList<>(v.keySet())){Map<String,String> changed=new LinkedHashMap<>(v);changed.put(key,v.get(key)+"x");
   check(!signature.equals(BackGestureRuntimeObservation.signature(changed::get)),"full signature includes "+key);}
  Map<String,String> reordered=new LinkedHashMap<>();List<String> keys=new ArrayList<>(v.keySet());Collections.reverse(keys);for(String key:keys)reordered.put(key,v.get(key));
  check(signature.equals(BackGestureRuntimeObservation.signature(reordered::get)),"signature is independent of map iteration order");
  reordered.put("unrelated","changed");check(signature.equals(BackGestureRuntimeObservation.signature(reordered::get)),"unrelated controls do not change the parameter signature");
  check(confirms(ack(v,true,0),v),"stock resources need no fake asset mask");
  check(BackGestureRuntimeObservation.parse(ack(v,true,0).serialize())!=null,"observation round trip");
  check(!confirms(ack(v,false,0),v),"loading cannot acknowledge stock ready");
  v.put(BackGestureIconPolicy.key(1,"background_asset"),"a".repeat(64));
  check(BackGestureRuntimeObservation.requiredMask(v::get)==8,"background-only is a required resource");
  check(ack(v,true,0).phase.equals("fallback")&&!confirms(ack(v,true,0),v),"missing background-only resource cannot pass ready");
  check(confirms(ack(v,true,8),v),"background-only ready");
  v.put(BackGestureIconPolicy.key(0,"mode"),"1");v.put(BackGestureIconPolicy.key(0,"asset"),"b".repeat(64));
  v.put(BackGestureIconPolicy.key(0,"background_asset"),"c".repeat(64));v.put(BackGestureIconPolicy.key(1,"mode"),"1");v.put(BackGestureIconPolicy.key(1,"asset"),"d".repeat(64));
  check(BackGestureRuntimeObservation.requiredMask(v::get)==15,"independent side icon/wave bits");
  for(int mask=0;mask<15;mask++)check(!confirms(ack(v,true,mask),v),"partial resource mask rejected: "+mask);
  BackGestureRuntimeObservation ready=ack(v,true,15);check(confirms(ready,v),"all resources ready");
  check(!ready.confirms(74,v::get,20454,531,100,1100,1300),"old revision rejected");
  check(!ready.confirms(73,v::get,20453,531,100,1100,1300),"old loaded build rejected");
  check(!ready.confirms(73,v::get,20454,532,100,1100,1300),"different process rejected");
  check(!ready.confirms(73,v::get,20454,531,99,1100,1300),"reused pid with different process start rejected");
  check(!ready.confirms(73,v::get,20454,531,100,1201,1300),"ready predating this save rejected");
  check(!ready.confirms(73,v::get,20454,531,100,1100,1199),"future elapsed rejected");
  Map<String,String> geometry=new LinkedHashMap<>(v);geometry.put(BackGestureIconPolicy.key(0,"opacity_percent"),"35");
  check(!confirms(ready,geometry),"old resources text cannot certify new geometry");
  v.put(BackGestureIconPolicy.ENABLED,"0");BackGestureRuntimeObservation disabled=ack(v,true,0);
  check(disabled.phase.equals("disabled")&&disabled.requiredMask==0&&confirms(disabled,v),"disabled values are freshly acknowledged with zero loaded assets");
  check(!confirms(ready,v),"previous ready rejected after disabling");
  for(String raw:new String[]{"",null,"BG1",ready.serialize()+";extra",ready.serialize().replace(";ready;",";unknown;"),
    ready.serialize().replace(";8;531;",";0;531;"),ready.serialize().replace(";1200;100;",";99;100;"),
    ready.serialize().replace(";15;15",";0;15"),disabled.serialize().replace(";disabled;0;0",";disabled;1;0")})
   check(BackGestureRuntimeObservation.parse(raw)==null,"malformed or internally contradictory observation rejected");
 }
 static BackGestureProbeTimeline probe(BackGestureProbeTimeline.Input input){return new BackGestureProbeTimeline(TestGestureObservation::now,TestGestureObservation::sleep,input,1,200,500);}
 static BackGestureProbeTimeline recorded(long movementEnd){
  BackGestureProbeTimeline p=probe((d,t,a,x,y)->true);p.down=1000;p.movesCompleted=movementEnd;
  for(int i=0;i<=8;i++){BackGestureProbeTimeline.Event e=new BackGestureProbeTimeline.Event(i==0?0:2,1000,1000+i*BackGestureProbeTimeline.MOVE_STEP_MILLIS,1,500);
   e.accepted=true;e.returned=i==8?movementEnd:e.time;p.events.add(e);}
  BackGestureProbeTimeline.Event cancel=new BackGestureProbeTimeline.Event(3,1000,1344,200,500);
  cancel.accepted=true;cancel.returned=1345;p.events.add(cancel);p.cancelEvent=cancel;p.cancelling.set(true);p.cancelled.countDown();return p;
 }
 static BackGestureProbeTimeline waiting(AtomicLong clock,long movementEnd,long wakeDelay){
  BackGestureProbeTimeline p=new BackGestureProbeTimeline(clock::get,millis->clock.addAndGet(millis+wakeDelay),(d,t,a,x,y)->true,1,200,500);
  p.down=1000;p.movesCompleted=movementEnd;return p;
 }
 static void timing()throws Exception {
  check(BackGestureProbeTimeline.DEADLINE_MILLIS==350,"probe deadline stays below the ROM 450 ms hover threshold");
  check(BackGestureProbeTimeline.INPUT_CADENCE.equals("gesture-r2-8x5-first180-second295"),"new cadence is explicitly labelled, not equivalent to older captures");
  check(BackGestureProbeTimeline.FIRST_SAMPLE_MILLIS==180&&BackGestureProbeTimeline.SECOND_SAMPLE_MILLIS==295,"r2 earlier first target preserves second-frame budget");
  check(BackGestureProbeTimeline.MOVE_COUNT==8&&BackGestureProbeTimeline.MOVE_STEP_MILLIS==5,"r2 keeps eight spatial steps but changes their target cadence to5ms");
  check(BackGestureProbeTimeline.MIN_STATIONARY_MILLIS==120,"actual last MOVE completion still gets the full fade interval");
  check(BackGestureProbeTimeline.SECOND_CAPTURE_BUDGET_MILLIS==43&&BackGestureProbeTimeline.CANCEL_RESERVE_MILLIS==8,"observed43ms capture plus3ms gap and5ms native completion reserved");
  check(BackGestureProbeTimeline.firstSampleAt(1000,1040)==1180,"absolute180ms floor after on-time movement");
  check(BackGestureProbeTimeline.firstSampleAt(1000,1060)==1180&&BackGestureProbeTimeline.firstSampleAt(1000,1061)==1181,"120ms stationary bound crosses absolute floor exactly");
  AtomicLong virtual=new AtomicLong(1120);BackGestureProbeTimeline wait=waiting(virtual,1071,0);
  check(wait.awaitFirstSample()&&virtual.get()==1191,"late MOVE extends settle instead of shortening it");
  virtual.set(1120);check(waiting(virtual,1099,0).awaitFirstSample()&&virtual.get()==1219,"last potentially feasible instantaneous first sample retains51ms second/cancel budget");
  virtual.set(1120);check(!waiting(virtual,1100,0).awaitFirstSample()&&virtual.get()==1120,"late MOVE cannot fit even an instantaneous first capture");
  virtual.set(1120);check(!waiting(virtual,1056,40).awaitFirstSample()&&virtual.get()==1220,"scheduler oversleep cannot steal second/cancel reserve");
  virtual.set(1120);check(!waiting(virtual,0,0).awaitFirstSample()&&virtual.get()==1120,"missing MOVE completion cannot start capture");
  wait=waiting(virtual,1056,0);wait.cancelling.set(true);check(!wait.awaitFirstSample(),"cancelled input cannot start capture");
  BackGestureProbeTimeline exact=recorded(1071);
  check(exact.invalidReason(1191,1219,1299,1342)==null,"full120ms after lateMOVE with28/43ms captures fits injectiondeadline");
  check(exact.invalidReason(1190,1219,1299,1342)!=null,"119ms actualsettle rejected independently of180msfloor");
  check(recorded(1040).invalidReason(1179,1217,1297,1340)!=null,"179ms firstsample rejected even after139msstationary");
  check(recorded(1060).invalidReason(1180,1213,1295,1338)==null,"r2 exact120ms stationary and observed33ms first capture fit unchanged second budget");
  check(recorded(1061).invalidReason(1180,1213,1295,1338)!=null,"native-like late61ms completion cannot be assumed to fit180ms first target");
  check(BackGestureProbeTimeline.secondSampleFits(1000,1213,1213),"180to213 firstcapture leaves295to338 secondcapture plus12ms beforedeadline");
  check(!BackGestureProbeTimeline.secondSampleFits(1000,1223,1223),"actual113422 completion223 remains ineligible under r2");
  check(recorded(1190).invalidReason(1190,1218,1298,1341)!=null,"blocked finalMOVE cannot certify nominaltarget");
  check(BackGestureProbeTimeline.secondSampleFits(1000,1219,1219),"219ms is last firstcompletion with43+8reserve");
  check(!BackGestureProbeTimeline.secondSampleFits(1000,1220,1220),"220ms firstcompletion must stop");
  check(!BackGestureProbeTimeline.secondSampleFits(1000,1218,1300),"300ms scheduler arrival exceeds51msreserve");
  check(BackGestureProbeTimeline.secondSampleAt(1000,1210)==1295&&BackGestureProbeTimeline.secondSampleAt(1000,1219)==1299,"295floor and actual80msgap both apply");
  check(BackGestureProbeTimeline.secondSampleFits(1000,1218,1218),"190..218ms capture leaves298..341ms secondframe");
  check(recorded(1056).invalidReason(1190,1218,1298,1341)==null,"observed candidate190/218/298/341/344 injectionsequence fits");
  long delayedFirst=BackGestureProbeTimeline.firstSampleAt(1000,1074);
  check(delayedFirst==1194&&!BackGestureProbeTimeline.secondSampleFits(1000,delayedFirst+36,delayedFirst+36),"74msMOVE latency plus36mscapture remains inconclusive");
  check(!BackGestureProbeTimeline.secondSampleFits(1000,1236,1236),"old236ms firstcompletion still rejected");
  virtual.set(1210);check(waiting(virtual,1056,0).awaitSecondSample(1210)&&virtual.get()==1295,"secondwait reaches295msfloor");
  virtual.set(1210);check(!waiting(virtual,1056,5).awaitSecondSample(1210)&&virtual.get()==1300,"secondwait oversleep cannot take nativecancelreserve");
  check(recorded(1056).invalidReason(1190,1210,1294,1337)!=null,"294ms secondframe rejected even with84msgap");
  check(BackGestureProbeTimeline.nativeCancelReason(1000,1346,1349)==null,"candidate native346..349 completion fits");
  check(BackGestureProbeTimeline.nativeCancelReason(1000,1348,1350)==null,"native return exactly350 is allowed");
  check(String.valueOf(BackGestureProbeTimeline.nativeCancelReason(1000,1348,1351)).contains("returned"),"actual104634 native351 must reject despite injectionACK347");
  check(String.valueOf(BackGestureProbeTimeline.nativeCancelReason(1000,1351,1352)).contains("received"),"late receive distinguished from late return");
  check(BackGestureProbeTimeline.nativeCancelReason(1000,1348,1347)!=null&&BackGestureProbeTimeline.nativeCancelReason(1000,0,0)!=null&&BackGestureProbeTimeline.nativeCancelReason(0,0,0)!=null,"missing/reversed nativecompletion cannot pass");
  check(BackGestureProbeTimeline.stableIdle(50,10000)&&!BackGestureProbeTimeline.stableIdle(51,10000),"idle threshold is measured at 0.5 percent");
  check(!BackGestureProbeTimeline.stableIdle(0,0)&&!BackGestureProbeTimeline.stableIdle(-1,100)&&!BackGestureProbeTimeline.stableIdle(101,100),"invalid idle observations cannot pass");
  BackGestureProbeTimeline.IdleWindow idle=new BackGestureProbeTimeline.IdleWindow();
  check(!idle.observe(0,10000),"one stable idle pair is insufficient");check(idle.observe(0,10000),"two stable adjacent pairs accepted");
  check(!idle.observe(600,10000)&&idle.consecutive==0,"background motion resets the stable window");
  check(!idle.observe(0,10000)&&idle.observe(0,10000),"two fresh stable pairs required after motion");
  AtomicLong cadenceClock=new AtomicLong(1000);
  BackGestureProbeTimeline cadence=new BackGestureProbeTimeline(cadenceClock::get,cadenceClock::addAndGet,
    (d,t,a,x,y)->{if(a==0)cadenceClock.addAndGet(10);return true;},1,200,500);
  try{cadence.begin();
   check(cadence.events.size()==9&&cadence.movesCompleted==1040,"actual scheduler sends eight moves by40ms despite10ms DOWN ACK");
   check(cadence.events.get(1).time==1010&&cadence.events.get(2).time==1010,"late first target catches up without pretending injected events were received natively");
   for(int i=3;i<=8;i++)check(cadence.events.get(i).time==1000+i*5,"later targets use actual five-ms cadence step"+i);
   check(cadence.events.get(8).x==200,"changed cadence preserves the physical destination");
  }finally{check(cadence.finish(),"r2 deterministic scheduler always cancels");}
  virtual.set(1223);BackGestureProbeTimeline lateCapture=waiting(virtual,1040,0);
  check(!lateCapture.awaitSecondSample(1223)&&virtual.get()==1223,"113422 first capture cannot wait for an impossible second sample");
  check(lateCapture.finish()&&lateCapture.cancelEvent.time==1223&&lateCapture.events.size()==1,"budget refusal cancels immediately without later MOVE/UP");
  BackGestureProbeTimeline normal=probe((d,t,a,x,y)->true);normal.begin();check(normal.awaitFirstSample(),"first sample waits after native fade within deadline");
  long first=now();sleep(6);long firstEnd=now();check(normal.awaitSecondSample(firstEnd),"second frame has a measured budget");long second=now();sleep(6);long secondEnd=now();sleep(3);
  check(normal.finish(),"normal CANCEL completes");check(normal.invalidReason(first,firstEnd,second,secondEnd)==null,"real short timeline is eligible for separate pixel checks");
  check(normal.events.size()==10,"DOWN + eight MOVE + CANCEL, memory records only");
  check(normal.events.stream().noneMatch(e->e.action==1),"probe never sends UP");
  check(normal.invalidReason(first,firstEnd,second,normal.cancelEvent.time)!=null,"capture ending at cancellation is not observed");
  check(normal.invalidReason(first,firstEnd,firstEnd+79,secondEnd)!=null,"insufficient stable-sample separation rejected");
  check(normal.invalidReason(normal.down+179,firstEnd,second,secondEnd)!=null,"pre-target first frame cannot certify new timing");
  BackGestureProbeTimeline stalledScreenshot=probe((d,t,a,x,y)->true);stalledScreenshot.begin();long capture=now();sleep(380);long captureEnd=now();
  check(stalledScreenshot.cancelled.getCount()==0,"watchdog cancels independently while caller is blocked in screenshot");
  check(stalledScreenshot.cancelEvent.time<captureEnd,"CANCEL does not wait for screenshot return");
  check(stalledScreenshot.finish(),"stalled screenshot still cleaned up");
  check(stalledScreenshot.invalidReason(capture,captureEnd,captureEnd+80,captureEnd+90)!=null,"cross-deadline screenshots can never pass");
  AtomicInteger moves=new AtomicInteger(),cancels=new AtomicInteger();
  BackGestureProbeTimeline stalledMove=probe((d,t,a,x,y)->{if(a==2&&moves.incrementAndGet()==1)sleep(450);if(a==3)cancels.incrementAndGet();return true;});
  stalledMove.begin();check(stalledMove.cancelled.getCount()==0,"watchdog injects CANCEL while a MOVE call is blocked");
  check(stalledMove.finish(),"late movement gets a final cleanup CANCEL");
  check(moves.get()==1&&cancels.get()==2,"no chained moves after deadline; late event cleaned up");
  check(stalledMove.invalidReason(1,2,82,83)!=null,"a stalled injection cannot certify a short gesture");
  BackGestureProbeTimeline early=probe((d,t,a,x,y)->true);boolean threw=false,cleaned=false;
  try{early.begin();throw new IllegalStateException("test early screenshot failure");}catch(IllegalStateException expected){threw=true;}finally{cleaned=early.finish();}
  check(threw&&cleaned&&early.cancelEvent!=null&&early.cancelEvent.accepted,"early capture throw still owns CANCEL cleanup");
  check(early.events.stream().noneMatch(e->e.action==1),"early throw never injects UP");
  BackGestureProbeTimeline rejection=probe((d,t,a,x,y)->a!=3);rejection.begin();
  check(!rejection.finish(),"rejected CANCEL requires aborting the suite, not next case");
  BackGestureProbeTimeline error=probe((d,t,a,x,y)->{if(a==2)throw new IllegalStateException("test injection error");return true;});error.begin();
  check(error.finish(),"input exception still cancels");check(error.invalidReason(1,2,82,83)!=null,"input exception never passes");
 }
 public static void main(String[] args)throws Exception{observation();timing();System.out.println("PASS exact back-gesture observations and independent deadline: "+checks+" checks");}
}
'''

def run(overrides=None, expect_assertion=False):
    jdk = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
    sources = {
        'BackGestureIconPolicy.java': (MAIN / 'BackGestureIconPolicy.java').read_text(encoding='utf-8'),
        'BackGestureRuntimeObservation.java': (MAIN / 'BackGestureRuntimeObservation.java').read_text(encoding='utf-8'),
        'BackGestureProbeTimeline.java': (TEST / 'BackGestureProbeTimeline.java').read_text(encoding='utf-8'),
        'ConfigSchema.java': 'package ls.augment.com;final class ConfigSchema {static final String SYSTEMUI_MASTER="ls_augment_systemui_enabled";}',
        'TestGestureObservation.java': JAVA,
    }
    sources.update(overrides or {})
    with tempfile.TemporaryDirectory(prefix='lsa-back-observation-') as temp:
        paths = []
        for name, source in sources.items():
            path = Path(temp) / name
            path.write_text(source, encoding='utf-8')
            paths.append(str(path))
        subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '--release', '17', '-d', temp, *paths], check=True)
        result=subprocess.run([str(jdk / 'java'), '-cp', temp, 'ls.augment.com.TestGestureObservation'],capture_output=True,text=True,encoding='utf-8',timeout=20)
        if expect_assertion:
            assert result.returncode and 'AssertionError' in result.stderr, result.stdout+result.stderr
            return result.stderr.splitlines()[0]
        print(result.stdout,end='')
        if result.returncode:
            print(result.stderr)
            result.check_returncode()

def replace_once(source,before,after):
    assert source.count(before)==1, before
    return source.replace(before,after)

def mutations():
    observation=(MAIN/'BackGestureRuntimeObservation.java').read_text(encoding='utf-8')
    timeline=(TEST/'BackGestureProbeTimeline.java').read_text(encoding='utf-8')
    cases=[
        ('revision','BackGestureRuntimeObservation.java',observation,'revision==expectedRevision&&',''),
        ('full-parameter-signature','BackGestureRuntimeObservation.java',observation,'&&signature.equals(signature(values))',''),
        ('loaded-build','BackGestureRuntimeObservation.java',observation,'&&build==expectedBuild',''),
        ('save-freshness','BackGestureRuntimeObservation.java',observation,'&&elapsed>=notBefore',''),
        ('background-only-resource','BackGestureRuntimeObservation.java',observation,'if(BackGestureIconPolicy.validAsset(setting.backgroundHash))result|=2<<(side*2);',''),
        ('independent-deadline','BackGestureProbeTimeline.java',timeline,'if(remaining<=0||!cancelled.await(remaining,TimeUnit.MILLISECONDS))cancel();','cancelled.await(1000,TimeUnit.MILLISECONDS);'),
        ('cross-cancel-screenshot','BackGestureProbeTimeline.java',timeline,'if(firstEnd>=cancelEvent.time||secondEnd>=cancelEvent.time||secondEnd-down>=DEADLINE_MILLIS)','if(false)'),
        ('slow-second-budget','BackGestureProbeTimeline.java',timeline,'return earliest+SECOND_CAPTURE_BUDGET_MILLIS+CANCEL_RESERVE_MILLIS<=down+DEADLINE_MILLIS;','return true;'),
        ('first-fade-floor','BackGestureProbeTimeline.java',timeline,'||firstStart<down+FIRST_SAMPLE_MILLIS',''),
        ('actual-move-settle-floor','BackGestureProbeTimeline.java',timeline,'firstStart<movesCompleted+MIN_STATIONARY_MILLIS','firstStart<movesCompleted'),
        ('actual-move-sample-target','BackGestureProbeTimeline.java',timeline,'return Math.max(down+FIRST_SAMPLE_MILLIS,movesCompleted+MIN_STATIONARY_MILLIS);','return down+FIRST_SAMPLE_MILLIS;'),
        ('late-first-budget','BackGestureProbeTimeline.java',timeline,'if(!secondSampleFits(down,target,clock.getAsLong()))return false;',''),
        ('first-wakeup-budget','BackGestureProbeTimeline.java',timeline,'return !cancelling.get()&&secondSampleFits(down,clock.getAsLong(),clock.getAsLong());','return !cancelling.get();'),
        ('second-target-floor','BackGestureProbeTimeline.java',timeline,'return Math.max(down+SECOND_SAMPLE_MILLIS,firstEnd+SAMPLE_GAP_MILLIS);','return firstEnd+SAMPLE_GAP_MILLIS;'),
        ('second-wakeup-budget','BackGestureProbeTimeline.java',timeline,'return !cancelling.get()&&secondSampleFits(down,firstEnd,clock.getAsLong());','return !cancelling.get();'),
        ('native-cancel-receive-deadline','BackGestureProbeTimeline.java',timeline,'if(received-down>DEADLINE_MILLIS)','if(false)'),
        ('native-cancel-return-deadline','BackGestureProbeTimeline.java',timeline,'if(returned-down>DEADLINE_MILLIS)','if(false)'),
        ('idle-background-budget','BackGestureProbeTimeline.java',timeline,'changed*1000L<=area*5L','changed*1000L<=area*50L'),
        ('two-idle-pairs','BackGestureProbeTimeline.java',timeline,'return consecutive>=2;','return consecutive>=1;'),
    ]
    for name,path,source,before,after in cases:
        result=run({path:replace_once(source,before,after)},expect_assertion=True)
        print('KILLED',name,result)
    spec=importlib.util.spec_from_file_location('gesture_runtime',ROOT/'tools/test-back-gesture-runtime.py')
    runtime=importlib.util.module_from_spec(spec);spec.loader.exec_module(runtime)
    hook=(MAIN/'hook/BackGestureIconHook.java').read_text(encoding='utf-8')
    cases=[
        ('same-parameters-new-revision','if(signature.equals(key)){publishObservation();return;}','if(signature.equals(key))return;'),
        ('disabled-ack','ready=next;publishObservation();return;','ready=next;return;'),
        ('new-snapshot-old-resources','&&state.parameterSignature.equals(BackGestureRuntimeObservation.parameterSignature(current::get))',''),
        ('late-worker-commit','MAIN.post(()->{\n                if(token!=generation)return;\n                ready=next;','MAIN.post(()->{\n                ready=next;'),
        ('late-retry','if(token==generation){signature="";refresh();}','{signature="";refresh();}'),
    ]
    for name,before,after in cases:
        result=runtime.run({'hook/BackGestureIconHook.java':replace_once(hook,before,after)},expect_assertion=True)
        print('KILLED',name,result)

if __name__ == '__main__':
    run()
    if '--mutations' in sys.argv:
        mutations()
