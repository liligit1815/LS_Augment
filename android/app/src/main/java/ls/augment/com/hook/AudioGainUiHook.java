package ls.augment.com.hook;

import android.content.Context;
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
    static void install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> controller=Class.forName("com.android.systemui.volume.VolumeDialogControllerImpl",false,loader);
            Method update=controller.getDeclaredMethod("updateStreamLevelW",int.class,int.class);
            update.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(update,"audio.gain.panel.range",false).intercept(chain->{
                Object owner=chain.getThisObject();int stream=(Integer)chain.getArg(0);
                Object result=chain.proceed();
                if(AudioGainPolicy.stream(stream).isEmpty())return result;
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
                        if(AudioGainPolicy.stream(stream).isEmpty()||!FeatureSettings.enabled(context,ConfigSchema.AUDIO_GAIN_ENABLED)){removeBadge(root);return result;}
                        String scale=FeatureSettings.diagnosticValue(context,"ls_augment_audio_scale_"+stream);
                        String[] fields=scale.split(",");if(fields.length!=3)return result;
                        int base=Integer.parseInt(fields[0]),step=Integer.parseInt(fields[1]),limit=Integer.parseInt(fields[2]);
                        if(base<1||limit<=100){removeBadge(root);return result;}
                        Object state=field(row,"ss");int value=(Integer)field(state,"level");
                        boolean muted=Boolean.TRUE.equals(field(state,"muted"));
                        int percent=muted?0:value<=base?Math.round(value*100f/base):AudioGainPolicy.percent(value-base,step,limit);
                        GainBadge badge=BADGES.get(root);
                        if(badge==null){badge=new GainBadge(root,(View)field(row,"icon"));BADGES.put(root,badge);root.getOverlay().add(badge);}
                        badge.text=percent+"%";badge.setBounds(0,0,Math.max(1,root.getWidth()),Math.max(1,root.getHeight()));badge.invalidateSelf();
                        Object number=field(row,"number");if(number instanceof TextView)((TextView)number).setText(percent+"%");
                        Object header=field(row,"header");if(header instanceof TextView){TextView text=(TextView)header;
                            String label=text.getText().toString().replaceFirst(" · [0-9]+%$","");text.setText(label+" · "+percent+"%");}
                    }catch(Throwable ignored){}
                    return result;
                }));
            }
        }catch(Throwable e){module.logFeatureError("AUDIO_GAIN_PANEL_INSTALL",e);}
    }
    private static void removeBadge(View root){GainBadge badge=BADGES.remove(root);if(badge!=null)root.getOverlay().remove(badge);}
    private static final class GainBadge extends Drawable {
        final WeakReference<View> root,icon;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);String text="";
        GainBadge(View root,View icon){this.root=new WeakReference<>(root);this.icon=new WeakReference<>(icon);paint.setTextAlign(Paint.Align.CENTER);paint.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));}
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
