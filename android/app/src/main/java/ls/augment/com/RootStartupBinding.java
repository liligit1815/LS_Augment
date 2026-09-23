package ls.augment.com;

import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

/** Fixed-ROM startup binding only. A completed binding never grants Root admission. */
final class RootStartupBinding {
    private static final long MAX_STARTUP_NANOS=TimeUnit.SECONDS.toNanos(120);
    private final RootEarlyModule.WindowAuthority authority;
    private final RootEarlyCoordinator coordinator;
    private final RootEarlyModule module;
    private final Looper mainLooper;
    private final Thread mainThread;
    private final int pid,uid;
    private final long created,deadline;
    private final Handler handler;
    private final Object generation=new Object();
    private final Ticket ticket=new Ticket(generation);
    private final Shapes shapes;
    private final RootProcessGroupProfile.Resolved processGroup;
    // Every mutable field is guarded by authority, the coordinator's existing control monitor.
    private String state="CREATED",reason="main task has not executed";
    private boolean committed;
    private Bound bound;
    private volatile Bound runtimeBound;
    private String oomImplementation="none";
    private long executedMillis;
    private int executingPid,executingUid,executingTid;

    private RootStartupBinding(RootEarlyModule.WindowAuthority authority,RootEarlyCoordinator coordinator,
            RootEarlyModule module,ClassLoader services,ClassLoader boot,RootAndroidClassOrigins origins,
            RootProcessGroupProfile.Resolved processGroup)throws Exception {
        this.authority=java.util.Objects.requireNonNull(authority);
        this.coordinator=java.util.Objects.requireNonNull(coordinator);this.module=java.util.Objects.requireNonNull(module);
        authority.require(coordinator,module);
        this.processGroup=java.util.Objects.requireNonNull(processGroup,"Actual process-group profile required");
        mainLooper=Looper.getMainLooper();mainThread=Thread.currentThread();pid=Process.myPid();uid=Process.myUid();
        if(mainLooper==null || mainLooper.getThread()!=mainThread || Looper.myLooper()!=mainLooper
                || pid<=0 || Process.myTid()!=pid || uid!=1000)
            throw new IllegalStateException("startup creation is not the actual system main thread");
        created=System.nanoTime();deadline=created+MAX_STARTUP_NANOS;handler=new Handler(mainLooper);
        shapes=new Shapes(services,boot,java.util.Objects.requireNonNull(origins));
    }

    static RootStartupBinding createAndPost(RootEarlyModule.WindowAuthority authority,RootEarlyCoordinator coordinator,
            RootEarlyModule module,ClassLoader services,ClassLoader boot,RootAndroidClassOrigins origins,
            RootProcessGroupProfile.Resolved processGroup)throws Exception {
        RootStartupBinding value=new RootStartupBinding(authority,coordinator,module,services,boot,origins,processGroup);
        try {
            synchronized(authority){authority.require(coordinator,module);value.requireIdentity();value.requireTime();value.state="POSTED";}
            if(!value.handler.post(value.ticket))throw new IllegalStateException("main Handler refused startup task");
            synchronized(authority) {
                authority.require(coordinator,module);value.requireIdentity();value.requireTime();
                if(!"POSTED".equals(value.state))throw new IllegalStateException("startup task ran or closed before early commit");
            }
            return value;
        } catch(Throwable failure) {
            value.cancel();
            if(failure instanceof Exception)throw (Exception)failure;
            if(failure instanceof Error)throw (Error)failure;
            throw new IllegalStateException(failure);
        }
    }

    /** Called inside the coordinator's final authority-guarded successful early commit. */
    void commitEarly(RootEarlyModule.WindowAuthority supplied,RootEarlyCoordinator owner)throws Exception {
        synchronized(authority) {
            if(supplied!=authority || owner!=coordinator)throw new IllegalStateException("foreign startup generation");
            authority.require(coordinator,module);requireIdentity();requireTime();
            if(!"POSTED".equals(state) || committed)throw new IllegalStateException("startup generation is not awaiting early commit");
            committed=true;state="EARLY_COMMITTED";
        }
    }

    /** Only the owning coordinator's exact private generation; no diagnostic boolean is admission. */
    void requireBoundGeneration(RootEarlyModule.WindowAuthority supplied,RootEarlyCoordinator owner) {
        synchronized(authority) {
            if(supplied!=authority || owner!=coordinator || !committed || !"BOUND".equals(state) || bound==null)
                throw new IllegalStateException("startup binding is foreign, incomplete or revoked");
        }
    }

    void requireRuntimeCurrent(){if(runtimeBound==null)throw new IllegalStateException("Startup runtime binding revoked");}
    void requireRuntimeMain(){requireRuntimeCurrent();requireIdentity();}
    void requireNativeOwner(Object pms,Object ams,Object ums,Handler handler) {
        Bound current=runtimeBound;
        if(current==null || current.pms!=pms || current.ams!=ams || current.ums!=ums || current.amsHandler!=handler)
            throw new IllegalStateException("Native bridge differs from actual startup binding");
    }

    /** Revokes this generation, including an already completed private binding. Never calls back. */
    void cancel() {
        synchronized(authority){runtimeBound=null;if(!"FAILED".equals(state)){state="CANCELLED";reason="startup generation revoked";}committed=false;bound=null;oomImplementation="none";}
        // Framework queue operations never run under the authority monitor.
        try{handler.removeCallbacks(ticket);}catch(Throwable ignored){/* The private ticket remains revoked. */}
    }

    Snapshot snapshot() {
        synchronized(authority) {
            return new Snapshot(state,reason,pid,uid,executingPid,executingUid,executingTid,executedMillis,
                bound==null?-1:bound.phase,bound==null?"none":bound.manager.getClass().getName(),
                bound==null?"none":bound.ams.getClass().getName(),bound==null?"none":bound.pms.getClass().getName(),
                bound==null?"none":bound.ums.getClass().getName(),bound==null?"none":bound.amsHandler.getClass().getName(),
                oomImplementation,bound!=null && "BOUND".equals(state));
        }
    }

    private final class Ticket implements Runnable {
        private final Object expectedGeneration;
        private Ticket(Object expected){expectedGeneration=expected;}
        @Override public void run(){runQueued(this,expectedGeneration);}
    }
    private void runQueued(Ticket actual,Object expectedGeneration) {
        Throwable rejection=null;
        try {
            synchronized(authority) {
                if("CANCELLED".equals(state) || "FAILED".equals(state) || "BOUND".equals(state) || "RUNNING".equals(state))return;
                if(actual!=ticket || expectedGeneration!=generation || !committed || !"EARLY_COMMITTED".equals(state))
                    throw new IllegalStateException("startup task executed without its early commit");
                requireIdentity();requireTime();
                if(!normalMainQueueStack(Thread.currentThread().getStackTrace()))
                    throw new IllegalStateException("startup task is not in the normal post-startup main loop");
                state="RUNNING";executingPid=Process.myPid();executingUid=Process.myUid();executingTid=Process.myTid();
                executedMillis=(System.nanoTime()-created)/1_000_000;
            }
            Bound actualBound=shapes.bind(); // Read framework state without retaining our authority monitor.
            // This read uses the exact private AMS instance just bound by Shapes.
            // It does not hold authority, invoke native code, or grant Root admission.
            String actualOom=java.util.Objects.requireNonNull(processGroup.requireOomBinding(actualBound.ams),
                "OOM implementation verification returned no value");
            synchronized(authority) {
                if(!"RUNNING".equals(state) || !committed)return; // Stop won; discard local objects.
                requireIdentity();requireTime();bound=actualBound;oomImplementation=actualOom;state="BOUND";
                reason="actual main task, fixed service instances and OOM implementation bound; separate Root runtime required";
                runtimeBound=actualBound;
            }
            coordinator.startupBound(this); // Framework effect binding runs after releasing authority.
        } catch(Throwable failure) {
            synchronized(authority) {
                if(!"CANCELLED".equals(state)) {
                    state="FAILED";bound=null;runtimeBound=null;oomImplementation="none";committed=false;reason=clean(failure.getClass().getName()+":"+failure.getMessage(),320);
                    rejection=failure;
                }
            }
        }
        if(rejection!=null) {
            try{coordinator.startupRejected(this,rejection);}catch(Throwable ignored){/* Never replace the system main loop's continuation. */}
        }
    }
    private void requireIdentity() {
        if(Thread.currentThread()!=mainThread || Looper.getMainLooper()!=mainLooper || Looper.myLooper()!=mainLooper
                || mainLooper.getThread()!=mainThread || Process.myPid()!=pid || Process.myUid()!=uid || Process.myTid()!=pid)
            throw new IllegalStateException("startup execution identity changed");
        if(Thread.currentThread().isInterrupted())throw new IllegalStateException("startup thread interrupted");
    }
    private void requireTime(){if(deadline-System.nanoTime()<=0)throw new IllegalStateException("startup task deadline passed");}
    private static boolean normalMainQueueStack(StackTraceElement[] stack) {
        if(stack==null || stack.length>96)return false;int loop=-1,server=-1;
        for(int i=0;i<stack.length;i++) {
            String owner=stack[i].getClassName(),name=stack[i].getMethodName();
            if(owner.equals(RootEarlyModule.class.getName()) && name.equals("onModuleLoaded"))return false;
            if(owner.equals("com.android.server.SystemServer")) {
                if(name.equals("createSystemContext") || name.equals("startOtherServices"))return false;
                if(name.equals("run")){if(server!=-1)return false;server=i;}
            }
            if(owner.equals("android.os.Looper") && name.equals("loop")){if(loop!=-1)return false;loop=i;}
        }
        return loop>=0 && server>loop;
    }

    /** Exact pinned source mapping; class name namespaces are not source evidence. */
    private static final class Shapes {
        final Class<?> manager,ams,amLocal,amInternal,pms,pmLocal,pmInternal,ums,mainHandler;
        final Method getLocal,getUms;
        final Field phase,restarted,amOwner,pmOwner,amsManager,amsHandler;
        Shapes(ClassLoader services,ClassLoader boot,RootAndroidClassOrigins origins)throws Exception {
            Class<?> local=type("com.android.server.LocalServices","2/classes.dex",services,boot,origins);
            manager=type("com.android.server.SystemServiceManager","1/classes.dex",services,boot,origins);
            amInternal=type("android.app.ActivityManagerInternal","2/classes.dex",services,boot,origins);
            // This android.* class is actually in this ROM's services.jar, not framework.jar.
            pmInternal=type("android.content.pm.PackageManagerInternal","1/classes.dex",services,boot,origins);
            ams=type("com.android.server.am.ActivityManagerService","1/classes.dex",services,boot,origins);
            amLocal=type("com.android.server.am.ActivityManagerService$LocalService","1/classes.dex",services,boot,origins);
            mainHandler=type("com.android.server.am.ActivityManagerService$MainHandler","1/classes.dex",services,boot,origins);
            pms=type("com.android.server.pm.PackageManagerService","1/classes2.dex",services,boot,origins);
            pmLocal=type("com.android.server.pm.PackageManagerService$PackageManagerInternalImpl","1/classes2.dex",services,boot,origins);
            ums=type("com.android.server.pm.UserManagerService","1/classes2.dex",services,boot,origins);
            if(!amInternal.isAssignableFrom(amLocal) || !pmInternal.isAssignableFrom(pmLocal) || !Handler.class.isAssignableFrom(mainHandler))
                throw new IllegalStateException("fixed service hierarchy differs");
            getLocal=method(local,"getService",Object.class,9,Class.class);getUms=method(ums,"getInstance",ums,9);
            phase=field(manager,"mCurrentPhase",int.class,1);restarted=field(manager,"mRuntimeRestarted",boolean.class,1);
            amOwner=field(amLocal,"this$0",ams,17);pmOwner=field(pmLocal,"this$0",pms,17);
            amsManager=field(ams,"mSystemServiceManager",manager,1);amsHandler=field(ams,"mHandler",mainHandler,17);
        }
        Bound bind()throws Throwable {
            Object ssm=invoke(getLocal,null,manager);exact(ssm,manager);
            int actualPhase=phase.getInt(ssm);
            if(actualPhase<550 || restarted.getBoolean(ssm))throw new IllegalStateException("startup phase/cold-start contract differs");
            Object aml=invoke(getLocal,null,amInternal);exact(aml,amLocal);
            Object actualAms=amOwner.get(aml);exact(actualAms,ams);
            if(amsManager.get(actualAms)!=ssm)throw new IllegalStateException("AMS uses a different service manager");
            Object pml=invoke(getLocal,null,pmInternal);exact(pml,pmLocal);
            Object actualPms=pmOwner.get(pml);exact(actualPms,pms);
            Object actualUms=invoke(getUms,null);exact(actualUms,ums);
            Object rawHandler=amsHandler.get(actualAms);exact(rawHandler,mainHandler);
            Handler lane=(Handler)rawHandler;
            if(lane.getLooper()==null || lane.getLooper().getThread()==null)throw new IllegalStateException("AMS lane has no looper/thread");
            // Recheck ordinary registration/owner changes during sampling; not an adversarial seqlock.
            if(invoke(getLocal,null,manager)!=ssm || invoke(getLocal,null,amInternal)!=aml || invoke(getLocal,null,pmInternal)!=pml
                    || invoke(getUms,null)!=actualUms || amOwner.get(aml)!=actualAms || pmOwner.get(pml)!=actualPms
                    || amsManager.get(actualAms)!=ssm || amsHandler.get(actualAms)!=lane
                    || phase.getInt(ssm)<550 || restarted.getBoolean(ssm))
                throw new IllegalStateException("startup services changed during binding");
            return new Bound(ssm,actualAms,actualPms,actualUms,lane,actualPhase);
        }
    }
    private static final class Bound {
        final Object manager,ams,pms,ums;final Handler amsHandler;final int phase;
        Bound(Object manager,Object ams,Object pms,Object ums,Handler handler,int phase){this.manager=manager;this.ams=ams;this.pms=pms;this.ums=ums;amsHandler=handler;this.phase=phase;}
    }
    private static Class<?> type(String name,String source,ClassLoader services,ClassLoader boot,RootAndroidClassOrigins origins)throws Exception {
        Class<?> owner=Class.forName(name,false,source.startsWith("1/")?services:boot);
        RootCriticalProfile.SourceEvidence evidence=origins.attest(owner,source);
        String hash=source.startsWith("1/")?RootCriticalProfile.SERVICES_SHA256:RootCriticalProfile.FRAMEWORK_SHA256;
        if(evidence==null || evidence.owner!=owner || evidence.definingLoader!=owner.getClassLoader()
                || !hash.equals(evidence.archiveSha256) || !source.substring(2).equals(evidence.dexEntry))
            throw new IllegalStateException("startup class origin differs: "+name);
        return owner;
    }
    private static Field field(Class<?> owner,String name,Class<?> type,int flags)throws Exception {
        Field field=owner.getDeclaredField(name);
        // DEX synthetic is not an access/identity requirement; access/static/final/volatile/transient are exact.
        if(field.getDeclaringClass()!=owner || field.getType()!=type || (field.getModifiers()&0xdf)!=flags)
            throw new NoSuchFieldException("fixed startup field differs: "+owner.getName()+"."+name);
        field.setAccessible(true);return field;
    }
    private static Method method(Class<?> owner,String name,Class<?> result,int flags,Class<?>... parameters)throws Exception {
        Method chosen=null;
        for(Method candidate:owner.getDeclaredMethods())if(candidate.getName().equals(name) && candidate.getReturnType()==result && Arrays.equals(candidate.getParameterTypes(),parameters)) {
            if(chosen!=null)throw new NoSuchMethodException("ambiguous startup getter");chosen=candidate;
        }
        if(chosen==null || chosen.getDeclaringClass()!=owner || (chosen.getModifiers()&0x1dff)!=flags)
            throw new NoSuchMethodException("fixed startup getter differs: "+owner.getName()+"."+name);
        chosen.setAccessible(true);return chosen;
    }
    private static Object invoke(Method method,Object owner,Object... args)throws Throwable {
        try{return method.invoke(owner,args);}catch(InvocationTargetException failed){throw failed.getCause();}
    }
    private static void exact(Object value,Class<?> expected){if(value==null || value.getClass()!=expected)throw new IllegalStateException("unexpected actual service: "+expected.getName());}
    private static String clean(String text,int max){if(text==null)return "null";StringBuilder out=new StringBuilder();for(int i=0;i<text.length()&&i<max;i++){char c=text.charAt(i);out.append(c>=32&&c<=126?c:'?');}return out.toString();}

    static final class Snapshot {
        final String state,reason,managerType,amsType,pmsType,umsType,handlerType,oomImplementation;
        final boolean oomBindingVerified;
        final int pid,uid,executingPid,executingUid,executingTid,phase;
        final long executedMillis;
        private Snapshot(String state,String reason,int pid,int uid,int ep,int eu,int et,long elapsed,int phase,String manager,String ams,String pms,String ums,String handler,String oomImplementation,boolean oomBindingVerified) {
            this.state=state;this.reason=reason;this.pid=pid;this.uid=uid;executingPid=ep;executingUid=eu;executingTid=et;
            executedMillis=elapsed;this.phase=phase;managerType=manager;amsType=ams;pmsType=pms;umsType=ums;handlerType=handler;
            this.oomImplementation=oomImplementation;this.oomBindingVerified=oomBindingVerified;
        }
        String renderDiagnostic(){return "STARTUP_BINDING_V1 status="+state+" rootAdmission=false pid="+pid+" uid="+uid
            +" executingPid="+executingPid+" executingUid="+executingUid+" executingTid="+executingTid+" elapsedMs="+executedMillis+" phase="+phase
            +"\nSTARTUP_TYPES manager="+managerType+" ams="+amsType+" pms="+pmsType+" ums="+umsType+" handler="+handlerType
            +"\nSTARTUP_OOM oomBindingVerified="+oomBindingVerified+" oomImplementation="+clean(oomImplementation,192)
            +"\nSTARTUP_REASON "+clean(reason,320)+"\nSTARTUP_DIAGNOSTIC_END\n";}
    }
}
