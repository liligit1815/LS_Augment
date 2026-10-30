"""Execute production native selection/attachment against old and fullscreen OEM hosts."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
source = (SRC / 'NativeIslandHost.java').read_text(encoding='utf-8')

def member(marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

files = {
    'android/view/View.java': '''package android.view;import java.util.*;public class View {
 public boolean attached;public final List<OnAttachStateChangeListener> listeners=new ArrayList<>();
 public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public boolean isAttachedToWindow(){return attached;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}
 public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}
 public void attach(){attached=true;for(var l:new ArrayList<>(listeners))l.onViewAttachedToWindow(this);}}''',
    'android/os/Handler.java': '''package android.os;import java.util.*;public class Handler {
 public final List<Runnable> immediate=new ArrayList<>(),delayed=new ArrayList<>();public void post(Runnable r){immediate.add(r);}
 public void postDelayed(Runnable r,long t){delayed.add(r);}public void removeCallbacks(Runnable r){immediate.remove(r);delayed.remove(r);}
 public void drain(){int n=0;while(!immediate.isEmpty()){if(++n>20)throw new AssertionError("attachment loop");immediate.remove(0).run();}}}''',
    'android/os/PowerManager.java': 'package android.os;public class PowerManager{public boolean isInteractive(){return true;}}',
    'android/app/KeyguardManager.java': 'package android.app;public class KeyguardManager{public boolean isKeyguardLocked(){return false;}}',
    'android/content/Context.java': '''package android.content;public class Context{public Object getContentResolver(){return this;}
 public <T>T getSystemService(Class<T> t){try{return t.getConstructor().newInstance();}catch(Exception e){throw new AssertionError(e);}}}''',
    'android/provider/Settings.java': '''package android.provider;public class Settings{public static class System{
 public static int enabled=1,function=1;public static int getInt(Object r,String key,int d){return key.equals("dynamic_island_function_switch")?function:enabled;}}}''',
    'com/zte/tools/AppTools.java': 'package com.zte.tools;public class AppTools{public static boolean ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN;}',
    'ls/augment/com/hook/NativeIslandScenes.java': '''package ls.augment.com.hook;class NativeIslandScenes {
 static int started,closed;NativeIslandScenes(Object...args){}void start(){started++;}void close(){closed++;}void configurationChanged(){}}''',
    'ls/augment/com/hook/MagicIslandScenes.java': '''package ls.augment.com.hook;class MagicIslandScenes {
 static int started,closed;MagicIslandScenes(Object...args){}void start(){started++;}void close(){closed++;}void refresh(){}}''',
    'ls/augment/com/hook/FeatureSettings.java':'package ls.augment.com.hook;class FeatureSettings{static void diagnostic(Object c,String k,String v){}}',
    'ls/augment/com/MagicIslandPolicy.java':'package ls.augment.com;public class MagicIslandPolicy{public static String CAPABILITY="magic";}',
    'com/zte/base/Feature.java': '''package com.zte.base;public class Feature{public static Feature current;
 public Object mDynamicIslandManager;public boolean mEnabled;public boolean enabled(){return mEnabled;}public static Feature get(String key){return current;}}''',
}
for name in ('NativeIslandFullscreen', 'NativeIslandWake'):
    files[f'ls/augment/com/hook/{name}.java'] = (SRC / f'{name}.java').read_text(encoding='utf-8')
harness = '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.lang.ref.*;import android.view.View;import android.os.Handler;import com.zte.base.Feature;
public class TestNativeSelection {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static final Handler MAIN=new Handler();static boolean baselineKnown,baselineFeature,initializedByDuo;
 static Object nativeFeature,initializedManager;static TestNativeSelection nativeOwner;
 static WeakReference<View> keyguardView=new WeakReference<>(new View());
 final android.content.Context context=new android.content.Context();final ClassLoader loader=getClass().getClassLoader();final View phone=new View();
 NativeIslandFullscreen nativeFullscreen;NativeIslandScenes nativeScenes;MagicIslandScenes magicScenes;boolean nativeRequested,nativeSelected;
 View waitingNativeRoot;View.OnAttachStateChangeListener nativeAttach;String diagnostic;
 // TIMEOUT
 static class Permanent {
  public View mDynamicIslandRoot,mDynamicIslandPanelRoot,mDynamicIslandTouchHelper,mStickyAnimationView;
  public boolean mDynamicIslandFuncEnable,settings;public int wakes,keys,settingsCalls;
  public void updateDynamicIslandEnabled(boolean value){mDynamicIslandFuncEnable=value;}
  public void onDynamicIslandSettingsChanged(boolean on){settings=on;settingsCalls++;}
  public void onKeyguardStateChanged(boolean locked){keys++;}public void onStartedWakingUp(){wakes++;}
 }
 static class Child extends Permanent{}
 static class Missing {public View mDynamicIslandRoot;}
 static class Manager {
  public Object mPermanentIslandManager;public boolean mDynamicIslandEnable;public int init,registered,phoneCalls,keyguardCalls;
  public void initDynamicIsland(){init++;Permanent p=(Permanent)mPermanentIslandManager;p.mDynamicIslandRoot=new View();p.mDynamicIslandPanelRoot=new View();p.mDynamicIslandTouchHelper=new View();p.mStickyAnimationView=new View();}
  public void registerConfigChangeListener(){registered++;}public void initSystemIconContainer(View v){phoneCalls++;}
  public void initKeyguardSystemIconContainer(View v){keyguardCalls++;}
 }
 static class Broken extends Permanent {public void updateDynamicIslandEnabled(boolean value){if(value)throw new IllegalStateException("OEM failure");super.updateDynamicIslandEnabled(value);}}
 static class BrokenWake extends Permanent {public void onStartedWakingUp(){throw new IllegalStateException("OEM wake failure");}}
 static Object field(Object owner,String name){if(owner==null)return null;for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(owner);}catch(Exception ignored){}return null;}
 static boolean set(Object owner,String name,Object value){try{Field f=owner.getClass().getDeclaredField(name);f.setAccessible(true);f.set(owner,value);return true;}catch(Exception e){return false;}}
 static Object call(Object owner,String name,Object...args)throws Exception{for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(owner,args);}throw new NoSuchMethodException(name);}
 Object invokeStatic(String cls,String name,Class<?>[] types,Object...args)throws Exception{return Class.forName(cls).getMethod(name,types).invoke(null,args);}
 void report(String value){diagnostic=value;}static String cause(Exception e){return e.toString();}
 // METHODS
 static Manager setup(Object pm,boolean full){baselineKnown=false;baselineFeature=false;nativeOwner=null;nativeFeature=null;initializedManager=null;MAIN.immediate.clear();MAIN.delayed.clear();
  com.zte.tools.AppTools.ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN=full;Feature.current=new Feature();Manager m=new Manager();m.mPermanentIslandManager=pm;Feature.current.mDynamicIslandManager=m;return m;}
 static void attach(Permanent p){p.mDynamicIslandRoot.attach();p.mDynamicIslandPanelRoot.attach();MAIN.drain();}
 public static void main(String[] args){
  Permanent p=new Child();Manager m=setup(p,true);TestNativeSelection h=new TestNativeSelection();h.selectNative(true);
  check(m.init==1&&m.registered==1&&!h.nativeSelected&&!Feature.current.mEnabled,"selection before native windows attach");
  p.mDynamicIslandRoot.attach();MAIN.drain();check(!h.nativeSelected&&h.waitingNativeRoot==p.mDynamicIslandPanelRoot,"panel window attachment not required");
  p.mDynamicIslandPanelRoot.attach();MAIN.drain();check(h.nativeSelected&&Feature.current.mEnabled&&p.mDynamicIslandFuncEnable&&m.mDynamicIslandEnable,"fullscreen not selected");
  check(p.wakes==1&&p.keys==1&&p.settings&&m.phoneCalls==1&&m.keyguardCalls==1,"OEM lifecycle not synchronized");
  check(h.nativeScenes==null&&h.magicScenes!=null&&h.diagnostic.contains("fullscreen_native_scenes"),"modern receiver scene path not started");
  h.selectNative(true);check(m.init==1&&m.registered==1&&p.wakes==1,"repeated selection duplicated initialization");
  h.selectNative(false);check(!Feature.current.mEnabled&&!p.settings&&!m.mDynamicIslandEnable&&!p.mDynamicIslandFuncEnable,"fullscreen exit did not restore native gates");
  check(MagicIslandScenes.started==1&&MagicIslandScenes.closed==1,"modern scene lifecycle not exclusive");
  p=new Permanent();m=setup(p,false);h=new TestNativeSelection();h.selectNative(true);p.mDynamicIslandRoot.attach();MAIN.drain();
  check(h.nativeSelected&&h.nativeScenes!=null&&NativeIslandScenes.started==1,"legacy scene path lost");h.selectNative(false);check(NativeIslandScenes.closed==1,"legacy scenes not closed");
  p=new Permanent();m=setup(p,true);h=new TestNativeSelection();h.selectNative(true);h.selectNative(false);attach(p);
  check(!h.nativeSelected&&!Feature.current.mEnabled&&p.wakes==0&&h.waitingNativeRoot==null,"cancelled pending window selected later");
  p=new Permanent();m=setup(p,true);h=new TestNativeSelection();h.selectNative(true);h.nativeAttachTimeout.run();
  check(!h.nativeSelected&&h.waitingNativeRoot==null&&h.diagnostic.contains("timeout"),"pending window timeout reports ready");h.selectNative(false);
  m=setup(new Missing(),true);h=new TestNativeSelection();h.selectNative(true);check(m.init==0&&!Feature.current.mEnabled&&h.diagnostic.contains("unavailable"),"unknown structure modified native behavior");
  p=new Broken();m=setup(p,true);h=new TestNativeSelection();h.selectNative(true);attach(p);
  check(!h.nativeSelected&&!Feature.current.mEnabled&&!m.mDynamicIslandEnable&&h.diagnostic.contains("unavailable"),"failed native function update not rolled back");
  p=new BrokenWake();m=setup(p,true);h=new TestNativeSelection();h.selectNative(true);attach(p);
  check(!h.nativeSelected&&!Feature.current.mEnabled&&!m.mDynamicIslandEnable&&!p.settings,"failed wake left native windows enabled");
  p=new Permanent();m=setup(p,true);m.initDynamicIsland();attach(p);h=new TestNativeSelection();h.selectNative(true);h.selectNative(false);
  check(initializedManager==null&&!p.settings&&!Feature.current.mEnabled,"preexisting native windows were not disabled on deselection");
  p=new Permanent();m=setup(p,true);Feature.current.mEnabled=true;m.mDynamicIslandEnable=true;h=new TestNativeSelection();h.selectNative(true);attach(p);h.selectNative(false);
  check(Feature.current.mEnabled&&m.mDynamicIslandEnable&&p.settings,"preexisting OEM selection not preserved");
  p=new Permanent();m=setup(p,true);android.provider.Settings.System.function=0;h=new TestNativeSelection();h.selectNative(true);attach(p);
  check(h.nativeSelected&&!m.mDynamicIslandEnable&&!p.mDynamicIslandFuncEnable,"native function setting ignored");h.selectNative(false);
  p=new Permanent();m=setup(p,true);android.provider.Settings.System.function=1;android.provider.Settings.System.enabled=0;h=new TestNativeSelection();h.selectNative(true);attach(p);
  check(h.nativeSelected&&p.settings&&h.magicScenes!=null,"modern selection incorrectly depends on old switch");h.selectNative(false);
  System.out.println("PASS production native selection: "+checks+" assertions; legacy/fullscreen/inherited/missing, both windows, wake, cancel, timeout, repeat and rollback");
 }
}'''
harness = harness.replace('// TIMEOUT', member('    private final Runnable nativeAttachTimeout=') + ';')
harness = harness.replace('// METHODS', '\n'.join(member(marker) for marker in (
    '    private static void rememberBaseline(', '    void selectNative(',
    '    private void awaitNativeWindow(', '    private void cancelNativeWait(')))
files['ls/augment/com/hook/TestNativeSelection.java'] = harness
with tempfile.TemporaryDirectory(prefix='lsa-native-selection-') as directory:
    folder = Path(directory)
    for name, text in files.items():
        file = folder / name
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(text, encoding='utf-8')
    javac = str(Path(os.environ['JAVA_HOME']) / 'bin/javac.exe')
    java = str(Path(os.environ['JAVA_HOME']) / 'bin/java.exe')
    subprocess.run([javac, '-encoding', 'UTF-8', '-d', str(folder), *map(str, folder.rglob('*.java'))], check=True)
    subprocess.run([java, '-cp', str(folder), 'ls.augment.com.hook.TestNativeSelection'], check=True, timeout=20)
