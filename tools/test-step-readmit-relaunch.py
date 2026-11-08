"""Run production readmission with activity relaunch, disappearance and stale callbacks."""
import os, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'WorkspaceReadmit.java').read_text(encoding='utf8')
def method(signature):
    start=source.index(signature);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
harness=r'''
package ls.augment.com.step;
import java.util.*;
import java.lang.reflect.Method;
public class ReadmitCases {
    static int checks,completed,skipped,failures,restores,replays,drawn;
    static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
    static class IBinder {}
    static class SystemClock {static long now;static long uptimeMillis(){return now;}}
    static class Handler {ArrayDeque<Runnable> queue=new ArrayDeque<>();void postDelayed(Runnable r,long delay){queue.add(r);}void one(){queue.remove().run();}}
    static class Wm {static Object lock=new Object(),context=new Object(),display=new Object();static Handler handler=new Handler();}
    enum State { PAUSED, RESUMED }
    public static class Activity {State state=State.RESUMED;public State getState(){return state;}}
    static Method activityState;
    static class Task {boolean attached=true,frame=true;Activity activity=new Activity();Object window=new Object();}
    static class SavedTask {int id=42;Object token=new Object();Task task=new Task();boolean dirty=true;}
    static class TaskIdentity {int id=7,user;Object token=new Object();}
    static class CommitBarrier {void seal(){}}
    static class WorkspaceUsers {static boolean allows(Object c,int p,int u){return u==0;}}
    static class Bookmarks {int consumed;void consumed(int slot){consumed++;}}
    static IBinder owner;static boolean active=true,ending;static int principal;
    static SavedTask pending,record;static Object live;static Task main;
    static CommitBarrier pendingCommit;static Runnable commit;
    static SideSlots slots;static Map<Integer,SavedTask> saved;static Bookmarks readmitting;
    static Object liveTask(int id,Object token){return id==42?live:main;}
    static boolean runningActivity(Object task){return task instanceof Task t && t.attached;}
    static boolean ownsTask(Object task){return task==record.task;}
    static void report(Object sink,int code,String msg,int task){}
    static void diagnostic(String stage,String detail){}
    static boolean focused=true;
    static Object field(Object target,String name){return focused?record.task.window:null;}
    static void finish(String reason){failures++;}
    static void replay(){replays++;}
    static Object transaction(){return new Object();}
    static void apply(Object tx){}
    static void trackCommit(Object tx,CommitBarrier group){}
    static void awaitCommit(CommitBarrier group,IBinder expected,long deadline,Runnable done,Runnable fail){
        commit=()->{if(owner==expected && active && !ending && pendingCommit==group){pendingCommit=null;done.run();}};
    }
    static void restore(Object tx,SavedTask r,CommitBarrier group){if(live!=r.task){r.dirty=false;return;}restores++;}
    static void verifyRestored(SavedTask r){check(live==r.task,"no verification against replacement task");}
    static Object call(Object o,String name,Object... args){
        if(o instanceof Task t){if(name.equals("topRunningActivity"))return t.activity;if(name.equals("getWindowingMode"))return 1;}
        if(o==record.task.activity){if(name.equals("findMainWindow"))return record.task.window;if(name.equals("isReportedDrawn"))return record.task.frame;}
        if(o==record.task.window && name.equals("isDrawn"))return record.task.frame;
        return new Object();
    }
    METHODS
    static void fresh(){
        try{activityState=Activity.class.getMethod("getState");}catch(Exception error){throw new AssertionError(error);}
        owner=new IBinder();active=true;ending=false;SystemClock.now=0;Wm.handler=new Handler();
        focused=true;
        completed=skipped=failures=restores=replays=drawn=0;commit=null;pendingCommit=null;
        record=new SavedTask();pending=record;live=record.task;main=new Task();slots=new SideSlots();slots.replace(0,-1,42);
        saved=new HashMap<>();saved.put(42,record);readmitting=new Bookmarks();
    }
    static void begin(){settle(record,owner,new TaskIdentity(),0,()->completed++,()->skipped++);}
    public static void main(String[] args)throws Exception{
        fresh();record.task.attached=false;begin();check(failures==0 && restores==0 && Wm.handler.queue.size()==1,"relaunch waits without exiting");
        record.task.attached=true;SystemClock.now=550;Wm.handler.one();check(completed==0 && commit!=null,"drawn task waits for surface commit");commit.run();
        check(completed==1 && skipped==0 && failures==0 && slots.task(0)==42 && pending==null,"same task readmitted after attachment");
        fresh();record.task.attached=false;begin();SystemClock.now=1501;Wm.handler.one();
        check(restores==1 && skipped==0 && failures==0,"timeout returns only this task and waits for acknowledgement");commit.run();
        check(skipped==1 && completed==0 && slots.task(0)==-1 && readmitting.consumed==1 && !record.dirty && pending==null,"single rollback frees admission and continues");
        fresh();record.task.frame=false;begin();SystemClock.now=1501;Wm.handler.one();commit.run();
        check(skipped==1 && drawn==0 && failures==0,"no first frame is never reported as successful admission");
        fresh();live=null;begin();commit.run();check(skipped==1 && restores==0 && failures==0,"gone task does not close workspace or write another task");
        fresh();live=new Task();begin();commit.run();check(skipped==1 && restores==0,"reused task id never restores replacement");
        fresh();record.task.attached=false;begin();owner=new IBinder();SystemClock.now=1501;Wm.handler.one();
        check(restores==0 && skipped==0 && completed==0 && failures==0,"old callback cannot act on a new session");
        fresh();begin();SystemClock.now=550;Wm.handler.one();ending=true;commit.run();check(completed==0,"exit suppresses late success");
        fresh();record.task.activity.state=State.PAUSED;begin();SystemClock.now=600;Wm.handler.one();
        check(commit==null && completed==0,"old decor frame cannot complete a paused game's recovery");
        record.task.activity.state=State.RESUMED;SystemClock.now=700;Wm.handler.one();commit.run();
        check(completed==1 && failures==0,"native resume precedes releasing focus lease");
        fresh();focused=false;begin();SystemClock.now=600;Wm.handler.one();check(commit==null,"resumed decor without window focus is not a game frame");
        focused=true;SystemClock.now=700;Wm.handler.one();commit.run();check(completed==1,"native window focus delivered before settling");
        fresh();check(allowsFocus(record,record.task),"exact pending task gets temporary focus");
        check(!allowsFocus(new SavedTask(),record.task) && !allowsFocus(record,new Task()),"other or replaced task cannot steal focus");
        pending=null;check(!allowsFocus(record,record.task),"settled side is excluded from focus again");
        System.out.println("PASS "+checks+" production readmission lifecycle checks");
    }
}
'''.replace('METHODS',method('static void settle(')+'\n'+method('static void skip(')+'\n'+method('static boolean allowsFocus('))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-readmit-') as tmp:
    folder=Path(tmp);test=folder/'ReadmitCases.java';test.write_text(harness,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test,STEP/'SideSlots.java'],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.ReadmitCases'],check=True)
