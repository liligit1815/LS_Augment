package ls.augment.com;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import java.util.ArrayList;

/** Serial coordinator. A slot owns its display until that slot has finished task recovery. */
final class AtomicWorkbenchEngine {
    interface Factory { AtomicWorkbenchPlatform create(int windowId); }
    interface TaskController {
        Bundle change(Bundle request);
        Bundle query(String operationId);
        Bundle shelf();
        Bundle cancel(String operationId);
        default Bundle manageReferences(Bundle request) { return taskReferenceUnavailable(request, "task_reference_backend_unavailable"); }
        default AtomicWorkbenchRecoveryScope.ReaderProfile recoveryDomain() { return AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4; }
        Bundle cleanup();
        void maintain();
        boolean hasPending();
        boolean blocksWindow(int windowId);
        default void refreshStorageScope() { }
        default boolean storageScopeUnverified() { return false; }
        default String storageScopeReason() { return ""; }
        default void requireAllocationScope(int target, int source) throws Exception {
            throw new IllegalStateException("task_allocation_reader_unavailable");
        }
    }
    private final Factory factory;
    private final AtomicWorkbenchRecoveryScope.ReaderProfile recoveryReader;
    private final AtomicWorkbenchPlatform[] windows;
    private final boolean[] recovering;
    private AtomicWorkbenchPlatform legacy;
    private volatile int activeWindow = -1, focusedWindow = -1;
    // A temporary editor lease must not undo a newer user focus/input action.
    private volatile long inputRevision;
    private volatile ExtractionInputDown extractionInputDown;
    private volatile boolean uiParked;
    private boolean parkFocusPending;
    private long outputGeneration;
    private int outputAction; // 1=producer update, 2=park, 3=resume
    private int outputWindow = -1;
    private TaskController taskController;
    private String taskBackendReason = "task_backend_unavailable";
    // Explicit bootstrap/read failure is not the legacy, never-configured case.
    // finishLater also reads this single-writer fact without accessing storage.
    private volatile boolean taskStorageUnverified;

    private AtomicWorkbenchPlatform createPlatform(int id) {
        AtomicWorkbenchPlatform platform = factory.create(id);
        if(platform==null || platform.recoveryWindowId()!=id || platform.recoveryReaderProfile()!=recoveryReader)
            throw new IllegalArgumentException("task_recovery_owner_mismatch");
        platform.configureAllocationScopeFence(this::requireAllocationScope);
        return platform;
    }
    private void requireAllocationScope(int target, int source) throws Exception {
        if (!valid(target) || source < -1 || source >= windows.length || taskController == null)
            throw new IllegalStateException("task_allocation_reader_unavailable");
        // The controller performs an actual complete read. Cached READY is never a permit.
        taskController.requireAllocationScope(target, source);
        if (recovering[target] || source >= 0 && recovering[source])
            throw new IllegalStateException("task_allocation_owner_recovering");
    }
    private boolean allocationScopeReady(int target) {
        try { requireAllocationScope(target, -1); return true; }
        catch (Exception denied) { return false; }
    }
    private Bundle allocationScopeRejected(int id) {
        Bundle state = decorate(id, windows[id].status());
        state.putBoolean("success", false); state.putBoolean("existing_session_preserved", true);
        state.putString("message", "暂存恢复范围尚未确认，已保留原工作区");
        describeTaskBackend(state); return state;
    }

    /** New HOME work is admitted before this Engine changes input/focus/Surface state. */
    private Bundle nativeHomeAdmissionFailure(int id, AtomicWorkbenchPlatform target, AtomicWorkbenchPlatform source) {
        String reason;
        try {
            if (!target.needsNativeHomeAllocation()) return null;
        } catch (Exception unknown) {
            reason = "原生桌面任务身份尚未确认，已保留原工作区";
            return nativeHomeAdmissionRejected(id, target, reason);
        }
        try {
            int sourceId = -1;
            if (source != null) {
                for (int slot = 0; slot < windows.length; slot++) if (windows[slot] == source) { sourceId = slot; break; }
                if (sourceId < 0) throw new IllegalStateException("task_home_source_unowned");
            }
            requireAllocationScope(id, sourceId);
            return null;
        } catch (Exception denied) {
            return nativeHomeAdmissionRejected(id, target, "暂存恢复范围尚未确认，已保留原工作区");
        }
    }
    private Bundle nativeHomeAdmissionRejected(int id, AtomicWorkbenchPlatform target, String reason) {
        // outputStatus snapshots existing fields; status could recover HOME or write a Journal.
        Bundle state = decorate(id, target.outputStatus());
        state.putBoolean("success", false); state.putBoolean("existing_session_preserved", true);
        state.putString("message", reason); describeTaskBackend(state); return state;
    }

    void configureTaskOperations(TaskController controller) {
        if (controller == null || taskController != null) throw new IllegalStateException("task_controller_already_configured");
        if(controller.recoveryDomain()!=recoveryReader) throw new IllegalStateException("task_recovery_reader_mismatch");
        taskController = controller;
        taskStorageUnverified = false;
    }
    void taskOperationsUnavailable(String reason) {
        if (taskController != null) throw new IllegalStateException("task_controller_has_responsibility");
        if (reason == null || !reason.matches("task_[a-z_]{1,64}")) throw new IllegalArgumentException("task_reason");
        taskBackendReason = reason;
        taskStorageUnverified = true;
    }
    boolean taskOperationsConfigured() { return taskController != null; }
    boolean taskStorageUnverified() {
        return taskStorageUnverified || taskController != null && taskController.storageScopeUnverified();
    }

    private void describeTaskBackend(Bundle result) {
        boolean unknown=taskStorageUnverified();
        result.putString("task_backend_state", unknown ? "storage_unverified"
                : taskController != null ? "ready" : "not_configured");
        result.putBoolean("task_backend_available", taskController != null && !unknown);
        result.putBoolean("task_storage_unverified", unknown);
        result.putBoolean("task_scope_verified", taskController != null && !unknown);
        result.putString("task_backend_reason", unknown && taskController != null
                ? taskController.storageScopeReason() : taskController != null ? "" : taskBackendReason);
    }

    Bundle changeTask(Bundle request) { return taskController == null ? taskUnavailable() : taskController.change(request); }
    Bundle taskOperationState(String id) { return taskController == null ? taskUnavailable() : taskController.query(id); }
    Bundle taskShelfState() { return taskController == null ? taskUnavailable() : taskController.shelf(); }
    Bundle cancelTaskOperation(String id) { return taskController == null ? taskUnavailable() : taskController.cancel(id); }
    Bundle manageTaskReferences(Bundle request) {
        return taskController == null ? taskReferenceUnavailable(request, "task_reference_backend_unavailable") : taskController.manageReferences(request);
    }
    static Bundle taskReferenceUnavailable(Bundle input, String reason) {
        AtomicWorkbenchTaskReferenceRequest r=AtomicWorkbenchTaskReferenceRequest.fromBundle(input);
        return AtomicWorkbenchTaskReferenceResult.response(new AtomicWorkbenchTaskReferenceResult(r,
                AtomicWorkbenchTaskReferenceResult.Status.REJECTED,0,reason,false,false,false,false,false),
                AtomicWorkbenchTaskReferenceSnapshot.empty(0,false,reason),null);
    }
    Bundle allocateTaskDisplay(int id, Surface surface, int width, int height, int density,
                               long generation, String allocationId) {
        if (!valid(id) || uiParked || generation <= outputGeneration || generation <= 0
                || allocationId == null || !allocationId.matches("[0-9a-f]{32}")
                || taskController == null || taskController.blocksWindow(id)) {
            release(surface); return failed(id, "任务显示分配请求已过期或尚未就绪");
        }
        // Allocation never closes a previous slot and never selects any input task.
        AtomicWorkbenchPlatform platform = windows[id];
        if (recovering[id] || platform.hasStartupFailure() || platform.hasLiveDisplay() || platform.hasRecoveryPending()) {
            release(surface); Bundle state = decorate(id, platform.status()); state.putBoolean("success", false);
            state.putBoolean("existing_session_preserved", true); return state;
        }
        if (!allocationScopeReady(id)) { release(surface); return allocationScopeRejected(id); }
        boolean[] committed = {false};
        Runnable commit = () -> {
            if (committed[0]) return;
            outputGeneration = generation; outputAction = 4; outputWindow = id; ++inputRevision;
            committed[0] = true;
        };
        boolean scopeRefusedBeforeWal = false;
        try {
            Bundle allocated = platform.allocateTaskDisplay(surface, width, height, density, generation, allocationId, commit);
            commit.run(); // Retain the original generation semantics for non-scope validation failures.
            return decorate(id, allocated);
        } catch (AtomicWorkbenchPlatform.AllocationScopeRefused denied) {
            scopeRefusedBeforeWal = true;
            return allocationScopeRejected(id);
        } finally {
            // A platform error must not make a genuinely attempted allocation replayable.
            if (!scopeRefusedBeforeWal) commit.run();
        }
    }
    AtomicWorkbenchPlatform taskPlatform(int id) { return recoveryReader.contains(id) ? windows[id] : null; }
    long taskInputRevision() { return inputRevision; }
    boolean taskWindowRecovering(int id) { return !recoveryReader.contains(id) || recovering[id]; }
    Bundle cancelTaskWindowInput(int id, long expectedRevision) {
        if (!valid(id) || uiParked || expectedRevision != inputRevision) return failed(id, "任务操作前的输入状态已变化");
        try { windows[id].cancelInput(); }
        catch (Exception unavailable) { return failed(id, "原任务输入尚未取消"); }
        ++inputRevision;
        Bundle result = new Bundle(); result.putBoolean("success", true); return result;
    }
    private Bundle taskUnavailable() {
        Bundle b = new Bundle(); b.putInt("schema", 1); b.putBoolean("success", false);
        b.putString("reason", taskBackendReason); return b;
    }

    AtomicWorkbenchEngine(Context context, int uid, int user, Handler handler) {
        this(id -> new AtomicWorkbenchPlatform(context, uid, user, handler, id));
    }

    AtomicWorkbenchEngine(Factory factory) { this(factory,AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4); }

    AtomicWorkbenchEngine(Factory factory,AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
        if(factory==null || reader==null) throw new IllegalArgumentException("task_recovery_factory_missing");
        recoveryReader=reader; windows=new AtomicWorkbenchPlatform[reader.poolCount]; recovering=new boolean[reader.poolCount];
        this.factory = factory;
        legacy = createPlatform(-1);
        for (int id = 0; id < windows.length; id++) {
            windows[id] = createPlatform(id);
            if(reader==AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8)
                recovering[id]=windows[id].hasRecoveryPending();
        }
    }

    AtomicWorkbenchRecoveryScope.ReaderProfile recoveryDomain() { return recoveryReader; }
    int recoveryPoolCount() { return windows.length; }
    AtomicWorkbenchRecoveryOwners recoveryOwners() {
        return recoveryReader==AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8
                ? new AtomicWorkbenchRecoveryOwners() {
                    public AtomicWorkbenchRecoveryScope.ReaderProfile readerProfile(){return recoveryReader;}
                    public AtomicWorkbenchPlatform platform(int slot){return taskPlatform(slot);}
                    public boolean recovering(int slot){return taskWindowRecovering(slot);}
                    public AtomicWorkbenchPlatform legacy(){return legacy;}
                }
                : AtomicWorkbenchRecoveryOwners.low4(this);
    }

    Bundle openWindow(int id, Surface surface, int width, int height, int density, String component) {
        return openTaskWindow(id, surface, width, height, density, component, -1);
    }

    Bundle openTaskWindow(int id, Surface surface, int width, int height, int density, String component, int taskId) {
        if (taskController != null && taskController.blocksWindow(id)) { release(surface); return taskOperationBlocked(id); }
        if (valid(id) && AtomicWorkbenchSlotDomain.high(id)) {
            try {
                if (windows[id].needsApplicationAllocation(component, taskId) && !allocationScopeReady(id)) {
                    release(surface); return nativeHomeAdmissionRejected(id, windows[id], "暂存恢复范围尚未确认，已保留原工作区");
                }
            } catch (Exception unknown) {
                release(surface); return nativeHomeAdmissionRejected(id, windows[id], "当前窗口任务身份尚未确认，已保留原工作区");
            }
        }
        ++inputRevision;
        if (!valid(id)) { release(surface); return failed(id, "窗口编号无效"); }
        try {
            Bundle physicalExit = physicalHomeExitFailure();
            if (physicalExit != null) { release(surface); return blockedByCleanup(id, physicalExit); }
            if (legacy.hasStartupFailure() && !legacy.hasRecoveryPending()) legacy = createPlatform(-1);
            if (legacy.hasStartupFailure() || legacy.hasRecoveryPending()) {
                Bundle prior = legacy.hasRecoveryPending() ? legacy.close() : legacy.status();
                if (!prior.getBoolean("success") || prior.getBoolean("recovery_pending")) {
                    release(surface); return blockedByCleanup(id, decorate(-1, prior));
                }
            }
            AtomicWorkbenchPlatform platform = windows[id];
            // An explicitly launched app may have exited while its borrowed HOME
            // remains. Admission depends on the current tasks, not the launch mode.
            if (platform.hasLiveDisplay()) {
                Bundle state = platform.status();
                ArrayList<String> running = state.getStringArrayList("running_packages");
                boolean current = state.getBoolean("success") && "active".equals(state.getString("state"))
                        && !state.getBoolean("recovery_pending") && state.getInt("display_id", -1) > 0
                        && state.getInt("task_count", -1) >= 0 && running != null;
                if (!current) {
                    release(surface); state.putBoolean("success", false); state.putBoolean("existing_session_preserved", true);
                    state.putString("message", "当前窗口任务状态尚未确认，已保留原窗口，请稍后重试");
                    return decorate(id, state);
                }
                if (state.getBoolean("native_home") && state.getInt("home_task_id", -1) >= 0
                        && state.getInt("task_count") == 1 && running.isEmpty()) {
                    if (!allocationScopeReady(id)) { release(surface); return allocationScopeRejected(id); }
                    return decorate(id, platform.openInEmptyHome(surface, width, height, density, component, taskId));
                }
                int slash = component == null ? -1 : component.indexOf('/');
                String requestedPackage = slash > 0 ? component.substring(0, slash) : "";
                if (requestedPackage.isEmpty() || !running.contains(requestedPackage)) {
                    release(surface); state.putBoolean("success", false); state.putBoolean("existing_session_preserved", true);
                    state.putString("message", "窗口中的应用已变化，已保留实际任务，请重新选择应用");
                    return decorate(id, state);
                }
            }
            if (platform.hasStartupFailure() && !platform.hasRecoveryPending() && !platform.hasLiveDisplay())
                windows[id] = platform = createPlatform(id);
            if (recovering[id] || (!platform.hasLiveDisplay() && platform.hasRecoveryPending())) {
                Bundle restored = platform.close();
                recovering[id] = !restored.getBoolean("success") || restored.getBoolean("recovery_pending");
                if (!restored.getBoolean("success") || restored.getBoolean("recovery_pending")) {
                    release(surface); return blockedByCleanup(id, decorate(id, restored));
                }
            }
            boolean existingSession = platform.hasLiveDisplay();
            if (!existingSession && !allocationScopeReady(id)) { release(surface); return allocationScopeRejected(id); }
            Bundle result = existingSession
                    ? platform.attachSurface(surface, width, height, density, component, taskId)
                    : taskId > 0 ? platform.openTask(surface, width, height, density, component, taskId)
                    : platform.open(surface, width, height, density, component);
            if (existingSession && !result.getBoolean("success")) result.putBoolean("existing_session_preserved", true);
            if (result.getBoolean("success") && activeWindow < 0) activeWindow = id;
            if ("recovering".equals(result.getString("state"))) recovering[id] = true;
            return decorate(id, result);
        } catch (RuntimeException error) {
            release(surface); return failed(id, "窗口启动未完成：" + error.getClass().getSimpleName());
        }
    }

    Bundle showNativeHome(int id, Surface surface, int width, int height, int density) {
        if (!valid(id)) { release(surface); return failed(id, "窗口编号无效"); }
        if (taskController != null && taskController.blocksWindow(id)) { release(surface); return taskOperationBlocked(id); }
        final boolean[] transferred = {false};
        try {
        Bundle prior = physicalHomeExitFailure();
        if (prior != null) { release(surface); return blockedByCleanup(id, prior); }
        if (legacy.hasRecoveryPending()) {
            Bundle restored = legacy.close();
            if (!restored.getBoolean("success") || restored.getBoolean("recovery_pending")) {
                release(surface); return blockedByCleanup(id, decorate(-1, restored));
            }
        }
        AtomicWorkbenchPlatform platform = windows[id];
        if (platform.hasStartupFailure() && !platform.hasRecoveryPending() && !platform.hasLiveDisplay())
            windows[id] = platform = createPlatform(id);
        if (recovering[id] || (!platform.hasLiveDisplay() && platform.hasRecoveryPending())) {
            Bundle restored = platform.close();
            recovering[id] = !restored.getBoolean("success") || restored.getBoolean("recovery_pending");
            if (recovering[id]) { release(surface); return blockedByCleanup(id, decorate(id, restored)); }
        }
        final AtomicWorkbenchPlatform selected = platform;
        final AtomicWorkbenchPlatform source = homeOwnerExcept(id);
        Bundle admission = nativeHomeAdmissionFailure(id, selected, source);
        if (admission != null) { release(surface); return admission; }
        Bundle result = switchInputWindow(id, true, () -> {
            transferred[0] = true;
            return selected.showNativeHome(surface, width, height, density, source);
        });
        if (!transferred[0]) { release(surface); transferred[0] = true; }
        if (result.getBoolean("success")) recovering[id] = false;
        return decorate(id, result);
        } catch (RuntimeException error) {
            if (!transferred[0]) release(surface);
            return failed(id, "原生桌面连接未完成：" + error.getClass().getSimpleName());
        }
    }

    Bundle focusAppWindow(int id, String component) {
        if (!valid(id)) return failed(id, "窗口编号无效");
        if (taskController != null && taskController.blocksWindow(id)) return taskOperationBlocked(id);
        // HOME remains owned by this display while any of its applications is in front.
        // Quickstep needs that same HOME task as the destination of an in-display swipe.
        Bundle restored = physicalHomeExitFailure();
        if (restored != null) return blockedByCleanup(id, restored);
        if (recovering[id]) return failed(id, "该窗口正在恢复任务，暂时不能切换");
        final AtomicWorkbenchPlatform source = homeOwnerExcept(id);
        Bundle admission = nativeHomeAdmissionFailure(id, windows[id], source);
        if (admission != null) return admission;
        Bundle result = switchInputWindow(id, true, () -> {
            Bundle backgroundHome = windows[id].ensureNativeHomeBehindApp(source);
            return backgroundHome.getBoolean("success") ? windows[id].focusAppWindow(component) : backgroundHome;
        });
        return decorate(id, result);
    }

    Bundle shareWindow(int id, Intent share, String packageName) {
        if (!valid(id)) return failed(id, "窗口编号无效");
        if (taskController != null && taskController.blocksWindow(id)) return taskOperationBlocked(id);
        Bundle blocked = physicalHomeExitFailure();
        if (blocked != null) return blockedByCleanup(id, blocked);
        if (recovering[id] || !windows[id].hasLiveDisplay()) return failed(id, "目标窗口尚未就绪，请重新选择");
        if (!allocationScopeReady(id)) return allocationScopeRejected(id);
        Bundle result = switchInputWindow(id, false, () -> windows[id].share(share, packageName));
        // Opening a receiver does not confirm input focus; normal promotion will
        // cancel the previous stream and verify focus before any new touch.
        return decorate(id, result);
    }

    /** One HOME lease across all fixed app displays; no responsibility is transferred by memory alone. */
    private Bundle restoreHomes(int except) {
        return restoreHomes(except, true);
    }

    /** The same HOME moves directly between owned displays; empty slots retain their buffers. */
    private AtomicWorkbenchPlatform homeOwnerExcept(int except) {
        for (int id = 0; id < windows.length; id++)
            if (id != except && windows[id].hasNativeHome()) return windows[id];
        return null;
    }

    private Bundle restoreHomes(int except, boolean keepWorkbenchVisible) {
        if (keepWorkbenchVisible) {
            Bundle physicalExit = physicalHomeExitFailure();
            if (physicalExit != null) return physicalExit;
        }
        boolean restoredAny = false;
        for (int id = 0; id < windows.length; id++) {
            if (id == except || !windows[id].hasNativeHome()) continue;
            Bundle restored = windows[id].restoreNativeHome();
            if (!restored.getBoolean("success")) return decorate(id, restored);
            if (keepWorkbenchVisible && restored.getBoolean("physical_home_returned")) {
                restored.putBoolean("success", false);
                restored.putString("message", "系统桌面已返回手机主屏，正在退出工作台");
                return decorate(id, restored);
            }
            restoredAny = true;
            if (windows[id].isHomeOnly()) {
                Bundle state = windows[id].status();
                if (state.getInt("task_count") == 0) {
                    Bundle closed = windows[id].close();
                    if (!closed.getBoolean("success") || closed.getBoolean("recovery_pending")) return decorate(id, closed);
                    recovering[id] = false;
                }
            }
        }
        // Normal HOME reparenting may focus the physical launcher. An internal slot switch
        // must keep the existing workbench Activity visible before focusing the target VD.
        // Full exit and a physical HOME request never take focus back from the launcher.
        if (restoredAny && keepWorkbenchVisible) {
            Bundle host = legacy.focusDefault();
            if (!host.getBoolean("success")) return decorate(-1, host);
        }
        return null;
    }

    private Bundle physicalHomeExitFailure() {
        for (int id = 0; id < windows.length; id++) {
            AtomicWorkbenchPlatform platform = windows[id];
            // Observe an outstanding lease even if a queued operation targets that same slot.
            if (platform.hasNativeHome()) {
                Bundle observed = platform.status();
                // A previous root process may have left a durable HOME record after its VD died.
                // Reconcile that record before letting its failed status block every new opening.
                if (!observed.getBoolean("success") && platform.hasRecoveryPending()) {
                    observed = platform.close();
                    if (observed.getBoolean("success") && !platform.hasRecoveryPending()) {
                        recovering[id] = false;
                        if (activeWindow == id) activeWindow = -1;
                        if (focusedWindow == id) focusedWindow = -1;
                    }
                }
                if (!observed.getBoolean("success") || (!platform.hasLiveDisplay() && observed.getBoolean("recovery_pending")))
                    return decorate(id, observed);
            }
            // status() clears a successfully returned lease. The exit decision must survive it.
            if (platform.physicalHomeReturned()) {
                Bundle state = platform.status();
                state.putBoolean("success", false);
                state.putBoolean("physical_home_returned", true);
                state.putString("message", "系统桌面已返回手机主屏，正在退出工作台");
                return decorate(id, state);
            }
        }
        return null;
    }

    Bundle focusWindow(int id) {
        if (id != -1 && !valid(id)) return failed(id, "窗口编号无效");
        if (id >= 0 && taskController != null && taskController.blocksWindow(id)) return taskOperationBlocked(id);
        // Promotion follows the current system task snapshot, never a stale UI HOME flag.
        Bundle target = id >= 0 ? windows[id].status() : null;
        if (target != null && !target.getBoolean("success")) return decorate(id, target);
        Bundle restoredHome = physicalHomeExitFailure();
        if (restoredHome != null) return blockedByCleanup(id, restoredHome);
        if (id >= 0 && recovering[id]) return failed(id, "该窗口正在恢复任务，暂时不能切换");
        final AtomicWorkbenchPlatform source = id >= 0 ? homeOwnerExcept(id) : null;
        if (id >= 0) {
            Bundle admission = nativeHomeAdmissionFailure(id, windows[id], source);
            if (admission != null) return admission;
        }
        Bundle result = switchInputWindow(id, true, () -> {
            if (id == -1) {
                Bundle homes = restoreHomes(-1);
                return homes == null ? legacy.focusDefault() : blockedByCleanup(id, homes);
            }
            Bundle backgroundHome = windows[id].ensureNativeHomeBehindApp(source);
            return backgroundHome.getBoolean("success") ? windows[id].focusWindow() : backgroundHome;
        });
        return decorate(id, result);
    }

    /** Host controls borrow input focus without moving the native HOME task. */
    Bundle focusInputOnly(int id) {
        if (id != -1) return focusWindow(id);
        return decorate(-1, switchInputWindow(-1, true, () -> legacy.focusDefault()));
    }

    int activeInputWindow() { return activeWindow; }
    long inputRevision() { return inputRevision; }
    private static final class ExtractionInputDown {
        final int window, pointer, device;
        final long before, after, down;
        ExtractionInputDown(int window, long before, long after, MotionEvent event) {
            this.window = window; this.before = before; this.after = after; down = event.getDownTime();
            pointer = event.getPointerId(0); device = event.getDeviceId();
        }
    }
    /** Read-only geometry association. Other leases continue to see the actual incremented input revision. */
    long extractionGeometryInputRevision(long expected, long observed, int window) {
        if (expected == observed) return observed;
        ExtractionInputDown down = extractionInputDown;
        return down != null && down.window == window && activeWindow == window && inputRevision == observed
                && down.before == expected && down.after == observed && expected >= 1 && expected < Long.MAX_VALUE
                && observed == expected + 1 ? expected : -1;
    }
    boolean uiParked() { return uiParked; }

    Bundle updateOutput(int id, Bundle expected, long generation, Surface surface) {
        if (!valid(id) || generation <= 0 || generation < outputGeneration
                || uiParked && surface != null || generation == outputGeneration && (outputAction != 1 || outputWindow != id)) {
            release(surface); return outputFailure(id, "画面请求已过期，原窗口已保留");
        }
        outputGeneration = generation; outputAction = 1; outputWindow = id;
        Bundle result = windows[id].updateOutput(expected, generation, surface);
        if (result.getBoolean("output_request_accepted")) {
            ++inputRevision;
            if (surface == null && activeWindow == id) { activeWindow = -1; focusedWindow = -2; }
        }
        return decorate(id, result);
    }

    /** No task-focus API is called: the physical foreground application keeps its own task. */
    Bundle parkInput() {
        ++inputRevision; activeWindow = -1; focusedWindow = -2;
        boolean success = true, pending = false, cancelPending = false;
        Bundle old = legacy.parkInput();
        success &= old.getBoolean("success"); pending |= old.getBoolean("guard_cleanup_pending");
        cancelPending |= old.getBoolean("input_cancel_pending");
        ArrayList<Bundle> entries = new ArrayList<>();
        for (int id = 0; id < windows.length; id++) {
            Bundle entry = decorate(id, windows[id].parkInput()); entries.add(entry);
            success &= entry.getBoolean("success"); pending |= entry.getBoolean("guard_cleanup_pending");
            cancelPending |= entry.getBoolean("input_cancel_pending");
        }
        Bundle result = new Bundle(); result.putBoolean("success", success); result.putBoolean("guard_cleanup_pending", pending);
        result.putBoolean("input_cancel_pending", cancelPending);
        result.putParcelableArrayList("windows", entries); result.putInt("active_window_id", -1); result.putInt("focused_window_id", -2);
        return result;
    }

    Bundle parkUi(long generation) {
        if (generation <= 0 || generation < outputGeneration
                || generation == outputGeneration && (outputAction != 2 || !uiParked))
            return outputFailure(-1, "工作区暂停请求已过期");
        outputGeneration = generation; outputAction = 2; uiParked = true;
        Bundle cancelled = parkInput();
        boolean success = cancelled.getBoolean("success"), transition = false;
        Bundle legacyOutput = legacy.parkOutput(generation);
        success &= legacyOutput.getBoolean("success"); transition |= legacyOutput.getBoolean("output_transition_pending");
        ArrayList<Bundle> entries = new ArrayList<>();
        for (int id = 0; id < windows.length; id++) {
            Bundle entry = decorate(id, windows[id].parkOutput(generation)); entries.add(entry);
            success &= entry.getBoolean("success"); transition |= entry.getBoolean("output_transition_pending");
        }
        parkFocusPending = !legacy.primaryInputFocusConfirmed();
        Bundle result = outputMetadata(entries);
        result.putBoolean("success", success && !parkFocusPending); result.putBoolean("output_transition_pending", transition);
        result.putBoolean("guard_cleanup_pending", cancelled.getBoolean("guard_cleanup_pending"));
        result.putBoolean("input_cancel_pending", cancelled.getBoolean("input_cancel_pending"));
        result.putBoolean("park_focus_pending", parkFocusPending);
        result.putString("message", success && !parkFocusPending ? "工作区已保留，输入已交回手机当前界面"
                : "工作区和任务已保留，输入或画面仍待核对");
        return result;
    }

    Bundle resumeUi(long generation) {
        if (generation <= 0 || generation < outputGeneration
                || generation == outputGeneration && outputAction != 3)
            return outputFailure(-1, "工作区恢复请求已过期");
        boolean alreadyResumed = generation == outputGeneration && !uiParked;
        outputGeneration = generation; outputAction = 3;
        boolean cleanupNeeded = uiParked || hasOutputCleanupPending();
        if (cleanupNeeded) uiParked = true; // Quarantine an uncertain foreground producer as well.
        boolean parkConfirmed = !cleanupNeeded || retryParkedOutputs(generation);
        ArrayList<Bundle> entries = new ArrayList<>();
        boolean pending = !parkConfirmed;
        for (int id = 0; id < windows.length; id++) {
            Bundle entry = decorate(id, windows[id].outputStatus()); entries.add(entry);
            pending |= entry.getBoolean("guard_cleanup_pending") || entry.getBoolean("output_transition_pending") || entry.getBoolean("input_cancel_pending")
                    || uiParked && (!entry.getBoolean("output_attached_known") || entry.getBoolean("output_attached"));
        }
        Bundle old = legacy.outputStatus();
        pending |= old.getBoolean("guard_cleanup_pending") || old.getBoolean("input_cancel_pending") || old.getBoolean("output_transition_pending")
                || uiParked && (!old.getBoolean("output_attached_known") || old.getBoolean("output_attached"));
        if (pending) {
            Bundle result = outputMetadata(entries); result.putBoolean("success", false);
            result.putString("message", "原画面或输入清理尚未确认，工作区已保留"); return result;
        }
        if (alreadyResumed && !cleanupNeeded) { Bundle result = outputMetadata(entries); result.putBoolean("success", true); return result; }
        outputGeneration = generation; outputAction = 3; uiParked = false; parkFocusPending = false;
        ++inputRevision; activeWindow = -1; focusedWindow = -2;
        Bundle result = outputMetadata(entries); result.putBoolean("success", true);
        result.putString("message", "工作区已准备接回画面，尚未开启应用输入"); return result;
    }

    /** Same-process recovery of uncertain park, with no new display/task or foreground selection. */
    private boolean hasOutputCleanupPending() {
        if (outputCleanupPending(legacy.outputStatus())) return true;
        for (AtomicWorkbenchPlatform platform : windows) if (outputCleanupPending(platform.outputStatus())) return true;
        return false;
    }

    private static boolean outputCleanupPending(Bundle state) {
        return state.getBoolean("output_transition_pending") || !state.getBoolean("output_attached_known")
                || state.getBoolean("guard_cleanup_pending") || state.getBoolean("input_cancel_pending");
    }

    private boolean retryParkedOutputs(long generation) {
        boolean confirmed = parkInput().getBoolean("success");
        confirmed &= legacy.parkOutput(generation).getBoolean("success");
        for (AtomicWorkbenchPlatform platform : windows) confirmed &= platform.parkOutput(generation).getBoolean("success");
        return confirmed;
    }

    private Bundle outputMetadata(ArrayList<Bundle> entries) {
        Bundle old = legacy.outputStatus();
        boolean live = old.getInt("display_id", -1) > 0, recovery = old.getBoolean("task_recovery_pending");
        boolean guard = old.getBoolean("guard_cleanup_pending"), attached = old.getBoolean("output_attached");
        boolean known = old.getBoolean("output_attached_known"), transition = old.getBoolean("output_transition_pending");
        boolean cancel = old.getBoolean("input_cancel_pending");
        for (Bundle entry : entries) {
            live |= entry.getInt("display_id", -1) > 0; recovery |= entry.getBoolean("task_recovery_pending");
            guard |= entry.getBoolean("guard_cleanup_pending"); attached |= entry.getBoolean("output_attached");
            known &= entry.getBoolean("output_attached_known"); transition |= entry.getBoolean("output_transition_pending");
            cancel |= entry.getBoolean("input_cancel_pending");
        }
        Bundle result = new Bundle(); result.putBoolean("ui_parked", uiParked); result.putLong("output_generation", outputGeneration);
        result.putString("state", live ? "active" : recovery ? "recovering" : "closed");
        result.putBoolean("recovery_pending", recovery); result.putBoolean("guard_cleanup_pending", guard);
        result.putBoolean("output_attached", attached); result.putBoolean("output_attached_known", known);
        result.putBoolean("output_transition_pending", transition);
        result.putBoolean("input_cancel_pending", cancel);
        result.putInt("active_window_id", activeWindow); result.putInt("focused_window_id", focusedWindow);
        result.putBoolean("park_focus_pending", parkFocusPending); result.putParcelableArrayList("windows", entries);
        if (recoveryReader == AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8) {
            boolean unconfirmed = old.getBoolean("operation_unconfirmed");
            for (Bundle entry : entries) unconfirmed |= entry.getBoolean("operation_unconfirmed");
            result.putBoolean("operation_unconfirmed", unconfirmed);
            result.putBundle("legacy_recovery", old);
        }
        return result;
    }

    private Bundle outputFailure(int id, String message) {
        Bundle result = failed(id, message); result.putBoolean("ui_parked", uiParked);
        result.putLong("output_generation", outputGeneration); result.putBoolean("park_focus_pending", parkFocusPending);
        return result;
    }

    Bundle windowState(int id) {
        if (valid(id) && taskController != null && taskController.blocksWindow(id)) return taskOperationBlocked(id);
        return valid(id) ? decorate(id, windows[id].status()) : failed(id, "窗口编号无效");
    }

    Bundle cancelActiveInput() {
        ++inputRevision;
        try {
            if (activeWindow >= 0) windows[activeWindow].cancelInput();
            Bundle result = new Bundle(); result.putBoolean("success", true); return result;
        } catch (Exception failure) {
            Bundle result = failed(activeWindow, "原窗口触摸尚未取消，文字未填入");
            result.putBoolean("input_failure", true); return result;
        }
    }

    private interface FocusAction { Bundle run() throws Exception; }

    /** One acknowledged focus-loss/gain cycle per actual active-slot transition. */
    private Bundle switchInputWindow(int target, boolean confirmsFocus, FocusAction action) {
        ++inputRevision;
        int previous = activeWindow, previousFocus = focusedWindow;
        boolean changed = previous != target, guardAttempted = false, actionStarted = false;
        String phase = "cancel";
        Bundle result;
        try {
            if (changed && previous >= 0) {
                windows[previous].cancelInput();
                phase = "guard"; guardAttempted = true;
                windows[previous].suspendInputFocus();
            }
            focusedWindow = -2;
            phase = "target"; actionStarted = true;
            result = action.run();
            if (result.getBoolean("success")) {
                activeWindow = target; focusedWindow = confirmsFocus ? target : -2;
                return result;
            }
        } catch (Exception failure) {
            result = failed(target, "输入焦点切换未完成：" + failure.getClass().getSimpleName());
            result.putBoolean("cancel".equals(phase) ? "input_failure" : "input_focus_failure", true);
        }
        if (result.getBoolean("operation_unconfirmed")) {
            // The target may already have gained focus. Reversing it would hide the
            // real result and make later read-only confirmation impossible.
            activeWindow = previous; focusedWindow = -2;
            return result;
        }
        // A failed promotion must leave its candidate demoted again. Otherwise
        // its old editor could stay window-focused on OWN_FOCUS and miss rebind.
        boolean restored = true;
        if (changed && actionStarted && target >= 0 && windows[target].hasLiveDisplay()
                && !windows[target].hasRecoveryPending()) {
            try { windows[target].cancelInput(); windows[target].suspendInputFocus(); }
            catch (Exception failed) { restored = false; }
        }
        activeWindow = previous;
        if (changed && (guardAttempted || actionStarted)) {
            boolean oldFocused;
            try {
                Bundle old = previous >= 0 ? windows[previous].focusWindow() : legacy.focusDefault();
                oldFocused = old.getBoolean("success");
            } catch (Exception failed) { oldFocused = false; }
            restored &= oldFocused; focusedWindow = oldFocused ? previous : -2;
        } else focusedWindow = actionStarted ? -2 : previousFocus;
        if (!restored) {
            focusedWindow = -2;
            result.putBoolean("input_focus_restore_pending", true);
            result.putString("message", result.getString("message", "输入焦点切换未完成") + "；原窗口焦点仍待恢复，任务已保留");
        }
        return result;
    }

    /** Late packets from a former foreground slot are discarded, not treated as service failure. */
    boolean inject(int id, MotionEvent event) {
        if (uiParked || !valid(id) || id != activeWindow || recovering[id]) return true;
        if (taskController != null && taskController.blocksWindow(id)) return true;
        int action = event.getActionMasked();
        long beforeRevision = inputRevision;
        if (action == MotionEvent.ACTION_DOWN) { extractionInputDown = null; ++inputRevision; }
        else {
            ExtractionInputDown down = extractionInputDown;
            if (down != null && (action != MotionEvent.ACTION_MOVE || event.getPointerCount() != 1
                    || event.getDownTime() != down.down || event.getPointerId(0) != down.pointer || event.getDeviceId() != down.device))
                extractionInputDown = null;
        }
        AtomicWorkbenchPlatform platform = windows[id];
        if (!platform.readyForInput()) { extractionInputDown = null; return true; }
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN && focusedWindow != id) {
            // Reacquiring input must preserve the currently visible native HOME.
            Bundle focus = platform.focusWindow();
            if (focus.getBoolean("success")) focusedWindow = id;
            if (!focus.getBoolean("success")) return !focus.getBoolean("input_failure");
        }
        if (action == MotionEvent.ACTION_DOWN && event.getPointerCount() == 1 && event.getDownTime() >= 0) {
            // Publish before native injection: its independent system monitor may query Root
            // reentrantly. The system broker still requires the exact native injection success
            // and physical/virtual event correlation before issuing any extraction authority.
            extractionInputDown = new ExtractionInputDown(id, beforeRevision, inputRevision, event);
        }
        boolean accepted = false;
        try { accepted = platform.inject(event); return accepted || !platform.inputBackendFailed(); }
        finally { if (!accepted) extractionInputDown = null; }
    }

    boolean key(int id, KeyEvent event) {
        if (uiParked || !valid(id) || id != activeWindow || id != focusedWindow || recovering[id]) return true;
        if (taskController != null && taskController.blocksWindow(id)) return true;
        if (event.getAction() == KeyEvent.ACTION_DOWN) ++inputRevision;
        boolean accepted = windows[id].key(event);
        return accepted || !windows[id].inputBackendFailed();
    }

    Bundle closeWindow(int id) {
        if (!valid(id)) return failed(id, "窗口编号无效");
        if (taskController != null && taskController.blocksWindow(id)) return taskOperationBlocked(id);
        ++inputRevision;
        if (activeWindow == id) { activeWindow = -1; focusedWindow = -2; }
        Bundle result = windows[id].closeWindow();
        recovering[id] = !result.getBoolean("success") || result.getBoolean("recovery_pending");
        if (!recovering[id] && uiParked) {
            activeWindow = -1; focusedWindow = -2;
        } else if (!recovering[id]) {
            Bundle focus = activeWindow >= 0 ? windows[activeWindow].focusWindow() : legacy.focusDefault();
            if (focus.getBoolean("success")) focusedWindow = activeWindow;
            else { focusedWindow = -2; result.putBoolean("focus_restore_pending", true); }
        }
        return decorate(id, result);
    }

    void retryWindowRecovery() {
        if (taskController != null) taskController.maintain();
        if(recoveryReader==AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8 && legacy.hasRecoveryPending()) {
            ++inputRevision; legacy.close();
        }
        for (int id = 0; id < windows.length; id++) {
            Bundle state = windows[id].status();
            if ("recovering".equals(state.getString("state")) && windows[id].hasRecoveryPending()) recovering[id] = true;
            if (recovering[id]) {
                if(valid(id)) closeWindow(id);
                else if(taskController==null || !taskController.blocksWindow(id)) {
                    // Recovery identity is independent of UI eligibility; no new focus or allocation.
                    ++inputRevision;
                    Bundle closed=windows[id].closeWindow();
                    recovering[id]=!closed.getBoolean("success") || closed.getBoolean("recovery_pending");
                }
            }
        }
    }

    Bundle status() {
        // Observe the durable scope on the existing owner lane. This never replays a Task action.
        if(taskController!=null) taskController.refreshStorageScope();
        ArrayList<Bundle> entries = new ArrayList<>();
        Bundle legacyState = recoveryReader == AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8 ? legacy.status() : null;
        boolean successful = legacyState == null || legacyState.getBoolean("success");
        boolean pending = uiParked ? legacy.hasTaskRecoveryPending() : legacy.hasRecoveryPending(), live = false, launching = false;
        Bundle oldOutput = legacy.outputStatus();
        boolean attached = oldOutput.getBoolean("output_attached"), known = oldOutput.getBoolean("output_attached_known");
        boolean outputPending = oldOutput.getBoolean("output_transition_pending"), guardPending = oldOutput.getBoolean("guard_cleanup_pending");
        boolean unconfirmed = oldOutput.getBoolean("operation_unconfirmed")
                || legacyState != null && legacyState.getBoolean("operation_unconfirmed");
        int tasks = 0;
        for (int id = 0; id < windows.length; id++) {
            Bundle entry = decorate(id, windows[id].status());
            if (taskController != null && taskController.blocksWindow(id)) {
                entry.putBoolean("success", false); entry.putBoolean("operation_unconfirmed", true);
                entry.putBoolean("task_operation_pending", true);
            }
            if (recovering[id]) { entry.putString("state", "recovering"); entry.putBoolean("success", false); }
            successful &= entry.getBoolean("success"); pending |= entry.getBoolean(uiParked ? "task_recovery_pending" : "recovery_pending");
            live |= windows[id].hasLiveDisplay(); launching |= "launching".equals(entry.getString("state"));
            tasks += entry.getInt("task_count"); entries.add(entry);
            attached |= entry.getBoolean("output_attached"); known &= entry.getBoolean("output_attached_known");
            outputPending |= entry.getBoolean("output_transition_pending"); guardPending |= entry.getBoolean("guard_cleanup_pending");
            unconfirmed |= entry.getBoolean("operation_unconfirmed");
        }
        if (focusedWindow >= 0 && !windows[focusedWindow].hasInputFocus()) focusedWindow = -2;
        Bundle top = activeWindow >= 0 ? new Bundle(entries.get(activeWindow)) : new Bundle();
        top.putBoolean("success", successful && !legacy.hasStartupFailure()); top.putBoolean("recovery_pending", pending);
        top.putString("state", live ? (launching ? "launching" : "active") : pending ? "recovering" : "closed");
        top.putString("message", live ? "应用窗口保持独立运行" : pending ? "仍有窗口任务待恢复" : "工作区尚未打开应用");
        if (legacyState != null) top.putBundle("legacy_recovery", legacyState);
        else if (legacy.hasRecoveryPending() || legacy.hasStartupFailure()) top.putBundle("legacy_recovery", legacy.status());
        top.putInt("task_count", tasks); top.putInt("active_window_id", activeWindow); top.putInt("focused_window_id", focusedWindow);
        top.putBoolean("ui_parked", uiParked); top.putLong("output_generation", outputGeneration);
        top.putBoolean("output_attached", attached); top.putBoolean("output_attached_known", known);
        top.putBoolean("output_transition_pending", outputPending); top.putBoolean("guard_cleanup_pending", guardPending);
        top.putBoolean("park_focus_pending", parkFocusPending);
        top.putBoolean("operation_unconfirmed", unconfirmed);
        top.putParcelableArrayList("windows", entries);
        describeTaskBackend(top);
        if(recoveryOwnersUnverified()) {
            top.putBoolean("success",false); top.putBoolean("recovery_pending",true);
            top.putBoolean("operation_unconfirmed",true);
            top.putString("message",top.getString("message","")+"；恢复身份读取尚未确认");
        }
        if (taskStorageUnverified()) {
            top.putBoolean("success", false); top.putBoolean("recovery_pending", true);
            top.putBoolean("operation_unconfirmed", true);
            if (!live) top.putString("state", "recovering");
            top.putString("message", top.getString("message", "") + "；历史任务记录仍未核查，请重试");
        } else if(taskController!=null && taskController.hasPending()) {
            // A readable scope is distinct from confirmation that its Tasks were recovered.
            top.putBoolean("success", false); top.putBoolean("recovery_pending", true);
            top.putBoolean("operation_unconfirmed", true);
            if(!live) top.putString("state", "recovering");
            top.putString("message", top.getString("message", "") + "；任务暂存清理尚未确认");
        }
        return top;
    }

    Bundle close() {
        return close(false);
    }

    boolean primaryHomeIsForeground() throws Exception { return legacy.primaryHomeIsForeground(); }

    /** The caller supplies exit intent; task position alone must never manufacture it. */
    Bundle close(boolean focusPrimaryHome) {
        ++inputRevision;
        boolean hadResponsibility = legacy.hasRecoveryPending();
        boolean success = true, pending = false;
        Bundle taskCleanup = taskController == null ? null : taskController.cleanup();
        hadResponsibility |= taskCleanup != null && taskCleanup.getBoolean("had_responsibility");
        if (taskCleanup != null && (!taskCleanup.getBoolean("success") || taskCleanup.getBoolean("cleanup_pending"))) {
            success = false; pending = true;
        }
        ArrayList<Bundle> entries = new ArrayList<>();
        Bundle homeRecovery = restoreHomes(-1, false);
        boolean physicalHomeExit = focusPrimaryHome;
        for (AtomicWorkbenchPlatform platform : windows) physicalHomeExit |= platform.physicalHomeReturned();
        Bundle old = legacy.close();
        success &= old.getBoolean("success") && !old.getBoolean("recovery_pending"); pending |= old.getBoolean("recovery_pending");
        String failure = success ? "" : taskCleanup != null && taskCleanup.getBoolean("cleanup_pending")
                ? "任务暂存的可见性清理尚未确认" : old.getString("message", "旧版工作区尚未恢复");
        if (homeRecovery != null) { success = false; pending = true; failure = homeRecovery.getString("message", "原生桌面恢复未完成"); }
        for (int id = 0; id < windows.length; id++) {
            hadResponsibility |= windows[id].hasLiveDisplay() || windows[id].hasRecoveryPending();
            Bundle closed = decorate(id, windows[id].close()); entries.add(closed);
            recovering[id] = !closed.getBoolean("success") || closed.getBoolean("recovery_pending");
            if (!closed.getBoolean("success") || closed.getBoolean("recovery_pending")) {
                success = false; if (failure.isEmpty()) failure = "窗口 " + (id + 1) + "：" + closed.getString("message", "恢复尚未完成");
            }
            pending |= closed.getBoolean("recovery_pending");
        }
        activeWindow = -1; focusedWindow = -2;
        if(recoveryOwnersUnverified()) {
            success=false; pending=true;
            failure=failure.isEmpty()?"恢复身份读取尚未确认":failure+"；恢复身份读取尚未确认";
        }
        if (taskStorageUnverified()) {
            success = false; pending = true;
            String unknown = "历史任务记录仍未核查，请重试";
            failure = failure.isEmpty() ? "可核对的工作区窗口已归还，" + unknown : failure + "；" + unknown;
        }
        Bundle result = new Bundle(); result.putBoolean("success", success); result.putBoolean("recovery_pending", pending);
        describeTaskBackend(result);
        if (taskStorageUnverified() || recoveryOwnersUnverified()) result.putBoolean("operation_unconfirmed", true);
        result.putString("state", success ? "closed" : "recovering");
        result.putString("message", success ? hadResponsibility ? "全部工作区窗口已关闭，应用任务恢复已确认"
                : "本次工作区未创建，未更改应用任务" : failure);
        result.putBoolean("no_session", !hadResponsibility && success); result.putParcelableArrayList("windows", entries);
        if (recoveryReader == AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8)
            result.putBoolean("operation_unconfirmed", pending);
        result.putInt("focused_window_id", focusedWindow); result.putInt("active_window_id", activeWindow);
        if (recoveryReader == AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8 || !old.getBoolean("success"))
            result.putBundle("legacy_recovery", old);
        if (taskCleanup != null) result.putBundle("task_cleanup", taskCleanup);
        if (success && physicalHomeExit) {
            Bundle homeFocus = legacy.focusPrimaryHome();
            if (!homeFocus.getBoolean("success")) {
                result.putBoolean("focus_restore_pending", true);
                result.putString("message", result.getString("message") + "；系统原生桌面的焦点尚未确认：" + homeFocus.getString("message", ""));
            }
        }
        return result;
    }

    boolean hasRecoveryPending() {
        if(recoveryOwnersUnverified()) return true;
        if (taskStorageUnverified()) return true;
        if (taskController != null && taskController.hasPending()) return true;
        if (legacy.hasRecoveryPending()) return true;
        for (AtomicWorkbenchPlatform platform : windows) if (platform.hasRecoveryPending()) return true;
        return false;
    }

    private boolean recoveryOwnersUnverified() {
        if(recoveryReader!=AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8) return false;
        if(legacy.hasStartupFailure()) return true;
        for(AtomicWorkbenchPlatform platform:windows) if(platform.hasStartupFailure()) return true;
        return false;
    }

    private Bundle decorate(int id, Bundle state) {
        Bundle result = new Bundle(state);
        result.putInt("window_id", id); result.putInt("focused_window_id", focusedWindow); return result;
    }
    private Bundle taskOperationBlocked(int id) {
        Bundle result = valid(id) ? decorate(id, windows[id].status()) : taskUnavailable();
        result.putBoolean("success", false); result.putBoolean("operation_unconfirmed", true);
        result.putBoolean("task_operation_pending", true); result.putString("reason", "task_operation_in_flight");
        result.putString("message", "该任务操作结果仍待核对，请先查询结果"); return result;
    }
    /** Cleanup describes its original owner; it must never become the requested slot's state. */
    private Bundle blockedByCleanup(int id, Bundle prior) {
        Bundle result;
        if (valid(id) && windows[id].hasLiveDisplay()) {
            // A blocked surface/focus change must not erase a target that is already running.
            result = decorate(id, windows[id].status());
            result.putBoolean("no_session", false);
        } else {
            result = failed(id, prior.getString("message", "先前工作区尚未清理完成"));
            result.putBoolean("no_session", true); result.putString("state", "closed");
            result.putBoolean("recovery_pending", false);
            result.putInt("display_id", -1); result.putInt("task_id", -1); result.putInt("home_task_id", -1);
            result.putBoolean("native_home", false); result.putBoolean("home_only", false); result.putInt("task_count", 0);
        }
        result.putBoolean("success", false); result.putBoolean("cleanup_pending", true);
        result.putString("message", prior.getString("message", "先前工作区尚未清理完成"));
        result.putBundle("cleanup_detail", new Bundle(prior));
        return result;
    }
    private Bundle failed(int id, String message) {
        Bundle result = AtomicWorkbenchProtocol.failure(message); result.putInt("window_id", id);
        result.putInt("focused_window_id", focusedWindow); return result;
    }
    private boolean valid(int id) { return recoveryReader.contains(id); }
    private static void release(Surface surface) { if (surface != null) surface.release(); }
}
