"""Actual health hook/controller gates and one-shot probe with offline Android doubles.

No ADB, account database, personal preferences or health installation is accessed.
Module ledger double counts opens/locks/writes; native DAO double counts pass-through.
"""
from pathlib import Path
import json
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
OUT = ROOT / 'audit-output/health-runtime-gate'
OUT.mkdir(parents=True, exist_ok=True)
JDK = Path(r'C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
runner = (ROOT / 'tools/run-java-tests.sh').read_text(encoding='utf-8')
production = [ROOT / p for p in re.findall(r'"\$ROOT/([^\"]+\.java)"', runner)
              if p.startswith('android/app/src/main/')]
production += [SRC / 'HealthIdentityProbe.java', SRC / 'hook/MiHealthHook.java',
               SRC / 'hook/HealthBackgroundHook.java', SRC / 'hook/TargetReflection.java']
sources = {
 'android/content/Context.java': '''package android.content;public class Context {
 public static int bindings,unbindings;public static boolean missing;
 public static final int BIND_AUTO_CREATE=1,BIND_NOT_FOREGROUND=2;
 public String getPackageName(){return "com.mi.health";}
 public Context getApplicationContext(){return this;}
 public Context createContextAsUser(android.os.UserHandle user,int flags){return this;}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public boolean bindService(Intent i,ServiceConnection c,int flags){bindings++;return true;}
 public void unbindService(ServiceConnection c){unbindings++;}}
''',
 'android/content/Intent.java': '''package android.content;import java.util.*;public class Intent {
 final Map<String,String> extras=new HashMap<>();public Intent setComponent(ComponentName c){return this;}
 public Intent putExtra(String k,String v){extras.put(k,v);return this;}
 public boolean hasExtra(String k){return extras.containsKey(k);}public String getStringExtra(String k){return extras.get(k);}
 public void removeExtra(String k){extras.remove(k);}}
''',
 'android/content/ComponentName.java': 'package android.content;public class ComponentName {public ComponentName(String p,String c){}}',
 'android/content/ServiceConnection.java': '''package android.content;public interface ServiceConnection {
 void onServiceConnected(ComponentName n,android.os.IBinder b);void onServiceDisconnected(ComponentName n);
 void onBindingDied(ComponentName n);void onNullBinding(ComponentName n);}
''',
 'android/content/pm/ApplicationInfo.java': 'package android.content.pm;public class ApplicationInfo {public static final int FLAG_STOPPED=1;public int flags;}',
 'android/content/pm/PackageManager.java': '''package android.content.pm;public class PackageManager {
 public ApplicationInfo getApplicationInfo(String p,int flags){if(android.content.Context.missing)throw new IllegalStateException("fixture missing");return new ApplicationInfo();}}
''',
 'android/app/Activity.java': '''package android.app;public class Activity extends android.content.Context {
 public android.content.Intent intent=new android.content.Intent();public android.content.Intent getIntent(){return intent;}
 protected void onResume(){}}
''',
 'android/os/IBinder.java': 'package android.os;public interface IBinder {}',
 'android/os/UserHandle.java': 'package android.os;public class UserHandle {public static UserHandle of(int n){return new UserHandle();}}',
 'android/os/Process.java': 'package android.os;public class Process {public static final int THREAD_PRIORITY_BACKGROUND=10;public static int myUid(){return 10077;}}',
 'android/os/Looper.java': 'package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}',
 'android/os/HandlerThread.java': 'package android.os;public class HandlerThread {public HandlerThread(String n){}public HandlerThread(String n,int p){}public void start(){}public Looper getLooper(){return new Looper();}}',
 'android/os/Handler.java': '''package android.os;import java.util.*;public class Handler {
 public static final List<Runnable> queue=new ArrayList<>();public Handler(Looper l){}
 public boolean post(Runnable r){queue.add(r);return true;}public boolean postDelayed(Runnable r,long d){queue.add(r);return true;}
 public void removeCallbacks(Runnable r){queue.removeIf(x->x==r);}
 public static void drain(){List<Runnable> batch=new ArrayList<>(queue);queue.clear();for(Runnable r:batch)r.run();}}
''',
 'android/database/sqlite/SQLiteDatabase.java': '''package android.database.sqlite;public class SQLiteDatabase {
 public void beginTransaction(){}public void setTransactionSuccessful(){}public void endTransaction(){}}
''',
 'org/json/JSONObject.java': '''package org.json;public class JSONObject {
 public JSONObject(){}public JSONObject(String s){}public JSONObject put(String k,Object v){return this;}
 public boolean has(String k){return false;}public int getInt(String k){return 0;}public long getLong(String k){return 0;}
 public long optLong(String k){return 0;}public int optInt(String k,int f){return f;}
 public double optDouble(String k,double f){return f;}public String optString(String k){return "";}
 public Object remove(String k){return null;}}
''',
 'ls/augment/com/hook/StepLedger.java': '''package ls.augment.com.hook;import java.util.*;import ls.augment.com.StepPlan;
 final class StepLedger {
 static int created,guards,reads,writes,deleted;boolean oldEvidence=true;final android.database.sqlite.SQLiteDatabase db=new android.database.sqlite.SQLiteDatabase();
 StepLedger(android.content.Context c){created++;}Guard guard(){guards++;return new Guard();}
 final class Guard implements AutoCloseable{public void close(){}}
 android.database.sqlite.SQLiteDatabase getWritableDatabase(){writes++;return db;}
 static final class Record{final String raw,output,token;final boolean generated;Record(String r,String o,String t,boolean g){raw=r;output=o;token=t;generated=g;}}
 static final class SavedRecord{String sid;long time;Record record;}
 static final class Award{int requested,allowed;}
 List<SavedRecord> records(String a,long s,long e){reads++;return Collections.emptyList();}
 Record get(String a,String s,long t){reads++;return null;}
 void put(String a,String s,long t,Record r){writes++;}
 Award award(String a,long t){reads++;return null;}
 void award(String a,long t,int r,int allow){writes++;}
 void admit(StepPlan p,long now){writes++;}
 Map<Long,Integer> admitted(String a){reads++;return Collections.emptyMap();}
 static void reset(){created=guards=reads=writes=deleted=0;}}
''',
 'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import java.util.*;import ls.augment.com.*;
 final class FeatureSettings {
 static ConfigSnapshot current;static boolean verified=true;static final Map<String,String> diagnostics=new LinkedHashMap<>();
 static final List<Runnable> listeners=new ArrayList<>();static android.content.Context from(Object o){return new android.content.Context();}
 static ConfigSnapshot snapshot(android.content.Context c){return current;}
 static boolean hasVerifiedSnapshot(android.content.Context c){return verified;}
 static boolean enabled(android.content.Context c,String k){return ConfigSchema.truthy(current.get(k));}
 static String text(android.content.Context c,String k,String f){String v=current.get(k);return v==null?f:v;}
 static int integer(android.content.Context c,String k,int f,int min,int max){return Integer.parseInt(current.get(k));}
 static void addSnapshotListener(android.content.Context c,Runnable r){listeners.add(r);}
 static void diagnostic(android.content.Context c,String k,String v){diagnostics.put(k,v);}
 static void changed(){for(Runnable r:new ArrayList<>(listeners))r.run();}}
''',
 'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
 final class AugmentModule {
 static final Map<String,Action> hooks=new HashMap<>();interface Action {Object invoke(Chain c)throws Throwable;}
 static final class Builder {final String key;Builder(String k){key=k;}Builder intercept(Action a){hooks.put(key,a);return this;}}
 Builder prepareFeatureHook(Method m,String k,boolean x){return new Builder(k);}void registerFeatureHook(Builder b){}
 void logFeatureError(String k,Throwable e){throw new AssertionError(k,e);}
 static final class Chain {final Object owner;final Object[] args;int proceeds;Chain(Object owner,Object...args){this.owner=owner;this.args=args;}
 Object getArg(int n){return args[n];}Object getThisObject(){return owner;}Object proceed(){proceeds++;return args.length==0?"native":args;}}
 }
''',
 'com/xiaomi/fitness/account/manager/AccountManager.java': '''package com.xiaomi.fitness.account.manager;
 public class AccountManager {public static final AccountManager INSTANCE=new AccountManager();public static String id="1234567890";public static int reads;
 public String getUserId(){reads++;return id;}}
''',
 'com/xiaomi/fitness/account/extensions/AccountManagerExtKt.java': '''package com.xiaomi.fitness.account.extensions;
 public class AccountManagerExtKt {public static com.xiaomi.fitness.account.manager.AccountManager getInstance(com.xiaomi.fitness.account.manager.AccountManager m){return m;}}
''',
 'com/xiaomi/fit/fitness/persist/db/FitnessDatabase.java': '''package com.xiaomi.fit.fitness.persist.db;
 public class FitnessDatabase {public static final FitnessDatabase INSTANCE=new FitnessDatabase();public static final Companion Companion=new Companion();
 public FitnessDatabase getInstance(){return INSTANCE;}public Helper getOpenHelper(){return new Helper();}
 public static class Companion{public FitnessDatabase getInstance(){return INSTANCE;}}
 public static class Helper{public String getDatabaseName(){return "fitness-fixture-only.db";}}}
''',
 'com/xiaomi/fit/fitness/persist/db/utils/DailyRecordDaoUtils.java': '''package com.xiaomi.fit.fitness.persist.db.utils;
 public class DailyRecordDaoUtils {public static final DailyRecordDaoUtils INSTANCE=new DailyRecordDaoUtils();
 public Object recordDailyRecordToDB(String k,String s,java.util.List<?> l,boolean b){return null;}
 public Object insertDailyRecordToDb(String k,java.util.List<?> l,boolean b){return null;}}
''',
 'com/xiaomi/fitness/device/manager/export/WearableDeviceManager.java': '''package com.xiaomi.fitness.device.manager.export;
 public class WearableDeviceManager {public static final WearableDeviceManager INSTANCE=new WearableDeviceManager();
 public String getLocalPhoneSid(){return "phone";}public String getCurrentPhoneSid(){return "phone";}}
''',
 'com/xiaomi/fitness/device/manager/export/DeviceManagerExtKt.java': '''package com.xiaomi.fitness.device.manager.export;
 public class DeviceManagerExtKt {public static WearableDeviceManager getInstance(WearableDeviceManager m){return m;}}
''',
 'ls/augment/com/hook/TestHealthRuntimeGate.java': r'''package ls.augment.com.hook;
 import java.util.*;import java.time.*;import android.os.Handler;import ls.augment.com.*;
 import com.xiaomi.fitness.account.manager.AccountManager;
 public final class TestHealthRuntimeGate {
 static int assertions,cases;static long revision=10;static final ClassLoader LOADER=TestHealthRuntimeGate.class.getClassLoader();
 static void check(boolean ok,String m){assertions++;if(!ok)throw new AssertionError(m);}
 static void done(String name){cases++;System.out.println("PASS "+name);}
 static ConfigSnapshot config(String...pairs){Map<String,String> m=new LinkedHashMap<>(ConfigSchema.runtimeDefaults());for(int i=0;i<pairs.length;i+=2)m.put(pairs[i],pairs[i+1]);
 ConfigSnapshot s=ConfigSnapshot.create(++revision,System.currentTimeMillis(),m);check(s!=null,"fixture valid configuration");return s;}
 static void reset(){Handler.queue.clear();FeatureSettings.listeners.clear();FeatureSettings.diagnostics.clear();FeatureSettings.verified=true;
 StepLedger.reset();AccountManager.id="1234567890";AccountManager.reads=0;android.content.Context.bindings=android.content.Context.unbindings=0;android.content.Context.missing=false;}
 static MiHealthHook.Controller controller(){MiHealthHook.Controller c=new MiHealthHook.Controller(new AugmentModule(),new android.content.Context(),LOADER);c.compatible=true;c.gap=60;return c;}
 static String account()throws Exception{return MiHealthHook.hash("0|1234567890|fitness-fixture-only.db");}
 static ConfigSnapshot on(String id){return config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_MULTIPLY_ENABLED,"1",ConfigSchema.HEALTH_ACCOUNT,id,ConfigSchema.HEALTH_BACKGROUND,"1");}
 static void untouched(String label){check(StepLedger.created==0&&StepLedger.guards==0&&StepLedger.reads==0&&StepLedger.writes==0&&StepLedger.deleted==0,label+" touched module ledger");}
 static void setController(MiHealthHook.Controller c)throws Exception{java.lang.reflect.Field f=MiHealthHook.class.getDeclaredField("controller");f.setAccessible(true);f.set(null,c);}
 static AugmentModule.Chain insert(Object payload)throws Throwable {AugmentModule.Chain chain=new AugmentModule.Chain(null,"steps",payload,false);
 Object result=AugmentModule.hooks.get("health.persist").invoke(chain);check(chain.proceeds==1&&result==chain.args&&chain.args[1]==payload,"native payload/proceed changed");return chain;}
 public static void main(String[]args)throws Throwable {
 String id=account();
 MiHealthHook.install(new AugmentModule(),LOADER);check(AugmentModule.hooks.containsKey("health.persist")&&AugmentModule.hooks.containsKey("health.identity.probe"),"real hook installation failed");
 reset();FeatureSettings.current=config();MiHealthHook.Controller c=controller();setController(c);Handler.drain();c.request();Handler.drain();c.refreshIdentity();c.reconcile();c.reconcileLocked();c.transform(Collections.emptyList(),true,false);
 List<Object> nativeRows=new ArrayList<>(Arrays.asList(new Object()));insert(nativeRows);untouched("default");check(AccountManager.reads==0&&FeatureSettings.diagnostics.isEmpty()&&Handler.queue.isEmpty(),"default identity/task persisted");done("default-controller-native-pass-through");
 reset();FeatureSettings.current=on(id);c=controller();setController(c);Handler.drain();check(c.enabled(id),"enabled multiplier was blocked");untouched("multiplier without plan");
 StepLedger old=c.ledger();int reads=StepLedger.reads,writes=StepLedger.writes;FeatureSettings.current=config();FeatureSettings.diagnostics.clear();AccountManager.reads=0;FeatureSettings.changed();Handler.drain();insert(nativeRows);c.reconcile();
 check(c.ledger()==old&&old.oldEvidence&&StepLedger.deleted==0&&StepLedger.reads==reads&&StepLedger.writes==writes,"disabled erased/read old evidence");check(AccountManager.reads==0&&FeatureSettings.diagnostics.isEmpty()&&Handler.queue.isEmpty(),"disabled task/identity continued");done("disable-retains-evidence-stops-task");
 FeatureSettings.current=on(id);FeatureSettings.changed();Handler.drain();check(c.ledger()==old&&StepLedger.created==1&&StepLedger.reads==reads,"reenable did not preserve prior ledger with plan disabled");done("reenable-resumes-original-ledger");
 reset();FeatureSettings.current=config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_MULTIPLY_ENABLED,"1");c=controller();setController(c);Handler.drain();insert(nativeRows);untouched("unbound");check(AccountManager.reads==0&&FeatureSettings.diagnostics.isEmpty(),"cleared binding collected identity");done("cleared-binding-no-ledger");
 reset();FeatureSettings.current=on("a".repeat(64));c=controller();setController(c);Handler.drain();insert(nativeRows);untouched("account mismatch");done("account-mismatch-native-pass-through");
 reset();FeatureSettings.current=config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_ACCOUNT,id,ConfigSchema.HEALTH_PLAN_ENABLED,"1");c=controller();Handler.drain();untouched("invalid plan");check(AccountManager.reads==0&&Handler.queue.isEmpty(),"invalid plan did work");done("invalid-plan-no-ledger");
 StepPlan plan=new StepPlan("b".repeat(32),id,"Asia/Shanghai",LocalDate.now(),540,1080,1,1,127,1);
 reset();FeatureSettings.current=config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_ACCOUNT,id,ConfigSchema.HEALTH_PLAN_ENABLED,"1",ConfigSchema.HEALTH_PLAN,plan.serialize());c=controller();Handler.drain();check(StepLedger.created==1&&StepLedger.writes==1,"valid plan admission stopped");done("valid-plan-admission-preserved");
 old=c.ledger();reads=StepLedger.reads;writes=StepLedger.writes;int guards=StepLedger.guards;
 FeatureSettings.current=on(id);FeatureSettings.changed();Handler.drain();c.reconcile();c.reconcileLocked();
 check(!c.reconcileBucket(id,0,200,Collections.singletonMap(0L,200),null),"Disabled plan wrote a pending bucket");
 check(c.enabled(id)&&!c.planEnabled(id),"Plan switch affected enabled multiplier");
 check(c.ledger()==old&&old.oldEvidence&&StepLedger.reads==reads&&StepLedger.writes==writes&&StepLedger.guards==guards,"Disabled plan continued processing old ledger while multiplier was enabled");done("disabled-plan-stops-old-ledger-with-multiplier-on");
 FeatureSettings.current=config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_ACCOUNT,id,ConfigSchema.HEALTH_PLAN_ENABLED,"1",ConfigSchema.HEALTH_PLAN,plan.serialize());FeatureSettings.changed();Handler.drain();check(c.ledger()==old&&StepLedger.writes==writes+1,"Reenabled plan did not reuse original ledger");done("plan-reenable-resumes-original-ledger");
 FeatureSettings.current=on(id);check(c.dailyLimit(id)==0,"Disabled daily limit still applied");
 FeatureSettings.current=config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_ACCOUNT,id,ConfigSchema.HEALTH_MULTIPLY_ENABLED,"1",ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED,"1",ConfigSchema.HEALTH_DAILY_LIMIT_STEPS,"12345");check(c.dailyLimit(id)==12345,"Enabled daily limit did not apply");done("daily-limit-honors-independent-switch");
 reset();FeatureSettings.current=config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_ACCOUNT,"a".repeat(64),ConfigSchema.HEALTH_PLAN_ENABLED,"1",ConfigSchema.HEALTH_PLAN,plan.serialize());c=controller();Handler.drain();untouched("foreign plan");check(AccountManager.reads==0,"foreign plan acquired identity");done("foreign-plan-no-ledger");
 reset();FeatureSettings.current=config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_ACCOUNT,id,ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED,"1");c=controller();Handler.drain();untouched("limit only");done("limit-only-no-ledger");
 reset();FeatureSettings.current=config();c=controller();Handler.drain();String probe=HealthIdentityProbe.create(FeatureSettings.current,0,System.currentTimeMillis());c.probe(probe);Handler.drain();Handler.drain();
 check(id.equals(FeatureSettings.diagnostics.get("ls_augment_health_account_runtime")),"explicit first binding discovery missing");HealthAccountState observation=HealthAccountState.parse(FeatureSettings.diagnostics.get(HealthAccountState.RUNTIME));check(observation!=null&&observation.matches(id)&&"1234567890".equals(observation.account),"atomic Xiaomi account observation missing");untouched("explicit probe");int prior=AccountManager.reads;FeatureSettings.diagnostics.clear();c.probe(probe);Handler.drain();Handler.drain();check(AccountManager.reads==prior&&FeatureSettings.diagnostics.isEmpty()&&Handler.queue.isEmpty(),"probe replay accepted");done("first-binding-one-shot-read-only-probe");
 reset();FeatureSettings.current=config();c=controller();Handler.drain();probe=HealthIdentityProbe.create(FeatureSettings.current,0,System.currentTimeMillis());c.probe(probe);Handler.drain();FeatureSettings.current=config();Handler.drain();check(AccountManager.reads==0&&FeatureSettings.diagnostics.isEmpty()&&Handler.queue.isEmpty(),"old probe revived after reset");untouched("old reset probe");done("pending-probe-invalidated-by-reset");
 reset();FeatureSettings.current=config();c=controller();Handler.drain();c.probe(HealthIdentityProbe.create(FeatureSettings.current,0,System.currentTimeMillis()-30001));c.probe(HealthIdentityProbe.create(FeatureSettings.current,1,System.currentTimeMillis()));c.probe("bad request");Handler.drain();Handler.drain();check(AccountManager.reads==0&&FeatureSettings.diagnostics.isEmpty(),"expired/wrong-user/malformed accepted");untouched("invalid probe");done("expired-wrong-user-malformed-probe-rejected");
 reset();FeatureSettings.current=config();c=controller();Handler.drain();AccountManager.id="";probe=HealthIdentityProbe.create(FeatureSettings.current,0,System.currentTimeMillis());c.probe(probe);Handler.drain();Handler.drain();check(!Handler.queue.isEmpty(),"cold account initialization not retried");AccountManager.id="1234567890";Handler.drain();check(id.equals(FeatureSettings.diagnostics.get("ls_augment_health_account_runtime"))&&Handler.queue.isEmpty(),"cold probe failed after login initialization");untouched("cold probe");done("cold-explicit-probe-short-retry");
 reset();FeatureSettings.current=config();FeatureSettings.verified=false;c=controller();Handler.drain();probe=HealthIdentityProbe.create(FeatureSettings.current,0,System.currentTimeMillis());c.probe(probe);Handler.drain();Handler.drain();check(AccountManager.reads==0&&!Handler.queue.isEmpty(),"unverified cold start collected identity or lost request");FeatureSettings.verified=true;Handler.drain();check(id.equals(FeatureSettings.diagnostics.get("ls_augment_health_account_runtime"))&&Handler.queue.isEmpty(),"cold snapshot readiness did not finish one shot");untouched("cold snapshot probe");done("explicit-probe-waits-for-verified-cold-snapshot");
 reset();FeatureSettings.current=config();c=controller();setController(c);Handler.drain();android.app.Activity activity=new android.app.Activity();activity.intent.putExtra(HealthIdentityProbe.EXTRA,HealthIdentityProbe.create(FeatureSettings.current,0,System.currentTimeMillis()));AugmentModule.Chain resume=new AugmentModule.Chain(activity);AugmentModule.hooks.get("health.identity.probe").invoke(resume);check(resume.proceeds==1&&!activity.intent.hasExtra(HealthIdentityProbe.EXTRA),"resume changed/intent not consumed");Handler.drain();Handler.drain();untouched("intent bridge");check(id.equals(FeatureSettings.diagnostics.get("ls_augment_health_account_runtime")),"bridge not delivered");done("resume-intent-consumed-native-lifecycle-preserved");
 reset();FeatureSettings.current=config();HealthBackgroundHook bg=new HealthBackgroundHook(new android.content.Context());Handler.drain();check(android.content.Context.bindings==0&&FeatureSettings.diagnostics.isEmpty()&&Handler.queue.isEmpty(),"default background loop/binding");
 FeatureSettings.current=on(id);FeatureSettings.changed();Handler.drain();check(bg.bound&&android.content.Context.bindings==1&&!Handler.queue.isEmpty(),"enabled service not resumed");FeatureSettings.current=config();FeatureSettings.changed();Handler.drain();check(!bg.bound&&android.content.Context.unbindings==1&&Handler.queue.isEmpty(),"default service/task survived");FeatureSettings.diagnostics.clear();bg.connection.onServiceConnected(null,null);bg.connection.onServiceDisconnected(null);check(FeatureSettings.diagnostics.isEmpty(),"late disabled callback wrote state");done("background-default-enable-disable-late-callback");
 reset();FeatureSettings.current=config(ConfigSchema.HEALTH_ENABLED,"1",ConfigSchema.HEALTH_MULTIPLY_ENABLED,"1",ConfigSchema.HEALTH_BACKGROUND,"1");bg=new HealthBackgroundHook(new android.content.Context());Handler.drain();check(android.content.Context.bindings==0&&FeatureSettings.diagnostics.isEmpty()&&Handler.queue.isEmpty(),"unbound background bound");done("background-unbound-no-service");
 System.out.println("RESULT "+cases+" "+assertions);
 }}
''',
}
with tempfile.TemporaryDirectory(prefix='lsa-health-runtime-') as directory:
    base = Path(directory)
    files = []
    for name, text in sources.items():
        target = base / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding='utf-8')
        files.append(target)
    classes = base / 'classes'
    compiled = subprocess.run([str(JDK / 'javac.exe'), '--release', '17', '-encoding', 'UTF-8',
        '-d', str(classes), *map(str, files), *map(str, production)], capture_output=True,
        text=True, encoding='utf-8', errors='replace')
    (OUT / 'javac.txt').write_text(compiled.stdout + compiled.stderr, encoding='utf-8')
    if compiled.returncode:
        print(compiled.stdout + compiled.stderr)
        raise SystemExit(compiled.returncode)
    result = subprocess.run([str(JDK / 'java.exe'), '-cp', str(classes),
        'ls.augment.com.hook.TestHealthRuntimeGate'], capture_output=True,
        text=True, encoding='utf-8', errors='replace')
    (OUT / 'output.txt').write_text(result.stdout + result.stderr, encoding='utf-8')
    print(result.stdout + result.stderr)
    match = re.search(r'RESULT (\d+) (\d+)', result.stdout)
    report = {'pass': result.returncode == 0, 'offlineOnly': True,
        'cases': int(match[1]) if match else 0, 'assertions': int(match[2]) if match else 0,
        'passed': re.findall(r'^PASS (.+)$', result.stdout, re.M),
        'nativeDatabaseDouble': True, 'moduleLedgerDouble': True,
        'productionControllerParserProbe': True}
    (OUT / 'result.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
    if result.returncode:
        raise SystemExit(result.returncode)
