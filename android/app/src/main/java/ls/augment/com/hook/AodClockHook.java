package ls.augment.com.hook;

import android.graphics.Typeface;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.text.Layout;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.style.RelativeSizeSpan;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.TimeZone;
import java.util.WeakHashMap;
import ls.augment.com.BuildConfig;
import ls.augment.com.ManagedFont;
import ls.augment.com.SystemUiPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Apply to the final native clock format, after the OEM has configured date views. */
final class AodClockHook {
    private static final String P="ls_augment_rm_aod_";
    private static final Map<TextView,State> STATES=new WeakHashMap<>();
    private static final Map<View,Integer> NATIVE_OVERLAPS=new WeakHashMap<>();
    private AodClockHook(){ }
    static void changed(Object owner){
        if(!(owner instanceof TextView))return;TextView view=(TextView)owner;
        boolean aod=false;for(View v=view;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null){String name=v.getClass().getSimpleName();if(name.contains("Aod")||name.contains("Doze")){aod=true;break;}}
        if(!aod)return;State state=STATES.get(view);
        if(state==null){state=new State(view);STATES.put(view,state);view.addOnAttachStateChangeListener(state);if(view.isAttachedToWindow())state.attach();}
        if(!state.editing){String value=view.getText().toString();if(!value.equals(state.appliedText))state.nativeText=value;state.invalidate();}
    }
    private static boolean timeFormat(Object raw){
        return formatContains(raw,"HhKkm");
    }
    private static boolean formatContains(Object raw,String tokens){
        if(!(raw instanceof CharSequence))return false;String f=raw.toString();boolean quoted=false;
        for(int i=0;i<f.length();i++){char c=f.charAt(i);if(c=='\''){if(i+1<f.length()&&f.charAt(i+1)=='\''){i++;continue;}quoted=!quoted;}
            else if(!quoted&&tokens.indexOf(c)>=0)return true;}
        return false;
    }
    private static final class State implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener,ViewTreeObserver.OnDrawListener {
        final WeakReference<TextView> reference;final Runnable refresh=this::invalidate;final TextPaint paint=new TextPaint();
        CharSequence original24,original12,applied24,applied12;
        boolean format24Changed,format12Changed,attached,editing,styled;
        Typeface nativeFont,appliedFont,selectedFont;float nativeSize,appliedSize,nativeScaleX,appliedScaleX;String selectedPath="",nativeText="",appliedText="",textStyle="",lastReport="";
        AodDiagonalClock diagonal;
        WeakReference<View> overlapView=new WeakReference<>(null);int nativeOverlap;
        State(TextView view){reference=new WeakReference<>(view);nativeFont=view.getTypeface();nativeSize=view.getTextSize();nativeScaleX=view.getTextScaleX();nativeText=view.getText().toString();diagonal=AodDiagonalClock.find(view);}
        void attach(){TextView view=reference.get();if(view==null||attached)return;attached=true;view.getViewTreeObserver().addOnPreDrawListener(this);if(BuildConfig.DEBUG)view.getViewTreeObserver().addOnDrawListener(this);FeatureSettings.addSnapshotListener(view.getContext(),refresh);invalidate();}
        void detach(){attached=false;FeatureSettings.removeSnapshotListener(refresh);TextView view=reference.get();if(view!=null&&view.getViewTreeObserver().isAlive()){view.getViewTreeObserver().removeOnPreDrawListener(this);if(BuildConfig.DEBUG)view.getViewTreeObserver().removeOnDrawListener(this);}}
        void invalidate(){TextView view=reference.get();if(attached&&view!=null&&view.isShown())view.invalidate();}
        void nativeStyle(TextView view){
            if(!styled||view.getTypeface()!=appliedFont)nativeFont=view.getTypeface();
            if(!styled||Math.abs(view.getTextSize()-appliedSize)>.01f)nativeSize=view.getTextSize();
            if(!styled||Math.abs(view.getTextScaleX()-appliedScaleX)>.001f)nativeScaleX=view.getTextScaleX();
        }
        void formats(TextView view)throws ReflectiveOperationException{
            CharSequence f24=(CharSequence)call(view,"getFormat24Hour"),f12=(CharSequence)call(view,"getFormat12Hour");
            if(!format24Changed||!Objects.equals(f24,applied24)){original24=f24;format24Changed=false;}
            if(!format12Changed||!Objects.equals(f12,applied12)){original12=f12;format12Changed=false;}
        }
        void restoreFormats(TextView view)throws ReflectiveOperationException{
            boolean changed=false;
            if(format24Changed){format24Changed=false;call(view,"setFormat24Hour",original24);changed=true;}
            if(format12Changed){format12Changed=false;call(view,"setFormat12Hour",original12);changed=true;}
            if(changed)nativeText=view.getText().toString();
        }
        void restoreStyle(TextView view){if(styled){view.setTypeface(nativeFont);view.setTextSize(TypedValue.COMPLEX_UNIT_PX,nativeSize);view.setTextScaleX(nativeScaleX);styled=false;}fitOverlap(view,1);if(view.getText().toString().equals(appliedText)&&!nativeText.equals(appliedText))view.setText(nativeText);appliedText="";}
        View findOverlap(TextView view){
            View adjusted=overlapView.get();
            if(adjusted==null){View candidate=view;for(int i=0;i<2&&candidate!=null;i++){
                ViewGroup.LayoutParams p=candidate.getLayoutParams();if(p instanceof ViewGroup.MarginLayoutParams&&(((ViewGroup.MarginLayoutParams)p).topMargin<0||NATIVE_OVERLAPS.containsKey(candidate))){adjusted=candidate;Integer saved=NATIVE_OVERLAPS.get(candidate);nativeOverlap=saved==null?((ViewGroup.MarginLayoutParams)p).topMargin:saved;NATIVE_OVERLAPS.put(candidate,nativeOverlap);overlapView=new WeakReference<>(candidate);break;}
                candidate=candidate.getParent() instanceof View?(View)candidate.getParent():null;
            }}
            return adjusted;
        }
        void fitOverlap(TextView view,float scale){
            View adjusted=findOverlap(view);
            if(adjusted!=null&&adjusted.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)adjusted.getLayoutParams();int wanted=Math.round(nativeOverlap*Math.min(1,scale));if(p.topMargin!=wanted){p.topMargin=wanted;adjusted.setLayoutParams(p);}}
        }
        boolean fitGroup(TextView view,float scale)throws ReflectiveOperationException{
            View owner=AodClockGroup.owner(view);if(owner==null)return false;
            Map<TextView,Float> bases=new HashMap<>();Map<View,Integer> overlaps=new HashMap<>();
            for(Map.Entry<TextView,State> entry:STATES.entrySet()){TextView t=entry.getKey();State s=entry.getValue();if(t==null||!t.isShown()||!AodClockGroup.contains(owner,t)||!timeFormat(field(t,"mFormat")))continue;
                if(!s.editing)s.nativeStyle(t);bases.put(t,s.nativeSize);View adjusted=s.findOverlap(t);if(adjusted!=null)overlaps.put(adjusted,s.nativeOverlap);}
            if(bases.size()<2)return false;View root=AodClockGroup.commonParent(bases.keySet());if(root==null)return false;
            int height=availableSpace(root,false)+Math.min(0,margin(root,false));
            float fitted=AodClockGroup.fit(root,bases,overlaps,availableSpace(root,true),height,scale);
            for(TextView t:bases.keySet()){State s=STATES.get(t);float target=bases.get(t)*fitted;if(Math.abs(t.getTextSize()-target)>.01f)t.setTextSize(TypedValue.COMPLEX_UNIT_PX,target);s.fitOverlap(t,fitted);s.styled=true;s.appliedFont=t.getTypeface();s.appliedSize=target;s.appliedScaleX=t.getTextScaleX();}
            return true;
        }
        void render()throws ReflectiveOperationException{
            TextView view=reference.get();if(view==null||editing||!attached||!view.isShown()||view.getWidth()==0||view.getHeight()==0)return;editing=true;
            try{
                nativeStyle(view);formats(view);Object active=field(view,"mFormat");
                if(diagonal==null)diagonal=AodDiagonalClock.find(view);
                // A date TextClock may leave the unused 12/24-hour format null.
                // Only its selected format determines whether this is a clock.
                if(!timeFormat(active)){restoreFormats(view);restoreStyle(view);return;}
                boolean seconds=FeatureSettings.enabled(view.getContext(),P+"seconds"),period=FeatureSettings.enabled(view.getContext(),P+"period")&&formatContains(active,"m");
                String font=FeatureSettings.text(view.getContext(),P+"clock_font","");float scale=FeatureSettings.decimal(view.getContext(),P+"clock_scale",1,.5f,2);
                boolean diagonalPeriod=diagonal!=null&&FeatureSettings.enabled(view.getContext(),P+"period");
                if(!seconds&&!period&&!diagonalPeriod&&font.isEmpty()&&scale==1){restoreFormats(view);restoreStyle(view);if(diagonal!=null)diagonal.restore();return;}
                if(!font.equals(selectedPath)){selectedPath=font;selectedFont=null;}
                if(selectedFont==null&&!font.isEmpty())selectedFont=ManagedFont.loadAsync(view.getContext(),font,refresh);
                if(diagonal!=null){restoreFormats(view);diagonal.typeface.fitTypeface(view,nativeSize,nativeFont,nativeScaleX,selectedFont);
                    if("clock_minute_view".equals(view.getResources().getResourceEntryName(view.getId())))diagonal.apply(view,seconds,diagonalPeriod,scale,FeatureSettings.decimal(view.getContext(),P+"period_scale",.6f,.3f,1.5f),selectedFont,nativeSize);
                    styled=true;appliedFont=view.getTypeface();appliedSize=view.getTextSize();appliedScaleX=view.getTextScaleX();return;}
                if(seconds){
                    String f24=SystemUiPolicy.withSeconds(original24==null?active.toString():original24.toString()),f12=SystemUiPolicy.withSeconds(original12==null?active.toString():original12.toString());
                    if(!Objects.equals(call(view,"getFormat24Hour"),f24)){applied24=f24;format24Changed=true;call(view,"setFormat24Hour",f24);nativeText=view.getText().toString();}
                    if(!Objects.equals(call(view,"getFormat12Hour"),f12)){applied12=f12;format12Changed=true;call(view,"setFormat12Hour",f12);nativeText=view.getText().toString();}
                }else restoreFormats(view);
                view.setTypeface(selectedFont==null?nativeFont:selectedFont);
                String value=nativeText;SpannableString text;float periodScale=FeatureSettings.decimal(view.getContext(),P+"period_scale",.6f,.3f,1.5f);
                if(period){
                    Object zone=call(view,"getTimeZone");Calendar now=zone instanceof String?Calendar.getInstance(TimeZone.getTimeZone((String)zone)):Calendar.getInstance();
                    String label=SystemUiPolicy.period(now.get(Calendar.HOUR_OF_DAY));value+=" "+label;text=new SpannableString(value);
                    text.setSpan(new RelativeSizeSpan(periodScale),value.length()-label.length(),value.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }else text=new SpannableString(value);
                String signature=value+'|'+periodScale;
                if(!value.contentEquals(view.getText())||!signature.equals(textStyle))view.setText(text);appliedText=value;textStyle=signature;
                if(fitGroup(view,scale))return;
                float target=nativeSize*scale;int space=availableSpace(view,true),height=availableSpace(view,false);paint.set(view.getPaint());
                for(int i=0;i<4;i++){paint.setTextSize(target);float width=Layout.getDesiredWidth(text,paint);float ratio=width>space&&space>0?space/width:1;
                    int drawnHeight=textHeight(view,text,paint);if(drawnHeight>height&&height>0)ratio=Math.min(ratio,(float)height/drawnHeight);if(ratio>=1)break;target*=ratio;}
                view.setTextSize(TypedValue.COMPLEX_UNIT_PX,target);fitOverlap(view,target/nativeSize);styled=true;appliedFont=view.getTypeface();appliedSize=target;appliedScaleX=view.getTextScaleX();
            }finally{editing=false;}
        }
        int availableSpace(View view,boolean horizontal){
            int screen=horizontal?view.getResources().getDisplayMetrics().widthPixels-Math.round(16*view.getResources().getDisplayMetrics().density):view.getResources().getDisplayMetrics().heightPixels;
            int available=screen,used=0;View child=view;
            for(int depth=0;depth<8&&child.getParent() instanceof ViewGroup;depth++){
                ViewGroup parent=(ViewGroup)child.getParent();ViewGroup.LayoutParams pp=parent.getLayoutParams();
                used+=margin(child,horizontal)+(horizontal?parent.getPaddingLeft()+parent.getPaddingRight():parent.getPaddingTop()+parent.getPaddingBottom());
                if(orientation(parent)==(horizontal?LinearLayout.HORIZONTAL:LinearLayout.VERTICAL)){
                    for(int i=0;i<parent.getChildCount();i++){View sibling=parent.getChildAt(i);if(sibling!=child&&sibling.getVisibility()!=View.GONE)used+=naturalSize(sibling,0,horizontal)+margin(sibling,horizontal);}
                }
                int fixed=pp==null?0:horizontal?pp.width:pp.height;if(fixed>0)available=Math.min(available,fixed-used);child=parent;
            }
            int padding=view instanceof TextView?(horizontal?((TextView)view).getCompoundPaddingLeft()+((TextView)view).getCompoundPaddingRight():((TextView)view).getCompoundPaddingTop()+((TextView)view).getCompoundPaddingBottom()):0;
            return Math.min(available,screen-used)-padding-3;
        }
        int orientation(ViewGroup group){if(group instanceof LinearLayout)return ((LinearLayout)group).getOrientation();try{return (Integer)call(group,"getOrientation");}catch(ReflectiveOperationException ignored){return -1;}}
        int margin(View view,boolean horizontal){ViewGroup.LayoutParams p=view.getLayoutParams();if(!(p instanceof ViewGroup.MarginLayoutParams))return 0;ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)p;return horizontal?m.leftMargin+m.rightMargin:m.topMargin+m.bottomMargin;}
        int textHeight(TextView view,CharSequence text,TextPaint paint){StaticLayout.Builder builder=StaticLayout.Builder.obtain(text,0,text.length(),paint,Math.max(1,(int)Math.ceil(Layout.getDesiredWidth(text,paint)))).setIncludePad(view.getIncludeFontPadding()).setLineSpacing(view.getLineSpacingExtra(),view.getLineSpacingMultiplier());if(android.os.Build.VERSION.SDK_INT>=28)builder.setUseLineSpacingFromFallbacks(view.isFallbackLineSpacing());return builder.build().getHeight();}
        int naturalSize(View view,int depth,boolean horizontal){
            ViewGroup.LayoutParams p=view.getLayoutParams();int fixed=p==null?0:horizontal?p.width:p.height;if(fixed>0)return fixed;
            if(view instanceof TextView){TextView t=(TextView)view;return horizontal?(int)Math.ceil(Layout.getDesiredWidth(t.getText(),t.getPaint()))+t.getCompoundPaddingLeft()+t.getCompoundPaddingRight():textHeight(t,t.getText(),t.getPaint())+t.getCompoundPaddingTop()+t.getCompoundPaddingBottom();}
            if(view instanceof ViewGroup&&depth<8){ViewGroup group=(ViewGroup)view;boolean flow=orientation(group)==(horizontal?LinearLayout.HORIZONTAL:LinearLayout.VERTICAL);int size=0;
                for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(child.getVisibility()==View.GONE)continue;int value=naturalSize(child,depth+1,horizontal)+margin(child,horizontal);
                    if(group instanceof RelativeLayout)value+=horizontal?child.getLeft():child.getTop();size=flow?size+value:Math.max(size,value);}
                return Math.max(size+(horizontal?group.getPaddingLeft()+group.getPaddingRight():group.getPaddingTop()+group.getPaddingBottom()),horizontal?view.getMeasuredWidth():view.getMeasuredHeight());}
            return horizontal?Math.max(view.getMinimumWidth(),view.getMeasuredWidth()):Math.max(view.getMinimumHeight(),view.getMeasuredHeight());
        }
        void report(){
            if(!BuildConfig.DEBUG||!android.util.Log.isLoggable("LSA.ClockFit",android.util.Log.DEBUG))return;TextView v=reference.get();if(v==null||!v.isShown()||v.getLayout()==null||v.isLayoutRequested())return;
            try{Layout layout=v.getLayout();int ellipsis=0;for(int i=0;i<layout.getLineCount();i++)ellipsis+=layout.getEllipsisCount(i);
                org.json.JSONObject r=new org.json.JSONObject();r.put("style","AOD");r.put("id",v.getResources().getResourceEntryName(v.getId()));r.put("text",v.getText());r.put("format",String.valueOf(field(v,"mFormat")));r.put("size",v.getTextSize());r.put("width",v.getWidth());r.put("height",v.getHeight());r.put("desiredWidth",Layout.getDesiredWidth(v.getText(),v.getPaint()));r.put("desiredHeight",layout.getHeight());r.put("ellipsis",ellipsis);r.put("padding",v.getCompoundPaddingLeft()+v.getCompoundPaddingRight());r.put("paddingVertical",v.getCompoundPaddingTop()+v.getCompoundPaddingBottom());r.put("availableWidth",availableSpace(v,true));r.put("availableHeight",availableSpace(v,false));
                Matrix matrix=new Matrix();v.transformMatrixToGlobal(matrix);RectF projected=new RectF(0,0,v.getWidth(),v.getHeight());matrix.mapRect(projected);Rect visible=new Rect();v.getGlobalVisibleRect(visible);
                r.put("projectedBounds",projected.toShortString());r.put("visibleBounds",visible.toShortString());r.put("ancestorClipped",visible.width()+1.5f<projected.width()||visible.height()+1.5f<projected.height());r.put("nativeSize",nativeSize);r.put("instance",System.identityHashCode(v));r.put("timeZone",call(v,"getTimeZone"));
                if(diagonal!=null)diagonal.report(r);String value=r.toString();if(!value.equals(lastReport)){lastReport=value;r.put("uptimeMs",android.os.SystemClock.uptimeMillis());android.util.Log.d("LSA.ClockFit",r.toString());}
            }catch(Exception ignored){ }
        }
        @Override public boolean onPreDraw(){try{render();TextView v=reference.get();if(v!=null&&v.isShown())for(View parent=v;parent!=null;parent=parent.getParent() instanceof View?(View)parent.getParent():null)if(parent.isLayoutRequested())return false;}catch(ReflectiveOperationException error){TextView v=reference.get();if(v!=null)FeatureSettings.diagnostic(v.getContext(),P+"error",error.toString());}return true;}
        // A later pre-draw listener may cancel this frame to finish sizing its
        // sibling. Report only frames that actually reach the drawing phase.
        @Override public void onDraw(){report();}
        @Override public void onViewAttachedToWindow(View view){attach();}
        @Override public void onViewDetachedFromWindow(View view){detach();}
    }
}
