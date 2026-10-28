package ls.augment.com.hook;

import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.os.Handler;
import android.os.Looper;
import dalvik.system.DexClassLoader;
import io.github.libxposed.api.XposedInterface.HookHandle;
import java.io.File;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Predicate;

/** Promotes native child entries before rendering; never cancels or reposts notifications. */
final class NotificationIndependentHook {
    private static final String BASE = "com.android.systemui.statusbar.notification.collection.";
    private static final String BRIDGE = "ls.augment.com.IndependentNotificationPromoter";
    private final AugmentModule module;
    private final Access access;
    private final Constructor<?> bridge;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Map<Object, WeakReference<Session>> sessions = new WeakHashMap<>();
    private Context context;
    private Object controller;
    private Method getState, isDozing;
    private boolean listening, failed, refreshPosted;
    private Session current;
    private Object bundling;

    private NotificationIndependentHook(AugmentModule module, ClassLoader loader)
            throws ReflectiveOperationException {
        this.module = module;
        access = new Access(loader);
        bridge = loadBridge(module, loader, access.promoter, access.entry);
    }

    static int install(AugmentModule module, ClassLoader loader) {
        ArrayList<HookHandle> handles = new ArrayList<>();
        try {
            NotificationIndependentHook hook = new NotificationIndependentHook(module, loader);
            hook.install(handles);
            for (HookHandle handle : handles) module.registerFeatureHook(handle);
            module.logFeatureInfo("NOTIFICATION_INDEPENDENT_READY route="
                    + (hook.access.bundle == null ? "groups" : "groups_and_bundles"));
            return handles.size();
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            for (HookHandle handle : handles) try { handle.unhook(); } catch (RuntimeException ignored) { }
            module.logFeatureError("NOTIFICATION_INDEPENDENT_UNAVAILABLE", error);
            return 0;
        }
    }

    private void install(List<HookHandle> handles) {
        handles.add(module.prepareFeatureHook(access.build, "notification.independent.build", false).intercept(chain -> {
            Session session = null;
            if (!failed) try {
                if (connect(chain.getThisObject())) session = session(chain.getThisObject());
            } catch (ReflectiveOperationException | RuntimeException | LinkageError error) { fail(error); }
            Session previous = current;
            current = session;
            if (session != null) {
                session.active = enabled();
                session.lastMode = session.active;
                session.promoted = 0;
                session.bypassedBundles = 0;
            }
            try { return chain.proceed(); }
            finally {
                if (session != null) {
                    session.active = false;
                    try { report(session); }
                    catch (RuntimeException error) { module.logFeatureError("NOTIFICATION_INDEPENDENT_REPORT", error); }
                }
                current = previous;
            }
        }));
        if (access.bundle != null) {
            // The newer native pipeline already handles an unresolved bundle by
            // retaining its entries at top level. Keep its bookkeeping intact.
            handles.add(module.prepareFeatureHook(access.bundle, "notification.independent.bundle_scope", false).intercept(chain -> {
                Object previous = bundling;
                bundling = current != null && current.active ? chain.getThisObject() : null;
                try { return chain.proceed(); } finally { bundling = previous; }
            }));
            handles.add(module.prepareFeatureHook(access.bundleEntry, "notification.independent.bundle_entry", false).intercept(chain -> {
                if (!failed && current != null && current.active && bundling == chain.getThisObject()
                        && current.builder.get() == chain.getThisObject()) {
                    current.bypassedBundles++;
                    return null;
                }
                return chain.proceed();
            }));
        }
        for (Method method : access.callers) module.deoptimize(method);
    }

    private boolean connect(Object builder) throws ReflectiveOperationException {
        if (listening) return true;
        Context found = FeatureSettings.from(builder);
        if (found == null) return false;
        context = found.getApplicationContext();
        if (context == null) context = found;
        controller = access.dependencyGet.invoke(null, access.stateType);
        if (controller == null || !access.stateType.isInstance(controller))
            throw new IllegalStateException("Missing status bar state controller");
        getState = method(controller.getClass(), "getState", int.class);
        isDozing = method(controller.getClass(), "isDozing", boolean.class);
        Method addCallback = method(controller.getClass(), "addCallback", void.class, access.listenerType);
        Method removeCallback = method(controller.getClass(), "removeCallback", void.class, access.listenerType);
        Object listener = Proxy.newProxyInstance(access.listenerType.getClassLoader(), new Class<?>[]{access.listenerType},
                (proxy, callback, args) -> {
                    if (callback.getDeclaringClass() == Object.class) {
                        if (callback.getName().equals("equals")) return proxy == args[0];
                        if (callback.getName().equals("hashCode")) return System.identityHashCode(proxy);
                        return "RedMagicDuoIndependentNotifications";
                    }
                    if (callback.getName().equals("onStateChanged") || callback.getName().equals("onDozingChanged")) refresh();
                    return null;
                });
        ComponentCallbacks configuration = new ComponentCallbacks() {
            @Override public void onConfigurationChanged(Configuration config) { refresh(); }
            @Override public void onLowMemory() { }
        };
        addCallback.invoke(controller, listener);
        try {
            context.registerComponentCallbacks(configuration);
            if (!FeatureSettings.addSnapshotListener(context, this::refresh))
                throw new IllegalStateException("Missing configuration snapshot listener");
            listening = true;
        } catch (RuntimeException error) {
            context.unregisterComponentCallbacks(configuration);
            removeCallback.invoke(controller, listener);
            throw error;
        }
        return true;
    }

    private Session session(Object builder) throws ReflectiveOperationException {
        WeakReference<Session> ref = sessions.get(builder);
        Session session = ref == null ? null : ref.get();
        if (session != null) return session;
        session = new Session(builder);
        // buildList is still idle here. Native addPromoter installs the native
        // invalidation listener and promotion provenance used by summary pruning.
        access.add.invoke(builder, session.promoter);
        sessions.put(builder, new WeakReference<>(session));
        return session;
    }

    private final class Session {
        final WeakReference<Object> builder;
        final Object promoter;
        boolean active, lastMode;
        int promoted, bypassedBundles;
        String lastReport;
        Session(Object builder) throws ReflectiveOperationException {
            this.builder = new WeakReference<>(builder);
            promoter = bridge.newInstance((Predicate<Object>) this::promote);
        }
        boolean promote(Object entry) {
            if (failed || !active || current != this || !access.entry.isInstance(entry)) return false;
            try {
                Object parent = access.parent.invoke(entry);
                if (!access.group.isInstance(parent) || access.summary.invoke(parent) == entry) return false;
                Object children = access.children.invoke(parent);
                if (!(children instanceof List) || !((List<?>) children).contains(entry)) return false;
                promoted++;
                return true;
            } catch (ReflectiveOperationException | RuntimeException error) { fail(error); return false; }
        }
    }

    private boolean enabled() {
        if (failed || !listening) return false;
        try {
            int state = (Integer) getState.invoke(controller);
            return state >= 0 && state <= 2 && !(Boolean) isDozing.invoke(controller)
                    // AmbientState.isOnKeyguard also selects only KEYGUARD (1);
                    // SHADE_LOCKED (2) uses the shade surface's projection rules.
                    && NotificationStackGate.enabled(context, state == 1);
        } catch (ReflectiveOperationException | RuntimeException error) { fail(error); return false; }
    }

    private void refresh() {
        // Always leave native state/configuration callbacks before invalidating.
        if (refreshPosted) return;
        refreshPosted = true;
        main.post(() -> {
            refreshPosted = false;
            boolean mode = enabled();
            for (WeakReference<Session> ref : new ArrayList<>(sessions.values())) {
                Session session = ref.get();
                if (session == null || session.lastMode == mode) continue;
                try { access.invalidate.invoke(session.promoter, "Duo notification stack mode"); }
                catch (ReflectiveOperationException | RuntimeException error) { fail(error); }
            }
        });
    }

    private void fail(Throwable error) {
        if (failed) return;
        failed = true;
        module.logFeatureError("NOTIFICATION_INDEPENDENT_DISABLED", error);
        refresh();
    }

    private void report(Session session) {
        String value = "mode=" + (failed ? "unavailable" : session.lastMode ? "independent" : "native")
                + ";promoted=" + session.promoted + ";bundles=" + session.bypassedBundles;
        if (!value.equals(session.lastReport)) {
            session.lastReport = value;
            FeatureSettings.diagnostic(context, "ls_augment_notification_independent_runtime", value);
        }
    }

    private static Constructor<?> loadBridge(AugmentModule module, ClassLoader loader,
            Class<?> promoter, Class<?> entry) throws ReflectiveOperationException {
        ApplicationInfo info = module.getModuleApplicationInfo();
        if (info == null || !"ls.augment.com".equals(info.packageName) || info.sourceDir == null)
            throw new IllegalStateException("Missing module source");
        File source = new File(info.sourceDir);
        if (!source.isAbsolute() || !source.isFile() || !source.canRead())
            throw new IllegalStateException("Unreadable module source");
        ClassLoader bridgeLoader = new DexClassLoader(source.getAbsolutePath(), null, null, loader);
        Class<?> type = Class.forName(BRIDGE, false, bridgeLoader);
        if (type.getClassLoader() != bridgeLoader || type.getSuperclass() != promoter)
            throw new IllegalStateException("Notification promoter loader mismatch");
        Method callback = type.getDeclaredMethod("shouldPromoteToTopLevel", entry);
        if (callback.getReturnType() != boolean.class || Modifier.isStatic(callback.getModifiers()))
            throw new NoSuchMethodException("Notification promoter callback");
        return type.getConstructor(Predicate.class);
    }

    private static Method method(Class<?> type, String name, Class<?> result, Class<?>... args)
            throws NoSuchMethodException {
        return HookCompatibility.inheritedMethod(type, result, false, new String[]{name}, args);
    }

    private static final class Access {
        final Class<?> promoter, entry, group, stateType, listenerType;
        final Method build, add, invalidate, parent, summary, children, dependencyGet, bundle, bundleEntry;
        final List<Method> callers = new ArrayList<>();
        Access(ClassLoader loader) throws ReflectiveOperationException {
            Class<?> builder = Class.forName(BASE + "ShadeListBuilder", false, loader);
            entry = Class.forName(BASE + "NotificationEntry", false, loader);
            group = Class.forName(BASE + "GroupEntry", false, loader);
            promoter = Class.forName(BASE + "listbuilder.pluggable.NotifPromoter", false, loader);
            promoter.getConstructor(String.class);
            Method callback = promoter.getMethod("shouldPromoteToTopLevel", entry);
            if (callback.getReturnType() != boolean.class || !Modifier.isAbstract(callback.getModifiers()))
                throw new NoSuchMethodException("NotifPromoter callback shape");
            build = method(builder, "buildList", void.class);
            add = method(builder, "addPromoter", void.class, promoter);
            invalidate = method(promoter, "invalidateList", void.class, String.class);
            parent = HookCompatibility.inheritedMethod(entry, Object.class, true, new String[]{"getParent"});
            if (!parent.getReturnType().isAssignableFrom(group) || parent.getReturnType() == Object.class)
                throw new NoSuchMethodException("Unsupported notification parent");
            summary = method(group, "getSummary", entry);
            children = method(group, "getChildren", List.class);
            callers.add(build);
            callers.add(method(builder, "promoteNotifs", void.class, List.class));
            callers.add(method(builder, "applyTopLevelPromoters", boolean.class, entry));
            callers.add(method(builder, "findPromoter", promoter, entry));
            callers.add(method(builder, "pruneIncompleteGroups", void.class, List.class));
            callers.add(method(builder, "addGroupsWithChildrenLostToPromotion", void.class, List.class, Set.class));
            Method bundleMethod = null, lookup = null;
            try { bundleMethod = method(builder, "bundleNotifs", void.class, List.class, List.class); }
            catch (NoSuchMethodException legacy) {
                // Reject an unrecognized bundling signature rather than treating it as legacy.
                for (Class<?> at = builder; at != null; at = at.getSuperclass())
                    for (Method candidate : at.getDeclaredMethods())
                        if (candidate.getName().equals("bundleNotifs") || candidate.getName().equals("getBundleEntry")) throw legacy;
            }
            if (bundleMethod != null) {
                Class<?> bundleType = Class.forName(BASE + "BundleEntry", false, loader);
                lookup = method(builder, "getBundleEntry", bundleType, String.class);
                method(bundleType, "getChildren", List.class);
                callers.add(bundleMethod);
                callers.add(lookup);
            }
            bundle = bundleMethod;
            bundleEntry = lookup;
            stateType = Class.forName("com.android.systemui.plugins.statusbar.StatusBarStateController", false, loader);
            listenerType = Class.forName(stateType.getName() + "$StateListener", false, loader);
            if (!listenerType.isInterface()) throw new NoSuchMethodException("StatusBarState listener");
            Class<?> dependency = Class.forName("com.android.systemui.Dependency", false, loader);
            dependencyGet = HookCompatibility.method(dependency, Object.class, true, new String[]{"get"}, Class.class);
        }
    }
}
