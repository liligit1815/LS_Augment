"""Run the production Release readiness route through registration, Provider and Platform.

Only Android IPC/OS boundaries are doubles. The Root provider transport methods,
AtomicWorkbenchProvider authentication/read implementation and Platform checks run
unchanged. No phone or installed application is accessed.
"""
from pathlib import Path
import os
import runpy
import subprocess
import sys
import tempfile

HERE = Path(__file__).parent
HOME = runpy.run_path(str(HERE / "test-atomic-workbench-home-runtime.py"))
MEMBER = runpy.run_path(str(HERE / "test-atomic-workbench-lifecycle.py"))["member"]
SUPPORT = HOME["SUPPORT"]
ROOT = HOME["ROOT"]

BINDER = r'''package android.os;
public class Binder implements IBinder {public static int caller=0,pid=17001;public boolean alive=true;
 public static int getCallingUid(){return caller;}public static int getCallingPid(){return pid;}
 public static long clearCallingIdentity(){long old=((long)caller<<32)|(pid&0xffffffffL);caller=Process.myUid();return old;}
 public static void restoreCallingIdentity(long old){caller=(int)(old>>32);pid=(int)old;}public boolean isBinderAlive(){return alive;}}
'''
CONTENT = r'''package android.content;import android.os.*;
public interface IContentProvider {Bundle call(AttributionSource source,String authority,String method,String arg,Bundle extras);}
'''
AM = r'''package android.app;import android.os.*;import android.content.*;
public class ActivityManager {public static final Service service=new Service();public static Object getService(){return service;}
 public static class Holder {public IContentProvider provider;Holder(IContentProvider p){provider=p;}}
 public static class Service {public IContentProvider provider;public int user,acquires,releases;
  public Object getContentProviderExternal(String authority,int user,IBinder access,String tag){
   if(!"ls.augment.com.workbench".equals(authority)||user!=this.user)throw new SecurityException("wrong provider user");acquires++;return new Holder(provider);}
  public void removeContentProviderExternalAsUser(String authority,IBinder access,int user){releases++;}}
}
'''
BRIDGE_HEAD = r'''package ls.augment.com;
import android.os.*;import java.lang.reflect.*;import java.util.concurrent.*;
public class TestRootReadinessBridge extends Binder {
 final int appUid,userId;String token;volatile long providerSession=-1,providerResetGeneration=-1;IBinder owner;
 final CountDownLatch registrationReady=new CountDownLatch(1);volatile boolean registered;
 TestRootReadinessBridge(int uid,int user,String token){this.appUid=uid;this.userId=user;this.token=token;}
 Bundle register()throws Exception {Bundle b=new Bundle();b.putInt("version",AtomicWorkbenchProtocol.VERSION);b.putInt("uid",appUid);b.putInt("user",userId);b.putString("token",token);b.putBinder("endpoint",this);
  Bundle reply=registerEndpoint(userId,b);completeRegistration(reply);return reply;}
 Bundle read(Bundle b)throws Exception{return readHomeReadiness(b);}
 void bindOwner(IBinder owner){if(owner==null)throw new SecurityException("owner missing");this.owner=owner;}
 void waitUntilRegistered(){awaitRegistration();}void complete(Bundle b)throws Exception{completeRegistration(b);}
'''
EXTRA_TEST = r'''
 static final class ProviderContext extends Context {public String getPackageName(){return "ls.augment.com";}}
 static final class Route implements AutoCloseable {
  final AtomicWorkbenchProvider provider=new AtomicWorkbenchProvider();final AtomicWorkbenchProvider.Pending pending;
  final TestRootReadinessBridge root;final Fixture f;final int uid;Bundle query;String good;
  Route()throws Exception {this(0);}Route(int user)throws Exception {
   Binder.caller=0;Binder.pid=17001;android.os.Process.uid=user*100000+10055;uid=android.os.Process.uid;
   android.content.ContentProvider.context=new ProviderContext();ResetWriteFence.blocked=false;ResetWriteFence.generation=1;
   pending=AtomicWorkbenchProvider.prepare(android.content.ContentProvider.context);root=new TestRootReadinessBridge(uid,user,pending.token);
   android.app.ActivityManager.service.user=user;android.app.ActivityManager.service.provider=(source,authority,method,arg,extras)->{
    check(source.uid==0&&"root".equals(source.packageName),"Root impersonated app attribution");int old=android.os.Process.uid;
    android.os.Process.uid=uid;try{return provider.call(method,arg,extras);}finally{android.os.Process.uid=old;}};
   android.os.Process.uid=0;Bundle registered=root.register();check(registered.getBoolean("success")&&registered.getBinder("owner")==pending.owner,"actual registration failed");
   check(root.providerResetGeneration==ResetWriteFence.generation(),"registered Root lost Provider reset generation");
   f=new Fixture(user);f.platform=new AtomicWorkbenchPlatform(f.context,uid,user,f.handler,0,root::read);success(f.show());
   query=new Bundle();query.putInt("window_id",0);query.putInt("display_id",f.home.displayId);query.putInt("home_task_id",41);
   query.putString("unique_id",f.disk(0).getString("unique_id"));query.putString("display_name",f.context.displays.latest.display.name);
   SystemClock.now=2000;good="HR1|20564|"+f.home.displayId+"|"+query.getString("unique_id")+"|41|2000|true|true|true||1500|1500|1600|"+System.nanoTime();publish(good);
  }
  void publish(String text){publishSource(text,1000,"system_server",BuildConfig.VERSION_NAME);}
  void publishSource(String text,int uid,String process,String version){String key="ls_augment_atomic_home_readiness_"+f.home.displayId;
   android.content.ContentProvider.context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).edit().putString(key,text).apply();
   Bundle evidence=new Bundle();evidence.putString("moduleVersion",version);evidence.putString("process",process);evidence.putLong("observedAt",System.currentTimeMillis());evidence.putLong("observedElapsed",SystemClock.elapsedRealtime());
   DiagnosticEvidenceStore.record(android.content.ContentProvider.context,uid,3390,key,text,evidence);
  }
  Bundle read()throws Exception{return root.read(query);}
  void deny(String reason)throws Exception {Bundle b=read();check(!b.getBoolean("success")&&reason.equals(b.getString("readiness_reason")),"wrong rejection: "+b.getString("readiness_reason")+", expected "+reason);check(!b.containsKey("value"),"rejected caller received observation");}
  public void close(){android.os.Process.uid=0;Binder.caller=0;Binder.pid=17001;f.close();AtomicWorkbenchProvider.remove(pending);root.alive=false;ResetWriteFence.blocked=false;}
 }
 public static void main(String[] args)throws Exception {base=Path.of(args[0]);
  test("Release generic configuration stays denied while registered Root reads exact readiness",()->{try(Route r=new Route()){
   check(!BuildConfig.DEBUG,"fixture accidentally enabled Debug");android.os.Process.uid=r.uid;
   check(!new TestLegacyProviderAuthorization().allowed(),"generic Release Root config access broadened");android.os.Process.uid=0;
   Bundle b=r.read();check(b.getBoolean("success")&&r.good.equals(b.getString("value")),"narrow Release read failed");
   Bundle ready=r.f.platform.status();check(ready.getBoolean("home_surface_ready")&&ready.getBoolean("wallpaper_interface_ready")&&ready.getBoolean("wallpaper_frame_verified"),"real Platform did not consume authorized Provider observation");
   check(ready.getLong("readiness_generation_nanos",0)>0&&ready.getLong("readiness_request_nanos",0)>0&&r.query.getString("unique_id").equals(ready.getString("display_unique_id")),"generation/VD identity absent");
   check(android.app.ActivityManager.service.acquires==android.app.ActivityManager.service.releases,"external provider reference leaked");
  }});
  test("unregistered Root cannot discover readiness",()->{try(Route r=new Route()){AtomicWorkbenchProvider.remove(r.pending);r.deny("session_missing");}});
  test("readiness requires successful endpoint registration",()->{try(Route r=new Route()){r.pending.endpoint=null;r.deny("session_missing");}});
  for(int uid:new int[]{10055,1000,2000,110055})test("wrong UID "+uid+" cannot read",()->{try(Route r=new Route()){Binder.caller=uid;r.deny("caller_uid");}});
  test("another Root PID cannot reuse valid credentials",()->{try(Route r=new Route()){Binder.pid++;r.deny("caller_pid");}});
  test("dead Root endpoint is revoked",()->{try(Route r=new Route()){r.root.alive=false;r.deny("session_dead");}});
  test("reset invalidates current session",()->{try(Route r=new Route()){ResetWriteFence.generation++;r.deny("reset_generation");}});
  test("active reset revokes reads",()->{try(Route r=new Route()){ResetWriteFence.blocked=true;r.deny("reset_generation");}});
  test("old session number is rejected",()->{try(Route r=new Route()){r.root.providerSession--;r.deny("session_identity");}});
  test("wrong endpoint cannot use a current token",()->{try(Route r=new Route()){r.pending.endpoint=new Binder();r.deny("session_identity");}});
  test("wrong token cannot use the same endpoint",()->{try(Route r=new Route()){r.root.token="f".repeat(64);r.deny("session_identity");}});
  test("old credentials cannot read a replacement pending session",()->{try(Route r=new Route()){
   AtomicWorkbenchProvider.remove(r.pending);android.os.Process.uid=r.uid;AtomicWorkbenchProvider.Pending next=AtomicWorkbenchProvider.prepare(android.content.ContentProvider.context);
   android.os.Process.uid=0;TestRootReadinessBridge replacement=new TestRootReadinessBridge(r.uid,0,next.token);replacement.register();r.deny("session_identity");AtomicWorkbenchProvider.remove(next);
  }});
  test("wrong owner process UID is rejected after session authentication",()->{try(Route r=new Route()){
   Bundle b=new Bundle(r.query);b.putInt("version",1);b.putInt("uid",r.uid);b.putInt("user",0);b.putString("token",r.pending.token);b.putBinder("endpoint",r.root);b.putLong("session",r.root.providerSession);
   android.os.Process.uid=10077;Bundle denied=r.provider.call("home_readiness",null,b);check("owner_user".equals(denied.getString("readiness_reason")),"owner process UID mismatch read");
  }});
  test("owner/user mismatch is rejected after correct session authentication",()->{try(Route r=new Route()){
   Bundle b=new Bundle(r.query);b.putInt("version",1);b.putInt("uid",r.uid);b.putInt("user",10);b.putString("token",r.pending.token);b.putBinder("endpoint",r.root);b.putLong("session",r.root.providerSession);
   android.os.Process.uid=r.uid;Bundle denied=r.provider.call("home_readiness",null,b);check("owner_user".equals(denied.getString("readiness_reason")),"cross-user request accepted");
  }});
  test("own secondary-user Provider remains usable",()->{try(Route r=new Route(10)){check(r.read().getBoolean("success")&&r.f.platform.status().getBoolean("home_surface_ready"),"legitimate secondary user blocked");}});
  test("wrong task report cannot pass Provider",()->{try(Route r=new Route()){r.publish(r.good.replace("|41|","|99|"));r.deny("observation_identity");}});
  test("wrong display report cannot pass Provider",()->{try(Route r=new Route()){r.publish(r.good.replace("|"+r.f.home.displayId+"|","|999|"));r.deny("observation_identity");}});
  test("wrong display unique ID cannot pass Provider",()->{try(Route r=new Route()){r.publish(r.good.replace(r.query.getString("unique_id"),"foreign-unique"));r.deny("observation_identity");}});
  test("wrong build report cannot pass Provider",()->{try(Route r=new Route()){r.publish(r.good.replace("|20564|","|20563|"));r.deny("observation_identity");}});
  test("different user/window display name cannot be requested",()->{try(Route r=new Route()){r.query.putString("display_name","DuoAtomic-110055-w1-00000000-0000-0000-0000-000000000000");r.deny("display_identity");}});
  test("missing and malformed observation remain explicit rejection",()->{try(Route r=new Route()){r.publish("");r.deny("observation_missing");r.publish(r.good.replace("|20564|","|invalid|"));r.deny("observation_invalid");}});
  test("module UID cannot impersonate WM even with a matching HR1",()->{try(Route r=new Route()){r.publishSource(r.good,r.uid,"system_server",BuildConfig.VERSION_NAME);r.deny("observation_source");}});
  test("different process cannot impersonate WM",()->{try(Route r=new Route()){r.publishSource(r.good,1000,"com.android.systemui",BuildConfig.VERSION_NAME);r.deny("observation_source");}});
  test("old publisher version cannot impersonate current Hook",()->{try(Route r=new Route()){r.publishSource(r.good,1000,"system_server","old-build");r.deny("observation_source");}});
  test("old boot observation cannot be replayed",()->{try(Route r=new Route()){RuntimeEnvironment.boot++;r.deny("observation_source");}finally{RuntimeEnvironment.boot=585;}});
  test("sidecar must hash the exact HR1 value",()->{try(Route r=new Route()){android.content.ContentProvider.context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).edit().putString("ls_augment_atomic_home_readiness_"+r.f.home.displayId,r.good.replace("true|true|true","false|true|true")).apply();r.deny("observation_source");}});
  test("absent evidence cannot authorize a bare HR1",()->{try(Route r=new Route()){android.content.ContentProvider.context.getSharedPreferences(DiagnosticEvidenceStore.STORE,0).edit().putString("ls_augment_atomic_home_readiness_"+r.f.home.displayId,"{}").apply();r.deny("observation_source");}});
  test("live actual VD owner is checked before any report is trusted",()->{try(Route r=new Route()){r.f.context.displays.latest.display.owner=10001;Bundle b=r.f.platform.status();check(!b.getBoolean("home_surface_ready"),"foreign live VD used valid report");}});
  test("live actual HOME task display must still match",()->{try(Route r=new Route()){r.f.home.displayId=0;Bundle b=r.f.platform.status();check(!b.getBoolean("home_surface_ready"),"HOME outside VD reused stale proof");}});
  test("old request generation remains rejected by production Platform",()->{try(Route r=new Route()){r.publish(r.good.substring(0,r.good.lastIndexOf('|')+1)+"0");Bundle b=r.f.platform.status();check(!b.getBoolean("home_surface_ready")&&"observation_generation".equals(b.getString("readiness_reason")),"old generation passed");}});
  test("expired current report cannot bypass through an earlier true cache",()->{try(Route r=new Route()){check(r.f.platform.status().getBoolean("home_surface_ready"),"initial read failed");SystemClock.now=20001;Bundle b=r.f.platform.status();check(!b.getBoolean("home_surface_ready")&&"observation_source".equals(b.getString("readiness_reason")),"stale true cache survived");check(AtomicWorkbenchDiagnostics.events.stream().anyMatch(s->s.contains("native_home_readiness")&&s.contains("reason=observation_source")),"rejection missing Root diagnostic");}});
  test("first Binder worker waits for main registration session and owner publication",()->{
   TestRootReadinessBridge root=new TestRootReadinessBridge(10055,0,"a".repeat(64));java.util.concurrent.atomic.AtomicReference<String> observed=new java.util.concurrent.atomic.AtomicReference<>();
   java.util.concurrent.CountDownLatch done=new java.util.concurrent.CountDownLatch(1);
   Thread first=new Thread(()->{try{root.waitUntilRegistered();observed.set(root.providerSession+"|"+root.providerResetGeneration+"|"+(root.owner!=null));}catch(Throwable e){observed.set(e.toString());}finally{done.countDown();}});first.start();
   long deadline=System.nanoTime()+java.util.concurrent.TimeUnit.SECONDS.toNanos(2);while(first.getState()!=Thread.State.TIMED_WAITING&&System.nanoTime()<deadline)Thread.yield();
   check(first.getState()==Thread.State.TIMED_WAITING&&done.getCount()==1,"first packet ran before initialization barrier");
   Bundle accepted=new Bundle();accepted.putLong("session",1234);accepted.putLong("reset_generation",987);accepted.putBinder("owner",new Binder());root.complete(accepted);
   check(done.await(2,java.util.concurrent.TimeUnit.SECONDS)&&"1234|987|true".equals(observed.get()),"session/reset/owner not visible atomically to first packet");first.join();
  });
  test("failed startup wakes waiting packets and rejects them",()->{TestRootReadinessBridge root=new TestRootReadinessBridge(10055,0,"a".repeat(64));root.registrationReady.countDown();boolean rejected=false;try{root.waitUntilRegistered();}catch(SecurityException expected){rejected=true;}check(rejected&&!root.registered,"failed initialization released first packet");});
  test("interrupted registration wait preserves interruption and rejects execution",()->{TestRootReadinessBridge root=new TestRootReadinessBridge(10055,0,"a".repeat(64));Thread.currentThread().interrupt();boolean rejected=false;try{root.waitUntilRegistered();}catch(SecurityException expected){rejected=true;}check(rejected&&Thread.interrupted(),"interrupted first packet executed or cleared interrupt");});
  System.out.println("RELEASE READINESS RESULT "+tests+" cases; "+checks+" assertions");
 }
}
'''


def main(drop_provider_reset=False):
    sdk = ROOT / "audit-output/android-sdk/platforms/android-36/android.jar"
    json_jar = next((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    sources = SUPPORT["migration_sources"]()
    sources.pop("ls/augment/com/TestAtomicWorkbenchMigration.java")
    sources.update(HOME["BASE"]["SOURCES"])
    sources.pop("ls/augment/com/AtomicWorkbenchJournal.java")
    sources.update(HOME["SOURCES"])
    sources["ls/augment/com/BuildConfig.java"] = 'package ls.augment.com;public class BuildConfig {public static final boolean DEBUG=false;public static final int VERSION_CODE=20564;public static final String VERSION_NAME="test20564";}'
    sources["android/os/Process.java"] = sources["android/os/Process.java"].replace("ROOT_UID=0", "ROOT_UID=0,SYSTEM_UID=1000")
    if "elapsedRealtime(" not in sources["android/os/SystemClock.java"]:
        sources["android/os/SystemClock.java"] = sources["android/os/SystemClock.java"].replace("public static long uptimeMillis()", "public static long elapsedRealtime(){return now;}public static long uptimeMillis()")
    sources["android/os/Binder.java"] = BINDER
    sources["android/os/IBinder.java"] = "package android.os;public interface IBinder {interface DeathRecipient{void binderDied();}boolean isBinderAlive();default void linkToDeath(DeathRecipient r,int f)throws RemoteException{}default boolean unlinkToDeath(DeathRecipient r,int f){return true;}}"
    sources["android/content/ContentProvider.java"] = '''package android.content;public abstract class ContentProvider {public static Context context;public Context getContext(){return context;}public String getCallingPackage(){return null;}public abstract boolean onCreate();public abstract android.os.Bundle call(String m,String a,android.os.Bundle e);public abstract android.database.Cursor query(android.net.Uri u,String[] p,String s,String[] a,String o);public abstract String getType(android.net.Uri u);public abstract android.net.Uri insert(android.net.Uri u,ContentValues v);public abstract int delete(android.net.Uri u,String s,String[] a);public abstract int update(android.net.Uri u,ContentValues v,String s,String[] a);}'''
    sources["android/content/SharedPreferences.java"] = 'package android.content;import java.util.*;public class SharedPreferences {static Map<String,Map<String,String>> stores=new HashMap<>();Map<String,String> values;public SharedPreferences(String name){values=stores.computeIfAbsent(name,k->new HashMap<>());}public String getString(String key,String fallback){return values.getOrDefault(key,fallback);}public boolean contains(String key){return values.containsKey(key);}public Map<String,?> getAll(){return values;}public Editor edit(){return new Editor();}public class Editor {public Editor putString(String key,String value){values.put(key,value);return this;}public void apply(){}}}'
    sources["android/content/Context.java"] = sources["android/content/Context.java"].replace(
        "public ContentResolver getContentResolver(){return new ContentResolver();}", "").replace(
        "public Object getSystemService", "public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}public SharedPreferences getSharedPreferences(String name,int mode){return new SharedPreferences(name);}public Object getSystemService")
    sources["android/content/pm/PackageManager.java"] = sources["android/content/pm/PackageManager.java"].replace("public int homeUser", 'public String[] getPackagesForUid(int uid){return uid==android.os.Process.myUid()?new String[]{"ls.augment.com"}:null;}public int homeUser')
    if "class NameNotFoundException" not in sources["android/content/pm/PackageManager.java"]:
        sources["android/content/pm/PackageManager.java"] = sources["android/content/pm/PackageManager.java"].replace("public int homeUser", "public static class NameNotFoundException extends Exception{}public int homeUser")
    sources["android/content/pm/PackageManager.java"] = sources["android/content/pm/PackageManager.java"].replace("public ApplicationInfo getApplicationInfo(String pkg,int flags){", "public ApplicationInfo getApplicationInfo(String pkg,int flags)throws NameNotFoundException{return applicationInfo(pkg,flags);}private ApplicationInfo applicationInfo(String pkg,int flags){").replace("info.applicationInfo=getApplicationInfo(component.getPackageName(),flags);", "info.applicationInfo=applicationInfo(component.getPackageName(),flags);")
    sources["android/content/IContentProvider.java"] = CONTENT
    sources["android/content/AttributionSource.java"] = 'package android.content;public class AttributionSource {public int uid;public String packageName;public AttributionSource(int uid,String pkg,String tag){this.uid=uid;this.packageName=pkg;}}'
    sources["android/app/ActivityManager.java"] = AM
    # Compile the new extraction route without granting this readiness fixture
    # a simulated extraction/configuration authority. Any execution must fail.
    sources["ls/augment/com/ConfigSnapshot.java"] = 'package ls.augment.com;final class ConfigSnapshot {final long revision=0;final String checksum="";private ConfigSnapshot(){throw new AssertionError("extraction snapshot outside readiness scope");}}'
    sources["ls/augment/com/AppConfig.java"] = 'package ls.augment.com;public class AppConfig {static final String DIAGNOSTICS="diagnostics";public AppConfig(android.content.Context c){}public boolean getBoolean(String key){return false;}ConfigSnapshot configSnapshot(){throw new AssertionError("configuration snapshot outside readiness scope");}}'
    sources["ls/augment/com/AtomicWorkbenchExtractionSystemBridge.java"] = 'package ls.augment.com;final class AtomicWorkbenchExtractionSystemBridge {static android.os.Bundle localState(){throw new AssertionError("extraction bridge outside readiness scope");}}'
    sources["ls/augment/com/AtomicWorkbenchAmapLinkClient.java"] = 'package ls.augment.com;final class AtomicWorkbenchAmapLinkClient{AtomicWorkbenchAmapLinkClient(android.content.Context c,long s){}boolean isClosed(){return false;}void touch(){}void close(){}void routeState(long r,boolean e){}android.os.Bundle merge(android.os.Bundle b){return b;}}'
    sources["ls/augment/com/AtomicWorkbenchFocusBridge.java"] = 'package ls.augment.com;final class AtomicWorkbenchFocusBridge{AtomicWorkbenchFocusBridge(android.content.Context c,int u,int user,android.os.IBinder e,int pid,long session){}void requestClose(){}android.os.Bundle control(String a,android.os.Bundle b){throw new AssertionError("unexpected focus operation");}}'
    sources["ls/augment/com/ResetWriteFence.java"] = 'package ls.augment.com;public class ResetWriteFence {static boolean blocked,owner;static long generation=1;static boolean blocked(){return blocked;}static boolean owns(){return owner;}static boolean active(){return blocked;}static long generation(){return generation;}}'
    sources["ls/augment/com/HookTargetRegistry.java"] = 'package ls.augment.com;public class HookTargetRegistry {static boolean contains(String pkg){return false;}}'
    sources["ls/augment/com/RuntimeEnvironment.java"] = 'package ls.augment.com;public class RuntimeEnvironment {static int boot=585;static int bootCount(android.content.Context c){return boot;}}'
    sources["ls/augment/com/DiagnosticWritePolicy.java"] = 'package ls.augment.com;public class DiagnosticWritePolicy {static final int MAX_KEYS=1024;}'
    legacy = (SUPPORT["SRC"] / "LSConfigProvider.java").read_text(encoding="utf-8")
    sources["ls/augment/com/TestLegacyProviderAuthorization.java"] = 'package ls.augment.com;import android.content.*;import android.os.Binder;import android.os.Process;public class TestLegacyProviderAuthorization {Context getContext(){return android.content.ContentProvider.context;}boolean allowed(){return allowedCaller();}' + MEMBER(legacy, "private boolean allowedCaller()") + "}"
    root = (SUPPORT["SRC"] / "AtomicWorkbenchRoot.java").read_text(encoding="utf-8")
    bridge = BRIDGE_HEAD + "\n".join(MEMBER(root, signature) for signature in (
        "private static Bundle registerEndpoint(int user, Bundle extras)",
        "private static Bundle callWorkbenchProvider(int user, String method, Bundle extras)",
        "private Bundle readHomeReadiness(Bundle identity)",
        "private void completeRegistration(Bundle accepted)",
        "private void awaitRegistration()")) + "}"
    if drop_provider_reset:
        assignment = 'providerResetGeneration = accepted.getLong("reset_generation", -1L);'
        assert assignment in bridge, "Root reset publication source boundary changed"
        bridge = bridge.replace(assignment, 'providerResetGeneration = -1L;')
    assert "id,this::readHomeReadiness,this::controlInputFocus" in "".join(root.split()), "production Root factory bypasses authenticated readiness/focus readers"
    transaction = MEMBER(root, "protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)")
    assert transaction.index("sameToken(") < transaction.index("awaitRegistration();") < transaction.index("enqueue("), "first packet can execute before registration/authorization"
    sources["ls/augment/com/TestRootReadinessBridge.java"] = bridge
    bundle = sources["android/os/Bundle.java"]
    if "containsKey(" not in bundle:
        bundle = bundle.rsplit("}", 1)[0] + 'public boolean containsKey(String key){return data.containsKey(key);}}'
    bundle = bundle.rsplit("}", 1)[0] + '''public void putBinder(String key,IBinder v){data.put(key,v);}public IBinder getBinder(String key){return (IBinder)data.get(key);}public java.util.Set<String> keySet(){return data.keySet();}public Object get(String key){return data.get(key);}public void putDouble(String key,double v){data.put(key,v);}}'''
    sources["android/os/Bundle.java"] = bundle
    sources["ls/augment/com/TestAtomicWorkbenchHome.java"] = HOME["TEST"].split(" public static void main(String[] args)", 1)[0] + EXTRA_TEST
    with tempfile.TemporaryDirectory(prefix="duo-release-readiness-") as temporary:
        work = Path(temporary)
        data = work / "cases"
        data.mkdir()
        HOME["compile_run"](work, sources, ["AtomicWorkbenchPlatform.java", "AtomicWorkbenchEngine.java", "AtomicWorkbenchProtocol.java", "AtomicWorkbenchLaunchBridge.java", "AtomicWorkbenchJournal.java", "AtomicWorkbenchProvider.java", "AtomicWorkbenchAmapMemory.java", "AtomicWorkbenchAmapData.java", "AtomicWorkbenchConfig.java", "AtomicWorkbenchReadinessEvidence.java", "DiagnosticEvidenceStore.java", "DiagnosticEvidencePolicy.java"], os.pathsep.join((str(json_jar), str(sdk))), data)


if __name__ == "__main__":
    if sys.argv[1:] == ["--mutate-provider-reset"]:
        main(drop_provider_reset=True)
    else:
        main()
        mutated = subprocess.run([sys.executable, __file__, "--mutate-provider-reset"], capture_output=True,
                                 text=True, timeout=120, env=SUPPORT["ENV"])
        assert mutated.returncode != 0 and "registered Root lost Provider reset generation" in mutated.stdout + mutated.stderr, "uncaught Root reset publication mutation"
        print("PASS rejected readiness negative: ROOT_RESET_PUBLISHED_BEFORE_FIRST_PACKET")
