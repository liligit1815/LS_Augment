"""Exercise the production fixed-level controller without Android hardware writes.

Checks all five direct selections without calibration, a failed OEM ownership
session followed by a new level, maximum-power release, OEM off, and retired
RPM/maximum configuration. Device RPM and OEM timing still need verification.
"""
from pathlib import Path
import os
import re
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
FILES = {
    "android/content/Context.java": '''package android.content;public class Context {
public static final String POWER_SERVICE="power";private final ContentResolver resolver=new ContentResolver();
public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}
public Object getSystemService(String name){return new android.os.PowerManager();}
public Intent registerReceiver(Object receiver,IntentFilter filter){return new Intent();}}
''',
    "android/content/ContentResolver.java": '''package android.content;public class ContentResolver {
public android.os.Bundle call(android.net.Uri uri,String method,String arg,android.os.Bundle extras){android.os.Bundle b=new android.os.Bundle();b.putBoolean("ok",true);return b;}}
''',
    "android/content/Intent.java": 'package android.content;public class Intent {public static final String ACTION_BATTERY_CHANGED="battery";public int getIntExtra(String name,int fallback){return 300;}}',
    "android/content/IntentFilter.java": 'package android.content;public class IntentFilter {public IntentFilter(String action){}}',
    "android/net/Uri.java": 'package android.net;public class Uri {public static Uri parse(String text){return new Uri();}}',
    "android/os/BatteryManager.java": 'package android.os;public class BatteryManager {public static final String EXTRA_TEMPERATURE="temp";}',
    "android/os/Build.java": 'package android.os;public class Build {public static String DEVICE="NX809J",MODEL="NX809J",PRODUCT="NX809J";public static class VERSION {public static int SDK_INT=35;}public static class VERSION_CODES {public static final int Q=29;}}',
    "android/os/Bundle.java": '''package android.os;public class Bundle extends java.util.HashMap<String,Object> {
public void putBoolean(String key,boolean value){put(key,value);}public void putString(String key,String value){put(key,value);}
public boolean getBoolean(String key){return Boolean.TRUE.equals(get(key));}}
''',
    "android/os/SystemClock.java": 'package android.os;public class SystemClock {public static long now;public static long elapsedRealtime(){return now;}}',
    "android/os/PowerManager.java": 'package android.os;public class PowerManager {public static final int THERMAL_STATUS_SEVERE=3;public static int thermal;public int getCurrentThermalStatus(){return thermal;}}',
    "android/os/Looper.java": 'package android.os;public class Looper {public static final Looper WORKER=new Looper();public static Looper myLooper(){return WORKER;}}',
    "android/os/HandlerThread.java": 'package android.os;public class HandlerThread {public HandlerThread(String name){}public void start(){}public Looper getLooper(){return Looper.WORKER;}public void quitSafely(){}}',
    "android/os/Handler.java": 'package android.os;public class Handler {private final Looper looper;public Handler(Looper l){looper=l;}public Looper getLooper(){return looper;}public void post(Runnable r){}public void postDelayed(Runnable r,long delay){}public void removeCallbacks(Runnable r){}}',
    "android/provider/Settings.java": '''package android.provider;public class Settings {public static class System {
public static int mode=1,manual=2;public static int getInt(android.content.ContentResolver resolver,String key){return key.equals("fan_state_of_mode")?mode:manual;}}}
''',
    "io/github/libxposed/api/XposedInterface.java": 'package io.github.libxposed.api;public class XposedInterface {public interface HookHandle {}}',
    "ls/augment/com/FanHardwareIdentity.java": 'package ls.augment.com;public class FanHardwareIdentity {public static String current(){return "a".repeat(64);}}',
    "ls/augment/com/hook/AugmentModule.java": '''package ls.augment.com.hook;public class AugmentModule {
interface Interceptor {Object apply(Chain chain)throws Throwable;}interface Chain {Object proceed()throws Throwable;Object getThisObject();Object getArg(int n);}
static class Builder implements io.github.libxposed.api.XposedInterface.HookHandle {Builder intercept(Interceptor interceptor){return this;}}
Builder prepareFeatureHook(java.lang.reflect.Method method,String label,boolean deopt){return new Builder();}
void registerFeatureHook(io.github.libxposed.api.XposedInterface.HookHandle handle){}void logFeatureInfo(String text){}
void logFeatureError(String stage,Throwable error){}}
''',
    "ls/augment/com/hook/FeatureSettings.java": '''package ls.augment.com.hook;public class FeatureSettings {
static final java.util.Map<String,String> values=new java.util.HashMap<>(),diagnostics=new java.util.HashMap<>();
static final String GAME_MASTER="ls_augment_game_master",FAN_FIXED_ENABLED="ls_augment_fan_fixed_enabled";
static final String FAN_CONTROL_INSTALLED="installed",FAN_CONTROL_ACTIVE="active",FAN_CONTROL_LAST_ERROR="error";
static android.content.Context from(Object owner){return new android.content.Context();}
static boolean enabled(android.content.Context context,String key,boolean fallback){return values.containsKey(key)?"1".equals(values.get(key)):fallback;}
static int integer(android.content.Context context,String key,int fallback,int min,int max){try{int value=Integer.parseInt(values.get(key));return value>=min&&value<=max?value:fallback;}catch(RuntimeException invalid){return fallback;}}
static String text(android.content.Context context,String key,String fallback){return values.getOrDefault(key,fallback);}
static void diagnostic(android.content.Context context,String key,String value){diagnostics.put(key,value);}
static String diagnosticValue(android.content.Context context,String key){return diagnostics.getOrDefault(key,"");}
static void addSnapshotListener(android.content.Context context,Runnable listener){}}
''',
    "ls/augment/com/hook/TestFanFixedRuntime.java": r'''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import android.provider.Settings;import ls.augment.com.ConfigSchema;
public class TestFanFixedRuntime {
static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
public static class Nodes {
 static int enabled=1,level=2,writes,pendingLevel=-1;static long delayMs,applyAt;static boolean dropWrites,rpmOverride;static String rpm;
 static final int[] RPM={0,4200,8360,13300,16400,19600};
 public static String read(String path){
  if(pendingLevel>=0&&android.os.SystemClock.now>=applyAt){level=pendingLevel;pendingLevel=-1;}
  if(path.endsWith("fan_speed_count")&&rpmOverride)return rpm;
  return String.valueOf(path.endsWith("fan_enable")?enabled:path.endsWith("fan_speed_level")?level:enabled==1?RPM[level]:0);}
 public static void write(String path,String value){check(path.endsWith("fan_speed_level"),"never write fan enable or RPM");writes++;
  if(dropWrites)return;int next=Integer.parseInt(value);if(delayMs==0)level=next;else{pendingLevel=next;applyAt=android.os.SystemClock.now+delayMs;}}
}
public static class Owner {
 int maximum,cancel,notify;void fanMaxSpeed(){maximum++;}void fanFullSpeed(){throw new AssertionError("retired OEM full-speed feature");}
 void cancelFanFullSpeed(){cancel++;}void notifyCubeFan(){notify++;Nodes.level=Settings.System.mode==0?4:2;}
}
static Object controller;static Owner owner;
static Object field(String name)throws Exception {Field field=controller.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(controller);}
static void tick(){android.os.SystemClock.now+=900;
 // Motor/queue time is virtual; ensure diagnostic wall-clock throttling does not hide its state.
 try{Field field=controller.getClass().getDeclaredField("lastDiagnosticAt");field.setAccessible(true);field.setLong(controller,0);}
 catch(ReflectiveOperationException error){throw new AssertionError(error);}
 ((Runnable)controller).run();}
static void create(boolean verified)throws Exception {
 FeatureSettings.diagnostics.clear();Settings.System.mode=1;Settings.System.manual=2;Nodes.enabled=1;Nodes.level=2;Nodes.writes=0;
 Nodes.pendingLevel=-1;Nodes.delayMs=0;Nodes.dropWrites=false;Nodes.rpmOverride=false;Nodes.rpm=null;android.os.PowerManager.thermal=0;
 owner=new Owner();FanCompatibilityProfile profile=FanCompatibilityProfile.resolve(verified?"NX809J":"NX769J","","",true,true,true,true,p->true);
 Class<?> type=Class.forName("ls.augment.com.hook.FanControlHook$Controller");Constructor<?> ctor=type.getDeclaredConstructors()[0];ctor.setAccessible(true);
 controller=ctor.newInstance(new AugmentModule(),Nodes.class.getMethod("write",String.class,String.class),Nodes.class.getMethod("read",String.class),profile);
 Method start=type.getDeclaredMethod("start",android.content.Context.class,Object.class);start.setAccessible(true);start.invoke(controller,new android.content.Context(),owner);
}
static void select(int level){FeatureSettings.values.put(ConfigSchema.FAN_FIXED_LEVEL,String.valueOf(level));awaitLevel(level);}
static void awaitLevel(int level){
 for(int n=0;n<12;n++){tick();String state=FeatureSettings.diagnostics.getOrDefault("active","");
  if(state.startsWith("controlled;kind=fixed_level;")&&state.contains(";level="+level+";")&&Nodes.level==level){check(Nodes.enabled==1,"selection preserves OEM enabled state");return;}}
 throw new AssertionError("fixed "+level+" did not apply: "+FeatureSettings.diagnostics);}
public static void main(String[] args)throws Exception {
 FeatureSettings.values.put(FeatureSettings.GAME_MASTER,"1");FeatureSettings.values.put(FeatureSettings.FAN_FIXED_ENABLED,"1");
 FeatureSettings.values.put(ConfigSchema.FAN_UNLOCK_MAX,"1");FeatureSettings.values.put(ConfigSchema.FAN_TARGET_RPM,"99999");
 FeatureSettings.values.put(ConfigSchema.FAN_FIXED_LEVEL,"0");create(true);awaitLevel(1);
 check(Nodes.level==1,"legacy RPM selection zero becomes level one and ignores requested RPM");
 for(int level=1;level<=5;level++)select(level);
 check(!FeatureSettings.values.containsKey(ConfigSchema.FAN_MEASUREMENT),"all levels work without measurement");
 check(owner.maximum==1,"level five requests its verified OEM power once");
 select(1);check(owner.cancel==1&&owner.notify==1,"leaving level five releases power before lower speed");
 check(FeatureSettings.diagnostics.get("active").contains(";restore_level=2;"),"switches preserve original restore level");
 Settings.System.mode=0;Nodes.level=4;tick();check(FeatureSettings.diagnostics.get("active").startsWith("locked;"),"OEM mode change suspends old control");
 select(3);check(FeatureSettings.diagnostics.get("active").contains(";restore_level=4;"),"new explicit level unlocks old OEM session and captures current restore level");
 Nodes.level=4;tick();check(FeatureSettings.diagnostics.get("active").startsWith("locked;"),"external driver change suspends old request");
 select(2);check(Nodes.level==2,"new level recovers from failed session without tile token");
 int beforeReselect=Nodes.writes;FeatureSettings.values.put(ConfigSchema.FAN_TILE_REQUEST,"a".repeat(32));awaitLevel(2);
 check(Nodes.writes==beforeReselect&&FeatureSettings.diagnostics.get("active").contains(";restore_level=4;"),"same-level explicit token preserves owned session and original restore point");
 Settings.System.manual=1;Nodes.level=4;tick();check(FeatureSettings.diagnostics.get("active").startsWith("locked;"),"OEM manual-state change suspends same-level request");
 FeatureSettings.values.put(ConfigSchema.FAN_TILE_REQUEST,"b".repeat(32));awaitLevel(2);
 check(Nodes.level==2&&FeatureSettings.diagnostics.get("active").contains(";restore_level=4;")
  &&FeatureSettings.diagnostics.get("active").contains(";selection="+"b".repeat(32)+";"),"new token reapplies unchanged level after OEM takeover");
 select(5);select(1);check(owner.maximum==2&&owner.cancel==2,"five to one remains repeatable");
 FeatureSettings.values.put(FeatureSettings.FAN_FIXED_ENABLED,"0");tick();check(Nodes.level==4&&Nodes.enabled==1,"fixed off restores captured OEM level without stopping fan");
 int writes=Nodes.writes;tick();check(Nodes.writes==writes&&owner.maximum==2,"retired highest and RPM fields cannot command fan");
 FeatureSettings.values.put(FeatureSettings.FAN_FIXED_ENABLED,"1");create(true);select(3);Nodes.enabled=0;tick();
 check(Nodes.enabled==0&&Nodes.level==2,"OEM off restores remembered level and never starts fan");
 create(true);select(3);String measurement=System.currentTimeMillis()+":"+"d".repeat(32);
 FeatureSettings.values.put(ConfigSchema.FAN_CALIBRATION_REQUEST,measurement);tick();
 check(field("controlKind").toString().equals("CALIBRATION")&&field("capturedLevel").equals(2),"measurement inherits original OEM restore point");
 FeatureSettings.values.put(ConfigSchema.FAN_TILE_REQUEST,"c".repeat(32));tick();tick();
 check(field("controlKind").toString().equals("CALIBRATION")&&field("capturedLevel").equals(2)
  &&field("activeCalibrationRequest").equals(measurement),"same-level token during measurement preserves measurement and restore ownership");
 FeatureSettings.values.put(ConfigSchema.FAN_CALIBRATION_REQUEST,"");Nodes.enabled=0;tick();
 check(Nodes.enabled==0&&Nodes.level==2,"cancelled measurement keeps OEM fan off and restores its remembered level");

 // F03: the production controller must observe an asynchronous acknowledgement,
 // then fail a genuinely unacknowledged command without repeated writes.
 FeatureSettings.values.put(ConfigSchema.FAN_FIXED_LEVEL,"3");create(true);Nodes.delayMs=1800;
 for(int n=0;n<12&&Nodes.writes==0;n++)tick();
 check(Nodes.writes==1&&Nodes.level==2&&FeatureSettings.diagnostics.get("active").startsWith("applying;"),"queued OEM level does not report immediate failure");
 tick();check(Nodes.writes==1&&Nodes.level==2&&FeatureSettings.diagnostics.get("error").isEmpty(),"unacknowledged in-window write waits without resubmission");
 tick();check(Nodes.level==3&&FeatureSettings.diagnostics.get("active").startsWith("controlled;"),"delayed acknowledgement enters controlled state");
 create(true);Nodes.dropWrites=true;
 for(int n=0;n<12&&Nodes.writes==0;n++)tick();int pendingWrites=Nodes.writes;
 tick();tick();tick();check(field("sessionLocked").equals(false),"pending command stays unlocked before the three-second deadline");
 tick();check(field("sessionLocked").equals(true)&&FeatureSettings.diagnostics.get("error").contains("fan_level_not_applied"),"unacknowledged command still fails after bounded timeout");
 check(Nodes.writes==pendingWrites+1,"timeout attempts only one owned restore, without retrying the failed target");

 // F04: startup feedback may be briefly absent, but cannot grant a level write.
 create(true);Nodes.rpmOverride=true;Nodes.rpm="0";tick();long started=android.os.SystemClock.now;
 android.os.SystemClock.now=started+FanRpmStartup.STARTUP_TIMEOUT_MS-900-1;tick();
 check(Nodes.writes==0&&field("sessionLocked").equals(false)&&FeatureSettings.diagnostics.get("active").contains("waiting_for_rpm"),"invalid startup RPM waits without taking hardware ownership");
 android.os.SystemClock.now=started+FanRpmStartup.STARTUP_TIMEOUT_MS-900;tick();
 check(Nodes.writes==0&&field("sessionLocked").equals(true)&&"rpm_invalid".equals(FeatureSettings.diagnostics.get("error")),"startup invalid RPM locks at the six-second boundary without a write");
 create(true);Nodes.rpmOverride=true;Nodes.rpm=null;tick();Nodes.rpm="8360";tick();
 check(Nodes.writes==0&&field("controlKind").toString().equals("NONE"),"one valid RPM cannot take over startup");
 Nodes.rpm="bad";tick();check(Nodes.writes==0&&field("controlKind").toString().equals("NONE"),"intermittent invalid RPM resets consecutive startup samples");
 Nodes.rpm="8360";tick();check(Nodes.writes==0,"first valid sample after interruption still cannot take over");
 awaitLevel(3);check(Nodes.level==3,"consecutive valid RPM permits takeover after native settling");
 int activeWrites=Nodes.writes;Nodes.rpm=null;tick();
 check(field("sessionLocked").equals(true)&&"rpm_invalid".equals(FeatureSettings.diagnostics.get("error"))&&Nodes.level==2&&Nodes.writes==activeWrites+1,"active-control invalid RPM immediately releases and restores its owned OEM level");
 create(true);Nodes.rpmOverride=true;Nodes.rpm="0";android.os.PowerManager.thermal=3;tick();
 check(Nodes.writes==0&&"thermal_unsafe".equals(FeatureSettings.diagnostics.get("error")),"startup grace never bypasses thermal protection");
 create(true);Nodes.rpmOverride=true;Nodes.rpm="0";Nodes.enabled=0;tick();
 check(Nodes.enabled==0&&Nodes.writes==0&&field("controlKind").toString().equals("NONE"),"startup observation cannot enable an OEM-disabled fan");

 // F05: an OEM mode handoff retains the new mode, including maximum-power release.
 create(true);select(5);int handoffWrites=Nodes.writes;Settings.System.mode=0;Nodes.level=4;tick();
 check(field("sessionLocked").equals(true)&&"vendor_state_changed".equals(FeatureSettings.diagnostics.get("error")),"OEM mode takeover suspends the prior module request");
 check(Nodes.level==4&&Nodes.writes==handoffWrites&&owner.cancel==1&&owner.notify==1,"OEM handoff releases maximum power without writing the captured stale level");
 tick();check(Nodes.writes==handoffWrites&&Nodes.level==4,"an unchanged old request cannot reacquire an OEM handoff");
 FeatureSettings.values.put(FeatureSettings.FAN_FIXED_ENABLED,"0");create(false);tick();
 check(owner.maximum==0&&Nodes.writes==0,"old OEM-only maximum feature remains inactive");
 System.out.println("PASS production FanControlHook fixed runtime: "+checks+" checks (facade; physical RPM/timing unverified)");
}}
''',
}

hook = (SRC / "hook/FanControlHook.java").read_text(encoding="utf-8")
schema = (SRC / "ConfigSchema.java").read_text(encoding="utf-8")
constants = sorted(set(re.findall(r"ConfigSchema\.([A-Z][A-Z0-9_]+)", hook + FILES["ls/augment/com/hook/TestFanFixedRuntime.java"])))
schema_constants = dict(re.findall(r'public static final String (\w+) = "([^"]+)";', schema))
FILES["ls/augment/com/ConfigSchema.java"] = "package ls.augment.com;public class ConfigSchema {" + "".join(
    f'public static final String {name}="{schema_constants[name]}";' for name in constants) + "}"
for name in ["FanCalibrationData.java", "FanCalibrationOutcome.java", "hook/FanControlHook.java", "hook/FanControlPolicy.java", "hook/FanCompatibilityProfile.java", "hook/FanPowerLease.java", "hook/FanLevelCommand.java", "hook/FanNativeSettle.java", "hook/FanRpmStartup.java"]:
    FILES["ls/augment/com/" + name] = (SRC / name).read_text(encoding="utf-8")


def java_tool(name):
    found = shutil.which(name)
    if found:
        return found
    candidate = Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin" / (name + (".exe" if os.name == "nt" else ""))
    if candidate.is_file():
        return str(candidate)
    raise SystemExit("Set JAVA_HOME or add a JDK to PATH")


with tempfile.TemporaryDirectory(prefix="lsa-fan-fixed-runtime-") as directory:
    sources = []
    for name, content in FILES.items():
        path = Path(directory) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        sources.append(str(path))
    subprocess.run([java_tool("javac"), "-encoding", "UTF-8", "--release", "17", "-d", directory, *sources], check=True)
    subprocess.run([java_tool("java"), "-cp", directory, "ls.augment.com.hook.TestFanFixedRuntime"], check=True, timeout=15)
