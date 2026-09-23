package ls.augment.com;

import java.util.IdentityHashMap;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;

/**
 * One ledger keeps ordinary IPM and whole-package copy scopes open through the
 * native return. It grants no private exemption or restore authority. After
 * startup binding, the only nested lock order is PMS monitor, then the short
 * ledger lock. Original native bodies run outside these admission locks.
 */
final class RootHiddenRequestLedger {
    private static final Throwable REVOKED = new IllegalStateException("Request ledger revoked");
    private final Object control = new Object();
    private final int capacity;
    private final IdentityHashMap<Request, Boolean> active = new IdentityHashMap<>();
    private final AtomicReference<Throwable> failure = new AtomicReference<>();
    private volatile Binding binding;
    private volatile int activeCount;
    // Counts aggregate both request kinds, including distinct copy alias scopes.
    private volatile long opened, finished, imported, foreign;
    private boolean bindingAttempted;

    RootHiddenRequestLedger(int capacity) {
        if (capacity < 1 || capacity > 8192) throw new IllegalArgumentException("Request capacity");
        this.capacity = capacity;
    }

    Request begin(Object actualReceiver, int userId, String packageName) {
        return begin(actualReceiver, userId, packageName, false);
    }

    Request beginPackage(Object actualPms, String packageName) {
        return begin(actualPms, 0, packageName, true);
    }

    /** Native copy callbacks already hold this exact PMS lock; never acquire another. */
    Request beginPackageHeld(Object actualPms, Object actualMonitor, String packageName) {
        try {
            Objects.requireNonNull(actualPms, "Actual PMS receiver required");
            Objects.requireNonNull(actualMonitor, "Actual PMS monitor required");
            if (!Thread.holdsLock(actualMonitor))
                throw new IllegalStateException("Package request requires its held PMS monitor");
            HiddenOwnershipCore.requirePackageName(packageName);
            synchronized (control) {
                Binding current = binding;
                try {
                    requireAvailable();
                    if (current != null) {
                        // Check inside control: binding can publish after an
                        // adapter's earlier check. Do not wait for its monitor.
                        if (current.monitor != actualMonitor)
                            throw new IllegalStateException("Package request PMS monitor differs");
                        requireBinding(current);
                        if (!current.ready) throw new IllegalStateException("Request import incomplete");
                    }
                    return open(actualPms, 0, packageName, true, current);
                } catch (RuntimeException | Error error) {
                    revoke(error);
                    if (current != null && current.monitor == actualMonitor) failBound(current, error);
                    throw error;
                }
            }
        } catch (RuntimeException | Error error) { revoke(error); throw error; }
    }

    private Request begin(Object receiver, int userId, String packageName, boolean packageWide) {
        try {
            Objects.requireNonNull(receiver, "Actual request receiver required");
            if (packageWide) HiddenOwnershipCore.requirePackageName(packageName);
            for (;;) {
                Binding current = binding;
                if (current == null) {
                    synchronized (control) {
                        if (binding != null) continue;
                        requireAvailable();
                        return open(receiver, userId, packageName, packageWide, null);
                    }
                }
                synchronized (current.monitor) {
                    synchronized (control) {
                        try {
                            requireBinding(current);
                            requireAvailable();
                            if (!current.ready) throw new IllegalStateException("Request import incomplete");
                            return open(receiver, userId, packageName, packageWide, current);
                        } catch (RuntimeException | Error error) { failBound(current, error); throw error; }
                    }
                }
            }
        } catch (RuntimeException | Error error) { revoke(error); throw error; }
    }

    /** The enclosing adapter proves both actual native owners before binding. */
    void bind(Object actualIpm, Object actualPms, Object actualPmsMonitor, HiddenOwnershipCore core) {
        try {
            Objects.requireNonNull(actualIpm, "Actual IPM receiver required");
            Objects.requireNonNull(actualPms, "Actual PMS receiver required");
            Objects.requireNonNull(actualPmsMonitor, "Actual PMS monitor required");
            Objects.requireNonNull(core, "Fresh ownership core required");
            synchronized (actualPmsMonitor) {
                synchronized (control) {
                    try {
                        requireAvailable();
                        if (bindingAttempted || binding != null)
                            throw new IllegalStateException("Request ledger already bound or attempted");
                        bindingAttempted = true;
                        Binding created = new Binding(actualIpm, actualPms, actualPmsMonitor, core);
                        core.bindIngress(actualPmsMonitor, this);
                        // Retain the exact cleanup binding even if import fails.
                        // Admission waits for this critical section and ready.
                        binding = created;
                        for (Request request : active.keySet()) {
                            requireReceiver(request.receiver, request.packageWide, created);
                            request.coreRequest = createScope(request, created);
                            requireTracked(request.coreRequest);
                            imported = next(imported);
                        }
                        requireAvailable();
                        created.ready = true;
                    } catch (RuntimeException | Error error) {
                        // Include pre-import/duplicate/freshness failures: no
                        // other admission may observe available after unlock.
                        revoke(error);
                        Binding retained = binding;
                        if (retained != null && retained.monitor == actualPmsMonitor)
                            retained.core.revoke();
                        if (retained == null || retained.core != core) {
                            // revoke itself verifies monitor identity before any
                            // mutation. A foreign monitor cannot change this core.
                            try { core.revoke(); }
                            catch (RuntimeException | Error cleanup) { revoke(cleanup); }
                        }
                        throw error;
                    }
                }
            }
        } catch (RuntimeException | Error error) { revoke(error); throw error; }
    }

    /** Called with control, and (once bound) its actual PMS monitor. */
    private Request open(Object receiver, int userId, String packageName, boolean packageWide, Binding current) {
        if (current != null) requireReceiver(receiver, packageWide, current);
        if (active.size() >= capacity) throw new IllegalStateException("Request ledger capacity exhausted");
        long nextOpened = next(opened);
        Request request = new Request(receiver, userId, packageName, packageWide);
        try {
            active.put(request, Boolean.TRUE);
            if (current != null) {
                request.coreRequest = createScope(request, current);
                requireTracked(request.coreRequest);
            }
            opened = nextOpened;
            activeCount = active.size();
            return request;
        } catch (RuntimeException | Error error) {
            // The caller never received this request. Remove its record and
            // release any returned scope while still under the exact PMS lock.
            if (current != null) failBound(current, error);
            if (request.coreRequest != null) {
                try { request.coreRequest.close(); }
                catch (RuntimeException | Error cleanup) { revoke(cleanup); }
            }
            active.remove(request);
            activeCount = active.size();
            request.closed = true;
            throw error;
        }
    }

    private HiddenOwnershipCore.ExternalScope createScope(Request request, Binding current) {
        return request.packageWide ? current.core.externalPackageRequest(request.packageName)
                : current.core.externalRequest(request.userId, request.packageName);
    }
    private void requireReceiver(Object receiver, boolean packageWide, Binding current) {
        if (receiver != (packageWide ? current.pms : current.receiver)) {
            foreign = next(foreign);
            throw new IllegalStateException("Request receiver owner is unproven");
        }
    }
    private static void requireTracked(HiddenOwnershipCore.ExternalScope request) {
        if (request == null || !request.tracked())
            throw new IllegalStateException("Ownership request capacity exhausted");
    }

    final class Request implements AutoCloseable {
        private final Object receiver;
        private final int userId;
        private final String packageName;
        private final boolean packageWide;
        private HiddenOwnershipCore.ExternalScope coreRequest;
        private boolean closed;

        private Request(Object receiver, int userId, String packageName, boolean packageWide) {
            this.receiver = receiver; this.userId = userId;
            this.packageName = packageName; this.packageWide = packageWide;
        }

        @Override public void close() {
            try {
                synchronized (control) {
                    // Binding/import also owns control. A never-imported ticket
                    // needs no Core cleanup and must not wait for a foreign
                    // failed binding's PMS monitor. Never hold control for PMS.
                    if (closed) return;
                    if (coreRequest == null) { finish(null); return; }
                }
                for (;;) {
                    Binding current = binding;
                    if (current == null) {
                        synchronized (control) {
                            if (binding != null) continue;
                            finish(null);
                            return;
                        }
                    }
                    synchronized (current.monitor) {
                        synchronized (control) {
                            try {
                                requireBinding(current);
                                finish(current);
                                return;
                            } catch (RuntimeException | Error error) { failBound(current, error); throw error; }
                        }
                    }
                }
            } catch (RuntimeException | Error error) { revoke(error); throw error; }
        }

        private void finish(Binding current) {
            if (closed) return;
            if (!active.containsKey(this)) throw new IllegalStateException("Request record disappeared");
            // Claim closure first, so a failed/reentrant cleanup is never retried.
            closed = true;
            try {
                if (coreRequest != null) {
                    if (current == null) throw new IllegalStateException("Imported request lost its PMS binding");
                    coreRequest.close();
                }
            } finally {
                active.remove(this);
                activeCount = active.size();
            }
            finished = next(finished);
        }
    }

    private static final class Binding {
        final Object receiver, pms, monitor;
        final HiddenOwnershipCore core;
        volatile boolean ready;
        Binding(Object receiver, Object pms, Object monitor, HiddenOwnershipCore core) {
            this.receiver = receiver; this.pms = pms; this.monitor = monitor; this.core = core;
        }
    }

    private void requireBinding(Binding expected) {
        if (binding != expected || !Thread.holdsLock(expected.monitor))
            throw new IllegalStateException("Request PMS binding changed");
    }
    private void requireAvailable() {
        if (!available()) throw new IllegalStateException("Request observation unavailable");
    }
    private void failBound(Binding current, Throwable error) {
        // The failure is visible before releasing either binding/import lock.
        revoke(error);
        current.core.revoke();
    }
    private static long next(long value) {
        if (value == Long.MAX_VALUE) throw new IllegalStateException("Request counter exhausted");
        return value + 1;
    }
    /** Never waits for PMS, the ledger, a Handler, or native observer dispatch. */
    void revoke(Throwable reason) { failure.compareAndSet(null, reason == null ? REVOKED : reason); }
    boolean available() { return failure.get() == null; }
    String diagnostic() {
        Throwable error = failure.get();
        String type = error == null ? "none" : error.getClass().getName();
        StringBuilder safe = new StringBuilder(48);
        for (int index = 0; index < type.length() && index < 48; index++) {
            char value = type.charAt(index); safe.append(value >= 32 && value <= 126 ? value : '?');
        }
        return "ROOT_HIDDEN_REQUEST_LEDGER state=" + (error != null ? "UNAVAILABLE" : binding == null ? "UNBOUND" : "BOUND")
                + " active=" + activeCount + " opened=" + opened + " finished=" + finished
                + " imported=" + imported + " foreign=" + foreign
                + " ownershipAdmission=false failure=" + safe + "\n";
    }
}
