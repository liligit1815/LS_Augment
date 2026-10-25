"""Exercise the real buffer consumer, UI reveal transaction and read-only gesture target."""
from pathlib import Path
import runpy
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
MEMBER = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))["member"]
SRC = SUPPORT["SRC"]
BUNDLE = SUPPORT["BUNDLE"]
if "putLong(" not in BUNDLE:
    BUNDLE = BUNDLE.replace("public void putBoolean", "public void putLong(String k,long v){data.put(k,v);}public long getLong(String k,long d){return data.get(k) instanceof Long?(Long)data.get(k):d;}public void putBoolean", 1)
if "containsKey(" not in BUNDLE:
    BUNDLE = BUNDLE.replace("public void putBoolean", "public boolean containsKey(String k){return data.containsKey(k);}public void putBoolean", 1)
if "Object get(" not in BUNDLE:
    BUNDLE = BUNDLE.rsplit("}", 1)[0] + "public Object get(String k){return data.get(k);}public java.util.Set<String> keySet(){return data.keySet();}}"

COMMON = {
    "android/os/Bundle.java": BUNDLE,
    "android/os/SystemClock.java": "package android.os;public class SystemClock {public static long now=1000;public static long elapsedRealtime(){return now;}public static long uptimeMillis(){return now;}}",
    "android/content/Context.java": "package android.content;public class Context {public String getPackageName(){return \"ls.augment.com\";}public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}",
    "android/content/pm/PackageManager.java": "package android.content.pm;public class PackageManager {public static final int MATCH_DEFAULT_ONLY=1;public static int homeUid=10066;public ResolveInfo resolveActivity(android.content.Intent intent,int flags){return homeUid<0?null:new ResolveInfo(homeUid);}}",
    "android/content/pm/ResolveInfo.java": "package android.content.pm;public class ResolveInfo {public ActivityInfo activityInfo;public ResolveInfo(int uid){activityInfo=new ActivityInfo(uid);}public static class ActivityInfo {public ApplicationInfo applicationInfo;ActivityInfo(int uid){applicationInfo=new ApplicationInfo(uid);}}public static class ApplicationInfo {public int uid;ApplicationInfo(int uid){this.uid=uid;}}}",
    "android/content/Intent.java": "package android.content;public class Intent {public static final String ACTION_MAIN=\"main\",CATEGORY_HOME=\"home\";public Intent(String a){}public Intent addCategory(String c){return this;}}",
}

TEXTURE = {
    **COMMON,
    "android/graphics/SurfaceTexture.java": "package android.graphics;public class SurfaceTexture {public int width,height;public long getTimestamp(){return android.os.SystemClock.now*1000000L;}public void setDefaultBufferSize(int w,int h){width=w;height=h;}}",
    "android/view/TextureView.java": "package android.view;public class TextureView {public interface SurfaceTextureListener {void onSurfaceTextureAvailable(android.graphics.SurfaceTexture t,int w,int h);void onSurfaceTextureSizeChanged(android.graphics.SurfaceTexture t,int w,int h);boolean onSurfaceTextureDestroyed(android.graphics.SurfaceTexture t);void onSurfaceTextureUpdated(android.graphics.SurfaceTexture t);}public android.graphics.SurfaceTexture texture;public TextureView(android.content.Context c){}public void setOpaque(boolean opaque){}public void setSurfaceTextureListener(SurfaceTextureListener l){}public android.graphics.SurfaceTexture getSurfaceTexture(){return texture;}}",
    "android/view/Surface.java": "package android.view;public class Surface {public boolean valid;public int releases;public Surface(){}public Surface(android.graphics.SurfaceTexture t){valid=true;}public boolean isValid(){return valid;}public void release(){valid=false;releases++;}}",
    "ls/augment/com/TestBuffer.java": r'''package ls.augment.com;
import android.graphics.SurfaceTexture;import android.view.Surface;import android.os.SystemClock;
public class TestBuffer {static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 public static void main(String[] args){AtomicWorkbenchSurface view=new AtomicWorkbenchSurface(new android.content.Context());int[] calls=new int[4];
 view.getHolder().addCallback(new AtomicWorkbenchSurface.Callback(){public void surfaceCreated(AtomicWorkbenchSurface.Output h){calls[0]++;}public void surfaceChanged(AtomicWorkbenchSurface.Output h,int f,int w,int t){calls[1]++;}public void surfaceDestroyed(AtomicWorkbenchSurface.Output h){calls[2]++;}public void frameAvailable(long frame,long at){calls[3]++;check(frame==calls[3],"frame sequence");check(at==SystemClock.now,"frame observation clock");}});
 check(!view.getHolder().isValid(),"unavailable texture exposed as live producer");view.getHolder().setFixedSize(1216,2688);
 SurfaceTexture texture=new SurfaceTexture();view.texture=texture;view.onSurfaceTextureAvailable(texture,100,200);Surface producer=view.getHolder().getSurface();
 check(texture.width==1216&&texture.height==2688&&producer.isValid(),"fixed VD buffer size lost");check(calls[0]==1&&calls[1]==1&&view.frameCount()==0,"availability treated as first frame");
 view.onSurfaceTextureUpdated(texture);check(view.frameCount()==1&&calls[3]==1,"real buffer update missing");
 view.onSurfaceTextureSizeChanged(texture,60,160);check(view.getHolder().getSurface()==producer&&producer.releases==0&&view.frameCount()==1,"visual role change rebuilt producer or forgot last frame");
 check(texture.width==1216&&texture.height==2688&&calls[0]==1&&calls[2]==0,"role change reset VD resolution/lifecycle");
 view.getHolder().setFixedSize(1080,2400);check(view.getHolder().getSurface()==producer&&texture.width==1080&&calls[1]==2,"buffer resize replaced producer");
 SystemClock.now+=17;view.onSurfaceTextureUpdated(texture);check(view.frameCount()==2&&view.lastFrameElapsed()==SystemClock.now,"frame clock lost");
 check(view.onSurfaceTextureDestroyed(texture)&&!producer.isValid()&&producer.releases==1,"producer not released exactly once");check(calls[2]==1&&!view.getHolder().isValid()&&view.frameCount()==0,"lost Surface retained readiness");
 SurfaceTexture next=new SurfaceTexture();view.texture=next;view.onSurfaceTextureAvailable(next,100,200);check(view.getHolder().getSurface()!=producer&&calls[0]==2&&view.frameCount()==0,"new texture inherited old evidence");
 boolean rejected=false;try{view.getHolder().setFixedSize(0,100);}catch(IllegalArgumentException e){rejected=true;}check(rejected,"invalid buffer size accepted");
 System.out.println("BUFFER RESULT 7 scenarios; "+checks+" assertions");}}
''',
}

TEXTURE["android/view/TextureView.java"] = TEXTURE["android/view/TextureView.java"].replace(
    "public void setOpaque", "public final java.util.ArrayDeque<Runnable> posted=new java.util.ArrayDeque<>();public boolean post(Runnable value){posted.add(value);return true;}public void setOpaque", 1)

PRESENTATION_HEAD = r'''package ls.augment.com;import android.os.*;import java.util.*;import static ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.*;
public class TestPresentation {
 // Presentation-only boundary: these older fixtures never return storage-scope metadata.
 // The actual scope observer/typed facts/pinned transport are executed by test-atomic-workbench-storage-scope-ui.py.
 int scopeObservationCallbacks,scopeCancellationCallbacks;
 void observeTaskStorageScope(Bundle response){if(response!=null&&response.containsKey("task_backend_state"))throw new AssertionError("storage scope facts require the dedicated real-method suite");scopeObservationCallbacks++;}
 void cancelTaskStorageRecheck(){scopeCancellationCallbacks++;}
 int taskStorageNotice;boolean taskStorageRecheckWanted;
 void recheckTaskStorageScope(){throw new AssertionError("storage scope recheck requires the dedicated real-method suite");}

 AtomicWorkbenchWindowPresentationPolicy presentationPolicy=new AtomicWorkbenchWindowPresentationPolicy();Receipt homePresentationReceipt;boolean mainLayoutPresented;void cancelGesture(){}void invalidateExtractionGeometry(){}void tryIncoming(){}
 static class SurfaceDiagnostics {
  static class Output {int width=Integer.MAX_VALUE,height=Integer.MAX_VALUE;boolean isValid(){return true;}}Output output=new Output();
  int configuredWidth=Integer.MAX_VALUE,configuredHeight=Integer.MAX_VALUE,viewWidth=Integer.MAX_VALUE,viewHeight=Integer.MAX_VALUE;
  long bufferApplyAttempts=Long.MAX_VALUE,bufferApplySequence=Long.MAX_VALUE,resizeRepairs=Long.MAX_VALUE,bufferApplyFailures=Long.MAX_VALUE,
    surfaceGeneration=Long.MAX_VALUE,frameTimestampNanos=Long.MAX_VALUE,lastFrameElapsed=Long.MAX_VALUE,frameObservedNanos=Long.MAX_VALUE,
    lastFrameBufferSequence=Long.MAX_VALUE,frames=Long.MAX_VALUE,bufferGeometryGeneration=Long.MAX_VALUE,lastFrameGeometryGeneration=Long.MAX_VALUE;
  boolean bufferConfigured=true;String bufferError="X".repeat(160);Object activeTexture=new Object();
  boolean isFrameFromConfiguredGeometry(){return true;}
  // ACTUAL_SURFACE_DIAGNOSTIC
 }
 int homePresentationWindow=1,homePresentationEpoch=3,epoch=3,focusedWindow=0,homePresentationSurfaceLifecycle=1,homePresentationRetryWindow=-1;long homePresentationStarted=1000,homePresentationStartedUptime=1000,homePresentationFrame=2,sessionGeneration=1,homePresentationPollGeneration,homePresentationLastWaitLog,homePresentationLastProducerNanos;
 boolean active=true,closing,destroyed,busy=true,homePresentationPolling,homePresentationAllowReuse,presentationNeedsRetry,recoveryPending,waitingForCleanup,exitRequested,outputsParked,outputsNeedRetry;void syncWorkspaceOutputs(){}Bundle homePresentationState=new Bundle();String homePresentationRejectReason="",homePresentationLastLoggedReason="",entryProblemText;static final int COUNT=4;
 static class Buffer {long frames=2,uptime=1000,observed=2000000000L,geometry=1,frameGeometry=1;boolean configured=true,failRepair;String metadata="frame_clock=producer_unspecified";int repairs;long frameCount(){return frames;}long lastFrameUptimeMillis(){return uptime;}long lastFrameTimestampNanos(){return uptime*1000000L;}long lastFrameObservedNanos(){return observed;}boolean isFrameFromConfiguredGeometry(){return configured&&geometry>0&&geometry==frameGeometry;}long bufferGeometryGeneration(){return geometry;}long lastFrameGeometryGeneration(){return frameGeometry;}String diagnosticState(){return metadata;}Buffer getHolder(){return this;}void setFixedSize(int w,int h){repairs++;if(failRepair)throw new IllegalStateException();configured=true;}boolean isValid(){return configured;}}
 static class Slot {int id;boolean ready=true,nativeHome=true;int displayWidth=1216,displayHeight=2688,displayId=10,homeTaskId=69,presentedHomeTaskId=-1,presentedHomeSurfaceLifecycle=-1,surfaceLifecycle=1,presentedHomeDisplayId=-1;String displayUniqueId="owned",presentedHomeDisplayUniqueId="",displayName="fixture-home",windowSession="11111111-1111-1111-1111-111111111111";long homeReadinessGenerationNanos=900000000L,homeReadinessRequestNanos=800000000L,presentedHomeReadinessGenerationNanos=-1,presentedHomeProducerTimestampNanos=-1,presentedHomeDrawBoundary=-1;Buffer surface=new Buffer();}Slot[] slots={new Slot(),new Slot(),new Slot(),new Slot()};
 AtomicWorkbenchWorkspaceModel model=new AtomicWorkbenchWorkspaceModel();List<String> events=new ArrayList<>();String status,operationNotice;int renders,polls;
 static class Queue {List<Runnable> values=new ArrayList<>();void removeCallbacks(Runnable r){values.removeIf(v->v==r);}void post(Runnable r){values.add(r);}void postDelayed(Runnable r,long delay){values.add(r);}void execute(Runnable r){values.add(r);}void drain(){List<Runnable> copy=new ArrayList<>(values);values.clear();copy.forEach(Runnable::run);}}
 Queue main=new Queue(),WORKER=new Queue();Runnable homePresentationPoll=this::pollHomePresentation;
 static class AtomicWorkbenchClient {void clearGestureTarget(){}Bundle state=new Bundle();Bundle status(){return state;}}AtomicWorkbenchClient client=new AtomicWorkbenchClient();
 int coverDismisses,focusCalls,homeCalls,lastFocused=-1;void lifecycleDiagnostic(String e,String d){events.add(e+" "+d);}void dismissHomeTransitionCover(){coverDismisses++;}void captureHomeTransitionCover(){}void showStatus(String s){status=s;}void renderWorkspace(){renders++;}void schedulePoll(){polls++;}
 int lastHomeSide=-99;boolean canInteract(){return active&&!destroyed&&!closing&&!busy&&!recoveryPending;}void focusWindow(int id){focusCalls++;lastFocused=id;busy=true;}void showNativeHome(int side){homeCalls++;lastHomeSide=side;busy=true;}
 Object pendingTaskOperation;int taskQueries;void queryPendingTaskOperation(){taskQueries++;}
 int cleanupRefreshes,recoveryRetries,statusReads;void refreshCleanupWait(){cleanupRefreshes++;}void requestCloseAll(boolean exit){recoveryRetries++;}void pollStatus(){statusReads++;}
 void applyWindowStatus(int id,Bundle result){slots[id].ready=result.getBoolean("success");}static Bundle failure(String text){return new Bundle();}
 TestPresentation(){for(int i=0;i<4;i++)slots[i].id=i;model.setHostedWindow(0,true);model.promote(0);model.setHostedWindow(1,true);homePresentationState.putInt("home_task_id",69);homePresentationState.putInt("display_id",10);homePresentationState.putString("display_unique_id","owned");homePresentationState.putLong("readiness_generation_nanos",900000000L);homePresentationState.putLong("readiness_request_nanos",800000000L);homePresentationState.putBoolean("home_surface_ready",true);homePresentationState.putBoolean("wallpaper_interface_ready",true);homePresentationState.putBoolean("wallpaper_frame_verified",true);homePresentationState.putLong("home_drawn_uptime",1000);homePresentationState.putLong("wallpaper_drawn_uptime",1000);homePresentationState.putLong("readiness_started_uptime",1000);homePresentationReceipt=presentationPolicy.begin(1,sessionGeneration,epoch,presentationRoles(),presentationLease(1));}
 static void prove(Slot s){s.presentedHomeTaskId=s.homeTaskId;s.presentedHomeSurfaceLifecycle=s.surfaceLifecycle;s.presentedHomeDisplayId=s.displayId;s.presentedHomeDisplayUniqueId=s.displayUniqueId;s.presentedHomeReadinessGenerationNanos=s.homeReadinessGenerationNanos;s.presentedHomeProducerTimestampNanos=s.surface.lastFrameTimestampNanos();s.presentedHomeDrawBoundary=1000;}
 static int checks,cases;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}interface Case{void run();}static void test(Case c){SystemClock.now=1000;c.run();cases++;}
'''

PRESENTATION_TEST = r'''
 public static void main(String[] args){
 for(boolean nativeHome:new boolean[]{false,true})test(()->{var f=new TestPresentation();f.busy=false;f.entryProblemText="previous entry";f.slots[0].nativeHome=nativeHome;f.showDesktop();check(f.homeCalls==1&&f.lastHomeSide==-1&&f.focusCalls==0,"HOME button merely focused the current app instead of opening main HOME");check(f.entryProblemText==null,"HOME button retained previous entry error");});
 test(()->{var f=new TestPresentation();f.presentationNeedsRetry=true;f.homePresentationRetryWindow=1;f.slots[1].nativeHome=false;f.busy=false;f.showDesktop();check(f.homeCalls==1&&f.lastHomeSide==f.model.sideIndexOf(1)&&f.focusCalls==0,"retry only focused an app that covered the retained HOME");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.uptime=900;check(!f.completeHomePresentation()&&f.model.mainWindowId()==0&&f.busy,"task success revealed before target buffer");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.frames=0;f.homePresentationFrame=-1;check(!f.completeHomePresentation(),"zero frames accepted after retry");check(!f.canReuseHomeFrame(f.slots[1]),"zero frames considered reusable");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.frames++;f.slots[1].surface.uptime=900;check(!f.completeHomePresentation(),"late old App frame accepted as HOME");f.slots[1].surface.uptime=1000;f.homePresentationState.putLong("wallpaper_drawn_uptime",1001);check(!f.completeHomePresentation(),"frame before wallpaper draw accepted");f.slots[1].surface.uptime=1001;check(f.completeHomePresentation(),"producer frame after draw was rejected");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.frames++;f.slots[1].surfaceLifecycle++;check(!f.completeHomePresentation(),"new texture inherited old presentation request");});
 test(()->{var f=new TestPresentation();f.homePresentationAllowReuse=true;f.homePresentationState.putBoolean("home_reused_visible",true);prove(f.slots[1]);f.slots[1].homeTaskId=70;check(!f.completeHomePresentation(),"recreated task reused earlier HOME frame");f.slots[1].homeTaskId=69;check(f.completeHomePresentation(),"same confirmed visible HOME frame could not be reused");});
 for(String missing:new String[]{"home_surface_ready","wallpaper_interface_ready","wallpaper_frame_verified"})test(()->{var f=new TestPresentation();f.slots[1].surface.frames++;f.homePresentationState.putBoolean(missing,false);check(!f.completeHomePresentation()&&f.model.mainWindowId()==0,"missing drawn/wallpaper evidence revealed target: "+missing);});
 test(()->{var f=new TestPresentation();f.slots[1].surface.frames++;check(f.completeHomePresentation(),"complete real evidence did not reveal");check(f.model.mainWindowId()==1&&f.focusedWindow==1&&!f.busy&&f.homePresentationWindow==-1,"presentation not committed atomically");check(f.events.get(0).contains("HOME_PRESENTATION_READY")&&f.events.get(0).contains("visual_content=UNVERIFIED"),"missing honest visual evidence");check(!f.completeHomePresentation(),"duplicate frame repeated promotion");});
 test(()->{var f=new TestPresentation();Slot s=f.slots[1];check(!f.canReuseHomeFrame(s),"unverified buffer reused");prove(s);check(f.canReuseHomeFrame(s),"confirmed same HOME buffer rejected");s.surfaceLifecycle++;check(!f.canReuseHomeFrame(s),"different Surface reused old proof");s.surfaceLifecycle--;s.homeTaskId++;check(!f.canReuseHomeFrame(s),"different HOME reused old proof");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.frames++;f.epoch++;check(!f.completeHomePresentation()&&f.model.mainWindowId()==0,"stale operation promoted");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.frames++;f.active=false;check(!f.completeHomePresentation(),"stopped UI promoted");f.active=true;f.closing=true;check(!f.completeHomePresentation(),"closing UI promoted");});
 test(()->{var f=new TestPresentation();SystemClock.now=6001;f.pollHomePresentation();check(f.homePresentationWindow==-1&&!f.busy&&f.model.mainWindowId()==0,"timeout pretended visual success");check(f.events.get(0).startsWith("HOME_PRESENTATION_TIMEOUT")&&f.status!=null,"timeout left no actionable evidence");});
 test(()->{var f=new TestPresentation();f.pollHomePresentation();check(f.homePresentationPolling,"status not queried");f.WORKER.drain();f.epoch++;f.main.drain();check(f.model.mainWindowId()==0&&!f.homePresentationPolling,"late reply promoted stale target/locked poll");});
 test(()->{var f=new TestPresentation();f.pollHomePresentation();f.WORKER.drain();f.clearHomePresentation();f.main.drain();check(f.model.mainWindowId()==0&&f.homePresentationWindow==-1,"late poll resurrected cleared reveal");});
 test(()->{var f=new TestPresentation();f.pollHomePresentation();f.WORKER.drain();Runnable old=f.main.values.remove(0);f.clearHomePresentation();f.homePresentationWindow=1;f.homePresentationState=new Bundle();f.pollHomePresentation();check(f.homePresentationPolling,"new reveal poll not owned");old.run();check(f.homePresentationPolling,"old reveal reply released new in-flight lock");});
 test(()->{var f=new TestPresentation();f.homePresentationStartedUptime=5000;check(f.completeHomePresentation(),"static current-generation HOME mechanically required post-click frame");check(f.events.get(0).contains("retained_frame=true"),"retained consumer evidence omitted");});
 test(()->{var f=new TestPresentation();f.homePresentationState.putLong("readiness_generation_nanos",900000001L);check(!f.completeHomePresentation()&&f.homePresentationRejectReason.equals("readiness_generation_mismatch"),"old generation frame accepted");});
 test(()->{var f=new TestPresentation();f.homePresentationState.putString("display_unique_id","recreated");check(!f.completeHomePresentation()&&f.homePresentationRejectReason.equals("display_identity_mismatch"),"recreated display inherited frame");});
 test(()->{var f=new TestPresentation();f.homePresentationState.putLong("readiness_request_nanos",1100000000L);check(!f.completeHomePresentation(),"generation before backend request accepted");});
 test(()->{var f=new TestPresentation();f.homePresentationState.putLong("wallpaper_drawn_uptime",-1L);check(!f.completeHomePresentation(),"negative draw boundary accepted");});
 test(()->{var f=new TestPresentation();f.homePresentationState.putString("home_drawn_uptime","missing");check(!f.completeHomePresentation(),"missing typed draw timestamp accepted");});
 test(()->{var f=new TestPresentation();f.homePresentationState.putLong("home_drawn_uptime",0L);f.homePresentationState.putLong("wallpaper_drawn_uptime",0L);check(f.completeHomePresentation(),"retained isDrawn WM state rejected for lacking optional new draw callbacks");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.uptime=0;check(!f.completeHomePresentation()&&f.homePresentationRejectReason.equals("producer_clock_invalid"),"zero timestamp accepted");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.observed=999999999L;check(!f.completeHomePresentation()&&f.homePresentationRejectReason.equals("producer_clock_invalid"),"producer ahead of consume sample accepted");});
 test(()->{var f=new TestPresentation();f.homePresentationLastProducerNanos=1001000000L;check(!f.completeHomePresentation()&&f.homePresentationRejectReason.equals("producer_clock_invalid"),"producer rollback accepted");});
 test(()->{var f=new TestPresentation();Slot s=f.slots[1];prove(s);s.homeReadinessGenerationNanos++;check(!f.canReuseHomeFrame(s),"old backend generation reused");s.homeReadinessGenerationNanos--;s.displayUniqueId="new";check(!f.canReuseHomeFrame(s),"old display identity reused");});
 test(()->{var f=new TestPresentation();SystemClock.now=6001;f.pollHomePresentation();check(f.presentationNeedsRetry&&f.homePresentationRetryWindow==1&&f.coverDismisses==1,"timeout froze cover or forgot target");f.retryHomePresentation();check(f.focusCalls==1&&f.homeCalls==0&&f.lastFocused==1,"retry recreated existing HOME instead of real focus request");});
 test(()->{var f=new TestPresentation();f.presentationNeedsRetry=true;f.homePresentationRetryWindow=1;f.busy=true;f.retryHomePresentation();check(f.focusCalls==0&&f.homeCalls==0,"busy retry mutated session");f.busy=false;f.recoveryPending=true;f.retryHomePresentation();check(f.focusCalls==0,"recovery retry stole session");});
 test(()->{var f=new TestPresentation();f.presentationNeedsRetry=true;f.homePresentationRetryWindow=1;f.busy=false;f.model.removeWindow(1);f.retryHomePresentation();check(f.focusCalls==0&&f.homeCalls==1,"missing retained display did not use normal opening path");});
 test(()->{var f=new TestPresentation();f.slots[1].surface.uptime=900;f.completeHomePresentation();f.completeHomePresentation();check(f.events.size()==2,"repeated wait flooded diagnostics");check(f.events.get(0).contains("frame_raw_ns=900000000")&&f.events.get(0).contains("draw_boundary=1000")&&f.events.get(0).contains("producer_source=sf_virtual_display_monotonic_contract"),"wait did not preserve timing/contract diagnostics");});
 test(()->{var f=new TestPresentation();f.pollHomePresentation();f.WORKER.drain();f.main.drain();check(f.model.mainWindowId()==0&&f.homePresentationState.getString("readiness_error","").equals("status_unavailable"),"failed status refreshed stale ready proof");});
 test(()->{var f=new TestPresentation();Bundle old=new Bundle(f.homePresentationState);SystemClock.now=4000;f.beginHomePresentation(1,3);check(f.homePresentationFrame==2&&!f.presentationNeedsRetry&&f.homePresentationRetryWindow==-1,"new retry did not own its frame baseline");f.homePresentationState=old;check(f.completeHomePresentation(),"static frame after backend draw rejected merely because retry began later");});
 test(()->{var f=new TestPresentation();Slot s=f.slots[1];s.surface.configured=false;check(f.prepareHomeSurface(s)&&s.surface.repairs==1,"same-size retry failed to repair invalid buffer");});
 test(()->{var f=new TestPresentation();Slot s=f.slots[1];s.surface.configured=false;s.surface.failRepair=true;check(!f.prepareHomeSurface(s)&&f.presentationNeedsRetry&&f.homePresentationRetryWindow==1&&f.status!=null,"failed buffer repair lacked actionable retry state");s.surface.failRepair=false;check(f.prepareHomeSurface(s),"temporary buffer configure failure was permanently cached");});
 test(()->{var f=new TestPresentation();Slot s=f.slots[1];s.surface.geometry=2;check(!f.completeHomePresentation()&&f.homePresentationRejectReason.equals("buffer_geometry_unobserved"),"pre-resize clipped frame revealed after configuration ACK");s.surface.frameGeometry=2;check(f.completeHomePresentation(),"frame observed after current configuration remained blocked");});
 test(()->{var f=new TestPresentation();Slot s=f.slots[1];prove(s);s.surface.geometry=2;check(!f.canReuseHomeFrame(s),"pre-repair geometry supplied a trusted cover");});
 test(()->{var f=new TestPresentation();Slot s=f.slots[1];long geometry=s.surface.geometry;check(f.prepareHomeSurface(s)&&f.prepareHomeSurface(s)&&s.surface.geometry==geometry,"same-size retry invalidated logical geometry");check(f.completeHomePresentation(),"same-size ACK forced a static HOME to produce a new frame");});
 test(()->{var f=new TestPresentation();SystemClock.now=6001;f.pollHomePresentation();f.statusClick();check(f.focusCalls==1&&f.statusReads==0,"actual timeout status listener only polled status instead of retrying");});
 test(()->{var f=new TestPresentation();f.presentationNeedsRetry=true;f.homePresentationRetryWindow=1;f.busy=false;f.waitingForCleanup=true;f.statusClick();check(f.cleanupRefreshes==1&&f.focusCalls==0,"status retry bypassed cleanup barrier");f.waitingForCleanup=false;f.recoveryPending=true;f.statusClick();check(f.recoveryRetries==1&&f.focusCalls==0,"status retry bypassed recovery ownership");});
 test(()->{var f=new TestPresentation();f.pendingTaskOperation=new Object();f.waitingForCleanup=true;f.statusClick();check(f.cleanupRefreshes==1&&f.taskQueries==0,"task query blocked cleanup barrier");f.waitingForCleanup=false;f.recoveryPending=true;f.statusClick();check(f.recoveryRetries==1&&f.taskQueries==0,"unknown task query blocked dead Root recovery");f.recoveryPending=false;f.statusClick();check(f.taskQueries==1&&f.statusReads==0,"unknown task request not queried");});
 test(()->{var f=new TestPresentation();Slot s=f.slots[1];s.id=s.displayId=s.homeTaskId=f.homePresentationEpoch=f.homePresentationSurfaceLifecycle=Integer.MAX_VALUE;s.surface.frames=s.surface.geometry=s.surface.frameGeometry=Long.MAX_VALUE;s.surface.uptime=Long.MAX_VALUE/1000000L;s.homeReadinessGenerationNanos=s.homeReadinessRequestNanos=f.homePresentationFrame=f.homePresentationStartedUptime=Long.MAX_VALUE;
  for(String key:new String[]{"readiness_state","readiness_error","readiness_reason"})f.homePresentationState.putString(key,"X".repeat(160));
  for(String key:new String[]{"readiness_started_uptime","home_drawn_uptime","wallpaper_drawn_uptime"})f.homePresentationState.putLong(key,Long.MAX_VALUE);
  s.surface.metadata=new SurfaceDiagnostics().diagnosticState();
  for(String phase:new String[]{"HOME_PRESENTATION_WAIT","HOME_PRESENTATION_READY","HOME_PRESENTATION_TIMEOUT"}){
   f.homePresentationDiagnostic(phase,s,"readiness_generation_mismatch",";new_frame=false;retained_frame=true;reused_frame=false;evidence=texture_timestamp_and_wm_drawn;visual_content=UNVERIFIED");
   String core=f.events.get(f.events.size()-2),buffer=f.events.get(f.events.size()-1);String storedCore=safe(core,null,2048),storedBuffer=safe(buffer,null,2048);
   check(!storedCore.contains("TRUNCATED")&&!storedBuffer.contains("TRUNCATED"),"bounded production diagnostics truncated: "+core.length()+"/"+buffer.length());
   check(storedCore.equals(core)&&storedBuffer.equals(buffer)&&core.length()<=2048&&buffer.length()<=2048,"2048 safe path changed required metadata");
   check(storedCore.contains("readiness_error=")&&storedCore.contains("producer_source=sf_virtual_display_monotonic_contract")&&storedCore.contains("visual_content=UNVERIFIED"),"core gate evidence lost at 2048 boundary");
   check(storedBuffer.contains("buffer_expected_width=2147483647")&&storedBuffer.contains("frame_geometry_generation=9223372036854775807")&&storedBuffer.contains("frame_observation_clock=system_nano_time"),"buffer tail lost at 2048 boundary");
   if(phase.equals("HOME_PRESENTATION_TIMEOUT"))System.out.println("DIAGNOSTIC BOUNDS core="+core.length()+" buffer="+buffer.length()+" limit=2048");
  }
 });
 System.out.println("PRESENTATION RESULT "+cases+" cases; "+checks+" assertions");}}
'''

PROVIDER = {
    **COMMON,
    "ls/augment/com/AtomicWorkbenchFocusBridge.java": '''package ls.augment.com;final class AtomicWorkbenchFocusBridge {
      AtomicWorkbenchFocusBridge(android.content.Context c,int u,int user,android.os.IBinder e,int pid,long session){}
      void requestClose(){}android.os.Bundle control(String a,android.os.Bundle b){throw new AssertionError("unexpected focus operation");}}
    ''',
    "android/content/pm/PackageManager.java": COMMON["android/content/pm/PackageManager.java"].replace("public static final int", "public static class NameNotFoundException extends Exception {}public String[] getPackagesForUid(int uid){return new String[0];}public ResolveInfo.ApplicationInfo getApplicationInfo(String pkg,int flags)throws NameNotFoundException{throw new NameNotFoundException();}public static final int", 1),
    "android/os/IBinder.java": "package android.os;public interface IBinder {boolean isBinderAlive();}",
    "android/os/Binder.java": "package android.os;public class Binder implements IBinder {public static int caller=10066;public boolean alive=true;public static int getCallingUid(){return caller;}public static int getCallingPid(){return 123;}public static long clearCallingIdentity(){return 0;}public static void restoreCallingIdentity(long x){}public boolean isBinderAlive(){return alive;}}",
    "android/content/Context.java": COMMON["android/content/Context.java"].replace("public String getPackageName()", "public android.content.SharedPreferences getSharedPreferences(String name,int mode){return new android.content.SharedPreferences();}public String getPackageName()"),
    "android/content/SharedPreferences.java": "package android.content;public class SharedPreferences {public String getString(String key,String fallback){return fallback;}}",
    "ls/augment/com/AppConfig.java": "package ls.augment.com;public class AppConfig {static final String DIAGNOSTICS=\"diagnostics\";AppConfig(android.content.Context c){}boolean getBoolean(String key){return false;}ConfigSnapshot configSnapshot(){throw new AssertionError(\"gesture target read cannot query extraction config\");}}",
    "ls/augment/com/ConfigSnapshot.java": "package ls.augment.com;final class ConfigSnapshot {long revision;String checksum;}",
    "ls/augment/com/AtomicWorkbenchExtractionSystemBridge.java": "package ls.augment.com;final class AtomicWorkbenchExtractionSystemBridge {static android.os.Bundle localState(){throw new AssertionError(\"gesture target read cannot query extraction service\");}}",
    "ls/augment/com/AtomicWorkbenchConfig.java": "package ls.augment.com;final class AtomicWorkbenchConfig {static final String ENABLED=\"enabled\",SHOW_MEDIA=\"media\";}",
    "ls/augment/com/AtomicWorkbenchAmapData.java": "package ls.augment.com;final class AtomicWorkbenchAmapData {static final String PACKAGE=\"com.autonavi.minimap\",REGISTER=\"amap_navigation_register\",PUBLISH=\"amap_navigation_publish\";}",
    "ls/augment/com/AtomicWorkbenchAmapMemory.java": "package ls.augment.com;final class AtomicWorkbenchAmapMemory {void stop(Object o){}void touch(Object o,long s){throw new AssertionError(\"unexpected navigation read\");}android.os.Bundle merge(Object o,android.os.Bundle b){throw new AssertionError(\"unexpected navigation merge\");}android.os.Bundle register(Object o,int u,int p,android.os.Bundle b){throw new AssertionError(\"unexpected navigation registration\");}android.os.Bundle publish(Object o,int u,int p,android.os.Bundle b){throw new AssertionError(\"unexpected navigation publish\");}}",
    "ls/augment/com/AtomicWorkbenchAmapLinkClient.java": "package ls.augment.com;final class AtomicWorkbenchAmapLinkClient {AtomicWorkbenchAmapLinkClient(android.content.Context c,long s){throw new AssertionError(\"unexpected navigation connection\");}boolean isClosed(){return true;}void close(){}void touch(){throw new AssertionError();}void routeState(long r,boolean e){throw new AssertionError();}android.os.Bundle merge(android.os.Bundle b){throw new AssertionError();}}",
    "ls/augment/com/BuildConfig.java": "package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20564;public static final boolean DEBUG=false;}",
    "ls/augment/com/AtomicWorkbenchReadinessEvidence.java": "package ls.augment.com;public class AtomicWorkbenchReadinessEvidence {static boolean matches(android.content.Context c,String key,String value){return false;}}",
    "android/os/Process.java": "package android.os;public class Process {public static final int ROOT_UID=0;public static int myUid(){return 10055;}}",
    "android/content/ContentProvider.java": "package android.content;public abstract class ContentProvider {public String getCallingPackage(){return null;}public Context getContext(){return new Context();}public abstract boolean onCreate();public abstract android.os.Bundle call(String m,String a,android.os.Bundle e);public abstract android.database.Cursor query(android.net.Uri u,String[] p,String s,String[] a,String o);public abstract String getType(android.net.Uri u);public abstract android.net.Uri insert(android.net.Uri u,ContentValues v);public abstract int delete(android.net.Uri u,String s,String[] a);public abstract int update(android.net.Uri u,ContentValues v,String s,String[] a);}",
    "android/content/ContentValues.java": "package android.content;public class ContentValues {}",
    "android/database/Cursor.java": "package android.database;public interface Cursor {}",
    "android/net/Uri.java": "package android.net;public class Uri {}",
    "ls/augment/com/ResetWriteFence.java": "package ls.augment.com;public class ResetWriteFence {static boolean blocked,owner;static long generation=1;static boolean blocked(){return blocked;}static boolean owns(){return owner;}static boolean active(){return blocked;}static long generation(){return generation;}}",
    "ls/augment/com/AtomicWorkbenchProtocol.java": "package ls.augment.com;public class AtomicWorkbenchProtocol {static final String AUTHORITY=\"ls.augment.com.workbench\",PACKAGE=\"ls.augment.com\",REGISTER=\"register_root\";static final int VERSION=1,WINDOW_COUNT=4;static boolean sameToken(String a,String b){return a!=null&&a.equals(b);}}",
    "ls/augment/com/TestGestureProvider.java": r'''package ls.augment.com;import android.os.*;import android.content.*;import android.content.pm.*;
public class TestGestureProvider {static int checks,cases;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}interface Case{void run();}static void denied(Case c){boolean denied=false;try{c.run();}catch(SecurityException|IllegalArgumentException e){denied=true;}check(denied,"unauthorized route disclosure");}
 static void test(Case c){SystemClock.now+=10000;ResetWriteFence.blocked=false;ResetWriteFence.generation=1;Binder.caller=10066;PackageManager.homeUid=10066;c.run();cases++;}
 static class Fixture {AtomicWorkbenchProvider provider=new AtomicWorkbenchProvider();AtomicWorkbenchProvider.Pending pending;Binder root=new Binder();Fixture(){pending=AtomicWorkbenchProvider.prepare(new Context());pending.endpoint=root;}void publish(){AtomicWorkbenchProvider.publishGestureTarget(pending,9,2,77,"unique");}Bundle read(){return provider.call("gesture_target",null,null);}void end(){AtomicWorkbenchProvider.remove(pending);}}
 public static void main(String[] args){
 test(()->{Fixture f=new Fixture();f.publish();Bundle b=f.read();check(b.getBoolean("active")&&b.getInt("display_id")==9&&b.getInt("window_id")==2&&b.getInt("host_task_id")==77,"confirmed main slot missing");check(b.getInt("owner_uid")==10055&&b.getInt("user")==0&&b.getLong("session",-1)==f.pending.startedAt,"session identity missing");check(!b.containsKey("token")&&!b.containsKey("endpoint")&&!b.containsKey("owner"),"launch credential exposed");b.putInt("display_id",99);check(f.read().getInt("display_id")==9,"caller mutated provider target");f.end();});
 test(()->{Fixture f=new Fixture();f.publish();Binder.caller=10077;denied(f::read);Binder.caller=110066;denied(f::read);Binder.caller=0;denied(f::read);f.end();});
 test(()->{Fixture f=new Fixture();f.publish();PackageManager.homeUid=10077;denied(f::read);PackageManager.homeUid=-1;denied(f::read);f.end();});
 test(()->{Fixture f=new Fixture();f.publish();denied(()->f.provider.call("gesture_target","x",null));denied(()->f.provider.call("gesture_target",null,new Bundle()));f.end();});
 test(()->{Fixture f=new Fixture();f.publish();SystemClock.now+=2501;check(!f.read().getBoolean("active"),"expired foreground route accepted");f.end();});
 test(()->{Fixture f=new Fixture();f.publish();f.root.alive=false;check(!f.read().getBoolean("active"),"dead Root route accepted");f.end();});
 test(()->{Fixture f=new Fixture();f.publish();ResetWriteFence.generation++;check(!f.read().getBoolean("active"),"reset reused old target");f.end();});
 test(()->{Fixture f=new Fixture();f.publish();AtomicWorkbenchProvider.clearGestureTarget(f.pending);check(!f.read().getBoolean("active"),"stopped UI route retained");f.end();});
 test(()->{Fixture f=new Fixture();f.publish();f.end();Fixture next=new Fixture();check(!next.read().getBoolean("active"),"new session inherited old main");AtomicWorkbenchProvider.publishGestureTarget(f.pending,9,1,77,"unique");check(!next.read().getBoolean("active"),"retired owner wrote new route");next.publish();AtomicWorkbenchProvider.clearGestureTarget(f.pending);check(next.read().getBoolean("active"),"retired owner cleared new route");next.end();});
 test(()->{Fixture f=new Fixture();f.publish();check("unique".equals(f.read().getString("display_unique_id")),"Root-confirmed display identity was lost");for(String bad:new String[]{null,"","with spaces","x".repeat(257)}){AtomicWorkbenchProvider.publishGestureTarget(f.pending,9,2,77,bad);check(!f.read().getBoolean("active"),"invalid display identity accepted");}f.end();});
 test(()->{Fixture f=new Fixture();for(int[] v:new int[][]{{0,0,77},{9,-1,77},{9,4,77},{9,0,-1}}){AtomicWorkbenchProvider.publishGestureTarget(f.pending,v[0],v[1],v[2],"unique");check(!f.read().getBoolean("active"),"invalid target accepted");}f.end();});
 test(()->{Fixture f=new Fixture();Binder.caller=10066;denied(()->f.provider.call("register_root",null,new Bundle()));f.end();});
 System.out.println("GESTURE PROVIDER RESULT "+cases+" cases; "+checks+" assertions");}}
''',
}



COVER_HEAD = r'''package ls.augment.com;import java.util.*;
public class TestCover {
 static class View {static final int VISIBLE=0,GONE=8;}
 static class Bitmap {String content;Bitmap(String s){content=s;}}
 static class ImageView {Bitmap image;int visibility=View.GONE;void setImageBitmap(Bitmap b){image=b;}void setImageDrawable(Object b){image=null;}void setVisibility(int v){visibility=v;}}
 static class Buffer {long frames=1;boolean available=true,fail;Bitmap current=new Bitmap("visible-frame");long frameCount(){return frames;}boolean isAvailable(){return available;}Bitmap getBitmap(){if(fail)throw new OutOfMemoryError();return current;}}
 static class Slot {int id,displayId=9;boolean wasActive=true,ready=true,nativeHome,proven;Buffer surface=new Buffer();}Slot[] slots={new Slot()};
 AtomicWorkbenchWorkspaceModel model=new AtomicWorkbenchWorkspaceModel();ImageView homeTransitionCover=new ImageView();Bitmap homeTransitionBitmap;List<String>events=new ArrayList<>();
 void lifecycleDiagnostic(String e,String d){events.add(e+" "+d);}boolean canReuseHomeFrame(Slot s){return s.proven;}TestCover(){model.setHostedWindow(0,true);}
 static int checks,cases;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}interface Case{void run();}static void test(Case c){c.run();cases++;}
'''
COVER_TEST = r'''
 public static void main(String[]args){
 test(()->{var f=new TestCover();f.captureHomeTransitionCover();Bitmap held=f.homeTransitionCover.image;check(held==f.slots[0].surface.current&&f.homeTransitionCover.visibility==View.VISIBLE,"visible source buffer not covered");f.slots[0].surface.current=new Bitmap("new-black-frame");check(f.homeTransitionCover.image==held,"new source black buffer replaced transition cover");f.captureHomeTransitionCover();check(f.homeTransitionCover.image==held,"retry captured post-migration black frame");f.dismissHomeTransitionCover();check(f.homeTransitionBitmap==null&&f.homeTransitionCover.image==null&&f.homeTransitionCover.visibility==View.GONE,"completed/closed transaction retained content");});
 test(()->{var f=new TestCover();f.model.reset();f.captureHomeTransitionCover();check(f.homeTransitionBitmap==null,"new session exposed prior task buffer");});
 test(()->{var f=new TestCover();f.slots[0].wasActive=false;f.captureHomeTransitionCover();check(f.homeTransitionBitmap==null,"unconfirmed slot captured");});
 test(()->{var f=new TestCover();f.slots[0].surface.frames=0;f.captureHomeTransitionCover();check(f.homeTransitionBitmap==null,"unconsumed buffer captured");});
 test(()->{var f=new TestCover();f.slots[0].surface.fail=true;f.captureHomeTransitionCover();check(f.homeTransitionBitmap==null&&f.events.get(0).startsWith("HOME_TRANSITION_COVER_UNAVAILABLE"),"optional copy failure escaped or lacked evidence");});
 test(()->{var f=new TestCover();f.slots[0].nativeHome=true;f.captureHomeTransitionCover();check(f.homeTransitionBitmap==null,"unpresented HOME became trusted transition source");f.slots[0].proven=true;f.captureHomeTransitionCover();check(f.homeTransitionBitmap!=null,"verified HOME could not supply transition cover");});
 System.out.println("TRANSITION COVER RESULT "+cases+" cases; "+checks+" assertions");}}
'''

def main():
    with tempfile.TemporaryDirectory(prefix="lsa-workbench-presentation-") as temporary:
        work = Path(temporary)
        SUPPORT["compile_run"](work / "buffer", TEXTURE, ["AtomicWorkbenchSurface.java"], "ls.augment.com.TestBuffer")
        activity = (SRC / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
        diagnostics = (SRC / "AtomicWorkbenchDiagnostics.java").read_text(encoding="utf-8")
        safe_method = diagnostics[diagnostics.index("    static String safe("):diagnostics.index("    private static void append(")]
        body = PRESENTATION_HEAD + "\n".join(MEMBER(activity, name) for name in (
            "private Roles presentationRoles()", "private Lease presentationLease(", "private boolean confirmPresentationPromotion(", "private void invalidatePresentationGeometry()", "private boolean completeHomePresentation()", "private void pollHomePresentation()", "private void clearHomePresentation()", "private boolean canReuseHomeFrame(Slot slot)",
            "private static long homeDrawBoundary(Bundle state)", "private static String readinessText(Bundle state, String key)", "private String homePresentationDetail(Slot slot, String reason)", "private void homePresentationDiagnostic(String event, Slot slot, String reason, String extra)", "private void showDesktop()", "private void retryHomePresentation()", "private void beginHomePresentation(int id, int request)", "private boolean prepareHomeSurface(Slot slot)")) + MEMBER(activity, "status.setOnClickListener(view -> ").replace("status.setOnClickListener(view -> ", "void statusClick()", 1) + safe_method + PRESENTATION_TEST
        body = body.replace("// ACTUAL_SURFACE_DIAGNOSTIC", MEMBER((SRC / "AtomicWorkbenchSurface.java").read_text(encoding="utf-8"), "String diagnosticState()"))
        SUPPORT["compile_run"](work / "presentation", {**COMMON, "ls/augment/com/TestPresentation.java": body},
                               ["AtomicWorkbenchWorkspaceModel.java","AtomicWorkbenchWindowPresentationPolicy.java","AtomicWorkbenchWindowLayoutPlan.java"], "ls.augment.com.TestPresentation")
        cover = COVER_HEAD + MEMBER(activity, "private void captureHomeTransitionCover()") + MEMBER(activity, "private void dismissHomeTransitionCover()") + COVER_TEST
        SUPPORT["compile_run"](work / "cover", {"ls/augment/com/TestCover.java": cover}, ["AtomicWorkbenchWorkspaceModel.java"], "ls.augment.com.TestCover")
        provider = dict(PROVIDER)
        provider["android/os/Bundle.java"] = provider["android/os/Bundle.java"].replace("public void putBoolean", "public void putBinder(String k,IBinder v){data.put(k,v);}public IBinder getBinder(String k){return (IBinder)data.get(k);}public void putBoolean", 1)
        SUPPORT["compile_run"](work / "provider", provider, ["AtomicWorkbenchProvider.java"], "ls.augment.com.TestGestureProvider")


if __name__ == "__main__":
    main()
