"""Actual half-sheet target fence must reject replaced tasks, users and changed workspace roles."""
from pathlib import Path
import os,subprocess,tempfile
r=Path(__file__).resolve().parents[1]
s=(r/'android/app/src/main/java/ls/augment/com/step/WorkspaceRecentSheet.java').read_text(encoding='utf-8')
a=s.index('    boolean validTarget()');b=s.index('    void load()',a)
method=s[a:b].replace('ActivityManager.RunningTaskInfo','Task').replace('LiveWorkspace.number','number')
a=s.index('    static boolean physical(');b=s.index('\n    final WorkspaceQuickBar',a)
panel=s[a:b]
a=s.index('            ActivityOptions options=');b=s.index('            ctx.startActivity(send,options.toBundle())',a)
delivery=s[a:b].replace('ActivityOptions.class','capability')+'\nreturn options;'
bridge=(r/'android/app/src/main/java/ls/augment/com/step/OwnershipBridge.java').read_text(encoding='utf-8')
a=bridge.index('    public static Method method(');b=bridge.index('    public static Object field(',a)
lookup=bridge[a:b]
code=r'''
import java.lang.reflect.Method;
public class RecentTarget {
 static final String TITLE="RedMagicDuoRecentSelection";
 PANEL
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static class Component {String pkg="receiver";String getPackageName(){return pkg;}}
 static class Task {int taskId=10,user;Object token=new Object();Component topActivity=new Component();}
 static class Slots {int side=-1;int index(int id){return id==side?0:-1;}}
 static class Host {Task live,focus;Slots slots=new Slots();int upperId=-1;boolean holdsUpper(int id){return upperId>=0&&upperId==id;}Task info(int id){return live;}Task focused(){return focus;}}
 static class Owner {Host host=new Host();boolean closed,current=true;int userId;boolean currentUser(){return current;}}
 static class OwnershipBridge {LOOKUP}
 static class OptionsBase {int taskId=-1;public void setLaunchTaskId(int id){taskId=id;}}
 static class ActivityOptions extends OptionsBase {static ActivityOptions makeBasic(){return new ActivityOptions();}}
 static class MissingOptions {}
 static class StaticOptions {public static void setLaunchTaskId(int id){}}
 static class WrongReturnOptions {public boolean setLaunchTaskId(int id){return true;}}
 Owner owner=new Owner();Task target=new Task();Object targetToken=target.token,ctx=new Object();String targetPackage="receiver";boolean closed,unlocked=true;
 static int number(Task t,String key){return t.user;}static Object field(Task t,String key){return t.token;}boolean interactive(Object c){return unlocked;}
 METHOD
 ActivityOptions deliveryOptions(Class<?> capability){DELIVERY}
 RecentTarget(){owner.host.live=target;owner.host.focus=target;}
 public static void main(String[] args){
  RecentTarget t=new RecentTarget();check(t.validTarget(),"original main receives selected content");
  t.target.taskId=2079;check(t.deliveryOptions(ActivityOptions.class).taskId==2079,"share targets exact main task even when same-package side/upper task exists");t.target.taskId=10;
  for(Class<?> missing:new Class<?>[]{MissingOptions.class,StaticOptions.class,WrongReturnOptions.class}){
   try{t.deliveryOptions(missing);throw new AssertionError("unknown task-target API accepted");}catch(IllegalStateException expected){checks++;}
  }
  check(physical(2017,TITLE,10343,10343),"trusted half-sheet keeps physical input and drawing coordinates");
  check(!physical(2017,TITLE,10020,10343),"other apps cannot opt out of workspace scaling");
  check(!physical(2038,TITLE,10343,10343),"unknown window type stays native");
  check(!physical(2017,null,10343,10343) && !physical(2017,"other",10343,10343),"only exact owned title excluded");
  check(!physical(2017,TITLE,-1,-1),"unknown owner identity cannot match");
  for(int cause=0;cause<13;cause++){
   t=new RecentTarget();switch(cause){
    case 0:t.closed=true;break;case 1:t.owner.closed=true;break;case 2:t.owner.current=false;break;case 3:t.unlocked=false;break;
    case 4:t.owner.host.live=null;break;case 5:t.target.token=new Object();break;case 6:t.target.user=10;break;
    case 7:t.target.topActivity=null;break;case 8:t.target.topActivity.pkg="other-app";break;case 9:t.owner.host.slots.side=10;break;
    case 10:t.owner.host.upperId=10;break;case 11:t.owner.host.focus=null;break;
    case 12:t.owner.host.focus=new Task();t.owner.host.focus.taskId=11;break;
   }
   check(!t.validTarget(),"reject stale target cause="+cause);
  }
  System.out.println("PASS "+checks+" half-sheet target, privacy and role checks");
 }
}
'''.replace('METHOD',method).replace('PANEL',panel).replace('LOOKUP',lookup).replace('DELIVERY',delivery)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-recent-') as directory:
 p=Path(directory);f=p/'RecentTarget.java';f.write_text(code,encoding='utf-8');subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f],check=True);subprocess.run([java/'java','-cp',p,'RecentTarget'],check=True)
