package ls.augment.com;

import android.os.Binder;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import io.github.libxposed.api.XposedInterface;
import java.lang.reflect.Method;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;

/** One private, nonrenewable generation for the finite synchronous Root contract. */
final class RootRuntimeAdmission implements RootTransactionEngine.Admission {
    private final RootEarlyCoordinator coordinator;
    private final RootEarlyModule module;
    private final RootCriticalInstaller installer;
    private final RootStartupBinding startup;
    private final ClassLoader loader;
    private final RootProcessGroupProfile.Resolved processGroup;
    private final RootOwnershipProfile.Resolved ownershipProfile;
    private final String ownershipProfileFailure;
    private final RootHiddenRequestIngress hiddenRequests;
    private final String hiddenRequestFailure;
    private final Class<?> shellClass;
    private final Method command;
    private final Handler main;
    private final Object control=new Object();
    private volatile boolean revoked,registered;
    private volatile String state="CREATED",failure="none";
    private volatile RootTransactionBundle bundle;
    private volatile RootOwnershipObservation ownedObservation;
    private volatile RootCommandEntry adapter;
    private XposedInterface.HookHandle handle;
    private boolean trustedHandle,prepareAttempted,cleanupWanted,cleanupClaimed,registrationStarted,registrationFinished;
    private final CompletableFuture<String> cleanupFinished=new CompletableFuture<>();
    private BundlePermit bundlePermit;
    private Object representativeShell;

    private RootRuntimeAdmission(RootEarlyCoordinator.RuntimeInputs input)throws Throwable {
        coordinator=input.coordinator;module=input.module;installer=input.installer;
        startup=input.startup;loader=input.loader;processGroup=input.processGroup;
        ownershipProfile=input.ownershipProfile;ownershipProfileFailure=input.ownershipProfileFailure;
        hiddenRequests=input.hiddenRequests;hiddenRequestFailure=input.hiddenRequestFailure;
        RootRuntimeProfile.Resolved profile=Objects.requireNonNull(input.profile);
        shellClass=profile.shellClass;command=profile.command; // Exact early-attested/deoptimized D041 Method.
        if(Class.forName(shellClass.getName(),false,loader)!=shellClass || command.getDeclaringClass()!=shellClass)
            throw new IllegalStateException("Runtime entry defining class differs from the early profile");
        Looper loop=Looper.getMainLooper();
        if(loop==null || loop!=Looper.myLooper() || loop.getThread()!=Thread.currentThread()
                || Process.myUid()!=1000 || Process.myTid()!=Process.myPid())
            throw new IllegalStateException("Root entry must be prepared on actual system main");
        main=new Handler(loop);
    }

    static RootRuntimeAdmission create(RootEarlyCoordinator.RuntimePermit permit)throws Throwable {
        return new RootRuntimeAdmission(Objects.requireNonNull(permit).consume());
    }

    void install()throws Throwable {
        try {
            synchronized(control){if(!"CREATED".equals(state)||revoked)throw new IllegalStateException("Root entry already attempted");state="INSTALLING";registrationStarted=true;}
            XposedInterface.HookHandle actual=module.hook(command)
                .setExceptionMode(XposedInterface.ExceptionMode.PASSTHROUGH).intercept(chain->{
                    Object requested=chain.getArg(0);
                    if(!HideRootProtocol.COMMAND.equals(requested))return chain.proceed();
                    // The server may await AMS completion. Never block either managed Looper.
                    try {
                        if(Binder.getCallingUid()!=0)return 77;
                        if(revoked || !registered || !coordinator.ownsRuntime(this))return 75;
                        RootTransactionBundle current=bundle;
                        if(Looper.myLooper()==Looper.getMainLooper() || (current!=null && current.isNativeLane()))return 75;
                        Object shell=chain.getThisObject();
                        RootCommandEntry entry=adapter;
                        if(entry==null)entry=warmupEntry(shell);
                        return entry.dispatch(shell,requested,chain::proceed);
                    }catch(Throwable matchedFailure){return 75;}
                });
            synchronized(control){handle=actual;}
            if(actual==null || !command.equals(actual.getExecutable()) || installer.ownsHookHandle(actual))
                throw new IllegalStateException("Root entry handle is not exact or distinct");
            synchronized(control){trustedHandle=true;if(revoked)throw new IllegalStateException("Root entry revoked during install");registered=true;state="WAITING_FOR_PREPARE";}
        } catch(Throwable error){reject(error);throw error;}
        finally{synchronized(control){registrationFinished=true;}cleanupTrustedHandle();}
    }

    private RootCommandEntry warmupEntry(Object shell)throws Throwable {
        synchronized(control) {
            if(revoked || !registered || shell==null || shell.getClass()!=shellClass)
                throw new IllegalStateException("Root entry is not available");
            if(adapter!=null)return adapter;
            // RootCommandEntry retains the real UID/permission/owner/parser gates.
            // This server can never reserve or execute a mutation.
            HideRootServer warming=new HideRootServer(1,new HideRootServer.Engine(){
                @Override public HideRootServer.Permit reserve(HideRootProtocol.Request request){beginPreparation();return null;}
                @Override public java.util.concurrent.CompletionStage<HideRootProtocol.Outcome> execute(
                        HideRootProtocol.Request request,HideRootServer.Permit permit){
                    return CompletableFuture.completedFuture(HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE);
                }
            },0);
            RootCommandEntry created=new RootCommandEntry(loader,shell,warming,this::diagnostic);
            representativeShell=shell;adapter=created;return created;
        }
    }

    private void beginPreparation() {
        synchronized(control) {
            if(prepareAttempted || revoked || !registered || !coordinator.runtimeStartupReady(this))return;
            prepareAttempted=true;state="PREPARING";
        }
        try {if(!main.post(this::prepareOnMain))throw new IllegalStateException("Root preparation post rejected");}
        catch(Throwable error){reject(error);}
    }

    private void prepareOnMain() {
        try {
            requireGeneration();startup.requireRuntimeMain();
            Object shell;
            synchronized(control){if(!prepareAttempted || !"PREPARING".equals(state))throw new IllegalStateException("Root preparation not owned");shell=representativeShell;}
            BundlePermit permit;
            synchronized(control){if(bundlePermit!=null || revoked)throw new IllegalStateException("Root bundle already attempted");permit=new BundlePermit(shell);bundlePermit=permit;}
            RootTransactionBundle created=RootTransactionBundle.createForRuntime(permit);
            // Own the observation before startup validation can register native
            // watchers. A cancellation during that validation must also revoke
            // this not-yet-published bundle; retain one pointer for the generation.
            ownedObservation=created.observation;
            requireGeneration();
            created.requireStartupOwner(startup);
            requireGeneration();
            synchronized(control){if(revoked || bundle!=null)throw new IllegalStateException("Root bundle publication changed");bundle=created;}
            created.prepareIdentity(preparation->{
                try {
                    requireGeneration();startup.requireRuntimeMain();created.requireStartupOwner(startup);
                    if(!preparation.success || preparation.ticket!=created.compatibility.currentTicket())
                        throw new IllegalStateException("Root OEM identity preparation failed: "+preparation.message);
                    synchronized(control) {
                        if(revoked || bundle!=created || !"PREPARING".equals(state))throw new IllegalStateException("Root identity publication revoked");
                        adapter=created.entry;state="READY";
                    }
                }catch(Throwable error){reject(error);}
            });
        }catch(Throwable error){reject(error);}
    }

    final class BundlePermit {
        private final Object shell;
        private boolean consumed;
        private BundlePermit(Object shell){this.shell=shell;}
        BundleInputs consume() {
            requireGeneration();startup.requireRuntimeMain();
            synchronized(control) {
                if(consumed || this!=bundlePermit || revoked || bundle!=null || !"PREPARING".equals(state))
                    throw new IllegalStateException("Root bundle permit unavailable");
                consumed=true;return new BundleInputs(installer.domain,loader,processGroup,shell,RootRuntimeAdmission.this,module,ownershipProfile,ownershipProfileFailure,hiddenRequests,hiddenRequestFailure);
            }
        }
    }
    static final class BundleInputs {
        final RootLifecycleDomain domain;final ClassLoader loader;final RootProcessGroupProfile.Resolved processGroup;
        final Object shell;final RootRuntimeAdmission admission;
        final RootEarlyModule module;final RootOwnershipProfile.Resolved ownershipProfile;final String ownershipProfileFailure;
        final RootHiddenRequestIngress hiddenRequests;final String hiddenRequestFailure;
        private BundleInputs(RootLifecycleDomain d,ClassLoader l,RootProcessGroupProfile.Resolved p,Object s,RootRuntimeAdmission a,
                RootEarlyModule m,RootOwnershipProfile.Resolved o,String f,RootHiddenRequestIngress h,String hf){domain=d;loader=l;processGroup=p;shell=s;admission=a;module=m;ownershipProfile=o;ownershipProfileFailure=f;hiddenRequests=h;hiddenRequestFailure=hf;}
    }

    @Override public RootTransactionEngine.AdmissionTicket capture(RootTransactionEngine owner) {
        requireReady(owner);
        return new Ticket(owner);
    }
    private final class Ticket implements RootTransactionEngine.AdmissionTicket {
        private final RootTransactionEngine engine;
        private Ticket(RootTransactionEngine engine){this.engine=engine;}
        @Override public void requireCurrent(RootTransactionEngine owner) {
            if(owner!=engine)throw new IllegalStateException("Foreign Root runtime ticket");
            requireReady(owner);
        }
    }
    /** K/KG may hold native monitors: these checks perform only volatile/reference reads. */
    private void requireReady(RootTransactionEngine engine) {
        RootTransactionBundle current=bundle;
        if(!"READY".equals(state) || current==null || current.engine!=engine)
            throw new IllegalStateException("Root runtime is not ready for this engine");
        requireGeneration();
    }
    private void requireGeneration() {
        if(revoked || !registered || !coordinator.ownsRuntime(this)
                || installer.state()!=RootCriticalInstaller.State.LOCKING_ACTIVE
                || installer.domain.state()!=RootLifecycleDomain.State.LOCKING_ACTIVE)
            throw new IllegalStateException("Root runtime generation revoked");
        startup.requireRuntimeCurrent();
    }

    /** Revocation is published before coordinator cancellation/drain; never takes a lock. */
    void revoke(){revoked=true;state="REVOKED";RootOwnershipObservation current=ownedObservation;if(current!=null)current.revoke();if(hiddenRequests!=null)hiddenRequests.revoke(new IllegalStateException("Owning Root runtime revoked"));}
    private void reject(Throwable error) {
        failure=RootEarlyModule.clean(error.getClass().getName()+":"+error.getMessage(),320);
        revoke();
    }
    java.util.concurrent.CompletionStage<String> unhookAfterDrain() {
        synchronized(control){cleanupWanted=true;}
        cleanupTrustedHandle();
        return cleanupFinished.thenApply(value->value);
    }
    private void cleanupTrustedHandle() {
        XposedInterface.HookHandle actual;String unavailable;
        synchronized(control){
            if(!cleanupWanted || cleanupClaimed || !registrationFinished)return;
            cleanupClaimed=true;actual=trustedHandle?handle:null;
            unavailable=registrationStarted?"ENTRY_CLEANUP_UNKNOWN restart required":"ENTRY_NOT_REGISTERED";
        }
        if(actual==null){cleanupFinished.complete(unavailable);return;}
        try {
            Thread worker=new Thread(()->{
                String receipt;
                try{actual.unhook();receipt="ENTRY_UNHOOK_REQUEST_RETURNED restart required";}
                catch(Throwable error){failure=RootEarlyModule.clean("entry unhook uncertain: "+error,320);receipt="ENTRY_UNHOOK_UNCERTAIN restart required";}
                cleanupFinished.complete(receipt);
            },"lsa-root-entry-retire");
            worker.setDaemon(true);worker.start();
        }catch(Throwable dispatchFailure){cleanupFinished.complete("ENTRY_CLEANUP_DISPATCH_FAILED restart required");}
    }
    String diagnostic() {
        RootTransactionBundle current=bundle;boolean ready=false;
        if(current!=null)try{requireReady(current.engine);ready=true;}catch(Throwable ignored){ }
        return "ROOT_RUNTIME state="+(revoked?"REVOKED":state)+" entryRegistered="+registered+" bundleBound="+(current!=null)
            +" rootAdmission="+ready+" contract=SYNCHRONOUS_USER_INSTANCE failure="+failure+"\n"
            +(current==null?"ROOT_NATIVE_OBSERVATION state=NOT_BOUND ownershipAdmission=false profileFailure="+ownershipProfileFailure+"\n"
                +(hiddenRequests==null?"ROOT_HIDDEN_REQUEST_INGRESS state=UNAVAILABLE ownershipAdmission=false failure="+hiddenRequestFailure+"\n":hiddenRequests.diagnostic()):current.observation.diagnostic());
    }
}
