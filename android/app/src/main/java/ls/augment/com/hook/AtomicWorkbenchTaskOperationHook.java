package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import android.view.Display;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.function.Consumer;
import ls.augment.com.AtomicWorkbenchTaskIdentity;
import ls.augment.com.AtomicWorkbenchTaskOperationRequest;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** Authenticated exact-leaf operations. No public task permission is relaxed. */
final class AtomicWorkbenchTaskOperationHook {
    private static final int TX = 0x00D04E05, RETAINED_CLEANUP_TX = 0x00D04E09, LIMIT = 80, OWN_HIDDEN = 2;
    private static final String DESCRIPTOR = "ls.augment.com.atomic_task_operations.v1";
    private static final String BOOT = random();
    private static final ThreadLocal<Boolean> INTERNAL = new ThreadLocal<>();
    // Every table below is accessed only under the actual WMS global lock.
    private static final ArrayList<Generation> GENERATIONS = new ArrayList<>();
    private static final Map<String, Operation> OPERATIONS = new LinkedHashMap<>();
    private static final Map<Object, Operation> HIDDEN = new IdentityHashMap<>();
    // Death recipients are linked outside WMS; their cleanup runs on its Handler.
    private static final Map<IBinder, Watch> WATCHES = new IdentityHashMap<>();
    private static volatile boolean installed;
    private static boolean transactionInstalled;
    private static final java.util.Set<Method> OBSERVERS = new java.util.HashSet<>();
    private static Class<?> taskClass, areaClass;
    private static int requiredFlags;
    // Diagnostic revision only: it neither grants Task authority nor changes the wire schema.
    private static final String DIAGNOSTIC_OWNER = "TASK_C13_DIAG_01";
    private static String diagnosticBoot = "UNKNOWN";
    private static boolean diagnosticBootRead;
    private static int diagnosticBits;
    private static volatile Field diagnosticGlobalLock;
    private static long diagnosticCount;
    private static final long[] diagnosticLast = new long[24], diagnosticSuppressed = new long[24];

    private static String diagnosticAction(String action) {
        try { return switch (action == null ? "" : action) {
            case "describe", "primary_display", "inspect", "prepare", "apply", "query", "cancel", "release", "cleanup" -> action;
            default -> "UNKNOWN";
        }; } catch (Throwable ignored) { return "UNKNOWN"; }
    }
    private static int diagnosticActionIndex(String action) {
        return switch (action) {
            case "describe" -> 1; case "primary_display" -> 2; case "inspect" -> 3;
            case "prepare" -> 4; case "apply" -> 5; case "query" -> 6;
            case "cancel" -> 7; case "release" -> 8; case "cleanup" -> 9; default -> 0;
        };
    }
    private static void diagnosticInitialize() {
        try {
            if (diagnosticBootRead) return;
            diagnosticBootRead = true;
            String boot = new String(Files.readAllBytes(Path.of("/proc/sys/kernel/random/boot_id")), StandardCharsets.UTF_8).trim();
            if (boot.matches("[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}")) diagnosticBoot = boot;
        } catch (Throwable ignored) { }
    }
    private static boolean diagnosticMayEmit(Object service) {
        try {
            Field field = diagnosticGlobalLock;
            if (field == null) return false;
            Object lock = field.get(service);
            return lock != null && !Thread.holdsLock(lock);
        } catch (Throwable ignored) { return false; }
    }
    /** handle skips unknown locks and nested callers still holding the actual WMS lock. */
    private static synchronized void diagnostic(String event, String stage, String action, int uid, int pid,
                                                boolean success, boolean wrote, Throwable error) {
        try {
            long count = ++diagnosticCount, suppressed = 0;
            if (!"ATOMIC_TASK_INSTALL".equals(event)) {
                int bucket = diagnosticActionIndex(action) * 2 + (success ? 1 : 0);
                long now = System.nanoTime(), previous = diagnosticLast[bucket];
                if (previous != 0 && now - previous < 3_000_000_000L) { diagnosticSuppressed[bucket]++; return; }
                diagnosticLast[bucket] = now; suppressed = diagnosticSuppressed[bucket]; diagnosticSuppressed[bucket] = 0;
            }
            HookTelemetry.atomicWorkbench(error == null ? "INFO" : "WARN", event + " owner_id=" + DIAGNOSTIC_OWNER
                    + " diag_abi=1 server_pid=" + android.os.Process.myPid() + " boot_id=" + diagnosticBoot
                    + " hook_bits=" + diagnosticBits + " stage=" + stage + " action=" + action
                    + " caller_uid=" + uid + " caller_pid=" + pid + " success=" + success
                    + " result=" + (wrote ? "REPLY_WRITTEN" : "NO_REPLY_CONFIRMED")
                    + " count=" + count + " suppressed=" + suppressed, error);
        } catch (Throwable ignored) { }
    }

    private static final class Generation {
        final WeakReference<Object> task;
        final String id = random();
        final int moduleUid, user, uid;
        final long reset;
        final String base, real;
        boolean passive, external;
        String passiveOperation = "";
        Generation(Object value, AtomicWorkbenchSystemRootAuthority.Session owner) throws Exception {
            task = new WeakReference<>(value); moduleUid = owner.moduleUid; user = owner.userId;
            uid = number(value, "effectiveUid"); reset = owner.resetGeneration;
            base = component(((Intent) field(value, "intent")).getComponent());
            real = component((ComponentName) field(value, "realActivity"));
        }
        boolean sameCore(Object value) throws Exception {
            return task.get() == value && uid == number(value, "effectiveUid") && user == number(value, "mUserId")
                    && base.equals(component(((Intent) field(value, "intent")).getComponent()))
                    && real.equals(component((ComponentName) field(value, "realActivity")));
        }
    }
    private static final class OwnedDisplay {
        final Object content;
        final int id;
        final String name, unique;
        OwnedDisplay(Object content) throws Exception {
            this.content = content; Display display = (Display) field(content, "mDisplay");
            id = display.getDisplayId(); name = display.getName(); unique = (String) call(display, "getUniqueId");
        }
        boolean current(Object service) throws Exception {
            if (display(service, id) != content) return false;
            Display value = (Display) field(content, "mDisplay");
            return id == value.getDisplayId() && name.equals(value.getName()) && unique.equals(call(value, "getUniqueId"))
                    && (id == 0 || numberCall(value, "getOwnerUid") == 0 && (value.getFlags() & requiredFlags) == requiredFlags);
        }
    }
    private static final class Operation {
        final AtomicWorkbenchTaskOperationRequest request;
        final AtomicWorkbenchSystemRootAuthority.Session owner;
        final Generation generation;
        final Object task;
        final OwnedDisplay source, target;
        Operation inheritedLease;
        final String ticket = random(), lease = random();
        boolean dispatched, verified, visibility, focus, held, cleanup, cancelled, external, ended, released;
        Object beforeFocus, beforeRoot;
        Operation(AtomicWorkbenchTaskOperationRequest request, AtomicWorkbenchSystemRootAuthority.Session owner,
                  Generation generation, Object task, OwnedDisplay source, OwnedDisplay target) {
            this.request = request; this.owner = owner; this.generation = generation; this.task = task;
            this.source = source; this.target = target;
        }
    }
    private static final class Watch implements IBinder.DeathRecipient, Runnable {
        final Object service;
        final AtomicWorkbenchSystemRootAuthority.Session session;
        final Handler handler;
        boolean pending;
        Watch(Object service, AtomicWorkbenchSystemRootAuthority.Session session) throws Exception {
            this.service = service; this.session = session; handler = (Handler) field(service, "mH");
        }
        @Override public void binderDied() { synchronized (this) { if (!pending) { pending = true; handler.post(this); } } }
        @Override public void run() {
            boolean retry = false;
            try {
                synchronized (field(service, "mGlobalLock")) {
                    for (Operation op : OPERATIONS.values()) if (sameOwner(op.owner, session)) {
                        try { cleanup(service, op, true); }
                        catch (Throwable unavailable) { op.cleanup = true; retry = true; }
                    }
                }
            } catch (Throwable unavailable) { retry = true; }
            synchronized (this) { pending = retry; if (retry) handler.postDelayed(this, 1000); }
            if (!retry && !session.endpoint.isBinderAlive()) {
                synchronized (WATCHES) { WATCHES.remove(session.endpoint); }
                try { session.endpoint.unlinkToDeath(this, 0); } catch (Throwable ignored) { }
                try { session.owner.unlinkToDeath(this, 0); } catch (Throwable ignored) { }
            }
        }
    }

    static boolean isInstalled() { return installed && AtomicWorkbenchImeHook.isInstalled(); }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static synchronized int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 5;
        diagnosticInitialize();
        String stage = "SERVICE_CLASS";
        Throwable diagnosticFailure = null;
        try {
            // Resolve memory-only core class initializers before any WMS callback can read them.
            // Results are ignored: the original Task install success predicate is unchanged.
            AtomicWorkbenchImeHook.isInstalled();
            AtomicWorkbenchFocusWindowHook.isInstalled();
            AtomicWorkbenchHomeHook.isInstalled();
            Class<?> service = Class.forName("com.android.server.wm.WindowManagerService", false, loader);
            stage = "TASK_CLASS";
            taskClass = Class.forName("com.android.server.wm.Task", false, loader);
            stage = "AREA_CLASS";
            areaClass = Class.forName("com.android.server.wm.TaskDisplayArea", false, loader);
            stage = "WMS_ON_TRANSACT";
            Method transact = service.getDeclaredMethod("onTransact", int.class, Parcel.class, Parcel.class, int.class);
            stage = "TASK_FORCE_HIDDEN";
            Method hidden = method(taskClass, "setForceHidden", int.class, boolean.class);
            stage = "TASK_ORGANIZER";
            Method organizer = method(taskClass, "setTaskOrganizer", Class.forName("android.window.ITaskOrganizer", false, loader), boolean.class);
            stage = "TASK_FRONT";
            Method front = method(taskClass, "moveToFront", String.class, taskClass);
            stage = "TASK_REMOVE_IMMEDIATELY";
            Method removed = method(taskClass, "removeImmediately", String.class);
            stage = "TASK_REPARENT";
            method(taskClass, "reparent", areaClass, boolean.class);
            stage = "TASK_LEAF"; method(taskClass, "isLeafTask");
            stage = "TASK_ROOT_ID"; method(taskClass, "getRootTaskId");
            stage = "TASK_INFO"; method(taskClass, "getTaskInfo");
            stage = "TASK_HOME_RECENTS"; method(taskClass, "isActivityTypeHomeOrRecents");
            stage = "TASK_ALWAYS_ON_TOP";
            method(taskClass, "isAlwaysOnTop");
            stage = "ROOT_CLASS";
            Class<?> root = Class.forName("com.android.server.wm.RootWindowContainer", false, loader);
            stage = "ROOT_TASK_LOOKUP"; method(root, "anyTaskForId", int.class, int.class);
            stage = "ROOT_DISPLAY_LOOKUP"; method(root, "getDisplayContent", int.class);
            stage = "SUPERVISOR_CLASS";
            Class<?> supervisor = Class.forName("com.android.server.wm.ActivityTaskSupervisor", false, loader);
            stage = "SUPERVISOR_REMOVE_TASK";
            method(supervisor, "removeTask", taskClass, boolean.class, boolean.class, String.class);
            for (String f : new String[]{"mGlobalLock", "mRoot", "mContext", "mH", "mCurrentUserId"}) {
                stage = "WMS_FIELD_" + f;
                Field resolved = findField(service, f);
                if ("mGlobalLock".equals(f)) diagnosticGlobalLock = resolved;
            }
            for (String f : new String[]{"mTaskId", "mUserId", "effectiveUid", "intent", "realActivity", "mForceHiddenFlags", "mTaskOrganizer", "mTaskSupervisor"}) { stage = "TASK_FIELD_" + f; findField(taskClass, f); }
            stage = "DISPLAY_REQUIRED_FLAGS";
            requiredFlags = Display.class.getField("FLAG_TRUSTED").getInt(null) | Display.class.getField("FLAG_OWN_FOCUS").getInt(null);
            for (Method target : new Method[]{transact, hidden, organizer, front, removed}) { stage = "DEOPT_" + target.getName(); module.deoptimize(target); }
            if (!transactionInstalled) {
            stage = "REGISTER_TRANSACTION";
            module.registerFeatureHook(module.prepareFeatureHook(transact, "atomic_workbench.task.operations", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                if (!installed) return chain.proceed();
                if (Integer.valueOf(RETAINED_CLEANUP_TX).equals(chain.getArg(0))) {
                    handleRetainedCleanup(chain.getThisObject(), (Parcel) chain.getArg(1), (Parcel) chain.getArg(2), (Integer) chain.getArg(3));
                    return true;
                }
                if (!Integer.valueOf(TX).equals(chain.getArg(0))) return chain.proceed();
                handle(chain.getThisObject(), (Parcel) chain.getArg(1), (Parcel) chain.getArg(2)); return true;
            }));
            transactionInstalled = true;
            diagnosticBits |= 1;
            }
            for (Method target : new Method[]{hidden, organizer, front, removed}) {
                if (OBSERVERS.contains(target)) continue;
                final Method endpoint = target;
                stage = "REGISTER_" + endpoint.getName();
                module.registerFeatureHook(module.prepareFeatureHook(endpoint, "atomic_workbench.task.lease." + endpoint.getName(), true)
                        .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                    Object task = chain.getThisObject();
                    if (installed && !Boolean.TRUE.equals(INTERNAL.get())) {
                        externalChange(task, endpoint.getName(), "setForceHidden".equals(endpoint.getName()) ? (Integer) chain.getArg(0) : 0);
                    }
                    return chain.proceed();
                }));
                OBSERVERS.add(target);
                diagnosticBits |= target == hidden ? 2 : target == organizer ? 4 : target == front ? 8 : 16;
            }
            installed = true; stage = "COMPLETE"; return 5;
        } catch (Throwable unavailable) { diagnosticFailure = unavailable; installed = false; return 0; }
        finally { diagnostic("ATOMIC_TASK_INSTALL", stage, "UNKNOWN", -1, -1, installed, false, diagnosticFailure); }
    }

    private static void externalChange(Object task, String endpoint, int reason) throws Exception {
        Object wm = field(field(task, "mAtmService"), "mWindowManager");
        synchronized (field(wm, "mGlobalLock")) {
            Operation lease = HIDDEN.get(task);
            boolean ownsBit = !"setForceHidden".equals(endpoint) || (reason & OWN_HIDDEN) != 0;
            if (lease != null && ownsBit) {
                releaseHidden(lease); lease.external = true; lease.generation.external = true;
                lease.generation.passive = false; lease.generation.passiveOperation = ""; lease.verified = false;
            }
        }
    }

    private static void handle(Object service, Parcel data, Parcel reply) {
        String nonce = null; Bundle result = rejected("task_authority_rejected");
        String stage = "CALLER", failedStage = "";
        boolean capacityRead = false;
        String observedAction = "UNKNOWN";
        int uid = -1, pid = -1;
        Throwable diagnosticFailure = null;
        try {
            uid = Binder.getCallingUid(); pid = Binder.getCallingPid();
            stage = "SHAPE";
            if (!isInstalled() || data == null || data.dataSize() > 48 * 1024 || reply == null) throw new SecurityException();
            stage = "INTERFACE";
            data.enforceInterface(DESCRIPTOR); if (data.readInt() != 1) throw new SecurityException();
            stage = "REQUEST";
            Bundle auth = data.readBundle(AtomicWorkbenchTaskOperationHook.class.getClassLoader());
            String action = data.readString(); capacityRead = "capacity".equals(action); Bundle request = data.readBundle(AtomicWorkbenchTaskOperationHook.class.getClassLoader());
            observedAction = diagnosticAction(action);
            if (data.dataAvail() != 0 || auth == null || request == null) throw new SecurityException();
            nonce = auth.getString("nonce");
            stage = "CONTEXT";
            Context context = (Context) field(service, "mContext");
            AtomicWorkbenchSystemRootAuthority.Session session;
            boolean cleanupOnly = "release".equals(action) || "cleanup".equals(action) || "cancel".equals(action);
            if (cleanupOnly) {
                stage = "AUTH_CLEANUP";
                session = AtomicWorkbenchSystemRootAuthority.authenticateCleanup(context, auth, uid, pid);
            } else {
                // This Provider IPC and all authentication are outside the WMS lock.
                stage = "AUTH";
                session = AtomicWorkbenchSystemRootAuthority.authenticate(context, auth, uid, pid);
                stage = "WATCH";
                watch(service, session);
                stage = "CURRENT";
                if (!session.isCurrent(context)) throw new SecurityException();
            }
            stage = "LOCK";
            synchronized (field(service, "mGlobalLock")) {
                stage = "SESSION";
                if (!cleanupOnly
                        && (!session.isAlive() || number(service, "mCurrentUserId") != session.userId)) throw new SecurityException();
                stage = "IDENTITY";
                long identity = Binder.clearCallingIdentity();
                try { stage = "DISPATCH"; result = dispatch(service, session, action, request); }
                finally {
                    try { Binder.restoreCallingIdentity(identity); }
                    catch (RuntimeException | Error identityFailure) { stage = "RESTORE_IDENTITY"; throw identityFailure; }
                }
            }
        } catch (Throwable unavailable) { diagnosticFailure = unavailable; failedStage = stage; /* Preserve the original fixed rejection. */ }
        boolean wrote = false;
        try {
            stage = "WRITE";
            if (reply != null) { reply.writeNoException(); reply.writeInt(1); reply.writeString(nonce); reply.writeBundle(result); wrote = true; }
        } catch (RuntimeException | Error writeFailure) { diagnosticFailure = writeFailure; failedStage = stage; throw writeFailure; }
        finally {
            // The cached Field is diagnostic-only. An unknown lock or an outer nested WMS lock
            // skips observation entirely, including the diagnostic class monitor and safe stacks.
            if (!capacityRead && diagnosticMayEmit(service)) try { diagnostic("ATOMIC_TASK_REQUEST", failedStage.isEmpty() ? "COMPLETE" : failedStage, observedAction,
                    uid, pid, Boolean.TRUE.equals(result.get("success")), wrote, diagnosticFailure); }
            catch (Throwable ignored) { }
        }
    }

    private static void handleRetainedCleanup(Object service, Parcel data, Parcel reply, int flags) {
        String nonce = null;
        Bundle result = rejected("task_retained_cleanup_rejected");
        try {
            if (!isInstalled() || (flags & ~0x12) != 0 || reply == null || data == null || data.dataSize() > 48 * 1024)
                throw new SecurityException();
            int uid = Binder.getCallingUid(), pid = Binder.getCallingPid();
            data.enforceInterface(DESCRIPTOR); if (data.readInt() != 1) throw new SecurityException();
            Bundle auth = data.readBundle(AtomicWorkbenchTaskOperationHook.class.getClassLoader());
            String action = data.readString(); Bundle request = data.readBundle(AtomicWorkbenchTaskOperationHook.class.getClassLoader());
            if (data.dataAvail() != 0 || auth == null || request == null
                    || !("cleanup".equals(action) || "release".equals(action) || "cancel".equals(action))) throw new SecurityException();
            nonce = auth.getString("nonce");
            Watch cached;
            synchronized (WATCHES) { cached = WATCHES.get(auth.getBinder("endpoint")); }
            if (cached == null || cached.service != service) throw new SecurityException();
            AtomicWorkbenchSystemRootAuthority.Session session = AtomicWorkbenchSystemRootAuthority.authenticateRetainedCleanup(cached.session, auth, uid, pid);
            synchronized (field(service, "mGlobalLock")) {
                if (!session.endpoint.isBinderAlive() || session.owner.isBinderAlive()) throw new SecurityException();
                // The ordinary dispatch permits fresh cross-owner recovery. This route
                // deliberately requires the exact retained owner before entering it.
                if (!"cleanup".equals(action)) {
                    requireKeys(request, Set.of("operation_id"));
                    String id = string(request, "operation_id"); requireId(id);
                    Operation op = OPERATIONS.get(id);
                    if (op == null || !sameOwner(op.owner, session)) throw new SecurityException();
                }
                long identity = Binder.clearCallingIdentity();
                try { result = dispatch(service, session, action, request); }
                finally { Binder.restoreCallingIdentity(identity); }
            }
        } catch (Throwable unavailable) { /* Unknown remains a fixed rejection; never query Provider or mint authority. */ }
        if (reply != null && (flags & 1) == 0) {
            reply.writeNoException(); reply.writeInt(1); reply.writeString(nonce); reply.writeBundle(result);
        }
    }

    private static Bundle dispatch(Object service, AtomicWorkbenchSystemRootAuthority.Session owner, String action, Bundle args) throws Exception {
        if ("capacity".equals(action)) {
            requireKeys(args, Set.of("schema", "probe_id"));
            if (integer(args, "schema") != 1) throw new SecurityException();
            String probe = string(args, "probe_id"); requireId(probe);
            int bits = (installed ? 1 : 0) | (AtomicWorkbenchImeHook.isInstalled() ? 2 : 0)
                    | (AtomicWorkbenchFocusWindowHook.isInstalled() ? 4 : 0) | (AtomicWorkbenchHomeHook.isInstalled() ? 8 : 0);
            if (bits != 15 || number(service, "mCurrentUserId") != owner.userId) throw new SecurityException();
            Bundle b = new Bundle(); b.putInt("schema", 1); b.putBoolean("success", true); b.putString("probe_id", probe);
            b.putString("profile", "FULL8_CORE"); b.putInt("pool_limit", 8); b.putInt("core_bits", bits);
            b.putInt("server_pid", android.os.Process.myPid()); b.putString("server_generation", BOOT); b.putInt("user_id", owner.userId);
            return b;
        }
        if ("describe".equals(action)) return describe(service, owner, args);
        if ("primary_display".equals(action)) {
            requireKeys(args, Set.of());
            Bundle b = rejected("task_primary_display"); b.putBoolean("success", true);
            b.putBundle("primary_display", primaryDisplay(service)); return b;
        }
        if ("inspect".equals(action)) {
            requireKeys(args, Set.of("operation_ids"));
            Object values = args.get("operation_ids");
            if (!(values instanceof ArrayList<?>) || ((ArrayList<?>) values).size() > 80) throw new SecurityException();
            java.util.HashSet<String> seen = new java.util.HashSet<>(); ArrayList<Bundle> proofs = new ArrayList<>();
            for (Object value : (ArrayList<?>) values) {
                if (!(value instanceof String) || !seen.add((String) value)) throw new SecurityException();
                requireId((String) value); Bundle query = new Bundle(); query.putString("operation_id", (String) value);
                Bundle proof = dispatch(service, owner, "query", query); Operation operation = OPERATIONS.get((String) value);
                boolean current = false;
                try { current = operation != null && !operation.ended && operation.generation.moduleUid == owner.moduleUid
                        && operation.generation.reset == owner.resetGeneration && operation.generation.sameCore(operation.task); }
                catch (Exception retiredIdentity) { /* A retired Task does not make other shelf entries unavailable. */ }
                proof.putBoolean("scope_current", current);
                proofs.add(proof);
            }
            Bundle b = rejected("task_shelf_inspected"); b.putBoolean("success", true);
            b.putParcelableArrayList("operations", proofs); return b;
        }
        if ("prepare".equals(action)) return prepare(service, owner, AtomicWorkbenchTaskOperationRequest.fromBundle(args));
        if ("cleanup".equals(action)) {
            requireKeys(args, Set.of()); boolean pending = false;
            for (Operation op : OPERATIONS.values()) if (sameOwner(op.owner, owner)) {
                try { cleanup(service, op, true); } catch (Throwable failure) { op.cleanup = true; }
                pending |= op.cleanup || op.held;
            }
            Bundle b = rejected(pending ? "task_cleanup_pending" : "task_cleanup_complete");
            b.putBoolean("success", !pending); b.putBoolean("cleanup_pending", pending); return b;
        }
        boolean apply = "apply".equals(action);
        requireKeys(args, apply ? Set.of("operation_id", "ticket") : Set.of("operation_id"));
        String id = string(args, "operation_id"); requireId(id);
        Operation op = OPERATIONS.get(id);
        boolean inheritedCleanup = op != null && !op.owner.isAlive() && op.owner.moduleUid == owner.moduleUid && op.owner.userId == owner.userId
                && ("query".equals(action) || "release".equals(action) || "cancel".equals(action));
        if (op == null || !sameOwner(op.owner, owner) && !inheritedCleanup) return rejected("task_operation_missing");
        if (apply) {
            if (!op.ticket.equals(string(args, "ticket"))) throw new SecurityException();
            if (!op.dispatched && !op.cancelled) {
                op.request.requireFresh(SystemClock.elapsedRealtime());
                mutate(service, op);
            }
        } else if ("cancel".equals(action)) {
            if (!op.dispatched) { op.cancelled = true; op.verified = false; }
        } else if ("release".equals(action)) cleanup(service, op, true);
        else if (!"query".equals(action)) throw new SecurityException();
        if (op.dispatched && !op.cancelled && !op.external && !op.released) {
            try { verify(service, op); }
            catch (Throwable unavailable) { op.verified = false; op.cleanup = true; }
        }
        return result(service, op);
    }

    private static Bundle describe(Object service, AtomicWorkbenchSystemRootAuthority.Session owner, Bundle args) throws Exception {
        requireKeys(args, Set.of("window_id", "window_session", "display_id", "display_name", "display_unique"));
        int slot = integer(args, "window_id"); String session = string(args, "window_session");
        Object content = owned(service, owner, integer(args, "display_id"), string(args, "display_name"), string(args, "display_unique"), slot, session);
        ArrayList<Bundle> tasks = new ArrayList<>();
        call(content, "forAllLeafTasks", new Class<?>[]{Consumer.class, boolean.class}, (Consumer<Object>) task -> {
            try { if (tasks.size() < 64 && eligible(task, owner.userId)) tasks.add(identity(task, generation(task, owner)).toBundle()); }
            catch (Exception invalid) { throw new IllegalStateException("task_description_unavailable"); }
        }, true);
        Bundle b = rejected("task_described"); b.putBoolean("success", true); b.putParcelableArrayList("tasks", tasks);
        b.putBundle("primary_display", primaryDisplay(service)); return b;
    }

    private static Bundle primaryDisplay(Object service) throws Exception {
        Display live = (Display) field(display(service, 0), "mDisplay");
        if (live == null || live.getDisplayId() != 0) throw new SecurityException();
        Object unique = call(live, "getUniqueId");
        if (live.getName() == null || live.getName().isEmpty() || !(unique instanceof String)
                || ((String) unique).isEmpty()) throw new SecurityException();
        Bundle b = new Bundle(); b.putInt("display_id", 0); b.putString("display_name", live.getName());
        b.putString("display_unique", (String) unique); return b;
    }

    private static Bundle prepare(Object service, AtomicWorkbenchSystemRootAuthority.Session owner, AtomicWorkbenchTaskOperationRequest request) throws Exception {
        request.requireFresh(SystemClock.elapsedRealtime());
        Operation previous = OPERATIONS.get(request.operationId);
        if (previous != null) {
            if (!sameOwner(previous.owner, owner) || !equalBundle(previous.request.toBundle(), request.toBundle())) throw new SecurityException();
            return result(service, previous);
        }
        // Expired terminal tickets cannot be replayed. Never evict a live hidden or uncertain responsibility.
        for (Iterator<Operation> iterator = OPERATIONS.values().iterator(); iterator.hasNext();) {
            Operation old = iterator.next();
            if (!old.held && !old.cleanup && !old.owner.endpoint.isBinderAlive()
                    && !old.request.operationId.equals(old.generation.passiveOperation)
                    && old.request.deadlineElapsed < SystemClock.elapsedRealtime()
                    && (old.verified || old.cancelled || old.external || old.ended || old.released)) iterator.remove();
        }
        if (OPERATIONS.size() >= LIMIT) return rejected("task_operation_capacity");
        int pending = 0;
        for (Operation operation : OPERATIONS.values()) if (!operation.verified && !operation.cancelled && !operation.released) pending++;
        if (pending >= 16) return rejected("task_pending_capacity");
        Object task = call(field(service, "mRoot"), "anyTaskForId", new Class<?>[]{int.class, int.class}, request.identity.taskId, 0);
        if (task == null || !eligible(task, owner.userId)) throw new SecurityException();
        Generation generation = find(task);
        if (generation == null || !generation.sameCore(task) || generation.moduleUid != owner.moduleUid || generation.reset != owner.resetGeneration
                || !identity(task, generation).equals(request.identity)) throw new SecurityException();
        OwnedDisplay source = new OwnedDisplay(call(task, "getDisplayContent"));
        Object target;
        if (request.action == AtomicWorkbenchTaskOperationRequest.Action.RESTORE
                || request.action == AtomicWorkbenchTaskOperationRequest.Action.END_TASK && source.id == 0) {
            if (source.id != 0 || generation.external || !(generation.passive || HIDDEN.containsKey(task))) throw new SecurityException();
            target = request.action == AtomicWorkbenchTaskOperationRequest.Action.END_TASK ? source.content
                    : owned(service, owner, request.targetDisplayId, request.targetDisplayName, request.targetDisplayUnique,
                        request.targetSlot, request.targetWindowSession);
        } else {
            owned(service, owner, source.id, source.name, source.unique, request.sourceSlot, request.sourceWindowSession);
            if (request.action == AtomicWorkbenchTaskOperationRequest.Action.END_TASK) target = source.content;
            else {
                target = display(service, 0);
                Display physical = (Display) field(target, "mDisplay");
                if (request.targetDisplayId != 0 || !request.targetDisplayName.equals(physical.getName())
                        || !request.targetDisplayUnique.equals(call(physical, "getUniqueId"))) throw new SecurityException();
            }
        }
        for (Operation op : OPERATIONS.values()) if (op.task == task && op.dispatched && !op.verified && !op.cancelled && !op.external)
            return rejected("task_operation_in_flight");
        request.requireFresh(SystemClock.elapsedRealtime());
        Operation op = new Operation(request, owner, generation, task, source, new OwnedDisplay(target));
        if (request.action == AtomicWorkbenchTaskOperationRequest.Action.RESTORE || source.id == 0) op.inheritedLease = HIDDEN.get(task);
        OPERATIONS.put(request.operationId, op); return result(service, op);
    }

    private static void mutate(Object service, Operation op) throws Exception {
        if (!op.owner.isAlive() || !op.source.current(service) || !op.target.current(service)
                || call(field(service, "mRoot"), "anyTaskForId", new Class<?>[]{int.class, int.class}, op.request.identity.taskId, 0) != op.task
                || !eligible(op.task, op.owner.userId)
                || !op.generation.sameCore(op.task) || !identity(op.task, op.generation).equals(op.request.identity)) throw new SecurityException();
        if (op.request.action == AtomicWorkbenchTaskOperationRequest.Action.RESTORE && op.generation.external) throw new SecurityException();
        Object primary = display(service, 0); op.beforeFocus = field(primary, "mCurrentFocus"); op.beforeRoot = call(primary, "getFocusedRootTask");
        op.request.requireFresh(SystemClock.elapsedRealtime());
        INTERNAL.set(true);
        try {
            if (op.request.action == AtomicWorkbenchTaskOperationRequest.Action.END_TASK) {
                op.dispatched = true;
                if (op.inheritedLease != null) releaseHidden(op.inheritedLease);
                call(field(op.task, "mTaskSupervisor"), "removeTask", new Class<?>[]{taskClass, boolean.class, boolean.class, String.class},
                        op.task, false, true, "DuoAtomic-end-leaf");
            } else {
                if (op.request.action != AtomicWorkbenchTaskOperationRequest.Action.RESTORE) {
                    if (HIDDEN.size() >= 64 || number(op.task, "mForceHiddenFlags") != 0 || field(op.task, "mTaskOrganizer") != null
                            || Boolean.TRUE.equals(call(op.task, "isAlwaysOnTop"))) throw new SecurityException();
                    op.dispatched = true; op.held = true; op.cleanup = true; HIDDEN.put(op.task, op);
                    call(op.task, "setForceHidden", new Class<?>[]{int.class, boolean.class}, OWN_HIDDEN, true);
                    if ((number(op.task, "mForceHiddenFlags") & OWN_HIDDEN) == 0) throw new IllegalStateException("task_hide_unconfirmed");
                } else op.dispatched = true;
                Object area = call(op.target.content, "getDefaultTaskDisplayArea");
                call(op.task, "reparent", new Class<?>[]{areaClass, boolean.class}, area, false);
                if (op.request.action != AtomicWorkbenchTaskOperationRequest.Action.SHELVE) {
                    Operation prior = HIDDEN.get(op.task); if (prior != null) releaseHidden(prior);
                    op.generation.passive = op.request.action == AtomicWorkbenchTaskOperationRequest.Action.MOVE_OUT;
                }
            }
            verify(service, op);
        } catch (Throwable unknown) { if (op.dispatched) op.cleanup = true; else throw new SecurityException("task_operation_rejected"); }
        finally { INTERNAL.remove(); }
    }

    private static void verify(Object service, Operation op) throws Exception {
        if (op.external || op.cancelled || !op.dispatched) return;
        Object primary = display(service, 0);
        // A positive dispatch-time proof is stable; later user navigation does not undo it.
        op.focus = op.focus || op.beforeFocus != null && op.beforeRoot != null && op.beforeFocus == field(primary, "mCurrentFocus")
                && op.beforeRoot == call(primary, "getFocusedRootTask");
        Object actual = call(field(service, "mRoot"), "anyTaskForId", new Class<?>[]{int.class, int.class}, op.request.identity.taskId, 0);
        if (op.request.action == AtomicWorkbenchTaskOperationRequest.Action.END_TASK) {
            op.ended = actual != op.task && !Boolean.TRUE.equals(call(op.task, "isAttached"));
            op.visibility = !HIDDEN.containsKey(op.task); op.verified = op.ended && op.visibility && op.focus;
        } else if (actual == op.task && op.generation.sameCore(actual) && op.target.current(service)
                && call(actual, "getDisplayContent") == op.target.content) {
            boolean shelve = op.request.action == AtomicWorkbenchTaskOperationRequest.Action.SHELVE;
            op.visibility = shelve ? HIDDEN.get(actual) == op && op.held && (number(actual, "mForceHiddenFlags") & OWN_HIDDEN) != 0
                    : !HIDDEN.containsKey(actual) && (number(actual, "mForceHiddenFlags") & OWN_HIDDEN) == 0;
            op.verified = op.visibility && op.focus;
        } else op.verified = false;
        if (op.verified) { op.cleanup = false; op.generation.passive = op.request.action == AtomicWorkbenchTaskOperationRequest.Action.SHELVE;
            op.generation.passiveOperation = op.generation.passive ? op.request.operationId : ""; }
    }

    private static void cleanup(Object service, Operation op, boolean background) throws Exception {
        INTERNAL.set(true);
        try {
            if (!Boolean.TRUE.equals(call(op.task, "isAttached"))
                    && call(field(service, "mRoot"), "anyTaskForId", new Class<?>[]{int.class, int.class}, op.request.identity.taskId, 0) != op.task) {
                // Actual object absence ends a visibility lease even if teardown cleared its Intent/UID fields.
                Operation exact = HIDDEN.get(op.task);
                if (exact != null && (exact == op || exact == op.inheritedLease)) { HIDDEN.remove(op.task); exact.held = false; exact.cleanup = false; }
                op.held = false; op.cleanup = false; op.ended = true; op.released = true;
                op.generation.passive = false; op.generation.passiveOperation = ""; return;
            }
            if (!op.dispatched) op.cancelled = true;
            if (op.inheritedLease != null) releaseHidden(op.inheritedLease);
            releaseHidden(op);
            if (!op.dispatched) {
                op.external |= op.generation.external || call(op.task, "getDisplayContent") != op.source.content;
                op.cleanup = false; op.released = true;
                if (op.inheritedLease != null) op.generation.passive = !op.external && op.generation.sameCore(op.task)
                        && call(op.task, "getDisplayContent") == display(service, 0);
                if (op.generation.passive) op.generation.passiveOperation = op.request.operationId;
                return;
            }
            if (background && !op.external && !op.generation.external && op.generation.sameCore(op.task)
                    && Boolean.TRUE.equals(call(op.task, "isAttached"))) {
                Object actual = call(op.task, "getDisplayContent");
                if (actual != null && actual != display(service, 0)
                        && (actual == op.source.content && op.source.current(service) || actual == op.target.content && op.target.current(service))) {
                    call(op.task, "reparent", new Class<?>[]{areaClass, boolean.class}, call(display(service, 0), "getDefaultTaskDisplayArea"), false);
                    if (call(op.task, "getDisplayContent") != display(service, 0)) throw new IllegalStateException("task_cleanup_position");
                }
            }
            op.cleanup = op.held;
            op.released = !op.held;
            op.verified = false;
            op.generation.passive = !op.external && !op.ended && op.generation.sameCore(op.task)
                    && Boolean.TRUE.equals(call(op.task, "isAttached")) && call(op.task, "getDisplayContent") == display(service, 0);
            op.generation.passiveOperation = op.generation.passive ? op.request.operationId : "";
        } finally { INTERNAL.remove(); }
    }

    private static void releaseHidden(Operation op) throws Exception {
        if (!op.held || HIDDEN.get(op.task) != op) return;
        boolean prior = Boolean.TRUE.equals(INTERNAL.get()); INTERNAL.set(true);
        try {
            call(op.task, "setForceHidden", new Class<?>[]{int.class, boolean.class}, OWN_HIDDEN, false);
            if ((number(op.task, "mForceHiddenFlags") & OWN_HIDDEN) != 0) throw new IllegalStateException("task_unhide_unconfirmed");
            HIDDEN.remove(op.task); op.held = false; op.cleanup = false;
        } finally { if (prior) INTERNAL.set(true); else INTERNAL.remove(); }
    }

    private static Bundle result(Object service, Operation op) throws Exception {
        Bundle observed = null;
        try {
            if (!Boolean.TRUE.equals(call(op.task, "isAttached"))
                    && call(field(service, "mRoot"), "anyTaskForId", new Class<?>[]{int.class, int.class}, op.request.identity.taskId, 0) != op.task)
                op.ended = true;
            if (!op.ended && op.generation.sameCore(op.task) && Boolean.TRUE.equals(call(op.task, "isAttached")))
                observed = identity(op.task, op.generation).toBundle();
        } catch (Throwable unavailable) { op.verified = false; if (op.dispatched) op.cleanup = true; }
        Bundle b = rejected(op.cancelled ? "task_operation_cancelled" : op.external ? "task_externally_active" : op.verified ? "task_operation_verified" : "task_operation_pending");
        b.putString("operation_id", op.request.operationId); b.putString("ticket", op.ticket);
        b.putBoolean("success", op.verified && !op.cleanup); b.putBoolean("mutation_dispatched", op.dispatched);
        b.putBoolean("position_verified", op.verified); b.putBoolean("visibility_verified", op.visibility);
        b.putBoolean("focus_unchanged", op.focus); b.putBoolean("cleanup_pending", op.cleanup);
        b.putBoolean("operation_unconfirmed", op.dispatched && !op.verified && !op.external && !op.ended && !op.released);
        b.putBoolean("cleanup_complete", op.released && !op.cleanup && !op.held);
        b.putBoolean("cancelled", op.cancelled); b.putBoolean("external", op.external || op.generation.external); b.putBoolean("ended", op.ended);
        b.putBoolean("inherited_hidden_lease", op.inheritedLease != null && op.inheritedLease.held && HIDDEN.get(op.task) == op.inheritedLease);
        b.putString("inherited_lease_id", op.inheritedLease == null ? "" : op.inheritedLease.lease);
        b.putString("lease_id", op.held ? op.lease : ""); b.putBoolean("hidden_lease", op.held);
        if (observed != null) b.putBundle("identity", observed);
        return b;
    }

    private static Object owned(Object service, AtomicWorkbenchSystemRootAuthority.Session owner, int id, String name, String unique, int slot, String session) throws Exception {
        if (id <= 0 || slot < 0 || slot > 7 || session == null || !UUID.fromString(session).toString().equals(session)
                || !name.equals("DuoAtomic-" + owner.moduleUid + "-w" + slot + "-" + session)) throw new SecurityException();
        Object content = display(service, id); Display display = (Display) field(content, "mDisplay");
        if (!name.equals(display.getName()) || !unique.equals(call(display, "getUniqueId"))
                || numberCall(display, "getOwnerUid") != 0 || (display.getFlags() & requiredFlags) != requiredFlags
                || (display.getFlags() & (Display.FLAG_PRIVATE | Display.FLAG_PRESENTATION)) != 0
                || !AtomicWorkbenchImeHook.authenticatesEditorQuery(service, content, owner.moduleUid, owner.rootPid)) throw new SecurityException();
        return content;
    }
    private static Generation generation(Object task, AtomicWorkbenchSystemRootAuthority.Session owner) throws Exception {
        Generation found = find(task);
        if (found != null && found.sameCore(task) && found.moduleUid == owner.moduleUid && found.reset == owner.resetGeneration) {
            // Only describe of a freshly authenticated owned VD reaches this point.
            // Reacquiring an externally activated task keeps its actual object generation.
            found.external = false; found.passive = false; found.passiveOperation = ""; return found;
        }
        if (found != null) {
            if (HIDDEN.containsKey(task)) throw new SecurityException("task_previous_lease_pending");
            GENERATIONS.remove(found);
        }
        for (Iterator<Generation> it = GENERATIONS.iterator(); it.hasNext();) if (it.next().task.get() == null) it.remove();
        if (GENERATIONS.size() >= 256) throw new IllegalStateException("task_identity_capacity");
        Generation result = new Generation(task, owner); GENERATIONS.add(result); return result;
    }
    private static Generation find(Object task) { for (Generation g : GENERATIONS) if (g.task.get() == task) return g; return null; }
    private static AtomicWorkbenchTaskIdentity identity(Object task, Generation generation) throws Exception {
        Display display = (Display) field(call(task, "getDisplayContent"), "mDisplay");
        return new AtomicWorkbenchTaskIdentity(BOOT, generation.id, number(task, "mTaskId"), numberCall(task, "getRootTaskId"),
                Boolean.TRUE.equals(call(task, "isLeafTask")), number(task, "effectiveUid"), number(task, "mUserId"),
                component(((Intent) field(task, "intent")).getComponent()), component((ComponentName) field(task, "realActivity")),
                display.getDisplayId(), display.getName(), (String) call(display, "getUniqueId"));
    }
    private static boolean eligible(Object task, int user) throws Exception {
        if (!Boolean.TRUE.equals(call(task, "isLeafTask")) || !Boolean.TRUE.equals(call(task, "isAttached"))
                || Boolean.TRUE.equals(call(task, "isActivityTypeHomeOrRecents")) || numberCall(task, "getActivityType") != 1
                || field(task, "mTaskOrganizer") != null || Boolean.TRUE.equals(call(task, "isAlwaysOnTop"))
                || number(task, "mUserId") != user || number(task, "effectiveUid") / 100000 != user
                || number(task, "effectiveUid") % 100000 < 1000) return false;
        ComponentName component = (ComponentName) field(task, "realActivity");
        return component != null && !"ls.augment.com".equals(component.getPackageName()) && !"com.android.systemui".equals(component.getPackageName());
    }
    private static void watch(Object service, AtomicWorkbenchSystemRootAuthority.Session session) throws Exception {
        synchronized (WATCHES) {
            if (WATCHES.containsKey(session.endpoint)) return;
            if (WATCHES.size() >= 8) throw new SecurityException("task_owner_capacity");
            Watch watch = new Watch(service, session);
            session.endpoint.linkToDeath(watch, 0); session.owner.linkToDeath(watch, 0); WATCHES.put(session.endpoint, watch);
            if (!session.isAlive()) watch.binderDied();
        }
    }
    private static boolean sameOwner(AtomicWorkbenchSystemRootAuthority.Session a, AtomicWorkbenchSystemRootAuthority.Session b) {
        return a.endpoint.equals(b.endpoint) && a.owner.equals(b.owner) && a.rootPid == b.rootPid && a.moduleUid == b.moduleUid
                && a.userId == b.userId && a.session == b.session && a.resetGeneration == b.resetGeneration;
    }
    private static Bundle rejected(String reason) { Bundle b = new Bundle(); b.putInt("schema", 1); b.putBoolean("success", false); b.putString("reason", reason); return b; }
    private static Object display(Object service, int id) throws Exception {
        Object value = call(field(service, "mRoot"), "getDisplayContent", new Class<?>[]{int.class}, id);
        if (value == null) throw new SecurityException("task_display_missing"); return value;
    }
    private static String component(ComponentName value) { if (value == null) throw new SecurityException(); return value.flattenToString(); }
    private static void requireId(String id) { if (id == null || !id.matches("[0-9a-f]{32}")) throw new SecurityException(); }
    private static void requireKeys(Bundle b, Set<String> keys) { if (!b.keySet().equals(keys)) throw new SecurityException(); }
    private static int integer(Bundle b, String key) { Object value = b.get(key); if (!(value instanceof Integer)) throw new SecurityException(); return (Integer) value; }
    private static String string(Bundle b, String key) { Object value = b.get(key); if (!(value instanceof String)) throw new SecurityException(); return (String) value; }
    private static boolean equalBundle(Bundle a, Bundle b) {
        if (!a.keySet().equals(b.keySet())) return false;
        for (String key : a.keySet()) { Object x = a.get(key), y = b.get(key); if (x instanceof Bundle && y instanceof Bundle) { if (!equalBundle((Bundle) x, (Bundle) y)) return false; } else if (x == null ? y != null : !x.equals(y)) return false; }
        return true;
    }
    private static String random() { return UUID.randomUUID().toString().replace("-", ""); }
    private static Field findField(Class<?> type, String name) throws Exception {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) try { Field f = c.getDeclaredField(name); f.setAccessible(true); return f; } catch (NoSuchFieldException missing) { }
        throw new NoSuchFieldException(name);
    }
    private static Object field(Object target, String name) throws Exception { return findField(target.getClass(), name).get(target); }
    private static int number(Object target, String name) throws Exception { return ((Number) field(target, name)).intValue(); }
    private static Method method(Class<?> type, String name, Class<?>... args) throws Exception {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) try { Method m = c.getDeclaredMethod(name, args); m.setAccessible(true); return m; } catch (NoSuchMethodException missing) { }
        throw new NoSuchMethodException(name);
    }
    private static Object call(Object target, String name) throws Exception { return call(target, name, new Class<?>[0]); }
    private static Object call(Object target, String name, Class<?>[] args, Object... values) throws Exception { return method(target.getClass(), name, args).invoke(target, values); }
    private static int numberCall(Object target, String name) throws Exception { return ((Number) call(target, name)).intValue(); }
}
