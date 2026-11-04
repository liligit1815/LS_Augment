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
    final RectF track=new RectF(),fill=new RectF();
    final TextView caption;
    final StepGlyph symbol;
    final AudioManager audio;
    final DisplayManager display;
    Method info,set,linear,gamma;
    Field lo,hi,level;
    int gammaMax;
    float fraction;
    boolean adjustable,vertical,horizontal;
    float x,y;
    LevelControl(WorkspaceQuickBar bar,boolean light) {
        super(bar.ctx);owner=bar;this.light=light;
        audio=bar.ctx.getSystemService(AudioManager.class);display=bar.ctx.getSystemService(DisplayManager.class);
        if(light)try{
            info=android.view.Display.class.getMethod("getBrightnessInfo");
            lo=info.getReturnType().getField("brightnessMinimum");hi=info.getReturnType().getField("brightnessMaximum");level=info.getReturnType().getField("brightness");
            set=DisplayManager.class.getMethod("setBrightness",int.class,float.class);
            Class<?> scale=Class.forName("com.android.settingslib.display.BrightnessUtils",false,StepRuntime.Shell.loader);
            gammaMax=scale.getField("GAMMA_SPACE_MAX").getInt(null);
            linear=scale.getMethod("convertGammaToLinearFloat",int.class,float.class,float.class);
            gamma=scale.getMethod("convertLinearToGammaFloat",float.class,float.class,float.class);
            if(lo.getType()!=float.class || hi.getType()!=float.class || level.getType()!=float.class || gammaMax<=0 ||
                    linear.getReturnType()!=float.class || gamma.getReturnType()!=int.class || set.getReturnType()!=void.class)set=null;
        }catch(Exception|LinkageError unavailable){set=null;}
        setWillNotDraw(false);setFocusable(true);setClickable(true);
        caption=StepMaterial.label(getContext(),"",10,true);caption.setMaxLines(2);
        caption.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        FrameLayout.LayoutParams text=new FrameLayout.LayoutParams(-1,-2,Gravity.TOP|Gravity.CENTER_HORIZONTAL);
        text.topMargin=owner.dp(6);addView(caption,text);
        symbol=new StepGlyph(getContext(),light?"sun":"volume",light?"亮度":"音量",()->{});
        symbol.setClickable(false);symbol.setFocusable(false);symbol.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        FrameLayout.LayoutParams icon=new FrameLayout.LayoutParams(owner.dp(22),owner.dp(22),Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);
        icon.bottomMargin=owner.dp(6);addView(symbol,icon);refresh();
    }
    boolean read(boolean write,float position){
        try{
            position=Math.max(0f,Math.min(1f,position));
            if(light){
                if(set==null || display==null || Settings.System.getInt(getContext().getContentResolver(),Settings.System.SCREEN_BRIGHTNESS_MODE,-1)
                        != Settings.System.SCREEN_BRIGHTNESS_MODE_MANUAL)return false;
                Object b=info.invoke(display.getDisplay(0));if(b==null)return false;
                float min=lo.getFloat(b),max=hi.getFloat(b),value=level.getFloat(b);
                if(!Float.isFinite(min)||!Float.isFinite(max)||!Float.isFinite(value)||min<0||max>1||max<=min||value<min||value>max)return false;
                if(write){
                    float requested=(Float)linear.invoke(null,Math.round(position*gammaMax),min,max);
                    if(!Float.isFinite(requested)||requested<min||requested>max)return false;
                    set.invoke(display,0,requested);fraction=position;
                }else fraction=(Integer)gamma.invoke(null,value,min,max)/(float)gammaMax;
            }else{
                if(audio==null || audio.isVolumeFixed())return false;
                int min=audio.getStreamMinVolume(AudioManager.STREAM_MUSIC),max=audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
                if(max<=min)return false;
                if(write)audio.setStreamVolume(AudioManager.STREAM_MUSIC,min+Math.round(position*(max-min)),0);
                fraction=(audio.getStreamVolume(AudioManager.STREAM_MUSIC)-min)/(float)(max-min);
            }
            return true;
        }catch(Exception|LinkageError unavailable){return false;}
    }
    void refresh(){adjustable=read(false,0);showValue();}
    void showValue(){
        String name=light?"亮度":"音量";
        String value=adjustable?name+" "+Math.round(100*fraction)+"%":name+"设置";
        if(!value.contentEquals(caption.getText())){caption.setText(value);setContentDescription(value);}
        caption.setTextColor(adjustable && fraction>.88f?0xff242930:0xfff5f7fa);
        symbol.accent=adjustable && fraction>.18f?0xff242930:0xfff5f7fa;symbol.invalidate();invalidate();
    }
    @Override public void onDraw(Canvas c){
        track.set(0,0,getWidth(),getHeight());float r=Math.min(track.width()/2,owner.dp(18));
        paint.setColor(0xb2353f49);c.drawRoundRect(track,r,r,paint);
        if(adjustable && fraction>0){
            fill.set(track);fill.top=fill.bottom-fill.height()*fraction;
            float cap=Math.min(r,fill.height()/2);paint.setColor(0xfff5f7fa);c.drawRoundRect(fill,cap,cap,paint);
        }
    }
    @Override public boolean onTouchEvent(MotionEvent e){
        float value=1-e.getY()/Math.max(1,getHeight());
        switch(e.getActionMasked()){
            case MotionEvent.ACTION_DOWN:x=e.getX();y=e.getY();vertical=horizontal=false;return true;
            case MotionEvent.ACTION_MOVE:
                float dx=Math.abs(e.getX()-x),dy=Math.abs(e.getY()-y);
                if(!horizontal && !vertical && Math.max(dx,dy)>ViewConfiguration.get(getContext()).getScaledTouchSlop()){
                    vertical=dy>dx*1.3f;horizontal=!vertical;
                    if(vertical)getParent().requestDisallowInterceptTouchEvent(true);
                }
                if(vertical && adjustable){adjustable=read(true,value);showValue();}return true;
            case MotionEvent.ACTION_UP:
                if(!horizontal && !vertical)performClick();else if(vertical && adjustable){read(true,value);refresh();}
                return true;
            case MotionEvent.ACTION_CANCEL:refresh();return true;
        }
        return true;
    }
    @Override public boolean performClick(){super.performClick();owner.systemAction(new Intent(light?Settings.ACTION_DISPLAY_SETTINGS:Settings.Panel.ACTION_VOLUME));return true;}
}
