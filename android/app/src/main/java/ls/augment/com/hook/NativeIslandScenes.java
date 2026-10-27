package ls.augment.com.hook;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.ContentValues;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.app.KeyguardManager;
import android.app.Notification;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.Bundle;
import android.os.SystemClock;
import ls.augment.com.NativeIslandSceneOptions;
import android.provider.Settings;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ImageView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Opt-in completion of existing OEM scenes while the ordinary native host owns them. */
final class NativeIslandScenes {
    private static final String OEM = "com.zte.feature.dynamicisland.";
    private static final String CAPSULE = "com.zte.feature.callnotify.CallLayout";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, Boolean> CAPSULES = Collections.synchronizedMap(new WeakHashMap<>());

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static volatile NativeIslandScenes selected;
    private static boolean capsuleReady;
    private static java.lang.ref.WeakReference<NotificationListenerService> notifications = new java.lang.ref.WeakReference<>(null);
    private final Context context;
    private final ClassLoader loader;
    private final Object manager, permanent, record, torch, countdown, media;
    private final View root;
    private final Runnable capsuleRefresh = this::refreshCapsules;
    private final Runnable torchRefresh = this::syncTorch;
    private final Runnable changed = this::stateChanged;
    private final Runnable recordRefresh = this::syncRecorder;
    private final Map<Object, View> panels = new java.util.IdentityHashMap<>();
    private final java.util.Set<String> enhancedScenes = new java.util.HashSet<>();
    private final java.util.Set<String> supportedScenes = new java.util.HashSet<>();
    private Object controller, listener;
    private Method enabled, available, addListener, removeListener;
    private boolean torchListening;
    private NativeIslandCountdown countdownBridge;
    private NativeIslandMedia mediaBridge;
    private NativeIslandCards cardsBridge;
    private int panelWindowBefore = -1, panelWindowApplied = -1;
    private Method visibleState;
    private volatile boolean closed;
    private boolean suppressing, receiving;
    private int torchAddRequests;
    private Context recordContext;
    private Uri recordUri;
    private Uri recordCountUri;
    private boolean observingRecord;
    private int recordSource = -1;
    private String lastPausedCache = "";
    private String recoveryState = "none";
    private String torchCapability = "unavailable", recordCapability = "unavailable", countdownCapability = "unavailable",
            mediaCapability = "unavailable", countdownState = "idle", lastReport = "";
    private long recorderProbeAt;
    private final View.OnAttachStateChangeListener rootLifecycle = new View.OnAttachStateChangeListener() {
        @Override public void onViewAttachedToWindow(View view) { }
        @Override public void onViewDetachedFromWindow(View view) { close(); }
    };
    private final BroadcastReceiver environment = new BroadcastReceiver() {
        @Override public void onReceive(Context ignored, Intent intent) {
            recorderProbeAt=0;
            configurationChanged();
            syncEnvironment();
            MAIN.removeCallbacks(torchRefresh); MAIN.post(torchRefresh);
            MAIN.removeCallbacks(recordRefresh); MAIN.post(recordRefresh);
            scheduleChanged();
        }
    };
    private final ContentObserver recordObserver = new ContentObserver(MAIN) {
        @Override public void onChange(boolean selfChange) {
            MAIN.removeCallbacks(recordRefresh); MAIN.post(recordRefresh);
        }
    };

    static int install(AugmentModule module, ClassLoader loader) {
        int count = 0;
        try {
            Class<?> type = Class.forName(OEM + "PermanentIslandManager", false, loader);
            Method click = NativeIslandSceneContract.method(type, "onClick", void.class);
            Method throttle = NativeIslandSceneContract.method(type, "forceNotClick", boolean.class);
            Method show = NativeIslandSceneContract.method(type, "showPermanentPanelIsland", void.class);
            if (click != null && throttle != null && show != null) {
                module.registerFeatureHook(module.prepareFeatureHook(click, "rm.ui.native_scene.click_panel", false).intercept(chain -> {
                    NativeIslandScenes owner = selected;
                    if (owner != null && chain.getThisObject() == owner.permanent && owner.usable()) {
                        Object island = call(owner.permanent, "getPermanentIsland");
                        Object state = field(island, "mCurState");
                        if (owner.completedPanel(island) != null
                                && !Boolean.TRUE.equals(field(owner.permanent, "mOnKeyguard"))
                                && state instanceof Integer && owner.visibleState != null
                                && Boolean.TRUE.equals(owner.visibleState.invoke(null, state))) {
                            if (!Boolean.TRUE.equals(throttle.invoke(owner.permanent))) show.invoke(owner.permanent);
                            return null;
                        }
                    }
                    return chain.proceed(chain.getArgs().toArray());
                }));
                count++;
            }
        } catch (Throwable missing) { module.logFeatureError("NATIVE_SCENE_CLICK_PANEL", missing); }
        for (String name : new String[]{"FlashlightIsland", "RecorderIsland", "CountDownIsland", "MediaIsland"}) {
            try {
                Class<?> type = Class.forName(OEM + "islands." + name, false, loader);
                Class<?> base = Class.forName(OEM + "DynamicPermanentIsland", false, loader);
                Method getter = NativeIslandSceneContract.method(type, "getPanelIsland", base);
                if (getter == null) { module.logFeatureInfo("NATIVE_SCENE_MISSING " + name + ".getPanelIsland"); continue; }
                module.registerFeatureHook(module.prepareFeatureHook(getter,
                        "rm.ui.native_scene.panel." + name, false).intercept(chain -> {
                    Object original = chain.proceed(chain.getArgs().toArray());
                    NativeIslandScenes owner = selected;
                    if (original != null || owner == null) return original;
                    View panel = owner.completedPanel(chain.getThisObject());
                    return panel == null ? original : panel;
                }));
                count++;
            } catch (Throwable absent) { module.logFeatureError("NATIVE_SCENE_PANEL_" + name, absent); }
        }
        for (String name : new String[]{"addPermanentIslandInner", "removePermanentIslandInner",
                "handleDynamicIslandChanged", "onDynamicIslandSettingsChanged",
                "onPermanentIslandAnimationEnd",
                "onPermanentIslandPanelOpenAnimationStart", "onPermanentIslandPanelOpenAnimationEnd", "onPermanentIslandPanelCloseAnimationEnd",
                "onKeyguardStateChanged", "onRotationStateChangedInner",
                "setControlPanelExpanded", "setQsPanelExpanded"}) {
            count += hookNamed(module, loader, "native_scene", OEM + "PermanentIslandManager", name, -1,
                    null, (object, arguments, result) -> {
                        NativeIslandScenes owner = selected;
                        if (owner != null && object == owner.permanent) {
                            if (name.equals("addPermanentIslandInner") && arguments.length > 0 && arguments[0] == owner.torch)
                                owner.torchAddRequests++;
                            if (owner.hasEnhancements() && (name.equals("setControlPanelExpanded") || name.equals("setQsPanelExpanded"))
                                    && arguments.length > 0 && Boolean.TRUE.equals(arguments[0])) owner.closeOrdinaryPanel();
                            owner.scheduleChanged();
                        }
                        return PASS;
                    });
        }
        count += hookNamed(module, loader, "native_scene", OEM + "DynamicIslandManager",
                "handleRemoveIsland", 1, null, (object, arguments, result) -> {
                    NativeIslandScenes owner = selected;
                    if (owner != null && object == owner.manager) owner.foregroundChanged();
                    return PASS;
                });
        count += hookNamed(module, loader, "native_scene", OEM + "DynamicIslandManager",
                "onStartedWakingUp", 0, null, (object, arguments, result) -> {
                    NativeIslandScenes owner = selected;
                    if (owner != null && object == owner.manager) {
                        MAIN.removeCallbacks(owner.torchRefresh); MAIN.post(owner.torchRefresh);
                        if (owner.countdownBridge != null) owner.countdownBridge.request();
                        owner.scheduleChanged();
                    }
                    return PASS;
                });
        count += hookNamed(module, loader, "native_scene", OEM + "PermanentIslandManager",
                "onStartedGoingToSleep", 0, (object, arguments, result) -> {
                    NativeIslandScenes owner = selected;
                    if (owner == null || !owner.hasEnhancements() || object != owner.permanent
                            || field(object, "mStickyAnimationView") != null) return PASS;
                    // This ordinary layout has no full-screen sticky/background views.
                    // Keep its own ordinary close animation and sleep visibility path.
                    set(object, "mInteractive", false);
                    if (Boolean.TRUE.equals(field(object, "mDynamicPanelShowing"))) {
                        Object island = call(object, "getPermanentIsland");
                        if (island != null) call(field(object, "mDynamicAnimation"),
                                "startPermanentPanelCloseAnimation", island, false, false);
                    }
                    call(object, "updateRooterVisibility"); owner.scheduleChanged(); return null;
                }, null);
        for (String method : new String[]{"onListenerConnected", "onNotificationPosted", "onNotificationRemoved"}) {
            count += hookNamed(module, loader, "native_scene", "com.android.systemui.statusbar.NotificationListener",
                    method, method.equals("onListenerConnected") ? 0 : method.equals("onNotificationPosted") ? 2 : 3,
                    null, (object, arguments, result) -> {
                        if (!(object instanceof NotificationListenerService)) return PASS;
                        notifications = new java.lang.ref.WeakReference<>((NotificationListenerService) object);
                        NativeIslandScenes owner = selected;
                        if (owner != null && (arguments.length == 0 || (arguments[0] instanceof StatusBarNotification
                                && "cn.zte.recorder".equals(((StatusBarNotification) arguments[0]).getPackageName())))) {
                            MAIN.removeCallbacks(owner.recordRefresh); MAIN.post(owner.recordRefresh);
                        }
                        return PASS;
                    });
        }
        return count + installCapsules(module, loader) + NativeIslandMedia.install(module, loader)
                + NativeIslandCards.install(module, loader);
    }

    private static int installCapsules(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> type = Class.forName(CAPSULE, false, loader);
            Field recording = NativeIslandSceneContract.field(type, "mRecordingVisible", int.class);
            Field paused = NativeIslandSceneContract.field(type, "mRecordPausedVisible", int.class);
            if (recording == null || paused == null
                    || NativeIslandSceneContract.field(type, "mCallingVisible", int.class) == null) {
                module.logFeatureInfo("NATIVE_SCENE_MISSING capsule_record_fields"); return 0;
            }
            int count = 0;
            ArrayList<Field> otherVisibility = new ArrayList<>();
            for (Class<?> current = type; current != null && current != View.class; current = current.getSuperclass()) {
                for (Field candidate : current.getDeclaredFields()) {
                    if (!candidate.getName().endsWith("Visible")
                            || candidate.getName().equals("mRecordingVisible")
                            || candidate.getName().equals("mRecordPausedVisible")) continue;
                    if (candidate.getType() == int.class || candidate.getType() == boolean.class) {
                        candidate.setAccessible(true); otherVisibility.add(candidate);
                    }
                }
            }
            Method setVisibility = NativeIslandSceneContract.method(type, "setVisibility", void.class, int.class);
            if (setVisibility != null && setVisibility.getDeclaringClass() == type && !otherVisibility.isEmpty()) {
                module.registerFeatureHook(module.prepareFeatureHook(setVisibility,
                        "rm.ui.native_scene.capsule.setVisibility", false).intercept(chain -> {
                    Object object = chain.getThisObject(); CAPSULES.put(object, Boolean.TRUE);
                    Object[] arguments = chain.getArgs().toArray();
                    NativeIslandScenes owner = selected;
                    if ((Integer) arguments[0] == View.VISIBLE && owner != null && owner.shouldSuppressRecorder()) {
                        boolean anotherScene = false;
                        for (Field candidate : otherVisibility) {
                            Object value = candidate.get(object);
                            if (Boolean.TRUE.equals(value) || (value instanceof Integer && (Integer) value == View.VISIBLE)) {
                                anotherScene = true; break;
                            }
                        }
                        if (!anotherScene) arguments[0] = View.GONE;
                    }
                    return chain.proceed(arguments);
                }));
                count++; capsuleReady = true;
            }
            // Mask only the recorder while the OEM evaluates rendering. Keep producer
            // values/observers intact and restore even if the original method throws.
            for (String name : new String[]{"getCurrentVisibility", "getViewStatus", "isViewVisible",
                    "isAnyViewShouldVisible", "hasHigherPriorityViewVisible", "isAnyTypeVisibilityChanged",
                    "isVisibilityChanged", "handleVisibilityChanged", "handleFinalVisibility",
                    "updateVisibility", "skipUpdateText", "updateRecorderTimeCount"}) {
                for (Method method : type.getDeclaredMethods()) {
                    if (!method.getName().equals(name) || method.isSynthetic()) continue;
                    method.setAccessible(true);
                    module.registerFeatureHook(module.prepareFeatureHook(method,
                            "rm.ui.native_scene.capsule." + name, false).intercept(chain -> {
                        Object object = chain.getThisObject(); CAPSULES.put(object, Boolean.TRUE);
                        NativeIslandScenes owner = selected;
                        if (owner == null || !owner.shouldSuppressRecorder()) return chain.proceed(chain.getArgs().toArray());
                        int before = recording.getInt(object), beforePaused = paused.getInt(object);
                        try { recording.setInt(object, View.GONE); paused.setInt(object, View.GONE); }
                        catch (ReflectiveOperationException unsupported) {
                            recording.setInt(object, before); paused.setInt(object, beforePaused);
                            return chain.proceed(chain.getArgs().toArray());
                        }
                        try { return chain.proceed(chain.getArgs().toArray()); }
                        finally { recording.setInt(object, before); paused.setInt(object, beforePaused); }
                    }));
                    count++;
                }
            }
            count += hookNamed(module, loader, "native_scene", CAPSULE, "onAttachedToWindow", 0,
                    null, (object, arguments, result) -> {
                        CAPSULES.put(object, Boolean.TRUE);
                        NativeIslandScenes owner = selected;
                        if (owner != null) owner.scheduleChanged();
                        return PASS;
                    });
            return count;
        } catch (Throwable absent) { module.logFeatureError("NATIVE_SCENE_CAPSULE", absent); return 0; }
    }

    NativeIslandScenes(Context context, ClassLoader loader, Object manager, Object permanent, View root) {
        this.context = context; this.loader = loader; this.manager = manager;
        this.permanent = permanent; this.root = root;
        record = field(permanent, "mRecordIsland"); torch = field(permanent, "mFlashlightIsland");
        countdown = field(permanent, "mCountDownIsland"); media = field(permanent, "mMediaIsland");
    }

    void start() {
        if (selected != null && selected != this) selected.close();
        selected = this;
        root.addOnAttachStateChangeListener(rootLifecycle);
        IntentFilter filter = new IntentFilter(Intent.ACTION_SCREEN_ON);
        filter.addAction(Intent.ACTION_SCREEN_OFF); filter.addAction(Intent.ACTION_USER_PRESENT);
        filter.addAction(Intent.ACTION_USER_UNLOCKED);
        filter.addAction("android.intent.action.USER_SWITCHED");
        try { context.registerReceiver(environment, filter, Context.RECEIVER_EXPORTED); receiving = true; }
        catch (RuntimeException unavailable) { report("environment_listener_failed:" + reason(unavailable)); }
        try {
            cardsBridge = new NativeIslandCards(context, loader, permanent, root);
            cardsBridge.start();
        } catch (Exception missing) {
            if (cardsBridge != null) cardsBridge.close();
            cardsBridge = null;
            FeatureSettings.diagnostic(context, "ls_augment_native_island_cards", "unavailable:" + reason(missing));
        }
        configurationChanged();
    }

    private void observeRecorder() {
        if (enhancing("record") && panels.containsKey(record) && !observingRecord) {
            try {
                recordContext.getContentResolver().registerContentObserver(recordUri, false, recordObserver);
                recordContext.getContentResolver().registerContentObserver(recordCountUri, false, recordObserver);
                observingRecord = true; MAIN.post(recordRefresh);
                try {
                    if (recordContext.checkSelfPermission(NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION) == PackageManager.PERMISSION_GRANTED)
                        recordContext.sendBroadcast(new Intent(NativeIslandScenePolicy.RECORDER_SYNC_ACTION).setPackage("cn.zte.recorder"));
                    else report("record_source_sync_permission_missing");
                } catch (RuntimeException missing) { report("record_source_sync_failed:" + reason(missing)); }
            } catch (RuntimeException missing) {
                // The first URI may have registered before the second failed.
                try { recordContext.getContentResolver().unregisterContentObserver(recordObserver); }
                catch (RuntimeException ignored) { }
                report("record_observer_failed:" + reason(missing));
            }
        }
    }

    static boolean blocked(Object island) {
        NativeIslandScenes owner=selected;
        if(owner==null||!owner.usable()||island==null)return false;
        String id=NativeIslandSceneOptions.id(island.getClass());
        return id!=null&&owner.supportedScenes.contains(id)&&FeatureSettings.enabled(owner.context,NativeIslandSceneOptions.ENABLED)
                &&!FeatureSettings.enabled(owner.context,NativeIslandSceneOptions.key(id));
    }

    void configurationChanged() {
        if (cardsBridge != null) cardsBridge.configurationChanged();
        if(!usable())return;
        if (field(record, "mCurrentUserContext") != recordContext) {
            suspendRecorder(); recoveryLoaded = false; recorderRecovery = new Bundle(); lastPausedCache = "";
        }
        prepareRecorder();
        if (controller == null) prepareTorch();
        prepareCountdown(); prepareMedia();
        supportedScenes.clear();
        String[] members={"mRecordIsland","mFlashlightIsland","mCallIsland","mMediaIsland","mCountDownIsland",
                "mFaceDetectIsland","mMeetingIsland","mAIIsland","mAIMemIsland","mChargingIsland","mLowPowerIsland","mBluetoothIsland","mHeadsetIsland"};
        Object disposable=field(manager,"mDisposableIslandManager");
        for(int i=0;i<members.length;i++){
            Object island=field(i<9?permanent:disposable,members[i]);
            String capability=island instanceof View&&NativeIslandSceneOptions.IDS[i].equals(NativeIslandSceneOptions.id(island.getClass()))
                    ?"ready":"unavailable:"+members[i];
            if(i==0&&!panels.containsKey(record))capability="unavailable:"+recordCapability;
            if(i==1&&!panels.containsKey(torch))capability="unavailable:"+torchCapability;
            if(i==3&&!panels.containsKey(media))capability="unavailable:"+mediaCapability;
            if(i==4&&!panels.containsKey(countdown))capability="unavailable:"+countdownCapability;
            if("ready".equals(capability))supportedScenes.add(NativeIslandSceneOptions.IDS[i]);
            FeatureSettings.diagnostic(context,NativeIslandSceneOptions.key(NativeIslandSceneOptions.IDS[i])+"_capability",capability);
        }
        boolean master = FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED);
        java.util.Set<String> next = new java.util.HashSet<>();
        for (String id : supportedScenes) {
            if (NativeIslandScenePolicy.enhance(master, FeatureSettings.enabled(context, NativeIslandSceneOptions.key(id)), true)) next.add(id);
        }
        boolean restoringNative = !enhancedScenes.isEmpty() && next.isEmpty();
        if (!next.containsAll(enhancedScenes)) closeOrdinaryPanel();
        enhancedScenes.clear(); enhancedScenes.addAll(next);
        syncTorchListener(enhancing("torch"));
        if (enhancing("record")) observeRecorder(); else suspendRecorder();
        if (countdownBridge != null) { if (enhancing("countdown")) countdownBridge.request(); else countdownBridge.suspend(); }
        if (mediaBridge != null) { if (enhancing("media")) mediaBridge.request(); else mediaBridge.suspend(); }
        if (restoringNative) try {
            call(permanent, "updateRooterVisibility"); call(permanent, "updateIslandContainerVisibility");
        } catch (Exception missing) { report("scene_native_restore_failed:" + reason(missing)); }
        syncEnvironment();
        for(String name:new String[]{"mRecordIsland","mFlashlightIsland","mCallIsland","mMediaIsland",
                "mCountDownIsland","mFaceDetectIsland","mMeetingIsland","mAIIsland","mAIMemIsland"}) {
            Object island=field(permanent,name);
            if(island!=null&&blocked(island))try{call(permanent,"removePermanentIsland",island);}
            catch(Exception unavailable){report("scene_remove_unavailable:"+name+":"+reason(unavailable));}
        }
        MAIN.removeCallbacks(recordRefresh);MAIN.post(recordRefresh);
        MAIN.removeCallbacks(torchRefresh);MAIN.post(torchRefresh);
        scheduleChanged();
    }

    private boolean usable() {
        return !closed && selected == this && root.isAttachedToWindow()
                && Boolean.TRUE.equals(field(permanent, "mIsDynamicIslandEnable"));
    }

    private boolean enhancing(String id) {
        return usable() && enhancedScenes.contains(id)
                && NativeIslandScenePolicy.enhance(FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED),
                FeatureSettings.enabled(context, NativeIslandSceneOptions.key(id)), supportedScenes.contains(id));
    }

    private boolean hasEnhancements() {
        if (!usable()) return false;
        for (String id : enhancedScenes) if (enhancing(id)) return true;
        return false;
    }

    private View completedPanel(Object island) {
        if (cardsBridge != null) {
            View panel = cardsBridge.panel(island);
            if (panel != null) return panel;
        }
        String id = island == null ? null : NativeIslandSceneOptions.id(island.getClass());
        if (id == null || !enhancing(id)) return null;
        View panel = panels.get(island);
        if (island == media && !mediaPanelReady(panel)) return null;
        return panel;
    }

    /** Ordinary windows can still have capsule-era widths while their panel resources are newer. */
    static void adjustWindow(View view, WindowManager.LayoutParams params) {
        NativeIslandScenes owner = selected;
        if (owner == null || view != owner.root) return;
        try {
            Object scene = call(owner.permanent, "getPermanentIsland");
            if (Boolean.TRUE.equals(field(owner.permanent, "mDynamicPanelShowing")) && owner.completedPanel(scene) != null) {
                Class<?> app = Class.forName("com.zte.tools.AppTools", false, owner.loader);
                Class<?> operator = Class.forName("com.zte.customize.OperatorUtils", false, owner.loader);
                String name = app.getField("DYNAMIC_ISLAND_WATER_DROP").getBoolean(null)
                        ? "dynamic_island_window_width_water_drop"
                        : operator.getField("LARGE_RADIUS_PANEL").getBoolean(null)
                        ? "dynamic_island_window_width_large_panel" : "dynamic_island_window_width";
                // OEM resource names and default-DPI conversion also drive its panel animation.
                //noinspection DiscouragedApi
                int id = owner.context.getResources().getIdentifier(name, "dimen", "com.android.systemui");
                Method dimension = NativeIslandSceneContract.method(Class.forName("com.zte.utils.ResourceUtil", false, owner.loader),
                        "getDimensionPixelSizeInDefaultDpi", int.class, int.class);
                if (id == 0 || dimension == null) throw new IllegalStateException("panel_window_dimension_missing:" + name);
                int required = Math.min((Integer) dimension.invoke(null, id), owner.context.getResources().getDisplayMetrics().widthPixels);
                if (params.width > 0 && required > params.width) {
                    if (owner.panelWindowBefore < 0) owner.panelWindowBefore = params.width;
                    owner.panelWindowApplied = required; params.width = required;
                }
            } else if (owner.panelWindowBefore > 0) {
                if (params.width == owner.panelWindowApplied) params.width = owner.panelWindowBefore;
                owner.panelWindowBefore = owner.panelWindowApplied = -1;
            }
        } catch (Exception missing) { owner.report("panel_window_unavailable:" + reason(missing)); }
    }

    private void restorePanelWindow() {
        if (panelWindowBefore < 0) return;
        Object value = field(permanent, "mParams"), window = field(permanent, "mWindowManager");
        if (value instanceof WindowManager.LayoutParams && window instanceof WindowManager) {
            WindowManager.LayoutParams params = (WindowManager.LayoutParams) value;
            if (params.width == panelWindowApplied) params.width = panelWindowBefore;
            panelWindowBefore = panelWindowApplied = -1;
            try { ((WindowManager) window).updateViewLayout(root, params); }
            catch (RuntimeException error) { report("panel_window_restore_failed:" + reason(error)); }
        }
    }

    void foregroundChanged() {
        if (countdownBridge != null && enhancing("countdown")) countdownBridge.request();
        if (mediaBridge != null && enhancing("media")) mediaBridge.request();
    }

    private static int currentUser() {
        try { return (Integer) Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null); }
        catch (Exception unavailable) { return -1; }
    }

    private void suspendRecorder() {
        MAIN.removeCallbacks(recordRefresh);
        if (observingRecord) try { recordContext.getContentResolver().unregisterContentObserver(recordObserver); }
        catch (RuntimeException ignored) { }
        observingRecord = false;
        recoveryRevision++; recoveryLoading = false;
    }

    private void prepareCountdown() {
        if (countdownBridge != null) return;
        try {
            View panel = scenePanel(countdown, "mCountDownPanel", "mPanelPlay", "mPanelClose");
            for (String action : new String[]{"START", "PAUSE", "CANCEL"}) {
                if (!("NOTIFICATION_" + action).equals(field(panel, "METHOD_" + action)))
                    throw new IllegalStateException("countdown_action_contract:" + action);
            }
            countdownBridge = new NativeIslandCountdown(manager, permanent, countdown,
                    Class.forName("com.zte.feature.callnotify.ClientProvider", false, loader), MAIN,
                    () -> enhancing("countdown"), NativeIslandScenes::currentUser,
                    value -> { countdownState = value; scheduleChanged(); }, this::scheduleChanged);
            panels.put(countdown, panel); countdownCapability = "ready";
        } catch (Exception missing) { panels.remove(countdown); countdownCapability = reason(missing); }
    }

    private void prepareMedia() {
        if (panels.containsKey(media)) return;
        try {
            View panel = existingPanel(media, "mMediaPanelIsland");
            for (String button : new String[]{"mPanelPrev", "mPanelPlayPause", "mPanelNext"})
                if (!(field(panel, button) instanceof ImageView)) throw new IllegalStateException("media_button_missing:" + button);
            Class<?> data = Class.forName("com.android.systemui.media.controls.shared.model.MediaData", false, loader);
            if (NativeIslandSceneContract.field(media.getClass(), "mMediaData", data) == null
                    || NativeIslandSceneContract.field(media.getClass(), "mCurrentUser", int.class) == null
                    || NativeIslandSceneContract.field(media.getClass(), "mMediaPkg", String.class) == null
                    || NativeIslandSceneContract.field(panel.getClass(), "mMediaController", android.media.session.MediaController.class) == null
                    || NativeIslandSceneContract.method(panel.getClass(), "updateMediaData", void.class, data, boolean.class, String.class) == null)
                throw new IllegalStateException("media_session_contract_missing");
            Field nativePanel = NativeIslandSceneContract.field(Class.forName("com.zte.tools.AppTools", false, loader),
                    "ZTE_FEATURE_DYNAMIC_ISLAND_PANEL", boolean.class);
            if (nativePanel == null) throw new IllegalStateException("native_media_listener_gate_missing");
            mediaBridge = new NativeIslandMedia(loader, manager, permanent, media, panel, MAIN,
                        () -> enhancing("media"), NativeIslandScenes::currentUser,
                        value -> FeatureSettings.diagnostic(context, "ls_augment_native_island_media", value));
            panels.put(media, panel); mediaCapability = "ready";
        } catch (Exception missing) { panels.remove(media); mediaCapability = reason(missing); }
    }

    private boolean mediaPanelReady(View panel) {
        if (panel == null || field(media, "mMediaData") == null) return false;
        if (mediaBridge != null && !mediaBridge.ready()) return false;
        Object user = field(media, "mCurrentUser");
        if (!(user instanceof Integer) || (Integer) user != currentUser()) return false;
        Object value = field(panel, "mMediaController"), pkg = field(media, "mMediaPkg");
        if (!(value instanceof android.media.session.MediaController) || !(pkg instanceof String)) return false;
        try {
            android.media.session.MediaController session = (android.media.session.MediaController) value;
            if (!pkg.equals(session.getPackageName()) || session.getPlaybackState() == null) return false;
            for (String button : new String[]{"mPanelPrev", "mPanelPlayPause", "mPanelNext"}) {
                Object view = field(panel, button);
                if (!(view instanceof ImageView) || !((View) view).hasOnClickListeners()) return false;
            }
            return true;
        } catch (RuntimeException unavailable) { return false; }
    }

    private View scenePanel(Object island, String fieldName, String... buttons) throws Exception {
        View panel = existingPanel(island, fieldName);
        for (String button : buttons) {
            if (!(field(panel, button) instanceof ImageView)
                    || !((View) field(panel, button)).hasOnClickListeners())
                throw new IllegalStateException("panel_button_missing:" + button);
        }
        return panel;
    }

    private View existingPanel(Object island, String fieldName) throws Exception {
        if (!(island instanceof View)) throw new IllegalStateException("scene_view_missing");
        Field panelField = NativeIslandSceneContract.field(island.getClass(), fieldName, View.class);
        if (panelField == null || !(panelField.get(island) instanceof View))
            throw new IllegalStateException("panel_missing:" + fieldName);
        View panel = (View) panelField.get(island);
        Class<?> base = Class.forName(OEM + "DynamicPermanentIsland", false, loader);
        if (!base.isInstance(panel) || NativeIslandSceneContract.method(island.getClass(), "getPanelIsland", base) == null)
            throw new IllegalStateException("panel_getter_contract_missing:" + fieldName);
        return panel;
    }

    private void prepareRecorder() {
        try {
            View panel = scenePanel(record, "mRecorderPanel", "mPanelTag", "mPanelPlay", "mPanelStop", "mPanelClose");
            visibleState = NativeIslandSceneContract.method(Class.forName(OEM + "DynamicIslandUtils", false, loader),
                    "isVisibleState", boolean.class, int.class);
            if (visibleState == null) throw new IllegalStateException("record_visible_state_contract_missing");
            Object user = field(record, "mCurrentUserContext");
            Context currentUser = user instanceof Context ? (Context) user : context;
            recordContext=currentUser;
            RecorderActionContract.require(currentUser);
            Object uri = Class.forName("com.zte.feature.callnotify.ClientProvider", false, loader)
                    .getField("RECORD_VISIBLE_URI").get(null);
            if (!(uri instanceof Uri)) throw new IllegalStateException("record_status_uri_missing");
            recordUri = (Uri) uri;
            Object countUri = Class.forName("com.zte.feature.callnotify.ClientProvider", false, loader)
                    .getField("RECORD_COUNT_URI").get(null);
            if (!(countUri instanceof Uri)) throw new IllegalStateException("record_count_uri_missing");
            recordCountUri = (Uri) countUri;
            panels.put(record, panel); recordCapability = "ready";
        } catch (Exception absent) { panels.remove(record);recordCapability = reason(absent); }
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private void prepareTorch() {
        try {
            View panel = scenePanel(torch, "mFlashlightPanel", "mPanelClose");
            controller = field(panel, "mFlashlightController");
            if (controller == null) throw new IllegalStateException("flashlight_controller_missing");
            Class<?> type = controller.getClass();
            enabled = NativeIslandSceneContract.method(type, "isEnabled", boolean.class);
            available = NativeIslandSceneContract.method(type, "isAvailable", boolean.class);
            if (enabled == null || available == null
                    || NativeIslandSceneContract.method(type, "setFlashlight", void.class, boolean.class) == null)
                throw new IllegalStateException("flashlight_methods_missing");
            Class<?> callback = Class.forName("com.android.systemui.statusbar.policy.FlashlightController$FlashlightListener", false, loader);
            addListener = NativeIslandSceneContract.method(type, "addCallback", void.class, callback);
            removeListener = NativeIslandSceneContract.method(type, "removeCallback", void.class, callback);
            if (!callback.isInterface() || addListener == null || removeListener == null)
                throw new IllegalStateException("flashlight_listener_missing");
            listener = Proxy.newProxyInstance(loader, new Class<?>[]{callback}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) {
                    if (method.getName().equals("equals")) return proxy == args[0];
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("toString")) return "DuoNativeFlashlightListener";
                }
                MAIN.removeCallbacks(torchRefresh); MAIN.post(torchRefresh); return null;
            });
            panels.put(torch, panel); torchCapability = "ready";
        } catch (Exception absent) {
            panels.remove(torch); torchCapability = reason(absent);
            syncTorchListener(false); listener = null; controller = null;
        }
    }

    private void syncTorchListener(boolean selected) {
        if (selected == torchListening) return;
        if (selected && (listener == null || addListener == null || removeListener == null)) return;
        try {
            if (selected) {
                // Mark ownership first so a partially registering controller is still released on failure.
                torchListening = true;
                addListener.invoke(controller, listener);
            } else {
                MAIN.removeCallbacks(torchRefresh);
                removeListener.invoke(controller, listener);
                torchListening = false;
            }
        } catch (Exception error) {
            if (selected) {
                try { removeListener.invoke(controller, listener); } catch (Exception ignored) { }
                torchListening = false;
            }
            report("flashlight_listener_failed:" + reason(error));
        }
    }

    private void syncTorch() {
        if (!enhancing("torch") || !torchListening || listener == null) return;
        try {
            syncEnvironment();
            boolean on = Boolean.TRUE.equals(enabled.invoke(controller)) && Boolean.TRUE.equals(available.invoke(controller));
            boolean inManager = Boolean.TRUE.equals(call(permanent, "isIslandExist", torch));
            boolean nativeOn = Boolean.TRUE.equals(field(permanent, "mFlashlightOn"));
            if (on != nativeOn || (on && !inManager)) call(permanent, "onFlashlightChanged", on);
            scheduleChanged();
        } catch (Exception error) { report("flashlight_sync_failed:" + reason(error)); }
    }

    private boolean shouldSuppressRecorder() {
        if (!enhancing("record") || !panels.containsKey(record) || !capsuleReady) return false;
        if (!Boolean.TRUE.equals(field(permanent, "mInteractive"))
                || Boolean.TRUE.equals(field(permanent, "mAODVisibility"))
                || Boolean.TRUE.equals(field(permanent, "mSuperPowerSave"))) return false;
        if (Boolean.TRUE.equals(field(permanent, "mOnKeyguard")) && !Boolean.TRUE.equals(field(record, "mKeyguardIsland"))) return false;
        Object state = field(record, "mCurState");
        try {
            if (!(state instanceof Integer) || visibleState == null
                    || !Boolean.TRUE.equals(visibleState.invoke(null, state))) return false;
            return Boolean.TRUE.equals(call(permanent, "isIslandExist", record))
                    || field(permanent, "mTempIsland") == record;
        } catch (Exception unavailable) { return false; }
    }

    private void syncRecorder() {
        if (!enhancing("record")) { suspendRecorder(); return; }
        Object recordUser = field(record, "mCurrentUser");
        if (!(recordUser instanceof Integer) || (Integer) recordUser != currentUser()) { suspendRecorder(); return; }
        Object user=field(record,"mCurrentUserContext");
        if(user instanceof Context && user!=recordContext){
            if(observingRecord)try{recordContext.getContentResolver().unregisterContentObserver(recordObserver);}catch(RuntimeException ignored){}
            observingRecord=false;panels.remove(record);recorderProbeAt=0;
        }
        if(!panels.containsKey(record)) {
            long now=SystemClock.elapsedRealtime();
            if(now<recorderProbeAt)return;
            recorderProbeAt=now+2000;
            prepareRecorder();observeRecorder();scheduleChanged();
            if(panels.containsKey(record))supportedScenes.add("record");else supportedScenes.remove("record");
            FeatureSettings.diagnostic(context,NativeIslandSceneOptions.key("record")+"_capability",
                    panels.containsKey(record)?"ready":"unavailable:"+recordCapability);
        }
        if(!panels.containsKey(record)||recordUri==null)return;
        observeRecorder();
        if(blocked(record))return;
        loadRecovery();
        try {
            user = field(record, "mCurrentUserContext");
            Context currentUser = user instanceof Context ? (Context) user : recordContext;
            if (currentUser != recordContext) {
                if (observingRecord) recordContext.getContentResolver().unregisterContentObserver(recordObserver);
                recordContext = currentUser;
                recordContext.getContentResolver().registerContentObserver(recordUri, false, recordObserver);
                recordContext.getContentResolver().registerContentObserver(recordCountUri, false, recordObserver);
                observingRecord = true;
            }
            int status;
            try (Cursor cursor = recordContext.getContentResolver().query(recordUri, null, null, null, null)) {
                if (cursor == null || !cursor.moveToFirst()) return;
                int column = cursor.getColumnIndex("record_visible_status");
                if (column < 0) return;
                if (cursor.isNull(column)) { recoverPausedRecording(); return; }
                status = Integer.parseInt(cursor.getString(column));
            }
            recordSource = status;
            if (status == 2) {
                try { cachePausedRecording(); }
                catch (Exception unavailable) { recoveryState = "unavailable:" + reason(unavailable); }
            }
            else {
                if (recoveryLoaded && recorderRecovery.containsKey("status")) saveRecovery(new Bundle(), "");
                lastPausedCache = "";
                recoveryState = "none";
            }
            call(record, "updatePanelStatus", status);
            boolean visible = Boolean.TRUE.equals(visibleState.invoke(null, status));
            boolean present = Boolean.TRUE.equals(call(permanent, "isIslandExist", record));
            // OEM status 2 updates the pause icon but does not re-add a scene
            // removed by a mode switch. Reconcile from its actual provider value.
            if (visible && !present) call(permanent, "addPermanentIslandInner", record);
            else if (!visible && present) call(permanent, "removePermanentIsland", record);
            if (visible) call(record, "updateRecorderTimeCount");
            scheduleChanged();
        } catch (Exception error) { report("record_sync_failed:" + reason(error)); }
    }

    private Bundle recorderRecovery=new Bundle();
    private boolean recoveryLoaded,recoveryLoading;
    private long recoveryRevision,recoveryRetryAt;
    private void loadRecovery(){
        if(recoveryLoaded||recoveryLoading||SystemClock.elapsedRealtime()<recoveryRetryAt)return;
        recoveryLoading=true;long revision=++recoveryRevision;
        NativeIslandRecoveryClient.request(context,"get",new Bundle(),reply->{
            if(closed||revision!=recoveryRevision)return;
            recoveryLoading=false;
            if(reply!=null&&reply.getBoolean("ok")){recorderRecovery=reply;recoveryLoaded=true;MAIN.post(recordRefresh);}
            else{recoveryRetryAt=SystemClock.elapsedRealtime()+30000;recoveryState="private_store_unavailable";MAIN.postDelayed(recordRefresh,30000);}
        });
    }
    private void saveRecovery(Bundle value,String signature){
        if(!recoveryLoaded)return;
        value.putString("epoch",recorderRecovery.getString("epoch",""));
        recorderRecovery=new Bundle(value);lastPausedCache=signature;long revision=++recoveryRevision;
        NativeIslandRecoveryClient.request(context,value.containsKey("status")?"put":"clear",value,reply->{
            if(closed||revision!=recoveryRevision)return;
            if(reply!=null&&reply.getBoolean("ok")){recorderRecovery=reply;}
            else{recoveryLoaded=false;lastPausedCache="";recoveryRetryAt=SystemClock.elapsedRealtime()+30000;
                recoveryState="private_store_unavailable";MAIN.postDelayed(recordRefresh,30000);}
        });
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private StatusBarNotification activeRecorderNotification() throws Exception {
        NotificationListenerService listener = notifications.get();
        if (listener == null) {
            Class<?> type = Class.forName("com.android.systemui.statusbar.NotificationListener", false, loader);
            Object dependency = Class.forName("com.android.systemui.Dependency", false, loader)
                    .getMethod("get", Class.class).invoke(null, type);
            if (dependency instanceof NotificationListenerService) listener = (NotificationListenerService) dependency;
        }
        if (listener == null) return null;
        StatusBarNotification[] active = listener.getActiveNotifications();
        if (active == null) return null;
        StatusBarNotification found = null;
        Object user = field(record, "mCurrentUser");
        if (!(user instanceof Integer)) return null;
        for (StatusBarNotification notification : active) {
            if (!"cn.zte.recorder".equals(notification.getPackageName()) || notification.getUserId() != (Integer) user
                    || (notification.getNotification().flags & Notification.FLAG_FOREGROUND_SERVICE) == 0) continue;
            if (found != null) return null;
            found = notification;
        }
        return found;
    }

    private String recordedDuration() {
        try (Cursor cursor = recordContext.getContentResolver().query(recordCountUri, null, null, null, null)) {
            if (cursor == null || !cursor.moveToFirst()) return null;
            int column = cursor.getColumnIndex("record_count_status");
            return column < 0 || cursor.isNull(column) ? null : cursor.getString(column);
        }
    }

    private void cachePausedRecording() throws Exception {
        if(!recoveryLoaded)return;
        StatusBarNotification notification = activeRecorderNotification();
        String rawCount = recordedDuration();
        // The real OEM payload can append a localized "recording paused" suffix.
        // Reuse its parser, retaining the original payload for provider recovery.
        String duration = rawCount == null ? null : (String) call(record, "getContentText", rawCount);
        int boot = Settings.Global.getInt(context.getContentResolver(), Settings.Global.BOOT_COUNT, -1);
        if (notification == null) { recoveryState = "notification_unavailable"; return; }
        if (rawCount == null || rawCount.length() > 128 || !NativeIslandRecordingRecovery.matches(2, boot, boot, notification.getKey(),
                notification.getKey(), notification.getPostTime(), notification.getPostTime(), duration, true)) {
            recoveryState = "duration_contract_unavailable"; return;
        }
        String signature = notification.getKey() + ":" + notification.getPostTime() + ":" + duration;
        if (signature.equals(lastPausedCache)) return;
        Bundle saved=new Bundle();saved.putInt("status",2);saved.putInt("boot",boot);saved.putString("key",notification.getKey());
        saved.putLong("posted",notification.getPostTime());saved.putString("duration",duration);saved.putString("rawCount",rawCount);
        saveRecovery(saved,signature);
        if (!recoveryState.equals("restored")) recoveryState = "paused_cached";
    }

    private void recoverPausedRecording() throws Exception {
        Bundle saved = recorderRecovery;
        if (!recoveryLoaded || !saved.containsKey("status")) return;
        StatusBarNotification notification = activeRecorderNotification();
        if (notification == null) return;
        int boot = Settings.Global.getInt(context.getContentResolver(), Settings.Global.BOOT_COUNT, -1);
        String duration = saved.getString("duration", "");
        if (!NativeIslandRecordingRecovery.matches(saved.getInt("status", -1), saved.getInt("boot", -1), boot,
                saved.getString("key", ""), notification.getKey(), saved.getLong("posted", 0), notification.getPostTime(),
                duration, (notification.getNotification().flags & Notification.FLAG_FOREGROUND_SERVICE) != 0)) return;
        ContentValues count = new ContentValues(); count.put("record_count_status", saved.getString("rawCount", duration));
        recordContext.getContentResolver().update(recordCountUri, count, null, null);
        ContentValues state = new ContentValues(); state.put("record_visible_status", 2);
        recordContext.getContentResolver().update(recordUri, state, null, null);
        recoveryState = "restored";
        report("record_paused_recovered:matching_foreground_session");
    }

    private void scheduleChanged() {
        if (closed) return;
        MAIN.removeCallbacks(changed); MAIN.post(changed);
    }

    private void syncEnvironment() {
        if (!hasEnhancements()) return;
        try {
            KeyguardManager guard = context.getSystemService(KeyguardManager.class);
            boolean locked = guard != null && guard.isKeyguardLocked();
            if (!Boolean.valueOf(locked).equals(field(permanent, "mOnKeyguard")))
                call(permanent, "onKeyguardStateChanged", locked);
            PowerManager power = context.getSystemService(PowerManager.class);
            if (power != null && power.isInteractive() != Boolean.TRUE.equals(field(permanent, "mInteractive"))) {
                if (power.isInteractive()) call(manager, "onStartedWakingUp");
                else call(permanent, "onStartedGoingToSleep");
            }
        } catch (Exception error) { report("environment_sync_failed:" + reason(error)); }
    }

    private void stateChanged() {
        if (closed) return;
        if (cardsBridge != null) cardsBridge.stateChanged();
        syncOrdinaryVisibility();
        boolean next = shouldSuppressRecorder();
        if (next != suppressing) {
            suppressing = next;
            MAIN.removeCallbacks(capsuleRefresh); MAIN.post(capsuleRefresh);
        }
        report("active;torch=" + torchCapability + ";record=" + recordCapability
                + ";countdown=" + countdownCapability + ";countdownState=" + countdownState
                + ";media=" + mediaCapability + ";enhanced=" + new java.util.TreeSet<>(enhancedScenes)
                + ";torchOn=" + field(permanent, "mFlashlightOn")
                + ";recordState=" + field(record, "mCurState")
                + ";recordSource=" + recordSource
                + ";recovery=" + recoveryState
                + ";paused=" + field(field(record, "mRecorderPanel"), "mIsPause")
                + ";capsuleSuppressed=" + next
                + ";capsuleBridge=" + capsuleReady
                + ";interactive=" + field(permanent, "mInteractive")
                + ";keyguard=" + field(permanent, "mOnKeyguard")
                + ";aod=" + field(permanent, "mAODVisibility")
                + ";root=" + root.getVisibility()
                + ";container=" + visibility(field(permanent, "mDynamicIslandContainer"))
                + ";children=" + children(field(permanent, "mDynamicPermanentContainer"))
                + ";torchState=" + field(torch, "mCurState")
                + ";torchParent=" + (torch instanceof View && ((View) torch).getParent() != null)
                + ";torchAdds=" + torchAddRequests
                + ";control=" + field(permanent, "mControlPanelExpanded")
                + ";qs=" + field(permanent, "mQsPanelExpanded")
                + ";rotation=" + field(permanent, "mCurRotation"));
    }

    private void closeOrdinaryPanel() {
        if (!Boolean.TRUE.equals(field(permanent, "mDynamicPanelShowing"))) return;
        try {
            Object island = call(permanent, "getPermanentIsland");
            if (island != null) call(field(permanent, "mDynamicAnimation"),
                    "startPermanentPanelCloseAnimation", island, false, false);
        } catch (Exception error) { report("ordinary_panel_close_failed:" + reason(error)); }
    }

    private void syncOrdinaryVisibility() {
        if (!hasEnhancements() || children(field(permanent, "mDynamicPermanentContainer")) <= 0) return;
        try {
            Object island = call(permanent, "getPermanentIsland");
            if (island == null) return;
            boolean hidden = Boolean.TRUE.equals(call(permanent, "disableDynamicIsland"))
                    || Boolean.FALSE.equals(field(permanent, "mStatusBarVisible"))
                    || Boolean.TRUE.equals(call(permanent, "isOrientationLandscape"))
                    || Boolean.TRUE.equals(field(permanent, "mControlPanelExpanded"))
                    || Boolean.TRUE.equals(field(permanent, "mQsPanelExpanded"))
                    || (Boolean.TRUE.equals(field(permanent, "mOnKeyguard"))
                    && !Boolean.TRUE.equals(field(island, "mKeyguardIsland")));
            for (String name : new String[]{"mDynamicIslandContainer", "mDynamicPanelContainer"}) {
                Object view = field(permanent, name);
                if (view instanceof View) ((View) view).setVisibility(hidden ? View.INVISIBLE : View.VISIBLE);
            }
            root.setVisibility(hidden ? View.INVISIBLE : View.VISIBLE);
            call(permanent, "updateWindowFlags", !hidden);
        } catch (Exception error) { report("ordinary_visibility_failed:" + reason(error)); }
    }

    private void refreshCapsules() {
        ArrayList<Object> layouts;
        synchronized (CAPSULES) { layouts = new ArrayList<>(CAPSULES.keySet()); }
        for (Object layout : layouts) if (layout instanceof View && ((View) layout).isAttachedToWindow()) {
            try { call(layout, "handleVisibilityChanged"); call(layout, "updateVisibility"); }
            catch (Exception error) { report("capsule_refresh_failed:" + reason(error)); }
        }
    }

    void close() {
        if (closed) return;
        closed = true;
        restorePanelWindow();
        root.removeOnAttachStateChangeListener(rootLifecycle);
        if (receiving) try { context.unregisterReceiver(environment); } catch (RuntimeException ignored) { }
        receiving = false;
        MAIN.removeCallbacks(changed); MAIN.removeCallbacks(torchRefresh); MAIN.removeCallbacks(capsuleRefresh);
        MAIN.removeCallbacks(recordRefresh);
        if (observingRecord) try { recordContext.getContentResolver().unregisterContentObserver(recordObserver); }
        catch (RuntimeException ignored) { }
        observingRecord = false;
        syncTorchListener(false);
        if (countdownBridge != null) countdownBridge.close();
        if (mediaBridge != null) mediaBridge.close();
        if (cardsBridge != null) cardsBridge.close();
        listener = null; panels.clear(); enhancedScenes.clear();
        if (selected == this) selected = null;
        refreshCapsules(); report("released");
    }

    private void report(String value) {
        if (!value.equals(lastReport)) {
            lastReport = value;
            FeatureSettings.diagnostic(context, "ls_augment_native_island_scenes", value);
        }
    }

    private static String reason(Throwable error) {
        while (error.getCause() != null) error = error.getCause();
        return error.getClass().getSimpleName() + ":" + error.getMessage();
    }
    private static String visibility(Object value) {
        return value instanceof View ? String.valueOf(((View) value).getVisibility()) : "missing";
    }
    private static int children(Object value) {
        return value instanceof ViewGroup ? ((ViewGroup) value).getChildCount() : -1;
    }
}
