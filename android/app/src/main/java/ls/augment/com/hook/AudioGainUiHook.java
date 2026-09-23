package ls.augment.com.hook;

import android.content.Context;
import android.media.AudioManager;
import android.widget.TextView;
import android.view.View;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.lang.reflect.*;
import ls.augment.com.AudioGainPolicy;
import ls.augment.com.ConfigSchema;

/** Keeps the existing volume panel's range in sync with the real extension. */
final class AudioGainUiHook {
    private static final WeakHashMap<View,GainBadge> BADGES=new WeakHashMap<>();
    private static String stepsKey(int stream){
        String name=stream==AudioManager.STREAM_VOICE_CALL?"call":stream==AudioManager.STREAM_RING?"ring"
                :stream==AudioManager.STREAM_MUSIC?"media":stream==AudioManager.STREAM_ALARM?"alarm"
                :stream==AudioManager.STREAM_NOTIFICATION?"notification":"";
        return name.isEmpty()?"":"ls_augment_rm_audio_steps_"+name+"_enabled";
    }
    private static boolean customSteps(Context context,int stream){
        String key=stepsKey(stream);return !key.isEmpty()&&FeatureSettings.enabled(context,key);
    }
    static void install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> controller=Class.forName("com.android.systemui.volume.VolumeDialogControllerImpl",false,loader);
            Method update=controller.getDeclaredMethod("updateStreamLevelW",int.class,int.class);
            update.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(update,"audio.gain.panel.range",false).intercept(chain->{
                Object owner=chain.getThisObject();int stream=(Integer)chain.getArg(0);
                Object result=chain.proceed();
                if(AudioGainPolicy.stream(stream).isEmpty()&&!customSteps(FeatureSettings.from(owner),stream))return result;
                try {
                    Object state=invoke(owner,"streamStateW",stream);
                    Field max=state.getClass().getDeclaredField("levelMax");max.setAccessible(true);
                    int old=max.getInt(state), next=(Integer)invoke(owner,"getAudioManagerStreamMaxVolume",stream);
                    max.setInt(state,next);
                    return Boolean.TRUE.equals(result)||old!=next;
                }catch(Throwable ignored){return result;}
            }));
            Class<?> dialog=Class.forName("com.android.systemui.volume.VolumeDialogImpl",false,loader);
            for(Method m:dialog.getDeclaredMethods())if(m.getName().equals("updateVolumeRowH")&&m.getParameterCount()==1){
                m.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(m,"audio.gain.panel.percent",false).intercept(chain->{
                    Object result=chain.proceed();
                    try {
                        Object row=chain.getArg(0);int stream=(Integer)field(row,"stream");
                        View root=(View)field(row,"view");
                        Context context=(Context)field(chain.getThisObject(),"mContext");
                        updateVolumeLabel(context,row,root,stream);
                    }catch(Throwable ignored){}
                    return result;
                }));
            }
        }catch(Throwable e){module.logFeatureError("AUDIO_GAIN_PANEL_INSTALL",e);}
    }
    private static void updateVolumeLabel(Context context,Object row,View root,int stream) throws ReflectiveOperationException {
        if(root==null)return;
        Object header=field(row,"header");
        TextView title=header instanceof TextView?(TextView)header:null;
        String label=title==null?"":title.getText().toString().replaceFirst("(?: · [0-9]+ / [0-9]+ 档)?(?: · [0-9]+%)?$","");
        Object state=field(row,"ss"),level=field(state,"level"),maximum=field(state,"levelMax");
        if(!(level instanceof Integer)||!(maximum instanceof Integer)||(Integer)maximum<=0){
            removeBadge(root);
            if(title!=null&&!label.contentEquals(title.getText()))title.setText(label);
            return;
        }
        // All five custom streams use the actual maximum, including any active
        // gain extension. Never substitute a requested, not-yet-applied setting.
        int total=(Integer)maximum;
        int current=Boolean.TRUE.equals(field(state,"muted"))?0:Math.max(0,Math.min(total,(Integer)level));
        String steps=customSteps(context,stream)?current+" / "+total:"";
        String percent=gainPercent(context,stream,current,total);
        String text=steps.isEmpty()?percent:steps;
        if(text.isEmpty())removeBadge(root);else showBadge(root,(View)field(row,"icon"),text);
        if(!percent.isEmpty()){
            Object number=field(row,"number");if(number instanceof TextView)((TextView)number).setText(percent);
        }
        if(title!=null)title.setText(label+(steps.isEmpty()?"":" · "+steps+" 档")+(percent.isEmpty()?"":" · "+percent));
    }
    private static String gainPercent(Context context,int stream,int current,int total){
        if(AudioGainPolicy.stream(stream).isEmpty()||!FeatureSettings.enabled(context,ConfigSchema.AUDIO_GAIN_ENABLED))return "";
        try{
            String[] scale=FeatureSettings.diagnosticValue(context,"ls_augment_audio_scale_"+stream).split(",");
            if(scale.length!=3)return "";
            int base=Integer.parseInt(scale[0]),step=Integer.parseInt(scale[1]),limit=Integer.parseInt(scale[2]);
            // Latest diagnostic values can belong to the previous route/boot.
            if(base<1||step<1||step>20||limit<=100||limit>300||base+AudioGainPolicy.extraSteps(limit,step)!=total)return "";
            int percent=current<=base?Math.round(current*100f/base):AudioGainPolicy.percent(current-base,step,limit);
            return percent+"%";
        }catch(NumberFormatException invalid){return "";}
    }
    private static void showBadge(View root,View icon,String text){
        GainBadge badge=BADGES.get(root);
        if(badge==null){
            badge=new GainBadge(root,icon);BADGES.put(root,badge);
            root.addOnLayoutChangeListener(badge);root.getOverlay().add(badge);
        }
        badge.text=text;badge.resize();badge.invalidateSelf();
    }
    private static void removeBadge(View root){
        GainBadge badge=BADGES.remove(root);
        if(badge!=null){root.removeOnLayoutChangeListener(badge);root.getOverlay().remove(badge);}
    }
    private static final class GainBadge extends Drawable implements View.OnLayoutChangeListener {
        final WeakReference<View> root,icon;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);String text="";
        GainBadge(View root,View icon){this.root=new WeakReference<>(root);this.icon=new WeakReference<>(icon);paint.setTextAlign(Paint.Align.CENTER);paint.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));}
        void resize(){View r=root.get();if(r!=null)setBounds(0,0,Math.max(1,r.getWidth()),Math.max(1,r.getHeight()));}
        @Override public void onLayoutChange(View view,int left,int top,int right,int bottom,int oldLeft,int oldTop,int oldRight,int oldBottom){resize();invalidateSelf();}
        @Override public void draw(Canvas canvas){View r=root.get(),i=icon.get();if(r==null||i==null||text.isEmpty())return;
            float d=r.getResources().getDisplayMetrics().density;int[] a=new int[2],b=new int[2];r.getLocationOnScreen(a);i.getLocationOnScreen(b);
            paint.setTextSize(10*d);paint.setColor(0xff138af0);
            canvas.drawText(text,b[0]-a[0]+i.getWidth()/2f,Math.max(12*d,b[1]-a[1]-3*d),paint);
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    private static Object field(Object owner,String name) throws ReflectiveOperationException {
        if(owner==null)return null;
        for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(owner);}catch(NoSuchFieldException ignored){}
        return null;
    }
    private static Object invoke(Object owner,String name,Object...args) throws ReflectiveOperationException {
        for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(owner,args);}
        throw new NoSuchMethodException(name);
    }
}
