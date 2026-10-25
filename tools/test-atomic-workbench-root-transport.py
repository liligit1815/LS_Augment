"""Run actual Client/Root TX31 excerpts and MetadataExecutor on a controlled Binder wire.

No Android kernel, BinderProxy/AppOps activation, device, SDK or build is exercised.
The Parcel wrapper models only captured-ROM exception framing (-1/-2/-3/-5).
"""
from pathlib import Path
import argparse
import hashlib
import json
import re
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
AUDIT = ROOT / 'audit-output/workbench-completion-20261018'
JDK = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
JAVAC = str(JDK / 'javac.exe') if JDK.exists() else 'javac'
JAVA = str(JDK / 'java.exe') if JDK.exists() else 'java'


def sha(data):
    return hashlib.sha256(data).hexdigest().upper()


def item(path):
    data = path.read_bytes()
    return {'path': str(path.resolve()), 'bytes': len(data), 'sha256': sha(data)}


def member(source, signature):
    start = source.index(signature)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


STUBS = {
    'android/os/RemoteException.java': 'package android.os;public class RemoteException extends Exception{public RemoteException(String m){super(m);}}',
    'android/os/BadParcelableException.java': 'package android.os;public class BadParcelableException extends RuntimeException{public BadParcelableException(String m){super(m);}}',
    'android/os/IBinder.java': 'package android.os;public interface IBinder{boolean transact(int c,Parcel d,Parcel r,int f)throws RemoteException;boolean isBinderAlive();}',
    'android/os/Binder.java': r'''package android.os;public class Binder{
 public static final int INTERFACE_TRANSACTION=0x5f4e5446;static final ThreadLocal<Integer> uid=ThreadLocal.withInitial(()->0);
 public static final java.util.concurrent.atomic.AtomicInteger clears=new java.util.concurrent.atomic.AtomicInteger(),restores=new java.util.concurrent.atomic.AtomicInteger();
 public static int getCallingUid(){return uid.get();}public static void setCallingUid(int value){uid.set(value);}
 public static long clearCallingIdentity(){int old=uid.get();uid.set(0);clears.incrementAndGet();return old;}
 public static void restoreCallingIdentity(long value){uid.set((int)value);restores.incrementAndGet();}
 protected boolean onTransact(int c,Parcel d,Parcel r,int f)throws RemoteException{return false;}
}''',
    'android/os/Looper.java': r'''package android.os;public class Looper{static final Looper MAIN=new Looper();public static boolean forceMain;public static Looper myLooper(){return forceMain?MAIN:null;}public static Looper getMainLooper(){return MAIN;}}''',
    'android/os/Handler.java': r'''package android.os;public class Handler{
 public boolean accepted=true;public int posts;public Thread worker;public boolean post(Runnable r){posts++;if(!accepted)return false;worker=new Thread(r,"controlled-root-engine");worker.start();return true;}
 public void join()throws Exception{if(worker!=null){worker.join(2000);if(worker.isAlive())throw new AssertionError("worker did not finish");}}
}''',
    'android/os/Bundle.java': r'''package android.os;import java.util.*;public class Bundle{
 public static final Object CREATOR=new Object();private final Map<String,Object> data=new HashMap<>();public Bundle(){}public Bundle(Bundle b){data.putAll(b.data);}
 public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(data.get(k));}
 public void putString(String k,String v){data.put(k,v);}public String getString(String k){return (String)data.get(k);}
 public void putInt(String k,int v){data.put(k,v);}public int getInt(String k,int fallback){Object v=data.get(k);return v instanceof Integer?(Integer)v:fallback;}
 public void setClassLoader(ClassLoader loader){}
}''',
    'android/os/Parcel.java': r'''package android.os;import java.util.*;public class Parcel{
 public final List<Object> data=new ArrayList<>();public int position,forcedSize=-1,exceptionReads,noExceptionWrites,encodedException;public boolean recycled;
 public static Parcel obtain(){return new Parcel();}public void recycle(){recycled=true;}
 public void writeInterfaceToken(String value){writeString(value);}public void enforceInterface(String expected){if(!expected.equals(readString()))throw new SecurityException("descriptor");}
 public void writeInt(int value){data.add(value);}public int readInt(){Object v=next();if(!(v instanceof Integer))throw new BadParcelableException("not int");return (Integer)v;}
 public void writeString(String value){data.add(value);}public String readString(){Object v=next();if(v!=null&&!(v instanceof String))throw new BadParcelableException("not string");return (String)v;}
 private Object next(){if(position>=data.size())throw new BadParcelableException("missing value");return data.get(position++);}
 public int dataSize(){if(forcedSize>=0)return forcedSize;int n=0;for(Object v:data)n+=v instanceof String?8+((String)v).length()*2:8;return n;}
 public void enforceNoDataAvail(){if(position!=data.size())throw new BadParcelableException("trailing");}
 public void writeNoException(){noExceptionWrites++;writeInt(0);}public void writeTypedObject(Object value,int flags){data.add(value);}
 @SuppressWarnings("unchecked")public <T>T readTypedObject(Object creator){Object value=next();return (T)(value instanceof Bundle?new Bundle((Bundle)value):value);}
 public void resetReply(){data.clear();position=0;forcedSize=-1;noExceptionWrites=0;}
 public void writeException(RuntimeException e){encodedException=e instanceof SecurityException?-1:e instanceof BadParcelableException?-2:e instanceof IllegalArgumentException?-3:e instanceof IllegalStateException?-5:0;if(encodedException==0)throw e;writeInt(encodedException);writeString(e.getMessage());}
 public void readException(){exceptionReads++;int code=readInt();if(code==0)return;String message=readString();switch(code){case -1:throw new SecurityException(message);case -2:throw new BadParcelableException(message);case -3:throw new IllegalArgumentException(message);case -5:throw new IllegalStateException(message);default:throw new AssertionError("unsupported exception code");}}
}''',
    'android/content/ComponentName.java': 'package android.content;public class ComponentName{public static ComponentName unflattenFromString(String v){return v!=null&&v.contains("/")?new ComponentName():null;}}',
    'ls/augment/com/AtomicWorkbenchExtractionGeometryFence.java': 'package ls.augment.com;final class AtomicWorkbenchExtractionGeometryFence{static final int TRANSACTION=0xD04E08;}',
    'ls/augment/com/AtomicWorkbenchDiagnostics.java': r'''package ls.augment.com;final class AtomicWorkbenchDiagnostics{static int failures,ingress;static boolean throwIngress;static String lastIngress;static void emit(String event,int w,int u,String c,int d,String detail,Throwable t){if(event.equals("ATOMIC_TASK_SHELF_INGRESS")){ingress++;lastIngress=detail;if(throwIngress)throw new RuntimeException("controlled_sink");return;}if(!event.equals("ROOT_OPERATION_FAILED"))throw new AssertionError("unexpected diagnostic");failures++;}}''',
}

ROOT_HEAD = r'''package ls.augment.com;import android.os.*;import java.util.concurrent.*;
final class RootTransportHarness extends Binder{
 final int appUid=10515,userId=0;final java.util.concurrent.atomic.AtomicBoolean taskShelfIngressObserved=new java.util.concurrent.atomic.AtomicBoolean();final String token="a".repeat(64);final Handler engine=new Handler();boolean registered=true,finished;
 final CountDownLatch registrationReady=new CountDownLatch(0);Object extractionGeometryFence;int backendAccesses,recoveries;
 final AtomicWorkbenchEngine backend=new AtomicWorkbenchEngine();
 AtomicWorkbenchEngine backend(){backendAccesses++;return backend;}
 boolean readExtractionGeometryFence(Parcel d,Parcel r,int f){throw new AssertionError("unrelated extraction path");}
 void requestRecovery(){recoveries++;}
'''

CLIENT_HEAD = r'''package ls.augment.com;import android.os.*;import java.io.*;
final class AtomicWorkbenchClient{
 static final class Pending{String token="a".repeat(64);}final Pending pending=new Pending();IBinder endpoint;boolean closed;int reports;
 AtomicWorkbenchClient(IBinder b){endpoint=b;}void reportFailure(String message){reports++;}
'''

ENGINE_HEAD = r'''package ls.augment.com;import android.os.*;
final class AtomicWorkbenchEngine{
 interface TaskController{Bundle shelf();}TaskController taskController;String taskBackendReason="task_backend_unavailable";
 int calls;RuntimeException failure;Thread actionThread;int actionUid=-1;
 AtomicWorkbenchEngine(){taskController=()->{calls++;actionThread=Thread.currentThread();actionUid=Binder.getCallingUid();if(failure!=null)throw failure;Bundle b=new Bundle();b.putBoolean("success",true);b.putInt("schema",1);return b;};}
'''

TEST = r'''package ls.augment.com;import android.os.*;import java.util.*;
public final class TestRootTransport{
 static int cases,checks;interface Case{void run()throws Exception;}
 static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static void test(String name,Case body)throws Exception{try{body.run();cases++;System.out.println("PASS actual Root TX31: "+name);}catch(Throwable t){throw new AssertionError("case: "+name,t);}}
 static class Wire implements IBinder{
  final RootTransportHarness root=new RootTransportHarness();int deliveredFlags,callerUid=10515,calls,outgoingFlags,code;boolean nullReply,alive=true,remoteWire=true,appOps;
  int size=-1;String badHeader="";boolean trailing;Parcel request,response;RuntimeException remote;
  public boolean isBinderAlive(){return alive;}
  public boolean transact(int c,Parcel d,Parcel r,int f)throws RemoteException{
   calls++;code=c;outgoingFlags=f;request=d;response=r;
   check(c==AtomicWorkbenchProtocol.TX_TASK_SHELF_STATE,"Client wrong transaction");check(f==0,"Client unexpectedly changed outgoing flags");
   check(d.data.size()==3,"Client shelf payload/header changed");
   if(badHeader.equals("descriptor"))d.data.set(0,"foreign");if(badHeader.equals("version"))d.data.set(1,99);if(badHeader.equals("token"))d.data.set(2,"b".repeat(64));
   if(trailing)d.writeInt(7);d.forcedSize=size;int previous=Binder.getCallingUid();Binder.setCallingUid(callerUid);
   try{return root.onTransact(c,d,nullReply?null:r,remoteWire?(deliveredFlags|0x10|(appOps?2:0)):deliveredFlags);}catch(RuntimeException e){remote=e;r.resetReply();r.writeException(e);return true;}
   finally{Binder.setCallingUid(previous);}
  }
 }
 static class Fixture{final Wire wire=new Wire();final AtomicWorkbenchClient client=new AtomicWorkbenchClient(wire);
  Bundle read()throws Exception{Bundle b=client.taskShelfState();wire.root.engine.join();return b;}
  void untouched(){check(wire.root.backendAccesses==0&&wire.root.backend.calls==0&&wire.root.engine.posts==0,"rejected transport entered metadata/backend");check(wire.root.recoveries==0&&client.reports==0,"transport refusal recovered unrelated scope");}
 }
 static void rejected(Fixture f,Class<? extends RuntimeException> expected)throws Exception{
  boolean caught=false;try{f.read();}catch(RuntimeException failure){check(failure.getClass()==expected,"wrong remote exception type "+failure.getClass());caught=true;}
  check(caught,"invalid transport accepted");f.untouched();check(f.wire.response.exceptionReads==1,"Client did not consume remote exception");
  check(f.wire.request.recycled&&f.wire.response.recycled,"Client failed to recycle rejected parcels");
 }
 public static void main(String[]args)throws Exception{
  if(args.length==1&&args[0].equals("c13-red")){Fixture f=new Fixture();f.wire.deliveredFlags=2;f.read();throw new AssertionError("C13 remote flag18 unexpectedly admitted");}
  test("real Client header and Root shelf dispatch accept ordinary and framework synchronous flags",()->{
   for(int flags:new int[]{0,2,16,18}){Fixture f=new Fixture();f.wire.deliveredFlags=flags;Bundle result=f.read();
    check(result.getBoolean("success")&&f.wire.root.backend.calls==1&&f.wire.root.backendAccesses==1&&f.wire.root.engine.posts==1,"valid synchronous TX31 not exactly once");
    check(f.wire.response.noExceptionWrites==1&&f.wire.response.encodedException==0,"valid reply exception framing");
    check(f.wire.root.backend.actionThread!=Thread.currentThread()&&f.wire.root.backend.actionUid==0,"metadata did not use cleared engine worker");
    check(f.wire.root.recoveries==0&&f.client.reports==0,"read-only shelf forced recovery");
    check(f.wire.request.recycled&&f.wire.response.recycled,"successful Client parcels leaked");}
  });
  test("one-way mixed and unknown flags reject before backend",()->{for(int flags:new int[]{1,3,4,5,6,8,10,17,19,20,-1,Integer.MIN_VALUE}){Fixture f=new Fixture();f.wire.deliveredFlags=flags;rejected(f,IllegalArgumentException.class);check(f.wire.response.encodedException==-3,"wrong IAE wire code");}});
  test("missing reply and oversize reject before backend",()->{Fixture nul=new Fixture();nul.wire.nullReply=true;rejected(nul,IllegalArgumentException.class);Fixture big=new Fixture();big.wire.size=4097;rejected(big,IllegalArgumentException.class);});
  test("size cap remains inclusive under both supported flags",()->{for(int flags:new int[]{0,2,16,18}){Fixture f=new Fixture();f.wire.deliveredFlags=flags;f.wire.size=4096;check(f.read().getBoolean("success")&&f.wire.root.backend.calls==1,"exact cap rejected");}});
  test("actual no-tail check preserves BadParcelable exception category",()->{Fixture f=new Fixture();f.wire.trailing=true;rejected(f,BadParcelableException.class);check(f.wire.response.encodedException==-2,"tail confused with invalid flags");});
  test("caller UID descriptor protocol and token deny before backend",()->{Fixture uid=new Fixture();uid.wire.callerUid=1000;rejected(uid,SecurityException.class);for(String header:new String[]{"descriptor","version","token"}){Fixture f=new Fixture();f.wire.badHeader=header;rejected(f,SecurityException.class);check(f.wire.response.encodedException==-1,"auth exception encoding");}});
  test("common authorization precedes the transport guard",()->{Fixture f=new Fixture();f.wire.callerUid=1000;f.wire.deliveredFlags=3;rejected(f,SecurityException.class);});
  test("incomplete registration denies without backend",()->{Fixture f=new Fixture();f.wire.root.registered=false;rejected(f,SecurityException.class);});
  test("finished Root sends failure Bundle without shelf access",()->{Fixture f=new Fixture();f.wire.root.finished=true;Bundle b=f.read();check(!b.getBoolean("success")&&f.wire.root.backendAccesses==0&&f.wire.root.backend.calls==0,"finished scope queried backend");check(f.wire.response.noExceptionWrites==1&&f.wire.remote==null,"finished result became remote exception");});
  test("backend IllegalArgumentException becomes a failure Bundle not a thrown wire exception",()->{Fixture f=new Fixture();f.wire.root.backend.failure=new IllegalArgumentException("controlled_backend");int before=AtomicWorkbenchDiagnostics.failures;Bundle b=f.read();check(!b.getBoolean("success")&&b.getString("message").contains("IllegalArgumentException"),"business exception not mapped");check(f.wire.root.backend.calls==1&&AtomicWorkbenchDiagnostics.failures==before+1,"mapping duplicated or skipped action");check(f.wire.remote==null&&f.wire.response.noExceptionWrites==1&&f.wire.response.encodedException==0,"business IAE escaped as Client readException");check(!b.getBoolean("recovery_pending")&&f.wire.root.recoveries==0,"metadata failure escalated cleanup");});
  test("pre-dispatch IAE is reconstructed at the actual Client readException",()->{Fixture f=new Fixture();f.wire.deliveredFlags=1;try{f.read();throw new AssertionError("one-way accepted");}catch(IllegalArgumentException failure){check(f.wire.remote!=failure,"wire reused exception object");check(Arrays.stream(failure.getStackTrace()).anyMatch(s->s.getClassName().equals("ls.augment.com.AtomicWorkbenchClient")&&s.getMethodName().equals("requestTaskMetadata")),"actual Client readException stack missing");check(f.wire.root.backend.calls==0,"predispatch reached backend");}});
  test("worker queue refusal returns a failure Bundle without query or recovery",()->{Fixture f=new Fixture();f.wire.root.engine.accepted=false;Bundle b=f.read();check(!b.getBoolean("success")&&f.wire.root.backend.calls==0&&f.wire.root.recoveries==0,"queue refusal dispatched or recovered");check(f.wire.response.noExceptionWrites==1,"queue refusal malformed reply");});
  test("actual Client worker guard blocks main thread before any transaction",()->{Fixture f=new Fixture();Looper.forceMain=true;try{f.read();throw new AssertionError("main thread admitted");}catch(IllegalStateException expected){check(f.wire.calls==0,"main thread reached endpoint");}finally{Looper.forceMain=false;}});
  test("Binder identity restoration covers both business success and failure",()->{int before=Binder.restores.get();Fixture ok=new Fixture();ok.read();Fixture bad=new Fixture();bad.wire.root.backend.failure=new IllegalArgumentException("controlled");bad.read();check(Binder.restores.get()==before+2&&Binder.clears.get()==Binder.restores.get(),"metadata identity unbalanced");});
  test("remote AppOps metadata and direct synchronous subset preserve exact backend count",()->{Fixture remote=new Fixture();remote.wire.appOps=true;check(remote.read().getBoolean("success")&&remote.wire.outgoingFlags==0&&remote.wire.root.backend.calls==1,"actual client remote18 failed");for(int flags:new int[]{0,2,16,18}){Fixture direct=new Fixture();direct.wire.remoteWire=false;direct.wire.deliveredFlags=flags;check(direct.read().getBoolean("success"),"direct known mask rejected");}});
  test("actual fixed ingress is once only and sink failure has no authority",()->{int before=AtomicWorkbenchDiagnostics.ingress;Fixture f=new Fixture();f.read();f.read();check(AtomicWorkbenchDiagnostics.ingress==before+1&&AtomicWorkbenchDiagnostics.lastIngress.contains("flags=16;")&&AtomicWorkbenchDiagnostics.lastIngress.contains("transport_accepted=true;reject_mask=0"),"ingress once/numeric facts wrong");AtomicWorkbenchDiagnostics.throwIngress=true;try{Fixture g=new Fixture();check(g.read().getBoolean("success")&&g.wire.root.backend.calls==1,"diagnostic sink altered success");Fixture rejected=new Fixture();rejected.wire.deliveredFlags=1;rejected(rejected,IllegalArgumentException.class);}finally{AtomicWorkbenchDiagnostics.throwIngress=false;}});
  System.out.println("ROOT TRANSPORT RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def sources(root, client, engine, metadata, protocol):
    on = member(root, 'protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)')
    prefix = on[:on.index('        if (code == AtomicWorkbenchProtocol.TX_INVALIDATE_EXTRACTION_GEOMETRY)')]
    marker = '} else if (code == AtomicWorkbenchProtocol.TX_TASK_SHELF_STATE) {'
    shelf = on.split(marker, 1)[1].split('} else if (code == AtomicWorkbenchProtocol.TX_TASK_REFERENCES)', 1)[0]
    tail = on[on.index('        if (state.getBoolean("input_failure"))'):]
    projected = prefix + '\n        Bundle state;\n        if(code == AtomicWorkbenchProtocol.TX_TASK_SHELF_STATE) {' + shelf + '} else return super.onTransact(code, data, reply, flags);\n' + tail
    helpers = '\n'.join(member(root, signature) for signature in (
        'private void awaitRegistration()', 'private static boolean invalidatesExtractionGeometry(',
        'private Bundle executeInputMetadata(', 'private static Bundle failureState(', 'private static Throwable cause('))
    if 'private static boolean synchronousReplyTransport(' in root:
        constants = re.findall(r'private static final int BINDER_FLAG_\w+\s*=\s*0x[0-9a-fA-F]+;', root)
        assert constants
        helpers += '\n' + '\n'.join(constants) + '\n' + member(root, 'private static boolean synchronousReplyTransport(')
    if 'private void diagnoseTaskShelfTransport(' in root:
        helpers += '\n' + member(root, 'private void diagnoseTaskShelfTransport(')
    client_methods = '\n'.join(member(client, signature) for signature in (
        'public Bundle taskShelfState()', 'private Bundle requestTaskMetadata(', 'private IBinder requireEndpoint()',
        'private void writeHeader(', 'private static void requireWorkerThread()', 'private interface ParcelWriter'))
    result = dict(STUBS)
    result['ls/augment/com/RootTransportHarness.java'] = ROOT_HEAD + helpers + '\n' + projected + '\n}'
    result['ls/augment/com/AtomicWorkbenchClient.java'] = CLIENT_HEAD + client_methods + '\n}'
    result['ls/augment/com/AtomicWorkbenchEngine.java'] = ENGINE_HEAD + member(engine, 'Bundle taskShelfState()') + member(engine, 'private Bundle taskUnavailable()') + '\n}'
    result['ls/augment/com/AtomicWorkbenchMetadataExecutor.java'] = metadata
    result['ls/augment/com/AtomicWorkbenchProtocol.java'] = protocol
    result['ls/augment/com/TestRootTransport.java'] = TEST
    return result


def execute(command, directory, label, records):
    stdout = directory / (label + '-stdout.txt')
    stderr = directory / (label + '-stderr.txt')
    with stdout.open('xb') as out, stderr.open('xb') as err:
        run = subprocess.run(command, stdout=out, stderr=err, timeout=120, check=False)
    row = {'label': label, 'command': command, 'exitCode': run.returncode, 'stdout': item(stdout), 'stderr': item(stderr)}
    records.append(row)
    return run.returncode, stdout.read_text(encoding='utf-8', errors='replace'), stderr.read_text(encoding='utf-8', errors='replace')


def compile_run(directory, files, records, args=()):
    directory.mkdir()
    source_files = []
    for name, text in files.items():
        path = directory / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf-8')
        source_files.append(str(path))
    classes = directory / 'classes'
    classes.mkdir()
    code, _, err = execute([JAVAC, '-encoding', 'UTF-8', '-d', str(classes), *source_files], directory, 'compile', records)
    assert code == 0, 'fixture compilation failed; not a runtime negative: ' + err
    return execute([JAVA, '-cp', str(classes), 'ls.augment.com.TestRootTransport', *args], directory, 'run', records)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path)
    parser.add_argument('--negative-controls', action='store_true')
    args = parser.parse_args()
    out = args.out.resolve() if args.out else Path(tempfile.mkdtemp(prefix='duo-root-transport-')) / 'evidence'
    assert not out.exists(), 'fresh evidence directory required'
    out.mkdir(parents=True)
    files = [SRC / name for name in ('AtomicWorkbenchRoot.java', 'AtomicWorkbenchClient.java', 'AtomicWorkbenchEngine.java', 'AtomicWorkbenchMetadataExecutor.java', 'AtomicWorkbenchProtocol.java')]
    before = [item(path) for path in files]
    report = {'schema': 1, 'status': 'FAIL', 'before': before, 'commands': [], 'phoneValidated': False,
              'boundary': 'Actual extracted TX31/common auth/client framing/Engine routing/metadata executor. Handler, Parcel exception encoding, Binder caller identity and native16 and optional synchronous AppOps2 delivery are controlled host boundaries; no real BinderProxy/AppOps state or Android kernel execution. Unrelated Root transaction branches, backend construction/storage and business shelf implementation are excluded.'}
    try:
        root, client, engine, metadata, protocol = [path.read_text(encoding='utf-8') for path in files]
        archive = AUDIT / 'candidate13/candidate13-build-source-snapshot.zip'
        manifest = AUDIT / 'candidate13/source-before.json'
        with zipfile.ZipFile(archive) as package:
            names = [name for name in package.namelist() if name.endswith('android/app/src/main/java/ls/augment/com/AtomicWorkbenchRoot.java')]
            assert len(names) == 1
            old_bytes = package.read(names[0])
        old_map = {row['path']: row['sha256'] for row in json.loads(manifest.read_text(encoding='utf-8'))['files']}
        root_key = 'android/app/src/main/java/ls/augment/com/AtomicWorkbenchRoot.java'
        assert sha(old_bytes) == old_map[root_key]
        report['c13Baseline'] = {'archive': item(archive), 'manifest': item(manifest), 'rootSha256': sha(old_bytes)}
        base = sources(old_bytes.decode('utf-8'), client, engine, metadata, protocol)
        code, stdout, stderr = compile_run(out / 'c13-red', base, report['commands'], ('c13-red',))
        assert code != 0 and 'java.lang.IllegalArgumentException: invalid task shelf transport' in stderr and 'AtomicWorkbenchClient.requestTaskMetadata' in stderr, 'C13 did not reproduce actual remote flag18 refusal: ' + stderr
        report['c13Flag2'] = {'status': 'EXPECTED_RUNTIME_REMOTE_ILLEGAL_ARGUMENT', 'exitCode': code}
        print('PASS C13 old-source flag2 refusal reproduced at real Client readException')
        c14_archive = AUDIT / 'candidate14/candidate14-build-source-snapshot.zip'
        with zipfile.ZipFile(c14_archive) as package:
            names=[name for name in package.namelist() if name.endswith(root_key)]
            assert len(names)==1
            c14_root=package.read(names[0])
        c14_manifest=AUDIT/'candidate14/source-before.json'
        c14_map={row['path']:row['sha256'] for row in json.loads(c14_manifest.read_text(encoding='utf-8'))['files']}
        assert sha(c14_root)==c14_map[root_key]
        code, stdout, stderr=compile_run(out/'c14-mask2-red',sources(c14_root.decode('utf-8'),client,engine,metadata,protocol),report['commands'],('c13-red',))
        assert code!=0 and 'invalid task shelf transport' in stderr and 'AtomicWorkbenchClient.requestTaskMetadata' in stderr, stderr
        report['c14Native18']={'status':'EXPECTED_RUNTIME_REMOTE_ILLEGAL_ARGUMENT','exitCode':code,'archive':item(c14_archive),'manifest':item(c14_manifest),'rootSha256':sha(c14_root)}
        current = sources(root, client, engine, metadata, protocol)
        code, stdout, stderr = compile_run(out / 'c14-positive', current, report['commands'])
        assert code == 0, stdout + stderr
        match = re.search(r'ROOT TRANSPORT RESULT (\d+) cases; (\d+) assertions', stdout)
        assert match, 'missing real runner totals'
        report['cases'], report['assertions'] = map(int, match.groups())
        print(stdout, end='')
        controls = [
            ('supported synchronous mask', 'ls/augment/com/RootTransportHarness.java', 'return (flags & ~(BINDER_FLAG_COLLECT_NOTED_APP_OPS | BINDER_FLAG_ACCEPT_FDS)) == 0 && reply != null;', 'return reply != null;'),
            ('caller UID authorization', 'ls/augment/com/RootTransportHarness.java', 'if (Binder.getCallingUid() != appUid)', 'if (false)'),
            ('no trailing bytes', 'ls/augment/com/RootTransportHarness.java', 'data.enforceNoDataAvail();', ''),
            ('business exception maps to Bundle', 'ls/augment/com/AtomicWorkbenchMetadataExecutor.java', 'return failure.apply(unavailable.getCause() == null ? unavailable : unavailable.getCause());', 'throw new IllegalArgumentException("controlled_mapping_removed");'),
            ('reply exception header', 'ls/augment/com/RootTransportHarness.java', 'reply.writeNoException();', ''),
            ('Client protocol header', 'ls/augment/com/AtomicWorkbenchClient.java', 'data.writeInt(AtomicWorkbenchProtocol.VERSION);', 'data.writeInt(0);'),
        ]
        report['negativeControls'] = []
        if args.negative_controls:
            for index, (label, filename, old, new) in enumerate(controls):
                changed = dict(current)
                assert changed[filename].count(old) == 1, ('ambiguous actual negative anchor', label)
                changed[filename] = changed[filename].replace(old, new, 1)
                code, stdout, stderr = compile_run(out / ('negative-' + str(index + 1)), changed, report['commands'])
                assert code != 0 and 'AssertionError' in stderr, 'compiled behavior control survived: ' + label + '\n' + stdout + stderr
                report['negativeControls'].append({'name': label, 'exitCode': code, 'runtimeAssertion': True})
                print('PASS compiled runtime negative:', label)
        report['after'] = [item(path) for path in files]
        report['sourceStable'] = report['after'] == before
        assert report['sourceStable']
        report['tool'] = item(Path(__file__))
        report['status'] = 'PASS_ACTUAL_EXTRACTED_ROOT_TX31_TRANSPORT'
    except BaseException as error:
        report['failure'] = type(error).__name__ + ': ' + str(error)
        raise
    finally:
        with (out / 'summary.json').open('x', encoding='utf-8') as stream:
            json.dump(report, stream, ensure_ascii=False, indent=2)
            stream.write('\n')
        print('Evidence:', out)


if __name__ == '__main__':
    main()
