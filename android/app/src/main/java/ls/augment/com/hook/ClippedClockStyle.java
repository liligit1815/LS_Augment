package ls.augment.com.hook;

import android.graphics.Typeface;
import android.text.Layout;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextClock;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import org.json.JSONObject;
import org.json.JSONException;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Scale the OEM diagonal composition as a whole, including its masks. */
final class ClippedClockStyle {
    final TextPaint paint=new TextPaint();
    WeakReference<View> group=new WeakReference<>(null);
    WeakReference<TextClock> secondsView=new WeakReference<>(null);
    float originalX=1,originalY=1;

    void fitTypeface(TextView view,float size,Typeface nativeFont,float nativeScale,Typeface font){
        if(view==null)return;
        paint.set(view.getPaint());paint.setTextSize(size);paint.setTypeface(nativeFont);paint.setTextScaleX(nativeScale);
        float nativeWidth=Layout.getDesiredWidth(view.getText(),paint);
        paint.setTypeface(font==null?nativeFont:font);float width=Layout.getDesiredWidth(view.getText(),paint);
        // Native clipping depends on the original two-digit advance. Preserve
        // that advance while changing the glyphs, and transform the whole group.
        float scale=width>0?nativeScale*nativeWidth/width:nativeScale;
        Typeface wanted=font==null?nativeFont:font;
        if(view.getTypeface()!=wanted)view.setTypeface(wanted);
        if(Math.abs(view.getTextSize()-size)>.01f)view.setTextSize(TypedValue.COMPLEX_UNIT_PX,size);
        if(Math.abs(view.getTextScaleX()-scale)>.001f)view.setTextScaleX(scale);
    }

    void apply(View owner,TextView minute,TextView period,boolean seconds,float scale,Typeface font){
        View candidate=minute;
        while(candidate!=null){
            String id="";try{id=candidate.getResources().getResourceEntryName(candidate.getId());}catch(Exception ignored){ }
            if(id.equals("clock_time_layout")){candidate=candidate.getParent() instanceof View?(View)candidate.getParent():null;break;}
            candidate=candidate.getParent() instanceof View?(View)candidate.getParent():null;
        }
        if(candidate!=null){
            if(group.get()!=candidate){restoreGroup();group=new WeakReference<>(candidate);originalX=candidate.getScaleX();originalY=candidate.getScaleY();}
            // The widgets occupy the next native row; enlarging beyond the
            // allocated composition would draw over them.
            float fitted=Math.min(1,scale);
            if(Math.abs(candidate.getScaleX()-originalX*fitted)>.001f)candidate.setScaleX(originalX*fitted);
            if(Math.abs(candidate.getScaleY()-originalY*fitted)>.001f)candidate.setScaleY(originalY*fitted);
        }
        if(!seconds){removeSeconds();return;}
        TextView reference=period;
        if(reference==null){Object raw=field(owner,"mDateView");if(raw instanceof TextView)reference=(TextView)raw;}
        if(reference==null||!(reference.getParent() instanceof LinearLayout))return;
        LinearLayout parent=(LinearLayout)reference.getParent();TextClock text=secondsView.get();
        if(text==null||text.getParent()!=parent){
            removeSeconds();text=new TextClock(owner.getContext());text.setSingleLine(true);text.setIncludeFontPadding(false);
            text.setFormat24Hour("'·' ss");text.setFormat12Hour("'·' ss");
            LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,ViewGroup.LayoutParams.WRAP_CONTENT);
            params.gravity=Gravity.CENTER_VERTICAL;params.setMarginStart(Math.round(6*owner.getResources().getDisplayMetrics().density));
            parent.addView(text,params);secondsView=new WeakReference<>(text);
        }
        text.setTextColor(reference.getCurrentTextColor());
        Typeface wanted=font==null?reference.getTypeface():font;if(text.getTypeface()!=wanted)text.setTypeface(wanted);
        if(Math.abs(text.getTextSize()-reference.getTextSize())>.01f)text.setTextSize(TypedValue.COMPLEX_UNIT_PX,reference.getTextSize());
    }

    void report(JSONObject data)throws JSONException {
        View view=group.get();if(view!=null)data.put("compositionScale",view.getScaleX());
        TextClock text=secondsView.get();if(text!=null&&text.getLayout()!=null){
            int ellipsis=0;for(int i=0;i<text.getLayout().getLineCount();i++)ellipsis+=text.getLayout().getEllipsisCount(i);
            data.put("secondsText",text.getText().toString());data.put("secondsEllipsis",ellipsis);
        }
    }
    void restore(){restoreGroup();removeSeconds();}
    private void restoreGroup(){View view=group.get();if(view!=null){view.setScaleX(originalX);view.setScaleY(originalY);}group.clear();}
    private void removeSeconds(){TextClock text=secondsView.get();if(text!=null&&text.getParent() instanceof ViewGroup)((ViewGroup)text.getParent()).removeView(text);secondsView.clear();}
}
