"""Run the production HOME hook against both inspected UI contracts, offline.

Boundary doubles exercise Xposed callbacks, asynchronous discovery and main-thread
refresh; they do not claim that a real device changed its default HOME role.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOKS = ROOT / "android/app/src/main/java/ls/augment/com/hook"
SOURCES = {
    "android/os/Bundle.java": "package android.os; public class Bundle {}",
    "android/os/Looper.java": "package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}",
    "android/os/Handler.java": """package android.os;
import java.util.*;
public class Handler {
    static final List<Runnable> queue=new ArrayList<>();public Handler(Looper l){}
    public boolean post(Runnable r){synchronized(queue){queue.add(r);}return true;}
    public void removeCallbacks(Runnable r){synchronized(queue){queue.removeIf(item->item==r);}}
    public static void drain(){for(int n=0;n<100;n++){Runnable r;synchronized(queue){if(queue.isEmpty())return;r=queue.remove(0);}r.run();}throw new AssertionError("refresh loop");}
}""",
    "android/content/pm/ApplicationInfo.java": "package android.content.pm; public class ApplicationInfo {public String sourceDir=System.getProperty(\"fixture.archive\");public String[] splitSourceDirs;}",
    "android/content/Context.java": """package android.content;
public class Context {public Context getApplicationContext(){return this;}public String getPackageName(){return "com.android.permissioncontroller";}
public android.content.pm.ApplicationInfo getApplicationInfo(){return new android.content.pm.ApplicationInfo();}}""",
    "android/app/Activity.java": "package android.app; public class Activity extends android.content.Context {public boolean finishing,destroyed;public boolean isFinishing(){return finishing;}public boolean isDestroyed(){return destroyed;}}",
    "android/view/View.java": "package android.view; public class View {}",
    "android/util/ArrayMap.java": "package android.util; public class ArrayMap<K,V> extends java.util.HashMap<K,V>{}",
    "androidx/preference/PreferenceGroup.java": "package androidx.preference; public class PreferenceGroup {}",
    "androidx/lifecycle/LiveData.java": "package androidx.lifecycle; public class LiveData {public Object value;public LiveData(Object v){value=v;}public Object getValue(){return value;}}",
    "androidx/fragment/app/Fragment.java": """package androidx.fragment.app;
import android.app.Activity;import android.view.View;import ls.augment.com.hook.AugmentModule;
public class Fragment {
    public boolean added=true,removing,destroyed;public Activity activity=new Activity();public Parent parent=new Parent();
    public boolean isAdded(){return added;}public boolean isRemoving(){return removing;}public Activity getActivity(){return activity;}
    public Object getParentFragment(){return parent;}public android.content.Context getContext(){return activity;}
    public void onDestroy(){AugmentModule.run(this,Fragment.class,"onDestroy",new Class<?>[0],new Object[0],()->{destroyed=true;return null;});}
    public static class Parent {public View view=new View();public View getView(){return view;}}
}""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
public class AugmentModule {
    public interface Body {Object run()throws Throwable;}interface Hooker {Object intercept(Chain chain)throws Throwable;}
    interface Chain {Object getThisObject();Object[] getArgs();Object proceed()throws Throwable;}
    static final Map<Method,Registration> hooks=new ConcurrentHashMap<>();
    static class Registration {final Method method;final Hooker hook;Registration(Method m,Hooker h){method=m;hook=h;}}
    static class Builder {final Method method;Builder(Method m){method=m;}Registration intercept(Hooker h){return new Registration(method,h);}}
    final List<String> errors=new CopyOnWriteArrayList<>();
    Builder prepareFeatureHook(Method m,String id,boolean deopt){return new Builder(m);}
    void registerFeatureHook(Registration r){hooks.put(r.method,r);}void logFeatureError(String key,Throwable e){errors.add(key+":"+e.getClass().getSimpleName());}
    public static Object run(Object owner,Class<?> type,String name,Class<?>[] kinds,Object[] args,Body original){
        try{Registration r=hooks.get(type.getDeclaredMethod(name,kinds));if(r==null)return original.run();
            return r.hook.intercept(new Chain(){public Object getThisObject(){return owner;}public Object[] getArgs(){return args;}public Object proceed()throws Throwable{return original.run();}});
        }catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}
    }
}""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;
import android.content.Context;import java.util.*;import java.util.concurrent.*;
final class FeatureSettings {
    static final Context context=new Context();static volatile boolean active=true,verified=true;
    static final List<Runnable> listeners=new CopyOnWriteArrayList<>();static final Map<String,String> diagnostics=new ConcurrentHashMap<>();
    static Context from(Object owner){return context;}static boolean enabled(Context c,String key){return active;}
    static boolean hasVerifiedSnapshot(Context c){return verified;}static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}
    static void removeSnapshotListener(Runnable r){listeners.remove(r);}static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}
    static void change(boolean value){active=value;for(Runnable r:listeners)r.run();}
}""",
    "ls/augment/com/hook/OemHooks.java": """package ls.augment.com.hook;
import android.content.Context;import java.lang.reflect.*;
final class OemHooks {
    static Context context(Object owner,Object[] args){return FeatureSettings.context;}
    static Object field(Object owner,String name){try{return find(owner.getClass(),name).get(owner);}catch(Exception e){throw new RuntimeException(e);}}
    static void set(Object owner,Object value,String name){try{find(owner.getClass(),name).set(owner,value);}catch(Exception e){throw new RuntimeException(e);}}
    static Field find(Class<?> type,String name)throws Exception {for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static Object invoke(Object owner,String name,Object...args)throws Exception {
        for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(owner,args);}
        throw new NoSuchMethodException(name);
    }
}""",
    "ls/augment/com/hook/HomeCandidateDexResolver.java": """package ls.augment.com.hook;
import java.io.IOException;import java.util.concurrent.CountDownLatch;
final class HomeCandidateDexResolver {
    static final CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);static volatile Thread worker;static volatile String entry;
    static final class Target {final String name="test";String className(){return FixturePredicate.class.getName();}}
    static Target find(String[] paths,String list)throws IOException {worker=Thread.currentThread();entry=list;entered.countDown();try{release.await();}catch(InterruptedException e){throw new IOException(e);}
        if(Boolean.getBoolean("resolver.reject"))throw new IOException("ambiguous HOME qualification methods");return new Target();}
}""",
    "ls/augment/com/hook/FixturePredicate.java": """package ls.augment.com.hook;
public class FixturePredicate {public static boolean test(String name){return (Boolean)AugmentModule.run(null,FixturePredicate.class,"test",new Class<?>[]{String.class},new Object[]{name},()->name!=null&&name.startsWith("android.")&&name.contains(".cts."));}}""",
    "com/android/permissioncontroller/role/ui/DefaultAppViewModel.java": """package com.android.permissioncontroller.role.ui;
import java.util.*;import androidx.lifecycle.LiveData;
public class DefaultAppViewModel {
    public LiveData current=new LiveData(new ArrayList<>(List.of("system.launcher","third.party"))),recommended=new LiveData(new ArrayList<>());
    $GETTERS$
}""",
    "com/android/permissioncontroller/role/ui/DefaultAppChildFragment.java": """package com.android.permissioncontroller.role.ui;
import java.util.*;import android.os.Bundle;import android.content.Context;import android.util.ArrayMap;import androidx.preference.PreferenceGroup;
import ls.augment.com.hook.AugmentModule;import ls.augment.com.hook.FixturePredicate;
public class DefaultAppChildFragment extends androidx.fragment.app.Fragment {
    private String mRoleName="android.app.role.HOME";private $FLAGTYPE$ isCtsPkg;private DefaultAppViewModel mViewModel=new DefaultAppViewModel();
    public final List<String> shown=new ArrayList<>();public int renders;public boolean failOnce,lastPredicate;public Thread renderThread;public DefaultAppChildFragment nested;
    public void role(String value){mRoleName=value;}public DefaultAppViewModel model(){return mViewModel;}
    public boolean cts(){return $FLAGREAD$;}
    public void onActivityCreated(Bundle state){AugmentModule.run(this,DefaultAppChildFragment.class,"onActivityCreated",new Class<?>[]{Bundle.class},new Object[]{state},()->null);}
    void body(List items){renders++;renderThread=Thread.currentThread();if(failOnce){failOnce=false;throw new IllegalStateException("native list failed");}
        if(nested!=null)nested.emit();lastPredicate=FixturePredicate.test("third.party");
        for(Object item:items){String name=(String)item;boolean qualified=FixturePredicate.test(name);
            if(!mRoleName.equals("android.app.role.HOME")||name.startsWith("system.")||qualified){shown.add(name);$FLAGWRITE$;}}}
    $ENTRYPOINTS$
}""",
    "ls/augment/com/hook/HomeRoleLifecycleTest.java": """package ls.augment.com.hook;
import android.os.*;import java.util.*;import java.util.concurrent.*;import com.android.permissioncontroller.role.ui.DefaultAppChildFragment;
public class HomeRoleLifecycleTest {
    static int checks;static void check(boolean ok,String label){checks++;if(!ok)throw new AssertionError(label);}
    static final String COMPAT="ls_augment_rm_third_party_launcher_compat";
    public static void main(String[] args)throws Exception {
        String mode=args[0];Thread main=Thread.currentThread();AugmentModule module=new AugmentModule();
        check(DefaultLauncherRoleHook.install(module,HomeRoleLifecycleTest.class.getClassLoader(),"other.package")==0,"other package untouched");
        int count=DefaultLauncherRoleHook.install(module,HomeRoleLifecycleTest.class.getClassLoader(),"com.android.permissioncontroller");
        if(mode.startsWith("invalid")){check(count==0,"reject wrong/ambiguous contract");check(AugmentModule.hooks.isEmpty(),"no partial hooks for invalid contract");check(module.errors.get(0).startsWith("HOME_CONTRACT_UNAVAILABLE"),"contract diagnostic");System.out.println(mode+": "+checks+" checks passed");return;}
        check(count==3,"list and lifecycle registered");
        check(HomeCandidateDexResolver.entered.await(2,TimeUnit.SECONDS),"worker started");check(HomeCandidateDexResolver.worker!=main,"lookup off main thread");
        check(HomeCandidateDexResolver.entry.equals(mode.equals("modern")?"addApplicationPreferences":"onRoleChanged"),"resolver bound to exact list contract");
        DefaultAppChildFragment home=new DefaultAppChildFragment();home.onActivityCreated(new Bundle());home.emit();Handler.drain();
        check(!home.shown.contains("third.party")&&!home.cts(),"pending lookup keeps native filtering");
        HomeCandidateDexResolver.release.countDown();for(int n=0;n<400&&!FeatureSettings.diagnostics.containsKey(COMPAT);n++)Thread.sleep(5);
        check(FeatureSettings.diagnostics.containsKey(COMPAT),"async result published");
        if(mode.equals("rejected")){Handler.drain();home.emit();check(!home.shown.contains("third.party")&&!home.cts(),"ambiguous lookup never enables bypass");check(module.errors.stream().anyMatch(e->e.startsWith("HOME_AUTO_RESOLVE")),"failure diagnostic");System.out.println(mode+": "+checks+" checks passed");return;}
        // Wait until the worker's main-thread refresh has been queued after publication.
        Thread.sleep(20);Handler.drain();check(home.shown.contains("third.party")&&home.cts(),"already-open HOME refreshed after discovery");
        check(home.renderThread==main,"render on main thread");check(FeatureSettings.listeners.size()==1,"one listener");
        check(!FixturePredicate.test("third.party"),"predicate outside HOME untouched");
        DefaultAppChildFragment browser=new DefaultAppChildFragment();browser.role("android.app.role.BROWSER");browser.emit();
        check(!browser.lastPredicate&&!browser.cts(),"non-HOME keeps native CTS predicate");
        home.nested=browser;home.emit();check(!browser.lastPredicate&&!browser.cts(),"nested non-HOME scope cleared");check(home.lastPredicate,"outer HOME scope restored");home.nested=null;
        home.failOnce=true;try{home.emit();throw new AssertionError("exception lost");}catch(IllegalStateException expected){}
        check(!FixturePredicate.test("third.party"),"scope restored after native exception");
        home.emit();
        Thread off=new Thread(()->FeatureSettings.change(false));off.start();off.join();
        check(home.shown.contains("third.party"),"background observer does not mutate UI");Handler.drain();
        check(!home.shown.contains("third.party")&&!home.cts(),"OFF rebuild removes injected candidates and flag");check(home.renderThread==main,"OFF refresh on main");
        FeatureSettings.change(true);Handler.drain();check(home.shown.contains("third.party")&&home.cts(),"ON rebuild");
        // Native LiveData may fire before our queued OFF observer; it must also clear stale CTS state.
        FeatureSettings.change(false);home.emit();check(!home.cts(),"native OFF rebuild clears stale flag before queued listener");Handler.drain();
        home.model().current.value=new ArrayList<>(List.of("system.launcher","android.real.cts.app"));
        home.model().recommended.value=new ArrayList<>(List.of("system.second"));home.emit();
        check(home.cts(),"genuine OEM CTS result preserved across categories while OFF");
        home.model().current.value=new ArrayList<>(List.of("system.launcher","third.party"));home.model().recommended.value=new ArrayList<>();
        FeatureSettings.change(true);Handler.drain();check(home.cts(),"re-enabled for lifecycle checks");
        home.activity.finishing=true;int before=home.renders;FeatureSettings.change(false);Handler.drain();check(home.renders==before,"finishing page not refreshed");home.activity.finishing=false;
        FeatureSettings.verified=false;FeatureSettings.change(false);Handler.drain();check(home.renders==before,"unverified snapshot not applied");FeatureSettings.verified=true;
        home.model().current.value=null;FeatureSettings.change(false);Handler.drain();check(home.renders==before,"missing LiveData deferred");
        home.model().current.value=new ArrayList<>(List.of("system.launcher","third.party"));FeatureSettings.change(false);Handler.drain();check(!home.cts(),"deferred OFF eventually rebuilds");
        FeatureSettings.change(true);home.onDestroy();before=home.renders;Handler.drain();FeatureSettings.change(false);Handler.drain();
        check(home.renders==before,"destroy cancels queued and future refresh");check(FeatureSettings.listeners.isEmpty(),"destroy removes listener");
        check(module.errors.isEmpty(),"no install/refresh errors");check(!FeatureSettings.diagnostics.containsKey("ls_augment_rm_third_party_launcher_refresh_error"),"no swallowed refresh error");
        System.out.println(mode+": "+checks+" checks passed");
    }
}""",
}

MODERN = """
private void addApplicationPreferences(PreferenceGroup group,List items,ArrayMap map,Context context){
    AugmentModule.run(this,DefaultAppChildFragment.class,"addApplicationPreferences",new Class<?>[]{PreferenceGroup.class,List.class,ArrayMap.class,Context.class},new Object[]{group,items,map,context},()->{body(items);return null;});}
private void onApplicationListChanged(){shown.clear();addApplicationPreferences(null,(List)mViewModel.current.value,null,getContext());addApplicationPreferences(null,(List)mViewModel.recommended.value,null,getContext());}
public void emit(){onApplicationListChanged();}
"""
LEGACY = """
private void onRoleChanged(List items){AugmentModule.run(this,DefaultAppChildFragment.class,"onRoleChanged",new Class<?>[]{List.class},new Object[]{items},()->{shown.clear();body(items);return null;});}
public void emit(){onRoleChanged((List)mViewModel.current.value);}
"""


def main():
    with tempfile.TemporaryDirectory(prefix="lsa-home-lifecycle-") as tmp:
        root = Path(tmp)
        archive = root / "fixture.apk"
        archive.write_bytes(b"read-only stamp fixture")
        for mode in ("legacy", "modern", "rejected", "invalid-ambiguous", "invalid-static", "invalid-field", "invalid-getter"):
            source = root / mode / "src"
            for name, content in SOURCES.items():
                getters = "public LiveData getLiveData(){return current;}public LiveData getRecommendedLiveData(){return recommended;}" if mode == "modern" else "public LiveData getRoleLiveData(){return current;}"
                entries = MODERN if mode == "modern" else LEGACY
                if mode == "invalid-ambiguous":
                    entries = LEGACY + MODERN.replace("public void emit(){onApplicationListChanged();}", "")
                if mode == "invalid-static":
                    entries = "private static void onRoleChanged(List items){} public void emit(){shown.clear();body((List)mViewModel.current.value);}"
                if mode == "invalid-getter":
                    getters = "public String getRoleLiveData(){return null;}"
                content = content.replace("$GETTERS$", getters).replace("$ENTRYPOINTS$", entries)
                content = content.replace("$FLAGTYPE$", "int" if mode == "invalid-field" else "boolean")
                content = content.replace("$FLAGREAD$", "isCtsPkg!=0" if mode == "invalid-field" else "isCtsPkg")
                content = content.replace("$FLAGWRITE$", "isCtsPkg|=qualified?1:0" if mode == "invalid-field" else "isCtsPkg|=qualified")
                target = source / name
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_text(content, encoding="utf-8")
            classes = root / mode / "classes"
            subprocess.run(["javac", "-encoding", "UTF-8", "-d", str(classes),
                            str(HOOKS / "DefaultLauncherRoleHook.java"), str(HOOKS / "HookCompatibility.java"),
                            *map(str, source.rglob("*.java"))], check=True)
            subprocess.run(["java", "-Dfixture.archive=" + str(archive),
                            "-Dresolver.reject=" + str(mode == "rejected").lower(), "-cp", str(classes),
                            "ls.augment.com.hook.HomeRoleLifecycleTest", mode], check=True)
        print("HOME lifecycle tests passed for both list contracts and invalid contracts")


if __name__ == "__main__":
    main()
