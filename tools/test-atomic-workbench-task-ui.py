"""Run the production task picker snapshot, request binding and stale-selection guards."""
from pathlib import Path
import importlib.util
import tempfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("task_models", Path(__file__).with_name("test-atomic-workbench-task-models.py"))
models = importlib.util.module_from_spec(spec)
spec.loader.exec_module(models)
BUNDLE = models.BUNDLE.replace("public Set<String>", "public <T> java.util.ArrayList<T> getParcelableArrayList(String k){return (java.util.ArrayList<T>)data.get(k);}public <T> void putParcelableArrayList(String k,java.util.ArrayList<T> v){data.put(k,v);} public Set<String>")
TEST = r'''package ls.augment.com;
import android.os.Bundle; import java.util.*; import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action.*;
public class TestTaskUi {
 static int assertions,cases; static String SESSION="11111111-1111-1111-1111-111111111111", TARGET="22222222-2222-2222-2222-222222222222";
 interface Run {void run()throws Exception;} static void check(boolean b,String why){assertions++;if(!b)throw new AssertionError(why);}
 static void reject(Run r)throws Exception {boolean caught=false;try{r.run();}catch(IllegalArgumentException e){caught=true;}check(caught,"stale task UI accepted");}
 static void test(String n,Run r)throws Exception{try{r.run();}catch(IllegalArgumentException e){throw new AssertionError("unexpected rejection: "+n,e);}cases++;System.out.println("PASS task UI: "+n);}
 static AtomicWorkbenchTaskIdentity task(int display,String gen){return new AtomicWorkbenchTaskIdentity("a".repeat(32),gen,42,42,true,1000,0,"zte.com.cn.alarmclock/.Base","zte.com.cn.alarmclock/.Real",display,display==0?"phone":"vd","unique-"+display);}
 static Bundle window(int id,boolean empty){Bundle b=new Bundle();b.putInt("window_id",id);b.putInt("display_id",id+88);b.putString("display_name","vd");b.putString("display_unique","unique-"+(id+88));b.putString("window_session",id==1?SESSION:TARGET);ArrayList<Bundle> tasks=new ArrayList<>();if(!empty)tasks.add(task(id+88,"b".repeat(32)).toBundle());b.putParcelableArrayList("tasks",tasks);return b;}
 static Bundle state(){Bundle b=new Bundle();b.putBoolean("success",true);b.putBoolean("cleanup_pending",false);b.putBoolean("operation_unconfirmed",false);b.putLong("shelf_revision",7);b.putLong("input_revision",12);Bundle p=new Bundle();p.putInt("display_id",0);p.putString("display_name","phone");p.putString("display_unique","unique-0");b.putBundle("primary_display",p);ArrayList<Bundle>w=new ArrayList<>();w.add(window(1,false));w.add(window(2,true));b.putParcelableArrayList("windows",w);ArrayList<Bundle>e=new ArrayList<>();Bundle a=new Bundle();a.putBoolean("can_restore",true);a.putBoolean("pending",false);a.putLong("revision",7);a.putString("shelf_id","c".repeat(32));a.putString("source_window_session",SESSION);a.putInt("source_slot",1);a.putBundle("identity",task(0,"d".repeat(32)).toBundle());e.add(a);b.putParcelableArrayList("entries",e);return b;}
 static Bundle win(Bundle s,int n){return s.<Bundle>getParcelableArrayList("windows").get(n);}
 static Bundle ent(Bundle s){return s.<Bundle>getParcelableArrayList("entries").get(0);}
 public static void main(String[]args)throws Exception{
 test("real exact identity generates all action-bound requests",()->{var s=new AtomicWorkbenchTaskUiSnapshot(state());var w=s.window(1);for(var a:new AtomicWorkbenchTaskOperationRequest.Action[]{SHELVE,MOVE_OUT,END_TASK}){var r=s.action(w,w.tasks.get(0),a,100,a==END_TASK?"f".repeat(32):"");check(r.identity.uid==1000&&r.expectedRevision==7&&r.inputRevision==12&&r.sourceWindowSession.equals(SESSION),"wrong task request");check(r.fresh(100)&&!r.fresh(4601),"ttl");check(r.action==a&&r.targetDisplayId==(a==END_TASK?89:0),"action target");check(r.operationId.matches("[0-9a-f]{32}"),"nonce");}});
 test("partial unknown wrong typed and negative revision cannot become absence",()->{for(String k:new String[]{"success","cleanup_pending","operation_unconfirmed"}){Bundle b=state();b.remove(k);reject(()->new AtomicWorkbenchTaskUiSnapshot(b));}for(String k:new String[]{"shelf_revision","input_revision"}){Bundle b=state();b.putInt(k,7);Bundle typed=b;reject(()->new AtomicWorkbenchTaskUiSnapshot(typed));b=state();b.putLong(k,-1);Bundle bad=b;reject(()->new AtomicWorkbenchTaskUiSnapshot(bad));}Bundle b=state();b.putBoolean("operation_unconfirmed",true);reject(()->new AtomicWorkbenchTaskUiSnapshot(b));});
 test("duplicate slots and task generations and wrong locations fail",()->{Bundle b=state();b.<Bundle>getParcelableArrayList("windows").add(window(1,false));Bundle slots=b;reject(()->new AtomicWorkbenchTaskUiSnapshot(slots));b=state();win(b,0).<Bundle>getParcelableArrayList("tasks").add(task(89,"b".repeat(32)).toBundle());Bundle dup=b;reject(()->new AtomicWorkbenchTaskUiSnapshot(dup));b=state();win(b,0).putString("display_unique","reused");Bundle wrong=b;reject(()->new AtomicWorkbenchTaskUiSnapshot(wrong));});
 test("picker does not retain mutable caller bundles",()->{Bundle b=state();var s=new AtomicWorkbenchTaskUiSnapshot(b);win(b,0).putString("window_session",TARGET);win(b,0).<Bundle>getParcelableArrayList("tasks").clear();check(s.window(1).tasks.size()==1&&s.window(1).session.equals(SESSION),"snapshot aliased");boolean immutable=false;try{s.windows.clear();}catch(UnsupportedOperationException e){immutable=true;}check(immutable,"mutable windows");});
 test("recycled window session or display identity cannot act",()->{var old=new AtomicWorkbenchTaskUiSnapshot(state());for(String key:new String[]{"window_session","display_unique"}){Bundle b=state();if(key.equals("window_session"))win(b,0).putString(key,TARGET);else{win(b,0).putString(key,"reused");win(b,0).<Bundle>getParcelableArrayList("tasks").get(0).putString(key,"reused");}var fresh=new AtomicWorkbenchTaskUiSnapshot(b);reject(()->fresh.action(old.window(1),old.window(1).tasks.get(0),SHELVE,10,""));}});
 test("same taskId new system generation cannot act",()->{var old=new AtomicWorkbenchTaskUiSnapshot(state());Bundle b=state();win(b,0).<Bundle>getParcelableArrayList("tasks").get(0).putString("task_generation","e".repeat(32));var fresh=new AtomicWorkbenchTaskUiSnapshot(b);reject(()->fresh.action(old.window(1),old.window(1).tasks.get(0),SHELVE,10,""));reject(()->old.action(old.window(1),old.window(1).tasks.get(0),END_TASK,10,""));});
 test("restore binds same shelf Task and exact empty receiver",()->{var s=new AtomicWorkbenchTaskUiSnapshot(state());var r=s.restore(s.entries.get(0),s.window(2),50);check(r.action==RESTORE&&r.targetSlot==2&&r.targetWindowSession.equals(TARGET)&&r.targetDisplayId==90,"restore target");check(r.sourceSlot==1&&r.sourceWindowSession.equals(SESSION)&&r.identity.displayId==0&&r.shelfId.equals("c".repeat(32)),"shelf binding");reject(()->s.restore(s.entries.get(0),s.window(1),50));});
 test("old restore selection cannot target a replaced slot",()->{var old=new AtomicWorkbenchTaskUiSnapshot(state());Bundle b=state();win(b,1).putString("window_session",SESSION);var fresh=new AtomicWorkbenchTaskUiSnapshot(b);reject(()->fresh.restore(old.entries.get(0),old.window(2),10));});
 test("old shelf reference new object or source owner cannot restore",()->{var old=new AtomicWorkbenchTaskUiSnapshot(state());for(String key:new String[]{"task_generation","source_window_session","shelf_id"}){Bundle b=state();if(key.equals("task_generation"))ent(b).getBundle("identity").putString(key,"f".repeat(32));else ent(b).putString(key,key.equals("shelf_id")?"f".repeat(32):TARGET);var fresh=new AtomicWorkbenchTaskUiSnapshot(b);reject(()->fresh.restore(old.entries.get(0),old.window(2),10));}});
 test("nonrestorable entries are excluded without claiming disappearance",()->{Bundle b=state();ent(b).putBoolean("can_restore",false);check(new AtomicWorkbenchTaskUiSnapshot(b).entries.isEmpty(),"nonrestorable shown");b=state();ent(b).putBoolean("pending",true);Bundle pending=b;reject(()->new AtomicWorkbenchTaskUiSnapshot(pending));b=state();ent(b).putLong("revision",6);Bundle stale=b;reject(()->new AtomicWorkbenchTaskUiSnapshot(stale));});
 test("fresh preflight supplies current revisions rather than dialog revisions",()->{var old=new AtomicWorkbenchTaskUiSnapshot(state());Bundle b=state();b.putLong("shelf_revision",8);b.putLong("input_revision",13);ent(b).putLong("revision",8);var fresh=new AtomicWorkbenchTaskUiSnapshot(b);var r=fresh.restore(old.entries.get(0),old.window(2),100);check(r.expectedRevision==8&&r.inputRevision==13,"dialog revision reused");check(!r.operationId.equals(fresh.restore(old.entries.get(0),old.window(2),100).operationId),"duplicate operation nonce");});
 test("re-shelving same system task retains the durable shelf ID",()->{Bundle b=state();ent(b).putBoolean("can_restore",false);ent(b).putBundle("identity",task(0,"b".repeat(32)).toBundle());var s=new AtomicWorkbenchTaskUiSnapshot(b);var r=s.action(s.window(1),s.window(1).tasks.get(0),SHELVE,100,"");check(r.shelfId.equals("c".repeat(32)),"new shelf ID for same system Task");check(s.entries.isEmpty(),"owned task offered as physical restore");});
 System.out.println("TASK UI RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''

def main():
    sources = {"android/os/Bundle.java": BUNDLE, "ls/augment/com/TestTaskUi.java": TEST}
    production = ["AtomicWorkbenchTaskIdentity.java", "AtomicWorkbenchTaskOperationRequest.java", "AtomicWorkbenchTaskUiSnapshot.java"]
    controls = [
        ("|| !Boolean.FALSE.equals(state.get(\"operation_unconfirmed\"))", ""),
        ("if (!ids.add(window.id))", "if (false)"),
        ("|| !seen.add(task.taskGeneration)", ""),
        ("&& session.equals(windowSession)", ""),
        ("|| !current.contains(task)", ""),
        ("|| !current.identity.equals(expected.identity)", ""),
        ("|| !receiver.tasks.isEmpty()", ""),
        ("|| !current.sourceSession.equals(expected.sourceSession)", ""),
        ("if (!Boolean.TRUE.equals(item.get(\"can_restore\"))) continue;", "if (false) continue;"),
        ("shelf == null ? nonce() : shelf", "nonce()"),
    ]
    with tempfile.TemporaryDirectory(prefix="duo-task-ui-") as tmp:
        models.compile_run(Path(tmp)/"base", sources, production=production, runner="ls.augment.com.TestTaskUi")
        for i,(old,new) in enumerate(controls):
            result = models.compile_run(Path(tmp)/f"negative-{i}", sources, production=production, runner="ls.augment.com.TestTaskUi",
                replacements={"ls/augment/com/AtomicWorkbenchTaskUiSnapshot.java":(old,new)},capture=True)
            if result.returncode == 0 or b"AssertionError" not in result.stderr:
                raise AssertionError("negative control did not hit behavior: "+old+"\n"+result.stderr.decode(errors="replace"))
            print("PASS task UI negative control",i+1)
        print("TASK UI NEGATIVE CONTROLS",len(controls),"passed")

if __name__ == "__main__": main()
