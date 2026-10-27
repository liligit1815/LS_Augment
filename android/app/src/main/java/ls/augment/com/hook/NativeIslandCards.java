package ls.augment.com.hook;

import android.appwidget.AppWidgetHostView;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.Process;
import android.provider.Settings;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import ls.augment.com.NativeIslandCardProtocol;
import ls.augment.com.NativeIslandSceneOptions;
import ls.augment.com.ConfigSchema;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** OEM RemoteViews and actions, hosted in the existing ordinary island window. */
final class NativeIslandCards {
    private static final String OEM = "com.zte.feature.dynamicisland.";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ThreadPoolExecutor IO = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(8), r -> { Thread t = new Thread(r, "Duo-IslandCards"); t.setDaemon(true); return t; });
    private static volatile NativeIslandCards selected;
    private static boolean hooksReady;
    private final Context context;
    private final Object permanent, consumer, previousListener, listener;
    private final View root;
    private final TextView foregroundReference;
    private final Method setListener, apply, cardId, sender, small, large, launch, priority,
            initialize, setPanel, add, remove, show, throttle, click, alpha, windowHeight;
    private final Field listenerField, currentUser;
    private final Object userIsland;
    private final Class<?> islandType, panelType;
    private final int islandLayout, panelLayout, panelHeightId, panelWidth;
    private final Map<String, Card> cards = new LinkedHashMap<>();
    private final Map<Object, Card> owned = new IdentityHashMap<>();
    private volatile boolean closed, ready;
    private volatile int enabledScenes;
    private final java.util.Set<String> failedScenes = new java.util.HashSet<>();
    private boolean registered, rediscoveryRegistered, failed;
    private boolean publishing;
    private int discoveryFailures;
    private Card pending;
    private final Runnable rediscover = this::publishEndpoint;
    private final BroadcastReceiver discovery = new BroadcastReceiver() {
        @Override public void onReceive(Context ignored, Intent intent) {
            if (intent != null && NativeIslandCardProtocol.REDISCOVER.equals(intent.getAction())) {
                MAIN.removeCallbacks(rediscover); MAIN.post(rediscover);
            }
        }
    };
    private final Binder endpoint = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code != NativeIslandCardProtocol.QUERY) return super.onTransact(code, data, reply, flags);
            data.enforceInterface(NativeIslandCardProtocol.DESCRIPTOR);
            String scene = data.readString(); data.enforceNoDataAvail();
            boolean allowed = false;
            try {
                String pkg = NativeIslandCardProtocol.sourcePackage(scene);
                int source = pkg == null ? -1 : context.getPackageManager().getApplicationInfo(pkg, 0).uid;
                allowed = Binder.getCallingUid() == source && source / 100000 == Process.myUid() / 100000;
            } catch (Exception unavailable) { }
            reply.writeNoException(); reply.writeInt(allowed && supportsScene(scene) ? 1 : 0);
            return true;
        }
    };

    static int install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> base = Class.forName(OEM + "DynamicPermanentIsland", false, loader);
            Class<?> manager = Class.forName(OEM + "PermanentIslandManager", false, loader);
            Method visible = require(base, "updateViewVisibility", void.class, boolean.class, boolean.class);
            Method panel = require(base, "updatePanelVisibility", void.class, boolean.class, boolean.class, boolean.class);
            Method tap = require(manager, "onClick", void.class), hold = require(manager, "onLongClick", void.class);
            Method dimension = require(Class.forName("com.zte.utils.ResourceUtil", false, loader),
                    "getDimensionPixelSizeInDefaultDpi", int.class, int.class);
            module.registerFeatureHook(module.prepareFeatureHook(visible, "rm.ui.native_cards.visibility", false).intercept(chain -> {
                NativeIslandCards host = selected;
                Card card = host == null ? null : host.owned.get(chain.getThisObject());
                if (card == null) return chain.proceed(chain.getArgs().toArray());
                card.island.setAlpha(Boolean.TRUE.equals(chain.getArgs().get(0)) ? 1f : 0f);
                return null;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(panel, "rm.ui.native_cards.panel_alpha", false).intercept(chain -> {
                NativeIslandCards host = selected;
                Card card = host == null ? null : host.owned.get(chain.getThisObject());
                if (card == null) return chain.proceed(chain.getArgs().toArray());
                boolean open = Boolean.TRUE.equals(chain.getArgs().get(0));
                host.alpha.invoke(null, card.island, !open, false);
                if (card.panel != null) host.alpha.invoke(null, card.panel, open, true);
                return null;
            }));
            for (Method method : new Method[]{tap, hold}) {
                boolean longPress = method == hold;
                module.registerFeatureHook(module.prepareFeatureHook(method, "rm.ui.native_cards." + method.getName(), false).intercept(chain -> {
                    NativeIslandCards host = selected;
                    if (host != null && chain.getThisObject() == host.permanent && host.handleClick(longPress)) return null;
                    return chain.proceed(chain.getArgs().toArray());
                }));
            }
            module.registerFeatureHook(module.prepareFeatureHook(dimension, "rm.ui.native_cards.panel_height", false).intercept(chain -> {
                NativeIslandCards host = selected;
                Card current = host == null ? null : host.current();
                if (current != null && current.panelHeight > 0 && Integer.valueOf(host.panelHeightId).equals(chain.getArgs().get(0)))
                    return current.panelHeight;
                return chain.proceed(chain.getArgs().toArray());
            }));
            hooksReady = true;
            return 5;
        } catch (Throwable missing) { module.logFeatureError("NATIVE_CARDS_HOOK_CONTRACT", missing); return 0; }
    }

    NativeIslandCards(Context context, ClassLoader loader, Object permanent, View root) throws Exception {
        if (!hooksReady) throw new IllegalStateException("card_hooks_unavailable");
        this.context = context; this.permanent = permanent; this.root = root;
        Class<?> base = Class.forName(OEM + "DynamicPermanentIsland", false, loader);
        islandType = Class.forName(OEM + "RemoteViewIsland", false, loader);
        panelType = Class.forName(OEM + "RemoteViewPanelIsland", false, loader);
        if (!ViewGroup.class.isAssignableFrom(islandType) || !base.isAssignableFrom(islandType)
                || !ViewGroup.class.isAssignableFrom(panelType) || !base.isAssignableFrom(panelType))
            throw new IllegalStateException("card_view_types");
        Class<?> message = Class.forName("com.zte.toolsdk.common.CardMessage", false, loader);
        Class<?> remote = Class.forName("com.zte.toolsdk.widget.RemoteViews", false, loader);
        Class<?> receiver = Class.forName("com.zte.toolsdk.consumer.CardConsumer", false, loader);
        Class<?> callback = Class.forName("com.zte.toolsdk.consumer.CardConsumer$OnCardReceivedListener", false, loader);
        require(callback, "onCardCreated", void.class, message); require(callback, "onCardUpdated", void.class, message);
        require(callback, "onCardRemoved", void.class, String.class);
        cardId = require(message, "getCardId", String.class); sender = require(message, "getSenderPackage", String.class);
        small = require(message, "getSmallRemoteViews", remote); large = require(message, "getRemoteViews", remote);
        launch = require(message, "getLaunchAction", String.class); priority = require(message, "getDisplayPriority", int.class);
        apply = require(remote, "apply", View.class, Context.class, ViewGroup.class);
        initialize = require(islandType, "initIsland", void.class, String.class, String.class, String.class, int.class);
        setPanel = require(islandType, "setPanelIsland", void.class, base);
        click = require(islandType, "handleIslandClick", boolean.class);
        add = require(permanent.getClass(), "addPermanentIslandInner", void.class, base);
        remove = require(permanent.getClass(), "removePermanentIsland", void.class, base);
        show = require(permanent.getClass(), "showPermanentPanelIsland", void.class);
        windowHeight = require(permanent.getClass(), "updateDynamicWindowHeightParams", void.class, boolean.class);
        throttle = require(permanent.getClass(), "forceNotClick", boolean.class);
        alpha = require(Class.forName(OEM + "DynamicIslandAnimation", false, loader),
                "startPanelAlphaAnimation", void.class, View.class, boolean.class, boolean.class);
        if (!Modifier.isStatic(alpha.getModifiers())) throw new NoSuchMethodException("static:panelAlpha");
        setListener = require(receiver, "setCardReceivedListener", void.class, callback);
        listenerField = NativeIslandSceneContract.field(receiver, "mCardReceivedListener", callback);
        if (listenerField == null) throw new NoSuchFieldException("card_listener");
        consumer = require(receiver, "getInstance", receiver, Context.class).invoke(null, context);
        previousListener = listenerField.get(consumer);
        userIsland = field(permanent, "mCountDownIsland");
        currentUser = userIsland == null ? null : NativeIslandSceneContract.field(userIsland.getClass(), "mCurrentUser", int.class);
        if (currentUser == null) throw new NoSuchFieldException("card_current_user");
        Object foreground = field(field(userIsland, "mCountDownPanel"), "mDisplayTitle");
        if (!(foreground instanceof TextView)) throw new NoSuchFieldException("ordinary_card_foreground");
        foregroundReference = (TextView) foreground;
        islandLayout = resource("layout", "remote_view_island_layout");
        panelLayout = resource("layout", "remote_view_panel_island_layout");
        panelHeightId = resource("dimen", "dynamic_island_panel_height_normal");
        Method dimension = require(Class.forName("com.zte.utils.ResourceUtil", false, loader), "getDimensionPixelSizeInDefaultDpi", int.class, int.class);
        panelWidth = (Integer) dimension.invoke(null, resource("dimen", "dynamic_island_window_width"));
        if (panelWidth <= 0 || !root.isAttachedToWindow()) throw new IllegalStateException("card_host_geometry");
        listener = Proxy.newProxyInstance(loader, new Class<?>[]{callback}, (proxy, method, args) -> {
            if (method.getDeclaringClass() == Object.class) {
                if ("equals".equals(method.getName())) return proxy == args[0];
                if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
                return "Duo native island card listener";
            }
            if (Looper.myLooper() == Looper.getMainLooper()) dispatch(method, args);
            else MAIN.post(() -> dispatch(method, args));
            return null;
        });
    }

    private void dispatch(Method method, Object[] args) {
        boolean consumed = false;
        String activeScene = null;
        try {
            if (!closed && args != null && args.length == 1) {
                if ("onCardRemoved".equals(method.getName())) consumed = removeCard((String) args[0]);
                else {
                    if (args[0] != null) activeScene = NativeIslandCardProtocol.scene(
                            (String) sender.invoke(args[0]), (String) cardId.invoke(args[0]));
                    consumed = receive(args[0]);
                }
            }
        } catch (Exception failure) {
            // Do not leave a sender in full-card mode with no usable display or dismissal control.
            if (activeScene == null) failed = true; else failedScenes.add(activeScene);
            configurationChanged();
            report("card_failed:" + failure.getClass().getSimpleName() + ":" + failure.getMessage());
        }
        if (!consumed && previousListener != null) try { method.invoke(previousListener, args); }
        catch (Exception failure) { report("previous_card_listener_failed:" + failure.getClass().getSimpleName()); }
    }

    void start() throws Exception {
        if (selected != null && selected != this) selected.close();
        selected = this; setListener.invoke(consumer, listener);
        context.registerReceiver(discovery, new IntentFilter(NativeIslandCardProtocol.REDISCOVER), Context.RECEIVER_EXPORTED);
        rediscoveryRegistered = true;
        configurationChanged(); publishEndpoint();
    }

    void configurationChanged() {
        boolean wasReady = ready;
        int previousScenes = enabledScenes;
        ready = !closed && !failed && selected == this && root.isAttachedToWindow() && sameUser()
                && Boolean.TRUE.equals(field(permanent, "mIsDynamicIslandEnable"))
                && FeatureSettings.enabled(context, ConfigSchema.NATIVE_ISLAND_SELECTED)
                && !FeatureSettings.enabled(context, SystemUiOptions.ISLAND)
                && FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED)
                && Settings.System.getInt(context.getContentResolver(), "dynamic_island_switch_state", 0) == 1;
        int mask = 0;
        for (String scene : new String[]{"countdown", "record", "meeting", "ai", "transfer", "nfc_transfer", "call", "calendar_meeting", "scenic_guide", "nearby_charging", "cycling", "flight", "preflight_battery", "weather_travel"})
            if (!failedScenes.contains(scene) && FeatureSettings.enabled(context, NativeIslandSceneOptions.key(scene)))
                mask |= NativeIslandCardProtocol.sceneBit(scene);
        enabledScenes = mask;
        FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key("transfer") + "_capability",
                !closed && !failed && !failedScenes.contains("transfer") && root.isAttachedToWindow()
                        ? "ready" : "unavailable:transfer_card_host");
        FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key("nfc_transfer") + "_capability",
                !closed && !failed && !failedScenes.contains("nfc_transfer") && root.isAttachedToWindow()
                        ? "ready" : "unavailable:nfc_transfer_card_host");
        for (String scene : new String[]{"calendar_meeting", "scenic_guide", "nearby_charging", "cycling", "flight", "preflight_battery", "weather_travel"})
            FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key(scene) + "_capability",
                    !closed && !failed && !failedScenes.contains(scene) && root.isAttachedToWindow()
                            ? "ready" : "unavailable:" + scene + "_card_host");
        for (Card card : new ArrayList<>(cards.values())) {
            if (!supportsScene(card.scene)) { removeCard(card.id); continue; }
            NativeIslandCardContrast.apply(card.island, foregroundReference.getCurrentTextColor());
            NativeIslandCardContrast.apply(card.panel, foregroundReference.getCurrentTextColor());
        }
        if (registered && (ready != wasReady || enabledScenes != previousScenes)) requestSource();
        stateChanged();
    }

    private boolean supportsScene(String scene) {
        int bit = NativeIslandCardProtocol.sceneBit(scene);
        return ready && bit != 0 && (enabledScenes & bit) != 0;
    }

    private boolean sameUser() {
        try { return currentUser.getInt(userIsland) == Process.myUid() / 100000; }
        catch (Exception unavailable) { return false; }
    }

    private void publishEndpoint() {
        if (closed || publishing) return;
        publishing = true;
        try { IO.execute(() -> {
            if (closed || selected != this) return;
            Bundle request = new Bundle(); request.putString("op", "register"); request.putBinder("host", endpoint);
            boolean accepted = false;
            try { Bundle result = NativeIslandCardClient.call(context, request); accepted = result != null && result.getBoolean("ok"); }
            catch (RuntimeException unavailable) { }
            boolean success = accepted;
            MAIN.post(() -> {
                publishing = false;
                if (closed || selected != this) return;
                registered = success; report(success ? "host_ready" : "endpoint_unavailable");
                if (success) { discoveryFailures = 0; MAIN.removeCallbacks(rediscover); requestSource(); }
                else {
                    discoveryFailures = Math.min(discoveryFailures + 1, 5);
                    MAIN.removeCallbacks(rediscover); MAIN.postDelayed(rediscover, discoveryFailures * 3000L);
                }
            });
        }); } catch (java.util.concurrent.RejectedExecutionException busy) {
            publishing = false; MAIN.removeCallbacks(rediscover); MAIN.postDelayed(rediscover, 3000);
            report("endpoint_busy");
        }
    }

    private void requestSource() {
        try { context.sendBroadcast(new Intent(NativeIslandScenePolicy.COUNTDOWN_SYNC_ACTION).setPackage("zte.com.cn.alarmclock")); }
        catch (RuntimeException unavailable) { report("source_sync_unavailable"); }
        try { context.sendBroadcast(new Intent(NativeIslandScenePolicy.RECORDER_SYNC_ACTION).setPackage("cn.zte.recorder")); }
        catch (RuntimeException unavailable) { report("recorder_sync_unavailable"); }
        try { context.sendBroadcast(new Intent(NativeIslandScenePolicy.TRANSLATION_SYNC_ACTION).setPackage("com.zte.nebulatranslation")); }
        catch (RuntimeException unavailable) { report("translation_sync_unavailable"); }
        try { context.sendBroadcast(new Intent(NativeIslandScenePolicy.TRANSFER_SYNC_ACTION).setPackage("com.zte.cn.zteshare")); }
        catch (RuntimeException unavailable) { report("transfer_sync_unavailable"); }
        try { context.sendBroadcast(new Intent(NativeIslandScenePolicy.NFC_TRANSFER_SYNC_ACTION).setPackage("com.zte.multscr")); }
        catch (RuntimeException unavailable) { report("nfc_transfer_sync_unavailable"); }
        try { context.sendBroadcast(new Intent(NativeIslandScenePolicy.CALL_SYNC_ACTION).setPackage("com.android.dialer")); }
        catch (RuntimeException unavailable) { report("call_sync_unavailable"); }
        try { context.sendBroadcast(new Intent(NativeIslandScenePolicy.PERSONAL_SYNC_ACTION).setPackage("com.zte.personalagent")); }
        catch (RuntimeException unavailable) { report("personal_sync_unavailable"); }
    }

    private boolean receive(Object message) throws Exception {
        if (message == null) return false;
        String id = (String) cardId.invoke(message), pkg = (String) sender.invoke(message);
        String scene = NativeIslandCardProtocol.scene(pkg, id);
        if (scene == null) return false;
        if (!supportsScene(scene)) { removeCard(id); return false; }
        Object compact = small.invoke(message), expanded = large.invoke(message);
        boolean compactOnly = NativeIslandCardProtocol.compactOnly(scene);
        boolean compactCallback = NativeIslandCardProtocol.compactCallback(scene);
        String action = (String) launch.invoke(message);
        if (compact == null || (!compactOnly && expanded == null) || (compactOnly && expanded != null)
                || (compactOnly && !compactCallback && (action == null || action.isEmpty()))
                || (compactCallback && action != null && !action.isEmpty()))
            throw new IllegalArgumentException("card_content_missing:" + id);
        View compactView = (View) apply.invoke(compact, context, new AppWidgetHostView(context));
        View largeView = expanded == null ? null : (View) apply.invoke(expanded, context, new AppWidgetHostView(context));
        if (compactView == null || (!compactOnly && largeView == null)) throw new IllegalStateException("card_apply_empty");
        // These OEM cards only have a launch action. Their SDK child click callbacks have no
        // registered producer listener; let the ordinary manager dispatch the original action.
        if (compactOnly && !compactCallback) clearCompactClicks(compactView);
        if (compactCallback && (!compactView.hasOnClickListeners()
                || !"com.android.dialer".equals(compactView.getResources().getResourcePackageName(compactView.getId()))
                || !"call_island_layout".equals(compactView.getResources().getResourceEntryName(compactView.getId()))))
            throw new IllegalArgumentException("call_card_action_missing");
        NativeIslandCardContrast.apply(compactView, foregroundReference.getCurrentTextColor());
        NativeIslandCardContrast.apply(largeView, foregroundReference.getCurrentTextColor());
        int height = 0;
        if (largeView != null) {
            // RemoteViews.apply preserves the XML root LayoutParams. Respect a fixed
            // OEM height; an unspecified measure only measures its shorter children.
            ViewGroup.LayoutParams contentParams = largeView.getLayoutParams();
            int requestedHeight = contentParams != null && contentParams.height > 0 ? contentParams.height : 0;
            if (requestedHeight > context.getResources().getDisplayMetrics().heightPixels)
                throw new IllegalStateException("panel_content_height");
            largeView.measure(View.MeasureSpec.makeMeasureSpec(panelWidth, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(requestedHeight,
                    requestedHeight > 0 ? View.MeasureSpec.EXACTLY : View.MeasureSpec.UNSPECIFIED));
            height = largeView.getMeasuredHeight();
            if (height <= 0 || height > context.getResources().getDisplayMetrics().heightPixels)
                throw new IllegalStateException("panel_content_height");
        }
        boolean urgent = Integer.valueOf(1).equals(priority.invoke(message));
        Card card = cards.get(id);
        if (card == null) {
            if (cards.size() >= 16) throw new IllegalStateException("card_limit");
            ViewGroup island = (ViewGroup) LayoutInflater.from(context).inflate(islandLayout, null);
            if (!islandType.isInstance(island)) throw new IllegalStateException("card_layout_type");
            card = new Card(id, scene, island);
            if (!compactOnly) {
                ViewGroup panel = (ViewGroup) LayoutInflater.from(context).inflate(panelLayout, null);
                if (!panelType.isInstance(panel)) throw new IllegalStateException("panel_layout_type");
                card.panel = panel; setPanel.invoke(island, panel);
            }
        }
        // Render, validate and measure before changing the currently displayed card.
        initialize.invoke(card.island, pkg, id, action, 1);
        card.island.removeAllViews(); card.island.addView(compactView);
        if (card.panel != null) { card.panel.removeAllViews(); card.panel.addView(largeView); }
        card.panelHeight = height;
        card.compactAction = compactCallback ? compactView : null;
        cards.put(id, card); owned.put(card.island, card);
        if (card.island.getParent() == null) add.invoke(permanent, card.island);
        if (urgent && card.panel != null) pending = card;
        MAIN.post(this::stateChanged);
        report("card_prepared:" + id + ";height=" + card.panelHeight);
        return true;
    }

    private boolean removeCard(String id) {
        Card card = cards.remove(id);
        if (card == null) return false;
        if (pending == card) pending = null;
        try { remove.invoke(permanent, card.island); }
        catch (Exception failure) { report("card_remove_failed:" + id); }
        return true;
    }

    void stateChanged() {
        if (closed) return;
        // The ordinary OEM manager intentionally ignores adds received on keyguard.
        // Keep the real received card pending and attach it only when that lifecycle permits it.
        if (ready && !Boolean.TRUE.equals(field(permanent, "mOnKeyguard"))) {
            for (Card card : cards.values()) if (card.island.getParent() == null) try { add.invoke(permanent, card.island); }
            catch (Exception failure) { report("card_attach_failed:" + card.id); }
        }
        Card current = current();
        if (current != null && current.panel != null && Boolean.TRUE.equals(field(permanent, "mDynamicPanelShowing"))
                && !Boolean.TRUE.equals(field(permanent, "mAnimProcessing"))) {
            Object container = field(permanent, "mDynamicIslandContainer");
            if (container instanceof View) {
                View view = (View) container; ViewGroup.LayoutParams params = view.getLayoutParams();
                if (params != null && params.height != current.panelHeight) try {
                    params.height = current.panelHeight; view.setLayoutParams(params); windowHeight.invoke(permanent, true);
                } catch (Exception failure) { report("card_resize_failed"); }
            }
        }
        if (pending != null && pending == current() && pending.panel != null
                && !Boolean.TRUE.equals(field(permanent, "mAnimProcessing"))
                && !Boolean.TRUE.equals(field(permanent, "mPriorityProcessing"))
                && !Boolean.TRUE.equals(field(permanent, "mOnKeyguard"))
                && !Boolean.TRUE.equals(field(permanent, "mQsPanelExpanded"))
                && !Boolean.TRUE.equals(field(permanent, "mControlPanelExpanded"))) {
            try { show.invoke(permanent); pending = null; }
            catch (Exception failure) { report("card_open_failed"); }
        }
        owned.entrySet().removeIf(e -> !cards.containsValue(e.getValue()) && e.getValue().island.getParent() == null
                && (e.getValue().panel == null || e.getValue().panel.getParent() == null));
        if (!cards.isEmpty()) {
            int attached = 0;
            for (Card card : cards.values()) if (card.island.getParent() != null) attached++;
            report("cards=" + cards.size() + ";attached=" + attached + ";ready=" + ready);
        }
    }

    View panel(Object island) { Card card = owned.get(island); return card == null ? null : card.panel; }
    private static void clearCompactClicks(View view) {
        view.setOnClickListener(null); view.setClickable(false); view.setLongClickable(false);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) clearCompactClicks(group.getChildAt(i));
        }
    }
    private Card current() { try { return owned.get(call(permanent, "getPermanentIsland")); } catch (Exception unavailable) { return null; } }
    private boolean handleClick(boolean longPress) throws Exception {
        Card card = current();
        if (closed || !ready || card == null || Boolean.TRUE.equals(field(permanent, "mOnKeyguard"))) return false;
        if (Boolean.TRUE.equals(throttle.invoke(permanent))) return true;
        if (card.compactAction != null) {
            if (!longPress) card.compactAction.performClick();
            return true;
        }
        if (!longPress && card.panel != null) show.invoke(permanent); else click.invoke(card.island);
        return true;
    }

    void close() {
        if (closed) return;
        ready = false;
        for (String id : new ArrayList<>(cards.keySet())) removeCard(id);
        closed = true; MAIN.removeCallbacks(rediscover);
        if (rediscoveryRegistered) try { context.unregisterReceiver(discovery); } catch (RuntimeException ignored) { }
        try { if (listenerField.get(consumer) == listener) setListener.invoke(consumer, previousListener); }
        catch (Exception ignored) { }
        if (selected == this) selected = null;
        try { IO.execute(() -> {
            Bundle request = new Bundle(); request.putString("op", "release"); request.putBinder("host", endpoint);
            try { NativeIslandCardClient.call(context, request); } catch (RuntimeException unavailable) { }
        }); } catch (java.util.concurrent.RejectedExecutionException busy) { report("endpoint_release_pending"); }
        requestSource();
        FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key("transfer") + "_capability", "unavailable:transfer_card_host_closed");
        FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key("nfc_transfer") + "_capability", "unavailable:nfc_transfer_card_host_closed");
        for (String scene : new String[]{"calendar_meeting", "scenic_guide", "nearby_charging", "cycling", "flight", "preflight_battery", "weather_travel"})
            FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key(scene) + "_capability", "unavailable:" + scene + "_card_host_closed");
        report("released");
    }

    private int resource(String kind, String name) {
        // OEM resources are resolved at runtime, never transplanted numeric IDs.
        int id = context.getResources().getIdentifier(name, kind, "com.android.systemui");
        if (id == 0) throw new IllegalStateException("card_resource_missing:" + name);
        return id;
    }
    private void report(String value) { FeatureSettings.diagnostic(context, "ls_augment_native_island_cards", value); }
    private static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method method = NativeIslandSceneContract.method(type, name, result, args);
        if (method == null) throw new NoSuchMethodException(type.getName() + "." + name);
        return method;
    }
    private static final class Card {
        final String id, scene;
        final ViewGroup island;
        ViewGroup panel;
        View compactAction;
        int panelHeight;
        Card(String id, String scene, ViewGroup island) { this.id = id; this.scene = scene; this.island = island; }
    }
}
