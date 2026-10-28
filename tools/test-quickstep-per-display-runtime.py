"""Execute the repository adapter against independent native-shaped owners, resources and failures."""
from pathlib import Path
import os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
JDK=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
files={
'android/content/Context.java':'package android.content;public class Context{public int display;public int getDisplayId(){return display;}}',
'android/view/InputEvent.java':'package android.view;public class InputEvent{}',
'com/android/app/displaylib/PerDisplayRepository.java':'package com.android.app.displaylib;public interface PerDisplayRepository{Object get(int display);}',
'com/android/systemui/shared/system/InputMonitorCompat.java':'package com.android.systemui.shared.system;public class InputMonitorCompat{}',
'com/android/systemui/shared/system/InputChannelCompat.java':'package com.android.systemui.shared.system;public class InputChannelCompat{public static class InputEventReceiver{}}',
'com/android/quickstep/TaskAnimationManager.java':'package com.android.quickstep;public class TaskAnimationManager{}',
'com/android/quickstep/window/RecentsWindowManager.java':'package com.android.quickstep.window;public class RecentsWindowManager extends android.content.Context{public final Object container=new Object();public Object getContainerInterface(){return container;}}',
'com/android/quickstep/OverviewComponentObserver.java':'package com.android.quickstep;public class OverviewComponentObserver{public com.android.app.displaylib.PerDisplayRepository mRecentsWindowManagerRepository;}',
'com/android/quickstep/TouchInteractionHandler.java':'''package com.android.quickstep;
import java.util.*;import com.android.app.displaylib.PerDisplayRepository;import com.android.systemui.shared.system.*;
public class TouchInteractionHandler extends android.content.Context {
 public PerDisplayRepository mRotationTouchHelperRepository,mTaskAnimationManagerRepository,mRecentsWindowManagerRepository;
 public final Map<Integer,InputResource> resources=new HashMap<>();
 private void onInputEvent(android.view.InputEvent e){}
 private InputResource getInputResource(int id){return resources.get(id);}
 public static class InputResource {
  private final int displayId;public final InputMonitorCompat monitor=new InputMonitorCompat();
  public final InputChannelCompat.InputEventReceiver receiver=new InputChannelCompat.InputEventReceiver();
  public InputResource(int id){displayId=id;}public static InputChannelCompat.InputEventReceiver e(InputResource r){return r.receiver;}
  public static InputMonitorCompat f(InputResource r){return r.monitor;}
 }
}''',
'ls/augment/com/hook/AtomicWorkbenchQuickstepInputHook.java':'''package ls.augment.com.hook;
class AtomicWorkbenchQuickstepInputHook{static Route route;static Route dispatchRoute(){return route;}
 static class Route{int source,target;String failure="";java.lang.ref.WeakReference<Object> service;
 Route(Object o,int s,int t){source=s;target=t;service=new java.lang.ref.WeakReference<>(o);}}}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
class AugmentModule{interface Callback{Object apply(Chain c)throws Throwable;}class Hook{Method m;Callback cb;Hook(Method m){this.m=m;}Hook intercept(Callback c){cb=c;return this;}}
 static class Chain{Object arg;Method m;int calls;Chain(Method m,Object a){this.m=m;arg=a;}Object getArg(int i){return arg;}
  Object proceed()throws Throwable{return proceed(new Object[]{arg});}Object proceed(Object[] a)throws Throwable{calls++;return m.invoke(null,a);}}
 final Map<Method,Hook> hooks=new HashMap<>();Hook prepareFeatureHook(Method m,String n,boolean b){return new Hook(m);}void registerFeatureHook(Hook h){hooks.put(h.m,h);}void deoptimize(Method m){}
 Object call(String name,Object value)throws Throwable{Method m=value.getClass().getMethod(name,value.getClass());Chain c=new Chain(m,value);Object result=hooks.get(m).cb.apply(c);if(c.calls!=1)throw new AssertionError("native call count");return result;}}
''',
'ls/augment/com/hook/TestPerDisplay.java':'''package ls.augment.com.hook;
import com.android.quickstep.*;import com.android.quickstep.window.RecentsWindowManager;
public class TestPerDisplay{
 static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static class Child extends TouchInteractionHandler{}
 interface Action{void run()throws Exception;}static void reject(Action a)throws Exception{try{a.run();throw new AssertionError("missing rejection");}catch(ReflectiveOperationException|IllegalStateException|IllegalArgumentException expected){checks++;}}
 public static void main(String[] args)throws Throwable{
  ClassLoader loader=TestPerDisplay.class.getClassLoader();check(AtomicWorkbenchQuickstepCapabilities.resolve(loader)==TouchInteractionHandler.class,"new handler selected by shape");
  Child owner=new Child();TouchInteractionHandler.InputResource physical=new TouchInteractionHandler.InputResource(0),target=new TouchInteractionHandler.InputResource(88);
  owner.resources.put(0,physical);owner.resources.put(88,target);Object rotation=new Object();owner.mRotationTouchHelperRepository=id->rotation;
  TaskAnimationManager manager=new TaskAnimationManager();owner.mTaskAnimationManagerRepository=id->manager;
  RecentsWindowManager window=new RecentsWindowManager();window.display=88;owner.mRecentsWindowManagerRepository=id->window;
  check(AtomicWorkbenchQuickstepCapabilities.rotation(owner,88)==rotation,"subclass keeps native rotation factory");
  AtomicWorkbenchQuickstepCapabilities.Model model=(AtomicWorkbenchQuickstepCapabilities.Model)AtomicWorkbenchQuickstepCapabilities.model(owner);
  check(model.getTaskAnimationManager(88)==manager,"native animation owner retained");check(model.getRecentsWindowManager(88)==window,"native window retained");
  check(model.getFallbackWindowInterface(88)==window.container,"native container retained");
  OverviewComponentObserver observer=new OverviewComponentObserver();observer.mRecentsWindowManagerRepository=id->window;
  check(((AtomicWorkbenchQuickstepCapabilities.Model)AtomicWorkbenchQuickstepCapabilities.model(observer)).getRecentsWindowManager(88)==window,"observer repository retained");
  reject(()->model.getRecentsWindowManager(0));reject(()->AtomicWorkbenchQuickstepCapabilities.model(new Object()));
  owner.mTaskAnimationManagerRepository=id->new Object();reject(()->model.getTaskAnimationManager(88));owner.mTaskAnimationManagerRepository=id->manager;
  AtomicWorkbenchQuickstepCapabilities.verifyInput(owner,88);checks++;
  owner.resources.put(88,new TouchInteractionHandler.InputResource(7));reject(()->AtomicWorkbenchQuickstepCapabilities.verifyInput(owner,88));owner.resources.put(88,target);
  AugmentModule module=new AugmentModule();AtomicWorkbenchQuickstepCapabilities.installInputResources(module,loader);check(module.hooks.size()==2,"monitor and receiver scoped separately");
  check(module.call("f",target)==target.monitor,"ordinary target monitor unchanged");
  AtomicWorkbenchQuickstepInputHook.Route route=new AtomicWorkbenchQuickstepInputHook.Route(owner,0,88);AtomicWorkbenchQuickstepInputHook.route=route;
  check(module.call("f",target)==physical.monitor,"physical stream uses physical monitor");check(module.call("e",target)==physical.receiver,"physical receiver kept for pilfer stream");
  TouchInteractionHandler.InputResource foreign=new TouchInteractionHandler.InputResource(88);check(module.call("f",foreign)==foreign.monitor,"same display number without object identity remains native");
  route.source=88;check(module.call("f",target)==target.monitor,"injected virtual input uses its own monitor");route.source=0;
  route.failure="expired";check(module.call("e",target)==target.receiver,"failed lease cannot redirect receiver");route.failure="";
  route.service=new java.lang.ref.WeakReference<>(new Child());check(module.call("f",target)==target.monitor,"different handler remains native");
  owner.resources.remove(0);reject(()->AtomicWorkbenchQuickstepCapabilities.verifyInput(owner,88));
  ClassLoader missing=new ClassLoader(loader){protected Class<?> loadClass(String n,boolean r)throws ClassNotFoundException{if(n.equals("com.android.app.displaylib.PerDisplayRepository"))throw new ClassNotFoundException(n);return super.loadClass(n,r);}};
  reject(()->AtomicWorkbenchQuickstepCapabilities.resolve(missing));check(!AtomicWorkbenchQuickstepCapabilities.modern,"missing replacement contract cannot select new route");
  System.out.println("PASS per-display repository/runtime ownership: "+checks+" checks; native UI not simulated");
 }
}'''
}
with tempfile.TemporaryDirectory(prefix='duo-quickstep-repository-') as directory:
    root=Path(directory);sources=[]
    for name,body in files.items():
        path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(body,encoding='utf-8');sources.append(path)
    sources += [ROOT/'android/app/src/main/java/ls/augment/com/hook'/name for name in ['HookCompatibility.java','AtomicWorkbenchQuickstepCapabilities.java']]
    subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','-d',directory,*map(str,sources)],check=True)
    subprocess.run([str(JDK/'java.exe'),'-cp',directory,'ls.augment.com.hook.TestPerDisplay'],check=True)
