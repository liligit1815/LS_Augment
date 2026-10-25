"""Exercise the competitive editor's production Back guard and callback lifecycle.

The unchanged production Session, Back guard, callback lifecycle and UiKit header
listener run against Android/UI boundaries. Rendering and persistence are excluded;
the complete ConfigTransferActivity is covered by test-config-transfer-action-host.py.
"""
from pathlib import Path
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-config-transfer-action-host.py")))
SRC = BASE["SRC"]


def member(source, signature):
    start = source.index(signature)
    opening = source.index("{", start)
    depth = 1
    end = opening + 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


source = (SRC / "CompetitiveKeySettingsActivity.java").read_text(encoding="utf-8-sig")
registration = member(source, "if(!backCallbackRegistered)")
toolbar_start = source.index("ui.setBackAction(")
toolbar_registration = source[toolbar_start:source.index(";", toolbar_start) + 1]
callback = source[source.index("private final android.window.OnBackInvokedCallback"):source.index("private final Handler main")]
session = member(source, "private static final class Session")
if "public void onBackPressed()" in source:
    raise AssertionError("The migrated editor still overrides legacy onBackPressed")
guard = member(source, "private void handleBack()")
destroy = member(source, "@Override protected void onDestroy()")
column = member(source, "private LinearLayout column()")
uikit = (SRC / "UiKit.java").read_text(encoding="utf-8-sig")
back_setter = member(uikit, "void setBackAction(")
header_listener = member(member(uikit, "LinearLayout header("), "button.setOnClickListener(view ->")
header_body = header_listener[header_listener.index("{") + 1:-1]

ACTIVITY = """package ls.augment.com;
import android.app.*;import android.os.*;import android.widget.*;import java.util.*;import java.util.concurrent.*;
public final class CompetitiveKeySettingsActivity extends Activity {
""" + session + callback + """
 final Session session=new Session();final UiKit ui=new UiKit(this);private Dialog appDialog,unsavedDialog;
 final Handler main=new Handler();final Runnable save=()->{};
 @Override public void onCreate(Bundle state){super.onCreate(state);
""" + toolbar_registration + registration + "\n}" + guard + destroy + column + "\n}"

BOUNDARIES = r'''package ls.augment.com;
import android.app.*;import android.widget.*;
final class UiKit {
 private Runnable backAction;final Activity activity;UiKit(Activity owner){activity=owner;}
 BACK_SETTER
 void toolbarBack(){HEADER_LISTENER_BODY}
 int text;GuardDialog last;int dialogs;
 Object text(String message,int size,int color,boolean bold){return message;}
 Dialog glassDialog(String title,Object message,String positive,Runnable discard,String negative){
  last=new GuardDialog(discard);dialogs++;last.show();return last;
 }
 static final class GuardDialog extends Dialog {final Runnable discard;GuardDialog(Runnable r){discard=r;}void discard(){discard.run();dismiss();}}
}
'''.replace("BACK_SETTER", back_setter).replace("HEADER_LISTENER_BODY", header_body)

TEST = r'''package ls.augment.com;
import android.os.Bundle;
public final class TestEditorNativeBack {
 static int cases,checks;
 static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
 interface Case{void run();}static void test(String name,Case run){run.run();cases++;System.out.println("PASS editor native Back: "+name);}
 static CompetitiveKeySettingsActivity page(){CompetitiveKeySettingsActivity page=new CompetitiveKeySettingsActivity();page.onCreate(new Bundle());return page;}
 public static void main(String[] args){
  test("saved editor uses ordinary Back once",()->{var p=page();p.getOnBackInvokedDispatcher().invoke();p.getOnBackInvokedDispatcher().invoke();check(p.backCalls==1&&p.finishCalls==1,"native callback recursed or finished twice");p.onDestroy();});
  test("hardware Back uses the same native callback",()->{var p=page();p.hardwareBack();check(p.backCalls==1&&p.finishCalls==1,"hardware Back bypassed native handler or finished twice");p.onDestroy();});
  test("toolbar return uses its page action and preserves default pages",()->{var p=page();p.ui.toolbarBack();check(p.backCalls==1&&p.finishCalls==1,"production header listener did not use page action");p.onDestroy();var other=new Activity();new UiKit(other).toolbarBack();check(other.backCalls==1&&other.finishCalls==1,"default header return changed for unrelated pages");});
  test("native hardware and toolbar return share invalid command guard",()->{var p=page();p.session.rawShell.put("up","invalid\0command");p.session.pending.put("up","old-valid");p.getOnBackInvokedDispatcher().invoke();check(!p.finished&&p.backCalls==0&&p.ui.dialogs==1,"native Back bypassed draft guard");p.hardwareBack();p.ui.toolbarBack();check(p.ui.dialogs==1,"hardware or toolbar Back opened duplicate guard");p.ui.last.dismiss();check(!p.finished&&p.session.pending.size()==1&&p.session.rawShell.size()==1,"continue editing lost raw draft");p.ui.toolbarBack();check(p.ui.dialogs==2&&!p.finished&&p.backCalls==0,"production header listener bypassed draft guard");p.onDestroy();});
  test("discard clears pending values and exits exactly once",()->{var p=page();p.session.rawShell.put("up","x".repeat(16385));p.session.pending.put("up","retained");p.getOnBackInvokedDispatcher().invoke();p.ui.last.discard();check(p.finished&&p.finishCalls==1&&p.backCalls==0&&p.session.pending.isEmpty(),"discard did not clear pending or exited twice");p.onDestroy();check(p.session.worker.isShutdown(),"finishing editor worker not stopped");});
  test("failed save keeps its existing exit protection",()->{var p=page();p.session.failure="save failed";p.session.pending.put("up","command");p.getOnBackInvokedDispatcher().invoke();check(!p.finished&&p.ui.dialogs==1&&p.backCalls==0,"failed save guard bypassed");p.onDestroy();p.session.worker.shutdown();});
  test("failure without pending values keeps normal return",()->{var p=page();p.session.failure="past failure";p.getOnBackInvokedDispatcher().invoke();check(p.backCalls==1&&p.finishCalls==1&&p.ui.dialogs==0,"resolved draft retained stale guard");p.onDestroy();});
  test("lifecycle retains one stable callback and unregisters old owner",()->{var old=page();old.onCreate(new Bundle());check(old.dispatcher.registrations==1&&old.dispatcher.callbacks.size()==1,"callback registered twice");old.onDestroy();check(old.dispatcher.unregistrations==1&&old.dispatcher.callbacks.isEmpty()&&!old.dispatcher.invoke(),"obsolete editor still handles Back");check(!old.session.worker.isShutdown(),"recreation prematurely stopped retained work");old.session.worker.shutdown();var next=page();check(next.dispatcher.registrations==1&&next.dispatcher.callbacks.size()==1,"recreated editor callback missing");next.getOnBackInvokedDispatcher().invoke();check(next.finishCalls==1&&old.finishCalls==0,"Back invoked obsolete Activity");next.onDestroy();});
  System.out.println("EDITOR BACK RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''


def main():
    names = ("android/content/Context.java", "android/content/ContentResolver.java", "android/content/SharedPreferences.java",
             "android/content/Intent.java", "android/content/DialogInterface.java", "android/net/Uri.java", "android/os/Bundle.java",
             "android/os/Handler.java", "android/os/Looper.java", "android/app/Activity.java", "android/app/Dialog.java",
             "android/view/Window.java", "android/view/View.java", "android/window/OnBackInvokedCallback.java",
             "android/window/OnBackInvokedDispatcher.java")
    sources = {name: BASE["STUBS"][name] for name in names}
    sources["android/os/Handler.java"] = sources["android/os/Handler.java"].replace(
        "public void removeCallbacksAndMessages", "public void removeCallbacks(Runnable task){}public void removeCallbacksAndMessages")
    sources["android/widget/LinearLayout.java"] = """package android.widget;public class LinearLayout {
 public static final int VERTICAL=1;public LinearLayout(android.content.Context c){}public void setOrientation(int orientation){}
 public void addView(Object child){}
}"""
    sources.update({
        "ls/augment/com/CompetitiveKeySettingsActivity.java": ACTIVITY[:-1]
            + "public static final class TestEditorNativeBack" + TEST.split("public final class TestEditorNativeBack", 1)[1] + "\n}",
        "ls/augment/com/BackBoundaries.java": BOUNDARIES,
    })
    for name in ("EnhancementOption.java", "CompetitiveKeyOptions.java", "CompetitiveKeyPolicy.java"):
        sources["ls/augment/com/" + name] = (SRC / name).read_text(encoding="utf-8-sig")
    with tempfile.TemporaryDirectory(prefix="lsa-editor-back-") as directory:
        work = Path(directory)
        paths = []
        for name, content in sources.items():
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            paths.append(str(path))
        subprocess.run([BASE["java_tool"]("javac"), "--release", "17", "-encoding", "UTF-8", "-d", str(work / "classes"), *paths], check=True, timeout=60)
        subprocess.run([BASE["java_tool"]("java"), "-Dfile.encoding=UTF-8", f"-Dfixture.cache={work}", "-cp", str(work / "classes"), "ls.augment.com.CompetitiveKeySettingsActivity$TestEditorNativeBack"], check=True, timeout=30)


if __name__ == "__main__":
    main()
