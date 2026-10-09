package ls.augment.com.hook;

import android.content.Context;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.*;
import ls.augment.com.BrightnessRange;

/** Extends only verified OEM brightness SeekBars, preserving native callbacks and gamma. */
final class FullBrightnessHook {
    private static final Map<SeekBar,WeakReference<State>> STATES = Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<Integer> NATIVE = ThreadLocal.withInitial(() -> 0);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService IO = Executors.newSingleThreadExecutor(r -> { Thread t = new Thread(r,"LSA-BrightnessBridge"); t.setDaemon(true); return t; });
    private static final Uri URI = Uri.parse("content://ls.augment.com.config");
    private static volatile Bundle snapshot = new Bundle();
    private static volatile boolean reading;
    private static boolean installed;
    private static State state(Object bar) {
        WeakReference<State> reference = STATES.get(bar); return reference == null ? null : reference.get();
    }
    static String label(SeekBar bar) {
        State s = state(bar); return s != null && s.expanded ? BrightnessRange.label(s.position) : null;
    }
    static int install(AugmentModule module,ClassLoader loader) {
        if (installed) return 0; installed = true;
        int count = 0;
        try {
            List<Class<?>> bars=new ArrayList<>();bars.add(SeekBar.class);
            try {bars.add(Class.forName("com.zte.mifavor.widget.ColorSeekBarZTE",false,loader));}catch(ClassNotFoundException ignored) { }
            for(Class<?> barType:bars) {
            Method listener = barType.getDeclaredMethod("setOnSeekBarChangeListener",SeekBar.OnSeekBarChangeListener.class);
            module.registerFeatureHook(module.prepareFeatureHook(listener,"brightness.listener."+barType.getName(),false).intercept(chain -> {
                SeekBar bar = (SeekBar) chain.getThisObject(); Object supplied = chain.getArg(0);
                if (supplied instanceof State) return chain.proceed();
                State s = state(bar);
                String name = supplied == null ? "" : supplied.getClass().getName();
                boolean match = name.startsWith("com.zte.settings.display.brightness.BrightSeekPreference")
                        || name.equals("com.zte.controlcenter.view.CCToggleSliderView$mSeekListener$1");
                if (s == null && match) {
                    s = new State(bar); STATES.put(bar,new WeakReference<>(s));
                    bar.addOnAttachStateChangeListener(s);
                }
                if (s == null) return chain.proceed();
                s.original = (SeekBar.OnSeekBarChangeListener) supplied;
                Object result = chain.proceed(new Object[]{supplied == null ? null : s});
                if (bar.isAttachedToWindow()) s.attach();
                return result;
            })); count++;
            }
            for (String getter : new String[]{"getProgress","getMax","getMin"}) {
                Method method = ProgressBar.class.getDeclaredMethod(getter);
                module.registerFeatureHook(module.prepareFeatureHook(method,"brightness."+getter,false).intercept(chain -> {
                    State s = state(chain.getThisObject());
                    if (s != null && s.expanded && !s.internal && NATIVE.get()>0) {
                        if (getter.equals("getMax")) return s.nativeMax;
                        if (getter.equals("getMin")) return s.nativeMin;
                        return BrightnessRange.toNative(s.position,s.nativeMin,s.nativeMax);
                    }
                    return chain.proceed();
                })); count++;
            }
            for (String setter : new String[]{"setMax","setMin"}) {
                Method method = ProgressBar.class.getDeclaredMethod(setter,int.class);
                module.registerFeatureHook(module.prepareFeatureHook(method,"brightness."+setter,false).intercept(chain -> {
                    State s = state(chain.getThisObject());
                    if (s == null || s.internal) return chain.proceed();
                    if (setter.equals("setMax")) s.nativeMax = (Integer)chain.getArg(0); else s.nativeMin=(Integer)chain.getArg(0);
                    if (!s.expanded) return chain.proceed();
                    return chain.proceed(new Object[]{setter.equals("setMax") ? BrightnessRange.SLIDER_MAX : 0});
                })); count++;
            }
            Method progress = ProgressBar.class.getDeclaredMethod("setProgressInternal",int.class,boolean.class,boolean.class);
            module.registerFeatureHook(module.prepareFeatureHook(progress,"brightness.progress",false).intercept(chain -> {
                State s = state(chain.getThisObject());
                if (s == null || !s.expanded || s.internal) return chain.proceed();
                Object[] args = chain.getArgs().toArray();
                if (!(Boolean)args[1]) {
                    if (s.dragging || BrightnessRange.extended(s.position)) args[0]=s.position;
                    else args[0]=BrightnessRange.fromNative((Integer)args[0],s.nativeMin,s.nativeMax);
                }
                s.position=BrightnessRange.clamp((Integer)args[0]);
                Object result = chain.proceed(args); s.decorate(); return result;
            })); count++;
        } catch (Throwable error) { module.logFeatureError("FULL_BRIGHTNESS_INSTALL",error); }
        try {
            Class<?> color=Class.forName("com.zte.mifavor.widget.ColorSeekBarZTE",false,loader);
            for(Method method:color.getDeclaredMethods()) {
                String name=method.getName();
                if(!name.equals("getProgress")&&!name.equals("setRange")&&!name.equals("setProgress")&&!name.equals("invalidateProgress"))continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,"brightness.color."+name+"."+method.getParameterCount(),false).intercept(chain -> {
                    State s=state(chain.getThisObject());if(s==null||s.internal)return chain.proceed();
                    Object[] args=chain.getArgs().toArray();
                    if(name.equals("setRange")) {
                        s.nativeMin=Math.round((Float)args[0]);s.nativeMax=Math.round((Float)args[1]);
                        if(s.expanded){args[0]=0f;args[1]=(float)BrightnessRange.SLIDER_MAX;}
                        return chain.proceed(args);
                    }
                    if(!s.expanded)return chain.proceed();
                    if(name.equals("getProgress") && NATIVE.get()>0)return BrightnessRange.toNative(s.position,s.nativeMin,s.nativeMax);
                    if(name.equals("setProgress")) {
                        if(s.mapping==0)args[0]=(float)(s.dragging||BrightnessRange.extended(s.position)?s.position:
                                BrightnessRange.fromNative(Math.round((Float)args[0]),s.nativeMin,s.nativeMax));
                        s.mapping++;try{return chain.proceed(args);}finally{s.mapping--;}
                    }
                    if(name.equals("invalidateProgress")) {
                        s.position=BrightnessRange.clamp(Math.round((Float)args[0]));
                        Object result=chain.proceed(args);s.decorate();return result;
                    }
                    return chain.proceed();
                }));count++;
            }
        }catch(ClassNotFoundException ignored) { }catch(Throwable error){module.logFeatureError("FULL_BRIGHTNESS_COLOR",error);}
        // OEM animator starting values must be read in the OEM coordinate space.
        String[] types = {"com.zte.settings.display.brightness.BrightSeekPreference", "com.zte.settings.display.brightness.BrightSeekPreferenceSToT", "com.zte.controlcenter.view.CCToggleSliderView"};
        for (String type : types) try {
            for (Method method : Class.forName(type,false,loader).getDeclaredMethods()) {
                if (!method.getName().equals("updateSlider") && !method.getName().equals("getValue")) continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,"brightness.native."+type+"."+method.getName(),false).intercept(chain -> {
                    NATIVE.set(NATIVE.get()+1);
                    try { return chain.proceed(); } finally { NATIVE.set(NATIVE.get()-1); }
                })); count++;
            }
        } catch (ClassNotFoundException ignored) { } catch (Throwable error) { module.logFeatureError("FULL_BRIGHTNESS_NATIVE",error); }
        module.logFeatureInfo("FULL_BRIGHTNESS_READY hooks="+count); return count;
    }
    private static void read(Context context) {
        if (reading) return; reading=true;
        IO.execute(() -> {
            try { Bundle b=context.getContentResolver().call(URI,"brightness_read",null,null); if (b!=null) snapshot=b; }
            catch (RuntimeException ignored) { snapshot=new Bundle(); }
            finally { reading=false; }
        });
    }
    private static final class State implements SeekBar.OnSeekBarChangeListener,View.OnAttachStateChangeListener {
        final WeakReference<SeekBar> reference;
        SeekBar.OnSeekBarChangeListener original;
        int nativeMin,nativeMax,position,mapping;
        final boolean color;
        boolean expanded,internal,dragging,attached;
        long localUntil;
        int pending=-1;
        final Runnable config=this::refresh;
        final Runnable poll=() -> { if (attached) { refresh(); schedule(); } };
        final Runnable send=this::send;
        final Label overlay = new Label();
        String decorated="";
        State(SeekBar bar) {
            reference=new WeakReference<>(bar);color=bar.getClass().getName().equals("com.zte.mifavor.widget.ColorSeekBarZTE");
            nativeMin=bar.getMin();nativeMax=bar.getMax();
            if(color){Object min=SystemUiAdapter.field(bar,"mMin"),max=SystemUiAdapter.field(bar,"mMax");
                if(min instanceof Float && max instanceof Float){nativeMin=Math.round((Float)min);nativeMax=Math.round((Float)max);}}
        }
        void range(SeekBar bar,int min,int max) {
            if(color)try{bar.getClass().getMethod("setRange",float.class,float.class).invoke(bar,(float)min,(float)max);}
            catch(ReflectiveOperationException error){throw new IllegalStateException(error);}
            else {bar.setMin(min);bar.setMax(max);}
        }
        void progress(SeekBar bar,int value) {
            if(color)try{bar.getClass().getMethod("setProgress",float.class,boolean.class,boolean.class).invoke(bar,(float)value,false,false);}
            catch(ReflectiveOperationException error){throw new IllegalStateException(error);}
            else bar.setProgress(value);
        }
        void attach() {
            if (attached) return; attached=true;
            SeekBar bar=reference.get(); if (bar==null) return;
            FeatureSettings.addSnapshotListener(bar.getContext(),config); refresh();schedule();
        }
        void schedule() { MAIN.removeCallbacks(poll); MAIN.postDelayed(poll,500); }
        void refresh() {
            SeekBar bar=reference.get(); if (bar==null) return;
            boolean requested=FeatureSettings.enabled(bar.getContext(),BrightnessRange.ENABLED);
            if (requested) read(bar.getContext().getApplicationContext());
            boolean enabled=requested && snapshot.getBoolean("ready") && snapshot.getBoolean("enabled")
                    && Settings.System.getInt(bar.getContext().getContentResolver(),Settings.System.SCREEN_BRIGHTNESS_MODE,0)==0;
            if (enabled!=expanded) {
                internal=true;
                try {
                    if (enabled) {
                        position=BrightnessRange.fromNative(bar.getProgress(),nativeMin,nativeMax);
                        expanded=true;range(bar,0,BrightnessRange.SLIDER_MAX);progress(bar,position);
                    } else {
                        int normal=BrightnessRange.toNative(position,nativeMin,nativeMax);
                        expanded=false;range(bar,nativeMin,nativeMax);progress(bar,normal);
                    }
                } finally { internal=false; }
            }
            if (expanded && !dragging && SystemClock.uptimeMillis()>localUntil) {
                int shared=snapshot.getInt("selected",-1);
                if (shared>=0 && BrightnessRange.extended(shared)) {
                    if(position!=shared){internal=true;try{position=shared;progress(bar,shared);}finally{internal=false;}}
                } else if (BrightnessRange.extended(position)) {
                    position=shared>=0?BrightnessRange.clamp(shared):position<BrightnessRange.NORMAL_START?BrightnessRange.NORMAL_START:BrightnessRange.NORMAL_END;
                    internal=true;try{progress(bar,position);}finally{internal=false;}
                }
            }
            decorate();
        }
        void decorate() {
            SeekBar bar=reference.get();if(bar==null)return;
            if (expanded) {
                String label=BrightnessRange.label(position);
                if(label.equals(decorated) && overlay.getBounds().width()==bar.getWidth() && overlay.getBounds().height()==bar.getHeight())return;
                decorated=label;bar.setStateDescription(label);
                if (bar.getContext().getPackageName().equals("com.android.settings")) {
                    overlay.text=BrightnessRange.label(position);overlay.setBounds(0,0,bar.getWidth(),bar.getHeight());
                    overlay.density=bar.getResources().getDisplayMetrics().density;
                    bar.getOverlay().remove(overlay);bar.getOverlay().add(overlay);overlay.invalidateSelf();
                }
            } else if(!decorated.isEmpty()) {decorated="";bar.setStateDescription(null);bar.getOverlay().remove(overlay);}
        }
        void queue() { pending=position;localUntil=SystemClock.uptimeMillis()+1200;MAIN.removeCallbacks(send);MAIN.postDelayed(send,60); }
        void send() {
            SeekBar bar=reference.get(); if(bar==null||pending<0)return;
            int next=pending;pending=-1;Context context=bar.getContext().getApplicationContext();
            IO.execute(() -> {
                Bundle extras=new Bundle();extras.putInt("position",next);
                try { Bundle b=context.getContentResolver().call(URI,"brightness_select",null,extras);if(b!=null)snapshot=b; }
                catch(RuntimeException ignored) { }
            });
        }
        private void nativeCall(Runnable callback) {
            NATIVE.set(NATIVE.get()+1);try {callback.run();}finally{NATIVE.set(NATIVE.get()-1);}
        }
        public void onProgressChanged(SeekBar bar,int value,boolean user) {
            if(internal)return;
            if(!expanded){if(original!=null)original.onProgressChanged(bar,value,user);return;}
            if(user || NATIVE.get()==0)position=BrightnessRange.clamp(value);
            if(original!=null)nativeCall(() -> original.onProgressChanged(bar,BrightnessRange.toNative(position,nativeMin,nativeMax),user));
            if(user)queue();decorate();
        }
        public void onStartTrackingTouch(SeekBar bar) {
            dragging=true;
            if(original!=null)nativeCall(() -> original.onStartTrackingTouch(bar));
        }
        public void onStopTrackingTouch(SeekBar bar) {
            if(original!=null)nativeCall(() -> original.onStopTrackingTouch(bar));
            dragging=false;if(expanded){queue();MAIN.removeCallbacks(send);send();}
        }
        public void onViewAttachedToWindow(View v){attach();}
        public void onViewDetachedFromWindow(View v){attached=false;MAIN.removeCallbacks(poll);MAIN.removeCallbacks(send);if(pending>=0)send();FeatureSettings.removeSnapshotListener(config);}
    }
    private static final class Label extends Drawable {
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);String text="";float density=1;
        public void draw(Canvas canvas){paint.setTextSize(11*density);paint.setTextAlign(Paint.Align.RIGHT);paint.setColor(0xff3977bb);canvas.drawText(text,getBounds().width()-8*density,Math.max(11*density,getBounds().height()/2f-5*density),paint);}
        public void setAlpha(int alpha){paint.setAlpha(alpha);}public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
