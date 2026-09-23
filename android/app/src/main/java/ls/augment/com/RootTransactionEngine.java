package ls.augment.com;

import android.os.Looper;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Finite synchronous coordinator for the bound native Root transaction.
 * Runtime admission binds the installed generation; stock asynchronous notifications
 * remain native and are not part of the CHANGED completion witness.
 */
final class RootTransactionEngine implements HideRootServer.Engine {
    private enum Phase { VALIDATING, STOP, HIDE, VERIFYING, RESTORE, RESTORE_VERIFYING, SHOW, SHOW_VERIFYING, CLOSED }
    private enum NativeScope { NONE, STOP, HIDE, RESTORE, SHOW }

    /**
     * Runtime proof issuer; the real entry uses the private RootRuntimeAdmission generation. A ticket must bind
     * this exact engine's installed callbacks, ROM profile, quiescence and epoch.
     * Capture/check are read-only, nonblocking and must not acquire framework locks
     * or do IPC. Revoke admission before teardown; never remove hooks while an
     * admitted native lease is still running. Host tickets are explicitly models.
     */
    interface Admission { AdmissionTicket capture(RootTransactionEngine owner) throws Throwable; }
    interface AdmissionTicket { void requireCurrent(RootTransactionEngine owner) throws Throwable; }

    private final RootLifecycleDomain domain;
    private final Object shell;
    private final RootNativeBridge.Bound nativeAccess;
    private final RootCallerCompatibility compatibility;
    private final Admission admission;

    RootTransactionEngine(RootLifecycleDomain domain,Object authenticatedShell, RootNativeBridge.Bound nativeAccess,
                          RootCallerCompatibility compatibility, Admission admission) {
        this.domain=Objects.requireNonNull(domain);
        shell=Objects.requireNonNull(authenticatedShell);
        this.nativeAccess=Objects.requireNonNull(nativeAccess);
        this.compatibility=Objects.requireNonNull(compatibility);
        this.admission=Objects.requireNonNull(admission);
    }

    boolean isNativeLane(){return Looper.myLooper()==nativeAccess.handler.getLooper();}
    void requireStartupOwner(RootStartupBinding startup){nativeAccess.requireStartupOwner(startup);}

    /** No target query, lifecycle lock, scheduling or mutation occurs during reservation. */
    @Override public HideRootServer.Permit reserve(HideRootProtocol.Request request) throws Throwable {
        if (request == null || !request.isPrepare() || request.isRestore()) return null;
        // Merely necessary structural state; external admission must still prove
        // effective ordinary locking/early window and the separate Root contract.
        if (domain.state()!=RootLifecycleDomain.State.LOCKING_ACTIVE) return null;
        RootCallerCompatibility.Ticket identity=compatibility.currentTicket();
        if (identity == null) return null;
        AdmissionTicket runtime=admission.capture(this);
        if (runtime == null) return null;
        Reservation reservation=new Reservation(request,identity,runtime,null);
        reservation.requireCurrent();
        return reservation;
    }

    /** Always queues to the bound AMS Handler; never waits or transfers Binder identity. */
    @Override public CompletionStage<HideRootProtocol.Outcome> execute(
            HideRootProtocol.Request request, HideRootServer.Permit rawPermit) {
        CompletableFuture<HideRootProtocol.Outcome> result=new CompletableFuture<>();
        if (!(rawPermit instanceof Reservation)) return rejected(result);
        Reservation permit=(Reservation)rawPermit;
        if (permit.owner != this || request == null || !request.isExecute() || request.isRestore()
                || !permit.sameTarget(request) || !permit.claimed.compareAndSet(false,true))
            return rejected(result);
        try { permit.requireCurrent(); }
        catch (Throwable invalid) { return rejected(result); }
        try {
            if (!nativeAccess.handler.post(() -> result.complete(runOnLane(request,permit))))
                return rejected(result);
        } catch (Throwable dispatchUnknown) {
            // An exception is not proof that an externally supplied queue accepted nothing.
            // This UNKNOWN may precede a retained queued/running lease. Only the
            // domain's drain token proves protected regions have exited; this
            // result is never a teardown/completion witness for that branch.
            result.complete(HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH);
        }
        return result;
    }

    private static CompletionStage<HideRootProtocol.Outcome> rejected(
            CompletableFuture<HideRootProtocol.Outcome> result) {
        result.complete(HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE);
        return result;
    }

    /** Only the shared early domain routes its current Root guard here. */
    private Object nativeKill(Frame frame,RootLifecycleDomain.KillCall call) throws Throwable {
        try {
            frame.requireCurrent();
            if (!frame.sealed || frame.phase != Phase.HIDE || frame.nativeScope!=NativeScope.HIDE || frame.inSyncKill || frame.killAttempts != 0)
                throw new IllegalStateException("Unexpected native kill phase/reentry");
            frame.inSyncKill=true;
            frame.killAttempts++;
            nativeAccess.syncKill(frame,call.receiver,call.packageName,call.appId,call.userId,call.reason,call.reasonCode);
            frame.killCompleted=true;
            return null;
        } catch (Throwable failure) {
            frame.fail(failure);
            throw frame.failure;
        } finally { frame.inSyncKill=false; }
    }

    /** Domain-only Root callback; a live Root lease by itself is insufficient. */
    private Object nativeProcessGroupKill(Frame frame,RootLifecycleDomain.ProcessGroupCall call) throws Throwable {
        boolean entered=false;
        try {
            frame.requireNativeScope();
            if(frame.inProcessGroup || frame.groupBridgeClaimed)throw new IllegalStateException("Reentrant native process group call");
            frame.inProcessGroup=true;entered=true;
            frame.processGroupAttempts++;
            nativeAccess.killProcessGroupInRoot(frame,call.uid,call.pid);
            frame.requireCurrent();
            frame.processGroupCompleted++;
            return null;
        } catch(Throwable failure) {
            frame.fail(failure);throw frame.failure;
        } finally { if(entered){frame.inProcessGroup=false;frame.groupBridgeClaimed=false;} }
    }

    private HideRootProtocol.Outcome runOnLane(HideRootProtocol.Request request, Reservation permit) {
        if (Looper.myLooper() != nativeAccess.handler.getLooper())
            return HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE;
        Frame frame=new Frame(request,permit);
        frame.lease=domain.tryLease(this,frame);
        if (frame.lease==null) return HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE;
        try {
            nativeAccess.requireLaneAndUnlocked(frame);
            RootNativeBridge.UserEvidence user=nativeAccess.readUser(frame,request.userId);
            if (user == null || !user.active) throw new IllegalStateException("User instance not active");
            frame.instance=user.instance;
            RootCallerCompatibility.TargetEvidence identity=compatibility.verify(
                    permit.identity,shell,request.userId,request.packageName);
            if (identity.userId != request.userId || !request.packageName.equals(identity.packageName)
                    || identity.appId < 10000)
                throw new IllegalStateException("Wrong compatibility target");
            frame.appId=identity.appId;
            RootNativeBridge.PackageEvidence before=nativeAccess.readPackage(frame,request.packageName,request.userId);
            frame.requirePackage(before);
            frame.sealed=true; // Exact UserInfo reference and appId are never replaced afterwards.
            before=validateTarget(frame);
            if(frame.manualShowing())return showOnLane(frame,before);
            // Existing production skips already hidden targets. NOOP asserts hidden only,
            // not stopped=true or ownership; it never starts a native operation.
            if (before.hidden) return HideRootProtocol.Outcome.NOOP;

            // Preparation reserves only this operation's observation/resources.
            // It must exist before STOP; ownership still requires the later
            // actual false-to-true commit and complete outer confirmation.
            nativeAccess.prepareHideOwnership(frame);
            nativeAccess.requireHidePrepared(frame);

            frame.phase=Phase.STOP;
            frame.nativeAttempted=true; // Set before invoking any possibly partial native operation.
            frame.openNativeScope(NativeScope.STOP);
            try { nativeAccess.forceStop(frame,request.packageName,request.userId); }
            finally { frame.closeNativeScope(NativeScope.STOP); }
            frame.requireCurrent(); // Native code may have caught a boundary failure.
            RootNativeBridge.PackageEvidence afterStop=validateTarget(frame);
            if (afterStop.hidden || !afterStop.stopped)
                throw new IllegalStateException("Stop outcome changed before owned hide");

            frame.phase=Phase.HIDE;
            boolean accepted;
            frame.openNativeScope(NativeScope.HIDE);
            try { accepted=nativeAccess.hide(frame,request.packageName,request.userId); }
            finally { frame.closeNativeScope(NativeScope.HIDE); }
            frame.phase=Phase.VERIFYING;
            frame.requireCurrent();
            if (!accepted || frame.killAttempts != 1 || !frame.killCompleted)
                throw new IllegalStateException("Native hide did not complete its exact synchronous kill");
            RootNativeBridge.PackageEvidence after=validateTarget(frame);
            if (!after.hidden || !after.stopped)
                throw new IllegalStateException("Native hidden/stopped postcondition not observed");
            // A primitive token is only pending until the whole native IPM call,
            // its synchronous kill and these final user/package checks complete.
            if (frame.pendingHide == null || !nativeAccess.completeHideOwnership(frame,frame.pendingHide))
                throw new IllegalStateException("Native hide ownership confirmation failed");
            return HideRootProtocol.Outcome.CHANGED;
        } catch (Throwable failure) {
            frame.fail(failure);
            return frame.nativeAttempted ? HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH
                    : HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE;
        } finally {
            try { nativeAccess.discardHideOwnership(frame,frame.pendingHide); }
            catch (Throwable cleanupFailure) { frame.fail(cleanupFailure); }
            try { nativeAccess.discardRestoreOwnership(frame,frame.pendingRestore); }
            catch (Throwable cleanupFailure) { frame.fail(cleanupFailure); }
            try { nativeAccess.releaseHidePreparation(frame,frame.hidePreparation); }
            catch (Throwable cleanupFailure) { frame.fail(cleanupFailure); }
            frame.nativeScope=NativeScope.NONE;
            frame.inProcessGroup=false;
            frame.groupBridgeClaimed=false;
            frame.phase=Phase.CLOSED;
            // Normal queued completion happens after this close. An earlier
            // post exception may already have reported UNKNOWN; see execute.
            frame.lease.close();
        }
    }

    /** A fresh user instruction controls the current target; old hidden ownership is irrelevant. */
    private HideRootProtocol.Outcome showOnLane(Frame frame,RootNativeBridge.PackageEvidence before) throws Throwable {
        frame.requireManualShowValidationScope(nativeAccess);
        if(!before.hidden)return HideRootProtocol.Outcome.NOOP;
        frame.phase=Phase.SHOW;
        frame.openNativeScope(NativeScope.SHOW);
        boolean accepted;
        try {
            frame.nativeAttempted=true;
            accepted=nativeAccess.show(frame,frame.packageName(),frame.userId());
        } finally {frame.closeNativeScope(NativeScope.SHOW);}
        frame.phase=Phase.SHOW_VERIFYING;
        frame.requireManualShowCompletionScope(nativeAccess);
        RootNativeBridge.PackageEvidence after=validateTarget(frame);
        frame.requireManualShowCompletionScope(nativeAccess);
        if(!accepted||after.hidden||after.stopped!=before.stopped)
            throw new IllegalStateException("Manual show did not confirm the current visible target");
        return HideRootProtocol.Outcome.CHANGED;
    }

    /** Retained signature for legacy receipts; reserve/execute no longer admit this operation. */
    private HideRootProtocol.Outcome restoreOnLane(Frame frame,RootNativeBridge.PackageEvidence before) throws Throwable {
        frame.requireRestoreValidationScope(nativeAccess);
        if(!before.hidden||!nativeAccess.validateRestoreOwnership(frame,frame.restoreSource()))
            throw new IllegalStateException("The source hidden modification is no longer owned");
        frame.phase=Phase.RESTORE;
        frame.openNativeScope(NativeScope.RESTORE);
        boolean accepted;
        try {
            frame.nativeAttempted=true;
            accepted=nativeAccess.restore(frame,frame.packageName(),frame.userId());
        } finally {frame.closeNativeScope(NativeScope.RESTORE);}
        frame.phase=Phase.RESTORE_VERIFYING;
        frame.requireRestoreCompletionScope(nativeAccess);
        if(!accepted||frame.pendingRestore==null)
            throw new IllegalStateException("Native restore did not complete its owned commit");
        RootNativeBridge.PackageEvidence after=validateTarget(frame);
        if(after.hidden||!nativeAccess.completeRestoreOwnership(frame,frame.pendingRestore))
            throw new IllegalStateException("Native restore completion was not confirmed");
        return HideRootProtocol.Outcome.RESTORED;
    }

    /** Checks are observations inside G, not a replacement for the external lifecycle proof. */
    private RootNativeBridge.PackageEvidence validateTarget(Frame frame) throws Throwable {
        nativeAccess.requireLaneAndUnlocked(frame);
        RootNativeBridge.UserEvidence user=nativeAccess.readUser(frame,frame.userId());
        if (user == null || !user.active || user.instance != frame.instance)
            throw new IllegalStateException("User instance changed");
        RootCallerCompatibility.TargetEvidence identity=compatibility.verify(frame.reservation.identity,
                shell,frame.userId(),frame.packageName());
        if (identity.userId != frame.userId() || identity.appId != frame.appId()
                || !frame.packageName().equals(identity.packageName))
            throw new IllegalStateException("Package identity changed");
        RootNativeBridge.PackageEvidence state=nativeAccess.readPackage(frame,frame.packageName(),frame.userId());
        frame.requirePackage(state);
        frame.requireCurrent();
        return state;
    }

    private final class Reservation implements HideRootServer.Permit {
        final RootTransactionEngine owner=RootTransactionEngine.this;
        final HideRootProtocol.Request target;
        final RootCallerCompatibility.Ticket identity;
        final AdmissionTicket runtime;
        final RootHiddenRequestIngress.ConfirmedHide source;
        final AtomicBoolean claimed=new AtomicBoolean();
        Reservation(HideRootProtocol.Request target,RootCallerCompatibility.Ticket identity,AdmissionTicket runtime,
                RootHiddenRequestIngress.ConfirmedHide source) {
            this.target=target; this.identity=identity; this.runtime=runtime;this.source=source;
        }
        boolean sameTarget(HideRootProtocol.Request request) {
            return target.userId==request.userId && target.serial==request.serial
                    && target.packageName.equals(request.packageName)&&target.isRestore()==request.isRestore()
                    && target.isManualShow()==request.isManualShow()
                    && target.isRecovery()==request.isRecovery()
                    && (!target.isRecovery() || Objects.equals(target.challenge,request.challenge))
                    && Objects.equals(target.sourceHideNonce,request.sourceHideNonce);
        }
        @Override public Object recoverySource() { return target.isRestore() ? source : null; }
        @Override public void requireCurrent() throws Throwable {
            runtime.requireCurrent(owner);
            compatibility.requireCurrent(identity);
        }
    }

    // Package visibility only to name this exact final permitted Lease implementation.
    // Its private constructor remains callable only by the enclosing Engine.
    final class Frame implements RootNativeBridge.Lease,RootLifecycleDomain.RootGuard {
        final HideRootProtocol.Request request;
        final Reservation reservation;
        RootLifecycleDomain.Lease lease;
        Object instance;
        int appId=-1,killAttempts;
        boolean sealed,nativeAttempted,inSyncKill,killCompleted;
        boolean inProcessGroup,groupBridgeClaimed;
        private boolean hiddenRequestClaimed;
        private boolean stopRequestClaimed;
        private boolean manualShowClaimed;
        private RootHiddenRequestIngress.HidePreparation hidePreparation;
        private RootHiddenRequestIngress.PendingHide pendingHide;
        private RootHiddenRequestIngress.PendingRestore pendingRestore;
        int processGroupAttempts,processGroupCompleted;
        NativeScope nativeScope=NativeScope.NONE;
        Phase phase=Phase.VALIDATING;
        volatile Throwable failure;
        private Frame(HideRootProtocol.Request request,Reservation reservation) { this.request=request; this.reservation=reservation; }
        synchronized void fail(Throwable failure) { if (this.failure == null) this.failure=failure; }
        IllegalStateException reject(String reason) { IllegalStateException error=new IllegalStateException(reason);fail(error);return error; }
        @Override public void onLifecycleRejected(RootLifecycleDomain.Door door,Throwable rejection) {
            fail(rejection);
        }
        @Override public Object onKill(RootLifecycleDomain.KillCall call) throws Throwable {
            return nativeKill(this,call);
        }
        @Override public Object onProcessGroupKill(RootLifecycleDomain.ProcessGroupCall call) throws Throwable {
            return nativeProcessGroupKill(this,Objects.requireNonNull(call));
        }
        void openNativeScope(NativeScope expected) {
            requireCurrent();
            if(!sealed || nativeScope!=NativeScope.NONE || inProcessGroup || (!restoring()&&!manualShowing()&&hidePreparation==null) ||
                    (expected==NativeScope.STOP?phase!=Phase.STOP:
                    expected==NativeScope.RESTORE?!restoring()||phase!=Phase.RESTORE:
                    expected==NativeScope.SHOW?!manualShowing()||phase!=Phase.SHOW:
                    expected!=NativeScope.HIDE || phase!=Phase.HIDE))
                throw reject("Unexpected native sub-scope entry");
            nativeScope=expected;
        }
        void closeNativeScope(NativeScope expected) {
            if(nativeScope!=expected || inProcessGroup)fail(new IllegalStateException("Native sub-scope accounting changed"));
            nativeScope=NativeScope.NONE;
        }
        void requireNativeScope() {
            requireCurrent();
            if(!sealed || restoring() || manualShowing() || nativeScope==NativeScope.NONE ||
                    (nativeScope==NativeScope.STOP?phase!=Phase.STOP:phase!=Phase.HIDE))
                throw reject("Process group call outside exact native sub-scope");
        }
        @Override public void requireBridgeOwner(RootNativeBridge.Bound expected) {
            requireCurrent();
            if(expected!=nativeAccess)throw reject("Foreign native bridge lease");
        }
        void requireHiddenRequestScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class || !sealed || manualShowing() || (restoring()
                    ? phase!=Phase.RESTORE||nativeScope!=NativeScope.RESTORE||reservation.source==null
                    : phase!=Phase.HIDE||nativeScope!=NativeScope.HIDE||hidePreparation==null)
                    || inSyncKill || inProcessGroup)
                throw reject("Hidden request outside its exact private native operation");
        }
        void claimHiddenRequestScope(RootNativeBridge.Bound expected) {
            requireHiddenRequestScope(expected);
            if(hiddenRequestClaimed)throw reject("Private hidden request already claimed by this Frame");
            hiddenRequestClaimed=true;
        }
        void requireHidePreparationScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class||request.verb!=HideRootProtocol.Verb.HIDE||!sealed||phase!=Phase.VALIDATING
                    ||nativeScope!=NativeScope.NONE||nativeAttempted||hiddenRequestClaimed
                    ||hidePreparation!=null||inSyncKill||inProcessGroup||groupBridgeClaimed)
                throw reject("Hide preparation outside its new exact lease");
        }
        void retainHidePreparation(RootNativeBridge.Bound expected,RootHiddenRequestIngress.HidePreparation preparation) {
            requireHidePreparationScope(expected);
            if(preparation==null)throw reject("Missing hide preparation");
            hidePreparation=preparation;
        }
        RootHiddenRequestIngress.HidePreparation hidePreparation(){return hidePreparation;}
        void requireStopRequestScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class||request.verb!=HideRootProtocol.Verb.HIDE||!sealed||hidePreparation==null||phase!=Phase.STOP
                    ||nativeScope!=NativeScope.STOP||!nativeAttempted||hiddenRequestClaimed
                    ||inSyncKill||inProcessGroup||groupBridgeClaimed)
                throw reject("Stop outside its exact prepared native scope");
        }
        void claimStopRequestScope(RootNativeBridge.Bound expected) {
            requireStopRequestScope(expected);
            if(stopRequestClaimed)throw reject("Stop already dispatched by this prepared frame");
            stopRequestClaimed=true;
        }
        /** Structural identity only; the ingress rechecks its live unconsumed resources. */
        void requireHidePreparedScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            boolean allowed=phase==Phase.VALIDATING&&nativeScope==NativeScope.NONE&&!nativeAttempted&&!hiddenRequestClaimed
                    ||phase==Phase.STOP&&(nativeScope==NativeScope.NONE||nativeScope==NativeScope.STOP)&&!hiddenRequestClaimed
                    ||phase==Phase.HIDE&&nativeScope==NativeScope.HIDE;
            if(getClass()!=Frame.class||request.verb!=HideRootProtocol.Verb.HIDE||!sealed||hidePreparation==null||!allowed
                    ||inSyncKill||inProcessGroup||groupBridgeClaimed)
                throw reject("Hide preparation outside its exact pre-commit scope");
        }
        void retainPendingHide(RootNativeBridge.Bound expected,RootHiddenRequestIngress.PendingHide pending) {
            requireHiddenRequestScope(expected);
            if(restoring() || !hiddenRequestClaimed || pending==null || pendingHide!=null)
                throw reject("Pending hidden commit is absent or already retained");
            pendingHide=pending;
        }
        boolean restoring(){return request.isRestore() && request.isExecute();}
        boolean manualShowing(){return request.verb==HideRootProtocol.Verb.SHOW;}
        boolean hiddenValue(){return !restoring()&&!manualShowing();}
        void requireManualShowValidationScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class||!manualShowing()||!sealed||phase!=Phase.VALIDATING
                    ||nativeScope!=NativeScope.NONE||nativeAttempted||manualShowClaimed||hiddenRequestClaimed
                    ||hidePreparation!=null||reservation.source!=null||inSyncKill||inProcessGroup)
                throw reject("Manual show validation outside its new exact lease");
        }
        void requireManualShowScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class||!manualShowing()||!sealed||phase!=Phase.SHOW||nativeScope!=NativeScope.SHOW
                    ||!nativeAttempted||hiddenRequestClaimed||stopRequestClaimed||hidePreparation!=null
                    ||reservation.source!=null||inSyncKill||inProcessGroup||groupBridgeClaimed)
                throw reject("Manual show outside its exact native scope");
        }
        void claimManualShowScope(RootNativeBridge.Bound expected) {
            requireManualShowScope(expected);
            if(manualShowClaimed)throw reject("Manual show already dispatched by this Frame");
            manualShowClaimed=true;
        }
        void requireManualShowCompletionScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class||!manualShowing()||!sealed||!manualShowClaimed||!nativeAttempted
                    ||phase!=Phase.SHOW_VERIFYING||nativeScope!=NativeScope.NONE||hiddenRequestClaimed
                    ||stopRequestClaimed||hidePreparation!=null||reservation.source!=null||inSyncKill||inProcessGroup
                    ||groupBridgeClaimed||killAttempts!=0||killCompleted||processGroupAttempts!=0||processGroupCompleted!=0)
                throw reject("Manual show confirmation outside its exact no-kill completion scope");
        }
        RootHiddenRequestIngress.ConfirmedHide restoreSource(){return reservation.source;}
        void retainPendingRestore(RootNativeBridge.Bound expected,RootHiddenRequestIngress.PendingRestore pending) {
            requireHiddenRequestScope(expected);
            if(!restoring()||!hiddenRequestClaimed||pending==null||pendingRestore!=null)
                throw reject("Pending restore is absent or already retained");
            pendingRestore=pending;
        }
        void requireRestoreValidationScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class||!restoring()||!sealed||reservation.source==null||phase!=Phase.VALIDATING
                    ||nativeScope!=NativeScope.NONE||hiddenRequestClaimed||nativeAttempted||inSyncKill||inProcessGroup)
                throw reject("Restore validation outside its new exact lease");
        }
        void requireRestoreCompletionScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class||!restoring()||!sealed||!hiddenRequestClaimed||reservation.source==null
                    ||phase!=Phase.RESTORE_VERIFYING||nativeScope!=NativeScope.NONE||inSyncKill||inProcessGroup
                    ||groupBridgeClaimed||killAttempts!=0||killCompleted||processGroupAttempts!=0||processGroupCompleted!=0)
                throw reject("Restore confirmation outside exact no-kill completion scope");
        }
        void requireHideCompletionScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);
            if(getClass()!=Frame.class || request.verb!=HideRootProtocol.Verb.HIDE || !sealed || !hiddenRequestClaimed || hidePreparation==null || phase!=Phase.VERIFYING
                    || nativeScope!=NativeScope.NONE || inSyncKill || inProcessGroup || groupBridgeClaimed
                    || killAttempts!=1 || !killCompleted)
                throw reject("Hidden ownership confirmation outside exact VERIFYING scope");
        }
        @Override public void requireProcessGroupScope(RootNativeBridge.Bound expected) {
            requireBridgeOwner(expected);requireNativeScope();
            if(!inProcessGroup)throw reject("Process group bridge outside Domain callback");
        }
        @Override public void claimProcessGroupBridge(RootNativeBridge.Bound expected) {
            requireProcessGroupScope(expected);
            if(groupBridgeClaimed)throw reject("Native process group bridge already used in this callback");
            groupBridgeClaimed=true;
        }
        @Override public void requireCurrent() {
            if (lease==null || phase==Phase.CLOSED)
                throw new IllegalStateException("Inactive Root lease");
            lease.requireCurrent(RootTransactionEngine.this);
            if (failure != null) throw new IllegalStateException("Sticky Root boundary failure",failure);
            try { reservation.requireCurrent(); }
            catch (Throwable invalid) { fail(invalid); throw new IllegalStateException("Revoked Root lease",invalid); }
        }
        void requirePackage(RootNativeBridge.PackageEvidence value) {
            if (value==null || value.system || !value.installed || value.appId != appId || appId<10000)
                throw new IllegalStateException("Package is not the current ordinary installed application");
        }
        @Override public int userId() { return request.userId; }
        @Override public long serial() { return request.serial; }
        @Override public String packageName() { return request.packageName; }
        @Override public int appId() { return appId; }
    }
}
