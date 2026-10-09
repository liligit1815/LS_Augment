"""Run the real redirect hook against a small framework facade (no device required).

Verifies classification, copied launch options, task/result preservation, failure
cleanup and fail-closed behavior. OEM window placement still needs a device.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
"android/content/Context.java": "package android.content; public class Context {}",
"android/content/Intent.java": """package android.content;import java.util.*;public class Intent {
 public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000,FLAG_ACTIVITY_FORWARD_RESULT=0x02000000,FLAG_ACTIVITY_LAUNCH_ADJACENT=0x1000;
 public static final String CATEGORY_HOME="home";public int flags;public String extra="auth-token",identifier;
 public Set<String> categories=new HashSet<>();public boolean hasCategory(String s){return categories.contains(s);}
 public int getFlags(){return flags;}public Intent addFlags(int f){flags|=f;return this;}}
""",
"android/content/pm/ApplicationInfo.java": """package android.content.pm;public class ApplicationInfo {
 public static final int FLAG_SYSTEM=1,FLAG_UPDATED_SYSTEM_APP=128,FLAG_IS_GAME=0x2000000,CATEGORY_GAME=0;
 public int flags,category=-1,uid=10500;}
""",
"android/content/pm/ActivityInfo.java": """package android.content.pm;public class ActivityInfo {
 public ApplicationInfo applicationInfo=new ApplicationInfo();public String packageName,name="MainActivity";}
""",
"android/app/ActivityOptions.java": """package android.app;public class ActivityOptions {
 public int mode,task=-1,display=-1;public Object root;public String animation="original";
 public static ActivityOptions makeBasic(){return new ActivityOptions();}
 public ActivityOptions toBundle(){return this;}public static ActivityOptions fromBundle(ActivityOptions o){
 ActivityOptions n=new ActivityOptions();n.mode=o.mode;n.task=o.task;n.display=o.display;n.root=o.root;n.animation=o.animation;return n;}
 public int getLaunchWindowingMode(){return mode;}public int getLaunchTaskId(){return task;}
 public int getLaunchDisplayId(){return display;}public Object getLaunchRootTask(){return root;}
 public void setLaunchWindowingMode(int v){mode=v;}}
""",
"ls/augment/com/ConfigSchema.java": """package ls.augment.com;public class ConfigSchema {
 public static final String FREEFORM_GAME_LOGIN="login",FREEFORM_EXTERNAL_APPS="external",FREEFORM_GAME_APPS="games",FREEFORM_EXCLUDED_APPS="excluded";
 public static boolean truthy(String s){return "1".equals(s);}}
""",
"ls/augment/com/ConfigSnapshot.java": """package ls.augment.com;import java.util.*;public class ConfigSnapshot {
 public final Map<String,String> values=new HashMap<>();public String get(String s){return values.getOrDefault(s,"");}}
""",
"ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;import ls.augment.com.*;import android.content.Context;
 public class FeatureSettings {public static ConfigSnapshot current=new ConfigSnapshot();public static ConfigSnapshot snapshot(Context c){return current;}
 public static void diagnostic(Context c,String k,String v){}}
""",
"ls/augment/com/hook/SystemUiAdapter.java": """package ls.augment.com.hook;import java.lang.reflect.*;import android.content.Context;
 public class SystemUiAdapter {public static Object field(Object o,String name){if(o==null)return null;
 try{return o.getClass().getField(name).get(o);}catch(Exception e){return null;}}
 public static Context context(Object o){return new Context();}
 public static Object call(Object o,String name,Object... args)throws ReflectiveOperationException {
 for(Method m:o.getClass().getMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length)return m.invoke(o,args);
 throw new NoSuchMethodException(name);}}
""",
"ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
 public class AugmentModule {
 public static Map<String,Interceptor> hooks=new HashMap<>();public interface Interceptor {Object invoke(Chain c)throws Throwable;}
 public interface Action {Object run(Object[] args)throws Throwable;}
 public static class Chain {Object owner;Object[] args;Action action;Chain(Object o,Object[] a,Action x){owner=o;args=a;action=x;}
 public Object getThisObject(){return owner;}public List<Object> getArgs(){return Arrays.asList(args);}
 public Object proceed()throws Throwable{return action.run(args);}public Object proceed(Object[] a)throws Throwable{return action.run(a);}}
 public class Builder {String name;Builder(String n){name=n;}public Object intercept(Interceptor h){hooks.put(name,h);return h;}}
 public Builder prepareFeatureHook(Method m,String id,boolean b){return new Builder(m.getName());}
 public void registerFeatureHook(Object h){}public boolean deoptimize(Method m){return true;}
 public void logFeatureInfo(String s){}public void logFeatureError(String s,Throwable t){throw new AssertionError(s,t);}
 public static Object dispatch(String name,Object owner,Object[] args,Action body)throws Throwable{
 Interceptor h=hooks.get(name);return h==null?body.run(args):h.invoke(new Chain(owner,args,body));}}
""",
"com/android/server/wm/ActivityRecord.java": """package com.android.server.wm;import android.content.*;import android.content.pm.*;
 public class ActivityRecord {public ActivityInfo info=new ActivityInfo();public Intent intent=new Intent();
 public ActivityRecord resultTo;public String packageName,launchedFromPackage;public int launchedFromUid=10500;public boolean visible=true,standard=true,undefined=true;
 public ActivityRecord(String pkg){packageName=pkg;info.packageName=pkg;}
 public boolean isVisibleRequested(){return visible;}public boolean isActivityTypeStandard(){return standard&&!undefined;}
 public boolean isActivityTypeStandardOrUndefined(){return standard||undefined;}}
""",
"com/android/server/wm/TaskDisplayAreaMifavor.java": """package com.android.server.wm;
public class TaskDisplayAreaMifavor {public static void addWRIntentId_WindowReply_ActivityRecord(ActivityRecord r){r.intent.identifier="_WindowReply";}}
""",
"com/android/server/wm/ActivityStarter.java": """package com.android.server.wm;import android.app.*;import ls.augment.com.hook.AugmentModule;
 public class ActivityStarter {
 public static class Root {public ActivityRecord top;public ActivityRecord getTopResumedActivity(){return top;}}
 public Root mRootWindowContainer=new Root();public Object mService=new Object();public ActivityOptions seen;public ActivityRecord target;public Object chosenTask;
 public boolean fail;public int cancellations;
 public void sendNewTaskResultRequestIfNeeded(){}public Object computeTargetTask(){return null;}
 public int startActivityInner(ActivityRecord t,ActivityRecord s,Object voice,Object interactor,int flags,ActivityOptions options,Object task,Object fragment){return 0;}
 public Object launch(ActivityRecord t,ActivityRecord s,ActivityOptions options,Object task)throws Throwable {
 return AugmentModule.dispatch("startActivityInner",this,new Object[]{t,s,null,null,0,options,task,null},a->{
 target=(ActivityRecord)a[0];seen=(ActivityOptions)a[5];
 AugmentModule.dispatch("sendNewTaskResultRequestIfNeeded",this,new Object[]{},b->{
 if(target.resultTo!=null&&(target.intent.flags&android.content.Intent.FLAG_ACTIVITY_NEW_TASK)!=0){cancellations++;target.resultTo=null;}return null;});
 chosenTask=AugmentModule.dispatch("computeTargetTask",this,new Object[]{},b->s);
 if(fail)throw new IllegalStateException("launch failed");return 7;});}}
""",
"ls/augment/com/hook/TestFreeformLaunch.java": """package ls.augment.com.hook;
 import ls.augment.com.*;import com.android.server.wm.*;import android.app.*;
 public class TestFreeformLaunch {
 static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
 static void config(String key,String value){ConfigSnapshot n=new ConfigSnapshot();n.values.putAll(FeatureSettings.current.values);n.values.put(key,value);FeatureSettings.current=n;}
 static ActivityRecord source(){ActivityRecord r=new ActivityRecord("example.game");r.undefined=false;r.info.applicationInfo.category=0;return r;}
 static ActivityRecord target(){return new ActivityRecord("com.tencent.mm");}
 public static void main(String[] args)throws Throwable{
 check(FreeformLaunchHook.install(new AugmentModule(),TestFreeformLaunch.class.getClassLoader())==3,"hooks installed");
 ActivityStarter starter=new ActivityStarter();ActivityRecord s=source(),t=target();
 starter.launch(t,s,null,null);check(starter.seen==null&&t.intent.flags==0,"disabled leaves options and flags unchanged");
 config("login","1");t=target();t.resultTo=s;ActivityOptions original=ActivityOptions.makeBasic();
 Object result=starter.launch(t,s,original,null);
 check((Integer)result==7&&starter.seen.mode==5,"small-window launch");
 check("_WindowReply".equals(t.intent.identifier),"native RedMagic task marker required to accept mode 5");
 check(starter.seen!=original&&original.mode==0&&starter.seen.animation.equals("original"),"copy and retain options");
 check(t.resultTo==s&&starter.cancellations==0&&starter.chosenTask==null,"new auth task keeps result receiver");
 check(t.intent.extra.equals("auth-token"),"auth payload retained");
 check(!t.isActivityTypeStandard()&&t.isActivityTypeStandardOrUndefined(),"real pre-attachment target type is undefined");
 t=target();t.standard=false;t.undefined=false;starter.launch(t,s,null,null);check(t.intent.flags==0,"special activity type still excluded");
 t=target();t.launchedFromPackage=s.packageName;starter.mRootWindowContainer.top=s;
 starter.launch(t,null,null,null);check(starter.seen.mode==5,"SDK application-context launch attributed to matching foreground caller");
 t=target();t.launchedFromPackage=s.packageName;t.launchedFromUid=10001;starter.launch(t,null,null,null);check(t.intent.flags==0,"caller uid mismatch rejected");
 t=target();t.launchedFromPackage="example.background";starter.launch(t,null,null,null);check(t.intent.flags==0,"unrelated foreground app cannot authorize background caller");
 starter.mRootWindowContainer.top=null;
 ActivityStarter other=new ActivityStarter();other.target=target();other.target.resultTo=s;
 Object plain=AugmentModule.dispatch("computeTargetTask",other,new Object[]{},a->s);check(plain==s,"scoped task override cleaned");
 starter.fail=true;try{starter.launch(target(),s,null,null);throw new AssertionError("failure missing");}catch(IllegalStateException expected){}
 starter.fail=false;plain=AugmentModule.dispatch("computeTargetTask",starter,new Object[]{},a->s);check(plain==s,"failure cleans thread state");
 t=target();starter.launch(t,s,original,new Object());check(t.intent.flags==0&&starter.seen==original,"explicit task honored");
 original.mode=1;t=target();starter.launch(t,s,original,null);check(t.intent.flags==0,"explicit window mode honored");original.mode=0;
 s.visible=false;t=target();starter.launch(t,s,null,null);check(t.intent.flags==0,"background source skipped");s.visible=true;
 s.standard=false;t=target();starter.launch(t,s,null,null);check(t.intent.flags==0,"home source skipped");s.standard=true;
 t=target();t.info.applicationInfo.flags=1;starter.launch(t,s,null,null);check(t.intent.flags==0,"system target skipped");
 t=new ActivityRecord(s.packageName);starter.launch(t,s,null,null);check(t.intent.flags==0,"same-app navigation skipped");
 config("excluded","com.tencent.mm");t=target();starter.launch(t,s,null,null);check(t.intent.flags==0,"exceptions honored");config("excluded","");
 s.info.applicationInfo.category=-1;t=target();starter.launch(t,s,null,null);check(t.intent.flags==0,"non-game login stays native");
 config("games","example.game");t=target();starter.launch(t,s,null,null);check(starter.seen.mode==5,"manual game list");
 config("login","0");config("external","1");t=new ActivityRecord("example.browser");starter.launch(t,s,null,null);check(starter.seen.mode==5,"independent external switch");
 ActivityRecord auth=target(),game=source();starter.launch(game,auth,null,null);check(game.intent.flags==0,"login callback does not window game");
 auth.resultTo=s;t=new ActivityRecord(s.packageName);starter.launch(t,auth,null,null);check(t.intent.flags==0,"result return skipped");
 check(FreeformLaunchPolicy.loginTarget("other.provider","ExampleOAuthActivity"),"other OAuth provider");
 check(!FreeformLaunchPolicy.loginTarget("other.provider","PaymentActivity"),"unrelated screens not login");
 System.out.println("Freeform launch runtime: passed (classification, options, result/task isolation, cleanup)");}}
""",
}

with tempfile.TemporaryDirectory(prefix="ls-freeform-") as tmp:
    work = Path(tmp)
    for name, content in FILES.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
    src = ROOT / "android/app/src/main/java/ls/augment/com"
    production = [src / "AppPackageSet.java", src / "FreeformLaunchPolicy.java", src / "hook/FreeformLaunchHook.java"]
    java_home = os.environ.get("JAVA_HOME")
    javac = str(Path(java_home) / "bin/javac") if java_home else "javac"
    java = str(Path(java_home) / "bin/java") if java_home else "java"
    subprocess.run([javac, "-encoding", "UTF-8", "-d", str(work), *map(str, work.rglob("*.java")), *map(str, production)], check=True)
    subprocess.run([java, "-cp", str(work), "ls.augment.com.hook.TestFreeformLaunch"], check=True)
