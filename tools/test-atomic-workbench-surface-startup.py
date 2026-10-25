"""Reproduce the real Surface -> Slot -> automatic HOME preparation reentry chain.

Activity methods are production slices up to the first asynchronous HOME request;
the later Binder/UI completion is an explicit boundary. The negative control restores
the former callback ordering in an isolated compilation, never in the workspace.
"""
from pathlib import Path
import argparse
import runpy
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-surface-runtime.py")))
SUPPORT, MEMBER = BASE["SUPPORT"], BASE["MEMBER"]

OLD_CALLBACKS = r'''    private void activateProducer() {
        if (!bufferConfigured || activeTexture == null || output.surface != null) return;
        output.surface = new Surface(activeTexture);
        ++surfaceGeneration;
        frames = lastFrameElapsed = frameTimestampNanos = frameObservedNanos = lastFrameBufferSequence = lastFrameGeometryGeneration = 0;
        if (output.callback != null) {
            output.callback.surfaceCreated(output);
            output.callback.surfaceChanged(output, 1, output.width, output.height);
            output.dimensionChangePending = false;
        }
    }

    private void notifyDimensionsChanged() {
        if (output.isValid() && output.dimensionChangePending && output.callback != null) {
            output.callback.surfaceChanged(output, 1, output.width, output.height);
            output.dimensionChangePending = false;
        }
    }
'''

HEAD = r'''package ls.augment.com;
import android.graphics.SurfaceTexture;import android.os.SystemClock;import android.content.Intent;import java.util.*;
import static ls.augment.com.AtomicWorkbenchWindowLayoutPlan.*;import static ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.*;
public class TestSurfaceStartup {
 static class Gate {boolean surfaceMissing(){return false;}}Gate lifecycleGate=new Gate();
 static class ResetWriteFence {static long current;static long generation(){return current;}static boolean stale(long g){return g!=current;}}
 static class AtomicWorkbenchCleanup {static boolean pending(){return false;}}
 AtomicWorkbenchWorkspaceModel model=new AtomicWorkbenchWorkspaceModel();Slot[] slots=new Slot[4];
 String[] pendingTaskAllocations=new String[4];
 boolean active=true,nativeHomePending=true,incomingPending,busy,closing,destroyed,surfaceUnavailable,exitRequested,recoveryPending,waitingForCleanup,appsLoaded,presentationNeedsRetry,appListRequested,outputsSyncing,outputsParked;
 static final class Main {final ArrayList<Runnable>delayed=new ArrayList<>();void post(Runnable r){r.run();}void postDelayed(Runnable r,long ms){delayed.add(r);}void removeCallbacks(Runnable r){delayed.removeIf(v->v==r);}}final Main main=new Main();void syncWorkspaceOutputs(){}
 AtomicWorkbenchClient client;String entryProblemText,restoreNotice,status;int homePresentationRetryWindow=-1,focusedWindow=-1,homeRequests,created,changed;long launchGeneration;
 TestSurfaceStartup(){for(int id=0;id<4;id++)slots[id]=new Slot(id);prepareFreshEntryScope();}
 void showStatus(String text){status=text;}void renderWorkspace(){}void lifecycleDiagnostic(String e,String d){}void showCleanupPending(boolean b){}void requestCloseAll(boolean b,String r){}void switchToDesktop(int id){}void cancelGesture(){}void hideHostKeyboard(){}void invalidateMainLayout(int id){}

 // Only Android/config storage are boundaries; production entry validation executes below.
 final AtomicWorkbenchWindowPresentationPolicy presentationPolicy=new AtomicWorkbenchWindowPresentationPolicy();
 EntryProof pendingLayoutProof,incomingProof;final Runnable entrySideDispatch=this::dispatchEntrySide;
 final android.widget.FrameLayout workspace=new android.widget.FrameLayout(873,1930);Object ui;
 android.content.Intent intent=new android.content.Intent();android.content.ComponentName incomingComponent;
 int incomingTaskId=-1,geometryInvalidations;boolean mainLayoutPresented;android.content.Intent getIntent(){return intent;}Object getApplicationContext(){return this;}
 static final class AtomicWorkbenchSettingsActivity{static final String EXTRA_GENERATION="atomic_workbench_generation";}
 static final class BuildConfig{static final int VERSION_CODE=20575;}
 static final class ConfigSnapshot{final long revision;final String checksum;final boolean enabled;ConfigSnapshot(long r,String c,boolean e){revision=r;checksum=c;enabled=e;}String get(String key){return AtomicWorkbenchConfig.ENABLED.equals(key)&&enabled?"1":"0";}}
 static final class AppConfig{static ConfigSnapshot snapshot;AppConfig(Object context){}ConfigSnapshot configSnapshot(){return snapshot;}}
 static final class ConfigSchema{/* ACTUAL_TRUTHY */}
 static final class AtomicWorkbenchClient{int clearTargets;void clearGestureTarget(){clearTargets++;}}
 void invalidateExtractionGeometry(){geometryInvalidations++;}
 private void prepareFreshEntryScope(){
  ConfigSnapshot current=new ConfigSnapshot(9,"a".repeat(64),true);AppConfig.snapshot=current;
  intent.putExtra(AtomicWorkbenchConfig.EXTRA_CONFIG_REVISION,current.revision).putExtra(AtomicWorkbenchConfig.EXTRA_CONFIG_CHECKSUM,current.checksum)
    .putExtra(AtomicWorkbenchConfig.EXTRA_TRIGGER_ELAPSED,SystemClock.elapsedRealtime()).putExtra(AtomicWorkbenchConfig.EXTRA_ENTRY_BUILD,BuildConfig.VERSION_CODE)
    .putExtra(AtomicWorkbenchConfig.EXTRA_SIDE,"right").putExtra(AtomicWorkbenchSettingsActivity.EXTRA_GENERATION,ResetWriteFence.generation());
  incomingProof=new EntryProof(intent);
  try{requireCurrentEntry(incomingProof);}catch(EntryRejected rejected){throw new AssertionError("startup fixture did not establish a current original entry",rejected);}
  if(presentationPolicy.offerEntry(incomingProof.key(),incomingProof.side,SystemClock.elapsedRealtime(),AtomicWorkbenchConfig.REQUEST_MAX_AGE_MS)
      !=AtomicWorkbenchWindowPresentationPolicy.Offer.NEW)throw new AssertionError("startup fixture entry was not admitted");
  pendingLayoutProof=incomingProof;
 }
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
'''
SLOT_HEAD = r'''
 final class Slot implements AtomicWorkbenchSurface.Callback {
  final int id;int displayWidth=1216,displayHeight=2688,surfaceLifecycle,surfaceChanges,surfaceChangeLogs,lastSurfaceWidth,lastSurfaceHeight;long lastSurfaceLog;
  final AtomicWorkbenchSurface surface=new AtomicWorkbenchSurface(new android.content.Context());
  Slot(int id){this.id=id;surface.getHolder().addCallback(this);surface.getHolder().setFixedSize(displayWidth,displayHeight);}
  void surfaceDiagnostic(String event,String detail){if("SURFACE_CREATED".equals(event))created++;if("SURFACE_CHANGED".equals(event))changed++;}
  public void surfaceDestroyed(AtomicWorkbenchSurface.Output h){}public void frameAvailable(long f,long e){}
'''
TAIL = r'''
 }
 public static void main(String[] args){boolean negative=args.length>0&&args[0].equals("negative"),duplicate=args.length>0&&args[0].equals("recovery-duplicate");TestSurfaceStartup activity=new TestSurfaceStartup();
  try{activity.slots[0].surface.romGetTextureLayer(new SurfaceTexture(),873,1930);
   if(negative)throw new AssertionError("negative control unexpectedly completed");
   check(activity.created==1&&activity.changed==1,"initial lifecycle did not stabilize at one created/changed");
   check(activity.homeRequests==1&&!activity.nativeHomePending&&activity.busy,"startup must submit HOME exactly once");
   check(activity.slots[0].surface.getHolder().isValid(),"startup lost actual producer");
   System.out.println("STARTUP POSITIVE RESULT: HOME requests="+activity.homeRequests+" created="+activity.created+" changed="+activity.changed+"; "+checks+" assertions");
   TestSurfaceStartup recovery=new TestSurfaceStartup();SurfaceTexture texture=new SurfaceTexture();texture.failNext=true;
   recovery.slots[0].surface.texture=texture;recovery.slots[0].surface.onSurfaceTextureAvailable(texture,873,1930);
   check(recovery.created==0&&recovery.homeRequests==0&&!recovery.slots[0].surface.getHolder().isValid(),"failed initial configuration fabricated callbacks/launch");
   recovery.tryIncoming();
   check(recovery.created==1&&recovery.changed==1&&recovery.homeRequests==(duplicate?2:1)&&recovery.busy&&!recovery.nativeHomePending,"configuration recovery duplicated HOME or stranded callbacks: "+recovery.homeRequests);
   System.out.println((duplicate?"STARTUP RECOVERY NEGATIVE CONTROL: ":"STARTUP RECOVERY POSITIVE RESULT: ")+"HOME requests="+recovery.homeRequests+" created="+recovery.created+" changed="+recovery.changed+"; "+checks+" assertions");
  }catch(StackOverflowError error){if(!negative)throw error;Set<String> methods=new HashSet<>();for(StackTraceElement frame:error.getStackTrace())methods.add(frame.getMethodName());
   for(String method:new String[]{"notifyDimensionsChanged","setFixedSize","surfaceChanged","tryIncoming","tryNativeHome","showNativeHome","prepareHomeSurface"})check(methods.contains(method),"overflow lacks production chain method "+method);
   check(activity.homeRequests==0&&activity.created==1,"negative control did not fail before first HOME request");
   System.out.println("STARTUP NEGATIVE CONTROL: reproduced StackOverflowError; HOME requests="+activity.homeRequests+" created="+activity.created+"; repeating production chain="+methods+"; "+checks+" assertions");
  }
 }
}
'''


def sources(activity, surface):
    incoming = MEMBER(activity, "private void tryIncoming()")
    boundary = "        if (!canInteract() || !appsLoaded || !incomingPending) return;"
    incoming = incoming[:incoming.index(boundary) + len(boundary)] + '\n        throw new AssertionError("unexpected app handoff branch");\n    }'
    home = MEMBER(activity, "private void showNativeHome(int emptySide)")
    home = home[:home.index("        pendingHomeSurfaces[id] = true;")] + "        homeRequests++;\n    }"
    methods = "\n".join(MEMBER(activity, key) for key in (
        "private boolean canInteract()", "private void tryNativeHome()", "private boolean prepareHomeSurface(Slot slot)",
        "private static final class EntryProof", "private static final class EntryRejected",
        "private void dispatchEntrySide()", "private String entryProblem(", "private void requireCurrentEntry(", "private void invalidatePresentationGeometry()"))
    callbacks = "\n".join(MEMBER(activity, key) for key in (
        "public void surfaceCreated(AtomicWorkbenchSurface.Output holder)",
        "public void surfaceChanged(AtomicWorkbenchSurface.Output holder, int format, int width, int height)"))
    callbacks = callbacks.replace("AtomicWorkbenchActivity.this::syncWorkspaceOutputs", "TestSurfaceStartup.this::syncWorkspaceOutputs")
    result = dict(BASE["SOURCES"])
    for filename in ("AtomicWorkbenchWindowLayoutPlan.java", "AtomicWorkbenchWindowPresentationPolicy.java", "AtomicWorkbenchConfig.java"):
        result["ls/augment/com/" + filename] = (SUPPORT["SRC"] / filename).read_text(encoding="utf-8")
    result["android/os/Process.java"] = "package android.os;public final class Process{public static int myUid(){return 10515;}}"
    result["android/content/ComponentName.java"] = "package android.content;public final class ComponentName{}"
    result["android/content/Intent.java"] = "package android.content;import java.util.*;public final class Intent{final Map<String,Object>m=new HashMap<>();public Intent putExtra(String k,long v){m.put(k,v);return this;}public Intent putExtra(String k,int v){m.put(k,v);return this;}public Intent putExtra(String k,String v){m.put(k,v);return this;}public Intent removeExtra(String k){m.remove(k);return this;}public long getLongExtra(String k,long d){return m.get(k) instanceof Long?(Long)m.get(k):d;}public int getIntExtra(String k,int d){return m.get(k) instanceof Integer?(Integer)m.get(k):d;}public String getStringExtra(String k){return m.get(k) instanceof String?(String)m.get(k):null;}}"
    actual_truthy = MEMBER((SUPPORT["SRC"] / "ConfigSchema.java").read_text(encoding="utf-8"), "public static boolean truthy(")
    head = HEAD.replace("/* ACTUAL_TRUTHY */", actual_truthy)

    result["android/view/TextureView.java"] = result["android/view/TextureView.java"].replace("public SurfaceTexture getSurfaceTexture()", "public boolean isAvailable(){return texture!=null;}public SurfaceTexture getSurfaceTexture()")
    result["ls/augment/com/AtomicWorkbenchSurface.java"] = surface
    result["ls/augment/com/TestSurfaceStartup.java"] = head + methods + incoming + home + SLOT_HEAD + callbacks + TAIL
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--expect-overflow", action="store_true", help="Verify the current pre-fix production code before changing it")
    args = parser.parse_args()
    activity = (SUPPORT["SRC"] / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
    surface = (SUPPORT["SRC"] / "AtomicWorkbenchSurface.java").read_text(encoding="utf-8")
    with tempfile.TemporaryDirectory(prefix="duo-surface-startup-") as temporary:
        work = Path(temporary)
        SUPPORT["compile_run"](work / "current", sources(activity, surface), ["AtomicWorkbenchWorkspaceModel.java"], "ls.augment.com.TestSurfaceStartup", arguments=("negative",) if args.expect_overflow else ())
        if not args.expect_overflow:
            old = surface.replace(MEMBER(surface, "private void activateProducer()"), OLD_CALLBACKS.split("\n\n    private void notifyDimensionsChanged()", 1)[0])
            old = old.replace(MEMBER(old, "private void notifyDimensionsChanged()"), "    private void notifyDimensionsChanged()" + OLD_CALLBACKS.split("\n\n    private void notifyDimensionsChanged()", 1)[1])
            SUPPORT["compile_run"](work / "negative-control", sources(activity, old), ["AtomicWorkbenchWorkspaceModel.java"], "ls.augment.com.TestSurfaceStartup", arguments=("negative",))
            unguarded = activity.replace("        if (!canInteract()) return; // Surface creation callbacks may already have started an operation.\n", "")
            # The callback transaction alone cannot prevent a producer created during an
            # outer prepare from issuing an inner HOME request before that prepare returns.
            home = MEMBER(unguarded, "private void showNativeHome(int emptySide)")
            marker = "        if (!prepareHomeSurface(slot)) return;"
            tail = home[home.index(marker) + len(marker):]
            if "        if (!canInteract()) return;" in tail:
                tail = tail.replace("        if (!canInteract()) return;", "", 1)
                unguarded = unguarded.replace(MEMBER(unguarded, "private void showNativeHome(int emptySide)"), home[:home.index(marker) + len(marker)] + tail)
            SUPPORT["compile_run"](work / "recovery-negative-control", sources(unguarded, surface), ["AtomicWorkbenchWorkspaceModel.java"], "ls.augment.com.TestSurfaceStartup", arguments=("recovery-duplicate",))


if __name__ == "__main__":
    main()
