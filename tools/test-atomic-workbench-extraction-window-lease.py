"""Run the actual extraction window lease, including partial Window update failures."""
from pathlib import Path
import runpy
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
source = (SUPPORT["SRC"] / "AtomicWorkbenchExtractionActivity.java").read_text(encoding="utf-8")
signature = "private void setTextDragWindowHidden(boolean hidden)"
start = source.index(signature)
end = source.index("{", start) + 1
depth = 1
while depth:
    depth += (source[end] == "{") - (source[end] == "}")
    end += 1
method = source[start:end]
runner = '''package ls.augment.com;
import android.view.WindowManager;
public class TestExtractionWindowLease {
 static int checks;static void check(boolean b,String message){checks++;if(!b)throw new AssertionError(message);}
 static class PhoneWindow {final WindowManager.LayoutParams attributes=new WindowManager.LayoutParams();boolean failOnce;int updates;
  WindowManager.LayoutParams getAttributes(){return attributes;}
  void setAttributes(WindowManager.LayoutParams next){updates++;if(failOnce){failOnce=false;throw new IllegalStateException("Window boundary failure");}}
 }
 static class Host {boolean textDragWindowHidden;int textDragAddedFlags;float textDragWindowAlpha;int notices;PhoneWindow window=new PhoneWindow();
  PhoneWindow getWindow(){return window;}void notice(String message){notices++;}
  METHOD
 }
 public static void main(String[] args){
  Host h=new Host();h.window.attributes.flags=2;h.window.attributes.alpha=.8f;
  h.setTextDragWindowHidden(true);check(h.textDragWindowHidden&&h.window.attributes.flags==26&&h.window.attributes.alpha==0,"parent still intercepts real drag");
  h.setTextDragWindowHidden(true);check(h.window.updates==1,"repeated start overwrote original lease");
  h.setTextDragWindowHidden(false);check(!h.textDragWindowHidden&&h.window.attributes.flags==2&&h.window.attributes.alpha==.8f,"cancel failed to restore parent");
  h.setTextDragWindowHidden(false);check(h.window.updates==2,"repeated end changed window");
  h=new Host();h.window.attributes.flags=18;h.window.attributes.alpha=.7f;h.setTextDragWindowHidden(true);h.setTextDragWindowHidden(false);
  check(h.window.attributes.flags==18&&h.window.attributes.alpha==.7f,"preexisting non-touchable flag was removed");
  h=new Host();h.window.attributes.flags=2;h.window.attributes.alpha=1;h.setTextDragWindowHidden(true);
  h.window.attributes.flags|=0x20000;h.window.attributes.alpha=.4f;h.setTextDragWindowHidden(false);
  check(h.window.attributes.flags==(2|0x20000)&&h.window.attributes.alpha==.4f,"unrelated concurrent attributes were overwritten");
  h=new Host();h.window.attributes.flags=2;h.window.attributes.alpha=.6f;h.window.failOnce=true;h.setTextDragWindowHidden(true);
  check(!h.textDragWindowHidden&&h.window.attributes.flags==2&&h.window.attributes.alpha==.6f&&h.notices==1,"partial hide failure leaked invisible input window");
  h=new Host();h.setTextDragWindowHidden(true);h.window.failOnce=true;h.setTextDragWindowHidden(false);
  check(!h.textDragWindowHidden&&h.window.attributes.flags==0&&h.window.attributes.alpha==1,"end failure left stale local lease");
  System.out.println("EXTRACTION WINDOW LEASE RESULT 6 cases; "+checks+" assertions");
 }
}'''
sources = {
    "android/view/WindowManager.java": "package android.view;public interface WindowManager {class LayoutParams {public static final int FLAG_NOT_TOUCHABLE=16,FLAG_NOT_FOCUSABLE=8;public int flags;public float alpha=1;}}",
    "ls/augment/com/TestExtractionWindowLease.java": runner.replace("METHOD", method),
}
with tempfile.TemporaryDirectory(prefix="lsa-extraction-window-") as folder:
    SUPPORT["compile_run"](Path(folder), sources, [], "ls.augment.com.TestExtractionWindowLease")
for label, before, after in [
    ("parent_release", "attributes.flags |= textDragAddedFlags;", "/* parent release disabled */"),
    ("parent_restore", "attributes.flags &= ~textDragAddedFlags;", "/* restoration disabled */"),
]:
    altered = dict(sources)
    altered["ls/augment/com/TestExtractionWindowLease.java"] = runner.replace("METHOD", method.replace(before, after))
    try:
        with tempfile.TemporaryDirectory(prefix="lsa-extraction-window-negative-") as folder:
            SUPPORT["compile_run"](Path(folder), altered, [], "ls.augment.com.TestExtractionWindowLease")
    except subprocess.CalledProcessError as failure:
        assert Path(failure.cmd[0]).stem.lower() == "java", "Negative control must compile and fail at runtime"
        print("PASS window lease negative control:", label)
    else:
        raise AssertionError("Window lease negative control unexpectedly passed: " + label)
