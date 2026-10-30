"""Exercise real setting observers, authenticated publication and phone settings entry, old/new branches."""
import ast
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
fixture=ROOT/'tools/test-magic-island-runtime.py'
tree=ast.parse(fixture.read_text(encoding='utf-8'))
scope={'__file__':str(fixture)}
exec(compile(ast.Module(body=tree.body[:-1],type_ignores=[]),str(fixture),'exec'),scope)
files=scope['files'];SRC=scope['SRC']
files['android/database/ContentObserver.java']='package android.database;import android.os.*;public class ContentObserver{public ContentObserver(Handler h){}public void onChange(boolean b){}}'
files['android/content/ContentResolver.java']='''package android.content;import android.os.*;import android.net.*;import android.database.*;import java.util.*;public class ContentResolver{
 public Map<String,Integer> settings=new HashMap<>();public List<Bundle> calls=new ArrayList<>();public ContentObserver observer;public int failures;
 public void registerContentObserver(Uri u,boolean b,ContentObserver o){observer=o;}
 public Bundle call(Uri u,String method,String arg,Bundle b){calls.add(b);Bundle result=new Bundle();result.putBoolean("ok",failures--<=0);return result;}}'''
files['android/provider/Settings.java']='''package android.provider;import android.content.*;import android.net.*;public class Settings{public static class System{
 public static int getInt(ContentResolver r,String k,int d){return r.settings.getOrDefault(k,d);}public static Uri getUriFor(String k){return Uri.parse(k);}
 public static boolean putInt(ContentResolver r,String k,int v){r.settings.put(k,v);return true;}}}'''
files['android/widget/Toast.java']='package android.widget;import android.content.*;public class Toast{public static int LENGTH_LONG=1;public static Toast makeText(Context c,String s,int i){return new Toast();}public void show(){}}'
files['androidx/preference/SwitchPreference.java']='package androidx.preference;public class SwitchPreference{public boolean checked;public void setChecked(boolean b){checked=b;}}'
files['ls/augment/com/hook/FeatureSettings.java']=files['ls/augment/com/hook/FeatureSettings.java'].replace('public static void changed()', 'public static boolean verified=true;public static boolean hasVerifiedSnapshot(Context c){return verified;}public static void invalidateSnapshot(){}public static void changed()')
files['ls/augment/com/hook/SystemUiAdapter.java']='''package ls.augment.com.hook;import java.lang.reflect.*;public class SystemUiAdapter{
 public static Object call(Object o,String n,Object...a)throws Exception{for(Method m:o.getClass().getMethods())if(m.getName().equals(n)&&m.getParameterCount()==a.length)return m.invoke(o,a);throw new NoSuchMethodException(n);}
 public static Object field(Object o,String n)throws Exception{return o.getClass().getField(n).get(o);}}'''
files['com/zte/feature/dynamicisland/settings/DynamicIslandSwitchFullScreenSettingsFragment.java']='''package com.zte.feature.dynamicisland.settings;import android.content.*;import androidx.preference.*;import java.util.*;public class DynamicIslandSwitchFullScreenSettingsFragment{
 public Context context;public Map<String,Boolean> sources=new HashMap<>();public Context getContext(){return context;}public boolean isSubSwitchOn(String k){return sources.getOrDefault(k,false);}
 public void handleSubSwitchPreference(String k,SwitchPreference p){sources.put(k,p.checked);}}'''
files['com/zte/feature/dynamicisland/settings/DynamicIslandSwitchSettingsFragment.java']='''package com.zte.feature.dynamicisland.settings;import android.content.*;import androidx.preference.*;public class DynamicIslandSwitchSettingsFragment{
 public Context context;public SwitchPreference mDynamicIslandSwitchPref=new SwitchPreference();public Context getContext(){return context;}
 public void updateDynamicIslandSwitchState(int v){context.resolver.settings.put("dynamic_island_switch_state",v);mDynamicIslandSwitchPref.checked=v==1;}}'''
files['ls/augment/com/hook/NativeIslandSettingsHook.java']=(SRC/'hook/NativeIslandSettingsHook.java').read_text(encoding='utf-8')
files['ls/augment/com/hook/TestMagicSettingHook.java']='''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.concurrent.*;import android.content.*;import android.os.*;import ls.augment.com.*;import androidx.preference.*;
import com.zte.feature.dynamicisland.settings.*;
public class TestMagicSettingHook{
 static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 static void flush()throws Exception{Field f=NativeIslandSettingsHook.class.getDeclaredField("WORKER");f.setAccessible(true);ExecutorService worker=(ExecutorService)f.get(null);
  for(int i=0;i<4;i++){worker.submit(()->{}).get(5,TimeUnit.SECONDS);Handler.drain();}}
 public static void main(String[] args)throws Throwable{
  boolean modern=args[0].equals("modern");com.zte.tools.AppTools.ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN=modern;
  Context c=new Context();c.resolver.settings.put("dynamic_island_function_switch",1);c.resolver.settings.put("dynamic_island_switch_state",0);
  AugmentModule module=new AugmentModule();check(NativeIslandSettingsHook.install(module,TestMagicSettingHook.class.getClassLoader())==1,"selection contract missing");
  if(modern){
   FeatureSettings.verified=false;NativeIslandSettingsHook.attach(c);flush();check(c.resolver.calls.isEmpty(),"startup imported an unverified snapshot");
   FeatureSettings.verified=true;FeatureSettings.changed();flush();check(c.resolver.calls.size()==1&&c.resolver.calls.get(0).getBoolean("enabled"),"existing modern ON not imported");
   check("fullscreen".equals(c.resolver.calls.get(0).getString("mode","")),"modern mode missing from publication");
   NativeIslandSettingsHook.attach(c);flush();check(c.resolver.calls.size()==1,"startup publication repeated");
   DynamicIslandSwitchFullScreenSettingsFragment page=new DynamicIslandSwitchFullScreenSettingsFragment();page.context=c;
   page.isSubSwitchOn("media_island");flush();check(c.resolver.calls.size()==1,"browsing selected island");
   SwitchPreference pref=new SwitchPreference();pref.checked=false;module.call(page,"handleSubSwitchPreference",new Class[]{String.class,SwitchPreference.class},"media_island",pref);flush();
   check(c.resolver.calls.size()==1,"turning one source OFF deselected the entire island");
   pref.checked=true;module.call(page,"handleSubSwitchPreference",new Class[]{String.class,SwitchPreference.class},"media_island",pref);flush();check(c.resolver.calls.size()==2,"explicit ON did not reconcile");
   c.resolver.settings.put("dynamic_island_function_switch",0);c.resolver.observer.onChange(false);flush();check(!c.resolver.calls.get(c.resolver.calls.size()-1).getBoolean("enabled"),"native global OFF not propagated");
   c.resolver.failures=2;c.resolver.settings.put("dynamic_island_function_switch",1);int before=c.resolver.calls.size();c.resolver.observer.onChange(false);flush();
   check(c.resolver.calls.size()==before+3&&c.resolver.settings.get("dynamic_island_function_switch")==1,"startup retries lost native state");
  }else{
   NativeIslandSettingsHook.attach(c);flush();check(c.resolver.calls.isEmpty(),"legacy stored state selected native automatically");
   DynamicIslandSwitchSettingsFragment page=new DynamicIslandSwitchSettingsFragment();page.context=c;
   module.call(page,"updateDynamicIslandSwitchState",new Class[]{int.class},1);flush();check(c.resolver.calls.size()==1&&c.resolver.calls.get(0).getBoolean("enabled")&&!c.resolver.calls.get(0).containsKey("mode"),"legacy explicit ON protocol changed");
   module.call(page,"updateDynamicIslandSwitchState",new Class[]{int.class},0);flush();check(!c.resolver.calls.get(1).getBoolean("enabled"),"legacy OFF lost");
   c.resolver.failures=1;module.call(page,"updateDynamicIslandSwitchState",new Class[]{int.class},1);flush();check(c.resolver.settings.get("dynamic_island_switch_state")==0&&!page.mDynamicIslandSwitchPref.checked,"failed legacy handover not rolled back");
  }
  System.out.println("PASS production "+args[0]+" selection hooks: "+checks+" assertions");
 }}'''
files['android/app/Activity.java']='package android.app;import android.content.*;public class Activity extends Context{public void runOnUiThread(Runnable r){r.run();}public boolean isDestroyed(){return false;}}'
files['android/content/Intent.java']='package android.content;public class Intent{}'
files['android/content/ComponentName.java']=files['android/content/ComponentName.java'].replace('public ComponentName(', 'public String flattenToString(){return pkg+"/"+name;}public ComponentName(')
files['android/content/pm/PackageManager.java']=files['android/content/pm/PackageManager.java'].replace('public static int MATCH_DISABLED_COMPONENTS', 'public static int COMPONENT_ENABLED_STATE_DISABLED_USER=3;public static int MATCH_DISABLED_COMPONENTS')
files['ls/augment/com/RootShell.java']='''package ls.augment.com;import java.util.*;public class RootShell{public static List<String> commands=new ArrayList<>();public static boolean failStart;
 public static class Result{public String output="Status: ok";public boolean success=true;public boolean isSuccess(){return success;}}
 public static Result run(String c,Object x,int t,int n){commands.add(c);Result r=new Result();if(c.startsWith("am start")&&failStart){r.success=false;r.output="Error";}return r;}}'''
files['ls/augment/com/NativeIslandSettings.java']=(SRC/'NativeIslandSettings.java').read_text(encoding='utf-8')
files['ls/augment/com/TestMagicEntry.java']='''package ls.augment.com;import android.app.*;import android.content.pm.*;
public class TestMagicEntry{static void check(boolean b,String s){if(!b)throw new AssertionError(s);}public static void main(String[] args){
 java.util.concurrent.ExecutorService worker=new java.util.concurrent.AbstractExecutorService(){public void execute(Runnable r){r.run();}public void shutdown(){}public java.util.List<Runnable> shutdownNow(){return java.util.List.of();}public boolean isShutdown(){return false;}public boolean isTerminated(){return false;}public boolean awaitTermination(long t,java.util.concurrent.TimeUnit u){return true;}};
 Activity c=new Activity();c.pm.pages.put(NativeIslandMode.OLD_PAGE,new ActivityInfo());c.pm.pages.put(NativeIslandMode.NEW_PAGE,new ActivityInfo());
 NativeIslandSettings.open(c,worker);check(RootShell.commands.isEmpty(),"unknown mode guessed an entry");
 for(String mode:new String[]{NativeIslandMode.LEGACY,NativeIslandMode.MODERN}){
  RootShell.commands.clear();c.prefs.values.put(NativeIslandMode.DIAGNOSTIC,NativeIslandMode.stamp(c,mode));
  NativeIslandSettings.open(c,worker);check(RootShell.commands.size()==2&&RootShell.commands.get(0).startsWith("pm enable")&&RootShell.commands.get(1).contains(NativeIslandMode.page(mode)),"wrong page or no phone entry");
  check(c.resolver.settings.isEmpty(),"browsing altered system switches");
  RootShell.failStart=true;RootShell.commands.clear();NativeIslandSettings.open(c,worker);
  check(RootShell.commands.size()==3&&RootShell.commands.get(2).startsWith("pm default-state"),"failed entry did not restore component");RootShell.failStart=false;
 }
 System.out.println("PASS real settings entry: modern/legacy target, unknown mode, browse isolation and failure rollback");}}'''
with tempfile.TemporaryDirectory(prefix='duo-magic-selection-') as temp:
    folder=Path(temp)
    for name,source in files.items():
        target=folder/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(source,encoding='utf-8')
    java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
    for mode in ['modern','legacy']:
        subprocess.run([str(java/'java.exe'),'-cp',str(folder),'ls.augment.com.hook.TestMagicSettingHook',mode],check=True,timeout=20)
    subprocess.run([str(java/'java.exe'),'-cp',str(folder),'ls.augment.com.TestMagicEntry'],check=True,timeout=20)
