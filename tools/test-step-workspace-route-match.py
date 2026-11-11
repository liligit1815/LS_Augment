"""Verify exact top/side route selection, ambiguity, user and token boundaries."""
from pathlib import Path
import os,subprocess,tempfile
root=Path(__file__).resolve().parents[1]
source=(root/'android/app/src/main/java/ls/augment/com/step/WorkspaceRoutes.java').read_text(encoding='utf-8')
def method(signature):
 a=source.index(signature);b=source.index('{',a)+1;depth=1
 while depth:depth+=(source[b]=='{')-(source[b]=='}');b+=1
 return source[a:b]
code=r'''
import java.util.*;
class RouteMatch {
 static final int UPPER=5,NAVIGATION=6;
 static class Component {String pkg;Component(String p){pkg=p;}String getPackageName(){return pkg;}}
 static class ActivityManager {static class RunningTaskInfo {int taskId,userId,displayId,mode=6;Object token=new Object();Component baseActivity=new Component("map");RunningTaskInfo(int id){taskId=id;}}}
 static class Slots {int[] ids={-1,-1,-1,-1,-1};int task(int n){return ids[n];}}
 static class LiveWorkspace {int visibleSlots=3,upperAppId=-1,upperNavigationId=-1;Slots slots=new Slots();Map<Integer,ActivityManager.RunningTaskInfo> tasks=new HashMap<>();ActivityManager.RunningTaskInfo info(int id){return tasks.get(id);}static int number(ActivityManager.RunningTaskInfo t,String n){return n.equals("userId")?t.userId:t.displayId;}}
 static Object call(ActivityManager.RunningTaskInfo t,String n){return t.mode;}static Object field(ActivityManager.RunningTaskInfo t,String n){return t.token;}
 TASK_AT
 MATCH
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 public static void main(String[] args){
  LiveWorkspace h=new LiveWorkspace();ActivityManager.RunningTaskInfo top=new ActivityManager.RunningTaskInfo(42),side=new ActivityManager.RunningTaskInfo(43);
  h.tasks.put(42,top);h.tasks.put(43,side);h.upperAppId=42;
  check(match(h,"map",0,-1,null)==UPPER,"top route selected");check(match(h,"map",0,42,top.token)==UPPER,"exact top token selected");
  check(match(h,"other",0,-1,null)<0,"foreign package");check(match(h,"map",10,-1,null)<0,"foreign profile");
  check(match(h,"map",0,43,null)<0,"different task id");check(match(h,"map",0,42,new Object())<0,"replaced token");
  top.mode=1;check(match(h,"map",0,-1,null)<0,"already main not selected");top.mode=6;
  top.displayId=1;check(match(h,"map",0,-1,null)<0,"other display");top.displayId=0;
  top.baseActivity=null;check(match(h,"map",0,-1,null)<0,"missing activity");top.baseActivity=new Component("map");
  h.slots.ids[0]=43;check(match(h,"map",0,-1,null)<0,"same package in top and side requires explicit selection");
  check(match(h,"map",0,42,top.token)==UPPER,"explicit top disambiguates");check(match(h,"map",0,43,side.token)==0,"explicit side disambiguates");
  side.userId=999;check(match(h,"map",0,-1,null)==UPPER,"clone does not hide owner top");check(match(h,"map",999,-1,null)==0,"clone selects its own side");side.userId=0;
  h.upperAppId=-1;h.upperNavigationId=-1;check(match(h,"map",0,-1,null)==0,"existing side path unchanged");h.slots.ids[0]=-1;
  h.slots.ids[4]=43;check(match(h,"map",0,-1,null)<0,"inactive side index ignored");h.visibleSlots=5;check(match(h,"map",0,-1,null)==4,"fifth side supported");
  h.upperAppId=42;h.tasks.remove(42);check(match(h,"map",0,-1,null)==4,"vanished upper ignored");
  h.slots.ids[4]=-1;h.tasks.put(42,top);h.upperAppId=-1;h.upperNavigationId=42;
  check(match(h,"map",0,42,top.token)==NAVIGATION,"hidden navigation uses exact original role");
  h.upperAppId=43;check(match(h,"map",0,-1,null)<0,"two held pages with same package require identity");
  check(match(h,"map",0,42,new Object())<0,"navigation rejects replaced token");
  System.out.println("PASS "+checks+" top and side route identity checks");
 }
}
'''.replace('TASK_AT',method('    static int taskAt(')).replace('MATCH',method('    static int match('))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-route-match-') as directory:
 p=Path(directory);f=p/'RouteMatch.java';f.write_text(code,encoding='utf-8')
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f],check=True)
 subprocess.run([java/'java','-cp',p,'RouteMatch'],check=True)
