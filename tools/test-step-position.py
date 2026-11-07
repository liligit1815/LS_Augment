"""Run the production position transaction with delayed commits and unchanged task slots."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
STEP = ROOT / 'android/app/src/main/java/ls/augment/com/step'
source = (STEP / 'NativeWorkspaceGuard.java').read_text(encoding='utf-8')
position = source[source.index('    static void position('):source.index('    static void replay()')]
position = position.replace('android.os.SystemClock.uptimeMillis()', '100L')
harness = r'''
package ls.augment.com.step;
import java.util.*;
public class PositionCases {
    static class IBinder {}
    static class ResultReceiver {Bundle result;}
    static class Bundle extends HashMap<String,Object> {
        void putBoolean(String k,boolean v){put(k,v);}
    }
    static class Intent extends Bundle {
        boolean getBooleanExtra(String k,boolean d){return containsKey(k)?(boolean)get(k):d;}
        int[] getIntArrayExtra(String k){return (int[])get(k);}
    }
    static class Logical {int w=1216,h=2688;int width(){return w;}int height(){return h;}}
    static class Context {Context getResources(){return this;}Context getDisplayMetrics(){return this;}float density=3;}
    static class Tx {boolean applied;CommitBarrier barrier;int index;}
    static class Wm {
        static Context context=new Context();static Object lock=new Object(),display=new Object();
        static WorkspaceLayout moved;static Tx tx=new Tx();static boolean foreign;
        static void moveWorkspace(WorkspaceLayout t){if(foreign)throw new IllegalStateException("foreign owner");moved=t;}
    }
    static IBinder owner=new IBinder();static CommitBarrier pendingCommit;static Logical logical=new Logical();
    static boolean active=true,ending,sideLeft,unlocked=true;static SideSlots slots=new SideSlots();
    static Runnable completion,failure;static int replies,checks;
    static Object call(Object o,String name){
        if(name.equals("getPendingTransaction"))return Wm.tx;
        if(name.equals("apply")){((Tx)o).applied=true;return null;}throw new AssertionError(name);
    }
    static void trackCommit(Object o,CommitBarrier g){Tx tx=(Tx)o;tx.barrier=g;tx.index=g.add();}
    static boolean interactive(Context c){return unlocked;}
    static Bundle base(){Bundle b=new Bundle();b.put("slots",slots.snapshot());return b;}
    static void respond(ResultReceiver r,int code,Bundle b,String message){check(code==0,"success code");r.result=b;replies++;}
    static void finish(String reason){ending=true;}
    static void awaitCommit(CommitBarrier group,IBinder expected,long deadline,Runnable done,Runnable failed){
        check(group==pendingCommit && expected==owner,"commit ownership");completion=done;failure=failed;
        check(!group.ready(),"do not release input before native commit");
    }
    POSITION
    static void check(boolean yes,String why){checks++;if(!yes)throw new AssertionError(why);}
    static Intent request(boolean left){Intent i=new Intent();i.put("fromLeft",sideLeft);i.put("leftSide",left);i.put("slots",slots.snapshot());return i;}
    static void reset(){slots=new SideSlots();active=true;ending=false;sideLeft=false;unlocked=true;Wm.foreign=false;Wm.moved=null;Wm.tx=new Tx();replies=0;completion=failure=null;}
    static void refuse(Intent request,String why)throws Exception{
        boolean refused=false;try{position(request,new ResultReceiver());}catch(IllegalStateException expected){refused=true;}
        check(refused && Wm.moved==null && replies==0,why);
    }
    public static void main(String[] args)throws Exception{
        for(int count:new int[]{0,1,3,5})for(int[] screen:new int[][]{{1216,2688},{2688,1216}}){
            reset();logical.w=screen[0];logical.h=screen[1];
            for(int n=0;n<count;n++)slots.replace(n,-1,100+n);
            int[] before=slots.snapshot();
            for(boolean left:new boolean[]{true,false}){
                Wm.tx=new Tx();replies=0;ResultReceiver reply=new ResultReceiver();position(request(left),reply);
                check(Wm.tx.applied && replies==0,"asynchronous native commit");
                check(sideLeft==left && Wm.moved.sideX==(left?0:logical.w-Wm.moved.sideWidth),"physical side target");
                check((Wm.moved.mainX>Wm.moved.sideX)==left,"main opposite side");
                Wm.tx.barrier.commit(Wm.tx.index);check(Wm.tx.barrier.ready(),"native acknowledgement");completion.run();
                check(replies==1 && (boolean)reply.result.get("left")==left && (boolean)reply.result.get("committed"),"confirmed direction");
                check(Arrays.equals(before,slots.snapshot()) && Arrays.equals(before,(int[])reply.result.get("slots")),"tasks and ordering unchanged");
            }
        }
        reset();Intent stale=request(true);slots.replace(0,-1,55);refuse(stale,"stale slot snapshot");
        reset();stale=request(true);sideLeft=true;refuse(stale,"stale physical direction");
        reset();unlocked=false;refuse(request(true),"lockscreen");
        reset();Wm.foreign=true;refuse(request(true),"foreign magnification lease");
        reset();position(request(true),new ResultReceiver());failure.run();check(ending && replies==0,"unconfirmed commit enters recovery");
        reset();position(request(true),new ResultReceiver());ending=true;completion.run();check(replies==0,"closing does not acknowledge movement");
        System.out.println("PASS "+checks+" workspace position checks: both sides, empty/1/3/5 slots, portrait/landscape, native commit, stale state and recovery");
    }
}
'''.replace('POSITION', position)
java = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='step-position-') as temp:
    folder = Path(temp)
    path = folder / 'PositionCases.java'
    path.write_text(harness, encoding='utf-8')
    subprocess.run([java/'javac', '-encoding', 'UTF-8', '-d', folder, path,
                    *[STEP/(name+'.java') for name in ['WorkspaceLayout','SideSlots','CommitBarrier']]], check=True)
    subprocess.run([java/'java', '-cp', folder, 'ls.augment.com.step.PositionCases'], check=True)
