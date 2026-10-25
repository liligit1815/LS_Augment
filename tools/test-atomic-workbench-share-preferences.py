"""Real receiver-preference persistence, ordering, failure and lifecycle regressions.

No phone, root process, personal content, or Gradle build is used.
"""
from pathlib import Path
import os
import runpy
import subprocess
import tempfile

BOUNDARY = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-share-targets.py")))
SUPPORT = BOUNDARY["SUPPORT"]
SOURCES = dict(BOUNDARY["SOURCES"])
SOURCES["android/content/Context.java"] = SOURCES["android/content/Context.java"].replace(
    'public String getPackageName()', 'public java.io.File getFilesDir(){return new java.io.File("unused-test-directory");}public String getPackageName()')
SOURCES["android/util/AtomicFile.java"] = r'''package android.util;
public class AtomicFile {final java.io.File file;public AtomicFile(java.io.File file){this.file=file;}
 public java.io.File getBaseFile(){return file;}public java.io.FileInputStream openRead()throws java.io.IOException{return new java.io.FileInputStream(file);}
 public java.io.FileOutputStream startWrite()throws java.io.IOException{return new java.io.FileOutputStream(file);}
 public void finishWrite(java.io.FileOutputStream out){try{out.close();}catch(java.io.IOException e){throw new RuntimeException(e);}}
 public void failWrite(java.io.FileOutputStream out){try{out.close();}catch(java.io.IOException ignored){}}}
'''

TEST = r'''package ls.augment.com;
import java.util.*;import java.io.*;import android.content.*;
public class TestSharePreferences {
 static int cases,checks;static synchronized void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 interface Case{void run()throws Exception;}static void test(String name,Case body)throws Exception{body.run();cases++;System.out.println("PASS receiver preferences: "+name);}
 static class Disk implements AtomicWorkbenchSharePreferences.Storage {
  byte[] bytes;boolean failRead,failWrite,silentFailure;int writes;
  public byte[] read()throws IOException{if(failRead)throw new IOException("injected read failure");return bytes==null?null:bytes.clone();}
  public void write(byte[] value)throws IOException{writes++;if(failWrite)throw new IOException("injected full disk");if(!silentFailure)bytes=value.clone();}
 }
 static final AtomicWorkbenchShareTargetRepository.Descriptor DESC=new AtomicWorkbenchShareTargetRepository.Descriptor(true,List.of());
 static AtomicWorkbenchShareTargetRepository.Target t(String pkg,String name){return t(0,pkg,name);}
 static AtomicWorkbenchShareTargetRepository.Target t(int user,String pkg,String name){return new AtomicWorkbenchShareTargetRepository.Target(new ComponentName(pkg,name),user,name,pkg,null,DESC);}
 static String keys(List<AtomicWorkbenchShareTargetRepository.Target> list){StringJoiner joined=new StringJoiner(",");for(var target:list)joined.add(target.key());return joined.toString();}
 static void ok(AtomicWorkbenchSharePreferences.Result result){check(result.success,result.message);}
 static void order(AtomicWorkbenchSharePreferences prefs,List<AtomicWorkbenchShareTargetRepository.Target> catalog,AtomicWorkbenchShareTargetRepository.Target... expected){
  check(keys(prefs.visibleOrdered(catalog)).equals(keys(Arrays.asList(expected))),"wrong visible order: "+keys(prefs.visibleOrdered(catalog)));}
 public static void main(String[] args)throws Exception{
  test("defaults retain repository order and distinct components while foreign users stay absent",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.a","Two");var c=t("pkg.c","ShareOnly");var foreign=t(10,"pkg.a","One");
   order(prefs,List.of(a,b,c,foreign,a),a,b,c);check(prefs.managedOrdered(List.of(a,foreign)).size()==1,"foreign manager entry");
   check(!prefs.setTargetVisible(foreign,false).success&&disk.writes==0,"foreign mutation accepted");
  });
  test("app visibility preserves independently hidden activity across process recreation",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.a","Two");var c=t("pkg.c","Only");var all=List.of(a,b,c);
   ok(prefs.setTargetVisible(a,false));order(prefs,all,b,c);ok(prefs.setAppVisible(b,false));order(prefs,all,c);
   var restarted=new AtomicWorkbenchSharePreferences(0,disk);check(!restarted.appVisible(a)&&!restarted.targetVisible(a)&&restarted.targetVisible(b),"hidden state lost on restart");
   ok(restarted.setAppVisible(a,true));order(restarted,all,b,c);check(restarted.managedOrdered(all).size()==3,"hidden target dropped from management");
  });
  test("app and activity pins are independent and both persist",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.a","Two");var c=t("pkg.c","Only");var all=List.of(a,b,c);
   ok(prefs.setTargetPinned(b,true));order(prefs,all,b,a,c);ok(prefs.setAppPinned(c,true));order(prefs,all,c,b,a);
   var next=new AtomicWorkbenchSharePreferences(0,disk);check(next.appPinned(c)&&next.targetPinned(b)&&!next.appPinned(b),"pin scope or persistence lost");order(next,all,c,b,a);
  });
  test("real app and activity moves persist and hidden siblings retain their order",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.a","Two");var c=t("pkg.c","Only");var all=List.of(a,b,c);
   ok(prefs.moveTarget(all,b.key(),a.key()));ok(prefs.moveApp(all,prefs.appKey(c),prefs.appKey(a)));order(prefs,all,c,b,a);
   ok(prefs.setTargetVisible(b,false));order(prefs,all,c,a);var next=new AtomicWorkbenchSharePreferences(0,disk);ok(next.setTargetVisible(b,true));order(next,all,c,b,a);
   ok(next.moveTarget(all,b.key(),null));order(next,all,c,a,b);ok(next.moveApp(all,next.appKey(c),null));order(next,all,a,b,c);
  });
  test("cross-app and cross-pin drags are rejected without modifying storage",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.a","Two");var c=t("pkg.c","Only");var all=List.of(a,b,c);
   ok(prefs.setTargetPinned(b,true));ok(prefs.setAppPinned(c,true));byte[] before=disk.bytes.clone();int writes=disk.writes;
   check(!prefs.moveTarget(all,a.key(),b.key()).success,"cross-pin target move accepted");check(!prefs.moveTarget(all,a.key(),c.key()).success,"cross-app target move accepted");
   check(!prefs.moveApp(all,prefs.appKey(a),prefs.appKey(c)).success,"cross-pin app move accepted");
   check(!prefs.moveTarget(all,"10:pkg.a/One",a.key()).success,"foreign-key target move accepted");
   check(Arrays.equals(before,disk.bytes)&&writes==disk.writes,"rejected move changed disk");order(prefs,all,c,b,a);
  });
  test("MIME-limited catalogs never erase absent hidden pinned or ordered entries",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.a","Two");var c=t("pkg.c","Only");var all=List.of(a,b,c);
   ok(prefs.setTargetVisible(a,false));ok(prefs.setTargetPinned(a,true));ok(prefs.moveApp(all,prefs.appKey(c),prefs.appKey(a)));
   ok(prefs.setAllVisible(List.of(c),false));ok(prefs.setAllVisible(List.of(c),true));
   var next=new AtomicWorkbenchSharePreferences(0,disk);check(!next.targetVisible(a)&&next.targetPinned(a),"absent activity overwritten");order(next,all,c,b);
   ok(next.setTargetVisible(a,true));order(next,all,c,a,b);
  });
  test("select all and select none are real persisted bulk visibility operations",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.a","Two");var c=t("pkg.c","Only");var all=List.of(a,b,c);
   ok(prefs.setAllVisible(all,false));order(prefs,all);check(!prefs.appVisible(a)&&!prefs.targetVisible(b),"bulk hidden only changed one layer");
   var next=new AtomicWorkbenchSharePreferences(0,disk);order(next,all);ok(next.setAllVisible(all,true));order(next,all,a,b,c);
  });
  test("expand collapse persists independently from visibility and pins",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.a","Two");var c=t("pkg.c","Only");var all=List.of(a,b,c);
   ok(prefs.setAllExpanded(all,false));check(!prefs.expanded(a)&&!prefs.expanded(c),"bulk collapse missing");order(prefs,all,a,b,c);
   ok(prefs.setExpanded(b,true));var next=new AtomicWorkbenchSharePreferences(0,disk);check(next.expanded(a)&&!next.expanded(c),"group fold not restored");
   ok(next.setAllExpanded(List.of(c),true));check(next.expanded(a)&&next.expanded(c),"bulk expanded changed absent group");
   var snapshot=next.settings(all);check(snapshot.size()==3&&snapshot.get(0).appVisible&&snapshot.get(0).expanded,"settings snapshot wrong");
   try{snapshot.clear();throw new AssertionError("mutable settings snapshot");}catch(UnsupportedOperationException expected){checks++;}
  });
  test("failed and silently ignored writes report failure and retain durable visibility",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");ok(prefs.setTargetVisible(a,false));byte[] before=disk.bytes.clone();
   disk.failWrite=true;var failed=prefs.setTargetVisible(a,true);check(!failed.success&&!failed.message.isEmpty(),"disk failure reported saved");
   check(Arrays.equals(before,disk.bytes),"failed write replaced durable bytes");order(prefs,List.of(a));
   disk.failWrite=false;disk.silentFailure=true;check(!prefs.setTargetVisible(a,true).success,"read-back mismatch reported saved");order(prefs,List.of(a));
   disk.silentFailure=false;ok(prefs.setTargetVisible(a,true));order(prefs,List.of(a),a);
  });
  test("unreadable and corrupt storage fails closed and cannot be overwritten by a toggle",()->{
   Disk disk=new Disk();var prefs=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");ok(prefs.setTargetVisible(a,false));byte[] valid=disk.bytes.clone();
   disk.failRead=true;int writes=disk.writes;check(!prefs.setAllVisible(List.of(a),true).success&&writes==disk.writes,"unreadable data overwritten");order(prefs,List.of(a));
   disk.failRead=false;disk.bytes=new byte[]{1,2,3};check(!prefs.status().isEmpty(),"corrupt store appears healthy");
   check(!prefs.setTargetVisible(a,true).success&&writes==disk.writes,"corrupt data overwritten");order(prefs,List.of(a));
   disk.bytes=valid;check(prefs.status().isEmpty(),"recoverable read error latched forever");order(prefs,List.of(a));
  });
  test("same-user stale instances merge latest values instead of losing each other's changes",()->{
   Disk disk=new Disk();var first=new AtomicWorkbenchSharePreferences(0,disk);var second=new AtomicWorkbenchSharePreferences(0,disk);var a=t("pkg.a","One");var b=t("pkg.b","Two");
   first.visibleOrdered(List.of(a,b));second.visibleOrdered(List.of(a,b));ok(first.setTargetVisible(a,false));ok(second.setTargetPinned(b,true));
   var next=new AtomicWorkbenchSharePreferences(0,disk);check(!next.targetVisible(a)&&next.targetPinned(b),"stale instance lost a prior setting");order(next,List.of(a,b),b);
  });
  test("different users are isolated and cannot relabel another user's preferences",()->{
   Disk disk0=new Disk(),disk10=new Disk();var zero=new AtomicWorkbenchSharePreferences(0,disk0);var ten=new AtomicWorkbenchSharePreferences(10,disk10);var a=t("pkg.a","One");var clone=t(10,"pkg.a","One");
   ok(zero.setTargetVisible(a,false));ok(ten.setTargetPinned(clone,true));check(!zero.targetVisible(a)&&ten.targetVisible(clone),"users share visibility");
   disk10.bytes=disk0.bytes.clone();int writes=disk10.writes;check(!ten.status().isEmpty()&&!ten.setTargetVisible(clone,false).success&&writes==disk10.writes,"foreign store accepted or rewritten");order(ten,List.of(clone));
  });
  test("concurrent independently-created managers preserve all completed mutations",()->{
   Disk disk=new Disk();List<Thread> threads=new ArrayList<>();List<Throwable> failures=Collections.synchronizedList(new ArrayList<>());
   for(int i=0;i<16;i++){final int index=i;Thread thread=new Thread(()->{try{var prefs=new AtomicWorkbenchSharePreferences(0,disk);ok(prefs.setTargetVisible(t("pkg."+index,"Share"),false));}catch(Throwable failure){failures.add(failure);}});threads.add(thread);thread.start();}
   for(Thread thread:threads)thread.join();check(failures.isEmpty(),"concurrent mutation failed");var restored=new AtomicWorkbenchSharePreferences(0,disk);
   for(int i=0;i<16;i++)check(!restored.targetVisible(t("pkg."+i,"Share")),"completed concurrent hide lost");
  });
  System.out.println("SHARE PREFERENCES RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    sources = dict(SOURCES)
    sources["ls/augment/com/TestSharePreferences.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="lsa-share-preferences-") as directory:
        SUPPORT["compile_run"](Path(directory), sources,
            ["AtomicWorkbenchTransferPolicy.java", "AtomicWorkbenchShareTargetRepository.java", "AtomicWorkbenchSharePreferences.java"],
            "ls.augment.com.TestSharePreferences")
    sdk_compile()


def sdk_compile():
    """Compile both production files against real SDK 36, with only local app collaborators stubbed."""
    root = Path(__file__).resolve().parents[1]
    sdk = root / "audit-output/android-sdk/platforms/android-36/android.jar"
    if not sdk.is_file():
        raise RuntimeError("SDK 36 android.jar is required for management-UI API verification")
    ui = r'''package ls.augment.com;
import android.app.*;import android.view.*;import android.widget.*;import android.graphics.drawable.*;
final class UiKit {int muted,danger,accentContainer;
 TextView text(String value,float size,int color,boolean bold){return null;}
 LinearLayout.LayoutParams margins(int left,int top,int right,int bottom){return null;}
 LinearLayout groupRow(){return null;}LinearLayout preferenceCard(){return null;}
 Button tonalButton(String label){return null;}Button button(String label){return null;}
 int dp(float value){return 0;}void styleCheckBox(CheckBox value){}
 Dialog glassDialog(String title,View content,String positive,Runnable action,String negative){return null;}
 Dialog choiceDialog(String title,String[] names,String[] descriptions,java.util.function.IntConsumer callback){return null;}
 Drawable round(int color,int radius){return null;}}
'''
    with tempfile.TemporaryDirectory(prefix="lsa-share-management-sdk36-") as directory:
        work = Path(directory)
        stub = work / "ls/augment/com/UiKit.java"
        stub.parent.mkdir(parents=True)
        stub.write_text(ui, encoding="utf-8")
        payload = stub.with_name("AtomicWorkbenchTransferStore.java")
        payload.write_text(SOURCES["ls/augment/com/AtomicWorkbenchTransferStore.java"], encoding="utf-8")
        production = root / "android/app/src/main/java/ls/augment/com"
        files = [production / name for name in ("AtomicWorkbenchTransferPolicy.java", "AtomicWorkbenchShareTargetRepository.java",
                 "AtomicWorkbenchSharePreferences.java", "AtomicWorkbenchShareTargetControls.java")]
        command = [SUPPORT["JAVAC"], "-encoding", "UTF-8", "-classpath", str(sdk), "-sourcepath", str(work),
                   "-d", str(work / "classes"), str(stub), str(payload), *map(str, files)]
        result = subprocess.run(command, text=True, encoding="utf-8", errors="replace", capture_output=True, env=SUPPORT["ENV"])
        if result.returncode:
            raise AssertionError(result.stdout + result.stderr)
        print("PASS share-management production APIs: SDK 36 javac")


if __name__ == "__main__":
    main()
