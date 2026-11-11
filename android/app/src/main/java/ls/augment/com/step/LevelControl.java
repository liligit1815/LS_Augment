package ls.augment.com.step;

import android.content.*;
import android.graphics.*;
import android.hardware.display.DisplayManager;
import android.media.AudioManager;
import android.provider.Settings;
import android.view.*;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.lang.reflect.*;

/** Native media-volume steps or the display's own calibrated manual brightness range. */
final class LevelControl extends FrameLayout {
    final WorkspaceQuickBar owner;
    final boolean light;
    final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    final RectF track=new RectF();
    final TextView caption;
    final StepGlyph symbol;
    final AudioManager audio;
    final DisplayManager display;
    Method info,set,temporary;
    NativeBrightnessScale scale;
    Field lo,hi,level;
    String lastCapability="";
    float fraction;
    boolean adjustable,vertical,horizontal,registeredAudio,registeredDisplay,registeredSettings;
    Class<?> converter;
    final android.os.Handler updates=new android.os.Handler(android.os.Looper.getMainLooper());
    final Runnable sync=()->{if(isAttachedToWindow())refresh();};
    float pendingValue;boolean writePending;
    boolean previewOwned;
    final Runnable applyDrag=()->{writePending=false;if(isAttachedToWindow() && horizontal && adjustable){adjustable=read(true,pendingValue);showValue();}};
    final android.database.ContentObserver settings=new android.database.ContentObserver(updates){
        @Override public void onChange(boolean self){scheduleRefresh();}
    };
    final BroadcastReceiver volumeChanges=new BroadcastReceiver(){
        @Override public void onReceive(Context c,Intent i){scheduleRefresh();} // Read AudioManager, never trust broadcast values.
    };
    final DisplayManager.DisplayListener displayChanges=new DisplayManager.DisplayListener(){
        public void onDisplayAdded(int id){}public void onDisplayRemoved(int id){}
        public void onDisplayChanged(int id){if(id==0)scheduleRefresh();}
    };
    float x,y;
    LevelControl(WorkspaceQuickBar bar,boolean light) {
        super(bar.ctx);owner=bar;this.light=light;
        audio=bar.ctx.getSystemService(AudioManager.class);display=bar.ctx.getSystemService(DisplayManager.class);
        if(light)try{
            info=android.view.Display.class.getMethod("getBrightnessInfo");
            lo=info.getReturnType().getField("brightnessMinimum");hi=info.getReturnType().getField("brightnessMaximum");level=info.getReturnType().getField("brightness");
            set=DisplayManager.class.getMethod("setBrightness",int.class,float.class);
            try{
                Method preview=DisplayManager.class.getMethod("setTemporaryBrightness",int.class,float.class);
                if(preview.getReturnType()==void.class)temporary=preview;
            }catch(NoSuchMethodException legacy){ /* Retain the validated persistent display API. */ }
            converter=Class.forName("com.android.settingslib.display.BrightnessUtils",false,StepRuntime.Shell.loader);
            if(lo.getType()!=float.class || hi.getType()!=float.class || level.getType()!=float.class || set.getReturnType()!=void.class)
                throw new NoSuchMethodException("display brightness signature");
        }catch(Exception|LinkageError unavailable){set=null;capability("missing_interface:"+unavailable.getClass().getSimpleName());}
        setWillNotDraw(false);setFocusable(true);setClickable(true);
        StepMaterial.feedback(this);
        // The fill and pressed feedback must share the control's outer silhouette.
        setOutlineProvider(new ViewOutlineProvider(){
            @Override public void getOutline(View view,Outline outline){
                outline.setRoundRect(0,0,getWidth(),getHeight(),cornerRadius());
            }
        });
        setClipToOutline(true);
        caption=StepMaterial.label(getContext(),"",10,true);caption.setMaxLines(2);
        // Use spare horizontal space before wrapping a scaled caption against the caps.
        setMinimumWidth(owner.dp(39)+(int)Math.ceil(caption.getPaint().measureText((light?"亮度":"媒体音量")+" 100%")));
        caption.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        FrameLayout.LayoutParams text=new FrameLayout.LayoutParams(-1,-2,Gravity.CENTER_VERTICAL);
        text.leftMargin=owner.dp(27);text.rightMargin=owner.dp(4);addView(caption,text);
        symbol=new StepGlyph(getContext(),light?"sun":"volume",light?"亮度":"音量",()->{});
        symbol.setClickable(false);symbol.setFocusable(false);symbol.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        FrameLayout.LayoutParams icon=new FrameLayout.LayoutParams(owner.dp(18),owner.dp(18),Gravity.LEFT|Gravity.CENTER_VERTICAL);
        icon.leftMargin=owner.dp(6);addView(symbol,icon);refresh();
    }
    boolean read(boolean write,float position){
        try{
            position=Math.max(0f,Math.min(1f,position));
            if(light){
                if(set==null || display==null)return false;
                Object adapter=NativeBrightnessBinding.adapter;
                if(NativeBrightnessBinding.required && adapter==null){capability("waiting_for_native_controller");return false;}
                if(scale==null || scale.adapter!=adapter)scale=new NativeBrightnessScale(converter,adapter);
                Object b=info.invoke(display.getDisplay(0));if(b==null){capability("missing_display_readback");return false;}
                float min=lo.getFloat(b),max=hi.getFloat(b),value=level.getFloat(b);
                fraction=scale.fraction(value,min,max);
                if(write){
                    float requested=scale.value(position,min,max);
                    // The stock slider owns a temporary override while dragging. Replace that
                    // stale preview as well as the saved value, exactly like its controller does.
                    if(temporary!=null){temporary.invoke(display,0,requested);previewOwned=true;}
                    set.invoke(display,0,requested);
                    // The display service can clamp or defer a request. Show its readback.
                    Object actual=info.invoke(display.getDisplay(0));
                    if(actual!=null)fraction=scale.fraction(level.getFloat(actual),lo.getFloat(actual),hi.getFloat(actual));
                    scheduleRefresh();updates.postDelayed(sync,80);updates.postDelayed(sync,250);
                }
                capability("ready:"+scale.source+";gamma_max="+scale.maximum+";temporary="+(temporary!=null));
            }else{
                if(audio==null)return false;
                int min=audio.getStreamMinVolume(AudioManager.STREAM_MUSIC),max=audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
                if(max<=min)return false;
                if(write){
                    if(audio.isVolumeFixed())return false;
                    int target=min+Math.round(position*(max-min));
                    if(audio.getStreamVolume(AudioManager.STREAM_MUSIC)!=target || audio.isStreamMute(AudioManager.STREAM_MUSIC))
                        audio.setStreamVolume(AudioManager.STREAM_MUSIC,target,0);
                }
                fraction=audio.isStreamMute(AudioManager.STREAM_MUSIC)?0:(audio.getStreamVolume(AudioManager.STREAM_MUSIC)-min)/(float)(max-min);
            }
            return true;
        }catch(Exception|LinkageError unavailable){if(light){
            Throwable cause=unavailable instanceof InvocationTargetException && unavailable.getCause()!=null?unavailable.getCause():unavailable;
            capability("unavailable:"+cause.getClass().getSimpleName()+";detail="+cause.getMessage()
                    +";adapter="+(NativeBrightnessBinding.adapter==null?"none":NativeBrightnessBinding.adapter.getClass().getName()));
        }return false;}
    }
    void capability(String value){if(!value.equals(lastCapability)){lastCapability=value;StepRuntime.diagnostic("BRIGHTNESS",value);}}
    void releasePreview(){
        if(!previewOwned || temporary==null || display==null)return;
        try{temporary.invoke(display,0,Float.NaN);previewOwned=false;}
        catch(Exception|LinkageError failure){capability("preview_release_failed:"+failure.getClass().getSimpleName());}
    }
    boolean compact;
    void setCompact(){
        compact=true;setMinimumWidth(owner.dp(44));
        FrameLayout.LayoutParams icon=new FrameLayout.LayoutParams(owner.dp(18),owner.dp(18),Gravity.TOP|Gravity.CENTER_HORIZONTAL);
        icon.topMargin=owner.dp(3);symbol.setLayoutParams(icon);
        FrameLayout.LayoutParams text=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);
        text.bottomMargin=owner.dp(3);caption.setLayoutParams(text);caption.setGravity(Gravity.CENTER);caption.setMaxLines(1);
        showValue();
    }
    void refresh(){adjustable=read(false,0);showValue();}
    void showValue(){
        String name=light?"亮度":"媒体音量";
        String value=adjustable?name+" "+Math.round(100*fraction)+"%":name+"设置";
        String shown=compact?(adjustable?Math.round(100*fraction)+"%":"设置"):value;
        if(!shown.contentEquals(caption.getText()))caption.setText(shown);
        setContentDescription(value);
        caption.setTextColor(0xfff5f7fa);
        symbol.accent=0xfff5f7fa;symbol.invalidate();invalidate();
    }
    float cornerRadius(){return Math.min(Math.min(getWidth(),getHeight())/2f,owner.dp(18));}
    @Override public void onDraw(Canvas c){
        track.set(0,0,getWidth(),getHeight());float r=cornerRadius();
        paint.setColor(0xb2353f49);c.drawRoundRect(track,r,r,paint);
        float shown=Float.isFinite(fraction)?Math.max(0f,Math.min(1f,fraction)):0f;
        if(adjustable && shown>0){
            c.save();c.clipRect(0,0,track.width()*shown,track.height());
            paint.setColor(0x55f5f7fa);c.drawRoundRect(track,r,r,paint);c.restore();
        }
    }
    @Override public boolean onTouchEvent(MotionEvent e){
        float value=e.getX()/Math.max(1,getWidth());
        switch(e.getActionMasked()){
            case MotionEvent.ACTION_DOWN:x=e.getX();y=e.getY();vertical=horizontal=false;drawableHotspotChanged(x,y);setPressed(true);
                getParent().requestDisallowInterceptTouchEvent(true);return true;
            case MotionEvent.ACTION_MOVE:
                float dx=Math.abs(e.getX()-x),dy=Math.abs(e.getY()-y);
                if(!horizontal && !vertical && Math.max(dx,dy)>ViewConfiguration.get(getContext()).getScaledTouchSlop()){
                    horizontal=dx>=dy;vertical=!horizontal;cancelLongPress();
                }
                if(horizontal && adjustable){pendingValue=value;if(!writePending){writePending=true;postOnAnimation(applyDrag);}}return true;
            case MotionEvent.ACTION_UP:
                setPressed(false);
                removeCallbacks(applyDrag);writePending=false;
                getParent().requestDisallowInterceptTouchEvent(false);
                if(!vertical && adjustable){read(true,value);releasePreview();refresh();
                    if(light)StepRuntime.diagnostic("BRIGHTNESS_WRITE","fraction="+value+";readback="+fraction+";ready="+adjustable+";previewOwned="+previewOwned);
                    if(!horizontal)super.performClick();}
                else if(!horizontal && !vertical)performClick();
                releasePreview(); // Also release if a failed drag made the control unavailable.
                return true;
            case MotionEvent.ACTION_CANCEL:removeCallbacks(applyDrag);writePending=false;releasePreview();setPressed(false);getParent().requestDisallowInterceptTouchEvent(false);refresh();return true;
        }
        return true;
    }
    @Override public boolean performClick(){releasePreview();super.performClick();owner.systemAction(new Intent(light?Settings.ACTION_DISPLAY_SETTINGS:Settings.Panel.ACTION_VOLUME));return true;}
    void scheduleRefresh(){updates.removeCallbacks(sync);updates.post(sync);}
    @Override protected void onAttachedToWindow(){
        super.onAttachedToWindow();
        try{
            if(light){
                for(String key:new String[]{Settings.System.SCREEN_BRIGHTNESS,Settings.System.SCREEN_BRIGHTNESS_MODE,"screen_brightness_float","screen_auto_brightness_adj"}){
                    getContext().getContentResolver().registerContentObserver(Settings.System.getUriFor(key),false,settings);registeredSettings=true;
                }
                if(display!=null){
                    try{
                        long flag=DisplayManager.class.getField("EVENT_FLAG_DISPLAY_BRIGHTNESS").getLong(null);
                        DisplayManager.class.getMethod("registerDisplayListener",DisplayManager.DisplayListener.class,android.os.Handler.class,long.class)
                                .invoke(display,displayChanges,updates,flag);
                    }catch(ReflectiveOperationException missing){display.registerDisplayListener(displayChanges,updates);}
                    registeredDisplay=true;
                }
            }else{
                IntentFilter filter=new IntentFilter("android.media.VOLUME_CHANGED_ACTION");
                filter.addAction("android.media.STREAM_MUTE_CHANGED_ACTION");filter.addAction(AudioManager.ACTION_AUDIO_BECOMING_NOISY);
                filter.addAction("android.media.STREAM_DEVICES_CHANGED_ACTION");
                if(android.os.Build.VERSION.SDK_INT>=33)getContext().registerReceiver(volumeChanges,filter,null,updates,Context.RECEIVER_EXPORTED);
                else getContext().registerReceiver(volumeChanges,filter,null,updates);
                registeredAudio=true;
            }
        }catch(RuntimeException error){capability("change_listener_unavailable:"+error.getClass().getSimpleName());}
        refresh();
    }
    @Override protected void onDetachedFromWindow(){
        releasePreview();
        updates.removeCallbacksAndMessages(null);
        removeCallbacks(applyDrag);writePending=false;
        if(registeredSettings){getContext().getContentResolver().unregisterContentObserver(settings);registeredSettings=false;}
        if(registeredDisplay){display.unregisterDisplayListener(displayChanges);registeredDisplay=false;}
        if(registeredAudio){getContext().unregisterReceiver(volumeChanges);registeredAudio=false;}
        super.onDetachedFromWindow();
    }
}
