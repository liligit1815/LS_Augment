package ls.augment.com.step;

import android.app.Dialog;
import android.content.Context;
import android.view.*;
import android.widget.*;

/** Both the app and SystemUI edit the same user-local number of side workspaces. */
final class SlotCountDialog {
    static final String TITLE="StepWorkspaceCount";
    final Dialog dialog;
    interface Select {void layout(int sides,boolean upper);}
    SlotCountDialog(Context base,boolean overlay,int current,boolean upper,boolean topSupported,Select select){
        Context c=overlay?base.createDisplayContext(base.getDisplay()).createWindowContext(2017,null):base;
        dialog=new Dialog(c,StepMaterial.dark(c)?android.R.style.Theme_Material_Dialog_NoActionBar:
                android.R.style.Theme_Material_Light_Dialog_NoActionBar);
        LinearLayout card=new LinearLayout(c);card.setOrientation(1);
        int pad=StepMaterial.dp(c,16);card.setPadding(pad,pad,pad,pad);card.setBackground(StepMaterial.glass(c,true,20));
        TextView title=StepMaterial.label(c,"工作区布局",19,true);card.addView(title,-1,StepMaterial.dp(c,48));
        RadioGroup group=new RadioGroup(c);card.addView(group,-1,-2);
        for(int n=1;n<=SideSlots.MAX_COUNT;n++){
            RadioButton row=new RadioButton(c);row.setText(n+" 个侧边副区");row.setTextColor(StepMaterial.ink(c));
            group.addView(row,-1,StepMaterial.dp(c,48));row.setChecked(n==current);
            row.setEnabled(WorkspaceCapacity.fitsLayout(n,upper));row.setAlpha(row.isEnabled()?1f:.45f);
            final int count=n;row.setOnClickListener(v->{dialog.dismiss();select.layout(count,upper);});
        }
        CheckBox top=new CheckBox(c);top.setText("启用顶部副区");top.setChecked(upper);top.setTextColor(StepMaterial.ink(c));
        top.setEnabled(upper || topSupported && WorkspaceCapacity.fitsLayout(current,true));top.setAlpha(top.isEnabled()?1f:.45f);
        top.setOnClickListener(v->{dialog.dismiss();select.layout(current,top.isChecked());});card.addView(top,-1,StepMaterial.dp(c,48));
        TextView hint=StepMaterial.label(c,"主区固定为 1 个。启用顶部时，侧边最多 4 个。",13,false);card.addView(hint,-1,-2);
        dialog.setContentView(card);dialog.setCanceledOnTouchOutside(true);
        Window w=dialog.getWindow();if(overlay)w.setType(2017);
        w.setBackgroundDrawableResource(android.R.color.transparent);
        WindowManager.LayoutParams lp=w.getAttributes();lp.setTitle(TITLE);lp.gravity=Gravity.CENTER;
        lp.width=Math.min(StepMaterial.dp(c,320),c.getResources().getDisplayMetrics().widthPixels-2*pad);
        lp.height=WindowManager.LayoutParams.WRAP_CONTENT;w.setAttributes(lp);
    }
    void show(){dialog.show();}
    void dismiss(){dialog.dismiss();}
}
