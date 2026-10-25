"""Run the real share receiver and directory-result body against controlled Android edges.

Verifies back dispatch, staged-byte ownership, recreation and actual URI read grants;
it does not claim device gesture rendering or DocumentsProvider acceptance.
"""
from pathlib import Path
import runpy
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
BASE = runpy.run_path(str(ROOT / "tools/test-config-transfer-action-host.py"))


def member(source, signature):
    start = source.index(signature)
    end = source.index("{", start) + 1
    depth = 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


ACTIVITY = (SRC / "AtomicWorkbenchShareActivity.java").read_text(encoding="utf-8")
if "public void onBackPressed()" in ACTIVITY:
    raise AssertionError("Share receiver still overrides the legacy back method")
RESULT = member((SRC / "AtomicWorkbenchTransfer.java").read_text(encoding="utf-8"), "boolean onActivityResult(")
ACCESS = member((SRC / "AtomicWorkbenchTransfer.java").read_text(encoding="utf-8"), "private void requestContentAccess(")
TEST = r'''
public static final class TestShareReturnGrants {
 static int checks,cases;static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
 static void test(String name,Runnable task){Queue.clear();AtomicWorkbenchTransferStore.discards=0;task.run();Queue.drain();cases++;System.out.println("PASS share return/grants: "+name);}
 static AtomicWorkbenchShareActivity page(){var p=new AtomicWorkbenchShareActivity();p.onCreate(new Bundle());return p;}
 static void receive(AtomicWorkbenchShareActivity p){Queue.drain();p.session.job.deliver(new AtomicWorkbenchTransferStore.Payload());Queue.drain();check(p.prompt!=null,"staged material did not open its decision");}
 public static void main(String[] args){
  test("gesture, hardware and toolbar share the submitting guard",()->{
   var p=page();receive(p);var prompt=p.prompt;p.session.committing=true;
   p.getOnBackInvokedDispatcher().invoke();p.hardwareBack();p.ui.toolbarBack();
   check(p.finishCalls==0&&!p.session.cancelled&&!prompt.closed,"submitting back cancelled material or window");
   check(p.status.text.equals("正在确认保存结果，请稍候"),"submitting status missing");
   p.session.committing=false;p.ui.toolbarBack();check(p.finishCalls==1&&p.session.cancelled&&prompt.closed,"toolbar return bypassed release");
   p.getOnBackInvokedDispatcher().invoke();check(p.finishCalls==1,"repeated return finished twice");p.onDestroy();
   check(p.dispatcher.callbacks.isEmpty()&&p.dispatcher.unregistrations==1,"back callback retained destroyed window");
  });
  test("receiving hardware return cancels the job and discards a late source",()->{
   var p=page();Queue.drain();var job=p.session.job;p.hardwareBack();check(p.session.cancelled&&job.cancelled&&p.finishCalls==1,"receiving job remained live");
   job.deliver(new AtomicWorkbenchTransferStore.Payload());Queue.drain();check(p.session.staged==null&&AtomicWorkbenchTransferStore.discards==1,"late source resurrected or leaked");p.onDestroy();
  });
  test("gesture return closes an existing decision and releases staged bytes",()->{
   var p=page();receive(p);var prompt=p.prompt;p.getOnBackInvokedDispatcher().invoke();Queue.drain();
   check(prompt.closed&&p.prompt==null&&p.session.staged==null&&p.session.cancelled&&AtomicWorkbenchTransferStore.discards==1,"decision return lost staged ownership");p.onDestroy();
  });
  test("recreation detaches the old prompt and transfers one session",()->{
   var old=page();receive(old);var session=old.session;var prompt=old.prompt;Object retained=old.onRetainNonConfigurationInstance();
   old.changing=true;old.onDestroy();check(prompt.detached&&!session.cancelled&&session.staged!=null,"recreation cancelled retained material");
   check(old.dispatcher.callbacks.isEmpty()&&!old.dispatcher.invoke(),"old activity still handles gestures");
   var next=new AtomicWorkbenchShareActivity();next.retained=retained;next.onCreate(new Bundle());
   check(next.session==session&&next.prompt!=null&&next.prompt!=prompt,"recreated screen lost the decision or started another import");
   next.hardwareBack();Queue.drain();check(next.finishCalls==1&&old.finishCalls==0&&AtomicWorkbenchTransferStore.discards==1,"return targeted old owner or discarded twice");next.onDestroy();
  });
  test("submitting recreation keeps back blocked until durable completion",()->{
   var old=page();receive(old);old.session.committing=true;var session=old.session;old.changing=true;old.onDestroy();
   var next=new AtomicWorkbenchShareActivity();next.retained=session;next.onCreate(new Bundle());next.hardwareBack();next.ui.toolbarBack();
   check(next.prompt==null&&next.finishCalls==0&&!session.cancelled&&session.committing,"recreated submission acquired a second prompt or cancelled");
   session.committing=false;next.hardwareBack();check(next.finishCalls==1&&session.cancelled,"completed submission never released return");next.onDestroy();
  });
  test("readable folder persists only read access despite extra returned flags",()->{
   var t=new AtomicWorkbenchTransfer();Intent data=new Intent().setData(android.net.Uri.parse("content://fixture/tree/one"))
    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION|Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION|Intent.FLAG_GRANT_PREFIX_URI_PERMISSION|0x1000);
   check(t.onActivityResult(AtomicWorkbenchTransfer.PICK_DIRECTORY,android.app.Activity.RESULT_OK,data),"folder result not consumed");
   check(t.activity.resolver.calls==1&&t.activity.resolver.flags==Intent.FLAG_GRANT_READ_URI_PERMISSION&&t.collector.repository.refreshes==1,"persistence included unrelated/write flags or failed to refresh");
   check(t.activity.checkedFlags==1&&t.activity.checkedPid==123&&t.activity.checkedUid==456,"actual caller read grant was not checked");
  });
  test("a read flag without an actual grant is rejected before persistence",()->{
   var t=new AtomicWorkbenchTransfer();t.activity.readAllowed=false;
   t.onActivityResult(AtomicWorkbenchTransfer.PICK_DIRECTORY,-1,new Intent().setData(android.net.Uri.parse("content://fixture/tree/one")).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
   check(t.activity.resolver.calls==0&&t.collector.repository.refreshes==0&&t.notices==1,"ungranted folder was persisted or advertised");
  });
  test("missing read flag and refused persistence never advertise success",()->{
   var t=new AtomicWorkbenchTransfer();Intent data=new Intent().setData(android.net.Uri.parse("content://fixture/tree/one")).addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
   t.onActivityResult(AtomicWorkbenchTransfer.PICK_DIRECTORY,-1,data);check(t.activity.resolver.calls==0&&t.notices==1,"zero read flags reached persist API");
   t=new AtomicWorkbenchTransfer();t.activity.resolver.denied=true;data.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
   t.onActivityResult(AtomicWorkbenchTransfer.PICK_DIRECTORY,-1,data);check(t.activity.resolver.calls==1&&t.collector.repository.refreshes==0&&t.notices==1,"provider refusal became success");
  });
  test("cancelled folder and ordinary file results retain their behavior",()->{
   var t=new AtomicWorkbenchTransfer();Intent data=new Intent().setData(android.net.Uri.parse("content://fixture/tree/one"));
   check(t.onActivityResult(AtomicWorkbenchTransfer.PICK_DIRECTORY,0,data)&&t.activity.resolver.calls==0&&t.notices==0,"cancelled chooser mutated grants");
   check(!t.onActivityResult(900,-1,data)&&t.imports==0,"unrelated result consumed");
   check(t.onActivityResult(AtomicWorkbenchTransfer.PICK_FILES,-1,data)&&t.imports==1,"file import result changed");
  });
  test("media requests the three supported visual grants and files keep their settings entry",()->{
   var t=new AtomicWorkbenchTransfer();t.requestForTest(AtomicWorkbenchContentItem.Kind.MEDIA);
   check(java.util.Arrays.equals(t.activity.permissions,new String[]{"images","video","selected"})&&t.activity.permissionRequest==AtomicWorkbenchTransfer.READ_MEDIA,"visual permission request changed or included legacy/audio access");
   t.requestForTest(AtomicWorkbenchContentItem.Kind.FILES);
   check(t.contentPanel.dismisses==1&&t.activity.started!=null&&t.activity.started.action.equals("manage_files"),"file settings entry changed");
  });
  System.out.println("SHARE RETURN/GRANTS PASS "+cases+" cases / "+checks+" assertions");
 }
}
'''

STUBS = {
    "android/app/Activity.java": r'''package android.app;import android.content.*;import android.os.*;import android.window.*;
public class Activity extends Context {public static final int RESULT_OK=-1;public int finishCalls,permissionRequest;public String[] permissions;public Intent started;public boolean finishing,destroyed,changing;public Object retained;public Intent intent=new Intent();
 public final OnBackInvokedDispatcher dispatcher=new OnBackInvokedDispatcher();public void onCreate(Bundle b){}protected void onDestroy(){destroyed=true;}public Object onRetainNonConfigurationInstance(){return null;}public Object getLastNonConfigurationInstance(){return retained;}
 public OnBackInvokedDispatcher getOnBackInvokedDispatcher(){return dispatcher;}public void hardwareBack(){if(!dispatcher.invoke())onBackPressed();}public void onBackPressed(){finish();}public void finish(){finishCalls++;finishing=true;}
 public boolean isDestroyed(){return destroyed;}public boolean isFinishing(){return finishing;}public boolean isChangingConfigurations(){return changing;}public Intent getIntent(){return intent;}public void startActivity(Intent i,Bundle b){}public void startActivity(Intent i){started=i;}public void requestPermissions(String[] p,int code){permissions=p;permissionRequest=code;}public String getPackageName(){return "ls.augment.com";}
}''',
    "android/content/Context.java": r'''package android.content;import android.net.Uri;public class Context {public ContentResolver resolver=new ContentResolver();public boolean readAllowed=true;public int checkedFlags,checkedPid,checkedUid;public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}public int checkUriPermission(Uri u,int pid,int uid,int flags){checkedFlags=flags;checkedPid=pid;checkedUid=uid;return readAllowed?0:-1;}}''',
    "android/content/ContentResolver.java": r'''package android.content;import android.net.Uri;public class ContentResolver {public int calls,flags;public boolean denied;public void takePersistableUriPermission(Uri u,int f){calls++;flags=f;if(denied)throw new SecurityException();}}''',
    "android/content/Intent.java": r'''package android.content;import android.net.Uri;public class Intent {public static final int FLAG_GRANT_READ_URI_PERMISSION=1,FLAG_GRANT_WRITE_URI_PERMISSION=2,FLAG_GRANT_PERSISTABLE_URI_PERMISSION=64,FLAG_GRANT_PREFIX_URI_PERMISSION=128,FLAG_ACTIVITY_NEW_TASK=0x10000000;public String action;int flags;Uri data;public Intent(){}public Intent(Intent i){flags=i.flags;data=i.data;}public Intent(Context c,Class<?> t){}public Intent(String action,Uri uri){this.action=action;data=uri;}public Intent putExtra(String k,Object v){return this;}public Intent addFlags(int f){flags|=f;return this;}public int getFlags(){return flags;}public Uri getData(){return data;}public Intent setData(Uri u){data=u;return this;}}''',
    "android/Manifest.java": "package android;public class Manifest {public static class permission {public static final String READ_MEDIA_IMAGES=\"images\",READ_MEDIA_VIDEO=\"video\",READ_MEDIA_VISUAL_USER_SELECTED=\"selected\";}}",
    "android/provider/Settings.java": "package android.provider;public class Settings {public static final String ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION=\"manage_files\";}",
    "android/content/pm/PackageManager.java": "package android.content.pm;public class PackageManager {public static final int PERMISSION_GRANTED=0;}",
    "android/net/Uri.java": "package android.net;public record Uri(String value){public static Uri parse(String value){return new Uri(value);}}",
    "android/os/Bundle.java": "package android.os;public class Bundle {}",
    "android/os/Process.java": "package android.os;public class Process {public static int myPid(){return 123;}public static int myUid(){return 456;}}",
    "android/os/Looper.java": "package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}",
    "android/os/Handler.java": "package android.os;public class Handler {public Handler(Looper l){}public void post(Runnable r){ls.augment.com.Queue.add(r);}}",
    "android/app/ActivityOptions.java": "package android.app;public class ActivityOptions {public static ActivityOptions makeBasic(){return new ActivityOptions();}public void setLaunchDisplayId(int id){}public android.os.Bundle toBundle(){return new android.os.Bundle();}}",
    "android/widget/TextView.java": "package android.widget;public class TextView {public String text;public void setText(String value){text=value;}}",
    "android/widget/Button.java": "package android.widget;public class Button extends TextView {public void setTag(Object v){}public void setOnClickListener(java.util.function.Consumer<Object> v){}}",
    "android/widget/LinearLayout.java": "package android.widget;public class LinearLayout {public void addView(Object v,Object p){}public Object findViewWithTag(String t){return null;}}",
    "android/window/OnBackInvokedCallback.java": BASE["STUBS"]["android/window/OnBackInvokedCallback.java"],
    "android/window/OnBackInvokedDispatcher.java": BASE["STUBS"]["android/window/OnBackInvokedDispatcher.java"],
    "ls/augment/com/Queue.java": "package ls.augment.com;public class Queue {static final java.util.ArrayDeque<Runnable> tasks=new java.util.ArrayDeque<>();public static void add(Runnable r){tasks.add(r);}static void clear(){tasks.clear();}static void drain(){int guard=0;while(!tasks.isEmpty()){if(guard++>100)throw new AssertionError(\"queue did not settle\");tasks.remove().run();}}}",
    "ls/augment/com/ShareBoundaries.java": r'''package ls.augment.com;import android.app.*;import android.content.*;import android.widget.*;
final class UiKit {Runnable back;UiKit(Activity a){}void setBackAction(Runnable r){back=r;}void toolbarBack(){back.run();}int text;LinearLayout detailPage(String s,Object v){return new LinearLayout();}TextView text(String s,int size,int c,boolean bold){TextView t=new TextView();t.text=s;return t;}Button button(String s){return new Button();}Object wrap(){return null;}Object margins(int a,int b,int c,int d){return null;}}
final class ModuleNavigation {static final String EXTRA_ROUTE="route";}final class AtomicWorkbenchActivity {}
final class AtomicWorkbenchPendingPayload {}final class AtomicWorkbenchPendingRepository {static class Result {boolean success;String message;}AtomicWorkbenchPendingPayload load(){return new AtomicWorkbenchPendingPayload();}}
final class AtomicWorkbenchPendingStorage {static AtomicWorkbenchPendingRepository repository(Context c){return new AtomicWorkbenchPendingRepository();}}
final class AtomicWorkbenchTransferStore {static int discards;static class Payload{}static void discardUnpublished(Context c,Payload p){if(p!=null)discards++;}}
final class AtomicWorkbenchTransferStage {interface Callback {void complete(AtomicWorkbenchTransferStore.Payload p,String error);}static final class Job {boolean cancelled;Callback callback;void cancel(){cancelled=true;}void deliver(AtomicWorkbenchTransferStore.Payload p){callback.complete(p,null);}}static Job start(Context c,Intent i,boolean picker,Callback cb){Job j=new Job();j.callback=cb;return j;}}
final class AtomicWorkbenchPendingImport {interface Callback {void complete(AtomicWorkbenchPendingRepository.Result r,String failure);}boolean closed,detached;AtomicWorkbenchPendingImport(Activity a,UiKit ui,AtomicWorkbenchPendingRepository r,AtomicWorkbenchPendingPayload b,AtomicWorkbenchTransferStore.Payload p,Callback cb){}void setCommitObserver(java.util.function.Consumer<Boolean> c){}void show(){}void close(){closed=true;}void detachForRecreation(){detached=true;}}
final class AtomicWorkbenchContentItem {enum Kind {FILES,MEDIA}}
''',
    "ls/augment/com/AtomicWorkbenchTransfer.java": r'''package ls.augment.com;import android.app.*;import android.content.*;import android.provider.Settings;import android.net.Uri;final class AtomicWorkbenchTransfer {
static final java.util.concurrent.Executor IO=Queue::add;static final String EXTRA_DELIVERY="delivery";static final int PICK_DIRECTORY=0x4a72,PICK_FILES=0x4a71,READ_MEDIA=0x4a73;
final Activity activity=new Activity();final Collector collector=new Collector();final Panel contentPanel=new Panel();int notices,imports;void notice(String message){notices++;}void importContent(Intent i,boolean picker,Object grant,Object target){imports++;}
void requestForTest(AtomicWorkbenchContentItem.Kind kind){requestContentAccess(kind);}
static class Panel {int dismisses;void dismiss(){dismisses++;}}
static class Collector {final Repository repository=new Repository();}static class Repository {int refreshes;void refresh(AtomicWorkbenchContentItem.Kind kind,boolean force){refreshes++;}}
''' + RESULT + ACCESS + "\n}",
    "ls/augment/com/AtomicWorkbenchShareActivity.java": ACTIVITY.rsplit("}", 1)[0] + TEST + "\n}",
}


def main():
    with tempfile.TemporaryDirectory(prefix="duo-share-return-grants-") as directory:
        folder = Path(directory)
        paths = []
        for name, content in STUBS.items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8")
            paths.append(str(path))
        subprocess.run([BASE["java_tool"]("javac"), "--release", "17", "-encoding", "UTF-8", "-d", str(folder / "classes"), *paths], check=True, timeout=60)
        subprocess.run([BASE["java_tool"]("java"), "-Dfile.encoding=UTF-8", "-cp", str(folder / "classes"), "ls.augment.com.AtomicWorkbenchShareActivity$TestShareReturnGrants"], check=True, timeout=30)


if __name__ == "__main__":
    main()
