package ls.augment.com.step;

import android.app.ActivityManager;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.IBinder;
import android.os.ResultReceiver;
import android.view.SurfaceControl;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Keep the actual task's window, configuration and input bounds together on display zero. */
final class NativeTopTask {
    static SavedTask upper,app,navigation;
    static boolean hidden;
    static Rect bounds,viewport;
    static float progress=1f;
    static boolean available(){
        try{
            Class<?> type=Class.forName("com.android.server.wm.Task",false,Wm.loader);
            Class<?> area=Class.forName("com.android.server.wm.TaskDisplayArea",false,Wm.loader);
            return OwnershipBridge.method(type,"supportsMultiWindowInDisplayArea",area).getReturnType()==boolean.class
                    && OwnershipBridge.method(type,"getTaskDisplayArea").getReturnType()==area
                    && OwnershipBridge.method(type,"isForceHidden").getReturnType()==boolean.class
                    && OwnershipBridge.method(type,"getRelativePosition").getReturnType()==android.graphics.Point.class;
        }catch(ReflectiveOperationException e){return false;}
    }
    static SavedTask held(Object task){return app!=null && app.task==task?app:navigation!=null && navigation.task==task?navigation:null;}
    static boolean held(int id){return id>=0 && (app!=null && app.id==id || navigation!=null && navigation.id==id);}
    static boolean occupied(){return app!=null || navigation!=null;}
    static void state(Bundle b){b.putInt("upper",upper==null?-1:upper.id);b.putInt("upperApp",app==null?-1:app.id);b.putInt("upperNavigation",navigation==null?-1:navigation.id);b.putBoolean("hidden",hidden);}
    static void reset(){upper=app=navigation=null;hidden=false;bounds=null;viewport=null;progress=1f;}
    static void change(Intent i,ResultReceiver reply)throws Exception{
        change(i,reply,false);
    }
    static void change(Intent i,ResultReceiver reply,boolean collapsed)throws Exception{
        String action=i.getStringExtra("topAction");
        boolean resume="resume".equals(action),take="take".equals(action)||resume, show="show".equals(action), park="park".equals(action)||resume, release="release".equals(action);
        if(!take && !show && !park && !release)throw new IllegalArgumentException("未知的顶窗操作");
        int id=i.getIntExtra("task",-1);
        boolean nav=i.getBooleanExtra("navigation",false);
        final SavedTask record=saved.get(id);
        final Object wct=transaction();
        final IBinder expected=owner;
        final CommitBarrier group=new CommitBarrier();
        synchronized(Wm.lock){
            if(!available() || !interactive(Wm.context) || record==null || !WorkspaceUsers.allows(Wm.context,principal,record.user) || !record.token.equals(i.getParcelableExtra("token"))
                    || liveTask(id,record.token)!=record.task || call(record.task,"getParent")!=record.parent
                    || (Integer)call(call(record.task,"getSurfaceControl"),"getLayerId")!=record.layerId)
                throw new IllegalStateException("顶窗任务身份或系统能力已变化");
            if(take){
                Rect requested=i.getParcelableExtra("bounds");
                WorkspaceLayout layout=WorkspaceLayout.create(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,sideLeft,layoutCount,layoutInset,mainReflow);
                if((nav?navigation:app)!=null || held(id) || !WorkspaceCapacity.canAdd(slots.count(),false) || requested==null
                        || requested.left!=0 || requested.right!=logical.width() || requested.top!=0 || requested.bottom!=layout.contentHeight
                        || requested.height()<=0 || requested.width()<=requested.height()
                        || !WorkspaceResize.supportsUpper(record.task)
                        || (Integer)call(record.task,"getWindowingMode")!=1 || !resume && !WorkspaceMainFocus.matches(record.task)
                        || resume && (!runningActivity(record.task) || !readmitting.matches(nav?ParkedWorkspace.NAVIGATION:ParkedWorkspace.UPPER,id,record.user,record.token)))
                    throw new IllegalStateException("当前任务不满足顶窗收纳条件");
                Object home=resume?null:liveTask(i.getIntExtra("home",-1),i.getParcelableExtra("homeToken"));
                if(!resume && (home==null || (Integer)call(home,"getActivityType")!=2 || (Integer)field(home,"mUserId")!=principal))
                    throw new IllegalStateException("原屏桌面身份不一致");
                if(upper!=null && !hidden){call(wct,"setFocusable",upper.token,false);call(wct,"setHidden",upper.token,true);}
                pendingCommit=group;upper=record;if(nav)navigation=record;else app=record;record.dirty=true;viewport=new Rect(requested);
                bounds=UpperAppLayout.available?UpperAppLayout.landscapeCanvas(viewport,logical.width(),
                        Wm.context.getResources().getDisplayMetrics().densityDpi):new Rect(viewport);
                progress=resume?1f:.02f;
                call(wct,"setWindowingMode",record.token,6);call(wct,"setBounds",record.token,bounds);
                call(wct,"setAlwaysOnTop",record.token,true);call(wct,"setFocusable",record.token,!resume);
                call(wct,"setHidden",record.token,resume);
                SurfaceControl.Transaction tx=(SurfaceControl.Transaction)surfaceTransaction();
                unpublishedSurface=tx;
                call(record.task,"clearMagnificationSpec",tx);
                if(!resume){
                    Rect p=(Rect)call(record.parent,"getBounds");
                    UpperMotion.position(tx,(SurfaceControl)call(record.task,"getSurfaceControl"),bounds,viewport,viewport.left-p.left,viewport.top-p.top,.02f);
                }
                trackCommit(tx,group);call(wct,"setBoundsChangeTransaction",record.token,tx);
                if(!resume){call(wct,"reorder",i.getParcelableExtra("homeToken"),true);call(wct,"reorder",record.token,true);}
            }else{
                if(!held(id) || park && upper!=record || !record.dirty || (Integer)call(record.task,"getWindowingMode")!=6
                        || !bounds.equals(call(record.task,"getBounds")))throw new IllegalStateException("顶窗已被其他窗口接管");
                pendingCommit=group;
                if(!release && upper!=null && upper!=record && !hidden){call(wct,"setFocusable",upper.token,false);call(wct,"setHidden",upper.token,true);}
                if(release){restore(wct,record,group);call(wct,"reorder",record.token,true);}
                else{
                    if(show){upper=record;progress=.02f;}
                    call(wct,"setFocusable",record.token,show);call(wct,"setHidden",record.token,park);
                    if(show)call(wct,"reorder",record.token,true);
                }
            }
        }
        apply(wct);unpublishedSurface=null;
        synchronized(Wm.lock){
            if(take && !resume)rememberMain(liveTask(i.getIntExtra("home",-1),i.getParcelableExtra("homeToken")));
            if(release){verifyRestored(record);}
            else if((Integer)call(record.task,"getWindowingMode")!=6 || !bounds.equals(call(record.task,"getBounds"))
                    || !Boolean.valueOf(!park).equals(call(record.task,"isFocusable"))
                    || !Boolean.valueOf(park).equals(call(record.task,"isForceHidden")))
                throw new IllegalStateException("顶窗 "+action+" 期望="+bounds+" 实际="+call(record.task,"getBounds")
                        +" mode="+call(record.task,"getWindowingMode")+" focusable="+call(record.task,"isFocusable")+" hidden="+call(record.task,"isForceHidden"));
            // Released tasks must participate in the main display transform again.
            if(release){if(app==record)app=null;if(navigation==record)navigation=null;if(upper==record){upper=null;hidden=false;}}
            replay();
            Object tx=call(Wm.display,"getPendingTransaction");trackCommit(tx,group);call(tx,"apply");
        }
        group.seal();
        awaitCommit(group,expected,android.os.SystemClock.uptimeMillis()+1800,()->{
            if(release){
                // The mode/bounds transaction can write a late surface matrix.
                // Normalize AFTER its commit, as the main/side handoff does.
                normalizeReturn(record,expected,()->{
                    record.dirty=false;if(!occupied())reset();
                    // Returning a top app must not shrink/grow the entire main
                    // display (including HOME) as an intermediate animation.
                    Bundle b=base();state(b);b.putInt("released",id);
                    respond(reply,0,b,"顶部任务状态已提交："+action+" task="+id);
                });
                return;
            }
            hidden=park;
            if(resume)readmitting.consumed(nav?ParkedWorkspace.NAVIGATION:ParkedWorkspace.UPPER);
            Runnable complete=()->{
                Bundle b=base();state(b);
                respond(reply,0,b,"顶部任务状态已提交："+action+" task="+id);
            };
            if((take && !resume) || show){
                CommitBarrier waiting=pendingCommit=new CommitBarrier();int hostFrame=waiting.add();waiting.seal();
                Bundle ask=base();ask.putParcelable("ready",remote(new ResultReceiver(Wm.handler){
                    protected void onReceiveResult(int code,Bundle b){if(code==1 && pendingCommit==waiting && !ending)waiting.commit(hostFrame);}
                }));
                events.send(95,ask);
                awaitCommit(waiting,expected,android.os.SystemClock.uptimeMillis()+1000,()->UpperMotion.play(record,true,complete),()->finish("顶窗物理输入区域未确认"));
            }else complete.run();
        },()->finish("顶窗图层提交未确认"));
    }
    static void normalizeReturn(SavedTask record,IBinder expected,Runnable done){
        CommitBarrier normalized=pendingCommit=new CommitBarrier();
        synchronized(Wm.lock){
            if(owner!=expected || !active || ending)throw new IllegalStateException("顶窗归还会话已变化");
            verifyRestored(record);replay(normalized,record);
            traceHandoff("upper_return_normalized",0,record.id,record.id);
        }
        normalized.seal();
        awaitCommit(normalized,expected,android.os.SystemClock.uptimeMillis()+1800,done,()->finish("顶窗归还归一事务未确认"));
    }
}
