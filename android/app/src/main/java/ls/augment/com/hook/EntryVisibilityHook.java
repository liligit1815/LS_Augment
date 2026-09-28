package ls.augment.com.hook;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import ls.augment.com.EntryVisibilityOptions;
import ls.augment.com.EntryVisibilityPolicy;

/** Filters exact entries without changing PackageManager or minors-mode restrictions. */
final class EntryVisibilityHook {
    private static EntryVisibilityHook settings, launcher;
    private final AugmentModule module;
    private final String host;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Set<Object> preferences = Collections.newSetFromMap(new WeakHashMap<>());
    private final Set<Object> appStores = Collections.newSetFromMap(new WeakHashMap<>());
    private final Map<View, IconState> icons = new WeakHashMap<>();
    private final ThreadLocal<Boolean> writingVisibility = ThreadLocal.withInitial(() -> false);
    private final Runnable snapshotListener = this::queueRefresh;
    private Context context;
    private Method preferenceIntent, preferenceContext, preferenceChanged, storeChanged;
    private Method preferenceTitle, preferenceParent, groupCount, groupPreference;
    private Class<?> preferenceScreen;
    private boolean listening, refreshPosted;
    private Boolean previousEnabled;
    private int matchedPreferences, matchedIcons;
    private boolean matchedAppList;

    private EntryVisibilityHook(AugmentModule module, String host) {
        this.module = module;
        this.host = host;
    }

    static synchronized int install(AugmentModule module, ClassLoader loader, String packageName) {
        if (EntryVisibilityPolicy.SETTINGS_HOST.equals(packageName)) {
            if (settings != null) return 0;
            settings = new EntryVisibilityHook(module, packageName);
            return settings.installSettings(loader);
        }
        if (EntryVisibilityPolicy.LAUNCHER_HOST.equals(packageName)) {
            if (launcher != null) return 0;
            launcher = new EntryVisibilityHook(module, packageName);
            return launcher.installLauncher(loader);
        }
        return 0;
    }

    private int installSettings(ClassLoader loader) {
        int count = 0;
        try {
            // The device confirms androidx Preferences, but its homepage target has no
            // matching explicit component. Resolve real intents and identify the verified
            // homepage group without inventing a ROM-specific preference key.
            Class<?> preference = Class.forName("androidx.preference.Preference", false, loader);
            Method visible = preference.getDeclaredMethod("isVisible");
            preferenceIntent = preference.getDeclaredMethod("getIntent");
            preferenceContext = preference.getDeclaredMethod("getContext");
            preferenceChanged = preference.getDeclaredMethod("notifyHierarchyChanged");
            if (visible.getReturnType() != boolean.class
                    || preferenceIntent.getReturnType() != Intent.class
                    || preferenceContext.getReturnType() != Context.class)
                throw new NoSuchMethodException("unsupported Preference shape");
            preferenceChanged.setAccessible(true);
            resolveHomepageShape(loader, preference);
            module.registerFeatureHook(module.prepareFeatureHook(visible,
                    "entries.settings.visible", false).intercept(chain -> {
                Object original = chain.proceed();
                Object owner = chain.getThisObject();
                try {
                    Context preferenceHost = (Context) preferenceContext.invoke(owner);
                    ensure(preferenceHost);
                    if (isHealthyPreference(owner, preferenceHost)) {
                        synchronized (preferences) {
                            if (preferences.add(owner)) matchedPreferences++;
                        }
                        if (enabled()) return false;
                    }
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
                return original;
            }));
            count++;
        } catch (Throwable error) {
            module.logFeatureError("ENTRY_SETTINGS_SHAPE_UNAVAILABLE", error);
        }
        try {
            Method resume = Activity.class.getDeclaredMethod("onResume");
            module.registerFeatureHook(module.prepareFeatureHook(resume,
                    "entries.settings.resume", false).intercept(chain -> {
                Object result = chain.proceed();
                ensure((Context) chain.getThisObject());
                main.postDelayed(this::diagnose, 500);
                return result;
            }));
            count++;
        } catch (Throwable error) {
            module.logFeatureError("ENTRY_SETTINGS_RESUME_UNAVAILABLE", error);
        }
        return count;
    }

    private void resolveHomepageShape(ClassLoader loader, Class<?> preference) {
        try {
            Class<?> group = Class.forName("androidx.preference.PreferenceGroup", false, loader);
            Class<?> screen = Class.forName("androidx.preference.PreferenceScreen", false, loader);
            Method title = preference.getDeclaredMethod("getTitle");
            Method parent = preference.getDeclaredMethod("getParent");
            Method count = group.getDeclaredMethod("getPreferenceCount");
            Method item = group.getDeclaredMethod("getPreference", int.class);
            if (!CharSequence.class.isAssignableFrom(title.getReturnType())
                    || parent.getReturnType() != group || count.getReturnType() != int.class
                    || item.getReturnType() != preference || !group.isAssignableFrom(screen)) return;
            preferenceScreen = screen;
            preferenceTitle = title;
            preferenceParent = parent;
            groupCount = count;
            groupPreference = item;
        } catch (ReflectiveOperationException | RuntimeException error) {
            // Explicit component support remains available on a different framework shape.
            module.logFeatureError("ENTRY_SETTINGS_HOME_SHAPE_UNAVAILABLE", error);
        }
    }

    private boolean isHealthyPreference(Object preference, Context preferenceHost)
            throws ReflectiveOperationException {
        if (preferenceHost == null || !host.equals(preferenceHost.getPackageName())) return false;
        Intent intent = (Intent) preferenceIntent.invoke(preference);
        ComponentName explicit = intent == null ? null : intent.getComponent();
        if (explicit != null)
            return EntryVisibilityPolicy.hideHealthyUse(true, host, identity(explicit));

        // No broad title-based filtering: unrelated rows and target-looking subpages stay.
        if (preferenceTitle == null) return false;
        CharSequence title = (CharSequence) preferenceTitle.invoke(preference);
        if (title == null || !EntryVisibilityPolicy.HEALTHY_USE_TITLE.contentEquals(title)) return false;
        if (intent != null) {
            try {
                ComponentName resolved = intent.resolveActivity(preferenceHost.getPackageManager());
                if (resolved != null)
                    return EntryVisibilityPolicy.hideHealthyUse(true, host, identity(resolved));
            } catch (RuntimeException ignored) {
                // An unreadable/implicit route can still use the exact homepage structure.
            }
        }
        Object group = preferenceParent.invoke(preference);
        for (int depth = 0; group != null && depth < 5; depth++) {
            int count = (Integer) groupCount.invoke(group);
            if (count < 0 || count > 128) return false;
            CharSequence[] siblings = new CharSequence[count];
            for (int i = 0; i < count; i++) {
                Object sibling = groupPreference.invoke(group, i);
                if (sibling != null) siblings[i] = (CharSequence) preferenceTitle.invoke(sibling);
            }
            if (EntryVisibilityPolicy.hideHealthyUseHomeTitle(true, host, title, siblings)) return true;
            // A nested screen remains attached to its containing homepage in the model,
            // but its children are a different page. Never borrow the outer page's labels.
            if (preferenceScreen.isInstance(group)) return false;
            Object parent = preferenceParent.invoke(group);
            if (parent == group) return false;
            group = parent;
        }
        return false;
    }

    private int installLauncher(ClassLoader loader) {
        int count = 0;
        MinorsWorkspaceHook.install(module, loader);
        try {
            // Verified against the local OEM launcher: D is AllAppsStore, o() is getApps,
            // t() only notifies its UI listeners. Its original c[] model remains untouched.
            Class<?> store = Class.forName("com.android.launcher3.allapps.D", false, loader);
            Class<?> app = Class.forName("com.android.launcher3.model.data.d", false, loader);
            Method apps = store.getDeclaredMethod("o");
            storeChanged = store.getDeclaredMethod("t");
            if (!apps.getReturnType().isArray() || apps.getReturnType().getComponentType() != app
                    || storeChanged.getReturnType() != void.class)
                throw new NoSuchMethodException("unsupported AllAppsStore shape");
            module.registerFeatureHook(module.prepareFeatureHook(apps,
                    "entries.launcher.apps", false).intercept(chain -> {
                Object original = chain.proceed();
                Object owner = chain.getThisObject();
                ensure(FeatureSettings.from(owner));
                synchronized (appStores) { appStores.add(owner); }
                if (!(original instanceof Object[])) return original;
                Object[] filtered = EntryVisibilityPolicy.filterMinors((Object[]) original, enabled(), host,
                        EntryVisibilityHook::itemIdentity);
                if (filtered != original) matchedAppList = true;
                return filtered;
            }));
            count++;
        } catch (Throwable error) {
            module.logFeatureError("ENTRY_LAUNCHER_LIST_UNAVAILABLE", error);
        }
        try {
            Class<?> bubble = Class.forName("com.android.launcher3.BubbleTextView", false, loader);
            Class<?> item = Class.forName("com.android.launcher3.model.data.y", false, loader);
            Method bind = bubble.getDeclaredMethod("B", item);
            if (!View.class.isAssignableFrom(bubble) || bind.getReturnType() != void.class)
                throw new NoSuchMethodException("unsupported BubbleTextView shape");
            module.registerFeatureHook(module.prepareFeatureHook(bind,
                    "entries.launcher.icon", false).intercept(chain -> {
                View view = (View) chain.getThisObject();
                ensure(view.getContext());
                // Restore before recycling so an unrelated app never inherits GONE.
                release(view);
                Object result = chain.proceed();
                if (EntryVisibilityPolicy.hideMinors(true, host, itemIdentity(chain.getArg(0)))) {
                    synchronized (icons) {
                        icons.put(view, new IconState(view.getVisibility()));
                        matchedIcons++;
                    }
                    apply(view);
                }
                return result;
            }));
            Method visibility = View.class.getDeclaredMethod("setVisibility", int.class);
            module.registerFeatureHook(module.prepareFeatureHook(visibility,
                    "entries.launcher.visibility", false).intercept(chain -> {
                if (writingVisibility.get()) return chain.proceed();
                View view = (View) chain.getThisObject();
                synchronized (icons) {
                    IconState state = icons.get(view);
                    if (state == null) return chain.proceed();
                    state.originalVisibility = (Integer) chain.getArg(0);
                    if (!enabled()) return chain.proceed();
                }
                // Allow the native call, then reapply the presentation override.
                Object result = chain.proceed();
                writeVisibility(view, View.GONE);
                return result;
            }));
            count += 2;
        } catch (Throwable error) {
            module.logFeatureError("ENTRY_LAUNCHER_ICON_UNAVAILABLE", error);
        }
        return count;
    }

    private void ensure(Context value) {
        if (value == null || !host.equals(value.getPackageName())) return;
        if (context == null) {
            Context app = value.getApplicationContext();
            context = app == null ? value : app;
        }
        if (!listening) listening = FeatureSettings.addSnapshotListener(context, snapshotListener);
    }

    private boolean enabled() {
        return FeatureSettings.enabled(context, EntryVisibilityPolicy.SETTINGS_HOST.equals(host)
                ? EntryVisibilityOptions.HIDE_HEALTHY_USE_ENTRY : EntryVisibilityOptions.HIDE_MINORS_ICON);
    }

    private void queueRefresh() {
        synchronized (this) {
            if (refreshPosted) return;
            refreshPosted = true;
        }
        main.post(() -> {
            synchronized (EntryVisibilityHook.this) { refreshPosted = false; }
            boolean active = enabled();
            if (previousEnabled != null && previousEnabled == active) return;
            previousEnabled = active;
            ArrayList<Object> prefs;
            synchronized (preferences) { prefs = new ArrayList<>(preferences); }
            for (Object pref : prefs) try { preferenceChanged.invoke(pref); }
            catch (ReflectiveOperationException | RuntimeException error) {
                module.logFeatureError("ENTRY_SETTINGS_REFRESH", error);
            }
            ArrayList<View> views;
            synchronized (icons) { views = new ArrayList<>(icons.keySet()); }
            for (View view : views) apply(view);
            ArrayList<Object> stores;
            synchronized (appStores) { stores = new ArrayList<>(appStores); }
            for (Object store : stores) try { storeChanged.invoke(store); }
            catch (ReflectiveOperationException | RuntimeException error) {
                module.logFeatureError("ENTRY_LAUNCHER_REFRESH", error);
            }
            diagnose();
        });
    }

    private void apply(View view) {
        IconState state;
        synchronized (icons) { state = icons.get(view); }
        if (state != null) writeVisibility(view, enabled() ? View.GONE : state.originalVisibility);
    }

    private void release(View view) {
        IconState state;
        synchronized (icons) { state = icons.remove(view); }
        if (state != null) writeVisibility(view, state.originalVisibility);
    }

    private void writeVisibility(View view, int value) {
        if (view.getVisibility() == value) return;
        boolean previous = writingVisibility.get();
        writingVisibility.set(true);
        try { view.setVisibility(value); }
        finally { writingVisibility.set(previous); }
    }

    private void diagnose() {
        if (context == null) return;
        boolean isSettings = EntryVisibilityPolicy.SETTINGS_HOST.equals(host);
        boolean matched = isSettings ? matchedPreferences > 0 : matchedIcons > 0 || matchedAppList;
        FeatureSettings.diagnostic(context, "ls_augment_entry_visibility_" + (isSettings ? "settings" : "launcher"),
                !enabled() ? "关闭；保留原厂入口" : matched
                        ? isSettings ? "已匹配健康使用手机入口；仅过滤显示" : "已匹配指定组件；仅过滤显示"
                        : "尚未匹配指定入口；保留未识别入口");
    }

    private static EntryVisibilityPolicy.Component itemIdentity(Object item) {
        if (item == null) return null;
        try {
            Object target = OemHooks.invoke(item, "getTargetComponent");
            return target instanceof ComponentName ? identity((ComponentName) target) : null;
        } catch (ReflectiveOperationException | RuntimeException ignored) { return null; }
    }

    private static EntryVisibilityPolicy.Component identity(ComponentName target) {
        return target == null ? null : new EntryVisibilityPolicy.Component(
                target.getPackageName(), target.getClassName());
    }

    private static final class IconState {
        int originalVisibility;
        IconState(int visibility) { originalVisibility = visibility; }
    }
}
