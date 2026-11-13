package ls.augment.com.step;

import android.app.ActivityManager;
import android.graphics.Rect;
import android.view.*;
import android.widget.*;
import static ls.augment.com.step.StepRuntime.*;

/** The adopted app owns the entire top page. Android routes its touch and Back. */
final class UpperPane {
    final WorkspaceQuickBar owner;
    final LiveWorkspace host;
    final LinearLayout face;
    final TextView add, promote;
    final int caption;
    boolean visible;
    TopGestureMonitor monitor;
    final UpperRoll roll;
    UpperPane(WorkspaceQuickBar owner,int inset){
        this.owner=owner;host=owner.host;
        caption=0;
        face=new LinearLayout(owner.ctx);face.setOrientation(LinearLayout.VERTICAL);
        LinearLayout row=new LinearLayout(owner.ctx);
        TextView controls=StepMaterial.label(owner.ctx,"‹  控制页",14,true);
        controls.setOnClickListener(v->toggle(false));row.addView(controls,new LinearLayout.LayoutParams(0,-1,1));
        StepMaterial.feedback(controls);
        promote=StepMaterial.label(owner.ctx,"回到主区",14,true);
        promote.setOnClickListener(v->host.upperAction("release"));row.addView(promote,new LinearLayout.LayoutParams(0,-1,1));
        StepMaterial.feedback(promote);
        add=StepMaterial.label(owner.ctx,"＋",36,false);add.setContentDescription("收纳当前主应用到顶部");
        add.setOnClickListener(v->host.change(-1));face.addView(add,new LinearLayout.LayoutParams(-1,0,1));
        StepMaterial.feedback(add);
        face.setVisibility(View.GONE);owner.bar.addView(face,-1,host.geometry.contentHeight);
        roll=new UpperRoll(this);owner.bar.addView(roll,-1,-1);
        monitor=TopGestureMonitor.open(this);
    }
    Rect bounds(){return new Rect(0,0,host.geometry.width,host.geometry.contentHeight);}
    boolean canSwitch(){return !owner.closed && host.ready && !host.closing && host.topAvailable
                && owner.picker==null && owner.recent==null && owner.tools.clipboard==null && owner.tools.toolMenu==null
                && (owner.counts==null || !owner.counts.dialog.isShowing()) && host.retained==null && !host.fence.busy()
                && host.dragSlot<0 && !owner.launching && interactive(owner.ctx);}
    LiveWorkspace.Lease gestureTarget(){
        if(!canSwitch() || !visible || host.upperId<0 || !owner.currentUser())return null;
        LiveWorkspace.Lease lease=host.leases.get(host.upperId);
        try{return lease!=null && lease.checkedInfo()!=null?lease:null;}
        catch(RuntimeException changed){return null;}
    }
    void finishGesture(LiveWorkspace.Lease original,boolean dismiss){
        if(original==null || gestureTarget()!=original)return;
        host.upperActionFor(original.id,dismiss?"dismiss":"release",null);
    }
    void toggle(boolean toTask){
        if(toTask==visible || !canSwitch())return;
        applyFace(toTask);
    }
    void applyFace(boolean toTask){
        if(owner.closed || !canSwitch()){if(!owner.closed)render(visible);return;}
        if(toTask){
            if(host.upperAppId<0){owner.deck.jump(WorkspaceDeck.CONTROLS);render(false);return;}
            owner.deck.jump(WorkspaceDeck.UPPER);
            if(host.upperAppId>=0){host.upperActionFor(host.upperAppId,"show",null);return;}
            if(visible && host.upperId>=0){host.upperAction("park",()->render(true,false));return;}
            render(true,false);return;
        }
        if(toTask==visible){render(toTask);return;}
        if(host.upperId<0){render(toTask);return;}
        // An unknown background stays untouched. Return the upper app only over an identified Home.
        boolean home=false;
        try{home=host.homeAloneBehindUpper();}catch(RuntimeException unknown){host.log("主区身份未知，顶部任务暂存");}
        host.upperAction(home?"release":"park");
    }
    void render(boolean taskFace){
        render(taskFace,host.upperId>=0);
    }
    void coverBeforePark(Runnable ready){
        render(false);
        final long deadline=android.os.SystemClock.uptimeMillis()+1000;
        awaitCover(ready,deadline);
    }
    void awaitCover(Runnable ready,long deadline){
        if(owner.closed || host.closing || !host.fence.busy())return;
        owner.bar.getViewTreeObserver().registerFrameCommitCallback(()->host.main.post(()->{
            if(owner.closed || host.closing || !host.fence.busy())return;
            if(owner.bar.getHeight()==host.geometry.top && owner.band.getVisibility()==View.VISIBLE){ready.run();return;}
            if(android.os.SystemClock.uptimeMillis()<deadline)awaitCover(ready,deadline);
            else host.fail("顶部目标页面绘制未确认");
        }));
        owner.bar.invalidate();
    }
    void render(boolean taskFace,boolean occupied){
        if(owner.closed)return;
        if(roll.running)roll.reset();
        visible=taskFace;
        WindowManager.LayoutParams lp=(WindowManager.LayoutParams)owner.bar.getLayoutParams();
        boolean nativeContent=taskFace && occupied;
        lp.y=0;
        lp.height=nativeContent?1:host.geometry.top;
        owner.windowsUpdate(lp);
        owner.band.setVisibility(nativeContent?View.GONE:View.VISIBLE);
        ((View)owner.deck.getParent()).setVisibility(taskFace?View.GONE:View.VISIBLE);
        face.setVisibility(taskFace && !occupied?View.VISIBLE:View.GONE);
        promote.setVisibility(occupied?View.VISIBLE:View.INVISIBLE);add.setVisibility(occupied?View.GONE:View.VISIBLE);
        owner.band.setRotationX(0);owner.band.setAlpha(1);
        if(!taskFace)owner.deck.leaveUpperPage();
        else if(nativeContent)owner.deck.jump(host.upperId==host.upperNavigationId?WorkspaceDeck.NAVIGATION:WorkspaceDeck.UPPER);
        host.publishViewState();
    }
    void close(){if(monitor!=null)monitor.close();roll.close();face.animate().cancel();}
}
