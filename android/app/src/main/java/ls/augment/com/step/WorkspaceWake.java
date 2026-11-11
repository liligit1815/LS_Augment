package ls.augment.com.step;

import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import static ls.augment.com.step.StepRuntime.*;

/** Resume only a workspace that this SystemUI process saw go to sleep. */
final class WorkspaceWake {
    static LiveWorkspace asleep;
    static int generation;
    static boolean reading;
    static long deadline;
    static void renewalSuspended(LiveWorkspace host){
        remember(host);
        host.close("息屏暂挂");
    }
    static void remember(LiveWorkspace host){
        if(host==null || !host.ready || host.closed || !host.renewable || !enabled
                || host.closing && !"息屏暂挂".equals(host.exitReason))return;
        if(asleep!=host){asleep=host;generation++;reading=false;}
    }
    static void cancel(){asleep=null;generation++;reading=false;}
    static void awaken(){
        if(asleep==null)return;
        deadline=SystemClock.uptimeMillis()+30000;
        attempt(generation);
    }
    static void attempt(int expected){
        LiveWorkspace previous=asleep;
        if(expected!=generation || previous==null || reading)return;
        if(!enabled || !android.os.Process.myUserHandle().equals(previous.quickUser)
                || !Shell.context.getSystemService(android.os.UserManager.class).isUserForeground()) {cancel();return;}
        // Never create a Step window over the keyguard. SCREEN_ON can precede
        // authentication; USER_PRESENT retries after the real unlock.
        if(!interactive(Shell.context))return;
        if(LiveWorkspace.current!=previous){cancel();return;}
        if(!previous.closed || LiveWorkspace.running()){
            if(SystemClock.uptimeMillis()<deadline)Shell.main.postDelayed(()->attempt(expected),100);
            return;
        }
        reading=true;
        new Thread(()->{
            Bundle settings=null;
            try{settings=Shell.context.getContentResolver().call(WorkspacePrefsProvider.URI,"read",null,null);}
            catch(RuntimeException error){diagnostic("WAKE","settings_unavailable;reason="+error);}
            final Bundle snapshot=settings;
            Shell.main.post(()->{
                if(expected!=generation || asleep!=previous)return;
                reading=false;
                if(!interactive(Shell.context))return;
                if(snapshot==null){if(SystemClock.uptimeMillis()<deadline)Shell.main.postDelayed(()->attempt(expected),300);return;}
                if(!snapshot.getBoolean("enabled") || !previous.quickUser.equals(snapshot.getParcelable("quickUser"))){cancel();return;}
                cancel();
                if(LiveWorkspace.current==previous && previous.closed && !LiveWorkspace.running()){
                    diagnostic("WAKE","resume_after_unlock;previous="+previous.session);
                    LiveWorkspace.open(previous.reportTo,new Intent().putExtras(snapshot)
                            .putExtra("normalEntry",true).putExtra("leftSide",previous.leftSide));
                }
            });
        },"StepWakeSettings").start();
    }
}
