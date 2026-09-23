package ls.augment.com.hook;

import android.graphics.Typeface;
import android.text.Layout;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.Calendar;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.BuildConfig;
import ls.augment.com.ManagedFont;
import ls.augment.com.SystemUiPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Keeps native lockscreen clocks live and restores their native layout on disable. */
final class LockscreenClockHook {
    private static final String BASE="com.zte.mifavor.keyguard.settings.BaseLockScreenClock";
    private static final String P="ls_augment_rm_lock_clock_";
    private static final Map<View,State> STATES=new WeakHashMap<>();
    private LockscreenClockHook(){ }
    static int install(AugmentModule module,ClassLoader loader){
        int count=hook(module,loader,BASE,"onAttachedToWindow",0,null,(o,a,r)->{State s=state(o);if(s!=null)s.attach();return PASS;});
        count+=hook(module,loader,BASE,"onDetachedFromWindow",0,null,(o,a,r)->{State s=STATES.get(o);if(s!=null)s.detach();return PASS;});
        for(String name:new String[]{"LockScreenClockDefault","LockScreenClockArtword","LockScreenClockIncarnation","LockScreenClockHorizen","LockScreenClockVertical","LockScreenClockClip"}){
            String type="com.zte.mifavor.keyguard.settings."+name;
            count+=hook(module,loader,type,"refreshAmPm",0,(o,a,r)->{State s=STATES.get(o);if(s!=null)s.restoreFormats();return PASS;},(o,a,r)->{State s=state(o);if(s!=null){s.rememberFormats();s.apply();}return PASS;});
            count+=hook(module,loader,type,"refreshTime",0,null,(o,a,r)->{State s=state(o);if(s!=null)s.apply();return PASS;});
            count+=hook(module,loader,type,"refreshClockViewFont",0,(o,a,r)->{State s=STATES.get(o);if(s!=null)s.restoreSize();return PASS;},(o,a,r)->{State s=state(o);if(s!=null){s.rememberSize();s.apply();}return PASS;});
            if(name.equals("LockScreenClockClip")){
                int fontHooks=hook(module,loader,type,"updateClockFont",1,(o,a,r)->{State s=STATES.get(o);if(s!=null)s.restoreSize();return PASS;},(o,a,r)->{State s=state(o);if(s!=null){s.rememberSize();s.apply();}return PASS;});
                count+=fontHooks;
                if(fontHooks==0)count+=hook(module,loader,type,"refreshClockViewLayout",0,(o,a,r)->{State s=STATES.get(o);if(s!=null)s.restoreSize();return PASS;},(o,a,r)->{State s=state(o);if(s!=null){s.rememberSize();s.apply();}return PASS;});
            }
        }
        return count;
    }
    private static State state(Object owner){
        if(!(owner instanceof View))return null;
        State state=STATES.get(owner);
        if(state==null){state=new State((View)owner);STATES.put((View)owner,state);}
        return state;
    }
    private static final class State implements ViewTreeObserver.OnPreDrawListener {
        final WeakReference<View> owner;
        final Runnable listener=this::refresh;
        final Runnable fontReady=this::fontLoaded;
        final TextPaint paint=new TextPaint();
        ConfigSnapshot snapshot;
        String signature="";
        CharSequence format24,format12;
        Typeface typeface;
        Typeface selectedFont;
        Typeface appliedTypeface;
        float appliedSize;
        Typeface hourTypeface,appliedHourTypeface;
        float hourSize,appliedHourSize;
        Typeface maskTypeface,appliedMaskTypeface;
        float maskSize,appliedMaskSize;
        CharSequence maskFormat24,maskFormat12;
        boolean maskFormatsChanged;
        final ClippedClockStyle clipped=new ClippedClockStyle();
        float textScaleX=1,hourTextScaleX=1,maskTextScaleX=1;
        String selectedPath="";
        float size;
        Integer periodWidth;
        boolean attached,editing,refreshing,formatsChanged,sizeChanged;
        String lastLayout="";
        int layoutReports;
        State(View view){owner=new WeakReference<>(view);rememberSize();try{rememberFormats();}catch(ReflectiveOperationException ignored){}}
        TextView clock(){Object raw=field(owner.get(),"mClockView","mClockMinute","mClockMinuteView");return raw instanceof TextView?(TextView)raw:null;}
        TextView hour(){Object raw=field(owner.get(),"mClockHours","mClockHourView");return raw instanceof TextView?(TextView)raw:null;}
        TextView mask(){Object raw=field(owner.get(),"mClockMinuteMaskView");return raw instanceof TextView?(TextView)raw:null;}
        TextView period(){Object raw=field(owner.get(),"mAmPm");return raw instanceof TextView?(TextView)raw:null;}
        void attach(){
            View view=owner.get();if(view==null||attached)return;attached=true;
            view.getViewTreeObserver().addOnPreDrawListener(this);FeatureSettings.addSnapshotListener(view.getContext(),listener);view.post(listener);
        }
        void fontLoaded(){View view=owner.get();if(attached&&view!=null&&view.isShown())view.invalidate();}
        void detach(){
            attached=false;FeatureSettings.removeSnapshotListener(listener);View view=owner.get();
            if(view!=null&&view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);
        }
        void rememberSize(){
            TextView c=clock(),h=hour();if(c!=null){size=c.getTextSize();typeface=c.getTypeface();textScaleX=c.getTextScaleX();sizeChanged=false;}
            if(h!=null){hourSize=h.getTextSize();hourTypeface=h.getTypeface();hourTextScaleX=h.getTextScaleX();}
            TextView m=mask();if(m!=null){maskSize=m.getTextSize();maskTypeface=m.getTypeface();maskTextScaleX=m.getTextScaleX();}
        }
        void restoreSize(){
            TextView c=clock(),h=hour();if(sizeChanged){
                if(c!=null){c.setTypeface(typeface);c.setTextSize(TypedValue.COMPLEX_UNIT_PX,size);}
                if(h!=null){h.setTypeface(hourTypeface);h.setTextSize(TypedValue.COMPLEX_UNIT_PX,hourSize);}
                TextView m=mask();if(m!=null){m.setTypeface(maskTypeface);m.setTextSize(TypedValue.COMPLEX_UNIT_PX,maskSize);}
                if(m!=null){c.setTextScaleX(textScaleX);h.setTextScaleX(hourTextScaleX);m.setTextScaleX(maskTextScaleX);}
                sizeChanged=false;
            }
        }
        void observeNativeStyle(){
            TextView c=clock();if(c==null)return;
            if(!sizeChanged){rememberSize();return;}
            // The OEM can load its chosen font after initial attachment.
            // Only our own last applied values may be treated as overrides.
            if(c.getTypeface()!=appliedTypeface)typeface=c.getTypeface();
            if(Math.abs(c.getTextSize()-appliedSize)>.01f)size=c.getTextSize();
            TextView h=hour();if(h!=null){
                if(h.getTypeface()!=appliedHourTypeface)hourTypeface=h.getTypeface();
                if(Math.abs(h.getTextSize()-appliedHourSize)>.01f)hourSize=h.getTextSize();
            }
            TextView m=mask();if(m!=null){
                if(m.getTypeface()!=appliedMaskTypeface)maskTypeface=m.getTypeface();
                if(Math.abs(m.getTextSize()-appliedMaskSize)>.01f)maskSize=m.getTextSize();
            }
        }
        void rememberFormats() throws ReflectiveOperationException {
            TextView c=clock();if(c==null)return;
            format24=(CharSequence)call(c,"getFormat24Hour");format12=(CharSequence)call(c,"getFormat12Hour");formatsChanged=false;
            TextView m=mask();if(m!=null){maskFormat24=(CharSequence)call(m,"getFormat24Hour");maskFormat12=(CharSequence)call(m,"getFormat12Hour");maskFormatsChanged=false;}
        }
        void restoreFormats() throws ReflectiveOperationException {
            TextView c=clock();if(c!=null&&formatsChanged){formatsChanged=false;call(c,"setFormat24Hour",format24);call(c,"setFormat12Hour",format12);}
            TextView m=mask();if(m!=null&&maskFormatsChanged){maskFormatsChanged=false;call(m,"setFormat24Hour",maskFormat24);call(m,"setFormat12Hour",maskFormat12);}
        }
        void refresh(){
            View view=owner.get();if(view==null||refreshing)return;
            ConfigSnapshot next=FeatureSettings.snapshot(view.getContext());if(next==snapshot)return;snapshot=next;
            String value=next.get(P+"seconds")+'|'+next.get(P+"period")+'|'+next.get(P+"font")+'|'+next.get(P+"scale");
            if(value.equals(signature))return;signature=value;refreshing=true;layoutReports=0;lastLayout="";
            try{
                observeNativeStyle();
                restoreFormats();restoreSize();restorePeriodWidth();clipped.restore();
                // Native code owns 12/24-hour selection, locale and AM/PM visibility.
                call(view,"refreshAmPm");call(view,"refreshTime");
            }catch(ReflectiveOperationException error){FeatureSettings.diagnostic(view.getContext(),P+"error",error.toString());}
            finally{refreshing=false;}
            try{apply();}catch(ReflectiveOperationException error){FeatureSettings.diagnostic(view.getContext(),P+"error",error.toString());}
        }
        void apply() throws ReflectiveOperationException {
            TextView c=clock();View view=owner.get();if(view==null||editing||refreshing)return;
            editing=true;
            try{
                observeNativeStyle();
                boolean seconds=FeatureSettings.enabled(view.getContext(),P+"seconds");
                boolean showPeriod=FeatureSettings.enabled(view.getContext(),P+"period");
                String font=FeatureSettings.text(view.getContext(),P+"font","");
                float scale=FeatureSettings.decimal(view.getContext(),P+"scale",1,.5f,2);
                TextView p=period();
                if(showPeriod&&p!=null){
                    String text=SystemUiPolicy.period(Calendar.getInstance().get(Calendar.HOUR_OF_DAY));
                    if(!text.contentEquals(p.getText()))p.setText(text);
                    if(p.getVisibility()!=View.VISIBLE)p.setVisibility(View.VISIBLE);
                }
                // Image and dial clocks can still expose a native period label.
                if(c==null)return;
                if(seconds&&mask()==null){
                    String f24=SystemUiPolicy.withSeconds(format24==null?"HH:mm":format24.toString());
                    String f12=SystemUiPolicy.withSeconds(format12==null?"h:mm":format12.toString());
                    if(!f24.contentEquals(String.valueOf(call(c,"getFormat24Hour"))))call(c,"setFormat24Hour",f24);
                    if(!f12.contentEquals(String.valueOf(call(c,"getFormat12Hour"))))call(c,"setFormat12Hour",f12);
                    formatsChanged=true;
                    TextView m=mask();if(m!=null){
                        if(!f24.contentEquals(String.valueOf(call(m,"getFormat24Hour"))))call(m,"setFormat24Hour",f24);
                        if(!f12.contentEquals(String.valueOf(call(m,"getFormat12Hour"))))call(m,"setFormat12Hour",f12);
                        maskFormatsChanged=true;
                    }
                }else restoreFormats();
                boolean managed=seconds||showPeriod||!font.isEmpty()||scale!=1;
                if(!managed){restoreSize();restorePeriodWidth();clipped.restore();return;}
                if(!font.equals(selectedPath)){selectedPath=font;selectedFont=null;}
                if(selectedFont==null&&!font.isEmpty())selectedFont=ManagedFont.loadAsync(c.getContext(),font,fontReady);
                c.setTypeface(selectedFont==null?typeface:selectedFont);sizeChanged=true;
                TextView clippedMask=mask();
                if(clippedMask!=null){
                    TextView h=hour();
                    clipped.fitTypeface(c,size,typeface,textScaleX,selectedFont);
                    clipped.fitTypeface(h,hourSize,hourTypeface,hourTextScaleX,selectedFont);
                    clipped.fitTypeface(clippedMask,maskSize,maskTypeface,maskTextScaleX,selectedFont);
                    clipped.apply(view,c,p,seconds,scale,selectedFont);
                    appliedSize=c.getTextSize();appliedTypeface=c.getTypeface();
                    appliedHourSize=h.getTextSize();appliedHourTypeface=h.getTypeface();
                    appliedMaskSize=clippedMask.getTextSize();appliedMaskTypeface=clippedMask.getTypeface();
                    return;
                }
                float target=size*scale;
                ViewGroup parent=c.getParent() instanceof ViewGroup?(ViewGroup)c.getParent():null;
                if(parent!=null&&parent.getWidth()>0){
                    ViewGroup.LayoutParams clockParams=c.getLayoutParams();
                    // Split hour/minute layouts reserve their own fixed cells.
                    // Their period label can belong to the date column instead.
                    int available=clockParams!=null&&clockParams.width>0?clockParams.width:
                            parent.getWidth()-parent.getPaddingLeft()-parent.getPaddingRight()-Math.round(24*c.getResources().getDisplayMetrics().density);
                    if(p!=null&&p.getVisibility()==View.VISIBLE&&p.getParent()==parent){
                        int width=(int)Math.ceil(Layout.getDesiredWidth(p.getText(),p.getPaint()))+p.getPaddingLeft()+p.getPaddingRight();
                        ViewGroup.LayoutParams params=p.getLayoutParams();
                        if(showPeriod&&params!=null){if(periodWidth==null)periodWidth=params.width;if(params.width!=width){params.width=width;p.setLayoutParams(params);}}
                        available-=width;
                        if(params instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams margin=(ViewGroup.MarginLayoutParams)params;available-=margin.leftMargin+margin.rightMargin;}
                    }
                    target=fitWidth(c,target,available);
                    // Native layouts reserve a fixed clock row above widgets.
                    // Fit within that row instead of clipping a larger font.
                    ViewGroup.LayoutParams params=c.getLayoutParams();
                    if(params!=null&&params.height>0){
                        paint.setTextSize(target);android.graphics.Paint.FontMetrics metrics=paint.getFontMetrics();
                        float height=metrics.descent-metrics.ascent;
                        int availableHeight=params.height-c.getCompoundPaddingTop()-c.getCompoundPaddingBottom();
                        if(height>availableHeight&&availableHeight>0)target*=availableHeight/height;
                    }
                }
                if(Math.abs(c.getTextSize()-target)>.01f)c.setTextSize(TypedValue.COMPLEX_UNIT_PX,target);
                appliedSize=c.getTextSize();appliedTypeface=c.getTypeface();
                TextView h=hour();
                if(h!=null){
                    h.setTypeface(selectedFont==null?hourTypeface:selectedFont);float wanted=hourSize*scale;
                    ViewGroup.LayoutParams params=h.getLayoutParams();paint.set(h.getPaint());paint.setTextSize(wanted);
                    if(params!=null&&params.width>0)wanted=fitWidth(h,wanted,params.width);
                    if(params!=null&&params.height>0){paint.setTextSize(wanted);android.graphics.Paint.FontMetrics m=paint.getFontMetrics();float height=m.descent-m.ascent;int space=params.height-h.getCompoundPaddingTop()-h.getCompoundPaddingBottom();if(height>space&&space>0)wanted*=space/height;}
                    if(Math.abs(h.getTextSize()-wanted)>.01f)h.setTextSize(TypedValue.COMPLEX_UNIT_PX,wanted);
                    appliedHourSize=h.getTextSize();appliedHourTypeface=h.getTypeface();
                }
            }finally{editing=false;}
        }
        float fitWidth(TextView clock,float wanted,int available){
            int space=available-clock.getCompoundPaddingLeft()-clock.getCompoundPaddingRight()-2;
            if(space<=0)return wanted;
            paint.set(clock.getPaint());
            // OEM fonts round individual glyph advances. A single proportional
            // estimate can still exceed the cell by one pixel and ellipsize two
            // entire seconds digits; measure the resulting size again.
            for(int i=0;i<4;i++){
                paint.setTextSize(wanted);float width=Layout.getDesiredWidth(clock.getText(),paint);
                if(width<=space)break;wanted*=space/width;
            }
            return wanted;
        }
        void restorePeriodWidth(){
            TextView p=period();if(periodWidth!=null&&p!=null&&p.getLayoutParams()!=null){ViewGroup.LayoutParams params=p.getLayoutParams();params.width=periodWidth;p.setLayoutParams(params);periodWidth=null;}
        }
        void reportLayout(){
            if(!BuildConfig.DEBUG||!android.util.Log.isLoggable("LSA.ClockFit",android.util.Log.DEBUG)||layoutReports>=30)return;
            TextView c=clock();View v=owner.get();if(c==null||v==null||c.getLayout()==null||c.isLayoutRequested())return;
            Layout layout=c.getLayout();int ellipsis=0;for(int i=0;i<layout.getLineCount();i++)ellipsis+=layout.getEllipsisCount(i);
            try{
                org.json.JSONObject data=new org.json.JSONObject();
                data.put("style",v.getClass().getSimpleName());data.put("text",c.getText().toString());
                data.put("width",c.getWidth());data.put("lpWidth",c.getLayoutParams().width);data.put("layoutWidth",layout.getWidth());
                data.put("desiredWidth",Layout.getDesiredWidth(c.getText(),c.getPaint()));data.put("size",c.getTextSize());
                data.put("ellipsis",ellipsis);data.put("textScaleX",c.getTextScaleX());data.put("scaleX",c.getScaleX());
                data.put("padding",c.getCompoundPaddingLeft()+c.getCompoundPaddingRight());
                TextView m=mask();if(m!=null&&m.getLayout()!=null){int hidden=0;for(int i=0;i<m.getLayout().getLineCount();i++)hidden+=m.getLayout().getEllipsisCount(i);data.put("maskEllipsis",hidden);data.put("maskText",m.getText().toString());data.put("maskSize",m.getTextSize());}
                clipped.report(data);
                String value=data.toString();if(!value.equals(lastLayout)){lastLayout=value;layoutReports++;data.put("uptimeMs",android.os.SystemClock.uptimeMillis());android.util.Log.d("LSA.ClockFit",data.toString());}
            }catch(org.json.JSONException ignored){ }
        }
        @Override public boolean onPreDraw(){
            refresh();try{apply();reportLayout();}catch(ReflectiveOperationException error){View v=owner.get();if(v!=null)FeatureSettings.diagnostic(v.getContext(),P+"error",error.toString());}return true;
        }
    }
}
