"""Exercise the production transition completion hook with a delayed Shell transaction."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
STEP = ROOT / 'android/app/src/main/java/ls/augment/com/step'
source = (STEP / 'NativeWorkspaceGuard.java').read_text(encoding='utf-8')
# The pending Shell transaction can land *after* the final identity transaction.
# It must not carry a workspace scale, including one set while the owner was live.
assert '"buildFinishTransaction"' not in source
callback = source.split('StepHooks.hookMethod(finish,new StepHook(){', 1)[1].split('\n            });', 1)[0]
replay = source[source.index('    static void replay() {'):source.index('    static void resetReturnedTransform(')]
stage = source[source.index('    static void stageMagnification('):source.index('    /** Move the same main/side tasks')]
java = Path(os.environ['JAVA_HOME']) / 'bin' if 'JAVA_HOME' in os.environ else Path()
harness = '''
import java.util.ArrayDeque;
class TestExit {
    static class WorkspaceIme {static int requests;static void request(){requests++;}}
    static class IBinder {}
    static class Queue extends ArrayDeque<Runnable>{void post(Runnable r){add(r);}}
    static class Wm {
        static boolean active=true;
        static Object lock=new Object(),service=new Object(),ownedSpec=new Object();
        static Display display=new Display();
        static Queue handler=new Queue();
    }
    static Object current=Wm.ownedSpec;
    static final Object pending=new Object();
    static class Display {public void reapply(Object tx){check(tx==pending);writes++;}}
    static java.lang.reflect.Method replayPending;
    static int writes;
    static Object field(Object obj,String key){return key.equals("mMagnificationSpec")?current:new Object();}
    static Object call(Object obj,String key,Object...args){
        if(key.equals("getPendingTransaction"))return pending;
        if(key.equals("reapplyMagnificationSpec"))writes++;
        if(key.equals("apply")){check(obj==pending && writes==1);writes=0;scale=75;}
        return null;
    }
    static class MethodHookParam {boolean failed; boolean hasThrowable(){return failed;}}
    static abstract class Hook {protected abstract void afterHookedMethod(MethodHookParam p);}
    static Hook hook=new Hook(){ CALLBACK };
    static IBinder owner=new IBinder();
    static boolean active=true,ending;
    static int transitionReplays,scale=1;
    static class CommitBarrier {}
    static class SavedTask {}
    static void resetReturnedTransform(SavedTask task,Object tx){throw new AssertionError("exit replay must not restore a task");}
    static void trackCommit(Object tx,CommitBarrier group){throw new AssertionError("transition replay has no caller barrier");}
    STAGE
    REPLAY
    static void finish(String msg){throw new AssertionError(msg);}
    static void check(boolean yes){if(!yes)throw new AssertionError();}
    static void queue(){hook.afterHookedMethod(new MethodHookParam());}
    public static void main(String[] args) throws Exception {
        if(args.length>0)replayPending=Display.class.getMethod("reapply",Object.class);
        stageMagnification(pending);check(writes==(args.length>0?1:0));writes=0;
        queue();Wm.handler.remove().run();check(scale==75 && transitionReplays==1);
        queue();scale=1;ending=true;Wm.handler.remove().run();check(scale==1);
        ending=false;queue();active=false;Wm.handler.remove().run();check(scale==1);
        active=true;queue();owner=new IBinder();Wm.handler.remove().run();check(scale==1);
        queue();current=new Object();Wm.handler.remove().run();check(scale==1);
        current=Wm.ownedSpec;queue();Wm.active=false;Wm.handler.remove().run();check(scale==1);
        MethodHookParam failed=new MethodHookParam();failed.failed=true;hook.afterHookedMethod(failed);
        check(Wm.handler.isEmpty() && transitionReplays==1 && WorkspaceIme.requests==1);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='duo-step-exit-') as temp:
    folder = Path(temp)
    test = folder / 'TestExit.java'
    test.write_text(harness.replace('CALLBACK', callback).replace('REPLAY', replay).replace('STAGE',stage), encoding='utf-8')
    subprocess.run([java / 'javac', '-encoding', 'UTF-8', '-d', folder, test], check=True)
    subprocess.run([java / 'java', '-cp', folder, 'TestExit'], check=True)
    subprocess.run([java / 'java', '-cp', folder, 'TestExit','transaction'], check=True)
print('PASS Step transition callback during use, exit, reentry, foreign magnification and failed transition')
