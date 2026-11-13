package ls.augment.com.step;

import android.content.*;
import android.graphics.*;
import android.hardware.display.DisplayManager;
import android.media.AudioManager;
import android.provider.Settings;
import android.view.*;
import android.widget.FrameLayout;
import android.widget.ImageView;
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
    final Runnable applyDrag=()->{writePending=false;if(isAttachedToWindow() && horizontal && canAdjust() && this.inputAllowed.getAsBoolean()){adjustable=read(true,pendingValue);showValue();}};
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
    boolean sidebar,sidebarRight;
    final Path stairClip=new Path();
    int stairWidth,stairHeight,stairPadding;
    ImageView nativeSymbol;
    java.util.function.BooleanSupplier inputAllowed=()->true;
    Runnable unavailableAction;
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
    void setSidebar(boolean right,java.util.function.BooleanSupplier allowed,Runnable fallback){
        sidebar=true;sidebarRight=right;compact=true;inputAllowed=allowed;unavailableAction=fallback;
        setMinimumWidth(owner.dp(44));setMinimumHeight(0);setClipToOutline(false);setBackground(null);setForeground(null);
        int gravity=right?Gravity.RIGHT:Gravity.LEFT;
        FrameLayout.LayoutParams text=new FrameLayout.LayoutParams(-1,-2,Gravity.TOP|gravity);
        caption.setLayoutParams(text);caption.setGravity(gravity);caption.setMaxLines(1);caption.setIncludeFontPadding(false);
        symbol.setFixedInk(0xccffffff);
        String name=light?"game_assist_bright_icon":"game_assist_volume_icon";
        try{
            Context stock=getContext().createPackageContext(GameSpacePanelStyle.PACKAGE,0);
            int id=stock.getResources().getIdentifier(name,"drawable",GameSpacePanelStyle.PACKAGE);
            if(id==0)throw new IllegalStateException("missing drawable/"+name);
            android.graphics.drawable.Drawable drawable=stock.getDrawable(id);
            if(drawable==null || drawable.getIntrinsicWidth()<=0 || drawable.getIntrinsicHeight()<=0)
                throw new IllegalStateException("invalid drawable/"+name);
            nativeSymbol=new ImageView(getContext());nativeSymbol.setImageDrawable(drawable);
            nativeSymbol.setScaleType(ImageView.ScaleType.FIT_CENTER);
            nativeSymbol.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            addView(nativeSymbol);symbol.setVisibility(INVISIBLE);
        }catch(Exception|LinkageError unavailable){
            StepRuntime.diagnostic("SIDEBAR_STAIR_ICON","fallback;name="+name+";reason="+unavailable);
        }
        showValue();
    }
    void sidebarGeometry(int width,int height,int iconSize){
        stairWidth=width;stairHeight=height;stairPadding=iconSize/2;
        int gravity=sidebarRight?Gravity.RIGHT:Gravity.LEFT;
        FrameLayout.LayoutParams icon=new FrameLayout.LayoutParams(iconSize,iconSize,Gravity.BOTTOM|gravity);
        symbol.setLayoutParams(icon);if(nativeSymbol!=null)nativeSymbol.setLayoutParams(new FrameLayout.LayoutParams(icon));
        FrameLayout.LayoutParams text=(FrameLayout.LayoutParams)caption.getLayoutParams();
        text.leftMargin=sidebarRight?0:stairPadding;text.rightMargin=sidebarRight?stairPadding:0;caption.setLayoutParams(text);
        invalidate();
    }
    @Override public void setPressed(boolean pressed){
        super.setPressed(pressed);
        if(sidebar && caption!=null)caption.setVisibility(pressed || !canAdjust()?VISIBLE:INVISIBLE);
    }
    boolean canAdjust(){
        if(!adjustable)return false;
        try{return light || audio!=null && !audio.isVolumeFixed();}catch(RuntimeException unavailable){return false;}
    }
    void refresh(){adjustable=read(false,0);showValue();}
    void showValue(){
        String name=light?"亮度":"媒体音量";
        String value=adjustable?name+" "+Math.round(100*fraction)+"%":name+"设置";
        String shown=compact?(adjustable?Math.round(100*fraction)+"%":"设置"):value;
        if(!shown.contentEquals(caption.getText()))caption.setText(shown);
        if(sidebar)caption.setVisibility(isPressed() || !canAdjust()?VISIBLE:INVISIBLE);
        setContentDescription(value);
        setStateDescription(!canAdjust()?"当前不能直接调节，可打开系统设置":!light && fraction==0?"静音":"可调节");
        setAlpha(sidebar && !canAdjust()?.45f:1f);
        caption.setTextColor(0xfff5f7fa);
        symbol.accent=0xfff5f7fa;symbol.invalidate();invalidate();
    }
    float cornerRadius(){return Math.min(Math.min(getWidth(),getHeight())/2f,owner.dp(18));}
    @Override public void onDraw(Canvas c){
        if(sidebar){drawStairs(c);return;}
        track.set(0,0,getWidth(),getHeight());float r=cornerRadius();
        paint.setColor(0xb2353f49);c.drawRoundRect(track,r,r,paint);
        float shown=Float.isFinite(fraction)?Math.max(0f,Math.min(1f,fraction)):0f;
        if(adjustable && shown>0){
            c.save();
            c.clipRect(0,0,track.width()*shown,track.height());
            paint.setColor(0x55f5f7fa);c.drawRoundRect(track,r,r,paint);c.restore();
        }
    }
    void drawStairs(Canvas c){
        if(stairWidth<=0 || stairHeight<=0)return;
        int save=c.save();
        c.translate(sidebarRight?getWidth()-stairWidth-stairPadding:stairPadding,owner.dp(16));
        // GameAssist StairSeekBar: 15 bars, line:gap = 1.4, 16% bottom
        // edge, ceil(progress * count), mirrored ALIGN_LEFT / ALIGN_RIGHT.
        stairClip.reset();stairClip.moveTo(0,0);stairClip.lineTo(stairWidth,0);
        stairClip.lineTo(sidebarRight?stairWidth:stairWidth*.16f,stairHeight);
        stairClip.lineTo(sidebarRight?stairWidth*.84f:0,stairHeight);stairClip.close();c.clipPath(stairClip);
        float gap=stairHeight/(14+15*1.4f),line=gap*1.4f;
        float value=Float.isFinite(fraction)?Math.max(0,Math.min(1,fraction)):0;
        int lit=adjustable?(int)Math.ceil(value*15):0;
        paint.setStrokeWidth(line);paint.setStrokeCap(Paint.Cap.BUTT);
        for(int i=0;i<15;i++){
            paint.setColor(i<lit?0xccffffff:0x99545454);
            float y=stairHeight-line/2-i*(line+gap);c.drawLine(0,y,stairWidth,y,paint);
        }
        c.restoreToCount(save);
    }
    @Override public boolean onTouchEvent(MotionEvent e){
        if(!inputAllowed.getAsBoolean()){
            removeCallbacks(applyDrag);writePending=false;releasePreview();setPressed(false);return false;
        }
        if(e.getPointerCount()>1){
            vertical=true;horizontal=false;removeCallbacks(applyDrag);writePending=false;releasePreview();setPressed(false);return true;
        }
        float value=sidebar?(owner.dp(16)+stairHeight-e.getY())/Math.max(1,stairHeight)
                :e.getX()/Math.max(1,getWidth());
        value=Math.max(0f,Math.min(1f,value));
        switch(e.getActionMasked()){
            case MotionEvent.ACTION_DOWN:x=e.getX();y=e.getY();vertical=horizontal=false;drawableHotspotChanged(x,y);setPressed(true);
                getParent().requestDisallowInterceptTouchEvent(true);return true;
            case MotionEvent.ACTION_MOVE:
                float dx=Math.abs(e.getX()-x),dy=Math.abs(e.getY()-y);
                if(!horizontal && !vertical && Math.max(dx,dy)>ViewConfiguration.get(getContext()).getScaledTouchSlop()){
                    horizontal=sidebar?dy>=dx:dx>=dy;vertical=!horizontal;cancelLongPress();
                }
                if(horizontal && canAdjust()){pendingValue=value;if(!writePending){writePending=true;postOnAnimation(applyDrag);}}return true;
            case MotionEvent.ACTION_UP:
                setPressed(false);
                removeCallbacks(applyDrag);writePending=false;
                getParent().requestDisallowInterceptTouchEvent(false);
                if(!vertical && canAdjust()){read(true,value);releasePreview();refresh();
                    if(light)StepRuntime.diagnostic("BRIGHTNESS_WRITE","fraction="+value+";readback="+fraction+";ready="+adjustable+";previewOwned="+previewOwned);
                    if(!horizontal)super.performClick();}
                else if(!horizontal && !vertical)performClick();
                releasePreview(); // Also release if a failed drag made the control unavailable.
                return true;
            case MotionEvent.ACTION_CANCEL:removeCallbacks(applyDrag);writePending=false;releasePreview();setPressed(false);getParent().requestDisallowInterceptTouchEvent(false);refresh();return true;
        }
        return true;
    }
    @Override public boolean performClick(){
        releasePreview();super.performClick();if(!inputAllowed.getAsBoolean())return false;
        if(unavailableAction!=null)unavailableAction.run();
        else owner.systemAction(new Intent(light?Settings.ACTION_DISPLAY_SETTINGS:Settings.Panel.ACTION_VOLUME));return true;
    }
    @Override public void onInitializeAccessibilityNodeInfo(android.view.accessibility.AccessibilityNodeInfo info){
        super.onInitializeAccessibilityNodeInfo(info);info.setClassName(android.widget.SeekBar.class.getName());
        if(canAdjust()){
            info.setRangeInfo(android.view.accessibility.AccessibilityNodeInfo.RangeInfo.obtain(android.view.accessibility.AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_FLOAT,0,100,Math.round(fraction*100)));
            info.addAction(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS);
            info.addAction(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
            info.addAction(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
        }
    }
    @Override public boolean performAccessibilityAction(int action,android.os.Bundle args){
        if(action==android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS.getId()
                || action==android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_FORWARD
                || action==android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD){
            if(!inputAllowed.getAsBoolean() || !canAdjust())return false;
            float requested=action==android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS.getId()
                    ?args==null?Float.NaN:args.getFloat(android.view.accessibility.AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE,Float.NaN)/100f
                    :fraction+(action==android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_FORWARD?.05f:-.05f);
            if(!Float.isFinite(requested))return false;
            boolean result=read(true,requested);releasePreview();refresh();return result;
        }
        return super.performAccessibilityAction(action,args);
    }
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
