package ls.augment.com;

import java.util.EnumMap;
import java.util.EnumSet;
import java.util.Objects;
import java.util.Properties;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.locks.ReentrantLock;

/**
 * OFFLINE early coordination candidate; no Android or native service objects.
 * Structural activation is NOT ART, caller-deopt, quiescence or Root admission.
 * The external installer must prove those facts and keep the same domain alive.
 */
public final class RootLifecycleDomain {
    public enum Door { G1_CREATE, G2_FINAL_REMOVE, G3_DPMS_CREATE, R4_REMOVE_REQUEST }
    public enum HookPoint { G1_CREATE, G2_FINAL_REMOVE, G3_DPMS_CREATE, R4_REMOVE_REQUEST, K_KILL, KG_PROCESS_GROUP }
    public enum State { INSTALLING, LOCKING_ACTIVE, DRAINING, RETIRED, RELEASED }
    @FunctionalInterface public interface Original { Object call() throws Throwable; }
    public interface RootGuard {
        /** Must retain the failure in the enclosing transaction; called before any lifecycle original. */
        void onLifecycleRejected(Door door, Throwable failure) throws Throwable;
        /** The original asynchronous kill is deliberately not exposed in Root scope. */
        Object onKill(KillCall call) throws Throwable;
        /** Explicit synchronous process-group guard is required; old guards fail closed. */
        default Object onProcessGroupKill(ProcessGroupCall call) throws Throwable {
            throw new IllegalStateException("Root process-group guard is not implemented");
        }
    }
    public static final class KillCall {
        public final Object receiver;
        public final String packageName, reason;
        public final int appId, userId, reasonCode;
        public KillCall(Object receiver, String packageName, int appId, int userId, String reason, int reasonCode) {
            this.receiver=receiver; this.packageName=packageName; this.appId=appId;
            this.userId=userId; this.reason=reason; this.reasonCode=reasonCode;
        }
    }
    /** Unmodified OEM arguments; validation and native execution belong to the Root guard. */
    public static final class ProcessGroupCall {
        public final int uid, pid;
        public ProcessGroupCall(int uid, int pid) { this.uid=uid;this.pid=pid; }
    }
    public static final class LifecycleRejected extends IllegalStateException {
        public final Door door;
        private LifecycleRejected(Door door) { super("Lifecycle entered during Root lease: "+door);this.door=door; }
    }
    /** Issued only after all admitted Root and tracked ordinary callbacks have returned. */
    public static final class DrainToken {
        private final RootLifecycleDomain domain;
        private DrainToken(RootLifecycleDomain domain) { this.domain=domain; }
    }

    // Java process memory only, not Android properties, settings, environment or disk.
    private static final String ANCHOR_KEY="ls.augment.root.lifecycle.domain.v1";
    private final String anchorId=UUID.randomUUID().toString();
    private final Object installationOwner;
    private final ThreadFactory notifierFactory;
    private final Object stateLock=new Object();
    private final ReentrantLock gate=new ReentrantLock();
    private final ThreadLocal<Lease> current=new ThreadLocal<>();
    private final EnumMap<HookPoint,Object> installed=new EnumMap<>(HookPoint.class);
    private final EnumSet<HookPoint> unhooked=EnumSet.noneOf(HookPoint.class);
    private final CompletableFuture<DrainToken> drained=new CompletableFuture<>();
    private volatile State state=State.INSTALLING;
    private volatile Lease activeRoot;
    private boolean lockingActivated;
    private int callbacks;
    private DrainToken drainToken;
    private boolean notificationInFlight;
    private volatile Throwable notificationFailure;

    private RootLifecycleDomain(Object owner, ThreadFactory notifierFactory) {
        installationOwner=Objects.requireNonNull(owner);this.notifierFactory=Objects.requireNonNull(notifierFactory);
    }

    /**
     * Refuses a second domain even across class loaders. Reuse the existing Java
     * object; if its old type cannot be reused, the old coordinator must finish
     * drain + successful unhook before a new loader can create a replacement.
     */
    public static RootLifecycleDomain create(Object installationOwner) {
        return create(installationOwner,task -> new Thread(task,"lsa-domain-drained"));
    }
    // Package-private fault seam; public construction always uses a fresh real Java thread.
    static RootLifecycleDomain create(Object installationOwner, ThreadFactory notifierFactory) {
        RootLifecycleDomain domain=new RootLifecycleDomain(installationOwner,notifierFactory);
        Properties memory=System.getProperties();
        synchronized(memory) {
            if(memory.containsKey(ANCHOR_KEY))throw new IllegalStateException("Another lifecycle domain is still retained");
            memory.put(ANCHOR_KEY,domain.anchorId);
        }
        return domain;
    }

    /** A successful handle receipt, not a claim that the Hook or compiled callers are effective. */
    public void recordInstalled(Object owner, HookPoint point, Object exactHandle) {
        requireInstaller(owner);Objects.requireNonNull(point);Objects.requireNonNull(exactHandle);
        synchronized(stateLock) {
            if(state!=State.INSTALLING)throw new IllegalStateException("Installation phase has ended");
            if(installed.containsKey(point))throw new IllegalStateException("Hook point already recorded");
            for(Object handle:installed.values())if(handle==exactHandle)throw new IllegalArgumentException("One handle cannot cover distinct hooks");
            installed.put(point,exactHandle);
        }
    }

    /**
     * Enables ordinary locking only as a complete set, with no earlier transparent
     * callback left in flight. This is structural activation, never runtime READY.
     * BEFORE calling, the installer must independently prove effective callbacks,
     * caller/deopt coverage and the early activation window. Those facts protect
     * ordinary lifecycle lock order too, even if no Root lease will be admitted.
     * No real issuer is implemented here; current offline tests supply a model.
     */
    public boolean activate(Object owner) {
        requireInstaller(owner);
        synchronized(stateLock) {
            if(state!=State.INSTALLING)return false;
            if(installed.size()!=HookPoint.values().length || callbacks!=0 || activeRoot!=null)return false;
            lockingActivated=true;
            state=State.LOCKING_ACTIVE;
            return true;
        }
    }

    /** No wait for G, no guard callback, no native objects, and no transferable owner token. */
    public Lease tryLease(Object owner, RootGuard guard) {
        Objects.requireNonNull(owner);Objects.requireNonNull(guard);
        Lease lease=new Lease(owner,guard);
        synchronized(stateLock) {
            if(state!=State.LOCKING_ACTIVE || activeRoot!=null || current.get()!=null
                    || gate.isHeldByCurrentThread() || !gate.tryLock())return null;
            try {
                current.set(lease);
                activeRoot=lease;
                return lease;
            } catch(Throwable failure) {
                current.remove();gate.unlock();throw failure;
            }
        }
    }

    public Object lifecycle(Door door, Original original) throws Throwable {
        Objects.requireNonNull(door);Objects.requireNonNull(original);
        Callback callback=enter();
        boolean locked=false;
        try {
            Lease lease=current.get();
            if(lease!=null) {
                Throwable failure=lease.remember(new LifecycleRejected(door));
                try { lease.guard.onLifecycleRejected(door,failure); }
                catch(Throwable guardFailure) { lease.remember(guardFailure); }
                throw failure; // A returning/throwing guard cannot authorize the original.
            }
            if(callback.locking && door!=Door.R4_REMOVE_REQUEST) { gate.lock();locked=true; }
            return original.call();
        } finally {
            if(locked)gate.unlock();
            leave(callback);
        }
    }

    public Object kill(KillCall call, Original original) throws Throwable {
        Objects.requireNonNull(call);Objects.requireNonNull(original);
        Callback callback=enter();
        try {
            Lease lease=current.get();
            if(lease==null)return original.call();
            try {
                lease.requireCurrent(lease.owner);
                return lease.guard.onKill(call);
            } catch(Throwable failure) {
                throw lease.remember(failure); // No original queue fallback in Root scope.
            }
        } finally { leave(callback); }
    }

    /**
     * Reject-only adapter seam for failures before a carrier reaches the normal route.
     * Only this thread's existing Root lease remembers the first error; ordinary and
     * other-thread callers get the original error without acquiring G or calling a guard.
     */
    public Throwable rememberCurrentRootFailure(Throwable failure) {
        Objects.requireNonNull(failure);
        Lease lease=current.get();
        return lease==null?failure:lease.remember(failure);
    }

    /** Same-thread Root route only; ordinary callers keep their original dispatch behavior. */
    public Object processGroupKill(ProcessGroupCall call, Original original) throws Throwable {
        Objects.requireNonNull(call);Objects.requireNonNull(original);
        Callback callback=enter();
        try {
            Lease lease=current.get();
            if(lease==null)return original.call();
            try {
                lease.requireCurrent(lease.owner);
                return lease.guard.onProcessGroupKill(call);
            } catch(Throwable failure) {
                throw lease.remember(failure); // Never queue the original after a Root boundary failure.
            }
        } finally { leave(callback); }
    }

    /**
     * Stops new Root leases now; never interrupts an existing lease or original.
     * Active ordinary callbacks retain G until the last tracked callback returns.
     * In partial installation they stay transparent, including while draining.
     */
    public CompletionStage<DrainToken> stopNewRoots() {
        DrainToken notification;
        synchronized(stateLock) {
            if(state==State.INSTALLING || state==State.LOCKING_ACTIVE)state=State.DRAINING;
            notification=retireIfEmptyLocked();
            if(notification==null && state==State.RETIRED)notification=drainToken;
        }
        notifyDrained(notification);
        // A caller may cancel/complete its own view, never the retained internal future.
        return drained.thenApply(token -> token);
    }

    /** Only after the exact external handle.unhook completed normally. A failure keeps the receipt absent. */
    public void recordUnhooked(Object owner, DrainToken token, HookPoint point, Object exactHandle) {
        requireInstaller(owner);Objects.requireNonNull(point);Objects.requireNonNull(exactHandle);
        synchronized(stateLock) {
            requireDrainTokenLocked(token);
            if(installed.get(point)!=exactHandle)throw new IllegalArgumentException("Unhook receipt does not match installed handle");
            unhooked.add(point);
        }
    }

    /** External unhook completion releases only this domain's process marker. */
    public void acknowledgeUnhook(Object owner, DrainToken token) {
        requireInstaller(owner);
        synchronized(stateLock) {
            requireDrainTokenLocked(token);
            if(unhooked.size()!=installed.size())throw new IllegalStateException("Some installed hooks are still retained");
            Properties memory=System.getProperties();
            synchronized(memory) {
                if(!anchorId.equals(memory.get(ANCHOR_KEY)))throw new IllegalStateException("Process anchor changed");
                memory.remove(ANCHOR_KEY);
            }
            state=State.RELEASED;
        }
    }

    public State state() { return state; }
    /** Last notification resource failure. It never means unhook/release completed. */
    public Throwable notificationFailure() { return notificationFailure; }

    private void requireInstaller(Object owner) {
        if(owner!=installationOwner)throw new IllegalArgumentException("Foreign installation owner");
    }
    private void requireDrainTokenLocked(DrainToken token) {
        if(state!=State.RETIRED || token==null || token.domain!=this || token!=drainToken)
            throw new IllegalStateException("No matching retired domain token");
    }
    private static final class Callback {
        final boolean tracked,locking;
        Callback(boolean tracked,boolean locking) { this.tracked=tracked;this.locking=locking; }
    }
    private Callback enter() {
        synchronized(stateLock) {
            boolean tracked=state!=State.RETIRED && state!=State.RELEASED;
            if(tracked)callbacks++;
            return new Callback(tracked,tracked && lockingActivated);
        }
    }
    private void leave(Callback callback) {
        if(!callback.tracked)return;
        DrainToken notification;
        synchronized(stateLock) {
            if(--callbacks<0)throw new AssertionError("Callback accounting underflow");
            notification=retireIfEmptyLocked();
        }
        notifyDrained(notification);
    }
    private DrainToken retireIfEmptyLocked() {
        if(state!=State.DRAINING || activeRoot!=null || callbacks!=0)return null;
        state=State.RETIRED;
        drainToken=new DrainToken(this);
        return drainToken;
    }
    private void notifyDrained(DrainToken token) {
        if(token==null)return;
        synchronized(stateLock) {
            if(state!=State.RETIRED || token!=drainToken || drained.isDone() || notificationInFlight)return;
            notificationInFlight=true;
        }
        // Always a separate thread: even an ordinary callback's upstream caller
        // may still hold an official lock that this Android-free class cannot see.
        Thread caller=Thread.currentThread();
        try {
            Thread notifier=Objects.requireNonNull(notifierFactory.newThread(() -> {
                try {
                    if(Thread.currentThread()==caller)throw new IllegalStateException("Drain notification must be asynchronous");
                    drained.complete(token);
                } catch(Throwable failure) { notificationFailure=failure; }
                finally { synchronized(stateLock) { notificationInFlight=false; } }
            }));
            if(notifier.getState()!=Thread.State.NEW)throw new IllegalStateException("Drain notifier was already started");
            notifier.setDaemon(true);
            notifier.start();
        } catch(Throwable failure) {
            // Retain the domain and the uncompleted internal future. A subsequent
            // stopNewRoots retries notification; ordinary original results survive.
            notificationFailure=failure;
            synchronized(stateLock) { notificationInFlight=false; }
        }
    }

    public final class Lease implements AutoCloseable {
        private final Object owner;
        private final RootGuard guard;
        private final Thread thread=Thread.currentThread();
        private volatile Throwable failure;
        private boolean closed;
        private Lease(Object owner, RootGuard guard) { this.owner=owner;this.guard=guard; }
        private Throwable remember(Throwable error) { if(failure==null)failure=error;return failure; }
        public Throwable failure() { return failure; }
        private void requireOwnership(Object expectedOwner) {
            if(expectedOwner!=owner || Thread.currentThread()!=thread || current.get()!=this
                    || activeRoot!=this || closed || !gate.isHeldByCurrentThread() || gate.getHoldCount()!=1)
                throw new IllegalStateException("Inactive or foreign Root lease");
        }
        public void requireCurrent(Object expectedOwner) {
            requireOwnership(expectedOwner);
            if(failure!=null)throw new IllegalStateException("Sticky Root boundary failure",failure);
        }
        @Override public void close() { close(null); }
        /** Only the first successful close invokes this callback; callback exceptions do not retain G. */
        public void close(Runnable afterRelease) {
            if(Thread.currentThread()!=thread)throw new IllegalStateException("Lease cannot close on another thread");
            if(closed)return;
            requireOwnership(owner);
            closed=true;
            current.remove();
            gate.unlock();
            DrainToken notification;
            synchronized(stateLock) {
                if(activeRoot!=this)throw new AssertionError("Root accounting changed");
                activeRoot=null;
                notification=retireIfEmptyLocked();
            }
            notifyDrained(notification);
            if(afterRelease!=null)afterRelease.run();
        }
    }
}
