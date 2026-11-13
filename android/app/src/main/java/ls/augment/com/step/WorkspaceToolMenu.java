package ls.augment.com.step;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Rect;
import android.view.*;
import android.widget.*;

/** An owned SystemUI panel, above both the scaled task and its status bar. */
final class WorkspaceToolMenu {
    static final String TITLE="StepWorkspaceMenu";
    final WorkspaceQuickBar owner;
    final Dialog dialog;
    final LinearLayout rows;
    final Context context;
    WorkspaceToolMenu(WorkspaceQuickBar owner){
        this.owner=owner;
        context=StepMaterial.modalPanelContext(owner.ctx,owner.ctx.getDisplay());
        dialog=new Dialog(context,StepMaterial.dark(context)?android.R.style.Theme_Material_Dialog_NoActionBar:
                android.R.style.Theme_Material_Light_Dialog_NoActionBar);
        rows=new LinearLayout(context);rows.setOrientation(LinearLayout.VERTICAL);
        rows.setPadding(owner.dp(8),owner.dp(4),owner.dp(8),owner.dp(4));
        rows.setBackground(StepMaterial.glass(context,true,20));
        ScrollView scroll=new ScrollView(context);scroll.setFillViewport(true);scroll.addView(rows);
        dialog.setContentView(scroll);dialog.setCanceledOnTouchOutside(true);
        Window w=dialog.getWindow();w.setType(StepMaterial.MODAL_PANEL);
        w.setBackgroundDrawableResource(android.R.color.transparent);
        w.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        w.addFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
    }
    void add(String label,Runnable action){
        TextView row=StepMaterial.label(context,label,14,false);
        row.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        row.setPadding(owner.dp(12),owner.dp(8),owner.dp(12),owner.dp(8));
        row.setMinHeight(owner.dp(48));StepMaterial.feedback(row);
        row.setOnClickListener(v->{
            // Remove this window before opening another panel or changing geometry.
            dismiss();
            try{owner.checkAction();action.run();}catch(RuntimeException e){owner.note(e);}
        });
        rows.addView(row,-1,-2);
    }
    void show(View anchor){
        WindowMetrics metrics=owner.host.windows.getCurrentWindowMetrics();
        Rect screen=metrics.getBounds();
        android.graphics.Insets safe=metrics.getWindowInsets().getInsetsIgnoringVisibility(
                WindowInsets.Type.systemBars()|WindowInsets.Type.displayCutout());
        int margin=owner.dp(8),width=Math.min(owner.dp(280),screen.width()-safe.left-safe.right-2*margin);
        int maximum=screen.height()-safe.top-safe.bottom-2*margin;
        rows.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(maximum,View.MeasureSpec.AT_MOST));
        int height=Math.min(maximum,rows.getMeasuredHeight());
        int[] at=new int[2];anchor.getLocationOnScreen(at);
        int x=Math.max(safe.left+margin,Math.min(at[0],screen.width()-safe.right-margin-width));
        int y=at[1]+anchor.getHeight();
        if(y+height>screen.height()-safe.bottom-margin)y=at[1]-height;
        y=Math.max(safe.top+margin,Math.min(y,screen.height()-safe.bottom-margin-height));
        WindowManager.LayoutParams lp=dialog.getWindow().getAttributes();
        lp.setTitle(TITLE);lp.gravity=Gravity.TOP|Gravity.LEFT;lp.setFitInsetsTypes(0);
        lp.layoutInDisplayCutoutMode=WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
        lp.x=x;lp.y=y;lp.width=width;lp.height=height;
        dialog.getWindow().setAttributes(lp);dialog.show();
    }
    void dismiss(){dialog.dismiss();}
}
