package ls.augment.com;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/** Find a real setting row, scroll it into view, and briefly tint its background. */
final class SearchResultHighlight {
    static final String TITLE="search_focus_title",TAG="search_focus_tag";
    static void attach(UiKit ui,View root){
        String title=ui.activity.getIntent().getStringExtra(TITLE);
        String tag=ui.activity.getIntent().getStringExtra(TAG);
        if(title==null||title.isEmpty())return;
        root.post(new Runnable(){int attempts;
            public void run(){
                if(ui.activity.isFinishing()||ui.activity.isDestroyed()||!root.isAttachedToWindow())return;
                View target=tag==null||tag.isEmpty()?null:root.findViewWithTag(tag);
                if(target==null)target=findText(root,title);
                if(target==null&&tag!=null&&tag.startsWith("config:")){
                    String parent=ModuleFeatureSearch.focusParentTag(tag.substring(7));
                    if(!parent.isEmpty())target=root.findViewWithTag(parent);
                }
                // A page-level result has no specific option; point at its first
                // content card. Never flash the breadcrumb or enable a control.
                if(target==null&&(tag==null||tag.isEmpty()))target=firstContent(root);
                if(target==null){if(++attempts<30)root.postDelayed(this,60);return;}
                while(!target.isShown()&&target.getParent() instanceof View)target=(View)target.getParent();
                if(!target.isShown()||target.getHeight()==0){if(++attempts<30)root.postDelayed(this,60);return;}
                View row=row(target,root);
                ui.activity.getIntent().removeExtra(TITLE);ui.activity.getIntent().removeExtra(TAG);
                row.requestRectangleOnScreen(new Rect(0,0,row.getWidth(),row.getHeight()),false);
                row.postDelayed(()->{if(row.isAttachedToWindow())pulse(ui,row);},280);
            }
        });
    }
    private static View findText(View view,String title){
        if(view.getTag() instanceof String&&((String)view.getTag()).startsWith("breadcrumb:"))return null;
        if(view instanceof TextView&&title.contentEquals(((TextView)view).getText()))return view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){
            View result=findText(((ViewGroup)view).getChildAt(i),title);if(result!=null)return result;
        }
        return null;
    }
    private static View firstContent(View view){
        String tag=String.valueOf(view.getTag());
        if(tag.equals("page-path")||tag.equals("detail-header"))return null;
        if(view.isShown()&&(tag.equals("feature-row")||tag.equals("preference-card")||tag.startsWith("native-feature:")))return view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){
            View found=firstContent(((ViewGroup)view).getChildAt(i));if(found!=null)return found;
        }
        return null;
    }
    private static View row(View target,View root){
        for(View at=target;at!=root&&at.getParent() instanceof View;at=(View)at.getParent()){
            String tag=String.valueOf(at.getTag());
            if("feature-row".equals(tag)||tag.startsWith("navigation:")||tag.startsWith("parameter-slider:")||tag.startsWith("native-feature:"))return at;
        }
        return target;
    }
    private static void pulse(UiKit ui,View row){
        Drawable original=row.getForeground(),highlight=ui.round(ui.accent,ui.angularCards?4:12);
        highlight.setAlpha(0);row.setForeground(highlight);
        ValueAnimator animation=ValueAnimator.ofFloat(0,1,0,1,0);animation.setDuration(1200);
        animation.addUpdateListener(value->highlight.setAlpha(Math.round((Float)value.getAnimatedValue()*48)));
        View.OnAttachStateChangeListener detach=new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View view){}
            public void onViewDetachedFromWindow(View view){animation.cancel();}
        };
        row.addOnAttachStateChangeListener(detach);
        animation.addListener(new AnimatorListenerAdapter(){public void onAnimationEnd(Animator value){
            if(row.getForeground()==highlight)row.setForeground(original);row.removeOnAttachStateChangeListener(detach);
        }});animation.start();
    }
    private SearchResultHighlight(){}
}
