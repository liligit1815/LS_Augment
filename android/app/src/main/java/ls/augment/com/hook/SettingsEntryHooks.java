package ls.augment.com.hook;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import ls.augment.com.HideTargetCodec;

/** Source observations for the checked OEM Settings profile. No identity IPC runs here. */
final class SettingsEntryHooks {
    private final Profile profile;
    private final SettingsEntryBindings bindings;
    private final ThreadLocal<Scope> scope = new ThreadLocal<>();
    private final ArrayList<AdapterRef> adapters = new ArrayList<>();
    private final ArrayList<AdapterRef> pendingRebuilds = new ArrayList<>();
    private final Handler main = new Handler(Looper.getMainLooper());
    // Guarded by adapters; no registry monitor is held while entering an OEM monitor.
    private boolean rebuildPending;
    private volatile boolean installed;

    private SettingsEntryHooks(Profile profile) {
        this.profile = profile;
        bindings = FeatureSettings.entryBindings();
    }

    static SettingsEntryHooks install(AugmentModule module, ClassLoader loader) {
        SettingsEntryHooks hooks = null;
        try {
            // Resolve the whole supported shape before installing any interception.
            hooks = new SettingsEntryHooks(new Profile(loader));
            hooks.installHooks(module);
            FeatureSettings.addHiddenTargetsListener(hooks::queueRebuild);
            hooks.installed = true;
            module.logFeatureInfo("SETTINGS_ENTRY_SOURCES_INSTALLED");
            return hooks;
        } catch (Throwable error) {
            // Partially installed callbacks remain transparent and issue no certificates.
            if (hooks != null) hooks.installed = false;
            module.logFeatureError("SETTINGS_ENTRY_SOURCES_UNAVAILABLE", error);
            return null;
        }
    }

    private void installHooks(AugmentModule module) {
        module.registerFeatureHook(module.prepareFeatureHook(profile.resume,
                "settings.entries.resume", true).intercept(chain -> runScoped(
                chain.getThisObject(), true, -1, null, chain::proceed)));
        module.registerFeatureHook(module.prepareFeatureHook(profile.addPackage,
                "settings.entries.add_package", true).intercept(chain -> runScoped(
                chain.getThisObject(), false, (Integer) chain.getArg(1),
                (String) chain.getArg(0), chain::proceed)));
        module.registerFeatureHook(module.prepareFeatureHook(profile.pause,
                "settings.entries.pause", true).intercept(chain -> {
                    Object owner = chain.getThisObject();
                    Object lock = ownerLock(owner);
                    if (!installed || lock == null) return chain.proceed();
                    synchronized (lock) {
                        invalidate(owner);
                        return chain.proceed();
                    }
                }));
        module.registerFeatureHook(module.prepareFeatureHook(profile.removeUser,
                "settings.entries.remove_user", true).intercept(chain -> {
                    Object lock = ownerLock(chain.getThisObject());
                    if (!installed || lock == null) return chain.proceed();
                    synchronized (lock) {
                        try {
                            bindings.retireUser((Integer) chain.getArg(0));
                            queueRebuild();
                        } catch (Throwable ignored) {
                            invalidate(chain.getThisObject());
                        }
                        return chain.proceed();
                    }
                }));
        module.registerFeatureHook(module.prepareFeatureHook(profile.getProfiles,
                "settings.entries.profiles", false).intercept(chain -> {
                    Scope current = userScope(chain.getThisObject());
                    if (current != null && current.full) current.observations.clear();
                    Object original = chain.proceed();
                    if (current != null && current.full) readProfiles(current, original);
                    return original;
                }));
        module.registerFeatureHook(module.prepareFeatureHook(profile.isUserAdmin,
                "settings.entries.admin_scope", true).intercept(chain -> {
                    Scope current = userScope(chain.getThisObject());
                    boolean relevant = current != null && !current.full
                            && current.userId == (Integer) chain.getArg(0);
                    if (!relevant) return chain.proceed();
                    boolean previous = current.readingAdmin;
                    current.readingAdmin = true;
                    current.observations.clear();
                    try {
                        return chain.proceed();
                    } finally {
                        current.readingAdmin = previous;
                    }
                }));
        module.registerFeatureHook(module.prepareFeatureHook(profile.getUserInfo,
                "settings.entries.user_info", false).intercept(chain -> {
                    Scope current = userScope(chain.getThisObject());
                    Object original = chain.proceed();
                    if (current != null && !current.full && current.readingAdmin
                            && current.userId == (Integer) chain.getArg(0)) {
                        readSingleProfile(current, original);
                    }
                    return original;
                }));
        module.registerFeatureHook(module.prepareFeatureHook(profile.listApplications,
                "settings.entries.original_list", false).intercept(chain -> {
                    Scope current = installed ? scope.get() : null;
                    Object original = chain.proceed();
                    captureList(current != null && current.full ? current : null,
                            (Integer) chain.getArg(1), original);
                    return original;
                }));
        module.registerFeatureHook(module.prepareFeatureHook(profile.applicationInfo,
                "settings.entries.original_info", false).intercept(chain -> {
                    Scope current = installed ? scope.get() : null;
                    boolean relevant = false;
                    try {
                        relevant = current != null && !current.full && !current.readingAdmin
                                && current.userId == (Integer) chain.getArg(2)
                                && current.packageName.equals(chain.getArg(0))
                                && profile.stateIpm.get(current.owner) == chain.getThisObject();
                    } catch (Throwable ignored) { }
                    Object original = chain.proceed();
                    if (installed && original != null) capture(relevant ? current : null,
                            (Integer) chain.getArg(2), Collections.singletonList(original));
                    return original;
                }));
    }

    /** Hold the same monitor as both OEM Entry.info replacement sites. */
    private Object runScoped(Object owner, boolean full, int userId, String pkg,
                             Original original) throws Throwable {
        Object lock = ownerLock(owner);
        if (!installed || lock == null) return original.proceed();
        synchronized (lock) {
            Scope previous = scope.get();
            Scope current = null;
            try {
                boolean resumed = profile.stateResumed.getBoolean(owner);
                if (full && !resumed) {
                    bindings.invalidateOwner(owner);
                    current = new Scope(owner, true, -1, null);
                } else if (!full && resumed && userId >= 0 && pkg != null) {
                    current = new Scope(owner, false, userId, pkg);
                }
            } catch (Throwable ignored) {
                invalidate(owner);
            }
            // A nested no-op/unknown acquisition must not borrow its caller's observations.
            scope.set(current);
            boolean returned = false;
            try {
                Object result = original.proceed();
                returned = true;
                return result;
            } finally {
                scope.set(previous);
                if (!returned && current != null) {
                    if (current.full) invalidate(owner);
                    else for (Object info : current.captured) discard(info);
                }
            }
        }
    }

    private Scope userScope(Object users) {
        Scope current = installed ? scope.get() : null;
        try {
            return current != null && profile.stateUm.get(current.owner) == users
                    ? current : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private void readProfiles(Scope current, Object result) {
        try {
            if (!(result instanceof List<?>)) return;
            Map<Integer, SettingsEntryBindings.Observation> found = new HashMap<>();
            for (Object user : (List<?>) result) {
                int id = profile.userId.getInt(user);
                if (found.containsKey(id)) throw new IllegalArgumentException("duplicate profile");
                found.put(id, observation(current.owner, user));
            }
            current.observations.putAll(found);
        } catch (Throwable ignored) {
            current.observations.clear();
        }
    }

    private void readSingleProfile(Scope current, Object user) {
        current.observations.clear();
        try {
            if (profile.userId.getInt(user) == current.userId)
                current.observations.put(current.userId, observation(current.owner, user));
        } catch (Throwable ignored) { }
    }

    private SettingsEntryBindings.Observation observation(Object owner, Object user)
            throws IllegalAccessException {
        int id = profile.userId.getInt(user);
        int serial = profile.userSerial.getInt(user);
        int flags = profile.userFlags.getInt(user);
        if (id < 0 || id > 99999 || serial < 0 || (flags & 0x40) != 0
                || profile.userPartial.getBoolean(user) || profile.userPreCreated.getBoolean(user))
            return null;
        // Copy primitives now: UserInfo is mutable, and its later value is not pre-evidence.
        return bindings.observe(owner, id, serial);
    }

    private void captureList(Scope current, int userId, Object slice) {
        if (!installed || slice == null) return;
        try {
            Object list = profile.getList.invoke(slice);
            if (list instanceof List<?>) capture(current, userId, (List<?>) list);
            else if (current != null) current.observations.remove(userId);
        } catch (Throwable ignored) {
            if (current != null) {
                current.observations.remove(userId);
                invalidate(current.owner);
            }
        }
    }

    private void capture(Scope current, int userId, List<?> infos) {
        SettingsEntryBindings.Observation observation = current == null ? null
                : current.observations.remove(userId);
        ArrayList<SettingsEntryBindings.Item> items = new ArrayList<>();
        try {
            boolean valid = observation != null;
            for (Object value : infos) {
                if (!(value instanceof ApplicationInfo)) {
                    items.add(new SettingsEntryBindings.Item(value, -1, null));
                    valid = false;
                    continue;
                }
                ApplicationInfo info = (ApplicationInfo) value;
                if (info.uid < 0 || info.uid / 100000 != userId || info.packageName == null
                        || (current != null && !current.full
                        && !current.packageName.equals(info.packageName)))
                    valid = false;
                items.add(new SettingsEntryBindings.Item(info, userId, info.packageName));
            }
            if (!valid) {
                // Remember even previously unknown refs; a later acquisition cannot bless them.
                bindings.capture(null, items, SystemClock.elapsedRealtime());
                return;
            }
            current.captured.addAll(infos);
            if (bindings.capture(observation, items, SystemClock.elapsedRealtime())) {
                Context context = (Context) profile.stateContext.get(current.owner);
                FeatureSettings.requestHiddenEntryVerification(context);
            }
        } catch (Throwable ignored) {
            try { bindings.capture(null, items, SystemClock.elapsedRealtime()); }
            catch (Throwable unavailable) { }
            if (current != null) invalidate(current.owner);
        }
    }

    Object lockFor(Object adapter) {
        if (!installed || !profile.adapter.isInstance(adapter)) return null;
        try { return ownerLock(profile.adapterState.get(adapter)); }
        catch (Throwable ignored) { return null; }
    }

    /** Called by the filter while holding lockFor(adapter); never schedules identity reads here. */
    void observeAdapter(Object adapter) {
        try {
            Object lock = lockFor(adapter);
            if (lock == null || !Thread.holdsLock(lock)) return;
            Object owner = profile.adapterState.get(adapter);
            Object session = profile.adapterSession.get(adapter);
            Object page = profile.adapterPage.get(adapter);
            if (!active(adapter, owner, session) || page == null) return;
            long generation = bindings.generation(owner);
            int pageUser = profile.pageUser.getInt(page);
            synchronized (adapters) {
                for (int i = adapters.size() - 1; i >= 0; i--) {
                    AdapterRef existing = adapters.get(i);
                    Object live = existing.adapter.get();
                    if (live == null) adapters.remove(i);
                    else if (live == adapter) {
                        if (existing.same(owner, session, page, generation, pageUser)) return;
                        adapters.remove(i);
                    }
                }
                adapters.add(new AdapterRef(adapter, owner, session, page, generation, pageUser));
            }
        } catch (Throwable ignored) { }
    }

    boolean matches(Object adapter, Object info, int userId, String pkg,
                    Set<HideTargetCodec.Entry> targets) {
        try {
            Object lock = lockFor(adapter);
            if (lock == null || !Thread.holdsLock(lock) || !(info instanceof ApplicationInfo))
                return false;
            Object owner = profile.adapterState.get(adapter);
            if (!active(adapter, owner, profile.adapterSession.get(adapter))) return false;
            ApplicationInfo current = (ApplicationInfo) info;
            if (current.uid < 0 || current.uid / 100000 != userId
                    || pkg == null || !pkg.equals(current.packageName)) {
                discard(info);
                return false;
            }
            return bindings.matches(owner, info, userId, pkg, targets, SystemClock.elapsedRealtime());
        } catch (Throwable ignored) {
            discard(info);
            return false;
        }
    }

    private boolean active(Object adapter, Object owner, Object session)
            throws IllegalAccessException {
        return owner != null && session != null && profile.sessionOwner.get(session) == owner
                && profile.stateResumed.getBoolean(owner) && profile.sessionResumed.getBoolean(session)
                && profile.adapterResumed.getBoolean(adapter);
    }

    private Object ownerLock(Object owner) {
        try { return owner == null ? null : profile.entriesMap.get(owner); }
        catch (Throwable ignored) { return null; }
    }

    private void invalidate(Object owner) {
        try { bindings.invalidateOwner(owner); }
        catch (Throwable ignored) { }
    }

    private void discard(Object info) {
        try { bindings.discard(info); }
        catch (Throwable ignored) { }
    }

    /** Notifications are changes, not each filter call. OEM rebuild itself coalesces at 50 ms. */
    private void queueRebuild() {
        if (!installed) return;
        synchronized (adapters) {
            for (int i = adapters.size() - 1; i >= 0; i--) {
                AdapterRef ref = adapters.get(i);
                if (ref.adapter.get() == null) adapters.remove(i);
                else if (!pendingRebuilds.contains(ref)) pendingRebuilds.add(ref);
            }
            if (rebuildPending || pendingRebuilds.isEmpty()) return;
            rebuildPending = true;
        }
        try {
            if (!main.post(() -> {
                List<AdapterRef> snapshot;
                synchronized (adapters) {
                    snapshot = new ArrayList<>(pendingRebuilds);
                    pendingRebuilds.clear();
                    rebuildPending = false;
                }
                for (AdapterRef ref : snapshot) rebuild(ref);
            })) clearPendingRebuilds();
        } catch (Throwable ignored) {
            clearPendingRebuilds();
        }
    }

    private void clearPendingRebuilds() {
        synchronized (adapters) {
            pendingRebuilds.clear();
            rebuildPending = false;
        }
    }

    private void rebuild(AdapterRef ref) {
        try {
            Object adapter = ref.adapter.get();
            Object owner = ref.owner.get();
            Object lock = lockFor(adapter);
            if (owner == null || lock == null) return;
            synchronized (lock) {
                Object page = profile.adapterPage.get(adapter);
                Object session = profile.adapterSession.get(adapter);
                if (profile.adapterState.get(adapter) != owner
                        || !ref.same(owner, session, page, bindings.generation(owner),
                        profile.pageUser.getInt(page)) || !active(adapter, owner, session)) return;
                profile.rebuild.invoke(adapter);
            }
        } catch (Throwable ignored) { }
    }

    private interface Original { Object proceed() throws Throwable; }

    private static final class Scope {
        final Object owner;
        final boolean full;
        final int userId;
        final String packageName;
        final Map<Integer, SettingsEntryBindings.Observation> observations = new HashMap<>();
        final List<Object> captured = new ArrayList<>();
        boolean readingAdmin;
        Scope(Object owner, boolean full, int userId, String packageName) {
            this.owner = owner; this.full = full; this.userId = userId; this.packageName = packageName;
        }
    }

    private static final class AdapterRef {
        final WeakReference<Object> adapter, owner, session, page;
        final long generation;
        final int pageUser;
        AdapterRef(Object adapter, Object owner, Object session, Object page, long generation, int user) {
            this.adapter = new WeakReference<>(adapter); this.owner = new WeakReference<>(owner);
            this.session = new WeakReference<>(session); this.page = new WeakReference<>(page);
            this.generation = generation; pageUser = user;
        }
        boolean same(Object owner, Object session, Object page, long generation, int user) {
            return this.owner.get() == owner && this.session.get() == session && this.page.get() == page
                    && this.generation == generation && pageUser == user;
        }
    }

    /** This finite profile is deliberately checked before any callback can grant evidence. */
    private static final class Profile {
        final Class<?> adapter;
        final Field entriesMap, stateResumed, stateContext, stateUm, stateIpm;
        final Field adapterState, adapterSession, adapterPage, adapterResumed;
        final Field sessionOwner, sessionResumed, pageUser;
        final Field userId, userSerial, userFlags, userPartial, userPreCreated;
        final Method resume, pause, addPackage, removeUser, getProfiles, getUserInfo, isUserAdmin;
        final Method listApplications, getList, applicationInfo, rebuild;

        Profile(ClassLoader loader) throws ReflectiveOperationException {
            Class<?> state = type(loader, "com.android.settingslib.applications.ApplicationsState");
            Class<?> session = type(loader, "com.android.settingslib.applications.ApplicationsState$Session");
            Class<?> page = type(loader, "com.android.settings.applications.manageapplications.ManageApplications");
            adapter = type(loader, "com.android.settings.applications.manageapplications.ManageApplications$ApplicationsAdapter");
            Class<?> users = type(loader, "android.os.UserManager");
            Class<?> user = type(loader, "android.content.pm.UserInfo");
            Class<?> ipm = type(loader, "android.content.pm.IPackageManager");
            Class<?> proxy = type(loader, "android.content.pm.IPackageManager$Stub$Proxy");
            Class<?> doubleLay = type(loader, "com.zte.settingslib.DoubleLayUtils");
            Class<?> slice = type(loader, "android.content.pm.ParceledListSlice");
            entriesMap = field(state, "mEntriesMap", type(loader, "android.util.SparseArray"));
            stateResumed = field(state, "mResumed", boolean.class);
            stateContext = field(state, "mContext", Context.class);
            stateUm = field(state, "mUm", users); stateIpm = field(state, "mIpm", ipm);
            adapterState = field(adapter, "mState", state);
            adapterSession = field(adapter, "mSession", session);
            adapterPage = field(adapter, "mManageApplications", page);
            adapterResumed = field(adapter, "mResumed", boolean.class);
            sessionOwner = field(session, "this$0", state);
            sessionResumed = field(session, "mResumed", boolean.class);
            pageUser = field(page, "mWorkUserId", int.class);
            userId = field(user, "id", int.class); userSerial = field(user, "serialNumber", int.class);
            userFlags = field(user, "flags", int.class); userPartial = field(user, "partial", boolean.class);
            userPreCreated = field(user, "preCreated", boolean.class);
            resume = method(state, "doResumeIfNeededLocked", void.class);
            pause = method(state, "doPauseLocked", void.class);
            addPackage = method(state, "addPackage", void.class, String.class, int.class);
            removeUser = method(state, "removeUser", void.class, int.class);
            getProfiles = method(users, "getProfiles", List.class, int.class);
            getUserInfo = method(users, "getUserInfo", user, int.class);
            isUserAdmin = method(users, "isUserAdmin", boolean.class, int.class);
            listApplications = method(doubleLay, "getInstalledApplicationsInternal", slice, int.class, int.class);
            getList = method(slice, "getList", List.class);
            applicationInfo = method(proxy, "getApplicationInfo", ApplicationInfo.class,
                    String.class, long.class, int.class);
            rebuild = method(adapter, "rebuild", void.class);
        }
        private static Class<?> type(ClassLoader loader, String name) throws ClassNotFoundException {
            return Class.forName(name, false, loader);
        }
        private static Field field(Class<?> type, String name, Class<?> expected)
                throws ReflectiveOperationException {
            Field field = type.getDeclaredField(name);
            if (field.getType() != expected) throw new NoSuchFieldException(name + " type");
            field.setAccessible(true);
            return field;
        }
        private static Method method(Class<?> type, String name, Class<?> returns, Class<?>... args)
                throws ReflectiveOperationException {
            Method method;
            try { method = type.getDeclaredMethod(name, args); }
            catch (NoSuchMethodException missing) { method = type.getMethod(name, args); }
            if (method.getReturnType() != returns) throw new NoSuchMethodException(name + " return");
            method.setAccessible(true);
            return method;
        }
    }
}
