package ls.augment.com.hook;

import android.graphics.Rect;
import android.graphics.Region;
import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.view.SurfaceControl;
import android.view.View;
import android.view.WindowManager;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import static ls.augment.com.hook.AtomicWorkbenchExtractionWindowResolver.*;

/** Uses the original compositor transparency hint; never infers transparency from a window name. */
final class AtomicWorkbenchDecorTransparency {
    static final int TRANSACTION=0x00D04E0B;
    static final String DESCRIPTOR="ls.augment.com.atomic_decor_transparency.v1";
    private static final ThreadLocal<Object> traversal=new ThreadLocal<>();
    private static final Map<Object,Proof> proofs=new WeakHashMap<>();
    private static boolean installed;
    private static long lastDiagnostic;
    private static synchronized void diagnostic(String stage,Throwable failure,int mask){
        long now=android.os.SystemClock.elapsedRealtime();if(now-lastDiagnostic<3000)return;lastDiagnostic=now;
        String branch=failure instanceof Refusal?((Refusal)failure).capability:failure==null?"":"native_"+failure.getClass().getSimpleName();
        HookTelemetry.atomicWorkbench("INFO","ATOMIC_WORKBENCH_DECOR_TRANSPARENCY stage="+stage+";branch="+branch+";field_mask="+mask,null);
    }
    private static final class Proof {
        final SurfaceControl surface;
        final int layer,display,width,height;
        final Rect frame;
        final Region region;
        volatile boolean committed;
        Proof(Object root,SurfaceControl surface,Region region)throws Exception{
            this.surface=surface;layer=layer(surface);
            View view=(View)field(root,"mView");
            if(view==null||view.getDisplay()==null||field(root,"mTranslator")!=null)throw new Refusal("unavailable");
            display=view.getDisplay().getDisplayId();width=number(root,"mWidth");height=number(root,"mHeight");
            frame=new Rect((Rect)field(root,"mWinFrame"));
            WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)field(root,"mWindowAttributes");
            if(!decoration(attrs)||!new Rect().equals(field(attrs,"surfaceInsets"))||frame.left!=0||frame.top!=0
                    ||frame.width()!=width||frame.height()!=height||width<=0||height<=0)
                throw new Refusal("unavailable");
            this.region=new Region(region);
            this.region.op(new Rect(0,0,width,height),Region.Op.INTERSECT);
        }
    }
    // These are LSPosed hook endpoints in the privileged host, not app SDK calls.
    // No public API exposes the original committed compositor hint. Resolve the
    // complete contract before hooking; hidden-API denial keeps native behavior.

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    @android.annotation.SuppressLint({"SoonBlockedPrivateApi", "PrivateApi"})
    static synchronized int install(AugmentModule module,ClassLoader loader){
        if(installed)return 1;
        try{
            Class<?> root=Class.forName("android.view.ViewRootImpl",false,loader);
            Class<?> client=Class.forName("android.view.ViewRootImpl$W",false,loader);
            Class<?> stub=Class.forName("android.view.IWindow$Stub",false,loader);
            Method walk=root.getDeclaredMethod("performTraversals");
            Method hint=SurfaceControl.Transaction.class.getDeclaredMethod("setTransparentRegionHint",SurfaceControl.class,Region.class);
            Method tx=stub.getDeclaredMethod("onTransact",int.class,Parcel.class,Parcel.class,int.class);
            // Verify the complete commit callback and client-root capabilities before installing any path.
            SurfaceControl.Transaction.class.getMethod("addTransactionCommittedListener",java.util.concurrent.Executor.class,SurfaceControl.TransactionCommittedListener.class);
            if(walk.getReturnType()!=void.class||hint.getReturnType()!=SurfaceControl.Transaction.class
                    ||tx.getReturnType()!=boolean.class
                    ||client.getDeclaredField("mViewAncestor").getType()!=WeakReference.class
                    ||root.getDeclaredField("mWindowAttributes").getType()!=WindowManager.LayoutParams.class)
                throw new Refusal("unavailable","decor_hook_contract");
            module.deoptimize(walk);module.deoptimize(hint);module.deoptimize(tx);
            module.registerFeatureHook(module.prepareFeatureHook(walk,"atomic_workbench.decor_traversal",true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain->{
                Object previous=traversal.get();traversal.set(chain.getThisObject());
                try{return chain.proceed();}finally{if(previous==null)traversal.remove();else traversal.set(previous);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(hint,"atomic_workbench.decor_hint",true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain->{
                Object owner=traversal.get();Proof pending=null;
                // An OEM can issue a hint outside performTraversals. Revoke the former proof too;
                // a missing original-root association must never retain stale transparency.
                try{
                    int changed=layer((SurfaceControl)chain.getArg(0));
                    synchronized(proofs){proofs.values().removeIf(proof->proof.layer==changed);}
                }catch(Exception unavailable){synchronized(proofs){proofs.clear();}}
                if(owner!=null)try{
                    WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)field(owner,"mWindowAttributes");
                    if(decoration(attrs)){
                        synchronized(proofs){proofs.remove(owner);}
                        SurfaceControl surface=(SurfaceControl)chain.getArg(0);
                        if(surface==call(owner,"getSurfaceControl",new Class<?>[0]))
                            pending=new Proof(owner,surface,(Region)chain.getArg(1));
                    }
                }catch(Exception unavailable){synchronized(proofs){proofs.remove(owner);}diagnostic("hint",unavailable,0);}
                Object result=chain.proceed();
                if(pending!=null){
                    final Proof offered=pending;final WeakReference<Object> weak=new WeakReference<>(owner);
                    synchronized(proofs){if(proofs.size()>=16)proofs.clear();proofs.put(owner,offered);}
                    try{((SurfaceControl.Transaction)chain.getThisObject()).addTransactionCommittedListener(Runnable::run,()->{
                        Object live=weak.get();synchronized(proofs){if(live!=null&&proofs.get(live)==offered)offered.committed=true;}
                    });}catch(Throwable unavailable){synchronized(proofs){if(proofs.get(owner)==offered)proofs.remove(owner);}}
                }
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(tx,"atomic_workbench.decor_query",true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain->{
                if((Integer)chain.getArg(0)!=TRANSACTION||!client.isInstance(chain.getThisObject()))return chain.proceed();
                Parcel data=(Parcel)chain.getArg(1),reply=(Parcel)chain.getArg(2);
                if(reply!=null){
                    boolean clear=false;String nonce=null;
                    try{
                        if(Binder.getCallingUid()!=1000||((Integer)chain.getArg(3)&~0x12)!=0||data.dataSize()>256)throw new Refusal("rejected");
                        data.enforceInterface(DESCRIPTOR);if(data.readInt()!=1)throw new Refusal("rejected");
                        nonce=data.readString();int layer=data.readInt(),display=data.readInt(),width=data.readInt(),height=data.readInt(),x=data.readInt(),y=data.readInt();
                        if(!hex(nonce,32)||data.dataAvail()!=0)throw new Refusal("rejected");
                        Object owner=((WeakReference<?>)field(chain.getThisObject(),"mViewAncestor")).get();
                        Proof proof;synchronized(proofs){proof=proofs.get(owner);}
                        clear=proof!=null&&proof.committed&&proof.layer==layer&&proof.display==display&&proof.width==width&&proof.height==height
                                &&proof.surface.isValid()&&layer(proof.surface)==layer&&proof.region.contains(x,y);
                        if(!clear)diagnostic("query",null,proof==null?0:1|(proof.committed?2:0)|(proof.layer==layer?4:0)
                                |(proof.display==display?8:0)|(proof.width==width&&proof.height==height?16:0)
                                |(proof.surface.isValid()?32:0)|(proof.region.contains(x,y)?64:0));
                    }catch(Exception unavailable){clear=false;}
                    reply.writeNoException();reply.writeInt(1);reply.writeString(nonce);reply.writeInt(clear?1:0);
                }
                return true;
            }));
            installed=true;module.logFeatureInfo("ATOMIC_WORKBENCH_DECOR_TRANSPARENCY_INSTALLED");return 1;
        }catch(Throwable unavailable){module.logFeatureInfo("ATOMIC_WORKBENCH_DECOR_TRANSPARENCY_UNAVAILABLE");return 0;}
    }
    static boolean decoration(WindowManager.LayoutParams attrs)throws Exception{
        int rounded=constant("PRIVATE_FLAG_IS_ROUNDED_CORNERS_OVERLAY");
        int trusted=constant("PRIVATE_FLAG_TRUSTED_OVERLAY");
        int flags=number(attrs,"privateFlags");
        return attrs.type==constant("TYPE_NAVIGATION_BAR_PANEL")
                &&(attrs.flags&WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE)!=0
                &&(flags&rounded)!=0&&(flags&trusted)!=0;
    }
    private static int constant(String name)throws Exception{
        java.lang.reflect.Field field=WindowManager.LayoutParams.class.getDeclaredField(name);field.setAccessible(true);return field.getInt(null);
    }
    static int layer(SurfaceControl surface)throws Exception{
        if(surface==null||!surface.isValid())throw new Refusal("unavailable");
        return (Integer)call(surface,"getLayerId",new Class<?>[0]);
    }
    private static java.lang.reflect.Field surfaceField(Object owner)throws Exception{
        for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try{
            java.lang.reflect.Field field=type.getDeclaredField("mSurfaceControl");
            if(!SurfaceControl.class.isAssignableFrom(field.getType()))throw new Refusal("unavailable","decor_surface_type");
            field.setAccessible(true);return field;
        }catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException("mSurfaceControl");
    }
    static SurfaceControl windowSurface(Object animator)throws Exception{
        java.lang.reflect.Field surface;
        try{surface=surfaceField(animator);}
        catch(NoSuchFieldException older){
            // Older WindowStateAnimator owns a WindowSurfaceController. A present but invalid
            // direct interface must not silently fall through to an unrelated legacy surface.
            Object controller=field(animator,"mSurfaceController");
            return (SurfaceControl)surfaceField(controller).get(controller);
        }
        return (SurfaceControl)surface.get(animator);
    }
    /** Captured/checked only under WMS lock; the remote read itself must occur outside that lock. */
    static final class Overlay {
        final Object state,content,surface;
        final IBinder client;
        final int layer,uid,pid,display,width,height;
        final Rect frame;
        Overlay(Object state,Object content,int display,int width,int height)throws Exception{
            this.state=state;this.content=content;this.display=display;this.width=width;this.height=height;
            WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)field(state,"mAttrs");
            if(!"com.android.systemui".equals(attrs.packageName))throw new Refusal("unavailable","decor_owner");
            if(!decoration(attrs))throw new Refusal("unavailable","decor_flags");
            if(!Boolean.TRUE.equals(field(state,"mOwnerCanAddInternalSystemWindow")))throw new Refusal("unavailable","decor_internal_permission");
            if(!Boolean.TRUE.equals(field(field(state,"mToken"),"mRoundedCornerOverlay")))throw new Refusal("unavailable","decor_native_role");
            if(!new Rect().equals(field(attrs,"surfaceInsets")))throw new Refusal("unavailable","decor_insets");
            if((attrs.flags&WindowManager.LayoutParams.FLAG_SECURE)!=0||Boolean.TRUE.equals(call(state,"isSecureLocked",new Class<?>[0])))
                throw new Refusal("unavailable","decor_secure");
            uid=number(state,"mOwnerUid");pid=number(field(state,"mSession"),"mPid");
            // The exact privileged WMS client is the authority, never an arbitrary same-UID endpoint.
            client=binder(field(state,"mClient"));
            surface=windowSurface(field(state,"mWinAnimator"));
            layer=layer((SurfaceControl)surface);
            frame=new Rect((Rect)call(state,"getFrame",new Class<?>[0]));
            if(!client.isBinderAlive()||frame.left!=0||frame.top!=0||frame.width()!=width||frame.height()!=height)
                throw new Refusal("unavailable","decor_geometry");
        }
        boolean same()throws Exception{
            Overlay now=new Overlay(state,content,display,width,height);
            return now.client.equals(client)&&now.layer==layer&&now.uid==uid&&now.pid==pid&&now.frame.equals(frame)
                    &&call(state,"getDisplayContent",new Class<?>[0])==content;
        }
        boolean clear(float x,float y)throws Exception{
            Parcel data=Parcel.obtain(),reply=Parcel.obtain();String nonce=random();
            try{
                data.writeInterfaceToken(DESCRIPTOR);data.writeInt(1);data.writeString(nonce);
                data.writeInt(layer);data.writeInt(display);data.writeInt(width);data.writeInt(height);data.writeInt((int)x);data.writeInt((int)y);
                if(!client.transact(TRANSACTION,data,reply,0))return false;
                reply.readException();return reply.readInt()==1&&nonce.equals(reply.readString())&&reply.readInt()==1&&reply.dataAvail()==0;
            }finally{data.recycle();reply.recycle();}
        }
    }
}
