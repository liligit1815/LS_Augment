package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import ls.augment.com.*;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Enhance actual RedMagic charging views and their own expiry callbacks. */
final class NativeIslandCharging {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View,Surface> SURFACES=new WeakHashMap<>();
    private static final Map<Runnable,Lease> LEASES=new IdentityHashMap<>();
    private static final Set<Method> RUN_HOOKS=new HashSet<>();
    private static AugmentModule module;
    private static final String OEM="com.zte.feature.dynamicisland.";
    static int install(AugmentModule value,ClassLoader loader){
        module=value;int count=0;
        try{
            Class<?> type=Class.forName(OEM+"PermanentIslandManager",false,loader);
            Method update=MagicIslandScenes.exact(type,"handleChargingIsland",void.class,int.class,boolean.class,boolean.class,int.class);
            MagicIslandScenes.typed(type,"mChargingIslandFullScreen",View.class);
            module.registerFeatureHook(module.prepareFeatureHook(update,"island.charge.fullscreen_source",false).intercept(chain->{
                Object result=chain.proceed();Object owner=chain.getThisObject(),view=field(owner,"mChargingIslandFullScreen");
                if(view instanceof View){nativeContent((View)view);
                    if(Boolean.TRUE.equals(chain.getArgs().get(1)))lease(owner,(View)view,true);
                    else retire(owner,false);}
                return result;
            }));count++;
        }catch(Exception unavailable){report("fullscreen_source_missing:"+unavailable.getMessage());}
        try{
            Class<?> type=Class.forName(OEM+"DisposableIslandManager",false,loader);
            Class<?> island=Class.forName(OEM+"DynamicDisposableIsland",false,loader);
            Method update=MagicIslandScenes.exact(type,"updateDynamicIslandVisibility",void.class,island);
            MagicIslandScenes.typed(type,"mChargingIsland",View.class);
            module.registerFeatureHook(module.prepareFeatureHook(update,"island.charge.ordinary_source",false).intercept(chain->{
                Object owner=chain.getThisObject(),view=field(owner,"mChargingIsland");
                if(chain.getArgs().get(0)!=view)retire(owner,false);
                Object result=chain.proceed();
                if(view instanceof View&&chain.getArgs().get(0)==view){nativeContent((View)view);MAIN.post(()->lease(owner,(View)view,false));}
                return result;
            }));count++;
        }catch(Exception unavailable){report("ordinary_source_missing:"+unavailable.getMessage());}
        // This class has multiple audited implementations; the signature is the contract.
        try{
            Class<?> type=Class.forName(OEM+"ChargingIslandFullScreen",false,loader);
            Method update=MagicIslandScenes.exact(type,"updateBatteryStatus",void.class,int.class,boolean.class,boolean.class,int.class);
            module.registerFeatureHook(module.prepareFeatureHook(update,"island.charge.native_text",false).intercept(chain->{
                Object result=chain.proceed();if(chain.getThisObject() instanceof View)nativeContent((View)chain.getThisObject());return result;
            }));count++;
        }catch(Exception unavailable){report("native_text_missing:"+unavailable.getMessage());}
        return count;
    }
    static void nativeContent(View view){
        if(view==null||!IslandSceneSelection.enabled(view.getContext(),"charging"))return;
        try{
            Surface surface=SURFACES.get(view);
            if(surface==null){surface=new Surface(view);SURFACES.put(view,surface);view.addOnAttachStateChangeListener(surface);
                if(view.isAttachedToWindow())surface.onViewAttachedToWindow(view);}
            surface.capture();surface.refresh();
        }catch(Exception unavailable){report("text_contract_missing:"+unavailable.getMessage());}
    }
    private static int option(Context c,String key){String value=FeatureSettings.text(c,key,"0");
        return IslandChargeConfig.DURATION.equals(key)?IslandChargeConfig.duration(value):IslandChargeConfig.mode(value);}
    private static int seconds(Context c){return IslandChargeConfig.seconds(FeatureSettings.text(c,IslandChargeConfig.SECONDS,"10"));}
    private static void report(String detail){FeatureRuntimeLog.event("ISLAND_CHARGING",detail);}
    private static boolean visible(View view){
        if(view==null||!view.isAttachedToWindow()||!view.isShown()||view.getWindowVisibility()!=View.VISIBLE)return false;
        for(View cursor=view;cursor!=null;cursor=cursor.getParent() instanceof View?(View)cursor.getParent():null)
            if(cursor.getAlpha()<=.01f)return false;
        return true;
    }
    private static final class Surface implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener{
        final WeakReference<View> view;
        final WeakReference<TextView> left,right;
        final Context context;
        final PowerManager power;
        final Runnable changed=()->MAIN.post(this::configuration);
        final BroadcastReceiver environment=new BroadcastReceiver(){@Override public void onReceive(Context c,Intent i){configuration();}};
        ViewTreeObserver observer;
        HandlerThread thread;volatile Handler worker;
        volatile long generation;
        boolean attached,registered,awake,enabled;
        int leftMode,rightMode;
        String originalLeft,originalRight,writtenLeft,writtenRight;
        IslandBatteryReading reading=IslandBatteryReading.unavailable(0);
        Surface(View source)throws Exception{
            context=source.getContext();power=context.getSystemService(PowerManager.class);view=new WeakReference<>(source);
            Object l=MagicIslandScenes.typed(source.getClass(),"mDisplayTitle",TextView.class).get(source);
            Object r=MagicIslandScenes.typed(source.getClass(),"mDisplayText",TextView.class).get(source);
            if(!(l instanceof TextView)||!(r instanceof TextView)||l==r)throw new IllegalStateException("charging_text_pair");
            left=new WeakReference<>((TextView)l);right=new WeakReference<>((TextView)r);capture();
        }
        void capture(){
            TextView l=left.get(),r=right.get();
            if(l!=null&&!Objects.equals(l.getText().toString(),writtenLeft))originalLeft=l.getText().toString();
            if(r!=null&&!Objects.equals(r.getText().toString(),writtenRight))originalRight=r.getText().toString();
        }
        @Override public void onViewAttachedToWindow(View source){
            if(attached)return;attached=true;
            observer=source.getViewTreeObserver();observer.addOnPreDrawListener(this);
            FeatureSettings.addSnapshotListener(context,changed);
            IntentFilter filter=new IntentFilter(Intent.ACTION_SCREEN_OFF);filter.addAction(Intent.ACTION_SCREEN_ON);
            filter.addAction(Intent.ACTION_POWER_DISCONNECTED);filter.addAction(Intent.ACTION_BATTERY_CHANGED);filter.addAction("android.intent.action.USER_SWITCHED");
            try{context.registerReceiver(environment,filter);registered=true;}catch(RuntimeException missing){report("environment_missing:"+missing.getClass().getSimpleName());}
            configuration();
        }
        @Override public void onViewDetachedFromWindow(View source){
            attached=false;stop();restore();FeatureSettings.removeSnapshotListener(changed);MAIN.removeCallbacks(changed);
            if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);observer=null;
            if(registered){try{context.unregisterReceiver(environment);}catch(RuntimeException ignored){}registered=false;}
            for(Lease lease:new ArrayList<>(LEASES.values()))if(lease.view==source)MAIN.post(()->{
                if(!source.isAttachedToWindow()&&LEASES.get(lease.nativeTimeout)==lease)lease.release(true);
            });
        }
        @Override public boolean onPreDraw(){refresh();return true;}
        void configuration(){
            awake=power!=null&&power.isInteractive();enabled=IslandSceneSelection.enabled(context,"charging");
            leftMode=option(context,IslandChargeConfig.LEFT);rightMode=option(context,IslandChargeConfig.RIGHT);
            refresh();View source=view.get();
            for(Lease lease:new ArrayList<>(LEASES.values()))if(lease.view==source)lease.configure();}
        void refresh(){
            View source=view.get();boolean wanted=attached&&visible(source)&&awake&&enabled&&(leftMode!=0||rightMode!=0);
            if(!wanted){stop();restore();return;}
            if(worker==null){
                long token=++generation;thread=new HandlerThread("DuoIslandBattery");thread.start();worker=new Handler(thread.getLooper());
                Handler current=worker;current.post(new Runnable(){@Override public void run(){
                    if(worker!=current||token!=generation)return;
                    IslandBatteryReading next=IslandBatterySource.read(context);
                    MAIN.post(()->{if(worker==current&&token==generation&&attached){reading=next;apply();}});
                    if(worker==current&&token==generation)current.postDelayed(this,2000);
                }});
            }
            apply();
        }
        void apply(){
            if(!attached||!visible(view.get()))return;capture();long now=SystemClock.elapsedRealtime();
            String l=reading.connected?reading.text(leftMode,now):null,r=reading.connected?reading.text(rightMode,now):null;
            TextView lv=left.get(),rv=right.get();
            if(lv!=null){String text=l==null?originalLeft:l;if(text!=null&&!text.contentEquals(lv.getText()))lv.setText(text);writtenLeft=l;}
            if(rv!=null){String text=r==null?originalRight:r;if(text!=null&&!text.contentEquals(rv.getText()))rv.setText(text);writtenRight=r;}
        }
        void restore(){
            TextView l=left.get(),r=right.get();
            if(l!=null&&writtenLeft!=null&&writtenLeft.contentEquals(l.getText())&&originalLeft!=null)l.setText(originalLeft);
            if(r!=null&&writtenRight!=null&&writtenRight.contentEquals(r.getText())&&originalRight!=null)r.setText(originalRight);
            writtenLeft=writtenRight=null;if(reading.present)reading=IslandBatteryReading.unavailable(0);
        }
        void stop(){
            if(worker==null)return;++generation;worker.removeCallbacksAndMessages(null);worker=null;
            if(thread!=null){thread.quitSafely();thread=null;}
        }
    }
    private static void lease(Object owner,View view,boolean fullscreen){
        if(!IslandSceneSelection.enabled(view.getContext(),"charging"))return;
        try{
            Handler handler=(Handler)MagicIslandScenes.typed(owner.getClass(),"mHandler",Handler.class).get(owner);
            Runnable timeout=(Runnable)MagicIslandScenes.typed(owner.getClass(),fullscreen?"mChargingRunnable":"mRunnable",Runnable.class).get(owner);
            MagicIslandScenes.typed(owner.getClass(),"mPluggedIn",boolean.class);
            MagicIslandScenes.typed(owner.getClass(),fullscreen?"mAppIslandList":"mDynamicDisposableContainer",fullscreen?Map.class:ViewGroup.class);
            if(handler==null||timeout==null)throw new IllegalStateException("charging_timer_instance");
            Lease old=LEASES.get(timeout);if(old!=null&&old.owner==owner&&old.view==view){old.configure();return;}
            Lease next=new Lease(owner,view,fullscreen,handler,timeout);if(!next.owns())return;
            Method run=timeout.getClass().getMethod("run");
            if(run.getReturnType()!=void.class||Modifier.isStatic(run.getModifiers()))throw new NoSuchMethodException("charging_run");
            if(!RUN_HOOKS.contains(run)){
                module.registerFeatureHook(module.prepareFeatureHook(run,"island.charge.native_timeout",false).intercept(chain->{
                    Lease current=LEASES.get(chain.getThisObject());
                    if(current==null)return chain.proceed();
                    if(!current.owns()||!IslandSceneSelection.enabled(current.context,"charging")){current.release(false);return chain.proceed();}
                    boolean finish=current.lifetime.nativeTimeout(option(current.context,IslandChargeConfig.DURATION),seconds(current.context),SystemClock.elapsedRealtime());
                    if(!finish){current.configure();return null;}
                    current.release(false);return chain.proceed();
                }));RUN_HOOKS.add(run);
            }
            if(old!=null)old.release(false);LEASES.put(timeout,next);next.configure();
        }catch(Exception unavailable){report("duration_contract_missing:"+unavailable.getClass().getSimpleName()+":"+unavailable.getMessage());}
    }
    private static void retire(Object owner,boolean restore){
        for(Lease lease:new ArrayList<>(LEASES.values()))if(lease.owner==owner)lease.release(restore);
    }
    private static final class Lease {
        final Object owner;final View view;final boolean fullscreen;final Handler handler;final Runnable nativeTimeout;
        final Context context;final IslandChargeLifetime lifetime=new IslandChargeLifetime(SystemClock.elapsedRealtime());
        final Runnable customTimeout=this::expire;
        Lease(Object owner,View view,boolean fullscreen,Handler handler,Runnable timeout){
            this.owner=owner;this.view=view;this.fullscreen=fullscreen;this.handler=handler;nativeTimeout=timeout;context=view.getContext();
        }
        boolean owns(){
            if(!Boolean.TRUE.equals(field(owner,"mPluggedIn")))return false;
            if(fullscreen){Object cards=field(owner,"mAppIslandList");return cards instanceof Map&&((Map<?,?>)cards).get("charging_island")==view;}
            Object container=field(owner,"mDynamicDisposableContainer");
            return container instanceof ViewGroup&&((ViewGroup)container).getChildCount()==1&&((ViewGroup)container).getChildAt(0)==view;
        }
        void configure(){
            MAIN.removeCallbacks(customTimeout);
            if(LEASES.get(nativeTimeout)!=this)return;
            if(!owns()){release(false);return;}
            if(!IslandSceneSelection.enabled(context,"charging")){release(true);return;}
            int mode=option(context,IslandChargeConfig.DURATION);long now=SystemClock.elapsedRealtime();
            if(lifetime.shouldFinish(mode,seconds(context),now)){MAIN.post(customTimeout);return;}
            long remaining=lifetime.remaining(mode,seconds(context),now);if(remaining>=0)MAIN.postDelayed(customTimeout,remaining);
        }
        void expire(){
            if(LEASES.get(nativeTimeout)!=this)return;
            if(!owns()){release(false);return;}
            if(!lifetime.shouldFinish(option(context,IslandChargeConfig.DURATION),seconds(context),SystemClock.elapsedRealtime())){configure();return;}
            release(false);handler.removeCallbacks(nativeTimeout);nativeTimeout.run();
        }
        void release(boolean restoreNative){
            if(LEASES.get(nativeTimeout)!=this)return;
            boolean finish=restoreNative&&lifetime.nativeExpired()&&owns();
            LEASES.remove(nativeTimeout);MAIN.removeCallbacks(customTimeout);lifetime.finish();
            if(finish){handler.removeCallbacks(nativeTimeout);nativeTimeout.run();}
        }
    }
    private NativeIslandCharging(){}
}
