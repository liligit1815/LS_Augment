package ls.augment.com;

import io.github.libxposed.api.XposedInterface;
import java.lang.reflect.Executable;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/**
 * API102 protective installation candidate. No production entry calls it.
 * Real early-window authority stays private to the owning coordinator. This
 * component records actual API receipts and may activate ordinary protection;
 * it never grants Root admission or claims that a deopt true proves ART quiescence.
 */
final class RootCriticalInstaller {
    enum State { NEW, INSTALLING, INACTIVE_PROFILE_UNRESOLVED, DEOPTIMIZING, PROTECTION_PREPARED, LOCKING_ACTIVE, STOPPING, RETAINED_FAILURE, RESTART_REQUIRED, RELEASED }
    enum DeoptOutcome { RETURNED_TRUE, RETURNED_FALSE, THREW }
    static final class DeoptReceipt {
        final int ordinal;
        final String descriptor;
        final DeoptOutcome outcome;
        private DeoptReceipt(int ordinal,String descriptor,DeoptOutcome outcome){this.ordinal=ordinal;this.descriptor=descriptor;this.outcome=outcome;}
    }
    static final class Retirement {
        final boolean released;
        final boolean unknownRegistration;
        final boolean restartRequired;
        final List<String> failures;
        Retirement(boolean released, boolean unknownRegistration, boolean restartRequired, List<String> failures) {
            this.released=released;this.unknownRegistration=unknownRegistration;
            this.restartRequired=restartRequired;
            this.failures=Collections.unmodifiableList(new ArrayList<>(failures));
        }
    }
    private static final RootLifecycleDomain.HookPoint[] POINTS=RootLifecycleDomain.HookPoint.values();
    private static final String[] KEYS={"G1","G2","G3","R4","K"};
    private static final class Receipt {
        final RootLifecycleDomain.HookPoint point;
        final XposedInterface.HookHandle handle;
        boolean trusted, registered, requestReturned, removalUncertain;
        Receipt(RootLifecycleDomain.HookPoint point,XposedInterface.HookHandle handle) {
            this.point=point;this.handle=handle;
        }
    }
    private final XposedInterface api;
    private final RootCriticalProfile profile;
    private final RootProcessGroupProfile.Resolved processGroup;
    private final Object control=new Object();
    private final Object installationOwner=new Object();
    final RootLifecycleDomain domain;
    private final List<Receipt> receipts=new ArrayList<>();
    private final List<String> installedDescriptors=new ArrayList<>();
    private final List<DeoptReceipt> deoptReceipts=new ArrayList<>();
    private volatile State state=State.NEW;
    private volatile Throwable installationFailure;
    private volatile Throwable deoptimizationFailure;
    private volatile Throwable activationFailure;
    private boolean installRunning,deoptRunning,deoptAttempted,stopRequested,cleanupRunning,unknownRegistration,registrationStarted;
    private long installationDeadline,deoptDeadline;
    private int expectedDeoptCount;
    private CompletableFuture<Retirement> attempt=new CompletableFuture<>();

    RootCriticalInstaller(XposedInterface api,RootCriticalProfile profile,RootProcessGroupProfile.Resolved processGroup) {
        this.api=Objects.requireNonNull(api);this.profile=Objects.requireNonNull(profile);
        this.processGroup=Objects.requireNonNull(processGroup);
        if(profile.hooks.size()!=5 || profile.callers.size()!=35 || profile.unresolved.size()!=11)
            throw new IllegalArgumentException("Incomplete fixed unresolved profile");
        if(POINTS.length!=6 || POINTS[5]!=RootLifecycleDomain.HookPoint.KG_PROCESS_GROUP)
            throw new IllegalArgumentException("Complete six-point domain is required");
        for(String key:KEYS)Objects.requireNonNull(profile.hooks.get(key));
        domain=RootLifecycleDomain.create(installationOwner);
    }

    /** Legacy dormant-only entry retained for the frozen regression contract; not an early-window witness. */
    void installDormant() {installDormantInternal(0);}
    /** The real coordinator supplies its original five-second absolute deadline. */
    void installDormant(long deadlineNanos) {
        if(deadlineNanos==0)throw new IllegalArgumentException("Bounded installation needs a nonzero absolute deadline");
        installDormantInternal(deadlineNanos);
    }
    private void installDormantInternal(long deadlineNanos) {
        synchronized(control) {
            if(state!=State.NEW)throw new IllegalStateException("Installation already started or stopped");
            state=State.INSTALLING;installRunning=true;installationDeadline=deadlineNanos;
        }
        try {
            for(int index=0;index<POINTS.length;index++) {
                requireContinuing(deadlineNanos);
                RootLifecycleDomain.HookPoint point=POINTS[index];
                Method target=index<KEYS.length?profile.hooks.get(KEYS[index]):processGroup.hook;
                // No stable hook id: API-102 same-id replacement can leave old
                // in-flight snapshots using a different domain during hot reload.
                XposedInterface.HookBuilder builder=Objects.requireNonNull(Objects.requireNonNull(api.hook(target))
                    .setExceptionMode(XposedInterface.ExceptionMode.PASSTHROUGH));
                XposedInterface.HookHandle handle;
                // From this point, this process epoch can only end by process
                // reconstruction. Even normal unhook is not complete removal proof.
                synchronized(control){requireContinuing(deadlineNanos);registrationStarted=true;}
                try { handle=builder.intercept(callback(point)); }
                catch(Throwable uncertain) {
                    unknownRegistration=true; // A thrown installation has no usable cleanup handle.
                    throw uncertain;
                }
                if(handle==null) {
                    unknownRegistration=true;
                    throw new IllegalStateException("Hook returned no cleanup handle");
                }
                Receipt receipt=new Receipt(point,handle);
                receipts.add(receipt); // Retain before querying potentially broken handle metadata.
                try {
                    if(!target.equals(handle.getExecutable()))
                        throw new IllegalStateException("Hook handle targets another executable");
                    for(Receipt old:receipts)if(old!=receipt && old.handle==handle)
                        throw new IllegalStateException("Hook reused an earlier cleanup handle");
                } catch(Throwable untrustworthyHandle) {
                    unknownRegistration=true;
                    throw untrustworthyHandle;
                }
                receipt.trusted=true;
                domain.recordInstalled(installationOwner,point,handle);
                receipt.registered=true;
                synchronized(control){installedDescriptors.add(descriptorOf(target));}
                requireContinuing(deadlineNanos);
            }
        } catch(Throwable failure) {
            installationFailure=failure;
            synchronized(control) { stopRequested=true; }
        } finally {
            boolean stop;
            synchronized(control) {
                installRunning=false;stop=stopRequested;
                state=stop?State.STOPPING:State.INACTIVE_PROFILE_UNRESOLVED;
            }
            if(stop)startCleanup();
        }
    }

    /** Fixed actual resolved plan only; no caller-supplied method list or boolean qualification. */
    void deoptimizeCallers(RootCoverageAdditions.Resolved additions,long deadlineNanos) {
        synchronized(control) {
            if(state!=State.INACTIVE_PROFILE_UNRESOLVED || installationFailure!=null || installRunning || deoptAttempted || stopRequested)
                throw new IllegalStateException("Six dormant hooks must precede one deopt attempt");
            deoptAttempted=true;deoptRunning=true;deoptDeadline=deadlineNanos;state=State.DEOPTIMIZING;
        }
        try {
            if(deadlineNanos==0 || (installationDeadline!=0 && installationDeadline!=deadlineNanos))
                throw new IllegalArgumentException("Deopt must consume the same bounded installation deadline");
            requireContinuing(deadlineNanos);
            List<Executable> targets=RootProcessGroupProfile.combineCallers(
                RootCoverageAdditions.combine(profile,additions),processGroup);
            if(targets.size()<=RootCoverageAdditions.TOTAL_CALLER_COUNT)
                throw new IllegalStateException("New process-group caller coverage is absent");
            synchronized(control){expectedDeoptCount=targets.size();}
            Map<Method,String> descriptors=new LinkedHashMap<>();
            for(RootCriticalProfile.ResolvedMember row:profile.evidence)descriptors.put(row.method,row.expected.descriptor);
            for(RootCoverageAdditions.Member row:additions.evidence)if(descriptors.putIfAbsent(row.method,row.expected.descriptor)!=null)
                throw new IllegalStateException("Additional method duplicates retained method");
            for(RootProcessGroupProfile.Member row:processGroup.evidence) {
                String previous=descriptors.putIfAbsent(row.method,row.expected.descriptor);
                if(previous!=null && !previous.equals(row.expected.descriptor))
                    throw new IllegalStateException("Process-group descriptor conflicts with retained method");
            }
            int ordinal=0;
            for(Executable executable:targets) {
                requireContinuing(deadlineNanos);
                if(!(executable instanceof Method))throw new IllegalStateException("Fixed caller is not a Method");
                Method method=(Method)executable;String descriptor=Objects.requireNonNull(descriptors.get(method));ordinal++;
                boolean returned;
                try{returned=api.deoptimize(method);}
                catch(Throwable failure){recordDeopt(ordinal,descriptor,DeoptOutcome.THREW);throw failure;}
                recordDeopt(ordinal,descriptor,returned?DeoptOutcome.RETURNED_TRUE:DeoptOutcome.RETURNED_FALSE);
                if(!returned)throw new IllegalStateException("deopt returned false at "+ordinal+": "+descriptor);
                requireContinuing(deadlineNanos);
            }
            synchronized(control) {
                requireContinuing(deadlineNanos);
                if(deoptReceipts.size()!=expectedDeoptCount)throw new IllegalStateException("Missing deopt receipts");
                state=State.PROTECTION_PREPARED;
            }
        } catch(Throwable failure) {
            deoptimizationFailure=failure;
            synchronized(control){stopRequested=true;state=State.STOPPING;}
        } finally {
            boolean stop;
            synchronized(control){deoptRunning=false;stop=stopRequested;}
            if(stop)startCleanup();
        }
    }

    /**
     * Only the owning coordinator's private live authority can activate this
     * exact installer. It independently rechecks its original callback and budget;
     * a newly supplied deopt deadline cannot manufacture an early window.
     * Lock order is authority -> installer control. This does not issue Root admission.
     */
    boolean activateProtection(RootEarlyModule.WindowAuthority authority,RootEarlyCoordinator owner,RootEarlyModule module) {
        try {
            Objects.requireNonNull(authority,"Private early authority is required");
            synchronized(authority) {
                authority.require(owner,module);
                if(api!=module)throw new IllegalStateException("Installer API is not the authority's exact module");
                owner.requireOwnedInstaller(this,authority);
                synchronized(control) {
                    if(state!=State.PROTECTION_PREPARED || stopRequested || installRunning || deoptRunning)return false;
                    requireContinuing(deoptDeadline);
                    if(receipts.size()!=6 || expectedDeoptCount<=RootCoverageAdditions.TOTAL_CALLER_COUNT
                            || deoptReceipts.size()!=expectedDeoptCount)
                        throw new IllegalStateException("Incomplete protective receipts");
                    for(DeoptReceipt receipt:deoptReceipts)if(receipt.outcome!=DeoptOutcome.RETURNED_TRUE)
                        throw new IllegalStateException("Non-true deopt receipt");
                    if(!domain.activate(installationOwner))throw new IllegalStateException("Domain refused structural activation");
                    requireContinuing(deoptDeadline);
                    owner.requireOwnedInstaller(this,authority);
                    state=State.LOCKING_ACTIVE;return true;
                }
            }
        } catch(Throwable failure) {
            synchronized(control) {
                activationFailure=failure;stopRequested=true;
                if(state!=State.RELEASED && state!=State.RETAINED_FAILURE && state!=State.RESTART_REQUIRED)state=State.STOPPING;
            }
        }
        retire();return false; // Never acquire authority while holding only the installer monitor.
    }

    private void requireContinuing(long deadlineNanos)throws InterruptedException,TimeoutException {
        synchronized(control) {
            if(stopRequested)throw new IllegalStateException("Protection operation stopped");
            if(Thread.currentThread().isInterrupted())throw new InterruptedException("Protection operation interrupted");
            if(deadlineNanos!=0) {
                long remaining=deadlineNanos-System.nanoTime();
                if(remaining<=0 || remaining>TimeUnit.SECONDS.toNanos(5))throw new TimeoutException("Protection deadline invalid or expired");
            }
        }
    }
    private void recordDeopt(int ordinal,String descriptor,DeoptOutcome outcome) {
        synchronized(control){deoptReceipts.add(new DeoptReceipt(ordinal,descriptor,outcome));}
    }
    private String descriptorOf(Method method) {
        for(Map.Entry<String,Method> row:profile.methodsByDescriptor.entrySet())if(row.getValue().equals(method))return row.getKey();
        for(Map.Entry<String,Method> row:processGroup.methodsByDescriptor.entrySet())if(row.getValue().equals(method))return row.getKey();
        throw new IllegalStateException("Installed Method has no retained exact descriptor");
    }
    List<String> installedHookDescriptors() {synchronized(control){return Collections.unmodifiableList(new ArrayList<>(installedDescriptors));}}
    List<DeoptReceipt> deoptimizationReceipts() {synchronized(control){return Collections.unmodifiableList(new ArrayList<>(deoptReceipts));}}
    Throwable deoptimizationFailure() {return deoptimizationFailure;}
    Throwable activationFailure() {return activationFailure;}

    private XposedInterface.Hooker callback(RootLifecycleDomain.HookPoint point) {
        if(point==RootLifecycleDomain.HookPoint.KG_PROCESS_GROUP)
            return chain -> {
                try {
                    return domain.processGroupKill(new RootLifecycleDomain.ProcessGroupCall(
                        (Integer)chain.getArg(0),(Integer)chain.getArg(1)),chain::proceed);
                } catch(Throwable failure) {
                    // Other hooks can replace argument arrays without type/length validation.
                    // An OEM catch must not erase a failure before Domain/Frame dispatch.
                    throw domain.rememberCurrentRootFailure(failure);
                }
            };
        if(point!=RootLifecycleDomain.HookPoint.K_KILL) {
            RootLifecycleDomain.Door door=RootLifecycleDomain.Door.valueOf(point.name());
            return chain -> domain.lifecycle(door,chain::proceed);
        }
        return chain -> {
            try {
                return domain.kill(new RootLifecycleDomain.KillCall(chain.getThisObject(),
                    (String)chain.getArg(0),(Integer)chain.getArg(1),(Integer)chain.getArg(2),
                    (String)chain.getArg(3),(Integer)chain.getArg(4)),chain::proceed);
            } catch(Throwable failure) {
                throw domain.rememberCurrentRootFailure(failure);
            }
        };
    }

    /** Returns promptly even if installation or an original callback is in flight. */
    CompletionStage<Retirement> retire() {
        boolean start,retryDrain;
        CompletionStage<Retirement> view;
        synchronized(control) {
            stopRequested=true;start=!installRunning && !deoptRunning && !cleanupRunning && !attempt.isDone();
            retryDrain=!installRunning && !deoptRunning && cleanupRunning && !attempt.isDone();
            if(state!=State.RELEASED && state!=State.RETAINED_FAILURE && state!=State.RESTART_REQUIRED)state=State.STOPPING;
            view=attempt.thenApply(value->value); // Caller cancellation cannot cancel internal cleanup.
        }
        if(start)startCleanup();
        else if(retryDrain)domain.stopNewRoots(); // Retry a retained notifier-start failure, no new cleanup subscriber.
        return view;
    }

    /**
     * Explicit retry of cleanup requests that have not returned normally only.
     * An ambiguous unhook never becomes complete removal proof on retry; no
     * attempt can release an epoch after registration has started.
     */
    CompletionStage<Retirement> retryRetirement() {
        synchronized(control) {
            if((state!=State.RETAINED_FAILURE && state!=State.RESTART_REQUIRED) || cleanupRunning || !attempt.isDone())
                throw new IllegalStateException("No completed retained cleanup failure");
            attempt=new CompletableFuture<>();state=State.STOPPING;
        }
        return retire();
    }

    private void startCleanup() {
        CompletableFuture<Retirement> result;
        synchronized(control) {
            if(installRunning || deoptRunning || cleanupRunning || attempt.isDone())return;
            cleanupRunning=true;result=attempt;
        }
        // No blocking join/get and no unhook on the retiring caller. Even an
        // already completed drain is handed to a distinct cleanup thread.
        try {
            domain.stopNewRoots().whenComplete((token,failure)-> {
                try {
                    Thread worker=new Thread(()->cleanup(token,failure,result),"lsa-hooks-retire");
                    worker.setDaemon(true);worker.start();
                } catch(Throwable dispatchFailure) {
                    finish(result,new Retirement(false,unknownRegistration,registrationStarted,List.of("cleanup dispatch failed")));
                }
            });
        } catch(Throwable drainFailure) {
            finish(result,new Retirement(false,unknownRegistration,registrationStarted,List.of("drain setup failed")));
        }
    }

    private void cleanup(RootLifecycleDomain.DrainToken token,Throwable drainFailure,
                         CompletableFuture<Retirement> result) {
        ArrayList<String> failures=new ArrayList<>();
        if(drainFailure!=null || token==null)failures.add("no authentic completed drain");
        else {
            // Reverse order is cleanup bookkeeping, not an assertion about a global
            // ART quiescence point. Retired old snapshots remain transparent.
            for(int index=receipts.size()-1;index>=0;index--) {
                Receipt receipt=receipts.get(index);
                // A foreign/misreported handle could remove someone else's hook.
                // Retain it for diagnosis; do not turn missing ownership into cleanup authority.
                if(!receipt.trusted)continue;
                if(!receipt.requestReturned) {
                    try {
                        receipt.handle.unhook();
                        receipt.requestReturned=true;
                    } catch(Throwable retained) {
                        // Actual LSPosed removes from a mutable list before publishing
                        // its new snapshot. Publication failure can leave an old live
                        // snapshot; retry may see list absence and return without
                        // republishing. This ambiguity cannot be cleared by this API.
                        receipt.removalUncertain=true;
                    }
                }
                if(receipt.removalUncertain) {
                    failures.add("earlier unhook outcome remains uncertain: "+receipt.point);
                }
            }
            if(unknownRegistration)failures.add("unknown registration has no trustworthy complete handle set");
            // Retired snapshots stay transparent. Normal return is only a cleanup
            // request receipt, never proof of snapshot removal or ART quiescence.
            // Preserve the process anchor for every possibly started registration.
            if(!registrationStarted && failures.isEmpty()) {
                try { domain.acknowledgeUnhook(installationOwner,token); }
                catch(Throwable retained) { failures.add("domain anchor retained"); }
            }
        }
        finish(result,new Retirement(!registrationStarted&&failures.isEmpty(),unknownRegistration,registrationStarted,failures));
    }

    private void finish(CompletableFuture<Retirement> result,Retirement value) {
        synchronized(control) {
            if(result!=attempt)return;
            cleanupRunning=false;state=value.released?State.RELEASED:
                value.restartRequired?State.RESTART_REQUIRED:State.RETAINED_FAILURE;
        }
        result.complete(value); // No installer monitor held; user continuation cannot retain it.
    }
    boolean ownsHookHandle(Object candidate) {
        synchronized(control){for(Receipt receipt:receipts)if(receipt.handle==candidate)return true;return false;}
    }
    State state() { return state; }
    Throwable installationFailure() { return installationFailure; }
    List<RootCriticalProfile.Unresolved> unresolved() { return profile.unresolved; }
}
