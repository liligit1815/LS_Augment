"""Real retained task cleanup/durable chain; controlled Android/WM/Binder boundary, no phone claim.

Default: current repository sources, positive only. Optional four-source overrides support an
external candidate; baseline is never inferred. --negative-controls runs the13 compiled gates.
The existing original SystemAuthority and TaskBroker suites remain independent regressions.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,runpy,subprocess,tempfile,traceback
SOURCE_NAMES=('AtomicWorkbenchRoot.java','AtomicWorkbenchTaskAuthority.java','hook/AtomicWorkbenchSystemRootAuthority.java','hook/AtomicWorkbenchTaskOperationHook.java')
AUTH_OWNER='ls/augment/com/hook/AtomicWorkbenchSystemRootAuthority.java'
HOOK_OWNER='ls/augment/com/hook/AtomicWorkbenchTaskOperationHook.java'
def item(p):
 b=Path(p).read_bytes();return dict(path=str(Path(p).resolve()),bytes=len(b),sha256=hashlib.sha256(b).hexdigest().upper())
def write(p,s):
 p.parent.mkdir(parents=True,exist_ok=True)
 with p.open('x',encoding='utf-8',newline='\n') as f:f.write(s)
def initialize(root):
 global ROOT,SRC,FIXTURES,BROKER,AUTH,OPS,MEMBER,JAVAC,JAVA,JAR
 ROOT=root.resolve();SRC=Path('android/app/src/main/java/ls/augment/com');FIXTURES=Path(__file__).resolve().parent/'fixtures'
 BROKER=runpy.run_path(str(ROOT/'tools/test-atomic-workbench-task-broker.py'))
 AUTH=runpy.run_path(str(ROOT/'tools/test-atomic-workbench-system-root-authority.py'))
 OPS=runpy.run_path(str(ROOT/'tools/test-atomic-workbench-task-operations.py'))
 MEMBER=AUTH['SUPPORT']['member'];JAVAC=BROKER['MODELS']['JAVAC'];JAVA=BROKER['MODELS']['JAVA']
 JAR=next((Path.home()/'.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/*.jar'))

def base_files(source):
 f=dict(BROKER['SOURCES']);f.pop('ls/augment/com/hook/AtomicWorkbenchSystemRootAuthority.java')
 for n in ('android/app/ActivityManager.java','android/net/Uri.java','android/content/Context.java','android/content/ContentResolver.java'):
  f[n]=AUTH['STUBS'][n]
 f['android/os/Process.java']='package android.os;public class Process{public static int uid=1000;public static int myUid(){return uid;}public static int myPid(){return 123;}}'
 f['android/os/Binder.java']=AUTH['STUBS']['android/os/Binder.java'].replace('pid=999','pid=123')
 f['android/os/Bundle.java']=f['android/os/Bundle.java'].replace('public boolean getBoolean(String k){','public boolean getBoolean(String k,boolean d){return containsKey(k)?(Boolean)get(k):d;}public boolean getBoolean(String k){')
 f['android/os/IBinder.java']=f['android/os/IBinder.java'].replace('boolean isBinderAlive();','boolean isBinderAlive();default boolean transact(int code,Parcel data,Parcel reply,int flags)throws Exception{return false;}')
 f['android/os/Parcel.java']='''package android.os;import java.util.*;public class Parcel{
 public ArrayList<Object> values=new ArrayList<>();public int pos,size;public boolean recycled;
 public static Parcel obtain(){return new Parcel();}public void recycle(){recycled=true;}
 public void enforceInterface(String d){if(!d.equals(readString()))throw new SecurityException();}
 public void writeInterfaceToken(String d){writeString(d);}public int readInt(){return (Integer)values.get(pos++);}
 public Bundle readBundle(ClassLoader l){Object b=values.get(pos++);return b==null?null:new Bundle((Bundle)b);}
 public String readString(){return (String)values.get(pos++);}public int dataAvail(){return values.size()-pos;}public int dataSize(){return size==0?values.size()*32:size;}
 public void writeNoException(){writeInt(0);}public void readException(){if(readInt()!=0)throw new IllegalStateException();}
 public void writeInt(int v){values.add(v);}public void writeString(String s){values.add(s);}public void writeBundle(Bundle b){values.add(b==null?null:new Bundle(b));}}
'''
 f['android/os/ServiceManager.java']='package android.os;public class ServiceManager{public static IBinder window;public static IBinder getService(String name){return window;}}'
 provider=(ROOT/SRC/'AtomicWorkbenchProvider.java').read_text(encoding='utf-8')
 head=AUTH['PROVIDER_HEAD']
 head=head.replace('public static final class Live implements IBinder {public boolean alive=true;public boolean isBinderAlive(){return alive;}}','public static final class Live implements IBinder {public boolean alive=true;public boolean isBinderAlive(){return alive;}public void linkToDeath(DeathRecipient r,int flags){}}')
 head=head.replace('uid=10515,userId=0,rootPid=999','uid=10055,userId=0,rootPid=123').replace('startedAt=876,resetGeneration=7','startedAt=7,resetGeneration=2')
 head=head.replace('public Live endpoint=new Live(),owner=new Live();','public IBinder endpoint=new Live(),owner=new Live();')
 head=head.replace('static long epoch=7','static long epoch=2').replace('ResetWriteFence.epoch=7','ResetWriteFence.epoch=2')
 f['ls/augment/com/AtomicWorkbenchProvider.java']=head+MEMBER(provider,'private Bundle systemRootSession(')+MEMBER(provider,'private static boolean systemSessionShape(')+'\n}'
 protocol=(ROOT/SRC/'AtomicWorkbenchProtocol.java').read_text(encoding='utf-8')
 f['ls/augment/com/AtomicWorkbenchProtocol.java']='package ls.augment.com;import java.security.MessageDigest;import java.nio.charset.StandardCharsets;final class AtomicWorkbenchProtocol{static final int VERSION=1;'+MEMBER(protocol,'static boolean sameToken(')+'}'
 for name in ('AtomicWorkbenchTaskAuthority.java','hook/AtomicWorkbenchTaskOperationHook.java','hook/AtomicWorkbenchSystemRootAuthority.java'):
  f['ls/augment/com/'+name]=source[name].read_text(encoding='utf-8')
 for name in BROKER['MODELS']['PRODUCTION']:
  f['ls/augment/com/'+name]=(ROOT/SRC/name).read_text(encoding='utf-8')
 root=source['AtomicWorkbenchRoot.java'].read_text(encoding='utf-8')
 metadata=MEMBER(root,'private Bundle systemSessionMetadata(')
 retained=MEMBER(root,'private Bundle retainedTaskCleanupMetadata(') if 'private Bundle retainedTaskCleanupMetadata(' in root else ''
 f['ls/augment/com/RootCredentials.java']='''package ls.augment.com;import android.os.*;import android.os.Process;import ls.augment.com.hook.TestTaskBroker;
 public class RootCredentials extends TestTaskBroker.Live{
 private IBinder owner;private boolean registered=true,finished,closing;private long providerSession=7,providerResetGeneration=2;
 private int appUid=10055,userId;private String token="a".repeat(64);
 public void bind(IBinder value){owner=value;}public void close(){closing=true;}
 public Bundle normal()throws Exception{return systemSessionMetadata();}
 public Bundle retained()throws Exception{try{var m=RootCredentials.class.getDeclaredMethod("retainedTaskCleanupMetadata");m.setAccessible(true);return (Bundle)m.invoke(this);}catch(java.lang.reflect.InvocationTargetException e){throw (Exception)e.getCause();}}
 '''+metadata+retained+'\n}'
 f['ls/augment/com/TaskTransport.java']='''package ls.augment.com;import android.os.*;import android.content.*;
 public class TaskTransport{private AtomicWorkbenchTaskAuthority actual;public TaskTransport(Context c,RootCredentials r)throws Exception{
 AtomicWorkbenchTaskAuthority.Authentication normal=r::normal,retained=r::retained;
 try{var ctor=AtomicWorkbenchTaskAuthority.class.getDeclaredConstructor(Context.class,AtomicWorkbenchTaskAuthority.Authentication.class,AtomicWorkbenchTaskAuthority.Authentication.class);actual=ctor.newInstance(c,normal,retained);}
 catch(NoSuchMethodException old){actual=new AtomicWorkbenchTaskAuthority(c,normal);}}
 public Bundle primary()throws Exception{return actual.primaryDisplay();}public Bundle prepare(AtomicWorkbenchTaskOperationRequest r)throws Exception{return actual.prepare(r);}
 public Bundle apply(String id,String ticket)throws Exception{return actual.apply(id,ticket);}public Bundle cleanup()throws Exception{return actual.cleanup();}
 public Bundle release(String id)throws Exception{return actual.release(id);}public Bundle cancel(String id)throws Exception{return actual.cancel(id);}
 public Bundle query(String id)throws Exception{return actual.query(id);}}
'''
 test=BROKER['TEST'].split(' public static void main(String[]args)throws Throwable{',1)[0]
 test=test.replace('AtomicWorkbenchSystemRootAuthority.Session owner=new AtomicWorkbenchSystemRootAuthority.Session();Live endpoint=new Live(),app=new Live();','AtomicWorkbenchSystemRootAuthority.Session owner;RootCredentials endpoint=new RootCredentials();Live app=new Live();')
 test=test.replace('owner.endpoint=endpoint;owner.owner=app;','endpoint.bind(app);installProvider(endpoint,app);owner=AtomicWorkbenchSystemRootAuthority.authenticate(s.mContext,credentials(endpoint),0,123);')
 test=test.replace('void die(){','public void die(){')
 f['ls/augment/com/hook/TestTaskBroker.java']=test+(FIXTURES/'AtomicWorkbenchRetainedTaskCleanupCases.java.inc').read_text(encoding='utf-8')+'\n}'
 return f

def files(source):
 f=base_files(source)
 for name,text in OPS['STORE']['SYSTEM'].items():
  if name!='android/content/Context.java':f[name]=text
 f['android/content/Context.java']=OPS['STORE']['SYSTEM']['android/content/Context.java'].replace('public class Context {','public class Context {public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}')
 f['android/os/Process.java']=f['android/os/Process.java'].replace('public class Process{','public class Process{public static final int ROOT_UID=0;')
 f['android/view/Display.java']=f['android/view/Display.java'].replace('public class Display{','public class Display{public static final int DEFAULT_DISPLAY=0;')
 f['android/content/ComponentName.java']=f['android/content/ComponentName.java'].replace('public class ComponentName{','public class ComponentName{public static ComponentName unflattenFromString(String s){if(s==null||!s.contains("/"))return null;String[]p=s.split("/",2);return new ComponentName(p[0],p[1]);}')
 os=f['android/system/Os.java'];os=os.replace('public static boolean failWrite,','public static int injectedFsyncFailures;public static boolean failAfterJournalRename;public static boolean failWrite,')
 os=os.replace('renames++;','renames++;if(failAfterJournalRename&&Path.of(target).getFileName().toString().startsWith("recovery-window-")){failAfterJournalRename=false;failDirectorySync=true;}')
 os=os.replace('failDirectorySync=false;throw new ErrnoException("directory fsync injected",5);','failDirectorySync=false;injectedFsyncFailures++;throw new ErrnoException("directory fsync injected",5);')
 f['android/system/Os.java']=os
 f['ls/augment/com/AtomicWorkbenchEngine.java']=OPS['SOURCES']['ls/augment/com/AtomicWorkbenchEngine.java']
 platform=OPS['SOURCES']['ls/augment/com/AtomicWorkbenchPlatform.java'];platform=platform[:platform.index(' void prepareTaskOperation(')]
 platform=platform.replace('import android.os.*;', 'import android.os.*;import android.view.Display;')
 platform=platform.replace(' final int slot;',' final int slot;int windowId;AtomicWorkbenchJournal journal;AtomicWorkbenchJournal.Record record;void requireDisplayIdentity(){if(!live||record==null)throw new SecurityException();}')
 platform=platform.replace('AtomicWorkbenchPlatform(int s){slot=s;}','AtomicWorkbenchPlatform(int s){slot=s;windowId=s;}')
 platform=platform.replace('"vd"+slot','"DuoAtomic-10055-w"+slot+"-"+SESSIONS[slot]').replace('"unique"+slot','"vd:"+(88+slot)')
 text=(ROOT/SRC/'AtomicWorkbenchPlatform.java').read_text(encoding='utf-8')
 platform+='\n'.join(MEMBER(text,s) for s in ['void prepareTaskOperation(','void finishTaskOperation(','void cancelPreparedTaskOperation('])
 platform+='\n void synchronizeTaskOperationBinding(AtomicWorkbenchTaskIdentity id){requireDisplayIdentity();}\n}'
 f['ls/augment/com/AtomicWorkbenchPlatform.java']=platform
 for name in OPS['MODELS']['PRODUCTION']+['AtomicWorkbenchJournal.java','AtomicWorkbenchTaskOperations.java','AtomicWorkbenchTaskShelfStore.java','AtomicWorkbenchRecoveryScope.java','AtomicWorkbenchTaskReferenceRequest.java','AtomicWorkbenchTaskReferenceResult.java','AtomicWorkbenchTaskReferenceSnapshot.java']:
  f['ls/augment/com/'+name]=(ROOT/SRC/name).read_text(encoding='utf-8')
 f['ls/augment/com/TaskOpsBridge.java']=(FIXTURES/'AtomicWorkbenchRetainedTaskCleanupDurable.java.inc').read_text(encoding='utf-8')
 f['ls/augment/com/AtomicWorkbenchProtocol.java']=f['ls/augment/com/AtomicWorkbenchProtocol.java'].replace('VERSION=1;', 'VERSION=1,WINDOW_COUNT=4;')
 n='ls/augment/com/TaskTransport.java';f[n]=f[n].replace(' public Bundle primary()',' AtomicWorkbenchTaskAuthority authority(){return actual;}\n public Bundle primary()')
 n='ls/augment/com/hook/TestTaskBroker.java';s=f[n]
 s=s.replace('if(drop){drop=false;', 'if(code==0x00D04E05&&data.values.contains("apply"))TaskOpsBridge.afterActualApply();\n    if(drop){drop=false;')
 anchor='  System.out.println("RETAINED CLEANUP RESULT "+cases+" cases; "+checks+" assertions");'
 assert s.count(anchor)==1
 s=s.replace(anchor,'''  scenario("durable","actual TaskOps Store Journal fsync-unknown before owner death and prune pressure",()->{
   for(String fault:new String[]{"store","journal"}){
    Connected c=new Connected();var identity=c.f.identity(c.f.a);android.system.Os.injectedFsyncFailures=0;
    TaskOpsBridge.run(c.f.s.mContext,c.f.endpoint,c.t,identity,()->{
     SystemClock.now=10000;var next=c.request(c.f.b,END_TASK);check(c.t.prepare(next).get("ticket") instanceof String,"real pressure prepare failed");
     check(((Map<?,?>)fld("OPERATIONS").get(null)).size()==2,"live Root receipt pruned while real durable fsync remained unknown");
    },c::dead,fault);
    check(!c.f.a.attached&&c.f.a.fronts==0,"durable cleanup reopened or foregrounded ended task");
   }
  });
  scenario("factory","actual retained factory independently enforces caller endpoint dead owner and cleanup-only limits",()->{
   Connected c=new Connected();Bundle live=c.f.endpoint.normal();
   reject(()->retainedFactory(c.f.owner,live,0,123));
   c.dead();Bundle auth=c.retainedAuth();var cached=c.f.owner;
   Binder.pid=124;reject(()->retainedFactory(cached,auth,0,123));Binder.pid=123;
   Bundle other=new Bundle(auth);other.putBinder("endpoint",new Live());reject(()->retainedFactory(cached,other,0,123));
   var cleanup=retainedFactory(cached,auth,0,123);
   check(cleanup.cleanupOnly&&!cleanup.isAlive()&&!cleanup.isCurrent(c.f.s.mContext),"cached dead owner became a current permit");
   reject(()->retainedFactory(cleanup,auth,0,123));
  });
'''+anchor)
 s=s.replace(' public static void main(String[] args)throws Throwable{', ''' static AtomicWorkbenchSystemRootAuthority.Session retainedFactory(AtomicWorkbenchSystemRootAuthority.Session cached,Bundle auth,int uid,int pid)throws Throwable{
  var m=AtomicWorkbenchSystemRootAuthority.class.getDeclaredMethod("authenticateRetainedCleanup",AtomicWorkbenchSystemRootAuthority.Session.class,Bundle.class,int.class,int.class);m.setAccessible(true);
  try{return (AtomicWorkbenchSystemRootAuthority.Session)m.invoke(null,cached,auth,uid,pid);}catch(java.lang.reflect.InvocationTargetException e){throw e.getCause();}
 }
 public static void main(String[] args)throws Throwable{''')
 s=s.replace('check(!reply.readBundle(null).getBoolean("success"),"unknown flags admitted");','check(!reply.readBundle(null).containsKey("operation_id"),"unknown flags exposed retained receipt");')
 s=s.replace('   c.wire.unsupported=true;', '   check(!c.raw("query",op(r.operationId),c.retainedAuth(),18,c.f.s).containsKey("operation_id"),"forbidden query exposed retained receipt");\n   c.wire.unsupported=true;')
 s=s.replace('  System.out.println("RETAINED CLEANUP RESULT "+cases+" cases; "+checks+" assertions");', r'''  scenario("oneway","non-null framework reply never admits one-way/null-reply native cleanup",()->{
   Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.f.endpoint.close();c.f.app.die();c.f.s.mContext.resolver.fail=true;
   check(c.f.a.mForceHiddenFlags==2,"pending owner-death callback already ran");
   for(int flags:new int[]{1,3,17,19}){Parcel reply=Parcel.obtain();invoke("handleRetainedCleanup",new Class<?>[]{Object.class,Parcel.class,Parcel.class,int.class},c.f.s,packet("release",op(r.operationId),c.retainedAuth()),reply,flags);check(reply.values.isEmpty()&&c.f.a.mForceHiddenFlags==2,"one-way caused cleanup or wrote reply");}
   invoke("handleRetainedCleanup",new Class<?>[]{Object.class,Parcel.class,Parcel.class,int.class},c.f.s,packet("release",op(r.operationId),c.retainedAuth()),null,16);
   check(c.f.a.mForceHiddenFlags==2,"null reply admitted synchronous cleanup");
   check(clean(c.t.release(r.operationId))&&c.f.a.mForceHiddenFlags==0,"real synchronous cleanup failed");
  });
  System.out.println("RETAINED CLEANUP RESULT "+cases+" cases; "+checks+" assertions");''')
 s=s.replace('check(!c.raw("cleanup",new Bundle(),c.retainedAuth(),16,new Service()).getBoolean("success"),"foreign WMS borrowed cache");','Service alias=new Service();alias.mRoot=c.f.s.mRoot;check(!c.raw("cleanup",new Bundle(),c.retainedAuth(),16,alias).getBoolean("success"),"foreign WMS borrowed cache");')
 s=s.replace('check(!c.raw("release",op(r.operationId),b,16,c.f.s).getBoolean("success"),"principal substitution admitted "+key);','check(!c.raw("release",op(r.operationId),b,16,c.f.s).containsKey("operation_id"),"principal substitution exposed retained receipt "+key);')
 f[n]=s
 return f

def run(out,source,mutations=None,case=None):
 out.mkdir(exist_ok=False,parents=True);f=files(source)
 for n,old,new in mutations or []:
  assert f[n].count(old)==1,(n,old,f[n].count(old));f[n]=f[n].replace(old,new,1)
 inputs=[]
 for n,s in f.items():
  p=out/'src'/n;write(p,s);inputs.append(item(p))
 paths=[str(out/'src'/n) for n in f];classes=out/'classes';classes.mkdir();data=out/'data';data.mkdir()
 cmd=[JAVAC,'-J-Duser.language=en','-J-Dfile.encoding=UTF-8','-encoding','UTF-8','--release','17','-cp',str(JAR),'-d',str(classes),*paths]
 cp=subprocess.run(cmd,capture_output=True,timeout=90)
 with (out/'compile.stdout.raw').open('xb') as f:f.write(cp.stdout)
 with (out/'compile.stderr.raw').open('xb') as f:f.write(cp.stderr)
 cp.stdout=cp.stdout.decode('utf-8',errors='replace');cp.stderr=cp.stderr.decode('utf-8',errors='replace')
 write(out/'compile.stdout.txt',cp.stdout);write(out/'compile.stderr.txt',cp.stderr)
 result=dict(compileExit=cp.returncode,runtimeExit=None,sourceInputs=inputs,compileCommand=cmd)
 if cp.returncode==0:
  command=[JAVA,'-Dfile.encoding=UTF-8','-Dtest.data='+str(data),'-cp',str(classes)+os.pathsep+str(JAR),'ls.augment.com.hook.TestTaskBroker']+([case] if case else [])
  rp=subprocess.run(command,capture_output=True,timeout=60)
  with (out/'runtime.stdout.raw').open('xb') as f:f.write(rp.stdout)
  with (out/'runtime.stderr.raw').open('xb') as f:f.write(rp.stderr)
  rp.stdout=rp.stdout.decode('utf-8',errors='replace');rp.stderr=rp.stderr.decode('utf-8',errors='replace')
  write(out/'runtime.stdout.txt',rp.stdout);write(out/'runtime.stderr.txt',rp.stderr)
  result.update(runtimeExit=rp.returncode,runtimeCommand=command)
  match=re.search(r'RETAINED CLEANUP RESULT (\d+) cases; (\d+) assertions',rp.stdout)
  if match:result.update(cases=int(match[1]),assertions=int(match[2]))
 write(out/'result.json',json.dumps(result,indent=2));return result

CONTROLS = [
    ('actual Binder PID independently checked by retained factory', 'factory', [
        (AUTH_OWNER,
         '|| Binder.getCallingUid() != callerUid || Binder.getCallingPid() != callerPid\n                    || cached == null',
         '|| Binder.getCallingUid() != callerUid\n                    || cached == null'),
    ]),
    ('original token exact equality', 'principal', [
        (AUTH_OWNER,
         '!cached.authentication.getString("token").equals(frozen.getString("token"))',
         'false'),
    ]),
    ('original endpoint exact equality independently checked', 'factory', [
        (AUTH_OWNER,
         '!cached.endpoint.equals(frozen.getBinder("endpoint"))',
         'false'),
    ]),
    ('system factory actual dead owner at both boundaries', 'factory', [
        (AUTH_OWNER,
         'cached == null || cached.cleanupOnly || cached.owner.isBinderAlive()',
         'cached == null || cached.cleanupOnly'),
        (AUTH_OWNER,
         'if (cached.owner.isBinderAlive() || !cached.endpoint.isBinderAlive())',
         'if (!cached.endpoint.isBinderAlive())'),
    ]),
    ('cleanup-only credential cannot bootstrap another retained principal', 'factory', [
        (AUTH_OWNER,
         'cached == null || cached.cleanupOnly || cached.owner.isBinderAlive()',
         'cached == null || cached.owner.isBinderAlive()'),
    ]),
    ('exact original operation owner instead of inherited foreign cleanup', 'foreign', [
        (HOOK_OWNER,
         'if (op == null || !sameOwner(op.owner, session)) throw new SecurityException();',
         'if (op == null) throw new SecurityException();'),
    ]),
    ('Watch retained until original Root endpoint actually dies', 'dead-owner', [
        (HOOK_OWNER,
         'if (!retry && !session.endpoint.isBinderAlive())',
         'if (!retry && !session.isAlive())'),
    ]),
    ('live app real fsync unknown receipts protected before later owner death', 'durable', [
        (HOOK_OWNER,
         '!old.held && !old.cleanup && !old.owner.endpoint.isBinderAlive()',
         '!old.held && !old.cleanup'),
    ]),
    ('native synchronous flags reject actual one-way before cleanup', 'oneway', [
        (HOOK_OWNER,
         '(flags & ~0x12) != 0',
         'false'),
    ]),
    ('nonnull reply required for synchronous native cleanup', 'oneway', [
        (HOOK_OWNER,
         '(flags & ~0x12) != 0 || reply == null || data == null',
         '(flags & ~0x12) != 0 || data == null'),
    ]),
    ('retained action allowlist excludes even exact operation query', 'actions', [
        (HOOK_OWNER,
         '\n                    || !("cleanup".equals(action) || "release".equals(action) || "cancel".equals(action))',
         ''),
    ]),
    ('same WMS object cannot be substituted by alias sharing task tree', 'principal', [
        (HOOK_OWNER,
         'cached == null || cached.service != service',
         'cached == null'),
    ]),
    ('missing old record is not a synthetic complete per-record receipt', 'cache', [
        (HOOK_OWNER,
         'if (op == null || !sameOwner(op.owner, session)) throw new SecurityException();',
         'if (op == null) { result = rejected("mutant_missing_complete"); result.putBoolean("cleanup_complete", true); result.putBoolean("cleanup_pending", false); result.putBoolean("hidden_lease", false); reply.writeNoException(); reply.writeInt(1); reply.writeString(nonce); reply.writeBundle(result); return; }\n                    if (!sameOwner(op.owner, session)) throw new SecurityException();'),
    ]),
]

def main():
 p=argparse.ArgumentParser(description=__doc__)
 p.add_argument('--root',type=Path,default=Path(__file__).resolve().parents[1])
 p.add_argument('--root-source',type=Path);p.add_argument('--task-authority-source',type=Path)
 p.add_argument('--system-authority-source',type=Path);p.add_argument('--task-hook-source',type=Path)
 p.add_argument('--baseline-root',type=Path,help='Optional explicit source-layout root requiring the original compiled runtime red.')
 p.add_argument('--out',type=Path);p.add_argument('--negative-controls',action='store_true');a=p.parse_args();initialize(a.root)
 selected={n:(value if value is not None else ROOT/SRC/n).resolve() for n,value in zip(SOURCE_NAMES,[a.root_source,a.task_authority_source,a.system_authority_source,a.task_hook_source])}
 out=a.out.resolve() if a.out else Path(tempfile.mkdtemp(prefix='duo-retained-task-cleanup-')).resolve()
 if a.out:out.mkdir(parents=True,exist_ok=False)
 dependency_names=OPS['MODELS']['PRODUCTION']+['AtomicWorkbenchJournal.java','AtomicWorkbenchTaskOperations.java','AtomicWorkbenchTaskShelfStore.java','AtomicWorkbenchRecoveryScope.java','AtomicWorkbenchTaskReferenceRequest.java','AtomicWorkbenchTaskReferenceResult.java','AtomicWorkbenchTaskReferenceSnapshot.java','AtomicWorkbenchPlatform.java','AtomicWorkbenchProvider.java','AtomicWorkbenchProtocol.java']
 dependencies=[ROOT/SRC/n for n in dependency_names]
 dependencies += [ROOT/'tools'/n for n in ['test-atomic-workbench-task-broker.py','test-atomic-workbench-system-root-authority.py','test-atomic-workbench-task-operations.py','test-atomic-workbench-task-shelf-store.py','test-atomic-workbench-task-models.py','test-atomic-workbench-lifecycle.py','test-atomic-workbench-home-hook.py']]
 dependencies += [Path(__file__).resolve(),*sorted(FIXTURES.glob('AtomicWorkbenchRetainedTaskCleanup*.java.inc')),JAR]
 before=[item(p) for p in list(selected.values())+dependencies]
 summary=dict(status='FAIL_OR_INCOMPLETE',sources={n:item(p) for n,p in selected.items()},before=before,results={},negativeControls=[],runtimePhoneProof=False,
  boundary='Actual complete TaskAuthority/SystemRootAuthority/TaskHook/TaskOps/Store/Journal/models; exact extracted Root metadata and three Platform task-journal methods. Android Binder/Parcel/nativeOR16/optional2, WM Task/Handler, Engine ordinary admission and Unix metadata/directory-fsync errors are controlled. Real file/CAS/rename/FileDescriptor IO and file fsync execute; no Xposed installation, real kernel Binder, whole Engine/Root exit or phone claim.')
 try:
  if a.baseline_root:
   baseline={n:(a.baseline_root.resolve()/SRC/n) for n in SOURCE_NAMES};r=run(out/'baseline',baseline,case='dead-owner');summary['results']['baseline']=r
   assert r['compileExit']==0 and r['runtimeExit'] not in (None,0)
   assert 'AssertionError: original owned nonempty cleanup did not converge' in (out/'baseline/runtime.stderr.txt').read_text(encoding='utf-8')
  r=run(out/'positive',selected);summary['results']['positive']=r
  assert r['compileExit']==0 and r['runtimeExit']==0
  if a.negative_controls:
   for i,(label,case,mutations) in enumerate(CONTROLS,1):
    result=run(out/f'negative-{i:02d}',selected,mutations,case)
    row=dict(label=label,case=case,compileExit=result['compileExit'],runtimeExit=result['runtimeExit']);summary['negativeControls'].append(row)
    assert result['compileExit']==0 and result['runtimeExit'] not in (None,0),label
    assert 'AssertionError' in (out/f'negative-{i:02d}/runtime.stderr.txt').read_text(encoding='utf-8'),label
    row['status']='KILLED_COMPILED_RUNTIME_ASSERTION'
  summary['status']='PASS_FINITE_ACTUAL_RETAINED_CLEANUP_AND_DURABLE_CHAIN'
 except BaseException as failure:
  summary['failure']=dict(type=type(failure).__name__,traceback=traceback.format_exc());raise
 finally:
  summary['after']=[item(p) for p in list(selected.values())+dependencies];summary['sourceAndDependenciesStable']=before==summary['after']
  if not summary['sourceAndDependenciesStable']:summary['status']='FAIL_INPUTS_CHANGED'
  write(out/'summary.json',json.dumps(summary,indent=2))
 print(json.dumps(dict(status=summary['status'],cases=r.get('cases'),recordedMainAssertions=r.get('assertions'),negativeControls=len(summary['negativeControls']),sourceAndDependenciesStable=summary['sourceAndDependenciesStable'],summary=item(out/'summary.json'))))
 return 0 if summary['status']=='PASS_FINITE_ACTUAL_RETAINED_CLEANUP_AND_DURABLE_CHAIN' else 1
if __name__=='__main__':raise SystemExit(main())
