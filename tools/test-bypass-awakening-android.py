"""Run production hooks/lease and C17 drawing on Android 16 with native graphics.
Only module registration/configuration and the inspected OEM entry points are doubled.
This is not a charging-hardware or OEM-process acceptance test.
"""
from pathlib import Path
import os, subprocess, runpy

ROOT=Path(__file__).resolve().parents[1]
BASE=ROOT/'audit-output/four-features-20261112/android-tests'
DEPS=ROOT/'out/header-clock-20455/android-runtime/deps'
JAVA=Path(os.environ['JAVA_HOME'])/'bin'
PORTS={
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;
import android.content.Context;import java.util.*;
public final class FeatureSettings {
 static final Map<String,String> values=new HashMap<>(),diagnostics=new HashMap<>();static final List<Runnable> listeners=new ArrayList<>();static boolean verified=true;
 static void clear(){values.clear();diagnostics.clear();listeners.clear();verified=true;}
 static boolean enabled(Context c,String k){return "1".equals(values.get(k));}
 static int integer(Context c,String k,int d,int min,int max){try{return Math.max(min,Math.min(max,Integer.parseInt(values.get(k))));}catch(Exception e){return d;}}
 static boolean hasVerifiedSnapshot(Context c){return verified;}
 static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}
 static Context from(Object o){try{return (Context)o.getClass().getField("mContext").get(o);}catch(Exception e){return null;}}
 static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}
 static void changed(){for(Runnable r:new ArrayList<>(listeners))r.run();}
}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
public final class AugmentModule {
 public static AugmentModule active;public final List<String> logs=new ArrayList<>();
 interface Interceptor {Object run(Chain chain)throws Throwable;}
 interface Chain {Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;}
 static class Builder {final Method method;Interceptor action;Builder(Method m){method=m;}Builder intercept(Interceptor a){action=a;return this;}}
 final Map<Method,List<Interceptor>> hooks=new HashMap<>();
 Builder prepareFeatureHook(Method m,String k,boolean b){return new Builder(m);}void registerFeatureHook(Builder b){hooks.computeIfAbsent(b.method,k->new ArrayList<>()).add(b.action);}
 void deoptimize(Method m){}void logFeatureInfo(String s){logs.add(s);}void logFeatureError(String s,Throwable t){throw new AssertionError(s,t);}
 public Object call(Method m,Object target,Object...args)throws Throwable{m.setAccessible(true);List<Interceptor> list=hooks.getOrDefault(m,Collections.emptyList());return new Chain(){int at;public Object getThisObject(){return target;}public Object getArg(int i){return args[i];}public Object proceed()throws Throwable{if(at<list.size())return list.get(at++).run(this);try{return m.invoke(target,args);}catch(InvocationTargetException e){throw e.getCause();}}}.proceed();}
 public Object invoke(Object target,String name,Class<?>[] types,Object...args)throws Throwable{Class<?> c=target.getClass();while(c!=null){try{return call(c.getDeclaredMethod(name,types),target,args);}catch(NoSuchMethodException e){c=c.getSuperclass();}}throw new NoSuchMethodException(name);}
}''',
'cn/zte/gamefloat/gamekeys/entity/PerformanceModeChangeToast.java':'''package cn.zte.gamefloat.gamekeys.entity;
import android.content.Context;import java.util.*;
public class PerformanceModeChangeToast {private final Context mContext;private final Queue<String> queue=new LinkedList<>();public final List<String> delivered=new ArrayList<>();public PerformanceModeChangeToast(Context c){mContext=c;}public void setType(String value){queue.add(value);delivered.add(value);}public void showToast(){}}
''',
'cn/zte/chargeseparation/ChargeSeparationController.java':'''package cn.zte.chargeseparation;
import android.content.*;import android.provider.Settings;
public class ChargeSeparationController {
 public Context mContext;public boolean mPluggedIn=true;public int mLevel=80,starts,dialogs,migrations;
 public ChargeSeparationController(Context c){mContext=c;}public void init(){}
 public int getChargeSeparationThreshold(){return Settings.Global.getInt(mContext.getContentResolver(),"charge_separation_threshold",80);}
 public boolean isAutoSwitchOn(){return true;}public boolean isEnable(){return mPluggedIn&&mLevel>=20;}public boolean isSwitchOn(){return starts>0;}
 public void updateThresholdStatus(){}public void updateAutoSwitchStatus(){}public void closeChargeSeparation(){}
 public BroadcastReceiver getBatteryReceiver(){return null;}
 public void startChargeSeparation(){if(isEnable())starts++;}public void showAlertDialog(){dialogs++;}
 public void updateThresholdForInit(){migrations++;if(getChargeSeparationThreshold()>90)Settings.Global.putInt(mContext.getContentResolver(),"charge_separation_threshold",90);}
}''',
'com/zte/qs/tiles/ChargeSeparationTile.java':'''package com.zte.qs.tiles;
import android.content.Context;
public class ChargeSeparationTile {public Context mContext;public boolean charging=true;public int level=80,starts,dialogs,errors;public ChargeSeparationTile(Context c){mContext=c;}public boolean isCharging(){return charging;}public void startChargeSeparation(){if(level<20)errors++;else starts++;}public void showAlertDialog(){dialogs++;}}
''',
'androidx/preference/PreferenceViewHolder.java':'''package androidx.preference;public class PreferenceViewHolder {}''',
'com/zte/powersavemode/common/ui/CustomSeekBarPreference.java':'''package com.zte.powersavemode.common.ui;
import android.content.Context;import androidx.preference.PreferenceViewHolder;
public class CustomSeekBarPreference {private int MIN=20,MAX=90;private final Context context;public String key="separation_charge_seek_bar";public int rendered;public CustomSeekBarPreference(Context c){context=c;}public String getKey(){return key;}public Context getContext(){return context;}public void onBindViewHolder(PreferenceViewHolder h){rendered=MAX;}}
''',
'com/zte/powersavemode/common/utils/SwitchTools.java':'''package com.zte.powersavemode.common.utils;
import android.content.Context;import android.provider.Settings;
public final class SwitchTools {public static void setSeparationThreshold(Context c,int value){Settings.Global.putInt(c.getContentResolver(),"charge_separation_threshold",value);}}
''',
'com/zte/powersavemode/main/PowerSaveModeApp.java':'''package com.zte.powersavemode.main;
import android.content.Context;import com.zte.powersavemode.common.utils.SwitchTools;import ls.augment.com.hook.AugmentModule;
public class PowerSaveModeApp {public Context context;public PowerSaveModeApp(Context c){context=c;}public void onCreate()throws Throwable{AugmentModule.active.call(SwitchTools.class.getDeclaredMethod("setSeparationThreshold",Context.class,int.class),null,context,90);}}
'''
}

def main():
 BASE.mkdir(parents=True,exist_ok=True)
 classes=BASE/'classes';classes.mkdir(exist_ok=True)
 sources=[]
 for name,source in PORTS.items():
  p=BASE/'ports'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf-8');sources.append(p)
 production=['EnhancementOption','GameOptions','ShoulderQuickSwitchPolicy','GamePerformanceMonitorConfig','BypassChargingOptions','BypassSettingsLease','hook/HookCompatibility','hook/BypassChargingHook','hook/BypassNotificationHook','hook/BypassNativeRangeHook','hook/BypassPromptHook','hook/AwakeningPromptHook','hook/CleanupIconImage','hook/CleanupCapsule']
 sources += [ROOT/'android/app/src/main/java/ls/augment/com'/f'{name}.java' for name in production]
 sources += [ROOT/'tools/tests/BypassAwakeningAndroidTest.java']
 jars=list(DEPS.glob('*.jar'))
 cp=os.pathsep.join(map(str,[ROOT/'audit-output/android-sdk/platforms/android-36/android.jar',*jars]))
 subprocess.run([str(JAVA/'javac.exe'),'-J-Duser.language=en','-encoding','UTF-8','-cp',cp,'-d',str(classes),*map(str,sources)],check=True)
 cp=os.pathsep.join(map(str,[classes,*jars]))
 return subprocess.run([str(JAVA/'java.exe'),'-Dfile.encoding=UTF-8','-Drobolectric.dependency.repo.url=https://repo.maven.apache.org/maven2','-Dduo.evidence='+str(BASE),'-cp',cp,'org.junit.runner.JUnitCore','ls.augment.com.hook.BypassAwakeningAndroidTest'],cwd=BASE).returncode
if __name__=='__main__':raise SystemExit(main())
