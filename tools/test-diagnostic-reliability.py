"""Execute production diagnostic boundaries with host Android stubs; never run root commands."""
from pathlib import Path
import argparse
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"


def member(source, signature):
    start = source.index(signature)
    brace = source.index("{", start)
    end, depth = brace + 1, 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


STUBS = {
    'ls/augment/com/LogHistory.java': 'package ls.augment.com;final class LogHistory{static final Object LOCK=new Object();static long cutoff(android.content.Context c){return 0;}static org.json.JSONObject registrationOnly(org.json.JSONObject v){return v;}}',

    "android/content/SharedPreferences.java": """package android.content;import java.util.Map;
public interface SharedPreferences {Map<String,?> getAll();String getString(String k,String d);int getInt(String k,int d);long getLong(String k,long d);Editor edit();
interface Editor {Editor putString(String k,String v);Editor putInt(String k,int v);Editor putLong(String k,long v);Editor remove(String k);void apply();boolean commit();}}""",
    "android/content/Context.java": """package android.content;public abstract class Context {
public abstract SharedPreferences getSharedPreferences(String n,int mode);public abstract java.io.File getFilesDir();public Object getContentResolver(){return this;}}""",
    "android/app/Activity.java": """package android.app;public class Activity extends ls.augment.com.FakeContext {
public final java.util.concurrent.CountDownLatch finished=new java.util.concurrent.CountDownLatch(1);
public Activity(java.io.File dir){super(dir);}public void runOnUiThread(Runnable r){r.run();finished.countDown();}}""",
    "android/widget/Toast.java": """package android.widget;public class Toast {public static final int LENGTH_LONG=1;
public static Toast makeText(Object c,String v,int l){return new Toast();}public void show(){}}""",
    "android/os/SystemClock.java": """package android.os;public class SystemClock {public static long now=100000;
public static long elapsedRealtime(){return now;}public static void sleep(long delay){now+=delay;}}""",
    "android/os/Bundle.java": """package android.os;public class Bundle {private final java.util.Map<String,Object> values=new java.util.HashMap<>();
public void putString(String k,String v){values.put(k,v);}public String getString(String k,String d){return (String)values.getOrDefault(k,d);}
public void putLong(String k,long v){values.put(k,v);}public long getLong(String k,long d){return ((Number)values.getOrDefault(k,d)).longValue();}public long getLong(String k){return getLong(k,0);}public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}}""",
    "android/os/Binder.java": """package android.os;public final class Binder {public static int getCallingPid(){return 321;}public static int getCallingUid(){return 1000;}}""",
    "android/provider/Settings.java": """package android.provider;public class Settings {public static class Global {
public static final String BOOT_COUNT="boot";public static int boot=7;public static int getInt(Object r,String key,int fallback){return boot;}}}""",
    "android/util/Log.java": """package android.util;public class Log {public static int failures;
public static int e(String tag,String message){failures++;return 0;}}""",
    "ls/augment/com/BuildConfig.java": """package ls.augment.com;final class BuildConfig {static final String VERSION_NAME="test20507";}""",
    "ls/augment/com/LiftArcOptions.java": """package ls.augment.com;final class LiftArcOptions {static String key(String value){return "ls_augment_liftarc_"+value;}}""",
    "ls/augment/com/ResetWriteFence.java": """package ls.augment.com;final class ResetWriteFence {static boolean blocked(){return false;}}""",
    "ls/augment/com/ConfigSnapshot.java": """package ls.augment.com;final class ConfigSnapshot {final long revision;private final java.util.Map<String,Object> stored;
ConfigSnapshot(long r,java.util.Map<String,Object> v){revision=r;stored=java.util.Map.copyOf(v);}java.util.Map<String,Object> values(){return stored;}}""",
    "ls/augment/com/FrameworkConfigSync.java": """package ls.augment.com;final class FrameworkConfigSync {static long publishedRevision=10;static java.util.Map<String,Object> publishedValues=java.util.Map.of();
static boolean isPublished(ConfigSnapshot s){return s!=null&&s.revision==publishedRevision&&s.values().equals(publishedValues);}}""",
    "ls/augment/com/AppConfig.java": """package ls.augment.com;final class AppConfig {static boolean synced=true,throwsOnMirror,shoulderDetail,aiDetail;static int attempts,publishAfter;
static long revision=10;static java.util.Map<String,Object> currentValues=java.util.Map.of("grid_enabled",true,"rows",7,"columns",4);
AppConfig(Object c){}boolean getBoolean(String key){return key.equals(ConfigSchema.SHOULDER_DIAGNOSTICS)?shoulderDetail:aiDetail;}
RootShell.Result mirrorAll(){attempts++;if(throwsOnMirror)throw new IllegalStateException("test");if(synced&&attempts>=publishAfter){FrameworkConfigSync.publishedRevision=revision;FrameworkConfigSync.publishedValues=java.util.Map.copyOf(currentValues);}return new RootShell.Result(synced?0:1,"",false);}
ConfigSnapshot configSnapshot(){return new ConfigSnapshot(revision,currentValues);}
static void traceLauncherGrid(android.content.Context c,String stage,java.util.Map<String,Object> values,long rev,String detail){AuditLog.write(c,"LAUNCHER_GRID", "stage="+stage+";revision="+rev+";values="+values+";"+detail);}}""",
    "ls/augment/com/ConfigSchema.java": """package ls.augment.com;final class ConfigSchema {static final String SHOULDER_DIAGNOSTICS="shoulder_detail",AI_TRIGGER_DIAGNOSTICS="ai_detail";}""",
    "ls/augment/com/FakeContext.java": """package ls.augment.com;import android.content.*;import java.util.*;
public class FakeContext extends Context {public java.io.File files;public boolean prefsUnavailable;public final Map<String,Prefs> stores=new HashMap<>();
public FakeContext(java.io.File f){files=f;}public java.io.File getFilesDir(){return files;}
public SharedPreferences getSharedPreferences(String n,int mode){if(prefsUnavailable)throw new IllegalStateException("prefs");return stores.computeIfAbsent(n,k->new Prefs());}
public static class Prefs implements SharedPreferences {public final Map<String,Object> values=new HashMap<>();public boolean commitFails;
public Map<String,?> getAll(){return new HashMap<>(values);}public String getString(String k,String d){Object v=values.get(k);return v instanceof String?(String)v:d;}
public int getInt(String k,int d){Object v=values.get(k);return v instanceof Number?((Number)v).intValue():d;}
public long getLong(String k,long d){Object v=values.get(k);return v instanceof Number?((Number)v).longValue():d;}
public Editor edit(){return new Editor(){final Map<String,Object> pending=new HashMap<>();
public Editor putString(String k,String v){pending.put(k,v);return this;}public Editor putInt(String k,int v){pending.put(k,v);return this;}
public Editor putLong(String k,long v){pending.put(k,v);return this;}public Editor remove(String k){pending.put(k,null);return this;}
public void apply(){for(var e:pending.entrySet()){if(e.getValue()==null)values.remove(e.getKey());else values.put(e.getKey(),e.getValue());}}public boolean commit(){apply();return !commitFails;}};}}}""",
}

TEST = r'''
package ls.augment.com;
import java.nio.file.*;import java.nio.charset.StandardCharsets;import java.util.*;import java.util.concurrent.*;import org.json.*;
public final class TestDiagnosticReliability {
 static int checks;static void yes(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
 static RootShell.Result raw(int code,String text,boolean complete,boolean failed,boolean truncated){return new RootShell.Result(code,text,false,new RootShell.CapturedOutput(text.getBytes(StandardCharsets.UTF_8),complete,failed,truncated));}
 static JSONObject snapshot()throws Exception{return new JSONObject().put("package","system").put("process","system").put("pid",321).put("sourceUid",1000)
   .put("moduleVersion",BuildConfig.VERSION_NAME).put("moduleLoaded",true).put("moduleLoadedElapsed",1000).put("receivedAt",System.currentTimeMillis()).put("receivedBoot",7);}
 static void install(FakeContext c,JSONObject value){((FakeContext.Prefs)c.getSharedPreferences("hook-processes",0)).values.put("pid_321",value.toString());}
 static void injection(Path dir)throws Exception{
  FakeContext c=new FakeContext(dir.toFile());install(c,snapshot());
  yes(!RuntimeEnvironment.injected(c),"missing lifecycle receipt remains unconfirmed");
  yes(BuildConfig.VERSION_NAME.equals(RuntimeEnvironment.telemetryVersion(c,"321")),"fresh authenticated telemetry backs up missing receipt");
  for(String field:new String[]{"sourceUid","pid","receivedBoot","moduleLoadedElapsed"}){
   JSONObject bad=snapshot().put(field,field.equals("moduleLoadedElapsed")?100001:999);install(c,bad);
   yes(RuntimeEnvironment.telemetryVersion(c,"321").isEmpty(),"reject telemetry mismatch "+field);
  }
  install(c,snapshot().put("receivedAt",System.currentTimeMillis()-60001));yes(RuntimeEnvironment.telemetryVersion(c,"321").isEmpty(),"stale telemetry cannot confirm injection");
  install(c,snapshot().put("moduleLoaded",false));yes(RuntimeEnvironment.telemetryVersion(c,"321").isEmpty(),"not loaded");
  install(c,snapshot().put("process","com.android.settings"));yes(RuntimeEnvironment.telemetryVersion(c,"321").isEmpty(),"system UID shared settings is not server");
  install(c,snapshot().put("moduleVersion","test20386"));yes("test20386".equals(RuntimeEnvironment.telemetryVersion(c,"321")),"old version remains distinguishable from installed version");
  yes(!BuildConfig.VERSION_NAME.equals(RuntimeEnvironment.telemetryVersion(c,"321")),"old telemetry cannot confirm current version");
  yes(RuntimeEnvironment.telemetryVersion(c,"").isEmpty(),"missing live PID cannot confirm");
  RuntimeEnvironment.record(c,1000,"version="+BuildConfig.VERSION_NAME+"|pid=321|loaderReady=1");yes(RuntimeEnvironment.injected(c),"current lifecycle receipt remains accepted");
  android.provider.Settings.Global.boot=8;yes(!RuntimeEnvironment.injected(c),"receipt cannot survive reboot");android.provider.Settings.Global.boot=7;
 }
 static void attribution()throws Exception{
  JSONObject legacy=new JSONObject().put("package","com.zte.cn.doubleapp").put("process","com.android.settings");
  Set<String> targets=DiagnosticExportHarness.currentPackages(legacy);yes(targets.containsAll(Set.of("com.android.settings","com.zte.cn.doubleapp")),"legacy shared process recovered");
  legacy.put("packages",new JSONArray(List.of("com.android.settings","com.zte.cn.doubleapp","com.android.settings","bad.package")));
  yes(DiagnosticExportHarness.currentPackages(legacy).size()==2,"registered target names deduplicated and invalid rejected");
  HookPackagesHarness.process="com.android.settings";HookPackagesHarness.ready("com.android.settings");HookPackagesHarness.ready("com.zte.cn.doubleapp");
  yes("com.android.settings".equals(HookPackagesHarness.pkg),"legacy label does not become last shared package");
  yes(HookPackagesHarness.names().length()==2,"every hosted target retained");HookPackagesHarness.ready("unscoped");yes(HookPackagesHarness.names().length()==2,"unscoped names excluded");
  RootShell.Result ps=raw(0,"PID NAME\n321 system_server\n4670 com.android.settings\nbad\n-1 fake",true,false,false);
  yes(DiagnosticExportHarness.processNames(ps).size()==2,"only valid process lines parsed");yes("321".equals(DiagnosticExportHarness.systemPid(DiagnosticExportHarness.processNames(ps))),"system server PID derived from observed process list");
  yes(DiagnosticExportHarness.processNames(raw(1,"321 system_server",true,false,false)).isEmpty(),"failed ps cannot supply live identity");
  JSONObject oldDelivery=new JSONObject().put("droppedDetailEvents",1).put("hooks",new JSONArray());DiagnosticExportHarness.compactHooks(oldDelivery,true);
  yes(oldDelivery.getString("detailDeliveryEvidence").equals("LOSS_REPORTED_REASON_UNAVAILABLE"),"old one-event loss remains unknown, not labeled a queue overflow or crash");
  yes(oldDelivery.getLong("droppedDetailEvents")==1,"export does not change recorded loss count");
  JSONObject freshDelivery=new JSONObject().put("detailDelivery",new JSONObject().put("pendingEvents",0)).put("hooks",new JSONArray());DiagnosticExportHarness.compactHooks(freshDelivery,true);
  yes(!freshDelivery.has("detailDeliveryEvidence")&&freshDelivery.getJSONObject("detailDelivery").getInt("pendingEvents")==0,"current structured delivery metadata is preserved");
  JSONObject historicalGrid=new JSONObject().put("pid",321).put("launcherGridRuntimeEvidence","CURRENT_PROCESS_CACHE")
    .put("launcherGridRuntime",new JSONObject().put("pid",321).put("enabled",true).put("effectiveRows",7).put("effectiveColumns",4).put("events",new JSONArray().put("BOUND")))
    .put("diagnosticWriterState","pending=0;expired=0").put("hooks",new JSONArray().put(new JSONObject().put("registration","REGISTERED").put("callbackThrows",0)));
  DiagnosticExportHarness.compactHooks(historicalGrid,false);
  yes(historicalGrid.getJSONArray("hooks").isEmpty()&&historicalGrid.getInt("omittedHistoricalSuccessfulHooks")==1,"historical successful hook lists still use the existing omission policy");
  yes(historicalGrid.getJSONObject("launcherGridRuntime").getBoolean("enabled")&&historicalGrid.getJSONObject("launcherGridRuntime").getInt("effectiveRows")==7
    &&historicalGrid.getJSONObject("launcherGridRuntime").getJSONArray("events").getString(0).equals("BOUND")
    &&historicalGrid.getString("launcherGridRuntimeEvidence").equals("CURRENT_PROCESS_CACHE")&&historicalGrid.getString("diagnosticWriterState").contains("pending=0"),"historical export preserves each process's grid outcome and writer state after a later process disables layout");
 }
 static void captures(){
  String empty=DiagnosticExportHarness.describe(raw(0,"",true,false,false),true,true);yes(empty.contains("status=READ")&&empty.contains("filterState=EMPTY_INPUT")&&empty.contains("lines=0"),"empty input is readable, not one metadata event");
  String noMatch=DiagnosticExportHarness.describe(raw(0,"other framework line",true,false,false),true,true);yes(noMatch.contains("filterState=NO_MATCHES")&&noMatch.contains("lines=0")&&!noMatch.contains("READ_FAILED"),"read success and no module matches separated");
  String failed=DiagnosticExportHarness.describe(raw(1,"tail: Permission denied",true,false,false),true,true);yes(failed.contains("status=READ_FAILED")&&failed.contains("NOT_RUN_READ_FAILED")&&failed.contains("Permission denied"),"raw read failure is retained");
  RootShell.Result bounded=raw(0,"LS_Augment FEATURE_AI detail",true,false,true);String trimmed=DiagnosticExportHarness.describe(bounded,true,true);
  yes(trimmed.contains("upstreamTruncated=true")&&trimmed.contains("captureState=TRUNCATED")&&trimmed.contains("limitReachedOrPossiblyTruncated=true")&&trimmed.contains("lines=0"),"original truncation survives filtering to empty");
  yes(DiagnosticExportHarness.filterIdentity(bounded)==bounded.capture,"original capture proof retained");
  yes(DiagnosticExportHarness.describe(raw(0,"LS_Augment normal",false,true,false),false,false).contains("upstreamReadFailed=true"),"capture read failure remains visible despite command exit zero");
  String synthetic=DiagnosticExportHarness.describe(new RootShell.Result(0,"",false),false,false);yes(synthetic.contains("captureState=UNVERIFIED")&&synthetic.contains("upstreamTruncated=UNKNOWN"),"synthetic results do not invent capture completeness");
  String matches=DiagnosticExportHarness.describe(raw(0,"LS_Augment normal\nLS_Augment SHOULDER detail\nother",true,false,false),true,true);yes(matches.contains("filterState=MATCHES")&&matches.contains("lines=1")&&!matches.contains("SHOULDER detail"),"feature filter removes excluded detail and counts events only");
 }
 static final class FrameworkReader implements RootShell.Transport {
  final RootShell.Result listing;final Queue<RootShell.Result> tails=new ArrayDeque<>();final List<String> commands=new ArrayList<>();
  FrameworkReader(RootShell.Result listing,RootShell.Result... tails){this.listing=listing;this.tails.addAll(Arrays.asList(tails));}
  public RootShell.Result read(String command,String input,long timeout,int limit){
   commands.add(command);yes(input==null,"framework collector never writes stdin");
   if(commands.size()==1){yes(command.equals("ls -1t /data/adb/lspd/log")&&timeout==5&&limit==8192,"newest-first bounded directory read");return listing;}
   yes(command.startsWith("tail -c 524288 '")&&timeout==8&&limit==512*1024,"fixed bounded quoted tail");
   return tails.isEmpty()?raw(0,"LS_Augment framework witness\n",true,false,false):tails.remove();
  }
 }
 static String framework(FrameworkReader reader){
  yes(RootShell.transport==null,"framework fixture starts without transport");RootShell.transport=reader;
  try{return DiagnosticExportHarness.framework();}finally{RootShell.transport=null;}
 }
 static void frameworkLogs(){
  String modules="modules_2026-10-18T19:35:35.75724.log",verbose="verbose_2026-10-18T19:35:35.75706.log";
  for(String newline:new String[]{"\n","\r\n"}){
   String[] names={"kmsg.log",modules,"props.txt",verbose};
   FrameworkReader reader=new FrameworkReader(raw(0,String.join(newline,names)+newline,true,false,false));String report=framework(reader);
   for(String name:names)yes(Collections.frequency(reader.commands,"tail -c 524288 '/data/adb/lspd/log/"+name+"'")==1,"exact colon basename reaches a quoted tail once: "+name);
   yes(reader.commands.size()==5&&report.contains("listed=4 eligible=4 attempted=4 rejected=0 capSkipped=0 readSuccess=4 readFailed=0 readUnknown=0"),"actual four-file inventory has four successful bounded reads");
   yes(report.contains("SOURCE LSPOSED "+modules+";")&&report.contains("SOURCE LSPOSED "+verbose+";")&&!report.contains("NO_FILES"),"real source sections are reached for LF and CRLF listings");
  }
  FrameworkReader empty=new FrameworkReader(raw(0,"",true,false,false));String report=framework(empty);
  yes(empty.commands.size()==1&&report.contains("LSPOSED: NO_FILES; listed=0 eligible=0 attempted=0 rejected=0 capSkipped=0"),"only reliable empty directory reports NO_FILES");
  FrameworkReader blank=new FrameworkReader(raw(0,"\n\r\n",true,false,false));report=framework(blank);
  yes(blank.commands.size()==1&&report.contains("LSPOSED: NO_ELIGIBLE_FILES;")&&!report.contains("LSPOSED: NO_FILES;"),"nonempty blank records cannot prove an empty directory");
  String[] rejected={".","..","../outside.log","sub/file.log","back\\slash.log"," leading.log","trailing.log ","semi;colon.log","quote'.log","$value.log","tick`.log"};
  FrameworkReader unsafe=new FrameworkReader(raw(0,String.join("\n",rejected)+"\n",true,false,false));report=framework(unsafe);
  yes(unsafe.commands.size()==1&&report.contains("LSPOSED: NO_ELIGIBLE_FILES; listed=11 eligible=0 attempted=0 rejected=11 capSkipped=0")&&!report.contains("LSPOSED: NO_FILES;"),"unsupported basenames are counted without path or shell use");
  yes(!report.contains("outside.log")&&!report.contains("quote'.log"),"rejected names are not added to export content");
  FrameworkReader mixed=new FrameworkReader(raw(0,"../outside.log\n"+modules+"\n leading.log\n",true,false,false));report=framework(mixed);
  yes(mixed.commands.size()==2&&report.contains("listed=3 eligible=1 attempted=1 rejected=2 capSkipped=0"),"rejected entries do not consume the six-file allowance");
  String[] seven={"one.log","two.log","three.log","four.log","five.log","six.log","seven.log"};
  FrameworkReader capped=new FrameworkReader(raw(0,String.join("\n",seven),true,false,false));report=framework(capped);
  yes(capped.commands.size()==7&&report.contains("eligible=7 attempted=6 rejected=0 capSkipped=1"),"framework collector caps real tail attempts at six");
  yes(!capped.commands.contains("tail -c 524288 '/data/adb/lspd/log/seven.log'"),"seventh eligible file is not read");
  RootShell.Result[] badListings={raw(1,"denied",true,false,false),new RootShell.Result(-1,"timeout",true,new RootShell.CapturedOutput(new byte[0],true,false,false)),
   raw(0,modules.substring(0,20),true,false,true),raw(0,modules.substring(0,20),false,false,false),raw(0,modules.substring(0,20),true,true,false),new RootShell.Result(0,modules,false)};
  String[] states={"COMPLETE","COMPLETE","TRUNCATED","INCOMPLETE","FAILED","UNVERIFIED"};
  for(int i=0;i<badListings.length;i++){
   FrameworkReader unreadable=new FrameworkReader(badListings[i]);report=framework(unreadable);
   yes(unreadable.commands.size()==1&&report.contains("LSPOSED: UNKNOWN; listed=UNKNOWN eligible=UNKNOWN attempted=0")&&!report.contains("NO_FILES")&&!report.contains("NO_ELIGIBLE_FILES"),"unreliable directory cannot parse a partial basename or claim empty: "+i);
   yes(report.contains("captureState="+states[i]),"directory capture status remains explicit: "+i);
   if(badListings[i].isSuccess())yes(!report.contains(modules.substring(0,20)),"successful listing body and partial names are not exported");
  }
  FrameworkReader outcomes=new FrameworkReader(raw(0,"one.log\ntwo.log\nthree.log\nfour.log\nfive.log\n",true,false,false),
   raw(0,"LS_Augment normal\n",true,false,false),raw(1,"tail: Permission denied",true,false,false),raw(0,"LS_Augment FEATURE_AI hidden",true,false,true),
   raw(0,"LS_Augment normal",false,false,false),new RootShell.Result(0,"LS_Augment normal",false));report=framework(outcomes);
  yes(report.contains("attempted=5 rejected=0 capSkipped=0 readSuccess=1 readFailed=1 readUnknown=3"),"tail counts distinguish reliable capture, command failure and unknown capture");
  yes(report.contains("status=READ_FAILED")&&report.contains("Permission denied")&&report.contains("captureState=TRUNCATED")&&report.contains("captureState=INCOMPLETE")&&report.contains("captureState=UNVERIFIED"),"per-file original read and capture evidence retained");
  yes(report.contains("upstreamTruncated=true")&&report.contains("filterState=NO_MATCHES")&&!report.contains("FEATURE_AI hidden"),"filtered-to-empty tail still reports original truncation");
  FrameworkReader filtering=new FrameworkReader(raw(0,modules+"\n",true,false,false),raw(0,"LS_Augment retained\nframework ls.augment.com.hook.AugmentModule loading failure\njava.lang.IllegalStateException: registration\n\tat Fixture.SHOULDER_frame(Fixture.java:70)\nCaused by: java.io.IOException: complete\nLS_Augment SHOULDER optional\nLS_Augment FEATURE_AI optional\n",true,false,false));report=framework(filtering);
  yes(report.contains("LS_Augment retained")&&report.contains("loading failure")&&!report.contains("SHOULDER optional")&&!report.contains("FEATURE_AI optional"),"collector keeps package-owned framework failures and optional content policies");
  yes(report.contains("SHOULDER_frame")&&report.contains("Caused by:"),"optional shoulder switch must not erase a loading exception's adjacent stack");
 }
 static void limits(){
  yes(DiagnosticWritePolicy.normalize("ls_augment_test","x".repeat(2000)).length()==2000,"exact limit remains complete");
  String cut=DiagnosticWritePolicy.normalize("ls_augment_test","x".repeat(2001));yes(cut.length()==2000&&cut.endsWith(" [TRUNCATED]"),"ordinary truncation marked within budget");
  String large=DiagnosticWritePolicy.normalize("ls_augment_rm_support_test","x".repeat(32769));yes(large.length()==32768&&large.endsWith(" [TRUNCATED]"),"support budget marked");
  String pair=DiagnosticWritePolicy.normalize("ls_augment_test","x".repeat(1987)+"😀"+"x".repeat(20));yes(pair.endsWith(" [TRUNCATED]")&&pair.length()==1999,"surrogate boundary kept whole");
  yes("a b c".equals(DiagnosticWritePolicy.normalize("ls_augment_test","a\rb\nc")),"single line normalization retained");
  String visibility="view/ancestor;".repeat(320);
  yes(DiagnosticWritePolicy.normalize("ls_augment_statusbar_phone_visibility_state",visibility).equals(visibility),"full native visibility chain survives the former 2000-character cut");
  String visibilityCut=DiagnosticWritePolicy.normalize("ls_augment_statusbar_phone_visibility_state","x".repeat(9000));
  yes(visibilityCut.length()==8192&&visibilityCut.contains("TRUNCATED originalChars=9000 budgetChars=8192"),"oversized visibility remains bounded with original length");
  Map<String,String> full=new HashMap<>();for(int i=0;i<512;i++)full.put("k"+i,"v");
  yes(!DiagnosticWritePolicy.fits(full,"new_visibility_state",visibility),"visibility allowance cannot bypass the key quota");
  full.clear();full.put("large","x".repeat(512*1024));
  yes(!DiagnosticWritePolicy.fits(full,"ls_augment_statusbar_phone_visibility_state",visibility),"visibility allowance cannot bypass aggregate byte quota");
  String described=DiagnosticExportHarness.value("ls_augment_statusbar_phone_visibility_state",visibilityCut);
  yes(described.contains("diagnosticValueState")&&described.contains("state=TRUNCATED")&&described.contains("budgetChars=8192"),"export distinguishes a bounded value cut from absent native views");
  described=DiagnosticExportHarness.value("ls_augment_health_account","secret [TRUNCATED]");
  yes(described.contains("REDACTED / present:true")&&!described.contains("secret")&&!described.contains("retainedChars"),"private values do not leak contents or length metadata");
  yes(DiagnosticExportHarness.value("ls_augment_config_snapshot","encoded-private-values").isEmpty(),"protected snapshot excluded from metadata and values");
 }
 static final class LogcatReader implements DiagnosticLogcat.Reader {
  final Queue<RootShell.Result> replies=new ArrayDeque<>();final List<String> commands=new ArrayList<>();
  public RootShell.Result read(String command,long timeout,int bytes){commands.add(command);yes(timeout<=12&&bytes<=1024*1024,"bounded phone capture");yes(!command.contains(" -c")&&!command.contains("*:V"),"no clearing or unfiltered content");return replies.remove();}
 }
 static void logcat(){
  long now=1791706889508L;LogcatReader reader=new LogcatReader();
  reader.replies.add(raw(0,"1791706885.000 4595 4595 I LS_Augment: current",true,false,false));
  DiagnosticLogcat.Collection current=DiagnosticLogcat.module(now,false,false,reader);
  yes(reader.commands.size()==1&&current.fallback==null,"matching time window does not broaden collection");
  yes(current.sinceWall==now-30*60*1000&&reader.commands.get(0).contains(" -T "),"actual time window preserved");
  reader=new LogcatReader();reader.replies.add(raw(0,"--------- beginning of main",true,false,false));
  DiagnosticLogcat.Collection cleared=DiagnosticLogcat.module(now,false,false,now-1000,reader);
  yes(cleared.sinceWall==now-1000&&cleared.fallback==null&&reader.commands.size()==1,"cleared history uses the new time boundary without replaying a historical tail");
  reader=new LogcatReader();reader.replies.add(raw(0,"--------- beginning of main",true,false,false));
  reader.replies.add(raw(0,"main: ring buffer is 256 KiB",true,false,false));reader.replies.add(raw(0,"1791697000.000 4595 4595 W LS_Augment: older",true,false,false));
  DiagnosticLogcat.Collection fallback=DiagnosticLogcat.module(now,false,false,reader);
  yes(reader.commands.size()==3&&fallback.fallbackReason.equals("PRIMARY_NO_MATCHING_RECORDS"),"empty/banner-only source gets one bounded fallback plus buffer metadata");
  yes(reader.commands.get(1).endsWith(" -g")&&reader.commands.get(2).contains(" -t 300 "),"buffer metadata and limited tail are actually collected");
  yes(!reader.commands.get(2).contains("LS_Augment_AI"),"disabled AI detailed channel stays excluded in fallback");
  for(String tag:new String[]{"LS_Augment_TGK:I","LS_AugmentNative:I","InputManagerProxy:E","TgkHelper:E","TgkService:W"})
   yes(reader.commands.get(0).contains(tag)&&reader.commands.get(2).contains(tag),"necessary shoulder tag retained in primary and fallback: "+tag);
  String described=DiagnosticExportHarness.logcat(fallback,false,false);
  yes(described.contains("TIME_WINDOW")&&described.contains("RECENT_TAIL")&&described.contains("MAY_PRECEDE_REQUESTED_WINDOW"),"tail is never represented as current-window proof");
  yes(described.contains("BUFFER_METADATA")&&described.contains("logcatFallbackHasRecords=true"),"buffer and fallback have separate evidence");
  yes(described.contains("oldestRetainedRecordWall=1791697000000")&&described.contains("newestRetainedRecordWall=1791697000000"),"actual retained tail time range distinguishes older observations");
  reader=new LogcatReader();reader.replies.add(raw(1,"logcat: Permission denied",true,false,false));reader.replies.add(raw(0,"main: ring buffer",true,false,false));reader.replies.add(raw(0,"",true,false,false));
  DiagnosticLogcat.Collection denied=DiagnosticLogcat.cleanup(now,reader);described=DiagnosticExportHarness.logcat(denied,false,false);
  for(String tag:new String[]{"LS_Augment_TGK:I","LS_AugmentNative:I","InputManagerProxy:E","TgkHelper:E","TgkService:W"})
   yes(reader.commands.get(0).contains(tag),"cleanup collects shoulder errors with detail off: "+tag);
  yes(denied.fallbackReason.equals("PRIMARY_READ_FAILED_OR_INCOMPLETE")&&described.contains("READ_FAILED")&&described.contains("Permission denied"),"primary read failure survives successful empty fallback");
  yes(described.contains("logcatFallbackHasRecords=false")&&described.contains("not proof of no errors"),"empty fallback is uncertainty, not no-crash evidence");
  reader=new LogcatReader();reader.replies.add(raw(0,"1791706885.000 4595 I LS_Augment: incomplete",false,true,false));reader.replies.add(raw(0,"",true,false,false));reader.replies.add(raw(0,"1791706885.100 4595 I LS_Augment: FEATURE_AI secret\n1791706885.200 4595 I LS_Augment: SHOULDER secret",true,false,false));
  DiagnosticLogcat.Collection partial=DiagnosticLogcat.module(now,false,false,reader);described=DiagnosticExportHarness.logcat(partial,false,false);
  yes(described.contains("upstreamReadFailed=true")&&!described.contains("secret"),"incomplete capture remains marked and fallback respects optional-detail privacy filters");
  yes(described.contains("fallbackRetainedLines=0")&&described.contains("newestRetainedRecordWall=UNKNOWN"),"filtered fallback does not claim useful records or invent a time range");
  reader=new LogcatReader();reader.replies.add(raw(0,"1791700000.000 4595 I LS_Augment: prefix",true,false,true));reader.replies.add(raw(0,"main: ring buffer",true,false,false));reader.replies.add(raw(0,"1791706885.000 4595 I LS_Augment: latest",true,false,false));
  DiagnosticLogcat.Collection limited=DiagnosticLogcat.module(now,false,false,reader);described=DiagnosticExportHarness.logcat(limited,false,false);
  yes(limited.fallbackReason.equals("PRIMARY_CAPTURE_LIMIT_REACHED")&&described.contains("upstreamTruncated=true"),"bounded prefix capture can supplement the tail without labeling its limit a read failure");
  yes(described.contains("newestRetainedRecordWall=1791706885000"),"bounded tail retains actual current reproduction timestamp");
  yes(DiagnosticLogcat.recordWindow(raw(0,"1791706885.138999 4595 I LS_Augment: sample",true,false,false)).contains("newestRetainedRecordWall=1791706885138"),"epoch fractions remain precise to milliseconds");
  yes(DiagnosticLogcat.recordWindow(raw(0,"999999999999999999999999.000 4595 I LS_Augment: invalid",true,false,false)).contains("newestRetainedRecordWall=UNKNOWN"),"invalid timestamps cannot invent a coverage range");
 }
 static JSONObject shoulderEvent(String level,String value)throws Exception{
  return new JSONObject().put("feature",ShoulderSwitchLogPolicy.FEATURE).put("level",level).put("value",value);
 }
 static void shoulderRuntime(Path dir)throws Exception{
  AppConfig.shoulderDetail=false;AppConfig.aiDetail=false;
  HookShoulderHarness.shoulderSwitch("INFO","stage=apply_requested index=2 count=5");
  HookShoulderHarness.detail("SHOULDER","private detail");
  HookShoulderHarness.shoulderSwitch("DEBUG","private debug");
  yes(HookShoulderHarness.trace.size()==1&&HookShoulderHarness.hasRuntimeEvents(),"necessary switch event bypasses detail gate; debug/detail stay excluded");
  String[] queued=HookShoulderHarness.trace.poll();yes(queued[0].equals(ShoulderSwitchLogPolicy.FEATURE)&&queued[1].contains("wall=")&&queued[2].equals("INFO"),"switch event carries timestamps and level");
  yes(!HookShoulderHarness.hasRuntimeEvents(),"runtime queue emptiness does not invent pending records");
  for(int i=0;i<257;i++)HookShoulderHarness.shoulderSwitch("WARN","stage=failure index="+i);
  yes(HookShoulderHarness.trace.size()==256&&HookShoulderHarness.dropped.get()==1,"necessary channel remains bounded with visible queue loss");HookShoulderHarness.trace.clear();
  for(String field:new String[]{"token","account","data","payload","settingsData","ls_augment_tgk_rapid_fire_test_session","sha256"}){
   String sanitized=ShoulderSwitchLogPolicy.safe("apply_error index=2 "+field+"={\"private\":\"fixture-secret\"} after=secret");
   yes(sanitized.contains("index=2")&&!sanitized.contains("fixture-secret")&&!sanitized.contains("after=secret"),"opaque private tail removed: "+field);
  }
  yes(ShoulderSwitchLogPolicy.safe("tokenStatus=MISSING count=3").contains("tokenStatus=MISSING"),"public token status remains useful");
  yes(!ShoulderSwitchLogPolicy.safe("x".repeat(1500)+"😀".repeat(5)).contains("�"),"bounded content never splits a surrogate pair");
  Path files=Files.createDirectory(dir.resolve("shoulder-runtime"));FakeContext context=new FakeContext(files.toFile());
  JSONArray events=new JSONArray().put(shoulderEvent("INFO","stage=apply_requested index=2 count=5"))
    .put(shoulderEvent("WARN","stage=shortcut_stale index=2 data={\"token\":\"fixture-secret\"}").put("unexpectedPrivatePayload","fixture-extra-secret"))
    .put(shoulderEvent("ERROR","stage=apply_failed errorClass=IllegalStateException"))
    .put(shoulderEvent("DEBUG","private-debug"))
    .put(new JSONObject().put("feature","SHOULDER").put("value","private-shoulder-detail"));
  android.os.Bundle request=new android.os.Bundle();request.putString("snapshot",snapshot().toString());request.putString("events",events.toString());
  yes(DiagnosticStore.record(context,request).getBoolean("ok"),"necessary state events accepted with detail off");
  String stored=Files.readString(files.resolve(DiagnosticStore.SHOULDER_SWITCH_FILE));
  yes(stored.lines().count()==3&&stored.contains("INFO")&&stored.contains("WARN")&&stored.contains("ERROR"),"ordinary switch levels persist in order");
  yes(!stored.contains("fixture-secret")&&!stored.contains("fixture-extra-secret")&&!stored.contains("private-debug"),"provider enforces safe schema and content");
  String schema=ShoulderSwitchLogPolicy.safeSwitch("tx=1 stage=send pkg=com.test table=shortcut caseId=2 previousCaseId=1 keyCode=1 mode=3 pointHash=abc expectedHash=abc observedHash=def status=MISMATCH reason=STALE errorClass=IllegalStateException route=helper calls=1 registered=2 version=test-current pid=321 elapsed=999 schemeName=private-name macroName=private-macro");
  for(String key:new String[]{"tx","stage","pkg","table","caseId","previousCaseId","keyCode","mode","pointHash","expectedHash","observedHash","status","reason","errorClass","route","calls","registered","version","pid","elapsed"})yes(schema.contains(key+"="),"root state field supported: "+key);
  yes(!schema.contains("private-name")&&!schema.contains("private-macro"),"scheme/macro names excluded by whitelist");
  yes(!Files.exists(files.resolve("detail-SHOULDER.log")),"disabled detailed data is not persisted");
  String exported=DiagnosticExportHarness.shoulderRuntime(context);yes(exported.contains("SHOULDER_SWITCH_RUNTIME")&&exported.contains("apply_requested"),"unified export includes necessary runtime file");
  AppConfig.shoulderDetail=true;yes(DiagnosticStore.record(context,request).getBoolean("ok")&&Files.readString(files.resolve("detail-SHOULDER.log")).contains("private-shoulder-detail"),"explicit detail enablement still works");AppConfig.shoulderDetail=false;
  String oem="1791706885.000 4595 4595 E InputManagerProxy: inject failed index=2 data={secret}\n"
    +"1791706885.100 4595 4595 E TgkHelper: send failed token=fixture-secret\n"
    +"1791706885.200 4595 4595 W TgkService: invalid shortcut count=2\n"
    +"1791706885.300 4595 4595 W LS_Augment_TGK: native failed account=fixture-secret\n"
    +"1791706885.400 4595 4595 I LS_Augment: SHOULDER_SWITCH INFO apply_requested index=2\n"
    +"1791706885.500 4595 4595 I LS_Augment_TGK: detailed payload secret\n"
    +"1791706885.600 4595 4595 I LS_Augment: SHOULDER detail secret";
  String filtered=DiagnosticExportHarness.filtered(oem,false);
  yes(filtered.lines().count()==5&&filtered.contains("inject failed")&&filtered.contains("invalid shortcut")&&filtered.contains("apply_requested"),"necessary OEM/module errors and switch INFO survive disabled detail export");
  yes(!filtered.contains("fixture-secret")&&!filtered.contains("{secret}")&&!filtered.contains("detailed payload")&&!filtered.contains("detail secret"),"necessary logcat strips payload/private tails and gates detailed content");
 }
 static void audit(Path dir)throws Exception{
  FakeContext c=new FakeContext(dir.toFile());yes(AuditLog.writeDurable(c,"TEST_DURABLE","before restart"),"durable log write");yes(AuditLog.read(c).contains("before restart"),"durable event present");
  Path invalid=dir.resolve("not-directory");Files.writeString(invalid,"file");c.files=invalid.toFile();AuditLog.write(c,"RETRY","same failure");
  String failure=AuditLog.failureStatus(c);yes(failure.contains("writeFailures=1")&&failure.contains("lastWriteError=FileNotFoundException"),"disk failure recorded outside failed log");yes(android.util.Log.failures==1,"failure also visible in module logcat");
  c.files=dir.toFile();AuditLog.write(c,"RETRY","same failure");yes(AuditLog.read(c).contains("same failure"),"failed event can be retried without repeat suppression");
  FakeContext unavailable=new FakeContext(invalid.toFile());unavailable.prefsUnavailable=true;AuditLog.write(unavailable,"FAILED","metadata failure");yes(AuditLog.failureStatus(unavailable).contains("failureMetadata=UNAVAILABLE"),"unavailable metadata has in-process evidence");
 }
 static void restart(Path dir)throws Exception{
  AppConfig.synced=true;AppConfig.throwsOnMirror=false;AppConfig.attempts=0;AppConfig.publishAfter=0;RootShell.calls=0;
  android.app.Activity successful=new android.app.Activity(dir.toFile());RootShell.inspection=()->{
   String beforeKill=AuditLog.read(successful);yes(beforeKill.contains("[SCOPE_RESTART_COMMAND]"),"command issue audit exists before RootShell");
   yes(beforeKill.contains("stage=RESTART_READY;revision=10")&&beforeKill.contains("desktopApplied=UNCONFIRMED"),"exact published layout intent is recorded before killing launcher without claiming application");
  };
  ScopeRestartHarness.run(successful,"launcher");yes(successful.finished.await(5,TimeUnit.SECONDS),"restart completed");
  String events=AuditLog.read(successful);yes(RootShell.calls==1&&events.contains("[SCOPE_RESTART_REQUEST]")&&events.contains("[SCOPE_RESTART_COMMAND_RESULT]")&&events.contains("command_return_not_process_restart_proof"),"manual request and command result logged with evidence boundary");
  AppConfig.synced=false;AppConfig.attempts=0;RootShell.calls=0;android.app.Activity blocked=new android.app.Activity(dir.toFile());ScopeRestartHarness.run(blocked,"systemui");yes(blocked.finished.await(5,TimeUnit.SECONDS),"blocked restart completed");yes(RootShell.calls==0&&AppConfig.attempts==25&&AuditLog.read(blocked).contains("[SCOPE_RESTART_BLOCKED]"),"unsynced configuration cannot issue restart");
  AppConfig.synced=true;AppConfig.attempts=0;AppConfig.publishAfter=Integer.MAX_VALUE;FrameworkConfigSync.publishedRevision=9;RootShell.calls=0;
  android.app.Activity stale=new android.app.Activity(dir.toFile());ScopeRestartHarness.run(stale,"launcher");yes(stale.finished.await(5,TimeUnit.SECONDS),"stale publication check completed");
  yes(RootShell.calls==0&&AppConfig.attempts==25,"a successful mirror result for an older published revision cannot restart launcher");
  AppConfig.attempts=0;AppConfig.revision=11;AppConfig.publishAfter=3;RootShell.calls=0;
  android.app.Activity delayed=new android.app.Activity(dir.toFile());RootShell.inspection=()->{
   yes(FrameworkConfigSync.isPublished(new ConfigSnapshot(11,AppConfig.currentValues)),"exact latest revision and values are published before restart");
   yes(AuditLog.read(delayed).contains("stage=RESTART_READY;revision=11"),"latest grid revision has pre-restart evidence");
  };ScopeRestartHarness.run(delayed,"launcher");yes(delayed.finished.await(5,TimeUnit.SECONDS),"delayed publish restart completed");
  yes(RootShell.calls==1&&AppConfig.attempts==3,"restart waits for exact publication and then issues one command");
  AppConfig.throwsOnMirror=true;android.app.Activity thrown=new android.app.Activity(dir.toFile());ScopeRestartHarness.run(thrown,"settings");yes(thrown.finished.await(5,TimeUnit.SECONDS),"restart exception reported");yes(AuditLog.read(thrown).contains("[SCOPE_RESTART_ERROR]"),"restart exception has audit evidence");
 }
 public static void main(String[] args)throws Exception{Path dir=Files.createTempDirectory("duo-diagnostic-boundaries-");try{injection(dir);attribution();captures();frameworkLogs();limits();logcat();shoulderRuntime(dir);audit(dir);restart(dir);System.out.println("PASS diagnostic reliability: "+checks+" checks (production methods; no root/device commands)");}finally{try(var paths=Files.walk(dir)){for(Path p:paths.sorted(Comparator.reverseOrder()).toList())Files.deleteIfExists(p);}}}
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", type=Path, help="JDK root directory; defaults to JAVA_HOME or javac/java on PATH")
    parser.add_argument("--json-jar", type=Path, help="Existing org.json jar; defaults to JSON_JAR")
    parser.add_argument("--negative-controls", action="store_true", help="Compile collector mutants and require the real-path assertions to reject them")
    args = parser.parse_args()
    jdk = args.jdk or (Path(os.environ["JAVA_HOME"]) if os.environ.get("JAVA_HOME") else None)
    suffix = ".exe" if os.name == "nt" else ""
    if jdk is not None:
        javac = str(jdk / "bin" / ("javac" + suffix))
        java = str(jdk / "bin" / ("java" + suffix))
        if not Path(javac).is_file() or not Path(java).is_file():
            parser.error(f"JDK tools not found under {jdk}/bin; pass --jdk or set JAVA_HOME to a JDK root")
    else:
        javac, java = shutil.which("javac"), shutil.which("java")
        if not javac or not java:
            parser.error("JDK required; pass --jdk, set JAVA_HOME, or put javac and java on PATH")
    json_path = args.json_jar or os.environ.get("JSON_JAR")
    if not json_path:
        parser.error("org.json jar required; pass --json-jar /path/to/json.jar or set JSON_JAR")
    json_jar = Path(json_path).expanduser()
    if not json_jar.is_file():
        parser.error(f"org.json jar not found: {json_jar}; pass --json-jar /path/to/json.jar or set JSON_JAR")
    export = (SRC / "DiagnosticExport.java").read_text(encoding="utf-8")
    assert member(export, "static String build").count("appendFrameworkLogs(out,ai,shoulder);") == 1, "build must execute the tested production collector"
    telemetry = (SRC / "hook/HookTelemetry.java").read_text(encoding="utf-8")
    root_shell = (SRC / "RootShell.java").read_text(encoding="utf-8")
    restart = (SRC / "ScopeRestartDialog.java").read_text(encoding="utf-8")
    sources = dict(STUBS)
    sources["ls/augment/com/RootShell.java"] = """package ls.augment.com;import java.nio.charset.StandardCharsets;
final class RootShell {interface Transport{Result read(String c,String i,long t,int m);}static Transport transport;static int calls;static Runnable inspection;static Result run(String c,String i,long t,int m){calls++;if(inspection!=null)inspection.run();return transport==null?new Result(0,"",false):transport.read(c,i,t,m);}
""" + member(root_shell, "static String quote") + member(root_shell, "static final class CapturedOutput") + member(root_shell, "static final class Result") + "}"
    signatures = ("static Map<Integer,String> processNames", "static String systemPid", "static Set<String> currentPackages",
                  "private static RootShell.Result filter", "private static void filteredSource", "private static void appendLogcat", "private static void appendFrameworkLogs",
                  "static String diagnosticValue", "static void appendDiagnosticValue", "static void compactHooks",
                  "private static void source(StringBuilder out,String name,RootShell.Result result,int limit)",
                  "private static void source(StringBuilder out,String name,RootShell.Result result,int limit,boolean values,boolean filtered)", "private static int lineCount",
                  "static void appendShoulderSwitchLog", "private static void file")
    sources["ls/augment/com/DiagnosticExportHarness.java"] = """package ls.augment.com;import java.util.*;import java.nio.charset.StandardCharsets;import org.json.*;import android.content.Context;import java.io.File;
final class DiagnosticExportHarness {private static String diagnosticValues(String raw){return raw;}
static String shoulderRuntime(android.content.Context context){StringBuilder out=new StringBuilder();appendShoulderSwitchLog(out,context);return out.toString();}
static String framework(){StringBuilder out=new StringBuilder();appendFrameworkLogs(out,false,false);return out.toString();}
static String filtered(String raw,boolean shoulder){return filter(new RootShell.Result(0,raw,false),false,shoulder,false).output;}
static String describe(RootShell.Result raw,boolean filtered,boolean moduleOnly){StringBuilder out=new StringBuilder();source(out,"TEST",filtered?filter(raw,false,false,moduleOnly):raw,1024,false,filtered);return out.toString();}
static RootShell.CapturedOutput filterIdentity(RootShell.Result raw){return filter(raw,false,false,true).capture;}
static String logcat(DiagnosticLogcat.Collection collection,boolean ai,boolean shoulder){StringBuilder out=new StringBuilder();appendLogcat(out,"TEST_LOGCAT",collection,ai,shoulder);return out.toString();}
static String value(String key,String value){StringBuilder out=new StringBuilder();appendDiagnosticValue(out,key,value);return out.toString();}
""" + "\n".join(member(export, s) for s in signatures) + "}"
    sources["ls/augment/com/HookPackagesHarness.java"] = """package ls.augment.com;import java.util.*;import java.util.concurrent.*;import org.json.*;
final class HookPackagesHarness {static void requestPublish(long delay){}static String process="unknown",pkg="unknown";private static final Set<String> packages=ConcurrentHashMap.newKeySet();static JSONArray names(){return packageNames();}
""" + member(telemetry, "static void ready") + member(telemetry, "private static JSONArray packageNames") + "}"
    sources["ls/augment/com/HookShoulderHarness.java"] = """package ls.augment.com;import java.util.concurrent.*;import java.util.concurrent.atomic.*;import android.os.SystemClock;
final class HookShoulderHarness {static void requestPublish(long delay){}static final ArrayBlockingQueue<String[]> trace=new ArrayBlockingQueue<>(256);static boolean shoulder,ai;
static final AtomicLong sequence=new AtomicLong(),dropped=new AtomicLong();static final ConcurrentHashMap<String,AtomicLong> dropReasons=new ConcurrentHashMap<>();
static long lastDropAt;static String lastDropReason="";
""" + member(telemetry, "static void shoulderSwitch") + member(telemetry, "static void detail") + member(telemetry, "private static boolean hasRuntimeEvents").replace("private static", "static") + member(telemetry, "private static void recordDrop") + "}"
    constants = """static final String SETTINGS="settings",SYSTEM_UI="systemui",LAUNCHER="launcher",DEVICE="device",APPS="apps",GAMES="games",FAN="fan",AMAP="amap";"""
    sources["ls/augment/com/ScopeRestartHarness.java"] = """package ls.augment.com;import android.app.Activity;import android.widget.Toast;import java.util.concurrent.*;
final class ScopeRestartHarness {""" + constants + "static void run(Activity a,String scope){restart(a,scope);}" + member(restart, "private static void restart") + member(restart, "private static String command") + "}"
    sources["ls/augment/com/TestDiagnosticReliability.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="duo-diagnostic-reliability-") as name:
        directory = Path(name)
        files = []
        for relative, content in sources.items():
            path = directory / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            files.append(path)
        files += [SRC / (name + ".java") for name in ("FrameworkDiagnosticFilter", "RuntimeEnvironment", "ModuleRuntimeStatus", "DiagnosticEvidencePolicy", "DiagnosticWritePolicy", "DiagnosticLogcat", "DiagnosticStore", "ShoulderSwitchLogPolicy", "AtomicWorkbenchLogPolicy", "HookTargetRegistry", "ScopeRestartPolicy", "AuditLog", "BoundedLog", "LogRepeatPolicy")]
        subprocess.run([javac, "-encoding", "UTF-8", "--release", "17", "-cp", str(json_jar), "-d", str(directory), *map(str, files)], check=True)
        subprocess.run([java, "-cp", str(directory) + os.pathsep + str(json_jar), "ls.augment.com.TestDiagnosticReliability"], check=True, timeout=30)
        if args.negative_controls:
            harness = sources["ls/augment/com/DiagnosticExportHarness.java"]
            for label, before, after, expected in (
                ("old-basename-regex", '[A-Za-z0-9_.:-]+', '[A-Za-z0-9_.-]+', "exact colon basename reaches a quoted tail once"),
                ("removed-file-cap", 'if(attempted>=6)', 'if(false)', "framework collector caps real tail attempts at six"),
            ):
                assert harness.count(before) == 1, (label, "mutation anchor changed")
                mutated = directory / label
                path = mutated / "ls/augment/com/DiagnosticExportHarness.java"
                path.parent.mkdir(parents=True)
                path.write_text(harness.replace(before, after, 1), encoding="utf-8")
                subprocess.run([javac, "-encoding", "UTF-8", "--release", "17", "-cp", str(directory) + os.pathsep + str(json_jar), "-d", str(mutated), str(path)], check=True)
                result = subprocess.run([java, "-cp", os.pathsep.join(map(str, (mutated, directory, json_jar))), "ls.augment.com.TestDiagnosticReliability"], capture_output=True, text=True, encoding="utf-8", timeout=30)
                assert result.returncode != 0 and expected in result.stderr, (label, result.returncode, result.stdout, result.stderr)
                print("PASS compiled negative control " + label + ": " + result.stderr.splitlines()[0], flush=True)


if __name__ == "__main__":
    main()
