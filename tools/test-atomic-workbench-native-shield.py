"""Finite actual Activity methods + actual SideSwipe; controlled Android View/Looper boundaries.
Does not run Gradle, SDK compilation, ADB, or any old suite.
"""
from pathlib import Path
import importlib.util, subprocess, json, hashlib, argparse, datetime, tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JDK=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
def module(name,path):
 s=importlib.util.spec_from_file_location(name,path); m=importlib.util.module_from_spec(s); s.loader.exec_module(m); return m
P=None
S=None

HANDLER='''package android.os;import java.util.*;public class Handler {
 public final ArrayDeque<Runnable> q=new ArrayDeque<>();public boolean reject;
 public boolean post(Runnable r){if(reject)return false;q.add(r);return true;}public void execute(Runnable r){if(!post(r))throw new IllegalStateException();}
 public void removeCallbacks(Runnable r){q.removeIf(x->x==r);}public void postDelayed(Runnable r,long t){post(r);}
 public void one(){Runnable r=q.poll();if(r!=null)r.run();}public void drain(){int n=0;while(!q.isEmpty()){if(++n>100)throw new AssertionError("queue did not converge");one();}}
}'''
VIEW='''package android.view;import android.widget.FrameLayout;public class View {
 public static final int IMPORTANT_FOR_ACCESSIBILITY_AUTO=0,IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS=4;
 public interface OnTouchListener{boolean onTouch(View v,MotionEvent e);}public interface OnClickListener{void onClick(View v);}
 public interface OnLayoutChangeListener{void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob);}
 public OnTouchListener listener;public OnClickListener click;public OnLayoutChangeListener layoutListener;
 public android.os.Handler handler;public ViewParent parent;public int left,top,width=100,height=100,measuredHeight=40,clicks,nativeCancels,cancelLongPresses,pendingCancels;
 public boolean enabled=true,pressed,longClicked,postFails,requested;public float tx,ty;
 public FrameLayout.LayoutParams params=new FrameLayout.LayoutParams(100,100);
 final Runnable perform=()->performClick();final ViewPropertyAnimator animator=new ViewPropertyAnimator(this);
 public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return new android.content.res.Resources();}
 public void setOnTouchListener(OnTouchListener l){listener=l;}public void setOnClickListener(OnClickListener l){click=l;}
 public void addOnLayoutChangeListener(OnLayoutChangeListener l){layoutListener=l;}public ViewParent getParent(){return parent;}
 public int getLeft(){return left;}public int getTop(){return top;}public int getWidth(){return width;}public int getHeight(){return height;}
 public Object getLayoutParams(){return params;}public void setLayoutParams(FrameLayout.LayoutParams p){params=p;int l=p.leftMargin,t=p.topMargin;
  if(p.gravity==Gravity.CENTER&&parent instanceof View){l=(((View)parent).width-p.width)/2;t=(((View)parent).height-p.height)/2;}layout(l,t,l+p.width,t+p.height);}
 public void layout(int l,int t,int r,int b){int ol=left,ot=top,or=left+width,ob=top+height;left=l;top=t;width=r-l;height=b-t;requested=false;
  if(layoutListener!=null&&(l!=ol||t!=ot||r!=or||b!=ob))layoutListener.onLayoutChange(this,l,t,r,b,ol,ot,or,ob);}
 public boolean isLayoutRequested(){return requested;}public void setEnabled(boolean b){enabled=b;}public void setImportantForAccessibility(int i){}
 public void setTranslationX(float f){tx=f;}public void setTranslationY(float f){ty=f;}public float getTranslationX(){return tx;}public float getTranslationY(){return ty;}public ViewPropertyAnimator animate(){return animator;}
 public void cancelLongPress(){cancelLongPresses++;}public void setPressed(boolean b){pressed=b;}
 public void cancelPendingInputEvents(){pendingCancels++;if(handler!=null)handler.removeCallbacks(perform);cancelLongPress();}
 public boolean performClick(){clicks++;if(click!=null)click.onClick(this);return true;}public boolean performLongClick(){longClicked=true;return true;}
 public boolean dispatchTouchEvent(MotionEvent e){if(listener!=null&&listener.onTouch(this,e))return true;return onTouchEvent(e);}
 public boolean onTouchEvent(MotionEvent e){switch(e.getActionMasked()){case 0:pressed=true;longClicked=false;break;
 case 1:if(pressed&&!longClicked&&e.getX()>=0&&e.getY()>=0&&e.getX()<width&&e.getY()<height){if(postFails||!handler.post(perform))perform.run();}pressed=false;break;
 case 3:nativeCancels++;pressed=false;break;}return true;}
}'''

HARNESS=r'''package ls.augment.com;
import android.view.*;import android.widget.FrameLayout;import android.os.*;import java.util.*;
import ls.augment.com.AtomicWorkbenchWindowLayoutPlan.Rect;import ls.augment.com.AtomicWorkbenchWindowLayoutPlan.RailSide;
import ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.*;
class BaseActivity {java.util.function.Function<MotionEvent,Boolean> route;public boolean dispatchTouchEvent(MotionEvent e){return route.apply(e);}protected void onStop(){}}
public final class FirstTouchCases extends BaseActivity {
 static int cases,checks;interface C{void run();}static void yes(boolean v,String n){checks++;if(!v)throw new AssertionError(n);}static void test(String n,C c){c.run();cases++;System.out.println("PASS "+n);}
 final Handler main=new Handler(),WORKER=new Handler();static final Handler APP_READER=new Handler();
 static final java.util.concurrent.atomic.AtomicInteger NATIVE_SHIELD_DIAGNOSTIC_PENDING=new java.util.concurrent.atomic.AtomicInteger();
 static final java.util.concurrent.atomic.AtomicLong NATIVE_SHIELD_DIAGNOSTIC_DROPPED=new java.util.concurrent.atomic.AtomicLong();
 final AtomicWorkbenchWorkspaceModel model=new AtomicWorkbenchWorkspaceModel();final AtomicWorkbenchWindowPresentationPolicy presentationPolicy=new AtomicWorkbenchWindowPresentationPolicy();
 final FrameLayout workspace=new FrameLayout();final View desktop=new View(),homeTransitionCover=new View(),status=new View(),appBack=new View();final Ui ui=new Ui();
 final Slot[] slots=new Slot[4];final ArrayList<Integer> focuses=new ArrayList<>();final AtomicWorkbenchClient client=new AtomicWorkbenchClient();
 static final int COUNT=4;final String[]pendingTaskAllocations=new String[4];final boolean[]pendingHomeSurfaces=new boolean[4];String operationNotice;
 int epoch=1,emptySideSlots=3,focusedWindow=0;long sessionGeneration=8,launchGeneration=7,pollGeneration,taskStorageProbeInFlight,taskSnapshotElapsed,extractionInputRevision;
 boolean active=true,destroyed,closing,surfaceUnavailable,outputsSyncing,outputsParked,recoveryPending,busy,waitingForCleanup,exitRequested,polling,presentationNeedsRetry;
 boolean hostDialogActive,hostDragActive,textDeliveryActive,hostTouchActive;int hostInputPending,gestureWindow=-1,gestureDisplay=-1;
 MotionEvent lastTouch;Object gestureGeometry;Receipt pendingPresentationFocus;Object pendingTaskOperation;AtomicWorkbenchTaskUiSnapshot lastTaskSnapshot;
 int mainLayoutWindow=-1,mainLayoutLeft,mainLayoutTop,mainLayoutWidth,mainLayoutHeight,mainLayoutDisplayWidth,mainLayoutDisplayHeight;boolean mainLayoutPresented;
 NativeShieldLayoutHold nativeShieldLayoutHold;boolean nativeShieldLayoutDeferred,nativeShieldDispatchingUp;long nativeShieldTouchSequence,nativeShieldDownTime,nativeShieldEventTime;
 Runnable entrySideDispatch=()->{},extractionGeometryTick=()->{},homePresentationPoll=()->{},poll=()->{},cleanupPoll=()->{};
 Hooks pasteCoordinator,transfer,closeDialog,settingsDialog;Hooks lifecycleGate=new Hooks();int parked;int pointerTarget=2;long downTime;Runnable afterDown,beforeUp;
 static class Ui{int dp(int x){return x;}}static class Hooks{void cancelAll(){}void setForeground(boolean b){}void dismiss(){}void stopped(){}}
 static class ResetWriteFence{static boolean stale(long g){return false;}}
 static class AtomicWorkbenchTaskUiSnapshot{AtomicWorkbenchTaskUiSnapshot(Bundle b){}}
 static class AtomicWorkbenchClient{int clears,touches,reads;Bundle status(){Bundle b=new Bundle();b.putBoolean("success",true);b.putInt("focused_window_id",-1);b.putParcelableArrayList("windows",new ArrayList<Bundle>());return b;}Bundle taskShelfState(){reads++;return new Bundle();}void clearGestureTarget(){clears++;}void touchWindow(int id,MotionEvent e){touches++;}}
 static class Surface extends View{Surface getHolder(){return this;}boolean isValid(){return true;}boolean valid=true;}
 final class Slot{final int id;final FrameLayout frame=new FrameLayout();final Surface surface=new Surface();final View shield=new View();final AtomicWorkbenchSideSwipe swipe;
  int displayWidth=1216,displayHeight=2688,displayId;String displayName,displayUniqueId,windowSession;boolean retainedEmptyTaskDisplay,ready=true,outputAwaitingFrame,nativeHome,wasActive;
  Slot(int id){this.id=id;displayId=8+id;displayName="vd-"+id;displayUniqueId="unique-"+id;windowSession="session-"+id;surface.parent=frame;surface.params.gravity=Gravity.CENTER;shield.parent=frame;shield.handler=main;
   // ACTUAL_CLICK
   swipe=AtomicWorkbenchSideSwipe.install(shield,frame,1,new AtomicWorkbenchSideSwipe.Callback(){public void onDown(){beginNativeShieldLayout(id);}public void onAction(AtomicWorkbenchSideSwipePolicy.Action a){actions.add(a);}public void onFinished(){}});
   // ACTUAL_FRAME_LISTENER
  }
  // ACTUAL_FIT
  void clear(){ready=false;displayId=-1;}
 }
 final ArrayList<AtomicWorkbenchSideSwipePolicy.Action> actions=new ArrayList<>();
 FirstTouchCases(){for(int i=0;i<4;i++)slots[i]=new Slot(i);for(int i=0;i<4;i++)model.setHostedWindow(i,true);model.promote(0);workspace.width=1216;workspace.height=560;layoutWorkspace();syncShieldBounds();mainLayoutPresented=true;
  route=e->{Slot s=slots[pointerTarget];if(e.getActionMasked()==0&&afterDown!=null){Runnable r=afterDown;afterDown=null;r.run();}if(e.getActionMasked()==1&&beforeUp!=null){Runnable r=beforeUp;beforeUp=null;r.run();}
   MotionEvent local=new MotionEvent(e.action,e.rawX-s.frame.left,e.rawY-s.frame.top,e.rawX,e.rawY,e.time,e.pointers);local.downTime=e.downTime;
   try{return s.shield.dispatchTouchEvent(local);}finally{local.recycle();}};
 }
 void syncShieldBounds(){for(Slot s:slots){s.shield.width=s.frame.width;s.shield.height=s.frame.height;}}
 void resize(){workspace.height=1520;layoutWorkspace();for(Slot s:slots)s.fitSurface();syncShieldBounds();}
 float x(){return slots[pointerTarget].frame.left+slots[pointerTarget].frame.width/2f;}float y(){return slots[pointerTarget].frame.top+slots[pointerTarget].frame.height/2f;}
 void event(int action,float x,float y,long at,int pointers){if(action==0)downTime=at;SystemClock.now=at;MotionEvent e=new MotionEvent(action,x,y,x,y,at,pointers);e.downTime=downTime;try{dispatchTouchEvent(e);}finally{e.recycle();}}
 void drain(){main.drain();syncShieldBounds();APP_READER.drain();}
 void focusWindow(int id){focuses.add(id);cancelGesture();}void openEmptyWorkspace(int id){throw new AssertionError("unexpected allocation");}
 void invalidateExtractionGeometry(){}void showStatus(String t){}void finishOutputPresentation(){}void publishGestureTarget(){}void schedulePoll(){}void observeTaskStorageScope(Bundle b){}
 void queueHostInput(boolean b){focuses.add(-1);}String safeMessage(Exception e){return e.getClass().getName();}
 boolean shouldCloseExitedWindow(int id,Bundle b){return false;}void requestCloseWindow(int id){}void returnDesktopFocusAfterClose(){}void applyWindowStatus(int id,Bundle b){}
 void queryPendingTaskOperation(){}void renderWorkspace(){layoutWorkspace();}void closeTaskReferenceManagement(){}void stopMedia(){}void lifecycleDiagnostic(String e,String d){}
 boolean isChangingConfigurations(){return false;}void parkWorkspaceOutputs(){parked++;}Bundle failure(String s){Bundle b=new Bundle();b.putBoolean("success",false);return b;}
 android.content.Context getApplicationContext(){return new android.content.Context();}
 // ACTUAL_METHODS
 public static void main(String[] args){
  test("IME resize stays deferred through queued native click, including fitSurface",()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();int h=a.slots[2].frame.height,w=a.slots[2].surface.width;a.event(0,x,y,1000,1);a.resize();yes(a.slots[2].frame.height==h&&a.slots[2].surface.width==w&&a.nativeShieldLayoutDeferred,"geometry changed during native DOWN");a.event(1,x,y,1060,1);yes(a.focuses.isEmpty(),"posted View callback unexpectedly ran inside UP");a.layoutWorkspace();yes(a.slots[2].frame.height==h,"queued layout ran before native click");a.main.one();yes(a.focuses.equals(List.of(2)),"native click was lost or duplicated after IME resize");a.drain();yes(!a.hostTouchActive&&a.nativeShieldLayoutHold==null&&!a.nativeShieldLayoutDeferred&&a.slots[2].frame.height>h&&a.slots[2].shield.clicks==1,"native completion did not release latest layout");});
  test("actual poll ahead of posted click cannot focus old main",()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();a.event(0,x,y,2000,1);a.resize();a.beforeUp=()->{a.pollStatus();a.WORKER.drain();};a.event(1,x,y,2060,1);a.main.one();yes(a.focuses.isEmpty(),"poll stole pending side click focus");a.drain();yes(a.focuses.equals(List.of(2)),"pending side click did not execute once");});
  test("CANCEL retires pending geometry without a second poll",()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();int h=a.slots[2].frame.height;a.event(0,x,y,3000,1);a.resize();a.event(3,x,y,3060,1);a.drain();yes(a.focuses.isEmpty()&&!a.hostTouchActive&&a.nativeShieldLayoutHold==null&&!a.nativeShieldLayoutDeferred&&a.slots[2].frame.height>h,"CANCEL left pending layout or clicked");});
  for(String kind:List.of("lease","epoch","session","role"))test("queued original click refuses changed "+kind,()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();a.event(0,x,y,4000,1);a.resize();a.event(1,x,y,4060,1);switch(kind){case "lease":a.slots[2].displayUniqueId="replacement";break;case "epoch":a.epoch++;break;case "session":a.sessionGeneration++;break;default:a.model.promote(1);}a.drain();yes(a.focuses.isEmpty(),"stale queued click focused a changed identity");});
  test("semantic cancel removes View's already posted callback",()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();a.event(0,x,y,5000,1);a.resize();a.event(1,x,y,5060,1);a.cancelGesture();a.drain();yes(a.focuses.isEmpty()&&a.slots[2].shield.clicks==0&&!a.nativeShieldLayoutDeferred,"semantic cancel did not remove original queued View click");});
  test("new DOWN retires old posted callback and old flush cannot clear new stream",()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();a.event(0,x,y,6000,1);a.resize();a.event(1,x,y,6060,1);a.event(0,x,y,6070,1);long ticket=a.nativeShieldTouchSequence;a.main.one();yes(a.focuses.isEmpty()&&a.hostTouchActive&&a.nativeShieldLayoutHold.sequence==ticket,"old flush retired new DOWN");a.event(1,x,y,6130,1);a.drain();yes(a.focuses.equals(List.of(2))&&a.slots[2].shield.clicks==1,"new stream revived old click or failed");});
  test("real onStop retires hold and pending View callback",()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();a.event(0,x,y,7000,1);a.resize();a.event(1,x,y,7060,1);a.onStop();a.drain();yes(!a.active&&!a.hostTouchActive&&a.nativeShieldLayoutHold==null&&a.focuses.isEmpty()&&a.slots[2].shield.clicks==0,"stop retained hold or queued promotion");});
  test("real external frame change still semantically cancels the stream",()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();a.event(0,x,y,8000,1);a.slots[2].frame.layout(20,800,310,1000);a.event(1,x,y,8060,1);a.drain();yes(a.focuses.isEmpty()&&a.slots[2].shield.nativeCancels>0,"external frame change replayed old stream");});
  test("synchronous native performClick fallback is accepted once",()->{var a=new FirstTouchCases();a.slots[2].shield.postFails=true;float x=a.x(),y=a.y();a.event(0,x,y,9000,1);a.resize();a.event(1,x,y,9060,1);a.drain();yes(a.focuses.equals(List.of(2))&&a.slots[2].shield.clicks==1,"sync View fallback was rejected or replayed");});
  test("captured side swipe keeps original action and suppresses native click",()->{var a=new FirstTouchCases();float x=a.x(),y=a.y();a.event(0,x,y,10000,1);a.resize();a.event(2,x,y-40,10030,1);a.event(1,x,y-80,10060,1);a.drain();yes(a.actions.equals(List.of(AtomicWorkbenchSideSwipePolicy.Action.UP))&&a.focuses.isEmpty()&&a.slots[2].shield.clicks==0,"captured swipe became native click or was lost");});
  test("multi-pointer and long press cannot become promotion",()->{for(boolean longPress:new boolean[]{false,true}){var a=new FirstTouchCases();float x=a.x(),y=a.y();a.event(0,x,y,11000,1);a.resize();if(longPress){a.slots[2].shield.performLongClick();a.slots[2].swipe.markLongPressed();}else{a.event(5,x,y,11020,2);a.event(6,x,y,11030,1);}a.event(1,x,y,11600,1);a.drain();yes(a.focuses.isEmpty()&&a.actions.isEmpty()&&a.slots[2].shield.clicks==0&&!a.hostTouchActive,"aborted or long press stream promoted");}});
  test("direct performClick without physical stream remains compatible",()->{var a=new FirstTouchCases();a.slots[2].shield.performClick();yes(a.focuses.equals(List.of(2)),"existing direct callback blocked");});
  System.out.println("FIRST TOUCH RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''

SIGNATURES=['private static final class NativeShieldLayoutHold','private void beginNativeShieldLayout(',
 'private boolean nativeShieldLayoutCurrent(','private boolean deferNativeShieldLayout()',
 'private boolean acceptNativeShieldClick(','private void cancelNativeShieldLayout(','private void retireNativeShieldLayout(',
 'private void finishNativeShieldTouch(','private void postNativeShieldLayoutFlush(','private void nativeShieldLayoutDiagnostic(',
 'private void layoutWorkspace()','private void prepareMainLayout(','private void invalidateMainLayout(',
 'private boolean mainLayoutMatches(','private void invalidatePresentationGeometry()','private void setSlotVisible(','private void place(',
 'private Roles presentationRoles()','private Lease presentationLease(','private boolean canInteract()',
 'private void cancelGesture()','private void clearGesture()','@Override public boolean dispatchTouchEvent(',
 '@Override protected void onStop()','private void pollStatus()']

def sources(activity):
 src=activity
 fixture=HARNESS.replace('// ACTUAL_METHODS','\n'.join(P.member(src,s) for s in SIGNATURES))
 fixture=fixture.replace('// ACTUAL_FIT',P.member(src,'void fitSurface()'))
 fixture=fixture.replace('// ACTUAL_CLICK',P.member(src,'shield.setOnClickListener(view ->')+');')
 fixture=fixture.replace('// ACTUAL_FRAME_LISTENER',P.member(src,'frame.addOnLayoutChangeListener(')+');')
 files=dict(S.STUBS);files['android/view/View.java']=VIEW
 motion=files['android/view/MotionEvent.java'].replace('public long time;', 'public long time,downTime;').replace('public int getActionMasked()', 'public long getDownTime(){return downTime;}public int getActionMasked()')
 motion=motion.replace('public static MotionEvent obtain(MotionEvent e){return new MotionEvent(e.action,e.x,e.y,e.rawX,e.rawY,e.time,e.pointers);}', 'public static MotionEvent obtain(MotionEvent e){MotionEvent n=new MotionEvent(e.action,e.x,e.y,e.rawX,e.rawY,e.time,e.pointers);n.downTime=e.downTime;return n;}')
 files['android/view/MotionEvent.java']=motion
 files.update({'android/os/Handler.java':HANDLER,'android/os/Bundle.java':P.BUNDLE,
 'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now;public static long uptimeMillis(){return now;}public static long elapsedRealtime(){return now;}}',
 'android/os/Process.java':'package android.os;public class Process{public static int myUid(){return 10515;}}',
 'android/widget/FrameLayout.java':P.FRAME.replace('public boolean clipChildren=true;','public boolean clipChildren=true;').replace('extends android.view.View{','extends android.view.View implements android.view.ViewParent{public void requestDisallowInterceptTouchEvent(boolean b){}'),
 'android/view/Gravity.java':P.GRAVITY,
 'ls/augment/com/AtomicWorkbenchDiagnostics.java':'package ls.augment.com;public class AtomicWorkbenchDiagnostics{public static void record(android.content.Context c,long g,String e,int w,int u,String p,int d,String t,Throwable x){}}',
 'ls/augment/com/FirstTouchCases.java':fixture})
 for name in ['AtomicWorkbenchSideSwipe.java','AtomicWorkbenchSideSwipePolicy.java','AtomicWorkbenchWorkspaceModel.java','AtomicWorkbenchWindowLayoutPlan.java','AtomicWorkbenchWindowPresentationPolicy.java']:
  files['ls/augment/com/'+name]=(SRC/name).read_text(encoding='utf-8')
 return files

def run(folder,activity):
 folder.mkdir(exist_ok=False);files=sources(activity);paths=[]
 for name,text in files.items():
  p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');paths.append(str(p))
 cmd=[str(JDK/'javac.exe'),'-J-Dfile.encoding=UTF-8','--release','17','-encoding','UTF-8','-d',str(folder/'classes'),*paths]
 c=subprocess.run(cmd,capture_output=True,timeout=45);(folder/'javac-stdout.txt').write_bytes(c.stdout);(folder/'javac-stderr.txt').write_bytes(c.stderr)
 r=None
 if c.returncode==0:
  r=subprocess.run([str(JDK/'java.exe'),'-cp',str(folder/'classes'),'ls.augment.com.FirstTouchCases'],capture_output=True,timeout=30)
  (folder/'stdout.txt').write_bytes(r.stdout);(folder/'stderr.txt').write_bytes(r.stderr)
 result={'compileExit':c.returncode,'runtimeExit':r.returncode if r else None,'status':'PASS' if r and r.returncode==0 else 'FAIL','javaSources':len(paths),'actualActivityMethods':SIGNATURES+['void fitSurface()','shield.setOnClickListener','frame.addOnLayoutChangeListener'],'boundary':'ACTUAL_EXTRACTED_METHODS_AND_ACTUAL_SIDESWIPE; CONTROLLED_VIEW_LOOPER_AND_ROOT_FOCUS_SINK; NOT_ANDROID_RUNTIME_OR_ROOT_ACK'}
 (folder/'summary.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8');return result

if __name__=='__main__':
 parser=argparse.ArgumentParser();parser.add_argument('--root',type=Path,default=ROOT);parser.add_argument('--activity-source',type=Path);parser.add_argument('--out',type=Path);parser.add_argument('--negative-controls',action='store_true');args=parser.parse_args()
 ROOT=args.root.resolve();SRC=ROOT/'android/app/src/main/java/ls/augment/com'
 P=module('presentation',ROOT/'tools/test-atomic-workbench-window-presentation-integration.py')
 S=module('swipe',ROOT/'tools/test-atomic-workbench-side-swipe.py')
 folder=args.out.resolve() if args.out else Path(tempfile.mkdtemp(prefix='duo-native-shield-'))/'run';folder.mkdir(exist_ok=False)
 path=args.activity_source.resolve() if args.activity_source else SRC/'AtomicWorkbenchActivity.java';raw=path.read_bytes();text=raw.decode('utf-8')
 result={'status':'FAIL','sourceSha256':hashlib.sha256(raw).hexdigest().upper(),'positive':run(folder/'positive',text),'negatives':[]}
 if args.negative_controls and result['positive']['status']=='PASS':
  for name,old,new in [('NO_LAYOUT_DEFER','if (deferNativeShieldLayout()) return;','if (false && deferNativeShieldLayout()) return;'),('EARLY_HOST_TOUCH_RETIRE','postNativeShieldLayoutFlush(hold, hold.sequence, hold.session);','hostTouchActive = false; postNativeShieldLayoutFlush(hold, hold.sequence, hold.session);')]:
   assert old in text;mutant=text.replace(old,new,1) if name!='NO_QUEUED_VIEW_RETIRE' else text.replace(old,new)
   m=run(folder/name,mutant);m['name']=name;m['killedAtRuntime']=m['compileExit']==0 and m['runtimeExit']==1;result['negatives'].append(m)
 result['sourceStable']=path.read_bytes()==raw
 result['status']='PASS' if result['positive']['status']=='PASS' and result['sourceStable'] and all(x['killedAtRuntime'] for x in result['negatives']) else 'FAIL'
 (folder/'summary.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8');print(json.dumps(result,indent=2));raise SystemExit(0 if result['status']=='PASS' else 1)
