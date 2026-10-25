package ls.augment.com.hook;

import android.app.KeyguardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.PowerManager;
import android.os.SystemClock;
import android.os.UserManager;
import android.provider.Settings;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Set;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.List;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import ls.augment.com.AtomicWorkbenchExtractionRequest;
import ls.augment.com.AtomicWorkbenchExtractionAuthority;
import ls.augment.com.AtomicWorkbenchExtractionPolicy;
import ls.augment.com.AtomicWorkbenchExtractionGeometryTransport;
import ls.augment.com.AtomicWorkbenchConfig;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;
import static ls.augment.com.hook.AtomicWorkbenchExtractionWindowResolver.*;

/** Independent private WMS protocol. Physical-display extraction has no Root/VD precondition. */
public final class AtomicWorkbenchExtractionEvidenceHook {
    // Only verified Java AppOps metadata and native TF_ACCEPT_FDS; neither permits one-way requests.
    private static final int BINDER_SYNC_METADATA_FLAGS = 0x12;

    private static boolean acceptsSynchronousBinderFlags(int flags) {
        return (flags & ~BINDER_SYNC_METADATA_FLAGS) == 0;
    }

    public static final int CONTROL_TRANSACTION=0x00D04E07;
    public static final String CONTROL_DESCRIPTOR="ls.augment.com.atomic_extraction_control.v1";
    private static volatile boolean installed;
    private static ClassLoader systemLoader;
    private static Class<?> pointerInterface;
    private static Controller controller;
    private static volatile boolean injectionInstalled;
    private static volatile boolean nativeDragInstalled;
    public static boolean isVirtualDisplayInstalled(){return isInstalled()&&injectionInstalled;}
    public static boolean isInstalled(){return installed&&nativeDragInstalled;}

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    public static synchronized int install(AugmentModule module,ClassLoader loader){
        if(installed){installInjection(module,loader);installNativeDrag(module,loader);return isInstalled()?1:0;}
        try {
            Class<?> wms=Class.forName("com.android.server.wm.WindowManagerService",false,loader);
            Method tx=wms.getDeclaredMethod("onTransact",int.class,Parcel.class,Parcel.class,int.class);
            pointerInterface=Class.forName("android.view.WindowManagerPolicyConstants$PointerEventListener",false,loader);
            wms.getDeclaredMethod("registerPointerEventListener",pointerInterface,int.class);
            wms.getDeclaredMethod("unregisterPointerEventListener",pointerInterface,int.class);
            systemLoader=loader;
            module.deoptimize(tx);
            module.registerFeatureHook(module.prepareFeatureHook(tx,"atomic_workbench.extraction_source",true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain->{
                int code=(Integer)chain.getArg(0);
                if(code!=AtomicWorkbenchExtractionAuthority.TRANSACTION&&code!=CONTROL_TRANSACTION&&code!=AtomicWorkbenchExtractionGeometryTransport.TRANSACTION)return chain.proceed();
                Parcel data=(Parcel)chain.getArg(1),reply=(Parcel)chain.getArg(2);
                if(reply==null||!acceptsSynchronousBinderFlags((Integer)chain.getArg(3)))return true;
                if(code==AtomicWorkbenchExtractionGeometryTransport.TRANSACTION)dispatchGeometry(chain.getThisObject(),data,reply);
                else dispatch(chain.getThisObject(),code,data,reply);return true;
            }));
            installed=true;
            installInjection(module,loader);
            installNativeDrag(module,loader);
            module.logFeatureInfo(isInstalled()?"ATOMIC_WORKBENCH_EXTRACTION_HOOK_INSTALLED schema=1;ready=registration_required;content=none"
                    :"ATOMIC_WORKBENCH_EXTRACTION_HOOK_PARTIAL schema=1;ready=false;content=none");
            return isInstalled()?1:0;
        }catch(Throwable unavailable){installed=false;module.logFeatureInfo("ATOMIC_WORKBENCH_EXTRACTION_HOOK_UNAVAILABLE");return 0;}
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void installNativeDrag(AugmentModule module,ClassLoader loader){
        if(nativeDragInstalled)return;
        try{
            Class<?> drag=Class.forName("com.android.server.wm.DragDropController",false,loader);
            drag.getDeclaredField("mDragState");
            Method active=drag.getDeclaredMethod("dragDropActiveLocked");
            if(active.getReturnType()!=boolean.class)throw new NoSuchMethodException();
            Class<?> window=Class.forName("android.view.IWindow",false,loader),surface=Class.forName("android.view.SurfaceControl",false,loader),clip=Class.forName("android.content.ClipData",false,loader);
            Method start=drag.getDeclaredMethod("performDrag",int.class,int.class,window,int.class,surface,int.class,int.class,int.class,float.class,float.class,float.class,float.class,clip);
            if(start.getReturnType()!=IBinder.class)throw new NoSuchMethodException();
            module.deoptimize(start);
            module.registerFeatureHook(module.prepareFeatureHook(start,"atomic_workbench.extraction_native_drag",true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain->{
                Controller c=controller;if(c!=null)c.broker.beginNativeDrag();
                try{return chain.proceed();}finally{if(c!=null)c.broker.endNativeDrag();}
            }));
            nativeDragInstalled=true;
        }catch(Throwable unavailable){module.logFeatureInfo("ATOMIC_WORKBENCH_EXTRACTION_NATIVE_DRAG_UNAVAILABLE");}
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void installInjection(AugmentModule module,ClassLoader loader){
        if(injectionInstalled)return;
        try{
            Class<?> ims=Class.forName("com.android.server.input.InputManagerService",false,loader);
            Class<?> input=Class.forName("android.view.InputEvent",false,loader);
            Method inject=ims.getDeclaredMethod("injectInputEventToTarget",input,int.class,int.class);
            module.deoptimize(inject);
            module.registerFeatureHook(module.prepareFeatureHook(inject,"atomic_workbench.extraction_injection",true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain->{
                int uid=Binder.getCallingUid(),pid=Binder.getCallingPid();
                AtomicWorkbenchExtractionPointerBroker.Sample sample=null;
                Controller c=controller;
                if(c!=null&&uid==0&&chain.getArg(0) instanceof MotionEvent)try{sample=copySample((MotionEvent)chain.getArg(0),0,0);}catch(Exception ignored){}
                Object result;
                try{result=chain.proceed();}
                catch(Throwable failed){if(sample!=null)try{c.broker.injected(sample,uid,pid,false);}catch(Throwable observational){c.broker.abortGesture();}throw failed;}
                if(sample!=null)try{c.broker.injected(sample,uid,pid,Boolean.TRUE.equals(result));}catch(Throwable observational){c.broker.abortGesture();}return result;
            }));
            injectionInstalled=true;
        }catch(Throwable unavailable){module.logFeatureInfo("ATOMIC_WORKBENCH_EXTRACTION_VD_INJECTION_UNAVAILABLE");}
    }
    private static void dispatchGeometry(Object wms,Parcel data,Parcel reply){
        String nonce=null;Bundle value;boolean success=false;
        int uid=Binder.getCallingUid(),pid=Binder.getCallingPid();
        try{
            if(!isVirtualDisplayInstalled()||data==null||data.dataSize()>12288)throw new Refusal("unavailable");
            data.enforceInterface(AtomicWorkbenchExtractionGeometryTransport.DESCRIPTOR);
            if(data.readInt()!=1)throw new Refusal("rejected");int action=data.readInt();nonce=data.readString();
            if(!hex(nonce,32)||uid!=0||pid<=0)throw new Refusal("rejected");
            Bundle auth=data.readBundle(AtomicWorkbenchExtractionRequest.class.getClassLoader());
            Bundle geometry=data.readBundle(AtomicWorkbenchExtractionRequest.class.getClassLoader());
            if(data.dataAvail()!=0)throw new Refusal("rejected");
            value=controller(wms).geometries.control(action,auth,geometry,uid,pid);success=true;
        }catch(Throwable failed){value=new Bundle();value.putString("reason",reason(failed));}
        reply.writeNoException();reply.writeInt(1);reply.writeString(nonce);reply.writeInt(success?1:0);reply.writeBundle(value);
    }
    private static synchronized Controller controller(Object wms)throws Exception{
        if(controller==null)controller=new Controller(wms,systemLoader);
        if(controller.wms!=wms)throw new Refusal("unavailable");return controller;
    }
    private static void dispatch(Object wms,int code,Parcel data,Parcel reply){
        String nonce=null;Bundle value=null;boolean success=false;
        int uid=Binder.getCallingUid(),pid=Binder.getCallingPid();
        long identity=Binder.clearCallingIdentity();
        try {
            if(!isInstalled()||data==null||data.dataSize()>8192)throw new Refusal("rejected");
            data.enforceInterface(code==CONTROL_TRANSACTION?CONTROL_DESCRIPTOR:AtomicWorkbenchExtractionAuthority.DESCRIPTOR);
            if(data.readInt()!=1)throw new Refusal("rejected");
            int action=data.readInt();nonce=data.readString();if(!hex(nonce,32))throw new Refusal("rejected");
            if(uid<10000||pid<=0)throw new Refusal("rejected");
            Bundle request=data.readBundle(AtomicWorkbenchExtractionRequest.class.getClassLoader());
            if(request==null)throw new Refusal("rejected");
            Controller c=controller(wms);
            if(code==CONTROL_TRANSACTION){
                if(data.dataAvail()!=0)throw new Refusal("rejected");
                value=c.control(action,uid,pid,request);
            }else{
                String lease=data.readString(),windowNonce=data.readString();
                if(data.dataAvail()!=0||action<1||action>3||action==1&&(lease!=null||windowNonce!=null)
                        ||action!=1&&(!hex(lease,32)||!hex(windowNonce,32)))throw new Refusal("rejected");
                AtomicWorkbenchExtractionRequest r=AtomicWorkbenchExtractionRequest.fromBundle(request);
                // A geometry-less request is always physical0. Bare VD tickets cannot be self-issued.
                if(r.moduleUid!=uid||r.userId!=uid/100000)throw new Refusal("rejected");
                value=c.broker.evidence(action,uid,pid,r,lease,windowNonce);
            }
            success=true;
        }catch(Throwable failed){
            value=new Bundle();value.putString("reason",reason(failed));
            if(code==CONTROL_TRANSACTION){value.putBoolean("registered",false);value.putBoolean("observing",false);}
        }finally{Binder.restoreCallingIdentity(identity);}
        reply.writeNoException();reply.writeInt(1);reply.writeString(nonce);reply.writeInt(success?1:0);reply.writeBundle(value);
    }
    private static String reason(Throwable error){
        while(error instanceof java.lang.reflect.InvocationTargetException&&error.getCause()!=null)error=error.getCause();
        return error instanceof Refusal?((Refusal)error).reason:"unavailable";
    }
    private static final class Controller {
        final Object wms;
        final AtomicWorkbenchExtractionWindowResolver resolver;
        final AtomicWorkbenchExtractionPointerBroker broker;
        final AtomicWorkbenchExtractionGeometryBroker geometries;
        final AtomicWorkbenchExtractionPointerBroker.Scheduler scheduler;
        final Object listener;
        final Object listenerLock=new Object();
        boolean observing;
        Object physicalDispatcher;
        boolean physicalRetryQueued;
        final Map<Integer,Object> virtualListeners=new LinkedHashMap<>();
        final Map<Integer,AtomicWorkbenchExtractionGeometryBroker.Geometry> virtualOwners=new LinkedHashMap<>();
        final Map<Integer,Object> virtualDispatchers=new LinkedHashMap<>();
        Controller(Object wms,ClassLoader loader)throws Exception{
            this.wms=wms;resolver=new AtomicWorkbenchExtractionWindowResolver(wms,loader);
            scheduler=new AtomicWorkbenchExtractionPointerBroker.PhoneScheduler();
            broker=new AtomicWorkbenchExtractionPointerBroker(resolver,new PhoneStateReader(resolver),scheduler);
            broker.diagnostic(value->HookTelemetry.atomicWorkbench("INFO",value,null));
            geometries=new AtomicWorkbenchExtractionGeometryBroker(wms,resolver,broker,scheduler,new AtomicWorkbenchExtractionGeometryBroker.Listeners(){
                public void add(AtomicWorkbenchExtractionGeometryBroker.Geometry g)throws Exception{
                    synchronized(listenerLock){
                        if(virtualOwners.get(g.display)==g)return;
                        if(virtualOwners.containsKey(g.display))throw new Refusal("busy");
                        Object l=createListener(loader,true);
                        synchronized(field(wms,"mGlobalLock")){
                            Object c=call(field(wms,"mRoot"),"getDisplayContent",new Class<?>[]{int.class},g.display);
                            if(c!=g.content)throw new Refusal("stale");Object dispatcher=field(c,"mPointerEventDispatcher");
                            virtualOwners.put(g.display,g);virtualListeners.put(g.display,l);virtualDispatchers.put(g.display,dispatcher);
                            call(wms,"registerPointerEventListener",new Class<?>[]{pointerInterface,int.class},l,g.display);
                            if(!containsListener(dispatcher,l))throw new Refusal("unavailable");
                        }
                    }
                }
                public void remove(AtomicWorkbenchExtractionGeometryBroker.Geometry g)throws Exception{
                    synchronized(listenerLock){if(virtualOwners.get(g.display)!=g)return;
                        removeListener(virtualDispatchers.get(g.display),virtualListeners.get(g.display));
                        virtualListeners.remove(g.display);virtualOwners.remove(g.display);virtualDispatchers.remove(g.display);
                    }
                }
            });
            broker.geometryBroker(geometries);
            listener=createListener(loader,false);
            broker.deathCleanup(()->{try{stopIfUnused();}catch(Exception pending){schedulePhysicalCleanup();}});
        }
        private Object createListener(ClassLoader loader,boolean virtual){
            final float[] origin={0,0};
            return Proxy.newProxyInstance(loader,new Class<?>[]{pointerInterface},(proxy,method,args)->{
                if(method.getName().equals("onPointerEvent")&&args!=null&&args.length==1&&args[0] instanceof MotionEvent){
                    try{MotionEvent e=(MotionEvent)args[0];if(e.getActionMasked()==MotionEvent.ACTION_DOWN){origin[0]=e.getX(0);origin[1]=e.getY(0);}
                        AtomicWorkbenchExtractionPointerBroker.Sample sample=copySample(e,origin[0],origin[1]);
                        if(virtual)broker.observedVirtual(sample);else broker.observe(sample);
                    }catch(Throwable invalid){broker.abortGesture();}return null;
                }
                if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                if(method.getName().equals("equals"))return args!=null&&args.length==1&&proxy==args[0];
                if(method.getName().equals("toString"))return "DuoExtractionPointerListener";return null;
            });
        }
        Bundle control(int action,int uid,int pid,Bundle b)throws Exception {
            if(action<1||action>3)throw new Refusal("rejected");
            exact(b,action==1?Set.of("service_generation","callback","user","module_uid"):Set.of("service_generation"));
            String generation=string(b,"service_generation");if(!hex(generation,32))throw new Refusal("rejected");
            if(action==1){
                if(integer(b,"user")!=uid/100000||integer(b,"module_uid")!=uid||!(b.get("callback") instanceof IBinder))throw new Refusal("rejected");
                AtomicWorkbenchExtractionPointerBroker.Owner next=broker.register(uid,pid,generation,b.getBinder("callback"));
                try{start();}catch(Exception failed){broker.invalidate(next,"unavailable");try{stopIfUnused();}catch(Exception pending){schedulePhysicalCleanup();}throw failed;}
            }else if(action==2){broker.unregister(uid,pid,generation);try{stopIfUnused();}catch(Exception pending){schedulePhysicalCleanup();throw pending;}}
            else broker.checkReady(uid,pid,generation);
            Bundle out=new Bundle();out.putBoolean("registered",broker.owns(uid,pid,generation));
            synchronized(listenerLock){out.putBoolean("observing",observing);}
            out.putString("reason","");return out;
        }
        private void start()throws Exception{
            synchronized(listenerLock){
                if(observing)return;
                synchronized(field(wms,"mGlobalLock")){
                    Object c=call(field(wms,"mRoot"),"getDisplayContent",new Class<?>[]{int.class},0);
                    Object dispatcher=field(c,"mPointerEventDispatcher");
                    if(physicalDispatcher!=null&&physicalDispatcher!=dispatcher)removeListener(physicalDispatcher,listener);
                    physicalDispatcher=dispatcher;
                    if(!containsListener(dispatcher,listener))call(wms,"registerPointerEventListener",new Class<?>[]{pointerInterface,int.class},listener,0);
                    if(!containsListener(dispatcher,listener))throw new Refusal("unavailable");observing=true;
                }
            }
        }
        private void stopIfUnused()throws Exception{
            synchronized(listenerLock){if(physicalDispatcher==null||broker.registered())return;removeListener(physicalDispatcher,listener);observing=false;physicalDispatcher=null;}
        }
        private void schedulePhysicalCleanup(){
            synchronized(listenerLock){if(physicalRetryQueued)return;physicalRetryQueued=true;}
            if(!scheduler.post(()->{try{stopIfUnused();}catch(Exception pending){/* Retry retains the exact dispatcher/listener fields. */}
                finally{boolean remaining;synchronized(listenerLock){physicalRetryQueued=false;remaining=physicalDispatcher!=null&&!broker.registered();}if(remaining)schedulePhysicalCleanup();}},1000)){
                synchronized(listenerLock){physicalRetryQueued=false;}
            }
        }
        private boolean containsListener(Object dispatcher,Object listener)throws Exception{
            Object entries=field(dispatcher,"mListeners");if(!(entries instanceof List<?>))throw new Refusal("unavailable");
            synchronized(entries){return ((List<?>)entries).contains(listener);}
        }
        private void removeListener(Object dispatcher,Object listener)throws Exception{
            // Exact old dispatcher identity, even when its display ID has already been reused/disposed.
            synchronized(field(wms,"mGlobalLock")){
                if(containsListener(dispatcher,listener))call(dispatcher,"unregisterInputEventListener",new Class<?>[]{pointerInterface},listener);
                if(containsListener(dispatcher,listener))throw new Refusal("unavailable");
            }
        }
    }
    private static AtomicWorkbenchExtractionPointerBroker.Sample copySample(MotionEvent e,float originX,float originY)throws Exception{
            int action=e.getActionMasked(),count=e.getPointerCount(),display=(Integer)MotionEvent.class.getMethod("getDisplayId").invoke(e);
            float x=count==0?Float.NaN:e.getX(0),y=count==0?Float.NaN:e.getY(0);
            float max=0;
            if(e.getHistorySize()>256)max=Float.NaN;
            else for(int n=0;n<e.getHistorySize();n++){
                long at=e.getHistoricalEventTime(n);
                if(at<e.getDownTime()||at>e.getEventTime()||n>0&&at<e.getHistoricalEventTime(n-1))max=Float.NaN;
                float hx=e.getHistoricalX(0,n)-originX,hy=e.getHistoricalY(0,n)-originY;
                max=Math.max(max,(float)Math.sqrt(hx*hx+hy*hy));
            }
            InputDevice device=e.getDevice();
            boolean hardware=device!=null&&!device.isVirtual()&&e.isFromSource(InputDevice.SOURCE_TOUCHSCREEN)
                    &&count==1&&e.getToolType(0)==MotionEvent.TOOL_TYPE_FINGER;
            return new AtomicWorkbenchExtractionPointerBroker.Sample(action,display,e.getDeviceId(),count,count==0?-1:e.getPointerId(0),
                    e.getDownTime(),e.getEventTime(),x,y,max,hardware);
            // e is neither stored nor posted. The native dispatcher retains ownership and finishes it.
    }
    private static final class PhoneStateReader implements AtomicWorkbenchExtractionPointerBroker.StateReader {
        final AtomicWorkbenchExtractionWindowResolver resolver;
        PhoneStateReader(AtomicWorkbenchExtractionWindowResolver resolver){this.resolver=resolver;}
        public AtomicWorkbenchExtractionPointerBroker.State read(int uid,int pid,String generation)throws Exception{
            resolver.caller(uid,pid);
            Context context=userContext(resolver.context(),uid/100000);
            UserManager users=context.getSystemService(UserManager.class);PowerManager power=context.getSystemService(PowerManager.class);
            KeyguardManager keys=context.getSystemService(KeyguardManager.class);
            if(users==null||!users.isUserUnlocked()||power==null||!power.isInteractive()||keys==null||keys.isDeviceLocked())throw new Refusal("protected");
            ConfigSnapshot config=FeatureSettings.verifiedSnapshot(context);
            if(config==null)throw new Refusal("unavailable");
            boolean allowed=ConfigSchema.truthy(config.get(AtomicWorkbenchConfig.ENABLED))
                    &&ConfigSchema.truthy(config.get(AtomicWorkbenchExtractionPolicy.ENABLED))
                    &&ConfigSchema.truthy(config.get(AtomicWorkbenchExtractionPolicy.TEXT_ENABLED))
                    &&(context.getResources().getConfiguration().orientation!=Configuration.ORIENTATION_LANDSCAPE
                        ||ConfigSchema.truthy(config.get(AtomicWorkbenchExtractionPolicy.LANDSCAPE)));
            String nonce=random();Bundle request=new Bundle();request.putInt("schema",1);request.putString("nonce",nonce);request.putInt("user",uid/100000);request.putInt("module_uid",uid);
            Bundle b=context.getContentResolver().call(Uri.parse("content://"+(uid/100000)+"@ls.augment.com.workbench"),"extraction_session_state",null,request);
            exact(b,Set.of("schema","nonce","module_uid","user","service_generation","connected","config_revision","config_checksum","reset_generation","reset_blocked"));
            if(integer(b,"schema")!=1||!nonce.equals(string(b,"nonce"))||integer(b,"module_uid")!=uid||integer(b,"user")!=uid/100000
                    ||!generation.equals(string(b,"service_generation"))||!Boolean.TRUE.equals(b.get("connected"))
                    ||!Boolean.FALSE.equals(b.get("reset_blocked"))||number(b,"config_revision")!=config.revision
                    ||!config.checksum.equals(string(b,"config_checksum")))throw new Refusal("stale");
            long reset=number(b,"reset_generation");if(reset<0)throw new Refusal("stale");
            ResolveInfo home=context.getPackageManager().resolveActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME),PackageManager.MATCH_DEFAULT_ONLY);
            String homePackage=home==null||home.activityInfo==null?null:home.activityInfo.packageName;
            String ime=Settings.Secure.getString(context.getContentResolver(),Settings.Secure.DEFAULT_INPUT_METHOD);
            ComponentName input=ime==null?null:ComponentName.unflattenFromString(ime);
            resolver.caller(uid,pid);
            return new AtomicWorkbenchExtractionPointerBroker.State(uid,uid/100000,generation,config.revision,config.checksum,reset,
                    ViewConfiguration.getLongPressTimeout(),ViewConfiguration.get(context).getScaledTouchSlop(),
                    config.get(AtomicWorkbenchExtractionPolicy.BLACKLIST),homePackage,input==null?null:input.getPackageName(),allowed);
        }
    }
    private static void exact(Bundle b,Set<String> keys)throws Refusal{if(b==null||!b.keySet().equals(keys))throw new Refusal("rejected");}
    private static String string(Bundle b,String k)throws Refusal{Object v=b.get(k);if(!(v instanceof String))throw new Refusal("rejected");return(String)v;}
    private static int integer(Bundle b,String k)throws Refusal{Object v=b.get(k);if(!(v instanceof Integer))throw new Refusal("rejected");return(Integer)v;}
    private static long number(Bundle b,String k)throws Refusal{Object v=b.get(k);if(!(v instanceof Long))throw new Refusal("rejected");return(Long)v;}
    private AtomicWorkbenchExtractionEvidenceHook(){}
}
