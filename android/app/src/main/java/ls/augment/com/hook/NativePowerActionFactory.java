package ls.augment.com.hook;

import android.content.Context;
import android.util.SparseIntArray;
import android.view.*;
import android.widget.*;

/** Keep the OEM circle/font/selector and replace only the mode glyph. */
final class NativePowerActionFactory {
    private static final String[] LAYOUTS={"global_dialog_simplified_two_buttons",
            "global_dialog_simplified_three_buttons","global_dialog_simplified_two_buttons_abroad",
            "global_dialog_simplified_three_buttons_abroad"};
    static ViewGroup create(Context context,ViewGroup reference,String label){
        int resetId=reference.getId();
        for(String name:LAYOUTS){
            int layout=context.getResources().getIdentifier(name,"layout","com.android.systemui");
            if(layout==0)continue;
            View inflated=LayoutInflater.from(context).inflate(layout,null,false);
            View found=inflated.findViewById(resetId);
            if(!(found instanceof ViewGroup)||!(found.getParent() instanceof ViewGroup))continue;
            ViewGroup action=(ViewGroup)found;
            ((ViewGroup)action.getParent()).removeView(action);
            ImageView image=find(action,ImageView.class),sourceImage=find(reference,ImageView.class);
            TextView text=find(action,TextView.class),sourceText=find(reference,TextView.class);
            if(image==null||text==null||sourceImage==null||sourceText==null)continue;
            // Runtime theme/font changes may differ from the layout's initial values.
            image.getLayoutParams().width=sourceImage.getLayoutParams().width;
            image.getLayoutParams().height=sourceImage.getLayoutParams().height;
            image.setImageDrawable(new PowerModeIconDrawable(label));
            if(sourceImage.getBackground()!=null&&sourceImage.getBackground().getConstantState()!=null)
                image.setBackground(sourceImage.getBackground().getConstantState().newDrawable(context.getResources()).mutate());
            image.setImageTintList(sourceImage.getImageTintList());image.setScaleType(sourceImage.getScaleType());
            image.setPadding(sourceImage.getPaddingLeft(),sourceImage.getPaddingTop(),sourceImage.getPaddingRight(),sourceImage.getPaddingBottom());
            text.setText(label);text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,sourceText.getTextSize());
            text.setTextColor(sourceText.getTextColors());text.setTypeface(sourceText.getTypeface());
            text.setIncludeFontPadding(sourceText.getIncludeFontPadding());text.setLetterSpacing(sourceText.getLetterSpacing());
            text.getLayoutParams().width=sourceText.getLayoutParams().width;
            action.setContentDescription(label);image.setContentDescription(label);
            // No copied ID or click target may be mistaken for shutdown/restart by the native animation.
            SparseIntArray ids=new SparseIntArray();renewIds(action,ids);renewRules(action,ids);
            action.setVisibility(View.VISIBLE);action.setAlpha(1);action.setClickable(true);action.setFocusable(true);
            return action;
        }
        throw new IllegalStateException("原厂重启按钮布局不可用");
    }
    static <T extends View>T find(View view,Class<T> type){
        if(type.isInstance(view))return type.cast(view);
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){
            T found=find(group.getChildAt(i),type);if(found!=null)return found;
        }}
        return null;
    }
    private static void renewIds(View view,SparseIntArray ids){
        if(view.getId()!=View.NO_ID){int next=View.generateViewId();ids.put(view.getId(),next);view.setId(next);}
        view.setTag(null);view.setOnClickListener(null);view.setClickable(false);
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)renewIds(group.getChildAt(i),ids);}
    }
    private static void renewRules(View view,SparseIntArray ids){
        if(view.getLayoutParams() instanceof RelativeLayout.LayoutParams){
            RelativeLayout.LayoutParams p=(RelativeLayout.LayoutParams)view.getLayoutParams();int[] rules=p.getRules();
            for(int i=0;i<rules.length;i++)if(rules[i]>0){int replacement=ids.get(rules[i]);if(replacement!=0)p.addRule(i,replacement);else p.removeRule(i);}
        }
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)renewRules(group.getChildAt(i),ids);}
    }
}
