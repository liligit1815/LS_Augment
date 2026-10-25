"""Run production fan screen-off hooks against the audited OEM decision shape.

Android/Xposed transport is substituted; physical RPM and timing need device QA.
"""
from pathlib import Path
import os
import re
import shutil
import subprocess
import tempfile
import sys

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
FILES = {
"android/content/Context.java": "package android.content;public class Context {}",
"android/os/Build.java": 'package android.os;public class Build {public static String DEVICE="NX809J",PRODUCT="NX809J",MODEL="NX809J";}',
"android/os/Handler.java": '''package android.os;public class Handler {
public static final java.util.Queue<Runnable> queue=new java.util.ArrayDeque<>();
public boolean post(Runnable r){return queue.offer(r);}
public static void drain(){for(int n=0;n<50;n++){Runnable r=queue.poll();if(r==null)return;r.run();}throw new AssertionError("queue loop");}}
''',
"ls/augment/com/hook/AugmentModule.java": '''package ls.augment.com.hook;
import java.lang.reflect.Method;import java.util.*;public class AugmentModule {
public interface Interceptor{Object apply(Chain c)throws Throwable;}public interface Original{Object run()throws Throwable;}
public interface Chain{Object proceed()throws Throwable;Object getThisObject();}
public static final Map<Method,Interceptor> hooks=new HashMap<>();public final Set<String> deoptimized=new HashSet<>();
public static class Builder{Method method;Builder(Method m){method=m;}Builder intercept(Interceptor i){hooks.put(method,i);return this;}}
Builder prepareFeatureHook(Method m,String tag,boolean f){return new Builder(m);}void registerFeatureHook(Builder h){}
void deoptimize(Method m){deoptimized.add(m.getName());}void logFeatureError(String s,Throwable t){throw new AssertionError(s,t);}void logFeatureInfo(String s){}
public static Object invoke(Class<?> type,String name,Object owner,Original original){try{
 Method m=type.getDeclaredMethod(name);Interceptor i=hooks.get(m);if(i==null)return original.run();
 return i.apply(new Chain(){public Object proceed()throws Throwable{return original.run();}public Object getThisObject(){return owner;}});
}catch(RuntimeException|Error e){throw e;}catch(Throwable t){throw new RuntimeException(t);}}}
''',
"ls/augment/com/hook/FeatureSettings.java": '''package ls.augment.com.hook;import android.content.Context;
public class FeatureSettings {static final Context context=new Context();static boolean master=true,on;
static final java.util.Map<String,String> diagnostics=new java.util.HashMap<>();static final java.util.List<Runnable> listeners=new java.util.ArrayList<>();
static Context from(Object o){return context;}static boolean enabled(Context c,String key,boolean d){return key.contains("game_master")?master:on;}
static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}
static void publish(){for(Runnable r:listeners)r.run();}}
''',
"cn/nubia/fan/bean/FanState.java": '''package cn.nubia.fan.bean;import ls.augment.com.hook.AugmentModule;
public class FanState {public boolean screen=true,calling,charging,manual=true,game,running,pc;
public boolean isScreenUnlocked(){return (Boolean)AugmentModule.invoke(FanState.class,"isScreenUnlocked",this,()->screen);}
public boolean isCalling(){return calling;}public boolean isQuickCharge(){return charging;}}
''',
"cn/nubia/fan/policy/FanControllerImpl.java": '''package cn.nubia.fan.policy;
import cn.nubia.fan.bean.FanState;import ls.augment.com.hook.AugmentModule;
public class FanControllerImpl {
public final FanState mCurrentFanState=new FanState();public boolean mLastFanEnable=true,mShutDown;
public android.os.Handler mHandler=new android.os.Handler();public boolean hardware=true,throwUpdate,lateScreen;
public int writes;public Runnable duringUpdate;
public void notifyFanStateChanged(){handleUpdateTheStateOfFan();}
private void handleUpdateTheStateOfFan(){AugmentModule.invoke(FanControllerImpl.class,"handleUpdateTheStateOfFan",this,()->{
 if(throwUpdate)throw new IllegalStateException("oem_failure");if(mShutDown)return null;
 if(duringUpdate!=null)duringUpdate.run();FanState s=mCurrentFanState;boolean next;
 if(s.isCalling())next=false;else if(s.isQuickCharge())next=true;else if(!s.isScreenUnlocked())next=false;
 else next=s.manual||s.game||s.running||s.pc;
 lateScreen=s.isScreenUnlocked();
 if(mLastFanEnable!=next){mLastFanEnable=next;hardware=next;writes++;}return null;});}
public void stopForProtection(){mLastFanEnable=false;hardware=false;writes++;}}
''',
"ls/augment/com/hook/TestFanScreenOffRuntime.java": '''package ls.augment.com.hook;
import cn.nubia.fan.policy.FanControllerImpl;import cn.nubia.fan.bean.FanState;import android.os.Handler;
public class TestFanScreenOffRuntime {static int checks;static void check(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
public static void main(String[] args){AugmentModule module=new AugmentModule();
 if(args.length>0){android.os.Build.DEVICE=android.os.Build.MODEL=android.os.Build.PRODUCT="NX819J";
 FeatureSettings.diagnostics.put("ls_augment_fan_screen_off_installed","old capability");
 check(FanScreenOffHook.install(module,TestFanScreenOffRuntime.class.getClassLoader(),"missing.apk")==0&&AugmentModule.hooks.isEmpty()
 &&"".equals(FeatureSettings.diagnostics.get("ls_augment_fan_screen_off_installed")),"unknown OEM predicate order keeps native policy and revokes prior evidence");}
 check(FanScreenOffHook.install(module,TestFanScreenOffRuntime.class.getClassLoader(),args.length>0?args[0]:null)==2,"two production hooks installed");
 check(module.deoptimized.contains("handleUpdateTheStateOfFan")&&module.deoptimized.contains("notifyFanStateChanged"),"precompiled callers deoptimized");
 FanControllerImpl owner=new FanControllerImpl();owner.mCurrentFanState.screen=false;owner.notifyFanStateChanged();
 check(!owner.hardware&&owner.writes==1,"disabled feature preserves native screen-off stop");
 FeatureSettings.on=true;FeatureSettings.publish();Handler.drain();
 check(!owner.hardware&&owner.writes==1,"enabling while stopped does not start fan");
 owner.mCurrentFanState.screen=true;owner.notifyFanStateChanged();check(owner.hardware,"native screen-on request starts fan");
 int writes=owner.writes;owner.mCurrentFanState.screen=false;owner.notifyFanStateChanged();
 check(owner.hardware&&owner.writes==writes,"screen off retains fan without hardware writes");
 check(!owner.mCurrentFanState.screen&&!owner.mCurrentFanState.isScreenUnlocked(),"real state and unscoped getters stay locked");
 check(!owner.lateScreen,"later OEM helper query sees real screen state");
 owner.mCurrentFanState.manual=false;owner.notifyFanStateChanged();check(!owner.hardware,"manual off stops fan while locked");
 owner.mCurrentFanState.manual=true;owner.notifyFanStateChanged();check(!owner.hardware,"ended session is not resurrected");
 owner.mCurrentFanState.screen=true;owner.notifyFanStateChanged();owner.mCurrentFanState.screen=false;owner.notifyFanStateChanged();
 owner.mCurrentFanState.calling=true;owner.notifyFanStateChanged();check(!owner.hardware&&!owner.lateScreen,"call interruption keeps native stop");
 owner.mCurrentFanState.calling=false;owner.mCurrentFanState.charging=true;owner.notifyFanStateChanged();
 check(owner.hardware&&!owner.lateScreen,"quick charge keeps independent OEM screen-off policy");
 owner.mCurrentFanState.charging=false;owner.notifyFanStateChanged();check(owner.hardware,"active manual request continues after charging");
 FeatureSettings.on=false;FeatureSettings.publish();check(owner.hardware,"observer dispatches on OEM handler");Handler.drain();
 check(!owner.hardware,"disabling immediately restores OEM screen-off stop");
 FeatureSettings.on=true;FeatureSettings.publish();Handler.drain();owner.mCurrentFanState.screen=true;owner.notifyFanStateChanged();
 owner.mCurrentFanState.screen=false;owner.notifyFanStateChanged();owner.stopForProtection();writes=owner.writes;owner.notifyFanStateChanged();
 check(!owner.hardware&&owner.writes==writes,"protection stop never reversed");
 owner.mCurrentFanState.screen=true;owner.notifyFanStateChanged();owner.mCurrentFanState.screen=false;owner.mShutDown=true;owner.stopForProtection();
 owner.notifyFanStateChanged();check(!owner.hardware,"shutdown keeps native stop authoritative");owner.mShutDown=false;
 owner.mCurrentFanState.screen=true;owner.notifyFanStateChanged();owner.mCurrentFanState.screen=false;
 FanState unrelated=new FanState();unrelated.screen=false;
 owner.duringUpdate=()->check(!unrelated.isScreenUnlocked(),"unrelated state cannot consume screen override");owner.notifyFanStateChanged();
 check(owner.hardware,"correct state still receives override");owner.duringUpdate=null;
 owner.throwUpdate=true;try{owner.notifyFanStateChanged();throw new AssertionError("expected OEM exception");}catch(IllegalStateException expected){}
 check(!owner.mCurrentFanState.isScreenUnlocked(),"exception cleanup removes override");owner.throwUpdate=false;
 FeatureSettings.master=false;FeatureSettings.publish();Handler.drain();check(!owner.hardware,"disabled master restores OEM policy");
 check(FeatureSettings.listeners.size()==1,"one configuration listener per runtime");
 System.out.println("PASS production FanScreenOffHook: "+checks+" checks (OEM facade; physical RPM unverified)");}}
''',
}

schema = (SRC / "ConfigSchema.java").read_text(encoding="utf-8")
constants = dict(re.findall(r'public static final String (\w+) = "([^"]+)";', schema))
FILES["ls/augment/com/ConfigSchema.java"] = "package ls.augment.com;public class ConfigSchema {" + "".join(
    f'public static final String {name}="{constants[name]}";' for name in ["GAME_MASTER", "FAN_SCREEN_OFF_ENABLED"]) + "}"
FILES["ls/augment/com/FanHardwareIdentity.java"]='package ls.augment.com;public class FanHardwareIdentity {public static String current(){return "firmware-test";}}'
for name in ["FanScreenOffPolicy.java", "hook/FanScreenOffHook.java", "hook/FanOemContract.java"]:
    FILES["ls/augment/com/" + name] = (SRC / name).read_text(encoding="utf-8")


def java_tool(name):
    found = shutil.which(name)
    if found:
        return found
    candidate = Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin" / (name + (".exe" if os.name == "nt" else ""))
    if candidate.is_file():
        return str(candidate)
    raise SystemExit("Set JAVA_HOME or add a JDK to PATH")


with tempfile.TemporaryDirectory(prefix="lsa-fan-screen-off-") as directory:
    sources = []
    for name, content in FILES.items():
        path = Path(directory) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        sources.append(str(path))
    subprocess.run([java_tool("javac"), "-encoding", "UTF-8", "--release", "17", "-d", directory, *sources], check=True)
    subprocess.run([java_tool("java"), "-cp", directory, "ls.augment.com.hook.TestFanScreenOffRuntime", *sys.argv[1:]], check=True, timeout=15)
