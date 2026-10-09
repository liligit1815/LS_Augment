"""Execute production runtime/bundle/factory lifecycle against bounded native doubles.

The observation preparation method is copied verbatim from production; its large
native graph is replaced below by counters and one real bridge callback. This is
a JVM lifecycle test, not evidence of ART, PMS locking, package mutation or APK
packaging. Run test-root-watcher-bridge.py first and pass that retained output.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
SOURCE = Path('android/app/src/main/java/ls/augment/com')

ANDROID = {
    'android/os/Process.java': '''package android.os; public final class Process {
 public static int myUid(){return 1000;} public static int myPid(){return 100;} public static int myTid(){return 100;}}
''',
    'android/os/Binder.java': '''package android.os; public final class Binder { public static int getCallingUid(){return 0;} }
''',
    'android/os/Looper.java': '''package android.os; public final class Looper {
 private static final Looper MAIN=new Looper(); private final Thread thread=Thread.currentThread();
 public static Looper getMainLooper(){return MAIN;} public static Looper myLooper(){return Thread.currentThread()==MAIN.thread?MAIN:null;}
 public Thread getThread(){return thread;} }
''',
    'android/os/Handler.java': '''package android.os; public final class Handler {
 public static final java.util.Queue<Runnable> queue=new java.util.concurrent.ConcurrentLinkedQueue<>();
 public Handler(Looper loop){} public boolean post(Runnable job){queue.add(job);return true;}
 public static void drain(){Runnable job;while((job=queue.poll())!=null)job.run();} }
''',
    'io/github/libxposed/api/XposedInterface.java': '''package io.github.libxposed.api;
import java.lang.reflect.Method; import android.content.pm.ApplicationInfo;
public interface XposedInterface {
 ApplicationInfo getModuleApplicationInfo(); HookBuilder hook(Method method);
 enum ExceptionMode {PASSTHROUGH}
 interface HookHandle {Method getExecutable(); void unhook();}
 interface HookBuilder {HookBuilder setExceptionMode(ExceptionMode mode); HookHandle intercept(Interceptor callback);}
 interface Interceptor {Object intercept(Chain chain)throws Throwable;}
 interface Chain {Object getArg(int index);Object getThisObject();Object proceed()throws Throwable;}
}
''',
}

DOUBLES = r'''package ls.augment.com;
import java.lang.reflect.Method;
import java.util.function.Consumer;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;
import io.github.libxposed.api.XposedInterface;
import android.content.pm.ApplicationInfo;

final class Counters {
 static int binds,registrations,writes,callbacks,bundles;
 static void reset(){binds=registrations=writes=callbacks=bundles=0;}
}
final class RootEarlyModule implements XposedInterface {
 final ApplicationInfo info=new ApplicationInfo(); int infoReads; Interceptor callback;
 RootEarlyModule(String path){info.packageName="ls.augment.com";info.sourceDir=path;}
 public ApplicationInfo getModuleApplicationInfo(){infoReads++;return info;}
 public HookBuilder hook(Method method){return new HookBuilder(){
  public HookBuilder setExceptionMode(ExceptionMode mode){return this;}
  public HookHandle intercept(Interceptor handler){callback=handler;return new HookHandle(){
   public Method getExecutable(){return method;}public void unhook(){}};}};}
 Object request(Object shell)throws Throwable {return callback.intercept(new Chain(){
  public Object getArg(int index){return HideRootProtocol.COMMAND;}
  public Object getThisObject(){return shell;}public Object proceed(){throw new AssertionError("Unexpected native command fallback");}});}
 static String clean(String value,int limit){return value==null?"null":value.substring(0,Math.min(limit,value.length()));}
}
final class RootLifecycleDomain {enum State{LOCKING_ACTIVE} State state(){return State.LOCKING_ACTIVE;}}
final class RootCriticalInstaller {enum State{LOCKING_ACTIVE} final RootLifecycleDomain domain=new RootLifecycleDomain();
 State state(){return State.LOCKING_ACTIVE;}boolean ownsHookHandle(XposedInterface.HookHandle h){return false;}}
final class RootStartupBinding {void requireRuntimeCurrent(){}void requireRuntimeMain(){
 if(android.os.Looper.myLooper()!=android.os.Looper.getMainLooper())throw new IllegalStateException("not main");}}
final class RootProcessGroupProfile {static final class Resolved{}}
final class RootOwnershipProfile {static final class Resolved {
 final ClassLoader loader;Class<?> alien;Resolved(ClassLoader l){loader=l;}
 Class<?> type(String name)throws ClassNotFoundException {return alien!=null&&name.endsWith(".Watcher")?alien:Class.forName(name,false,loader);}}}
final class RootRuntimeProfile {static final class Resolved {final Class<?> shellClass;final Method command;
 Resolved()throws Exception{shellClass=RootWatcherLifecycleTest.Shell.class;command=shellClass.getMethod("command",String.class);}}}
final class RootHiddenRequestIngress {int revocations;Throwable failure;
 void revoke(Throwable error){revocations++;failure=error;}String diagnostic(){return "INGRESS\n";}}
final class RootEarlyCoordinator {
 RootRuntimeAdmission owner;boolean ownsRuntime(RootRuntimeAdmission r){return owner==r;}boolean runtimeStartupReady(RootRuntimeAdmission r){return owner==r;}
 static final class RuntimeInputs {
  final RootEarlyCoordinator coordinator;final RootEarlyModule module;final RootCriticalInstaller installer=new RootCriticalInstaller();
  final RootStartupBinding startup=new RootStartupBinding();final ClassLoader loader;
  final RootProcessGroupProfile.Resolved processGroup=new RootProcessGroupProfile.Resolved();
  final RootOwnershipProfile.Resolved ownershipProfile;final String ownershipProfileFailure="test absent profile";
  final RootHiddenRequestIngress hiddenRequests=new RootHiddenRequestIngress();final String hiddenRequestFailure="none";
  final RootRuntimeProfile.Resolved profile=new RootRuntimeProfile.Resolved();
  RuntimeInputs(RootEarlyCoordinator c,RootEarlyModule m,ClassLoader l,RootOwnershipProfile.Resolved p)throws Exception{coordinator=c;module=m;loader=l;ownershipProfile=p;}}
 static final class RuntimePermit {final RuntimeInputs inputs;boolean consumed;RuntimePermit(RuntimeInputs i){inputs=i;}
  RuntimeInputs consume(){if(consumed)throw new IllegalStateException("used permit");consumed=true;return inputs;}}
}
final class RootCallerCompatibility {
 static final class Preparation {boolean success=true;Object ticket;String message="ok";}
 final Object ticket=new Object();RootCallerCompatibility(ClassLoader loader){}Object currentTicket(){return ticket;}
 void prepareAsync(Object shell,Consumer<Preparation> done){Preparation p=new Preparation();p.ticket=ticket;done.accept(p);}
}
final class RootNativeBridge {
 final RootOwnershipObservation observation;RootNativeBridge(ClassLoader loader,RootProcessGroupProfile.Resolved profile,RootOwnershipObservation o){observation=o;}
 final class Bound {final RootOwnershipObservation observation=RootNativeBridge.this.observation;}
 Bound bind(Object shell){Counters.binds++;return new Bound();}
}
final class HideRootProtocol {static final String COMMAND="ls-augment-user-tx-v1";
 static final class Request{}enum Outcome {REJECTED_BEFORE_WRITE}}
final class HideRootServer {
 interface Permit{}interface Engine {Permit reserve(HideRootProtocol.Request r);CompletionStage<HideRootProtocol.Outcome> execute(HideRootProtocol.Request r,Permit p);}
 final Engine engine;HideRootServer(int max,Engine e){engine=e;}HideRootServer(int max,Engine e,int ignored){engine=e;}
}
final class RootTransactionEngine implements HideRootServer.Engine {
 interface Admission {AdmissionTicket capture(RootTransactionEngine owner);}
 interface AdmissionTicket {void requireCurrent(RootTransactionEngine owner);}
 final RootOwnershipObservation observation;boolean started;
 RootTransactionEngine(RootLifecycleDomain d,Object shell,RootNativeBridge.Bound owner,RootCallerCompatibility c,Admission a){observation=owner.observation;Counters.bundles++;}
 boolean isNativeLane(){return false;}
 void requireStartupOwner(RootStartupBinding startup){if(!started){started=true;observation.registerForTest();}}
 public HideRootServer.Permit reserve(HideRootProtocol.Request request){return null;}
 public CompletionStage<HideRootProtocol.Outcome> execute(HideRootProtocol.Request request,HideRootServer.Permit p){
  throw new AssertionError("PREPARE test must never dispatch a package write");}
}
final class RootCommandEntry {
 interface Original {Object proceed()throws Throwable;}final HideRootServer server;
 RootCommandEntry(ClassLoader l,Object shell,HideRootServer s,java.util.function.Supplier<String> diagnostics){server=s;}
 Object dispatch(Object shell,Object requested,Original original){server.engine.reserve(new HideRootProtocol.Request());return 0;}
}
'''

OBSERVATION = r'''package ls.augment.com;
import io.github.libxposed.api.XposedInterface;
final class RootOwnershipObservation {
 private static final String WATCHER="com.android.server.utils.Watcher",WATCHABLE="com.android.server.utils.Watchable";
 final RootOwnershipProfile.Resolved profile;final RootWatcherBridgeFactory factory;final RootHiddenRequestIngress requests;
 Throwable error;Object watcher;
 private RootOwnershipObservation(RootOwnershipProfile.Resolved p,RootWatcherBridgeFactory f,RootHiddenRequestIngress r,String ignored){profile=p;factory=f;requests=r;}
 /* Production preparation methods, copied verbatim: */
 __PREPARATION__
 void fail(Throwable failure){error=failure;if(requests!=null)requests.revoke(failure);}
 void revoke(){fail(new IllegalStateException("revoked"));}
 String diagnostic(){return error==null?"OBSERVATION READY":"UNAVAILABLE "+error;}
 void registerForTest(){
  if(error!=null)return;
  try{watcher=factory.create(value->Counters.callbacks++,this::fail);Counters.registrations++;}
  catch(Throwable failure){fail(failure);}
 }
 void signalForTest()throws Throwable {
  Class<?> nativeWatcher=profile.type(WATCHER),nativeWatchable=profile.type(WATCHABLE);
  nativeWatcher.getMethod("onChange",nativeWatchable).invoke(watcher,new Object[]{null});
 }
}
'''

TEST = r'''package ls.augment.com;
import java.nio.file.*;import java.net.*;import java.lang.reflect.*;import java.util.concurrent.atomic.AtomicReference;
import dalvik.system.DexClassLoader;
public final class RootWatcherLifecycleTest {
 public static final class Shell {public Object command(String command){return null;}}
 static int passed,failed,assertions;static ClassLoader services;static Path bridge,wrong;
 interface Action{void run()throws Throwable;}
 static void check(boolean value,String name){assertions++;if(!value)throw new AssertionError(name);}
 static void test(String name,Action action){try{action.run();passed++;System.out.println("PASS "+name);}catch(Throwable error){failed++;System.out.println("FAIL "+name);error.printStackTrace(System.out);}}
 static final class Run {
  final RootEarlyModule module;final RootEarlyCoordinator coordinator=new RootEarlyCoordinator();
  final RootEarlyCoordinator.RuntimeInputs inputs;final RootRuntimeAdmission runtime;final int previousLoads;
  Run(Path path,RootOwnershipProfile.Resolved profile)throws Throwable {
   previousLoads=DexClassLoader.instances.size();module=new RootEarlyModule(path.toString());
   inputs=new RootEarlyCoordinator.RuntimeInputs(coordinator,module,services,profile);
   runtime=RootRuntimeAdmission.create(new RootEarlyCoordinator.RuntimePermit(inputs));coordinator.owner=runtime;runtime.install();
  }
  void request()throws Throwable {
   AtomicReference<Throwable> failure=new AtomicReference<>();Thread thread=new Thread(()->{try{module.request(new Shell());}catch(Throwable e){failure.set(e);}});
   thread.start();thread.join();if(failure.get()!=null)throw failure.get();
  }
  void prepare()throws Throwable{request();android.os.Handler.drain();}
  void concurrentRequests()throws Throwable {
   java.util.concurrent.CountDownLatch start=new java.util.concurrent.CountDownLatch(1);
   AtomicReference<Throwable> failure=new AtomicReference<>();Thread[] threads=new Thread[2];
   for(int i=0;i<threads.length;i++){threads[i]=new Thread(()->{try{start.await();module.request(new Shell());}catch(Throwable e){failure.compareAndSet(null,e);}});threads[i].start();}
   start.countDown();for(Thread thread:threads)thread.join();if(failure.get()!=null)throw failure.get();
  }
  RootOwnershipObservation observation()throws Exception {
   Field f=RootRuntimeAdmission.class.getDeclaredField("bundle");f.setAccessible(true);return ((RootTransactionBundle)f.get(runtime)).observation;
  }
 }
 static Path source(String name,Path content)throws Exception{Path dir=Files.createTempDirectory(name);Path path=dir.resolve("module.jar");Files.copy(content,path);return path;}
 static RootOwnershipProfile.Resolved profile(){return new RootOwnershipProfile.Resolved(services);}
 static void releaseSources(int from)throws Exception{for(int i=from;i<DexClassLoader.instances.size();i++)DexClassLoader.instances.get(i).close();}
 static void cleanup(Path path)throws Exception{Files.deleteIfExists(path);Files.delete(path.getParent());}
 static void deletedSource()throws Throwable {
  Counters.reset();Path source=source("runtime-unlink-",bridge);Run run=new Run(source,profile());
  releaseSources(run.previousLoads);Files.delete(source);run.prepare();RootOwnershipObservation o=run.observation();
  check(o.error==null,"LATE_SOURCE_UNAVAILABLE: first PREPARE must consume its retained verified bridge");
  o.signalForTest();check(Counters.callbacks==1,"Callback after unlink");
  check(run.module.infoReads==1 && DexClassLoader.instances.size()==run.previousLoads+1,"Exactly one module lookup/load per runtime");
  check(Counters.binds==1 && Counters.registrations==1 && Counters.writes==0,"First PREPARE binds/registers once without writes");
  cleanup(source);
 }
 public static void main(String[] args)throws Throwable {
  services=new URLClassLoader(new URL[]{Path.of(args[0]).toUri().toURL()},RootWatcherLifecycleTest.class.getClassLoader());
  bridge=Path.of(args[1]);wrong=Path.of(args[2]);android.os.Looper.getMainLooper();
  if(args.length>3 && args[3].equals("old-control")){deletedSource();throw new AssertionError("Old control unexpectedly passed");}
  test("entry loads once without native binding, registration or package writes",()->{
   Counters.reset();Path source=source("runtime-entry-",bridge);Run run=new Run(source,profile());
   check(run.module.infoReads==1 && DexClassLoader.instances.size()==run.previousLoads+1,"Entry resolved exact factory once");
   check(Counters.binds==0 && Counters.registrations==0 && Counters.writes==0 && Counters.bundles==0,"No native work before PREPARE");
   check(run.runtime.diagnostic().contains("state=WAITING_FOR_PREPARE"),"Entry stays lazy");
   run.concurrentRequests();check(android.os.Handler.queue.size()==1,"Concurrent pending PREPARE schedules one preparation");
   check(Counters.binds==0 && Counters.registrations==0,"Scheduling is not registration");
   android.os.Handler.drain();RootOwnershipObservation o=run.observation();run.prepare();run.prepare();o.signalForTest();
   check(Counters.binds==1 && Counters.registrations==1 && Counters.bundles==1 && Counters.callbacks==1,"No repeated bind/register");
   check(run.module.infoReads==1 && DexClassLoader.instances.size()==run.previousLoads+1 && Counters.writes==0,"No late load or action on repeated PREPARE");
   releaseSources(run.previousLoads);cleanup(source);
  });
  test("first PREPARE after source unlink uses the retained bridge",RootWatcherLifecycleTest::deletedSource);
  test("replacement cannot change a retained bridge and new generation revalidates",()->{
   Counters.reset();Path source=source("runtime-replace-",bridge);Run original=new Run(source,profile());
   releaseSources(original.previousLoads);Files.copy(wrong,source,StandardCopyOption.REPLACE_EXISTING);
   original.prepare();RootOwnershipObservation o=original.observation();o.signalForTest();
   check(o.error==null && Counters.callbacks==1,"Old verified bridge callback survives replacement");
   check(original.module.infoReads==1 && DexClassLoader.instances.size()==original.previousLoads+1,"Old runtime never adopts replacement");
   Run next=new Run(source,profile());next.prepare();check(next.observation().error instanceof IllegalStateException,"New generation validates and rejects changed shape");
   check(next.module.infoReads==1 && DexClassLoader.instances.size()==next.previousLoads+1,"New generation has independent load attempt");
   check(next.inputs.hiddenRequests.revocations==1 && Counters.registrations==1 && Counters.writes==0,"Rejected generation adds no observers or writes");
   releaseSources(original.previousLoads);cleanup(source);
  });
  test("missing source failure is retained even if a source appears before PREPARE",()->{
   Counters.reset();Path source=source("runtime-missing-",bridge);Files.delete(source);Run run=new Run(source,profile());
   check(Counters.binds==0 && Counters.registrations==0 && run.inputs.hiddenRequests.revocations==0,"Early failure does not register or revoke native ingress early");
   Files.copy(bridge,source);run.prepare();RootOwnershipObservation o=run.observation();
   check(o.error instanceof IllegalStateException && o.error.getMessage().equals("Unreadable framework module source"),"Original preparation failure preserved");
   Field failure=RootRuntimeAdmission.class.getDeclaredField("watcherPreparationFailure");failure.setAccessible(true);
   check(o.error==failure.get(run.runtime),"Same original Throwable handed to observation");
   check(run.module.infoReads==1 && DexClassLoader.instances.size()==run.previousLoads,"No retry after source restoration");
   check(Counters.registrations==0 && Counters.writes==0 && run.inputs.hiddenRequests.revocations==1,"Failure is closed at first PREPARE");
   cleanup(source);
  });
  test("different native loader and absent profile stay closed without fallback",()->{
   Counters.reset();RootOwnershipProfile.Resolved p=profile();
   URLClassLoader alien=new URLClassLoader(new URL[]{Path.of(args[0]).toUri().toURL()},ClassLoader.getPlatformClassLoader());
   p.alien=Class.forName("com.android.server.utils.Watcher",false,alien);
   Run run=new Run(bridge,p);run.prepare();check(run.observation().error instanceof IllegalStateException,"Alien class rejected");
   check(run.module.infoReads==0 && DexClassLoader.instances.size()==run.previousLoads,"Invalid native identity cannot look up module source");
   Run missing=new Run(bridge,null);missing.prepare();check(missing.observation().error instanceof IllegalStateException,"Missing profile rejected");
   check(missing.module.infoReads==0 && Counters.registrations==0 && Counters.writes==0,"No fallback loading or native action");alien.close();
  });
  System.out.println("RESULT "+passed+" passed, "+failed+" failed; "+assertions+" assertions; 0 skipped");
  System.out.println("Scope: actual runtime/bundle/factory and exact observation preparation; modeled native graph/Android hooks, not ART or native safety proof.");
  if(failed!=0)System.exit(1);
 }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bridge-output', required=True, type=Path)
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--source-root', type=Path, default=ROOT)
    parser.add_argument('--expect-old-failure', action='store_true')
    args = parser.parse_args()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    old = args.source_root.resolve()
    bridge_output = args.bridge_output.resolve()
    spec = importlib.util.spec_from_file_location('watcher_bridge_test', ROOT / 'tools/test-root-watcher-bridge.py')
    helper = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(helper)
    stubs = dict(helper.STUBS)
    stubs.update(ANDROID)
    stubs['ls/augment/com/LifecycleDoubles.java'] = DOUBLES
    observation = (old / SOURCE / 'RootOwnershipObservation.java').read_text(encoding='utf-8')
    start = observation.index('    static RootOwnershipObservation prepare(')
    end = observation.index('    /** Identity binding only.', start)
    stubs['ls/augment/com/RootOwnershipObservation.java'] = OBSERVATION.replace('__PREPARATION__', observation[start:end])
    stubs['ls/augment/com/RootWatcherLifecycleTest.java'] = TEST
    src = output / 'src'
    for relative, content in stubs.items():
        helper.write(src / relative, content)
    inputs = []
    for name in ('RootRuntimeAdmission.java', 'RootTransactionBundle.java', 'RootWatcherBridgeFactory.java'):
        data = (old / SOURCE / name).read_bytes()
        (src / 'ls/augment/com' / name).write_bytes(data)
        inputs.append({'path': str(SOURCE / name), 'sha256': hashlib.sha256(data).hexdigest()})
    for path in (old / SOURCE / 'RootOwnershipObservation.java', ROOT / 'tools/test-root-watcher-lifecycle.py', ROOT / 'tools/test-root-watcher-bridge.py'):
        inputs.append({'path': str(path), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest()})
    helper.write(output / 'inputs.json', json.dumps(inputs, indent=2) + '\n')
    runs = []
    def run(name, argv):
        result = subprocess.run(argv, capture_output=True, text=True, encoding='utf-8', errors='replace')
        helper.write(output / (name + '.stdout.txt'), result.stdout)
        helper.write(output / (name + '.stderr.txt'), result.stderr)
        runs.append({'name': name, 'command': argv, 'exitCode': result.returncode})
        helper.write(output / 'commands.json', json.dumps(runs, indent=2) + '\n')
        print(result.stdout, end='')
        print(result.stderr, end='')
        return result
    classes = output / 'classes'
    compile_result = run('compile', [helper.java_tool('javac'), '--release', '17', '-encoding', 'UTF-8', '-d', str(classes)] + [str(p) for p in sorted(src.rglob('*.java'))])
    if compile_result.returncode:
        raise SystemExit(compile_result.returncode)
    command = [helper.java_tool('java'), '-cp', str(classes), 'ls.augment.com.RootWatcherLifecycleTest',
               str(bridge_output / 'platform.jar'), str(bridge_output / 'module-bridge.jar'), str(bridge_output / 'wrong-superclass.jar')]
    if args.expect_old_failure:
        command.append('old-control')
    result = run('runtime', command)
    if args.expect_old_failure:
        expected = (result.returncode == 1 and 'LATE_SOURCE_UNAVAILABLE: first PREPARE must consume its retained verified bridge' in result.stderr
                    and 'Exception in thread "main" java.lang.AssertionError' in result.stderr)
        status = 'EXPECTED_OLD_FLOW_FAILURE' if expected else 'UNEXPECTED_NEGATIVE_RESULT'
        passed = expected
    else:
        passed = result.returncode == 0
        status = 'PASS' if passed else 'FAIL'
    helper.write(output / 'RESULT.json', json.dumps({'status': status, 'inputs': inputs, 'commands': runs,
                 'scope': 'JVM actual runtime/bundle/factory and verbatim observation preparation with native graph doubles; no device evidence'}, indent=2) + '\n')
    return 0 if passed else 1


if __name__ == '__main__':
    raise SystemExit(main())
