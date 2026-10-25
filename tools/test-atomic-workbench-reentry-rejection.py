"""Run actual entry-reading and singleTask code with queued connection boundaries."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com/AtomicWorkbenchActivity.java"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")


def member(source, signature):
    begin = source.index(signature)
    end = source.index("{", begin) + 1
    depth = 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[begin:end]


HEAD = r'''
import java.util.*;
class Intent {
 static final int FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY=1;int flags;
 final Map<String,Object> extras=new HashMap<>();Intent(){}Intent(Intent old){flags=old.flags;extras.putAll(old.extras);}
 int getFlags(){return flags;}void removeExtra(String key){extras.remove(key);}
 String getStringExtra(String key){return (String)extras.get(key);}long getLongExtra(String key,long fallback){return extras.get(key)instanceof Long?(Long)extras.get(key):fallback;}
 int getIntExtra(String key,int fallback){return extras.get(key)instanceof Integer?(Integer)extras.get(key):fallback;}
 boolean getBooleanExtra(String key,boolean fallback){return extras.get(key)instanceof Boolean?(Boolean)extras.get(key):fallback;}
}
class AtomicWorkbenchConfig {
 static final String EXTRA_ENTRY="entry",EXTRA_SIDE="side",EXTRA_COMPONENT="component",EXTRA_TASK_ID="task",EXTRA_CONFIG_REVISION="revision",EXTRA_CONFIG_CHECKSUM="checksum",EXTRA_TRIGGER_ELAPSED="elapsed",EXTRA_ENTRY_BUILD="build";
 static final long REQUEST_MAX_AGE_MS=3000;
}
class AtomicWorkbenchSettingsActivity {static final String EXTRA_GENERATION="generation",EXTRA_COMPONENT="component";}
class AtomicWorkbenchTransfer {static final String EXTRA_DELIVERY="delivery";int accepted;void acceptPending(){accepted++;}}
class ResetWriteFence {static long generation(){return 1;}static boolean stale(long value){return false;}}
class SystemClock {static long elapsedRealtime(){return 1000;}}
class AppCrashDiagnostics {static void stage(String value){}}
class ComponentName {final String value;ComponentName(String v){value=v;}static ComponentName unflattenFromString(String v){return new ComponentName(v);}}
class AtomicWorkbenchWindowPresentationPolicy {enum Offer {NEW,DUPLICATE,REJECTED}Offer next=Offer.NEW;void invalidate(){}Offer offerEntry(Object key,Object side,long now,long max){return next;}}
class ActivityBase {protected void onNewIntent(Intent value){}}
public class TestReentryRejection extends ActivityBase {
 static int cases,checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}interface Case{void run();}static void test(String name,Case body){body.run();cases++;System.out.println("PASS actual reentry rejection: "+name);}
 static class Queue {final List<Runnable> jobs=new ArrayList<>();void post(Runnable action){jobs.add(action);}void removeCallbacks(Runnable action){jobs.removeIf(value->value==action);}void drain(){while(!jobs.isEmpty())jobs.remove(0).run();}}
 static class Model {boolean expanded;int apps;boolean mainExpanded(){return expanded;}void setMainExpanded(boolean value){expanded=value;}}
 static class EntryProof {final String problem;final Object side=new Object();final long triggered=1000;EntryProof(Intent entry){problem=entry.getStringExtra("proof_error")==null?"":entry.getStringExtra("proof_error");}Object key(){return this;}}
 final Queue main=new Queue(),WORKER=new Queue();
 final AtomicWorkbenchWindowPresentationPolicy presentationPolicy=new AtomicWorkbenchWindowPresentationPolicy();
 final Model model=new Model();final AtomicWorkbenchTransfer transfer=new AtomicWorkbenchTransfer();
 Object client,ui=new Object();Intent intent=new Intent();boolean active=true,closing,recoveryPending,entryFocusLogged,nativeHomePending,incomingPending;
 long launchGeneration=1,sessionGeneration=1;String entryProblemText,status;EntryProof incomingProof,pendingLayoutProof;ComponentName incomingComponent;int incomingTaskId=-1;
 int renders,syncs,connections,retirements,nativeAttempts;static final String EXTRA_TASK_ID=AtomicWorkbenchConfig.EXTRA_TASK_ID;
 final Runnable entrySideDispatch=()->{pendingLayoutProof=null;tryIncoming();};
 void cancelTaskStorageRecheck(){}void lifecycleDiagnostic(String event,String detail){}void showStatus(String text){status=text;}void renderWorkspace(){renders++;}void syncWorkspaceOutputs(){syncs++;}
 void setIntent(Intent entry){intent=entry;}Intent getIntent(){return intent;}
 String entryProblem(EntryProof proof){return proof==null?"missing proof":proof.problem;}
 void rejectIncoming(String reason){entryProblemText=reason;incomingPending=false;incomingProof=null;incomingComponent=null;incomingTaskId=-1;showStatus(reason);}
 void retireSession(String reason,boolean leaving){retirements++;sessionGeneration++;client=null;model.apps=0;nativeHomePending=incomingPending=false;incomingProof=pendingLayoutProof=null;incomingComponent=null;incomingTaskId=-1;entryProblemText=null;main.removeCallbacks(entrySideDispatch);}
 // Only asynchronous connection/surface transport is controlled. The real entry
 // and onNewIntent decisions below must prevent this path from being offered.
 void tryIncoming(){if(active&&nativeHomePending&&pendingLayoutProof==null&&!incomingPending&&entryProblemText==null){nativeHomePending=false;nativeAttempts++;WORKER.post(()->{connections++;Object connected=new Object();main.post(()->client=connected);});}}
 void drain(){main.drain();WORKER.drain();main.drain();}
 // ACTUAL_METHODS
 static Intent gesture(String error){Intent entry=new Intent();entry.extras.put("entry","gesture");if(error!=null)entry.extras.put("proof_error",error);return entry;}
 public static void main(String[] ignored){
  test("invalid proof cannot offer HOME after worker and surface callbacks",()->{for(String reason:new String[]{"missing proof","expired proof","unknown direction"}){TestReentryRejection page=new TestReentryRejection();page.model.apps=1;page.onNewIntent(gesture(reason));page.main.post(page::tryIncoming);page.drain();page.tryIncoming();page.drain();check(page.active&&page.client==null&&page.connections==0&&page.nativeAttempts==0&&!page.nativeHomePending,"rejected no-client entry revived native HOME");check(reason.equals(page.status)&&page.model.apps==0&&page.sessionGeneration==2,"rejection lost message or empty generation");}});
  test("duplicate or rejected admitted-offer cannot offer HOME",()->{for(var offered:new AtomicWorkbenchWindowPresentationPolicy.Offer[]{AtomicWorkbenchWindowPresentationPolicy.Offer.DUPLICATE,AtomicWorkbenchWindowPresentationPolicy.Offer.REJECTED}){TestReentryRejection page=new TestReentryRejection();page.presentationPolicy.next=offered;page.onNewIntent(gesture(null));page.drain();check(page.client==null&&page.nativeAttempts==0&&!page.nativeHomePending,"replayed offer started HOME");}});
  test("accepted gesture and ordinary entry retain asynchronous native HOME",()->{for(boolean gesture:new boolean[]{false,true}){TestReentryRejection page=new TestReentryRejection();page.onNewIntent(gesture?gesture(null):new Intent());check(page.client==null,"fixture connected synchronously");page.drain();check(page.client!=null&&page.connections==1&&page.nativeAttempts==1,"accepted entry lost native HOME");}});
  test("share delivery preserves existing owner and generation",()->{TestReentryRejection page=new TestReentryRejection();Object owner=page.client=new Object();page.model.apps=2;Intent share=new Intent();share.extras.put("delivery",true);page.onNewIntent(share);page.drain();check(page.client==owner&&page.sessionGeneration==1&&page.model.apps==2&&page.transfer.accepted==1&&page.connections==0,"share entry replaced current session");});
  test("healthy owner reentry retains windows for ordinary and valid gesture",()->{for(boolean gesture:new boolean[]{false,true}){TestReentryRejection page=new TestReentryRejection();Object owner=page.client=new Object();page.model.apps=2;page.model.expanded=true;page.onNewIntent(gesture?gesture(null):new Intent());page.drain();check(page.client==owner&&page.model.apps==2&&page.sessionGeneration==1&&!page.model.expanded&&page.syncs==1&&page.retirements==0,"healthy owner reentry replaced session");}});
  test("invalid gesture preserves healthy existing owner",()->{TestReentryRejection page=new TestReentryRejection();Object owner=page.client=new Object();page.model.apps=2;page.onNewIntent(gesture("expired proof"));page.drain();check(page.client==owner&&page.model.apps==2&&page.sessionGeneration==1&&"expired proof".equals(page.status)&&page.connections==0,"invalid gesture discarded healthy owner");});
  System.out.println("REENTRY REJECTION RESULT "+cases+" cases; "+checks+" assertions");
 }
}
'''


def main():
    actual = SOURCE.read_text(encoding="utf-8")
    methods = "\n".join(member(actual, signature) for signature in [
        "@Override protected void onNewIntent", "private boolean readIncoming(",
        "private static Intent prepareEntryIntent", "private static void clearEntryExtras",
    ])
    source = HEAD.replace("// ACTUAL_METHODS", methods)
    guard = "if (!readIncoming(nextEntry)) { renderWorkspace(); return; }"
    assert source.count(guard) == 1
    for label, current in [("production", source), ("old_ignored_rejection", source.replace(guard, "readIncoming(nextEntry);"))]:
        with tempfile.TemporaryDirectory(prefix="duo-reentry-rejection-") as temporary:
            directory = Path(temporary)
            java = directory / "TestReentryRejection.java"
            java.write_text(current, encoding="utf-8")
            subprocess.run([str(JDK / "javac.exe"), "--release", "17", "-encoding", "UTF-8", "-d", str(directory), str(java)], check=True, timeout=30)
            result = subprocess.run([str(JDK / "java.exe"), "-cp", str(directory), "TestReentryRejection"], capture_output=True, text=True, timeout=15)
            if label == "production":
                print(result.stdout, end="")
                if result.returncode:
                    raise AssertionError(result.stderr)
            else:
                assert result.returncode and "rejected no-client entry revived native HOME" in result.stderr, result.stdout + result.stderr
                print("PASS old ignored-return negative control reproduces asynchronous HOME connection")


if __name__ == "__main__":
    main()
