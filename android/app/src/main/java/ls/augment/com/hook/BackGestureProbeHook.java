package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import io.github.libxposed.api.XposedInterface.HookHandle;
import io.github.libxposed.api.XposedInterface.HookBuilder;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import io.github.libxposed.api.XposedInterface;
import ls.augment.com.BackGestureProbeTrace;
import ls.augment.com.BuildConfig;

/** Temporary, module-UID-only observation. Never injects, changes native fields, or changes a Canvas. */
final class BackGestureProbeHook {
    private static final String PREFIX="com.zte.feature.fullscreen_gesture.";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ThreadLocal<BackGestureProbeTrace> INPUT=new ThreadLocal<>();
    private static final ThreadLocal<Integer> INDEX=new ThreadLocal<>();
    private static final ThreadLocal<View> DRAW=new ThreadLocal<>();
    private static volatile BackGestureProbeTrace armed;
    private static volatile View trackedView;
    private static Context context;
    private static BroadcastReceiver receiver;
    private static boolean installed;
    private static Field status,direction,animation,count,scale,ready,position,rect,paint,needDraw,shown,hover;
    private BackGestureProbeHook(){}

    static void install(AugmentModule owner,ClassLoader loader){
        if(installed)return;List<HookHandle> handles=new ArrayList<>();
        try {
            Class<?> controller=Class.forName(PREFIX+"GestureController",false,loader);
            Class<?> wave=Class.forName(PREFIX+"SeaWaveView",false,loader);
            status=field(controller,"mSwipeStatus");direction=field(controller,"mDragDirection");animation=field(controller,"mIsGestureAnimationEnabled");
            count=field(wave,"mCount");scale=field(wave,"mScale");ready=field(wave,"mReadyState");position=field(wave,"mPosition");
            rect=field(wave,"mIconRect");paint=field(wave,"mIconPaint");needDraw=field(wave,"mIconNeedDraw");
            shown=field(wave,"mIconShown");hover=field(wave,"mIsHover");
            Method pointer=method(controller,"onPointerEvent",MotionEvent.class);
            handles.add(prepare(owner,pointer,"pointer").intercept(chain->{
                MotionEvent event=(MotionEvent)chain.getArg(0);Object host=chain.getThisObject();
                BackGestureProbeTrace trace=armed;if(trace==null||trace.closed)return chain.proceed();
                int index=-1;long now=SystemClock.uptimeMillis();
                if(trace!=null){
                    int id=System.identityHashCode(host);
                    if(event.getActionMasked()==MotionEvent.ACTION_DOWN)
                        trace.begin(id,event.getDownTime(),event.getEventTime(),now,event.getRawX(),event.getRawY());
                    if(!trace.accepts(id,event.getDownTime(),now))trace=null;
                }
                BackGestureProbeTrace previous=INPUT.get();Integer previousIndex=INDEX.get();
                if(trace!=null)try{
                    index=trace.input(event.getActionMasked(),event.getEventTime(),now,event.getHistorySize(),
                            status.getInt(host),direction.getInt(host),animation.getBoolean(host));
                }catch(Throwable ignored){trace.error();}
                if(trace==null){INPUT.remove();INDEX.remove();}else{INPUT.set(trace);INDEX.set(index);}
                boolean completed=false;
                try{Object result=chain.proceed();completed=true;return result;}
                finally {
                    if(previous==null)INPUT.remove();else INPUT.set(previous);
                    if(previousIndex==null)INDEX.remove();else INDEX.set(previousIndex);
                    if(trace!=null){
                        try{if(!completed)trace.error();trace.returned(index,status.getInt(host),SystemClock.uptimeMillis(),event.getActionMasked());
                            if(!completed&&trace.closed)trace.phase="native_error";}
                        catch(Throwable ignored){trace.error();}
                        if(trace.closed&&armed==trace)trackedView=null;
                        if(trace.closed&&trace.cancelReceived>0){BackGestureProbeTrace finished=trace;MAIN.post(()->publish(finished));}
                    }
                }
            }));
            for(String name:new String[]{"processPointerEvent","processPointerEventWithoutAnimating"}){
                Method process=method(controller,name,MotionEvent.class);boolean without=name.endsWith("WithoutAnimating");
                handles.add(prepare(owner,process,name).intercept(chain->{
                    BackGestureProbeTrace trace=INPUT.get();Integer i=INDEX.get();if(trace!=null&&i!=null)trace.processed(i,without);
                    return chain.proceed();
                }));owner.deoptimize(process);
            }
            Method down=method(wave,"onActionDown",float.class,float.class,float.class);
            handles.add(prepare(owner,down,"wave_down").intercept(chain->{
                Object result=chain.proceed();BackGestureProbeTrace trace=INPUT.get();
                if(trace!=null)try{View view=(View)chain.getThisObject();if(position.getInt(view)==trace.side){
                    trackedView=view;trace.waveDown(System.identityHashCode(view));
                }}catch(Throwable ignored){trace.error();}return result;
            }));
            Method move=method(wave,"onActionMove",float.class);
            handles.add(prepare(owner,move,"wave_move").intercept(chain->{
                View view=(View)chain.getThisObject();BackGestureProbeTrace trace=tracked(view);int before=-1;
                if(trace!=null)try{before=count.getInt(view);}catch(Throwable ignored){trace.error();}
                Object result=chain.proceed();
                if(trace!=null)try{trace.move(SystemClock.uptimeMillis(),((Number)chain.getArg(0)).floatValue(),before,
                        count.getInt(view),scale.getFloat(view),ordinal(view));}catch(Throwable ignored){trace.error();}
                return result;
            }));
            Method draw=method(wave,"drawIcon",Canvas.class);
            handles.add(prepare(owner,draw,"draw").intercept(chain->{
                View view=(View)chain.getThisObject();BackGestureProbeTrace trace=tracked(view);View previous=DRAW.get();
                if(trace==null)DRAW.remove();else DRAW.set(view);
                try{return chain.proceed();}
                finally{
                    if(trace!=null)readDraw(trace,view);
                    if(previous==null)DRAW.remove();else DRAW.set(previous);
                }
            }));
            handles.add(prepare(owner,method(wave,"drawWave",Canvas.class),"wave_draw").intercept(chain->{
                BackGestureProbeTrace trace=tracked((View)chain.getThisObject());if(trace!=null)trace.wave();return chain.proceed();
            }));
            Method onDraw=method(wave,"onDraw",Canvas.class);
            handles.add(prepare(owner,onDraw,"on_draw").intercept(chain->{
                BackGestureProbeTrace trace=tracked((View)chain.getThisObject());if(trace!=null)trace.onDraw();return chain.proceed();
            }));
            installed=true;for(HookHandle handle:handles)owner.registerFeatureHook(handle);
            owner.deoptimize(pointer);owner.deoptimize(draw);owner.deoptimize(move);owner.deoptimize(down);
            owner.deoptimize(onDraw);
        }catch(Throwable error){for(HookHandle handle:handles)try{handle.unhook();}catch(Throwable ignored){}
            installed=false;owner.logFeatureError("BACK_PROBE_UNAVAILABLE",error);}
    }

    private static HookBuilder prepare(AugmentModule owner,Method method,String id){
        // Do not enroll these temporary counters in the general periodic telemetry writer.
        return owner.hook(method).setId("ls_augment.api102.back_probe."+id)
                .setPriority(XposedInterface.PRIORITY_LOWEST).setExceptionMode(ExceptionMode.PROTECTIVE);
    }

    /** Called at the existing getIcon return points; observes the actual selection, not asset readiness. */
    static void iconReturned(boolean custom){
        View view=DRAW.get();BackGestureProbeTrace trace=tracked(view);if(trace!=null){
            trace.icon(custom);try{Rect box=(Rect)rect.get(view);Paint value=(Paint)paint.get(view);
                trace.selection(value.getAlpha(),box.left,box.top,box.right,box.bottom);
            }catch(Throwable ignored){trace.error();}
        }
    }
    private static BackGestureProbeTrace tracked(View view){
        BackGestureProbeTrace trace=armed;
        return view!=null&&view==trackedView&&trace!=null&&!trace.closed&&trace.downTime!=0?trace:null;
    }
    private static void readDraw(BackGestureProbeTrace trace,View view){
        try{Rect box=(Rect)rect.get(view);Paint p=(Paint)paint.get(view);
            int flags=(view.getVisibility()==View.VISIBLE?1:0)|(view.isShown()?2:0)|(needDraw.getBoolean(view)?4:0)
                    |(shown.getBoolean(view)?8:0)|(hover.getBoolean(view)?16:0);
            trace.draw(SystemClock.uptimeMillis(),scale.getFloat(view),ordinal(view),count.getInt(view),p.getAlpha(),
                    box.left,box.top,box.right,box.bottom,view.getWidth(),view.getHeight(),flags);
        }catch(Throwable ignored){trace.error();}
    }
    private static int ordinal(View view)throws Exception{Object value=ready.get(view);return value instanceof Enum<?>?((Enum<?>)value).ordinal():-1;}
    private static Field field(Class<?> type,String name)throws Exception{Field result=type.getDeclaredField(name);result.setAccessible(true);return result;}
    private static Method method(Class<?> type,String name,Class<?>... args)throws Exception{Method result=type.getDeclaredMethod(name,args);result.setAccessible(true);return result;}

    /** Registered after init, outside a held gesture. A missing/hidden sender identity always fails closed. */
    static void attach(Context app){
        if(!installed||receiver!=null||app==null)return;context=app;
        BroadcastReceiver candidate=new BroadcastReceiver(){@Override public void onReceive(Context c,Intent intent){
            try {
                int moduleUid=c.getPackageManager().getPackageUid("ls.augment.com",0);
                if(!BackGestureProbeTrace.authorized(getSentFromUid(),moduleUid,getSentFromPackage()))return;
                if(!BackGestureProbeTrace.ACTION.equals(intent.getAction()))return;
                String nonce=intent.getStringExtra("nonce");
                if("disarm".equals(intent.getStringExtra("command"))){
                    BackGestureProbeTrace old=armed;if(old!=null&&old.nonce.equals(nonce)){old.expire();armed=null;trackedView=null;}return;
                }
                if(!"arm".equals(intent.getStringExtra("command")))return;
                long revision=intent.getLongExtra("revision",-1),generation=intent.getLongExtra("generation",-1);
                if(intent.getIntExtra("pid",-1)!=Process.myPid()||intent.getIntExtra("build",-1)!=BuildConfig.VERSION_CODE
                        ||intent.getLongExtra("processStarted",-1)!=Process.getStartElapsedRealtime()
                        ||!BackGestureIconHook.probeCurrent(revision,generation))return;
                BackGestureProbeTrace old=armed;
                if(old!=null&&!old.closed&&old.downTime!=0)return;
                BackGestureProbeTrace next=new BackGestureProbeTrace(nonce,revision,generation,Process.myPid(),BuildConfig.VERSION_CODE,
                        Process.getStartElapsedRealtime(),intent.getIntExtra("side",-1),SystemClock.uptimeMillis(),
                        intent.getFloatExtra("startX",Float.NaN),intent.getFloatExtra("startY",Float.NaN));
                if(old!=null)old.expire();trackedView=null;armed=next;
                FeatureSettings.diagnostic(c,BackGestureProbeTrace.KEY+"_arm",next.json(0));
                MAIN.postDelayed(()->{if(armed==next){next.expire();armed=null;trackedView=null;}},BackGestureProbeTrace.ARM_MILLIS);
            }catch(Throwable ignored){/* Compatibility failure cannot arm or affect native input. */}
        }};
        try{app.registerReceiver(candidate,new IntentFilter(BackGestureProbeTrace.ACTION),null,MAIN,Context.RECEIVER_EXPORTED);receiver=candidate;}
        catch(Throwable ignored){context=null;}
    }
    private static void publish(BackGestureProbeTrace trace){
        // A newer ARM/DISARM or timeout invalidates an old posted completion.
        if(armed!=trace||trace.expired||!trace.closed||context==null)return;
        try{for(int part=1;part<=BackGestureProbeTrace.PARTS;part++)FeatureSettings.diagnostic(context,BackGestureProbeTrace.KEY+"_"+part,trace.json(part));
            FeatureSettings.diagnostic(context,BackGestureProbeTrace.KEY,trace.json(0));}
        catch(Throwable ignored){/* Missing evidence stays missing; never substitute an older session. */}
    }
}
