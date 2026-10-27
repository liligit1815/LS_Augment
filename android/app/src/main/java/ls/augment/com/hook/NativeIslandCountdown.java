package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.UserManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;
import java.util.function.IntSupplier;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Reconciles the OEM timer's existing provider and scene; never starts/cancels a timer itself. */
final class NativeIslandCountdown implements AutoCloseable {
    private static final String PACKAGE = "zte.com.cn.alarmclock";
    private static final String SERVICE = "zte.com.cn.timer.CountdownNotificationService";
    private final Object manager, permanent, island;
    private final Handler handler;
    private final Uri statusUri, countUri;
    private final BooleanSupplier enabled;
    private final IntSupplier currentUser;
    private final Consumer<String> diagnostic;
    private final Runnable changed;
    private final Method updatePanel, updateCount, exists, add, remove;
    private final Field userContext, sceneUser, foreground;
    private final ContentObserver observer;
    private final Runnable refresh = this::sync;
    private Context observingContext;
    private boolean closed;

    NativeIslandCountdown(Object manager, Object permanent, Object island, Class<?> provider,
            Handler handler, BooleanSupplier enabled, IntSupplier currentUser, Consumer<String> diagnostic, Runnable changed) throws Exception {
        this.manager = manager; this.permanent = permanent; this.island = island; this.handler = handler;
        this.enabled = enabled; this.currentUser = currentUser; this.diagnostic = diagnostic; this.changed = changed;
        if (island == null) throw new IllegalStateException("countdown_scene_missing");
        Class<?> type = island.getClass();
        userContext = requireField(type, "mCurrentUserContext", Context.class);
        sceneUser = requireField(type, "mCurrentUser", int.class);
        foreground = requireField(manager.getClass(), "mPkgName", String.class);
        updatePanel = requireMethod(type, "updatePanelStatus", void.class, int.class);
        updateCount = requireMethod(type, "updateCountDownTimeCount", void.class);
        exists = requireMethod(permanent.getClass(), "isIslandExist", boolean.class, type);
        add = requireMethod(permanent.getClass(), "addPermanentIslandInner", void.class, type);
        remove = requireMethod(permanent.getClass(), "removePermanentIsland", void.class, type);
        statusUri = uri(provider, "COUNT_DOWN_VISIBLE_URI", "count_down_visible_status");
        countUri = uri(provider, "COUNT_DOWN_VALUE_URI", "count_down_value_status");
        requireService(context());
        observer = new ContentObserver(handler) {
            @Override public void onChange(boolean selfChange) { request(); }
        };
    }

    static void requireService(Context context) throws Exception {
        UserManager users = context.getSystemService(UserManager.class);
        if (users == null || !users.isUserUnlocked()) throw new IllegalStateException("countdown_waiting_user_unlock");
        ServiceInfo info = context.getPackageManager().getServiceInfo(new ComponentName(PACKAGE, SERVICE), 0);
        if (!info.enabled || !info.exported || !PACKAGE.equals(info.packageName) || !SERVICE.equals(info.name)
                || info.applicationInfo == null || !info.applicationInfo.enabled)
            throw new IllegalStateException("countdown_service_unavailable");
        if (info.permission != null && !info.permission.isEmpty()
                && context.checkSelfPermission(info.permission) != PackageManager.PERMISSION_GRANTED)
            throw new IllegalStateException("countdown_service_permission");
    }

    void request() {
        if (!closed) { handler.removeCallbacks(refresh); handler.post(refresh); }
    }

    /** Detach both registrations before rebinding, including after a user switch. */
    void suspend() {
        handler.removeCallbacks(refresh);
        if (observingContext != null) {
            try { observingContext.getContentResolver().unregisterContentObserver(observer); }
            catch (RuntimeException failure) { diagnostic.accept("countdown_unobserve_failed:" + failure.getClass().getSimpleName()); }
            observingContext = null;
        }
    }

    private void sync() {
        if (closed || !enabled.getAsBoolean()) { suspend(); return; }
        try {
            Context context = context();
            int owner = sceneUser.getInt(island), active = currentUser.getAsInt();
            Method contextUser = requireMethod(context.getClass(), "getUserId", int.class);
            if (owner < 0 || owner != active || !Integer.valueOf(owner).equals(contextUser.invoke(context))) {
                suspend(); diagnostic.accept("countdown_waiting_current_user"); return;
            }
            if (context != observingContext) {
                suspend();
                requireService(context);
                try {
                    context.getContentResolver().registerContentObserver(statusUri, false, observer);
                    context.getContentResolver().registerContentObserver(countUri, false, observer);
                    observingContext = context;
                    // The provider belongs to SystemUI and loses its values when this process
                    // restarts. Ask the running clock to publish its real model, including pause.
                    // A package-scoped broadcast never starts or resumes a timer service.
                    try {
                        if (context.checkSelfPermission(NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION) == PackageManager.PERMISSION_GRANTED)
                            context.sendBroadcast(new Intent(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION).setPackage(PACKAGE));
                        else diagnostic.accept("countdown_source_sync_permission_missing");
                    } catch (RuntimeException missing) { diagnostic.accept("countdown_source_sync_failed:" + missing.getClass().getSimpleName()); }
                } catch (RuntimeException failure) {
                    context.getContentResolver().unregisterContentObserver(observer);
                    throw failure;
                }
            }
            int state = NativeIslandScenePolicy.countdownState(read(context, statusUri, "count_down_visible_status"));
            if (state < 0) { diagnostic.accept("countdown_status_unavailable"); return; }
            String top = (String) foreground.get(manager);
            boolean present = Boolean.TRUE.equals(exists.invoke(permanent, island));
            if (state == 0) {
                updatePanel.invoke(island, state);
                if (present || field(permanent, "mTempIsland") == island) remove.invoke(permanent, island);
            } else {
                // Do not reconstruct a countdown from text, notification timestamps or a cached duration.
                String duration = read(context, countUri, "count_down_value_status");
                if (duration == null || duration.isEmpty() || "0".equals(duration)) {
                    diagnostic.accept("countdown_duration_unavailable"); return;
                }
                updatePanel.invoke(island, state);
                updateCount.invoke(island);
                if (NativeIslandScenePolicy.countdownVisible(state, top, owner, active)) {
                    if (!present && field(permanent, "mTempIsland") != island) add.invoke(permanent, island);
                } else if (PACKAGE.equals(top) && (present || field(permanent, "mTempIsland") == island)) {
                    remove.invoke(permanent, island);
                }
            }
            diagnostic.accept("countdown_synced;state=" + state);
            changed.run();
        } catch (Exception failure) {
            diagnostic.accept("countdown_sync_failed:" + failure.getClass().getSimpleName());
        }
    }

    private Context context() throws Exception {
        Object value = userContext.get(island);
        if (!(value instanceof Context)) throw new IllegalStateException("countdown_user_context_missing");
        return (Context) value;
    }

    private static String read(Context context, Uri uri, String name) {
        try (Cursor cursor = context.getContentResolver().query(uri, null, null, null, null)) {
            if (cursor == null || !cursor.moveToFirst()) return null;
            int column = cursor.getColumnIndex(name);
            return column < 0 || cursor.isNull(column) ? null : cursor.getString(column);
        }
    }

    private static Uri uri(Class<?> provider, String name, String path) throws Exception {
        Field field = requireField(provider, name, Uri.class);
        if (!java.lang.reflect.Modifier.isStatic(field.getModifiers())) throw new IllegalStateException("countdown_uri_not_static:" + name);
        Object value = field.get(null);
        if (!(value instanceof Uri) || !("content://com.android.systemui.zte/" + path).equals(value.toString()))
            throw new IllegalStateException("countdown_uri_contract:" + name);
        return (Uri) value;
    }

    private static Field requireField(Class<?> type, String name, Class<?> value) {
        Field field = NativeIslandSceneContract.field(type, name, value);
        if (field == null) throw new IllegalStateException("countdown_field_missing:" + name);
        return field;
    }

    private static Method requireMethod(Class<?> type, String name, Class<?> result, Class<?>... args) {
        Method method = NativeIslandSceneContract.method(type, name, result, args);
        if (method == null) throw new IllegalStateException("countdown_method_missing:" + name);
        return method;
    }

    @Override public void close() { closed = true; suspend(); }
}
