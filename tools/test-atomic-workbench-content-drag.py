"""Execute direct content drag members with real bounded source copies and cache bytes.

Only Android View/Window delivery is controlled. No phone or full Android build is used.
"""
from pathlib import Path
import importlib.util
import os
import subprocess
import tempfile

SPEC = importlib.util.spec_from_file_location("sessions", Path(__file__).with_name("test-atomic-workbench-transfer-sessions.py"))
T = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(T)
S = T.S

EXTRA = ["private static final class ContentRead", "private void startContentDrag(", "private boolean beginContentDrag(",
         "private void cancelContentDrag()", "private void check("]

TEST = r'''package ls.augment.com;
import android.app.*;import android.content.*;import android.net.Uri;import android.view.*;import java.io.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;
public final class TestContentDrag {
 static int cases,checks;static Path base;static final byte[] BYTES={3,1,4,1,5,9};
 static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 interface Case{void run()throws Exception;}static void test(String name,Case body)throws Exception{body.run();cases++;System.out.println("PASS content drag: "+name);}
 static final class Fixture implements AutoCloseable {
  final Activity activity;final View source=new View();final AtomicWorkbenchTransfer transfer;
  final AtomicWorkbenchContentPanel panel;final AtomicWorkbenchContentItem item;final AtomicWorkbenchPendingPayload queued;
  Fixture(boolean file)throws Exception{
   activity=new Activity(Files.createTempDirectory(base,"case-").toFile());activity.resolver=new ContentResolver(){public InputStream openInputStream(Uri u){return new ByteArrayInputStream(BYTES);}};
   transfer=new AtomicWorkbenchTransfer(activity);var original=AtomicWorkbenchTransfer.textSnapshotForTest("original pending");
   var repo=AtomicWorkbenchPendingStorage.repository(activity);var empty=repo.load();var saved=repo.put(empty.id,empty.revision,original,AtomicWorkbenchPendingRepository.Mode.REPLACE,AtomicWorkbenchPendingRepository.TextChoice.REPLACE);check(saved.success,"pending fixture write");queued=saved.snapshot;transfer.current=queued;
   item=file?AtomicWorkbenchContentItem.file(AtomicWorkbenchContentItem.Kind.MEDIA,AtomicWorkbenchContentItem.Source.MEDIA_STORE,"content://synthetic/photo","image/png","photo.png",7,BYTES.length,0):AtomicWorkbenchContentItem.clipboard(" \n real text \t",System.currentTimeMillis());
   panel=new AtomicWorkbenchContentPanel(activity,source,item);
  }
  void start(){transfer.startForTest(source,item,panel.begin(false));}
  void drainUntil(java.util.function.BooleanSupplier condition)throws Exception{long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(4);while(!condition.getAsBoolean()&&System.nanoTime()<end){transfer.main.drain();Thread.sleep(3);}transfer.main.drain();check(condition.getAsBoolean(),"bounded completion missing");}
  void queueUnchanged(){check(transfer.current==queued,"current queue replaced");var saved=AtomicWorkbenchPendingStorage.repository(activity).load();check(saved.id.equals(queued.id)&&saved.revision==queued.revision&&saved.text.equals(queued.text),"durable queue changed");}
  long cacheFiles()throws Exception{Path cache=activity.getCacheDir().toPath().resolve("workbench-transfer");if(!Files.exists(cache))return 0;try(var files=Files.list(cache)){return files.filter(p->p.toString().endsWith(".bin")).count();}}
  public void close()throws Exception{transfer.cancelForTest();drainUntil(()->!AtomicWorkbenchTransferStage.busy());transfer.ioIdle();transfer.main.drain();}
 }
 public static void main(String[] arguments)throws Exception{base=Path.of(arguments[0]);
  test("clipboard starts from its own bytes, keeps source window alive and consumes once across ViewRoots",()->{try(Fixture f=new Fixture(false)){
   f.start();check(f.source.starts==1&&f.source.clip.getItemAt(0).getText().toString().equals(f.item.text()),"clipboard changed or not dispatched");
   check(f.panel.dialog.isShowing()&&f.panel.dialog.getWindow().getAttributes().alpha==0f,"source window dismissed or not veiled");
   var drop=new DragEvent(3,null,f.source.clip.getDescription());var frozen=f.transfer.snapshotForDrop(drop);check(frozen!=null&&frozen.text.equals(f.item.text()),"cross-window snapshot unavailable");
   check(f.transfer.consumeDrop(drop,frozen)&&!f.transfer.consumeDrop(drop,frozen),"single consumption broken");f.source.end();f.source.end();
   check(f.panel.dialog.isShowing()&&f.panel.dialog.getWindow().getAttributes().alpha==.8f&&f.transfer.dragEvents.equals(List.of(true,false)),"source/host focus not restored exactly once");f.queueUnchanged();
  }});
  test("media copies real bytes off UI and issues the cached readable URI without touching pending",()->{try(Fixture f=new Fixture(true)){
   Thread ui=Thread.currentThread();f.activity.resolver=new ContentResolver(){public InputStream openInputStream(Uri u){check(Thread.currentThread()!=ui,"UI performed source read");return new ByteArrayInputStream(BYTES);}};
   f.start();f.drainUntil(()->f.source.starts==1);Uri cached=f.source.clip.getItemAt(0).getUri();
   f.activity.resolver=new ContentResolver(){public InputStream openInputStream(Uri u)throws IOException{throw new IOException("source removed");}};
   check(Arrays.equals(Files.readAllBytes(AtomicWorkbenchTransferStore.resolve(f.activity,cached).file.toPath()),BYTES),"URI did not expose original copied bytes");
   check(cached.getAuthority().equals("ls.augment.com.workbench.transfer")&&(f.source.flags&View.DRAG_FLAG_GLOBAL_URI_READ)!=0,"private source URI or missing read grant");
   var payload=f.transfer.snapshotForDrop(new DragEvent(3,null,f.source.clip.getDescription()));check(payload!=null&&payload.hasFiles&&payload.ready,"file not routed to existing delivery snapshot");
   f.queueUnchanged();f.source.end();check(f.cacheFiles()==1,"drag-ended revoked bytes before recipient could read");
  }});
  test("release while provider is blocked cancels preparation and never starts a late drag",()->{try(Fixture f=new Fixture(true)){
   CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
   f.activity.resolver=new ContentResolver(){public InputStream openInputStream(Uri u){return new InputStream(){boolean emitted;public int read(){return -1;}public int read(byte[]out){entered.countDown();for(;;)try{release.await();break;}catch(InterruptedException ignored){}if(emitted)return -1;emitted=true;out[0]=2;return 1;}public void close(){}};}};
   f.start();check(entered.await(2,TimeUnit.SECONDS),"provider not entered");f.panel.pressedHeld=false;f.transfer.cancelForTest();release.countDown();
   f.drainUntil(()->!AtomicWorkbenchTransferStage.busy());f.transfer.ioIdle();f.transfer.main.drain();check(f.source.starts==0&&f.cacheFiles()==0,"late drag or unpublished file survived cancellation");f.queueUnchanged();
  }});
  test("UP after source copy but before UI completion discards bytes instead of synthesizing a drag",()->{try(Fixture f=new Fixture(true)){
   f.start();long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);while(AtomicWorkbenchTransferStage.busy()&&System.nanoTime()<end)Thread.sleep(3);
   f.panel.pressedHeld=false;f.transfer.ioIdle();f.transfer.main.drain();f.transfer.ioIdle();check(f.source.starts==0&&f.cacheFiles()==0,"released pointer started from delayed completion");f.queueUnchanged();
  }});
  test("new DOWN and removed history revision invalidate the original preparation",()->{for(boolean newDown:new boolean[]{true,false})try(Fixture f=new Fixture(true)){
   f.start();if(newDown)f.panel.pressedDownTime++;else f.panel.current=new AtomicWorkbenchContentSnapshot(List.of());
   f.drainUntil(()->!AtomicWorkbenchTransferStage.busy());f.transfer.ioIdle();f.transfer.main.drain();f.transfer.ioIdle();check(f.source.starts==0&&f.cacheFiles()==0,"stale gesture/history created drag");f.queueUnchanged();
  }});
  test("read denial ends preparation with source and pending untouched",()->{try(Fixture f=new Fixture(true)){
   f.activity.resolver=new ContentResolver(){public InputStream openInputStream(Uri u)throws IOException{throw new IOException("denied");}};
   f.start();f.drainUntil(()->!AtomicWorkbenchTransferStage.busy()&&f.panel.sourceDrag==null);check(f.source.starts==0&&f.cacheFiles()==0&&f.panel.dialog.getWindow().getAttributes().alpha==.8f,"denied read veiled source or retained cache");f.queueUnchanged();
  }});
  test("framework start failure removes unpublished cache and restores source",()->{try(Fixture f=new Fixture(true)){
   f.source.success=false;f.start();f.drainUntil(()->f.source.starts==1);f.transfer.ioIdle();check(f.cacheFiles()==0&&f.panel.sourceDrag==null&&f.transfer.dragEvents.equals(List.of(true,false)),"failed start retained cache or host focus");f.queueUnchanged();
  }});
  test("accessibility drag uses the system accessibility flag without inventing a held pointer",()->{try(Fixture f=new Fixture(false)){
   f.panel.pressedHeld=false;f.transfer.startForTest(f.source,f.item,f.panel.begin(true));check(f.source.starts==1&&(f.source.flags&View.DRAG_FLAG_ACCESSIBILITY_ACTION)!=0,"accessibility action lacks platform flag");f.source.end();f.queueUnchanged();
  }});
  test("window lease removes only its own flags and does not overwrite later alpha",()->{try(Fixture f=new Fixture(false)){
   f.panel.dialog.getWindow().getAttributes().flags=0x20|WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE;f.start();
   var attrs=f.panel.dialog.getWindow().getAttributes();attrs.flags|=0x4000;attrs.alpha=.6f;f.source.end();
   check(attrs.flags==(0x20|0x4000|WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE)&&attrs.alpha==.6f,"restore overwrote another window change");
  }});
  test("closed source dialog and reset generation cannot authorize deferred drag",()->{for(boolean reset:new boolean[]{false,true})try(Fixture f=new Fixture(true)){
   f.start();if(reset)ResetWriteFence.begin();else f.panel.dialog.showing=false;
   try{f.drainUntil(()->!AtomicWorkbenchTransferStage.busy());f.transfer.ioIdle();f.transfer.main.drain();f.transfer.ioIdle();check(f.source.starts==0&&f.cacheFiles()==0,"expired source context started drag");}
   finally{if(reset)ResetWriteFence.end();}
  }});
  System.out.println("DIRECT CONTENT DRAG PASS "+cases+" cases / "+checks+" assertions; PHONE DROP ACCEPTANCE NOT CLAIMED");
 }
}'''


def execute(folder):
    transfer = (S.SRC / "AtomicWorkbenchTransfer.java").read_text(encoding="utf-8")
    panel = (S.SRC / "AtomicWorkbenchContentPanel.java").read_text(encoding="utf-8")
    members = "\n".join(T.member(transfer, signature) for signature in T.SIGNATURES + EXTRA)
    constants = "\n".join(line for line in transfer.splitlines() if "private static final String DRAG_" in line)
    harness = '''package ls.augment.com;import android.app.*;import android.content.*;import android.net.Uri;import android.view.*;import java.io.*;import java.util.concurrent.*;
final class AtomicWorkbenchTransfer {final UiKit ui=new UiKit();
 boolean closed,foreground=true;final Activity activity;final android.os.Handler main=new android.os.Handler();AtomicWorkbenchPendingPayload current;
 private DragSession activeDrag;private static DragSession extractedTextDrag;private ContentRead contentRead;private AtomicWorkbenchContentPanel.DragSource contentDragState;private View contentDragView;
 static final ExecutorService IO=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r);t.setDaemon(true);return t;});
 final java.util.List<Boolean>dragEvents=new java.util.ArrayList<>();interface Callback{void onDragState(boolean value);}final Callback callback=dragEvents::add;
 AtomicWorkbenchTransfer(Activity activity){this.activity=activity;}void notice(String value){}
 void startForTest(View v,AtomicWorkbenchContentItem item,AtomicWorkbenchContentPanel.DragSource state){startContentDrag(v,item,state);}
 void cancelForTest(){cancelContentDrag();}void ioIdle()throws Exception{IO.submit(()->{}).get(3,TimeUnit.SECONDS);}
 static AtomicWorkbenchPendingPayload textSnapshotForTest(String value)throws IOException{return textSnapshot(value);}
''' + constants + members + "}"
    panel_harness = '''package ls.augment.com;import android.app.*;import android.view.*;
final class AtomicWorkbenchContentPanel {
 final Activity activity;final Dialog dialog=new Dialog();AtomicWorkbenchContentSnapshot current;SourceDrag sourceDrag;
 View pressedSource;long pressedDownTime=17;boolean pressedHeld=true,closed;int renders;
 AtomicWorkbenchContentPanel(Activity a,View source,AtomicWorkbenchContentItem item){activity=a;pressedSource=source;current=new AtomicWorkbenchContentSnapshot(java.util.List.of(item));}
 DragSource begin(boolean accessible){sourceDrag=new SourceDrag(pressedSource,current.items.get(0),accessible);return sourceDrag;}
 void render(AtomicWorkbenchContentSnapshot snapshot){renders++;}void cancelSourceDrag(){if(sourceDrag!=null)sourceDrag.ended();}void notice(String value){}
''' + T.member(panel, "interface DragSource") + T.member(panel, "private final class SourceDrag") + "}"
    sources = {**S.STUBS, **T.STUBS}
    clip = S.STUBS["android/content/ClipData.java"].replace("final List<Item>items", "ClipDescription description;public ClipDescription getDescription(){return description;}final List<Item>items").replace("items.add(i);}public void", "items.add(i);description=new ClipDescription(l,m);}public void", 1)
    sources["android/content/ClipData.java"] = clip.replace("public ClipData(String", "public ClipData(ClipDescription d,Item i){description=d;items.add(i);}public ClipData(String")
    sources["android/content/Intent.java"] = S.STUBS["android/content/Intent.java"].replace("public String getAction()", "public Intent addFlags(int flags){return this;}public Intent setType(String type){return this;}public String getAction()")
    sources["android/view/View.java"] = T.STUBS["android/view/View.java"].replace("public Object state;", "public boolean isAttachedToWindow(){return true;}public int starts;public Object state;").replace("state=local;clip=c;", "starts++;state=local;clip=c;")
    sources["android/os/Handler.java"] = '''package android.os;import java.util.*;import java.util.concurrent.*;public class Handler {
 final Queue<Runnable>tasks=new ConcurrentLinkedQueue<>();final List<Runnable>delayed=new ArrayList<>();
 public boolean post(Runnable task){tasks.add(task);return true;}public boolean postDelayed(Runnable r,long t){delayed.add(r);return true;}
 public void removeCallbacks(Runnable r){delayed.remove(r);}public void drain(){Runnable r;while((r=tasks.poll())!=null)r.run();}}'''
    sources["android/app/Activity.java"] = "package android.app;public class Activity extends android.content.Context {public Activity(){this(new java.io.File(System.getProperty(\"java.io.tmpdir\")));}public Activity(java.io.File root){super(root);}public boolean isDestroyed(){return false;}public boolean isFinishing(){return false;}}"
    extraction_source = (S.SRC / "AtomicWorkbenchExtractionActivity.java").read_text(encoding="utf-8")
    sources["ls/augment/com/AtomicWorkbenchExtractionActivity.java"] = sources["ls/augment/com/AtomicWorkbenchExtractionActivity.java"].replace("CURRENT_TEXT_DRAG_SOURCE", T.member(extraction_source, "boolean currentTextDragSource()"))
    sources["ls/augment/com/AtomicWorkbenchExtractionActivity.java"] = sources["ls/augment/com/AtomicWorkbenchExtractionActivity.java"].replace("CURRENT_TEXT_DELIVERY_SOURCE", T.member(extraction_source, "boolean currentTextDeliverySource()"))
    sources["android/app/Dialog.java"] = "package android.app;public class Dialog {public boolean showing=true;final android.view.Window window=new android.view.Window();public boolean isShowing(){return showing;}public android.view.Window getWindow(){return window;}}"
    sources["android/view/Window.java"] = "package android.view;public class Window {final WindowManager.LayoutParams attrs=new WindowManager.LayoutParams();public WindowManager.LayoutParams getAttributes(){return attrs;}public void setAttributes(WindowManager.LayoutParams value){}}"
    sources["android/view/WindowManager.java"] = "package android.view;public interface WindowManager {class LayoutParams {public static final int FLAG_NOT_TOUCHABLE=16,FLAG_NOT_FOCUSABLE=8;public int flags;public float alpha=.8f;}}"
    sources["ls/augment/com/AtomicWorkbenchTransfer.java"] = harness
    sources["ls/augment/com/AtomicWorkbenchContentPanel.java"] = panel_harness
    sources["ls/augment/com/AtomicWorkbenchContentSnapshot.java"] = "package ls.augment.com;class AtomicWorkbenchContentSnapshot {final java.util.List<AtomicWorkbenchContentItem>items;final AtomicWorkbenchContentItem.Kind kind;AtomicWorkbenchContentSnapshot(java.util.List<AtomicWorkbenchContentItem> values){items=values;kind=values.isEmpty()?AtomicWorkbenchContentItem.Kind.MEDIA:values.get(0).kind;}}"
    sources["ls/augment/com/TestContentDrag.java"] = TEST
    production = ("AtomicWorkbenchTransferPolicy.java", "AtomicWorkbenchTransferStore.java", "AtomicWorkbenchTransferStage.java",
                  "AtomicWorkbenchPendingPayload.java", "AtomicWorkbenchPendingRepository.java", "AtomicWorkbenchPendingStorage.java",
                  "ResetWriteFence.java", "AtomicWorkbenchContentItem.java", "AtomicWorkbenchContentPolicy.java", "AtomicWorkbenchContentSelection.java")
    for name in production:
        sources["ls/augment/com/" + name] = (S.SRC / name).read_text(encoding="utf-8")
    paths = []
    for name, value in sources.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding="utf-8")
        paths.append(str(path))
    classes = str(Path(folder) / "classes")
    result = subprocess.run([S.JAVAC, "--release", "17", "-encoding", "UTF-8", "-classpath", str(S.JSON), "-d", classes, *paths], capture_output=True, text=True, encoding="utf-8", errors="replace", env=S.ENV, timeout=60)
    if result.returncode:
        raise AssertionError(result.stderr)
    return subprocess.run([S.JAVA, "-Dfile.encoding=UTF-8", "-cp", classes + os.pathsep + str(S.JSON), "ls.augment.com.TestContentDrag", folder], capture_output=True, text=True, encoding="utf-8", errors="replace", env=S.ENV, timeout=30)


if __name__ == "__main__":
    with tempfile.TemporaryDirectory(prefix="duo-content-direct-drag-") as work:
        result = execute(work)
        print(result.stdout, end="")
        if result.returncode:
            raise AssertionError(result.stderr)
