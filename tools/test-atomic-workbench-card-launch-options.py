"""Execute the production native card-options hook with live owner/session checks."""
from pathlib import Path
import runpy
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-home-launcher.py")))
SUPPORT, SOURCES = BASE["SUPPORT"], dict(BASE["SOURCES"])
home_test = SOURCES.pop("ls/augment/com/hook/TestHomeLauncher.java")
SOURCES["android/window/WindowContainerToken.java"] = '''package android.window;
public class WindowContainerToken {public boolean alive=true;private final android.os.IBinder binder=()->alive;public android.os.IBinder asBinder(){return binder;}}'''
SOURCES["android/app/ActivityTaskManager.java"] = '''package android.app;
public class ActivityTaskManager {
 public static final Service service=new Service();public static Service getService(){return service;}
 public static class RootTaskInfo {public int taskId=92,displayId=88,userId=0,type=1;public int[] childTaskIds=new int[0];public android.window.WindowContainerToken token=new android.window.WindowContainerToken();public int getActivityType(){return type;}}
 public static class RootChild extends RootTaskInfo {}
 public static class Service {public java.util.List<RootTaskInfo> roots=new java.util.ArrayList<>();public int calls;public boolean denied,replaceSecond;public java.util.List<RootTaskInfo> getAllRootTaskInfosOnDisplay(int display){calls++;if(denied)throw new SecurityException();if(replaceSecond&&calls==2)roots.get(0).token=new android.window.WindowContainerToken();return roots;}}
}'''
SOURCES["android/app/ActivityOptions.java"] = SOURCES["android/app/ActivityOptions.java"].replace(
    "public int display=-1;", "public android.window.WindowContainerToken root;public ActivityOptions setLaunchRootTask(android.window.WindowContainerToken value){root=value;return this;}public int display=-1;")
SOURCES["android/view/View.java"] = SOURCES["android/view/View.java"].replace(
    "public int display=88;", "public Object parent;public Object getParent(){return parent;}public int display=88;")
SOURCES["com/android/launcher3/model/data/Item.java"] = "package com.android.launcher3.model.data;public class Item {}"
SOURCES["com/android/launcher3/util/Options.java"] = '''package com.android.launcher3.util;
public class Options {public android.app.ActivityOptions options=new android.app.ActivityOptions();public final Object callbacks=new Object();public final String factory;public Options(String value){factory=value;}}'''
SOURCES["com/android/systemui/shared/recents/model/Task.java"] = '''package com.android.systemui.shared.recents.model;
public class Task {public TaskKey key;public Task(int d,int u,int i){key=new TaskKey(d,u,i);}public static class TaskKey {public int displayId,userId,id;public TaskKey(int d,int u,int i){displayId=d;userId=u;id=i;}}}'''
SOURCES["com/android/quickstep/views/TaskContainer.java"] = '''package com.android.quickstep.views;
public class TaskContainer {public com.android.systemui.shared.recents.model.Task task;public TaskContainer(int d,int u,int i){task=new com.android.systemui.shared.recents.model.Task(d,u,i);}public com.android.systemui.shared.recents.model.Task getTask(){return task;}}'''
SOURCES["com/android/quickstep/views/TaskView.java"] = '''package com.android.quickstep.views;
public class TaskView extends android.view.View {public RecentsView recents;public java.util.List<TaskContainer> tasks=new java.util.ArrayList<>();public RecentsView getRecentsView(){return recents;}public java.util.List<TaskContainer> getTaskContainers(){return tasks;}public Object launchAsStaticTile(){return null;}}'''
SOURCES["com/android/quickstep/views/TaskChild.java"] = "package com.android.quickstep.views;public class TaskChild extends TaskView {}"
SOURCES["com/android/quickstep/views/ContainerChild.java"] = "package com.android.quickstep.views;public class ContainerChild extends TaskContainer {public ContainerChild(int d,int u,int i){super(d,u,i);}}"
launcher_path = "com/android/launcher3/uioverrides/QuickstepLauncher.java"
window_path = "com/android/quickstep/fallback/window/RecentsWindowManager.java"
SOURCES[launcher_path] = SOURCES[launcher_path].replace("public android.view.View root=", '''public int nativeOptions;public com.android.launcher3.util.Options getActivityLaunchOptions(android.view.View view,com.android.launcher3.model.data.Item item){nativeOptions++;return new com.android.launcher3.util.Options("launcher");}public android.view.View root=''' )
SOURCES[window_path] = SOURCES[window_path].replace("public int foreground;", '''public int cardOptions;public boolean failOptions;public com.android.launcher3.util.Options lastOptions;public com.android.launcher3.util.Options getActivityLaunchOptions(android.view.View view,com.android.launcher3.model.data.Item item){cardOptions++;if(failOptions)throw new IllegalStateException("factory unavailable");return lastOptions=new com.android.launcher3.util.Options("window");}public int foreground;''')
prefix = home_test[:home_test.index(" public static void main")].replace("TestHomeLauncher", "TestCardLaunchOptions")
prefix = prefix.replace("m.callbacks.size()==19||m.callbacks.size()==20", "m.callbacks.size()>=19&&m.callbacks.size()<=21")
SOURCES["ls/augment/com/hook/TestCardLaunchOptions.java"] = prefix + '''
 static class C {H h=new H();android.app.ActivityTaskManager.RootTaskInfo root=new android.app.ActivityTaskManager.RootTaskInfo();com.android.quickstep.views.TaskView card=new com.android.quickstep.views.TaskView();C()throws Throwable{var service=android.app.ActivityTaskManager.service;service.roots=new java.util.ArrayList<>();service.roots.add(root);service.calls=0;service.denied=service.replaceSecond=false;h.down();card.recents=h.activity.overview;card.parent=card.recents;card.tasks.add(new com.android.quickstep.views.TaskContainer(88,0,92));}
  com.android.launcher3.util.Options options()throws Throwable{return (com.android.launcher3.util.Options)h.f.m.invoke(h.activity,"getActivityLaunchOptions",new Class<?>[]{android.view.View.class,com.android.launcher3.model.data.Item.class},card,null);}
  void nativeOnly(String label)throws Throwable{var value=options();check(value.factory.equals("launcher")&&h.activity.nativeOptions==1&&h.f.s.mRecentsDisplayModel.window.cardOptions==0,"invalid card routed: "+label);}
 }
 public static void main(String[] args)throws Throwable {
  if(args.length>0){C c=new C();if(args[0].startsWith("root_capability_")){var o=c.options();check(o.factory.equals("window")&&o.options.root==null&&c.h.f.log("phase=card_root_unavailable"),"old per-display path lost when root capability is missing");}else{check(!c.h.f.log("phase=card_options_ready"),"incomplete capability installed");c.nativeOnly(args[0]);}check(c.h.f.s.gesture.container==c.h.iface,"optional card capability removed existing HOME path");System.out.println("PASS card missing capability: "+args[0]);return;}
  test("real card keeps native per-display factory wrapper and callbacks",()->{C c=new C();var o=c.options();check(c.h.f.log("phase=card_options_ready")&&c.h.f.log("phase=card_options_routed"),"card hook not invoked "+c.h.f.m.logs);check(o==c.h.f.s.mRecentsDisplayModel.window.lastOptions&&o.options.display==88&&o.callbacks!=null,"native wrapper or display lost");check(c.h.activity.nativeOptions==0&&c.h.f.s.mRecentsDisplayModel.window.cardOptions==1,"primary launcher factory ran");});
  test("native card and container subclasses inherit typed interfaces",()->{C c=new C();var child=new com.android.quickstep.views.TaskChild();child.recents=c.card.recents;child.parent=child.recents;child.tasks.add(new com.android.quickstep.views.ContainerChild(88,0,92));c.card=child;check(c.options().factory.equals("window"),"subclass card rejected");});
  test("registered card remains routable seconds after real native input UP",()->{C c=new C();c.h.f.e.action=android.view.MotionEvent.ACTION_UP;c.h.down();check(c.h.f.log("phase=input_finished")&&c.h.f.s.resolver.ends==1&&AtomicWorkbenchQuickstepInputHook.dispatchRoute()==null,"input stream still active after UP");SystemClock.now+=4000;c.h.f.s.resolver.target.putLong("updated_elapsed",SystemClock.now);var o=c.options();check(o.factory.equals("window")&&o.options.display==88&&c.h.activity.nativeOptions==0,"retained native card lost authority after completed UP");});
  test("both live same-display tasks in a native grouped card are checked",()->{C c=new C();c.root.childTaskIds=new int[]{92,93};var second=new ActivityManager.RunningTaskInfo();second.taskId=93;second.type=1;c.h.f.s.activities.tasks.add(second);c.card.tasks.add(new com.android.quickstep.views.TaskContainer(88,0,93));check(c.options().factory.equals("window"),"valid grouped card rejected");second.displayId=99;int previous=c.h.f.s.mRecentsDisplayModel.window.cardOptions;check(c.options().factory.equals("launcher")&&c.h.f.s.mRecentsDisplayModel.window.cardOptions==previous,"mixed-display grouped card acquired authority");});
  test("expired old replaced and inactive sessions preserve native behavior",()->{for(int i=0;i<5;i++){C c=new C();switch(i){case 0:c.h.f.s.resolver.target.putLong("session",13);break;case 1:SystemClock.now+=2501;break;case 2:c.h.f.s.resolver.target.putBoolean("active",false);break;case 3:c.h.f.s.resolver.target.putInt("display_id",99);break;case 4:c.h.f.s.resolver.target.putString("display_unique_id","reused");break;}c.nativeOnly("session "+i);}});
  test("host foreign user and external display cards never acquire authority",()->{for(int i=0;i<5;i++){C c=new C();var key=c.card.tasks.get(0).task.key;switch(i){case 0:key.id=91;break;case 1:key.userId=10;break;case 2:key.displayId=0;break;case 3:key.displayId=99;break;case 4:key.id=999;break;}c.nativeOnly("task "+i);}});
  test("live task reparent removal and user changes reject stale card keys",()->{for(int i=0;i<3;i++){C c=new C();switch(i){case 0:c.h.f.app.displayId=0;break;case 1:c.h.f.app.userId=10;break;case 2:c.h.f.s.activities.tasks.remove(c.h.f.app);break;}c.nativeOnly("live task "+i);}});
  test("unowned detached and wrong-display views stay native",()->{for(int i=0;i<7;i++){C c=new C();switch(i){case 0:c.card.parent=null;break;case 1:c.card.attached=false;break;case 2:c.card.display=0;break;case 3:c.card.identity.unique="reused";break;case 4:c.card.recents=new RecentsView();c.card.parent=c.card.recents;break;case 5:c.h.activity.finishing=true;break;case 6:c.h.f.host.topActivity=new ComponentName("other","other.Main");break;}c.nativeOnly("view "+i);}});
  test("empty duplicate and excessive task containers stay native",()->{for(int i=0;i<3;i++){C c=new C();if(i==0)c.card.tasks.clear();else {c.card.tasks.add(new com.android.quickstep.views.TaskContainer(88,0,92));if(i==2)c.card.tasks.add(new com.android.quickstep.views.TaskContainer(88,0,93));}c.nativeOnly("containers "+i);}});
  test("native factory failure falls through without fabricating options",()->{C c=new C();c.h.f.s.mRecentsDisplayModel.window.failOptions=true;var o=c.options();check(o.factory.equals("launcher")&&c.h.activity.nativeOptions==1&&c.h.f.log("phase=card_options_unavailable"),"factory failure swallowed native fallback");});
  test("display resource replaced after registration keeps native fallback",()->{C c=new C();c.h.f.s.mRecentsDisplayModel.window=new com.android.quickstep.fallback.window.RecentsWindowManager(88);c.nativeOnly("window replaced");});
  test("compiled static-card caller is deoptimized",()->{C c=new C();check(c.h.f.m.deoptimized.stream().anyMatch(e->e.getDeclaringClass().getName().equals("com.android.quickstep.views.TaskView")&&e.getName().equals("launchAsStaticTile")),"factory can remain inlined in card caller");});
  test("actual root token avoids the native default-display HOME prologue",()->{C c=new C();var o=c.options();check(o.options.root==c.root.token&&o.options.display==88,"real root token missing; native Recents would raise default HOME");check(android.app.ActivityTaskManager.service.calls==2,"root was not checked again before launch");check(o==c.h.f.s.mRecentsDisplayModel.window.lastOptions&&o.callbacks!=null,"native wrapper lost");});
  test("real framework root subclasses retain inherited token fields",()->{C c=new C();var child=new android.app.ActivityTaskManager.RootChild();android.app.ActivityTaskManager.service.roots=java.util.List.of(child);check(c.options().options.root==child.token,"real root subclass rejected");});
  test("nested card selects its actual framework root rather than inventing a root from task id",()->{C c=new C();c.root.taskId=95;c.root.childTaskIds=new int[]{92};check(c.options().options.root==c.root.token,"nested root not used");});
  test("unknown ambiguous moved user or HOME roots preserve native behavior",()->{for(int i=0;i<8;i++){C c=new C();switch(i){case 0:android.app.ActivityTaskManager.service.roots.clear();break;case 1:c.root.displayId=0;break;case 2:c.root.userId=10;break;case 3:c.root.taskId=95;break;case 4:c.root.token=null;break;case 5:c.root.token.alive=false;break;case 6:android.app.ActivityTaskManager.service.roots.add(new android.app.ActivityTaskManager.RootTaskInfo());break;case 7:c.root.type=2;break;}c.nativeOnly("root "+i);}});
  test("denied root snapshot and token replacement never reuse stale root authority",()->{for(int i=0;i<2;i++){C c=new C();if(i==0)android.app.ActivityTaskManager.service.denied=true;else android.app.ActivityTaskManager.service.replaceSecond=true;check(c.options().factory.equals("launcher")&&c.h.activity.nativeOptions==1,"root query race/denial acquired authority");}});
  System.out.println("CARD OPTIONS RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    production = ["hook/AtomicWorkbenchQuickstepHook.java", "hook/AtomicWorkbenchQuickstepInputHook.java", "hook/AtomicWorkbenchQuickstepTargetHook.java", "hook/AtomicWorkbenchLauncherCrashHook.java"]
    variants = {"matched": dict(SOURCES)}
    for name, path, before, after in [
        ("missing_card_containers", "com/android/quickstep/views/TaskView.java", "getTaskContainers()", "oldContainers()"),
        ("missing_native_factory", window_path, "getActivityLaunchOptions(", "oldOptions("),
        ("wrong_key_display_type", "com/android/systemui/shared/recents/model/Task.java", "public int displayId,userId,id;", "public long displayId;public int userId,id;"),
        ("missing_wrapper_options", "com/android/launcher3/util/Options.java", "public android.app.ActivityOptions options=", "public Object options="),
        ("root_capability_missing_setter", "android/app/ActivityOptions.java", "setLaunchRootTask(", "oldLaunchRootTask("),
        ("root_capability_missing_child_ids", "android/app/ActivityTaskManager.java", "public int[] childTaskIds=", "public int[] oldChildTaskIds="),
    ]:
        source = dict(SOURCES)
        source[path] = source[path].replace(before, after)
        if name == "missing_wrapper_options":
            source["ls/augment/com/hook/TestCardLaunchOptions.java"] = source["ls/augment/com/hook/TestCardLaunchOptions.java"].replace("o.options.display", "((android.app.ActivityOptions)o.options).display")
            source["ls/augment/com/hook/TestCardLaunchOptions.java"] = source["ls/augment/com/hook/TestCardLaunchOptions.java"].replace("o.options.root", "((android.app.ActivityOptions)o.options).root").replace("c.options().options.root", "((android.app.ActivityOptions)c.options().options).root")
        if name == "root_capability_missing_child_ids":
            source["ls/augment/com/hook/TestCardLaunchOptions.java"] = source["ls/augment/com/hook/TestCardLaunchOptions.java"].replace(".childTaskIds", ".oldChildTaskIds")
        variants[name] = source
    for name, sources in variants.items():
        with tempfile.TemporaryDirectory(prefix="lsa-card-options-") as directory:
            SUPPORT["compile_run"](Path(directory), sources, production, "ls.augment.com.hook.TestCardLaunchOptions", arguments=() if name == "matched" else (name,))
    # The same native card really reaches the primary Launcher factory when only
    # this correction is removed; the fixture does not pre-route the options.
    negative = dict(SOURCES)
    path = "hook/AtomicWorkbenchQuickstepTargetHook.java"
    old = (SUPPORT["SRC"] / path).read_text(encoding="utf-8")
    assert "installHomeCardOptions(module, loader, profile);" in old
    negative["ls/augment/com/" + path] = old.replace("installHomeCardOptions(module, loader, profile);", "")
    with tempfile.TemporaryDirectory(prefix="lsa-card-options-old-factory-") as directory:
        SUPPORT["compile_run"](Path(directory), negative, [item for item in production if item != path], "ls.augment.com.hook.TestCardLaunchOptions", arguments=("previous_primary_factory",))


if __name__ == "__main__":
    main()
