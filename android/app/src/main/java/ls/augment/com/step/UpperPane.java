package ls.augment.com.step;

import android.app.ActivityManager;
import android.graphics.Rect;
import android.view.*;
import android.widget.*;
import static ls.augment.com.step.StepRuntime.*;

/** Only the caption covers the physical app after adoption. Android routes app touch and Back. */
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
        caption=Math.max(0,inset)+owner.dp(34);
        face=new LinearLayout(owner.ctx);face.setOrientation(LinearLayout.VERTICAL);face.setPadding(0,Math.max(0,inset),0,0);
        LinearLayout row=new LinearLayout(owner.ctx);face.addView(row,-1,owner.dp(34));
        TextView controls=StepMaterial.label(owner.ctx,"‹  控制页",14,true);
        controls.setOnClickListener(v->toggle(false));row.addView(controls,new LinearLayout.LayoutParams(0,-1,1));
        StepMaterial.feedback(controls);
        promote=StepMaterial.label(owner.ctx,"回到主区",14,true);
        promote.setOnClickListener(v->host.upperAction("release"));row.addView(promote,new LinearLayout.LayoutParams(0,-1,1));
        StepMaterial.feedback(promote);
        add=StepMaterial.label(owner.ctx,"＋",36,false);add.setContentDescription("收纳当前主应用到顶部");
        add.setOnClickListener(v->host.change(-1));face.addView(add,new LinearLayout.LayoutParams(-1,0,1));
        StepMaterial.feedback(add);
        face.setVisibility(View.GONE);owner.bar.addView(face,-1,-1);
        roll=new UpperRoll(this);owner.bar.addView(roll,-1,-1);
        monitor=TopGestureMonitor.open(this);
    }
    Rect bounds(){return new Rect(0,caption,host.geometry.width,host.geometry.top);}
    boolean canSwitch(){return !owner.closed && host.ready && !host.closing && host.topAvailable
                && owner.picker==null && owner.tools.clipboard==null && host.retained==null && !host.fence.busy()
                && host.dragSlot<0 && !owner.launching && interactive(owner.ctx);}
    void toggle(boolean toTask){
        if(toTask==visible || !canSwitch())return;
        if(roll.begin())roll.settle(true);
    }
    void applyFace(boolean toTask){
        if(owner.closed || !canSwitch()){if(!owner.closed)render(visible);return;}
        if(toTask==visible){render(toTask);return;}
        if(host.upperId<0){render(toTask);return;}
        if(toTask){host.upperAction("show");return;}
        // An unknown background stays untouched. Return the upper app only over an identified Home.
        boolean home=false;
        try{home=host.homeAloneBehindUpper();}catch(RuntimeException unknown){host.log("主区身份未知，顶部任务暂存");}
        host.upperAction(home?"release":"park");
    }
    void render(boolean taskFace){
        render(taskFace,host.upperId>=0);
    }
    void render(boolean taskFace,boolean occupied){
        if(owner.closed)return;
        if(roll.running)roll.reset();
        visible=taskFace;
        WindowManager.LayoutParams lp=(WindowManager.LayoutParams)owner.bar.getLayoutParams();
        lp.height=taskFace && occupied?caption:host.geometry.top;
        owner.windowsUpdate(lp);
        owner.band.setVisibility(taskFace?View.GONE:View.VISIBLE);
        face.setVisibility(taskFace?View.VISIBLE:View.GONE);
        promote.setVisibility(occupied?View.VISIBLE:View.INVISIBLE);add.setVisibility(occupied?View.GONE:View.VISIBLE);
        View shown=taskFace?face:owner.band;
        shown.animate().cancel();shown.setPivotY(taskFace?0:shown.getHeight());
        shown.setRotationX(taskFace?-18:18);shown.setAlpha(.72f);
        shown.animate().rotationX(0).alpha(1).setDuration(160).start();
        if(!taskFace)owner.deck.leaveUpperPage();
        host.publishViewState();
    }
    void close(){if(monitor!=null)monitor.close();roll.close();face.animate().cancel();}
}
