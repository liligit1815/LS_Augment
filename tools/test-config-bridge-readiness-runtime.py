"""Execute production bridge admission, automation startup and inventory retry paths (offline services)."""
from pathlib import Path
import argparse, importlib.util, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
spec=importlib.util.spec_from_file_location('automation_fixture',ROOT/'tools/test-automation-diagnostics-runtime.py')
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)

def extract(text,marker):
    start=text.index(marker);end=text.index('{',start)+1;depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}');end+=1
    return text[start:end]

EXTRA=r'''
 static final Map<String,String> diagnostics=new HashMap<>();static int inventoryWrites,freshCaptures;static boolean inventoryReject;static String inventoryPayload="";
 static void record(String key,String value){diagnostics.put(key,value);if(ls.augment.com.AutomationDiagnosticState.OWNER_KEY.equals(key)){
  owner=ls.augment.com.AutomationDiagnosticState.Update.parse(value);check(owner!=null,"new waiting protocol is parseable");}}
 static void reset(){
  off=true;enabled=false;unlocked=true;contentReady=true;userServiceReady=true;providerDeclared=true;providerAcquirable=true;
  permissionDenied=false;acquireUnknown=false;observerFails=false;observerCleanupFails=false;serviceProbeUnavailable=false;fallbackProbeUnavailable=false;
  receiverRegisters=receiverUnregisters=observerRegisters=observerUnregisters=clientAcquires=clientOpens=clientCloses=snapshotReads=actualCalls=queries=0;
  resolvedUser=acquiredUser=-1;now=1000;lastDelay=0;scheduled=null;owner=null;diagnostics.clear();snapshot=good();
 }
 static void startController(Context context)throws Exception{
  Field slot=ScreenOffAutomationHook.class.getDeclaredField("controller");slot.setAccessible(true);slot.set(null,null);
  ScreenOffAutomationHook.attach(context);controller=slot.get(null);
  refresh=controller.getClass().getDeclaredMethod("refreshAndRun",String.class);refresh.setAccessible(true);
 }
 static void retryNow(){Runnable next=scheduled;scheduled=null;check(next!=null,"startup/bridge retry remains scheduled");next.run();}
 static class Immediate {void execute(Runnable task){task.run();}}
 static class Main {void post(Runnable task){task.run();}}
 static final class Assets {
  static final android.net.Uri PROVIDER=android.net.Uri.parse("content://ls.augment.com.config");
  static InventoryPublication pendingInventory;static ConfigBridgeReadiness INVENTORY_BRIDGE=new ConfigBridgeReadiness();
  static final Object INVENTORY_SUBMISSION=new Object();static long inventoryGeneration,reportedAt;static Main MAIN=new Main();
  static final Immediate REPORTER=new Immediate();static final Queue<Runnable> tasks=new ArrayDeque<>();
  static final java.util.concurrent.ScheduledExecutorService INVENTORY_RETRY=(java.util.concurrent.ScheduledExecutorService)Proxy.newProxyInstance(
   Assets.class.getClassLoader(),new Class<?>[]{java.util.concurrent.ScheduledExecutorService.class},(proxy,method,args)->{
    if(method.getName().equals("schedule")){tasks.add((Runnable)args[0]);return null;}throw new AssertionError(method.getName());});
  static void publish(){freshCaptures++;}
  static void capture(Context context,String text){pendingInventory=new InventoryPublication(context,text,now,++inventoryGeneration);publishInventory(pendingInventory);}
  static void next(){check(!tasks.isEmpty(),"inventory retry retained");tasks.remove().run();}
  static void clear(){pendingInventory=null;inventoryGeneration=0;tasks.clear();INVENTORY_BRIDGE=new ConfigBridgeReadiness();inventoryWrites=freshCaptures=0;inventoryPayload="";inventoryReject=false;}
  // ASSETS_PRODUCTION
 }
'''

MAIN=r''' public static void main(String[] args)throws Exception {
  reset();Context context=new Context(999);ConfigBridgeReadiness gate=new ConfigBridgeReadiness();
  userServiceReady=false;check(gate.check(context).state.equals("WAITING_FOR_USER_SERVICE")&&clientAcquires==0,"missing user service does not admit I/O");
  userServiceReady=true;unlocked=false;now+=ConfigBridgeReadiness.STARTUP_GRACE_MS*3;
  check(gate.check(context).state.equals("WAITING_FOR_UNLOCK"),"locked user is an indefinite prerequisite, not a timeout failure");
  unlocked=true;contentReady=false;check(gate.check(context).state.equals("WAITING_FOR_SERVICE")&&clientAcquires==0,"ContentService absent does not touch provider");
  now+=ConfigBridgeReadiness.STARTUP_GRACE_MS;check(gate.check(context).error.contains("content_service_unavailable:readiness_timeout"),"persistent missing service is explicit failure");
  contentReady=true;check(gate.check(context).ready()&&resolvedUser==999&&acquiredUser==999&&clientCloses==clientAcquires,"provider target matches actual context user and acquired clients close");
  providerDeclared=false;check(gate.check(context).state.equals("WAITING_FOR_PROVIDER"),"declared provider absent waits before acquisition");
  now+=ConfigBridgeReadiness.STARTUP_GRACE_MS;check(!gate.check(context).waiting()&&gate.check(context).error.contains("module_provider_unavailable:readiness_timeout"),"permanent missing provider is not suppressed indefinitely");
  providerDeclared=true;providerAcquirable=false;check(gate.check(context).error.contains("module_provider_not_acquirable"),"declaration alone cannot admit a missing runtime provider");
  providerAcquirable=true;check(gate.check(context).ready(),"late module installation/provider publication can recover");
  acquireUnknown=true;check(gate.check(context).waiting(),"startup Unknown authority at acquisition is expected waiting");acquireUnknown=false;
  permissionDenied=true;check(gate.check(context).error.contains("SecurityException")&&!gate.check(context).waiting(),"permission denial is an immediate real failure");permissionDenied=false;
  serviceProbeUnavailable=true;ConfigBridgeReadiness.Result fallback=gate.check(context);
  check(fallback.ready()&&fallback.probeError.contains("UnsupportedOperationException")&&!fallback.probeError.contains("OEM checkService absent"),"resolver fallback works and retains safe exception type without raw message");
  fallbackProbeUnavailable=true;check(gate.check(context).state.equals("FAILED")&&gate.check(context).error.contains("content_service_probe_failed"),"unsupported probes do not turn into permanent waiting");
  check(ConfigBridgeReadiness.callFailure(new IllegalArgumentException("Unknown authority ls.augment.com.config")).startsWith("provider_unavailable"),"provider disappears after admission remains an explicit unavailable failure");
  check(!ConfigBridgeReadiness.callFailure(new IllegalArgumentException("PRIVATE_PAYLOAD")).contains("PRIVATE_PAYLOAD"),"IPC failure messages do not expose payload text");

  reset();contentReady=false;startController(new Context());
  check(owner.bridge.equals("WAITING_FOR_SERVICE")&&owner.lastBridgeError.isEmpty()&&receiverRegisters==0&&observerRegisters==0&&snapshotReads==0,"automation does not register or query before service admission");
  contentReady=true;providerDeclared=false;retryNow();
  check(owner.bridge.equals("WAITING_FOR_PROVIDER")&&owner.lastBridgeError.isEmpty()&&receiverRegisters==0&&snapshotReads==0,"automation startup provider absence does not invent failure history");
  providerDeclared=true;providerAcquirable=false;retryNow();check(observerRegisters==0&&snapshotReads==0,"unpublished provider cannot start listener");
  providerAcquirable=true;enabled=false;retryNow();
  check(owner.bridge.equals("READY")&&owner.runtime.equals("disabled")&&snapshotReads==1&&actualCalls==0&&receiverRegisters==1&&observerRegisters==1,"readiness recovery registers once and reads latest disabled snapshot");
  String disabledHandshake=diagnostics.get("ls_augment_automation_runtime");
  check(disabledHandshake!=null&&disabledHandshake.contains("version="+ls.augment.com.BuildConfig.VERSION_NAME+";")
    &&disabledHandshake.contains("listener=system_server;")&&disabledHandshake.contains("enabled=false;")
    &&disabledHandshake.contains("time="),"real disabled listener publishes activation handshake before any action can run");
  run();check(receiverRegisters==1&&observerRegisters==1,"normal refresh never duplicates registrations");
  check(clientOpens==clientCloses,"startup clients are all released");

  reset();observerFails=true;startController(new Context());
  check(owner.bridge.equals("LISTENER_FAILED")&&owner.lastBridgeError.contains("observer denied")&&snapshotReads==0&&receiverUnregisters==1&&observerUnregisters==1,"partial listener failure is real, cleans both registrations, and never reads snapshot");
  observerFails=false;retryNow();
  check(owner.bridge.equals("READY")&&owner.bridgeError.isEmpty()&&owner.lastBridgeError.contains("observer denied")&&receiverRegisters==2&&observerRegisters==2&&snapshotReads==1,"registration retry recovers exactly once while preserving real failure history");
  run();check(receiverRegisters==2&&observerRegisters==2,"recovered listener remains single owner");
  reset();observerFails=true;observerCleanupFails=true;startController(new Context());
  check(owner.lastBridgeError.contains("listener_cleanup_failed")&&observerRegisters==1,"cleanup error remains diagnostic and retains registration ownership");
  observerFails=false;retryNow();check(observerRegisters==1&&snapshotReads==0,"failed cleanup cannot duplicate observers or read configuration");
  observerCleanupFails=false;retryNow();check(observerRegisters==2&&snapshotReads==1&&owner.bridge.equals("READY"),"cleanup recovery removes old registration before registering new owner");

  reset();permissionDenied=true;startController(new Context());
  check(owner.bridge.equals("FAILED")&&owner.lastBridgeError.contains("SecurityException")&&snapshotReads==0&&observerRegisters==0,"automation readiness permission error is visible and blocks all provider/listener work");
  permissionDenied=false;retryNow();check(owner.bridge.equals("READY")&&owner.lastBridgeError.contains("SecurityException"),"permission recovery retains history");
  reset();providerDeclared=false;startController(new Context());now+=ConfigBridgeReadiness.STARTUP_GRACE_MS;retryNow();
  check(owner.bridge.equals("FAILED")&&owner.lastBridgeError.contains("readiness_timeout")&&snapshotReads==0,"automation permanent provider absence becomes diagnostic failure");
  providerDeclared=true;retryNow();check(owner.bridge.equals("READY")&&owner.lastBridgeError.contains("readiness_timeout"),"permanent outage can later recover without erasing history");

  reset();Assets.clear();contentReady=false;Assets.capture(new Context(),"old");
  check(inventoryWrites==0&&!diagnostics.containsKey("ls_augment_statusbar_inventory_error")&&Assets.pendingInventory!=null,"inventory startup service wait retains payload without false error");
  providerDeclared=false;contentReady=true;Assets.capture(new Context(),"latest");Assets.next();
  check(inventoryWrites==0&&Assets.pendingInventory.payload.equals("latest"),"stale queued retry never resubmits/replaces fresh inventory");
  providerDeclared=true;Assets.next();
  check(inventoryWrites==1&&inventoryPayload.equals("latest")&&Assets.pendingInventory==null&&diagnostics.get("ls_augment_statusbar_inventory_error").isEmpty(),"latest pending inventory actually sends after provider recovery");
  reset();Assets.clear();permissionDenied=true;Assets.capture(new Context(),"permissions");
  check(inventoryWrites==0&&diagnostics.get("ls_augment_statusbar_inventory_error").contains("SecurityException"),"inventory permission error is not classified as boot waiting");
  permissionDenied=false;Assets.next();check(inventoryWrites==1&&diagnostics.get("ls_augment_statusbar_inventory_error").isEmpty(),"inventory successful retry recovers current error");
  reset();Assets.clear();inventoryReject=true;Assets.capture(new Context(),"reject");
  check(inventoryWrites==1&&diagnostics.get("ls_augment_statusbar_inventory_error").contains("inventory_rejected:row_id_invalid"),"provider rejection retains specific reason and remains an error");
  Bundle hostile=new Bundle();hostile.putString("reason","PRIVATE_PAYLOAD");hostile.putString("payload","secret");
  check(Assets.inventoryRejection(hostile).equals("inventory_rejected:reason_unavailable"),"unknown provider diagnostics never echo arbitrary text");
  check(Assets.inventoryRejection(null).equals("inventory_rejected:reply_missing"),"null publication reply stays distinct from rejection");
  inventoryReject=false;Assets.next();check(inventoryWrites==2&&Assets.pendingInventory==null,"accepted retry recovers rejection");
  reset();Assets.clear();providerDeclared=false;Assets.capture(new Context(),"stale");now+=ConfigBridgeReadiness.STARTUP_GRACE_MS;Assets.next();
  check(inventoryWrites==0&&diagnostics.get("ls_augment_statusbar_inventory_error").contains("readiness_timeout"),"long inventory provider absence is diagnosable even after payload expiry");
  providerDeclared=true;Assets.capture(new Context(),"new observation");check(inventoryWrites==1&&inventoryPayload.equals("new observation"),"fresh observation recovers after persistent outage");
  reset();Assets.clear();unlocked=false;Assets.capture(new Context(),"locked");now+=90_000;unlocked=true;Assets.next();
  check(inventoryWrites==0&&Assets.pendingInventory==null&&freshCaptures==1,"expired unlock-wait observation requests fresh UI capture instead of sending old inventory");
  Assets.capture(new Context(),"after unlock");check(inventoryWrites==1&&inventoryPayload.equals("after unlock"),"fresh unlock observation actually publishes");
  System.out.println("PASS production ConfigBridgeReadiness + ScreenOffAutomationHook + inventory publication/retry: "+checks+" assertions (offline service facade; not a device boot)");
 }
'''

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--jdk',type=Path,default=Path('C:/Program Files/Android/openjdk/jdk-21.0.8'))
    parser.add_argument('--mutation',choices=['skip-start-admission','skip-inventory-admission']);args=parser.parse_args()
    assets=(SRC/'hook/StatusBarAssetsHook.java').read_text(encoding='utf-8')
    pieces='\n'.join(extract(assets,x) for x in ['private static final class InventoryPublication {','private static void publishInventory(InventoryPublication item) {','private static String inventoryRejection(Bundle response){','private static void scheduleInventoryRetry(InventoryPublication item,long delay,String state){'])
    if args.mutation=='skip-inventory-admission':
        start=pieces.index('            ConfigBridgeReadiness.Result status=');end=pieces.index('                Bundle extras=',start)
        pieces=pieces[:start]+'            {\n'+pieces[end:]
    fixture=base.FIXTURE.replace(extract(base.FIXTURE,'public static void main(String[] args)throws Exception'),MAIN)
    fixture=fixture.replace('import java.util.*;','import java.util.*;import android.os.SystemClock;import java.util.concurrent.TimeUnit;')
    fixture=fixture.replace('throw new AssertionError(method);','if(method.equals("statusbar_inventory_publish")){inventoryWrites++;inventoryPayload=extras.getString("payload");Bundle b=new Bundle();b.putBoolean("ok",!inventoryReject);if(inventoryReject)b.putString("reason","row_id_invalid");return b;}throw new AssertionError(method);')
    fixture=fixture[:-1]+EXTRA.replace('// ASSETS_PRODUCTION',pieces)+'\n}'
    stubs=dict(base.STUBS)
    stubs['android/content/ContentResolver.java']=stubs['android/content/ContentResolver.java'].replace('return ls.augment.com.hook.AutomationHookFixture.providerAcquirable?new ContentProviderClient():null;','if(!ls.augment.com.hook.AutomationHookFixture.providerAcquirable)return null;ls.augment.com.hook.AutomationHookFixture.clientOpens++;return new ContentProviderClient();')
    stubs['android/content/ContentResolver.java']=stubs['android/content/ContentResolver.java'].replace('ls.augment.com.hook.AutomationHookFixture.observerUnregisters++;','ls.augment.com.hook.AutomationHookFixture.observerUnregisters++;if(ls.augment.com.hook.AutomationHookFixture.observerCleanupFails)throw new SecurityException("cleanup denied");')
    stubs['ls/augment/com/hook/FeatureSettings.java']='package ls.augment.com.hook;import android.content.Context;public class FeatureSettings {static void diagnostic(Context c,String key,String value){AutomationHookFixture.record(key,value);}}'
    with tempfile.TemporaryDirectory(prefix='lsa-config-bridge-') as tmp:
        out=Path(tmp);sources=[]
        for name,body in stubs.items():
            path=out/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(body,encoding='utf-8');sources.append(path)
        for name in ['hook/ScreenOffAutomationHook.java','hook/ConfigBridgeReadiness.java','ScreenAutomationPolicy.java','AutomationDiagnosticState.java','InventoryRetryPolicy.java']:
            text=(SRC/name).read_text(encoding='utf-8')
            if name=='hook/ScreenOffAutomationHook.java' and args.mutation=='skip-start-admission':text=text.replace('if(!bridgeReady())return;','',1)
            path=out/'ls/augment/com'/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,encoding='utf-8');sources.append(path)
        path=out/'ls/augment/com/hook/AutomationHookFixture.java';path.write_text(fixture,encoding='utf-8');sources.append(path)
        suffix='.exe' if args.jdk.drive else ''
        subprocess.run([str(args.jdk/'bin'/('javac'+suffix)),'-J-Duser.language=en','-encoding','UTF-8','-d',str(out/'classes'),*map(str,sources)],check=True,cwd=ROOT)
        subprocess.run([str(args.jdk/'bin'/('java'+suffix)),'-cp',str(out/'classes'),'ls.augment.com.hook.AutomationHookFixture'],check=True,cwd=ROOT)

if __name__=='__main__':main()
