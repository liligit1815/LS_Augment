"""Exercise the real optional hook at the ROM's HOME/Overview pairing boundary."""
from pathlib import Path
import runpy
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-native-recents.py")))
SUPPORT, SOURCES = BASE["SUPPORT"], dict(BASE["SOURCES"])
SOURCES.pop("ls/augment/com/hook/TestNativeRecents.java")
SOURCES["com/android/quickstep/OverviewComponentObserver.java"] = SOURCES[
    "com/android/quickstep/OverviewComponentObserver.java"
].replace("public int nativeCalls;", "public boolean sameActivity=true;public int identityCalls;public boolean isHomeAndOverviewSameActivity(){identityCalls++;return sameActivity;}public int nativeCalls;")
SOURCES["com/android/quickstep/FallbackWindowInterface.java"] = '''package com.android.quickstep;
public class FallbackWindowInterface extends BaseContainerInterface {
 private final com.android.quickstep.fallback.window.RecentsWindowManager mRecentsWindowManager;
 public FallbackWindowInterface(android.content.Context c){activity=c;mRecentsWindowManager=(com.android.quickstep.fallback.window.RecentsWindowManager)c;}
 public com.android.quickstep.fallback.window.RecentsWindowManager getCreatedContainer(){return mRecentsWindowManager;}
}'''
SOURCES["com/android/quickstep/AbsSwipeUpHandler.java"] = SOURCES[
    "com/android/quickstep/AbsSwipeUpHandler.java"
].replace("public class AbsSwipeUpHandler {", "public class AbsSwipeUpHandler {public interface Factory {}")
SOURCES["com/android/quickstep/inputconsumers/OtherActivityInputConsumer.java"] = SOURCES[
    "com/android/quickstep/inputconsumers/OtherActivityInputConsumer.java"
].replace("public class OtherActivityInputConsumer {", "public class OtherActivityInputConsumer implements com.android.quickstep.InputConsumer {")
for path, body in {
    "com/android/quickstep/InputConsumer.java": "package com.android.quickstep;public interface InputConsumer {}",
    "com/android/quickstep/RecentsAnimationDeviceState.java": "package com.android.quickstep;public class RecentsAnimationDeviceState {public boolean canStart=true,blocked;}",
    "com/android/launcher3/taskbar/g3.java": "package com.android.launcher3.taskbar;public class g3 {}",
    "com/android/quickstep/OverviewCommandHelper.java": "package com.android.quickstep;public class OverviewCommandHelper {}",
    "com/android/quickstep/RotationTouchHelper.java": "package com.android.quickstep;public class RotationTouchHelper {}",
    "com/android/systemui/shared/system/InputMonitorCompat.java": "package com.android.systemui.shared.system;public class InputMonitorCompat {}",
    "com/android/systemui/shared/system/InputChannelCompat.java": "package com.android.systemui.shared.system;public class InputChannelCompat {public static class InputEventReceiver {}}",
    "com/android/quickstep/util/ActiveGestureLog.java": "package com.android.quickstep.util;public class ActiveGestureLog {public static class CompoundString {}}",
    "com/android/quickstep/inputconsumers/ResetGestureInputConsumer.java": "package com.android.quickstep.inputconsumers;public class ResetGestureInputConsumer implements com.android.quickstep.InputConsumer {}",
    "com/android/quickstep/inputconsumers/NavHandleLongPressInputConsumer.java": "package com.android.quickstep.inputconsumers;public class NavHandleLongPressInputConsumer implements com.android.quickstep.InputConsumer {public final com.android.quickstep.InputConsumer delegate;public NavHandleLongPressInputConsumer(com.android.quickstep.InputConsumer value){delegate=value;}}",
    "com/android/quickstep/ServiceChild.java": "package com.android.quickstep;public class ServiceChild extends TouchInteractionService {}",
    "com/android/quickstep/ObserverChild.java": "package com.android.quickstep;public class ObserverChild extends OverviewComponentObserver {}",
    "com/android/quickstep/FallbackChild.java": "package com.android.quickstep;public class FallbackChild extends FallbackWindowInterface {public FallbackChild(com.android.quickstep.fallback.window.RecentsWindowManager w){super(w);}}",
    "com/android/quickstep/MismatchedFallback.java": "package com.android.quickstep;public class MismatchedFallback extends FallbackWindowInterface {public MismatchedFallback(com.android.quickstep.fallback.window.RecentsWindowManager w){super(w);}public com.android.quickstep.fallback.window.RecentsWindowManager getCreatedContainer(){return new com.android.quickstep.fallback.window.RecentsWindowManager(88);}}",
}.items():
    SOURCES[path] = body

# The exact typed signatures are the capability boundary. The bodies reproduce
# the relevant native HOME child-task and admission branches, not gesture physics.
SOURCES["com/android/quickstep/InputConsumerUtils.java"] = '''package com.android.quickstep;
import android.content.Context;import android.view.MotionEvent;import java.util.function.*;
import com.android.launcher3.taskbar.g3;import com.android.systemui.shared.system.*;
import com.android.quickstep.util.ActiveGestureLog.CompoundString;import com.android.quickstep.inputconsumers.*;
public class InputConsumerUtils {
 public static InputConsumer newBaseConsumer(Context c,boolean unlocked,g3 taskbar,OverviewComponentObserver observer,
 RecentsAnimationDeviceState device,GestureState previous,GestureState gesture,TaskAnimationManager animation,
 InputMonitorCompat monitor,AbsSwipeUpHandler.Factory factory,Consumer callback,InputChannelCompat.InputEventReceiver receiver,
 MotionEvent event,CompoundString reason)throws Throwable {
  TouchInteractionService service=(TouchInteractionService)c;
  boolean same=(Boolean)service.module.invoke(observer,"isHomeAndOverviewSameActivity",new Class<?>[0]);
  if(device.blocked || gesture.running.top.type==2 && same)return new ResetGestureInputConsumer();
  return new OtherActivityInputConsumer();
 }
 public static InputConsumer newConsumer(Context c,boolean unlocked,OverviewComponentObserver observer,
 RecentsAnimationDeviceState device,GestureState previous,GestureState gesture,TaskAnimationManager animation,
 InputMonitorCompat monitor,AbsSwipeUpHandler.Factory factory,Consumer callback,InputChannelCompat.InputEventReceiver receiver,
 g3 taskbar,Function proxy,OverviewCommandHelper helper,MotionEvent event,RotationTouchHelper rotation)throws Throwable {
  InputConsumer value=device.canStart?newBaseConsumer(c,unlocked,taskbar,observer,device,previous,gesture,animation,monitor,factory,callback,receiver,event,null):new ResetGestureInputConsumer();
  return new NavHandleLongPressInputConsumer(value);
 }
}'''
service = SOURCES["com/android/quickstep/TouchInteractionService.java"]
service = service.replace("public GestureState gesture;", "public GestureState gesture;public InputConsumer selected;public Runnable selectionProbe;public RecentsAnimationDeviceState device=new RecentsAnimationDeviceState();")
service = service.replace("eventDisplay,null,null,info);", "eventDisplay,null,null,info);if(selectionProbe!=null)selectionProbe.run();selected=InputConsumerUtils.newConsumer(this,true,observer,device,new GestureState(),gesture,mRecentsDisplayModel.manager,null,null,null,null,null,null,null,(android.view.MotionEvent)e,null);")
assert "selected=InputConsumerUtils.newConsumer" in service
SOURCES["com/android/quickstep/TouchInteractionService.java"] = service

fixture_source = BASE["SOURCES"]["ls/augment/com/hook/TestNativeRecents.java"]
fixture = fixture_source[fixture_source.index(" static class F {"):fixture_source.index(" public static void main")]
fixture = fixture.replace('check(m.callbacks.size()==19,', 'check(m.callbacks.size()==19||m.callbacks.size()==20,')
fixture = fixture.replace('new TouchInteractionService()', 'new ServiceChild()')
SOURCES["ls/augment/com/hook/TestWindowHomeIdentity.java"] = '''package ls.augment.com.hook;
import android.app.*;import android.content.*;import android.os.*;import com.android.quickstep.*;import java.lang.reflect.*;
import com.android.quickstep.inputconsumers.*;
public class TestWindowHomeIdentity {
 static int cases,checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}interface Case{void run()throws Throwable;}static void test(String name,Case t)throws Throwable{t.run();cases++;System.out.println("PASS window HOME identity: "+name);}
''' + fixture + '''
 static void home(F f){f.s.activities.tasks.remove(f.home);f.s.activities.tasks.add(1,f.home);}
 static boolean same(F f,OverviewComponentObserver observer)throws Throwable{return (Boolean)f.m.invoke(observer,"isHomeAndOverviewSameActivity",new Class<?>[0]);}
 static InputConsumer leaf(F f){check(f.s.selected instanceof NavHandleLongPressInputConsumer,"native wrapper replaced");return ((NavHandleLongPressInputConsumer)f.s.selected).delegate;}
 public static void main(String[] args)throws Throwable {
 if(args.length>0){F f=new F();home(f);f.down();check(!f.m.ids.contains("atomic_workbench.recents.window_home_identity"),"unknown capability installed");check(f.s.selected!=null&&f.s.calls==1&&f.m.ids.contains("atomic_workbench.recents.gesture_identity"),"older route disabled");check(leaf(f) instanceof ResetGestureInputConsumer,"unknown selector no longer native");System.out.println("PASS missing/wrong window identity capability retains old native selection: "+args[0]);return;}
 test("HOME uses native window consumer without changing the native wrapper",()->{F f=new F();home(f);f.down();check(f.m.ids.contains("atomic_workbench.recents.window_home_identity"),"capability absent");check(leaf(f) instanceof OtherActivityInputConsumer,"HOME/window semantic mismatch still selects Reset");check(f.s.observer.identityCalls==0,"window predicate still reads physical launcher identity");check(same(f,f.s.observer),"identity leaked outside native dispatch");});
 test("native false remains false",()->{F f=new F();home(f);f.s.observer.sameActivity=false;f.down();check(leaf(f) instanceof OtherActivityInputConsumer&&!same(f,f.s.observer),"native false changed");});
 test("native admission and blocked-task Reset branches remain effective",()->{F denied=new F();home(denied);denied.s.device.canStart=false;denied.down();check(leaf(denied) instanceof ResetGestureInputConsumer,"gesture admission bypassed");F blocked=new F();home(blocked);blocked.s.device.blocked=true;blocked.down();check(leaf(blocked) instanceof ResetGestureInputConsumer,"gesture blocked task bypassed");});
 test("ordinary physical app and external VD stay native",()->{for(int source:new int[]{0,99}){F f=new F();home(f);f.host.topActivity=new ComponentName("other","other.Main");f.e.display=source;f.down();check(leaf(f) instanceof OtherActivityInputConsumer&&f.s.observer.identityCalls==1&&same(f,f.s.observer),"unowned gesture pairing changed");}});
 test("different observer or resource identity stays native",()->{for(int mode=0;mode<5;mode++){F f=new F();home(f);final int selected=mode;f.s.selectionProbe=()->{if(selected==0)f.s.mOverviewComponentObserver=new OverviewComponentObserver();if(selected==1)f.s.observer.mRecentsDisplayModel=new com.android.quickstep.fallback.window.RecentsDisplayModel();if(selected==2)f.s.mRecentsDisplayModel.fallback=new FallbackWindowInterface(new com.android.quickstep.fallback.window.RecentsWindowManager(88));if(selected==3)f.s.mRecentsDisplayModel.window.identity.unique="reused";if(selected==4)f.s.mRecentsDisplayModel.fallback=new MismatchedFallback(f.s.mRecentsDisplayModel.window);};f.down();check(leaf(f) instanceof ResetGestureInputConsumer,"unknown identity overridden: "+mode);}});
 test("failed route cannot override native identity",()->{F f=new F();home(f);f.s.selectionProbe=()->AtomicWorkbenchQuickstepInputHook.dispatchRoute().failure="revoked";f.down();check(leaf(f) instanceof ResetGestureInputConsumer,"failed route changed identity");});
 test("native subclasses retain typed inherited fields",()->{F f=new F();home(f);ObserverChild child=new ObserverChild();child.mContext=f.s;child.mRecentsDisplayModel=f.s.mRecentsDisplayModel;child.mDefaultDisplayContainerInterface=f.s.observer.mDefaultDisplayContainerInterface;f.s.observer=child;f.s.mOverviewComponentObserver=child;f.s.selectionProbe=()->{f.s.mRecentsDisplayModel.fallback=new FallbackChild(f.s.mRecentsDisplayModel.window);try{f.s.gesture.container=(BaseContainerInterface)f.m.invoke(child,"getContainerInterface",new Class<?>[]{int.class},88);}catch(Throwable failure){throw new RuntimeException(failure);}};f.down();check(leaf(f) instanceof OtherActivityInputConsumer,"subclass capabilities ignored");});
 test("exact native selector callers are deoptimized",()->{F f=new F();for(String name:new String[]{"newBaseConsumer","newConsumer"})check(f.m.deoptimized.stream().anyMatch(e->e.getDeclaringClass()==InputConsumerUtils.class&&e.getName().equals(name)),"selector left compiled: "+name);});
 System.out.println("WINDOW HOME IDENTITY RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    production = ["hook/AtomicWorkbenchQuickstepHook.java", "hook/AtomicWorkbenchQuickstepInputHook.java", "hook/AtomicWorkbenchQuickstepTargetHook.java", "hook/AtomicWorkbenchLauncherCrashHook.java"]
    variants = {"matched": dict(SOURCES)}
    for name, path, before, after in [
        ("missing_predicate", "com/android/quickstep/OverviewComponentObserver.java", "isHomeAndOverviewSameActivity()", "oldSameActivity()"),
        ("wrong_selector_signature", "com/android/quickstep/InputConsumerUtils.java", "RotationTouchHelper rotation", "Object rotation"),
        ("missing_container_field", "com/android/quickstep/FallbackWindowInterface.java", "mRecentsWindowManager", "oldWindow"),
    ]:
        variant = dict(SOURCES)
        variant[path] = variant[path].replace(before, after)
        if name == "missing_predicate":
            variant["com/android/quickstep/InputConsumerUtils.java"] = variant["com/android/quickstep/InputConsumerUtils.java"].replace('"isHomeAndOverviewSameActivity"', '"oldSameActivity"')
        variants[name] = variant
    for name, sources in variants.items():
        with tempfile.TemporaryDirectory(prefix="lsa-window-home-") as directory:
            SUPPORT["compile_run"](Path(directory), sources, production, "ls.augment.com.hook.TestWindowHomeIdentity", arguments=() if name == "matched" else (name,))


if __name__ == "__main__":
    main()
