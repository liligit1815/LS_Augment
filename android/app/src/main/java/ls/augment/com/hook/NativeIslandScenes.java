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
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Map;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Existing OEM scenes follow the ordinary island owner; missing card routes remain opt-in. */
final class NativeIslandScenes {
    private static final String OEM = "com.zte.feature.dynamicisland.";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final NativeIslandCapsules CAPSULES = new NativeIslandCapsules(NativeIslandScenes::capsuleOwned);
    private static volatile java.util.Set<String> fullscreenCapsules=java.util.Collections.emptySet();

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
    private final android.view.ViewTreeObserver.OnGlobalLayoutListener layoutChanged = () -> {
        if (!capsuleOwnershipKey().equals(this.suppressing)) scheduleChanged();
    };
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
    private final IslandWindowMotion panelWindowMotion = new IslandWindowMotion();
    private String lastMotion = "";
    private Method visibleState;
    private volatile boolean closed;
    private boolean receiving;
    private String suppressing = "";
    private volatile java.util.Set<String> automaticCapsules=java.util.Collections.emptySet();
    private volatile String visibleCapsule="";
    private final boolean nativeBaseline;
    private int torchAddRequests;
    private Context recordContext;
    private Uri recordUri;
    private Uri recordCountUri;
    private boolean observingRecord;
    private int recordSource = -1;
    private static boolean recorderEndpointReady;
    private final NativeIslandRecorderState recorderModel=new NativeIslandRecorderState();
    private volatile boolean recorderEligible;
    private boolean recorderRenderFailed;
    private String recorderTopPackage;
    private final Runnable recorderExpiry=()->{ syncRecorder(); stateChanged(); refreshCapsules(); };
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
        recorderEndpointReady=NativeIslandRecorderBridge.install(module,loader);
        recorderEndpointReady=NativeIslandRecorderRendering.install(module,loader) && recorderEndpointReady;
        installRecorderText(module,loader);
        int count = installPanelClicks(module, loader);
        return count + installScenes(module, loader);
    }

    private static int installPanelClicks(AugmentModule module, ClassLoader loader) {
        int count = 0;
        try {
            Class<?> type = Class.forName(OEM + "PermanentIslandManager", false, loader);
            Method click = NativeIslandSceneContract.method(type, "onClick", void.class);
            Method throttle = NativeIslandSceneContract.method(type, "forceNotClick", boolean.class);
            Method show = NativeIslandSceneContract.method(type, "showPermanentPanelIsland", void.class);
            if (click != null && throttle != null && show != null) {
                // Native long press and other OEM entry points share this expansion method.
                module.registerFeatureHook(module.prepareFeatureHook(show, "rm.ui.native_scene.prepare_panel", false).intercept(chain -> {
                    NativeIslandScenes owner = selected;
                    if (owner != null && !owner.preparePanelExpansion(chain.getThisObject())) return null;
                    return chain.proceed(chain.getArgs().toArray());
                }));
                count++;
                Method hold = NativeIslandSceneContract.method(type, "onLongClick", void.class);
                if (hold != null) {
                    module.registerFeatureHook(module.prepareFeatureHook(hold, "rm.ui.native_scene.prepare_long_click", false).intercept(chain -> {
                        NativeIslandScenes owner = selected;
                        if (owner != null && !owner.preparePanelExpansion(chain.getThisObject())) return null;
                        return chain.proceed(chain.getArgs().toArray());
                    }));
                    count++;
                }
                module.registerFeatureHook(module.prepareFeatureHook(click, "rm.ui.native_scene.click_panel", false).intercept(chain -> {
                    NativeIslandScenes owner = selected;
                    if (owner != null && chain.getThisObject() == owner.permanent && owner.usable()) {
                        Object island = call(owner.permanent, "getPermanentIsland");
                        Object state = field(island, "mCurState");
                        if (owner.completedPanel(island) != null
                                && !Boolean.TRUE.equals(field(owner.permanent, "mOnKeyguard"))
                                && state instanceof Integer && owner.visibleState != null
                                && Boolean.TRUE.equals(owner.visibleState.invoke(null, state))) {
                            if (Boolean.TRUE.equals(throttle.invoke(owner.permanent))) return null;
                            // Protect the direct route too: an OEM compiled call may bypass the show hook.
                            if (owner.preparePanelExpansion(owner.permanent)) {
                                show.invoke(owner.permanent);
                                return null;
                            }
                        }
                        // Some stock scenes (for example flashlight) open in their own click handler.
                        if (owner.completedPanel(island) == null) owner.preparePanelExpansion(owner.permanent);
                    }
                    return chain.proceed(chain.getArgs().toArray());
                }));
                count++;
            }
        } catch (Throwable missing) { module.logFeatureError("NATIVE_SCENE_CLICK_PANEL", missing); }
        return count;
    }

    private boolean preparePanelExpansion(Object object) throws ReflectiveOperationException {
        if (object != permanent || !usable()) return true;
        Object island = call(permanent, "getPermanentIsland");
        if (island == null) return true;
        boolean supplemented = completedPanel(island) != null;
        if (!supplemented) {
            // Known stock scenes can also open through native long press in the ordinary host.
            // Keep unknown scenes and complete native/fullscreen implementations untouched.
            if (NativeIslandSceneOptions.id(island.getClass()) == null || !NativeIslandPanelCompat.ordinary(permanent)) return true;
            if (!(call(island, "getPanelIsland") instanceof View)) return true;
        }
        // The native show method does nothing in these states. Do not replace a pending close owner.
        for (String state : new String[]{"mAnimProcessing", "mPriorityProcessing", "mDynamicPanelShowing", "mDynamicPanelClosing"})
            if (Boolean.TRUE.equals(field(permanent, state))) return true;
        IslandPanelInteraction.bind(this,permanent,island,call(island,"getPanelIsland"),false,null);
        java.lang.ref.WeakReference<NativeIslandScenes> weak = new java.lang.ref.WeakReference<>(this);
        boolean ready = IslandPanelGuard.prepare(permanent, island, () -> {
            NativeIslandScenes owner = weak.get();
            if (owner != null) owner.scheduleChanged();
        });
        if (!ready) report("panel_capability_missing:animation_callback_bridge");
        return ready || !supplemented;
    }

    private static int installScenes(AugmentModule module, ClassLoader loader) {
        int count = 0;
        count += hookNamed(module, loader, "native_island_panel", OEM + "PermanentIslandManager",
                "removePermanentIsland", 1, (object, arguments, result) ->
                        IslandPanelGuard.deferRemoval(object, arguments[0]) ? null : PASS, null);
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
                "updateRooterVisibility", "onStartedWakingUp",
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
                    if (owner != null && object == owner.manager) owner.foregroundChanged((String)arguments[0]);
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
                    owner.closeOrdinaryPanel();
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
        int count = CAPSULES.install(module, loader);
        capsuleReady = CAPSULES.ready();
        return count;
    }

    static boolean capsuleSupported(String scene) { return CAPSULES.supportsScene(scene); }

    static boolean capsuleOwned(String scene) {
        if (fullscreenCapsules.contains(scene)) return true;
        NativeIslandScenes owner=selected;
        // Launcher queries arrive on Binder threads; read only published state here, never Views.
        return owner!=null && !owner.closed && FeatureSettings.enabled(owner.context,ls.augment.com.SystemUiOptions.ISLAND)
                && (owner.automaticCapsules.contains(scene) || ("record".equals(scene) && recorderTakeover())
                    || scene.equals(owner.visibleCapsule));
    }

    static void fullscreenCapsules(java.util.Set<String> scenes) {
        java.util.Set<String> next=java.util.Collections.unmodifiableSet(new java.util.HashSet<>(scenes));
        if (next.equals(fullscreenCapsules)) return;
        fullscreenCapsules=next;
        MAIN.post(()->CAPSULES.refresh(value->FeatureRuntimeLog.event("ISLAND_CAPSULE_RESTORE",value)));
    }

    static boolean recorderTakeover() {
        NativeIslandScenes owner=selected;
        if (owner==null || owner.closed || !owner.recorderEligible) return false;
        NativeIslandRecorderState.Snapshot snapshot=owner.recorderModel.current(SystemClock.elapsedRealtime());
        return snapshot!=null && snapshot.complete();
    }

    static boolean recorderSnapshot(NativeIslandRecorderState.Snapshot snapshot) {
        NativeIslandScenes owner=selected;
        if (owner==null || owner.closed || !owner.recorderEligible
                || !owner.recorderModel.accept(snapshot,SystemClock.elapsedRealtime())) return false;
        MAIN.post(()->{
            if (owner.closed || selected!=owner) return;
            MAIN.removeCallbacks(owner.recorderExpiry);
            MAIN.postDelayed(owner.recorderExpiry,NativeIslandRecorderState.LEASE_MS);
            owner.syncRecorder(); owner.stateChanged();
        });
        return true;
    }

    static boolean recorderReconcile(Object permanent,Object island) {
        NativeIslandScenes owner=selected;
        if (owner==null || permanent!=owner.permanent || island!=owner.record || !recorderTakeover()) return false;
        // A delayed native visible=0 must not close a current background recording.
        owner.syncRecorder();
        return recorderTakeover();
    }

    static boolean recorderAdditionBlocked(Object permanent,Object island) {
        NativeIslandScenes owner=selected;
        if (owner==null || permanent!=owner.permanent || island!=owner.record || !recorderTakeover()) return false;
        NativeIslandRecorderState.Snapshot snapshot=owner.recorderModel.current(SystemClock.elapsedRealtime());
        if (snapshot==null) return false;
        if (!snapshot.visible(owner.recorderForeground())) return true;
        try { owner.prepareRecorderText(); }
        catch (Exception failure) { owner.retireRecorderRendering(reason(failure)); }
        return false;
    }

    private static void installRecorderText(AugmentModule module,ClassLoader loader) {
        try {
            Class<?> type=Class.forName(OEM+"islands.RecorderIsland",false,loader);
            Method count=NativeIslandSceneContract.method(type,"getTimeCount",String.class);
            Field panel=NativeIslandSceneContract.field(type,"mRecorderPanel",View.class);
            if (count==null || Modifier.isStatic(count.getModifiers())
                    || NativeIslandSceneContract.method(type,"getContentText",String.class,String.class)==null
                    || NativeIslandSceneContract.field(type,"mDisplayText",android.widget.TextView.class)==null
                    || panel==null || NativeIslandSceneContract.method(panel.getType(),"setDisplayText",void.class,String.class)==null)
                throw new NoSuchMethodException("recorder_time_render_contract");
            module.registerFeatureHook(module.prepareFeatureHook(count,"rm.ui.native_scene.recorder_time",false).intercept(chain->{
                NativeIslandScenes owner=selected;
                if (owner!=null && chain.getThisObject()==owner.record && recorderTakeover()) {
                    String text=owner.recorderText();
                    if (!owner.recorderRenderFailed) return text;
                }
                return chain.proceed();
            }));
            // OEM callbacks may already be queued when a newer model arrives.
            for (Class<?> current=type;current!=null && current!=View.class;current=current.getSuperclass())
            for (Method method:current.getDeclaredMethods()) if (method.getName().startsWith("lambda$updateRecorderTimeCount$")
                    && method.getReturnType()==void.class && !Modifier.isStatic(method.getModifiers())
                    && java.util.Arrays.equals(method.getParameterTypes(),new Class<?>[]{String.class})) {
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,"rm.ui.native_scene.recorder_render",false).intercept(chain->{
                    NativeIslandScenes owner=selected;
                    if (owner!=null && chain.getThisObject()==owner.record && recorderTakeover()) {
                        String text=owner.recorderText();
                        if (text==null) return null;
                        return chain.proceed(new Object[]{text});
                    }
                    return chain.proceed();
                }));
            }
        } catch (Throwable missing) { recorderEndpointReady=false; module.logFeatureError("NATIVE_RECORDER_TEXT",missing); }
    }

    private String recorderText() {
        NativeIslandRecorderState.Snapshot snapshot=recorderModel.current(SystemClock.elapsedRealtime());
        if (snapshot==null || !snapshot.active()) return null;
        try {
            String text=(String)call(record,"getContentText",snapshot.count);
            if (text==null || text.isEmpty()) retireRecorderRendering("empty_formatted_time");
            return text;
        } catch (Exception missing) { retireRecorderRendering(reason(missing)); return null; }
    }

    private boolean prepareRecorderText() throws Exception {
        String text=recorderText();
        Object label=field(record,"mDisplayText");
        if (text==null || !(label instanceof android.widget.TextView)) {
            retireRecorderRendering("record_time_view_unavailable"); return false;
        }
        ((android.widget.TextView)label).setText(text);
        call(field(record,"mRecorderPanel"),"setDisplayText",text);
        return true;
    }

    private void retireRecorderRendering(String reason) {
        if (!recorderRenderFailed) report("record_atomic_render_unavailable:"+reason+";native_provider_fallback");
        recorderRenderFailed=true; recorderEligible=false;
    }

    NativeIslandScenes(Context context, ClassLoader loader, Object manager, Object permanent, View root, boolean nativeBaseline) {
        this.context = context; this.loader = loader; this.manager = manager;
        this.permanent = permanent; this.root = root;
        this.nativeBaseline = nativeBaseline;
        record = field(permanent, "mRecordIsland"); torch = field(permanent, "mFlashlightIsland");
        countdown = field(permanent, "mCountDownIsland"); media = field(permanent, "mMediaIsland");
    }

    void start() {
        if (selected != null && selected != this) selected.close();
        selected = this;
        root.addOnAttachStateChangeListener(rootLifecycle);
        root.getViewTreeObserver().addOnGlobalLayoutListener(layoutChanged);
        try {
            visibleState = NativeIslandSceneContract.method(Class.forName(OEM + "DynamicIslandUtils", false, loader),
                    "isVisibleState", boolean.class, int.class);
        } catch (ClassNotFoundException missing) { report("scene_visible_state_contract_missing"); }
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
        // Wake posts a root visibility change; retire an empty input surface before it can appear.
        syncOrdinaryVisibility();
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
        String id=owner.sceneId(island);
        // Only restrict the engine Duo enabled on a capsule-only system. An OEM-enabled
        // engine retains its own scenes when completion is off, as do unknown scene types.
        if (island==owner.record && owner.enhancing("record")) {
            if (owner.recorderForeground()) return true;
            NativeIslandRecorderState.Snapshot snapshot=owner.recorderRenderFailed?null:owner.recorderModel.current(SystemClock.elapsedRealtime());
            if (snapshot!=null && !snapshot.visible(false)) return true;
        }
        return !owner.nativeBaseline && id != null && !owner.requested(id);
    }

    private String sceneId(Object island) {
        if (island == null) return null;
        String id = NativeIslandSceneOptions.id(island.getClass());
        if (id != null) return id;
        // Older resources use one DynamicDisposableIsland class for all four scenes.
        // Validate the runtime base and typed owner field instead of relying on a model name.
        boolean disposableType = false;
        for (Class<?> c = island.getClass(); c != null; c = c.getSuperclass())
            if ((OEM + "DynamicDisposableIsland").equals(c.getName())) { disposableType = true; break; }
        Object owner = field(manager, "mDisposableIslandManager");
        if (!disposableType || owner == null) return null;
        String[] names = {"mChargingIsland", "mLowPowerIsland", "mBluetoothIsland", "mHeadsetIsland"};
        String[] ids = {"charging", "low_power", "bluetooth", "headset"};
        for (int i = 0; i < names.length; i++) {
            Field member = NativeIslandSceneContract.field(owner.getClass(), names[i], View.class);
            try { if (member != null && member.get(owner) == island) return ids[i]; }
            catch (IllegalAccessException missing) { return null; }
        }
        return null;
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
            String capability=island instanceof View&&NativeIslandSceneOptions.IDS[i].equals(sceneId(island))
                    ?"ready":"unavailable:"+members[i];
            if(i==0&&!panels.containsKey(record))capability="unavailable:"+recordCapability;
            if(i==1&&!panels.containsKey(torch))capability="unavailable:"+torchCapability;
            if(i==3&&!panels.containsKey(media))capability="unavailable:"+mediaCapability;
            if(i==4&&!panels.containsKey(countdown))capability="unavailable:"+countdownCapability;
            if(!capsuleSupported(NativeIslandSceneOptions.IDS[i]))capability="unavailable:capsule_render_contract";
            if("ready".equals(capability))supportedScenes.add(NativeIslandSceneOptions.IDS[i]);
            FeatureSettings.diagnostic(context,NativeIslandSceneOptions.key(NativeIslandSceneOptions.IDS[i])+"_capability",capability);
        }
        java.util.Set<String> next = new java.util.HashSet<>();
        for (String id : supportedScenes) {
            if (requested(id)) next.add(id);
        }
        boolean restoringNative = !enhancedScenes.isEmpty() && next.isEmpty();
        if (!next.containsAll(enhancedScenes)) closeOrdinaryPanel();
        enhancedScenes.clear(); enhancedScenes.addAll(next);
        updateRecorderEligibility();
        syncTorchListener(enhancing("torch"));
        if (enhancing("record")) observeRecorder(); else suspendRecorder();
        if (countdownBridge != null) { if (enhancing("countdown")) countdownBridge.request(); else countdownBridge.suspend(); }
        if (mediaBridge != null) { if (enhancing("media")) mediaBridge.request(); else mediaBridge.suspend(); }
        String musicGate = "duo=" + FeatureSettings.enabled(context, ls.augment.com.SystemUiOptions.ISLAND)
                + ";music=" + FeatureSettings.enabled(context, ls.augment.com.SystemUiOptions.PREFIX + "island_music")
                + ";scenes=" + FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED)
                + ";mediaOption=" + FeatureSettings.enabled(context, NativeIslandSceneOptions.key("media"))
                + ";capability=" + mediaCapability + ";bridge=" + enhancing("media");
        FeatureRuntimeLog.state("ISLAND_MUSIC_GATE", musicGate, musicGate);
        if (!enhancing("media")) FeatureSettings.diagnostic(context, "ls_augment_native_island_media", "inactive;" + musicGate);
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
        withdrawDisposable();
        MAIN.removeCallbacks(recordRefresh);MAIN.post(recordRefresh);
        MAIN.removeCallbacks(torchRefresh);MAIN.post(torchRefresh);
        scheduleChanged();
    }

    private void withdrawDisposable() {
        if (nativeBaseline) return;
        Object owner = field(manager, "mDisposableIslandManager");
        Object value = field(owner, "mDynamicDisposableContainer");
        if (!(value instanceof ViewGroup)) return;
        ViewGroup container = (ViewGroup) value;
        if (container.getChildCount() == 0) return;
        // The verified native withdrawal clears the container. Never apply it if an
        // unknown or still-selected scene shares that container.
        for (int i = 0; i < container.getChildCount(); i++) if (!blocked(container.getChildAt(i))) return;
        try {
            Class<?> permanentType = Class.forName(OEM + "DynamicPermanentIsland", false, loader);
            Method withdraw = NativeIslandSceneContract.method(owner.getClass(), "onPermanentIslandShowing", void.class,
                    boolean.class, permanentType);
            if (withdraw == null) throw new NoSuchMethodException("disposable_withdraw");
            withdraw.invoke(owner, false, null);
        } catch (Exception missing) { report("scene_disposable_restore_unavailable:" + reason(missing)); }
    }

    private boolean usable() {
        return !closed && selected == this && root.isAttachedToWindow()
                && Boolean.TRUE.equals(field(permanent, "mIsDynamicIslandEnable"));
    }

    private boolean enhancing(String id) {
        return usable() && enhancedScenes.contains(id) && requested(id);
    }

    private boolean requested(String id) {
        if ("media".equals(id)) return NativeIslandScenePolicy.music(
                FeatureSettings.enabled(context, ls.augment.com.SystemUiOptions.ISLAND),
                FeatureSettings.enabled(context, ls.augment.com.SystemUiOptions.PREFIX + "island_music"),
                supportedScenes.contains(id));
        if ("charging".equals(id) && !FeatureSettings.enabled(context, ls.augment.com.SystemUiOptions.PREFIX + "island_charging")) return false;
        return NativeIslandScenePolicy.nativeScene(FeatureSettings.enabled(context, ls.augment.com.SystemUiOptions.ISLAND),
                supportedScenes.contains(id));
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
        if (owner == null || owner.closed || view != owner.root) return;
        // Center-gravity resize changes the surface's left edge. The OEM island already morphs
        // its own views; do not let WMS replay the old edge as a second sideways animation.
        // This covers native and supplemental scenes in the same verified ordinary window.
        if (NativeIslandPanelCompat.ordinary(owner.permanent))
            owner.panelWindowMotion.suppress(params, owner::reportMotion);
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

    private void reportMotion(String value) {
        if (!value.equals(lastMotion)) {
            lastMotion = value;
            FeatureRuntimeLog.event("ISLAND_PANEL_PRESENTATION", value + ";window=ordinary");
        }
    }

    void foregroundChanged(String pkg) {
        recorderTopPackage=pkg;
        foregroundChanged();
    }

    void foregroundChanged() {
        if (enhancing("record")) { MAIN.removeCallbacks(recordRefresh); MAIN.post(recordRefresh); }
        if (countdownBridge != null && enhancing("countdown")) countdownBridge.request();
        if (mediaBridge != null && enhancing("media")) mediaBridge.request();
    }

    private boolean recorderForeground() {
        Object pkg=recorderTopPackage!=null?recorderTopPackage:field(manager,"mPkgName");
        return "cn.zte.recorder".equals(pkg);
    }

    private void updateRecorderEligibility() {
        recorderEligible=recorderEndpointReady && !recorderRenderFailed && enhancing("record")
                && Integer.valueOf(currentUser()).equals(field(record,"mCurrentUser"))
                && Boolean.TRUE.equals(field(permanent,"mInteractive"))
                && !Boolean.TRUE.equals(field(permanent,"mAODVisibility"))
                && !Boolean.TRUE.equals(field(permanent,"mSuperPowerSave"));
        try {
            if (Boolean.TRUE.equals(call(permanent,"isOrientationLandscape"))
                    || Boolean.TRUE.equals(field(permanent,"mOnKeyguard"))) recorderEligible=false;
        } catch (Exception unknown) { recorderEligible=false; }
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
            Class<?> data = NativeIslandMedia.dataType(media.getClass());
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

    private String capsuleScene() {
        if (!usable() || !capsuleReady || !FeatureSettings.enabled(context, ls.augment.com.SystemUiOptions.ISLAND)
                || !root.isShown() || !Boolean.TRUE.equals(field(permanent, "mInteractive"))
                || Boolean.TRUE.equals(field(permanent, "mAODVisibility"))
                || Boolean.TRUE.equals(field(permanent, "mSuperPowerSave"))) return "";
        try {
            // A queued/hidden lower-priority island is not a replacement for its capsule.
            Object island = call(permanent, "getPermanentIsland");
            if (!(island instanceof View) || !((View) island).isShown()) return "";
            if (Boolean.TRUE.equals(field(permanent, "mOnKeyguard"))
                    && !Boolean.TRUE.equals(field(island, "mKeyguardIsland"))) return "";
            String cardScene = cardsBridge == null ? null : cardsBridge.scene(island);
            if (cardScene != null && FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED)
                    && FeatureSettings.enabled(context, NativeIslandSceneOptions.key(cardScene))) return cardScene;
            String id = NativeIslandSceneOptions.id(island.getClass());
            if (id == null || !enhancing(id)) return "";
            Object state = field(island, "mCurState");
            if (!(state instanceof Integer) || visibleState == null
                    || !Boolean.TRUE.equals(visibleState.invoke(null, state))) return "";
            return id;
        } catch (Exception unavailable) { return ""; }
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
        NativeIslandRecorderState.Snapshot snapshot=recorderRenderFailed?null:recorderModel.current(SystemClock.elapsedRealtime());
        if (snapshot!=null) {
            try {
                recordSource=snapshot.visible(recorderForeground())?snapshot.state:0;
                call(record,"updatePanelStatus",snapshot.state);
                boolean present=Boolean.TRUE.equals(call(permanent,"isIslandExist",record));
                if (recordSource!=0) {
                    // The first visible frame must already contain the current session's time.
                    if (!prepareRecorderText()) return;
                    if (!present) call(permanent,"addPermanentIslandInner",record);
                } else if (present || field(permanent,"mTempIsland")==record) call(permanent,"removePermanentIsland",record);
                scheduleChanged();
            } catch (Exception error) { report("record_model_sync_failed:"+reason(error)); }
            return;
        }
        if (recorderForeground()) {
            try { call(permanent,"removePermanentIsland",record); } catch (Exception error) { report("record_foreground_remove_failed:"+reason(error)); }
            scheduleChanged(); return;
        }
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
        updateRecorderEligibility();
        updateAutomaticCapsules();
        if (cardsBridge != null) cardsBridge.stateChanged();
        syncOrdinaryVisibility();
        visibleCapsule=capsuleScene();
        String next = capsuleOwnershipKey();
        if (!next.equals(suppressing)) {
            suppressing = next;
            MAIN.removeCallbacks(capsuleRefresh); MAIN.post(capsuleRefresh);
        }
        report("active;torch=" + torchCapability + ";record=" + recordCapability
                + ";countdown=" + countdownCapability + ";countdownState=" + countdownState
                + ";media=" + mediaCapability + ";enhanced=" + new java.util.TreeSet<>(enhancedScenes)
                + ";torchOn=" + field(permanent, "mFlashlightOn")
                + ";recordState=" + field(record, "mCurState")
                + ";recordSource=" + recordSource
                + ";recordTransport=" + (recorderTakeover()?"atomic_model":"native_provider")
                + ";recovery=" + recoveryState
                + ";paused=" + field(field(record, "mRecorderPanel"), "mIsPause")
                + ";capsuleSuppressed=" + next
                + ";capsuleBridge=" + capsuleReady
                + ";interactive=" + field(permanent, "mInteractive")
                + ";keyguard=" + field(permanent, "mOnKeyguard")
                + ";aod=" + field(permanent, "mAODVisibility")
                + ";root=" + root.getVisibility()
                + ";windowFlags=" + windowFlags()
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
        if (!Boolean.TRUE.equals(field(permanent, "mDynamicPanelShowing"))
                || Boolean.TRUE.equals(field(permanent, "mDynamicPanelClosing"))) return;
        try {
            Object island = call(permanent, "getPermanentIsland");
            if (island != null && (IslandPanelGuard.owns(permanent,island) || completedPanel(island) != null)) {
                if (!IslandPanelGuard.pending(permanent,island) && !IslandPanelGuard.prepare(permanent,island,null)) {
                    report("ordinary_panel_close_unavailable:animation_callback_bridge"); return;
                }
                call(field(permanent, "mDynamicAnimation"),
                    "startPermanentPanelCloseAnimation", island, false, false);
            }
        } catch (Exception error) { report("ordinary_panel_close_failed:" + reason(error)); }
    }

    private void syncOrdinaryVisibility() {
        try { NativeIslandInput.releaseEmpty(permanent); }
        catch (Exception error) { report("empty_window_input_failed:"+reason(error)); }
        if (!hasEnhancements() || children(field(permanent, "mDynamicPermanentContainer")) <= 0) return;
        try {
            Object island = call(permanent, "getPermanentIsland");
            if (island == null) return;
            String id = NativeIslandSceneOptions.id(island.getClass());
            if ((id == null || !enhancing(id)) && (cardsBridge == null || cardsBridge.scene(island) == null)) return;
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
        CAPSULES.refresh(this::report);
    }

    private void updateAutomaticCapsules() {
        java.util.Set<String> next=new java.util.HashSet<>();
        try {
            if (usable() && capsuleReady && Boolean.TRUE.equals(field(permanent,"mInteractive"))
                    && !Boolean.TRUE.equals(field(permanent,"mAODVisibility"))
                    && !Boolean.TRUE.equals(field(permanent,"mSuperPowerSave"))
                    && !Boolean.TRUE.equals(field(permanent,"mOnKeyguard"))
                    && !Boolean.TRUE.equals(call(permanent,"isOrientationLandscape"))) {
                // The native provider already drives these views. Keep one renderer through
                // foreground transitions and animations, even before its first visible frame.
                for (String scene:new String[]{"call","meeting","ai"}) if (enhancing(scene)) next.add(scene);
            }
        } catch (Exception unknown) { report("capsule_owner_unavailable:"+reason(unknown)); }
        automaticCapsules=java.util.Collections.unmodifiableSet(next);
    }

    private String capsuleOwnershipKey() {
        java.util.Set<String> scenes=new java.util.TreeSet<>(automaticCapsules);
        if (recorderTakeover()) scenes.add("record");
        String shown=capsuleScene(); if (!shown.isEmpty()) scenes.add(shown);
        return scenes.toString();
    }

    void close() {
        IslandPanelInteraction.release(this);
        if (closed) return;
        closeOrdinaryPanel();
        closed = true;
        recorderEligible=false;
        automaticCapsules=java.util.Collections.emptySet();
        visibleCapsule="";
        MAIN.removeCallbacks(recorderExpiry);
        restorePanelWindow();
        panelWindowMotion.restoreAll(this::reportMotion);
        root.removeOnAttachStateChangeListener(rootLifecycle);
        if (root.getViewTreeObserver().isAlive()) root.getViewTreeObserver().removeOnGlobalLayoutListener(layoutChanged);
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
    private String windowFlags() {
        Object params=field(permanent,"mParams");
        return params instanceof WindowManager.LayoutParams?Integer.toHexString(((WindowManager.LayoutParams)params).flags):"missing";
    }
    private static int children(Object value) {
        return value instanceof ViewGroup ? ((ViewGroup) value).getChildCount() : -1;
    }
}
