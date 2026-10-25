"""Real TaskOps/Store and extracted Root/Engine close chain; controlled Android/WM boundaries."""
from pathlib import Path
import hashlib,json,runpy,subprocess,os,sys
sys.dont_write_bytecode=True
import argparse,tempfile
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--root',type=Path,default=Path(__file__).resolve().parents[1],help='Repository root; override only for running an external tool draft.')
parser.add_argument('--taskops-source',type=Path)
parser.add_argument('--baseline-source',type=Path,help='Optional explicit old source: require a compiled runtime red; never inferred from an audit folder.')
parser.add_argument('--out',type=Path)
parser.add_argument('--negative-controls',action='store_true')
args=parser.parse_args();ROOT=args.root.resolve();SRC=ROOT/'android/app/src/main/java/ls/augment/com'
TASKOPS=(args.taskops_source or SRC/'AtomicWorkbenchTaskOperations.java').resolve()
OUT=args.out.resolve() if args.out else Path(tempfile.mkdtemp(prefix='duo-root-empty-cleanup-')).resolve()
HERE=OUT
OPS=runpy.run_path(str(ROOT/'tools/test-atomic-workbench-task-operations.py'))
LIFE=runpy.run_path(str(ROOT/'tools/test-atomic-workbench-lifecycle.py'))
M=OPS['MODELS'];member=LIFE['member']
def item(p):
 b=p.read_bytes();return dict(path=str(p.resolve()),bytes=len(b),sha256=hashlib.sha256(b).hexdigest().upper())
def save(p,v):
 with p.open('x',encoding='utf-8') as f:json.dump(v,f,indent=2);f.write('\n')
original=args.baseline_source.read_text(encoding='utf-8') if args.baseline_source else None
candidate=TASKOPS.read_text(encoding='utf-8')
ROOT_CODE=(SRC/'AtomicWorkbenchRoot.java').read_text(encoding='utf-8')
ENGINE_CODE=(SRC/'AtomicWorkbenchEngine.java').read_text(encoding='utf-8')
root_methods=[member(ROOT_CODE,s) for s in ('private Bundle systemSessionMetadata()', 'private Bundle closeOnce()',
 'private void requestRecovery(String reason)', 'private synchronized void scheduleRecovery()',
 'private void finishLater()', 'private final Runnable recover =')]
root_methods[-1]+=';'
engine_methods=[member(ENGINE_CODE,s) for s in ('Bundle close(boolean focusPrimaryHome)', 'boolean hasRecoveryPending()')]

TEST=OPS['TEST'].split(' public static void main(String[]args)',1)[0]+r'''
 static final class Chain {
  final Fixture f=new Fixture();final RootClose root=new RootClose();
  Chain()throws Exception {Handler.mainPosts=0;AtomicWorkbenchPlatform.fullCloses=0;f.engine.taskController=f.owner;root.backend=f.engine;f.authority.root=root;}
  void dead(){((RootClose.Live)root.owner).alive=false;}
  void recover(){root.request("owner_died");root.tick();}
 }
 static void sticky(Object o,boolean v)throws Exception {var field=AtomicWorkbenchTaskOperations.class.getDeclaredField("storageUncertain");field.setAccessible(true);field.setBoolean(o,v);}
 public static void main(String[]args)throws Exception {root=Path.of(args[0]);
  test("fresh empty never-prepared scope closes through actual Root recovery without dead-owner metadata",()->{
   Chain x=new Chain();x.dead();x.recover();check(x.root.finished,"empty dead-owner scope cannot finish Root");
   check(!x.f.owner.hasPending()&&x.f.authority.cleanupCalls==0&&x.f.authority.authCalls==0,"empty scope manufactured a broker cleanup or stayed pending");
   check(x.root.finishes==1&&Handler.mainPosts==1&&AtomicWorkbenchPlatform.fullCloses==5,"actual Engine/finish lane omitted window cleanup or final exit scheduling");
  });
  test("lost remote prepare before Store persistence remains sticky even with a fresh empty Store",()->{
   Chain x=new Chain();x.f.authority.prepareReplyLost=true;x.f.owner.change(x.f.request(SHELVE,x.f.task).toBundle());
   check(x.f.authority.prepares==1&&x.f.store.read().records.isEmpty(),"lost prepare breakpoint not reached before Store");
   x.dead();x.recover();check(!x.root.finished&&x.f.owner.hasPending()&&x.f.authority.cleanupCalls==1&&x.f.authority.authCalls==1,"lost remote prepare was discarded as clean empty");
   check(x.root.recoveryAttempt==1&&x.root.retryDelay()==2000L&&AtomicWorkbenchPlatform.fullCloses==5,"pending task blocked original window close or bypassed retry");
   ((RootClose.Live)x.root.owner).alive=true;x.f.authority.prepareReplyLost=false;x.root.tick();
   check(x.root.finished&&!x.f.owner.hasPending()&&x.f.authority.cleanupCalls==2,"confirmed original broker cleanup did not converge");
  });
  test("uncertain write cannot be retired by an otherwise empty scope",()->{
   Chain x=new Chain();sticky(x.f.owner,true);x.dead();x.recover();
   check(!x.root.finished&&x.f.owner.hasPending()&&x.f.authority.cleanupCalls==1,"storage uncertainty skipped broker confirmation");
  });
  test("fresh read failure remains unknown and never reaches empty fastpath",()->{
   Chain x=new Chain();x.f.store.save(0,List.of());Path ledger=Path.of(x.f.c.pm.info.dataDir,"files","atomic_workbench","task-shelf.json");
   Files.writeString(ledger,"{malformed");byte[] raw=Files.readAllBytes(ledger);x.dead();x.recover();
   check(!x.root.finished&&x.f.owner.storageScopeUnverified()&&x.f.owner.hasPending()&&x.f.authority.cleanupCalls==0,"unreadable scope became empty clean");
   check(Arrays.equals(raw,Files.readAllBytes(ledger))&&AtomicWorkbenchPlatform.fullCloses==5,"unknown ledger was rewritten or task migration skipped");
  });
  test("real durable HELD responsibility survives dead owner and retains unchanged Store bytes",()->{
   Chain x=new Chain();check(x.f.change(SHELVE,x.f.task).getBoolean("success"),"setup real shelve failed");
   Path ledger=Path.of(x.f.c.pm.info.dataDir,"files","atomic_workbench","task-shelf.json");byte[] raw=Files.readAllBytes(ledger);x.dead();x.recover();
   check(!x.root.finished&&x.f.owner.hasPending()&&x.f.store.read().records.get(0).hasResponsibility(),"dead owner cleared held lease");
   check(Arrays.equals(raw,Files.readAllBytes(ledger))&&AtomicWorkbenchPlatform.fullCloses==5,"dead owner changed durable responsibility or blocked window close");
  });
  test("nonempty terminal history keeps the original global cleanup acknowledgement",()->{
   Chain x=new Chain();check(x.f.change(SHELVE,x.f.task).getBoolean("success"),"setup failed");
   check(x.f.owner.cleanup().getBoolean("success"),"setup cleanup failed");
   check(!x.f.store.read().records.isEmpty()&&!x.f.store.read().records.get(0).hasResponsibility(),"terminal fixture missing");
   int calls=x.f.authority.cleanupCalls;x.dead();x.recover();check(!x.root.finished&&x.f.owner.hasPending()&&x.f.authority.cleanupCalls==calls+1,"nonempty terminal broker receipt bypassed");
  });
  test("existing owner metadata still rejects dead unregistered finished and incomplete credentials",()->{
   RootClose r=new RootClose();check(r.auth().getLong("session",-1)==7,"actual metadata missing");
   ((RootClose.Live)r.owner).alive=false;try{r.auth();throw new AssertionError("dead owner accepted");}catch(SecurityException expected){checks++;}
   ((RootClose.Live)r.owner).alive=true;r.registered=false;try{r.auth();throw new AssertionError("unregistered accepted");}catch(SecurityException expected){checks++;}
   r.registered=true;r.finished=true;try{r.auth();throw new AssertionError("finished accepted");}catch(SecurityException expected){checks++;}
  });
  System.out.println("EMPTY ROOT CLEANUP RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''

def sources():
 s=dict(OPS['SOURCES'])
 authority=s['ls/augment/com/AtomicWorkbenchTaskAuthority.java']
 authority=authority.replace(' int applies,prepares;', ' RootClose root;boolean prepareReplyLost;int cleanupCalls,authCalls; int applies,prepares;')
 authority=authority.replace('Bundle prepare(AtomicWorkbenchTaskOperationRequest r){prepares++;requests.put(r.operationId,r);', 'Bundle prepare(AtomicWorkbenchTaskOperationRequest r)throws Exception {prepares++;requests.put(r.operationId,r);if(prepareReplyLost)throw new Exception("controlled remote prepared but reply lost");')
 authority=authority.replace('Bundle cleanup(){Bundle b=base();', 'Bundle cleanup()throws Exception {cleanupCalls++;if(root!=null){authCalls++;root.auth();}Bundle b=base();')
 s['ls/augment/com/AtomicWorkbenchTaskAuthority.java']=authority
 e=s['ls/augment/com/AtomicWorkbenchEngine.java'].replace('import android.os.*;', 'import android.os.*;import java.util.ArrayList;');e=e.rstrip()[:-1]+r'''
 TaskController taskController;final AtomicWorkbenchPlatform legacy=new AtomicWorkbenchPlatform(-1);int activeWindow=-1,focusedWindow=-2,unusedObservation;boolean[] recovering=new boolean[4];long inputRevision;
 boolean taskStorageUnverified(){return taskController!=null&&taskController.storageScopeUnverified();}
 Bundle restoreHomes(int ignored,boolean restore){return null;}Bundle decorate(int id,Bundle b){return new Bundle(b);}
 void describeTaskBackend(Bundle b){}Bundle close(){return close(false);}
'''+'\n'.join(engine_methods)+'\n}'
 # Count the legacy closure as well; four decorate calls cover normal slots.
 assert engine_methods[0] in e and engine_methods[1] in e
 # This injected counter is observation only. Store an exact extracted copy separately below.
 s['ls/augment/com/AtomicWorkbenchEngine.java']=e
 p=s['ls/augment/com/AtomicWorkbenchPlatform.java'];p=p.rstrip()[:-1]+r'''
 static int fullCloses;boolean hasRecoveryPending(){return false;}boolean physicalHomeReturned(){return false;}
 Bundle close(){fullCloses++;live=false;Bundle b=new Bundle();b.putBoolean("success",true);b.putBoolean("recovery_pending",false);return b;}
 Bundle focusPrimaryHome(){return close();}Bundle status(){Bundle b=new Bundle();b.putBoolean("success",true);return b;}
}''';s['ls/augment/com/AtomicWorkbenchPlatform.java']=p
 s['android/os/Bundle.java']=s['android/os/Bundle.java'].rstrip()[:-1]+'public String getString(String k,String fallback){String v=getString(k);return v==null?fallback:v;}}'
 s['ls/augment/com/AtomicWorkbenchProtocol.java']=s['ls/augment/com/AtomicWorkbenchProtocol.java'].replace('WINDOW_COUNT=4','WINDOW_COUNT=4,VERSION=1')
 s['android/os/Process.java']='package android.os;public class Process{public static int myPid(){return 999;}}'
 s['android/os/Looper.java']='package android.os;public class Looper{public static final Looper worker=new Looper(),main=new Looper();public static Looper myLooper(){return worker;}public static Looper getMainLooper(){return main;}}'
 s['android/os/Handler.java']=r'''package android.os;import java.util.*;public class Handler{final Looper lane;public final Map<Runnable,Long> waiting=new LinkedHashMap<>();public static int mainPosts;public Handler(){lane=Looper.worker;}public Handler(Looper l){lane=l;}public Looper getLooper(){return lane;}public boolean post(Runnable r){waiting.put(r,0L);return true;}public boolean postDelayed(Runnable r,long ms){if(lane==Looper.main)mainPosts++;else waiting.put(r,ms);return true;}public void removeCallbacks(Runnable r){waiting.remove(r);}}'''
 s['android/os/Binder.java']='package android.os;public class Binder{public static long clearCallingIdentity(){return 0;}public static void restoreCallingIdentity(long x){}}'
 diag=s['ls/augment/com/AtomicWorkbenchDiagnostics.java'];s['ls/augment/com/AtomicWorkbenchDiagnostics.java']=diag.rstrip()[:-1]+'public static boolean flush(long t){return true;}}'
 s['ls/augment/com/RootClose.java']=r'''package ls.augment.com;import android.os.*;import android.os.Process;
final class RootClose implements IBinder {public void linkToDeath(IBinder.DeathRecipient r,int f){}
 static final class Live implements IBinder{boolean alive=true;public void linkToDeath(IBinder.DeathRecipient r,int f){}public boolean isBinderAlive(){return alive;}}
 IBinder owner=new Live();boolean registered=true,finished,closing,focusPrimaryHomeOnClose,extractionGeometryCleanupPending;
 long providerSession=7,providerResetGeneration=2;int appUid=10055,userId,recoveryAttempt,finishes;String token="a".repeat(64),closeReason="none";
 AtomicWorkbenchEngine backend;final Handler engine=new Handler();final Runnable maintainWindows=()->{},checkOwner=()->{};
 final Quit engineThread=new Quit();static class Quit{void quitSafely(){}}static class Optional{void close(){}void maintain(){}}
 Optional pasteHost,media,notifications;void clearInputs(){}void clearExtractionGeometry(){}void ensureTaskBackend(boolean explicit){}AtomicWorkbenchEngine backend(){return backend;}
 void lifecycle(String event,String detail,Throwable error){if(event.equals("ROOT_FINISH"))finishes++;}
 static Bundle failureState(Throwable error,boolean pending){Bundle b=new Bundle();b.putBoolean("success",false);b.putBoolean("recovery_pending",pending);return b;}
 public boolean isBinderAlive(){return !finished;}Bundle auth()throws Exception{return systemSessionMetadata();}
 void request(String reason){requestRecovery(reason);}void tick(){engine.waiting.remove(recover);recover.run();}long retryDelay(){return engine.waiting.getOrDefault(recover,-1L);}
'''+'\n'.join(root_methods)+'\n}'
 s['ls/augment/com/TestTaskOperations.java']=TEST
 return s

PRODUCTION=M['PRODUCTION']+['AtomicWorkbenchTaskShelfStore.java','AtomicWorkbenchRecoveryScope.java','AtomicWorkbenchTaskReferenceRequest.java','AtomicWorkbenchTaskReferenceResult.java','AtomicWorkbenchTaskReferenceSnapshot.java']
JAR=next((Path.home()/'.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/*.jar'))
def execute(out,body,test_override=None,base_override=None):
 out.mkdir();data=out/'data';data.mkdir();s=base_override if base_override is not None else sources();s=dict(s)
 s['ls/augment/com/AtomicWorkbenchTaskOperations.java']=body
 if test_override is not None:s['ls/augment/com/TestTaskOperations.java']=test_override
 for name in PRODUCTION:s['ls/augment/com/'+name]=(SRC/name).read_text(encoding='utf-8')
 for rel,txt in s.items():
  p=out/'src'/rel;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(txt,encoding='utf-8')
 paths=[str(p) for p in (out/'src').rglob('*.java')]
 command=[M['JAVAC'],'-J-Dfile.encoding=UTF-8','-J-Dstdout.encoding=UTF-8','-J-Dstderr.encoding=UTF-8','-J-Duser.language=en','--release','17','-encoding','UTF-8','-cp',str(JAR),'-d',str(out/'classes'),*paths]
 save(out/'launch.json',dict(command=command,source=item(TASKOPS),controlledRemote=base_override is None))
 a=subprocess.run(command,cwd=ROOT,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=90)
 (out/'compile-stdout.txt').write_bytes(a.stdout);(out/'compile-stderr.txt').write_bytes(a.stderr)
 result=dict(compileExit=a.returncode,runtimeExit=None)
 if not a.returncode:
  b=subprocess.run([M['JAVA'],'-Dfile.encoding=UTF-8','-cp',str(out/'classes')+os.pathsep+str(JAR),'ls.augment.com.TestTaskOperations',str(data)],cwd=ROOT,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=90)
  (out/'stdout.txt').write_bytes(b.stdout);(out/'stderr.txt').write_bytes(b.stderr);result['runtimeExit']=b.returncode
 save(out/'result.json',result);return result

def main():
 out=OUT
 if args.out:out.mkdir(parents=True,exist_ok=False)
 inputs=[TASKOPS,SRC/'AtomicWorkbenchRoot.java',SRC/'AtomicWorkbenchEngine.java']+[SRC/n for n in PRODUCTION]
 inputs+=list((ROOT/'tools').glob('*.py'))
 before=[item(p) for p in inputs]
 result=dict(status='RUNNING',runtimePhoneProof=False,wholeRootBinderProof=False,
  boundary='Actual full TaskOps/Store/models and exact extracted Root metadata/closeOnce/requestRecovery/scheduleRecovery/recover/finishLater plus Engine close/hasRecoveryPending. Android scheduling/syscalls, no-HOME Platform outcomes and remote authority are controlled boundaries; no real Binder or process exit.',
  baseline=None,positive=None,negativeControls=[],inputsBefore=before)
 try:
  if original is not None:
   r=execute(out/'explicit-baseline-red',original);result['baseline']=r
   assert r['compileExit']==0 and r['runtimeExit']!=0 and b'empty dead-owner scope cannot finish Root' in (out/'explicit-baseline-red/stderr.txt').read_bytes(),'explicit baseline did not compile and reproduce the empty-owner assertion'
  r=execute(out/'positive',candidate);result['positive']=r
  assert r==dict(compileExit=0,runtimeExit=0),'positive failed; retain actual compile/runtime logs'
  if args.negative_controls:
   controls=[
    ('lost prepare sticky', '            brokerCleanupRequired = true; // Set before the call, including a lost/rejected reply.\n',''),
    ('uncertain empty broker ack', 'brokerCleanupRequired || !snapshot.records.isEmpty() || storageUncertain','brokerCleanupRequired || !snapshot.records.isEmpty()'),
    ('fresh complete read', '            snapshot = readStore();\n            for (Record record : snapshot.records) hadResponsibility', '            /* negative: cached snapshot */\n            for (Record record : snapshot.records) hadResponsibility'),
   ]
   for i,(label,old,new) in enumerate(controls):
    assert candidate.count(old)==1,label
    r=execute(out/f'negative-{i+1}',candidate.replace(old,new,1));killed=r['compileExit']==0 and r['runtimeExit']!=0 and b'AssertionError' in (out/f'negative-{i+1}/stderr.txt').read_bytes()
    result['negativeControls'].append(dict(label=label,**r,killed=killed));assert killed,label
  result['sourceStable']=before==[item(p) for p in inputs];assert result['sourceStable']
  result['status']='PASS_ROOT_EMPTY_SCOPE_CLEANUP_HOST_REGRESSION'
 except BaseException as error:
  result['status']='FAIL_ROOT_EMPTY_SCOPE_CLEANUP_HOST_REGRESSION';result['failureType']=type(error).__name__;raise
 finally:
  save(out/'summary.json',result);print(json.dumps(dict(status=result['status'],out=str(out),summary=item(out/'summary.json'))))
if __name__=='__main__':main()
