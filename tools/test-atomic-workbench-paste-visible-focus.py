"""Exercise native-window-only discovery, exact node focus, full editor verification and cleanup."""
from pathlib import Path
import argparse
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent
PASTE = runpy.run_path(str(ROOT / "test-atomic-workbench-paste.py"))
EVIDENCE = runpy.run_path(str(ROOT / "test-atomic-workbench-editor-evidence.py"))
SUPPORT = PASTE["SUPPORT"]


def run(sources, production, main, mutations=()):
    with tempfile.TemporaryDirectory(prefix="lsa-visible-focus-") as directory:
        SUPPORT["compile_run"](Path(directory), sources, production, main)
    for filename, before, after, expected in mutations:
        source = (SUPPORT["SRC"] / filename).read_text(encoding="utf-8")
        assert source.count(before) == 1, (filename, before)
        changed = dict(sources)
        changed.update({"ls/augment/com/" + name: (SUPPORT["SRC"] / name).read_text(encoding="utf-8") for name in production})
        changed["ls/augment/com/" + filename] = source.replace(before, after)
        with tempfile.TemporaryDirectory(prefix="lsa-visible-focus-negative-") as directory:
            work = Path(directory)
            files = []
            for name, text in changed.items():
                path = work / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(text, encoding="utf-8")
                files.append(str(path))
            compiled = subprocess.run([SUPPORT["JAVAC"], "-encoding", "UTF-8", "-d", str(work / "classes"), *files], capture_output=True, text=True, encoding="utf-8", env=SUPPORT["ENV"], timeout=30)
            if compiled.returncode:
                raise AssertionError(compiled.stdout + compiled.stderr)
            result = subprocess.run([SUPPORT["JAVA"], "-cp", str(work / "classes"), main], capture_output=True, text=True, encoding="utf-8", env=SUPPORT["ENV"], timeout=30)
            if result.returncode == 0 or expected not in result.stdout + result.stderr:
                raise AssertionError(result.stdout + result.stderr)
            print("PASS visible-focus negative control: " + filename + " / " + before)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--negative-controls", action="store_true")
    args = parser.parse_args()
    sources = dict(PASTE["SOURCES"])
    node = "android/view/accessibility/AccessibilityNodeInfo.java"
    sources[node] = sources[node].replace("public boolean enabled=true;", "public boolean enabled=true,actionResult=true;public int textReads;public Runnable onFind;", 1)
    sources[node] = sources[node].replace("public CharSequence getText(){return text;}", "public CharSequence getText(){textReads++;return text;}", 1)
    sources[node] = sources[node].replace("return focus==null?this:focus;", "if(onFind!=null)onFind.run();return focus==null?this:focus;", 1)
    sources[node] = sources[node].replace("if(action!=ACTION_FOCUS||!enabled)return false;", "if(action!=ACTION_FOCUS||!enabled||!actionResult)return false;", 1)
    sources["ls/augment/com/TestVisibleFocus.java"] = (ROOT / "fixtures/AtomicWorkbenchPasteVisibleFocusCases.java.inc").read_text(encoding="utf-8")
    mutations = [
        ("AtomicWorkbenchPasteService.java", "node.isEditable()&&node.isEnabled()", "node.isEditable()", "disabled first editor was selected"),
        ("AtomicWorkbenchPasteService.java", "!receipt.valid||receipt.owner!=this||", "", "interrupted focus receipt authorized capture"),
        ("AtomicWorkbenchPasteService.java", "||!node.equals(receipt.node)", "", "redirected node authorized capture"),
        ("AtomicWorkbenchPasteHost.java", "||!lease.windowEvidence.sameWindow(evidence)", "", "different native window completed discovery"),
    ] if args.negative_controls else []
    run(sources, PASTE["MODELS"] + ["AtomicWorkbenchPasteHost.java"], "ls.augment.com.TestVisibleFocus", mutations)

    sources = dict(EVIDENCE["SOURCES"])
    helper = '''package ls.augment.com;public class QueryBoundary {
      static AtomicWorkbenchPasteRequest request(){return new AtomicWorkbenchPasteRequest("0123456789abcdef0123456789abcdef",7,2,4,0,88,"DuoAtomic-10055-w0-12345678-1234-1234-1234-123456789abc","virtual:root,88",0,10055,10101,42,"example.editor","source",3,"secret never put into WMS parcel",1000,6000);}
      public static android.os.Bundle query(android.os.IBinder wm)throws Exception{return AtomicWorkbenchEditorEvidence.query(wm,request()).toBundle();}
      public static android.os.Bundle window(android.os.IBinder wm)throws Exception{return AtomicWorkbenchEditorEvidence.WindowEvidence.query(wm,request()).toBundle();}
      public static boolean coerces(android.os.Bundle proof){try{AtomicWorkbenchEditorEvidence.fromBundle(proof);return true;}catch(IllegalArgumentException expected){return false;}}
    }'''
    sources["ls/augment/com/QueryBoundary.java"] = helper
    marker = '  System.out.println("EDITOR EVIDENCE RESULT "'
    extra = (ROOT / "fixtures/AtomicWorkbenchPasteWindowEvidenceCases.java.inc").read_text(encoding="utf-8")
    sources["ls/augment/com/hook/TestEditorEvidence.java"] = EVIDENCE["TEST"].replace(marker, EVIDENCE["DEVICE_EVIDENCE_TEST"] + extra + marker)
    mutations = [
        ("hook/AtomicWorkbenchEditorEvidenceHook.java", "a11y!=accessibility(ams,r,first.token)||!first.same(window(service,r))", "false", "window-only phase race authorized"),
    ] if args.negative_controls else []
    run(sources, PASTE["MODELS"][:-1] + ["hook/AtomicWorkbenchImeHook.java", "hook/AtomicWorkbenchEditorEvidenceHook.java", "hook/AtomicWorkbenchDisplayDeviceEvidence.java"], "ls.augment.com.hook.TestEditorEvidence", mutations)


if __name__ == "__main__":
    main()
