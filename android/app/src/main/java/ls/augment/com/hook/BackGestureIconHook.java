package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Path;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import io.github.libxposed.api.XposedInterface.HookHandle;
import ls.augment.com.BackGestureIconPolicy;
import ls.augment.com.GestureArtwork;
import ls.augment.com.ConfigSnapshot;

/** RedMagic SeaWave adapter. Neither input dispatch nor the OEM animation is replaced. */
final class BackGestureIconHook {
    private static final String PACKAGE="com.zte.feature.fullscreen_gesture.";
    private static final ThreadLocal<Frame> DRAW=new ThreadLocal<>();
    private static final Map<View,State> SESSIONS=new WeakHashMap<>();
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->new Thread(r,"LSA-gesture-icons"));
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static volatile State requested=State.empty(),ready=State.empty();
    private static volatile boolean installed;
    private static boolean waveInstalled;
    private static Context context;
    private static String signature="";
    private static volatile long generation;
    private static Field position,hover,iconRect,iconPaint,backBitmap;
    private static Field wavePath,linePath,wavePaint,linePaint,waveScale;
    private static Method nativeIcon;
    private static AugmentModule module;
    private static final long[] hits=new long[2],lastReport=new long[2];
    private static long lastError;
    private BackGestureIconHook() { }

    static synchronized int install(AugmentModule owner,ClassLoader loader) {
        if(installed)return 0;
        module=owner;List<HookHandle> handles=new ArrayList<>();
        try {
            Class<?> wave=Class.forName(PACKAGE+"SeaWaveView",false,loader);
            Class<?> icons=Class.forName(PACKAGE+"GestureIcon",false,loader);
            if(!View.class.isAssignableFrom(wave))throw new NoSuchFieldException("SeaWaveView is not a View");
            position=field(wave,"mPosition",int.class,false);hover=field(wave,"mIsHover",boolean.class,false);
            iconRect=field(wave,"mIconRect",Rect.class,false);iconPaint=field(wave,"mIconPaint",Paint.class,false);
            backBitmap=field(icons,"mBack",Bitmap.class,true);
            Method draw=method(wave,"drawIcon",void.class,false,Canvas.class);
            Method get=method(icons,"getIcon",Bitmap.class,true,boolean.class);
            nativeIcon=get;
            Method init=method(wave,"init",void.class,false,Context.class);
            Method down=method(wave,"onActionDown",void.class,false,float.class,float.class,float.class);
            // Probe the geometry producer, even though it runs entirely unmodified.
            method(wave,"updateIconRect",void.class,false);
            handles.add(owner.prepareFeatureHook(get,"back_icon.bitmap",false).intercept(chain->{
                Object original=chain.proceed();Frame frame=DRAW.get();
                if(!installed||frame==null||Boolean.TRUE.equals(chain.getArg(0)))return original;
                try {
                    if(!BackGestureIconPolicy.eligible(frame.side,false,original!=null&&original==backBitmap.get(null)))return original;
                    frame.adjust();record(frame.view,frame.side);return frame.artwork.frame();
                } catch(Throwable error) {frame.restore();report(error);return original;}
            }));
            handles.add(owner.prepareFeatureHook(draw,"back_icon.draw",false).intercept(chain->{
                View view=(View)chain.getThisObject();ensureContext(view.getContext());
                Frame frame=null;
                if(installed&&requested.enabled)try {
                    int side=position.getInt(view);State session;
                    synchronized(SESSIONS){session=SESSIONS.get(view);}
                    if(session==null)session=ready;
                    if(side>=0&&side<2&&requested.sides[side].custom&&session.enabled&&session.sides[side].custom
                            &&session.images[side]!=null&&!hover.getBoolean(view)&&view.getWidth()>0&&view.getHeight()>0)
                        frame=new Frame(view,side,session);
                }catch(Throwable error){report(error);}
                // Always shadow an outer frame, even for a disabled or unsupported nested view.
                Frame previous=DRAW.get();if(frame==null)DRAW.remove();else DRAW.set(frame);
                try {return chain.proceed();}
                finally {
                    try {if(frame!=null)frame.restore();}
                    finally {if(previous==null)DRAW.remove();else DRAW.set(previous);}
                }
            }));
            handles.add(owner.prepareFeatureHook(init,"back_icon.init",false).intercept(chain->{
                Object result=chain.proceed();ensureContext((Context)chain.getArg(0));return result;
            }));
            handles.add(owner.prepareFeatureHook(down,"back_icon.session",false).intercept(chain->{
                View view=(View)chain.getThisObject();ensureContext(view.getContext());
                Object result=chain.proceed();
                synchronized(SESSIONS){
                    State old=SESSIONS.put(view,ready);if(old!=null)old.stop();
                    int edge=position.getInt(view);
                    if(requested.enabled&&edge>=0&&edge<2)ready.start(view,edge);
                }
                return result;
            }));
            Method up=method(wave,"onActionUp",void.class,false,float.class,android.animation.Animator.AnimatorListener.class);
            handles.add(owner.prepareFeatureHook(up,"back_icon.end",false).intercept(chain->{
                Object result=chain.proceed();View view=(View)chain.getThisObject();
                State ending;synchronized(SESSIONS){ending=SESSIONS.get(view);}
                if(ending!=null){long playback=ending.playback;MAIN.postDelayed(()->{
                    if(ending.playback==playback)ending.stop();
                },600);}
                return result;
            }));
            // A missing background contract must not disable previously supported custom icons.
            try {
                wavePath=field(wave,"mPath",Path.class,false);linePath=field(wave,"mLinePath",Path.class,false);
                wavePaint=field(wave,"mWavePaint",Paint.class,false);linePaint=field(wave,"mLinePaint",Paint.class,false);
                waveScale=field(wave,"mScale",float.class,false);
                Method drawWave=method(wave,"drawWave",void.class,false,Canvas.class);
                handles.add(owner.prepareFeatureHook(drawWave,"back_icon.wave",false).intercept(chain->{
                    View view=(View)chain.getThisObject();WaveFrame frame=null;
                    try {frame=waveFrame(view);}catch(Throwable error){report(error);}
                    if(frame==null)return chain.proceed();
                    Canvas canvas=(Canvas)chain.getArg(0);int save=canvas.save();
                    // Keep native path/gradient calculations and animation state; hide only its pixels.
                    try {canvas.clipRect(0,0,0,0);chain.proceed();}
                    finally {canvas.restoreToCount(save);}
                    try {frame.draw(canvas);}
                    catch(Throwable error){report(error);frame.drawNative(canvas);}
                    return null;
                }));
                waveInstalled=true;
            }catch(Throwable error){owner.logFeatureError("BACK_ICON_WAVE_UNAVAILABLE",error);}
            installed=true;for(HookHandle handle:handles)owner.registerFeatureHook(handle);
            // Callers can inline these small final/static methods on an optimized ROM.
            owner.deoptimize(draw);owner.deoptimize(wave.getDeclaredMethod("onDraw",Canvas.class));
            owner.logFeatureInfo("BACK_ICON_READY adapter=SeaWaveView hooks="+handles.size());
            return handles.size();
        }catch(Throwable error){
            installed=false;
            waveInstalled=false;
            for(HookHandle handle:handles)try{handle.unhook();}catch(Throwable ignored){}
            owner.logFeatureError("BACK_ICON_UNAVAILABLE",error);return 0;
        }
    }
    private static Field field(Class<?> owner,String name,Class<?> type,boolean isStatic)throws Exception {
        Field field=owner.getDeclaredField(name);
        if(field.getType()!=type||Modifier.isStatic(field.getModifiers())!=isStatic)throw new NoSuchFieldException(name);
        field.setAccessible(true);return field;
    }
    private static Method method(Class<?> owner,String name,Class<?> result,boolean isStatic,Class<?>... args)throws Exception {
        Method method=owner.getDeclaredMethod(name,args);
        if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers())!=isStatic)throw new NoSuchMethodException(name);
        method.setAccessible(true);return method;
    }
    private static synchronized void ensureContext(Context value) {
        if(context!=null||value==null)return;
        context=value.getApplicationContext();if(context==null)context=value;
        Context app=context;
        MAIN.post(()->{
            FeatureSettings.addSnapshotListener(app,BackGestureIconHook::refresh);
            FeatureSettings.diagnostic(app,"ls_augment_back_icon_adapter","SeaWaveView; installed="+installed+";wave="+waveInstalled);
            refresh();
        });
    }
    /** Only this callback performs configuration work; never decode or use Binder in drawIcon. */
    private static void refresh() {
        if(context==null||!installed)return;
        ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
        StringBuilder key=new StringBuilder(snapshot.get(BackGestureIconPolicy.ENABLED));
        for(String parameter:BackGestureIconPolicy.parameterKeys())key.append('|').append(snapshot.get(parameter));
        if(signature.equals(key.toString()))return;
        signature=key.toString();long token=++generation;
        State next=new State(snapshot);requested=next;
        if(!next.enabled){ready.stop();synchronized(SESSIONS){for(State state:SESSIONS.values())state.stop();SESSIONS.clear();}ready=next;return;}
        State previous=ready;
        WORKER.execute(()->{
            if(token!=generation)return;
            boolean failed=false;
            for(int side=0;side<2;side++){
                try {
                    BackGestureIconPolicy.Side setting=next.sides[side];
                    if(setting.custom)next.images[side]=load(context,setting.hash,setting.mirror,true);
                }catch(Exception|OutOfMemoryError error){failed=true;report(error);}
                if(token!=generation)return;
                if(BackGestureIconPolicy.validAsset(next.sides[side].backgroundHash))try{
                    String hash=next.sides[side].backgroundHash;
                    next.backgrounds[side]=load(context,hash,false,false);
                }catch(Exception|OutOfMemoryError error){failed=true;report(error);}
            }
            boolean retry=failed;
            MAIN.post(()->{
                if(token!=generation)return;
                ready=next;
                FeatureSettings.diagnostic(context,"ls_augment_back_icon_resources","left="+resourceState(next,0)+";right="+resourceState(next,1));
                if(!retry)FeatureSettings.diagnostic(context,"ls_augment_back_icon_error","");
                // Includes early boot, a temporarily unavailable Provider, and unlock recovery.
                if(retry)MAIN.postDelayed(()->{if(token==generation){signature="";refresh();}},5000);
            });
        });
    }
    private static String resourceState(State state,int side){return !state.sides[side].custom?"stock":state.images[side]==null?"unavailable_stock":state.backgrounds[side]==null?"icon_ready":"icon_and_background_ready";}
    private static GestureArtwork load(Context context,String assetHash,boolean mirror,boolean squareIcon)throws Exception {
        byte[] bytes;
        try(InputStream in=context.getContentResolver().openInputStream(Uri.parse("content://ls.augment.com.config/gesture-icon/"+assetHash))){
            bytes=GestureArtwork.read(in);
        }
        StringBuilder hash=new StringBuilder();for(byte value:MessageDigest.getInstance("SHA-256").digest(bytes))hash.append(String.format(java.util.Locale.ROOT,"%02x",value&255));
        if(!assetHash.contentEquals(hash))throw new java.io.IOException("Gesture icon checksum mismatch");
        return GestureArtwork.decode(bytes,squareIcon,mirror);
    }
    private static final class State {
        final boolean enabled;
        final BackGestureIconPolicy.Side[] sides=new BackGestureIconPolicy.Side[2];
        final GestureArtwork[] images=new GestureArtwork[2];
        final GestureArtwork[] backgrounds=new GestureArtwork[2];
        long playback;
        void start(View view,int side){
            long token=++playback;
            // The OEM caller may only attach/show its window after onActionDown returns.
            MAIN.post(()->{if(token!=playback||!requested.enabled)return;
                if(images[side]!=null)images[side].start(view);
                if(backgrounds[side]!=null)backgrounds[side].start(view);
            });
        }
        void stop(){playback++;for(GestureArtwork image:images)if(image!=null)image.stop();for(GestureArtwork image:backgrounds)if(image!=null)image.stop();}
        State(ConfigSnapshot snapshot){enabled="1".equals(snapshot.get(BackGestureIconPolicy.ENABLED));for(int side=0;side<2;side++)sides[side]=new BackGestureIconPolicy.Side(snapshot::get,side);}
        static State empty(){return new State(ConfigSnapshot.safeDefaults());}
    }
    private static WaveFrame waveFrame(View view)throws Exception {
        if(!installed||!requested.enabled)return null;
        int side=position.getInt(view);
        if(side<0||side>1||hover.getBoolean(view))return null;
        if(!BackGestureIconPolicy.validAsset(requested.sides[side].backgroundHash)&&requested.sides[side].backgroundScale==100)return null;
        State state;synchronized(SESSIONS){state=SESSIONS.get(view);}if(state==null)state=ready;
        if(!state.enabled||(state.backgrounds[side]==null&&state.sides[side].backgroundScale==100))return null;
        Frame previous=DRAW.get();DRAW.remove();Object nativeBitmap;
        try{nativeBitmap=nativeIcon.invoke(null,false);}finally{if(previous!=null)DRAW.set(previous);}
        if(nativeBitmap==null||nativeBitmap!=backBitmap.get(null))return null;
        return new WaveFrame(view,side,state);
    }
    private static final class WaveFrame {
        final View view;final int side;final GestureArtwork artwork;final BackGestureIconPolicy.Side settings;final Path path,line;
        final Paint originalFill,originalLine,paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
        final RectF rect=new RectF();
        WaveFrame(View view,int side,State state)throws Exception{
            this.view=view;this.side=side;artwork=state.backgrounds[side];settings=state.sides[side];
            path=(Path)wavePath.get(view);line=(Path)linePath.get(view);
            originalFill=(Paint)wavePaint.get(view);originalLine=(Paint)linePaint.get(view);
            if(path==null||line==null||originalFill==null||originalLine==null)throw new IllegalStateException("Wave state unavailable");
        }
        void draw(Canvas canvas)throws Exception{
            path.computeBounds(rect,true);
            float scale=waveScale.getFloat(view);
            if(!Float.isFinite(scale)||rect.isEmpty()||scale<=0)return;
            float factor=settings.backgroundScale/100f;
            if(artwork==null){
                int save=canvas.save();
                try{canvas.scale(factor,factor,side==0?rect.left:rect.right,rect.centerY());drawNative(canvas);}
                finally{canvas.restoreToCount(save);}
                return;
            }
            float width=rect.width()*factor,height=rect.height()*factor,cy=rect.centerY();
            if(side==0)rect.right=rect.left+width;else rect.left=rect.right-width;
            rect.top=cy-height/2;rect.bottom=cy+height/2;
            paint.setAlpha(Math.round(255*Math.min(1,scale)));
            int save=canvas.save();
            try{if(side==1)canvas.scale(-1,1,rect.centerX(),rect.centerY());canvas.drawBitmap(artwork.frame(),null,rect,paint);}
            finally{canvas.restoreToCount(save);}
        }
        void drawNative(Canvas canvas){canvas.drawPath(path,originalFill);canvas.drawPath(line,originalLine);}
    }
    private static final class Frame {
        final View view;final int side;final GestureArtwork artwork;final BackGestureIconPolicy.Side settings;
        final Rect rect;final Paint paint;final int[] target=new int[4];
        int left,top,right,bottom,alpha;boolean changed;
        Frame(View view,int side,State state)throws Exception {
            this.view=view;this.side=side;artwork=state.images[side];settings=state.sides[side];
            rect=(Rect)iconRect.get(view);paint=(Paint)iconPaint.get(view);
            if(rect==null||paint==null)throw new IllegalStateException("Gesture draw state unavailable");
        }
        void adjust(){
            if(changed)return;
            left=rect.left;top=rect.top;right=rect.right;bottom=rect.bottom;alpha=paint.getAlpha();changed=true;
            BackGestureIconPolicy.bounds(left,top,right,bottom,view.getWidth(),view.getHeight(),view.getResources().getDisplayMetrics().density,side,settings,target);
            rect.set(target[0],target[1],target[2],target[3]);paint.setAlpha(BackGestureIconPolicy.alpha(alpha,settings.opacity));
        }
        void restore(){if(changed){rect.set(left,top,right,bottom);paint.setAlpha(alpha);changed=false;}}
    }
    private static synchronized void record(View view,int side){
        hits[side]++;long now=SystemClock.elapsedRealtime();if(hits[side]!=1&&now-lastReport[side]<5000)return;
        lastReport[side]=now;
        FeatureSettings.diagnostic(view.getContext(),"ls_augment_back_icon_"+BackGestureIconPolicy.SIDES[side],"hits="+hits[side]+";adapter=SeaWaveView");
    }
    private static synchronized void report(Throwable error){
        long now=SystemClock.elapsedRealtime();if(lastError!=0&&now-lastError<5000)return;lastError=now;
        module.logFeatureError("BACK_ICON_FALLBACK",error);
        if(context!=null)FeatureSettings.diagnostic(context,"ls_augment_back_icon_error",error.getClass().getSimpleName()+": "+error.getMessage());
    }
}
