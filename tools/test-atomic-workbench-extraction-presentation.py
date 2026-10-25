"""Exercise actual private-page task selection without changing framework input protection."""
from pathlib import Path
import runpy
import subprocess
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))

def member(text, signature):
    start = text.index(signature)
    end = text.index("{", start) + 1
    depth = 1
    while depth:
        depth += (text[end] == "{") - (text[end] == "}")
        end += 1
    return text[start:end]

activity = (SUPPORT["SRC"] / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
presentation = (SUPPORT["SRC"] / "AtomicWorkbenchExtractionPresentation.java").read_text(encoding="utf-8")
host_method = member(activity, "static AtomicWorkbenchActivity extractionHost()")
launch_method = member(presentation, "static boolean launch(Context context, String nonce)")
sources = {
    "android/os/Looper.java": "package android.os;public class Looper {public static final Looper main=new Looper();public static Looper current=main;public static Looper myLooper(){return current;}public static Looper getMainLooper(){return main;}}",
    "android/content/Context.java": "package android.content;public class Context {public int calls;public Intent intent;public boolean fail;public void startActivity(Intent value){calls++;if(fail)throw new IllegalStateException();intent=value;}}",
    "android/content/Intent.java": "package android.content;public class Intent {public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000,FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS=0x800000;public int flags;public Object extra;public Intent(Context c,Class<?> type){}public Intent putExtra(String key,String value){extra=value;return this;}public Intent addFlags(int value){flags|=value;return this;}}",
    "ls/augment/com/AtomicWorkbenchActivity.java": "package ls.augment.com;import android.os.Looper;class AtomicWorkbenchActivity extends android.content.Context {static java.lang.ref.WeakReference<AtomicWorkbenchActivity> extractionHost=new java.lang.ref.WeakReference<>(null);boolean active=true,resumed=true,destroyed,closing,finishing;int task=8;static class Display {int id;int getDisplayId(){return id;}}Display display=new Display();boolean isFinishing(){return finishing;}boolean isDestroyed(){return destroyed;}int getTaskId(){return task;}Display getDisplay(){return display;}" + host_method + "}",
    "ls/augment/com/AtomicWorkbenchExtractionActivity.java": "package ls.augment.com;class AtomicWorkbenchExtractionActivity {}",
    "ls/augment/com/AtomicWorkbenchExtractionPresentation.java": "package ls.augment.com;import android.content.*;class AtomicWorkbenchExtractionPresentation {static final String EXTRA_NONCE=\"nonce\";static boolean ready=true;static class Handoff {String expired;void expire(String value){expired=value;}}static final Handoff HANDOFF=new Handoff();static boolean available(Context c){return ready;}" + launch_method + "}",
    "ls/augment/com/TestExtractionPresentation.java": '''package ls.augment.com;
import android.content.*;import android.os.Looper;
public class TestExtractionPresentation {
 static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static class F {Context service=new Context();AtomicWorkbenchActivity host=new AtomicWorkbenchActivity();F(){AtomicWorkbenchActivity.extractionHost=new java.lang.ref.WeakReference<>(host);AtomicWorkbenchExtractionPresentation.ready=true;AtomicWorkbenchExtractionPresentation.HANDOFF.expired=null;Looper.current=Looper.main;}boolean launch(){return AtomicWorkbenchExtractionPresentation.launch(service,"own-one-use-nonce");}}
 public static void main(String[] args){
  F f=new F();check(f.launch()&&f.host.calls==1&&f.service.calls==0,"visible host was not the actual launch owner");check(f.host.intent.flags==0&&"own-one-use-nonce".equals(f.host.intent.extra),"same-task launch acquired NEW_TASK or changed nonce");
  for(int mode=0;mode<9;mode++){f=new F();switch(mode){case 0:f.host.active=false;break;case 1:f.host.resumed=false;break;case 2:f.host.destroyed=true;break;case 3:f.host.closing=true;break;case 4:f.host.finishing=true;break;case 5:f.host.task=-1;break;case 6:f.host.display.id=99;break;case 7:f.host.display=null;break;case 8:Looper.current=new Looper();break;}
   check(f.launch()&&f.host.calls==0&&f.service.calls==1,"inactive/foreign host was selected "+mode);check(f.service.intent.flags==(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS),"standalone fallback changed "+mode);}
  f=new F();AtomicWorkbenchActivity.extractionHost=new java.lang.ref.WeakReference<>(null);check(f.launch()&&f.service.calls==1,"no host disabled standalone extraction");
  f=new F();f.host.fail=true;check(!f.launch()&&f.service.calls==0&&"own-one-use-nonce".equals(AtomicWorkbenchExtractionPresentation.HANDOFF.expired),"failed host launch retried or retained nonce");
  f=new F();AtomicWorkbenchExtractionPresentation.ready=false;check(!f.launch()&&f.host.calls==0&&f.service.calls==0,"locked/unavailable UI launched");
  System.out.println("EXTRACTION PRESENTATION RESULT 13 cases; "+checks+" assertions");
 }
}''',
}
with tempfile.TemporaryDirectory(prefix="lsa-extraction-presentation-") as folder:
    SUPPORT["compile_run"](Path(folder), sources, [], "ls.augment.com.TestExtractionPresentation")
for label, path, before, after in [
    ("same_task_owner", "ls/augment/com/AtomicWorkbenchExtractionPresentation.java", "if (host != null) host.startActivity(intent);", "if (host != null) context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));"),
    ("paused_host", "ls/augment/com/AtomicWorkbenchActivity.java", "host.resumed &&", ""),
]:
    altered = dict(sources)
    assert before in altered[path]
    altered[path] = altered[path].replace(before, after)
    try:
        with tempfile.TemporaryDirectory(prefix="lsa-extraction-presentation-negative-") as folder:
            SUPPORT["compile_run"](Path(folder), altered, [], "ls.augment.com.TestExtractionPresentation")
    except subprocess.CalledProcessError as failure:
        assert Path(failure.cmd[0]).stem.lower() == "java", "Negative control must compile"
        print("PASS private page negative control:", label)
    else:
        raise AssertionError("Private page negative control unexpectedly passed: " + label)
