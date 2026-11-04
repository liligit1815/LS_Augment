package ls.augment.com.step;

import android.app.ActivityManager;
import android.os.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** WindowReply performs the actual handoff, including choosing whether the app is eligible. */
final class EdgeHandoff {
    static Method enter, hanging, normal;
    static int left,right,confirmed;
    static boolean pending;
    static int position(Class<?> c,String name)throws ReflectiveOperationException{
        Field f=c.getField(name);
        if(f.getType()!=int.class || !Modifier.isStatic(f.getModifiers()) || !Modifier.isFinal(f.getModifiers()))throw new NoSuchFieldException(name);
        return f.getInt(null);
    }
    static void install(ClassLoader cl){
        try{
            Class<?> constants=Class.forName("android.app.WindowReplyUtils",false,cl);
            left=position(constants,"WINDOW_REPLY_START_HANG_LEFT_BOTTOM");right=position(constants,"WINDOW_REPLY_START_HANG_RIGHT_BOTTOM");
            Method cap=LocalLandscape.exact(ActivityManager.class,"isTaskHangFreeformWrForMulti",boolean.class,int.class);
            normal=LocalLandscape.exact(ActivityManager.class,"isTaskNormalFreeformWrForMulti",boolean.class,int.class);
            Method start=LocalLandscape.exact(ActivityManager.class,"toggleSwitchFromFullScreenToFreeformWr",boolean.class,int.class,int.class);
            if(left==right)throw new IllegalStateException("贴边位置无区分");
            hanging=cap;enter=start;
        }catch(Throwable e){report(null,0,"原厂小窗贴边入口不可用："+e,-1);}
    }
    static void request(Object task,int id,Object token,ResultReceiver reply)throws Exception{
        if(enter==null || pending)throw new IllegalStateException("当前无法发起原厂小窗交接");
        ActivityManager manager=Wm.context.getSystemService(ActivityManager.class);
        LocalLandscape.releaseTask(task);
        if(!Boolean.TRUE.equals(enter.invoke(manager,id,sideLeft?right:left)))throw new IllegalStateException("原厂拒绝此应用进入贴边小窗");
        pending=true;
        IBinder expected=owner;long deadline=SystemClock.uptimeMillis()+3200;
        Wm.handler.post(new Runnable(){public void run(){
            if(expected!=owner || !active || ending)return;
            boolean ok=false, retry=false;
            synchronized(Wm.lock){
                try{
                    boolean same=liveTask(id,token)==task && WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId"));
                    ok=same && Boolean.TRUE.equals(hanging.invoke(manager,id));
                    retry=same && !ok && SystemClock.uptimeMillis()<deadline;
                    if(ok){confirmed++;replay();}
                }catch(Throwable e){report(null,0,"原厂小窗状态查询失败："+e,id);}
            }
            if(retry){Wm.handler.postDelayed(this,80);return;}
            if(ok)watchExpanded(expected,manager,id,token,task);
            pending=false;Bundle b=base();b.putBoolean("confirmed",ok);respond(reply,0,b,ok?"原任务已交给原厂贴边小窗 task="+id:"原厂未确认此任务贴边");
        }});
    }
    // A hung icon occupies the free side of the main pane. The expanded native title
    // bar can overlap the Step/status windows. Park the scene before handing it input.
    static void watchExpanded(IBinder expected,ActivityManager manager,int id,Object token,Object task){
        Wm.handler.postDelayed(new Runnable(){public void run(){
            synchronized(Wm.lock){
                if(!active || ending || expected!=owner)return;
                try{
                    if(liveTask(id,token)!=task || !WorkspaceUsers.allows(Wm.context,principal,(Integer)field(task,"mUserId"))
                            || (Integer)call(task,"getWindowingMode")!=5)return;
                    if(Boolean.TRUE.equals(normal.invoke(manager,id)) && !Boolean.TRUE.equals(hanging.invoke(manager,id))){
                        if(flip==null && pendingCommit==null && WorkspaceZoom.motion==null){
                            report(null,0,"原厂小窗已展开，暂存工作区 task="+id,id);
                            NativeWorkspaceGuard.finish("工作区暂挂");return;
                        }
                    }
                }catch(Throwable unavailable){report(null,0,"原厂展开状态不可核验："+unavailable,id);return;}
            }
            Wm.handler.postDelayed(this,240);
        }},240);
    }
}
