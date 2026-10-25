"""Couple actual Engine.inject and Root geometry callback over a controlled native input boundary."""
from pathlib import Path
import runpy
import sys
if hasattr(sys.stdout,'reconfigure'):sys.stdout.reconfigure(encoding='utf-8')

F=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-extraction-root-fence.py')))
bundle=F['BASE']['STUBS']['android/os/Bundle.java']
F['BASE']['STUBS']['android/os/Bundle.java']=bundle.replace('public boolean getBoolean',
    'public boolean getBoolean(String k){return getBoolean(k,false);}public boolean getBoolean',1)
source=(F['JAVA']['SRC']/'AtomicWorkbenchEngine.java').read_text(encoding='utf-8')
member=F['MEMBER']
methods=member(source,'boolean inject(int id, MotionEvent event)')
if 'long extractionGeometryInputRevision(' in source:
    methods+='\n'+member(source,'long extractionGeometryInputRevision(')
    methods+='\n'+member(source,'private static final class ExtractionInputDown')
    fields='private volatile ExtractionInputDown extractionInputDown;'
else:fields=''
engine='''
final class MotionEvent {static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3;final int action,count;final long down;int pointer,device=4;
 MotionEvent(int a,int c,long d){action=a;count=c;down=d;}int getActionMasked(){return action;}int getPointerCount(){return count;}long getDownTime(){return down;}int getPointerId(int index){return pointer;}int getDeviceId(){return device;}}
final class AtomicWorkbenchPlatform {boolean ready=true,accepted=true,throwsInput;Runnable onInject;int calls;
 boolean readyForInput(){return ready;}Bundle focusWindow(){Bundle b=new Bundle();b.putBoolean("success",true);return b;}
 boolean inject(MotionEvent e){calls++;if(onInject!=null)onInject.run();if(throwsInput)throw new IllegalStateException("native");return accepted;}boolean inputBackendFailed(){return !accepted;}}
final class AtomicWorkbenchEngine {volatile long inputRevision=5;volatile int activeWindow=2,focusedWindow=2;volatile boolean uiParked;int reads,onReadAt=1;Runnable onRead;
 interface Controller{boolean blocksWindow(int id);}Controller taskController;final boolean[]recovering=new boolean[8];final AtomicWorkbenchPlatform[]windows=new AtomicWorkbenchPlatform[8];
 AtomicWorkbenchEngine(){for(int i=0;i<8;i++)windows[i]=new AtomicWorkbenchPlatform();}boolean valid(int id){return id>=0&&id<8;}
 long inputRevision(){long result=inputRevision;reads++;if(onRead!=null&&reads>=onReadAt){Runnable action=onRead;onRead=null;action.run();}return result;}
 int activeInputWindow(){return activeWindow;}boolean uiParked(){return uiParked;}
'''+fields+methods+'}\n'
old=F['HEAD'];begin=old.index('final class AtomicWorkbenchEngine');end=old.index('public final class AtomicWorkbenchRoot')
head=old[:begin]+engine+old[end:]
tests=F['TEST'].replace('root.backend.revision','root.backend.inputRevision').replace('root.backend.active','root.backend.activeWindow').replace('root.backend.parked','root.backend.uiParked')
extra='''
  test("actual accepted source DOWN keeps only its own pre-DOWN geometry alive",()->{
    check(root.backend.inject(2,new MotionEvent(0,1,900)),"native DOWN not injected");
    check(root.backend.inputRevision==6,"real input revision was not preserved");check(probe(),"source DOWN invalidated its own extraction geometry");});
  test("later non-touch input still invalidates the original geometry",()->{root.backend.inject(2,new MotionEvent(0,1,900));root.backend.inputRevision++;check(!probe(),"later input reused old extraction geometry");});
  test("native UP and CANCEL revoke the active source DOWN",()->{root.backend.inject(2,new MotionEvent(0,1,900));root.backend.inject(2,new MotionEvent(1,1,900));check(!probe(),"ended input retained extraction geometry");});
  test("second DOWN cannot borrow the previous geometry epoch",()->{root.backend.inject(2,new MotionEvent(0,1,900));root.backend.inject(2,new MotionEvent(0,1,950));check(!probe(),"new DOWN borrowed old geometry");});
  test("failed native DOWN never owns geometry",()->{root.backend.windows[2].accepted=false;root.backend.inject(2,new MotionEvent(0,1,900));check(!probe(),"failed native DOWN owned geometry");});
  test("native exception revokes its pending source DOWN",()->{root.backend.windows[2].throwsInput=true;try{root.backend.inject(2,new MotionEvent(0,1,900));}catch(IllegalStateException expected){}check(!probe(),"throwing native DOWN owned geometry");});
  test("multi-pointer DOWN never lends an epoch",()->{root.backend.inject(2,new MotionEvent(0,2,900));check(!probe(),"multiple pointers borrowed geometry");});
  test("wrong downTime MOVE revokes source ownership",()->{root.backend.inject(2,new MotionEvent(0,1,900));root.backend.inject(2,new MotionEvent(2,1,901));check(!probe(),"different stream borrowed geometry");});
  test("same-stream MOVE preserves the one owned native DOWN",()->{root.backend.inject(2,new MotionEvent(0,1,900));root.backend.inject(2,new MotionEvent(2,1,900));check(probe(),"same stream lost extraction geometry");});
  test("reentrant system metadata query can see the same pending native DOWN",()->{root.backend.windows[2].onInject=()->check(probe(),"same in-flight native DOWN lost geometry");root.backend.inject(2,new MotionEvent(0,1,900));});
  test("CANCEL revokes even when native platform is no longer ready",()->{root.backend.inject(2,new MotionEvent(0,1,900));root.backend.windows[2].ready=false;root.backend.inject(2,new MotionEvent(3,1,900));check(!probe(),"not-ready cancel retained source geometry");});
  test("pointer or device replacement cannot borrow the old native DOWN",()->{root.backend.inject(2,new MotionEvent(0,1,900));MotionEvent move=new MotionEvent(2,1,900);move.pointer=3;root.backend.inject(2,move);check(!probe(),"replacement pointer retained geometry");});
  test("source DOWN ending during the second system sample revokes geometry",()->{root.backend.inject(2,new MotionEvent(0,1,900));root.backend.onReadAt=2;root.backend.onRead=()->root.backend.inject(2,new MotionEvent(1,1,900));check(!probe(),"mid-probe ended DOWN retained geometry");});
'''
tests=tests.replace('  System.out.println("EXTRACTION ROOT FENCE RESULT',extra+'  System.out.println("EXTRACTION ROOT FENCE RESULT')
run=F['run'];run.__globals__['HEAD']=head;run.__globals__['TEST']=tests
result=run(F['ROOT_SOURCE'].read_text(encoding='utf-8'),F['FENCE_SOURCE'].read_text(encoding='utf-8'),'actual touch/fence coupling')
print(result.stdout,end='')
if result.returncode:raise SystemExit(result.stderr)
original_root=F['ROOT_SOURCE'].read_text(encoding='utf-8')
# Mutate only actual production members, leaving the native-input boundary and assertions intact.
mutations=[
    ('end revocation',source.replace('action != MotionEvent.ACTION_MOVE || event.getPointerCount() != 1','false || event.getPointerCount() != 1',1),original_root,'ended input retained extraction geometry'),
    ('native failure revocation',source.replace('finally { if (!accepted) extractionInputDown = null; }','finally { }',1),original_root,'failed native DOWN owned geometry'),
    ('second gesture sample',source,original_root.replace('&& currentBackend.extractionGeometryInputRevision(fence.inputRevision, revision, active) == geometryInput','',1),'mid-probe ended DOWN retained geometry'),
]
for label,changed_engine,changed_root,expected in mutations:
    changed_members=member(changed_engine,'boolean inject(int id, MotionEvent event)')+'\n'+member(changed_engine,'long extractionGeometryInputRevision(')+'\n'+member(changed_engine,'private static final class ExtractionInputDown')
    run.__globals__['HEAD']=head.replace(methods,changed_members,1)
    failed=run(changed_root,F['FENCE_SOURCE'].read_text(encoding='utf-8'),label)
    if failed.returncode==0 or expected not in failed.stderr:raise AssertionError(label+' did not fail as expected\n'+failed.stdout+'\n'+failed.stderr)
    print('PASS coupled touch/fence negative: '+label)
