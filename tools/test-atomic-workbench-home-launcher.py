"""Exercise authenticated native HOME Launcher selection and existing-view card isolation."""
from pathlib import Path
import runpy
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-window-home-identity.py")))
SUPPORT, SOURCES = BASE["SUPPORT"], dict(BASE["SOURCES"])
SOURCES.pop("ls/augment/com/hook/TestWindowHomeIdentity.java")
SOURCES["android/app/Activity.java"] = '''package android.app;
public class Activity extends android.content.Context {
 public int taskId=72;public boolean resumed=true,finishing,destroyed;public android.view.Display identity=new android.view.Display();
 public android.content.ComponentName component=new android.content.ComponentName("launcher","launcher.Home");
 public boolean isResumed(){return resumed;}public boolean isFinishing(){return finishing;}public boolean isDestroyed(){return destroyed;}
 public int getTaskId(){return taskId;}public android.content.ComponentName getComponentName(){return component;}public android.view.Display getDisplay(){return identity;}
}'''
SOURCES["android/view/View.java"] = '''package android.view;public class View {
 public int display=88;public boolean attached=true,focus=true;public Display identity=new Display();
 public Display getDisplay(){identity.id=display;return identity;}public boolean isAttachedToWindow(){return attached;}public boolean hasWindowFocus(){return focus;}
}'''
SOURCES["com/android/quickstep/fallback/window/RecentsWindowManager.java"] = SOURCES["com/android/quickstep/fallback/window/RecentsWindowManager.java"].replace("identity.id=d;", "identity.id=d;windowView.attached=false;")
SOURCES["com/android/quickstep/views/RecentsView.java"] = '''package com.android.quickstep.views;
public class RecentsView extends android.view.View {
 public android.content.Context mContainer;public java.util.List<?> chosen;public java.util.List<?> pending=java.util.List.of();public int clears,reloads;public boolean failReload,windowFlagDuringReload;
 public ls.augment.com.hook.AugmentModule module;
 public void setContentAlpha(float f){}public void applyLoadPlan(java.util.List<?> tasks){chosen=tasks;if(tasks.isEmpty())clears++;}
 public void reloadIfNeeded(boolean force)throws Throwable{if(force){reloads++;windowFlagDuringReload=(Boolean)module.invoke(com.android.quickstep.fallback.window.RecentsWindowFlags.Companion,"getEnableOverviewInWindow",new Class<?>[0]);if(failReload)throw new IllegalStateException("reload unavailable");module.invoke(this,"applyLoadPlan",new Class<?>[]{java.util.List.class},pending);}}
}'''
SOURCES["com/android/launcher3/uioverrides/QuickstepLauncher.java"] = '''package com.android.launcher3.uioverrides;
public class QuickstepLauncher extends android.app.Activity {
 public android.view.View root=new android.view.View(),drag=new android.view.View();
 public com.android.quickstep.views.RecentsView overview=new com.android.quickstep.views.RecentsView();
 public QuickstepLauncher(){overview.mContainer=this;}public android.view.View getOverviewPanel(){return overview;}
 public android.view.View getRootView(){return root;}public android.view.View getDragLayer(){return drag;}
}'''
SOURCES["com/android/quickstep/LauncherActivityInterface.java"] = '''package com.android.quickstep;
public class LauncherActivityInterface extends BaseContainerInterface {
 public boolean resumed=true;public com.android.launcher3.uioverrides.QuickstepLauncher replacement;public int createdCalls;public boolean replaceOnSecond;
 public com.android.launcher3.uioverrides.QuickstepLauncher getCreatedContainer(){createdCalls++;return replaceOnSecond&&createdCalls>1?replacement:(com.android.launcher3.uioverrides.QuickstepLauncher)activity;}
 public boolean isResumed(){return resumed;}
}'''
SOURCES["com/android/quickstep/LauncherChild.java"] = "package com.android.quickstep;public class LauncherChild extends LauncherActivityInterface {}"
SOURCES["com/android/launcher3/uioverrides/LauncherChild.java"] = "package com.android.launcher3.uioverrides;public class LauncherChild extends QuickstepLauncher {}"
SOURCES["com/android/quickstep/views/RecentsChild.java"] = "package com.android.quickstep.views;public class RecentsChild extends RecentsView {}"
SOURCES["com/android/quickstep/inputconsumers/OverviewInputConsumer.java"] = "package com.android.quickstep.inputconsumers;public class OverviewInputConsumer implements com.android.quickstep.InputConsumer {}"
SOURCES["com/android/quickstep/InputConsumerUtils.java"] = SOURCES["com/android/quickstep/InputConsumerUtils.java"].replace(
    'if(device.blocked || gesture.running.top.type==2 && same)return new ResetGestureInputConsumer();',
    'boolean resumed=gesture.container instanceof LauncherActivityInterface&&((LauncherActivityInterface)gesture.container).isResumed();if(device.blocked || gesture.running.top.type==2 && same&&!resumed)return new ResetGestureInputConsumer();if(resumed)return new OverviewInputConsumer();')
fixture_source = BASE["SOURCES"]["ls/augment/com/hook/TestWindowHomeIdentity.java"]
fixture = fixture_source[fixture_source.index(" static class F {"):fixture_source.index(" public static void main")]
SOURCES["ls/augment/com/hook/TestHomeLauncher.java"] = '''package ls.augment.com.hook;
import android.app.*;import android.content.*;import android.os.*;import com.android.quickstep.*;import java.lang.reflect.*;
import com.android.quickstep.inputconsumers.*;import com.android.launcher3.uioverrides.QuickstepLauncher;import com.android.quickstep.views.RecentsView;
public class TestHomeLauncher {
 static int cases,checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}interface Case{void run()throws Throwable;}static void test(String n,Case t)throws Throwable{t.run();cases++;System.out.println("PASS native HOME Launcher: "+n);}
 public static class Key{public int displayId,userId,id;Key(int d,int u,int i){displayId=d;userId=u;id=i;}}public static class Card{public Key key;Card(int d,int u,int i){key=new Key(d,u,i);}}public static class Group{public java.util.List<Card> tasks;Group(int d,int u,int i){tasks=java.util.List.of(new Card(d,u,i));}public java.util.List<Card> getTasks(){return tasks;}}
''' + fixture + '''
 static class H {F f=new F();QuickstepLauncher activity=new QuickstepLauncher();LauncherActivityInterface iface=new LauncherActivityInterface();H()throws Exception{home(f);activity.overview.module=f.m;iface.activity=activity;f.s.observer.mDefaultDisplayContainerInterface=iface;}void down()throws Throwable{f.down();}void cards(RecentsView v,java.util.List<?> cards)throws Throwable{f.m.invoke(v,"applyLoadPlan",new Class<?>[]{java.util.List.class},cards);}}
 public static void main(String[] args)throws Throwable{
 if(args.length>0){H h=new H();h.down();check(h.f.s.gesture.container instanceof FallbackWindowInterface,"missing Launcher capability did not preserve fallback");check(leaf(h.f) instanceof OtherActivityInputConsumer,"missing Launcher capability disabled existing HOME window consumer");check(!h.f.log("phase=home_launcher_ready"),"unknown native capability accepted");System.out.println("PASS missing/wrong native HOME capability: "+args[0]);return;}
 test("resumed focused HOME uses its real native Overview consumer",()->{H h=new H();h.down();check(h.f.log("phase=home_launcher_ready"),"typed native profile absent "+h.f.m.logs);check(h.f.s.gesture.container==h.iface&&leaf(h.f) instanceof OverviewInputConsumer,"same HOME stayed on repeat-HOME remote animation path");check(h.f.s.observer.identityCalls==1&&same(h.f,h.f.s.observer),"native HOME pairing was overridden");check(h.activity.overview.clears==2&&h.activity.overview.reloads==1&&!h.activity.overview.windowFlagDuringReload,"existing cards were not reset/reloaded with native Launcher flag");check(!h.f.s.mRecentsDisplayModel.window.windowView.attached,"HOME was presented in duplicate fallback window");});
 test("apps retain native window path despite a resumed HOME Activity",()->{H h=new H();h.f.s.activities.tasks.remove(h.f.app);h.f.s.activities.tasks.add(1,h.f.app);h.down();check(h.f.s.gesture.container instanceof FallbackWindowInterface&&leaf(h.f) instanceof OtherActivityInputConsumer,"app container changed");check(h.activity.overview.reloads==0,"app gesture modified launcher cards");});
 test("HOME identity mismatch and missing live UI retain existing fallback",()->{for(int mode=0;mode<17;mode++){H h=new H();switch(mode){case 0:h.activity.taskId++;break;case 1:h.activity.component=new ComponentName("other","other.Home");break;case 2:h.activity.displays.display.id=0;break;case 3:h.activity.identity.unique="reused";break;case 4:h.activity.resumed=false;break;case 5:h.iface.resumed=false;break;case 6:h.activity.finishing=true;break;case 7:h.activity.destroyed=true;break;case 8:h.activity.root.focus=false;break;case 9:h.activity.root.attached=false;break;case 10:h.activity.drag.display=0;break;case 11:h.activity.overview.identity.unique="reused";break;case 12:h.activity.overview.mContainer=new QuickstepLauncher();break;case 13:h.activity.overview.attached=false;break;case 14:h.f.home.userId=10;break;case 15:h.iface.replaceOnSecond=true;h.iface.replacement=new QuickstepLauncher();break;case 16:h.f.s.mOverviewComponentObserver=new OverviewComponentObserver();break;}h.down();check(h.f.s.gesture==null||!(h.f.s.gesture.container instanceof LauncherActivityInterface),"invalid native HOME selected: "+mode);check(h.activity.overview.reloads==0,"unverified HOME view changed: "+mode);}});
 test("typed native subclasses preserve inherited Launcher capabilities",()->{H h=new H();h.activity=new com.android.launcher3.uioverrides.LauncherChild();h.activity.overview=new com.android.quickstep.views.RecentsChild();h.activity.overview.mContainer=h.activity;h.activity.overview.module=h.f.m;h.iface=new com.android.quickstep.LauncherChild();h.iface.activity=h.activity;h.f.s.observer.mDefaultDisplayContainerInterface=h.iface;h.down();check(h.f.s.gesture.container==h.iface&&leaf(h.f) instanceof OverviewInputConsumer,"native subclasses rejected");});
 test("first forced reload filters VD user and host before native selection",()->{H h=new H();var mine=new Group(88,0,92);h.activity.overview.pending=java.util.List.of(new Group(0,0,1),new Group(88,10,2),new Group(88,0,91),mine);h.down();check(h.activity.overview.chosen.equals(java.util.List.of(mine)),"existing cached foreign cards survived registration");h.cards(h.activity.overview,java.util.List.of(new Group(99,0,4),mine));check(h.activity.overview.chosen.equals(java.util.List.of(mine)),"asynchronous reload escaped owner filtering");});
 test("same owner and session do not clear cards on every gesture",()->{H h=new H();h.down();h.f.e.action=1;h.down();h.f.e.action=0;h.f.e.down++;h.down();check(h.activity.overview.clears==2&&h.activity.overview.reloads==1,"repeat gesture reset live overview");});
 test("foreign native views retain their original task list",()->{H h=new H();h.down();RecentsView foreign=new RecentsView();foreign.mContainer=new QuickstepLauncher();var cards=java.util.List.of(new Group(0,0,1),new Group(99,10,2));h.cards(foreign,cards);check(foreign.chosen==cards,"unowned native view globally filtered");});
 test("revoked owner session clears its retained native cards",()->{H h=new H();h.down();h.f.s.resolver.target.putLong("session",13);h.cards(h.activity.overview,java.util.List.of(new Group(88,0,92)));check(h.activity.overview.chosen.isEmpty(),"retired HOME retained card authority");});
 test("HOME Launcher is never treated as window animation tail",()->{H h=new H();h.down();Field field=AtomicWorkbenchQuickstepTargetHook.class.getDeclaredField("WINDOWS");field.setAccessible(true);check(!((java.util.Map<?,?>)field.get(null)).containsKey(h.activity),"Activity registered as native window");});
 test("selected HOME keeps native window flag and synthetic semantics",()->{H h=new H();h.down();check((Boolean)h.f.m.invoke(h.f.s.gesture,"useSyntheticRecentsTransition",new Class<?>[0]),"HOME synthetic decision was forced to real");h.f.s.selectionProbe=()->{try{check(!(Boolean)h.f.m.invoke(com.android.quickstep.fallback.window.RecentsWindowFlags.Companion,"getEnableOverviewInWindow",new Class<?>[0]),"HOME native window flag overwritten");}catch(Throwable failure){throw new RuntimeException(failure);}};h.f.e.action=2;h.down();});
 test("native false HOME predicate remains false",()->{H h=new H();h.f.s.observer.sameActivity=false;h.down();check(leaf(h.f) instanceof OverviewInputConsumer&&!same(h.f,h.f.s.observer),"native false HOME pairing changed");});
 test("same Activity and view returned to phone restore native plans",()->{H h=new H();h.down();h.f.s.resolver.target.putBoolean("active",false);h.activity.displays.display.id=0;h.activity.identity.id=0;h.activity.overview.display=0;var nativeCards=java.util.List.of(new Group(0,0,501),new Group(99,10,502));h.cards(h.activity.overview,nativeCards);check(h.activity.overview.chosen==nativeCards,"returned physical HOME remained bound to old VD");Field field=AtomicWorkbenchQuickstepTargetHook.class.getDeclaredField("LAUNCHER_VIEWS");field.setAccessible(true);check(!((java.util.Map<?,?>)field.get(null)).containsKey(h.activity.overview),"returned native owner lease retained");h.cards(h.activity.overview,nativeCards);check(h.activity.overview.chosen==nativeCards,"physical native reload was cleared again");});
 test("old route callback cannot retire a newer owner registration",()->{H h=new H();h.down();Object old=h.f.s.gesture;h.f.e.action=1;h.down();h.f.s.resolver.target.putLong("session",13);h.f.e.action=0;h.f.e.down++;h.down();check(h.f.s.gesture!=old&&h.f.s.gesture.container==h.iface,"new owner session was not selected");var mine=new Group(88,0,92);h.cards(h.activity.overview,java.util.List.of(new Group(0,0,1),mine));check(h.activity.overview.chosen.equals(java.util.List.of(mine)),"old route retired or escaped the current filter");Field field=AtomicWorkbenchQuickstepTargetHook.class.getDeclaredField("LAUNCHER_VIEWS");field.setAccessible(true);Object registration=((java.util.Map<?,?>)field.get(null)).get(h.activity.overview);Field routeField=registration.getClass().getDeclaredField("route");routeField.setAccessible(true);check(((AtomicWorkbenchQuickstepInputHook.Route)routeField.get(registration)).session==13,"new registration was replaced with old route");});
 test("native reload failure restores fallback selection before admission",()->{H h=new H();h.activity.overview.failReload=true;h.down();check(h.f.s.gesture.container instanceof FallbackWindowInterface&&leaf(h.f) instanceof OtherActivityInputConsumer,"native reload failure left partial Launcher selection");});
 System.out.println("HOME LAUNCHER RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    production = ["hook/AtomicWorkbenchQuickstepHook.java", "hook/AtomicWorkbenchQuickstepInputHook.java", "hook/AtomicWorkbenchQuickstepTargetHook.java", "hook/AtomicWorkbenchLauncherCrashHook.java"]
    variants = {"matched": dict(SOURCES)}
    for name, path, before, after in [
        ("missing_activity_resumed", "android/app/Activity.java", "isResumed()", "oldResumed()"),
        ("wrong_created_return", "com/android/quickstep/LauncherActivityInterface.java", "public com.android.launcher3.uioverrides.QuickstepLauncher getCreatedContainer()", "public android.content.Context getCreatedContainer()"),
        ("missing_force_reload", "com/android/quickstep/views/RecentsView.java", "reloadIfNeeded(boolean force)", "oldReload(boolean force)"),
    ]:
        variant=dict(SOURCES)
        variant[path]=variant[path].replace(before,after)
        variants[name]=variant
    for name,sources in variants.items():
        with tempfile.TemporaryDirectory(prefix="lsa-home-launcher-") as directory:
            SUPPORT["compile_run"](Path(directory),sources,production,"ls.augment.com.hook.TestHomeLauncher",arguments=() if name=="matched" else (name,))

if __name__ == "__main__":
    main()
