package ls.augment.com.hook;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.content.res.ColorStateList;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Button;
import ls.augment.com.IslandVisualSpec;
import static ls.augment.com.hook.SystemUiAdapter.field;

/** Shared presentation on verified OEM island views; the class name is kept for older adapters. */
final class Native12IslandStyle {
    // Host contracts stay native; content uses sp and the shared island roles.
    static final float COMPACT_HEIGHT=IslandVisualSpec.COMPACT_HEIGHT;
    static final int COMPACT_MIN=IslandVisualSpec.COMPACT_MIN,COMPACT_MAX=IslandVisualSpec.COMPACT_MAX,COMPACT_ICON=IslandVisualSpec.COMPACT_ICON,SMALL_ICON=IslandVisualSpec.SMALL_ICON;
    static final int PANEL_WIDTH=IslandVisualSpec.PANEL_WIDTH,PANEL_RADIUS=IslandVisualSpec.PANEL_RADIUS,PANEL_PADDING=IslandVisualSpec.PANEL_PADDING,PANEL_ICON=IslandVisualSpec.PANEL_ICON;
    static final int TITLE=IslandVisualSpec.TITLE,DETAIL=IslandVisualSpec.DETAIL,COMPACT_TEXT=IslandVisualSpec.COMPACT_TEXT,TEXT_GAP=IslandVisualSpec.TEXT_GAP;
    static int dp(Context context,float value){return Math.round(value*context.getResources().getDisplayMetrics().density);}
    static boolean night(Context context){return (context.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK)==Configuration.UI_MODE_NIGHT_YES;}
    static int foreground(Context context){return color(context,"dynamic_island_panel_text_color",IslandVisualSpec.foreground(night(context)));}
    static int secondary(Context context){return color(context,"dynamic_island_text_color",IslandVisualSpec.secondary(night(context)));}
    private static int color(Context context,String name,int fallback){
        int id=context.getResources().getIdentifier(name,"color","com.android.systemui");return id==0?fallback:context.getColor(id);
    }
    static int background(Context context){return IslandVisualSpec.background(night(context));}
    static GradientDrawable background(Context context,boolean panel){
        GradientDrawable shape=new GradientDrawable();shape.setColor(background(context));
        shape.setCornerRadius(dp(context,panel?PANEL_RADIUS:COMPACT_HEIGHT/2));return shape;
    }
    static void text(TextView view,int size,boolean primary){
        Context context=view.getContext();view.setTextSize(TypedValue.COMPLEX_UNIT_SP,size);
        view.setTypeface(Typeface.create("sans-serif",primary?Typeface.BOLD:Typeface.NORMAL));
        view.setTextColor(primary?foreground(context):secondary(context));view.setIncludeFontPadding(false);
    }
    static void compact(View view){
        if(view==null)return;
        Object label=field(view,"mDisplayText"),icon=field(view,"mDisplayIcon");
        if(label instanceof TextView)text((TextView)label,COMPACT_TEXT,false);
        if(icon instanceof ImageView){
            View image=(View)icon;ViewGroup.LayoutParams params=image.getLayoutParams();
            if(params!=null){params.width=params.height=dp(view.getContext(),COMPACT_ICON);image.setLayoutParams(params);}
        }
    }
    static void panel(View panel){
        if(panel==null)return;
        int padding=dp(panel.getContext(),PANEL_PADDING);panel.setPadding(padding,padding,padding,padding);
        Object title=field(panel,"mDisplayText"),detail=field(panel,"mDisplaySecondText");
        if(title instanceof TextView)text((TextView)title,TITLE,true);
        if(detail instanceof TextView)text((TextView)detail,DETAIL,false);
    }
    static void action(Button button){
        Context context=button.getContext();
        RippleDrawable ripple=button.getBackground() instanceof RippleDrawable?(RippleDrawable)button.getBackground():null;
        if(ripple!=null&&!(ripple.getDrawable(0) instanceof GradientDrawable))ripple=null;
        GradientDrawable shape=ripple!=null?(GradientDrawable)ripple.getDrawable(0):new GradientDrawable();
        shape.setColor(color(context,"dynamic_island_btn_bg_color",night(context)?0x26ffffff:0x14000000));
        shape.setCornerRadius(dp(context,24));
        ColorStateList pressed=ColorStateList.valueOf(night(context)?0x28ffffff:0x18000000);
        if(ripple==null){ripple=new RippleDrawable(pressed,shape,null);button.setBackground(ripple);}else ripple.setColor(pressed);
        button.setBackgroundTintList(null);button.setTextColor(foreground(context));
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP,13);button.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));
        button.setIncludeFontPadding(false);button.setPadding(dp(context,16),dp(context,8),dp(context,16),dp(context,8));
        button.setMinHeight(dp(context,IslandVisualSpec.ACTION_HEIGHT));button.setMinimumHeight(dp(context,IslandVisualSpec.ACTION_HEIGHT));
        button.setMinWidth(dp(context,48));button.setMinimumWidth(dp(context,48));
    }
    private Native12IslandStyle(){ }
}
