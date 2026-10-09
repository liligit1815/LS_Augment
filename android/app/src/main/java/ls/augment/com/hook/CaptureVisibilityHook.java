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
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import ls.augment.com.BuildConfig;
import ls.augment.com.CaptureRuntimeObservation;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.ConfigSchema;
import ls.augment.com.SystemOptions;

/** Excludes the status-bar surface from native capture without changing the user's layout. */
final class CaptureVisibilityHook {
    private static final Uri PROVIDER=Uri.parse("content://ls.augment.com.config");
    private static final String DESCRIPTOR="ls.augment.capture.surface.v1";
    private static final Map<Object,IBinder> LEASES=Collections.synchronizedMap(new IdentityHashMap<>());
    // Lease state belongs to CONTROL. View state belongs to the UI thread.
    private static final Map<IBinder,Lease> ACTIVE=new HashMap<>();
    private static final Map<IBinder,IBinder.DeathRecipient> DEATHS=new HashMap<>();
    private static final List<ViewEntry> VIEWS=new ArrayList<>();
    private static final Object SURFACE_LOCK=new Object();
    private static final List<OwnedSurface> RETIRED=new ArrayList<>();
    private static volatile SurfaceSnapshot surfaces=new SurfaceSnapshot(0,0,Collections.emptyList(),"no_surface");
    private static volatile Decision desired=new Decision(0,0,Collections.emptyList(),false,false,false);
    private static volatile boolean surfaceRepairNeeded;
    private static long decisionSequence;
    private static volatile String lastSurfaceDiagnostic="";
    private static volatile IBinder cachedEndpoint;
    private static final ExecutorService IPC=Executors.newSingleThreadExecutor(task->{Thread thread=new Thread(task,"LS-Capture-IPC");thread.setDaemon(true);return thread;});
    private static final ScheduledExecutorService CONTROL=Executors.newSingleThreadScheduledExecutor(task->{Thread thread=new Thread(task,"LS-Capture-Control");thread.setDaemon(true);return thread;});
    private static final AtomicBoolean REGISTER_PENDING=new AtomicBoolean();
    private static final AtomicBoolean REPAIR_PENDING=new AtomicBoolean();
    private static final AtomicLong observationSequence=new AtomicLong();
    private static volatile Handler main;private static volatile Context context;private static SurfaceController controller;
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
        if(Looper.myLooper()!=Looper.getMainLooper()){main.post(()->attach(view));return;}
        ViewEntry known=null;for(ViewEntry entry:VIEWS)if(entry.view.get()==view)known=entry;
        if(known==null){known=new ViewEntry(view);VIEWS.add(known);view.addOnAttachStateChangeListener(known);}
        known.detached=false;known.bindObserver(view);
        if(controller==null){
            controller=new SurfaceController();FeatureSettings.addSnapshotListener(context,()->CONTROL.execute(()->{updateDecision(null);applySurfaces();}));
            // This wake-only signal cannot change capture state or return the Binder to its sender.
            context.registerReceiver(new BroadcastReceiver(){@Override public void onReceive(Context c,Intent intent){registerEndpoint();}},
                    new IntentFilter("ls.augment.com.CAPTURE_SURFACE_REDISCOVER"),Context.RECEIVER_EXPORTED);
        }
        refreshSurfaces();registerEndpoint();
    }
    private static void registerEndpoint() {
        Context target=context;SurfaceController endpoint=controller;
        if(target==null||endpoint==null||!REGISTER_PENDING.compareAndSet(false,true))return;
        // Provider acquisition can wait for an app restart. Never do this in
        // onAttachedToWindow or a main-thread broadcast receiver.
        CaptureRuntimeObservation observation=observation(-1);observation.phase="register_queued";
        publish(target,"endpoint",observation);
        IPC.execute(()->{
            observation.phase="register_call";publish(target,"endpoint",observation);
            Bundle bundle=new Bundle();bundle.putBinder("controller",endpoint);
            try{target.getContentResolver().call(PROVIDER,"capture_surface_register",null,bundle);observation.phase="register_returned_no_ack";}
            catch(RuntimeException ignored) {observation.phase="register_exception";}
            finally{REGISTER_PENDING.set(false);publish(target,"endpoint",observation);}
        });
    }
    private static void start(Object owner,int kind) {
        Context c=FeatureSettings.from(owner);if(c==null)return;
        String key=SystemOptions.key(kind==0?"screenshot_hide_status_bar":"record_hide_status_bar");
        CaptureRuntimeObservation observation=observation(kind);
        // The identical FeatureSettings truth predicate, bound to the exact snapshot
        // being observed. snapshot() only schedules background I/O and returns immediately.
        if(!gate(c,key,observation)){observation.phase="gate_off";observation.wait="not_requested";publish(c,"client_start",observation);return;}
        if(LEASES.containsKey(owner)){observation.phase="already_leased";observation.wait="not_requested";publish(c,"client_start",observation);return;}
        Binder lease=new Binder();if(request(c,lease,kind,true,observation))LEASES.put(owner,lease);
        // Normal service teardown and Binder death release the exact lease; a healthy long
        // screenshot is allowed to take longer than a fixed timer.
    }
    private static void stop(Object owner) {
        IBinder lease=LEASES.remove(owner);if(lease!=null)request(FeatureSettings.from(owner),lease,0,false);
    }
    private static boolean request(Context c,IBinder owner,int kind,boolean active) {
        return request(c,owner,kind,active,observation(kind));
    }
    private static boolean request(Context c,IBinder owner,int kind,boolean active,CaptureRuntimeObservation observation) {
        if(c==null)return false;
        CaptureRequest operation=new CaptureRequest(c,owner,kind,active,observation);
        Future<Boolean> result=IPC.submit(operation::run);
        try{boolean value=result.get(650,TimeUnit.MILLISECONDS);synchronized(observation){observation.wait=value?"returned_true":"returned_false";}return value;}
        catch(Exception error){
            if(error instanceof InterruptedException)Thread.currentThread().interrupt();
            synchronized(observation){observation.wait=error instanceof java.util.concurrent.TimeoutException?"timeout":error instanceof InterruptedException?"interrupted":"worker_error";observation.cancelled=active;}
            if(active){operation.cancelled.set(true);IPC.execute(operation::release);}
            // A queued stop must still run, even if its caller stopped waiting.
            return false;
        }finally{publish(c,active?"client_start":"client_stop",observation);}
    }
    private static final class CaptureRequest {
        final Context context;final IBinder owner;final int kind;final boolean active;
        final AtomicBoolean cancelled=new AtomicBoolean();IBinder endpointUsed;
        final CaptureRuntimeObservation observation;
        CaptureRequest(Context context,IBinder owner,int kind,boolean active,CaptureRuntimeObservation observation){this.context=context;this.owner=owner;this.kind=kind;this.active=active;this.observation=observation;}
        boolean run(){try{
            if(active&&cancelled.get()){phase("cancelled_before_lookup");return false;}
            IBinder endpoint=cachedEndpoint;
            long deadline=SystemClock.uptimeMillis()+500;
            long lookupStarted=SystemClock.elapsedRealtime();phase("endpoint_lookup");
            while(endpoint==null||!endpoint.isBinderAlive()) {
                if(active&&cancelled.get()){phase("cancelled_during_lookup");return false;}
                synchronized(observation){observation.lookups++;}
                Bundle result=context.getContentResolver().call(PROVIDER,"capture_surface_get",null,null);
                endpoint=result==null?null:result.getBinder("controller");
                if(endpoint!=null&&endpoint.isBinderAlive()){cachedEndpoint=endpoint;break;}
                if(SystemClock.uptimeMillis()>=deadline){synchronized(observation){observation.endpointMs=SystemClock.elapsedRealtime()-lookupStarted;}phase("endpoint_missing");return false;}
                SystemClock.sleep(20);
            }
            synchronized(observation){observation.endpointMs=SystemClock.elapsedRealtime()-lookupStarted;}
            endpointUsed=endpoint;
            if(active&&cancelled.get()){phase("cancelled_before_tx");return false;}
            phase("transact");long transactionStarted=SystemClock.elapsedRealtime();
            boolean success=transact(endpoint,owner,kind,active,observation);
            synchronized(observation){observation.transactionMs=SystemClock.elapsedRealtime()-transactionStarted;observation.phase="tx_finished";}
            if(active&&!success)release();
            return success;
        }catch(Exception ignored){phase("request_exception");if(active)release();cachedEndpoint=null;return false;}
        finally{publish(context,active?"client_start":"client_stop",observation);}}
        void phase(String value){synchronized(observation){observation.phase=value;}}
        // Keep the exact endpoint: a timeout racing a successful start must not
        // leave a lease behind or release it on a replacement SystemUI process.
        void release(){
            boolean present=endpointUsed!=null;
            boolean released=present&&transact(endpointUsed,owner,kind,false);
            synchronized(observation){observation.cleanup=present?(released?"released":"release_rejected"):"no_endpoint";}
            publish(context,active?"client_start":"client_stop",observation);
        }
    }
    private static boolean transact(IBinder endpoint,IBinder owner,int kind,boolean active){
        return transact(endpoint,owner,kind,active,null);
    }
    private static boolean transact(IBinder endpoint,IBinder owner,int kind,boolean active,CaptureRuntimeObservation observation){
        Parcel data=Parcel.obtain(),reply=Parcel.obtain();
        try{
            data.writeInterfaceToken(DESCRIPTOR);data.writeStrongBinder(owner);data.writeInt(kind);data.writeInt(active?1:0);
            if(!endpoint.transact(IBinder.FIRST_CALL_TRANSACTION,data,reply,0)){transaction(observation,"binder_rejected");return false;}
            reply.readException();boolean value=reply.readInt()==1;transaction(observation,value?"reply_true":"reply_false");return value;
        }catch(Exception ignored){transaction(observation,"exception");return false;}finally{data.recycle();reply.recycle();}
    }
    /** Main-thread only: owns View/Root callbacks, never shares either with CONTROL. */
    private static final class ViewEntry implements View.OnAttachStateChangeListener {
        final WeakReference<View> view;
        WeakReference<Object> root=new WeakReference<>(null);
        WeakReference<android.view.ViewTreeObserver> observer=new WeakReference<>(null);
        Object callback;OwnedSurface owned;long invalidIdentity,invalidHandle;boolean detached,retryCopy;
        WeakReference<Object> source=new WeakReference<>(null);
        long sourceIdentity,sourceHandle;boolean sourceValid,sourceObserved;
        final android.view.ViewTreeObserver.OnPreDrawListener draw=this::beforeDraw;
        ViewEntry(View view){this.view=new WeakReference<>(view);}
        boolean beforeDraw(){
            View target=view.get();if(detached)return true;
            if(target==null||!target.isAttachedToWindow()){refreshSurfaces();return true;}
            try{
                // The callback handles native replacements immediately. The cheap
                // identity check also covers ROMs without that callback and same-
                // object handle changes, without republishing/applying every frame.
                Object currentRoot=SystemUiAdapter.callIfPresent(target,"getViewRootImpl");
                Object original=SystemUiAdapter.callIfPresent(currentRoot,"getSurfaceControl");
                long identity=number(SystemUiAdapter.field(original,"mNativeObject"));
                long handle=number(SystemUiAdapter.field(original,"mNativeHandle"));
                boolean valid=Boolean.TRUE.equals(SystemUiAdapter.callIfPresent(original,"isValid"));
                if(retryCopy||!sourceObserved||root.get()!=currentRoot||source.get()!=original||sourceIdentity!=identity||sourceHandle!=handle||sourceValid!=valid)refreshSurfaces();
                else if(surfaceRepairNeeded)applySurfaces();
            }catch(ReflectiveOperationException|RuntimeException ignored){refreshSurfaces();}
            return true;
        }
        void observeSource(Object original,long identity,long handle,boolean valid){source=new WeakReference<>(original);sourceIdentity=identity;sourceHandle=handle;sourceValid=valid;sourceObserved=true;}
        void bindObserver(View view){android.view.ViewTreeObserver next=view.getViewTreeObserver(),previous=observer.get();
            if(previous==next)return;if(previous!=null&&previous.isAlive())previous.removeOnPreDrawListener(draw);
            next.addOnPreDrawListener(draw);observer=new WeakReference<>(next);}
        void bindRoot(Object next){
            if(root.get()==next)return;unbindRoot();root=new WeakReference<>(next);if(next==null)return;
            try{Class<?> contract=Class.forName("android.view.ViewRootImpl$SurfaceChangedCallback");
                callback=java.lang.reflect.Proxy.newProxyInstance(contract.getClassLoader(),new Class<?>[]{contract},(proxy,method,args)->{
                    String name=method.getName();
                    if(name.equals("equals"))return proxy==args[0];if(name.equals("hashCode"))return System.identityHashCode(proxy);if(name.equals("toString"))return "DuoCaptureSurfaceCallback";
                    if(name.equals("surfaceDestroyed")){invalidIdentity=owned==null?0:owned.identity;invalidHandle=owned==null?0:owned.handle;refreshSurfaces();}
                    else if(name.equals("surfaceCreated")||name.equals("surfaceReplaced")){invalidIdentity=invalidHandle=0;refreshSurfaces();}
                    return null;
                });
                OemHooks.invoke(next,"addSurfaceChangedCallback",callback);
                try{FeatureSettings.diagnostic(context,"ls_augment_rm_capture_surface_callbacks","native_lifecycle_registered");}catch(Throwable diagnosticFailure){}
            }catch(Exception ignored){callback=null;try{FeatureSettings.diagnostic(context,"ls_augment_rm_capture_surface_callbacks","pre_draw_fallback");}catch(Throwable diagnosticFailure){}}
        }
        void unbindRoot(){Object previous=root.get();if(previous!=null&&callback!=null)try{OemHooks.invoke(previous,"removeSurfaceChangedCallback",callback);}catch(Exception ignored){}callback=null;root=new WeakReference<>(null);sourceObserved=false;source.clear();}
        public void onViewAttachedToWindow(View view){detached=false;bindObserver(view);refreshSurfaces();}
        // Android dispatches this listener before clearing mAttachInfo, so
        // isAttachedToWindow() alone would rebind the departing root here.
        public void onViewDetachedFromWindow(View view){detached=true;unbindRoot();refreshSurfaces();}
    }
    /** Owns a copied native reference. The original ViewRootImpl object is never released. */
    private static final class OwnedSurface {
        final long identity,handle;final Object control;boolean applied,exclude,mayExclude;
        OwnedSurface(long identity,Object original)throws ReflectiveOperationException{
            this.identity=identity;Object nativeHandle=OemHooks.field(original,"mNativeHandle");
            if(!(nativeHandle instanceof Number)||((Number)nativeHandle).longValue()==0)throw new IllegalArgumentException("native handle unavailable");handle=((Number)nativeHandle).longValue();
            Class<?> type=Class.forName("android.view.SurfaceControl");
            java.lang.reflect.Constructor<?> copy=type.getDeclaredConstructor(type,String.class);copy.setAccessible(true);
            control=copy.newInstance(original,"DuoCaptureSurface");
        }
        boolean valid(){try{return Boolean.TRUE.equals(OemHooks.invoke(control,"isValid"));}catch(Exception ignored){return false;}}
        boolean sameSource(long identity,long handle){return this.identity==identity&&this.handle==handle;}
        boolean sameLayer(OwnedSurface other){return handle==other.handle;}
        void release(){try{OemHooks.invoke(control,"release");}catch(Exception ignored){}}
    }
    private static final class SurfaceSnapshot {
        final long epoch;final int attached;final List<OwnedSurface> controls;final String reason;
        SurfaceSnapshot(long epoch,int attached,List<OwnedSurface> controls,String reason){this.epoch=epoch;this.attached=attached;this.controls=Collections.unmodifiableList(new ArrayList<>(controls));this.reason=reason;}
    }
    private static final class Decision {
        final long sequence,revision;final List<Lease> leases;final boolean placeholder,screenshot,record;
        Decision(long sequence,long revision,List<Lease> leases,boolean placeholder,boolean screenshot,boolean record){
            this.sequence=sequence;this.revision=revision;this.leases=Collections.unmodifiableList(new ArrayList<>(leases));this.placeholder=placeholder;this.screenshot=screenshot;this.record=record;
        }
        // Immutable membership/configuration plus terminal cancellation signals. A busy
        // controller must not let a lifecycle callback reactivate an already-cancelled token.
        boolean exclude(){for(Lease lease:leases)if(!lease.cancelled.get()&&(lease.kind==0?screenshot:record))return true;return false;}
        int liveLeases(){int count=0;for(Lease lease:leases)if(!lease.cancelled.get())count++;return count;}
    }
    private static final class Lease {final int kind;final AtomicBoolean cancelled;Lease(int kind,AtomicBoolean cancelled){this.kind=kind;this.cancelled=cancelled;}}
    /** Configuration and lease work happens outside SURFACE_LOCK, exclusively on CONTROL. */
    private static void updateDecision(CaptureRuntimeObservation observation){
        ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
        boolean shot=ConfigSchema.truthy(snapshot.get(SystemOptions.key("screenshot_hide_status_bar"))),record=ConfigSchema.truthy(snapshot.get(SystemOptions.key("record_hide_status_bar")));
        List<Lease> leases=new ArrayList<>(ACTIVE.values());
        Decision previous=desired;
        if(previous.revision!=snapshot.revision||!previous.leases.equals(leases)||previous.screenshot!=shot||previous.record!=record)
            desired=new Decision(++decisionSequence,snapshot.revision,leases,snapshot.revision==1&&snapshot.updatedAt==1,shot,record);
        if(observation!=null)synchronized(observation){observation.revision=snapshot.revision;observation.placeholder=snapshot.revision==1&&snapshot.updatedAt==1;observation.gate=observation.kind==0?shot:record;observation.gateObserved=true;}
    }
    /** No worker may call this method. Surface copies are built before acquiring the lock. */
    private static void refreshSurfaces(){
        if(Looper.myLooper()!=Looper.getMainLooper())throw new IllegalStateException("capture View snapshot requires UI thread");
        List<OwnedSurface> next=new ArrayList<>();int attached=0;String reason="ready";
        Iterator<ViewEntry> it=VIEWS.iterator();while(it.hasNext()){
            ViewEntry entry=it.next();View view=entry.view.get();if(view==null){entry.unbindRoot();it.remove();continue;}
            if(entry.detached||!view.isAttachedToWindow()){entry.unbindRoot();entry.owned=null;continue;}attached++;
            try{
                Object root=SystemUiAdapter.callIfPresent(view,"getViewRootImpl");entry.bindRoot(root);
                Object original=SystemUiAdapter.callIfPresent(root,"getSurfaceControl");
                long token=number(SystemUiAdapter.field(original,"mNativeObject")),handle=number(SystemUiAdapter.field(original,"mNativeHandle"));
                boolean valid=Boolean.TRUE.equals(SystemUiAdapter.callIfPresent(original,"isValid"));
                entry.observeSource(original,token,handle,valid);entry.retryCopy=false;
                if(token==0){entry.owned=null;reason="identity_missing";continue;}
                if(!valid){entry.owned=null;reason="surface_invalid";continue;}
                if(handle==0){entry.owned=null;reason="handle_missing";continue;}
                if(token==entry.invalidIdentity&&handle==entry.invalidHandle){entry.owned=null;reason="surface_destroyed";continue;}
                if(entry.owned==null||!entry.owned.sameSource(token,handle))try{entry.owned=new OwnedSurface(token,original);}catch(Exception ignored){entry.owned=null;entry.retryCopy=true;reason="copy_unavailable";continue;}
                next.add(entry.owned);
            }catch(Exception ignored){entry.owned=null;reason="source_unavailable";}
        }
        if(attached==0)reason="no_surface";
        ApplyResult result;
        synchronized(SURFACE_LOCK){
            SurfaceSnapshot previous=surfaces;
            if(previous.attached!=attached||!previous.controls.equals(next)||!previous.reason.equals(reason)){
                for(OwnedSurface old:previous.controls)if(!next.contains(old))RETIRED.add(old);
                surfaces=new SurfaceSnapshot(previous.epoch+1,attached,next,reason);
            }
            result=applyLocked();
        }
        reportApply(result,null);
        if(result.retired>0||result.attached>0&&!result.applied)scheduleRepair();
    }
    /** Native errors during replacement/detach must not depend on another UI frame. */
    private static void scheduleRepair(){
        if(!REPAIR_PENDING.compareAndSet(false,true))return;
        CONTROL.execute(new Runnable(){final long deadline=SystemClock.uptimeMillis()+400;
            public void run(){try{updateDecision(null);ApplyResult result=applySurfaces();
                if((result.retired>0||result.attached>0&&!result.applied)&&SystemClock.uptimeMillis()<deadline){CONTROL.schedule(this,16,TimeUnit.MILLISECONDS);return;}
            }catch(Exception ignored){}REPAIR_PENDING.set(false);}
        });
    }
    private static final class ApplyResult {
        final long epoch,decision,revision;final int attached,valid,changed,leases,retired;final boolean exclude,applied;final String reason;
        ApplyResult(long epoch,long decision,long revision,int attached,int valid,int changed,int leases,int retired,boolean exclude,boolean applied,String reason){this.epoch=epoch;this.decision=decision;this.revision=revision;this.attached=attached;this.valid=valid;this.changed=changed;this.leases=leases;this.retired=retired;this.exclude=exclude;this.applied=applied;this.reason=reason;}
    }
    private static boolean setExcluded(OwnedSurface surface,boolean exclude){
        Object transaction=null;
        try{Class<?> type=Class.forName("android.view.SurfaceControl$Transaction");transaction=type.getDeclaredConstructor().newInstance();
            if(exclude)surface.mayExclude=true; // An exception after native apply cannot prove nothing changed.
            OemHooks.invoke(transaction,"setSkipScreenshot",surface.control,exclude);OemHooks.invoke(transaction,"apply",true);surface.applied=true;surface.exclude=exclude;surface.mayExclude=exclude;return true;
        }catch(Exception ignored){surface.applied=false;return false;}
        finally{if(transaction!=null)try{OemHooks.invoke(transaction,"close");}catch(Exception ignored){}}
    }
    /** Only copied SurfaceControls and immutable decision data are touched while locked. */
    private static ApplyResult applyLocked(){
        SurfaceSnapshot snapshot=surfaces;Decision decision=desired;boolean exclude=decision.exclude();int valid=0,changed=0;boolean clean=true;
        Iterator<OwnedSurface> retired=RETIRED.iterator();while(retired.hasNext()){
            // A new wrapper for the same layer inherits any uncertain native true
            // state, including when its first false transaction also fails.
            OwnedSurface old=retired.next();boolean same=false;for(OwnedSurface current:snapshot.controls)if(current.sameLayer(old)){same=true;current.mayExclude|=old.mayExclude;}
            if(!same&&old.mayExclude&&old.valid()&&!setExcluded(old,false)){clean=false;continue;}
            old.release();retired.remove();
        }
        boolean applied=snapshot.attached>0&&snapshot.controls.size()==snapshot.attached;
        for(OwnedSurface surface:snapshot.controls){
            if(!surface.valid()){applied=false;continue;}valid++;
            // Cancellation is terminal and may arrive from Binder while this lock is held.
            exclude=decision.exclude();
            if(surface.applied&&surface.exclude==exclude)continue;
            if(setExcluded(surface,exclude))changed++;else applied=false;
        }
        exclude=decision.exclude();for(OwnedSurface surface:snapshot.controls)if(!surface.applied||surface.exclude!=exclude)applied=false;
        boolean complete=applied&&clean;
        // Publish retry state with the native apply while still serialized. A
        // delayed diagnostic report must not overwrite a newer failed apply.
        surfaceRepairNeeded=!RETIRED.isEmpty()||snapshot.attached>0&&!complete;
        return new ApplyResult(snapshot.epoch,decision.sequence,decision.revision,snapshot.attached,valid,changed,decision.liveLeases(),RETIRED.size(),exclude,complete,snapshot.reason);
    }
    private static ApplyResult applySurfaces(){ApplyResult result;synchronized(SURFACE_LOCK){result=applyLocked();}reportApply(result,null);return result;}
    private static ApplyResult applySurfaces(CaptureRuntimeObservation observation,AtomicBoolean cancelled){ApplyResult result;synchronized(SURFACE_LOCK){
        if(cancelled.get()){SurfaceSnapshot snapshot=surfaces;Decision decision=desired;result=new ApplyResult(snapshot.epoch,decision.sequence,decision.revision,snapshot.attached,0,0,decision.liveLeases(),RETIRED.size(),decision.exclude(),false,snapshot.reason);}
        else result=applyLocked();
    }reportApply(result,observation);return result;}
    private static void reportApply(ApplyResult result,CaptureRuntimeObservation observation){
        if(result.changed>0)try{FeatureSettings.diagnostic(context,"ls_augment_rm_capture_surface_runtime","excluded="+result.exclude+"|leases="+result.leases+"|epoch="+result.epoch+"|time="+System.currentTimeMillis());}catch(Throwable diagnosticFailure){}
        String state="b="+BuildConfig.VERSION_CODE+"|p="+android.os.Process.myPid()+"|e="+result.epoch+"|d="+result.decision+"|r="+result.revision+"|a="+result.attached+"|v="+result.valid+"|retired="+result.retired+"|leases="+result.leases+"|ex="+result.exclude+"|ap="+result.applied+"|why="+result.reason;
        if(!state.equals(lastSurfaceDiagnostic)){lastSurfaceDiagnostic=state;try{FeatureSettings.diagnostic(context,"ls_augment_rm_capture_surface_snapshot",state+"|t="+SystemClock.elapsedRealtime());}catch(Throwable diagnosticFailure){}}
        if(observation!=null)synchronized(observation){observation.attached=result.attached;observation.valid=result.valid;observation.changed=result.changed;observation.leases=result.leases;observation.exclude=result.exclude;observation.applied=result.applied;}
    }
    private static long number(Object value){return value instanceof Number?((Number)value).longValue():0;}
    private static void removeLease(IBinder owner){Lease lease=ACTIVE.remove(owner);if(lease!=null)lease.cancelled.set(true);IBinder.DeathRecipient death=DEATHS.remove(owner);if(death!=null)owner.unlinkToDeath(death,0);}
    private static final class ControlOperation implements Runnable {
        final IBinder owner;final int kind;final boolean active;final CaptureRuntimeObservation observation;
        final CountDownLatch ready=new CountDownLatch(1);final AtomicBoolean cancelled=new AtomicBoolean();
        final long deadline=SystemClock.uptimeMillis()+400;boolean registered;volatile boolean success;volatile ApplyResult result;
        ControlOperation(IBinder owner,int kind,boolean active,CaptureRuntimeObservation observation){this.owner=owner;this.kind=kind;this.active=active;this.observation=observation;}
        public void run(){try{
            if(cancelled.get()){cancel();return;}
            if(!registered){
                if(active){if(!ACTIVE.containsKey(owner)){IBinder.DeathRecipient death=()->{cancelled.set(true);CONTROL.execute(()->{removeLease(owner);updateDecision(null);applySurfaces();});};owner.linkToDeath(death,0);DEATHS.put(owner,death);ACTIVE.put(owner,new Lease(kind,cancelled));}}
                else removeLease(owner);
                registered=true;
            }
            updateDecision(observation);result=applySurfaces(observation,cancelled);
            if(cancelled.get()){cancel();return;}
            success=result.applied&&result.epoch==surfaces.epoch&&result.decision==desired.sequence;
            if(!success&&SystemClock.uptimeMillis()<deadline){CONTROL.schedule(this,16,TimeUnit.MILLISECONDS);return;}
            if(!success&&active){removeLease(owner);updateDecision(null);applySurfaces();}
            ready.countDown();
        }catch(Exception ignored){if(active&&registered){removeLease(owner);updateDecision(null);applySurfaces();}ready.countDown();}}
        void cancel(){if(active&&registered){removeLease(owner);updateDecision(null);applySurfaces();}success=false;ready.countDown();}
        boolean currentSuccess(){ApplyResult applied=result;Decision decision=desired;return success&&applied!=null&&applied.epoch==surfaces.epoch&&applied.decision==decision.sequence&&applied.exclude==decision.exclude()&&!cancelled.get();}
    }
    private static final class SurfaceController extends Binder {
        @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags)throws RemoteException {
            if(code!=IBinder.FIRST_CALL_TRANSACTION)return super.onTransact(code,data,reply,flags);
            data.enforceInterface(DESCRIPTOR);int uid=Binder.getCallingUid();
            String[] packages=context.getPackageManager().getPackagesForUid(uid);
            if(uid/100000!=android.os.Process.myUid()/100000||packages==null||!Arrays.asList(packages).contains("com.android.ztescreenshot"))throw new SecurityException("capture client only");
            IBinder owner=data.readStrongBinder();int kind=data.readInt();boolean active=data.readInt()!=0;
            if(owner==null||kind<0||kind>1)throw new IllegalArgumentException("invalid lease");
            CaptureRuntimeObservation observation=observation(kind);observation.callerPid=Binder.getCallingPid();observation.phase=active?"server_active":"server_stop";
            ControlOperation operation=new ControlOperation(owner,kind,active,observation);CONTROL.execute(operation);
            try{boolean completed=operation.ready.await(500,TimeUnit.MILLISECONDS);observation.wait=completed?"completed":"timeout";if(!completed&&active){operation.cancelled.set(true);CONTROL.execute(operation::cancel);observation.cancelled=true;}}
            catch(InterruptedException interrupted){observation.wait="interrupted";if(active){operation.cancelled.set(true);CONTROL.execute(operation::cancel);observation.cancelled=true;}Thread.currentThread().interrupt();}
            boolean success=operation.currentSuccess();
            if(!success&&active){operation.cancelled.set(true);CONTROL.execute(operation::cancel);}
            publish(context,active?"server_start":"server_stop",observation);
            reply.writeNoException();reply.writeInt(success?1:0);return true;
        }
    }
    private static CaptureRuntimeObservation observation(int kind){return new CaptureRuntimeObservation(BuildConfig.VERSION_CODE,android.os.Process.myPid(),kind,observationSequence.incrementAndGet(),SystemClock.elapsedRealtime());}
    private static boolean gate(Context c,String key,CaptureRuntimeObservation observation){
        if(observation==null)return FeatureSettings.enabled(c,key);
        try{ConfigSnapshot snapshot=FeatureSettings.snapshot(c);boolean enabled=ConfigSchema.truthy(snapshot.get(key));
            synchronized(observation){observation.revision=snapshot.revision;observation.placeholder=snapshot.revision==1&&snapshot.updatedAt==1;observation.gate=enabled;observation.gateObserved=true;}
            return enabled;
        }catch(Throwable ignored){return false;}
    }
    private static void transaction(CaptureRuntimeObservation observation,String value){if(observation!=null)synchronized(observation){observation.transaction=value;}}
    private static void publish(Context c,String role,CaptureRuntimeObservation observation){
        // Existing bounded asynchronous writer: no Provider transaction or disk I/O here.
        try{FeatureSettings.diagnostic(c,"ls_augment_rm_capture_"+role+"_"+(observation.kind<0?"all":Integer.toString(observation.kind)),observation.serialize(SystemClock.elapsedRealtime()));}
        catch(Throwable ignored){ }
    }
}
