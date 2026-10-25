"""Production pending transactions, durable codec, Dialog ownership, and SDK36 signatures.

Only synthetic desktop temp files and controlled framework boundaries are used.
This is development verification, not a phone feature or device/UI acceptance.
"""
from pathlib import Path
import os
import subprocess
import tempfile
import sys

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
JAVAC, JAVA = str(JDK / "javac.exe"), str(JDK / "java.exe")
ENV = dict(os.environ, PATH=str(JDK) + os.pathsep + os.environ.get("PATH", ""))
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

DIALOG = r'''package android.app;public class Dialog {
 public static boolean failShow,failDismiss;public boolean showing;public int shows,dismisses,cancels;public Runnable listener;
 public Dialog(Activity a){} public boolean isShowing(){return showing;}
 public void show(){shows++;if(failShow)throw new IllegalStateException();showing=true;}
 public void dismiss(){dismisses++;if(failDismiss)throw new IllegalStateException();showing=false;}
 public void cancel(){cancels++;dismiss();}public void lateDismissListener(){if(listener!=null)listener.run();}
}'''
HOST_TEST = r'''package ls.augment.com;import android.app.*;import java.util.*;
public class TestHostDialogs {
 static int checks,cases;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static void test(String n,Runnable r){r.run();cases++;System.out.println("PASS host dialogs: "+n);}
 public static void main(String[] args){
 test("nested show, duplicate show, cancel/dismiss preserve business listener",()->{
  var tracker=new AtomicWorkbenchHostDialogs();var events=new ArrayList<Boolean>();tracker.setObserver(events::add);
  Dialog a=tracker.create(new Activity()),b=tracker.create(new Activity());a.listener=()->{};a.show();a.show();b.show();
  check(tracker.depth()==2&&events.equals(List.of(true)),"duplicate/nested edge");a.cancel();a.dismiss();
  check(events.equals(List.of(true))&&tracker.depth()==1,"premature restore");b.dismiss();b.cancel();
  check(events.equals(List.of(true,false))&&tracker.depth()==0,"last edge duplicated");check(a.listener!=null,"business callback overwritten");});
 test("show failure rolls back real responsibility and next dialog is independent",()->{
  var t=new AtomicWorkbenchHostDialogs();var e=new ArrayList<Boolean>();t.setObserver(e::add);Dialog d=t.create(new Activity());Dialog.failShow=true;
  try{d.show();throw new AssertionError();}catch(IllegalStateException expected){}finally{Dialog.failShow=false;}
  check(t.depth()==0&&e.equals(List.of(true,false)),"failed show leaked");Dialog next=t.create(new Activity());next.show();d.dismiss();
  check(t.depth()==1&&e.equals(List.of(true,false,true)),"old close removed new dialog");next.dismiss();});
 test("close failure retains actual visible window for a later retry",()->{
  var t=new AtomicWorkbenchHostDialogs();var e=new ArrayList<Boolean>();t.setObserver(e::add);Dialog d=t.create(new Activity());d.show();Dialog.failDismiss=true;
  try{d.dismiss();throw new AssertionError();}catch(IllegalStateException expected){}finally{Dialog.failDismiss=false;}
  check(t.depth()==1&&e.equals(List.of(true)),"failed dismissal faked focus release");d.dismiss();check(t.depth()==0&&e.equals(List.of(true,false)),"retry responsibility lost");});
 test("rapid cycle always emits full true false without final-state coalescing",()->{
  var t=new AtomicWorkbenchHostDialogs();var e=new ArrayList<Boolean>();t.setObserver(e::add);for(int i=0;i<5;i++){Dialog d=t.create(new Activity());d.show();d.dismiss();}
  check(e.equals(List.of(true,false,true,false,true,false,true,false,true,false)),"cycle collapsed");});
 test("reentrant nested observers deliver ordered edges",()->{
  var t=new AtomicWorkbenchHostDialogs();var e=new ArrayList<Boolean>();Dialog inner=t.create(new Activity());
  t.setObserver(open->{e.add(open);if(open){inner.show();inner.dismiss();}});Dialog outer=t.create(new Activity());outer.show();
  check(t.depth()==1&&e.equals(List.of(true)),"nested observer edge");outer.dismiss();check(e.equals(List.of(true,false)),"nested observer restore");});
 test("observer replacement detaches old lease and attaches current actual depth",()->{
  var t=new AtomicWorkbenchHostDialogs();var a=new ArrayList<Boolean>();var b=new ArrayList<Boolean>();t.setObserver(a::add);Dialog d=t.create(new Activity());d.show();t.setObserver(b::add);
  check(a.equals(List.of(true,false))&&b.equals(List.of(true)),"replacement focus lease");t.close();check(b.equals(List.of(true,false))&&t.depth()==0,"destroy leaks");
  d.dismiss();check(b.size()==2,"late close notified detached owner");});
 test("no observer has no host behavior and observer exception cannot poison later edges",()->{
  var t=new AtomicWorkbenchHostDialogs();Dialog d=t.create(new Activity());d.show();d.dismiss();check(t.depth()==0,"default tracking");
  t.setObserver(open->{throw new IllegalStateException();});d.show();d.dismiss();var e=new ArrayList<Boolean>();t.setObserver(e::add);d.show();d.dismiss();check(e.equals(List.of(true,false)),"observer exception stuck dispatch");});
 test("destroy retry never claims an actually visible failed-close dialog has gone",()->{
  var t=new AtomicWorkbenchHostDialogs();var e=new ArrayList<Boolean>();t.setObserver(e::add);Dialog d=t.create(new Activity());d.show();Dialog.failDismiss=true;t.close();Dialog.failDismiss=false;
  check(t.depth()==1&&e.equals(List.of(true)),"failed close detached host responsibility");t.close();check(t.depth()==0&&e.equals(List.of(true,false)),"retry close failed");});
 System.out.println("HOST DIALOGS PASS "+cases+" cases / "+checks+" assertions");}}
'''

def run(temp, mutation=None):
    folder = Path(temp)
    files = []
    for name in ("AtomicWorkbenchTransferPolicy.java", "AtomicWorkbenchPendingPayload.java", "AtomicWorkbenchPendingRepository.java", "AtomicWorkbenchHostDialogs.java"):
        value = (SRC / name).read_text(encoding="utf-8")
        if mutation and mutation[0] == name:
            assert mutation[1] in value
            value = value.replace(mutation[1], mutation[2], 1)
        target = folder / "ls/augment/com" / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(value, encoding="utf-8"); files.append(str(target))
    for relative, value in {
        "android/app/Activity.java": "package android.app;public class Activity {}",
        "android/app/Dialog.java": DIALOG,
        "ls/augment/com/TestHostDialogs.java": HOST_TEST,
        "ls/augment/com/TestAtomicWorkbenchPendingRepository.java": (ROOT / "tools/TestAtomicWorkbenchPendingRepository.java").read_text(encoding="utf-8"),
    }.items():
        target = folder / relative; target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(value, encoding="utf-8"); files.append(str(target))
    subprocess.run([JAVAC, "--release", "17", "-encoding", "UTF-8", "-d", str(folder / "classes"), *files], check=True, env=ENV, capture_output=True)
    results = [subprocess.run([JAVA, "-cp", str(folder / "classes"), "ls.augment.com." + entry], capture_output=True, encoding="utf-8", env=ENV, timeout=30)
               for entry in ("TestAtomicWorkbenchPendingRepository", "TestHostDialogs")]
    return results

def main():
    with tempfile.TemporaryDirectory(prefix="duo-pending-") as temp:
        for result in run(temp):
            print(result.stdout, end="")
            if result.returncode: raise AssertionError(result.stderr)
    mutations = {
        "late source resurrects after clear": ("AtomicWorkbenchPendingRepository.java", "!before.id.equals(id) || before.revision != revision", "false"),
        "whole delivery silently omits broken item": ("AtomicWorkbenchPendingRepository.java", "if (!current.deliverable()) throw", "if (false) throw"),
        "save refusal pretends successful empty": ("AtomicWorkbenchPendingRepository.java", 'new Result(false, "save_failed"', 'new Result(true, "save_failed"'),
        "duplicate dialog loses old window lease": ("AtomicWorkbenchHostDialogs.java", "if (visible.remove(dialog) && visible.isEmpty())", "if (visible.remove(dialog))"),
    }
    for name, mutation in mutations.items():
        with tempfile.TemporaryDirectory(prefix="duo-pending-negative-") as temp:
            results = run(temp, mutation)
            if all(result.returncode == 0 for result in results): raise AssertionError("negative survived: " + name)
            print("EXPECTED FAILURE " + name)
    print("PENDING/FOCUS OFFLINE BOUNDARIES PASS; PHONE ACCEPTANCE NOT RUN")

if __name__ == "__main__":
    main()
