package ls.augment.com.hook;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import ls.augment.com.IslandVisualSpec;
import static ls.augment.com.hook.SystemUiAdapter.field;

/** RedMagic 12 native resource geometry, also used by verified ordinary-window content. */
final class Native12IslandStyle {
    // Extracted from SystemUI 12.0.15MR1 (SHA-256 5f03ef44…11760781).
    // Content roles use sp so the same layout remains readable with the user's font scale.
    static final float COMPACT_HEIGHT=IslandVisualSpec.COMPACT_HEIGHT;
    static final int COMPACT_MIN=IslandVisualSpec.COMPACT_MIN,COMPACT_MAX=IslandVisualSpec.COMPACT_MAX,COMPACT_ICON=IslandVisualSpec.COMPACT_ICON,SMALL_ICON=IslandVisualSpec.SMALL_ICON;
    static final int PANEL_WIDTH=IslandVisualSpec.PANEL_WIDTH,PANEL_RADIUS=IslandVisualSpec.PANEL_RADIUS,PANEL_PADDING=IslandVisualSpec.PANEL_PADDING,PANEL_ICON=IslandVisualSpec.PANEL_ICON;
    static final int TITLE=IslandVisualSpec.TITLE,DETAIL=IslandVisualSpec.DETAIL,COMPACT_TEXT=IslandVisualSpec.COMPACT_TEXT,TEXT_GAP=IslandVisualSpec.TEXT_GAP;
    static int dp(Context context,float value){return Math.round(value*context.getResources().getDisplayMetrics().density);}
    static boolean night(Context context){return (context.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK)==Configuration.UI_MODE_NIGHT_YES;}
    static int foreground(Context context){return IslandVisualSpec.foreground(night(context));}
    static int secondary(Context context){return IslandVisualSpec.secondary(night(context));}
    static int background(Context context){return IslandVisualSpec.background(night(context));}
    static GradientDrawable background(Context context,boolean panel){
        GradientDrawable shape=new GradientDrawable();shape.setColor(background(context));
        shape.setCornerRadius(dp(context,panel?PANEL_RADIUS:COMPACT_HEIGHT/2));return shape;
    }
    static void text(TextView view,int size,boolean primary){
        Context context=view.getContext();view.setTextSize(TypedValue.COMPLEX_UNIT_SP,size);
        view.setTypeface(Typeface.create(Typeface.create("ZTEZhengYuan-FES",Typeface.NORMAL),600,false));
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
    private Native12IslandStyle(){ }
}
