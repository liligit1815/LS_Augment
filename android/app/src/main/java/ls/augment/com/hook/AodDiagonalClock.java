package ls.augment.com.hook;

import android.graphics.Typeface;
import android.text.Layout;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.TextClock;
import java.lang.ref.WeakReference;
import java.util.Calendar;
import java.util.Map;
import java.util.TimeZone;
import java.util.WeakHashMap;
import ls.augment.com.SystemUiPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Preserve the OEM diagonal masks and place added information beside the date. */
final class AodDiagonalClock {
    private static final Map<View,AodDiagonalClock> STATES=new WeakHashMap<>();
    private final WeakReference<View> owner;
    private WeakReference<View> group=new WeakReference<>(null);
    private WeakReference<TextView> extra=new WeakReference<>(null);
    private float originalX=1,originalY=1;private int nativeHeight,nativeCompositionHeight,heightLimit;private String lastText="",lastFit="";
    final ClippedClockStyle typeface=new ClippedClockStyle();
    private AodDiagonalClock(View view){owner=new WeakReference<>(view);}
    static AodDiagonalClock find(View child){
        for(View v=child;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null){
            if(v.getClass().getSimpleName().equals("NubiaAodNumClockClipLayout")||v.getClass().getSimpleName().equals("NubiaAodNumClockVerLayout")){
                AodDiagonalClock state=STATES.get(v);if(state==null){state=new AodDiagonalClock(v);STATES.put(v,state);}return state;
            }
        }return null;
    }
    private View named(View root,String name){int id=root.getResources().getIdentifier(name,"id","com.android.systemui");return id==0?null:root.findViewById(id);}
    void apply(TextView clock,boolean seconds,boolean period,float scale,float periodScale,Typeface font,float nativeSize)throws ReflectiveOperationException{
        View root=owner.get();if(root==null)return;
        View composition=group.get();
        if(composition==null){View time=named(root,"clock_time_layout");if(time==null||!(time.getParent() instanceof View))return;
            composition=root.getClass().getSimpleName().equals("NubiaAodNumClockVerLayout")?time:(View)time.getParent();group=new WeakReference<>(composition);originalX=composition.getScaleX();originalY=composition.getScaleY();nativeHeight=root.getHeight();nativeCompositionHeight=composition.getHeight();}
        float fitted=Math.min(1,scale);composition.setScaleX(originalX*fitted);composition.setScaleY(originalY*fitted);
        if(!seconds&&!period){removeExtra();return;}
        View raw=named(root,"keyguard_clock_date");if(!(raw instanceof LinearLayout))return;LinearLayout parent=(LinearLayout)raw;
        TextView text=extra.get();
        if(text==null||text.getParent()!=parent){removeExtra();text=new TextClock(root.getContext());text.setTag("ls_augment_aod_diagonal_extra");text.setSingleLine(true);text.setIncludeFontPadding(false);
            LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,ViewGroup.LayoutParams.WRAP_CONTENT);params.gravity=Gravity.CENTER_HORIZONTAL;
            parent.addView(text,Math.min(1,parent.getChildCount()),params);extra=new WeakReference<>(text);}
        TextClock ticker=(TextClock)text;String format=seconds?"'·' ss":" ";
        if(!format.contentEquals(ticker.getFormat24Hour()==null?"":ticker.getFormat24Hour()))ticker.setFormat24Hour(format);
        if(!format.contentEquals(ticker.getFormat12Hour()==null?"":ticker.getFormat12Hour()))ticker.setFormat12Hour(format);
        Object zone=call(clock,"getTimeZone");Calendar now=zone instanceof String?Calendar.getInstance(TimeZone.getTimeZone((String)zone)):Calendar.getInstance();
        String prefix=seconds?String.format(java.util.Locale.ROOT,"· %02d",now.get(Calendar.SECOND)):"";
        String label=period?SystemUiPolicy.period(now.get(Calendar.HOUR_OF_DAY)):"";String value=prefix+(seconds&&period?" ":"")+label;
        SpannableString styled=new SpannableString(value);int labelStart=value.length()-label.length();
        if(labelStart>0)styled.setSpan(new RelativeSizeSpan(.5f),0,labelStart,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if(period)styled.setSpan(new RelativeSizeSpan(periodScale),labelStart,value.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        String signature=value+'|'+periodScale;boolean hasSpans=text.getText() instanceof Spanned&&((Spanned)text.getText()).getSpans(0,text.length(),RelativeSizeSpan.class).length>0;
        if(!signature.equals(lastText)||!value.contentEquals(text.getText())||!hasSpans){text.setText(styled);lastText=signature;}
        text.setTextColor(clock.getCurrentTextColor());Typeface wanted=font==null?clock.getTypeface():font;if(text.getTypeface()!=wanted)text.setTypeface(wanted);
        // The OEM root is capped by AT_MOST even when its children overflow.
        // Keep the pre-insertion height; subtracting our row from a capped root
        // would overestimate free space and cause a relayout loop every second.
        int contentHeight=nativeHeight+composition.getHeight()-nativeCompositionHeight;
        int maxHeight=200;for(View v=root;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null){ViewGroup.LayoutParams p=v.getLayoutParams();if(p!=null&&p.height>0){maxHeight=Math.max(40,p.height-contentHeight-8);break;}}
        int maxWidth=root.getResources().getDisplayMetrics().widthPixels-Math.round(16*root.getResources().getDisplayMetrics().density);
        String fit=signature+'|'+nativeSize+'|'+fitted+'|'+maxHeight+'|'+maxWidth+'|'+System.identityHashCode(wanted);heightLimit=maxHeight;
        if(fit.equals(lastFit))return;
        float size=nativeSize*fitted;
        // Measure the actual TextClock: its fallback Chinese font line spacing
        // can be taller than a standalone StaticLayout predicts.
        for(int i=0;i<4;i++){text.setTextSize(TypedValue.COMPLEX_UNIT_PX,size);text.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            float ratio=Math.min(1,Math.min((float)maxWidth/Math.max(1,text.getMeasuredWidth()),(float)maxHeight/Math.max(1,text.getMeasuredHeight())));if(ratio>=1)break;size*=ratio;}
        text.setTextSize(TypedValue.COMPLEX_UNIT_PX,size);lastFit=fit;
    }
    void report(org.json.JSONObject data)throws org.json.JSONException{View v=group.get();if(v!=null)data.put("compositionScale",v.getScaleX());TextView t=extra.get();if(t!=null&&t.getLayout()!=null){data.put("extraText",t.getText());data.put("extraSize",t.getTextSize());data.put("extraWidth",t.getWidth());data.put("extraHeight",t.getHeight());data.put("extraHeightLimit",heightLimit);data.put("extraDesiredWidth",Layout.getDesiredWidth(t.getText(),t.getPaint()));data.put("extraEllipsis",t.getLayout().getEllipsisCount(0));
        android.graphics.Matrix matrix=new android.graphics.Matrix();t.transformMatrixToGlobal(matrix);android.graphics.RectF projected=new android.graphics.RectF(0,0,t.getWidth(),t.getHeight());matrix.mapRect(projected);android.graphics.Rect visible=new android.graphics.Rect();t.getGlobalVisibleRect(visible);data.put("extraProjectedBounds",projected.toShortString());data.put("extraVisibleBounds",visible.toShortString());data.put("extraAncestorClipped",visible.width()+1.5f<projected.width()||visible.height()+1.5f<projected.height());}}
    void restore(){View v=group.get();if(v!=null){v.setScaleX(originalX);v.setScaleY(originalY);}group.clear();nativeHeight=0;removeExtra();}
    private void removeExtra(){TextView t=extra.get();if(t!=null&&t.getParent() instanceof ViewGroup)((ViewGroup)t.getParent()).removeView(t);extra.clear();lastText="";lastFit="";}
}
