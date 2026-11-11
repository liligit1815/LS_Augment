"""Exercise production app listing, both admission gates and quick-app promotion."""
import os, re, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
def method(file,signature):
    text=(STEP/file).read_text(encoding='utf-8');start=text.index(signature);a=text.index('{',start);b=a+1;n=1
    while n:n+=(text[b]=='{')-(text[b]=='}');b+=1
    return text[start:b]
def condition(file,start):
    text=(STEP/file).read_text(encoding='utf-8');a=text.index(start)+len('if (');b=a;n=1
    while n:n+=(text[b]=='(')-(text[b]==')');b+=1
    return text[a:b-1]
harness=r'''
package ls.augment.com.step;
import java.util.*;
public class AdmissionCases {
 static int checks;static final String PACKAGE="ls.augment.com";
 static void check(boolean yes,String why){checks++;if(!yes)throw new AssertionError(why);}
 static class ComponentName {String pkg;ComponentName(String p){pkg=p;}String getPackageName(){return pkg;}String flattenToString(){return pkg+"/.Main";}}
 static class Task {public int type=1,mode=1,mForceHiddenFlags;public boolean isFocused=true,isResizeable=true,always,translucent,focusable=true;public ComponentName topActivity=new ComponentName(PACKAGE),baseActivity=topActivity;public int taskId=7,userId;public Object token=new Object();}
 static class ActivityManager {static class RunningTaskInfo extends Task{}}
 static Object field(Object o,String name){try{return o.getClass().getField(name).get(o);}catch(Exception e){throw new RuntimeException(e);}}
 static Object call(Object o,String name){Task t=(Task)o;switch(name){case "getActivityType":return t.type;case "getWindowingMode":return t.mode;case "isAlwaysOnTop":return t.always;case "isForceTranslucent":return t.translucent;case "isFocusable":return t.focusable;default:throw new AssertionError(name);}}
 static boolean flag(Object o,String name){return (Boolean)field(o,name);}
 static class StepMembers {static boolean getBooleanField(Object o,String n){return flag(o,n);}static int getIntField(Object o,String n){return (Integer)field(o,n);}}
 static class WorkspaceMainFocus {static boolean current=true;static boolean matches(Object t){return current;}}
 static class WorkspaceResize {static boolean available;}
 static boolean shellAccept(ActivityManager.RunningTaskInfo target,boolean forceResize){if(SHELL_GATE)return false;return true;}
 static boolean serverAccept(ActivityManager.RunningTaskInfo info,Task task,int from){if(SERVER_GATE)return false;return true;}
 static class UserHandle {int id;UserHandle(int i){id=i;}public boolean equals(Object other){return other instanceof UserHandle && ((UserHandle)other).id==id;}public int hashCode(){return id;}}
 static class UserManager {List<UserHandle> profiles=new ArrayList<>();List<UserHandle> getUserProfiles(){return profiles;}long getSerialNumberForUser(UserHandle u){return u.id;}}
 static class LauncherActivityInfo {ComponentName component;UserHandle user;LauncherActivityInfo(String p,UserHandle u){component=new ComponentName(p);user=u;}ComponentName getComponentName(){return component;}UserHandle getUser(){return user;}CharSequence getLabel(){return component.pkg;}}
 static class LauncherApps {Map<Integer,List<LauncherActivityInfo>> entries=new HashMap<>();List<LauncherActivityInfo> getActivityList(Object p,UserHandle u){return entries.getOrDefault(u.id,Collections.emptyList());}}
 static class UsageStats {long getTotalTimeInForeground(){return 0;}long getLastTimeUsed(){return 0;}}
 static class UsageStatsManager {Map<String,UsageStats> queryAndAggregateUsageStats(long a,long b){return Collections.emptyMap();}}
 static class Context {UserManager users=new UserManager();LauncherApps launcher=new LauncherApps();<T>T getSystemService(Class<T> type){return type.cast(type==LauncherApps.class?launcher:type==UserManager.class?users:new UsageStatsManager());}}
 static class WorkspaceUsers {static int id(UserHandle u){return u.id;}static boolean allows(Context c,int principal,int user){return principal==user || user==999;}}
 static class StepRuntime {static final String PACKAGE=AdmissionCases.PACKAGE;}
 static class QuickCatalog {APP_CLASS LOAD}
 static class LiveWorkspace {ActivityManager.RunningTaskInfo task=new ActivityManager.RunningTaskInfo(),main=new ActivityManager.RunningTaskInfo();Slots slots=new Slots();int changed,returned,upperId=-1,upperReleased;ActivityManager.RunningTaskInfo info(int id){return id==task.taskId?task:null;}ActivityManager.RunningTaskInfo focused(){return main;}void change(int slot){changed++;}void upperActionFor(int id,String action,Runnable done){check(action.equals("release"),"top launch uses existing restoration");upperReleased++;}void returnSide(int slot,boolean remove){returned++;}static int number(Object o,String n){return (Integer)field(o,n);}}
 static class WorkspaceRoutes {static final int UPPER=5;static int taskAt(LiveWorkspace host,int slot){return slot==UPPER?host.upperId:host.slots.task(slot);}}
 static class Slots {int value=7;int task(int slot){return value;}}
 static class Bar {LiveWorkspace host=new LiveWorkspace();Context ctx=new Context();int userId;static boolean belongs(ComponentName c,String p){return c!=null && c.pkg.equals(p);}MATCH_CLASS PROMOTE}
 static void rejected(ActivityManager.RunningTaskInfo t,boolean capability,String why){WorkspaceResize.available=capability;check(!shellAccept(t,capability),why+" shell");check(!serverAccept(t,t,-1),why+" server");}
 public static void main(String[] args){
  for(String pkg:new String[]{PACKAGE,"ordinary.app"})for(boolean capable:new boolean[]{false,true}){
   ActivityManager.RunningTaskInfo t=new ActivityManager.RunningTaskInfo();t.topActivity=new ComponentName(pkg);WorkspaceResize.available=capable;
   check(shellAccept(t,capable),"ordinary task including Duo admitted by shell");check(serverAccept(t,t,-1),"same native admission");
   t.type=2;rejected(t,capable,"HOME not collected");t.type=1;t.mode=5;rejected(t,capable,"floating task not collected");t.mode=1;t.topActivity=null;rejected(t,capable,"missing activity rejected");
  }
  ActivityManager.RunningTaskInfo t=new ActivityManager.RunningTaskInfo();t.isResizeable=false;rejected(t,false,"missing resize capability");WorkspaceResize.available=true;check(shellAccept(t,true)&&serverAccept(t,t,-1),"verified force-resize preserved");
  t.isFocused=false;check(serverAccept(t,t,-1),"stale focused bit does not override live main");WorkspaceMainFocus.current=false;check(!serverAccept(t,t,-1),"non-main task rejected");check(serverAccept(t,t,0),"verified retained route remains possible");WorkspaceMainFocus.current=true;t.isFocused=true;t.always=true;check(!serverAccept(t,t,-1),"always-on-top rejected");t.always=false;t.translucent=true;check(!serverAccept(t,t,-1),"translucent rejected");t.translucent=false;t.focusable=false;check(!serverAccept(t,t,-1),"nonfocusable rejected");t.focusable=true;t.mForceHiddenFlags=1;check(!serverAccept(t,t,-1),"force-hidden rejected");
  Context c=new Context();UserHandle owner=new UserHandle(0),clone=new UserHandle(999),locked=new UserHandle(10);c.users.profiles=Arrays.asList(owner,clone,locked);
  c.launcher.entries.put(0,Arrays.asList(new LauncherActivityInfo(PACKAGE,owner),new LauncherActivityInfo("ordinary.app",owner),new LauncherActivityInfo(PACKAGE,owner),new LauncherActivityInfo("wrong.user",locked)));
  c.launcher.entries.put(999,Arrays.asList(new LauncherActivityInfo("clone.app",clone)));c.launcher.entries.put(10,Arrays.asList(new LauncherActivityInfo("locked.app",locked)));
  List<QuickCatalog.App> apps=QuickCatalog.load(c,owner,false);check(apps.size()==3,"Duo plus ordinary and allowed clone; duplicates/foreign/locked filtered");check(apps.stream().anyMatch(a->a.component.pkg.equals(PACKAGE)),"Duo visible in picker");check(apps.stream().anyMatch(a->a.key.endsWith("@serial-999")),"clone identity retained");
  Bar bar=new Bar();Bar.Match match=new Bar.Match(0,bar.host.task);bar.promote(match);check(bar.host.changed==1 && bar.host.returned==0,"Duo main exchanges with side instead of dropping out");
  bar.host.task.token=new Object();try{bar.promote(match);throw new AssertionError("stale token");}catch(IllegalStateException expected){checks++;}
  bar.host.task.token=match.token;bar.host.task.userId=10;try{bar.promote(match);throw new AssertionError("changed user");}catch(IllegalStateException expected){checks++;}
  bar.host.task.userId=0;bar.host.slots.value=9;try{bar.promote(match);throw new AssertionError("changed slot");}catch(IllegalStateException expected){checks++;}
  bar.host.upperId=7;match=new Bar.Match(WorkspaceRoutes.UPPER,bar.host.task);bar.promote(match);check(bar.host.upperReleased==1 && bar.host.changed==1,"top app returns to main through native top restoration");
  bar.host.upperId=8;try{bar.promote(match);throw new AssertionError("replaced top role");}catch(IllegalStateException expected){checks++;}
  bar.host.upperId=7;bar.host.task.token=new Object();try{bar.promote(match);throw new AssertionError("replaced top token");}catch(IllegalStateException expected){checks++;}
  System.out.println("PASS "+checks+" production Step app admission checks: Duo, catalog, clone, native guards, promotion and stale identities");
 }
}
'''
harness=harness.replace('SHELL_GATE',condition('LiveWorkspace.java','if (target == null')).replace('SERVER_GATE',condition('NativeWorkspaceGuard.java','if ((Integer) call(info, "getActivityType")'))
harness=harness.replace('APP_CLASS',method('QuickCatalog.java','static final class App')).replace('LOAD',method('QuickCatalog.java','static List<App> load(').replace('android.os.UserManager','UserManager'))
harness=harness.replace('MATCH_CLASS',method('WorkspaceQuickBar.java','static final class Match')).replace('PROMOTE',method('WorkspaceQuickBar.java','void promote('))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-admission-') as temp:
    folder=Path(temp);source=folder/'AdmissionCases.java';source.write_text(harness,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,source],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.AdmissionCases'],check=True)
