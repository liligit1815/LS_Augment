package ls.augment.com;

import android.util.SparseArray;
import io.github.libxposed.api.XposedInterface;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Actual native notification registration, deliberately not recovery authority.
 * The atomic commit and ordinary same-value request fence must also be connected
 * before observations can authorize a restore. Nothing here writes package state.
 */
final class RootOwnershipObservation {
    private static final String PMS = "com.android.server.pm.PackageManagerService";
    private static final String SETTINGS = "com.android.server.pm.Settings";
    private static final String PACKAGE = "com.android.server.pm.PackageSetting";
    private static final String SETTING_BASE = "com.android.server.pm.SettingBase";
    private static final String PARSED = "com.android.internal.pm.parsing.pkg.AndroidPackageInternal";
    private static final String USER_STATE = "com.android.server.pm.pkg.PackageUserStateImpl";
    private static final String WATCHABLE = "com.android.server.utils.Watchable";
    private static final String WATCHER = "com.android.server.utils.Watcher";
    private static final String MAP = "com.android.server.utils.WatchedArrayMap";
    private static final int MAX_TARGETS = 8192, MAX_OBJECTS = MAX_TARGETS * 2 + 2;

    private final RootOwnershipProfile.Resolved profile;
    private final RootWatcherBridgeFactory factory;
    private final RootHiddenRequestIngress requests;
    private final String requestFailure;
    private final AtomicReference<Throwable> failure = new AtomicReference<>();
    private volatile String state = "PREPARED";
    private volatile int targetCount, objectCount;
    private volatile long packageSignals, userStateSignals, mapSignals, unlockedSignals;
    private final AtomicLong propagatedMapSignals = new AtomicLong();
    private final AtomicLong retiredObjectSignals = new AtomicLong();
    private Bound bound;

    private RootOwnershipObservation(RootOwnershipProfile.Resolved profile, RootWatcherBridgeFactory factory,
            RootHiddenRequestIngress requests, String requestFailure) {
        this.profile = profile;
        this.factory = factory;
        this.requests = requests;
        this.requestFailure = requestFailure;
    }

    static RootOwnershipObservation prepare(XposedInterface module, ClassLoader services,
            RootOwnershipProfile.Resolved profile, String profileFailure) {
        return prepare(module, services, profile, profileFailure, null, "not connected");
    }

    static RootOwnershipObservation prepare(XposedInterface module, ClassLoader services,
            RootOwnershipProfile.Resolved profile, String profileFailure,
            RootHiddenRequestIngress requests, String requestFailure) {
        RootWatcherBridgeFactory factory = null;
        Throwable error = null;
        try {
            if (profile == null) throw new IllegalStateException("Native observation profile unavailable: " + profileFailure);
            factory = RootWatcherBridgeFactory.load(module, services, profile.type(WATCHER), profile.type(WATCHABLE));
        } catch (Throwable unavailable) { error = unavailable; }
        RootOwnershipObservation observation = new RootOwnershipObservation(profile, factory, requests, requestFailure);
        if (error != null) observation.fail(error);
        return observation;
    }

    /** Identity binding only. Registration waits for the actual startup-owner check. */
    synchronized Bound bind(Object pms, Object monitor) {
        if (failed()) return null;
        try {
            if (bound != null) throw new IllegalStateException("Native observer already bound");
            exact(pms, profile.type(PMS));
            if (monitor == null || member(PMS, "mLock").get(pms) != monitor
                    || member(PMS, "mPackageStateWriteLock").get(pms) != monitor)
                throw new IllegalStateException("Observer PMS monitor differs");
            Object settings = member(PMS, "mSettings").get(pms);
            exact(settings, profile.type(SETTINGS));
            if (member(SETTINGS, "mLock").get(settings) != monitor)
                throw new IllegalStateException("Observer Settings monitor differs");
            Object packages = member(SETTINGS, "mPackages").get(settings);
            exact(packages, profile.type(MAP));
            Object loadedPackages = member(PMS, "mPackages").get(pms);
            exact(loadedPackages, profile.type(MAP));
            if (loadedPackages == packages) throw new IllegalStateException("Native package maps are aliased");
            bound = new Bound(pms, settings, packages, loadedPackages, monitor);
            state = "BOUND_NOT_REGISTERED";
            return bound;
        } catch (Throwable error) { fail(error); return null; }
    }

    final class Bound {
        private final Object pms, settings, packages, loadedPackages, monitor;
        private final HiddenOwnershipCore core;
        // Mutated only under the actual PMS monitor. Old objects are retained
        // within a fixed budget; no callback removes an observer during dispatch.
        private final IdentityHashMap<Object, Registration> watchers = new IdentityHashMap<>();
        private final Map<String, Target> targets = new LinkedHashMap<>();
        private final Method register, registered, get;
        private boolean started;

        private Bound(Object pms, Object settings, Object packages, Object loadedPackages, Object monitor) throws ReflectiveOperationException {
            this.pms = pms; this.settings = settings; this.packages = packages; this.monitor = monitor;
            this.loadedPackages = loadedPackages;
            core = new HiddenOwnershipCore(monitor, MAX_TARGETS);
            String owner = "Lcom/android/server/utils/Watchable;->";
            register = profile.method(owner + "registerObserver(Lcom/android/server/utils/Watcher;)V");
            registered = profile.method(owner + "isRegisteredObserver(Lcom/android/server/utils/Watcher;)Z");
            get = profile.method("Lcom/android/server/utils/WatchedArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;");
        }

        /** Called only after RootStartupBinding verified the bound PMS/AMS/UMS identities. */
        void start() {
            if (failed()) return;
            try {
                synchronized (monitor) {
                    requireBinding();
                    if (started) return;
                    observe(packages);
                    observe(loadedPackages);
                    requireBinding();
                    started = true;
                    state = "OBSERVING";
                }
            } catch (Throwable error) { fail(error); }
        }

        /** Same verified startup owner as start(); imports each still-open early request. */
        void bindRequests(Object ipm, RootNativeBridge.Bound bridge) {
            if (failed() || requests == null) return;
            try {
                synchronized (monitor) {
                    requireBinding();
                    if (!started) throw new IllegalStateException("Request binding before native observer startup");
                    requests.bind(ipm, monitor, core, bridge);
                    requests.attachObservation(ipm, monitor, core, bridge, this);
                }
            } catch (Throwable error) { fail(error); }
        }

        Object privateHide(RootTransactionEngine.Frame frame, RootNativeBridge.Bound bridge,
                Object ipm, RootHiddenRequestIngress.NativeCall original) throws Throwable {
            if(requests==null||failed())throw new IllegalStateException("Hide has no current native observer");
            if(frame.restoring())throw new IllegalStateException("Hide requires its own prepared frame");
            return requests.withPrivateHide(frame, bridge, ipm, original);
        }

        /** Strict mutation preparation; a silent track failure can never reach STOP. */
        RootHiddenRequestIngress.HidePreparation preparePrivateHide(RootTransactionEngine.Frame frame,
                RootNativeBridge.Bound bridge) throws Throwable {
            frame.requireHidePreparationScope(bridge);
            if(requests==null||failed())throw new IllegalStateException("Hide has no available ownership observation");
            synchronized(monitor) {
                try {
                    trackLocked(frame.instance,frame.userId(),frame.serial(),frame.packageName(),frame.appId());
                    frame.requireHidePreparationScope(bridge);
                } catch(Throwable error) {fail(error);throw error;}
                // A finite resource refusal rejects this request; it must not
                // revoke unrelated existing sources as a registration failure.
                return requests.preparePrivateHide(frame,bridge,this);
            }
        }
        void requirePrivateHidePrepared(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
                RootHiddenRequestIngress.HidePreparation preparation) throws Throwable {
            if(requests==null||failed())throw new IllegalStateException("Hide preparation lost native observation");
            requests.requirePrivateHidePrepared(frame,bridge,preparation);
        }
        void releasePrivateHidePreparation(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
                RootHiddenRequestIngress.HidePreparation preparation) {
            if(preparation==null)return;
            if(requests==null)throw new IllegalStateException("Hide preparation cleanup lost its ingress");
            requests.releasePrivateHidePreparation(frame,bridge,preparation);
        }

        RootHiddenRequestIngress.ConfirmedHide captureRestoreSource(RootNativeBridge.Bound bridge,
                HideRootProtocol.Request request) {
            return failed()||requests==null?null:requests.captureRestoreSource(bridge,this,request);
        }

        boolean validateRestoreOwnership(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
                RootHiddenRequestIngress.ConfirmedHide source) throws Throwable {
            if(requests==null||failed())return false;
            return requests.validateRestoreOwnership(frame,bridge,source);
        }

        Object privateRestore(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
                Object ipm,RootHiddenRequestIngress.NativeCall original) throws Throwable {
            if(requests==null||failed())throw new IllegalStateException("Restore has no current native observer");
            if(!frame.restoring())throw new IllegalStateException("Restore requires its own frame");
            return requests.withPrivateHide(frame,bridge,ipm,original);
        }

        boolean completePrivateRestore(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
                RootHiddenRequestIngress.PendingRestore pending) throws Throwable {
            if(requests==null||pending==null)throw new IllegalStateException("Restore lost its request ingress");
            return requests.completePrivateRestore(frame,bridge,pending);
        }

        void discardPrivateRestore(RootTransactionEngine.Frame frame,RootNativeBridge.Bound bridge,
                RootHiddenRequestIngress.PendingRestore pending) {
            if(pending==null)return;
            try {
                if(requests==null)throw new IllegalStateException("Restore cleanup lost its ingress");
                requests.discardPrivateRestore(frame,bridge,pending);
            }catch(Throwable error){fail(error);}
        }

        /** The adapter must use this observer's actual startup-bound state graph. */
        void requireOwnershipBinding(RootHiddenRequestIngress ingress, Object actualPms,
                Object actualMonitor, HiddenOwnershipCore actualCore) throws Throwable {
            requireMonitor();
            requireBinding();
            if (!started || requests != ingress || pms != actualPms || monitor != actualMonitor || core != actualCore)
                throw new IllegalStateException("Native ownership observer binding differs");
        }

        boolean completePrivateHide(RootTransactionEngine.Frame frame, RootNativeBridge.Bound bridge,
                RootHiddenRequestIngress.PendingHide pending) throws Throwable {
            if (pending == null) return false;
            if (requests == null) throw new IllegalStateException("Pending hide has no bound request ingress");
            return requests.completePrivateHide(frame, bridge, pending);
        }

        void discardPrivateHide(RootTransactionEngine.Frame frame, RootNativeBridge.Bound bridge,
                RootHiddenRequestIngress.PendingHide pending) {
            if (pending == null) return;
            try {
                if (requests == null) throw new IllegalStateException("Pending hide lost its request ingress");
                requests.discardPrivateHide(frame, bridge, pending);
            } catch (Throwable error) { fail(error); }
        }

        /** The enclosing bridge has checked the exact Engine Frame and live user lease. */
        void track(Object user, int userId, long serial, String name, int expectedAppId) {
            if (failed()) return;
            try {
                synchronized (monitor) {
                    trackLocked(user,userId,serial,name,expectedAppId);
                }
            } catch (Throwable error) { fail(error); }
        }

        private void trackLocked(Object user,int userId,long serial,String name,int expectedAppId) throws Throwable {
            requireMonitor();
            requireBinding();
            long generation = mapSignals;
            HiddenOwnershipCore.Target target=new HiddenOwnershipCore.Target(userId,serial,name);
            HiddenOwnershipCore.Live live=readLive(user,target,expectedAppId);
            String key=userId+":"+name;
            if(!targets.containsKey(key)&&targets.size()>=MAX_TARGETS)
                throw new IllegalStateException("Native observation target capacity reached");
            requireRegistered(packages);
            requireRegistered(loadedPackages);
            observe(live.pkg);
            observe(live.state);
            HiddenOwnershipCore.Live checked = readLive(user,target,expectedAppId);
            requireRegistered(packages);
            requireRegistered(loadedPackages);
            requireRegistered(live.pkg);
            requireRegistered(live.state);
            requireBinding();
            // Registration/readback can reenter a native map callback. Equal
            // final references do not cancel that event or rearm a partial set.
            if(generation != mapSignals || !live.sameInstance(checked))
                throw new IllegalStateException("Native target changed during observer registration");
            targets.put(key,new Target(user,serial,live.pkg,live.state,generation));
            targetCount=targets.size();
        }

        /**
         * Read-only input to the exact native commit. The caller must retain
         * the actual Engine Frame/user lifecycle lease and pass its current user
         * instance; this probe cannot establish or extend that lease. PMS must
         * remain held across the probe and the narrow native commit, never IPM.
         */
        HiddenOwnershipCore.Live probe(Object user, HiddenOwnershipCore.Target target, int expectedAppId) throws Throwable {
            requireMonitor();
            try {
                requireBinding();
                Target tracked = targets.get(target.slot());
                if (tracked == null || tracked.user != user || tracked.serial != target.serial
                        || tracked.generation != mapSignals)
                    throw new IllegalStateException("Native probe user instance is not the tracked target");
                HiddenOwnershipCore.Live live = readLive(user, target, expectedAppId);
                if (tracked.pkg != live.pkg || tracked.state != live.state)
                    throw new IllegalStateException("Native probe package instance changed");
                requireRegistered(packages);
                requireRegistered(loadedPackages);
                requireRegistered(live.pkg);
                requireRegistered(live.state);
                requireBinding();
                if (tracked != targets.get(target.slot()) || tracked.generation != mapSignals)
                    throw new IllegalStateException("Native probe observation generation changed");
                return live;
            } catch (Throwable error) {
                fail(error);
                core.revoke(); // Safe convergence of an atomic failure only while already holding PMS.
                throw error;
            }
        }

        private HiddenOwnershipCore.Live readLive(Object user, HiddenOwnershipCore.Target target, int expectedAppId) throws Throwable {
            requireMonitor();
            if (!started || user == null)
                throw new IllegalStateException("Observer target is not a bound live user");
            Object pkg = invoke(get, packages, target.packageName);
            exact(pkg, profile.type(PACKAGE));
            if (!target.packageName.equals(member(PACKAGE, "mName").get(pkg))
                    || member(PACKAGE, "mAppId").getInt(pkg) != expectedAppId || expectedAppId < 10000)
                throw new IllegalStateException("Observer live package identity differs");
            // The known uninstall path removes this mapping under PMS before it
            // clears PackageSetting.pkg outside PMS. Settings alone is too late.
            Object parsed = invoke(get, loadedPackages, target.packageName);
            if (parsed == null || !profile.type(PARSED).isInstance(parsed)
                    || member(PACKAGE, "pkg").get(pkg) != parsed)
                throw new IllegalStateException("Loaded and configured APK identities differ");
            Object raw = member(PACKAGE, "mUserStates").get(pkg);
            exact(raw, SparseArray.class);
            Object perUser = ((SparseArray<?>) raw).get(target.userId);
            exact(perUser, profile.type(USER_STATE));
            if (member(USER_STATE, "mWatchable").get(perUser) != pkg)
                throw new IllegalStateException("Native per-user state parent differs");
            int bits = member(USER_STATE, "mBooleans").getInt(perUser);
            HiddenOwnershipCore.Live live = new HiddenOwnershipCore.Live(user, pkg, perUser, parsed, expectedAppId,
                    member(USER_STATE, "mFirstInstallTimeMillis").getLong(perUser),
                    member(USER_STATE, "mCeDataInode").getLong(perUser),
                    member(USER_STATE, "mDeDataInode").getLong(perUser),
                    (bits & 0x1) != 0, (member(SETTING_BASE, "mPkgFlags").getInt(pkg) & 0x1) != 0,
                    (bits & 0x8) != 0);
            if (!live.ordinaryInstalled()) throw new IllegalStateException("Native target is not an installed ordinary application");
            return live;
        }

        private void requireRegistered(Object object) throws Throwable {
            requireMonitor();
            Registration registration = watchers.get(object);
            if (registration == null || !registration.active
                    || !Boolean.TRUE.equals(invoke(registered, object, registration.watcher))
                    || !registration.active)
                throw new IllegalStateException("Native observer registration disappeared");
        }

        private void observe(Object object) throws Throwable {
            requireMonitor();
            Registration existing = watchers.get(object);
            if (existing != null) {
                long generation = mapSignals;
                if (!Boolean.TRUE.equals(invoke(registered, object, existing.watcher))
                        || generation != mapSignals)
                    throw new IllegalStateException("Native observer registration disappeared");
                // Rearm only for a new, fully checked tracking attempt. This
                // changes no Core claim, receipt, revision or preparation.
                existing.active = true;
                return;
            }
            if (watchers.size() >= MAX_OBJECTS) throw new IllegalStateException("Native observation object capacity reached");
            Registration registration = new Registration(object, object == packages || object == loadedPackages);
            Object watcher = factory.create(what -> changed(registration, what), RootOwnershipObservation.this::fail);
            registration.watcher = watcher;
            // Retain even a partially registered watcher; an exception is not a
            // reason to retry register and possibly receive duplicate callbacks.
            watchers.put(object, registration);
            objectCount = watchers.size();
            invoke(register, object, watcher);
            if (!Boolean.TRUE.equals(invoke(registered, object, watcher)))
                throw new IllegalStateException("Native observer registration not confirmed");
        }

        private void changed(Registration registration, Object what) {
            if (failed()) return;
            // Core invalidation precedes this volatile publication. A retired
            // callback has no current ownership to protect and must not acquire
            // PMS while native dispatch holds its own observer-list monitor.
            if (!registration.active) {
                retiredObjectSignals.updateAndGet(value -> value == Long.MAX_VALUE ? value : value + 1);
                return;
            }
            Object watched = registration.object;
            // The global map forwards changes of every child, including packages
            // outside our tracked targets. That forwarding is not a map mutation.
            // Each tracked package/state has its own direct watcher below. This
            // diagnostic counter therefore needs neither PMS nor ownership state.
            boolean map = registration.map;
            if (map && what != null && what != watched) {
                propagatedMapSignals.updateAndGet(value -> value == Long.MAX_VALUE ? value : value + 1);
                return;
            }
            // Native dispatch owns its observer-list monitor. Acquiring PMS here
            // could invert the native lock order; publish failure without locking.
            if (!Thread.holdsLock(monitor)) {
                unlockedSignals++;
                fail(new IllegalStateException("Native state notification without PMS monitor: watched="
                        + watched.getClass().getName() + " what=" + (what == null ? "null" : what.getClass().getName())
                        + " thread=" + Thread.currentThread().getName()));
                return;
            }
            if (map) {
                // Map child forwarding is not a remove/replace of the map itself.
                if (what == watched) {
                    mapSignals = increment(mapSignals);
                    core.liveMapCleared(); // No precise key in native map callback; never adopt an ABA mapping.
                    // All old claims/preparations are already unusable. Retain
                    // native registrations within the existing object budget;
                    // never unregister from inside native notification dispatch.
                    for (Registration old : watchers.values()) if (!old.map) old.active = false;
                    targets.clear();
                    targetCount = 0;
                }
                else fail(new IllegalStateException("Null native map notification"));
            } else if (what != watched) {
                fail(new IllegalStateException("Native state notification source differs"));
            } else if (watched.getClass().getName().equals(PACKAGE)) {
                packageSignals = increment(packageSignals);
                core.objectChanged(watched);
            } else if (watched.getClass().getName().equals(USER_STATE)) {
                userStateSignals = increment(userStateSignals);
                core.objectChanged(watched);
            } else {
                fail(new IllegalStateException("Unrecognized native observation source"));
            }
        }

        private void requireBinding() throws ReflectiveOperationException {
            requireMonitor();
            if (failed() || requests != null && !requests.available()
                    || member(PMS, "mSettings").get(pms) != settings
                    || member(SETTINGS, "mPackages").get(settings) != packages
                    || member(PMS, "mPackages").get(pms) != loadedPackages
                    || member(PMS, "mLock").get(pms) != monitor
                    || member(PMS, "mPackageStateWriteLock").get(pms) != monitor
                    || member(SETTINGS, "mLock").get(settings) != monitor) {
                core.revoke();
                throw new IllegalStateException("Native observation binding is no longer current");
            }
        }

        private void requireMonitor() {
            if (!Thread.holdsLock(monitor)) throw new IllegalStateException("Bound PMS monitor required");
        }
    }

    private static final class Registration {
        final Object object;
        final boolean map;
        Object watcher; // Assigned once under PMS, before native registration.
        volatile boolean active = true;
        Registration(Object object, boolean map) { this.object = object; this.map = map; }
    }

    private record Target(Object user, long serial, Object pkg, Object state, long generation) { }

    private Field member(String owner, String name) throws NoSuchFieldException { return profile.field(owner + "#" + name); }
    private long increment(long count) {
        if (count == Long.MAX_VALUE) { fail(new IllegalStateException("Native observation counter exhausted")); return count; }
        return count + 1;
    }
    private boolean failed() { return failure.get() != null || factory != null && factory.failure() != null; }
    private void fail(Throwable error) {
        failure.compareAndSet(null, error);
        state = "UNAVAILABLE";
        if (requests != null) requests.revoke(error); // Atomic publication only; never acquires PMS from a watcher.
    }
    void revoke() { fail(new IllegalStateException("Owning Root runtime generation revoked")); }

    String diagnostic() {
        Throwable error = failure.get();
        if (error == null && factory != null) error = factory.failure();
        String line = "ROOT_NATIVE_OBSERVATION state=" + (error == null ? state : "UNAVAILABLE")
                + " targets=" + targetCount + " objects=" + objectCount
                + " packageSignals=" + packageSignals + " userStateSignals=" + userStateSignals
                + " mapSignals=" + mapSignals + " propagatedMapSignals=" + propagatedMapSignals.get()
                + " retiredObjectSignals=" + retiredObjectSignals.get()
                + " unlockedSignals=" + unlockedSignals + " ownershipAdmission=false"
                + " failure=" + (error == null ? "none" : RootEarlyModule.clean(error.getClass().getName() + ":" + error.getMessage(), 240)) + "\n";
        String requestLine = requests == null
                ? "ROOT_HIDDEN_REQUEST_INGRESS state=UNAVAILABLE ownershipAdmission=false failure="
                    + RootEarlyModule.clean(requestFailure, 240) + "\n"
                : requests.diagnostic();
        if (error == null) return line + requestLine;
        StringBuilder report = new StringBuilder(line);
        StackTraceElement[] trace = error.getStackTrace();
        // Reserve the existing 4096-byte Root reply budget for request diagnostics as well.
        for (int index = 0; index < Math.min(12, trace.length); index++) {
            StackTraceElement frame = trace[index];
            report.append("OBSERVATION_FAILURE_FRAME ").append(index).append(' ')
                    .append(RootEarlyModule.clean(frame.getClassName() + "#" + frame.getMethodName()
                            + ":" + frame.getLineNumber(), 160)).append('\n');
        }
        return report.append(requestLine).toString();
    }

    private static void exact(Object object, Class<?> type) {
        if (object == null || object.getClass() != type) throw new IllegalStateException("Unexpected live " + type.getName());
    }
    private static Object invoke(Method method, Object receiver, Object... args) throws Throwable {
        try { return method.invoke(receiver, args); }
        catch (InvocationTargetException error) { throw error.getCause(); }
    }
}
