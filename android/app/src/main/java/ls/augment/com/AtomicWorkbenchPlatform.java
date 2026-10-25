package ls.augment.com;

import android.annotation.SuppressLint;
import android.app.ActivityOptions;
import android.content.ComponentName;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.hardware.display.DisplayManager;
import android.hardware.display.VirtualDisplay;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.os.UserHandle;
import android.net.Uri;
import android.view.Display;
import android.view.InputDevice;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Phone-only, private ROOT virtual-display backend. Calls belong to one root worker.
 * AtomicWorkbenchRoot.main checks UID 0 and exempts hidden APIs before constructing
 * its endpoint. The method-local BlockedPrivateApi annotations below apply only to
 * this separate app_process VM; ordinary application processes cannot use this backend.
 */
final class AtomicWorkbenchPlatform {
    interface ReadinessReader { Bundle read(Bundle identity) throws Exception; }
    interface FocusController { Bundle control(String action, Bundle identity) throws Exception; }
    interface AllocationScopeFence { void require(int target, int source) throws Exception; }
    private AllocationScopeFence allocationScopeFence;
    void configureAllocationScopeFence(AllocationScopeFence fence) {
        if (fence == null || allocationScopeFence != null) throw new IllegalStateException("allocation_scope_binding");
        allocationScopeFence = fence;
    }
    static final class AllocationScopeRefused extends Exception {
        boolean beforeWal = true;
        AllocationScopeRefused(Exception cause) { super("暂存恢复范围尚未确认，已保留原工作区", cause); }
    }
    private enum HomeMigrationStage { PRE_WAL, WAL_ATTEMPTED, DISPATCH_MAYBE, CONFIRMED, UNWOUND_DURABLE }
    private static void afterHomeWal(Exception failure) {
        if (failure instanceof AllocationScopeRefused denied) denied.beforeWal = false;
    }
    private void requireAllocationScope(AtomicWorkbenchPlatform source) throws AllocationScopeRefused {
        try {
            if (allocationScopeFence == null) throw new IllegalStateException("allocation_scope_reader_missing");
            allocationScopeFence.require(windowId, source == null ? -1 : source.windowId);
        } catch (Exception denied) { throw new AllocationScopeRefused(denied); }
    }
    private final ReadinessReader readinessReader;
    private final FocusController focusController;
    private final Context userContext;
    private final int appUid, userId;
    private final int windowId;
    private final AtomicWorkbenchRecoveryScope.ReaderProfile recoveryReader;
    private final Handler handler;
    private final DisplayManager displays;
    private AtomicWorkbenchJournal journal;
    private AtomicWorkbenchJournal.Record record;
    private VirtualDisplay ownedDisplay;
    private Surface ownedSurface;
    private Surface uncertainOutputSurface;
    private AtomicWorkbenchOutputProtocol outputState = new AtomicWorkbenchOutputProtocol();
    private MotionEvent lastTouch;
    private Object taskService, windowService, inputManager;
    private Method injectMethod;
    private boolean recoveryPending;
    private String message = "工作区尚未启动";
    private long launchGeneration;
    private int taskCount;
    private Exception startupError;
    private boolean launchAttempted, activeGesture;
    private boolean lastOperationFailed;
    private String retainedLaunchFailure = "";
    private long gestureDownTime, gestureEventTime;
    private boolean inputBackendFailed;
    private int requestedTaskId = -1;
    private Object hiddenTaskToken;
    private int observedTaskId = -1;
    private int observedTargetUid = -1;
    private String topComponent = "";
    private boolean nativeHomeVisible, physicalHomeReturned;
    private long homeReadinessAfter;
    private long homeReadinessAfterNanos;
    private boolean homeReusedVisible;
    private String lastReadinessReason = "";
    private final ArrayList<String> runningPackages = new ArrayList<>();
    private Bundle inputFocusLease;
    private boolean inputFocusSuspended, inputFocusTransitionFailed, inputFocusCleanupPending;
    private boolean inputCancelPending, resumeRebindPending;
    private boolean operationUnconfirmed, retainedMediaOperation;
    private int unconfirmedFocusTask = -1;
    private int unconfirmedFocusUid = -1;
    private String unconfirmedFocusComponent = "";

    AtomicWorkbenchPlatform(Context systemContext, int appUid, int userId, Handler handler) {
        this(systemContext, appUid, userId, handler, -1);
    }

    AtomicWorkbenchPlatform(Context systemContext, int appUid, int userId, Handler handler, int windowId) {
        this(systemContext, appUid, userId, handler, windowId, null);
    }

    AtomicWorkbenchPlatform(Context systemContext, int appUid, int userId, Handler handler, int windowId, ReadinessReader readinessReader) {
        this(systemContext, appUid, userId, handler, windowId, readinessReader, null);
    }

    AtomicWorkbenchPlatform(Context systemContext, int appUid, int userId, Handler handler, int windowId,
            ReadinessReader readinessReader, FocusController focusController) {
        this(systemContext,appUid,userId,handler,windowId,readinessReader,focusController,
                AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4);
    }

    AtomicWorkbenchPlatform(Context systemContext,int appUid,int userId,Handler handler,int windowId,
            ReadinessReader readinessReader,FocusController focusController,
            AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
        if (android.os.Process.myUid() != 0) throw new SecurityException("工作区后端只能在手机 ROOT 进程使用");
        if(reader==null || windowId < -1 || windowId >= reader.poolCount)
            throw new IllegalArgumentException("工作区窗口编号无效");
        recoveryReader=reader;
        this.appUid = appUid; this.userId = userId; this.handler = handler;
        this.windowId = windowId;
        this.readinessReader = readinessReader;
        this.focusController = focusController;
        Context resolved = systemContext;
        DisplayManager manager = null;
        try {
            if (appUid < 10000 || userId < 0 || appUid / 100000 != userId) throw new SecurityException("工作区用户无效");
            java.lang.reflect.Constructor<UserHandle> constructor = UserHandle.class.getDeclaredConstructor(int.class);
            constructor.setAccessible(true);
            Method create = Context.class.getDeclaredMethod("createContextAsUser", UserHandle.class, int.class);
            create.setAccessible(true);
            resolved = (Context) create.invoke(systemContext, constructor.newInstance(userId), 0);
            journal = new AtomicWorkbenchJournal(resolved, appUid, userId, windowId, reader);
            journal.acquireLock();
            record = journal.read();
            recoveryPending = record != null;
            if (record == null) journal.releaseLock();
            manager = (DisplayManager) systemContext.getSystemService(Context.DISPLAY_SERVICE);
            if (manager == null) throw new IllegalStateException("显示服务不可用");
        } catch (Exception error) {
            startupError = error;
            // A lock we acquired but could not read may contain our own unresolved journal.
            // A busy lock, in contrast, belongs to another root process and is never cleared here.
            recoveryPending = journal != null && journal.isLocked();
            message = failure(error);
            if (journal != null && !recoveryPending) journal.releaseLock();
        }
        userContext = resolved; displays = manager;
    }

    @SuppressLint("BlockedPrivateApi") // UID-0 app_process VM is exempted by AtomicWorkbenchRoot.main.
    Bundle open(Surface surface, int width, int height, int density, String flattenedComponent) {
        return openInternal(surface, width, height, density, flattenedComponent, -1);
    }

    Bundle openTask(Surface surface, int width, int height, int density, String flattenedComponent, int taskId) {
        if (taskId < 1) { release(surface); return result(false, "待接管任务无效"); }
        return openInternal(surface, width, height, density, flattenedComponent, taskId);
    }

    boolean isHomeOnly() { return record != null && record.homeOnly; }
    boolean hasNativeHome() { return record != null && record.homeTaskId >= 0; }
    boolean physicalHomeReturned() { return physicalHomeReturned; }

    /** Read-only route probe; cached HOME IDs alone cannot authorize the reuse route. */
    boolean needsNativeHomeAllocation() throws Exception {
        if (ownedDisplay == null || record == null || record.homeTaskId < 0) return true;
        requireOwnedDisplay();
        if (hasTaskRecoveryPending()) throw new IllegalStateException("原生桌面恢复责任尚未完成");
        // Never call status/rememberCurrentTasks here: those may recover or persist.
        Object home = recordedHomeTask();
        return home == null || taskDisplay(home) != record.displayId;
    }

    /** Pure initial route probe: a cached component is not evidence of the current owned Task. */
    boolean needsApplicationAllocation(String flattened, int originalTaskId) throws Exception {
        if(!hasLiveDisplay()) return true;
        requireOwnedDisplay();
        if(hasTaskRecoveryPending()) throw new IllegalStateException("task_window_recovery_pending");
        ComponentName selected=ComponentName.unflattenFromString(flattened);
        if(selected==null) throw new IllegalArgumentException("task_component_invalid");
        for(Object task:ownedTasks())
            if(matchesPackage(task,selected.getPackageName()) && (originalTaskId<=0 || taskId(task)==originalTaskId)) return false;
        return true;
    }

    /** Start in the still-owned HOME display; never close or migrate a racing native app. */
    Bundle openInEmptyHome(Surface surface, int width, int height, int density,
            String flattened, int originalTaskId) {
        final boolean mediaScope = AtomicWorkbenchLaunchBoundary.isActive();
        String previousComponent = record == null ? "" : record.component;
        String previousState = record == null ? "" : record.state;
        boolean previousHomeOnly = record != null && record.homeOnly;
        ArrayList<AtomicWorkbenchJournal.TaskOrigin> previousTasks = record == null ? new ArrayList<>() : new ArrayList<>(record.tasks);
        int previousRequestedTask = requestedTaskId;
        boolean metadataChanged = false, dispatched = false, dispatchKnown = false, dispatchMayHaveApplied = false;
        try {
            requireOwnedDisplay();
            if (recoveryPending || !"active".equals(record.state))
                throw new IllegalStateException("原窗口正在恢复，暂时不能打开应用");
            rememberCurrentTasks();
            if (!nativeHomeVisible || record.homeTaskId < 0 || taskCount != 1 || !ownedTasks().isEmpty())
                throw new IllegalStateException("桌面已打开其他应用，已保留实际任务，请重新选择");
            ComponentName component = validateComponent(flattened);
            AtomicWorkbenchLaunchBoundary.require(component.flattenToString());
            List<?> baseline = allTasks();
            for (Object task : baseline) if (taskUser(task) == userId
                    && taskDisplay(task) != Display.DEFAULT_DISPLAY && taskDisplay(task) != record.displayId
                    && matchesPackage(task, component.getPackageName()))
                throw new IllegalStateException("该应用正在其他显示屏运行，请先移回手机主屏");
            Object originalTask = originalTaskId > 0 ? verifiedOriginalTask(originalTaskId, component.getPackageName()) : null;
            if (originalTaskId <= 0) AtomicWorkbenchLaunchBridge.verifyAvailable(tasks());
            requireAllocationScope(null);
            Bundle attached = attachSurface(surface, width, height, density, record.component, requestedTaskId);
            surface = null; // attachSurface consumes the incoming handle on both success and failure.
            if (!attached.getBoolean("success")) throw new IllegalStateException(attached.getString("message"));
            // Re-read after the surface handoff. A later native launch can share this
            // display safely because this route never destroys it or moves its tasks.
            rememberCurrentTasks();
            if (!nativeHomeVisible || record.homeTaskId < 0 || taskCount != 1 || !ownedTasks().isEmpty())
                throw new IllegalStateException("桌面任务已经变化，已保留原窗口，请重新选择");
            requireAllocationScope(null);
            metadataChanged = true;
            for (Object task : baseline) if (taskUser(task) == userId && matchesPackage(task, component.getPackageName())) {
                boolean present = false;
                for (AtomicWorkbenchJournal.TaskOrigin saved : record.tasks) if (saved.taskId == taskId(task)) present = true;
                if (!present) {
                    if (record.tasks.size() >= 256) throw new IllegalStateException("任务恢复记录已满");
                    record.tasks.add(origin(task));
                }
            }
            if (originalTask != null) {
                boolean present = false;
                for (AtomicWorkbenchJournal.TaskOrigin saved : record.tasks) if (saved.taskId == originalTaskId) present = true;
                if (!present) {
                    if (record.tasks.size() >= 256) throw new IllegalStateException("任务恢复记录已满");
                    record.tasks.add(origin(originalTask));
                }
            }
            record.component = component.flattenToString(); record.homeOnly = false;
            requestedTaskId = originalTaskId;
            record.state = "launching"; journal.save(record);
            lastOperationFailed = false; retainedLaunchFailure = ""; recoveryPending = true; launchAttempted = true;
            ActivityOptions options = ActivityOptions.makeBasic(); options.setLaunchDisplayId(record.displayId);
            int startResult;
            if (originalTaskId > 0) {
                verifiedOriginalTask(originalTaskId, component.getPackageName());
                requireAllocationScope(null);
                AtomicWorkbenchLaunchBoundary.require(component.flattenToString());
                dispatched = true; // A transport exception can still follow a successful system mutation.
                Object started = invoke(tasks(), "startActivityFromRecents", new Class<?>[]{int.class, Bundle.class},
                        originalTaskId, options.toBundle());
                if (!(started instanceof Integer)) throw new IllegalStateException("系统未返回原应用任务接管结果");
                startResult = (Integer) started;
            } else {
                Intent intent = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
                        .setComponent(component).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                requireAllocationScope(null);
                AtomicWorkbenchLaunchBoundary.require(component.flattenToString());
                dispatched = true;
                startResult = AtomicWorkbenchLaunchBridge.start(tasks(), intent, options.toBundle(), userId);
            }
            dispatchKnown = true; dispatchMayHaveApplied = startResult >= 0;
            AtomicWorkbenchLaunchBridge.requireAccepted(startResult);
            if (mediaScope) { operationUnconfirmed = retainedMediaOperation = true; unconfirmedFocusTask = -1; recoveryPending = false; }
            message = "正在原工作区桌面打开应用";
            pollLaunchedTask(++launchGeneration, SystemClock.uptimeMillis() + 7000L, true, mediaScope);
            Bundle opened = result(!lastOperationFailed && !operationUnconfirmed, message);
            if (!opened.getBoolean("success")) opened.putBoolean("existing_session_preserved", true);
            return opened;
        } catch (Exception error) {
            if (error instanceof AllocationScopeRefused && !metadataChanged) {
                Bundle unchanged = result(false, error.getMessage());
                unchanged.putBoolean("existing_session_preserved", true); return unchanged;
            }
            if (!dispatched && metadataChanged && record != null) {
                record.component = previousComponent; record.homeOnly = previousHomeOnly;
                record.state = previousState; requestedTaskId = previousRequestedTask;
                record.tasks.clear(); record.tasks.addAll(previousTasks);
                try { journal.save(record); recoveryPending = false; }
                catch (Exception persistenceFailure) {
                    retainExistingLaunchFailure("启动预约保存失败，原窗口仍保留，请重试或退出恢复");
                }
            } else if (mediaScope && dispatched && (!dispatchKnown || dispatchMayHaveApplied)) {
                retainMediaOperation("未确认媒体应用启动，原窗口及实际任务已保留", -1);
            } else if (dispatched) {
                retainExistingLaunchFailure("未确认应用启动，原窗口及实际任务已保留：" + failure(error));
            }
            Bundle rejected = result(false, "应用未打开：" + failure(error));
            rejected.putBoolean("operation_unconfirmed", mediaScope && dispatched && (!dispatchKnown || dispatchMayHaveApplied));
            rejected.putBoolean("existing_session_preserved", true);
            diagnostic("launch_failure", flattened, record == null ? -1 : record.displayId,
                    "route=existing_home;dispatched=" + dispatched, error);
            return rejected;
        } finally { release(surface); }
    }

    /** Every promoted application display keeps the real HOME available behind its app. */
    Bundle ensureNativeHomeBehindApp() {
        return ensureNativeHomeBehindApp(null);
    }

    Bundle ensureNativeHomeBehindApp(AtomicWorkbenchPlatform source) {
        try {
            requireOwnedDisplay();
            if (hasTaskRecoveryPending()) throw new IllegalStateException("原生桌面恢复责任尚未完成");
            if (record.homeTaskId >= 0) {
                rememberCurrentTasks();
                if (record.homeTaskId >= 0) return result(true, "原生桌面保持在当前工作区");
            }
            ComponentName component = primaryHomeComponent();
            if (source != null) receiveNativeHome(source, component);
            else borrowNativeHome(component, findPrimaryHome(component));
            enableHomeDecors();
            rememberCurrentTasks();
            return result(true, "当前工作区已保留原生桌面");
        } catch (Exception error) {
            if (error instanceof AllocationScopeRefused denied && denied.beforeWal) {
                Bundle unchanged = result(false, error.getMessage());
                unchanged.putBoolean("existing_session_preserved", true); return unchanged;
            }
            diagnostic("native_home_failure", record == null ? "" : record.homeComponent,
                    record == null ? -1 : record.displayId, "route=background_home", error);
            // Preserve the app and its display; a failed HOME migration is not an app close.
            lastOperationFailed = true;
            return result(false, "原生桌面手势接入尚未确认：" + failure(error));
        }
    }

    private void borrowNativeHome(ComponentName home, Object homeTask) throws Exception {
        HomeMigrationStage stage = HomeMigrationStage.PRE_WAL;
        boolean previousPending = recoveryPending;
        try {
            homeReusedVisible = false;
            if (taskDisplay(homeTask) != 0) throw new IllegalStateException("原生桌面不在手机主屏，未迁移其他显示屏任务");
            requireAllocationScope(null);
            int task = taskId(homeTask);
            stage = HomeMigrationStage.WAL_ATTEMPTED;
            recoveryPending = true;
            record.homeTaskId = task; record.homeComponent = home.flattenToString();
            record.homeOriginDisplay = 0; record.homeMigrationPending = true; journal.save(record);
            launchAttempted = true;
            diagnostic("native_home_request", record.homeComponent, record.displayId,
                    "task=" + record.homeTaskId + ";source_display=0;target_display=" + record.displayId + ";phase=persisted", null);
            homeReadinessAfter = SystemClock.uptimeMillis(); homeReadinessAfterNanos = System.nanoTime();
            requireAllocationScope(null);
            int encoded = Math.subtractExact(-1000000, record.homeTaskId);
            stage = HomeMigrationStage.DISPATCH_MAYBE;
            try { invoke(tasks(), "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class}, encoded, record.displayId); }
            catch (Exception error) { throw new IllegalStateException("原生桌面接入未确认，请检查系统框架状态并重启手机后重试", error); }
            Object confirmed = recordedHomeTask();
            if (confirmed == null || taskDisplay(confirmed) != record.displayId)
                throw new IllegalStateException("未确认原生桌面进入工作区，恢复依据已保留");
            record.homeMigrationPending = false; journal.save(record);
            stage = HomeMigrationStage.CONFIRMED; recoveryPending = previousPending;
        } catch (Exception failure) {
            if (stage != HomeMigrationStage.PRE_WAL) {
                afterHomeWal(failure); recoveryPending = true;
                if (record.homeTaskId >= 0) record.homeMigrationPending = true;
                try {
                    // Absence, a replacement task or a different display is not an undo acknowledgement.
                    Object observed = recordedHomeTask();
                    if (observed == null || taskDisplay(observed) != 0)
                        throw new IllegalStateException("原生桌面撤销位置尚未确认");
                    verifyPrimaryHomeTask();
                    if (journal.originalStorageMissing()) throw new IllegalStateException("原生桌面撤销存储尚未确认");
                    clearHomeRecord();
                    stage = HomeMigrationStage.UNWOUND_DURABLE; recoveryPending = previousPending;
                } catch (Exception undoFailure) { failure.addSuppressed(undoFailure); }
            }
            throw failure;
        }
    }

    /** Persist both sides before moving; the source never discards the only undo record. */
    private void receiveNativeHome(AtomicWorkbenchPlatform source, ComponentName component) throws Exception {
        requireDisplayIdentity(); source.requireOwnedDisplay();
        if (source == this || source.appUid != appUid || source.userId != userId || source.hasTaskRecoveryPending() || source.record.homeTaskId < 0
                || !source.record.homeComponent.equals(component.flattenToString()))
            throw new SecurityException("原生桌面移交身份未确认");
        Object home = source.recordedHomeTask();
        if (home == null || taskDisplay(home) != source.record.displayId)
            throw new IllegalStateException("原生桌面移交来源未确认");
        HomeMigrationStage stage = HomeMigrationStage.PRE_WAL;
        boolean targetWalAttempted = false;
        boolean previousPending = recoveryPending, sourcePreviousPending = source.recoveryPending;
        int task = source.record.homeTaskId, from = source.record.displayId;
        try {
            requireAllocationScope(source);
            source.cancelTouch(); homeReusedVisible = false; source.homeReusedVisible = false;
            stage = HomeMigrationStage.WAL_ATTEMPTED;
            recoveryPending = true; source.recoveryPending = true;
            source.record.homeTransferDisplay = record.displayId;
            source.record.homeTransferName = record.displayName; source.record.homeTransferUniqueId = record.uniqueId;
            source.record.homeMigrationPending = true; source.journal.save(source.record);
            targetWalAttempted = true;
            record.homeTaskId = task; record.homeComponent = component.flattenToString();
            record.homeMigrationPending = true; journal.save(record); launchAttempted = true;
            homeReadinessAfter = SystemClock.uptimeMillis(); homeReadinessAfterNanos = System.nanoTime();
            diagnostic("native_home_transfer", record.homeComponent, record.displayId,
                    "task=" + task + ";source_display=" + from + ";target_display=" + record.displayId + ";phase=persisted", null);
            requireAllocationScope(source);
            stage = HomeMigrationStage.DISPATCH_MAYBE;
            invoke(tasks(), "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class}, Math.subtractExact(-1000000, task), record.displayId);
            home = recordedHomeTask();
            if (home == null || taskDisplay(home) != record.displayId)
                throw new IllegalStateException("原生桌面移交结果未确认");
            record.homeMigrationPending = false; journal.save(record);
            source.clearHomeRecord();
            source.rememberCurrentTasks();
            stage = HomeMigrationStage.CONFIRMED;
            recoveryPending = previousPending; source.recoveryPending = sourcePreviousPending;
            diagnostic("native_home_transfer", record.homeComponent, record.displayId,
                    "task=" + task + ";source_display=" + from + ";target_display=" + record.displayId + ";phase=confirmed;retained_display=true", null);
        } catch (Exception failure) {
            if (stage != HomeMigrationStage.PRE_WAL) {
                afterHomeWal(failure); recoveryPending = true; source.recoveryPending = true;
                if (record.homeTaskId >= 0) record.homeMigrationPending = true;
                if (source.record.homeTaskId >= 0) source.record.homeMigrationPending = true;
                try {
                    source.requireOwnedDisplay();
                    Object observed = source.recordedHomeTask();
                    if (observed == null || taskId(observed) != task || taskDisplay(observed) != from)
                        throw new IllegalStateException("原生桌面移交撤销位置尚未确认");
                    // The source WAL remains authoritative until the destination undo is durable.
                    if (targetWalAttempted) {
                        if (journal.originalStorageMissing()) throw new IllegalStateException("原生桌面移交撤销存储尚未确认");
                        clearHomeRecord();
                    }
                    source.clearHomeTransferRecord();
                    stage = HomeMigrationStage.UNWOUND_DURABLE;
                    recoveryPending = previousPending; source.recoveryPending = sourcePreviousPending;
                } catch (Exception undoFailure) { failure.addSuppressed(undoFailure); }
            }
            throw failure;
        }
    }

    private void clearHomeTransferRecord() throws Exception {
        int transfer = record.homeTransferDisplay;
        String name = record.homeTransferName, unique = record.homeTransferUniqueId;
        boolean pending = record.homeMigrationPending;
        record.homeTransferDisplay = -1; record.homeTransferName = ""; record.homeTransferUniqueId = "";
        record.homeMigrationPending = false;
        try { journal.save(record); }
        catch (Exception failure) {
            record.homeTransferDisplay = transfer; record.homeTransferName = name; record.homeTransferUniqueId = unique;
            record.homeMigrationPending = pending; throw failure;
        }
    }

    private void enableHomeDecors() throws Exception {
        invoke(window(), "setShouldShowSystemDecors", new Class<?>[]{int.class, boolean.class}, record.displayId, true);
        if (!Boolean.TRUE.equals(invoke(window(), "shouldShowSystemDecors", new Class<?>[]{int.class}, record.displayId)))
            throw new IllegalStateException("系统未启用该工作区的原生导航栏");
    }

    /** Borrows the existing primary HOME; never launches SECONDARY_HOME or a replacement grid. */
    Bundle showNativeHome(Surface surface, int width, int height, int density) {
        return showNativeHome(surface, width, height, density, null);
    }

    @SuppressLint("BlockedPrivateApi") // UID0-only backend; Root.main exempts this VM before constructing the engine.
    Bundle showNativeHome(Surface surface, int width, int height, int density, AtomicWorkbenchPlatform source) {
        boolean existingDisplay = ownedDisplay != null;
        try {
            homeReusedVisible = false;
            if (startupError != null) throw startupError;
            if (surface == null || !surface.isValid() || width < 240 || height < 240 || width > 4096
                    || height > 4096 || (long) width * height > 12_000_000L || density < 120 || density > 640)
                throw new IllegalArgumentException("工作区显示尺寸或画面无效");
            // Resume an existing slot before consuming its replacement Surface or
            // touching the HOME lease. A guard error must preserve that session.
            if (existingDisplay && hasTaskRecoveryPending()) throw new IllegalStateException("原生桌面恢复责任尚未完成");
            if (existingDisplay) restoreInputFocus();
            if (source == null && ownedDisplay != null && record != null && record.homeTaskId >= 0 && !record.homeMigrationPending) {
                rememberCurrentTasks();
                homeReusedVisible = record.homeTaskId >= 0 && nativeHomeVisible && !recoveryPending;
            }
            if (ownedDisplay == null && record != null) {
                Bundle recovered = close();
                if (!recovered.getBoolean("success")) { release(surface); return recovered; }
            }
            ComponentName home = primaryHomeComponent();
            Object homeTask = source == null && !hasNativeHome() ? findPrimaryHome(home) : null;
            if (ownedDisplay == null) {
                journal.acquireLock(); verifyRequiredInterfaces();
                requireAllocationScope(source);
                record = new AtomicWorkbenchJournal.Record(appUid, userId, windowId);
                record.width = width; record.height = height; record.density = density; record.homeOnly = true;
                journal.save(record); recoveryPending = true;
                int flags = workbenchDisplayFlags();
                requireAllocationScope(source);
                ownedDisplay = displays.createVirtualDisplay(record.displayName, width, height, density, surface, flags);
                if (ownedDisplay == null || ownedDisplay.getDisplay() == null) throw new IllegalStateException("系统未创建桌面显示屏");
                ownedSurface = surface; surface = null; outputState.externalAttached();
                Display display = ownedDisplay.getDisplay(); record.displayId = display.getDisplayId(); record.uniqueId = uniqueId(display);
                requireDisplayIdentity();
                requireDisplayPolicy(display);
                int required = AtomicWorkbenchDisplayPolicy.requiredFocusFlags();
                if ((display.getFlags() & required) != required) throw new SecurityException("桌面显示屏缺少可信与独立焦点能力");
                journal.save(record);
                configurePhoneKeyboard();
            } else {
                Bundle attached = attachSurface(surface, width, height, density, record.component, requestedTaskId);
                surface = null;
                if (!attached.getBoolean("success")) return attached;
            }
            if (record.homeTaskId < 0) {
                // A normal system rejects this impossible task ID. Only our authenticated system hook
                // decodes it, so missing/partially installed routing hooks fail before moving HOME.
                if (source == null) borrowNativeHome(home, homeTask);
                else receiveNativeHome(source, home);
            } else {
                // A newly attached consumer surface needs a new drawn observation even
                // when the same HOME and wallpaper connector stayed on this display.
                homeReadinessAfter = SystemClock.uptimeMillis(); homeReadinessAfterNanos = System.nanoTime();
                invoke(tasks(), "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class},
                        Math.subtractExact(-1000000, record.homeTaskId), record.displayId);
            }
            Object confirmed = recordedHomeTask();
            if (confirmed == null || taskDisplay(confirmed) != record.displayId)
                throw new IllegalStateException("未确认原生桌面进入工作区");
            enableHomeDecors();
            restoreInputFocus();
            invoke(tasks(), "setFocusedTask", new Class<?>[]{int.class}, record.homeTaskId);
            Object focusedHome = invoke(tasks(), "getFocusedRootTaskInfo", new Class<?>[0]);
            if (focusedHome == null || taskId(focusedHome) != record.homeTaskId || taskUser(focusedHome) != userId
                    || taskDisplay(focusedHome) != record.displayId)
                throw new IllegalStateException("系统尚未将输入焦点交给原生桌面");
            resumeRebindPending = false;
            record.state = "active"; journal.save(record); launchAttempted = true;
            physicalHomeReturned = false; lastOperationFailed = false; retainedLaunchFailure = ""; recoveryPending = false;
            rememberCurrentTasks();
            if (!nativeHomeVisible) throw new IllegalStateException("原生桌面已迁移，但尚未成为工作区前台");
            diagnostic("native_home_confirmed", record.homeComponent, record.displayId, "task=" + record.homeTaskId, null);
            return result(true, "已显示系统原生桌面");
        } catch (Exception error) {
            release(surface);
            if (error instanceof AllocationScopeRefused denied && denied.beforeWal && (record == null || existingDisplay)) {
                Bundle unchanged = result(false, error.getMessage());
                unchanged.putBoolean("existing_session_preserved", true); return unchanged;
            }
            diagnostic("native_home_failure", record == null ? "" : record.homeComponent,
                    record == null ? -1 : record.displayId, "", error);
            if (existingDisplay && inputFocusTransitionFailed) {
                Bundle preserved = result(false, "原生桌面输入焦点尚未恢复，原窗口已保留：" + failure(error));
                preserved.putBoolean("existing_session_preserved", true);
                return preserved;
            }
            Bundle restored = restoreNativeHome();
            String reason = failure(error) + (restored.getBoolean("success") ? "" : "；" + restored.getString("message", "桌面恢复未完成"));
            boolean sourceUndoPending = source != null && source.hasTaskRecoveryPending();
            if (sourceUndoPending) recoveryPending = true;
            if (record != null && record.homeOnly && restored.getBoolean("success") && !sourceUndoPending) close();
            lastOperationFailed = true; return result(false, reason);
        }
    }

    /** Positive IDs retain compatibility with normal recovery; the hook handles HOME root collisions. */
    Bundle restoreNativeHome() {
        try {
            restoreNativeHomeInternal(false);
            return result(true, "原生桌面已归还手机主屏");
        } catch (Exception error) {
            recoveryPending = true; lastOperationFailed = true;
            if (record != null) {
                record.state = "recovering";
                try { if (!journal.originalStorageMissing()) journal.save(record); } catch (Exception ignored) { }
            }
            diagnostic("native_home_restore_failure", record == null ? "" : record.homeComponent,
                    record == null ? -1 : record.displayId, "", error);
            return result(false, "原生桌面恢复尚未完成：" + failure(error));
        }
    }

    private void restoreNativeHomeInternal(boolean externalReturn) throws Exception {
        if (record == null || record.homeTaskId < 0) return;
        try { cancelTouch(); }
        catch (Exception failure) {
            diagnostic("input_injection_failure", record.homeComponent, record.displayId, "route=home_restore_cancel", failure);
        }
        Object home = recordedHomeTask();
        boolean primaryVerified = false;
        if (home == null) {
            // A dead VD plus an absent exact ID is an expected reboot/recreation path.
            // Retire it directly instead of first issuing an intentionally failing verify.
            Display prior = record.displayId > 0 ? displays.getDisplay(record.displayId) : null;
            boolean absent = true;
            for (Object task : completeTaskSnapshots()) if (taskId(task) == record.homeTaskId) absent = false;
            if (absent && (prior == null || !sameDisplay(prior, record))) { reconcileRecreatedHome(); return; }
            // A restored HOME may be an intermediate Task: neither root nor leaf snapshots
            // enumerate it. Ask system_server for the exact task and its actual ancestry first.
            try { verifyPrimaryHomeTask(); primaryVerified = true; }
            catch (Exception unconfirmed) { reconcileRecreatedHome(); return; }
        }
        int sourceDisplay = home == null ? -1 : taskDisplay(home);
        if (sourceDisplay > 0) {
            Display display = displays.getDisplay(sourceDisplay);
            boolean own = sourceDisplay == record.displayId && display != null && sameDisplay(display, record);
            boolean handoff = sourceDisplay == record.homeTransferDisplay && display != null
                    && record.homeTransferName.equals(display.getName()) && record.homeTransferUniqueId.equals(uniqueId(display))
                    && Integer.valueOf(0).equals(invoke(display, "getOwnerUid", new Class<?>[0]));
            if (!own && !handoff)
                throw new SecurityException("原生桌面的显示身份已变化，恢复记录已保留");
            record.homeMigrationPending = true;
            if (!journal.originalStorageMissing()) journal.save(record);
            diagnostic("native_home_restore", record.homeComponent, record.displayId,
                    "task=" + record.homeTaskId + ";source_display=" + sourceDisplay + ";target_display=0;phase=request", null);
            invoke(tasks(), "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class}, record.homeTaskId, 0);
            home = recordedHomeTask();
            if (home != null && taskDisplay(home) != 0) throw new IllegalStateException("原生桌面归还位置尚未确认，恢复依据已保留");
        }
        // Cached TaskInfo.displayId alone cannot prove a completed WindowContainer.reparent.
        if (!primaryVerified) verifyPrimaryHomeTask();
        // Position proves recovery only. It cannot identify the user's gesture or exit intent.
        int savedId = record.homeTaskId; String savedComponent = record.homeComponent;
        clearHomeRecord();
        diagnostic("native_home_restored", savedComponent, 0, "task=" + savedId
                + ";source_display=" + sourceDisplay + ";target_display=0;phase=confirmed;exit_intent=unproven", null);
    }

    private void clearHomeRecord() throws Exception {
        homeReusedVisible = false;
        int id = record.homeTaskId, transfer = record.homeTransferDisplay;
        String component = record.homeComponent, name = record.homeTransferName, unique = record.homeTransferUniqueId;
        boolean pending = record.homeMigrationPending;
        record.homeTaskId = -1; record.homeComponent = ""; record.homeMigrationPending = false;
        record.homeTransferDisplay = -1; record.homeTransferName = ""; record.homeTransferUniqueId = "";
        try { if (!journal.originalStorageMissing()) journal.save(record); nativeHomeVisible = false; }
        catch (Exception failure) {
            record.homeTaskId = id; record.homeComponent = component; record.homeMigrationPending = pending;
            record.homeTransferDisplay = transfer; record.homeTransferName = name; record.homeTransferUniqueId = unique;
            throw failure;
        }
    }

    private void verifyPrimaryHomeTask() throws Exception {
        if (!record.homeComponent.equals(primaryHomeComponent().flattenToString()))
            throw new IllegalStateException("系统默认桌面已变化，原恢复依据已保留");
        // Reserved negative target carries the expected user, separate from -1-user retirement.
        // The hook checks exact task ID, user, default HOME identity and real primary ancestry.
        invoke(tasks(), "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class},
                Math.subtractExact(-1000000, record.homeTaskId), Math.addExact(Integer.MIN_VALUE, userId));
    }

    /** A reboot/display teardown may destroy a HOME task rather than return its old ID. */
    private void reconcileRecreatedHome() throws Exception {
        Display prior = record.displayId > 0 ? displays.getDisplay(record.displayId) : null;
        if (prior != null && sameDisplay(prior, record))
            throw new IllegalStateException("未找到已记录的原生桌面任务，恢复依据已保留");
        List<?> snapshots = completeTaskSnapshots();
        // Absence, not a different user/component with the same ID, discharges this old lease.
        for (Object task : snapshots) if (taskId(task) == record.homeTaskId)
            throw new IllegalStateException("原生桌面任务编号仍存在但身份未确认，恢复依据已保留");
        ComponentName primary = primaryHomeComponent();
        if (!record.homeComponent.equals(primary.flattenToString()))
            throw new IllegalStateException("系统默认桌面已变化，原恢复依据已保留");
        Object replacement = null;
        for (Object task : snapshots) if (taskUser(task) == userId && taskDisplay(task) == 0
                && (Integer) invoke(task, "getActivityType", new Class<?>[0]) == 2
                && record.homeComponent.equals(component(task))) { replacement = task; break; }
        if (replacement == null) throw new IllegalStateException("尚未确认系统已重建主屏桌面，恢复依据已保留");
        // Dedicated UID-0 handshake confirms framework ancestry and absence under its global lock,
        // and retires a matching stale hook lease. An old/missing hook rejects the impossible target.
        invoke(tasks(), "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class},
                Math.subtractExact(-1000000, record.homeTaskId), Math.subtractExact(-1, userId));
        int savedId = record.homeTaskId; String savedComponent = record.homeComponent;
        if (!journal.originalStorageMissing()) journal.archiveRecreatedHome(record, taskId(replacement));
        clearHomeRecord();
        diagnostic("native_home_recreated", savedComponent, 0, "old_task=" + savedId
                + ";replacement_task=" + taskId(replacement) + ";evidence=archived;exit_intent=unproven", null);
    }

    private ComponentName primaryHomeComponent() throws Exception {
        Intent intent = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME);
        ResolveInfo resolved = userContext.getPackageManager().resolveActivity(intent, PackageManager.MATCH_DEFAULT_ONLY);
        ActivityInfo activity = resolved == null ? null : resolved.activityInfo;
        if (activity == null || !activity.enabled || !activity.exported || activity.applicationInfo == null
                || activity.applicationInfo.uid / 100000 != userId || (activity.flags & 0x10000) == 0)
            throw new IllegalStateException("当前系统主桌面不支持安全迁移到工作区");
        return new ComponentName(activity.packageName, activity.name);
    }

    private Object findPrimaryHome(ComponentName home) throws Exception {
        if (record != null && record.homeTaskId >= 0) {
            Object existing = recordedHomeTask();
            if (existing != null && taskDisplay(existing) == record.displayId) return existing;
            throw new IllegalStateException("原生桌面已离开工作区，请返回系统桌面后重新打开工作台");
        }
        for (Object task : allTasks()) if (taskUser(task) == userId && taskDisplay(task) == 0
                && (Integer) invoke(task, "getActivityType", new Class<?>[0]) == 2
                && home.flattenToString().equals(component(task))) return task;
        throw new IllegalStateException("未找到手机主屏的真实桌面任务，请先回到系统桌面再打开工作台");
    }

    private Object recordedHomeTask() throws Exception {
        if (record == null || record.homeTaskId < 0) return null;
        for (Object task : completeTaskSnapshots()) if (taskId(task) == record.homeTaskId && taskUser(task) == userId
                && record.homeComponent.equals(component(task))
                && (Integer) invoke(task, "getActivityType", new Class<?>[0]) == 2) return task;
        return null;
    }

    private List<Object> completeTaskSnapshots() throws Exception {
        List<Object> snapshots = new ArrayList<>(); snapshots.addAll(allTasks());
        // A HOME root can become a child of a replacement primary HOME during safe recovery.
        Object running = invoke(tasks(), "getTasks", new Class<?>[]{int.class, boolean.class, boolean.class, int.class},
                1024, false, false, -1);
        if (!(running instanceof List<?>) || ((List<?>) running).size() >= 1024)
            throw new IllegalStateException("原生桌面的完整任务快照暂不可用");
        snapshots.addAll((List<?>) running);
        return snapshots;
    }

    Bundle focusAppWindow(String flattened) {
        final boolean mediaScope = AtomicWorkbenchLaunchBoundary.isActive();
        boolean dispatched = false;
        int selectedTask = -1, selectedUid = -1;
        String attemptedComponent = "";
        try {
            requireOwnedDisplay();
            ComponentName selected = ComponentName.unflattenFromString(flattened == null ? "" : flattened);
            if (selected == null) throw new IllegalArgumentException("应用入口无效");
            for (Object task : ownedTasks()) if (taskUser(task) == userId && matchesPackage(task, selected.getPackageName())) {
                attemptedComponent = selected.flattenToString(); selectedTask = taskId(task);
                AtomicWorkbenchLaunchBoundary.require(selected.flattenToString());
                if (mediaScope) {
                    selectedUid = mediaPackageUid(selected);
                    if (!mediaFocusTargetMatches(task, selectedTask, selected, selectedUid))
                        throw new SecurityException("媒体目标任务身份尚未确认");
                }
                configurePhoneKeyboard(); restoreInputFocus();
                AtomicWorkbenchLaunchBoundary.require(selected.flattenToString());
                dispatched = true;
                invoke(tasks(), "setFocusedTask", new Class<?>[]{int.class}, selectedTask);
                Object focused = invoke(tasks(), "getFocusedRootTaskInfo", new Class<?>[0]);
                if (focused == null || taskId(focused) != taskId(task) || taskDisplay(focused) != record.displayId)
                    throw new IllegalStateException("系统尚未聚焦所选应用");
                if (mediaScope && !mediaFocusTargetMatches(focused, selectedTask, selected, selectedUid))
                    throw new SecurityException("媒体目标任务身份已经变化");
                resumeRebindPending = false;
                clearMediaOperation();
                rememberCurrentTasks(); return result(true, "已切换到该应用");
            }
            throw new IllegalStateException("该应用当前不在此窗口运行");
        } catch (Exception error) {
            diagnostic("focus_failure", flattened, record == null ? -1 : record.displayId, "route=app", error);
            if (mediaScope && dispatched) {
                unconfirmedFocusComponent = attemptedComponent; unconfirmedFocusUid = selectedUid;
                retainMediaOperation("媒体应用切换结果尚未确认，原窗口和任务已保留", selectedTask);
            }
            Bundle failed = result(false, failure(error)); failed.putBoolean("operation_unconfirmed", mediaScope && dispatched);
            return failed;
        }
    }

    /** Open only the selected window's public share receiver; the user chooses recipients there. */
    Bundle share(Intent supplied, String packageName) {
        boolean dispatched = false;
        final boolean browserSearch = supplied != null && Intent.ACTION_VIEW.equals(supplied.getAction());
        try {
            requireOwnedDisplay();
            requireDisplayPolicy(ownedDisplay.getDisplay());
            Bundle exact = supplied == null ? null : supplied.getBundleExtra(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET);
            requireShareTarget(exact);
            if (packageName == null || !packageName.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)*"))
                throw new IllegalArgumentException("分享目标应用无效");
            if (exact != null && !packageName.equals(exact.getString("package", "")))
                throw new IllegalArgumentException("目标应用与所选窗口不一致");
            boolean present = false;
            for (Object task : ownedTasks()) if (matchesPackage(task, packageName)) { present = true; break; }
            Intent outgoing = browserSearch ? AtomicWorkbenchBrowserSearch.sanitize(supplied, packageName) : safeShareIntent(supplied, packageName);
            if (browserSearch && (exact == null || !present
                    || AtomicWorkbenchBrowserSearch.textReceiver(userContext, packageName, exact.getInt("target_uid", -1)) == null))
                throw new IllegalStateException(AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED);
            ComponentName selected = outgoing.getComponent();
            if (!present && selected == null) throw new IllegalStateException("目标应用已离开此工作区，请重新选择目标窗口");
            PackageManager pm = userContext.getPackageManager();
            ComponentName receiver = null;
            // An explicit-component query bypasses intent-filter matching on Android.
            // Re-query implicitly with the real action/MIME before accepting that branch.
            Intent query = browserSearch ? new Intent(Intent.ACTION_VIEW, outgoing.getData()).addCategory(Intent.CATEGORY_BROWSABLE).setPackage(packageName)
                    : new Intent(outgoing.getAction()).setType(outgoing.getType()).setPackage(packageName);
            for (ResolveInfo resolved : pm.queryIntentActivities(query, PackageManager.MATCH_DEFAULT_ONLY)) {
                ActivityInfo activity = resolved.activityInfo;
                if (activity == null || !activity.enabled || !activity.exported || activity.applicationInfo == null
                        || !activity.applicationInfo.enabled || activity.applicationInfo.uid / 100000 != userId
                        || !packageName.equals(activity.packageName)
                        || browserSearch && activity.applicationInfo.uid != exact.getInt("target_uid", -1)
                        || activity.permission != null && !activity.permission.isEmpty()) continue;
                ComponentName candidate = new ComponentName(activity.packageName, activity.name);
                if (selected != null && !selected.equals(candidate)) continue;
                receiver = candidate;
                break;
            }
            if (receiver == null) throw new IllegalStateException(browserSearch ? AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED : "目标应用没有可接收此类内容的公开分享入口");
            requireAllocationScope(null); // Both present and absent receivers launch new work.
            // A receiver without a launcher can be opened in this owned window. Keep
            // original task origins before launch, just as for an ordinary app open.
            if (!present) {
                for (Object task : allTasks()) if (taskUser(task) == userId && matchesPackage(task, packageName)) {
                    if (taskDisplay(task) != 0 && taskDisplay(task) != record.displayId)
                        throw new IllegalStateException("目标应用正在其他工作区运行，请先选择该窗口");
                    if (taskDisplay(task) == 0) {
                        boolean saved = false;
                        for (AtomicWorkbenchJournal.TaskOrigin origin : record.tasks) if (origin.taskId == taskId(task)) saved = true;
                        if (!saved) record.tasks.add(origin(task));
                    }
                }
                journal.save(record);
            }
            // A demoted display must release its real focus window before the
            // receiver can acquire window focus and reconnect its editor.
            cancelTouch(); configurePhoneKeyboard(); restoreInputFocus();
            requireShareTarget(exact);
            requireAllocationScope(null);
            outgoing.setComponent(receiver).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ActivityOptions options = ActivityOptions.makeBasic(); options.setLaunchDisplayId(record.displayId);
            if (exact != null) invoke(options, "setLaunchTaskId", new Class<?>[]{int.class}, exact.getInt("task", -1));
            // The Binder may throw after the target has accepted the request. Never retry.
            dispatched = true;
            int started = AtomicWorkbenchLaunchBridge.start(tasks(), outgoing, options.toBundle(), userId,
                    outgoing.resolveTypeIfNeeded(userContext.getContentResolver()));
            AtomicWorkbenchLaunchBridge.requireAccepted(started);
            if (!present && record.homeOnly) { record.homeOnly = false; journal.save(record); }
            rememberCurrentTasks();
            if (exact != null && (observedTaskId != exact.getInt("task", -1)
                    || observedTargetUid != exact.getInt("target_uid", -1)
                    || !runningPackages.contains(packageName)))
                throw new IllegalStateException("目标应用的分享页面显示位置尚未确认");
            diagnostic("share_open", receiver.flattenToString(), record.displayId,
                    "type=" + outgoing.getType() + ";result=" + started + ";recipient_selection=target_app", null);
            Bundle shared = result(true, browserSearch ? "已在目标浏览器中发起文字搜索" : "已将素材交给所选应用的分享入口，请在应用内检查并确认发送");
            if (browserSearch) shared.putBoolean("browser_search_started", true);
            shared.putBoolean("share_started", true);
            shared.putBoolean("share_dispatched", true);
            return shared;
        } catch (Exception error) {
            diagnostic("share_failure", packageName, record == null ? -1 : record.displayId, "", error);
            Bundle failed = result(false, dispatched ? "已请求打开分享入口，但结果尚未核对。请检查目标应用，素材已保留。"
                    : "内容未交给应用：" + failure(error));
            failed.putBoolean("share_dispatched", dispatched); return failed;
        }
    }

    private void requireShareTarget(Bundle expected) throws Exception {
        if (expected == null) return;
        requireDisplayIdentity(); rememberCurrentTasks();
        ComponentName top = ComponentName.unflattenFromString(topComponent);
        if (expected.getInt("schema", -1) != 1 || expected.getInt("module_uid", -1) != appUid
                || expected.getInt("user", -1) != userId || expected.getInt("window", -1) != windowId
                || expected.getInt("display", -1) != record.displayId
                || !record.displayName.equals(expected.getString("name", ""))
                || !record.uniqueId.equals(expected.getString("unique", ""))
                || expected.getInt("task", -1) != observedTaskId || expected.getInt("target_uid", -1) != observedTargetUid
                || top == null || !top.getPackageName().equals(expected.getString("package", ""))
                || !"active".equals(record.state) || nativeHomeVisible || recoveryPending
                || SystemClock.elapsedRealtime() >= expected.getLong("deadline", -1))
            throw new IllegalStateException("目标窗口的实际任务已变化，素材已保留");
    }

    private static Intent safeShareIntent(Intent supplied, String packageName) {
        if (supplied == null || supplied.getSelector() != null || supplied.getData() != null)
            throw new IllegalArgumentException("分享内容参数无效");
        ComponentName selected = supplied.getComponent();
        if (selected != null && (!packageName.equals(selected.getPackageName())
                || selected.getClassName() == null || selected.getClassName().isEmpty() || selected.getClassName().length() > 512))
            throw new IllegalArgumentException("分享目标入口无效");
        String action = supplied.getAction(), type = supplied.getType();
        boolean multiple = Intent.ACTION_SEND_MULTIPLE.equals(action);
        if (!multiple && !Intent.ACTION_SEND.equals(action)) throw new IllegalArgumentException("仅支持内容分享");
        if (type == null || type.length() > 255 || !type.matches("[A-Za-z0-9!#$&^_.+*-]+/[A-Za-z0-9!#$&^_.+*-]+"))
            throw new IllegalArgumentException("分享内容类型无效");
        CharSequence suppliedText = supplied.getCharSequenceExtra(Intent.EXTRA_TEXT);
        String text = suppliedText == null ? "" : suppliedText.toString();
        if (text.length() > 32768) throw new IllegalArgumentException("单次分享文字不能超过 32768 个字符");
        ArrayList<Uri> streams = new ArrayList<>();
        if (multiple) {
            ArrayList<Uri> requested = supplied.getParcelableArrayListExtra(Intent.EXTRA_STREAM, Uri.class);
            if (requested != null) streams.addAll(requested);
        } else {
            Uri requested = supplied.getParcelableExtra(Intent.EXTRA_STREAM, Uri.class);
            if (requested != null) streams.add(requested);
        }
        if (streams.size() > 16 || multiple && streams.isEmpty() || streams.isEmpty() && text.isEmpty())
            throw new IllegalArgumentException("请选择 1–16 个文件，或可分享的文字");
        Intent outgoing = new Intent(action).setPackage(packageName).setType(type);
        if (selected != null) outgoing.setComponent(selected);
        if (!text.isEmpty()) outgoing.putExtra(Intent.EXTRA_TEXT, text);
        ClipData clip = null;
        for (Uri uri : streams) {
            if (uri == null || !"content".equals(uri.getScheme())
                    || !"ls.augment.com.workbench.transfer".equals(uri.getAuthority()))
                throw new SecurityException("只能分享工作台已接收的缓存文件");
            if (clip == null) clip = new ClipData("工作台内容", new String[]{type}, new ClipData.Item(uri));
            else clip.addItem(new ClipData.Item(uri));
        }
        if (!streams.isEmpty()) {
            if (multiple) outgoing.putParcelableArrayListExtra(Intent.EXTRA_STREAM, streams);
            else outgoing.putExtra(Intent.EXTRA_STREAM, streams.get(0));
            outgoing.setClipData(clip);
            outgoing.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        }
        return outgoing;
    }

    /** Allocate a journaled display for exact task restoration. No app or HOME is launched or focused. */
    Bundle allocateTaskDisplay(Surface surface, int width, int height, int density, long generation, String allocationId) {
        try { return allocateTaskDisplay(surface, width, height, density, generation, allocationId, () -> { }); }
        catch (AllocationScopeRefused denied) { return result(false, denied.getMessage()); }
    }

    Bundle allocateTaskDisplay(Surface surface, int width, int height, int density, long generation, String allocationId,
                               Runnable commitGeneration) throws AllocationScopeRefused {
        boolean createAttempted = false, walAttempted = false;
        if (startupError != null || record != null || ownedDisplay != null || recoveryPending
                || surface == null || !surface.isValid() || width < 240 || height < 240 || width > 4096
                || height > 4096 || (long) width * height > 12_000_000L || density < 120 || density > 640
                || allocationId == null || !allocationId.matches("[0-9a-f]{32}") || generation <= 0) {
            release(surface); return result(false, "任务空显示的分配条件尚未满足，原会话已保留");
        }
        try {
            journal.acquireLock();
            if (journal.exists()) throw new IllegalStateException("任务显示仍有原恢复记录");
            verifyRequiredInterfaces();
            requireAllocationScope(null);
            commitGeneration.run();
            if (outputState.begin(generation, true) != AtomicWorkbenchOutputProtocol.Decision.APPLY)
                throw new IllegalStateException("任务显示画面代际已过期");
            record = new AtomicWorkbenchJournal.Record(appUid, userId, windowId);
            record.width = width; record.height = height; record.density = density;
            record.taskAllocationId = allocationId; record.retainedEmptyTaskDisplay = true;
            walAttempted = true;
            journal.save(record); recoveryPending = true;
            // Keep close's full task inspection even if a task enters before the UI sees the reply.
            requireAllocationScope(null);
            launchAttempted = true; createAttempted = true;
            ownedDisplay = displays.createVirtualDisplay(record.displayName, width, height, density, surface, workbenchDisplayFlags());
            if (ownedDisplay == null || ownedDisplay.getDisplay() == null) throw new IllegalStateException("系统未确认任务空显示");
            ownedSurface = surface; surface = null;
            Display display = ownedDisplay.getDisplay(); record.displayId = display.getDisplayId(); record.uniqueId = uniqueId(display);
            requireDisplayIdentity(); requireDisplayPolicy(display);
            // API 36 exposes no public trusted/own-focus flags. This UID-0 VM is
            // exempted by Root.main; verify returned flags rather than request bits.
            @SuppressLint("BlockedPrivateApi")
            int required = AtomicWorkbenchDisplayPolicy.requiredFocusFlags();
            if ((display.getFlags() & required) != required) throw new SecurityException("任务显示缺少可信独立焦点能力");
            journal.save(record); configurePhoneKeyboard();
            if (!ownedTasks().isEmpty()) throw new IllegalStateException("任务空显示已有未确认任务");
            record.state = "active"; journal.save(record); outputState.completed(true);
            recoveryPending = false; taskCount = 0; lastOperationFailed = false;
            return result(true, "已创建任务空显示");
        } catch (Exception failure) {
            if (failure instanceof AllocationScopeRefused denied && !walAttempted) throw denied;
            // A failed transport may already have created the display. Never recreate, migrate or release it here.
            operationUnconfirmed = createAttempted; recoveryPending = record != null;
            if (createAttempted) outputState.uncertain(); else outputState.released();
            return result(false, createAttempted ? "任务显示分配结果尚未确认，原恢复依据已保留" : "任务空显示尚未创建");
        } finally { release(surface); }
    }

    @SuppressLint("BlockedPrivateApi") // The explicit original task is started only by the root VM.
    private Bundle openInternal(Surface surface, int width, int height, int density, String flattenedComponent, int originalTaskId) {
        final boolean mediaScope = AtomicWorkbenchLaunchBoundary.isActive();
        boolean dispatched = false, dispatchKnown = false, dispatchMayHaveApplied = false;
        diagnostic("open_request", flattenedComponent, -1,
                "requested_task=" + originalTaskId + ";size=" + width + "x" + height + ";density=" + density, null);
        if (startupError != null) {
            diagnostic("open_failure", flattenedComponent, -1, "stage=backend_startup", startupError);
            release(surface); return result(false, message);
        }
        if (surface == null || !surface.isValid() || width < 240 || height < 240 || width > 4096
                || height > 4096 || (long) width * height > 12_000_000L || density < 120 || density > 640) {
            diagnostic("open_failure", flattenedComponent, -1, "stage=surface_validation", null);
            release(surface); return result(false, "工作区显示尺寸或画面无效");
        }
        final ComponentName component;
        try {
            component = validateComponent(flattenedComponent);
            AtomicWorkbenchLaunchBoundary.require(component.flattenToString());
        } catch (Exception denied) {
            release(surface);
            diagnostic("open_failure", flattenedComponent, record == null ? -1 : record.displayId, "stage=launch_admission", denied);
            Bundle rejected = result(false, failure(denied)); rejected.putBoolean("operation_unconfirmed", false); return rejected;
        }
        try {
            journal.acquireLock();
            if (record != null || ownedDisplay != null) {
                Bundle restored = close();
                if (!restored.getBoolean("success")) { release(surface); return restored; }
                journal.acquireLock();
            }
            if (journal.exists()) {
                record = journal.read(); recoveryPending = record != null;
                if (record != null && !close().getBoolean("success")) { release(surface); return result(false, message); }
                journal.acquireLock();
            }
            if (ownedDisplay != null) throw new IllegalStateException("请先恢复该窗口，再更换应用");
            lastOperationFailed = false; retainedLaunchFailure = "";
            List<?> baseline = allTasks();
            verifyRequiredInterfaces();
            if (originalTaskId <= 0) AtomicWorkbenchLaunchBridge.verifyAvailable(tasks());
            Object originalTask = originalTaskId > 0 ? verifiedOriginalTask(originalTaskId, component.getPackageName()) : null;
            for (Object task : baseline) {
                if (taskUser(task) == userId && taskDisplay(task) != Display.DEFAULT_DISPLAY
                        && matchesPackage(task, component.getPackageName()))
                    throw new IllegalStateException("该应用正在其他显示屏运行，请先移回手机主屏");
            }
            requireAllocationScope(null);
            record = new AtomicWorkbenchJournal.Record(appUid, userId, windowId);
            requestedTaskId = originalTaskId;
            record.width = width; record.height = height; record.density = density;
            record.component = component.flattenToString();
            for (Object task : baseline) if (taskUser(task) == userId && matchesPackage(task, component.getPackageName())) {
                if (record.tasks.size() >= 256) throw new IllegalStateException("应用任务过多，无法完整保存恢复依据");
                record.tasks.add(origin(task));
            }
            if (originalTask != null) {
                boolean present = false;
                for (AtomicWorkbenchJournal.TaskOrigin saved : record.tasks) if (saved.taskId == originalTaskId) present = true;
                if (!present) record.tasks.add(origin(originalTask));
            }
            journal.save(record); // No display or launch is created without durable recovery evidence.
            recoveryPending = true;
            launchAttempted = false;
            int flags = workbenchDisplayFlags();
            requireAllocationScope(null);
            ownedDisplay = displays.createVirtualDisplay(record.displayName, width, height, density, surface, flags);
            if (ownedDisplay == null || ownedDisplay.getDisplay() == null) throw new IllegalStateException("系统未创建工作区显示屏");
            ownedSurface = surface; surface = null; outputState.externalAttached();
            Display display = ownedDisplay.getDisplay();
            record.displayId = display.getDisplayId(); record.uniqueId = uniqueId(display);
            if (record.displayId <= Display.DEFAULT_DISPLAY || record.uniqueId.isEmpty()) throw new IllegalStateException("工作区显示身份无效");
            if (!sameDisplay(display, record)) throw new SecurityException("工作区显示所有者核对失败");
            requireDisplayPolicy(display);
            Field trustedField = Display.class.getDeclaredField("FLAG_TRUSTED"); trustedField.setAccessible(true);
            int trusted = trustedField.getInt(null);
            if ((display.getFlags() & trusted) == 0) throw new IllegalStateException("系统未授予可信显示能力");
            Field focusField = Display.class.getDeclaredField("FLAG_OWN_FOCUS"); focusField.setAccessible(true);
            if ((display.getFlags() & focusField.getInt(null)) == 0)
                throw new IllegalStateException("系统未授予工作区独立输入焦点");
            journal.save(record);
            configurePhoneKeyboard();
            record.state = "launching"; journal.save(record);
            diagnostic("display_ready", record.component, record.displayId,
                    "display_flags=" + display.getFlags() + ";ime_policy=" + record.imePolicy + ";requested_task=" + originalTaskId, null);
            Intent intent = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
                    .setComponent(component).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ActivityOptions options = ActivityOptions.makeBasic(); options.setLaunchDisplayId(record.displayId);
            launchAttempted = true;
            int startResult;
            if (originalTaskId > 0) {
                // No launcher fallback: preserving the exact existing task is the requested action.
                verifiedOriginalTask(originalTaskId, component.getPackageName());
                requireAllocationScope(null);
                AtomicWorkbenchLaunchBoundary.require(component.flattenToString());
                dispatched = true;
                Object started = invoke(tasks(), "startActivityFromRecents", new Class<?>[]{int.class, Bundle.class},
                        originalTaskId, options.toBundle());
                if (!(started instanceof Integer)) throw new IllegalStateException("系统未返回原应用任务接管结果");
                startResult = (Integer) started;
            } else {
                requireAllocationScope(null);
                AtomicWorkbenchLaunchBoundary.require(component.flattenToString());
                dispatched = true;
                startResult = AtomicWorkbenchLaunchBridge.start(tasks(), intent, options.toBundle(), userId);
            }
            diagnostic("launch_return", record.component, record.displayId,
                    "route=" + (originalTaskId > 0 ? "recents" : "root_direct") + ";result=" + startResult
                            + ";requested_task=" + originalTaskId, null);
            dispatchKnown = true; dispatchMayHaveApplied = startResult >= 0;
            AtomicWorkbenchLaunchBridge.requireAccepted(startResult);
            if (mediaScope) { operationUnconfirmed = retainedMediaOperation = true; unconfirmedFocusTask = -1; recoveryPending = false; }
            message = "工作区已创建，正在确认应用任务";
            final long generation = ++launchGeneration;
            pollLaunchedTask(generation, SystemClock.uptimeMillis() + 7000L, mediaScope, mediaScope);
            return result(!lastOperationFailed && !operationUnconfirmed, message);
        } catch (Exception error) {
            if (error instanceof AllocationScopeRefused && record == null && ownedDisplay == null) {
                release(surface); return result(false, error.getMessage());
            }
            String reason = failure(error);
            diagnostic("launch_failure", flattenedComponent, record == null ? -1 : record.displayId,
                    "requested_task=" + originalTaskId, error);
            diagnosticTaskSnapshot("failure_tasks", flattenedComponent);
            release(surface);
            if (mediaScope && dispatched && (!dispatchKnown || dispatchMayHaveApplied)) {
                retainMediaOperation("媒体应用启动结果尚未确认，原窗口和实际任务已保留", -1);
                return result(false, message);
            }
            Bundle cleaned = close();
            message = reason + (cleaned.getBoolean("success") ? "" : "；" + cleaned.getString("message", "恢复尚未完成"));
            lastOperationFailed = true;
            return result(false, message);
        }
    }

    boolean inject(MotionEvent event) {
        inputBackendFailed = false;
        if (event == null || operationUnconfirmed || record != null && record.retainedEmptyTaskDisplay && record.homeTaskId < 0
                || !outputState.acceptsInput() || inputCancelPending || resumeRebindPending || inputFocusSuspended || inputFocusTransitionFailed) return false;
        try {
            requireOwnedDisplay();
            if (event.getPointerCount() < 1 || event.getPointerCount() > 10) return false;
            int action = event.getActionMasked();
            if (action != MotionEvent.ACTION_DOWN && action != MotionEvent.ACTION_MOVE
                    && action != MotionEvent.ACTION_POINTER_DOWN && action != MotionEvent.ACTION_POINTER_UP
                    && action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL) return false;
            long now = SystemClock.uptimeMillis();
            if (event.getDownTime() <= 0 || event.getEventTime() < event.getDownTime()
                    || event.getEventTime() > now + 2000L || event.getEventTime() < now - 15000L) return false;
            if (action == MotionEvent.ACTION_DOWN) {
                if (event.getPointerCount() != 1) return false;
            } else if (!activeGesture || event.getDownTime() != gestureDownTime
                    || event.getEventTime() < gestureEventTime) return false;
            for (int i = 0; i < event.getPointerCount(); i++)
                if (!Float.isFinite(event.getX(i)) || !Float.isFinite(event.getY(i))
                        || (action == MotionEvent.ACTION_DOWN && (event.getX(i) < 0 || event.getY(i) < 0
                        || event.getX(i) >= record.width || event.getY(i) >= record.height))) return false;
            MotionEvent copy = MotionEvent.obtain(event);
            try {
                if (action == MotionEvent.ACTION_DOWN) { cancelTouch(); focus(); }
                copy.setSource(InputDevice.SOURCE_TOUCHSCREEN);
                setInputDisplay(copy);
                boolean accepted = injectEvent(copy, 0);
                if (!accepted) {
                    inputBackendFailed = true;
                    diagnostic("input_injection_failure", record.component, record.displayId, "route=touch", null);
                }
                if (accepted) {
                    activeGesture = action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL;
                    gestureDownTime = copy.getDownTime(); gestureEventTime = copy.getEventTime();
                    if (lastTouch != null) { lastTouch.recycle(); lastTouch = null; }
                    if (copy.getActionMasked() != MotionEvent.ACTION_UP && copy.getActionMasked() != MotionEvent.ACTION_CANCEL)
                        lastTouch = MotionEvent.obtain(copy);
                }
                return accepted;
            } finally { copy.recycle(); }
        } catch (Exception error) {
            inputBackendFailed = true; message = failure(error);
            diagnostic("input_injection_failure", record == null ? "" : record.component,
                    record == null ? -1 : record.displayId, "route=touch", error); return false;
        }
    }

    boolean key(KeyEvent event) {
        inputBackendFailed = false;
        if (event == null || operationUnconfirmed || record != null && record.retainedEmptyTaskDisplay && record.homeTaskId < 0
                || !outputState.acceptsInput() || inputCancelPending || resumeRebindPending || inputFocusSuspended || inputFocusTransitionFailed || !allowedKey(event.getKeyCode())
                || (event.getAction() != KeyEvent.ACTION_DOWN && event.getAction() != KeyEvent.ACTION_UP)) return false;
        try { requireOwnedDisplay(); setInputDisplay(event); boolean accepted = injectEvent(event, 0); inputBackendFailed = !accepted;
            if (!accepted) diagnostic("input_injection_failure", record.component, record.displayId, "route=key", null);
            return accepted; }
        catch (Exception error) { inputBackendFailed = true; message = failure(error);
            diagnostic("input_injection_failure", record == null ? "" : record.component,
                    record == null ? -1 : record.displayId, "route=key", error); return false; }
    }

    boolean inputBackendFailed() { return inputBackendFailed; }
    boolean hasLiveDisplay() { return ownedDisplay != null; }
    boolean readyForInput() { return ownedDisplay != null && record != null && "active".equals(record.state)
            && !(record.retainedEmptyTaskDisplay && record.homeTaskId < 0)
            && !operationUnconfirmed && outputState.acceptsInput() && !inputCancelPending && !resumeRebindPending && !inputFocusSuspended && !inputFocusTransitionFailed && !inputFocusCleanupPending; }
    boolean hasStartupFailure() { return startupError != null; }
    String hostedComponent() { return record == null ? "" : record.component; }
    int requestedTaskId() { return requestedTaskId; }
    boolean hasInputFocus() {
        try {
            if (record == null || ownedDisplay == null || operationUnconfirmed || !outputState.acceptsInput() || inputCancelPending || resumeRebindPending || inputFocusSuspended || inputFocusTransitionFailed || inputFocusCleanupPending) return false;
            Object focused = invoke(tasks(), "getFocusedRootTaskInfo", new Class<?>[0]);
            return focused != null && taskDisplay(focused) == record.displayId && taskUser(focused) == userId;
        } catch (Exception unavailable) { return false; }
    }

    /** Surface recreation and promotion preserve the same VD, task and journal identity. */
    Bundle attachSurface(Surface surface, int width, int height, int density, String component, int originalTaskId) {
        inputBackendFailed = false;
        try {
            requireDisplayIdentity();
            if (!record.component.equals(component) || (originalTaskId > 0 && requestedTaskId != originalTaskId))
                throw new IllegalStateException("请先恢复该窗口，再更换应用任务");
            if (surface == null || !surface.isValid() || width < 240 || height < 240 || width > 4096
                    || height > 4096 || (long) width * height > 12_000_000L || density < 120 || density > 640)
                throw new IllegalArgumentException("工作区显示尺寸或画面无效");
            cancelTouch();
            if (width != record.width || height != record.height || density != record.density) {
                int oldWidth = record.width, oldHeight = record.height, oldDensity = record.density;
                record.width = width; record.height = height; record.density = density;
                try { journal.save(record); ownedDisplay.resize(width, height, density); }
                catch (Exception failed) { record.width = oldWidth; record.height = oldHeight; record.density = oldDensity; throw failed; }
            }
            ownedDisplay.setSurface(surface);
            Surface previous = ownedSurface; ownedSurface = surface; surface = null;
            if (previous != ownedSurface) release(previous);
            releaseUncertainOutput(); outputState.externalAttached();
            return result(true, "工作区画面已重新连接，应用任务保持运行");
        } catch (Exception error) {
            Bundle failed = result(false, failure(error));
            if (inputBackendFailed) failed.putBoolean("input_failure", true);
            return failed;
        }
        finally { release(surface); }
    }

    void cancelInput() throws Exception { cancelTouch(); }

    /** Identity-only producer transition: no launch, task move, journal mutation, resize or VD release. */
    Bundle updateOutput(Bundle expected, long generation, Surface surface) {
        boolean attempted = false, accepted = false;
        try {
            AtomicWorkbenchOutputIdentity identity = outputIdentity(expected);
            requireDisplayIdentity();
            if (!identity.matches(record.displayId, record.displayName, record.uniqueId, userId)
                    || surface != null && "recovering".equals(record.state)) throw new SecurityException("output_identity");
            if (surface != null && !surface.isValid()) throw new IllegalArgumentException("output_surface");
            AtomicWorkbenchOutputProtocol.Decision decision = outputState.begin(generation, surface != null);
            if (decision == AtomicWorkbenchOutputProtocol.Decision.DETACHED_ALREADY)
                return outputReply(true, "工作区画面已暂停，应用任务保持原位", true);
            if (decision != AtomicWorkbenchOutputProtocol.Decision.APPLY)
                return outputReply(false, "画面请求已过期或仍待确认，请重新核对窗口", false);
            accepted = true;
            if (surface == null) resumeRebindPending = true;
            cancelTouch();
            attempted = true;
            ownedDisplay.setSurface(surface);
            requireDisplayIdentity();
            Surface previous = ownedSurface; ownedSurface = surface; surface = null;
            if (previous != ownedSurface) release(previous);
            releaseUncertainOutput(); outputState.completed(ownedSurface != null);
            return outputReply(true, ownedSurface == null ? "工作区画面已暂停，应用任务保持原位" : "工作区画面已接回，应用任务保持原位", true);
        } catch (Exception unavailable) {
            if (attempted) {
                // A failed Binder setter may already have applied remotely. Keep at most
                // the old handle plus one possible candidate until a confirmed detach.
                outputState.uncertain();
                if (surface != null) { uncertainOutputSurface = surface; surface = null; }
            } else if (outputState.pending()) outputState.uncertain();
            return outputReply(false, "画面连接尚未确认，原显示和任务已保留", accepted);
        } finally { release(surface); }
    }

    /** Park also fences empty slots, including an OPEN whose UI callback has not arrived. */
    Bundle parkOutput(long generation) {
        if (record != null && ownedDisplay != null) {
            Bundle identity = new Bundle(); identity.putInt("display_id", record.displayId);
            identity.putString("display_name", record.displayName); identity.putString("display_unique_id", record.uniqueId);
            identity.putInt("user_id", userId); return updateOutput(identity, generation, null);
        }
        AtomicWorkbenchOutputProtocol.Decision decision = outputState.begin(generation, false);
        if (decision == AtomicWorkbenchOutputProtocol.Decision.APPLY) outputState.completed(false);
        return result(decision == AtomicWorkbenchOutputProtocol.Decision.APPLY
                || decision == AtomicWorkbenchOutputProtocol.Decision.DETACHED_ALREADY, "空白窗口画面请求已核对");
    }

    Bundle parkInput() {
        if (ownedDisplay != null && record != null) resumeRebindPending = true;
        boolean cancelled = true;
        try { cancelTouch(); } catch (Exception unavailable) { cancelled = false; }
        inputCancelPending = !cancelled;
        closeInputFocusGuard();
        Bundle state = result(cancelled && !inputFocusCleanupPending, "工作区输入已暂停，应用任务保持原位");
        return state;
    }

    boolean primaryInputFocusConfirmed() { return AtomicWorkbenchInputFocusProbe.primaryConfirmed(); }
    Bundle outputStatus() { return result(true, "工作区显示保持原位"); }

    private static AtomicWorkbenchOutputIdentity outputIdentity(Bundle expected) {
        if (expected == null || expected.keySet().size() != 4
                || !(expected.get("display_id") instanceof Integer) || !(expected.get("user_id") instanceof Integer)
                || !(expected.get("display_name") instanceof String) || !(expected.get("display_unique_id") instanceof String))
            throw new IllegalArgumentException("output_identity");
        return new AtomicWorkbenchOutputIdentity(expected.getInt("display_id"), expected.getString("display_name"),
                expected.getString("display_unique_id"), expected.getInt("user_id"));
    }

    private Bundle outputReply(boolean success, String text, boolean accepted) {
        Bundle state = result(success, text); state.putBoolean("output_request_accepted", accepted); return state;
    }

    private void releaseUncertainOutput() {
        Surface candidate = uncertainOutputSurface; uncertainOutputSurface = null;
        if (candidate != ownedSurface) release(candidate);
    }

    private void releaseOutputHandles() {
        Surface old = ownedSurface, candidate = uncertainOutputSurface;
        ownedSurface = uncertainOutputSurface = null;
        release(old); if (candidate != old) release(candidate); outputState.released(); inputCancelPending = false;
        // The owned display has gone: the system can no longer keep its input stream.
        if (lastTouch != null) { lastTouch.recycle(); lastTouch = null; }
        activeGesture = false;
        resumeRebindPending = false;
        clearMediaOperation();
    }

    /** Only an authenticated, currently owned active VD may host a demotion guard. */
    void suspendInputFocus() throws Exception {
        inputFocusTransitionFailed = false;
        try {
            if (!outputState.acceptsInput()) throw new IllegalStateException("工作区画面尚未接回");
            requireOwnedDisplay();
            Display display = displays.getDisplay(record.displayId);
            requireDisplayPolicy(display);
            if (focusController == null) throw new IllegalStateException("手机端窗口焦点桥尚未连接");
            if (inputFocusLease == null) {
                inputFocusLease = new Bundle();
                inputFocusLease.putInt("window_id", windowId); inputFocusLease.putInt("display_id", record.displayId);
                inputFocusLease.putString("display_name", record.displayName); inputFocusLease.putString("unique_id", record.uniqueId);
            } else if (inputFocusLease.getInt("display_id", -1) != record.displayId
                    || !record.displayName.equals(inputFocusLease.getString("display_name", ""))
                    || !record.uniqueId.equals(inputFocusLease.getString("unique_id", "")))
                throw new IllegalStateException("旧显示的窗口焦点责任尚未清理");
            controlInputFocus("suspend");
            inputFocusSuspended = true;
        } catch (Exception failed) { inputFocusTransitionFailed = true; throw failed; }
    }

    /** Removal is acknowledged before the real task is focused; normal DOWN never cycles it. */
    void restoreInputFocus() throws Exception {
        inputFocusTransitionFailed = false;
        try {
            requireDisplayIdentity();
            // Detach/Display OFF is not proof that an OWN_FOCUS editor lost focus.
            // Only the foreground, reattached target performs this acknowledged cycle.
            if (resumeRebindPending) {
                if (!outputState.acceptsInput()) throw new IllegalStateException("工作区画面尚未接回");
                if (inputFocusLease == null) suspendInputFocus();
            }
            if (inputFocusLease != null) controlInputFocus("resume");
            inputFocusSuspended = false;
        } catch (Exception failed) { inputFocusTransitionFailed = true; throw failed; }
    }

    private void closeInputFocusGuard() {
        if (inputFocusLease == null) { inputFocusCleanupPending = false; inputFocusSuspended = false; return; }
        try {
            controlInputFocus("close");
            inputFocusCleanupPending = false; inputFocusSuspended = false; inputFocusTransitionFailed = false;
        } catch (Exception failed) {
            inputFocusCleanupPending = true;
            diagnostic("focus_failure", record == null ? "" : record.component,
                    record == null ? -1 : record.displayId, "route=guard_cleanup", failed);
        }
    }

    private void controlInputFocus(String action) throws Exception {
        if (focusController == null) throw new IllegalStateException("手机端窗口焦点桥尚未连接");
        Bundle reply;
        // Retain the exact identity on an uncertain Binder failure, including after the VD
        // is released. Only the managed owner can certify that its actual window detached.
        inputFocusCleanupPending = true;
        reply = focusController.control(action, new Bundle(inputFocusLease));
        if (reply == null || !reply.containsKey("cleanup_pending") || !reply.containsKey("focus_suspended")
                || !reply.containsKey("success"))
            throw new IllegalStateException("手机端窗口焦点桥未返回清理确认");
        boolean suspended = reply.getBoolean("focus_suspended", false);
        boolean advertisedSuccess = reply.getBoolean("success", false);
        boolean validAck = advertisedSuccess && ("suspend".equals(action) ? suspended : !suspended);
        boolean pending = reply.getBoolean("cleanup_pending", true)
                || suspended && (!"suspend".equals(action) || !advertisedSuccess)
                || advertisedSuccess && !validAck;
        boolean success = validAck && !pending;
        inputFocusCleanupPending = pending;
        inputFocusSuspended = suspended;
        if (!pending && (!"suspend".equals(action) || !success)) inputFocusLease = null;
        if (!success) {
            String reason = reply.getString("focus_reason", "unknown");
            String type = reply.getString("focus_error_type", "");
            if (!reason.matches("[a-z_]{1,64}")) reason = "invalid_reason";
            if (!type.matches("[A-Za-z0-9_.$]{0,160}")) type = "invalid_type";
            diagnostic("focus_failure", record == null ? "" : record.component,
                    record == null ? -1 : record.displayId,
                    "route=managed_guard;action=" + action + ";reason=" + reason + ";error_type=" + type
                            + ";cleanup_pending=" + pending, null);
            throw new IllegalStateException(reply.getString("message", "手机端窗口焦点尚未确认"));
        }
    }

    /** The system IME keeps the virtual editor connection and renders at phone size. */
    private void configurePhoneKeyboard() throws Exception {
        requireDisplayIdentity();
        invoke(window(), "setDisplayImePolicy", new Class<?>[]{int.class, int.class},
                record.displayId, AtomicWorkbenchProtocol.IME_POLICY_PHONE_DISPLAY);
        int actual = (Integer) invoke(window(), "getDisplayImePolicy", new Class<?>[]{int.class}, record.displayId);
        record.imePolicy = actual;
        diagnostic("ime_policy", record.component, record.displayId,
                "requested=" + AtomicWorkbenchProtocol.IME_POLICY_PHONE_DISPLAY + ";actual=" + actual + ";route=phone_display", null);
        if (actual != AtomicWorkbenchProtocol.IME_POLICY_PHONE_DISPLAY)
            throw new IllegalStateException("系统未接受手机主屏键盘策略（返回 " + actual
                    + "），请确认模块已启用；更新模块后需重启手机再试");
    }

    Bundle focusWindow() {
        try {
            requireDisplayIdentity();
            rememberCurrentTasks();
            homeReusedVisible = nativeHomeVisible && record.homeTaskId >= 0 && !record.homeMigrationPending && !recoveryPending;
            if (!"active".equals(record.state) || taskCount == 0) return result(false, "应用任务正在进入工作区，请稍后切换");
            configurePhoneKeyboard(); restoreInputFocus(); focus();
            Object focused = invoke(tasks(), "getFocusedRootTaskInfo", new Class<?>[0]);
            if (focused == null || taskDisplay(focused) != record.displayId)
                throw new IllegalStateException("系统尚未将输入焦点交给该窗口");
            resumeRebindPending = false;
            confirmMediaOperation();
            return result(!operationUnconfirmed, "已切换到该应用窗口");
        } catch (Exception error) {
            diagnostic("focus_failure", record == null ? "" : record.component,
                    record == null ? -1 : record.displayId, "route=window", error);
            return result(false, failure(error));
        }
    }

    Bundle focusDefault() {
        try {
            Object listed = invoke(tasks(), "getAllRootTaskInfosOnDisplay", new Class<?>[]{int.class}, 0);
            if (!(listed instanceof List<?>)) throw new IllegalStateException("手机主屏任务不可用");
            Object host = null;
            for (Object task : (List<?>) listed) if (taskUser(task) == userId && matchesWorkbenchHost(task)) { host = task; break; }
            if (host == null) throw new IllegalStateException("未找到工作台主屏任务，请点击搜索框后重试");
            invoke(tasks(), "setFocusedTask", new Class<?>[]{int.class}, taskId(host));
            Object focused = invoke(tasks(), "getFocusedRootTaskInfo", new Class<?>[0]);
            if (focused == null || taskDisplay(focused) != 0 || taskUser(focused) != userId
                    || taskId(focused) != taskId(host) || !matchesWorkbenchHost(focused))
                throw new IllegalStateException("系统尚未将输入焦点交回手机主屏");
            Bundle result = result(true, "输入焦点已交回工作台桌面"); result.putInt("display_id", 0); return result;
        } catch (Exception error) { return result(false, failure(error)); }
    }

    Bundle focusPrimaryHome() {
        try {
            Object home = findPrimaryHome(primaryHomeComponent());
            int id = taskId(home);
            invoke(tasks(), "setFocusedTask", new Class<?>[]{int.class}, id);
            Object focused = invoke(tasks(), "getFocusedRootTaskInfo", new Class<?>[0]);
            if (focused == null || taskId(focused) != id || taskUser(focused) != userId || taskDisplay(focused) != 0)
                throw new IllegalStateException("系统尚未将焦点交回原生桌面");
            return result(true, "系统原生桌面已返回手机主屏");
        } catch (Exception error) {
            diagnostic("focus_failure", "", 0, "route=primary_home_after_restore", error);
            return result(false, failure(error));
        }
    }

    boolean primaryHomeIsForeground() throws Exception {
        ComponentName primary = primaryHomeComponent();
        Object snapshot = invoke(tasks(), "getAllRootTaskInfosOnDisplay", new Class<?>[]{int.class}, 0);
        if (!(snapshot instanceof List<?>)) throw new IllegalStateException("primary task snapshot unavailable");
        // The ROM enumerates root tasks top to bottom. Ignore hidden roots, then require
        // the actual primary HOME activity; merely finding a HOME task on display 0 is insufficient.
        for (Object task : (List<?>) snapshot) {
            if (taskDisplay(task) != 0 || !task.getClass().getField("visible").getBoolean(task)) continue;
            return taskUser(task) == userId && (Integer) invoke(task, "getActivityType", new Class<?>[0]) == 2
                    && primary.equals(task.getClass().getField("topActivity").get(task));
        }
        return false;
    }

    Bundle status() {
        if (startupError != null) return result(false, message);
        try { if (ownedDisplay != null) {
            requireDisplayIdentity(); rememberCurrentTasks();
            confirmMediaOperation();
            // An OPEN failure and a fresh task snapshot have different meanings.
            // Keep the failure message while allowing the actual surviving tasks to be used.
            if (!operationUnconfirmed && !retainedLaunchFailure.isEmpty() && record != null && "active".equals(record.state))
                lastOperationFailed = false;
        } }
        catch (Exception error) {
            if (retainedMediaOperation && ownedDisplay != null && record != null) {
                retainMediaOperation("媒体应用状态尚未确认，原窗口和任务已保留", unconfirmedFocusTask);
                return result(false, message);
            }
            recoveryPending = true; message = failure(error); return result(false, message);
        }
        return result(!operationUnconfirmed && !lastOperationFailed && (record == null || !"recovering".equals(record.state))
                && (!recoveryPending || ownedDisplay != null), message);
    }

    int recoveryWindowId() { return windowId; }
    AtomicWorkbenchRecoveryScope.ReaderProfile recoveryReaderProfile() { return recoveryReader; }

    boolean hasRecoveryPending() { return hasTaskRecoveryPending() || inputFocusCleanupPending; }
    boolean hasTaskRecoveryPending() { return recoveryPending || record != null && record.homeMigrationPending; }

    Bundle close() { return closeWithDiagnostics(false); }
    Bundle closeWindow() { return closeWithDiagnostics(true); }

    private Bundle closeWithDiagnostics(boolean keepInBackground) {
        // An explicit close now owns recovery; a prior media query must not undo it.
        clearMediaOperation();
        String component = record == null ? "" : record.component;
        int displayId = record == null ? -1 : record.displayId;
        diagnostic("cleanup_request", component, displayId, "keep_background=" + keepInBackground, null);
        // A window-server failure must not block task migration. Keep the actual
        // guard object responsible until removal succeeds, including after VD release.
        closeInputFocusGuard();
        Bundle closed = closeInternal(keepInBackground);
        if (inputFocusCleanupPending) closeInputFocusGuard();
        if (inputFocusCleanupPending) {
            recoveryPending = true;
            closed.putBoolean("success", false); closed.putBoolean("recovery_pending", true);
            closed.putBoolean("input_focus_cleanup_pending", true); closed.putString("state", "recovering");
            closed.putString("message", closed.getString("message", "") + "；输入焦点守护仍待撤除");
        }
        diagnostic("cleanup_result", component, displayId,
                "success=" + closed.getBoolean("success") + ";recovery_pending=" + closed.getBoolean("recovery_pending")
                        + ";remaining_tasks=" + closed.getInt("task_count") + ";state=" + closed.getString("state", ""), null);
        return closed;
    }

    private Bundle closeInternal(boolean keepInBackground) {
        ++launchGeneration;
        lastOperationFailed = false;
        if (startupError != null) {
            if (recoveryPending) return result(false, "恢复依据无法读取，原记录已保留：" + failure(startupError));
            Bundle closed = result(true, "本次工作区未创建，未更改应用任务；" + failure(startupError));
            closed.putBoolean("no_session", true); closed.putString("state", "closed");
            return closed;
        }
        try {
            journal.acquireLock();
            // A dead input service must not prevent a healthy task service from restoring apps.
            try { cancelTouch(); }
            catch (Exception inputFailure) { android.util.Log.w("DuoAtomic", "Input cancellation unavailable during close", inputFailure); }
            if (record == null) record = journal.read();
            if (record == null) { recoveryPending = false; taskCount = 0; journal.releaseLock(); return result(true, "工作区已关闭"); }
            recoveryPending = true;
            if (!record.taskAllocationId.isEmpty() && ownedDisplay == null && record.displayId < 0) {
                // createVirtualDisplay may have taken effect before its reply was lost.
                // Absence, rather than a missing callback handle, is the only safe release proof.
                Object current = invoke(displays, "getDisplays", new Class<?>[0]);
                if (!(current instanceof Display[])) throw new IllegalStateException("任务显示释放状态尚未确认");
                for (Display candidate : (Display[]) current) if (candidate != null && record.displayName.equals(candidate.getName()))
                    throw new IllegalStateException("任务显示创建回执缺失，仍保留原显示恢复责任");
            }
            // HOME must leave before ordinary task migration or releasing its display token.
            restoreNativeHomeInternal(false);
            restorePendingVisibility();
            if (ownedDisplay != null && !launchAttempted) {
                ownedDisplay.release(); ownedDisplay = null; releaseOutputHandles();
                journal.clear(); record = null; recoveryPending = false; taskCount = 0;
                journal.releaseLock();
                return result(true, "未启动应用的工作区已释放");
            }
            Display live = record.displayId > 0 ? displays.getDisplay(record.displayId) : null;
            if (live == null || !sameDisplay(live, record)) {
                verifyRecordedTasksRestored();
                // Release only our callback-owned handle. A reused display ID is never migrated.
                if (ownedDisplay != null) { ownedDisplay.release(); ownedDisplay = null; }
                releaseOutputHandles();
                journal.clear(); record = null; recoveryPending = false; taskCount = 0;
                journal.releaseLock();
                return result(true, "上次工作区已由系统释放");
            }
            record.state = "recovering";
            List<?> tasks = ownedTasks();
            addTaskEvidence(tasks); journal.save(record);
            for (Object task : tasks) {
                if (taskUser(task) != userId) throw new SecurityException("工作区存在其他用户任务，恢复已停止");
                moveTaskToPrimary(task, keepInBackground);
            }
            tasks = ownedTasks(); taskCount = tasks.size();
            if (!tasks.isEmpty()) throw new IllegalStateException("应用任务尚未全部移回手机主屏");
            verifyRecordedTasksRestored();
            if (ownedDisplay == null) throw new IllegalStateException("正在等待上次工作区释放显示屏");
            ownedDisplay.release(); ownedDisplay = null;
            releaseOutputHandles();
            journal.clear(); record = null; recoveryPending = false; taskCount = 0;
            journal.releaseLock();
            return result(true, "工作区已回收，已记录任务的恢复检查完成");
        } catch (Exception error) {
            diagnostic("cleanup_failure", record == null ? "" : record.component,
                    record == null ? -1 : record.displayId, "keep_background=" + keepInBackground, error);
            if (ownedDisplay != null && record != null && journal.originalStorageMissing())
                return restoreAfterStorageRemoved(error, keepInBackground);
            lastOperationFailed = true;
            recoveryPending = ownedDisplay != null || (journal.isLocked() && record != null);
            if (!recoveryPending) journal.releaseLock();
            return result(false, "恢复尚未完成：" + failure(error));
        }
    }

    /** Uninstall/clear-data must not strand live tasks behind a vanished journal directory. */
    private Bundle restoreAfterStorageRemoved(Exception originalFailure, boolean keepInBackground) {
        try {
            try { cancelTouch(); } catch (Exception ignored) { }
            restoreNativeHomeInternal(false);
            Display live = displays.getDisplay(record.displayId);
            if (live != null && sameDisplay(live, record)) {
                for (Object task : ownedTasks()) {
                    if (taskUser(task) != userId) throw new SecurityException("工作区存在其他用户任务");
                    moveTaskToPrimary(task, keepInBackground);
                }
                if (!ownedTasks().isEmpty()) throw new IllegalStateException("应用任务尚未移回手机主屏");
            }
            verifyRecordedTasksRestored();
            // Only the handle this process created is released; no replacement directory is touched.
            ownedDisplay.release(); ownedDisplay = null;
            releaseOutputHandles();
            journal.releaseLock(); record = null; recoveryPending = false; taskCount = 0;
            lastOperationFailed = false;
            Bundle result = result(true, "工作区已回收，原工作台存储已被移除");
            result.putBoolean("storage_removed", true);
            return result;
        } catch (Exception recoveryFailure) {
            lastOperationFailed = true; recoveryPending = true;
            return result(false, "原恢复存储已移除，手机端仍在恢复任务：" + failure(recoveryFailure));
        }
    }

    private void pollLaunchedTask(long generation, long deadline) {
        pollLaunchedTask(generation, deadline, false);
    }

    private void pollLaunchedTask(long generation, long deadline, boolean retainDisplay) {
        pollLaunchedTask(generation, deadline, retainDisplay, false);
    }

    private void pollLaunchedTask(long generation, long deadline, boolean retainDisplay, boolean mediaScope) {
        if (generation != launchGeneration || ownedDisplay == null || record == null) return;
        try {
            rememberCurrentTasks();
            ComponentName requested = ComponentName.unflattenFromString(record.component);
            boolean observed = false;
            int observedTaskId = -1;
            for (Object task : ownedTasks()) if (taskUser(task) == userId && requested != null
                    && matchesPackage(task, requested.getPackageName())) {
                observed = true; observedTaskId = taskId(task); break;
            }
            if (observed) {
                record.state = "active"; journal.save(record); recoveryPending = false;
                clearMediaOperation();
                diagnostic("launch_confirmed", record.component, record.displayId,
                        "observed_task=" + observedTaskId + ";requested_task=" + requestedTaskId + ";task_count=" + taskCount, null);
                message = "应用已在工作区运行"; return;
            }
            if (SystemClock.uptimeMillis() >= deadline) {
                diagnostic("launch_timeout", record.component, record.displayId,
                        "timeout_ms=7000;requested_task=" + requestedTaskId + ";owned_task_count=" + taskCount, null);
                // Capture where the target actually is before releasing our display or journal.
                diagnosticTaskSnapshot("timeout_tasks", record.component);
                if (retainDisplay) {
                    if (mediaScope) retainMediaOperation("未确认媒体应用进入工作区，原窗口和实际任务已保留", -1);
                    else retainExistingLaunchFailure("未确认应用进入工作区，原桌面和实际任务已保留");
                    return;
                }
                Bundle restored = close(); lastOperationFailed = true;
                message = restored.getBoolean("success") ? "未确认应用进入工作区，已回收工作区"
                        : "未确认应用进入工作区；" + restored.getString("message", "恢复尚未完成");
                return;
            }
            handler.postDelayed(() -> pollLaunchedTask(generation, deadline, retainDisplay, mediaScope), 160L);
        } catch (Exception error) {
            String reason = failure(error);
            diagnostic("observation_failure", record == null ? "" : record.component,
                    record == null ? -1 : record.displayId, "requested_task=" + requestedTaskId, error);
            diagnosticTaskSnapshot("failure_tasks", record == null ? "" : record.component);
            if (retainDisplay) {
                if (mediaScope) retainMediaOperation("媒体应用状态读取失败，原窗口和实际任务已保留", -1);
                else retainExistingLaunchFailure("应用状态读取失败，原窗口已保留：" + reason);
                return;
            }
            Bundle restored = close(); lastOperationFailed = true;
            message = reason + (restored.getBoolean("success") ? "，已释放工作区" : "；" + restored.getString("message", "恢复尚未完成"));
        }
    }

    private void retainExistingLaunchFailure(String reason) {
        ++launchGeneration;
        retainedLaunchFailure = reason; message = reason; lastOperationFailed = true;
        // The existing durable display lease remains responsible for all of its
        // tasks. Do not put it in auto-recovery or migrate a racing native task.
        recoveryPending = false;
        if (record != null) {
            record.state = "active";
            try { journal.save(record); }
            catch (Exception error) { diagnostic("launch_failure", record.component, record.displayId,
                    "route=retained_home;stage=state_persistence", error); }
        }
    }

    private void retainMediaOperation(String reason, int focusTask) {
        operationUnconfirmed = retainedMediaOperation = true; unconfirmedFocusTask = focusTask;
        if (focusTask < 0) { unconfirmedFocusComponent = ""; unconfirmedFocusUid = -1; }
        retainExistingLaunchFailure(reason);
    }

    private void clearMediaOperation() {
        operationUnconfirmed = retainedMediaOperation = false; unconfirmedFocusTask = -1;
        unconfirmedFocusComponent = ""; unconfirmedFocusUid = -1;
    }

    /** A fresh read can resolve a retained transport uncertainty; it never repeats dispatch. */
    private void confirmMediaOperation() throws Exception {
        if (!retainedMediaOperation || !operationUnconfirmed || record == null || !"active".equals(record.state)) return;
        ComponentName requested = ComponentName.unflattenFromString(unconfirmedFocusTask >= 0 ? unconfirmedFocusComponent : record.component);
        if (requested == null || !runningPackages.contains(requested.getPackageName())) return;
        if (unconfirmedFocusTask >= 0) {
            Object focused = invoke(tasks(), "getFocusedRootTaskInfo", new Class<?>[0]);
            if (!mediaFocusTargetMatches(focused, unconfirmedFocusTask, requested, unconfirmedFocusUid)) return;
        }
        clearMediaOperation(); lastOperationFailed = false; recoveryPending = false;
    }

    private int mediaPackageUid(ComponentName component) throws Exception {
        android.content.pm.ApplicationInfo app = userContext.getPackageManager().getApplicationInfo(component.getPackageName(), 0);
        if (app == null || !app.enabled || app.uid < 0 || app.uid / 100000 != userId)
            throw new SecurityException("媒体应用身份尚未确认");
        return app.uid;
    }

    /** TaskInfo's actual top UID is required; a current PM lookup cannot replace it. */
    private boolean mediaFocusTargetMatches(Object task, int id, ComponentName component, int uid) throws Exception {
        if (task == null || component == null || uid < 0 || uid / 100000 != userId
                || taskId(task) != id || taskUser(task) != userId || taskDisplay(task) != record.displayId) return false;
        try {
            Object top = task.getClass().getField("topActivity").get(task);
            Object info = task.getClass().getField("topActivityInfo").get(task);
            if (!(top instanceof ComponentName) || !component.getPackageName().equals(((ComponentName) top).getPackageName())
                    || !(info instanceof ActivityInfo)) return false;
            android.content.pm.ApplicationInfo actual = ((ActivityInfo) info).applicationInfo;
            return actual != null && actual.uid == uid && mediaPackageUid(component) == uid;
        } catch (ReflectiveOperationException missingTaskIdentity) { return false; }
    }

    private void diagnostic(String event, String component, int displayId, String detail, Throwable error) {
        try { AtomicWorkbenchDiagnostics.emit(event, windowId, userId, component, displayId, detail, error); }
        catch (Throwable ignored) { /* Diagnostics must never interrupt launch or task recovery. */ }
    }

    /** Bounded failure evidence only; never runs on each 160 ms observation tick. */
    private void diagnosticTaskSnapshot(String event, String flattenedComponent) {
        int displayId = record == null ? -1 : record.displayId;
        try {
            ComponentName target = ComponentName.unflattenFromString(flattenedComponent == null ? "" : flattenedComponent);
            if (target == null) return;
            StringBuilder detail = new StringBuilder("requested_task=").append(requestedTaskId);
            int recorded = 0;
            try {
                List<?> roots = allTasks();
                detail.append(";root_count=").append(roots.size());
                recorded = appendTaskSnapshot(detail, "root", roots, target.getPackageName(), displayId, recorded);
            } catch (Exception error) { detail.append(";root_snapshot_error=").append(error.getClass().getSimpleName()); }
            try {
                Object running = invoke(tasks(), "getTasks", new Class<?>[]{int.class, boolean.class, boolean.class, int.class},
                        1024, false, false, -1);
                if (running instanceof List<?>) {
                    List<?> leaves = (List<?>) running;
                    detail.append(";leaf_count=").append(leaves.size());
                    recorded = appendTaskSnapshot(detail, "leaf", leaves, target.getPackageName(), displayId, recorded);
                    if (leaves.size() >= 1024) detail.append(";leaf_snapshot_limited=true");
                } else detail.append(";leaf_snapshot=unavailable");
            } catch (Exception error) { detail.append(";leaf_snapshot_error=").append(error.getClass().getSimpleName()); }
            detail.append(";recorded=").append(recorded);
            diagnostic(event, flattenedComponent, displayId, detail.toString(), null);
        } catch (Throwable error) {
            diagnostic(event, flattenedComponent, displayId, "snapshot=unavailable", error);
        }
    }

    private int appendTaskSnapshot(StringBuilder detail, String source, List<?> snapshots,
            String packageName, int displayId, int recorded) throws Exception {
        int scanned = 0;
        for (Object task : snapshots) {
            if (++scanned > 1024) { detail.append(";").append(source).append("_scan_limited=true"); break; }
            boolean target = matchesPackage(task, packageName);
            int actualDisplay = taskDisplay(task);
            if (!target && (displayId <= 0 || actualDisplay != displayId)) continue;
            if (recorded >= 12) { detail.append(";task_details_limited=true"); break; }
            detail.append(';').append(source).append("{task=").append(taskId(task))
                    .append(",user=").append(taskUser(task)).append(",display=").append(actualDisplay)
                    .append(",target=").append(target).append('}');
            recorded++;
        }
        return recorded;
    }

    private ComponentName validateComponent(String flattened) throws Exception {
        ComponentName component = flattened == null || flattened.length() > 1024 ? null : ComponentName.unflattenFromString(flattened);
        if (component == null) throw new IllegalArgumentException("请选择有效的应用入口");
        String pkg = component.getPackageName();
        if (AtomicWorkbenchJournal.PACKAGE.equals(pkg) || "android".equals(pkg) || "com.android.systemui".equals(pkg)
                || pkg.endsWith("permissioncontroller")) throw new SecurityException("该系统入口不能放入工作区");
        PackageManager pm = userContext.getPackageManager();
        ActivityInfo activity = pm.getActivityInfo(component, 0);
        if (!activity.enabled || !activity.exported || activity.applicationInfo == null || !activity.applicationInfo.enabled
                || activity.applicationInfo.uid / 100000 != userId
                || (activity.permission != null && !activity.permission.isEmpty())) throw new SecurityException("应用入口不可用或需要额外授权");
        Intent launcher = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(pkg);
        boolean found = false;
        for (ResolveInfo candidate : pm.queryIntentActivities(launcher, 0))
            if (candidate.activityInfo != null && component.equals(new ComponentName(candidate.activityInfo.packageName, candidate.activityInfo.name))) found = true;
        if (!found) throw new SecurityException("只允许打开应用已声明的启动入口");
        return component;
    }

    private void requireOwnedDisplay() throws Exception {
        if (ownedDisplay == null || record == null || !"active".equals(record.state)) throw new IllegalStateException("工作区应用尚未就绪");
        requireDisplayIdentity();
    }

    private void requireDisplayIdentity() throws Exception {
        if (ownedDisplay == null || record == null) throw new IllegalStateException("工作区尚未启动");
        Display display = displays.getDisplay(record.displayId);
        if (display == null || !sameDisplay(display, record)) throw new SecurityException("工作区显示身份已变化");
    }

    @SuppressLint("SoonBlockedPrivateApi") // Constructor requires UID 0 in the hidden-API-exempt root VM.
    private boolean sameDisplay(Display display, AtomicWorkbenchJournal.Record saved) throws Exception {
        Method owner = Display.class.getDeclaredMethod("getOwnerUid"); owner.setAccessible(true);
        return saved.displayId == display.getDisplayId() && saved.displayName.equals(display.getName())
                && !saved.uniqueId.isEmpty() && saved.uniqueId.equals(uniqueId(display))
                && Integer.valueOf(0).equals(owner.invoke(display));
    }

    @SuppressLint("BlockedPrivateApi") // Root-only display identity check after the VM exemption.
    private static String uniqueId(Display display) throws Exception {
        Method getter = Display.class.getDeclaredMethod("getUniqueId"); getter.setAccessible(true);
        Object result = getter.invoke(display); return result instanceof String ? (String) result : "";
    }

    /**
     * A workbench is not an external cast target. PRESENTATION advertises it to
     * players that then add a video window above another slot's HOME. Keep PUBLIC:
     * the real wallpaper service has no Activity here and cannot access a private
     * root-owned display. OWN_CONTENT_ONLY prevents any empty-slot mirroring.
     */
    private static int workbenchDisplayFlags() throws Exception {
        return DisplayManager.VIRTUAL_DISPLAY_FLAG_PUBLIC | DisplayManager.VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY
                | hiddenDisplayFlag("VIRTUAL_DISPLAY_FLAG_SUPPORTS_TOUCH")
                | hiddenDisplayFlag("VIRTUAL_DISPLAY_FLAG_TRUSTED")
                | hiddenDisplayFlag("VIRTUAL_DISPLAY_FLAG_OWN_FOCUS");
    }

    private static void requireDisplayPolicy(Display display) {
        int flags = display.getFlags();
        if ((flags & AtomicWorkbenchDisplayPolicy.forbiddenFlags()) != 0)
            throw new SecurityException("系统未接受工作区显示策略，无法同时保证原生壁纸和独立画面");
    }

    private static int hiddenDisplayFlag(String name) throws Exception {
        Field field = DisplayManager.class.getDeclaredField(name); field.setAccessible(true); return field.getInt(null);
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    @SuppressLint({"BlockedPrivateApi", "PrivateApi"}) // Root-only task service; never called in the application VM.
    private Object tasks() throws Exception {
        if (taskService == null) taskService = Class.forName("android.app.ActivityTaskManager").getDeclaredMethod("getService").invoke(null);
        if (taskService == null) throw new IllegalStateException("任务服务不可用"); return taskService;
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    private Object window() throws Exception {
        if (windowService == null) windowService = Class.forName("android.view.WindowManagerGlobal").getDeclaredMethod("getWindowManagerService").invoke(null);
        if (windowService == null) throw new IllegalStateException("窗口服务不可用"); return windowService;
    }

    private List<?> allTasks() throws Exception {
        Object result = invoke(tasks(), "getAllRootTaskInfos", new Class<?>[0]);
        if (!(result instanceof List<?>)) throw new IllegalStateException("任务快照不可用"); return (List<?>) result;
    }

    private Object verifiedOriginalTask(int originalTaskId, String packageName) throws Exception {
        Object running = invoke(tasks(), "getTasks", new Class<?>[]{int.class, boolean.class, boolean.class, int.class},
                1024, false, false, -1);
        if (!(running instanceof List<?>) || ((List<?>) running).size() >= 1024)
            throw new IllegalStateException("原任务完整快照不可用");
        for (Object task : (List<?>) running) if (taskId(task) == originalTaskId) {
            if (taskUser(task) != userId || taskDisplay(task) != 0 || !matchesPackage(task, packageName))
                throw new SecurityException("原任务的用户、主屏位置或应用身份已变化");
            tasks().getClass().getMethod("startActivityFromRecents", int.class, Bundle.class).setAccessible(true);
            return task;
        }
        throw new IllegalStateException("原应用任务已结束，未重新启动应用");
    }

    private List<?> ownedTasks() throws Exception {
        if (record == null || record.displayId <= 0) return new ArrayList<>();
        Object result = invoke(tasks(), "getAllRootTaskInfosOnDisplay", new Class<?>[]{int.class}, record.displayId);
        if (!(result instanceof List<?>)) throw new IllegalStateException("工作区任务快照不可用");
        ArrayList<Object> apps = new ArrayList<>();
        for (Object task : (List<?>) result) {
            if (taskDisplay(task) != record.displayId || taskUser(task) != userId) continue;
            int type = (Integer) invoke(task, "getActivityType", new Class<?>[0]);
            if (type == 0 || type == 1) apps.add(task);
        }
        return apps;
    }

    private void rememberCurrentTasks() throws Exception {
        List<?> tasks = ownedTasks(); taskCount = tasks.size();
        runningPackages.clear();
        for (Object task : tasks) for (String field : new String[]{"baseActivity", "topActivity"}) {
            Object value = task.getClass().getField(field).get(task);
            if (value instanceof ComponentName) {
                String pkg = ((ComponentName) value).getPackageName();
                if (runningPackages.size() < 64 && !runningPackages.contains(pkg)) runningPackages.add(pkg);
            }
        }
        nativeHomeVisible = false; observedTaskId = -1; observedTargetUid = -1; topComponent = "";
        if (record.homeTaskId >= 0) {
            Object home = recordedHomeTask();
            if (home != null && taskDisplay(home) == record.displayId) taskCount++;
            else if (home == null) restoreNativeHomeInternal(false);
            else if (taskDisplay(home) == 0) restoreNativeHomeInternal(false);
            else throw new SecurityException("原生桌面已迁往其他显示屏，恢复依据已保留");
        }
        Object roots = invoke(tasks(), "getAllRootTaskInfosOnDisplay", new Class<?>[]{int.class}, record.displayId);
        if (!(roots instanceof List<?>)) throw new IllegalStateException("工作区前台任务快照不可用");
        // This ROM's RootWindowContainer.getAllRootTaskInfos(display) enumerates
        // forAllRootTasks(consumer) with traverseTopToBottom=true.
        for (Object top : (List<?>) roots) {
            if (taskUser(top) != userId) continue;
            int type = (Integer) invoke(top, "getActivityType", new Class<?>[0]);
            if (type != 0 && type != 1 && taskId(top) != record.homeTaskId) continue;
            observedTaskId = taskId(top);
            Object component = top.getClass().getField("topActivity").get(top);
            topComponent = component instanceof ComponentName ? ((ComponentName) component).flattenToString() : component(top);
            ComponentName selected = ComponentName.unflattenFromString(topComponent);
            if (selected != null) {
                try {
                    observedTargetUid = userContext.getPackageManager().getApplicationInfo(selected.getPackageName(), 0).uid;
                    if (observedTargetUid / 100000 != userId) observedTargetUid = -1;
                } catch (PackageManager.NameNotFoundException unavailable) { observedTargetUid = -1; }
            }
            nativeHomeVisible = observedTaskId == record.homeTaskId;
            break;
        }
        boolean changed = addTaskEvidence(tasks);
        if (!tasks.isEmpty() && record.retainedEmptyTaskDisplay) { record.retainedEmptyTaskDisplay = false; changed = true; }
        if (changed) journal.save(record);
    }

    private boolean addTaskEvidence(List<?> tasks) throws Exception {
        boolean changed = false;
        for (Object task : tasks) {
            int id = taskId(task); boolean present = false;
            for (AtomicWorkbenchJournal.TaskOrigin entry : record.tasks) if (entry.taskId == id) present = true;
            if (!present) {
                if (record.tasks.size() >= 256) throw new IllegalStateException("任务恢复记录已满");
                record.tasks.add(new AtomicWorkbenchJournal.TaskOrigin(id, Display.DEFAULT_DISPLAY, taskUser(task), component(task)));
                changed = true;
            }
        }
        return changed;
    }

    Bundle taskWindowIdentity() throws Exception {
        requireDisplayIdentity();
        Bundle b = new Bundle(); b.putInt("window_id", windowId); b.putString("window_session", record.session);
        b.putInt("display_id", record.displayId); b.putString("display_name", record.displayName); b.putString("display_unique", record.uniqueId);
        return b;
    }
    boolean hasTaskJournalSession(String session) {
        return record != null && journal != null && record.session.equals(session);
    }

    /** The transaction is durable before the broker may mutate; no Intent or task migration here. */
    void prepareTaskOperation(AtomicWorkbenchTaskOperationRequest request, boolean receiving, String phase, String lease) throws Exception {
        requireDisplayIdentity();
        String expected = receiving ? request.targetWindowSession : request.sourceWindowSession;
        if (!record.session.equals(expected) || windowId != (receiving ? request.targetSlot : request.sourceSlot))
            throw new SecurityException("task_journal_window_changed");
        if (receiving && (record.displayId != request.targetDisplayId || !record.displayName.equals(request.targetDisplayName)
                || !record.uniqueId.equals(request.targetDisplayUnique))
                || !receiving && request.identity.displayId > 0 && (record.displayId != request.identity.displayId
                || !record.displayName.equals(request.identity.displayName) || !record.uniqueId.equals(request.identity.displayUnique)))
            throw new SecurityException("task_journal_display_changed");
        AtomicWorkbenchTaskIdentity id = request.identity;
        AtomicWorkbenchJournal.TaskOrigin origin = new AtomicWorkbenchJournal.TaskOrigin(id.taskId, Display.DEFAULT_DISPLAY, id.userId,
                id.baseComponent, id.uid, id.serverBootGeneration, id.taskGeneration, "WORKSPACE_OWNED", "");
        boolean known = false;
        for (int i = 0; i < record.tasks.size(); i++) {
            AtomicWorkbenchJournal.TaskOrigin saved = record.tasks.get(i);
            if (saved.taskId == id.taskId && saved.userId == id.userId && saved.component.equals(id.baseComponent)) {
                // Preserve the currently accepted disposition until a post-mutation durable handoff.
                if (!receiving && id.serverBootGeneration.equals(saved.serverBootGeneration)
                        && id.taskGeneration.equals(saved.taskGeneration) && id.uid == saved.uid) origin = saved;
                record.tasks.set(i, origin); known = true; break;
            }
        }
        if (!known) {
            if (record.tasks.size() >= 256) throw new IllegalStateException("task_journal_capacity");
            record.tasks.add(origin);
        }
        AtomicWorkbenchJournal.TaskOperation pending = new AtomicWorkbenchJournal.TaskOperation(request.operationId, request.shelfId,
                request.action.name(), phase, lease, origin, request.targetSlot, request.targetDisplayId,
                request.targetWindowSession, request.targetDisplayName, request.targetDisplayUnique);
        boolean updated = false;
        for (int i = 0; i < record.taskOperations.size(); i++) if (record.taskOperations.get(i).operationId.equals(request.operationId)) {
            record.taskOperations.set(i, pending); updated = true; break;
        }
        if (!updated) {
            if (record.taskOperations.size() >= 16) throw new IllegalStateException("task_journal_pending_capacity");
            record.taskOperations.add(pending);
        }
        journal.save(record);
    }

    /** Called only after receiver/store durable acknowledgement of this exact generation. */
    void finishTaskOperation(String operationId, String boot, String generation, String disposition, String successor) throws Exception {
        if (record == null || journal == null) return;
        // This only acknowledges durable ownership. A disappeared source VD must
        // not prevent retiring its exact origin after a receiver has committed.
        boolean found = false;
        for (int i = 0; i < record.tasks.size(); i++) {
            AtomicWorkbenchJournal.TaskOrigin saved = record.tasks.get(i);
            if (!saved.serverBootGeneration.equals(boot) || !saved.taskGeneration.equals(generation)) continue;
            AtomicWorkbenchJournal.TaskOrigin next = new AtomicWorkbenchJournal.TaskOrigin(saved.taskId, saved.displayId, saved.userId,
                    saved.component, saved.uid, boot, generation, disposition, successor);
            // Validate before writing new authorization-shaped metadata.
            AtomicWorkbenchJournal.TaskOrigin.read(next.json()); record.tasks.set(i, next); found = true;
        }
        if (!found) throw new SecurityException("task_journal_origin_missing");
        record.taskOperations.removeIf(p -> p.operationId.equals(operationId));
        journal.save(record);
    }

    /** Only a broker-confirmed non-dispatch cancel/cleanup may omit a never-prepared journal entry. */
    void cancelPreparedTaskOperation(String operationId, String boot, String generation, String disposition, String successor) throws Exception {
        if (record == null || journal == null) throw new SecurityException("task_journal_missing");
        boolean present = false;
        for (AtomicWorkbenchJournal.TaskOperation operation : record.taskOperations) if (operation.operationId.equals(operationId)) present = true;
        for (AtomicWorkbenchJournal.TaskOrigin origin : record.tasks)
            if (boot.equals(origin.serverBootGeneration) && generation.equals(origin.taskGeneration)) present = true;
        if (present) finishTaskOperation(operationId, boot, generation, disposition, successor);
    }

    /** Called only after the exact-task broker and durable shelf commit both succeeded. */
    void synchronizeTaskOperationBinding(AtomicWorkbenchTaskIdentity restored) throws Exception {
        requireDisplayIdentity();
        if (restored != null && (restored.displayId != record.displayId || !restored.displayName.equals(record.displayName)
                || !restored.displayUnique.equals(record.uniqueId) || restored.userId != userId))
            throw new SecurityException("task_restored_display_changed");
        rememberCurrentTasks();
        List<?> live = ownedTasks();
        if (restored != null) {
            boolean found = false;
            Object leaves = invoke(tasks(), "getTasks", new Class<?>[]{int.class, boolean.class, boolean.class, int.class},
                    1024, false, false, -1);
            if (!(leaves instanceof List<?>) || ((List<?>) leaves).size() >= 1024) throw new IllegalStateException("task_restore_snapshot_missing");
            for (Object task : (List<?>) leaves) if (taskId(task) == restored.taskId && taskDisplay(task) == record.displayId
                    && taskUser(task) == userId && component(task).equals(restored.baseComponent)) { found = true; break; }
            if (!found) throw new SecurityException("task_restored_task_missing");
            record.component = restored.baseComponent; requestedTaskId = restored.taskId;
        }
        record.retainedEmptyTaskDisplay = live.isEmpty();
        if (live.isEmpty()) { record.component = ""; requestedTaskId = -1; }
        else if (restored == null) {
            ComponentName bound = ComponentName.unflattenFromString(record.component);
            if (bound == null || !runningPackages.contains(bound.getPackageName())) {
                for (Object task : live) {
                    String current = component(task);
                    if (ComponentName.unflattenFromString(current) != null) { record.component = current; requestedTaskId = taskId(task); break; }
                }
            }
        }
        // HOME remains governed by its existing independent lease, never manufactured by an empty task slot.
        journal.save(record);
    }

    private void verifyRecordedTasksRestored() throws Exception {
        // Root IDs can become child IDs after reparenting. Check both root and leaf snapshots.
        List<Object> snapshots = new ArrayList<>(); snapshots.addAll(allTasks());
        Object running = invoke(tasks(), "getTasks", new Class<?>[]{int.class, boolean.class, boolean.class, int.class},
                1024, false, false, -1);
        if (!(running instanceof List<?>) || ((List<?>) running).size() >= 1024)
            throw new IllegalStateException("完整任务恢复快照暂不可用");
        snapshots.addAll((List<?>) running);
        for (AtomicWorkbenchJournal.TaskOrigin saved : record.tasks) {
            // An authenticated durable transfer retires only this exact prior origin.
            // Legacy origins have no generation and retain their original cleanup behavior.
            if (!saved.taskGeneration.isEmpty() && !"WORKSPACE_OWNED".equals(saved.disposition)) continue;
            for (Object live : snapshots) {
                if (taskId(live) != saved.taskId || taskUser(live) != saved.userId) continue;
                // Reused task IDs belong to a different task and must never be moved by recovery.
                if (!saved.component.equals(component(live))) continue;
                if (taskDisplay(live) != Display.DEFAULT_DISPLAY)
                    throw new IllegalStateException("仍有已记录的应用任务未回到手机主屏，恢复依据已保留");
            }
        }
    }

    private void moveTaskToPrimary(Object task, boolean keepInBackground) throws Exception {
        diagnostic("task_restore_request", component(task), taskDisplay(task), "task=" + taskId(task) + ";to=0", null);
        restorePendingVisibility();
        if (!keepInBackground) {
            invoke(tasks(), "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class}, taskId(task), 0);
            diagnosticRestoredTask(task);
            return;
        }
        verifyBackgroundInterfaces();
        record.hiddenTaskId = taskId(task);
        if (!journal.originalStorageMissing()) journal.save(record);
        hiddenTaskToken = task.getClass().getField("token").get(task);
        if (hiddenTaskToken == null) throw new IllegalStateException("应用任务窗口令牌不可用");
        try {
            applyTaskVisibility(hiddenTaskToken, true, false);
            invoke(tasks(), "moveRootTaskToDisplay", new Class<?>[]{int.class, int.class}, taskId(task), 0);
        } finally { restorePendingVisibility(); }
        diagnosticRestoredTask(task);
    }

    private void diagnosticRestoredTask(Object original) throws Exception {
        int actual = -1;
        for (Object task : allTasks()) if (taskId(task) == taskId(original) && taskUser(task) == userId
                && component(task).equals(component(original))) { actual = taskDisplay(task); break; }
        diagnostic("task_restore_result", component(original), actual, "task=" + taskId(original) + ";expected_display=0", null);
    }

    private void restorePendingVisibility() throws Exception {
        if (record == null || (hiddenTaskToken == null && record.hiddenTaskId < 0)) return;
        if (hiddenTaskToken == null) {
            for (Object live : allTasks()) {
                if (taskId(live) != record.hiddenTaskId || taskUser(live) != userId) continue;
                boolean expected = false;
                for (AtomicWorkbenchJournal.TaskOrigin saved : record.tasks)
                    if (saved.taskId == record.hiddenTaskId && saved.userId == userId
                            && saved.component.equals(component(live))) expected = true;
                if (expected) hiddenTaskToken = live.getClass().getField("token").get(live);
            }
        }
        if (hiddenTaskToken != null) applyTaskVisibility(hiddenTaskToken, false, false);
        hiddenTaskToken = null;
        record.hiddenTaskId = -1;
        if (!journal.originalStorageMissing()) journal.save(record);
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void applyTaskVisibility(Object token, boolean hidden, boolean onTop) throws Exception {
        Class<?> tokenClass = Class.forName("android.window.WindowContainerToken");
        Class<?> transactionClass = Class.forName("android.window.WindowContainerTransaction");
        Object transaction = transactionClass.getConstructor().newInstance();
        transactionClass.getMethod("setHidden", tokenClass, boolean.class).invoke(transaction, token, hidden);
        transactionClass.getMethod("reorder", tokenClass, boolean.class).invoke(transaction, token, onTop);
        Object organizer = Class.forName("android.window.WindowOrganizer").getConstructor().newInstance();
        organizer.getClass().getMethod("applyTransaction", transactionClass).invoke(organizer, transaction);
    }

    private void focus() throws Exception {
        if (!outputState.acceptsInput() || inputCancelPending) throw new IllegalStateException("工作区画面尚未接回");
        Object listed = invoke(tasks(), "getAllRootTaskInfosOnDisplay", new Class<?>[]{int.class}, record.displayId);
        if (!(listed instanceof List<?>)) throw new IllegalStateException("工作区焦点快照不可用");
        for (Object task : (List<?>) listed) {
            if (taskUser(task) != userId) throw new SecurityException("工作区焦点用户不匹配");
            int type = (Integer) invoke(task, "getActivityType", new Class<?>[0]);
            if (type == 0 || type == 1 || taskId(task) == record.homeTaskId) {
                invoke(tasks(), "setFocusedTask", new Class<?>[]{int.class}, taskId(task)); return;
            }
        }
    }

    @SuppressLint("BlockedPrivateApi") // Root-only input backend after the VM exemption.
    private void setInputDisplay(InputEvent event) throws Exception {
        Method method = InputEvent.class.getDeclaredMethod("setDisplayId", int.class); method.setAccessible(true);
        method.invoke(event, record.displayId);
    }

    private boolean injectEvent(InputEvent event, int mode) throws Exception {
        prepareInputBackend();
        return Boolean.TRUE.equals(injectMethod.invoke(inputManager, event, mode));
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void verifyBackgroundInterfaces() throws Exception {
        Class<?> tokenClass = Class.forName("android.window.WindowContainerToken");
        Class<?> transactionClass = Class.forName("android.window.WindowContainerTransaction");
        transactionClass.getMethod("setHidden", tokenClass, boolean.class);
        transactionClass.getMethod("reorder", tokenClass, boolean.class);
        Class.forName("android.window.WindowOrganizer").getMethod("applyTransaction", transactionClass);
    }

    @SuppressLint("BlockedPrivateApi") // Probe the same exempted root backend before opening a display.
    private void verifyRequiredInterfaces() throws Exception {
        Object service = tasks();
        for (String name : new String[]{"moveRootTaskToDisplay", "getAllRootTaskInfosOnDisplay", "setFocusedTask"}) {
            Class<?>[] parameters = "moveRootTaskToDisplay".equals(name)
                    ? new Class<?>[]{int.class, int.class} : new Class<?>[]{int.class};
            service.getClass().getMethod(name, parameters).setAccessible(true);
        }
        Object running = invoke(service, "getTasks", new Class<?>[]{int.class, boolean.class, boolean.class, int.class},
                1024, false, false, -1);
        if (!(running instanceof List<?>) || ((List<?>) running).size() >= 1024)
            throw new IllegalStateException("完整任务恢复快照暂不可用");
        window().getClass().getMethod("setDisplayImePolicy", int.class, int.class).setAccessible(true);
        window().getClass().getMethod("getDisplayImePolicy", int.class).setAccessible(true);
        InputEvent.class.getDeclaredMethod("setDisplayId", int.class).setAccessible(true);
        prepareInputBackend();
    }

    private void prepareInputBackend() throws Exception {
        if (inputManager != null && injectMethod != null) return;
        Exception unavailable = null;
        for (String name : new String[]{"android.hardware.input.InputManagerGlobal", "android.hardware.input.InputManager"}) {
            try {
                Class<?> manager = Class.forName(name);
                Method instance = manager.getDeclaredMethod("getInstance"); instance.setAccessible(true);
                Object candidate = instance.invoke(null);
                Method injection = manager.getDeclaredMethod("injectInputEvent", InputEvent.class, int.class);
                injection.setAccessible(true);
                if (candidate == null) throw new IllegalStateException("输入服务不可用");
                inputManager = candidate; injectMethod = injection;
                return;
            } catch (ReflectiveOperationException | RuntimeException error) { unavailable = error; }
        }
        throw new IllegalStateException("系统未提供工作区触摸输入接口", unavailable);
    }

    private void cancelTouch() throws Exception {
        activeGesture = false;
        if (lastTouch == null) { inputCancelPending = false; return; }
        MotionEvent cancel = lastTouch; lastTouch = null;
        try {
            if (record != null && ownedDisplay != null) {
                cancel.setAction(MotionEvent.ACTION_CANCEL); setInputDisplay(cancel);
                if (!injectEvent(cancel, 0)) throw new IllegalStateException("系统未接收旧窗口触摸取消");
            }
            inputCancelPending = false;
        } catch (Exception failed) {
            // Keep the exact routed stream until a real CANCEL acknowledgement or VD release.
            lastTouch = cancel; cancel = null; inputCancelPending = true;
            inputBackendFailed = true; throw failed;
        } finally { if (cancel != null) cancel.recycle(); }
    }

    private static AtomicWorkbenchJournal.TaskOrigin origin(Object task) throws Exception {
        return new AtomicWorkbenchJournal.TaskOrigin(taskId(task), taskDisplay(task), taskUser(task), component(task));
    }
    private static int taskId(Object task) throws Exception { return intField(task, "taskId"); }
    private static int taskDisplay(Object task) throws Exception { return intField(task, "displayId"); }
    private static int taskUser(Object task) throws Exception { return intField(task, "userId"); }
    private static int intField(Object object, String name) throws Exception { Field field = object.getClass().getField(name); field.setAccessible(true); return field.getInt(object); }
    private static String component(Object task) throws Exception {
        Object value = task.getClass().getField("baseActivity").get(task);
        if (!(value instanceof ComponentName)) value = task.getClass().getField("topActivity").get(task);
        return value instanceof ComponentName ? ((ComponentName) value).flattenToString() : "";
    }
    private static boolean matchesPackage(Object task, String pkg) throws Exception {
        for (String name : new String[]{"baseActivity", "topActivity"}) {
            Object value = task.getClass().getField(name).get(task);
            if (value instanceof ComponentName && pkg.equals(((ComponentName) value).getPackageName())) return true;
        }
        return false;
    }
    private static boolean matchesWorkbenchHost(Object task) throws Exception {
        String activity = AtomicWorkbenchJournal.PACKAGE + ".AtomicWorkbenchActivity";
        for (String name : new String[]{"baseActivity", "topActivity"}) {
            Object value = task.getClass().getField(name).get(task);
            if (value instanceof ComponentName && AtomicWorkbenchJournal.PACKAGE.equals(((ComponentName) value).getPackageName())
                    && activity.equals(((ComponentName) value).getClassName())) return true;
        }
        return false;
    }
    private static boolean allowedKey(int code) {
        return code == KeyEvent.KEYCODE_BACK || code == KeyEvent.KEYCODE_ESCAPE || code == KeyEvent.KEYCODE_ENTER
                || code == KeyEvent.KEYCODE_TAB || code == KeyEvent.KEYCODE_DEL || code == KeyEvent.KEYCODE_FORWARD_DEL
                || code >= KeyEvent.KEYCODE_DPAD_UP && code <= KeyEvent.KEYCODE_DPAD_CENTER;
    }
    private static Object invoke(Object target, String name, Class<?>[] parameters, Object... values) throws Exception {
        Method method = target.getClass().getMethod(name, parameters); method.setAccessible(true); return method.invoke(target, values);
    }
    private Bundle result(boolean success, String text) {
        message = text;
        Bundle bundle = new Bundle(); bundle.putBoolean("success", success); bundle.putString("message", text);
        bundle.putString("launch_failure", retainedLaunchFailure);
        bundle.putBoolean("input_focus_suspended", inputFocusSuspended);
        bundle.putBoolean("input_focus_failure", inputFocusTransitionFailed);
        bundle.putBoolean("input_focus_cleanup_pending", inputFocusCleanupPending);
        bundle.putBoolean("guard_cleanup_pending", inputFocusCleanupPending);
        bundle.putBoolean("input_cancel_pending", inputCancelPending);
        bundle.putBoolean("input_rebind_pending", resumeRebindPending);
        bundle.putBoolean("operation_unconfirmed", operationUnconfirmed);
        bundle.putLong("output_generation", outputState.generation());
        bundle.putBoolean("output_attached", ownedDisplay != null && outputState.attached());
        bundle.putBoolean("output_attached_known", outputState.known());
        bundle.putBoolean("output_transition_pending", outputState.pending());
        bundle.putInt("window_id", windowId); bundle.putInt("requested_task_id", requestedTaskId);
        bundle.putString("window_session", record == null ? "" : record.session);
        bundle.putString("allocation_id", record == null ? "" : record.taskAllocationId);
        bundle.putBoolean("retained_empty_task_display", record != null && record.retainedEmptyTaskDisplay);
        bundle.putBoolean("empty_task_display", record != null && record.retainedEmptyTaskDisplay && record.homeTaskId < 0);
        bundle.putInt("user_id", userId);
        bundle.putInt("task_id", record == null ? -1 : observedTaskId);
        bundle.putInt("target_uid", record == null ? -1 : observedTargetUid);
        bundle.putInt("home_task_id", record == null ? -1 : record.homeTaskId);
        bundle.putString("home_component", record == null ? "" : record.homeComponent);
        bundle.putBoolean("home_only", record != null && record.homeOnly);
        bundle.putBoolean("native_home", record != null && nativeHomeVisible);
        bundle.putBoolean("home_reused_visible", record != null && nativeHomeVisible && homeReusedVisible);
        bundle.putBoolean("physical_home_returned", physicalHomeReturned);
        bundle.putString("top_component", record == null ? "" : topComponent);
        ComponentName top = record == null ? null : ComponentName.unflattenFromString(topComponent);
        bundle.putString("package", top == null ? "" : top.getPackageName());
        bundle.putStringArrayList("running_packages", record == null ? new ArrayList<>() : new ArrayList<>(runningPackages));
        bundle.putInt("display_id", record == null ? -1 : record.displayId);
        bundle.putString("display_name", record == null ? "" : record.displayName);
        bundle.putString("display_unique_id", record == null ? "" : record.uniqueId);
        bundle.putInt("width", record == null ? 0 : record.width); bundle.putInt("height", record == null ? 0 : record.height);
        bundle.putInt("density", record == null ? 0 : record.density); bundle.putInt("ime_policy", record == null ? -1 : record.imePolicy);
        bundle.putInt("task_count", taskCount); bundle.putBoolean("recovery_pending", hasRecoveryPending());
        bundle.putBoolean("task_recovery_pending", hasTaskRecoveryPending());
        bundle.putString("state", record == null ? (recoveryPending ? "recovering" : "closed") : record.state);
        appendHomeReadiness(bundle);
        return bundle;
    }

    /** WM draw evidence is independent of the task/focus acknowledgement and the consumer frame. */
    private void appendHomeReadiness(Bundle result) {
        result.putBoolean("home_surface_ready", false); result.putBoolean("wallpaper_interface_ready", false);
        result.putBoolean("wallpaper_frame_verified", false); result.putString("readiness_state", "unknown");
        result.putLong("readiness_started_uptime", 0L); result.putLong("home_drawn_uptime", 0L); result.putLong("wallpaper_drawn_uptime", 0L);
        result.putLong("readiness_request_nanos", homeReadinessAfterNanos); result.putLong("readiness_generation_nanos", 0L);
        if (record == null || record.homeTaskId < 0 || !nativeHomeVisible) return;
        try {
            requireDisplayIdentity();
            Object homeTask = recordedHomeTask();
            if (homeTask == null || taskDisplay(homeTask) != record.displayId) { readinessRejected(result, "live_task_identity"); return; }
            if (readinessReader == null) { readinessRejected(result, "session_reader_missing"); return; }
            Bundle query = new Bundle(); query.putInt("window_id", windowId); query.putInt("display_id", record.displayId);
            query.putInt("home_task_id", record.homeTaskId); query.putString("display_name", record.displayName);
            query.putString("unique_id", record.uniqueId);
            Bundle reply = readinessReader.read(query);
            if (reply == null || !reply.getBoolean("success", false)) {
                readinessRejected(result, reply == null ? "provider_unavailable" : reply.getString("readiness_reason", "provider_rejected")); return;
            }
            String[] fields = reply.getString("value", "").split("\\|", -1);
            int build = Class.forName("ls.augment.com.BuildConfig").getField("VERSION_CODE").getInt(null);
            long observed = fields.length == 14 ? Long.parseLong(fields[5]) : -1, now = SystemClock.uptimeMillis();
            if (fields.length != 14 || !"HR1".equals(fields[0]) || Integer.parseInt(fields[1]) != build
                    || Integer.parseInt(fields[2]) != record.displayId || !record.uniqueId.equals(fields[3])
                    || Integer.parseInt(fields[4]) != record.homeTaskId) { readinessRejected(result, "observation_identity"); return; }
            if (observed < homeReadinessAfter || observed > now || now - observed > 15000L) {
                readinessRejected(result, "observation_time"); return;
            }
            long generationNanos = Long.parseLong(fields[13]);
            if (generationNanos < homeReadinessAfterNanos || generationNanos > System.nanoTime()) {
                readinessRejected(result, "observation_generation"); return;
            }
            boolean home = "true".equals(fields[6]), wallpaper = "true".equals(fields[7]), drawn = "true".equals(fields[8]);
            long started = Long.parseLong(fields[10]), homeAt = Long.parseLong(fields[11]), wallpaperAt = Long.parseLong(fields[12]);
            if (started < homeReadinessAfter || started > observed || homeAt < 0 || wallpaperAt < 0
                    || homeAt > observed || wallpaperAt > observed) { readinessRejected(result, "draw_time"); return; }
            result.putBoolean("home_surface_ready", home); result.putBoolean("wallpaper_interface_ready", wallpaper);
            result.putBoolean("wallpaper_frame_verified", drawn);
            result.putString("readiness_state", home && wallpaper && drawn ? "wm_drawn" : "waiting_drawn");
            result.putString("readiness_error", fields[9]);
            result.putLong("readiness_started_uptime", started); result.putLong("home_drawn_uptime", homeAt);
            result.putLong("wallpaper_drawn_uptime", wallpaperAt);
            result.putLong("readiness_generation_nanos", generationNanos);
            readinessReason(result, home && wallpaper && drawn ? "wm_drawn" : "waiting_drawn");
        } catch (Exception unavailable) {
            result.putString("readiness_error", unavailable.getClass().getSimpleName()); readinessRejected(result, "read_exception");
        }
    }

    private void readinessRejected(Bundle result, String reason) {
        result.putString("readiness_state", "rejected"); readinessReason(result, reason);
    }

    private void readinessReason(Bundle result, String reason) {
        // Reasons are stable branch names, never a provider/exception message or credential.
        String safeReason = reason != null && reason.matches("[a-z_]{1,48}") ? reason : "provider_rejected";
        result.putString("readiness_reason", safeReason);
        if (safeReason.equals(lastReadinessReason)) return;
        lastReadinessReason = safeReason;
        diagnostic("native_home_readiness", record == null ? "" : record.homeComponent, record == null ? -1 : record.displayId,
                "phase=" + ("wm_drawn".equals(safeReason) ? "ready" : "waiting") + ";reason=" + safeReason
                        + ";task=" + (record == null ? -1 : record.homeTaskId), null);
    }
    private static String failure(Throwable error) {
        while (error instanceof InvocationTargetException && ((InvocationTargetException) error).getCause() != null)
            error = ((InvocationTargetException) error).getCause();
        String detail = error.getMessage();
        return error.getClass().getSimpleName() + (detail == null ? "" : "：" + detail.substring(0, Math.min(detail.length(), 180)));
    }
    private static void release(Surface surface) { if (surface != null) try { surface.release(); } catch (RuntimeException ignored) { } }
}
