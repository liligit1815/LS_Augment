"""Execute frozen delivery identity and fresh-target admission, with no clipboard/Root/backend."""
from pathlib import Path
import runpy
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
PASTE=runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-paste.py")))
SUPPORT=PASTE["SUPPORT"]
TEST=r'''package ls.augment.com;
import android.os.Bundle;import java.util.*;
public final class TestDeliveryTarget {
 static int cases,checks;interface Case{void run();}static void check(boolean v,String code){checks++;if(!v)throw new AssertionError(code);}
 static void test(Case c){c.run();cases++;}static void reject(Case c){boolean bad=false;try{c.run();}catch(IllegalArgumentException expected){bad=true;}check(bad,"INVALID_TARGET_OR_TEXT_ACCEPTED");}
 static AtomicWorkbenchDeliveryTarget target(){return make(7,2,4,0,88,"DuoAtomic-10055-w0-12345678-1234-1234-1234-123456789abc","virtual:root,88",0,10055,10101,42,"example.editor","source1",3,1000);}
 static AtomicWorkbenchDeliveryTarget make(long session,long reset,long epoch,int window,int display,String name,String unique,int user,int module,int uid,int task,String pkg,String source,long revision,long now){
  return new AtomicWorkbenchDeliveryTarget(session,reset,epoch,window,display,name,unique,user,module,uid,task,pkg,source,revision,now);}
 static Bundle window(){Bundle b=new Bundle();b.putBoolean("success",true);b.putString("state","active");b.putBoolean("recovery_pending",false);
  b.putBoolean("native_home",false);b.putBoolean("home_only",false);b.putInt("window_id",0);b.putInt("display_id",88);b.putInt("task_id",42);
  b.putInt("target_uid",10101);b.putInt("user_id",0);b.putString("display_name","DuoAtomic-10055-w0-12345678-1234-1234-1234-123456789abc");
  b.putString("display_unique_id","virtual:root,88");b.putString("package","example.editor");b.putInt("task_count",2);
  b.putString("top_component","example.editor/.Editor");b.put("running_packages",new ArrayList<>(List.of("example.editor")));return b;}
 static Bundle full(Bundle w){Bundle b=new Bundle();b.putBoolean("success",true);b.putString("state","active");b.putBoolean("recovery_pending",false);b.put("windows",new ArrayList<>(List.of(w)));return b;}
 public static void main(String[] args){
 test(()->{var t=target();check(t.id.matches("[a-f0-9]{32}")&&t.deadlineAt-t.createdAt==15000,"UUID_AND_FIXED_DEADLINE");
  check(t.liveAt(1000)&&t.liveAt(15999)&&!t.liveAt(999)&&!t.liveAt(16000),"FIXED_HALF_OPEN_LIFETIME");
  var m=t.metadata();check(m.keySet().equals(Set.of("schema","id","session","reset","epoch","window","display","name","unique","user","module_uid","target_uid","task","package","source_id","source_revision","created","deadline")),"EXACT_18_METADATA_KEYS_NO_TEXT");
  check(m.get("schema") instanceof Integer&&m.get("session") instanceof Long&&m.get("id") instanceof String,"PROTOCOL_METADATA_TYPES");
  check(!m.containsValue("x"),"PLACEHOLDER_MUST_NOT_LEAK_INTO_METADATA");});
 test(()->{var t=target();var m=t.metadata();m.putString("package","changed");m.putLong("deadline",Long.MAX_VALUE);
  check(t.metadata().getString("package").equals("example.editor")&&t.metadata().getLong("deadline",0)==16000,"METADATA_DEFENSIVE_COPY");
  var paste=t.paste("own real text🙂\u0000");check(paste.text.equals("own real text🙂\u0000")&&paste.id.equals(t.id)&&paste.metadata().equals(t.metadata()),"REAL_PASTE_TEXT_NEVER_PLACEHOLDER");});
 test(()->{Set<String> ids=new HashSet<>();for(int i=0;i<100;i++)check(ids.add(target().id),"REQUEST_ID_REUSED");});
 test(()->{var t=target();check(t.currentMatches(window())&&t.currentMatches(full(window()),15999)&&!t.currentMatches(window(),16000),"CURRENT_TARGET_AND_DEADLINE");
  var side=window();side.putBoolean("input_focus_suspended",true);check(t.currentMatches(side),"LEGITIMATE_SIDE_GUARD_MUST_BE_ALLOWED");});
 test(()->{Object[][] changes={{"window_id",1},{"display_id",89},{"task_id",43},{"target_uid",10102},{"user_id",1},{"display_name","other"},
   {"display_unique_id","recycled"},{"package","other.pkg"},{"top_component","other.pkg/.Editor"},{"task_count",0},{"state","launching"},
   {"success",false},{"native_home",true},{"home_only",true},{"recovery_pending",true},{"cleanup_pending",true},{"input_focus_cleanup_pending",true},
   {"display_id","88"},{"success","true"},{"native_home","false"},{"running_packages",new ArrayList<String>()}};
  for(Object[] change:changes){Bundle b=window();b.put((String)change[0],change[1]);check(!target().currentMatches(b),"CHANGED_TARGET_ADMITTED_"+change[0]);}});
 test(()->{for(String key:new String[]{"success","state","recovery_pending","native_home","home_only","window_id","display_id","task_id","target_uid","user_id","display_name","display_unique_id","package","task_count","top_component","running_packages"}){
  Bundle b=window();b.remove(key);check(!target().currentMatches(b),"MISSING_TARGET_EVIDENCE_ADMITTED_"+key);}});
 test(()->{Bundle b=full(window());b.putBoolean("recovery_pending",true);check(!target().currentMatches(b),"GLOBAL_RECOVERY_ADMITTED");
  b=full(window());b.put("windows",new ArrayList<>(List.of(window(),window())));check(!target().currentMatches(b),"DUPLICATE_WINDOW_ID_ADMITTED");
  b=full(window());b.put("windows",null);check(!target().currentMatches(b),"NULL_WINDOW_SNAPSHOT_ADMITTED");
  b=full(window());b.put("windows",new ArrayList<>(List.of("wrong")));check(!target().currentMatches(b),"WRONG_WINDOW_TYPE_ADMITTED");
  b=full(window());b.put("windows",new ArrayList<Bundle>());check(!target().currentMatches(b),"MISSING_TARGET_WINDOW_ADMITTED");});
 test(()->{var t=target();reject(()->t.paste(null));reject(()->t.paste(""));reject(()->t.paste("\ud800"));reject(()->t.paste("x".repeat(32769)));
  check(t.paste("x".repeat(32768)).text.length()==32768&&t.paste(" \n").text.equals(" \n"),"REAL_TEXT_LIMIT_OR_WHITESPACE_CHANGED");});
 test(()->{String name="DuoAtomic-10055-w0-12345678-1234-1234-1234-123456789abc";
  reject(()->make(-1,2,4,0,88,name,"unique",0,10055,10101,42,"example.editor","source",3,1000));
  reject(()->make(7,-1,4,0,88,name,"unique",0,10055,10101,42,"example.editor","source",3,1000));
  reject(()->make(7,2,-1,0,88,name,"unique",0,10055,10101,42,"example.editor","source",3,1000));
  reject(()->make(7,2,4,4,88,name,"unique",0,10055,10101,42,"example.editor","source",3,1000));
  reject(()->make(7,2,4,0,0,name,"unique",0,10055,10101,42,"example.editor","source",3,1000));
  reject(()->make(7,2,4,0,88,"wrong","unique",0,10055,10101,42,"example.editor","source",3,1000));
  reject(()->make(7,2,4,0,88,name,"unique",1,10055,10101,42,"example.editor","source",3,1000));
  reject(()->make(7,2,4,0,88,name,"unique",0,10055,110101,42,"example.editor","source",3,1000));
  reject(()->make(7,2,4,0,88,name,"unique",0,10055,10101,-1,"example.editor","source",3,1000));
  reject(()->make(7,2,4,0,88,name,"unique",0,10055,10101,42,"ls.augment.com","source",3,1000));
  reject(()->make(7,2,4,0,88,name,"unique",0,10055,10101,42,"example.editor","source",-1,1000));
  reject(()->make(7,2,4,0,88,name,"unique",0,10055,10101,42,"example.editor","source",3,-1));
  reject(()->make(7,2,4,0,88,name,"unique",0,10055,10101,42,"example.editor","source",3,Long.MAX_VALUE));});
 test(()->{var t=make(7,2,4,0,88,"DuoAtomic-110055-w0-12345678-1234-1234-1234-123456789abc","unique",1,110055,110101,42,"example.editor","source",3,1000);
  Bundle b=window();b.putInt("user_id",1);b.putInt("target_uid",110101);b.putString("display_name",t.displayName);b.putString("display_unique_id","unique");
  check(t.currentMatches(b)&&t.paste("own").userId==1,"NONZERO_USER_IDENTITY_NOT_HARDCODED");});
 System.out.println("DELIVERY TARGET RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''

def run(source, expected=None):
    with tempfile.TemporaryDirectory(prefix="duo-delivery-target-") as temporary:
        root=Path(temporary);sources={"android/os/Bundle.java":PASTE["SOURCES"]["android/os/Bundle.java"],
            "ls/augment/com/AtomicWorkbenchDeliveryTarget.java":source,"ls/augment/com/TestDeliveryTarget.java":TEST}
        for name in ["AtomicWorkbenchPasteRequest.java","AtomicWorkbenchPastePolicy.java"]:
            sources["ls/augment/com/"+name]=(ROOT/"android/app/src/main/java/ls/augment/com"/name).read_text(encoding="utf-8")
        paths=[]
        for name,text in sources.items():
            file=root/name;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(text,encoding="utf-8");paths.append(str(file))
        result=subprocess.run([SUPPORT["JAVAC"],"-encoding","UTF-8","-d",str(root),*paths],env=SUPPORT["ENV"],capture_output=True,text=True,errors="replace",timeout=60)
        if result.returncode:raise AssertionError(result.stderr)
        result=subprocess.run([SUPPORT["JAVA"],"-cp",str(root),"ls.augment.com.TestDeliveryTarget"],env=SUPPORT["ENV"],capture_output=True,text=True,errors="replace",timeout=30)
        if expected:
            if result.returncode==0 or expected not in result.stderr:raise AssertionError("Negative control missed: "+expected+"\n"+result.stderr)
            print("PASS rejected target negative: "+expected)
        else:
            if result.returncode:raise AssertionError(result.stderr)
            print(result.stdout,end="")

if __name__=="__main__":
    source=(ROOT/"android/app/src/main/java/ls/augment/com/AtomicWorkbenchDeliveryTarget.java").read_text(encoding="utf-8")
    run(source)
    run(source.replace('Bundle metadata() { return new Bundle(frozenMetadata); }','Bundle metadata() { return frozenMetadata; }'),"METADATA_DEFENSIVE_COPY")
    run(source.replace('sourcePayloadId, sourceRevision, actualText, createdAt, deadlineAt);','sourcePayloadId, sourceRevision, "x", createdAt, deadlineAt);'),"REAL_PASTE_TEXT_NEVER_PLACEHOLDER")
    run(source.replace('!displayUniqueId.equals(window.get("display_unique_id"))','false'),"CHANGED_TARGET_ADMITTED_display_unique_id")
