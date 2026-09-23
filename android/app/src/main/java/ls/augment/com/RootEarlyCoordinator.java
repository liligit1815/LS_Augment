package ls.augment.com;

import android.os.Looper;
import android.os.Process;
import io.github.libxposed.api.XposedModuleInterface;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.TimeoutException;

/** Actual callback-only coordinator. There is deliberately no injectable early/Origins predicate. */
final class RootEarlyCoordinator {
    private final RootEarlyModule.WindowAuthority authority;
    private final Object control;
    private boolean attempted,windowOpen;
    private volatile boolean stopped;
    private volatile RootRuntimeAdmission runtime;
    private RootEarlyModule loadedModule;
    private ClassLoader runtimeLoader;
    private RootProcessGroupProfile.Resolved runtimeProcessGroup;
    private RootAndroidClassOrigins runtimeOrigins;
    private RootRuntimeProfile.Resolved runtimeProfile;
    private RootOwnershipProfile.Resolved ownershipProfile;
    private String ownershipProfileFailure="not prepared";
    private volatile RootHiddenRequestIngress hiddenRequests;
    private String hiddenRequestFailure="not prepared";
    private RuntimePermit runtimePermit;
    private Thread callbackThread;
    private RootEarlyModule callbackModule;
    private XposedModuleInterface.ModuleLoadedParam callbackParam;
    private RootEarlyWait<RootAndroidClassOrigins> pending;
    private RootCriticalInstaller installer;
    private RootStartupBinding startup;
    private long start,preparation;
    private int pid,uid,profileCount,additionalCount,unresolved;
    private List<RootEarlyModule.OwnerSource> owners=Collections.emptyList();

    RootEarlyCoordinator(RootEarlyModule.WindowAuthority authority) {
        this.authority=java.util.Objects.requireNonNull(authority);control=authority;authority.bind(this);
    }

    RootEarlyModule.Result onModuleLoaded(RootEarlyModule module,XposedModuleInterface.ModuleLoadedParam param,RootEarlyModule.Mode mode) {
        synchronized(control) {
            if(attempted || stopped)return outcome("REJECTED_REENTRY","one attempt already consumed",null,false);
            attempted=true;start=System.nanoTime();callbackThread=Thread.currentThread();windowOpen=true;
            callbackModule=module;callbackParam=param;
        }
        final long deadline=start+RootEarlyWait.MAX_WAIT_NANOS;
        try {
            requireActualWindow(module,param,deadline);
            // Resolve through the actual context, then use the Class's DEFINING
            // loader. Its source is attested after archive preparation below.
            ClassLoader context=Thread.currentThread().getContextClassLoader();
            Class<?> systemServer=Class.forName("com.android.server.SystemServer",false,context);
            ClassLoader servicesLoader=systemServer.getClassLoader();
            ClassLoader bootLoader=Object.class.getClassLoader();
            Class<?> activityThread=Class.forName("android.app.ActivityThread",false,bootLoader);
            RootEarlyWait<RootAndroidClassOrigins> wait=new RootEarlyWait<>(RootAndroidClassOrigins::prepare,deadline);
            synchronized(control){if(stopped)throw new IllegalStateException("stopped before prepare");pending=wait;}
            long prepareStart=System.nanoTime();RootAndroidClassOrigins origins;
            try{origins=wait.startAndAwait();}finally{synchronized(control){preparation=(System.nanoTime()-prepareStart)/1_000_000;}}
            requireActualWindow(module,param,deadline);
            RootCriticalProfile.SourceEvidence systemOrigin=origins.attest(systemServer,"1/classes.dex");
            RootCriticalProfile.SourceEvidence activityOrigin=origins.attest(activityThread,"2/classes.dex");
            RootCriticalProfile profile=RootCriticalProfile.resolve(servicesLoader,bootLoader,origins);
            requireActualWindow(module,param,deadline);
            RootCoverageAdditions.Resolved additions=RootCoverageAdditions.resolveAdditional(servicesLoader,bootLoader,origins);
            RootCoverageAdditions.combine(profile,additions); // Validate actual declaring-Class agreement; grants no coverage admission.
            requireActualWindow(module,param,deadline);
            RootProcessGroupProfile.Resolved processGroup=RootProcessGroupProfile.resolve(servicesLoader,bootLoader,origins);
            RootProcessGroupProfile.combineCallers(RootCoverageAdditions.combine(profile,additions),processGroup);
            requireActualWindow(module,param,deadline);
            RootRuntimeProfile.Resolved nativeProfile=RootRuntimeProfile.resolve(servicesLoader,bootLoader,origins,additions);
            requireActualWindow(module,param,deadline);
            // Native registration is a separate prerequisite for recovery. An
            // unsupported observer shape does not silently disable ordinary Root
            // hiding, and never grants recovery authority. The original callback
            // deadline still applies to all preparation performed here.
            RootOwnershipProfile.Resolved observedProfile=null;
            String observedFailure="none";
            try { observedProfile=RootOwnershipProfile.resolve(servicesLoader,bootLoader,origins); }
            catch(Throwable error) { observedFailure=RootEarlyModule.clean(error.getClass().getName()+":"+error.getMessage(),240); }
            requireActualWindow(module,param,deadline);
            RootHiddenRequestProfile.Resolved requestProfile=null;
            try {
                requestProfile=RootHiddenRequestProfile.resolve(servicesLoader,bootLoader,origins);
                hiddenRequestFailure="none";
            } catch(Throwable error) {
                hiddenRequestFailure=RootEarlyModule.clean(error.getClass().getName()+":"+error.getMessage(),240);
            }
            requireActualWindow(module,param,deadline);
            ArrayList<RootEarlyModule.OwnerSource> rows=new ArrayList<>();Set<Class<?>> seen=Collections.newSetFromMap(new IdentityHashMap<>());
            for(RootCriticalProfile.SourceEvidence origin:List.of(systemOrigin,activityOrigin))if(seen.add(origin.owner))rows.add(new RootEarlyModule.OwnerSource(origin));
            for(RootCriticalProfile.ResolvedMember member:profile.evidence)if(seen.add(member.origin.owner))rows.add(new RootEarlyModule.OwnerSource(member.origin));
            for(RootCoverageAdditions.Member member:additions.evidence)if(seen.add(member.origin.owner))rows.add(new RootEarlyModule.OwnerSource(member.origin));
            for(RootProcessGroupProfile.Member member:processGroup.evidence)if(seen.add(member.origin.owner))rows.add(new RootEarlyModule.OwnerSource(member.origin));
            for(RootCriticalProfile.SourceEvidence origin:nativeProfile.evidence.values())if(seen.add(origin.owner))rows.add(new RootEarlyModule.OwnerSource(origin));
            synchronized(control){owners=Collections.unmodifiableList(rows);profileCount=profile.methodsByDescriptor.size();additionalCount=additions.methodsByDescriptor.size();unresolved=profile.unresolved.size();}
            if(mode==RootEarlyModule.Mode.PREPARE_ONLY)return commitSuccess(module,param,deadline,"PREPARED_EARLY","profile/source observation only; no gates installed");
            requireActualWindow(module,param,deadline);
            RootCriticalInstaller current;
            synchronized(control) {
                if(stopped)throw new IllegalStateException("stopped before installer construction");
                current=new RootCriticalInstaller(module,profile,processGroup);installer=current;
            }
            current.installDormant(deadline);
            requireActualWindow(module,param,deadline);
            if(current.state()!=RootCriticalInstaller.State.INACTIVE_PROFILE_UNRESOLVED || current.installationFailure()!=null)
                throw new IllegalStateException("dormant installation did not complete",current.installationFailure());
            if(mode==RootEarlyModule.Mode.INSTALL_DORMANT)
                return commitSuccess(module,param,deadline,"DORMANT_EARLY","six transparent callbacks; coverage/admission unresolved");
            current.deoptimizeCallers(additions,deadline);
            requireActualWindow(module,param,deadline);
            if(current.state()!=RootCriticalInstaller.State.PROTECTION_PREPARED || current.deoptimizationFailure()!=null)
                throw new IllegalStateException("fixed caller treatment did not complete",current.deoptimizationFailure());
            if(requestProfile!=null) {
                RootHiddenRequestIngress ingress=new RootHiddenRequestIngress(module,requestProfile,this,authority);
                synchronized(control) {
                    if(stopped || hiddenRequests!=null)throw new IllegalStateException("Hidden request installation generation differs");
                    hiddenRequests=ingress; // Own even a partial registration before calling the framework.
                }
                ingress.install(deadline);
                requireActualWindow(module,param,deadline);
                if(observedProfile!=null) {
                    ingress.installOwnership(observedProfile,deadline);
                    requireActualWindow(module,param,deadline);
                }
            }
            RootStartupBinding binding=RootStartupBinding.createAndPost(authority,this,module,servicesLoader,bootLoader,origins,processGroup);
            synchronized(control) {
                startup=binding; // Own the exact pending event before the final early commit.
                loadedModule=module;runtimeLoader=servicesLoader;runtimeProcessGroup=processGroup;runtimeOrigins=origins;runtimeProfile=nativeProfile;
                ownershipProfile=observedProfile;ownershipProfileFailure=observedFailure;
                if(stopped)throw new IllegalStateException("stopped before startup ownership");
                requireActualWindow(module,param,deadline);
                if(!current.activateProtection(authority,this,module))throw new IllegalStateException("protection activation rejected",current.activationFailure());
                requireActualWindow(module,param,deadline);
                binding.commitEarly(authority,this);
                // A slow framework call or cancellation must not mint a late successful generation.
                requireActualWindow(module,param,deadline);
                return commitWithinWindow(deadline,"PROTECTION_EARLY","six gates active; fixed caller receipts true; startup binding pending; Root admission absent");
            }
        } catch(Throwable failure) {
            RootHiddenRequestIngress requests=hiddenRequests;
            if(requests!=null)requests.revoke(failure);
            RootCriticalInstaller current;
            RootStartupBinding binding;
            synchronized(control){current=installer;binding=startup;}
            if(binding!=null)binding.cancel();
            if(current!=null)current.retire();
            String status=failure instanceof TimeoutException?"REJECTED_TIMEOUT":failure instanceof InterruptedException?"REJECTED_INTERRUPTED":"REJECTED";
            return outcome(status,"early protection attempt rejected; retirement requested if constructed; Root admission absent",failure,current!=null);
        } finally {
            RootEarlyWait<RootAndroidClassOrigins> wait;
            synchronized(control){windowOpen=false;wait=pending;pending=null;callbackModule=null;callbackParam=null;}
            if(wait!=null)wait.cancel();
        }
    }
    private RootEarlyModule.Result commitSuccess(RootEarlyModule module,XposedModuleInterface.ModuleLoadedParam param,
                                                long deadline,String status,String reason)throws Exception {
        requireActualWindow(module,param,deadline);
        return commitWithinWindow(deadline,status,reason);
    }
    /** Mandatory installer-side check: exact owned installer and this actual callback's original deadline. */
    void requireOwnedInstaller(RootCriticalInstaller candidate,RootEarlyModule.WindowAuthority supplied)throws Exception {
        synchronized(control) {
            if(candidate==null || candidate!=installer || supplied!=authority || callbackModule==null || callbackParam==null)
                throw new IllegalStateException("installer is not owned by this actual callback");
            requireActualWindow(callbackModule,callbackParam,start+RootEarlyWait.MAX_WAIT_NANOS);
        }
    }
    void requireOwnedHiddenIngress(RootHiddenRequestIngress candidate,RootEarlyModule.WindowAuthority supplied)throws Exception {
        synchronized(control) {
            if(candidate==null || candidate!=hiddenRequests || supplied!=authority || callbackModule==null || callbackParam==null)
                throw new IllegalStateException("Hidden request ingress is not owned by this callback");
            requireActualWindow(callbackModule,callbackParam,start+RootEarlyWait.MAX_WAIT_NANOS);
        }
    }
    void requireDistinctHiddenIngressHandle(RootHiddenRequestIngress candidate,io.github.libxposed.api.XposedInterface.HookHandle handle)throws Exception {
        requireOwnedHiddenIngress(candidate,authority);
        synchronized(control) {
            if(handle==null || installer==null || installer.ownsHookHandle(handle))
                throw new IllegalStateException("Hidden request handle is not distinct from existing protection");
        }
    }
    /** The actual module uses this after its protected early callback has committed. */
    void installRuntimeEntry(RootEarlyModule module,ClassLoader loader,RootEarlyModule.EntryAuthority entryAuthority)throws Throwable {
        requireEntry(entryAuthority,module);
        RuntimePermit permit;
        synchronized(control) {
            if(stopped || windowOpen || loadedModule!=module || loader!=runtimeLoader || startup==null
                    || installer==null || installer.state()!=RootCriticalInstaller.State.LOCKING_ACTIVE
                    || runtimePermit!=null || runtime!=null)throw new IllegalStateException("Runtime entry generation differs");
            permit=new RuntimePermit();runtimePermit=permit;
        }
        RootRuntimeAdmission created;
        try {
            created=RootRuntimeAdmission.create(permit);
            requireEntry(entryAuthority,module);
            synchronized(control){if(stopped || runtime!=null)throw new IllegalStateException("Runtime entry revoked before publication");runtime=created;}
            created.install();
            requireEntry(entryAuthority,module);
        }catch(Throwable failure){retire();throw failure;}
    }
    private void requireEntry(RootEarlyModule.EntryAuthority entryAuthority,RootEarlyModule module) {
        java.util.Objects.requireNonNull(entryAuthority).require(module,this);
    }
    boolean ownsRuntime(RootRuntimeAdmission candidate){return !stopped && candidate!=null && runtime==candidate;}
    boolean runtimeStartupReady(RootRuntimeAdmission candidate) {
        if(!ownsRuntime(candidate))return false;
        try{startup.requireRuntimeCurrent();return true;}catch(IllegalStateException incomplete){return false;}
    }
    void startupBound(RootStartupBinding binding) {
        synchronized(control){if(stopped || binding==null || binding!=startup)throw new IllegalStateException("Foreign startup completion");binding.requireBoundGeneration(authority,this);}
    }
    final class RuntimePermit {
        private boolean consumed;
        private RuntimePermit(){ }
        RuntimeInputs consume() {
            synchronized(control) {
                if(this!=runtimePermit || consumed || stopped || windowOpen || startup==null
                        || installer==null || installer.state()!=RootCriticalInstaller.State.LOCKING_ACTIVE)
                    throw new IllegalStateException("Runtime construction permit unavailable");
                consumed=true;return new RuntimeInputs(RootEarlyCoordinator.this,loadedModule,installer,startup,runtimeLoader,runtimeProcessGroup,runtimeProfile,ownershipProfile,ownershipProfileFailure,hiddenRequests,hiddenRequestFailure);
            }
        }
    }
    static final class RuntimeInputs {
        final RootEarlyCoordinator coordinator;final RootEarlyModule module;final RootCriticalInstaller installer;
        final RootStartupBinding startup;final ClassLoader loader;final RootProcessGroupProfile.Resolved processGroup;final RootRuntimeProfile.Resolved profile;
        final RootOwnershipProfile.Resolved ownershipProfile;final String ownershipProfileFailure;
        final RootHiddenRequestIngress hiddenRequests;final String hiddenRequestFailure;
        private RuntimeInputs(RootEarlyCoordinator c,RootEarlyModule m,RootCriticalInstaller i,RootStartupBinding s,ClassLoader l,
                RootProcessGroupProfile.Resolved p,RootRuntimeProfile.Resolved r,RootOwnershipProfile.Resolved o,String f,
                RootHiddenRequestIngress h,String hf){coordinator=c;module=m;installer=i;startup=s;loader=l;processGroup=p;profile=r;ownershipProfile=o;ownershipProfileFailure=f;hiddenRequests=h;hiddenRequestFailure=hf;}
    }

    private RootEarlyModule.Result commitWithinWindow(long deadline,String status,String reason)throws Exception {
        synchronized(control) {
            authority.requireCurrent(this); // Same monitor as authority.close: revocation and commit are linearized.
            if(!windowOpen || stopped || callbackThread!=Thread.currentThread())throw new IllegalStateException("window stopped before completion commit");
            if(Thread.currentThread().isInterrupted())throw new InterruptedException("callback interrupted before completion commit");
            if(deadline-System.nanoTime()<=0)throw new TimeoutException("deadline passed before completion commit");
            windowOpen=false; // Commit only on the original live callback; no later completion has authority.
            return outcome(status,reason,null,false);
        }
    }
    private void requireActualWindow(RootEarlyModule module,XposedModuleInterface.ModuleLoadedParam param,long deadline)throws Exception {
        authority.require(this,module);
        synchronized(control){if(!windowOpen || stopped || callbackThread!=Thread.currentThread())throw new IllegalStateException("callback window is closed/stopped/foreign");}
        if(Thread.currentThread().isInterrupted())throw new InterruptedException("callback thread interrupted");
        if(deadline-System.nanoTime()<=0)throw new TimeoutException("callback budget expired");
        Looper main=Looper.getMainLooper();int actualPid=Process.myPid(),actualUid=Process.myUid();
        if(main==null || main.getThread()!=Thread.currentThread() || actualUid!=1000 || actualPid<=0 || Process.myTid()!=actualPid)
            throw new IllegalStateException("not actual system_server main thread");
        synchronized(control){pid=actualPid;uid=actualUid;}
        if(param==null || !param.isSystemServer() || !"system".equals(param.getProcessName()))throw new IllegalStateException("wrong system callback parameters");
        if(module.getApiVersion()!=102 || module.getFrameworkVersionCode()!=7854 || !"LSPosed".equals(module.getFrameworkName()))
            throw new IllegalStateException("framework identity differs from retained device");
        if(!matchesCallbackStack(Thread.currentThread().getStackTrace()))throw new IllegalStateException("missing exact callback and synchronous initialization stack");
    }
    /** Pure shape helper; only the private runtime sampler above can open/use a window. */
    static boolean matchesCallbackStack(StackTraceElement[] stack) {
        if(stack==null || stack.length>64)return false;int callback=-1,pair=-1;
        for(int i=0;i<stack.length;i++) {
            StackTraceElement frame=stack[i];
            if(frame.getClassName().equals(RootEarlyModule.class.getName()) && frame.getMethodName().equals("onModuleLoaded")) {
                if(callback!=-1)return false;callback=i;
            }
            if(i+1<stack.length && frame.getClassName().equals("android.app.ActivityThread") && frame.getMethodName().equals("systemMain")
                    && stack[i+1].getClassName().equals("com.android.server.SystemServer") && stack[i+1].getMethodName().equals("createSystemContext")) {
                if(pair!=-1)return false;pair=i;
            }
        }
        return callback>=0 && pair>callback;
    }
    CompletionStage<RootEarlyModule.Result> retire() {
        RootCriticalInstaller current;RootEarlyWait<RootAndroidClassOrigins> wait;RootStartupBinding binding;
        synchronized(control){stopped=true;windowOpen=false;current=installer;wait=pending;binding=startup;}
        RootHiddenRequestIngress requests=hiddenRequests;
        if(requests!=null)requests.revoke(new IllegalStateException("Owning early generation retired"));
        RootRuntimeAdmission active=runtime;if(active!=null)active.revoke();
        if(binding!=null)binding.cancel();
        if(wait!=null)wait.cancel();
        if(current==null)return CompletableFuture.completedFuture(outcome("STOPPED","no critical installer created",null,false));
        CompletionStage<RootEarlyModule.Result> internal=current.retire().thenCompose(result->{
            CompletionStage<String> entryReceipt=active==null?CompletableFuture.completedFuture("ENTRY_NOT_CREATED"):active.unhookAfterDrain();
            return entryReceipt.thenApply(receipt->outcome(retirementStatus(result),
                RootEarlyModule.clean((result.failures.isEmpty()?"core cleanup requests finished":String.join(";",result.failures))+"; "+receipt,192),null,result.restartRequired));
        });
        return internal.thenApply(value->value); // Public cancellation cannot skip entry cleanup.
    }
    /** Only a failure of this coordinator's own queued event can retire this generation. */
    void startupRejected(RootStartupBinding binding,Throwable failure) {
        synchronized(control){if(startup!=binding || binding==null)return;}
        retire();
    }
    String startupDiagnostic() {
        RootStartupBinding binding;
        synchronized(control){binding=startup;}
        String text=binding==null?"STARTUP_BINDING_NOT_CREATED\n":binding.snapshot().renderDiagnostic();
        RootRuntimeAdmission current=runtime;return text+(current==null?"ROOT_RUNTIME_NOT_CREATED rootAdmission=false\n":current.diagnostic());
    }
    String protectionDiagnostic() {
        RootCriticalInstaller current;
        synchronized(control){current=installer;}
        if(current==null)return "PROTECTION_NOT_CREATED rootAdmission=false\n";
        StringBuilder out=new StringBuilder("PROTECTION_RECEIPTS_V1 state=").append(current.state())
            .append(" domain=").append(current.domain.state()).append(" rootAdmission=false\n");
        int n=0;
        for(String descriptor:current.installedHookDescriptors())out.append("HOOK ").append(++n).append(' ').append(descriptor).append('\n');
        for(RootCriticalInstaller.DeoptReceipt receipt:current.deoptimizationReceipts())
            out.append("DEOPT ").append(receipt.ordinal).append(' ').append(receipt.outcome).append(' ').append(receipt.descriptor).append('\n');
        out.append("PROTECTION_RECEIPTS_END\n");
        return out.length()<=32768?out.toString():"PROTECTION_DIAGNOSTIC_OVERSIZE\n";
    }
    private static String retirementStatus(RootCriticalInstaller.Retirement result) {
        return result.restartRequired?"RESTART_REQUIRED":result.released?"RETIRED":"RETAINED_FAILURE";
    }
    private RootEarlyModule.Result outcome(String status,String reason,Throwable failure,boolean restart) {
        synchronized(control){return new RootEarlyModule.Result(status,reason,failure,start==0?0:(System.nanoTime()-start)/1_000_000,
            preparation,pid,uid,profileCount,additionalCount,unresolved,owners,restart);}
    }
}
