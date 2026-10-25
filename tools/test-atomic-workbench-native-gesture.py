"""Run the actual native-gesture Provider methods with controlled Binder/time boundaries."""
from pathlib import Path
import runpy
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-presentation.py")))
SUPPORT, MEMBER = BASE["SUPPORT"], BASE["MEMBER"]
SOURCE = (SUPPORT["SRC"] / "AtomicWorkbenchProvider.java").read_text(encoding="utf-8")
FILES = dict(BASE["PROVIDER"])
HEAD = r'''package ls.augment.com;import android.content.*;import android.content.pm.*;import android.os.*;import android.os.Process;
public final class AtomicWorkbenchProvider {
 static Pending pending;static Bundle gestureTarget,nativeGesture;static long nativeGestureSeen;
 static final long GESTURE_TARGET_MAX_AGE_MS=2500L;
 static class Pending {final int uid=10055,userId=0;final long startedAt=SystemClock.elapsedRealtime(),resetGeneration=ResetWriteFence.generation();final Binder endpoint=new Binder(),owner=new Binder();}
 Context getContext(){return new Context();}
 Bundle call(String method,String arg,Bundle extras){return "gesture_target".equals(method)?readGestureTarget(arg,extras):controlNativeGesture(arg,extras);}
'''
TEST = r'''
 static int cases,checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 interface Case{void run();}static void test(Case c){pending=null;gestureTarget=nativeGesture=null;SystemClock.now+=100000;ResetWriteFence.generation=1;ResetWriteFence.blocked=false;Binder.caller=10066;PackageManager.homeUid=10066;c.run();cases++;}
 static void denied(Case c){boolean rejected=false;try{c.run();}catch(SecurityException|IllegalArgumentException expected){rejected=true;}check(rejected,"invalid caller/shape accepted");}
 static class Fixture {AtomicWorkbenchProvider provider=new AtomicWorkbenchProvider();Pending owner=new Pending();Fixture(){pending=owner;publish();}void publish(){publishGestureTarget(owner,9,2,77,"unique");}
 Bundle request(){Bundle b=new Bundle(gestureTarget);b.remove("active");b.remove("updated_elapsed");b.putLong("down_time",SystemClock.uptimeMillis());return b;}
 boolean edge(String action,Bundle request){return provider.call("native_gesture",action,request).getBoolean("success");}}
 public static void main(String[] args){
 test(()->{Fixture f=new Fixture();Bundle b=f.request();check(f.edge("begin",b)&&nativeGestureActive(f.owner),"matching native DOWN did not defer");check(f.edge("end",b)&&!nativeGestureActive(f.owner),"matching UP did not release");});
 test(()->{Fixture f=new Fixture();Bundle b=f.request();for(int uid:new int[]{0,10077,110066}){Binder.caller=uid;denied(()->f.edge("begin",b));}check(!nativeGestureActive(f.owner),"foreign caller created lease");});
 test(()->{Fixture f=new Fixture();Bundle b=f.request();PackageManager.homeUid=10077;denied(()->f.edge("begin",b));});
 test(()->{for(String key:new String[]{"session","display_id","window_id","host_task_id","owner_uid","user","display_unique_id"}){Fixture f=new Fixture();Bundle b=f.request();if(key.equals("session"))b.putLong(key,-1);else if(key.equals("display_unique_id"))b.putString(key,"reused");else b.putInt(key,-1);check(!f.edge("begin",b)&&!nativeGestureActive(f.owner),"wrong identity accepted: "+key);}});
 test(()->{Fixture f=new Fixture();Bundle b=f.request();b.putLong("display_id",9);check(!f.edge("begin",b),"numeric identity coercion accepted");b=f.request();b.putInt("down_time",1);Bundle invalid=b;denied(()->f.edge("begin",invalid));});
 test(()->{Fixture f=new Fixture();Bundle b=f.request();b.putBoolean("unknown",true);denied(()->f.edge("begin",b));denied(()->f.edge("unknown",f.request()));denied(()->f.edge("begin",null));});
 test(()->{Fixture f=new Fixture();Bundle b=f.request();b.putLong("down_time",SystemClock.now+1);check(!f.edge("begin",b),"future DOWN accepted");b.putLong("down_time",SystemClock.now-1501);check(!f.edge("begin",b),"old DOWN accepted");});
 test(()->{Fixture f=new Fixture();Bundle old=f.request();check(f.edge("begin",old),"old start failed");SystemClock.now++;Bundle newer=f.request();check(f.edge("begin",newer),"new DOWN did not replace old stream");check(!f.edge("end",old)&&nativeGestureActive(f.owner),"old UP retired new stream");check(f.edge("end",newer),"new UP failed");});
 test(()->{Fixture f=new Fixture();check(f.edge("begin",f.request()),"start failed");f.publish();check(nativeGestureActive(f.owner),"same-slot status refresh cancelled gesture");publishGestureTarget(f.owner,10,3,77,"new-unique");check(!nativeGestureActive(f.owner),"role change retained gesture");});
 test(()->{Fixture f=new Fixture();check(f.edge("begin",f.request()),"start failed");clearGestureTarget(f.owner);check(!nativeGestureActive(f.owner),"exit/dialog clear retained gesture");});
 test(()->{Fixture f=new Fixture();Bundle b=f.request();check(f.edge("begin",b),"start failed");Pending old=f.owner;SystemClock.now++;Fixture next=new Fixture();check(next.edge("begin",next.request()),"new owner start failed");check(!nativeGestureActive(old)&&nativeGestureActive(next.owner),"retired owner cleared current gesture");check(!f.edge("end",b)&&nativeGestureActive(next.owner),"old session UP retired new owner");});
 test(()->{Fixture f=new Fixture();check(f.edge("begin",f.request()),"start failed");f.owner.endpoint.alive=false;check(!nativeGestureActive(f.owner),"dead Root retained deferral");});
 test(()->{Fixture f=new Fixture();check(f.edge("begin",f.request()),"start failed");ResetWriteFence.generation++;check(!nativeGestureActive(f.owner),"reset retained deferral");});
 test(()->{Fixture f=new Fixture();check(f.edge("begin",f.request()),"start failed");SystemClock.now+=30001;f.publish();check(!nativeGestureActive(f.owner),"missing END did not expire");});
 test(()->{Fixture f=new Fixture();check(f.edge("begin",f.request()),"start failed");for(int i=0;i<20;i++){SystemClock.now+=2000;f.publish();check(f.provider.call("gesture_target",null,null).getBoolean("active")&&nativeGestureActive(f.owner),"live native stream lost its refresh");}clearGestureTarget(f.owner);check(!nativeGestureActive(f.owner),"refresh bypassed explicit retirement");});
 System.out.println("NATIVE GESTURE PROVIDER PASS "+cases+" cases / "+checks+" assertions");}}
'''

def main():
    names = ("static synchronized void publishGestureTarget(", "static synchronized void clearGestureTarget(",
             "private static boolean sameGestureTarget(", "static synchronized boolean nativeGestureActive(",
             "private Bundle controlNativeGesture(", "private Bundle readGestureTarget(")
    files = dict(FILES)
    files["ls/augment/com/AtomicWorkbenchProtocol.java"] = files["ls/augment/com/AtomicWorkbenchProtocol.java"].replace("WINDOW_COUNT=4", "WINDOW_COUNT=4,WINDOW_POOL_COUNT=8")
    files["ls/augment/com/AtomicWorkbenchProvider.java"] = HEAD + "\n".join(MEMBER(SOURCE, name) for name in names) + TEST
    files.pop("ls/augment/com/TestGestureProvider.java")
    with tempfile.TemporaryDirectory(prefix="lsa-native-gesture-") as temporary:
        SUPPORT["compile_run"](Path(temporary), files, [], "ls.augment.com.AtomicWorkbenchProvider")

if __name__ == "__main__":
    main()
