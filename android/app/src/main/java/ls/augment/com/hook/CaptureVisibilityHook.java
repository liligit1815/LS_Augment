package ls.augment.com.hook;

import android.content.Context;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.*;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;
import ls.augment.com.SystemOptions;

/** Excludes the status-bar surface from native capture without changing the user's layout. */
final class CaptureVisibilityHook {
    private static final Uri PROVIDER=Uri.parse("content://ls.augment.com.config");
    private static final String DESCRIPTOR="ls.augment.capture.surface.v1";
    private static final Map<Object,IBinder> LEASES=Collections.synchronizedMap(new IdentityHashMap<>());
    private static final Map<IBinder,Integer> ACTIVE=new HashMap<>();
    private static final Map<IBinder,IBinder.DeathRecipient> DEATHS=new HashMap<>();
    private static final List<WeakReference<View>> VIEWS=new ArrayList<>();
    private static final Map<View,Applied> APPLIED=new WeakHashMap<>();
    private static volatile IBinder cachedEndpoint;
    private static final ExecutorService IPC=Executors.newSingleThreadExecutor(task->{Thread thread=new Thread(task,"LS-Capture-IPC");thread.setDaemon(true);return thread;});
    private static final AtomicBoolean REGISTER_PENDING=new AtomicBoolean();
    private static Handler main;private static Context context;private static SurfaceController controller;
    private CaptureVisibilityHook() { }
    static void install(AugmentModule m,ClassLoader l,String pkg) {
        if("com.android.systemui".equals(pkg)) {
            OemHooks.methods(m,l,"com.android.systemui.statusbar.phone.PhoneStatusBarView","onAttachedToWindow",void.class,0,"",chain->{
                Object result=chain.proceed();View view=(View)chain.getThisObject();attach(view);return result;
            });
        } else if("com.android.ztescreenshot".equals(pkg)) {
            String crop="com.android.ztescreenshot.cropimage.CropImageService";
            OemHooks.methods(m,l,crop,"onStartCommand",int.class,3,"",chain->{
                start(chain.getThisObject(),0);try{return chain.proceed();}catch(Throwable error){stop(chain.getThisObject());throw error;}
            });
            for(String method:new String[]{"saveAndExit","onDestroy"})OemHooks.methods(m,l,crop,method,void.class,0,"",chain->{
                try{return chain.proceed();}finally{stop(chain.getThisObject());}
            });
            String recording="com.android.ztescreenshot.recordscreen.glrecord.ScreenCapture";
            OemHooks.methods(m,l,recording,"attachRecorder",boolean.class,0,"",chain->{
                start(chain.getThisObject(),1);try{Object value=chain.proceed();if(Boolean.FALSE.equals(value))stop(chain.getThisObject());return value;}
                catch(Throwable error){stop(chain.getThisObject());throw error;}
            });
            for(String method:new String[]{"detachRecorder","stopProjection"})OemHooks.methods(m,l,recording,method,boolean.class,0,"",chain->{
                try{return chain.proceed();}finally{stop(chain.getThisObject());}
            });
            // The native full-screen path uses ScreenRecorder's MediaRecorder;
            // only region/GL recordings reach ScreenCapture.attachRecorder.
            // These hooks are installed only inside the native screenshot app,
            // whose sole MediaRecorder is its video recorder. Follow the actual
            // start/pause/stop calls so failed starts cannot retain a lease.
            String media="android.media.MediaRecorder";
            for(String method:new String[]{"start","resume"})OemHooks.methods(m,l,media,method,void.class,0,"",chain->{
                start(chain.getThisObject(),1);
                try{return chain.proceed();}catch(Throwable error){stop(chain.getThisObject());throw error;}
            });
            for(String method:new String[]{"pause","stop","reset","release"})OemHooks.methods(m,l,media,method,void.class,0,"",chain->{
                try{return chain.proceed();}finally{stop(chain.getThisObject());}
            });
        }
    }
    private static void attach(View view) {
        context=view.getContext();if(main==null)main=new Handler(Looper.getMainLooper());
        boolean known=false;for(WeakReference<View> ref:VIEWS)if(ref.get()==view)known=true;
        if(!known){VIEWS.add(new WeakReference<>(view));view.getViewTreeObserver().addOnPreDrawListener(()->{if(!ACTIVE.isEmpty())applySurfaces();return true;});}
        if(controller==null){
            controller=new SurfaceController();FeatureSettings.addSnapshotListener(context,()->main.post(()->applySurfaces()));
            // This wake-only signal cannot change capture state or return the Binder to its sender.
            context.registerReceiver(new BroadcastReceiver(){@Override public void onReceive(Context c,Intent intent){registerEndpoint();}},
                    new IntentFilter("ls.augment.com.CAPTURE_SURFACE_REDISCOVER"),Context.RECEIVER_EXPORTED);
        }
        registerEndpoint();view.post(()->applySurfaces());
    }
    private static void registerEndpoint() {
        Context target=context;SurfaceController endpoint=controller;
        if(target==null||endpoint==null||!REGISTER_PENDING.compareAndSet(false,true))return;
        // Provider acquisition can wait for an app restart. Never do this in
        // onAttachedToWindow or a main-thread broadcast receiver.
        IPC.execute(()->{
            Bundle bundle=new Bundle();bundle.putBinder("controller",endpoint);
            try{target.getContentResolver().call(PROVIDER,"capture_surface_register",null,bundle);}
            catch(RuntimeException ignored) { }
            finally{REGISTER_PENDING.set(false);}
        });
    }
    private static void start(Object owner,int kind) {
        Context c=FeatureSettings.from(owner);if(c==null)return;
        String key=SystemOptions.key(kind==0?"screenshot_hide_status_bar":"record_hide_status_bar");
        if(!FeatureSettings.enabled(c,key)||LEASES.containsKey(owner))return;
        Binder lease=new Binder();if(request(c,lease,kind,true))LEASES.put(owner,lease);
        // Normal service teardown and Binder death release the exact lease; a healthy long
        // screenshot is allowed to take longer than a fixed timer.
    }
    private static void stop(Object owner) {
        IBinder lease=LEASES.remove(owner);if(lease!=null)request(FeatureSettings.from(owner),lease,0,false);
    }
    private static boolean request(Context c,IBinder owner,int kind,boolean active) {
        if(c==null)return false;
        CaptureRequest operation=new CaptureRequest(c,owner,kind,active);
        Future<Boolean> result=IPC.submit(operation::run);
        try{return result.get(650,TimeUnit.MILLISECONDS);}
        catch(Exception error){
            if(error instanceof InterruptedException)Thread.currentThread().interrupt();
            if(active){operation.cancelled.set(true);IPC.execute(operation::release);}
            // A queued stop must still run, even if its caller stopped waiting.
            return false;
        }
    }
    private static final class CaptureRequest {
        final Context context;final IBinder owner;final int kind;final boolean active;
        final AtomicBoolean cancelled=new AtomicBoolean();IBinder endpointUsed;
        CaptureRequest(Context context,IBinder owner,int kind,boolean active){this.context=context;this.owner=owner;this.kind=kind;this.active=active;}
        boolean run(){try{
            if(active&&cancelled.get())return false;
            IBinder endpoint=cachedEndpoint;
            long deadline=SystemClock.uptimeMillis()+500;
            while(endpoint==null||!endpoint.isBinderAlive()) {
                if(active&&cancelled.get())return false;
                Bundle result=context.getContentResolver().call(PROVIDER,"capture_surface_get",null,null);
                endpoint=result==null?null:result.getBinder("controller");
                if(endpoint!=null&&endpoint.isBinderAlive()){cachedEndpoint=endpoint;break;}
                if(SystemClock.uptimeMillis()>=deadline)return false;
                SystemClock.sleep(20);
            }
            endpointUsed=endpoint;
            if(active&&cancelled.get())return false;
            boolean success=transact(endpoint,owner,kind,active);
            if(active&&!success)release();
            return success;
        }catch(Exception ignored){if(active)release();cachedEndpoint=null;return false;}}
        // Keep the exact endpoint: a timeout racing a successful start must not
        // leave a lease behind or release it on a replacement SystemUI process.
        void release(){if(endpointUsed!=null)transact(endpointUsed,owner,kind,false);}
    }
    private static boolean transact(IBinder endpoint,IBinder owner,int kind,boolean active){
        Parcel data=Parcel.obtain(),reply=Parcel.obtain();
        try{
            data.writeInterfaceToken(DESCRIPTOR);data.writeStrongBinder(owner);data.writeInt(kind);data.writeInt(active?1:0);
            if(!endpoint.transact(IBinder.FIRST_CALL_TRANSACTION,data,reply,0))return false;
            reply.readException();return reply.readInt()==1;
        }catch(Exception ignored){return false;}finally{data.recycle();reply.recycle();}
    }
    private static boolean applySurfaces() {
        if(context==null)return false;boolean exclude=false;
        for(int kind:ACTIVE.values())if(FeatureSettings.enabled(context,SystemOptions.key(kind==0?"screenshot_hide_status_bar":"record_hide_status_bar")))exclude=true;
        boolean applied=false,changed=false;
        Iterator<WeakReference<View>> it=VIEWS.iterator();while(it.hasNext()) {
            View view=it.next().get();if(view==null){it.remove();continue;}
            if(!view.isAttachedToWindow())continue;
            try {
                Object root=OemHooks.invoke(view,"getViewRootImpl"),surface=OemHooks.invoke(root,"getSurfaceControl");
                if(!Boolean.TRUE.equals(OemHooks.invoke(surface,"isValid")))continue;
                Object identity=OemHooks.field(surface,"mNativeObject");if(identity==null)identity=surface;
                Applied previous=APPLIED.get(view);
                if(previous!=null&&previous.identity.equals(identity)&&previous.exclude==exclude){applied=true;continue;}
                Class<?> type=Class.forName("android.view.SurfaceControl$Transaction");Object transaction=type.getDeclaredConstructor().newInstance();
                try {OemHooks.invoke(transaction,"setSkipScreenshot",surface,exclude);OemHooks.invoke(transaction,"apply",true);APPLIED.put(view,new Applied(identity,exclude));applied=true;changed=true;}
                finally {OemHooks.invoke(transaction,"close");}
            }catch(Exception ignored) { }
        }
        if(changed)FeatureSettings.diagnostic(context,"ls_augment_rm_capture_surface_runtime","excluded="+exclude+"|leases="+ACTIVE.size()+"|time="+System.currentTimeMillis());
        return applied;
    }
    private static final class Applied {final Object identity;final boolean exclude;Applied(Object identity,boolean exclude){this.identity=identity;this.exclude=exclude;}}
    private static final class SurfaceController extends Binder {
        @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags)throws RemoteException {
            if(code!=IBinder.FIRST_CALL_TRANSACTION)return super.onTransact(code,data,reply,flags);
            data.enforceInterface(DESCRIPTOR);int uid=Binder.getCallingUid();
            String[] packages=context.getPackageManager().getPackagesForUid(uid);
            if(uid/100000!=android.os.Process.myUid()/100000||packages==null||!Arrays.asList(packages).contains("com.android.ztescreenshot"))throw new SecurityException("capture client only");
            IBinder owner=data.readStrongBinder();int kind=data.readInt();boolean active=data.readInt()!=0;
            if(owner==null||kind<0||kind>1)throw new IllegalArgumentException("invalid lease");
            CountDownLatch ready=new CountDownLatch(1);boolean[] success={false};java.util.concurrent.atomic.AtomicBoolean cancelled=new java.util.concurrent.atomic.AtomicBoolean();
            long deadline=SystemClock.uptimeMillis()+400;
            Runnable operation=new Runnable(){boolean registered;
                @Override public void run(){try{
                if(cancelled.get())return;
                if(!registered) {
                if(active) {
                    if(!ACTIVE.containsKey(owner)) {
                        IBinder.DeathRecipient death=()->main.post(()->{ACTIVE.remove(owner);DEATHS.remove(owner);applySurfaces();});
                        owner.linkToDeath(death,0);DEATHS.put(owner,death);
                    }
                    ACTIVE.put(owner,kind);
                } else {ACTIVE.remove(owner);IBinder.DeathRecipient death=DEATHS.remove(owner);if(death!=null)owner.unlinkToDeath(death,0);}
                registered=true;
                }
                success[0]=applySurfaces();
                if(!success[0]&&active&&SystemClock.uptimeMillis()<deadline){main.postDelayed(this,16);return;}
                ready.countDown();
            }catch(Exception ignored) {ready.countDown();}}};
            main.post(operation);
            try{if(!ready.await(500,TimeUnit.MILLISECONDS)&&active){cancelled.set(true);main.removeCallbacks(operation);}}
            catch(InterruptedException interrupted){if(active){cancelled.set(true);main.removeCallbacks(operation);}Thread.currentThread().interrupt();}
            reply.writeNoException();reply.writeInt(success[0]?1:0);return true;
        }
    }
}
