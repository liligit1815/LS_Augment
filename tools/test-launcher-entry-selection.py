"""Compile the actual launcher entry selector with a minimal non-Android host."""
from pathlib import Path
import re
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1]
source = (root / "redmagic-launcher/helper-src/main/com/android/quickstep/views/LsNativeStack.java").read_text(encoding="utf-8")
method = re.search(r"    private static int getInitialTaskOrdinal\(.*?\n    }", source, re.S)
assert method, "entry selector missing"
progress = re.search(r"    private static float getEntryPagePosition\(.*?\n    }", source, re.S)
assert progress, "entry animator sample missing"
scale = re.search(r"    public static float normalizeLiveAppliedScale\(.*?\n    }", source, re.S)
assert scale, "live scale normalization missing"
harness = """
import java.lang.ref.WeakReference;
public class EntrySelectionTest {
    static final class RecentsView {}
    static boolean entryFromApp;
    static boolean liveSimulatorOverviewTarget;
    static float liveEntryPageProgress;
    static float lastLiveAppliedScale,liveEntryStartScale,focusScale=1.1f;
    static boolean overviewEntryPending;
    static WeakReference<RecentsView> overviewPendingRecents = new WeakReference<>(null);
    static final class Context { Object getResources(){ return null; } }
    static boolean usesNativeStackStyle(Context context){ return true; }
    static void loadConfig(Object resources){}
    static WeakReference<RecentsView> activeOverviewRecents = new WeakReference<>(null);
    SELECTOR
    static void expect(RecentsView view, int count, int expected) {
        if (getInitialTaskOrdinal(view, count) != expected) throw new AssertionError("count="+count);
    }
    public static void main(String[] args) {
        RecentsView current=new RecentsView(), other=new RecentsView();
        activeOverviewRecents=new WeakReference<>(current);
        for(int count : new int[]{0,1,2,3,20}) expect(current,count,0);
        entryFromApp=true;
        expect(current,0,0); expect(current,1,0);
        expect(current,2,1); expect(current,20,1);
        expect(other,20,0);
        // A new Home entry must not inherit the prior app entry's focus.
        entryFromApp=false; expect(current,20,0);
        liveSimulatorOverviewTarget=true;
        for(float frame:new float[]{0,.1f,.3f,.7f,1}){
            liveEntryPageProgress=frame;
            if(getEntryPagePosition(current,20)!=0)throw new AssertionError("Home must remain first");
        }
        entryFromApp=true;
        for(float frame:new float[]{0,.1f,.3f,.7f,1}){
            liveEntryPageProgress=frame;
            if(getEntryPagePosition(current,20)!=frame)throw new AssertionError("App animator continuity");
            if(getEntryPagePosition(current,1)!=0)throw new AssertionError("Single task must remain first");
            if(getEntryPagePosition(other,20)!=0)throw new AssertionError("Other view must not animate");
        }
        liveSimulatorOverviewTarget=false;
        if(getEntryPagePosition(current,20)!=1)throw new AssertionError("Final native page mismatch");
        Context context=new Context();
        if(normalizeLiveAppliedScale(context,.8f)!=.8f)throw new AssertionError("Non-entry scale changed");
        liveEntryStartScale=lastLiveAppliedScale;liveSimulatorOverviewTarget=true;
        for(float frame:new float[]{0,.1f,.3f,.7f,1}){
            liveEntryPageProgress=frame;
            float expected=.8f+.3f*frame;
            if(Math.abs(normalizeLiveAppliedScale(context,.8f)-expected)>.00001f)throw new AssertionError("Scale jump");
            if(normalizeLiveAppliedScale(context,1.8f)!=1.8f)throw new AssertionError("Fullscreen scale clipped");
        }
        System.out.println("PASS Home/app, empty/single/multiple tasks and cross-view entry isolation");
    }
}
""".replace("SELECTOR", method.group()+"\n"+progress.group()+"\n"+scale.group())
with tempfile.TemporaryDirectory(prefix="ls-entry-test-") as folder:
    path=Path(folder)/"EntrySelectionTest.java"
    path.write_text(harness,encoding="utf-8")
    subprocess.run(["javac","-encoding","UTF-8","-d",folder,str(path)],check=True)
    subprocess.run(["java","-cp",folder,"EntrySelectionTest"],check=True)
