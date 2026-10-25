"""Exercise production import conflict Dialog callbacks, cancellation and recreation fences."""
from pathlib import Path
import importlib.util
import subprocess
import tempfile
SPEC = importlib.util.spec_from_file_location("pending", Path(__file__).with_name("test-atomic-workbench-pending.py"))
P = importlib.util.module_from_spec(SPEC); SPEC.loader.exec_module(P)
STUBS = {
"android/content/Context.java": "package android.content;public class Context {}",
"android/content/DialogInterface.java": "package android.content;public interface DialogInterface {interface OnDismissListener{void onDismiss(DialogInterface d);}}",
"android/app/Activity.java": "package android.app;public class Activity {public final android.content.Context app=new android.content.Context();public android.content.Context getApplicationContext(){return app;}public boolean isDestroyed(){return false;}public boolean isFinishing(){return false;}}",
"android/app/Dialog.java": r'''package android.app;public class Dialog implements android.content.DialogInterface {public android.widget.LinearLayout body;public boolean showing=true;public OnDismissListener listener;public void setOnDismissListener(OnDismissListener l){listener=l;}public void dismiss(){showing=false;OnDismissListener l=listener;if(l!=null)new android.os.Handler(null).post(()->l.onDismiss(this));}public boolean isShowing(){return showing;}}''',
"android/os/Looper.java": "package android.os;public class Looper {public static Looper getMainLooper(){return null;}}",
"android/os/Handler.java": r'''package android.os;import java.util.concurrent.*;public class Handler {static final ConcurrentLinkedQueue<Runnable>tasks=new ConcurrentLinkedQueue<>();public Handler(Looper l){}public void post(Runnable r){tasks.add(r);}public static void drain(){for(;;){Runnable r=tasks.poll();if(r==null)return;r.run();}}}''',
"android/view/View.java": "package android.view;public class View {public interface OnClickListener{void onClick(View v);}public OnClickListener click;public void setOnClickListener(OnClickListener l){click=l;}public void click(){click.onClick(this);}}",
"android/widget/Button.java": "package android.widget;public class Button extends android.view.View {public String text;public Button(String s){text=s;}public void setMinimumHeight(int h){}}",
"android/widget/LinearLayout.java": "package android.widget;import java.util.*;public class LinearLayout extends android.view.View {public static final int VERTICAL=1;public final List<android.view.View>children=new ArrayList<>();public LinearLayout(android.app.Activity a){}public void setOrientation(int o){}public void addView(android.view.View v,Object p){children.add(v);}}",
"ls/augment/com/UiKit.java": r'''package ls.augment.com;import android.app.*;import android.widget.*;import android.view.*;import java.util.*;class UiKit {int muted;final List<Dialog>dialogs=new ArrayList<>();int dp(int d){return d;}Button button(String s){return new Button(s);}Object margins(int a,int b,int c,int d){return null;}Object wrap(){return null;}View text(String s,int n,int color,boolean b){return new View();}Dialog glassDialog(String t,View body,String p,Runnable r,String n){Dialog d=new Dialog();d.body=(LinearLayout)body;dialogs.add(d);return d;}Dialog last(){return dialogs.get(dialogs.size()-1);}}''',
"ls/augment/com/AtomicWorkbenchTransfer.java": r'''package ls.augment.com;class AtomicWorkbenchTransfer {static final java.util.concurrent.ExecutorService IO=java.util.concurrent.Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r);t.setDaemon(true);return t;});}''',
"ls/augment/com/AtomicWorkbenchPendingStorage.java": 'package ls.augment.com;class AtomicWorkbenchPendingStorage {static <T>T withWriteGeneration(long g,java.util.function.Supplier<T>s){return s.get();}}',
"ls/augment/com/AtomicWorkbenchTransferStore.java": r'''package ls.augment.com;import android.content.Context;class AtomicWorkbenchTransferStore {static int discarded,published;
 static class Payload{final String text;final long created;final long generation=ResetWriteFence.generation();boolean owned=true;Payload(String t,long c){text=t;created=c;}}
 static AtomicWorkbenchPendingPayload batch(Context c,Payload p)throws java.io.IOException{return new AtomicWorkbenchPendingPayload(java.util.UUID.randomUUID().toString(),0,p.text,p.created,false,java.util.List.of(),AtomicWorkbenchPendingPayload.State.READY);}
 static void published(Payload p){p.owned=false;published++;}static void discardUnpublished(Context c,Payload p){if(p!=null&&p.owned){p.owned=false;discarded++;}}}''',
}
TEST = r'''package ls.augment.com;import android.app.*;import android.os.Handler;import android.widget.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public class TestPendingImport {static int cases,checks;interface Case{void run()throws Exception;}static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}static void test(String n,Case r)throws Exception{r.run();cases++;System.out.println("PASS pending import: "+n);}
 static void settle()throws Exception{for(int i=0;i<5;i++){AtomicWorkbenchTransfer.IO.submit(()->{}).get(2,TimeUnit.SECONDS);Handler.drain();}}
 static void click(UiKit ui,int choice){((Button)ui.last().body.children.get(choice*2)).click();}
 static final class Disk implements AtomicWorkbenchPendingRepository.Storage {byte[]bytes;int fail;public byte[]read(){return bytes;}public void write(byte[]b)throws java.io.IOException{if(fail==1)throw new java.io.IOException();if(fail==2)throw new AtomicWorkbenchPendingRepository.UncertainSave();bytes=b.clone();}}
 static final class F {final Activity a=new Activity();final UiKit ui=new UiKit();final Disk disk=new Disk();final AtomicWorkbenchPendingRepository repo=new AtomicWorkbenchPendingRepository(disk,(item,now)->item,System::currentTimeMillis);final AtomicWorkbenchPendingPayload before;final AtomicWorkbenchTransferStore.Payload staged=new AtomicWorkbenchTransferStore.Payload("new",System.currentTimeMillis());final AtomicReference<AtomicWorkbenchPendingRepository.Result>result=new AtomicReference<>();final AtomicInteger callbacks=new AtomicInteger();final AtomicWorkbenchPendingImport prompt;
 F(boolean existing){var empty=repo.load();if(existing)before=repo.put(empty.id,empty.revision,new AtomicWorkbenchPendingPayload(UUID.randomUUID().toString(),0,"old",System.currentTimeMillis(),false,List.of(),AtomicWorkbenchPendingPayload.State.READY),AtomicWorkbenchPendingRepository.Mode.APPEND,AtomicWorkbenchPendingRepository.TextChoice.REQUIRE_CHOICE).snapshot;else before=empty;
 prompt=new AtomicWorkbenchPendingImport(a,ui,repo,before,staged,(r,e)->{result.set(r);callbacks.incrementAndGet();});}}
 public static void main(String[] args)throws Exception{
 test("empty import commits only after durable transaction and releases ownership once",()->{F f=new F(false);f.prompt.show();settle();check(f.result.get().success&&f.repo.load().text.equals("new"),"empty not saved");check(!f.staged.owned&&f.callbacks.get()==1,"published ownership/callback");});
 test("append text requires second explicit choice and delayed old dismiss cannot cancel it",()->{F f=new F(true);f.prompt.show();settle();check(f.repo.load().text.equals("old")&&f.callbacks.get()==0,"mode silently committed");click(f.ui,0);Dialog textChoice=f.ui.last();settle();check(textChoice.isShowing()&&f.callbacks.get()==0,"old delayed dismiss cancelled new choice");click(f.ui,2);settle();check(f.result.get().success&&f.repo.load().text.equals("old\nnew"),"merge wrong");});
 test("explicit replace and keep text have distinct resulting contents",()->{for(int mode:new int[]{0,1}){F f=new F(true);f.prompt.show();settle();click(f.ui,mode);if(mode==0){settle();click(f.ui,0);}settle();check(f.result.get().success&&f.repo.load().text.equals(mode==0?"old":"new"),"keep/replace wrong");}});
 test("cancel discards only staged private bytes and never changes old pending",()->{F f=new F(true);int discarded=AtomicWorkbenchTransferStore.discarded;f.prompt.show();settle();f.ui.last().dismiss();settle();check(f.callbacks.get()==1&&f.result.get()==null&&f.repo.load().text.equals("old"),"cancel changed pending");check(!f.staged.owned&&AtomicWorkbenchTransferStore.discarded==discarded+1,"cancel ownership not reclaimed");});
 test("late decision cannot undo a clear committed after source read began",()->{F f=new F(true);f.prompt.show();settle();check(f.repo.clear(f.before.id,f.before.revision).success,"fixture clear");click(f.ui,1);settle();check(!f.result.get().success&&f.result.get().reason.equals("conflict")&&f.repo.load().empty(),"late import resurrected queue");check(!f.staged.owned,"rejected private bytes leaked");});
 test("actual failed save preserves old content while unknown result retains staged bytes",()->{for(int failure:new int[]{1,2}){F f=new F(true);f.prompt.show();settle();f.disk.fail=failure;int discarded=AtomicWorkbenchTransferStore.discarded;click(f.ui,1);settle();check(!f.result.get().success&&f.repo.load().text.equals("old"),"failed save claimed new");check(failure==1?AtomicWorkbenchTransferStore.discarded==discarded+1:AtomicWorkbenchTransferStore.discarded==discarded,"unknown durable result deleted maybe-published bytes");}});
 test("configuration detach before decision preserves bytes for new Activity controller",()->{F f=new F(true);f.prompt.show();settle();f.prompt.detachForRecreation();settle();check(f.staged.owned&&f.callbacks.get()==0,"detached controller destroyed retained batch");var next=new AtomicWorkbenchPendingImport(new Activity(),f.ui,f.repo,f.before,f.staged,(r,e)->{f.result.set(r);f.callbacks.incrementAndGet();});next.show();settle();click(f.ui,1);settle();check(f.result.get().success&&f.callbacks.get()==1&&!f.staged.owned,"recreated prompt lost source/published twice");});
 test("configuration detach while commit queued reports one durable result to retained session",()->{F f=new F(true);f.prompt.show();settle();CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);AtomicBoolean committing=new AtomicBoolean();f.prompt.setCommitObserver(committing::set);
  AtomicWorkbenchTransfer.IO.submit(()->{entered.countDown();try{release.await();}catch(InterruptedException e){throw new RuntimeException(e);}});check(entered.await(1,TimeUnit.SECONDS),"barrier");click(f.ui,1);check(committing.get(),"commit lifecycle absent");f.prompt.detachForRecreation();release.countDown();settle();check(f.callbacks.get()==1&&f.result.get().success&&!committing.get()&&!f.staged.owned,"queued commit lost/double on recreation");});
 test("reset generation invalidates pre-reset decision even when reset stopped before clearing content",()->{F f=new F(true);f.prompt.show();settle();ResetWriteFence.begin();ResetWriteFence.end();click(f.ui,1);settle();check(!f.result.get().success&&f.result.get().reason.equals("reset_stale")&&f.repo.load().text.equals("old"),"pre-reset prompt survived generation fence");});
 System.out.println("PENDING IMPORT PASS "+cases+" cases / "+checks+" assertions");}}
'''

def execute(temp, mutation=None):
    files = []; sources = dict(STUBS)
    sources["ls/augment/com/TestPendingImport.java"] = TEST
    for name in ("AtomicWorkbenchPendingImport.java", "AtomicWorkbenchPendingRepository.java", "AtomicWorkbenchPendingPayload.java", "AtomicWorkbenchTransferPolicy.java", "ResetWriteFence.java"):
        source = (P.SRC / name).read_text(encoding="utf-8")
        if mutation and name == "AtomicWorkbenchPendingImport.java":
            assert mutation[0] in source
            source = source.replace(*mutation, 1)
        sources["ls/augment/com/" + name] = source
    for name, source in sources.items():
        path = Path(temp) / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(source, encoding="utf-8"); files.append(str(path))
    build = subprocess.run([P.JAVAC, "--release", "17", "-encoding", "UTF-8", "-d", str(Path(temp)/"classes"), *files], capture_output=True, encoding="utf-8", errors="replace", env=P.ENV)
    if build.returncode: raise AssertionError(build.stderr)
    return subprocess.run([P.JAVA, "-Dfile.encoding=UTF-8", "-cp", str(Path(temp)/"classes"), "ls.augment.com.TestPendingImport"], capture_output=True, encoding="utf-8", errors="replace", env=P.ENV, timeout=15)

def main():
    with tempfile.TemporaryDirectory(prefix="duo-pending-import-") as temp:
        result = execute(temp); print(result.stdout, end="")
        if result.returncode: raise AssertionError(result.stderr)
    for name, mutation in {
        "late dismiss cancels current text choice": ("if (dialog == opening)", "if (true)"),
        "unknown save deletes possibly published bytes": ('result.success || "save_unknown".equals(result.reason)', "result.success"),
        "configuration detach drops queued commit": ("if (closed && !detached) return;", "if (closed) return;"),
        "pre-reset decision overwrites after reset ends": ("if (ResetWriteFence.stale(staged.generation))", "if (false)"),
    }.items():
        with tempfile.TemporaryDirectory(prefix="duo-pending-import-negative-") as temp:
            result = execute(temp, mutation)
            if result.returncode == 0: raise AssertionError("negative survived: " + name)
            print("EXPECTED FAILURE " + name)
    print("PENDING IMPORT OFFLINE PASS; ACTUAL SHARE ACTIVITY RECREATION REQUIRES PHONE ACCEPTANCE")
if __name__ == "__main__": main()
