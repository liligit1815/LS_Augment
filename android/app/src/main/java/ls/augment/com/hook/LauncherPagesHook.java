package ls.augment.com.hook;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.function.Consumer;

import ls.augment.com.LauncherOptions;
import ls.augment.com.LauncherPageOrigins;

/** Shared page lifecycle for the verified Android 15 named and Android 16 obfuscated launchers. */
final class LauncherPagesHook {
    private static final String ENTRY_TAG = "ls_augment.pages.entry";
    private static boolean installed;

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static Controller controller;

    static boolean pauseForReset(long revision){
        if(Looper.myLooper()!=Looper.getMainLooper()||controller==null||controller.binding||controller.mutating)return false;
        Controller c=controller;c.resetPaused=true;c.resetRevision=revision;
        c.cancelPending();c.cancelRestoration();c.bindingGeneration++;c.invalidateSource();c.main.removeCallbacks(c.cleanup);
        c.pendingHome=null;c.fallbackHome=null;c.pendingHomePreferences=null;c.homeChangedByUser=false;
        c.restoreDiagnostic("reset_paused", "");
        if(c.editor!=null){c.editor.dismiss();c.editor=null;}
        return true;
    }
    static SharedPreferences cachedResetPreferences(){return controller==null?null:controller.prefs;}

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Targets targets = new Targets(loader);
            controller = new Controller(module, targets);
            module.registerFeatureHook(module.prepareFeatureHook(targets.bind, "launcher.pages.bind", true)
                    .intercept(chain -> {
                        Controller c = controller;
                        ViewGroup workspace = (ViewGroup) targets.workspace.invoke(targets.bindOwner(chain.getThisObject()));
                        c.attach(workspace);
                        c.capturePendingHome();
                        c.beginBinding();
                        int generation = c.bindingGeneration;
                        if (c.editor != null) c.editor.dismiss();
                        try {
                            List<Integer> saved = c.saved();
                            Object replacement = null;
                            if (!saved.isEmpty() && (Integer) targets.panelCount.invoke(workspace) == 1) {
                                // Modify this binding's IntArray, never the model's stable IDs.
                                Object ids = targets.listClone.invoke(chain.getArg(0));
                                // A legacy order is not proof that an absent native screen is
                                // a user-created empty page. Bind only the native model IDs;
                                // provenance-checked empty restoration runs after native finish.
                                List<Integer> merged = LauncherPageOrder.merge(targets.ids(ids), saved, false);
                                boolean safe = true;
                                try { c.checkFixedOrder(targets.ids(ids), merged); }
                                catch (PageUnavailable unsafeOrder) {
                                    c.restorationFailed(unsafeOrder);
                                    safe = false;
                                }
                                if (safe) {
                                    targets.replaceIds(ids, merged);
                                    replacement = ids;
                                }
                            }
                            Object result = replacement == null ? chain.proceed() : chain.proceed(new Object[]{replacement});
                            if (generation == c.bindingGeneration && c.workspace.get() == workspace) {
                                c.bindingSucceeded = true;
                                c.rememberFallbackHome();
                            }
                            return result;
                        } finally { if (generation == c.bindingGeneration) c.binding = false; }
                    }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.finished, "launcher.pages.bound", true)
                    .intercept(chain -> {
                        Controller c = controller;
                        ViewGroup expected = (ViewGroup) targets.workspace.invoke(chain.getThisObject());
                        int generation = c.bindingGeneration;
                        boolean ownsBinding = c.workspace.get() == expected;
                        if (ownsBinding) c.checkPendingHomeChange();
                        Object result;
                        try { result = chain.proceed(); }
                        catch (Throwable error) {
                            if (ownsBinding && c.workspace.get() == expected && generation == c.bindingGeneration) {
                                c.ready = false;
                                c.bindingSucceeded = false;
                                c.cancelPending();
                                c.cancelRestoration();
                                c.restoreDiagnostic("waiting_binding", "finish_failed");
                            }
                            throw error;
                        }
                        // A delayed finish from an old Launcher, or a reentrant
                        // bind during this native finish, cannot certify another
                        // Workspace/generation. Only bind may transfer ownership.
                        if (!ownsBinding || c.workspace.get() != expected || generation != c.bindingGeneration) return result;
                        c.ready = c.bindingSucceeded;
                        c.rememberFallbackHome();
                        c.cancelRestoration();
                        c.restoreWhenIdle(c.workspace.get(), c.bindingGeneration);
                        return result;
                    }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.strip, "launcher.pages.keep_empty", true)
                    .intercept(chain -> {
                        Controller c = controller;
                        if (c.workspace.get() != chain.getThisObject()) return chain.proceed();
                        c.attach((ViewGroup) chain.getThisObject());
                        if (!c.restorationApplied()) { c.requestRestoration(0); return null; }
                        if (c.keepEmpty()) {
                            // G2 still removes real drag placeholders; Q0 must not rename a
                            // user's stable empty page to -201 before that cleanup runs.
                            c.scheduleCleanup();
                            if (c.ready && !c.binding && !c.mutating) c.save();
                            return null;
                        }
                        Object result = chain.proceed();
                        if (c.ready && !c.binding && !c.mutating) c.save();
                        return result;
                    }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.convertEmpty, "launcher.pages.stable_empty", true)
                    .intercept(chain -> {
                        Controller c = controller;
                        if (c.workspace.get() != chain.getThisObject()) return chain.proceed();
                        c.attach((ViewGroup) chain.getThisObject());
                        if (!c.restorationApplied()) { c.requestRestoration(0); return null; }
                        return c.keepEmpty() ? null : chain.proceed();
                    }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.menuInit, "launcher.pages.menu", true)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        controller.attachMenu((ViewGroup) chain.getThisObject());
                        return result;
                    }));
            installed = true;
        } catch (Throwable error) { module.logFeatureError("LAUNCHER_PAGES_INSTALL", error); }
    }

    /** Exact native signatures; an unrelated launcher is never modified by guesswork. */
    static final class Targets {
        final String adapter, stateValue;
        final Class<?> launcher, state, future;
        final Method bind, finished, strip, convertEmpty, removeExtra, workspace, menuInit, screenOrder, insert, pageAtId;
        final Method listClear, listAdd, listArray, listClone, currentPage, setCurrentPage, shortCuts, panelCount;
        final Method stateGet, modelGet, databaseGet, nextId, screenUtil, refreshDefault, updateIndicator, nativePrefs;
        final Field screens, launcherField, menuItems, menuOwner, firstScreen, bindingModel, vendorFirstScreen;
        final Field callbackLauncher;
        final boolean callbackBinding;
        final String futureMethod;
        final Executor modelExecutor;
        final Method idpGet;
        final Field databaseName;


        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        Targets(ClassLoader loader) throws Exception {
            Class<?> ws = Class.forName("com.android.launcher3.Workspace", false, loader);
            Class<?> owner; boolean named;
            try { owner = Class.forName("com.android.launcher3.C2", false, loader); named = false; }
            catch (ClassNotFoundException absent) { owner = Class.forName("com.android.launcher3.Launcher", false, loader); named = true; }
            launcher = owner;
            stateValue = named ? "getState" : "C";
            // Resolve one complete ROM contract before registering any hook. Never mix
            // missing obfuscated members with the named family from another launcher.
            Class<?> list = Class.forName(named ? "com.android.launcher3.util.IntArray" : "com.android.launcher3.util.x0", false, loader);
            Class<?> finishedList = Class.forName(named ? "com.android.launcher3.util.IntSet" : "com.android.launcher3.util.z0", false, loader);
            Class<?> menu = Class.forName("com.android.launcher3.menu.MenuContainer", false, loader);
            Class<?> cell = Class.forName("com.android.launcher3.CellLayout", false, loader);
            Class<?> paged = Class.forName(named ? "com.android.launcher3.PagedView" : "com.android.launcher3.V4", false, loader);
            state = Class.forName(named ? "com.android.launcher3.LauncherAppState" : "com.android.launcher3.P2", false, loader);
            Class<?> model = Class.forName(named ? "com.android.launcher3.LauncherModel" : "com.android.launcher3.D3", false, loader);
            Class<?> db = Class.forName(named ? "com.android.launcher3.model.ModelDbController" : "z1.k2", false, loader);
            Class<?> util = Class.forName(named ? "com.android.launcher3.mfvUtil.ScreenUtil" : "x1.Z", false, loader);
            // The audited Android 15 launcher has no AI Future page owner.
            Method binding;Field callbackOwner=null;
            try{binding=method(launcher,named?"bindScreens":"f",list);}
            catch(NoSuchMethodException moved){
                if(!named)throw moved;
                Class<?> callbacks=Class.forName("com.android.launcher3.ModelCallbacks",false,loader);
                binding=method(callbacks,"bindScreens",list);
                callbackOwner=field(callbacks,"launcher");
                if(callbackOwner.getType()!=launcher)throw new IllegalStateException("页面绑定所有者类型不匹配");
            }
            bind=binding;callbackLauncher=callbackOwner;callbackBinding=callbackOwner!=null;
            adapter=callbackBinding?"named_callback_binding":named?"android15_named":"android16_obfuscated";
            future = named&&!callbackBinding ? null : Class.forName("com.android.launcher3.widget.custom.future.AIFutureWidgetUtils", false, loader);
            futureMethod=callbackBinding?"getAIFutureScreenId":"l";
            if(future!=null&&method(future,futureMethod,Context.class).getReturnType()!=int.class)
                throw new IllegalStateException("原厂专用页面接口不匹配");
            finished = method(launcher, named ? "finishBindingItems" : "h", finishedList);
            workspace = method(launcher, named ? "getWorkspace" : "B2");
            strip = method(ws, named ? "stripEmptyScreens" : "i3");
            convertEmpty = method(ws, named ? "convertFinalScreenToEmptyScreenIfNecessary" : "Q0");
            removeExtra = method(ws, named ? "removeExtraEmptyScreenDelayed" : "G2", int.class, boolean.class, Runnable.class);
            screenOrder = method(ws, "getScreenOrder");
            insert = method(ws, named ? "insertNewWorkspaceScreen" : "v1", int.class, int.class);
            pageAtId = method(ws, named ? "getScreenWithId" : "n", int.class);
            panelCount = method(ws, "getPanelCount");
            currentPage = method(paged, "getCurrentPage");
            setCurrentPage = method(paged, "setCurrentPage", int.class);
            updateIndicator = method(paged, "updatePageIndicator");
            shortCuts = method(cell, "getShortcutsAndWidgets");
            menuInit = method(menu, named ? "setupHomeMenu" : "G");
            listClear = method(list, "clear");
            listAdd = method(list, named ? "add" : "m", int.class);
            listArray = method(list, named ? "toArray" : "A");
            listClone = method(list, named ? "clone" : "q");
            screens = field(ws, named ? "mWorkspaceScreens" : "n");
            launcherField = field(ws, named ? "mLauncher" : "x");
            menuItems = field(menu, named ? "mHomeMenuLinearLayout" : "m");
            menuOwner = field(menu, named ? "mActivity" : "g");
            bindingModel = callbackBinding?null:field(launcher, named ? "mModelCallbacks" : "h");
            firstScreen = callbackBinding?null:field(Class.forName(named ? "com.android.launcher3.ModelCallbacks" : "com.android.launcher3.B4", false, loader), named ? "isFirstPagePinnedItemEnabled" : "j");
            vendorFirstScreen = callbackBinding?null:field(Class.forName(named ? "com.android.launcher3.Utilities" : "com.android.launcher3.N5", false, loader), named ? "SHOULD_SHOW_FIRST_PAGE_WIDGET" : "j");
            stateGet = method(state, named ? "getInstance" : "h", Context.class);
            Method sourceGet = null; Field sourceName = null;
            try {
                Class<?> idp = Class.forName(named ? "com.android.launcher3.InvariantDeviceProfile" : "com.android.launcher3.F1", false, loader);
                sourceGet = method(state, named ? "getIDP" : "e", Context.class);
                sourceName = field(idp, named ? "dbFile" : "E1");
                if (sourceGet.getReturnType() != idp || sourceName.getType() != String.class) { sourceGet = null; sourceName = null; }
            } catch (ReflectiveOperationException unsupportedSource) { /* Existing-ID ordering remains available. */ }
            idpGet = sourceGet; databaseName = sourceName;
            modelGet = method(state, named ? "getModel" : "j");
            databaseGet = method(model, named ? "getModelDbController" : "m0");
            nextId = method(db, named ? "getNewScreenId" : "F");
            screenUtil = method(launcher, named ? "getScreenUtil" : "w2");
            refreshDefault = method(util, named ? "bindDefaultPage" : "b", ws);
            nativePrefs = method(Class.forName(named ? "com.android.launcher3.LauncherPrefs" : "com.android.launcher3.J3", false, loader), named ? "getPrefs" : "m", Context.class);
            modelExecutor = (Executor) field(Class.forName(named ? "com.android.launcher3.util.Executors" : "com.android.launcher3.util.m0", false, loader), named ? "MODEL_EXECUTOR" : "h").get(null);
            if (bind.getReturnType() != void.class || finished.getReturnType() != void.class
                    || workspace.getReturnType() != ws || screenOrder.getReturnType() != list || insert.getReturnType() != cell
                    || pageAtId.getReturnType() != cell || listClone.getReturnType() != list || listArray.getReturnType() != int[].class
                    || modelGet.getReturnType() != model || databaseGet.getReturnType() != db
                    || (!callbackBinding&&(firstScreen.getType() != boolean.class || vendorFirstScreen.getType() != boolean.class))
                    || !LinearLayout.class.isAssignableFrom(menuItems.getType())
                    || nextId.getReturnType() != int.class || strip.getReturnType() != void.class
                    || !SparseArray.class.isAssignableFrom(screens.getType())) {
                throw new IllegalStateException("桌面页面接口不匹配");
            }
        }

        Object bindOwner(Object receiver)throws Exception{return callbackLauncher==null?receiver:callbackLauncher.get(receiver);}
        boolean firstPageFixed(Object owner)throws Exception{
            // The new native bindScreens unconditionally moves ID 0 to index 0.
            return callbackBinding||(firstScreen.getBoolean(bindingModel.get(owner))&&!vendorFirstScreen.getBoolean(null));
        }

        static Method method(Class<?> type, String name, Class<?>... args) throws Exception {
            Method method = type.getDeclaredMethod(name, args); method.setAccessible(true); return method;
        }
        static Field field(Class<?> type, String name) throws Exception {
            Field field = type.getDeclaredField(name); field.setAccessible(true); return field;
        }
        List<Integer> ids(Object value) throws Exception {
            ArrayList<Integer> ids = new ArrayList<>();
            for (int id : (int[]) listArray.invoke(value)) ids.add(id);
            return ids;
        }
        void replaceIds(Object value, List<Integer> ids) throws Exception {
            listClear.invoke(value);
            for (int id : ids) listAdd.invoke(value, id);
        }
        LauncherDatabaseIdentity.Snapshot source(Context context) throws Exception {
            if (idpGet == null || databaseName == null) {
                LauncherDatabaseIdentity.Snapshot missing = new LauncherDatabaseIdentity.Snapshot();
                missing.error = "source_contract"; return missing;
            }
            Object idp = idpGet.invoke(null, context);
            String name = (String) databaseName.get(idp);
            LauncherDatabaseIdentity.Snapshot snapshot = LauncherDatabaseIdentity.read(context, name);
            snapshot.idp = idp;
            if (idpGet.invoke(null, context) != idp || !java.util.Objects.equals(name, databaseName.get(idp))) {
                snapshot.ownerMatches = false; snapshot.error = "source_changed";
            }
            return snapshot;
        }
        boolean currentSource(Context context, LauncherDatabaseIdentity.Snapshot source) throws Exception {
            if (source == null || source.idp == null || idpGet == null || databaseName == null) return false;
            Object current = idpGet.invoke(null, context);
            return current == source.idp && java.util.Objects.equals(source.basename, databaseName.get(current));
        }
    }

    static final class Controller {
        final AugmentModule module;
        final Targets t;
        final Handler main = new Handler(Looper.getMainLooper());
        WeakReference<ViewGroup> workspace = new WeakReference<>(null);
        WeakReference<ViewGroup> menu = new WeakReference<>(null);
        Context context;
        SharedPreferences prefs;
        boolean ready, binding, mutating, subscribed, privateSubscribed, bindingSucceeded;
        boolean pending;
        volatile int requestToken;
        int bindingGeneration;
        int appliedGeneration = -1, restoreFailures, lastRestoreErrorGeneration = -1;
        int sourceGeneration = -1, sourceRequest, sourceAttempts;
        boolean sourcePending;
        Runnable sourceRetry;
        LauncherDatabaseIdentity.Snapshot databaseSource;
        Object bindingSourceIdp;
        String bindingSourceName = "";
        SharedPreferences appliedPreferences;
        HomeState pendingHome, fallbackHome;
        SharedPreferences pendingHomePreferences;
        boolean homeChangedByUser;
        volatile boolean resetPaused;
        long resetRevision;
        Runnable pendingCheck;
        Runnable restoreCheck;
        LauncherPagesEditor editor;
        final WeakHashMap<View, LinearLayout.LayoutParams> menuLayouts = new WeakHashMap<>();
        final Runnable cleanup = this::cleanupPlaceholders;

        Controller(AugmentModule module, Targets targets) { this.module = module; t = targets; }
        void attach(ViewGroup view) {
            if (view == null) return;
            if (workspace.get() != view) {
                boolean carryHome = false;
                try {
                    Context next = view.getContext().getApplicationContext();
                    if (next == null) next = view.getContext();
                    SharedPreferences nativeRecord = (SharedPreferences) t.nativePrefs.invoke(null, next);
                    carryHome = pendingHome != null && fallbackHome != null && !homeChangedByUser
                            && pendingHomePreferences == nativeRecord && fallbackHome.matches(nativeRecord);
                } catch (Throwable ignored) { }
                cancelPending();
                cancelRestoration();
                if (editor != null) { editor.dismiss(); editor = null; }
                workspace = new WeakReference<>(view);
                ready = false;
                bindingSucceeded = false;
                // An Activity recreation may replace only the View tree. Carry scalar
                // home evidence only while the same native record still has our fallback.
                if (!carryHome) {
                    pendingHome = null;
                    fallbackHome = null;
                    pendingHomePreferences = null;
                    homeChangedByUser = false;
                }
                bindingGeneration++;
                invalidateSource();
            }
            if (context == null) {
                context = view.getContext().getApplicationContext();
                try{prefs = LauncherOwnedStateClient.preferences(context,"pages");}
                catch(RuntimeException unavailable){failed(unavailable);}
            } else if (prefs == null) {
                prefs = LauncherOwnedStateClient.readyPreferences(context,"pages");
            }
            LauncherResetHook.attach(context);
            if (!subscribed) {
                subscribed = FeatureSettings.addSnapshotListener(context, () -> main.post(this::configurationChanged));
            }
            if (!privateSubscribed) {
                privateSubscribed = LauncherOwnedStateClient.addReadyListener(context, "pages",
                        () -> main.post(this::configurationChanged));
            }
            requestRestoration(0);
            if (prefs == null) restoreDiagnostic("waiting_record", "");
        }
        void beginBinding() {
            cancelPending();
            cancelRestoration();
            main.removeCallbacks(cleanup);
            ready = false;
            bindingSucceeded = false;
            binding = true;
            bindingGeneration++;
            invalidateSource();
            bindingSourceIdp = null; bindingSourceName = "";
            try {
                if (t.idpGet != null) {
                    bindingSourceIdp = t.idpGet.invoke(null, workspace.get().getContext());
                    bindingSourceName = (String) t.databaseName.get(bindingSourceIdp);
                }
            } catch (Exception unavailable) { /* No absent-page creation without source evidence. */ }
            restoreFailures = 0;
            lastRestoreErrorGeneration = -1;
            restoreDiagnostic("waiting_binding", "");
        }
        void invalidateSource() {
            sourceRequest++; sourcePending = false; sourceGeneration = -1; sourceAttempts = 0; databaseSource = null;
            if (sourceRetry != null) main.removeCallbacks(sourceRetry); sourceRetry = null;
        }
        void requestSource(ViewGroup expected, int generation) {
            if (sourcePending) return;
            sourcePending = true; sourceAttempts++;
            int request = ++sourceRequest;
            Context sourceContext = expected.getContext();
            LauncherDatabaseIdentity.request(() -> t.source(sourceContext), value -> main.post(() -> {
                if (resetPaused || workspace.get() != expected || generation != bindingGeneration || request != sourceRequest) return;
                try {
                    if (value.valid() && (!matchesBindingSource(value) || !t.currentSource(sourceContext, value))) {
                        value.ownerMatches = false; value.error = "binding_source_changed_after_read";
                    }
                } catch (Exception changed) { value.ownerMatches = false; value.error = "source_recheck_failed"; }
                sourcePending = false; sourceGeneration = generation; databaseSource = value;
                // A transient missing/startup database may appear after native binding.
                // Retry metadata only, with a bounded backoff; a confirmed different file
                // is a real new source and never gets old empty IDs relabeled as current.
                if (value.valid() && restorationApplied()) appliedGeneration = -1;
                requestRestoration(0);
                if (!value.valid() && !"binding_source_changed_after_read".equals(value.error)
                        && t.idpGet != null && !origins().isEmpty() && sourceAttempts < 5) {
                    long[] delays = {1000, 3000, 10000, 30000};
                    sourceRetry = () -> {
                        sourceRetry = null;
                        if (!resetPaused && workspace.get() == expected && bindingGeneration == generation
                                && request == sourceRequest && !sourcePending) requestSource(expected, generation);
                    };
                    main.postDelayed(sourceRetry, delays[Math.min(sourceAttempts - 1, delays.length - 1)]);
                }
            }));
        }
        String sourceSignature() {
            return sourceGeneration == bindingGeneration && matchesBindingSource(databaseSource) ? databaseSource.signature() : "";
        }
        boolean matchesBindingSource(LauncherDatabaseIdentity.Snapshot source) {
            return source != null && bindingSourceIdp != null && source.idp == bindingSourceIdp
                    && java.util.Objects.equals(source.basename, bindingSourceName);
        }
        String origins() { return prefs == null ? "" : prefs.getString("empty_origins", ""); }
        List<Integer> recoveredOrder(List<Integer> live) {
            List<Integer> allowed = keepEmpty() ? LauncherPageOrigins.ids(origins(), sourceSignature()) : Collections.emptyList();
            ArrayList<Integer> trusted = new ArrayList<>();
            for (int id : saved()) if (live.contains(id) || allowed.contains(id)) trusted.add(id);
            return LauncherPageOrder.merge(live, trusted, keepEmpty());
        }
        SharedPreferences nativePreferences() throws Exception {
            return (SharedPreferences) t.nativePrefs.invoke(null, context);
        }
        void checkPendingHomeChange() {
            try {
                if (fallbackHome != null && !fallbackHome.matches(nativePreferences())) homeChangedByUser = true;
            } catch (Throwable error) { restorationFailed(error); }
        }
        void capturePendingHome() {
            checkPendingHomeChange();
            try {
                if (pendingHome == null && !homeChangedByUser) {
                    SharedPreferences nativeRecord = nativePreferences();
                    HomeState original = new HomeState(nativeRecord);
                    if (original.hasId) { pendingHome = original; pendingHomePreferences = nativeRecord; }
                }
            } catch (Throwable error) { restorationFailed(error); }
        }
        void rememberFallbackHome() {
            try {
                if (pendingHome != null && !homeChangedByUser
                        && (fallbackHome != null || !order().contains(pendingHome.id)))
                    fallbackHome = new HomeState(nativePreferences());
            } catch (Throwable error) { restorationFailed(error); }
        }
        boolean restorationApplied() {
            return !resetPaused && prefs != null && appliedPreferences == prefs
                    && appliedGeneration == bindingGeneration && FeatureSettings.hasVerifiedSnapshot(context);
        }
        void cancelRestoration() {
            if (restoreCheck != null) main.removeCallbacks(restoreCheck);
            restoreCheck = null;
        }
        void requestRestoration(long delay) {
            ViewGroup ws = workspace.get();
            if (resetPaused || restorationApplied() || prefs == null || ws == null || restoreCheck != null) return;
            int generation = bindingGeneration;
            restoreCheck = new Runnable() {
                @Override public void run() {
                    if (restoreCheck != this) return;
                    restoreCheck = null;
                    restoreWhenIdle(ws, generation);
                }
            };
            main.postDelayed(restoreCheck, delay);
        }
        void restorationFailed(Throwable error) {
            restoreDiagnostic("blocked", error instanceof PageUnavailable ? error.getMessage() : error.getClass().getSimpleName());
            if (lastRestoreErrorGeneration != bindingGeneration) {
                lastRestoreErrorGeneration = bindingGeneration;
                failed(error);
            }
        }
        void restoreDiagnostic(String state, String reason) {
            if (context == null) return;
            int live = -1;
            try { live = order().size(); } catch (Throwable ignored) { }
            int saved = prefs == null ? -1 : LauncherPageOrder.parse(prefs.getString("order", "")).size();
            FeatureSettings.diagnostic(context, "ls_augment_launcher_pages_restore",
                    "state=" + state + "|generation=" + bindingGeneration + "|savedPageCount=" + saved
                            + "|livePageCount=" + live + "|version=" + ls.augment.com.BuildConfig.VERSION_CODE
                            + "|sourceVerified=" + !sourceSignature().isEmpty()
                            + "|source=" + (databaseSource == null ? "pending" : databaseSource.basename)
                            + "|sourcePathHash=" + (databaseSource == null ? "" : databaseSource.pathHash)
                            + "|sourceStorage=" + (databaseSource == null ? "unknown" : databaseSource.storage)
                            + "|sourceUid=" + (databaseSource == null ? -1 : databaseSource.uid)
                            + "|sourceUser=" + (databaseSource == null ? -1 : databaseSource.user)
                            + "|sourceDisplay=" + (databaseSource == null ? -1 : databaseSource.display)
                            + "|sourceDevice=" + (databaseSource == null ? 0 : databaseSource.device)
                            + "|sourceInode=" + (databaseSource == null ? 0 : databaseSource.inode)
                            + "|sourceError=" + (databaseSource == null ? "" : databaseSource.error)
                            + "|sourceObservedAt=" + (databaseSource == null ? 0 : databaseSource.observedAt)
                            + "|sourceEvidence=worker_file_metadata_and_current_idp"
                            + "|reason=" + reason);
        }
        void checkFixedOrder(List<Integer> before, List<Integer> after) throws Exception {
            for (int id : before) {
                if (id == -200 || id == -201 || !fixed(id)) continue;
                int from = before.indexOf(id), to = after.indexOf(id);
                if (from != to) throw new PageUnavailable("固定桌面页面位置已改变，保留原恢复记录");
                for (int other : before) {
                    if (other != id && (before.indexOf(other) < from) != (after.indexOf(other) < to))
                        throw new PageUnavailable("恢复顺序不能跨越固定桌面页面，保留原恢复记录");
                }
            }
        }
        void checkPageTree(ViewGroup ws, List<Integer> ids) throws Exception {
            if (ids.size() != ws.getChildCount() || ((SparseArray<?>) t.screens.get(ws)).size() != ids.size())
                throw new PageUnavailable("桌面页面尚未完整绑定，保留原恢复记录");
            for (int i = 0; i < ids.size(); i++) {
                if (t.pageAtId.invoke(ws, ids.get(i)) != ws.getChildAt(i))
                    throw new PageUnavailable("桌面页面映射尚未就绪，保留原恢复记录");
            }
        }
        void restoreWhenIdle(ViewGroup expected, int generation) {
            if (resetPaused || restorationApplied() || prefs == null || expected == null
                    || workspace.get() != expected || generation != bindingGeneration || !expected.isAttachedToWindow()
                    || !ready || !bindingSucceeded || binding || mutating) return;
            try {
                if (!FeatureSettings.hasVerifiedSnapshot(context)) {
                    restoreDiagnostic("waiting_configuration", ""); requestRestoration(500); return;
                }
                if ((Boolean) TargetReflection.call(expected, "getIsDragOccuring")
                        || (Boolean) TargetReflection.call(expected, "isPageInTransition")) {
                    restoreDiagnostic("waiting_busy", "");
                    requestRestoration(250);
                    return;
                }
                List<Integer> live = order();
                checkPageTree(expected, live);
                if (sourceGeneration != generation) {
                    restoreDiagnostic("waiting_database_source", ""); requestSource(expected, generation); return;
                }
                if (databaseSource != null && databaseSource.valid() && !t.currentSource(expected.getContext(), databaseSource)) {
                    invalidateSource(); restoreDiagnostic("waiting_database_source", "current_idp_changed");
                    requestSource(expected, generation); return;
                }
                List<Integer> recovered = recoveredOrder(live);
                checkFixedOrder(live, recovered);
                boolean changedOrder = !live.equals(recovered);
                boolean restoreHome = pendingHome != null && fallbackHome != null && !homeChangedByUser
                        && recovered.contains(pendingHome.id) && fallbackHome.matches(nativePreferences());
                if (changedOrder || restoreHome) {
                    if (changedOrder && (Integer) t.panelCount.invoke(expected) != 1)
                        throw new PageUnavailable("多屏桌面模式暂不自动恢复页面，保留原恢复记录");
                    Snapshot before = new Snapshot(this);
                    mutating = true;
                    try {
                        expected.setLayoutTransition(null);
                        if (changedOrder) {
                            for (int i = 0; i < recovered.size(); i++) {
                                int id = recovered.get(i);
                                if (!live.contains(id)) t.insert.invoke(expected, id, i);
                            }
                            ArrayList<View> children = new ArrayList<>();
                            for (int id : recovered) children.add((View) t.pageAtId.invoke(expected, id));
                            for (View child : children) expected.removeView(child);
                            t.replaceIds(t.screenOrder.invoke(expected), recovered);
                            for (int i = 0; i < children.size(); i++) expected.addView(children.get(i), i);
                        }
                        if (restoreHome) before.nativePreferences.edit().putInt("launcher.default_screen_id", pendingHome.id)
                                .putInt("launcher.default_screen", recovered.indexOf(pendingHome.id)).apply();
                        refresh(before.currentId);
                        checkPageTree(expected, recovered);
                        if (!order().equals(recovered)) throw new IllegalStateException("桌面恢复顺序未生效");
                    } catch (Throwable error) {
                        before.restore(this, true);
                        throw error;
                    } finally { expected.setLayoutTransition(before.transition); mutating = false; }
                }
                if (workspace.get() != expected || generation != bindingGeneration || resetPaused || !ready) return;
                appliedPreferences = prefs;
                appliedGeneration = generation;
                pendingHome = null;
                fallbackHome = null;
                pendingHomePreferences = null;
                homeChangedByUser = false;
                cancelRestoration();
                restoreFailures = 0;
                restoreDiagnostic("applied", recovered.containsAll(saved()) ? "" : "unproven_missing_pages_retained_in_record");
                scheduleCleanup();
                configurationChanged();
            } catch (Throwable error) {
                restorationFailed(error);
                long[] delays = {1000, 3000, 10000, 30000};
                if (ready) requestRestoration(delays[Math.min(restoreFailures++, delays.length - 1)]);
            }
        }
        boolean enabled(String key) { return !resetPaused && context != null && prefs != null && FeatureSettings.enabled(context, key); }
        boolean keepEmpty() {
            return !resetPaused && prefs != null && LauncherPageOrder.preserveEmpty(FeatureSettings.hasVerifiedSnapshot(context),
                    enabled(LauncherOptions.KEEP_EMPTY), prefs.getBoolean("keep_empty", false));
        }
        List<Integer> saved() { return resetPaused || prefs == null ? Collections.emptyList() : LauncherPageOrder.parse(prefs.getString("order", "")); }
        List<Integer> order() throws Exception {
            ViewGroup ws = workspace.get();
            return ws == null ? Collections.emptyList() : t.ids(t.screenOrder.invoke(ws));
        }
        void scheduleCleanup() {
            main.removeCallbacks(cleanup);
            if (restorationApplied() && ready && !binding && !mutating && keepEmpty()) main.postDelayed(cleanup, 250);
        }
        void cleanupPlaceholders() {
            ViewGroup ws = workspace.get();
            if (!restorationApplied() || ws == null || !ws.isAttachedToWindow() || !ready || binding || mutating || !keepEmpty()) return;
            try {
                List<Integer> order = order();
                if (!order.contains(-201) && !order.contains(-200)) return;
                if (order.stream().filter(id -> id >= 0).count() < (Integer) t.panelCount.invoke(ws)) return;
                if ((Boolean) TargetReflection.call(ws, "getIsDragOccuring") || (Boolean) TargetReflection.call(ws, "isPageInTransition")) {
                    scheduleCleanup();
                    return;
                }
                // Native G2 checks loading and the protected edit substates itself.
                t.removeExtra.invoke(ws, 0, false, null);
                save();
            } catch (Throwable error) { failed(error); }
        }
        void configurationChanged() {
            try {
                boolean awaitingPrivate = prefs == null;
                if (awaitingPrivate && context != null)
                    prefs = LauncherOwnedStateClient.readyPreferences(context,"pages");
                if(resetPaused){
                    if(!FeatureSettings.hasVerifiedSnapshot(context)||FeatureSettings.snapshot(context).revision==resetRevision)return;
                    resetPaused=false;
                }
                ViewGroup menuView = menu.get();
                if (menuView != null) attachMenu(menuView);
                ViewGroup ws = workspace.get();
                if (ws == null || !ready || binding || mutating) {
                    if (prefs != null && !restorationApplied()) restoreDiagnostic("waiting_binding", "");
                    return;
                }
                // Acquiring a record never grants permission to save the native fallback.
                if (!restorationApplied()) { requestRestoration(0); return; }
                boolean before = prefs.getBoolean("keep_empty", false);
                boolean after = enabled(LauncherOptions.KEEP_EMPTY);
                if (before && !after) {
                    if (editor != null) editor.dismiss();
                    t.strip.invoke(ws);
                } else if (!after && !enabled(LauncherOptions.PAGE_REORDER) && editor != null) {
                    editor.dismiss();
                }
                save();
            } catch (Throwable error) { failed(error); }
        }
        void save() {
            save(null, -1);
        }
        void save(String nextOrigins, int deletedId) {
            if (!restorationApplied() || !ready || binding || mutating) return;
            if (!prefs.contains("order") && !enabled(LauncherOptions.PAGE_REORDER) && !enabled(LauncherOptions.KEEP_EMPTY)) return;
            try {
                boolean keep = keepEmpty();
                // Unproven old IDs are quarantined, not erased or promoted to manual
                // origins by an ordinary native bind/drag/strip callback.
                List<Integer> current = order();
                List<Integer> original = new ArrayList<>(saved());
                if (deletedId >= 0 && !LauncherPageOrigins.referencedByOtherSource(
                        nextOrigins == null ? origins() : nextOrigins, sourceSignature(), deletedId)) original.remove(Integer.valueOf(deletedId));
                List<Integer> retained = LauncherPageOrder.retainMissing(current, original);
                if (retained.size() > LauncherPageOrder.MAX_PAGES) {
                    restoreDiagnostic("record_preserved", "order_capacity"); return;
                }
                String order = LauncherPageOrder.encode(retained);
                if (nextOrigins != null || !order.equals(prefs.getString("order", "")) || keep != prefs.getBoolean("keep_empty", false)
                        ||LauncherOwnedStateClient.needsSave(prefs)) {
                    SharedPreferences.Editor edit = prefs.edit().putString("order", order).putBoolean("keep_empty", keep);
                    if (nextOrigins != null) edit.putString("empty_origins", nextOrigins);
                    edit.apply();
                }
            } catch (Throwable error) { failed(error); }
        }
        void attachMenu(ViewGroup container) {
            try {
                Object owner = t.menuOwner.get(container);
                if (t.launcher.isInstance(owner)) {
                    ViewGroup expected = (ViewGroup) t.workspace.invoke(owner);
                    if (workspace.get() != null && workspace.get() != expected) {
                        LinearLayout oldRow = (LinearLayout) t.menuItems.get(container);
                        if (oldRow != null) for (int i = 0; i < oldRow.getChildCount(); i++) {
                            View child = oldRow.getChildAt(i);
                            if (ENTRY_TAG.equals(child.getTag())) { child.setVisibility(View.GONE); child.setOnClickListener(null); }
                            LinearLayout.LayoutParams original = menuLayouts.remove(child);
                            if (original != null) child.setLayoutParams(original);
                        }
                        return;
                    }
                    attach(expected);
                }
                menu = new WeakReference<>(container);
                LinearLayout row = (LinearLayout) t.menuItems.get(container);
                if (row == null) return;
                TextView entry = row.findViewWithTag(ENTRY_TAG);
                boolean enabled = enabled(LauncherOptions.PAGE_REORDER) || enabled(LauncherOptions.KEEP_EMPTY);
                if (entry == null && enabled) {
                    entry = new TextView(container.getContext());
                    entry.setTag(ENTRY_TAG);
                    entry.setText("页面");
                    entry.setGravity(Gravity.CENTER);
                    entry.setMinHeight(dp(76));
                    entry.setPadding(dp(4), dp(4), dp(4), dp(4));
                    entry.setTextSize(12);
                    entry.setContentDescription("管理桌面页面");
                    row.addView(entry, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
                }
                if (entry == null) return;
                final ViewGroup entryWorkspace = workspace.get();
                entry.setOnClickListener(view -> {
                    if (workspace.get() != entryWorkspace) { notifyUser("桌面已刷新，请重新打开页面管理"); return; }
                    showEditor(container.getContext());
                });
                TextView reference = null;
                for (int i = 0; i < row.getChildCount(); i++) {
                    View child = row.getChildAt(i);
                    if (child != entry && child instanceof TextView) { reference = (TextView) child; break; }
                }
                if (reference != null) {
                    entry.setTextColor(reference.getTextColors());
                    entry.setTextSize(TypedValue.COMPLEX_UNIT_PX, reference.getTextSize());
                }
                LauncherPagesEntry.style(entry, reference);
                LinearLayout.LayoutParams layout = (LinearLayout.LayoutParams) entry.getLayoutParams();
                boolean vertical = row.getOrientation() == LinearLayout.VERTICAL;
                LinearLayout.LayoutParams referenceLayout = reference != null && reference.getLayoutParams() instanceof LinearLayout.LayoutParams
                        ? (LinearLayout.LayoutParams) reference.getLayoutParams() : null;
                layout.width = vertical ? ViewGroup.LayoutParams.MATCH_PARENT : referenceLayout == null ? dp(76) : referenceLayout.width;
                layout.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                layout.weight = vertical ? 0 : referenceLayout == null ? 1 : referenceLayout.weight;
                entry.setLayoutParams(layout);
                entry.setVisibility(enabled ? View.VISIBLE : View.GONE);
                // Native items each reserve 76dp before weights are applied. Share the
                // available width equally when the fifth item is present, including RTL.
                for (int i = 0; i < row.getChildCount(); i++) {
                    View child = row.getChildAt(i);
                    if (child == entry || !(child.getLayoutParams() instanceof LinearLayout.LayoutParams)) continue;
                    LinearLayout.LayoutParams original = (LinearLayout.LayoutParams) child.getLayoutParams();
                    if (enabled && !vertical) {
                        if (!menuLayouts.containsKey(child)) menuLayouts.put(child, new LinearLayout.LayoutParams(original));
                        LinearLayout.LayoutParams shared = new LinearLayout.LayoutParams(original);
                        shared.width = 0;
                        shared.weight = 1;
                        child.setLayoutParams(shared);
                    } else {
                        LinearLayout.LayoutParams restore = menuLayouts.remove(child);
                        if (restore != null) child.setLayoutParams(restore);
                    }
                }
                if (enabled && !vertical) {
                    layout.width = 0;
                    layout.weight = 1;
                    entry.setLayoutParams(layout);
                }
            } catch (Throwable error) { failed(error); }
        }
        int dp(int value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }
        void failed(Throwable error) { module.logFeatureError("LAUNCHER_PAGES", error); }
        void notifyUser(String text) { if (context != null) Toast.makeText(context, text, Toast.LENGTH_SHORT).show(); }

        boolean fixed(int id) throws Exception {
            if (id < 0) return true;
            ViewGroup ws = workspace.get();
            Object launcher = t.launcherField.get(ws);
            if (id == 0 && t.firstPageFixed(launcher)) return true;
            // AIFutureWidgetUtils owns this page and always inserts it at the first position.
            Object futureId = t.future == null ? null : TargetReflection.call(t.future, t.futureMethod, context);
            return futureId instanceof Integer && (Integer) futureId > 0 && id == (Integer) futureId;
        }
        boolean empty(int id) throws Exception {
            Object page = t.pageAtId.invoke(workspace.get(), id);
            return page != null && ((ViewGroup) t.shortCuts.invoke(page)).getChildCount() == 0;
        }
        void checkEditable() throws Exception {
            ViewGroup ws = workspace.get();
            if (!restorationApplied() || ws == null || !ws.isAttachedToWindow() || !ready || binding || mutating
                    || (Boolean) TargetReflection.call(ws, "getIsDragOccuring")
                    || (Boolean) TargetReflection.call(ws, "isPageInTransition")) {
                throw new PageUnavailable("桌面正在更新，请稍后再试");
            }
            if ((Integer) t.panelCount.invoke(ws) != 1) throw new PageUnavailable("请在单屏桌面模式下管理页面");
        }
        View pageView(int id) throws Exception { return (View) t.pageAtId.invoke(workspace.get(), id); }
        int currentPageId() throws Exception {
            List<Integer> ids = order();
            int index = (Integer) t.currentPage.invoke(workspace.get());
            return index >= 0 && index < ids.size() ? ids.get(index) : -1;
        }
        boolean canMovePage(int fromId, int toId) throws Exception {
            List<Integer> ids = order();
            int from = ids.indexOf(fromId), to = ids.indexOf(toId);
            if (from < 0 || to < 0 || from == to) return false;
            for (int i = Math.min(from, to); i <= Math.max(from, to); i++) if (fixed(ids.get(i))) return false;
            return true;
        }
        void move(int fromId, int toId) throws Exception {
            checkEditable();
            if (!enabled(LauncherOptions.PAGE_REORDER)) return;
            List<Integer> order = order();
            int from = order.indexOf(fromId), to = order.indexOf(toId);
            if (from < 0 || to < 0 || from == to || fixed(fromId) || fixed(toId)) return;
            for (int i = Math.min(from, to); i <= Math.max(from, to); i++) if (fixed(order.get(i))) return;
            ViewGroup ws = workspace.get();
            int current = (Integer) t.currentPage.invoke(ws);
            int currentId = current >= 0 && current < order.size() ? order.get(current) : fromId;
            View child = (View) t.pageAtId.invoke(ws, fromId);
            if (child == null || ws.indexOfChild(child) != from || order.size() != ws.getChildCount()) throw new IllegalStateException("桌面页面尚未就绪");
            Snapshot before = new Snapshot(this);
            mutating = true;
            try {
                ws.setLayoutTransition(null);
                ws.removeView(child);
                order = LauncherPageOrder.move(order, fromId, toId);
                t.replaceIds(t.screenOrder.invoke(ws), order);
                ws.addView(child, to);
                refresh(currentId);
            } catch (Exception error) {
                before.restore(this);
                throw error;
            } finally { ws.setLayoutTransition(before.transition); mutating = false; }
            save();
        }
        void add(int id) throws Exception {
            checkEditable();
            if (!enabled(LauncherOptions.KEEP_EMPTY)) return;
            List<Integer> order = order();
            if (order.stream().filter(value -> value >= 0).count() >= LauncherPageOrder.MAX_PAGES)
                throw new PageUnavailable("桌面页面已达到上限");
            java.util.HashSet<Integer> retainedIds = new java.util.HashSet<>(saved());
            for (int existing : order) if (existing >= 0) retainedIds.add(existing);
            if (retainedIds.size() >= LauncherPageOrder.MAX_PAGES) throw new PageUnavailable("页面恢复记录已达到上限，请先处理已有页面");
            if (id < 0 || order.contains(id) || saved().contains(id)) throw new PageUnavailable("页面已更新，请重新新增");
            String source = sourceSignature();
            if (source.isEmpty() || !t.currentSource(workspace.get().getContext(), databaseSource)) throw new PageUnavailable("尚未确认桌面数据来源，请稍后再试");
            String nextOrigins = LauncherPageOrigins.add(origins(), source, id);
            int index = order.size();
            while (index > 0 && order.get(index - 1) < 0) index--;
            ViewGroup ws = workspace.get();
            Snapshot before = new Snapshot(this);
            mutating = true;
            try {
                ws.setLayoutTransition(null);
                t.insert.invoke(ws, id, index);
                refresh(id);
            } catch (Exception error) {
                before.restore(this);
                throw error;
            } finally { ws.setLayoutTransition(before.transition); mutating = false; }
            save(nextOrigins, -1);
        }
        void delete(int id) throws Exception {
            checkEditable();
            if (!enabled(LauncherOptions.KEEP_EMPTY) || fixed(id) || !empty(id)) return;
            List<Integer> order = order();
            int index = order.indexOf(id);
            long pages = order.stream().filter(value -> value >= 0).count();
            if (index < 0 || pages <= 1) return;
            ViewGroup ws = workspace.get();
            View child = (View) t.pageAtId.invoke(ws, id);
            if (child == null || ws.indexOfChild(child) != index) return;
            int current = (Integer) t.currentPage.invoke(ws);
            int currentId = current >= 0 && current < order.size() ? order.get(current) : id;
            Snapshot before = new Snapshot(this);
            mutating = true;
            try {
                ws.setLayoutTransition(null);
                ws.removeView(child);
                ((SparseArray<?>) t.screens.get(ws)).remove(id);
                order.remove(index);
                t.replaceIds(t.screenOrder.invoke(ws), order);
                refresh(currentId == id ? order.get(Math.min(index, order.size() - 1)) : currentId);
            } catch (Exception error) {
                before.restore(this);
                throw error;
            } finally { ws.setLayoutTransition(before.transition); mutating = false; }
            save(LauncherPageOrigins.remove(origins(), sourceSignature(), id), id);
        }
        void refresh(int selectedId) throws Exception {
            ViewGroup ws = workspace.get();
            Object launcher = t.launcherField.get(ws);
            t.refreshDefault.invoke(t.screenUtil.invoke(launcher), ws);
            int index = LauncherPageOrder.selectedIndex(order(), selectedId, 0);
            t.setCurrentPage.invoke(ws, index);
            Object nativeState = TargetReflection.call(TargetReflection.call(launcher, "getStateManager"), t.stateValue);
            TargetReflection.call(ws, "setState", nativeState);
            t.updateIndicator.invoke(ws);
            ws.requestLayout();
            ws.invalidate();
        }
        void showEditor(Context activityContext) {
            if (pending || (editor != null && editor.isShowing())) return;
            if (!enabled(LauncherOptions.PAGE_REORDER) && !enabled(LauncherOptions.KEEP_EMPTY)) return;
            perform(() -> {
                if (!enabled(LauncherOptions.PAGE_REORDER) && !enabled(LauncherOptions.KEEP_EMPTY)) return;
                ViewGroup sourceMenu = menu.get();
                if (sourceMenu != null && !sourceMenu.isShown()) throw new PageUnavailable("请先长按桌面进入编辑模式");
                editor = new LauncherPagesEditor(this, activityContext);
                editor.show();
            }, () -> {}, this::notifyUser);
        }

        /** One pending intent; wait for native animations, never retry an applied mutation. */
        void perform(Action action, Runnable onSuccess, Consumer<String> onFailure) {
            if(resetPaused){onFailure.accept("模块正在重置，请稍候");return;}
            if (!restorationApplied() && !(prefs != null && !ready && (binding || bindingSucceeded))) {
                requestRestoration(0); onFailure.accept("页面恢复尚未完成，请稍后再试"); return;
            }
            if (pending) { onFailure.accept("正在处理页面，请稍候"); return; }
            pending = true;
            int token = ++requestToken;
            awaitEditable(token, workspace.get(), bindingGeneration, 0, () -> {
                action.run();
                finish(token, onSuccess);
            }, onFailure);
        }
        void addPage(Runnable onSuccess, Consumer<String> onFailure) {
            if(resetPaused){onFailure.accept("模块正在重置，请稍候");return;}
            if (!restorationApplied() && !(prefs != null && !ready && (binding || bindingSucceeded))) {
                requestRestoration(0); onFailure.accept("页面恢复尚未完成，请稍后再试"); return;
            }
            if (pending) { onFailure.accept("正在处理页面，请稍候"); return; }
            if (!enabled(LauncherOptions.KEEP_EMPTY)) { onFailure.accept("请先开启允许空白桌面"); return; }
            pending = true;
            int token = ++requestToken;
            ViewGroup expected = workspace.get();
            int generation = bindingGeneration;
            awaitEditable(token, expected, generation, 0, () -> {
                // The OEM query runs on its model queue. Empty pages exist only in the
                // live/persisted order, so F() can legitimately return the same bound.
                t.modelExecutor.execute(() -> {
                    try {
                        if(resetPaused||token!=requestToken||!pending)return;
                        Object state = t.stateGet.invoke(null, context);
                        Object model = t.modelGet.invoke(state);
                        LauncherDatabaseIdentity.Snapshot source = t.source(expected.getContext());
                        if (!source.valid()) throw new PageUnavailable("尚未确认桌面数据来源，请稍后再试");
                        int minimum = (Integer) t.nextId.invoke(t.databaseGet.invoke(model));
                        main.post(() -> awaitEditable(token, expected, generation, 0, () -> {
                            if (!enabled(LauncherOptions.KEEP_EMPTY)) throw new PageUnavailable("允许空白桌面已关闭");
                            if (!matchesBindingSource(source) || !t.currentSource(expected.getContext(), source)) throw new PageUnavailable("桌面数据来源已改变，请重新新增");
                            String confirmedSource = sourceSignature();
                            if (!confirmedSource.isEmpty() && !confirmedSource.equals(source.signature()))
                                throw new PageUnavailable("桌面数据文件已更换，请等待桌面重新加载后再新增");
                            databaseSource = source; sourceGeneration = generation;
                            int id = LauncherPageOrder.nextAvailableId(minimum, order(), saved());
                            if (id < 0) throw new PageUnavailable("无法分配新的页面编号");
                            add(id);
                            finish(token, onSuccess);
                        }, onFailure));
                    } catch (Throwable error) { main.post(() -> reject(token, error, onFailure)); }
                });
                // A stalled loader must not leave every editor control disabled forever.
                pendingCheck = () -> reject(token, new PageUnavailable("桌面加载较慢，请稍后重试"), onFailure);
                main.postDelayed(pendingCheck, 5000);
            }, onFailure);
        }
        void awaitEditable(int token, ViewGroup expected, int generation, int attempts,
                           Action action, Consumer<String> onFailure) {
            if (resetPaused || !pending || token != requestToken) return;
            if (pendingCheck != null) main.removeCallbacks(pendingCheck);
            pendingCheck = null;
            try {
                if (expected == null || workspace.get() != expected || !expected.isAttachedToWindow()
                        || generation != bindingGeneration) throw new PageUnavailable("桌面已刷新，请重新打开页面管理");
                if ((Integer) t.panelCount.invoke(expected) != 1) throw new PageUnavailable("请在单屏桌面模式下管理页面");
                boolean busy = !restorationApplied() || !ready || binding || mutating
                        || (Boolean) TargetReflection.call(expected, "getIsDragOccuring")
                        || (Boolean) TargetReflection.call(expected, "isPageInTransition");
                if (busy) {
                    if (attempts >= 24) throw new PageUnavailable("桌面仍在更新，请稍后重试");
                    pendingCheck = () -> awaitEditable(token, expected, generation, attempts + 1, action, onFailure);
                    main.postDelayed(pendingCheck, 80);
                    return;
                }
                pendingCheck = null;
                action.run();
            } catch (Throwable error) { reject(token, error, onFailure); }
        }
        void finish(int token, Runnable onSuccess) {
            if (!pending || token != requestToken) return;
            pending = false;
            if (pendingCheck != null) main.removeCallbacks(pendingCheck);
            pendingCheck = null;
            onSuccess.run();
        }
        void reject(int token, Throwable error, Consumer<String> onFailure) {
            if (!pending || token != requestToken) return;
            pending = false;
            if (pendingCheck != null) main.removeCallbacks(pendingCheck);
            pendingCheck = null;
            while (error instanceof InvocationTargetException && error.getCause() != null) error = error.getCause();
            if (!(error instanceof PageUnavailable)) failed(error);
            onFailure.accept(error instanceof PageUnavailable ? error.getMessage()
                    : ready ? "操作未完成，请重新打开页面管理后重试" : "页面尚未就绪，请重启桌面后再操作");
        }
        void cancelPending() {
            requestToken++;
            pending = false;
            if (pendingCheck != null) main.removeCallbacks(pendingCheck);
            pendingCheck = null;
        }
    }

    private static final class PageUnavailable extends IllegalStateException {
        PageUnavailable(String message) { super(message); }
    }

    /** Remember an OEM fallback only in this workspace; later user home choices win. */
    private static final class HomeState {
        final boolean hasId, hasIndex;
        final int id, index;
        HomeState(SharedPreferences preferences) {
            hasId = preferences.contains("launcher.default_screen_id");
            hasIndex = preferences.contains("launcher.default_screen");
            id = preferences.getInt("launcher.default_screen_id", -1);
            index = preferences.getInt("launcher.default_screen", -1);
        }
        boolean matches(SharedPreferences preferences) {
            return hasId == preferences.contains("launcher.default_screen_id")
                    && hasIndex == preferences.contains("launcher.default_screen")
                    && id == preferences.getInt("launcher.default_screen_id", -1)
                    && index == preferences.getInt("launcher.default_screen", -1);
        }
    }

    /** Roll back native page objects as well as IDs if a launcher callback rejects a mutation. */
    private static final class Snapshot {
        final List<Integer> order;
        final List<View> children = new ArrayList<>();
        final SparseArray<Object> pages;
        final LayoutTransition transition;
        final int currentId;
        final SharedPreferences nativePreferences;
        final boolean hasHomeId, hasHomeIndex;
        final int homeId, homeIndex;
        @SuppressWarnings("unchecked") Snapshot(Controller c) throws Exception {
            ViewGroup ws = c.workspace.get();
            order = c.order();
            for (int i = 0; i < ws.getChildCount(); i++) children.add(ws.getChildAt(i));
            pages = ((SparseArray<Object>) c.t.screens.get(ws)).clone();
            transition = ws.getLayoutTransition();
            int current = (Integer) c.t.currentPage.invoke(ws);
            currentId = current >= 0 && current < order.size() ? order.get(current) : order.get(0);
            nativePreferences = (SharedPreferences) c.t.nativePrefs.invoke(null, c.context);
            hasHomeId = nativePreferences.contains("launcher.default_screen_id");
            hasHomeIndex = nativePreferences.contains("launcher.default_screen");
            homeId = nativePreferences.getInt("launcher.default_screen_id", -1);
            homeIndex = nativePreferences.getInt("launcher.default_screen", -1);
        }
        void restore(Controller c) { restore(c, false); }
        void report(Controller c, Throwable error, boolean recovery) {
            if (recovery) c.restorationFailed(error); else c.failed(error);
        }
        @SuppressWarnings("unchecked") void restore(Controller c, boolean recovery) {
            ViewGroup ws = c.workspace.get();
            if (ws == null) { c.ready = false; return; }
            // A failing view callback must not prevent restoration of the remaining pages.
            ArrayList<View> liveChildren = new ArrayList<>();
            for (int i = 0; i < ws.getChildCount(); i++) liveChildren.add(ws.getChildAt(i));
            for (View child : liveChildren) {
                try { ws.removeView(child); } catch (Throwable error) { report(c, error, recovery); }
            }
            try {
                SparseArray<Object> live = (SparseArray<Object>) c.t.screens.get(ws);
                live.clear();
                for (int i = 0; i < pages.size(); i++) live.put(pages.keyAt(i), pages.valueAt(i));
            } catch (Throwable error) { report(c, error, recovery); }
            try {
                c.t.replaceIds(c.t.screenOrder.invoke(ws), order);
            } catch (Throwable error) { report(c, error, recovery); }
            for (int i = 0; i < children.size(); i++) {
                View child = children.get(i);
                try {
                    if (child.getParent() == ws && ws.indexOfChild(child) != i) ws.removeView(child);
                    if (child.getParent() == null) ws.addView(child, Math.min(i, ws.getChildCount()));
                } catch (Throwable error) { report(c, error, recovery); }
            }
            try {
                SharedPreferences.Editor edit = nativePreferences.edit();
                if (hasHomeId) edit.putInt("launcher.default_screen_id", homeId); else edit.remove("launcher.default_screen_id");
                if (hasHomeIndex) edit.putInt("launcher.default_screen", homeIndex); else edit.remove("launcher.default_screen");
                edit.apply();
            } catch (Throwable error) { report(c, error, recovery); }
            try {
                // Restore the current page even if the optional visual refresh fails again.
                c.t.setCurrentPage.invoke(ws, LauncherPageOrder.selectedIndex(order, currentId, 0));
                ws.requestLayout();
                ws.invalidate();
                try { c.refresh(currentId); } catch (Exception error) { report(c, error, recovery); }
            } catch (Throwable error) { report(c, error, recovery); }
            try {
                if (!order.equals(c.order()) || ws.getChildCount() != children.size()) throw new IllegalStateException("页面顺序未恢复");
                SparseArray<Object> live = (SparseArray<Object>) c.t.screens.get(ws);
                if (live.size() != pages.size()) throw new IllegalStateException("页面映射未恢复");
                for (int i = 0; i < children.size(); i++) if (ws.getChildAt(i) != children.get(i)) throw new IllegalStateException("页面视图未恢复");
                for (int i = 0; i < pages.size(); i++) if (live.get(pages.keyAt(i)) != pages.valueAt(i)) throw new IllegalStateException("页面身份未恢复");
            } catch (Throwable error) {
                c.ready = false;
                report(c, error, recovery);
                c.notifyUser("页面恢复未完成，请重新启动桌面后再操作");
            }
        }
    }

    interface Action { void run() throws Exception; }

    private LauncherPagesHook() {}
}
