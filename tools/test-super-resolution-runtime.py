"""Fault-test the real phone-side GFRC ownership transaction without a device.

Compiles the production hook, replacing only Android/config IO and the native
capability-list pathname. The JSON facade round-trips self-contained Base64
serialized maps; it is deliberately not an Android JSONObject compatibility
test. A second JVM verifies recovery without any in-memory ownership state.
No ADB, Android settings, system properties, or production source are changed.
"""
from pathlib import Path
import json
import os
import re
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / "android/app/src/main/java/ls/augment/com"
SOURCE = MAIN / "hook/SuperResolutionRuntimeHook.java"

FILES = {
    "android/content/ContentResolver.java": "package android.content;public class ContentResolver {}",
    "android/content/Context.java": """package android.content;public class Context {
private final ContentResolver resolver=new ContentResolver();
public Context getApplicationContext(){return this;}
public ContentResolver getContentResolver(){return resolver;}}
""",
    "org/json/JSONObject.java": r'''package org.json;
import java.io.*;import java.util.*;
public class JSONObject implements Serializable {
 private final LinkedHashMap<String,Object> values;
 public JSONObject(){values=new LinkedHashMap<>();}
 @SuppressWarnings("unchecked") public JSONObject(String encoded){
  try(var input=new ObjectInputStream(new ByteArrayInputStream(Base64.getDecoder().decode(encoded)))){
   values=(LinkedHashMap<String,Object>)input.readObject();
  }catch(Exception invalid){throw new IllegalArgumentException("invalid fixture JSON",invalid);}
 }
 public JSONObject put(String key,Object value){values.put(key,value);return this;}
 public Object get(String key){if(!values.containsKey(key))throw new IllegalArgumentException("missing:"+key);return values.get(key);}
 public String getString(String key){return (String)get(key);}
 public int getInt(String key){return (Integer)get(key);}
 public boolean getBoolean(String key){return (Boolean)get(key);}
 public JSONObject getJSONObject(String key){return (JSONObject)get(key);}
 public int length(){return values.size();}
 public Iterator<String> keys(){return values.keySet().iterator();}
 public String toString(){try(var bytes=new ByteArrayOutputStream();var output=new ObjectOutputStream(bytes)){
  output.writeObject(values);output.flush();return Base64.getEncoder().encodeToString(bytes.toByteArray());
 }catch(IOException failure){throw new AssertionError(failure);}}
}
''',
    "android/provider/Settings.java": r'''package android.provider;
import java.util.*;import android.content.ContentResolver;
public class Settings {public static class Global {
 public static final Map<String,String> values=new LinkedHashMap<>();
 public static final Map<String,Integer> counts=new LinkedHashMap<>();
 public static final Map<String,Set<Integer>> failures=new HashMap<>(),dropped=new HashMap<>();
 public static final List<String> events=new ArrayList<>();
 public static String getString(ContentResolver resolver,String key){return values.get(key);}
 public static boolean putString(ContentResolver resolver,String key,String value){
  int count=counts.merge(key,1,Integer::sum);events.add("setting:"+key+":"+count);
  if(failures.getOrDefault(key,Set.of()).contains(count))return false;
  if(!dropped.getOrDefault(key,Set.of()).contains(count)){
   if(value==null)values.remove(key);else values.put(key,value);
  }return true;
 }
 public static void fail(String key,int...numbers){Set<Integer> values=new HashSet<>();for(int n:numbers)values.add(n);failures.put(key,values);}
 public static void reset(){values.clear();counts.clear();failures.clear();dropped.clear();events.clear();}
}}
''',
    "android/os/SystemProperties.java": r'''package android.os;
import java.util.*;import android.provider.Settings;import org.json.JSONObject;
public class SystemProperties {
 public static final Map<String,String> values=new LinkedHashMap<>();
 public static final List<String> writes=new ArrayList<>();
 public static final Set<Integer> failures=new HashSet<>(),dropped=new HashSet<>();
 public static final Set<Integer> committedFailures=new HashSet<>(),unreadableAfterCommit=new HashSet<>();
 public static final Set<String> unreadable=new HashSet<>();
 public static String ownerKey;public static int durableChecks;
 public static String get(String key){if(unreadable.contains(key))throw new IllegalStateException("injected_property_read:"+key);return values.getOrDefault(key,"");}
 public static void set(String key,String value){
  String journal=ls.augment.com.hook.GfrcRecoveryClient.values.get(ownerKey);
  if(journal==null)throw new AssertionError("property write without durable recovery journal:"+key);
  JSONObject owner=new JSONObject(journal);
  if(!owner.getJSONObject("properties").keys().hasNext()
     || !contains(owner.getJSONObject("properties"),key))
   throw new AssertionError("property write without saved original:"+key);
  durableChecks++;int number=writes.size()+1;writes.add(key+"="+value);
  Settings.Global.events.add("property:"+key+":"+number);
  if(committedFailures.contains(number)){
   values.put(key,value);if(unreadableAfterCommit.contains(number))unreadable.add(key);
   throw new IllegalStateException("injected_after_commit:"+number);
  }
  if(failures.contains(number))throw new IllegalStateException("injected_property_write:"+number);
  if(!dropped.contains(number))values.put(key,value);
 }
 private static boolean contains(JSONObject object,String key){for(var keys=object.keys();keys.hasNext();)if(key.equals(keys.next()))return true;return false;}
 public static void reset(){values.clear();writes.clear();failures.clear();dropped.clear();committedFailures.clear();unreadableAfterCommit.clear();unreadable.clear();durableChecks=0;}
}
''',
    "ls/augment/com/ConfigSnapshot.java": """package ls.augment.com;public class ConfigSnapshot {
public final java.util.Map<String,String> values=new java.util.HashMap<>();
public String get(String key){return values.get(key);}}
""",
    "ls/augment/com/ModuleRuntimeStatus.java": """package ls.augment.com;public class ModuleRuntimeStatus {
public static String boot="11111111-1111-1111-1111-111111111111";
public static String bootId(){return boot;}}
""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;
import android.content.Context;import ls.augment.com.ConfigSnapshot;
public class FeatureSettings {
public static final String GAME_MASTER=ls.augment.com.ConfigSchema.GAME_MASTER;
public static boolean verified=true;public static ConfigSnapshot current=new ConfigSnapshot();
public static final java.util.Map<String,String> diagnostics=new java.util.LinkedHashMap<>();
public static boolean addSnapshotListener(Context context,Runnable listener){return true;}
public static boolean hasVerifiedSnapshot(Context context){return verified;}
public static ConfigSnapshot snapshot(Context context){return current;}
public static void diagnostic(Context context,String key,String value){diagnostics.put(key,value);}}
""",
    "ls/augment/com/hook/GfrcRecoveryClient.java": r'''package ls.augment.com.hook;
import java.util.*;import android.content.Context;
public class GfrcRecoveryClient {
 public static final String KEY="owner";
 public static final Map<String,String> values=new LinkedHashMap<>();
 public static final Map<String,Integer> counts=new LinkedHashMap<>();
 public static final Map<String,Set<Integer>> failures=new HashMap<>(),dropped=new HashMap<>();
 public static String read(Context context){return values.get(KEY);}
 public static void write(Context context,String expected,String payload){
  if(!Objects.equals(expected,values.get(KEY)))throw new IllegalStateException("owner_changed");
  int count=counts.merge(KEY,1,Integer::sum);
  if(failures.getOrDefault(KEY,Set.of()).contains(count))throw new IllegalStateException("owner_record_not_saved");
  if(dropped.getOrDefault(KEY,Set.of()).contains(count))throw new IllegalStateException("owner_record_not_accepted");
  if(payload==null)values.remove(KEY);else values.put(KEY,payload);
 }
 public static void fail(String key,int...numbers){Set<Integer> failed=new HashSet<>();for(int n:numbers)failed.add(n);failures.put(key,failed);}
 public static void reset(){values.clear();counts.clear();failures.clear();dropped.clear();}
}
''',
    "ls/augment/com/hook/TestSuperResolutionRuntime.java": r'''package ls.augment.com.hook;
import java.lang.reflect.*;import java.nio.file.*;import java.util.*;
import android.content.Context;import android.os.SystemProperties;import android.provider.Settings;
import ls.augment.com.*;import org.json.JSONObject;
public class TestSuperResolutionRuntime {
 static final String WIDTH="vendor.gpp.maxw",HEIGHT="vendor.gpp.maxh",ALL="vendor.gpp.allgame.enable";
 static final String EXTENSION="vendor.gpp.create_frc_extension",MODE="game_gfrc_mode";
 static final String OWNER=GfrcRecoveryClient.KEY;
 static final String BOOT="11111111-1111-1111-1111-111111111111";
 static final Context CONTEXT=new Context();static Path fixture;static int checks,cases;
 static void check(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message+"\nproperties="+SystemProperties.values+"\nwrites="+SystemProperties.writes+"\ndiagnostics="+FeatureSettings.diagnostics);}
 static void test(String name,Checked task)throws Exception{task.run();cases++;System.out.println("PASS "+name);}
 interface Checked {void run()throws Exception;}
 static void invoke(String method,Class<?>[] types,Object...arguments)throws Exception{
  Method target=SuperResolutionRuntimeHook.class.getDeclaredMethod(method,types);target.setAccessible(true);
  try{target.invoke(null,arguments);}catch(InvocationTargetException wrapped){
   if(wrapped.getCause() instanceof Exception)throw (Exception)wrapped.getCause();
   if(wrapped.getCause() instanceof Error)throw (Error)wrapped.getCause();throw wrapped;
  }
 }
 static void tick()throws Exception{invoke("reconcile",new Class<?>[]{Context.class},CONTEXT);}
 static void setCached(String name,Object value)throws Exception{Field field=SuperResolutionRuntimeHook.class.getDeclaredField(name);field.setAccessible(true);field.set(null,value);}
 static void nativeList()throws Exception{Files.writeString(fixture,"# native list fixture\ncom.native.game,1,2\ncom.zero.game,0,0\ncom.duplicate.game,2,2\ncom.duplicate.game,0,0\ncom.edge.game,0,1\nmalformed\ncom.bad.game,x,1\n");}
 static void reset()throws Exception{
  Settings.Global.reset();GfrcRecoveryClient.reset();SystemProperties.reset();SystemProperties.ownerKey=OWNER;
  SystemProperties.values.put(WIDTH,"");SystemProperties.values.put(HEIGHT,"0");
  SystemProperties.values.put(ALL,"");SystemProperties.values.put(EXTENSION,"1");
  FeatureSettings.current=new ConfigSnapshot();FeatureSettings.verified=true;FeatureSettings.diagnostics.clear();
  FeatureSettings.current.values.put(FeatureSettings.GAME_MASTER,"1");FeatureSettings.current.values.put(GameOptions.PLUGINS,"1");
  ModuleRuntimeStatus.boot=BOOT;setCached("propertyGet",null);setCached("propertySet",null);nativeList();
 }
 static void disable(){FeatureSettings.current.values.put(GameOptions.PLUGINS,"0");}
 static String state(){return FeatureSettings.diagnostics.getOrDefault(SuperResolutionRuntimeHook.STATE_KEY,"");}
 static String error(){return FeatureSettings.diagnostics.getOrDefault(SuperResolutionRuntimeHook.ERROR_KEY,"");}
 static String journal(){return GfrcRecoveryClient.values.get(OWNER);}
 static JSONObject owner(){return new JSONObject(journal());}
 static int ownerWrites(){return GfrcRecoveryClient.counts.getOrDefault(OWNER,0);}
 static void originalProperties(){check("".equals(SystemProperties.get(WIDTH))&&"0".equals(SystemProperties.get(HEIGHT))&&"".equals(SystemProperties.get(ALL)),"original native property values restored");}
 static void desiredProperties(){check("1080".equals(SystemProperties.get(WIDTH))&&"2400".equals(SystemProperties.get(HEIGHT))&&"1".equals(SystemProperties.get(ALL)),"native desired properties applied");}
 static void saveDisk(Path path)throws Exception{
  Properties properties=new Properties();for(var entry:Settings.Global.values.entrySet())properties.setProperty("setting."+entry.getKey(),entry.getValue());
  for(var entry:GfrcRecoveryClient.values.entrySet())properties.setProperty("private."+entry.getKey(),entry.getValue());
  for(var entry:SystemProperties.values.entrySet())properties.setProperty("property."+entry.getKey(),entry.getValue());
  try(var output=Files.newOutputStream(path)){properties.store(output,"independent process restart fixture");}
 }
 static void loadDisk(Path path)throws Exception{
  Properties properties=new Properties();try(var input=Files.newInputStream(path)){properties.load(input);}
  for(String key:properties.stringPropertyNames()){
   if(key.startsWith("setting."))Settings.Global.values.put(key.substring(8),properties.getProperty(key));
   else if(key.startsWith("private."))GfrcRecoveryClient.values.put(key.substring(8),properties.getProperty(key));
   else if(key.startsWith("property."))SystemProperties.values.put(key.substring(9),properties.getProperty(key));
  }
 }
 public static void main(String[] arguments)throws Exception{
  fixture=Path.of(arguments[0]);String action=arguments.length>1?arguments[1]:"suite";
  if(action.equals("restart-write")){
   reset();tick();desiredProperties();check(owner().getString("phase").equals("applied"),"applied durable journal");
   Settings.Global.values.put(MODE,"com.absent.game+221,com.native.game+121");saveDisk(Path.of(arguments[2]));
   System.out.println("PASS restart fixture persisted; no in-memory state exported");return;
  }
  if(action.equals("restart-read")){
   reset();loadDisk(Path.of(arguments[2]));disable();tick();originalProperties();
   check(journal()==null,"new JVM recovered ownership and deleted only completed journal");
   check("com.absent.game+220,com.native.game+121".equals(Settings.Global.values.get(MODE)),"new JVM native capability cleanup");
   check(SystemProperties.durableChecks==3,"all restart restoration writes use durable original values");
   System.out.println("PASS fresh JVM restart recovery: "+checks+" checks");return;
  }
  test("verified snapshot, both gates, and native-extension availability",()->{
   reset();FeatureSettings.verified=false;tick();check(state().startsWith("state=waiting_config|"),"unverified config waits");check(SystemProperties.writes.isEmpty()&&journal()==null,"unverified config has no ownership or native writes");
   FeatureSettings.verified=true;FeatureSettings.current.values.put(FeatureSettings.GAME_MASTER,"0");tick();check(state().startsWith("state=disabled|"),"master gate disables");
   FeatureSettings.current.values.put(FeatureSettings.GAME_MASTER,"1");disable();tick();check(SystemProperties.writes.isEmpty(),"plugin gate disables");
   FeatureSettings.current.values.put(GameOptions.PLUGINS,"true");SystemProperties.values.put(EXTENSION,"0");tick();check(state().startsWith("state=native_unavailable|"),"native extension gate");check(journal()==null,"native extension unavailable never claims ownership");
  });
  test("journal save failure and unaccepted save prevent every property write",()->{
   reset();GfrcRecoveryClient.fail(OWNER,1);tick();check(SystemProperties.writes.isEmpty(),"failed journal save: zero real writes");check(error().contains("owner_record_not_saved"),"journal failure reported");originalProperties();
   reset();GfrcRecoveryClient.dropped.put(OWNER,Set.of(1));tick();check(SystemProperties.writes.isEmpty(),"unaccepted journal save: zero real writes");check(error().contains("owner_record_not_accepted"),"journal readback required");
  });
  test("real native-list parser rejects unavailable list before ownership",()->{
   reset();Files.writeString(fixture,"# no native capabilities\ninvalid\ncom.game,x,2\n");tick();check(SystemProperties.writes.isEmpty()&&journal()==null,"invalid native list prevents capability takeover");check(error().contains("native_list_unavailable"),"invalid list has actionable failure");
   reset();Files.writeString(fixture,"x".repeat(1025));tick();check(SystemProperties.writes.isEmpty()&&journal()==null,"overlong native row prevents writes");check(error().contains("native_list_too_large"),"native row bound enforced");
  });
  test("second and third property write failures roll back durable originals",()->{
   for(int failAt:new int[]{2,3}){
    reset();SystemProperties.failures.add(failAt);tick();originalProperties();check(journal()==null,"completed rollback removes journal at failure "+failAt);check(state().startsWith("state=error|"),"failed apply is never reported applied");check(error().contains("injected_property_write:"+failAt),"failed apply reason retained");
    check(SystemProperties.durableChecks==SystemProperties.writes.size(),"every apply/rollback attempt had durable original");
    check(SystemProperties.writes.get(0).equals(WIDTH+"=1080"),"width published first");check(SystemProperties.writes.get(1).equals(HEIGHT+"=2400"),"height published before all-game capability");
    if(failAt==3)check(SystemProperties.writes.get(3).equals(HEIGHT+"=0")&&SystemProperties.writes.get(4).equals(WIDTH+"="),"rollback reverses limits after capability");
   }
  });
  test("property readback rejection rolls back instead of claiming applied",()->{
   reset();SystemProperties.dropped.add(2);tick();originalProperties();check(journal()==null,"unaccepted property rollback finishes");check(error().contains("property_not_accepted:"+HEIGHT),"native property acknowledgement required");
  });
  test("failed rollback preserves unresolved original and retries on disable",()->{
   reset();SystemProperties.failures.addAll(Set.of(2,3));tick();check("1080".equals(SystemProperties.get(WIDTH)),"failed rollback leaves actual owned width observable");
   check(owner().getString("phase").equals("restoring"),"interrupted recovery durable phase");check(owner().getJSONObject("properties").length()==1,"journal retains only unresolved property");
   check(owner().getJSONObject("properties").getJSONObject(WIDTH).getString("original").equals(""),"unresolved original survives failure");
   disable();SystemProperties.failures.clear();tick();originalProperties();check(journal()==null,"later recovery clears journal only after restoration");
  });
  test("applied ownership and unchanged polling do not rewrite",()->{
   reset();tick();desiredProperties();check(owner().getString("phase").equals("applied"),"successful apply phase saved");
   int journalCount=ownerWrites(),writeCount=SystemProperties.writes.size();String originalJournal=journal();
   for(int i=0;i<25;i++)tick();check(ownerWrites()==journalCount&&SystemProperties.writes.size()==writeCount&&journal().equals(originalJournal),"unchanged polls preserve journal and avoid native writes");
   check(SystemProperties.writes.equals(List.of(WIDTH+"=1080",HEIGHT+"=2400",ALL+"=1")),"limits must precede capability advertising");
  });
  test("preexisting complete native configuration remains externally owned",()->{
   reset();SystemProperties.values.put(WIDTH,"1080");SystemProperties.values.put(HEIGHT,"2400");SystemProperties.values.put(ALL,"1");tick();
   check(state().startsWith("state=external_configuration|")&&journal()==null&&SystemProperties.writes.isEmpty(),"already-desired properties never become module-owned");
   Settings.Global.values.put(MODE,"com.absent.game+111");disable();tick();check("com.absent.game+111".equals(Settings.Global.values.get(MODE)),"external native capability and modes untouched");
  });
  test("external drift is protected during apply and partial restore",()->{
   reset();tick();SystemProperties.values.put(WIDTH,"777");int count=SystemProperties.writes.size();tick();
   check(state().startsWith("state=conflict|")&&SystemProperties.writes.size()==count,"applied drift stops overwrite");check(error().contains("property_changed_elsewhere:"+WIDTH),"external drift reported");
   disable();tick();check("777".equals(SystemProperties.get(WIDTH)),"restore does not clobber another component");check("0".equals(SystemProperties.get(HEIGHT))&&"".equals(SystemProperties.get(ALL)),"independent owned values still restored");
   check(journal()!=null&&owner().getJSONObject("properties").length()==1&&state().startsWith("state=restore_pending|"),"conflict retains only unresolved original");
   SystemProperties.values.put(WIDTH,"1080");tick();originalProperties();check(journal()==null,"recovery resumes when intended owned value returns");
  });
  test("mode cleanup failure still restores all properties and retains retry journal",()->{
   reset();tick();Settings.Global.values.put(MODE,"com.absent.game+221,com.native.game+121");Settings.Global.fail(MODE,1);disable();tick();originalProperties();
   check(journal()!=null&&owner().getJSONObject("properties").length()==0,"mode failure retains empty-property recovery journal");check(!owner().getBoolean("modesStopped"),"mode failure cannot mark native modes stopped");
   check(state().startsWith("state=restore_pending|")&&error().contains("mode_not_saved"),"pending mode cleanup visible");
   check("com.absent.game+221,com.native.game+121".equals(Settings.Global.values.get(MODE)),"failed mode write does not pretend success");
   int properties=SystemProperties.writes.size();Settings.Global.failures.clear();GfrcRecoveryClient.failures.clear();tick();
   check("com.absent.game+220,com.native.game+121".equals(Settings.Global.values.get(MODE)),"retry disables unsupported final enable bit only");check(SystemProperties.writes.size()==properties&&journal()==null,"retry completes without rewriting recovered properties");
  });
  test("unavailable native list during close cannot block property restoration",()->{
   reset();tick();Settings.Global.values.put(MODE,"com.absent.game+111,com.native.game+121");Files.writeString(fixture,"# unavailable after takeover\n");disable();tick();originalProperties();
   check(journal()!=null&&owner().getJSONObject("properties").length()==0&&!owner().getBoolean("modesStopped"),"native list failure retains mode recovery obligation");
   check(error().contains("native_list_unavailable")&&state().startsWith("state=restore_pending|"),"native list failure visible after restored properties");
   int writes=SystemProperties.writes.size();nativeList();tick();check(journal()==null&&SystemProperties.writes.size()==writes,"capability list recovery completes without repeating property writes");
   check("com.absent.game+110,com.native.game+121".equals(Settings.Global.values.get(MODE)),"mode recovery retains native-supported entry");
  });
  test("rejected capability restoration keeps only unresolved property",()->{
   for(boolean dropped:new boolean[]{false,true}){
    reset();tick();disable();if(dropped)SystemProperties.dropped.add(4);else SystemProperties.failures.add(4);tick();
    check("1".equals(SystemProperties.get(ALL))&&"0".equals(SystemProperties.get(HEIGHT))&&"".equals(SystemProperties.get(WIDTH)),"a failed capability restore never blocks independent limits restoration");
    check(journal()!=null&&owner().getJSONObject("properties").length()==1&&state().startsWith("state=restore_pending|"),"failed restoration keeps only capability original");
    check(owner().getJSONObject("properties").getJSONObject(ALL).getString("original").equals(""),"pending capability original preserved");
    SystemProperties.failures.clear();SystemProperties.dropped.clear();tick();originalProperties();check(journal()==null,"pending capability restoration retries safely");
   }
  });
  test("restore phase-journal failure cannot block best-effort native restoration",()->{
   for(boolean dropped:new boolean[]{false,true}){
    reset();tick();disable();
    if(dropped)GfrcRecoveryClient.dropped.put(OWNER,Set.of(3));else GfrcRecoveryClient.fail(OWNER,3);
    tick();originalProperties();check(journal()==null,"transient restore phase save failure is recoverable from existing durable journal");
    check(SystemProperties.writes.subList(3,6).equals(List.of(ALL+"=",HEIGHT+"=0",WIDTH+"=")),"capability removed before processing limits even when restoring phase save fails");
   }
  });
  test("persistent restore-journal IO failure still restores and preserves durable originals",()->{
   reset();tick();disable();Set<Integer> failed=new HashSet<>();for(int n=3;n<40;n++)failed.add(n);GfrcRecoveryClient.failures.put(OWNER,failed);
   tick();originalProperties();check(journal()!=null,"persistent journal failure retains preexisting durable originals");
   check(owner().getJSONObject("properties").length()==3,"durable applied journal remains intact when every recovery journal save fails");
   int writes=SystemProperties.writes.size();Settings.Global.failures.clear();GfrcRecoveryClient.failures.clear();tick();check(journal()==null,"journal recovery retries once IO returns");check(SystemProperties.writes.size()==writes,"retry recognizes restored properties and avoids repeated writes");
  });
  test("real list last-row wins, cap zero final-bit cleanup, native capability protection",()->{
   reset();tick();String input="com.absent.game+221,com.native.game+121,com.zero.game+116,com.duplicate.game+229,com.edge.game+111,com.zero.game+115,broken,com.zero.game+1111,com.zero.game+121+bad";
   Settings.Global.values.put(MODE,input);disable();tick();
   check("com.absent.game+220,com.native.game+121,com.zero.game+115,com.duplicate.game+228,com.edge.game+111,com.zero.game+115,broken,com.zero.game+1111,com.zero.game+121+bad".equals(Settings.Global.values.get(MODE)),"zero/absent cap disables only enabled bit; quality/FPS, native nonzero cap and malformed entries retained");
   originalProperties();check(journal()==null,"mode cleanup and properties both finish");
  });
  test("externally enabled all-game capability never grants native-mode cleanup ownership",()->{
   reset();SystemProperties.values.put(ALL,"1");tick();check(!owner().getBoolean("capabilityOwned"),"preexisting native capability not owned");
   Settings.Global.values.put(MODE,"com.absent.game+111");disable();tick();check("1".equals(SystemProperties.get(ALL)),"original external capability retained");
   check("".equals(SystemProperties.get(WIDTH))&&"0".equals(SystemProperties.get(HEIGHT)),"only captured processing limits restored");check("com.absent.game+111".equals(Settings.Global.values.get(MODE)),"external capability mode retained");check(journal()==null,"non-capability owner releases normally");
  });
  test("previous-boot journal cannot overwrite current native defaults",()->{
   reset();tick();ModuleRuntimeStatus.boot="22222222-2222-2222-2222-222222222222";
   SystemProperties.values.put(WIDTH,"555");SystemProperties.values.put(HEIGHT,"999");SystemProperties.values.put(ALL,"0");
   Settings.Global.values.put(MODE,"com.absent.game+111");disable();int count=SystemProperties.writes.size();tick();
   check(SystemProperties.writes.size()==count&&journal()==null,"old nonpersistent property ownership discarded without restoration");
   check("555".equals(SystemProperties.get(WIDTH))&&"999".equals(SystemProperties.get(HEIGHT))&&"0".equals(SystemProperties.get(ALL)),"new boot actual defaults retained");
   check("com.absent.game+111".equals(Settings.Global.values.get(MODE)),"old ownership does not modify current native modes");
  });
  test("final applied-journal failure rolls back the same transaction",()->{
   reset();GfrcRecoveryClient.fail(OWNER,2);tick();originalProperties();check(error().contains("owner_record_not_saved"),"failed final applied acknowledgement reported");
   check(journal()==null,"before-write journal supports completed rollback after failed final save");
   Settings.Global.failures.clear();GfrcRecoveryClient.failures.clear();tick();desiredProperties();check(owner().getString("phase").equals("applied"),"next enabled request can start a fresh durable transaction");
   disable();tick();originalProperties();check(journal()==null,"new transaction retains actual original properties");
  });
  test("failed apply cleans native modes only after capability was advertised",()->{
   String original="com.absent.game+221,com.native.game+121";
   for(int failure:new int[]{2,3}){
    reset();Settings.Global.values.put(MODE,original);SystemProperties.failures.add(failure);tick();originalProperties();
    check(original.equals(Settings.Global.values.get(MODE)),"failure before actual allgame publication leaves native mode selection alone");
   }
   reset();Settings.Global.values.put(MODE,original);SystemProperties.committedFailures.add(3);tick();originalProperties();
   check("com.absent.game+220,com.native.game+121".equals(Settings.Global.values.get(MODE)),"capability committed before exception requires unsupported-mode stop");
   check(journal()==null,"mode and property rollback finish after committed write exception");
   reset();Settings.Global.values.put(MODE,original);GfrcRecoveryClient.fail(OWNER,2);tick();originalProperties();
   check("com.absent.game+220,com.native.game+121".equals(Settings.Global.values.get(MODE)),"final applied journal failure also stops advertised unsupported modes");
  });
  test("unknown capability readback retains recovery and conservatively stops unsupported modes",()->{
   reset();Settings.Global.values.put(MODE,"com.absent.game+111,com.native.game+121");
   SystemProperties.committedFailures.add(3);SystemProperties.unreadableAfterCommit.add(3);tick();
   check("1".equals(SystemProperties.values.get(ALL)),"unreadable committed capability remains explicitly unresolved");
   check("".equals(SystemProperties.get(WIDTH))&&"0".equals(SystemProperties.get(HEIGHT)),"unknown capability cannot block independent processing limit rollback");
   check("com.absent.game+110,com.native.game+121".equals(Settings.Global.values.get(MODE)),"uncertain attempted capability publication stops unsupported final enable bit");
   check(journal()!=null&&owner().getJSONObject("properties").length()==1,"unknown capability original remains durable");
   SystemProperties.unreadable.clear();disable();tick();originalProperties();check(journal()==null,"readback recovery finishes outstanding capability rollback");
  });
  test("failed advertised-mode rollback restores properties and retains mode obligation",()->{
   reset();Settings.Global.values.put(MODE,"com.absent.game+111");GfrcRecoveryClient.fail(OWNER,2);Settings.Global.fail(MODE,1);tick();originalProperties();
   check(journal()!=null&&owner().getJSONObject("properties").length()==0&&!owner().getBoolean("modesStopped"),"final phase failure plus mode IO failure preserves mode-only obligation");
   disable();Settings.Global.failures.clear();GfrcRecoveryClient.failures.clear();tick();check("com.absent.game+110".equals(Settings.Global.values.get(MODE))&&journal()==null,"later close finishes failed mode obligation");
  });
  test("native extension disappearing restores previously owned properties",()->{
   reset();tick();SystemProperties.values.put(EXTENSION,"0");tick();originalProperties();check(journal()==null&&"0".equals(SystemProperties.get(EXTENSION)),"extension loss releases ownership without changing native extension");
  });
  test("invalid journal and unavailable boot identity fail closed",()->{
   reset();GfrcRecoveryClient.values.put(OWNER,"x".repeat(4097));tick();check(SystemProperties.writes.isEmpty()&&error().contains("owner_record_too_large"),"oversized journal never grants writes");
   reset();ModuleRuntimeStatus.boot="unknown";tick();check(SystemProperties.writes.isEmpty()&&journal()==null&&error().contains("boot_identity_unavailable"),"invalid boot identity cannot take native ownership");
  });
  System.out.println("PASS production SuperResolutionRuntimeHook: "+cases+" scenarios, "+checks+" assertions (fake IO; real transaction and native-list parser)");
 }
}
''',
}


def java_tool(name):
    found = shutil.which(name)
    if found:
        return found
    candidate = Path(os.environ.get("JAVA_HOME", "C:/Program Files/Android/openjdk/jdk-21.0.8")) / "bin" / (name + (".exe" if os.name == "nt" else ""))
    if candidate.is_file():
        return str(candidate)
    raise SystemExit("Set JAVA_HOME or add a JDK to PATH")


def check_reset_cleanup(directory, owner_key):
    """Run the actual reset settings-prefix fragment against harmless fake IO."""
    reset_source = (MAIN / "ModuleExternalReset.java").read_text(encoding="utf-8")
    method = re.search(r"static String legacyCommand\(\)\s*\{[\s\S]*?return\s+([\s\S]*?);\s*\n\s*\}", reset_source)
    if method is None:
        raise AssertionError("production reset legacyCommand not found")
    # RetiredBootCache now owns the filesystem fragment. Exercise only the
    # actual settings statements before that helper, without inventing its text.
    settings_expression, separator, _ = method.group(1).partition("RetiredBootCache.command(true)")
    assert separator, "production reset filesystem boundary not found"
    tokens = re.findall(r'"(?:[^"\\]|\\.)*"', settings_expression)
    command = "".join(json.loads(token) for token in tokens)
    assert f"settings get global {owner_key}" in command
    assert "case \"$entry\" in ls_augment_*=*)" in command
    # Only execute the real settings fragment; /data cleanup is outside this test.
    prefix = command
    assert not owner_key.startswith("ls_augment_")
    shell = shutil.which("bash")
    git_bash = Path("C:/Program Files/Git/bin/bash.exe")
    if os.name == "nt" and git_bash.is_file():
        shell = str(git_bash)
    if not shell:
        print("PASS reset key/prefix and recovery-wait contracts (shell execution skipped: bash unavailable)")
        return
    fake = r'''
settings() {
    if [ "$1" = get ]; then printf '%s\n' "$FAKE_OWNER"; return 0; fi
    if [ "$1" = delete ]; then : > "$FAKE_DIR/deleted.$3"; return 0; fi
    if [ "$1" = list ]; then
        for key in ls_augment_runtime_test game_gfrc_mode "$FAKE_KEY"; do
            [ -e "$FAKE_DIR/deleted.$key" ] || printf '%s=value\n' "$key"
        done
        return 0
    fi
    return 99
}
'''
    for pending in (False, True):
        fixture = directory / ("reset-pending" if pending else "reset-complete")
        fixture.mkdir()
        environment = dict(os.environ, FAKE_DIR=fixture.as_posix(), FAKE_KEY=owner_key, FAKE_OWNER="pending" if pending else "null")
        result = subprocess.run([shell, "--noprofile", "--norc", "-c", fake + prefix], env=environment, capture_output=True, text=True, timeout=8)
        assert result.returncode == (82 if pending else 0), (result.returncode, result.stdout, result.stderr)
        assert not (fixture / ("deleted." + owner_key)).exists(), "broad reset deleted durable owner journal"
        assert not (fixture / "deleted.game_gfrc_mode").exists(), "reset deleted native game preferences"
        assert (fixture / "deleted.ls_augment_runtime_test").exists() == (not pending), "reset must wait for native ownership restoration before mirrors cleanup"
    print("PASS actual reset settings fragment: owner survives broad prefix; pending recovery blocks cleanup")


def main():
    production = SOURCE.read_text(encoding="utf-8")
    schema = (MAIN / "ConfigSchema.java").read_text(encoding="utf-8")
    options = (MAIN / "GameOptions.java").read_text(encoding="utf-8")
    master = re.search(r'public static final String GAME_MASTER = "([^"]+)";', schema).group(1)
    plugins = re.search(r'public static final String PLUGINS = "([^"]+)";', options).group(1)
    truthy = re.search(r"public static boolean truthy\(String value\)\s*\{[^}]+\}", schema).group(0)
    client = (MAIN / "hook/GfrcRecoveryClient.java").read_text(encoding="utf-8")
    owner = re.search(r'static final String LEGACY_KEY = "([^"]+)";', client).group(1)
    files = dict(FILES)
    files["ls/augment/com/ConfigSchema.java"] = f'package ls.augment.com;public class ConfigSchema {{public static final String GAME_MASTER="{master}";{truthy}}}'
    files["ls/augment/com/GameOptions.java"] = f'package ls.augment.com;public class GameOptions {{public static final String PLUGINS="{plugins}";}}'
    with tempfile.TemporaryDirectory(prefix="lsa-super-resolution-runtime-") as temporary:
        directory = Path(temporary)
        fixture = directory / "gpp_app_list"
        # Only redirect the IO pathname in a temporary copy; transaction code is unchanged.
        assert production.count('"/system/etc/gpp_app_list"') == 1
        files["ls/augment/com/hook/SuperResolutionRuntimeHook.java"] = production.replace('"/system/etc/gpp_app_list"', json.dumps(fixture.as_posix()))
        sources = []
        for name, content in files.items():
            path = directory / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            sources.append(str(path))
        subprocess.run([java_tool("javac"), "-encoding", "UTF-8", "--release", "17", "-d", str(directory), *sources], check=True, timeout=40)
        command = [java_tool("java"), "-cp", str(directory), "ls.augment.com.hook.TestSuperResolutionRuntime", str(fixture)]
        subprocess.run(command, check=True, timeout=25)
        persisted = directory / "restart.properties"
        subprocess.run(command + ["restart-write", str(persisted)], check=True, timeout=10)
        subprocess.run(command + ["restart-read", str(persisted)], check=True, timeout=10)
        check_reset_cleanup(directory, owner)
    print("PASS offline GFRC transaction suite; real Android permissions, GPU processing, and session lifecycle remain device checks")


if __name__ == "__main__":
    main()
