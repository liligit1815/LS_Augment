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
    static void reset(){upper=app=navigation=null;hidden=false;bounds=null;viewport=null;progress=1f;WorkspaceBackFocus.mainPreferred=false;}
    static void removed(IBinder expected,SavedTask record){
        synchronized(Wm.lock){
            if(!active || ending || owner!=expected || saved.get(record.id)!=record
                    || !held(record.id) || liveTask(record.id,record.token)!=null)return;
            // A running handoff still owns its real commit/rollback. A native
            // task removal between independent operations only retires this page.
            if(pendingCommit!=null || flip!=null){Wm.handler.postDelayed(()->removed(expected,record),32);return;}
            boolean selected=upper==record;
            if(app==record)app=null;
            if(navigation==record)navigation=null;
            if(selected){upper=null;hidden=false;progress=1;}
            record.dirty=false;saved.remove(record.id);
            if(!occupied())reset();
            replay();
            Bundle change=base();state(change);change.putInt("removed",record.id);change.putBoolean("selectedRemoved",selected);
            respond(events,94,change,"顶部原任务已结束，仅释放对应页面："+record.id);
        }
    }
    static void change(Intent i,ResultReceiver reply)throws Exception{
        change(i,reply,false);
    }
    static void change(Intent i,ResultReceiver reply,boolean collapsed)throws Exception{
        String action=i.getStringExtra("topAction");
        boolean dismiss="dismiss".equals(action),swap="swap".equals(action);
        boolean resume="resume".equals(action),take="take".equals(action)||resume||swap, show="show".equals(action), park="park".equals(action)||resume, release="release".equals(action)||dismiss;
        if(!take && !show && !park && !release)throw new IllegalArgumentException("未知的顶窗操作");
        int id=i.getIntExtra("task",-1);
        boolean nav=i.getBooleanExtra("navigation",false);
        final boolean frameBridge=i.getBooleanExtra("frameBridge",false);
        final SavedTask record=saved.get(id);
        final SavedTask exchanged=swap?saved.get(i.getIntExtra("previous",-1)):null;
        final Object wct=transaction();
        final SurfaceControl.Transaction landing=take||release||show?(SurfaceControl.Transaction)surfaceTransaction():null;
        final IBinder expected=owner;
        final CommitBarrier group=new CommitBarrier();
        synchronized(Wm.lock){
            if(!available() || !interactive(Wm.context) || record==null || !WorkspaceUsers.allows(Wm.context,principal,record.user) || !record.token.equals(i.getParcelableExtra("token"))
                    || liveTask(id,record.token)!=record.task || call(record.task,"getParent")!=record.parent
                    || (Integer)call(call(record.task,"getSurfaceControl"),"getLayerId")!=record.layerId)
                throw new IllegalStateException("顶窗任务身份或系统能力已变化");
            if(take){
                if(swap && (nav || exchanged==null || !held(exchanged.id) || app!=null && app!=exchanged || exchanged==record || !exchanged.dirty
                        || exchanged.id!=i.getIntExtra("previous",-1) || !exchanged.token.equals(i.getParcelableExtra("previousToken"))
                        || !WorkspaceUsers.allows(Wm.context,principal,exchanged.user)
                        || liveTask(exchanged.id,exchanged.token)!=exchanged.task || call(exchanged.task,"getParent")!=exchanged.parent
                        || (Integer)call(call(exchanged.task,"getSurfaceControl"),"getLayerId")!=exchanged.layerId
                        || (Integer)call(exchanged.task,"getWindowingMode")!=6 || !bounds.equals(call(exchanged.task,"getBounds"))))
                    throw new IllegalStateException("顶部交换原任务身份已变化");
                Rect requested=i.getParcelableExtra("bounds");
                WorkspaceLayout layout=WorkspaceLayout.create(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,sideLeft,layoutCount,layoutInset,mainReflow);
                if((!swap && (nav?navigation:app)!=null) || held(id) || !WorkspaceCapacity.canAdd(slots.count(),false) || requested==null
                        || requested.left!=0 || requested.right!=logical.width() || requested.top!=0 || requested.bottom!=layout.contentHeight
                        || requested.height()<=0 || requested.width()<=requested.height()
                        || !WorkspaceResize.supportsUpper(record.task)
                        || (Integer)call(record.task,"getWindowingMode")!=1 || !resume && !WorkspaceMainFocus.matches(record.task)
                        || resume && (!runningActivity(record.task) || !readmitting.matches(nav?ParkedWorkspace.NAVIGATION:ParkedWorkspace.UPPER,id,record.user,record.token)))
                    throw new IllegalStateException("当前任务不满足顶窗收纳条件");
                Object home=resume||swap?null:liveTask(i.getIntExtra("home",-1),i.getParcelableExtra("homeToken"));
                if(!resume && !swap && (home==null || (Integer)call(home,"getActivityType")!=2 || (Integer)field(home,"mUserId")!=principal))
                    throw new IllegalStateException("原屏桌面身份不一致");
                SurfaceControl.Transaction tx=landing;
                unpublishedSurface=tx;
                pendingCommit=group;
                // Restore and adopt the two original task surfaces together.
                if(exchanged!=null){
                    restore(wct,exchanged,group,tx);call(wct,"reorder",exchanged.token,true);
                    if(exchanged==navigation)navigation=null;
                }
                if(upper!=null && upper!=exchanged && !hidden){call(wct,"setFocusable",upper.token,false);call(wct,"setHidden",upper.token,true);}
                upper=record;if(nav)navigation=record;else app=record;record.dirty=true;viewport=new Rect(requested);
                WorkspaceBackFocus.mainPreferred=false;
                bounds=UpperAppLayout.available?UpperAppLayout.landscapeCanvas(viewport,logical.width(),
                        Wm.context.getResources().getDisplayMetrics().densityDpi):new Rect(viewport);
                progress=resume||swap||frameBridge?1f:.02f;
                call(wct,"setWindowingMode",record.token,6);call(wct,"setBounds",record.token,bounds);
                call(wct,"setAlwaysOnTop",record.token,true);call(wct,"setFocusable",record.token,!resume);
                call(wct,"setHidden",record.token,resume);
                call(record.task,"clearMagnificationSpec",tx);
                if(!resume){
                    Rect p=(Rect)call(record.parent,"getBounds");
                    UpperMotion.position(tx,(SurfaceControl)call(record.task,"getSurfaceControl"),bounds,viewport,viewport.left-p.left,viewport.top-p.top,progress);
                }
                trackCommit(tx,group);
                if(!resume){if(!swap)call(wct,"reorder",i.getParcelableExtra("homeToken"),true);call(wct,"reorder",record.token,true);}
            }else{
                if(!held(id) || park && upper!=record || dismiss && (upper!=record || hidden) || !record.dirty || (Integer)call(record.task,"getWindowingMode")!=6
                        || !bounds.equals(call(record.task,"getBounds")))throw new IllegalStateException("顶窗已被其他窗口接管");
                pendingCommit=group;
                if(!release && upper!=null && upper!=record && !hidden){call(wct,"setFocusable",upper.token,false);call(wct,"setHidden",upper.token,true);}
                if(release){unpublishedSurface=landing;restore(wct,record,group,landing);trackCommit(landing,group);call(wct,"reorder",record.token,!dismiss);}
                else{
                    if(show){upper=record;progress=1f;WorkspaceBackFocus.mainPreferred=false;}
                    call(wct,"setFocusable",record.token,show);call(wct,"setHidden",record.token,park);
                    if(show){
                        call(wct,"reorder",record.token,true);
                        unpublishedSurface=landing;
                        Rect p=(Rect)call(record.parent,"getBounds");
                        UpperMotion.position(landing,(SurfaceControl)call(record.task,"getSurfaceControl"),bounds,viewport,viewport.left-p.left,viewport.top-p.top,1f);
                        trackCommit(landing,group);
                    }
                }
            }
        }
        apply(wct);
        synchronized(Wm.lock){
            if(exchanged!=null){verifyRestored(exchanged);rememberMain(exchanged.task);}
            else if(take && !resume)rememberMain(liveTask(i.getIntExtra("home",-1),i.getParcelableExtra("homeToken")));
            if(release){verifyRestored(record);}
            else if((Integer)call(record.task,"getWindowingMode")!=6 || !bounds.equals(call(record.task,"getBounds"))
                    || !Boolean.valueOf(!park).equals(call(record.task,"isFocusable"))
                    || !Boolean.valueOf(park).equals(call(record.task,"isForceHidden")))
                throw new IllegalStateException("顶窗 "+action+" 期望="+bounds+" 实际="+call(record.task,"getBounds")
                        +" mode="+call(record.task,"getWindowingMode")+" focusable="+call(record.task,"isFocusable")+" hidden="+call(record.task,"isForceHidden"));
            // Released tasks must participate in the main display transform again.
            if(release){if(app==record)app=null;if(navigation==record)navigation=null;if(upper==record){upper=null;hidden=false;}}
            // A configuration relaunch can discard the old window's deferred
            // bounds transaction. Publish on the verified original task surfaces
            // after the native mode/bounds change, and await this real commit.
            if(landing!=null){landing.apply();landing.close();unpublishedSurface=null;}
            // Observe the replay before it is applied. Registering on the now
            // empty pending transaction can wait forever on some WM paths.
            replay(group,null);
        }
        if(take && !resume){
            // Reveal the native window before waiting for its first resized
            // frame. Some apps do not draw while covered by the wallpaper;
            // waiting for that draw before shrinking the host deadlocks them.
            revealHost(group);
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
                    Runnable complete=()->respond(reply,0,b,"顶部任务状态已提交："+action+" task="+id);
                    if(frameBridge)awaitFrames(expected,new SavedTask[]{record},android.os.SystemClock.uptimeMillis()+1500,complete);
                    else complete.run();
                });
                return;
            }
            hidden=park;
            if(resume)readmitting.consumed(nav?ParkedWorkspace.NAVIGATION:ParkedWorkspace.UPPER);
            Runnable complete=()->{
                Bundle b=base();state(b);
                if(exchanged!=null)b.putInt("released",exchanged.id);
                Runnable response=()->respond(reply,0,b,"顶部任务状态已提交："+action+" task="+id);
                if(frameBridge)awaitFrames(expected,exchanged==null?new SavedTask[]{record}:new SavedTask[]{record,exchanged},
                        android.os.SystemClock.uptimeMillis()+1500,response);
                else response.run();
            };
            // A page already has its native landscape buffer. Reopening it or
            // swapping tasks must not shrink it to 2% over an empty black band.
            Runnable reveal=()->{if(take && !resume && !swap && !frameBridge)UpperMotion.play(record,true,complete);else complete.run();};
            if(show){
                // Unlike a newly resized task, a retained page already has its
                // landscape buffer. First acknowledge its unhide transaction;
                // uncovering it in parallel exposes the old hidden surface.
                revealWhenDrawn(record,expected,android.os.SystemClock.uptimeMillis()+1500,reveal);
            }
            else if(exchanged!=null)normalizeReturn(exchanged,expected,()->{exchanged.dirty=false;reveal.run();});
            else reveal.run();
        },()->finish("顶窗图层提交未确认："+group.snapshot()));
    }
    static void awaitFrames(IBinder expected,SavedTask[] actors,long deadline,Runnable complete){
        if(owner!=expected || !active || ending)return;
        boolean ready=WorkspaceReadmit.available;
        synchronized(Wm.lock){
            for(SavedTask r:actors){
                if(liveTask(r.id,r.token)!=r.task || call(r.task,"getParent")!=r.parent
                        || (Integer)call(call(r.task,"getSurfaceControl"),"getLayerId")!=r.layerId){
                    finish("分区动画目标身份已变化");return;
                }
                Object activity=call(r.task,"topRunningActivity"),window=activity==null?null:call(activity,"findMainWindow");
                ready &= window!=null && Boolean.TRUE.equals(call(window,"isDrawn")) && Boolean.TRUE.equals(call(activity,"isReportedDrawn"));
            }
        }
        if(ready){complete.run();return;}
        if(android.os.SystemClock.uptimeMillis()>=deadline){finish("分区目标绘制未确认，归还原任务");return;}
        Wm.handler.postDelayed(()->awaitFrames(expected,actors,deadline,complete),16);
    }
    static void revealWhenDrawn(SavedTask record,IBinder expected,long deadline,Runnable complete){
        if(owner!=expected || !active || ending)return;
        try{
            synchronized(Wm.lock){
                if(upper!=record || !UpperTaskPresentation.owns(record.task))throw new IllegalStateException("顶部绘制任务身份已变化");
                if(WorkspaceReadmit.available){
                    Object activity=call(record.task,"topRunningActivity");
                    Object window=activity==null?null:call(activity,"findMainWindow");
                    if(window==null || !Boolean.TRUE.equals(call(window,"isDrawn")) || !Boolean.TRUE.equals(call(activity,"isReportedDrawn"))){
                        if(android.os.SystemClock.uptimeMillis()>=deadline)throw new IllegalStateException("顶部原窗口绘制未就绪");
                        Wm.handler.postDelayed(()->revealWhenDrawn(record,expected,deadline,complete),16);return;
                    }
                }
            }
            CommitBarrier hostFrame=pendingCommit=new CommitBarrier();
            revealHost(hostFrame);hostFrame.seal();
            awaitCommit(hostFrame,expected,android.os.SystemClock.uptimeMillis()+1000,complete,
                    ()->finish("顶部页面显露未确认"));
        }catch(RuntimeException error){finish("顶部显露失败："+error);}
    }
    static void revealHost(CommitBarrier group){
        int frame=group.add();
        Bundle ask=base();ask.putParcelable("ready",remote(new ResultReceiver(Wm.handler){
            protected void onReceiveResult(int code,Bundle b){if(code==1 && pendingCommit==group && !ending)group.commit(frame);}
        }));
        events.send(95,ask);
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
