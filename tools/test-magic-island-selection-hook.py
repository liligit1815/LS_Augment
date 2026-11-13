"""Exercise real setting observers and authenticated publication, old/new branches."""
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
  AugmentModule module=new AugmentModule();NativeIslandSettingsHook.install(module,TestMagicSettingHook.class.getClassLoader());
  String key=modern?"dynamic_island_function_switch":"dynamic_island_switch_state";
  c.resolver.settings.put(key,1);
  FeatureSettings.verified=false;NativeIslandSettingsHook.attach(c);flush();check(c.resolver.calls.isEmpty(),"unverified startup imported state");
  FeatureSettings.verified=true;NativeIslandSettingsHook.attach(c);flush();check(c.resolver.calls.isEmpty(),"page entry imported stale selection");
  FeatureSettings.flags.put("duo",true);NativeIslandSettingsHook.synchronize(c,true);c.resolver.observer.onChange(false);flush();
  check(c.resolver.calls.isEmpty(),"same-state feedback saved another snapshot");
  c.resolver.settings.put(key,0);c.resolver.observer.onChange(false);flush();
  check(c.resolver.calls.size()==1&&!c.resolver.calls.get(0).getBoolean("enabled"),"system OFF did not publish unified switch");
  check((modern?"fullscreen":"ordinary").equals(c.resolver.calls.get(0).getString("mode","")),"wrong runtime backend");
  FeatureSettings.flags.put("duo",false);NativeIslandSettingsHook.synchronize(c,false);c.resolver.observer.onChange(false);flush();
  check(c.resolver.calls.size()==1,"system OFF feedback loop");
  c.resolver.settings.put(key,1);c.resolver.observer.onChange(false);flush();
  check(c.resolver.calls.size()==2&&c.resolver.calls.get(1).getBoolean("enabled"),"system ON did not publish unified switch");
  FeatureSettings.flags.put("duo",true);NativeIslandSettingsHook.synchronize(c,true);flush();
  check(c.resolver.settings.get(key)==1,"Duo ON failed to synchronize native backend");
  FeatureSettings.flags.put("duo",false);NativeIslandSettingsHook.synchronize(c,false);flush();
  check(c.resolver.settings.get(key)==0,"Duo OFF failed to synchronize native backend");
  FeatureSettings.verified=false;NativeIslandSettingsHook.synchronize(c,true);
  check(c.resolver.settings.get(key)==0,"unverified configuration wrote system settings");
  System.out.println("PASS production "+args[0]+" selection hooks: "+checks+" assertions");
 }}'''
with tempfile.TemporaryDirectory(prefix='duo-magic-selection-') as temp:
    folder=Path(temp)
    for name,source in files.items():
        target=folder/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(source,encoding='utf-8')
    java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
    for mode in ['modern','legacy']:
        subprocess.run([str(java/'java.exe'),'-cp',str(folder),'ls.augment.com.hook.TestMagicSettingHook',mode],check=True,timeout=20)
