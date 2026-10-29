package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.IdentityHashMap;
import java.util.Map;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Duo content inside the verified legacy OEM frame/animation engine, with no OEM scene observers. */
final class DuoIslandLegacyCards {
    private final Context context;
    private final DuoIslandCompatibility contract;
    private final Map<View,Content> contents=new IdentityHashMap<>();
    private static final class Content {
        final ImageView icon;final TextView title,subtitle;
        Content(ImageView icon,TextView title,TextView subtitle){this.icon=icon;this.title=title;this.subtitle=subtitle;}
    }
    DuoIslandLegacyCards(Context context,DuoIslandCompatibility contract){this.context=context;this.contract=contract;}
    View create(boolean panel)throws Exception {
        FrameLayout frame=(FrameLayout)contract.islandConstructor.newInstance(context,null);
        frame.setLayoutParams(new FrameLayout.LayoutParams(-1,-1));
        ImageView icon=new ImageView(context);icon.setScaleType(ImageView.ScaleType.CENTER_CROP);
        TextView title=text(panel?15:12),subtitle=panel?text(13):null;
        FrameLayout.LayoutParams iconParams=new FrameLayout.LayoutParams(dp(panel?36:22),dp(panel?36:22));
        iconParams.gravity=Gravity.START|(panel?Gravity.TOP:Gravity.CENTER_VERTICAL);
        iconParams.setMarginStart(dp(panel?24:8));if(panel)iconParams.topMargin=dp(24);
        frame.addView(icon,iconParams);
        FrameLayout.LayoutParams titleParams=new FrameLayout.LayoutParams(panel?dp(245):-1,-2);
        titleParams.gravity=Gravity.START|(panel?Gravity.TOP:Gravity.CENTER_VERTICAL);
        titleParams.setMarginStart(dp(panel?78:30));titleParams.setMarginEnd(dp(12));if(panel)titleParams.topMargin=dp(22);
        frame.addView(title,titleParams);
        if(subtitle!=null){
            subtitle.setMaxLines(2);
            FrameLayout.LayoutParams p=new FrameLayout.LayoutParams(dp(245),-2);p.gravity=Gravity.TOP|Gravity.START;
            p.topMargin=dp(47);p.setMarginStart(dp(78));p.setMarginEnd(dp(12));frame.addView(subtitle,p);
        }
        Object list=field(frame,"mViewList");
        if(!(list instanceof java.util.List))throw new IllegalStateException("duo_legacy_view_list_missing");
        @SuppressWarnings("unchecked") java.util.List<View> views=(java.util.List<View>)list;
        views.add(icon);views.add(title);if(subtitle!=null)views.add(subtitle);
        contents.put(frame,new Content(icon,title,subtitle));
        return frame;
    }
    Object member(Object owner,String name){
        Content c=contents.get(owner);if(c==null)return null;
        switch(name){case "mDisplayIcon":return c.icon;case "mDisplayText":return c.title;case "mDisplaySecondText":return c.subtitle;default:return null;}
    }
    boolean owns(Object view){return contents.containsKey(view);}
    void visibility(Object owner,boolean show,boolean animate)throws Exception {
        Object list=field(owner,"mViewList");
        if(list instanceof java.util.List)for(Object child:(java.util.List<?>)list)
            if(child instanceof View)call(owner,"updateViewAlpha",child,animate,show);
    }
    private TextView text(int size){TextView v=new TextView(context);v.setTextSize(size);v.setTextColor(Color.WHITE);
        v.setMaxLines(1);v.setEllipsize(TextUtils.TruncateAt.END);return v;}
    private int dp(int value){return Math.round(value*context.getResources().getDisplayMetrics().density);}
}
