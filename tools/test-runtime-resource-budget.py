"""Execute production hot-path/retry/sampling methods with deterministic clocks and I/O counters."""
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'


def member(source, signature):
    start = source.index(signature)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


settings = (SRC / 'hook/FeatureSettings.java').read_text(encoding='utf-8')
grid = (SRC / 'hook/StatusBarGridHook.java').read_text(encoding='utf-8')
audio = (SRC / 'hook/AudioGainHook.java').read_text(encoding='utf-8')
members = '\n'.join(member(settings, signature) for signature in (
    'static ConfigSnapshot snapshot(Context context)', 'static boolean verifiedDisabled',
    'static void invalidateSnapshot()',
    'private static void diagnostic(Context context, String key, String value, boolean homeReadiness)',
    'private static void writePendingDiagnostic', 'private static void expireDiagnostic',
    'private static <T> void cacheValue', 'private static final class PendingDiagnostic',
    'private static long diagnosticWriteDelay',
    'private static ConfigSnapshot providerSnapshot'))
constants = '\n'.join(re.findall(
    r'private static final (?:int|long) (?:CACHE_MS|MAX_DIAGNOSTIC_CACHE|DIAGNOSTIC_RETRY_WINDOW_MS) = [^;]+;', settings))
sampler = grid.split('            if(itemEnabled("cpu")||itemEnabled("gpu")){', 1)[1].split('            main.post(()->', 1)[0]
sampler = 'if(itemEnabled("cpu")||itemEnabled("gpu")){' + sampler
assert 'FeatureSettings.addSnapshotListener(context' in audio

HARNESS = r'''package ls.augment.com;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

public final class RuntimeResourceBudgetTest {
 static int checks;
 static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static final class SystemClock {static long now=100000;static long elapsedRealtime(){return now;}}
 static final class Bundle {
  final Map<String,Object> values=new HashMap<>();
  boolean getBoolean(String key,boolean fallback){return (Boolean)values.getOrDefault(key,fallback);}
  String getString(String key){return (String)values.get(key);}
  String getString(String key,String fallback){return (String)values.getOrDefault(key,fallback);}
  long getLong(String key,long fallback){return ((Number)values.getOrDefault(key,fallback)).longValue();}
  int getInt(String key,int fallback){return ((Number)values.getOrDefault(key,fallback)).intValue();}
  double getDouble(String key,double fallback){return ((Number)values.getOrDefault(key,fallback)).doubleValue();}
 }
 static final class Context {
  int hardwareReads;Bundle reply;
  Context getContentResolver(){return this;}
  Bundle call(Object uri,String method,Object arg,Object extras){if(method.equals("hardware_telemetry")){hardwareReads++;return null;}return reply;}
 }
 static final class Uri {static String parse(String value){return value;}}
 static final class ConfigReadRetry {
  interface Read<T>{T run()throws Exception;}
  static <T>T read(Read<T> action)throws Exception{return action.run();}
  static String failure(Throwable error){return "unavailable";}
 }
 static final class ConfigSnapshot {
  int schemaVersion=1;long revision=1,updatedAt=1;String scope="device",checksum="valid";
  String get(String key){return "0";}
  static class ParseResult{ConfigSnapshot snapshot;String error="invalid";ParseResult(ConfigSnapshot value){snapshot=value;}}
  static class Reader{ConfigSnapshot verified=new ConfigSnapshot();ParseResult read(String raw){return new ParseResult("valid".equals(raw)?verified:null);}}
 }
 static final class HookTelemetry{static void event(String value){}}
 static final class FeatureSettings {
  // CONSTANTS
  static long cachedAt=SystemClock.now;static boolean verifiedSnapshot;
  static ConfigSnapshot cachedSnapshot=new ConfigSnapshot();
  static final ConfigSnapshot.Reader PROVIDER_READER=new ConfigSnapshot.Reader();
  static String providerReadState="";static final Map<String,String> startupReadFailures=new HashMap<>();
  static void startupReadFailure(String a,String b,Throwable c){}
  static final String PROVIDER="provider";
  static final AtomicLong invalidations=new AtomicLong(),diagnosticQueueFull=new AtomicLong(),diagnosticExpired=new AtomicLong();
  static final Object DIAGNOSTIC_QUEUE_LOCK=new Object();
  static final Map<String,PendingDiagnostic> DIAGNOSTICS=new ConcurrentHashMap<>();
  static final Map<String,String> DIAGNOSTIC_VALUES=new ConcurrentHashMap<>();
  static String diagnosticLastDropReason="",diagnosticLastDropKey="";static long diagnosticLastDropAt;
  static int refreshes,writes;
  static Context remember(Context context){return context;}
  static void requestRefresh(){refreshes++;}
  static void scheduleWrites(long delay){writes++;}static void scheduleHomeReadinessWrite(){}
  static String safeDiagnosticKey(String key){return key;}
  static Runnable duringWrite;
  static boolean writeDiagnostic(String key,PendingDiagnostic value){
   if(duringWrite!=null){Runnable action=duringWrite;duringWrite=null;action.run();}
   value.retryAt=SystemClock.now+30000;value.failures++;return false;
  }
  static void diagnostic(Context context,String key,String value){diagnostic(context,key,value,false);}
  static final Set<String> flags=new HashSet<>();
  static boolean enabled(Context context,String key){return flags.contains(key);}
  static String text(Context context,String key,String fallback){return fallback;}
  static int integer(Context context,String key,int fallback,int min,int max){return fallback;}
  // MEMBERS
 }
 static final class TrafficStats {
  static int reads;static long getTotalRxBytes(){reads++;return 10000;}
  static long getTotalTxBytes(){reads++;return 5000;}
 }
 static final class Metrics {
  final Context context=new Context();final Set<String> enabled=new HashSet<>();
  final List<String> reads=new ArrayList<>();boolean missing;
  long previousRx=-1,previousTx=-1,previousTime;
  boolean itemEnabled(String key){return enabled.contains(key);}
  Long readLong(String path){reads.add(path);return missing?null:path.endsWith("temp")?350L:path.endsWith("voltage_now")?4000000L:2000000L;}
  String read(String path){reads.add(path);return "Charging";}
  String temperature(String kind){reads.add("thermal:"+kind);return "—";}
  String temperatureLabel(String kind){return kind.equals("cpu")?"C:":"G:";}
  String metricNumber(String kind,double value){return String.valueOf(value);}
  String rate(long value){return String.valueOf(value);}int networkMode(){return 0;}
  Map<String,String> sample(){Map<String,String> values=new LinkedHashMap<>();
   // SAMPLER
   return values;
  }
 }
 static class Handler {
  final Set<Runnable> pending=new HashSet<>();
  void removeCallbacks(Runnable task){pending.remove(task);}void postDelayed(Runnable task,long delay){pending.add(task);}
 }
 static class LoudnessEnhancer {
  boolean released;LoudnessEnhancer(int session){}void release(){released=true;}
  boolean hasControl(){return true;}void setTargetGain(int value){}void setEnabled(boolean enabled){}
  boolean getEnabled(){return true;}int getTargetGain(){return 0;}
 }
 static class AudioAttributes {
  static final int USAGE_ALARM=4,USAGE_NOTIFICATION_RINGTONE=2,USAGE_MEDIA=1,USAGE_GAME=14,USAGE_UNKNOWN=0;
  int getUsage(){return 1;}
 }
 static class Audio {
  boolean enabled,observingConfig;String lastError="",lastDiagnostic="";
  final Context context=new Context();final Handler handler=new Handler();final Runnable tick=this::apply;
  final Set<Object> players=new HashSet<>();final Map<String,Integer> extras=new HashMap<>();
  final Map<Integer,LoudnessEnhancer> effects=new HashMap<>();
  boolean enabled(){return enabled;}Object invoke(Object player,String method){throw new AssertionError("no player expected");}
  String route(int stream){return "speaker";}int nativeVolume(String method,int stream){return 10;}
  String id(String route,int stream){return route+stream;}int extra(String route,int stream){return 0;}
  int step(){return 5;}int limit(String route,int stream){return 100;}
  // AUDIO_APPLY
 }
 static final class File {
  static int scans;static File[] zones={new File("/sys/class/thermal/thermal_zone0")};
  final String path;File(String path){this.path=path;}File(File parent,String name){this.path=parent.path+"/"+name;}
  String getPath(){return path;}File[] listFiles(){scans++;return zones;}
 }
 static final class Sensors {
  final Map<String,String> thermalPaths=new HashMap<>();final Map<String,Long> thermalScanAfter=new HashMap<>();
  String type="cpu-hw-trip-0";Long value=105000L;
  String read(String path){return type;}Long readLong(String path){return value;}
  String temperatureLabel(String kind){return "C:";}String metricNumber(String kind,double number){return String.valueOf(number);}
  // TEMPERATURE
 }
 public static void main(String[] args){
  Context context=new Context();FeatureSettings.cachedAt=SystemClock.now;
  for(boolean verified:new boolean[]{false,true}){
   FeatureSettings.verifiedSnapshot=verified;FeatureSettings.refreshes=0;
   for(int i=0;i<100000;i++){FeatureSettings.snapshot(context);FeatureSettings.verifiedDisabled("off");}
   check(FeatureSettings.refreshes==0,"hot/cold getters must respect worker retry cadence");
  }
  SystemClock.now+=1000;FeatureSettings.snapshot(context);check(FeatureSettings.refreshes==0,"hot hooks must not reintroduce one-second polls");
  SystemClock.now+=4000;FeatureSettings.snapshot(context);check(FeatureSettings.refreshes==1,"five-second missed-notification recovery");
  FeatureSettings.cachedAt=SystemClock.now;FeatureSettings.invalidateSnapshot();check(FeatureSettings.refreshes==2,"notifications still refresh immediately");
  Bundle reply=new Bundle();reply.values.putAll(Map.of("ok",true,"snapshot","valid","schemaVersion",1,"revision",1L,"updatedAt",1L,"scope","device","checksum","valid"));context.reply=reply;
  check(FeatureSettings.providerSnapshot(context)!=null,"valid provider snapshot accepted");
  for(String key:List.of("schemaVersion","revision","updatedAt","scope","checksum")){
   Object saved=reply.values.get(key);reply.values.put(key,saved instanceof Number?2:"wrong");
   check(FeatureSettings.providerSnapshot(context)==null,"cached payload must not bypass metadata: "+key);reply.values.put(key,saved);
  }
  reply.values.put("ok",false);check(FeatureSettings.providerSnapshot(context)==null,"cached payload cannot authorize rejected reply");
  reply.values.put("ok",true);reply.values.put("snapshot","corrupt");check(FeatureSettings.providerSnapshot(context)==null,"invalid new payload is not cached authorization");
  for(boolean fast:new boolean[]{false,true}){
   String key="ls_augment_test";FeatureSettings.DIAGNOSTICS.clear();FeatureSettings.DIAGNOSTIC_VALUES.clear();
   FeatureSettings.diagnostic(context,key,"one",fast);var first=FeatureSettings.DIAGNOSTICS.get(key);long started=first.retryStartedElapsed;
   FeatureSettings.duringWrite=()->FeatureSettings.diagnostic(context,key,"during_ipc",fast);
   FeatureSettings.writePendingDiagnostic(key,first);var second=FeatureSettings.DIAGNOSTICS.get(key);
   check(second!=first&&second.retryAt==first.retryAt&&second.failures==1,"replacement during IPC must inherit failure backoff");
   SystemClock.now+=1000;FeatureSettings.diagnostic(context,key,"newer",fast);var third=FeatureSettings.DIAGNOSTICS.get(key);
   check(third.retryAt==first.retryAt&&third.retryStartedElapsed==started&&third.failures==1,"changing values must not reset backoff/expiry");
   FeatureSettings.expireDiagnostic(key,third);check(!FeatureSettings.DIAGNOSTIC_VALUES.containsKey(key),"expired value can be retried after recovery");
  }
  FeatureSettings.diagnostic(context,"pinned","pending",false);
  for(int i=0;i<4096;i++){
   String key="ls_augment_display_"+i;FeatureSettings.diagnostic(context,key,"status",false);FeatureSettings.DIAGNOSTICS.remove(key);
   check(FeatureSettings.DIAGNOSTIC_VALUES.size()<=1024,"diagnostic history grew without bound");
  }
  check(FeatureSettings.DIAGNOSTIC_VALUES.containsKey("pinned"),"pending delivery lost its dedup identity");
  Map<String,Long> auxiliary=new ConcurrentHashMap<>();Map<String,Boolean> pending=new ConcurrentHashMap<>();
  auxiliary.put("active",1L);pending.put("active",true);
  for(int i=0;i<4096;i++)FeatureSettings.cacheValue(auxiliary,pending,"request"+i,1L);
  check(auxiliary.size()<=1024&&auxiliary.containsKey("active"),"auxiliary timestamp history must be bounded and retain pending reads");
  Metrics network=new Metrics();network.enabled.add("network");var networkValues=network.sample();
  check(network.reads.isEmpty()&&network.context.hardwareReads==0&&networkValues.keySet().equals(Set.of("network"))&&TrafficStats.reads==2,"network-only display must do no battery/thermal I/O");
  Metrics current=new Metrics();current.enabled.add("current");TrafficStats.reads=0;var currentValues=current.sample();
  check(current.reads.equals(List.of("/sys/class/power_supply/battery/current_now"))&&TrafficStats.reads==0&&currentValues.get("current").equals("I:2000.0mA"),"current-only display must not read voltage/traffic");
  Metrics power=new Metrics();power.enabled.add("power");check(power.sample().get("power").equals("P:8.0W")&&power.reads.size()==2,"power still samples current and voltage");
  power.missing=true;check(power.sample().get("power").equals("P:—"),"unreadable driver remains unavailable");
  Metrics thermal=new Metrics();thermal.enabled.add("cpu");thermal.sample();
  check(thermal.context.hardwareReads==1&&thermal.reads.equals(List.of("thermal:cpu")),"missing CPU interface must not scan unrequested GPU");
  FeatureSettings.flags.add("ls_augment_rm_metrics_custom");Metrics custom=new Metrics();custom.enabled.add("network");custom.sample();check(custom.reads.isEmpty(),"formatting customization must not read battery state without charge-only metrics");
  FeatureSettings.flags.add("ls_augment_rm_metrics_charging_only");Metrics charging=new Metrics();charging.enabled.add("current");charging.sample();check(charging.reads.size()==2,"charge-only current must retain charge-state query");
  Audio gain=new Audio();gain.observingConfig=true;gain.apply();check(gain.handler.pending.isEmpty(),"disabled audio gain retains periodic worker");
  gain.enabled=true;gain.apply();gain.apply();check(gain.handler.pending.size()==1,"active gain must keep exactly one control-check timer");
  LoudnessEnhancer effect=new LoudnessEnhancer(1);gain.effects.put(1,effect);gain.enabled=false;gain.apply();
  check(effect.released&&gain.effects.isEmpty()&&gain.handler.pending.isEmpty(),"disabling gain must release DSP and stop its timer");
  gain.observingConfig=false;gain.apply();check(gain.handler.pending.size()==1,"missing snapshot listener must retain fallback recovery");
  Sensors sensors=new Sensors();int scans=File.scans;
  check(sensors.temperature("cpu").equals("C:—"),"fallback must not present a trip threshold as a measurement");
  for(int i=0;i<29;i++){SystemClock.now+=1000;sensors.temperature("cpu");}
  check(File.scans==scans+1,"missing thermal interfaces must not rescan sysfs each second");
  sensors.type="cpu-0";sensors.value=40200L;SystemClock.now+=1000;
  check(sensors.temperature("cpu").equals("C:40.2°")&&File.scans==scans+2,"new sensor capability must be rediscovered after bounded delay");
  sensors.value=null;check(sensors.temperature("cpu").equals("C:—")&&sensors.thermalPaths.isEmpty(),"removed thermal interface must discard its path");
  System.out.println("PASS runtime resource budgets: "+checks+" checks; config/retry/cache/metadata/sampling/audio");
 }
}
class ConfigSchema {
 static final String STATUSBAR_NETWORK_UPLOAD_MARK="up",STATUSBAR_NETWORK_DOWNLOAD_MARK="down";
 static boolean truthy(String value){return "1".equals(value);}
}
class StatusBarNetworkDisplay {static String format(int mode,String up,String down,String u,String d){return u+up+d+down;}}
class SystemUiPolicy {static boolean hideNetwork(long up,long down,int threshold){return false;}static String networkRate(long value,int digits,int unit,boolean suffix){return String.valueOf(value);}}
class AudioGainPolicy {static int percent(int extra,int step,int limit){return 100;}static int milliBel(int percent){return 0;}}
'''

code = (HARNESS.replace('// CONSTANTS', constants).replace('// MEMBERS', members)
        .replace('// SAMPLER', sampler).replace('// AUDIO_APPLY', member(audio, 'void apply()'))
        .replace('// TEMPERATURE', member(grid, 'String temperature(String kind)')))
with tempfile.TemporaryDirectory(prefix='duo-resource-budget-') as folder:
    work = Path(folder)
    source = work / 'RuntimeResourceBudgetTest.java'
    source.write_text(code, encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', str(work), str(source), str(SRC/'ThermalTelemetry.java')], check=True)
    subprocess.run(['java', '-cp', str(work), 'ls.augment.com.RuntimeResourceBudgetTest'], check=True, timeout=20)
