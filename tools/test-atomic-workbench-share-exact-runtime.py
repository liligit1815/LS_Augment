"""Exercise production Platform exact-share checks and launch binding with controlled Android services."""
from pathlib import Path
import argparse
import os
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-launch-runtime.py")))
SUPPORT = BASE["SUPPORT"]
PRODUCTION = ["AtomicWorkbenchPlatform.java", "AtomicWorkbenchLaunchBridge.java", "AtomicWorkbenchProtocol.java",
              "AtomicWorkbenchDeliveryTarget.java", "AtomicWorkbenchPasteRequest.java", "AtomicWorkbenchPastePolicy.java",
              "AtomicWorkbenchBrowserSearch.java", "AtomicWorkbenchDragDeliveryPolicy.java",
              "AtomicWorkbenchRecoveryScope.java", "AtomicWorkbenchDisplayPolicy.java", "AtomicWorkbenchSlotDomain.java"]

TEST = r'''package ls.augment.com;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import java.util.*;
public final class TestExactShare {
 static int cases,checks;static void check(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}interface Case{void run()throws Exception;}static void test(String n,Case body)throws Exception{body.run();cases++;System.out.println("PASS production exact share: "+n);}
 public static class Service extends TestAtomicWorkbenchLaunch.TaskService {
  int requestedTask=-1;Runnable afterStart;boolean throwAfterStart;
  @Override public int startActivityAsUser(IApplicationThread caller,String pkg,String feature,Intent intent,String type,IBinder token,String who,int request,int flags,ProfilerInfo profiler,Bundle options,int user){
   requestedTask=options.getInt("launchTaskId",-1);boolean wasCreate=createTask;
   // Model the activity manager's existing-task option. Record the actual requested task,
   // do not invent a new task or substitute the currently focused task for it.
   if(requestedTask>=0)createTask=false;
   int result;try{result=super.startActivityAsUser(caller,pkg,feature,intent,type,token,who,request,flags,profiler,options,user);}finally{createTask=wasCreate;}
   if(afterStart!=null)afterStart.run();if(throwAfterStart)throw new IllegalStateException("injected result lost after dispatch");return result;
  }
 }
 static final class Fixture {
  final Service service=new Service();final Context context=new Context();final Handler handler=new Handler();final Surface surface=new Surface();final AtomicWorkbenchPlatform platform;
  Fixture(){SystemClock.now=1000;FakeFocusController.reset();ActivityTaskManager.service=service;WindowManagerGlobal.service.policies.clear();WindowManagerGlobal.service.forced=-1;WindowManagerGlobal.service.deny=false;AtomicWorkbenchDiagnostics.events.clear();
   platform=new AtomicWorkbenchPlatform(context,10055,0,handler,2,null,new FakeFocusController(context));platform.configureAllocationScopeFence((target,source)->{});service.createTask=true;
   check(platform.open(surface,1080,2400,420,"sample/sample.Main").getBoolean("success"),"fixture source app did not open");service.createTask=false;
  }
  Bundle metadata(){Bundle status=platform.status();check(status.getBoolean("success")&&status.getInt("task_id",-1)==77,"fixture has no fresh source identity");return new AtomicWorkbenchDeliveryTarget(7,2,3,2,status.getInt("display_id"),status.getString("display_name"),status.getString("display_unique_id"),0,10055,status.getInt("target_uid"),status.getInt("task_id"),"sample","payload",1,SystemClock.now).metadata();}
  Intent payload(){return new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT,"private-share-test");}
  Intent exact(Bundle metadata){return payload().putExtra(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET,metadata);}
  void notDispatched(Bundle metadata)throws Exception{int starts=service.starts,priorDisplay=service.tasks.get(0).displayId;platform.suspendInputFocus();int resumes=FakeFocusController.resumes;
   Bundle result=platform.share(exact(metadata),"sample");check(!result.getBoolean("success")&&!result.getBoolean("share_dispatched")&&service.starts==starts,"invalid exact target reached dispatcher");
   check(FakeFocusController.resumes==resumes,"invalid target changed focus before its first gate");check(platform.hasLiveDisplay()&&!surface.released&&service.tasks.get(0).displayId==priorDisplay,"rejected exact target changed task/display/surface");
  }
 }
 public static void main(String[] args)throws Exception{
  test("browser text drop searches inside the frozen original task without sharing metadata",()->{Fixture f=new Fixture();Bundle metadata=f.metadata();
   Intent incoming=AtomicWorkbenchBrowserSearch.textIntent("sample","exact browser query").putExtra(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET,metadata);
   Bundle result=f.platform.share(incoming,"sample");check(result.getBoolean("success")&&result.getBoolean("browser_search_started"),"text search not acknowledged");
   check(f.service.requestedTask==77&&f.service.requestedDisplay==88,"browser search left the selected task/display");
   check(Intent.ACTION_VIEW.equals(f.service.intent.getAction())&&"https://www.bing.com/search?q=exact+browser+query".equals(f.service.intent.getData().toString()),"browser query changed or became share");
   check(!f.service.intent.extras.containsKey(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET)&&f.service.intent.getClipData()==null,"search leaked private target or media");
  });
  test("browser search without an exact target never starts",()->{Fixture f=new Fixture();int starts=f.service.starts;Bundle result=f.platform.share(AtomicWorkbenchBrowserSearch.textIntent("sample","query"),"sample");
   check(!result.getBoolean("success")&&f.service.starts==starts,"unbound browser search started");});
  test("legacy SEARCH action that only prefills is not accepted as search",()->{Fixture f=new Fixture();int starts=f.service.starts;
   Intent incoming=new Intent(Intent.ACTION_SEARCH).setPackage("sample").putExtra("query","direct query").putExtra(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET,f.metadata());
   Bundle result=f.platform.share(incoming,"sample");check(!result.getBoolean("success")&&f.service.starts==starts,"prefill action dispatched as completed search");});
  test("frozen destination package cannot be replaced by a different receiver",()->{Fixture f=new Fixture();int starts=f.service.starts;Bundle result=f.platform.share(f.exact(f.metadata()),"other");check(!result.getBoolean("success")&&f.service.starts==starts&&!result.getBoolean("share_dispatched"),"different receiver replaced selected package");});
  test("exact share binds the frozen original task and strips private destination metadata",()->{Fixture f=new Fixture();Bundle metadata=f.metadata();TestAtomicWorkbenchLaunch.Task other=new TestAtomicWorkbenchLaunch.Task();other.taskId=78;other.displayId=99;f.service.tasks.add(other);int starts=f.service.starts;
   Intent incoming=f.exact(metadata).putExtra("untrusted_extra","discard");Bundle result=f.platform.share(incoming,"sample");
   check(result.getBoolean("success")&&result.getBoolean("share_started")&&result.getBoolean("share_dispatched")&&f.service.starts==starts+1,"valid exact share not acknowledged");
   check(f.service.requestedTask==77&&f.service.requestedDisplay==88,"exact share lost original task binding");check(other.displayId==99&&f.service.tasks.size()==2,"same-package other window/task moved or replaced");
   check(!f.service.intent.extras.containsKey(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET)&&!f.service.intent.extras.containsKey("untrusted_extra"),"private metadata escaped to target app");
   check(incoming.getBundleExtra(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET)==metadata&&metadata.size()==18,"safe share modified caller's frozen metadata");
  });
  for(String bad:new String[]{"schema","module_uid","user","window","display","name","unique","task","target_uid","package","deadline"})test("pre-dispatch rejects frozen target drift: "+bad,()->{Fixture f=new Fixture();Bundle m=f.metadata();switch(bad){case "name":case "unique":case "package":m.putString(bad,"different");break;case "deadline":SystemClock.now=m.getLong("deadline",-1);break;default:m.putInt(bad,m.getInt(bad)+1);break;}f.notDispatched(m);});
  test("same-package newly front task is not substituted for the frozen task",()->{Fixture f=new Fixture();Bundle m=f.metadata();TestAtomicWorkbenchLaunch.Task top=new TestAtomicWorkbenchLaunch.Task();top.taskId=78;top.displayId=88;f.service.tasks.add(0,top);f.notDispatched(m);});
  test("same package task on another display cannot satisfy the selected window",()->{Fixture f=new Fixture();Bundle m=f.metadata();f.service.tasks.get(0).displayId=99;f.notDispatched(m);check(f.service.tasks.get(0).displayId==99,"foreign display task stolen");});
  test("fresh package UID changes and missing package never reuse cached UID",()->{Fixture f=new Fixture();Bundle m=f.metadata();f.context.packages.packageUids.put("sample",10077);f.notDispatched(m);Fixture g=new Fixture();Bundle n=g.metadata();g.context.packages.missingPackages.add("sample");g.notDispatched(n);});
  test("actual display unique generation change is rejected before dispatch",()->{Fixture f=new Fixture();Bundle m=f.metadata();int starts=f.service.starts;f.context.displays.latest.display.unique="reused-physical-id";Bundle result=f.platform.share(f.exact(m),"sample");check(!result.getBoolean("success")&&!result.getBoolean("share_dispatched")&&f.service.starts==starts&&f.platform.hasLiveDisplay(),"reused display accepted exact share");});
  test("second fresh task gate catches a change during real guard removal",()->{Fixture f=new Fixture();Bundle m=f.metadata();f.platform.suspendInputFocus();int starts=f.service.starts;
   FakeFocusController.onResume=()->f.service.tasks.get(0).taskId=78;Bundle result=f.platform.share(f.exact(m),"sample");
   check(!result.getBoolean("success")&&!result.getBoolean("share_dispatched")&&f.service.starts==starts,"late target change reached dispatcher");check(FakeFocusController.resumes==1,"did not exercise actual resume boundary");});
  test("deadline expiring during guard removal cannot start a receiver",()->{Fixture f=new Fixture();Bundle m=f.metadata();f.platform.suspendInputFocus();int starts=f.service.starts;
   FakeFocusController.onResume=()->SystemClock.now=m.getLong("deadline",-1);Bundle result=f.platform.share(f.exact(m),"sample");check(!result.getBoolean("success")&&!result.getBoolean("share_dispatched")&&f.service.starts==starts,"late deadline reached dispatcher");});
  test("post-start task change is dispatched unknown without an automatic retry",()->{Fixture f=new Fixture();Bundle m=f.metadata();int starts=f.service.starts;f.service.afterStart=()->f.service.tasks.get(0).taskId=78;Bundle result=f.platform.share(f.exact(m),"sample");
   check(!result.getBoolean("success")&&result.getBoolean("share_dispatched")&&!result.getBoolean("share_started")&&f.service.starts==starts+1,"post-start mismatch falsely reported undispatched or completed");check(result.getString("message").contains("尚未核对")&&!result.getString("message").contains("未交给"),"possible dispatch described as unsent");});
  test("post-start top-app UID change is dispatched unknown even inside the same task",()->{Fixture f=new Fixture();Bundle m=f.metadata();int starts=f.service.starts;f.context.packages.packageUids.put("other",10077);f.service.afterStart=()->f.service.tasks.get(0).topActivity=new ComponentName("other","other.Shared");Bundle result=f.platform.share(f.exact(m),"sample");
   check(!result.getBoolean("success")&&result.getBoolean("share_dispatched")&&!result.getBoolean("share_started")&&f.service.starts==starts+1,"post-start UID mismatch lost dispatch uncertainty");check(f.platform.hasLiveDisplay()&&!f.surface.released&&f.service.tasks.get(0).taskId==77,"uncertain share closed/replaced its task");});
  test("Binder exception after start is dispatched unknown and never resent",()->{Fixture f=new Fixture();Bundle m=f.metadata();int starts=f.service.starts;f.service.throwAfterStart=true;Bundle result=f.platform.share(f.exact(m),"sample");check(!result.getBoolean("success")&&result.getBoolean("share_dispatched")&&f.service.starts==starts+1&&f.platform.hasLiveDisplay(),"lost Binder result retried or claimed unstarted");});
  test("ordinary share after an exact share has no frozen task binding or metadata pollution",()->{Fixture f=new Fixture();check(f.platform.share(f.exact(f.metadata()),"sample").getBoolean("success"),"exact setup share failed");Intent ordinary=f.payload().putExtra("foreign_private_metadata",new Bundle());Bundle result=f.platform.share(ordinary,"sample");
   check(result.getBoolean("success")&&f.service.requestedTask==-1&&f.service.requestedDisplay==88,"ordinary share inherited exact task marker");check(!f.service.intent.extras.containsKey(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET)&&!f.service.intent.extras.containsKey("foreign_private_metadata")&&"private-share-test".contentEquals(f.service.intent.getCharSequenceExtra(Intent.EXTRA_TEXT)),"ordinary safe payload retained private metadata");
   check(AtomicWorkbenchDiagnostics.events.stream().noneMatch(s->s.contains("private-share-test")),"share text entered diagnostics");});
  System.out.println("EXACT SHARE RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def source_map():
    sources = SUPPORT["migration_sources"]()
    sources.pop("ls/augment/com/TestAtomicWorkbenchMigration.java")
    sources.update(BASE["SOURCES"])
    sources["android/app/SearchManager.java"]='package android.app;public class SearchManager{public static final String QUERY="query";}'
    intent=sources["android/content/Intent.java"]
    intent=intent.replace('public static final String ACTION_MAIN=', 'public static final String ACTION_SEARCH="android.intent.action.SEARCH",ACTION_WEB_SEARCH="android.intent.action.WEB_SEARCH",ACTION_VIEW="android.intent.action.VIEW",CATEGORY_BROWSABLE="android.intent.category.BROWSABLE";public static final String ACTION_MAIN=',1)
    intent=intent.rsplit('}',1)[0]+'''public Intent(String a,android.net.Uri d){this(a);data=d;}public ClipData getClipData(){return clip;}public android.os.Bundle getExtras(){android.os.Bundle b=new android.os.Bundle();for(var e:extras.entrySet()){Object v=e.getValue();if(v instanceof String)b.putString(e.getKey(),(String)v);else if(v instanceof android.os.Bundle)b.putBundle(e.getKey(),(android.os.Bundle)v);else if(v instanceof Integer)b.putInt(e.getKey(),(Integer)v);}return b;}}'''
    sources["android/content/Intent.java"]=intent
    sources["android/net/Uri.java"]=sources["android/net/Uri.java"].rsplit('}',1)[0]+'public String toString(){return text;}}'
    sources["android/os/Bundle.java"] = sources["android/os/Bundle.java"].rsplit("}", 1)[0] + "public Object get(String key){return data.get(key);}public int size(){return data.size();}public Bundle deepCopy(){Bundle b=new Bundle();for(var e:data.entrySet())b.data.put(e.getKey(),copyValue(e.getValue()));return b;}private static Object copyValue(Object v){if(v instanceof Bundle)return ((Bundle)v).deepCopy();if(v instanceof java.util.ArrayList<?>){java.util.ArrayList<Object> l=new java.util.ArrayList<>();for(Object i:(java.util.ArrayList<?>)v)l.add(copyValue(i));return l;}return v;}}"
    # The legacy launch journal double used the literal name "owned". This test
    # feeds the real DeliveryTarget policy, so model the production constructor's
    # canonical per-UID/per-slot display name instead of weakening that policy.
    journal = sources["ls/augment/com/AtomicWorkbenchJournal.java"]
    before = "ownerUid=uid;userId=user;windowId=id;"
    assert journal.count(before) == 1
    journal=journal.replace(before, before + 'displayName="DuoAtomic-"+uid+"-w"+id+"-12345678-1234-1234-1234-123456789abc";')
    journal=journal.rsplit('}',1)[0]+'''AtomicWorkbenchJournal(android.content.Context context,int uid,int user,int slot,AtomicWorkbenchRecoveryScope.ReaderProfile reader){this(context,uid,user,slot);if(reader!=AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4)throw new IllegalArgumentException("this test covers LOW4 only");}}'''
    sources["ls/augment/com/AtomicWorkbenchJournal.java"] = journal
    sources["ls/augment/com/TestAtomicWorkbenchLaunch.java"] = BASE["TEST"]
    sources["ls/augment/com/TestExactShare.java"] = TEST
    return sources


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--negative-controls", action="store_true")
    args = parser.parse_args()
    sdk = Path(os.environ.get("ANDROID_HOME", str(SUPPORT["ROOT"] / "audit-output/android-sdk"))) / "platforms/android-36/android.jar"
    sources = source_map()
    with tempfile.TemporaryDirectory(prefix="lsa-share-exact-") as directory:
        SUPPORT["compile_run"](Path(directory), sources, PRODUCTION, "ls.augment.com.TestExactShare", sdk)
    if args.negative_controls:
        negatives(sources, sdk)


def negatives(sources, sdk):
    sources, production = SUPPORT["output_support"](sources, PRODUCTION)
    original = (SUPPORT["SRC"] / "AtomicWorkbenchPlatform.java").read_text(encoding="utf-8")
    changes = [
        ("            requireShareTarget(exact);\n            if (packageName", "            // MUTANT: missing first identity gate\n            if (packageName", "invalid target changed focus before its first gate"),
        ('if (exact != null) invoke(options, "setLaunchTaskId", new Class<?>[]{int.class}, exact.getInt("task", -1));', '// MUTANT: task binding dropped', "browser search left the selected task/display"),
        ("            dispatched = true;\n            int started = AtomicWorkbenchLaunchBridge.start", "            dispatched = false;\n            int started = AtomicWorkbenchLaunchBridge.start", "post-start mismatch falsely reported undispatched or completed"),
        ('Intent outgoing = new Intent(action).setPackage(packageName).setType(type);', 'Intent outgoing = supplied.setPackage(packageName).setType(type);', "private metadata escaped to target app"),
        ("            requireShareTarget(exact);\n            requireAllocationScope(null);\n            outgoing.setComponent", "            // MUTANT: missing second fresh identity gate\n            requireAllocationScope(null);\n            outgoing.setComponent", "late target change reached dispatcher"),
    ]
    for before, after, expected in changes:
        if original.count(before) != 1:
            raise AssertionError("mutation no longer targets exactly one production branch: " + before)
        with tempfile.TemporaryDirectory(prefix="lsa-share-exact-negative-") as directory:
            work = Path(directory); files = []; all_sources = dict(sources)
            all_sources.update({"ls/augment/com/" + name: (SUPPORT["SRC"] / name).read_text(encoding="utf-8") for name in production})
            all_sources["ls/augment/com/AtomicWorkbenchPlatform.java"] = original.replace(before, after)
            for name, value in all_sources.items():
                path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(value, encoding="utf-8"); files.append(str(path))
            compiled = subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-cp", str(sdk), "-d", str(work / "classes"), *files], capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=45)
            if compiled.returncode: raise AssertionError(compiled.stdout + compiled.stderr)
            result = subprocess.run([SUPPORT["JAVA"], "-cp", os.pathsep.join((str(work / "classes"), str(sdk))), "ls.augment.com.TestExactShare"], capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=45)
            if result.returncode == 0 or expected not in result.stdout + result.stderr: raise AssertionError(result.stdout + result.stderr)
            print("PASS exact-share negative control: " + before.strip().splitlines()[0])


if __name__ == "__main__":
    main()
