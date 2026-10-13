package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.net.Uri;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicLong;
import ls.augment.com.GameOptions;
import ls.augment.com.BuildConfig;
import ls.augment.com.ShoulderQuickSwitchPolicy.CaseRef;

/** Persist one selection before applying it; serialize with the OEM's pending writers. */
final class ShoulderQuickSwitchRuntime {
    private static final Map<Object, Session> SESSIONS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final AtomicLong OWNERS = new AtomicLong();
    private static final Uri MACROS = Uri.parse("content://cn.nubia.gamehelper.db.recordmotion");
    private static Class<?> helper;
    private static boolean installed, ready, watching;

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        ShoulderSelectionStore.install(module, loader);
        if (installed) return;
        installed = true;
        try {
            helper = Class.forName("cn.nubia.tgk.TgkHelper", false, loader);
            Class<?> service = Class.forName("cn.nubia.tgk.TgkService", false, loader);
            Method enable = method(service, "enableTgkMap", String.class, int.class);
            module.registerFeatureHook(module.prepareFeatureHook(enable, "shoulder.reload_guard", true)
                    .intercept(chain -> {
                        Session session = session(chain.getThisObject());
                        synchronized (session) {
                            ShoulderSwitchCoordinator.Ticket ticket = session.coordinator.current();
                            if (ticket != null) {
                                String pkg = (String) chain.getArg(0);
                                if (enabled(session) && ticket.target.gamePackage.equals(pkg)) {
                                    trace("WARN", ticket, "RELOAD_DEFERRED", "status=PENDING");
                                    // Final application uses a fresh committed model and the current orientation.
                                    return null;
                                }
                                cancel(session, "environment_changed");
                            }
                            return chain.proceed();
                        }
                    }));
            Method start = method(service, "onStartCommand", Intent.class, int.class, int.class);
            module.registerFeatureHook(module.prepareFeatureHook(start, "shoulder.owner_guard", true)
                    .intercept(chain -> {
                        Session session = session(chain.getThisObject());
                        Intent intent = (Intent) chain.getArg(0);
                        if (intent != null) {
                            String pkg = intent.getStringExtra("packagename");
                            synchronized (session) {
                                CaseRef target = session.committed;
                                ShoulderSwitchCoordinator.Ticket ticket = session.coordinator.current();
                                if (ticket != null) target = ticket.target;
                                if (target != null && pkg != null && !target.gamePackage.equals(pkg))
                                    cancel(session, "application_changed");
                            }
                        }
                        return chain.proceed();
                    }));
            Method destroy = method(service, "onDestroy");
            module.registerFeatureHook(module.prepareFeatureHook(destroy, "shoulder.destroy_guard", true)
                    .intercept(chain -> {
                        Session session = session(chain.getThisObject());
                        synchronized (session) { cancel(session, "service_destroyed"); }
                        return chain.proceed();
                    }));
            Class<?> map = Class.forName("cn.nubia.tgk.TgkMapView", false, loader);
            module.registerFeatureHook(module.prepareFeatureHook(method(map, "initTgkMapView", String.class),
                    "shoulder.editor_guard", true).intercept(chain -> {
                String pkg = (String) chain.getArg(0);
                if (hasPending(pkg)) {
                    HookTelemetry.shoulderSwitch("WARN", "stage=EDITOR_OPEN status=REJECTED_PENDING pkg=" + pkg);
                    return null;
                }
                cancelPackage(pkg, "editor_opened");
                return chain.proceed();
            }));
            installWriter(module, loader, "UiAsyncTask", Void[].class);
            installWriter(module, loader, "DismissViewAsyncTask", Long[].class);
            Class<?> handler = Class.forName("cn.nubia.tgk.TgkService$WorkHandler", false, loader);
            Method handle = method(handler, "handleMessage", Message.class);
            module.registerFeatureHook(module.prepareFeatureHook(handle, "shoulder.editor_message", true)
                    .intercept(chain -> {
                        Message message = (Message) chain.getArg(0);
                        if (message != null && message.what == 0) {
                            Object owner = TargetReflection.field(chain.getThisObject(), "this$0");
                            Session session = session(owner);
                            synchronized (session) {
                                ShoulderSwitchCoordinator.Ticket ticket = session.coordinator.current();
                                if (ticket != null && enabled(session)) {
                                    if (message.obj instanceof String && !ticket.target.gamePackage.equals(message.obj)) {
                                        cancel(session, "application_changed");
                                        return chain.proceed();
                                    }
                                    if (session.editorMessage != null) session.editorMessage.recycle();
                                    session.editorMessage = Message.obtain(message);
                                    session.editorHandler = new WeakReference<>((Handler) chain.getThisObject());
                                    trace("INFO", ticket, "EDITOR_OPEN", "status=DEFERRED");
                                    return null;
                                }
                            }
                        }
                        return chain.proceed();
                    }));
            module.deoptimize(handle);
            ready = ShoulderNativeApply.install(module, loader);
            HookTelemetry.shoulderSwitch(ready ? "INFO" : "ERROR", "stage=SWITCH_RUNTIME status="
                    + (ready ? "READY" : "INPUT_UNAVAILABLE"));
        } catch (Throwable error) {
            HookTelemetry.shoulderSwitch("ERROR", "stage=SWITCH_RUNTIME status=FAILED errorClass="
                    + error.getClass().getSimpleName());
            module.logFeatureError("SHOULDER_SWITCH_RUNTIME_INSTALL", error);
        }
    }

    private static void installWriter(AugmentModule module, ClassLoader loader, String name, Class<?> args)
            throws ReflectiveOperationException {
        Class<?> task = Class.forName("cn.nubia.tgk.TgkService$" + name, false, loader);
        Method write = method(task, "doInBackground", args);
        module.registerFeatureHook(module.prepareFeatureHook(write, "shoulder.writer_guard." + name, true)
                .intercept(chain -> {
                    Object reference = TargetReflection.field(chain.getThisObject(), "tgkServiceWeakReference");
                    Object owner = reference instanceof WeakReference ? ((WeakReference<?>) reference).get() : null;
                    if (owner == null) return chain.proceed();
                    Session session = session(owner);
                    synchronized (session) {
                        Object result = chain.proceed();
                        // Preserve the old editor's content, but never replace the current selection/model.
                        if (session.committed != null && session.coordinator.current() == null && enabled(session)) {
                            try {
                                Object fresh = load(session.context, session.committed);
                                set(owner, "mTgkGameInfo", fresh);
                                if (name.equals("DismissViewAsyncTask")) set(chain.getThisObject(), "mTgkGameInfo", fresh);
                                HookTelemetry.shoulderSwitch("INFO", "stage=OLD_WRITER_RECONCILED status=SELECTED_MODEL_RETAINED"
                                        + " pkg=" + session.committed.gamePackage + " caseId=" + session.committed.caseId);
                                long generation = session.generation;
                                CaseRef committed = session.committed;
                                ShoulderSwitchCoordinator.Ticket committedTicket = session.committedTicket;
                                session.main.post(() -> reconcile(session, generation, committed, committedTicket));
                            } catch (Throwable error) {
                                HookTelemetry.shoulderSwitch("ERROR", "stage=OLD_WRITER_RECONCILED status=FAILED errorClass="
                                        + error.getClass().getSimpleName());
                            }
                        }
                        return result;
                    }
                }));
        module.deoptimize(write);
    }

    static CaseRef logicalCurrent(Object owner, CaseRef actual) {
        Session session = session(owner);
        synchronized (session) { return session.coordinator.logicalCurrent(actual); }
    }

    static boolean request(Object owner, CaseRef target, String route) throws Throwable {
        if (!ready) throw new IllegalStateException("switch_runtime_unavailable");
        Session session = session(owner);
        synchronized (session) {
            if (!enabled(session)) throw new IllegalStateException("switch_disabled");
            Object info = TargetReflection.field(owner, "mTgkGameInfo");
            CaseRef actual = selected(info);
            if (target.equals(actual) && session.coordinator.current() == null) return false;
            if (!sameOwner(owner, target)) throw new IllegalStateException("application_changed");
            ShoulderSwitchCoordinator.Ticket ticket = session.coordinator.begin(actual, target);
            session.generation++;
            trace("INFO", ticket, "REQUESTED", "route=" + route + " status=PERSISTING");
            queue(session);
            return true;
        }
    }

    private static void queue(Session session) {
        if (session.queued) return;
        session.queued = true;
        // The original UiAsyncTask/DismissViewAsyncTask use this same serial executor.
        // Previously submitted edits finish first; the new selection is the final state write.
        AsyncTask.SERIAL_EXECUTOR.execute(() -> persist(session));
    }

    private static void persist(Session session) {
        while (true) {
            ShoulderSwitchCoordinator.Ticket ticket;
            synchronized (session) {
                ticket = session.coordinator.current();
                if (ticket == null || ticket.phase != ShoulderSwitchCoordinator.Phase.PERSISTING) {
                    session.queued = false;
                    return;
                }
            }
            Object fresh = null;
            Throwable failure = null;
            boolean saved = false;
            String tag = session.tag(ticket);
            try {
                if (!live(session, ticket)) throw new IllegalStateException("request_cancelled");
                select(session.context, ticket.target, tag, null);
                saved = true;
                fresh = load(session.context, ticket.target);
                trace("INFO", ticket, "PERSISTED", "status=COMMITTED");
            } catch (Throwable error) { failure = error; }
            synchronized (session) {
                if (saved) session.persistedTicket = ticket;
                if (!session.coordinator.isLatest(ticket)) {
                    trace("WARN", ticket, "SUPERSEDED", "status=NOT_APPLIED");
                    if (session.coordinator.current() == null && saved) {
                        cancelSelection(session, ticket);
                        if (session.persistedTicket == ticket) session.persistedTicket = null;
                    } else if (!saved) release(session.context, ticket.target.gamePackage, tag);
                    continue;
                }
                session.coordinator.beginApply(ticket);
                session.queued = false;
                Object model = fresh;
                Throwable error = failure;
                boolean persisted = saved;
                session.main.post(() -> finish(session, ticket, model, error, persisted));
                return;
            }
        }
    }

    private static void finish(Session session, ShoulderSwitchCoordinator.Ticket ticket, Object model, Throwable error, boolean persisted) {
        synchronized (session) {
            if (!session.coordinator.isLatest(ticket)) return;
            try {
                if (error != null) throw error;
                if (!live(session, ticket)) throw new IllegalStateException("request_cancelled");
                applyVerified(session, model, ticket);
                Object owner = session.owner.get();
                Object view = TargetReflection.field(owner, "mTgkCaseShowView");
                if (view != null) TargetReflection.call(view, "setTgkCaseTvTitle",
                        TargetReflection.field(TargetReflection.call(model, "getSelectedCaseData"), "showName"));
                session.committed = ticket.target;
                session.committedTicket = ticket;
                session.leaseTag = session.tag(ticket);
                session.persistedTicket = null;
                session.coordinator.complete(ticket);
                trace("INFO", ticket, "COMPLETED", "status=DATABASE_AND_INPUT_CALLS_VERIFIED");
                FeatureSettings.diagnostic(session.context, "ls_augment_shoulder_quick_last_hit",
                        "committed|table=" + ticket.target.tableId + "|case=" + ticket.target.caseId
                                + "|sequence=" + ticket.sequence + "|input_calls_verified|" + System.currentTimeMillis());
                FeatureSettings.diagnostic(session.context, "ls_augment_shoulder_quick_error", "");
                resumeEditor(session);
            } catch (Throwable failure) {
                trace("ERROR", ticket, "FAILED", "status=ROLLBACK_PENDING errorClass=" + failure.getClass().getSimpleName()
                        + " reason=" + reason(failure));
                if (persisted) rollback(session, ticket, failure, session.tag(ticket));
                else if (session.persistedTicket != null)
                    rollback(session, ticket, failure, session.tag(session.persistedTicket));
                else {
                    session.coordinator.fail(ticket);
                    reportFailure(session, failure);
                    trace("ERROR", ticket, "PERSIST_FAILED", "status=PREVIOUS_RETAINED");
                    resumeEditor(session);
                }
            }
        }
    }

    private static void rollback(Session session, ShoulderSwitchCoordinator.Ticket ticket, Throwable cause,
            String expectedTag) {
        AsyncTask.SERIAL_EXECUTOR.execute(() -> {
            Object previous = null;
            Throwable restoreError = null;
            synchronized (session) {
                if (!session.coordinator.isLatest(ticket)) return;
                try {
                    select(session.context, ticket.previous, session.tag(ticket), expectedTag);
                    session.persistedTicket = ticket;
                    previous = load(session.context, ticket.previous);
                } catch (Throwable error) { restoreError = error; }
            }
            Object model = previous;
            Throwable error = restoreError;
            session.main.post(() -> {
                synchronized (session) {
                    if (!session.coordinator.isLatest(ticket)) return;
                    boolean restored = false;
                    try {
                        if (error != null) throw error;
                        if (!live(session, ticket)) {
                            cancel(session, "environment_changed");
                            return;
                        }
                        applyVerified(session, model, ticket);
                        Object view = TargetReflection.field(session.owner.get(), "mTgkCaseShowView");
                        if (view != null) TargetReflection.call(view, "setTgkCaseTvTitle",
                                TargetReflection.field(TargetReflection.call(model, "getSelectedCaseData"), "showName"));
                        trace("WARN", ticket, "ROLLED_BACK", "status=PREVIOUS_RESTORED");
                        session.committed = ticket.previous;
                        session.committedTicket = ticket;
                        session.leaseTag = session.tag(ticket);
                        restored = true;
                    } catch (Throwable failed) {
                        trace("ERROR", ticket, "ROLLBACK_FAILED", "status=UNKNOWN errorClass=" + failed.getClass().getSimpleName()
                                + " reason=" + reason(failed));
                    } finally {
                        session.coordinator.fail(ticket);
                        session.persistedTicket = null;
                        if (!restored) {
                            session.committed = null;
                            session.committedTicket = null;
                            session.leaseTag = null;
                            AsyncTask.SERIAL_EXECUTOR.execute(() -> release(session.context,
                                    ticket.target.gamePackage, session.tag(ticket)));
                        }
                        reportFailure(session, cause);
                        resumeEditor(session);
                    }
                }
            });
        });
    }

    private static void applyVerified(Session session, Object model, ShoulderSwitchCoordinator.Ticket ticket) throws Throwable {
        Object owner = session.owner.get();
        if (owner == null) throw new IllegalStateException("owner_stopped");
        Object data = TargetReflection.call(model, "getSelectedCaseData");
        int[] modes = (int[]) TargetReflection.field(data, "optionArray");
        boolean[] switches = (boolean[]) TargetReflection.field(data, "optionSwArray");
        boolean main = Boolean.TRUE.equals(TargetReflection.field(data, "mainSw"));
        boolean middle = Boolean.TRUE.equals(TargetReflection.field(helper, "IS_SUPPORT_MIDDLE_TGK"));
        int[] keys = {137, 138, 136};
        int count = middle ? 3 : 2;
        boolean macroEndpointChecked = false;
        if (main) for (int i = 0; i < count; i++) if (switches[i] && modes[i] == 4) {
            if (!macroEndpointChecked) {
                Bundle capabilities = session.context.getContentResolver().call(MACROS,
                        ShoulderMacroSwitchHook.CAPABILITIES_CALL, null, null);
                if (capabilities == null || !capabilities.getBoolean("ok", false)
                        || !capabilities.getBoolean("ready", false)
                        || capabilities.getInt("versionCode", -1) != BuildConfig.VERSION_CODE)
                    throw new IllegalStateException("macro_endpoint_unavailable");
                macroEndpointChecked = true;
                trace("INFO", ticket, "MACRO_ENDPOINT", "status=READY version=" + BuildConfig.VERSION_CODE);
            }
            String binding = (String) TargetReflection.call(helper, "getTgkLinkKey",
                    ((Number) TargetReflection.field(data, "ID")).longValue(),
                    ((Number) TargetReflection.field(data, "state")).intValue(), keys[i]);
            Bundle args = new Bundle();
            args.putString("packageName", (String) TargetReflection.field(data, "packageName"));
            args.putString("touch_key_name", binding);
            Bundle bound = session.context.getContentResolver().call(MACROS, "touch_key_call", "hasTouchLink", args);
            if (bound == null || !bound.getBoolean("hasTouchLink", false)
                    || bound.getString("hasTouchLinkName", "").trim().isEmpty())
                throw new IllegalStateException("macro_binding_missing:" + keys[i]);
            trace("INFO", ticket, "MACRO_BINDING", "status=TARGET_ID_VERIFIED keyCode=" + keys[i]);
        }
        TargetReflection.call(helper, "queryTgkLinkState", session.context.getContentResolver(),
                (String) TargetReflection.field(data, "packageName"),
                ((Number) TargetReflection.field(data, "ID")).longValue(),
                ((Number) TargetReflection.field(data, "state")).intValue());
        int orientation = session.context.getResources().getConfiguration().orientation == 2 ? 1 : 0;
        if (main) TargetReflection.call(helper, "updateValidRect", data, orientation);
        ShoulderNativeApply.Expected expected = ShoulderNativeApply.expected(data, middle);
        trace("INFO", ticket, "APPLYING", "expectedHash=" + expected.hash());
        Object proxy = TargetReflection.field(owner, "mInputManagerProxy");
        try (ShoulderNativeApply.Attempt attempt = ShoulderNativeApply.begin(expected, ticket.sequence)) {
            TargetReflection.call(proxy, "releaseTgk");
            TargetReflection.call(helper, "setTgkParaToNative", proxy, data, model, orientation);
            attempt.verify();
        }
        set(owner, "mTgkGameInfo", model);
    }

    private static void reconcile(Session session, long generation, CaseRef committed,
            ShoulderSwitchCoordinator.Ticket ticket) {
        synchronized (session) {
            if (ticket == null || generation != session.generation || !committed.equals(session.committed)
                    || session.coordinator.current() != null || !enabled(session)) return;
            try {
                Object owner = session.owner.get();
                if (owner == null || !sameOwner(owner, committed)) return;
                Object fresh = load(session.context, committed);
                applyVerified(session, fresh, ticket);
                Object view = TargetReflection.field(owner, "mTgkCaseShowView");
                if (view != null) TargetReflection.call(view, "setTgkCaseTvTitle",
                        TargetReflection.field(TargetReflection.call(fresh, "getSelectedCaseData"), "showName"));
                trace("INFO", ticket, "OLD_WRITER_REAPPLIED", "status=DATABASE_AND_INPUT_CALLS_VERIFIED");
            } catch (Throwable error) {
                trace("ERROR", ticket, "OLD_WRITER_REAPPLIED", "status=FAILED errorClass="
                        + error.getClass().getSimpleName());
                FeatureSettings.diagnostic(session.context, "ls_augment_shoulder_quick_error",
                        "reconcile_failed|" + error.getClass().getSimpleName());
            }
        }
    }

    private static Object load(Context context, CaseRef target) throws Throwable {
        Object model = TargetReflection.call(helper, "getGameInfoForEnableTgk", context, target.gamePackage);
        if (!target.equals(selected(model))) throw new IllegalStateException("persisted_selection_mismatch");
        return model;
    }

    private static void select(Context context, CaseRef target, String tag, String expectedTag) {
        Bundle args = new Bundle();
        args.putString("gamePackage", target.gamePackage);
        args.putInt("tableId", target.tableId);
        args.putLong("caseId", target.caseId);
        args.putString("leaseTag", tag);
        if (expectedTag != null) args.putString("expectedLeaseTag", expectedTag);
        Bundle result = context.getContentResolver().call(ShoulderSelectionStore.URI, ShoulderSelectionStore.CALL, null, args);
        if (result == null || !result.getBoolean("ok", false) || result.getInt("tableId", -1) != target.tableId
                || result.getLong("caseId", -1L) != target.caseId)
            throw new IllegalStateException("selection_store_failed:" + (result == null ? "unavailable" : result.getString("error")));
    }

    private static void cancelSelection(Session session, ShoulderSwitchCoordinator.Ticket ticket) {
        try {
            Bundle args = new Bundle();
            args.putString("gamePackage", ticket.target.gamePackage);
            args.putString("leaseTag", session.tag(ticket));
            args.putInt("rollbackTableId", ticket.previous.tableId);
            args.putLong("rollbackCaseId", ticket.previous.caseId);
            Bundle result = session.context.getContentResolver().call(ShoulderSelectionStore.URI,
                    ShoulderSelectionStore.RELEASE_CALL, null, args);
            trace(result != null && result.getBoolean("ok", false) ? "INFO" : "ERROR", ticket,
                    "CANCEL_RESTORE", "status=" + (result != null && result.getBoolean("ok", false)
                            ? "RESTORED_OR_SUPERSEDED" : "FAILED"));
        } catch (Throwable error) {
            trace("ERROR", ticket, "CANCEL_RESTORE", "status=FAILED errorClass=" + error.getClass().getSimpleName());
        }
    }

    private static void release(Context context, String pkg, String tag) {
        if (tag == null) return;
        try {
            Bundle args = new Bundle();
            args.putString("gamePackage", pkg);
            args.putString("leaseTag", tag);
            context.getContentResolver().call(ShoulderSelectionStore.URI, ShoulderSelectionStore.RELEASE_CALL, null, args);
        } catch (Throwable error) {
            HookTelemetry.shoulderSwitch("ERROR", "stage=LEASE_RELEASE status=FAILED errorClass=" + error.getClass().getSimpleName());
        }
    }

    private static boolean live(Session session, ShoulderSwitchCoordinator.Ticket ticket) throws ReflectiveOperationException {
        return session.coordinator.isLatest(ticket) && enabled(session)
                && session.owner.get() != null && sameOwner(session.owner.get(), ticket.target);
    }

    private static boolean enabled(Session session) {
        return FeatureSettings.enabled(session.context, GameOptions.QUICK_SWITCH, false)
                && FeatureSettings.enabled(session.context, FeatureSettings.GAME_MASTER);
    }

    private static boolean sameOwner(Object owner, CaseRef target) throws ReflectiveOperationException {
        Object pkg = TargetReflection.field(owner, "mPackageName");
        return pkg == null || target.gamePackage.equals(pkg);
    }

    private static CaseRef selected(Object model) throws ReflectiveOperationException {
        Object data = TargetReflection.call(model, "getSelectedCaseData");
        if (data == null) throw new IllegalStateException("no_selected_scheme");
        return new CaseRef(Process.myUid() / 100000, (String) TargetReflection.field(data, "packageName"),
                ((Number) TargetReflection.field(model, "selectedTableId")).intValue(),
                ((Number) TargetReflection.field(data, "ID")).longValue());
    }

    private static Session session(Object owner) {
        synchronized (SESSIONS) {
            Session value = SESSIONS.get(owner);
            if (value == null) {
                value = new Session(owner, FeatureSettings.from(owner));
                SESSIONS.put(owner, value);
                if (!watching && value.context != null) {
                    watching = true;
                    FeatureSettings.addSnapshotListener(value.context, () -> {
                        List<Session> sessions;
                        synchronized (SESSIONS) { sessions = new ArrayList<>(SESSIONS.values()); }
                        for (Session entry : sessions) synchronized (entry) {
                            if (!enabled(entry)) cancel(entry, "configuration_disabled");
                        }
                    });
                }
            }
            return value;
        }
    }

    private static void cancelPackage(String pkg, String reason) {
        List<Session> sessions;
        synchronized (SESSIONS) { sessions = new ArrayList<>(SESSIONS.values()); }
        for (Session session : sessions) synchronized (session) {
            CaseRef target = session.committed;
            ShoulderSwitchCoordinator.Ticket ticket = session.coordinator.current();
            if (ticket != null) target = ticket.target;
            if (target != null && target.gamePackage.equals(pkg)) cancel(session, reason);
        }
    }

    private static boolean hasPending(String pkg) {
        List<Session> sessions;
        synchronized (SESSIONS) { sessions = new ArrayList<>(SESSIONS.values()); }
        for (Session session : sessions) synchronized (session) {
            ShoulderSwitchCoordinator.Ticket ticket = session.coordinator.current();
            if (ticket != null && ticket.target.gamePackage.equals(pkg)) return true;
        }
        return false;
    }

    private static void resumeEditor(Session session) {
        if (session.editorMessage == null) return;
        Message message = session.editorMessage;
        Handler handler = session.editorHandler == null ? null : session.editorHandler.get();
        session.editorMessage = null;
        session.editorHandler = null;
        if (handler != null && enabled(session)) handler.sendMessage(message);
        else message.recycle();
    }

    private static void cancel(Session session, String reason) {
        ShoulderSwitchCoordinator.Ticket ticket = session.coordinator.current();
        ShoulderSwitchCoordinator.Ticket persisted = session.persistedTicket;
        CaseRef committed = session.committed;
        String committedTag = session.leaseTag;
        session.coordinator.cancel();
        session.committed = null;
        session.committedTicket = null;
        session.leaseTag = null;
        session.persistedTicket = null;
        if (session.editorMessage != null) session.editorMessage.recycle();
        session.editorMessage = null;
        session.editorHandler = null;
        session.generation++;
        if (ticket != null) {
            trace("WARN", ticket, "CANCELLED", "reason=" + reason);
        }
        // Provider calls may wait for a transaction; never wait for them on the UI thread.
        AsyncTask.SERIAL_EXECUTOR.execute(() -> {
            if (persisted != null) cancelSelection(session, persisted);
            if (ticket != null && ticket != persisted) cancelSelection(session, ticket);
            if (committed != null) release(session.context, committed.gamePackage, committedTag);
        });
    }

    private static void reportFailure(Session session, Throwable cause) {
        FeatureSettings.diagnostic(session.context, "ls_augment_shoulder_quick_error",
                "switch_failed|" + cause.getClass().getSimpleName() + "|" + System.currentTimeMillis());
        Toast.makeText(session.context, "方案未生效，请重新打开肩键面板", Toast.LENGTH_SHORT).show();
    }

    private static String reason(Throwable error) {
        String value = error.getMessage();
        if (value != null && value.matches("(?:input_failed|input_missing_or_mismatched|selection_store_failed|macro_binding_missing):[A-Za-z0-9_:]{1,96}"))
            return value;
        return "operation_failed";
    }

    private static void trace(String level, ShoulderSwitchCoordinator.Ticket ticket, String stage, String detail) {
        HookTelemetry.shoulderSwitch(level, "tx=" + ticket.sequence + " stage=" + stage
                + " pkg=" + ticket.target.gamePackage + " table=" + ticket.target.tableId
                + " caseId=" + ticket.target.caseId + " previousCaseId=" + ticket.previous.caseId + " " + detail);
    }

    private static Method method(Class<?> owner, String name, Class<?>... types) throws NoSuchMethodException {
        Method method = owner.getDeclaredMethod(name, types);
        method.setAccessible(true);
        return method;
    }

    private static void set(Object owner, String name, Object value) throws ReflectiveOperationException {
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                java.lang.reflect.Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                field.set(owner, value);
                return;
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }

    private static final class Session {
        final WeakReference<Object> owner;
        final Context context;
        final Handler main = new Handler(Looper.getMainLooper());
        final ShoulderSwitchCoordinator coordinator = new ShoulderSwitchCoordinator();
        final long id = OWNERS.incrementAndGet();
        boolean queued;
        long generation;
        CaseRef committed;
        ShoulderSwitchCoordinator.Ticket committedTicket;
        String leaseTag;
        ShoulderSwitchCoordinator.Ticket persistedTicket;
        Message editorMessage;
        WeakReference<Handler> editorHandler;
        Session(Object owner, Context context) {
            this.owner = new WeakReference<>(owner);
            this.context = context == null ? null : context.getApplicationContext();
        }
        String tag(ShoulderSwitchCoordinator.Ticket ticket) { return Process.myPid() + ":" + id + ":" + ticket.sequence; }
    }

    private ShoulderQuickSwitchRuntime() { }
}
