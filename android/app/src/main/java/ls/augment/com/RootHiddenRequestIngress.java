package ls.augment.com;

import io.github.libxposed.api.XposedInterface;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Early, transparent request bookkeeping for the fixed hidden-setting entry.
 * True receipts prove only the listed API calls, never complete ART coverage or
 * restoration authority. Retired callbacks remain transparent until reboot.
 */
final class RootHiddenRequestIngress {
    @FunctionalInterface interface NativeCall { Object call() throws Throwable; }

    private enum Registration { NOT_STARTED, STARTED, THREW, NULL_HANDLE, UNTRUSTED_HANDLE, TRUSTED_HANDLE }
    private enum HookKind { HIDDEN, PERMISSION, COPY, LOOKUP }
    private enum DeoptOutcome { RETURNED_TRUE, RETURNED_FALSE, THREW }
    private static final class DeoptReceipt {
        final Method method;
        final DeoptOutcome outcome;
        final Throwable failure;
        DeoptReceipt(Method method, DeoptOutcome outcome, Throwable failure) {
            this.method=method;this.outcome=outcome;this.failure=failure;
        }
    }
    private static final class Binding {
        final Object ipm,pms,monitor;
        final HiddenOwnershipCore core;
        final RootNativeBridge.Bound bridge;
        volatile boolean ready;
        Binding(Object ipm,Object pms,Object monitor,HiddenOwnershipCore core,RootNativeBridge.Bound bridge) {
            this.ipm=ipm;this.pms=pms;this.monitor=monitor;this.core=core;this.bridge=bridge;
        }
        boolean same(Object ipm,Object pms,Object monitor,HiddenOwnershipCore core,RootNativeBridge.Bound bridge) {
            return this.ipm==ipm && this.pms==pms && this.monitor==monitor && this.core==core && this.bridge==bridge;
        }
    }
    private static final class Ticket {
        final RootTransactionEngine.Frame frame;
        final Binding binding;
        final HidePreparation preparation;
        boolean consumed,entryCompleted,outerCompleted,commitClaimed;
        PendingHide pending;
        PendingRestore pendingRestore;
        Ticket(RootTransactionEngine.Frame frame,Binding binding){this.frame=frame;this.binding=binding;preparation=frame.restoring()?null:frame.hidePreparation();}
    }
    /** Reserved resources for one actual Frame; neither a hidden claim nor restore authority. */
    static final class HidePreparation {
        private final RootHiddenRequestIngress ingress;
        private final RootTransactionEngine.Frame frame;
        private final Binding binding;
        private final RootOwnershipObservation.Bound observer;
        private final HiddenOwnershipCore.Target target;
        private final String nonce;
        private final Object user;
        private final int appId;
        private HiddenOwnershipCore.HidePreparation resources;
        private boolean commitClaimed,confirmed,closed;
        private HidePreparation(RootHiddenRequestIngress ingress,RootTransactionEngine.Frame frame,
                Binding binding,RootOwnershipObservation.Bound observer,HiddenOwnershipCore.Target target) {
            this.ingress=ingress;this.frame=frame;this.binding=binding;this.observer=observer;this.target=target;
            nonce=frame.request.nonce;user=frame.instance;appId=frame.appId();
        }
    }
    /** Constructors are private: a thread-local's existence never grants a permit. */
    static final class CommitPermit {
        final RootTransactionEngine.Frame frame;
        final Object pms,monitor,consumer;
        final boolean hidden;
        private HiddenOwnershipCore.RestoreAttempt restoreAttempt;
        private final RootOwnedMutationAdapter adapter;
        private final Ticket ticket;
        private final Scope scope;
        private CommitPermit(RootOwnedMutationAdapter adapter,Ticket ticket,Scope scope,Object consumer) {
            this.adapter=adapter;this.ticket=ticket;this.scope=scope;this.consumer=consumer;
            frame=ticket.frame;pms=ticket.binding.pms;monitor=ticket.binding.monitor;hidden=frame.hiddenValue();
        }
    }
    /** A private rejection is never permission to retry as an ordinary native commit. */
    static final class PrivateCommitRejection extends IllegalStateException {
        private PrivateCommitRejection(Throwable failure) {super("Selected private commit rejected",failure);}
    }
    static final class PendingHide {
        private final RootHiddenRequestIngress ingress;
        private final RootOwnedMutationAdapter adapter;
        private final Ticket ticket;
        private final HiddenOwnershipCore.Target target;
        private final HiddenOwnershipCore.HideReceipt receipt;
        private boolean confirmed,discarded;
        private PendingHide(RootHiddenRequestIngress ingress,RootOwnedMutationAdapter adapter,Ticket ticket,
                HiddenOwnershipCore.Target target,HiddenOwnershipCore.HideReceipt receipt) {
            this.ingress=ingress;this.adapter=adapter;this.ticket=ticket;this.target=target;this.receipt=receipt;
        }
    }
    /** An opaque lookup result; never retains the completed HIDE Frame or Ticket. */
    static final class ConfirmedHide {
        private final RootHiddenRequestIngress ingress;
        private final Binding binding;
        private final RootOwnershipObservation.Bound observer;
        private final HiddenOwnershipCore.Target target;
        private final String sourceNonce,token;
        private final Object user;
        private final int appId;
        private ConfirmedHide(RootHiddenRequestIngress ingress,PendingHide pending,
                RootOwnershipObservation.Bound observer) {
            this.ingress=ingress;binding=pending.ticket.binding;this.observer=observer;
            target=pending.target;sourceNonce=pending.ticket.frame.request.nonce;token=pending.receipt.token;
            user=pending.ticket.frame.instance;appId=pending.ticket.frame.appId();
        }
    }
    static final class PendingRestore {
        private final RootHiddenRequestIngress ingress;
        private final RootOwnedMutationAdapter adapter;
        private final Ticket ticket;
        private final ConfirmedHide source;
        private final HiddenOwnershipCore.RestoreAttempt attempt;
        private boolean confirmed,discarded;
        private PendingRestore(RootHiddenRequestIngress ingress,RootOwnedMutationAdapter adapter,
                CommitPermit permit,HiddenOwnershipCore.RestoreAttempt attempt) {
            this.ingress=ingress;this.adapter=adapter;ticket=permit.ticket;
            source=permit.frame.restoreSource();this.attempt=attempt;
        }
    }
    private static final class Scope {
        final Scope previous;
        final Object receiver;
        final int user;
        final String name;
        final boolean own;
        final Ticket ticket;
        boolean permissionSeen,permissionInFlight,permissionReturned,permissionThrew;
        RootHiddenRequestLedger.Request request;
        Scope(Scope previous,Object receiver,int user,String name,Ticket ticket) {
            this.previous=previous;this.receiver=receiver;this.user=user;this.name=name;this.ticket=ticket;this.own=ticket!=null;
        }
    }

    private static final String PMS="com.android.server.pm.PackageManagerService";
    private static final String PACKAGE_IMPL="com.android.internal.pm.parsing.pkg.PackageImpl";
    private static final int MAX_ORIGINAL_NAMES=255;
    private static final int MAX_COPY_NAMES=512;
    private static final String SETTINGS="com.android.server.pm.Settings";
    private static final String PACKAGE_SETTING="com.android.server.pm.PackageSetting";
    private static final long SYSTEM_PACKAGE=1L<<53;
    private static final List<?> EMPTY_LIST=Collections.emptyList();
    private static final class CopyScope {
        final CopyScope previous;
        final Object pms,monitor,settings;
        final String[] names=new String[MAX_COPY_NAMES];
        final RootHiddenRequestLedger.Request[] requests=new RootHiddenRequestLedger.Request[MAX_COPY_NAMES];
        int count;
        boolean closed;
        CopyScope(CopyScope previous,Object pms,Object monitor,Object settings) {
            this.previous=previous;this.pms=pms;this.monitor=monitor;this.settings=settings;
        }
    }

    private final RootEarlyModule module;
    private final RootHiddenRequestProfile.Resolved profile;
    private final Field ipmOwner,helperOwner,pmsLock,pmsWriteLock,packageName,originalPackages,packageBooleans;
    private final Field pmsSettings,settingsLock,settingName;
    private final Class<?> pmsClass,packageClass,userHandleClass,settingsClass,settingClass;
    private final RootEarlyCoordinator owner;
    private final RootEarlyModule.WindowAuthority authority;
    private final RootHiddenRequestLedger ledger=new RootHiddenRequestLedger(8192);
    private final AtomicReference<Throwable> failure=new AtomicReference<>();
    private final AtomicReference<Throwable> revokeFailure=new AtomicReference<>();
    private final AtomicReference<Binding> binding=new AtomicReference<>();
    private final ThreadLocal<Ticket> privateTicket=new ThreadLocal<>();
    private final ThreadLocal<Scope> invocation=new ThreadLocal<>();
    private final ThreadLocal<CopyScope> copyInvocation=new ThreadLocal<>();
    // Writes occur only under the bound PMS monitor. Reservation reads do not
    // take a framework lock; an entry is merely a candidate until the new lease.
    private final ConcurrentHashMap<String,ConfirmedHide> confirmedHides=new ConcurrentHashMap<>();
    // Only the exact bound PMS monitor protects reservations. Command-side source lookup never reads this map.
    private final Map<String,HidePreparation> preparingHides=new HashMap<>();
    private final AtomicLong privateAccepted=new AtomicLong();
    private final AtomicLong deniedOrdinary=new AtomicLong(),deniedPrivate=new AtomicLong();
    private volatile boolean attempted,installed;
    private volatile long installationDeadline;
    private volatile Registration registration=Registration.NOT_STARTED;
    private volatile Registration permissionRegistration=Registration.NOT_STARTED;
    private volatile Registration copyRegistration=Registration.NOT_STARTED;
    private volatile Registration lookupRegistration=Registration.NOT_STARTED;
    // Retain every returned handle before metadata validation, including foreign
    // or ambiguous handles. This component never unhooks an uncertain receipt.
    private volatile XposedInterface.HookHandle retainedHandle;
    private volatile XposedInterface.HookHandle retainedPermissionHandle;
    private volatile XposedInterface.HookHandle retainedCopyHandle;
    private volatile XposedInterface.HookHandle retainedLookupHandle;
    private volatile List<DeoptReceipt> deoptReceipts=List.of();
    private volatile RootOwnedMutationAdapter ownedAdapter;
    private volatile RootOwnershipObservation.Bound ownershipObservation;
    private boolean ownershipAttempted;

    RootHiddenRequestIngress(RootEarlyModule module,RootHiddenRequestProfile.Resolved profile,
            RootEarlyCoordinator owner,RootEarlyModule.WindowAuthority authority) {
        this.module=Objects.requireNonNull(module);this.profile=Objects.requireNonNull(profile);
        this.owner=Objects.requireNonNull(owner);this.authority=Objects.requireNonNull(authority);
        Objects.requireNonNull(profile.hook);Objects.requireNonNull(profile.permission);
        Objects.requireNonNull(profile.copy);Objects.requireNonNull(profile.lookup);Objects.requireNonNull(profile.callers);
        ipmOwner=member(PMS+"$IPackageManagerImpl","this$0");
        helperOwner=member("com.android.server.pm.InstallPackageHelper","mPm");
        pmsLock=member(PMS,"mLock");pmsWriteLock=member(PMS,"mPackageStateWriteLock");
        pmsSettings=member(PMS,"mSettings");settingsLock=member(SETTINGS,"mLock");
        settingName=member(PACKAGE_SETTING,"mName");
        packageName=member(PACKAGE_IMPL,"packageName");
        originalPackages=member(PACKAGE_IMPL,"originalPackages");
        packageBooleans=member(PACKAGE_IMPL,"mBooleans");
        pmsClass=Objects.requireNonNull(profile.classes.get(PMS));
        packageClass=Objects.requireNonNull(profile.classes.get(PACKAGE_IMPL));
        settingsClass=Objects.requireNonNull(profile.classes.get(SETTINGS));
        settingClass=Objects.requireNonNull(profile.classes.get(PACKAGE_SETTING));
        userHandleClass=Objects.requireNonNull(profile.classes.get("android.os.UserHandle"));
    }

    /** One attempt, and every API boundary rechecks the original private window. */
    void install(long deadline) {
        try {
            synchronized(this) {
                if(attempted)throw new IllegalStateException("Hidden ingress installation already attempted");
                attempted=true;installationDeadline=deadline;
            }
            checkWindow(deadline);
            // The helper is transparent outside a matching entry Scope. Installing
            // it first avoids an entry-only handover during this same early window.
            installHook(profile.permission,HookKind.PERMISSION,deadline);
            installHook(profile.hook,HookKind.HIDDEN,deadline);
            // Lookup is transparent without a CopyScope. Install it before the
            // prepare hook can expose a scope that needs actual-name enlistment.
            installHook(profile.lookup,HookKind.LOOKUP,deadline);
            // Record copy requests immediately after this hook becomes visible,
            // including callbacks before the finite deopt list has completed.
            installHook(profile.copy,HookKind.COPY,deadline);
            ArrayList<DeoptReceipt> receipts=new ArrayList<>();
            for(Method caller:profile.callers) {
                checkWindow(deadline);
                boolean accepted;
                try { accepted=module.deoptimize(caller); }
                catch(Throwable error) {
                    receipts.add(new DeoptReceipt(caller,DeoptOutcome.THREW,error));
                    deoptReceipts=List.copyOf(receipts);throw error;
                }
                receipts.add(new DeoptReceipt(caller,accepted?DeoptOutcome.RETURNED_TRUE:DeoptOutcome.RETURNED_FALSE,null));
                deoptReceipts=List.copyOf(receipts);
                checkWindow(deadline);
                if(!accepted)throw new IllegalStateException("Hidden ingress deopt returned false");
            }
            checkWindow(deadline);
            installed=true;
        } catch(Throwable error) { revoke(error); }
    }

    private void installHook(Method target,HookKind kind,long deadline) throws Throwable {
        checkWindow(deadline);
        XposedInterface.HookBuilder builder=Objects.requireNonNull(module.hook(target));
        checkWindow(deadline);
        builder=Objects.requireNonNull(builder.setExceptionMode(XposedInterface.ExceptionMode.PASSTHROUGH));
        checkWindow(deadline);
        recordRegistration(kind,Registration.STARTED);
        XposedInterface.HookHandle handle;
        XposedInterface.Hooker callback=switch(kind) {
            case PERMISSION -> this::interceptPermission;
            case HIDDEN -> this::intercept;
            case COPY -> this::interceptCopy;
            case LOOKUP -> this::interceptLookup;
        };
        try {handle=builder.intercept(callback);}
        catch(Throwable uncertain){recordRegistration(kind,Registration.THREW);throw uncertain;}
        switch(kind) {
            case PERMISSION -> retainedPermissionHandle=handle;
            case HIDDEN -> retainedHandle=handle;
            case COPY -> retainedCopyHandle=handle;
            case LOOKUP -> retainedLookupHandle=handle;
        }
        recordRegistration(kind,handle==null?Registration.NULL_HANDLE:Registration.UNTRUSTED_HANDLE);
        checkWindow(deadline);
        if(handle==null)throw new IllegalStateException("Hidden ingress returned no handle");
        if(!target.equals(handle.getExecutable()))throw new IllegalStateException("Hidden ingress handle executable differs");
        checkWindow(deadline);
        owner.requireDistinctHiddenIngressHandle(this,handle);
        if(kind!=HookKind.PERMISSION && handle==retainedPermissionHandle
                || kind!=HookKind.HIDDEN && handle==retainedHandle
                || kind!=HookKind.COPY && handle==retainedCopyHandle
                || kind!=HookKind.LOOKUP && handle==retainedLookupHandle)
            throw new IllegalStateException("Hidden ingress reused another cleanup handle");
        checkWindow(deadline);
        recordRegistration(kind,Registration.TRUSTED_HANDLE);
    }
    private void recordRegistration(HookKind kind,Registration state) {
        switch(kind) {
            case PERMISSION -> permissionRegistration=state;
            case HIDDEN -> registration=state;
            case COPY -> copyRegistration=state;
            case LOOKUP -> lookupRegistration=state;
        }
    }

    private void checkWindow(long deadline) throws Exception {
        owner.requireOwnedHiddenIngress(this,authority);
        authority.require(owner,module);
        if(failure.get()!=null)throw new IllegalStateException("Hidden ingress revoked",failure.get());
        long remaining=deadline-System.nanoTime();
        if(deadline==0 || deadline!=installationDeadline || remaining<=0 || remaining>5_000_000_000L)
            throw new java.util.concurrent.TimeoutException("Hidden ingress original deadline expired or invalid");
        if(Thread.currentThread().isInterrupted())throw new InterruptedException("Hidden ingress installation interrupted");
    }

    void installOwnership(RootOwnershipProfile.Resolved ownershipProfile,long deadline) {
        try {
            synchronized(this) {
                if(ownershipAttempted)throw new IllegalStateException("Ownership installation already attempted");
                ownershipAttempted=true;
            }
            checkWindow(deadline);
            RootOwnedMutationAdapter created=new RootOwnedMutationAdapter(this,module,ownershipProfile);
            ownedAdapter=created;
            created.install(deadline);
            checkWindow(deadline);
        }catch(Throwable error){revoke(error);}
    }
    void checkOwnershipWindow(RootOwnedMutationAdapter adapter,long deadline)throws Exception {
        if(adapter==null||ownedAdapter!=adapter)throw new IllegalStateException("Foreign ownership installer");
        checkWindow(deadline);
    }
    void requireDistinctOwnershipHandle(RootOwnedMutationAdapter adapter,XposedInterface.HookHandle handle)throws Exception {
        checkOwnershipWindow(adapter,installationDeadline);
        owner.requireDistinctHiddenIngressHandle(this,handle);
        if(handle==retainedHandle||handle==retainedPermissionHandle||handle==retainedCopyHandle||handle==retainedLookupHandle)
            throw new IllegalStateException("Owned hook reused request cleanup handle");
        checkOwnershipWindow(adapter,installationDeadline);
    }

    /** Actual native owner validation precedes this call in the runtime bundle. */
    void bind(Object ipm,Object actualMonitor,HiddenOwnershipCore core,RootNativeBridge.Bound bridge) {
        try {
            Objects.requireNonNull(ipm);Objects.requireNonNull(actualMonitor);
            Objects.requireNonNull(core);Objects.requireNonNull(bridge);
            if(ipm.getClass()!=profile.hook.getDeclaringClass())
                throw new IllegalStateException("Hidden ingress native receiver class differs");
            if(!available())throw new IllegalStateException("Hidden ingress not available for binding");
            Object pms=ipmOwner.get(ipm);
            if(monitor(pms)!=actualMonitor)throw new IllegalStateException("Hidden ingress PMS monitor differs");
            synchronized(actualMonitor) {
                if(ipmOwner.get(ipm)!=pms || monitor(pms)!=actualMonitor)
                    throw new IllegalStateException("Hidden ingress native owner changed");
                Binding created=new Binding(ipm,pms,actualMonitor,core,bridge);
                if(!binding.compareAndSet(null,created)) {
                    Binding current=binding.get();
                    if(current==null || !current.same(ipm,pms,actualMonitor,core,bridge) || !current.ready)
                        throw new IllegalStateException("Hidden ingress native binding differs or is incomplete");
                    return;
                }
                ledger.bind(ipm,pms,actualMonitor,core);
                if(failure.get()!=null || !ledger.available())
                    throw new IllegalStateException("Hidden ingress revoked during binding");
                created.ready=true;
            }
        } catch(Throwable error) { revoke(error); }
    }

    void attachObservation(Object ipm,Object actualMonitor,HiddenOwnershipCore core,RootNativeBridge.Bound bridge,
            RootOwnershipObservation.Bound observer) {
        try {
            Binding current=binding.get();
            if(current==null||!current.ready||!current.same(ipm,current.pms,actualMonitor,core,bridge)
                    ||!Thread.holdsLock(actualMonitor)||!available()||ownedAdapter==null)
                throw new IllegalStateException("Ownership observation binding differs");
            if(ipmOwner.get(ipm)!=current.pms||monitor(current.pms)!=actualMonitor)
                throw new IllegalStateException("Ownership observation native owner changed");
            Objects.requireNonNull(observer).requireOwnershipBinding(this,current.pms,actualMonitor,core);
            if(ownershipObservation!=null&&ownershipObservation!=observer)
                throw new IllegalStateException("Ownership observer instance differs");
            ownedAdapter.attach(current.pms,actualMonitor,core,observer);
            ownershipObservation=observer;
        }catch(Throwable error){revoke(error);}
    }

    HidePreparation preparePrivateHide(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
            RootOwnershipObservation.Bound observer)throws Throwable {
        Objects.requireNonNull(frame).requireHidePreparationScope(bridge);
        Binding exact=binding.get();
        if(exact==null||exact.bridge!=bridge)throw new IllegalStateException("Hide has no exact ownership binding");
        synchronized(exact.monitor) {
            frame.requireHidePreparationScope(bridge);
            requirePreparationBinding(exact,observer);
            HiddenOwnershipCore.Target target=new HiddenOwnershipCore.Target(frame.userId(),frame.serial(),frame.packageName());
            new HideRootProtocol.Request(HideRootProtocol.Verb.HIDE,target.userId,target.serial,target.packageName,frame.request.nonce);
            // Normal exhaustion rejects this new request; it must not retire older recoverable sources.
            if((long)confirmedHides.size()+preparingHides.size()>=HideRestoreGrantLedger.MAX_SOURCES
                    ||confirmedHides.containsKey(frame.request.nonce)||preparingHides.containsKey(frame.request.nonce))
                throw new IllegalStateException("Hide source publication capacity unavailable");
            HidePreparation preparation=new HidePreparation(this,frame,exact,observer,target);
            preparingHides.put(preparation.nonce,preparation);
            try {
                preparation.resources=exact.core.prepareHide(target,()->observer.probe(frame.instance,target,frame.appId()));
                frame.requireHidePreparationScope(bridge);
                requirePreparationBinding(exact,observer);
                frame.retainHidePreparation(bridge,preparation);
                requirePrivateHidePrepared(frame,bridge,preparation);
                return preparation;
            }catch(Throwable failure) {
                releasePrivateHidePreparation(frame,bridge,preparation);
                throw failure;
            }
        }
    }

    void requirePrivateHidePrepared(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
            HidePreparation preparation)throws Throwable {
        Objects.requireNonNull(frame).requireHidePreparedScope(bridge);
        requirePreparationIdentity(frame,bridge,preparation);
        synchronized(preparation.binding.monitor) {
            frame.requireHidePreparedScope(bridge);
            requirePreparationIdentity(frame,bridge,preparation);
            if(preparation.closed||preparation.confirmed||preparation.commitClaimed||preparation.resources==null
                    ||preparingHides.get(preparation.nonce)!=preparation)
                throw new IllegalStateException("Hide preparation is no longer unused");
            requirePreparationBinding(preparation.binding,preparation.observer);
            preparation.binding.core.requireHidePrepared(preparation.resources,preparation.target,
                    ()->preparation.observer.probe(frame.instance,preparation.target,frame.appId()));
            frame.requireHidePreparedScope(bridge);
            requirePreparationIdentity(frame,bridge,preparation);
            requirePreparationBinding(preparation.binding,preparation.observer);
            if(preparation.closed||preparation.confirmed||preparation.commitClaimed
                    ||preparingHides.get(preparation.nonce)!=preparation)
                throw new IllegalStateException("Hide preparation changed during validation");
        }
    }

    private void requirePreparationIdentity(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
            HidePreparation preparation) {
        if(preparation==null||preparation.ingress!=this||preparation.frame!=frame||frame==null
                ||frame.getClass()!=RootTransactionEngine.Frame.class||frame.restoring()
                ||frame.hidePreparation()!=preparation||preparation.binding.bridge!=bridge
                ||preparation.user!=frame.instance||preparation.appId!=frame.appId()
                ||!preparation.nonce.equals(frame.request.nonce)||preparation.target.userId!=frame.userId()
                ||preparation.target.serial!=frame.serial()||!preparation.target.packageName.equals(frame.packageName()))
            throw new IllegalStateException("Hide preparation belongs to another exact operation");
    }

    private void requirePreparationBinding(Binding exact,RootOwnershipObservation.Bound observer)throws Throwable {
        if(!Thread.holdsLock(exact.monitor)||!available()||binding.get()!=exact||!exact.ready
                ||observer==null||observer!=ownershipObservation||ownedAdapter==null)
            throw new IllegalStateException("Hide preparation observation unavailable");
        if(ipmOwner.get(exact.ipm)!=exact.pms||monitor(exact.pms)!=exact.monitor)
            throw new IllegalStateException("Hide preparation native owner changed");
        observer.requireOwnershipBinding(this,exact.pms,exact.monitor,exact.core);
        ownedAdapter.requirePreparationBinding(exact.pms,exact.monitor,exact.core,observer);
    }

    /** May run after a failed/closed Frame; only this retained reservation can be released. */
    void releasePrivateHidePreparation(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
            HidePreparation preparation) {
        if(preparation==null)return;
        if(preparation.ingress!=this||preparation.frame!=frame||preparation.binding.bridge!=bridge)
            throw new IllegalStateException("Foreign hide preparation cleanup");
        synchronized(preparation.binding.monitor) {
            if(preparation.closed)return;
            preparation.closed=true;
            preparingHides.remove(preparation.nonce,preparation);
            if(preparation.resources!=null)preparation.binding.core.releaseHidePreparation(preparation.resources);
        }
    }

    /** Only the already authorized private native commit can consume its reserved Core resource. */
    HiddenOwnershipCore.HidePreparation claimPreparedHideCommit(RootOwnedMutationAdapter adapter,CommitPermit permit)throws Throwable {
        requireCommitPermit(adapter,permit);
        if(!permit.hidden||!Thread.holdsLock(permit.monitor))
            throw new IllegalStateException("Prepared hide claim outside native commit");
        HidePreparation preparation=permit.ticket.preparation;
        requirePrivateHidePrepared(permit.frame,permit.ticket.binding.bridge,preparation);
        preparation.commitClaimed=true;
        return preparation.resources;
    }

    /** Consumed resources are checked by Core's active frame/receipt, not by its unused-resource API. */
    private void requirePreparedCommitIdentity(CommitPermit permit) {
        HidePreparation preparation=permit.ticket.preparation;
        requirePreparationIdentity(permit.frame,permit.ticket.binding.bridge,preparation);
        if(preparation.closed||preparation.confirmed||preparation.resources==null)
            throw new IllegalStateException("Private hide lost its preparation");
        if(Thread.holdsLock(permit.monitor)&&preparingHides.get(preparation.nonce)!=preparation)
            throw new IllegalStateException("Private hide lost its publication reservation");
    }

    CommitPermit claimCommitPermit(RootOwnedMutationAdapter adapter,Object pms,Object initial,Object name,Object consumer)throws Throwable {
        Scope scope=invocation.get();
        if(scope==null||!scope.own)return null;
        try {
        Ticket ticket=scope.ticket;
        if(adapter==null||adapter!=ownedAdapter||ownershipObservation==null||copyInvocation.get()!=null
                ||scope!=invocation.get()||!scope.permissionReturned||scope.permissionInFlight||scope.permissionThrew
                ||privateTicket.get()!=ticket||ticket.commitClaimed||pms!=ticket.binding.pms
                ||initial!=null||!(name instanceof String)||!scope.name.equals(name))
            throw new IllegalStateException("Private commit does not match its authorized entry");
        ticket.commitClaimed=true;
        CommitPermit permit=new CommitPermit(adapter,ticket,scope,consumer);
        requireCommitPermit(adapter,permit);
        return permit;
        }catch(Throwable failure){throw new PrivateCommitRejection(failure);}
    }
    /** Classification for rejecting a malformed first private candidate, never granting authority. */
    void rejectPrivateCommitFailure(Throwable failure) {
        Scope scope=invocation.get();
        if(scope!=null&&scope.own)throw new PrivateCommitRejection(failure);
    }
    void requireCommitPermit(RootOwnedMutationAdapter adapter,CommitPermit permit)throws Throwable {
        if(permit==null||permit.adapter!=adapter||ownedAdapter!=adapter||!available()||ownershipObservation==null
                ||permit.ticket.binding!=binding.get()||!permit.ticket.binding.ready
                ||privateTicket.get()!=permit.ticket||invocation.get()!=permit.scope||!permit.scope.own
                ||!permit.scope.permissionReturned||permit.scope.permissionInFlight||permit.scope.permissionThrew
                ||copyInvocation.get()!=null||ipmOwner.get(permit.ticket.binding.ipm)!=permit.pms
                ||monitor(permit.pms)!=permit.monitor)
            throw new IllegalStateException("Private commit permit is no longer current");
        permit.frame.requireHiddenRequestScope(permit.ticket.binding.bridge);
        if(permit.hidden!=permit.frame.hiddenValue())throw new IllegalStateException("Private direction changed");
        if(permit.hidden)requirePreparedCommitIdentity(permit);
        else requireRestoreSource(permit.frame,permit.ticket.binding.bridge,permit.frame.restoreSource());
    }
    void retainCommitReceipt(RootOwnedMutationAdapter adapter,CommitPermit permit,
            HiddenOwnershipCore.Target target,HiddenOwnershipCore.HideReceipt receipt)throws Throwable {
        try {
            requireCommitPermit(adapter,permit);
            if(!permit.hidden||!Thread.holdsLock(permit.monitor)||permit.ticket.pending!=null
                    ||!permit.ticket.preparation.commitClaimed||receipt==null||receipt.token==null)
                throw new IllegalStateException("Private commit receipt cannot be retained");
            PendingHide pending=new PendingHide(this,adapter,permit.ticket,target,Objects.requireNonNull(receipt));
            permit.ticket.pending=pending;
            permit.frame.retainPendingHide(permit.ticket.binding.bridge,pending);
        }catch(Throwable error) {
            if(receipt!=null&&Thread.holdsLock(permit.monitor))
                try{permit.ticket.binding.core.discardReceipt(target,receipt.token);}catch(Throwable cleanup){revoke(cleanup);}
            revoke(error);throw error;
        }
    }
    boolean completePrivateHide(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,PendingHide pending) {
        if(pending==null)return false;
        try {
            requirePending(frame,bridge,pending);
            frame.requireHideCompletionScope(bridge);
            Binding exact=pending.ticket.binding;
            synchronized(exact.monitor) {
                HidePreparation preparation=pending.ticket.preparation;
                requirePreparationIdentity(frame,bridge,preparation);
                if(preparation.closed||preparation.confirmed||!preparation.commitClaimed
                        ||preparingHides.get(preparation.nonce)!=preparation)
                    throw new IllegalStateException("Private hide has no reserved source publication");
                if(pending.discarded||pending.confirmed||!pending.ticket.outerCompleted||!pending.ticket.entryCompleted
                        ||!available()||binding.get()!=exact||!exact.ready||ownershipObservation==null)
                    throw new IllegalStateException("Private hide has not completed with current evidence");
                if(ipmOwner.get(exact.ipm)!=exact.pms||monitor(exact.pms)!=exact.monitor)
                    throw new IllegalStateException("Private hide native binding changed before final probe");
                ownershipObservation.requireOwnershipBinding(this,exact.pms,exact.monitor,exact.core);
                boolean verified=exact.core.verifyReceipt(pending.target,pending.receipt.token,
                        ()->ownershipObservation.probe(frame.instance,pending.target,frame.appId()));
                if(!verified){discardPrivateHide(frame,bridge,pending);return false;}
                frame.requireHideCompletionScope(bridge);
                requirePending(frame,bridge,pending);
                requirePreparationIdentity(frame,bridge,preparation);
                if(preparation.closed||preparation.confirmed||!preparation.commitClaimed
                        ||preparingHides.get(preparation.nonce)!=preparation)
                    throw new IllegalStateException("Hide preparation changed during final probe");
                if(binding.get()!=exact||!exact.ready||!available()||pending.discarded||pending.confirmed)
                    throw new IllegalStateException("Private hide changed during final probe");
                if(ipmOwner.get(exact.ipm)!=exact.pms||monitor(exact.pms)!=exact.monitor)
                    throw new IllegalStateException("Private hide native binding changed during final probe");
                ownershipObservation.requireOwnershipBinding(this,exact.pms,exact.monitor,exact.core);
                pending.adapter.confirmed();
                if(!available())throw new IllegalStateException("Private hide revoked during confirmation");
                if(confirmedHides.size()>=HideRestoreGrantLedger.MAX_SOURCES)throw new IllegalStateException("Confirmed hide registry capacity reached");
                ConfirmedHide source=new ConfirmedHide(this,pending,ownershipObservation);
                // Validate the source operation ID; a null/compatibility receipt never arrives here.
                new HideRootProtocol.Request(HideRootProtocol.Verb.HIDE,pending.target.userId,pending.target.serial,
                        pending.target.packageName,source.sourceNonce);
                if(confirmedHides.putIfAbsent(source.sourceNonce,source)!=null)
                    throw new IllegalStateException("Confirmed hide operation ID already published");
                preparingHides.remove(preparation.nonce,preparation);
                preparation.confirmed=true;pending.confirmed=true;return true;
            }
        }catch(Throwable error){revoke(error);discardPrivateHide(frame,bridge,pending);return false;}
    }
    /** Cleanup uses the retained identity, not a now-expired engine lease. */
    void discardPrivateHide(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,PendingHide pending) {
        if(pending==null)return;
        try {
            requirePending(frame,bridge,pending);
            Binding exact=pending.ticket.binding;
            synchronized(exact.monitor) {
                if(pending.confirmed||pending.discarded)return;
                pending.discarded=true;
                exact.core.discardReceipt(pending.target,pending.receipt.token);
                pending.adapter.discarded();
            }
        }catch(Throwable error){revoke(error);}
    }
    private void requirePending(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,PendingHide pending) {
        if(pending.ingress!=this||pending.ticket.frame!=frame||frame==null||frame.getClass()!=RootTransactionEngine.Frame.class
                ||pending.ticket.binding.bridge!=bridge||pending.ticket.pending!=pending||pending.adapter!=ownedAdapter)
            throw new IllegalStateException("Private hide receipt identity differs");
    }

    ConfirmedHide captureRestoreSource(RootNativeBridge.Bound bridge,RootOwnershipObservation.Bound observer,
            HideRootProtocol.Request request) {
        if(request==null||!request.isRestore()||!request.isPrepare()||!available())return null;
        ConfirmedHide source=confirmedHides.get(request.sourceHideNonce);
        Binding exact=binding.get();
        return source!=null&&source.ingress==this&&source.binding==exact&&exact!=null&&exact.ready
                &&exact.bridge==bridge&&source.observer==observer&&ownershipObservation==observer
                &&source.target.userId==request.userId&&source.target.serial==request.serial
                &&source.target.packageName.equals(request.packageName)?source:null;
    }

    private void requireRestoreSource(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,ConfirmedHide source) {
        frame.requireBridgeOwner(bridge);
        if(!frame.restoring()||source==null||source!=frame.restoreSource()||source.ingress!=this
                ||source.binding!=binding.get()||!source.binding.ready||source.binding.bridge!=bridge||!available()
                ||source.observer!=ownershipObservation||confirmedHides.get(source.sourceNonce)!=source
                ||!source.sourceNonce.equals(frame.request.sourceHideNonce)||source.user!=frame.instance
                ||source.appId!=frame.appId()||source.target.userId!=frame.userId()||source.target.serial!=frame.serial()
                ||!source.target.packageName.equals(frame.packageName()))
            throw new IllegalStateException("Restore source is not from this live confirmed hidden modification");
    }

    boolean validateRestoreOwnership(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,ConfirmedHide source)
            throws Throwable {
        frame.requireRestoreValidationScope(bridge);
        requireRestoreSource(frame,bridge,source);
        Binding exact=source.binding;
        synchronized(exact.monitor) {
            requireRestoreSource(frame,bridge,source);
            source.observer.requireOwnershipBinding(this,exact.pms,exact.monitor,exact.core);
            boolean valid=exact.core.verifyReceipt(source.target,source.token,
                    ()->source.observer.probe(frame.instance,source.target,frame.appId()));
            frame.requireRestoreValidationScope(bridge);
            requireRestoreSource(frame,bridge,source);
            source.observer.requireOwnershipBinding(this,exact.pms,exact.monitor,exact.core);
            return valid;
        }
    }

    HiddenOwnershipCore.RestoreAttempt newRestoreAttempt(RootOwnedMutationAdapter adapter,CommitPermit permit)
            throws Throwable {
        requireCommitPermit(adapter,permit);
        if(permit.hidden||!Thread.holdsLock(permit.monitor)||permit.restoreAttempt!=null)
            throw new IllegalStateException("Restore attempt cannot be created outside its private commit");
        ConfirmedHide source=permit.frame.restoreSource();
        permit.restoreAttempt=source.binding.core.newRestore(source.target,source.token);
        return permit.restoreAttempt;
    }

    void retainRestoreReceipt(RootOwnedMutationAdapter adapter,CommitPermit permit,
            HiddenOwnershipCore.RestoreAttempt attempt)throws Throwable {
        try {
            requireCommitPermit(adapter,permit);
            if(permit.hidden||!Thread.holdsLock(permit.monitor)||attempt==null||attempt!=permit.restoreAttempt
                    ||permit.ticket.pendingRestore!=null)
                throw new IllegalStateException("Restore receipt does not belong to this native commit");
            PendingRestore pending=new PendingRestore(this,adapter,permit,attempt);
            permit.ticket.pendingRestore=pending;
            permit.frame.retainPendingRestore(permit.ticket.binding.bridge,pending);
        }catch(Throwable failure) {
            if(attempt!=null&&Thread.holdsLock(permit.monitor))
                try{permit.ticket.binding.core.abandonRestore(attempt);}catch(Throwable cleanup){revoke(cleanup);}
            revoke(failure);throw failure;
        }
    }

    private void requirePendingRestore(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,PendingRestore pending) {
        if(pending==null||pending.ingress!=this||pending.ticket.frame!=frame||frame==null
                ||frame.getClass()!=RootTransactionEngine.Frame.class||!frame.restoring()
                ||pending.ticket.binding.bridge!=bridge||pending.ticket.pendingRestore!=pending
                ||pending.adapter!=ownedAdapter||pending.source!=frame.restoreSource())
            throw new IllegalStateException("Pending restore identity differs");
    }

    boolean completePrivateRestore(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,PendingRestore pending) {
        if(pending==null)return false;
        try {
            requirePendingRestore(frame,bridge,pending);
            frame.requireRestoreCompletionScope(bridge);
            Binding exact=pending.ticket.binding;
            synchronized(exact.monitor) {
                if(pending.discarded||pending.confirmed||!pending.ticket.outerCompleted||!pending.ticket.entryCompleted)
                    throw new IllegalStateException("Restore outer native call is incomplete");
                requireRestoreSource(frame,bridge,pending.source);
                if(ipmOwner.get(exact.ipm)!=exact.pms||monitor(exact.pms)!=exact.monitor)
                    throw new IllegalStateException("Restore native binding differs");
                pending.source.observer.requireOwnershipBinding(this,exact.pms,exact.monitor,exact.core);
                boolean valid=exact.core.verifyRestoredReceipt(pending.attempt,
                        ()->pending.source.observer.probe(frame.instance,pending.source.target,frame.appId()));
                if(!valid){discardPrivateRestore(frame,bridge,pending);return false;}
                frame.requireRestoreCompletionScope(bridge);
                requirePendingRestore(frame,bridge,pending);
                requireRestoreSource(frame,bridge,pending.source);
                if(pending.confirmed||pending.discarded||ipmOwner.get(exact.ipm)!=exact.pms||monitor(exact.pms)!=exact.monitor)
                    throw new IllegalStateException("Restore changed during final probe");
                pending.source.observer.requireOwnershipBinding(this,exact.pms,exact.monitor,exact.core);
                pending.adapter.restored();
                if(!available())throw new IllegalStateException("Restore revoked during confirmation");
                pending.confirmed=true;return true;
            }
        }catch(Throwable failure){revoke(failure);discardPrivateRestore(frame,bridge,pending);return false;}
    }

    void discardPrivateRestore(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,PendingRestore pending) {
        if(pending==null)return;
        try {
            requirePendingRestore(frame,bridge,pending);
            synchronized(pending.ticket.binding.monitor) {
                if(pending.confirmed||pending.discarded)return;
                pending.discarded=true;
                pending.ticket.binding.core.abandonRestore(pending.attempt);
                pending.adapter.discarded();
            }
        }catch(Throwable failure){revoke(failure);}
    }

    /**
     * Only the first exact entry reached by this sealed HIDE call is private.
     * Reentrant ordinary calls remain ordinary even on the same thread/target.
     * No ingress monitor or native PMS monitor spans the original function.
     */
    Object withPrivateHide(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
            Object ipm,NativeCall original) throws Throwable {
        Objects.requireNonNull(original);
        // A canceled or resource-refused preparation rejects this operation;
        // it does not retire unrelated older sources or retry as ordinary HIDE.
        if(frame!=null&&frame.getClass()==RootTransactionEngine.Frame.class&&!frame.restoring())
            requirePrivateHidePrepared(frame,bridge,frame.hidePreparation());
        try {
            if(frame==null || frame.getClass()!=RootTransactionEngine.Frame.class)
                throw new IllegalStateException("Hidden ingress requires the exact engine frame");
            frame.claimHiddenRequestScope(bridge);
            if(privateTicket.get()!=null)
                throw new IllegalStateException("Hidden ingress private scope is already armed");
        } catch(Throwable error) {revoke(error);throw error;}
        Binding current=binding.get();
        if(current==null || !current.ready || !available()) {
            throw new IllegalStateException("Private hidden mutation cannot use an ordinary fallback");
        }
        if(current.ipm!=ipm || current.bridge!=bridge) {
            IllegalStateException error=new IllegalStateException("Hidden ingress private native owner differs");
            revoke(error);throw error;
        }
        Ticket ticket=new Ticket(frame,current);
        if(frame.restoring())requireRestoreSource(frame,bridge,frame.restoreSource());
        privateTicket.set(ticket);
        try {
            Object result=original.call();
            if(ownedAdapter!=null&&ticket.commitClaimed&&(frame.restoring()?ticket.pendingRestore==null:ticket.pending==null)) {
                IllegalStateException error=new IllegalStateException("Selected private commit produced no retained receipt");
                revoke(error);throw error;
            }
            ticket.outerCompleted=Boolean.TRUE.equals(result)&&ticket.entryCompleted&&ticket.consumed;
            return result;
        }
        finally {
            privateTicket.remove();
            if(!ticket.consumed)revoke(new IllegalStateException("Private hide did not reach the exact hidden entry"));
            if(!ticket.outerCompleted&&ticket.pending!=null)discardPrivateHide(frame,bridge,ticket.pending);
            if(!ticket.outerCompleted&&ticket.pendingRestore!=null)discardPrivateRestore(frame,bridge,ticket.pendingRestore);
        }
    }

    private Object intercept(XposedInterface.Chain chain) throws Throwable {
        Scope scope=null;
        Ticket selected=privateTicket.get();
        boolean selectedPrivate=selected!=null&&!selected.consumed;
        try {
            // Bookkeeping failure must not suppress, retry, or substitute an
            // ordinary operation, including an ordinary same-value request.
            if(selectedPrivate&&!available())throw new IllegalStateException("Private hidden entry is unavailable");
            if(failure.get()==null) {
                if(!profile.hook.equals(chain.getExecutable()))
                    throw new IllegalStateException("Hidden ingress callback executable differs");
                Object receiver=chain.getThisObject();
                List<Object> args=chain.getArgs();
                if(receiver==null || receiver.getClass()!=profile.hook.getDeclaringClass()
                        || args==null || args.size()!=3 || !(args.get(0) instanceof String)
                        || !(args.get(1) instanceof Boolean) || !(args.get(2) instanceof Integer))
                    throw new IllegalStateException("Hidden ingress callback shape differs");
                String name=(String)args.get(0);boolean hidden=(Boolean)args.get(1);int user=(Integer)args.get(2);
                Ticket ticket=privateTicket.get();
                boolean own=false;
                if(ticket!=null && !ticket.consumed) {
                    ticket.consumed=true;
                    if(ticket.binding!=binding.get() || ticket.binding.ipm!=receiver || hidden!=ticket.frame.hiddenValue()
                            || user!=ticket.frame.userId() || !name.equals(ticket.frame.packageName()))
                        throw new IllegalStateException("Private hidden entry differs from its armed target");
                    ticket.frame.requireHiddenRequestScope(ticket.binding.bridge);
                    if(!available() || !ticket.binding.ready)
                        throw new IllegalStateException("Private hidden entry was revoked before consumption");
                    own=true;
                }
                // No native monitor or ownership ledger is touched until the
                // original permission helper actually returns successfully.
                scope=new Scope(invocation.get(),receiver,user,name,own?ticket:null);
                invocation.set(scope);
            }
        } catch(Throwable error) { revoke(error);if(selectedPrivate)throw new PrivateCommitRejection(error); }
        boolean returned=false;
        try {Object result=chain.proceed();returned=true;return result;}
        finally {
            if(scope!=null) {
                try {
                    if(invocation.get()!=scope)throw new IllegalStateException("Hidden entry scope order changed");
                    if(!scope.permissionSeen || scope.permissionInFlight
                            || (returned && scope.permissionThrew))
                        throw new IllegalStateException("Hidden entry permission traversal incomplete");
                    if(scope.own)scope.ticket.entryCompleted=returned&&scope.permissionReturned&&!scope.permissionThrew;
                } catch(Throwable error){revoke(error);}
                finally {
                    if(scope.previous==null)invocation.remove();else invocation.set(scope.previous);
                    if(scope.request!=null)try{scope.request.close();}catch(Throwable error){revoke(error);}
                }
            }
        }
    }

    private Object interceptPermission(XposedInterface.Chain chain) throws Throwable {
        Scope scope=null;
        try {
            if(failure.get()==null) {
                if(!profile.permission.equals(chain.getExecutable()))
                    throw new IllegalStateException("Permission callback executable differs");
                Scope current=invocation.get();
                // RootCommandEntry and other callers use this same helper outside
                // the hidden IPM body. They retain their ordinary native behavior.
                if(current!=null) {
                    if(chain.getThisObject()!=current.receiver || chain.getArgs()==null
                            || !chain.getArgs().isEmpty() || current.permissionSeen)
                        throw new IllegalStateException("Permission callback scope or shape differs");
                    current.permissionSeen=true;current.permissionInFlight=true;scope=current;
                }
            }
        }catch(Throwable error){revoke(error);}
        final Object result;
        try {result=chain.proceed();}
        catch(Throwable original) {
            if(scope!=null) {
                scope.permissionInFlight=false;scope.permissionThrew=true;
                try{increment(scope.own?deniedPrivate:deniedOrdinary,"Permission denial counter exhausted");}
                catch(Throwable bookkeeping){revoke(bookkeeping);}
            }
            throw original;
        }
        if(scope!=null) {
            scope.permissionInFlight=false;scope.permissionReturned=true;
            try {
                if(invocation.get()!=scope)throw new IllegalStateException("Permission returned outside its entry scope");
                if(failure.get()==null) {
                    if(scope.own) {
                        if(scope.ticket.binding!=binding.get() || !scope.ticket.binding.ready || !available())
                            throw new IllegalStateException("Private permission returned after binding revocation");
                        scope.ticket.frame.requireHiddenRequestScope(scope.ticket.binding.bridge);
                        increment(privateAccepted,"Private request counter exhausted");
                    }
                    else scope.request=ledger.begin(scope.receiver,scope.user,scope.name);
                }
            }catch(Throwable error){revoke(error);}
        }
        return result;
    }

    /** Covers the known prepare -> ScanRequest copy interval, including its PMS-free tail. */
    private Object interceptCopy(XposedInterface.Chain chain) throws Throwable {
        CopyScope scope=null;
        try {
            if(failure.get()==null) {
                if(!profile.copy.equals(chain.getExecutable()))
                    throw new IllegalStateException("Copy ingress callback executable differs");
                Object helper=chain.getThisObject();List<Object> args=chain.getArgs();
                if(helper==null || helper.getClass()!=profile.copy.getDeclaringClass()
                        || args==null || args.size()!=5 || args.get(0)==null
                        || args.get(0).getClass()!=packageClass || !(args.get(1) instanceof Integer)
                        || !(args.get(2) instanceof Integer)
                        || args.get(3)!=null && args.get(3).getClass()!=userHandleClass
                        || args.get(4)!=null && !(args.get(4) instanceof String))
                    throw new IllegalStateException("Copy ingress callback shape differs");
                Object pms=helperOwner.get(helper);Object actualMonitor=monitor(pms);
                synchronized(actualMonitor) {
                    if(failure.get()!=null || !ledger.available())
                        throw new IllegalStateException("Copy observation revoked before admission");
                    if(helperOwner.get(helper)!=pms || monitor(pms)!=actualMonitor)
                        throw new IllegalStateException("Copy ingress native owner changed");
                    Binding current=binding.get();
                    if(current!=null && (current.pms!=pms || current.monitor!=actualMonitor))
                        throw new IllegalStateException("Copy ingress addresses a different PMS");
                    Object actualSettings=settings(pms,actualMonitor);
                    List<String> names=copyNames(args.get(0));
                    // Allocate storage before opening any request. A partial failure
                    // must not lose earlier handles, even after observation retires.
                    scope=new CopyScope(copyInvocation.get(),pms,actualMonitor,actualSettings);
                    copyInvocation.set(scope);
                    for(String name:names) enlistCopyName(scope,name);
                }
            }
        }catch(Throwable error){revoke(error);}
        try {return chain.proceed();}
        finally {
            if(scope!=null) {
                try {
                    if(copyInvocation.get()!=scope)throw new IllegalStateException("Copy scope order changed");
                }catch(Throwable error){revoke(error);}
                finally {
                    scope.closed=true;
                    try {
                        if(scope.previous==null)copyInvocation.remove();else copyInvocation.set(scope.previous);
                    }catch(Throwable error){revoke(error);}
                    for(int index=scope.count-1;index>=0;index--)
                        try{scope.requests[index].close();}catch(Throwable error){revoke(error);}
                }
            }
        }
    }

    /** Observe the actual native lookup key without acquiring any PMS monitor. */
    private Object interceptLookup(XposedInterface.Chain chain) throws Throwable {
        CopyScope scope=null;
        String name=null;
        try {
            CopyScope current=copyInvocation.get();
            if(current!=null && failure.get()==null) {
                if(!profile.lookup.equals(chain.getExecutable()) || chain.getThisObject()!=current.settings
                        || chain.getArgs()==null || chain.getArgs().size()!=1)
                    throw new IllegalStateException("Copy lookup callback shape differs");
                name=copyName(chain.getArgs().get(0));
                requireCopyScope(current);
                enlistCopyName(current,name);
                scope=current;
            }
        }catch(Throwable error){revoke(error);}
        // Neither admission nor result validation may replace the exact native
        // return/Throwable. A throwing getter keeps its scope until copy finally.
        Object result=chain.proceed();
        if(scope!=null)try {
            requireCopyScope(scope);
            if(result!=null && (result.getClass()!=settingClass || !name.equals(settingName.get(result))))
                throw new IllegalStateException("Copy lookup returned a different live package");
        }catch(Throwable error){revoke(error);}
        return result;
    }

    private void enlistCopyName(CopyScope scope,String name) {
        for(int index=0;index<scope.count;index++)if(name.equals(scope.names[index]))return;
        if(scope.count==MAX_COPY_NAMES)throw new IllegalStateException("Copy lookup name capacity exhausted");
        // Both arrays already exist. Keep each returned handle before publishing
        // its name/count, so the outer finally retains every successful admission.
        scope.requests[scope.count]=ledger.beginPackageHeld(scope.pms,scope.monitor,name);
        scope.names[scope.count]=name;
        scope.count++;
    }
    private void requireCopyScope(CopyScope scope) throws IllegalAccessException {
        if(scope.closed || copyInvocation.get()!=scope || !Thread.holdsLock(scope.monitor))
            throw new IllegalStateException("Copy lookup requires its current native monitor");
        if(failure.get()!=null || !ledger.available())
            throw new IllegalStateException("Copy lookup observation revoked");
        if(monitor(scope.pms)!=scope.monitor || settings(scope.pms,scope.monitor)!=scope.settings)
            throw new IllegalStateException("Copy lookup native owner changed");
        Binding current=binding.get();
        if(current!=null && (current.pms!=scope.pms || current.monitor!=scope.monitor || !current.ready))
            throw new IllegalStateException("Copy lookup binding differs or is incomplete");
    }
    private Object settings(Object pms,Object actualMonitor) throws IllegalAccessException {
        Object value=pmsSettings.get(pms);
        if(value==null || value.getClass()!=settingsClass || settingsLock.get(value)!=actualMonitor)
            throw new IllegalStateException("Copy lookup Settings owner or monitor differs");
        return value;
    }

    private Field member(String owner,String name) {
        return Objects.requireNonNull(profile.fields.get(owner+"#"+name),"Missing fixed copy field");
    }
    private Object monitor(Object pms) throws IllegalAccessException {
        if(pms==null || pms.getClass()!=pmsClass)
            throw new IllegalStateException("Copy ingress PMS class differs");
        Object value=pmsLock.get(pms);
        if(value==null || value.getClass()!=pmsLock.getType() || pmsWriteLock.get(pms)!=value)
            throw new IllegalStateException("Copy ingress native monitors differ");
        return value;
    }
    /** Exact fields avoid calling overridable ParsedPackage getters under PMS. */
    private List<String> copyNames(Object parsed) throws IllegalAccessException {
        LinkedHashSet<String> names=new LinkedHashSet<>();
        names.add(copyName(packageName.get(parsed)));
        if((packageBooleans.getLong(parsed)&SYSTEM_PACKAGE)!=0) {
            Object originals=originalPackages.get(parsed);
            // Native parsing produces emptyList or a concrete ArrayList. Do not
            // run a caller-supplied List implementation under the native monitor.
            if(originals!=null && originals!=EMPTY_LIST) {
                if(originals.getClass()!=ArrayList.class)
                    throw new IllegalStateException("Copy ingress original-name container differs");
                List<?> list=(List<?>)originals;int size=list.size();
                if(size>MAX_ORIGINAL_NAMES)throw new IllegalStateException("Copy ingress original-name capacity");
                for(int index=0;index<size;index++)names.add(copyName(list.get(index)));
                if(list.size()!=size)throw new IllegalStateException("Copy ingress original names changed during read");
            }
        }
        return new ArrayList<>(names);
    }
    private static String copyName(Object value) {
        if(!(value instanceof String name) || name.isEmpty() || name.length()>255)
            throw new IllegalStateException("Copy ingress package name differs");
        // This is a native event key, not a user target selector or shell input.
        // In particular, system package android must participate in the scope.
        return name;
    }

    /** Never takes PMS or waits for original calls; a first failure is permanent. */
    void revoke(Throwable error) {
        Throwable cause=error==null?new IllegalStateException("Hidden ingress revoked"):error;
        failure.compareAndSet(null,cause);
        try {ledger.revoke(cause);}catch(Throwable secondary){revokeFailure.compareAndSet(null,secondary);}
    }

    /** Availability describes finite request bookkeeping, never ownership admission. */
    boolean available(){return installed && failure.get()==null && ledger.available();}

    private static void increment(AtomicLong counter,String exhausted) {
        for(;;) {
            long value=counter.get();
            if(value==Long.MAX_VALUE)throw new IllegalStateException(exhausted);
            if(counter.compareAndSet(value,value+1))return;
        }
    }

    String diagnostic() {
        int yes=0,no=0,threw=0;
        List<DeoptReceipt> receipts=deoptReceipts;
        for(DeoptReceipt receipt:receipts) {
            if(receipt.outcome==DeoptOutcome.RETURNED_TRUE)yes++;
            else if(receipt.outcome==DeoptOutcome.RETURNED_FALSE)no++;
            else threw++;
        }
        Throwable error=failure.get();Binding current=binding.get();
        String text="ROOT_HIDDEN_REQUEST_INGRESS state="+(error!=null?"UNAVAILABLE":installed?"OBSERVING":"NOT_INSTALLED")
                +" bound="+(current!=null&&current.ready)+" registration="+registration+"/"+permissionRegistration+"/"+copyRegistration+"/"+lookupRegistration
                +" deoptTrue="+yes+" deoptFalse="+no+" deoptThrow="+threw+" deoptExpected="+profile.callers.size()
                +" privateAccepted="+privateAccepted.get()+" deniedOrd="+deniedOrdinary.get()+" deniedOwn="+deniedPrivate.get()
                +" allCoverage=false ownershipAdmission=false failure="
                +(error==null?"none":RootEarlyModule.clean(error.getClass().getName()+":"+error.getMessage(),20))
                +" revokeFailure="+(revokeFailure.get()!=null);
        String requests=ledger.diagnostic();
        if(ownedAdapter!=null)text="ROOT_HIDDEN_REQUEST_INGRESS state="+(error!=null?"UNAVAILABLE":installed?"OBSERVING":"NOT_INSTALLED")
                +" bound="+(current!=null&&current.ready)+" reg="+registration.ordinal()+permissionRegistration.ordinal()
                +copyRegistration.ordinal()+lookupRegistration.ordinal()+" deopt="+yes+"/"+no+"/"+threw+"/"+profile.callers.size()
                +" private="+privateAccepted.get()+" denied="+deniedOrdinary.get()+"/"+deniedPrivate.get()
                +" coverage=false admission=false failure="+(error==null?"none":RootEarlyModule.clean(error.getClass().getName(),20))
                +" revoke="+(revokeFailure.get()!=null);
        String combined=text+"\n"+requests+(ownedAdapter==null?"":ownedAdapter.diagnostic());
        if(combined.length()>700 || !combined.endsWith("\n"))
            throw new IllegalStateException("Hidden ingress diagnostic budget or framing");
        for(int index=0;index<combined.length();index++) {
            char c=combined.charAt(index);
            if(c!='\n' && (c<32||c>126))throw new IllegalStateException("Hidden ingress diagnostic ASCII");
        }
        return combined;
    }
}
