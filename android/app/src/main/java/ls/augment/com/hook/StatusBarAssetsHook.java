package ls.augment.com.hook;

import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONObject;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.ManagedFont;
import ls.augment.com.StatusBarAssetStore;
import ls.augment.com.StatusBarFontSpec;
import ls.augment.com.StatusBarThemeSpec;
import ls.augment.com.StatusBarIconCatalog;
import ls.augment.com.ConnectivityIconState;
import ls.augment.com.StatusBarSurfaceSpec;
import ls.augment.com.StatusBarAssetPolicy;
import ls.augment.com.StatusBarVisibilitySpec;
import io.github.libxposed.api.XposedInterface.HookHandle;

/** Catalogues real system views even while customization is off; never observes notification content. */
final class StatusBarAssetsHook {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<ViewGroup, Root> ROOTS = new WeakHashMap<>();
    private static final Map<View, Entry> ENTRIES = new WeakHashMap<>();
    private static final Map<View,String> PRIVACY_IDS=new WeakHashMap<>();
    private static final Map<View, Map<String,Entry>> PARTS = new WeakHashMap<>();
    private static final Map<TextView, FontState> FONTS = new WeakHashMap<>();
    private static final Map<TextView,Typeface> CLOCK_BASELINES=new WeakHashMap<>();
    private static final java.util.Set<View> PAINT_FONTS=Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<View,String> RESOURCE_NAMES=new WeakHashMap<>();
    private static final Map<Drawable,String> DRAWABLE_RESOURCES=new WeakHashMap<>();
    private static final Map<View,Map<String,StateEvidence>> STATE_EVIDENCE=new WeakHashMap<>();
    private static final Map<Class<?>,Map<String,java.lang.reflect.Field>> FIELDS=new HashMap<>();
    private static final Map<Class<?>,Method> SLOT_METHODS=new HashMap<>();
    private static final Map<Method,HookHandle> DRAW_HOOKS=new HashMap<>();
    private static final Map<Class<?>,Method> DRAW_METHODS=new HashMap<>();
    private static final java.util.Set<Class<?>> UNSUPPORTED_DRAW_CLASSES=new java.util.HashSet<>();
    private static final java.util.Set<String> BOUND_IDS=new java.util.HashSet<>();
    private static final java.util.Set<Entry> ACTIVE_ENTRIES=new java.util.LinkedHashSet<>();
    private static AugmentModule hookModule;
    private static final Map<Class<?>,ModernVisibility> MODERN_VISIBILITY=new HashMap<>();
    private static final java.util.regex.Pattern SIGNAL_RESOURCE=java.util.regex.Pattern.compile("(?:wifi|signal).*?[_-]([0-5])(?:[_-]|$)");
    private static final Map<String, byte[]> BYTES = new LinkedHashMap<>(16, .75f, true);
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static final String SESSION = android.os.Process.myPid() + "-" + SystemClock.elapsedRealtime();
    private static final String[] LAYERS = {"whole", "background", "foreground"};
    private static final int MAX_ANIMATIONS = 8, MAX_CACHE_BYTES = 32 * 1024 * 1024;
    private static final ThreadPoolExecutor READER = new ThreadPoolExecutor(2, 2, 0, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(24), task -> { Thread t = new Thread(task, "LS-status-assets"); t.setDaemon(true); return t; });
    private static final ThreadPoolExecutor REPORTER = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(1), task -> { Thread t = new Thread(task, "LS-status-inventory"); t.setDaemon(true); return t; },
            new ThreadPoolExecutor.DiscardOldestPolicy());
    private static final ThreadPoolExecutor SURFACE_READER = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(1), task -> { Thread t = new Thread(task, "LS-status-surface"); t.setDaemon(true); return t; });
    private static Context application;

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static ConnectivityIconSource connectivity;
    private static StatusBarNativeStateTable nativeStates;
    private static ConnectivityIconState lastConnectivity=ConnectivityIconState.unknown();
    private static StatusBarThemeSpec theme = StatusBarThemeSpec.empty();
    private static StatusBarFontSpec fonts = StatusBarFontSpec.empty();
    private static StatusBarVisibilitySpec visibility = StatusBarVisibilitySpec.empty();
    private static String configKey = "", lastInventory = "";
    private static String layoutAssetKey="";
    private static long layoutAssetGeneration;
    private static long reportedAt;
    private static long mainObservedAt,lockObservedAt;
    private static JSONArray mainSnapshot=new JSONArray(),lockSnapshot=new JSONArray();
    private static JSONArray notificationSnapshot=new JSONArray(),controlSnapshot=new JSONArray();
    private static long notificationObservedAt,controlObservedAt;
    private static boolean visibilityActive;
    private static boolean dataAliasBound;
    private static String activeSurface="";
    private static boolean controllerSurfaceKnown,surfaceReadPending;
    private static int bluetoothBattery=-1;
    private static boolean installed, observing, enabled, artworkActive, typographyActive, interactive = true, powerSave, polling, ticking;
    private static long scanCount, stateUpdateCount, drawCallbackCount, inventoryCount;
    private static final Runnable FONT_READY = () -> {
        for(TextView text:new ArrayList<>(FONTS.keySet()))if(text!=null)applyFont(text,fontRole(text));
        invalidatePaintFonts();
        for(View v:new ArrayList<>(ENTRIES.keySet()))if(v instanceof ConnectivityIconView)((ConnectivityIconView)v).artworkChanged();
    };
    private static final Runnable POLL = new Runnable() {
        @Override public void run() {
            polling = false;
            updatePower(); discover(); requestSurface();
            if (interactive && (!ROOTS.isEmpty() || !ENTRIES.isEmpty())) schedulePoll();
        }
    };
    private static final Runnable ARTWORK_TICK = new Runnable() {
        @Override public void run() {
            ticking=false;
            if((!artworkActive&&!visibilityActive)||!interactive)return;
            updateBoundEntries(); playback(); scheduleArtworkTick();
        }
    };
    private StatusBarAssetsHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        if (installed) return 0;
        installed = true;
        hookModule=module;
        int count = 0;
        count += SystemUiAdapter.hookNamed(module, loader, "assets", "com.android.systemui.statusbar.policy.KeyguardStateControllerImpl",
                "notifyKeyguardState", 2, null, (o,a,r) -> {
                    if (a[0] instanceof Boolean && a[1] instanceof Boolean) {
                        boolean locked=(Boolean)a[0] && !(Boolean)a[1];
                        MAIN.post(() -> { controllerSurfaceKnown=true; setActiveSurface(locked?"lock":"main"); });
                    }
                    return SystemUiAdapter.PASS;
                });
        for (String name : new String[]{"com.android.systemui.statusbar.phone.PhoneStatusBarView",
                "com.android.systemui.statusbar.phone.KeyguardStatusBarView","com.zte.controlcenter.widget.CCHeaderView",
                "com.android.systemui.util.NoRemeasureMotionLayout"}) {
            for (String event : new String[]{"onFinishInflate", "onAttachedToWindow","updateHeaderResources"})
                count += SystemUiAdapter.hookNamed(module, loader, "assets", name, event, 0, null, (o,a,r) -> {
                    if (o instanceof ViewGroup) watch((ViewGroup)o);
                    return SystemUiAdapter.PASS;
                });
        }
        count+=SystemUiAdapter.hookNamed(module,loader,"assets","com.android.systemui.privacy.OngoingPrivacyChip","updateView$setIcons",3,null,(o,a,r)->{
            if(a[0] instanceof View&&a[2] instanceof ViewGroup){bindPrivacyTypes(a[1],(ViewGroup)a[2]);privacy((View)a[0]);StatusBarIconLayoutHook.refreshComposite((View)a[0]);}
            return SystemUiAdapter.PASS;
        });
        return count;
    }

    static void watch(ViewGroup root) {
        if (!StatusBarSurfaceSpec.valid(surfaceOf(root))) return;
        if (Looper.myLooper() != Looper.getMainLooper()) { MAIN.post(() -> watch(root)); return; }
        initialize(root.getContext());
        if (!ROOTS.containsKey(root)) {
            Root state = new Root(root); ROOTS.put(root, state);
            root.addOnAttachStateChangeListener(state);
        }
        ROOTS.get(root).scan(); schedulePoll(); scheduleArtworkTick();
    }

    /** Privacy dots live in their own status-event windows, not in the main status-bar subtree. */
    static void privacy(View view) {
        if (Looper.myLooper() != Looper.getMainLooper()) { MAIN.post(() -> privacy(view)); return; }
        if(!privacyWindow(view))return;
        initialize(view.getContext());
        String type = view.getClass().getSimpleName();
        if (type.contains("OngoingPrivacyChip")) {
            observe(view, null, "privacy.chip", true, "");
            privacyChildren(view,null,0);
            StatusBarIconLayoutHook.refreshComposite(view);
            return;
        }
        // Never replace the entire overlay corner: locate only its actual colored dot.
        View dot = "privacy_dot".equals(name(view)) ? view : find(view, "privacy_dot");
        if (dot != null) observe(dot, null, "privacy.dot", true, "");
        schedulePoll();
    }

    private static void initialize(Context context) {
        if (application == null) {
            application = context.getApplicationContext(); if (application == null) application = context;
            nativeStates=new StatusBarNativeStateTable(context);
            IntentFilter events = new IntentFilter(); events.addAction(Intent.ACTION_SCREEN_ON);
            events.addAction(Intent.ACTION_SCREEN_OFF); events.addAction(Intent.ACTION_USER_PRESENT);
            events.addAction(Intent.ACTION_USER_UNLOCKED);
            events.addAction(PowerManager.ACTION_POWER_SAVE_MODE_CHANGED);
            try { application.registerReceiver(new BroadcastReceiver() {
                @Override public void onReceive(Context c, Intent intent) {
                    reportedAt=0;
                    updatePower(); refreshAll(); requestSurface();
                    if (interactive) {schedulePoll();scheduleArtworkTick();} else {
                        MAIN.removeCallbacks(POLL); polling = false; MAIN.removeCallbacks(ARTWORK_TICK); ticking=false;
                    }
                }
            }, events, Context.RECEIVER_NOT_EXPORTED); } catch (RuntimeException ignored) { }
            updatePower(); requestSurface();
        }
        if (!observing) observing = FeatureSettings.addSnapshotListener(application, () -> MAIN.post(StatusBarAssetsHook::refreshAll));
        readConfig();
    }

    private static void updatePower() {
        if (application == null) return;
        PowerManager power = application.getSystemService(PowerManager.class);
        if (power != null) { interactive = power.isInteractive(); powerSave = power.isPowerSaveMode(); }
    }
    /** The keyguard callback is authoritative, including occlusion. Binder fallback is off the UI thread. */
    private static void requestSurface() {
        if(application==null||controllerSurfaceKnown||surfaceReadPending)return;
        surfaceReadPending=true;Context context=application;
        try{SURFACE_READER.execute(()->{
            String found="";
            try{KeyguardManager keyguard=context.getSystemService(KeyguardManager.class);
                if(keyguard!=null)found=keyguard.isKeyguardLocked()?"lock":"main";
            }catch(RuntimeException ignored){}
            String result=found;
            MAIN.post(()->{surfaceReadPending=false;if(!controllerSurfaceKnown&&!result.isEmpty())setActiveSurface(result);});
        });}catch(java.util.concurrent.RejectedExecutionException ignored){surfaceReadPending=false;}
    }
    private static void setActiveSurface(String surface) {
        if(activeSurface.equals(surface))return;
        activeSurface=surface;reportedAt=0;refreshAll();
    }
    private static boolean observingSurface(String surface){
        if(!interactive)return false;
        if(surface.equals("main")||surface.equals("lock"))return surface.equals(activeSurface);
        if(!StatusBarSurfaceSpec.valid(surface))return false;
        for(ViewGroup root:ROOTS.keySet())if(root!=null&&surface.equals(surfaceOf(root))&&displayed(root))return true;
        return false;
    }
    private static void captureSurface(String surface,JSONArray rows,long observedAt){
        if(!observingSurface(surface))return;
        storeSurfaceSnapshot(surface,rows,observedAt);
    }
    /** Called only by the serial reporter with evidence captured on the main thread. */
    private static void storeSurfaceSnapshot(String surface,JSONArray rows,long observedAt){
        if(surface.equals("lock")){lockSnapshot=rows;lockObservedAt=observedAt;}
        else if(surface.equals("main")){mainSnapshot=rows;mainObservedAt=observedAt;}
        else if(surface.equals("notification")){notificationSnapshot=rows;notificationObservedAt=observedAt;}
        else if(surface.equals("control")){controlSnapshot=rows;controlObservedAt=observedAt;}
    }
    private static void syncConnectivity(){
        boolean visible=false;for(ViewGroup root:ROOTS.keySet())if(root!=null&&observingSurface(surfaceOf(root))&&displayed(root)){visible=true;break;}
        if(interactive&&visible&&connectivity==null)connectivity=new ConnectivityIconSource(application,()->MAIN.post(StatusBarAssetsHook::refreshAll));
        if((!interactive||!visible)&&connectivity!=null){lastConnectivity=connectivity.state;connectivity.close();connectivity=null;}
    }
    private static boolean privacyWindow(View view){
        if(!view.isAttachedToWindow())return false;
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            String type=at.getClass().getSimpleName().toLowerCase(java.util.Locale.ROOT),id=name(at).toLowerCase(java.util.Locale.ROOT);
            if(type.contains("controlcenter")||type.contains("ccheader")||type.contains("qspanel")||type.contains("qsheader")
                    ||type.contains("quicksettings")||type.contains("notificationpanel")||id.equals("qs_header")||id.equals("quick_settings_panel"))return false;
        }return true;
    }
    /** Builder.types is the exact sorted/distinct sequence used by generateIcons(). */
    private static void bindPrivacyTypes(Object builder,ViewGroup icons){
        Object raw=cachedField(builder,"types");
        for(int i=0;i<icons.getChildCount();i++)PRIVACY_IDS.remove(icons.getChildAt(i));
        if(!(raw instanceof List)||((List<?>)raw).size()!=icons.getChildCount())return;
        List<?> types=(List<?>)raw;
        for(int i=0;i<types.size();i++){
            Object type=types.get(i);String name=type instanceof Enum?((Enum<?>)type).name():"",id="";
            switch(name){case "TYPE_CAMERA":id="privacy.camera";break;case "TYPE_MICROPHONE":id="privacy.microphone";break;case "TYPE_LOCATION":id="privacy.location";break;case "TYPE_MEDIA_PROJECTION":id="privacy.projection";break;}
            View child=icons.getChildAt(i);if(!id.isEmpty()&&child instanceof ImageView)PRIVACY_IDS.put(child,id);
        }
    }
    private static void privacyChildren(View view,ViewGroup root,int depth){
        if(depth>10)return;
        if(view instanceof ImageView){String key=(name(view)+" "+String.valueOf(view.getContentDescription())).toLowerCase(java.util.Locale.ROOT),id=PRIVACY_IDS.getOrDefault(view,"");
            if(!id.isEmpty()){}
            else if(key.contains("camera")||key.contains("摄像头")||key.contains("相机"))id="privacy.camera";
            else if(key.contains("microphone")||key.contains("麦克风"))id="privacy.microphone";
            else if(key.contains("location")||key.contains("定位"))id="privacy.location";
            else if(key.contains("projection")||key.contains("屏幕共享"))id="privacy.projection";
            if(!id.isEmpty())observe(view,root,id,true,"");
        }
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)privacyChildren(((ViewGroup)view).getChildAt(i),root,depth+1);
    }
    private static boolean overflowDot(View view){
        if(!displayed(view)||!nativeConditions(view)||!RedMagicLegacyUiHook.hiddenReason(view).isEmpty()||!StatusBarGridHook.hiddenReason(view).isEmpty())return false;
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            Object state=cachedField(at,"mVisibleState","iconVisibleState","visibleState");
            if(state instanceof Number&&((Number)state).intValue()==1){
                Object amount=cachedField(at,"mDotAppearAmount");
                if(amount instanceof Number)return ((Number)amount).floatValue()>0&&at.getWidth()>0&&at.getHeight()>0;
                Object rawDot=cachedField(at,"mDotView","dotView");View dot=rawDot instanceof View?(View)rawDot:find(at,"status_bar_dot");
                if(dot==null)return false;
                Object dotAmount=cachedField(dot,"mDotAppearAmount");
                return displayed(dot)&&dot.getWidth()>0&&dot.getHeight()>0&&(!(dotAmount instanceof Number)||((Number)dotAmount).floatValue()>0);
            }
            if(StatusBarGridHook.isBarRoot(at))break;
        }return false;
    }
    static void bluetoothBattery(int value){if(bluetoothBattery==value)return;bluetoothBattery=value;if(artworkActive)MAIN.post(StatusBarAssetsHook::refreshAll);}
    private static void schedulePoll() { if (!polling && interactive) { polling = true; MAIN.postDelayed(POLL, 5000); } }
    private static void scheduleArtworkTick(){if(!ticking&&(artworkActive||visibilityActive)&&interactive&&!ACTIVE_ENTRIES.isEmpty()){ticking=true;MAIN.postDelayed(ARTWORK_TICK,250);}}
    private static void readConfig() {
        if (application == null) return;
        ConfigSnapshot snapshot = FeatureSettings.snapshot(application);
        String artwork = snapshot.get(StatusBarThemeSpec.KEY), typography = snapshot.get(StatusBarFontSpec.KEY), hidden=snapshot.get(StatusBarVisibilitySpec.KEY);
        boolean on = ConfigSchema.truthy(snapshot.get(ConfigSchema.SYSTEMUI_MASTER))
                && !ConfigSchema.truthy(snapshot.get(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY));
        String signature = on + "|" + artwork + "|" + typography + "|" + hidden+"|"+snapshot.get(ls.augment.com.StatusBarIconSpacingSpec.KEY);
        if (configKey.equals(signature)) return;
        configKey = signature; enabled = on;
        String assetKey=on+"|"+artwork;
        if(!layoutAssetKey.equals(assetKey)){layoutAssetKey=assetKey;layoutAssetGeneration++;}
        StatusBarThemeSpec parsed = StatusBarThemeSpec.parse(artwork);
        theme = parsed == null ? StatusBarThemeSpec.empty() : parsed;
        StatusBarFontSpec selected = StatusBarFontSpec.parse(typography);
        fonts = selected == null ? StatusBarFontSpec.empty() : selected;
        StatusBarVisibilitySpec policy=StatusBarVisibilitySpec.parse(hidden);visibility=policy==null?StatusBarVisibilitySpec.empty():policy;
        visibilityActive=enabled&&!visibility.serialize().isEmpty();
        artworkActive=enabled&&!theme.entries().isEmpty();
        typographyActive=enabled&&!fonts.serialize().isEmpty();
        BOUND_IDS.clear();if(artworkActive)for(StatusBarThemeSpec.Binding binding:theme.entries())BOUND_IDS.add(binding.id);
        dataAliasBound=false;for(String id:BOUND_IDS)if(id.startsWith("mobile_data")){dataAliasBound=true;break;}
        if(!artworkActive&&!visibilityActive){
            MAIN.removeCallbacks(ARTWORK_TICK);ticking=false;
            for(Entry entry:new ArrayList<>(ACTIVE_ENTRIES))entry.dispose();
            for(HookHandle handle:DRAW_HOOKS.values())try{handle.unhook();}catch(RuntimeException ignored){}
            DRAW_HOOKS.clear();UNSUPPORTED_DRAW_CLASSES.clear();
        }
        invalidatePaintFonts();
        for (Entry entry : allEntries()) entry.update();
        for (TextView view : new ArrayList<>(FONTS.keySet())) if (view != null) applyFont(view, fontRole(view));
        for(Root root:new ArrayList<>(ROOTS.values()))root.scan();
    }
    private static void refreshAll() {
        if (application == null) return;
        readConfig();
        syncConnectivity();
        for(TextView text:new ArrayList<>(FONTS.keySet()))if(text!=null&&!inAssetSurface(text))restoreFont(text);
        updateBoundEntries();
        playback(); publish();scheduleArtworkTick();
    }
    private static void updateBoundEntries(){
        if(!artworkActive&&!visibilityActive)return;
        for(Entry entry:new ArrayList<>(ACTIVE_ENTRIES))entry.update();
    }
    /** Discovery is independent of frame production: no tree scans or JSON work run in pre-draw. */
    private static void discover(){
        if(application==null)return;
        readConfig();
        for(Root root:new ArrayList<>(ROOTS.values()))root.scan();
        syncConnectivity();playback();publish();scheduleArtworkTick();
    }

    private static final class Root implements View.OnAttachStateChangeListener {
        final WeakReference<ViewGroup> view;
        String surface;
        long lastScan;
        Root(ViewGroup root) { view = new WeakReference<>(root);surface=detectSurface(root); }
        void scan() {
            ViewGroup root = view.get(); if (root == null) return;
            surface=detectSurface(root);
            lastScan = SystemClock.uptimeMillis();
            scanCount++;
            try{walk(root, root, 0, "other");}catch(RuntimeException failure){FeatureSettings.diagnostic(application,"ls_augment_statusbar_asset_scan",failure.getClass().getSimpleName());}
        }
        @Override public void onViewAttachedToWindow(View root) { scan(); schedulePoll(); }
        @Override public void onViewDetachedFromWindow(View root) {
            root.removeOnAttachStateChangeListener(this);
            ROOTS.remove(root);
            for (View view : new ArrayList<>(ENTRIES.keySet())) {
                Entry entry = ENTRIES.get(view);
                if (entry != null && entry.root.get() == root) { entry.dispose(); ENTRIES.remove(view); }
            }
            for(View view:new ArrayList<>(PARTS.keySet()))if(view!=null&&below(view,root)){
                Map<String,Entry> parts=PARTS.remove(view);if(parts!=null)for(Entry entry:parts.values())entry.dispose();
            }
            for (TextView text : new ArrayList<>(FONTS.keySet())) if (text != null && below(text, root)) restoreFont(text);
            publish();
        }
    }

    private static void walk(View view, ViewGroup root, int depth, String inheritedRole) {
        if (depth > 24 || notification(view)) return;
        String type = view.getClass().getSimpleName(), resource = name(view), slot = slotOf(view);
        String role = typographyActive ? role(view, inheritedRole) : "other";
        if (view instanceof TextView && (typographyActive||FONTS.containsKey(view))) applyFont((TextView)view, role);
        String id = semantic(view, resource, slot);
        if (!id.isEmpty()) observe(view, root, id, supported(id), "");
        else if (slot != null && !slot.isEmpty()) observe(view, root, unknownId(slot), false, "未识别的系统图标");
        if(type.contains("OngoingPrivacyChip"))privacyChildren(view,root,0);
        if (view instanceof ViewGroup) for (int i=0;i<((ViewGroup)view).getChildCount();i++)
            walk(((ViewGroup)view).getChildAt(i), root, depth + 1, role);
        StatusBarIconLayoutHook.refreshComposite(view);
    }

    private static boolean notification(View view) {
        String type = view.getClass().getSimpleName(), id = name(view);
        return type.contains("NotificationIcon") || id.equals("notificationIcons") || id.equals("notification_icon_area")
                || id.equals("notification_icon_container") || id.equals("centeredIcon") || id.equals("centered_icon_area");
    }
    static String semanticId(View view) { if(view==null)return "";String id=semantic(view,name(view),slotOf(view));return id.isEmpty()?PRIVACY_IDS.getOrDefault(view,""):id; }
    private static String semantic(View view, String resource, String slot) {
        String type = view.getClass().getSimpleName();
        if (type.equals("MFVBatteryViewLayout")) return "battery";
        if (type.equals("ConnectivityIconView")) return "connectivity";
        if (type.contains("OngoingPrivacyChip")) return "privacy.chip";
        if (type.contains("ModernStatusBarWifi") || type.equals("StatusBarWifiView")) return wifiId(view);
        if (type.contains("ModernStatusBarMobile") || type.equals("StatusBarMobileView")) return mobileId(view);
        switch (resource) {
            case "wifi_signal": return wifiId(view)+".signal";
            case "wifi_in": return wifiId(view)+".activity_in";
            case "wifi_out": return wifiId(view)+".activity_out";
            case "wifi_inout": return wifiId(view)+".activity_inout";
            case "wifi_standard": case "wifi_standard_image": case "wifi_type": return wifiId(view)+".standard";
            case "mobile_signal": return mobileId(view)+".signal";
            case "mobile_type": return mobileId(view)+".type";
            case "mobile_in": return mobileId(view)+".activity_in";
            case "mobile_out": return mobileId(view)+".activity_out";
            case "mobile_inout": case "data_inout": return mobileId(view)+".activity_inout";
            case "mobile_roaming": return mobileId(view)+".roaming";
            case "mobile_roaming_large": return mobileId(view)+".roaming";
            case "mobile_volte": case "mobile_ims": return mobileId(view)+".volte";
            case "mobile_no_network": return mobileId(view)+".no_network";
            case "mobile_nonetwork_red_cross": case "mobile_nonetwork_signal": return mobileId(view)+".no_network";
            case "privacy_dot": return "privacy.dot";
            case "multi_user_switch": case "multi_user_switcher": return "user_switcher";
            case "multi_user_avatar": case "keyguard_user_switcher_avatar": return "user_avatar";
            case "battery_charge": case "outside_charge": return "battery.charging";
            case "cooling_fan_view": return "cooling_fan";
            case "liquid_cooling_view": return "liquid_cooling";
            case "refresh_rate_view": return "refresh_rate";
        }
        if (slot == null) return "";
        switch (slot.toLowerCase(java.util.Locale.ROOT)) {
            case "bluetooth": return "bluetooth";
            case "alarm_clock": case "alarm": return "alarm_clock";
            case "volume": return "volume";
            case "zen": return "zen";
            case "airplane": return "airplane";
            case "vpn": return "vpn";
            case "location": return "location";
            case "camera": return "privacy.camera";
            case "microphone": return "privacy.microphone";
            case "cast": return "cast";
            case "hotspot": return "hotspot";
            case "nfc": return "nfc";
            case "headset": return "headset";
            case "rotate": case "rotation_lock": return "rotate";
            case "fan": case "cooling_fan": return "cooling_fan";
            case "liquid_cooling": return "liquid_cooling";
            case "refresh_rate": return "refresh_rate";
            default: return StatusBarIconCatalog.find(slot)!=null?slot:"";
        }
    }
    private static boolean supported(String id) { return StatusBarIconCatalog.find(id)!=null; }
    private static String wifiId(View view) {
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            String slot=slotOf(at);if("secondary_wifi".equals(slot)||"wifi_secondary".equals(slot))return "secondary_wifi";
            if(StatusBarGridHook.isBarRoot(at))break;
        }return "wifi";
    }
    private static String mobileId(View view) {
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            Object sub=cachedField(at,"mSubId","subId");
            if(!(sub instanceof Number))try{sub=SystemUiAdapter.callIfPresent(at,"getSubId");}catch(ReflectiveOperationException ignored){}
            if(sub instanceof Number)for(ConnectivityIconState.Sim sim:(connectivity==null?lastConnectivity:connectivity.state).sims)
                if(sim.subscriptionId==((Number)sub).intValue())return "mobile"+(sim.slot+1);
            // A known subscription that cannot be mapped must not borrow a stale display/slot index.
            if(sub instanceof Number&&((Number)sub).intValue()>=0)return "unknown:mobile";
            Object slot=cachedField(at,"mSlotIndex","slotIndex");
            if(slot instanceof Number&&((Number)slot).intValue()>=0&&((Number)slot).intValue()<2)return "mobile"+(((Number)slot).intValue()+1);
            if(StatusBarGridHook.isBarRoot(at))break;
        }return "unknown:mobile";
    }
    private static void observe(View view, ViewGroup root, String id, boolean capable, String reason) {
        if(!StatusBarIconCatalog.validId(id)){id=unknownId(id);capable=false;reason="未识别的系统图标";}
        if(view instanceof ImageView&&id.startsWith("privacy.")&&!id.equals("privacy.dot"))PRIVACY_IDS.put(view,id);
        StatusBarIconLayoutHook.observeIcon(view);
        Entry entry = ENTRIES.get(view);
        if (entry == null || !entry.id.equals(id) || entry.root.get()!=root) {
            if (entry != null) entry.dispose();
            entry = new Entry(view, root, id, capable, reason); ENTRIES.put(view, entry);
        }
        entry.update();
    }

    /** Vendor slots are opaque labels, not trusted wire identifiers. Keep unknown objects discoverable. */
    private static String unknownId(String slot){
        String value=slot==null?"":slot.trim();
        String readable="unknown:"+value;
        if(!value.isEmpty()&&StatusBarIconCatalog.validId(readable))return readable;
        try{
            byte[] digest=java.security.MessageDigest.getInstance("SHA-256").digest(value.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            char[] hex="0123456789abcdef".toCharArray();StringBuilder result=new StringBuilder("unknown:slot:");
            for(byte item:digest){int unsigned=item&255;result.append(hex[unsigned>>>4]).append(hex[unsigned&15]);}
            return result.toString();
        }catch(java.security.NoSuchAlgorithmException unavailable){throw new AssertionError(unavailable);}
    }
    private static String inventoryId(String id){return StatusBarIconCatalog.validId(id)?id:unknownId(id);}

    /** Never hook a framework drawing primitive: that would intercept the whole notification shade. */
    private static boolean prepareDrawing(Entry entry,View target){
        if(target instanceof ImageView){
            ImageView image=(ImageView)target;Drawable current=image.getDrawable();
            if(current==entry.wrapper)return true;
            int nativeResource=WifiStandardHook.nativeResource(image);
            Object resource=nativeResource>0?nativeResource:cachedField(image,"mResource");String originalName=null;
            if(resource instanceof Integer&&(Integer)resource!=0&&(Integer)resource!=View.NO_ID)try{originalName=image.getResources().getResourceEntryName((Integer)resource);}catch(RuntimeException ignored){}
            if(originalName==null&&current!=null)originalName=DRAWABLE_RESOURCES.get(current);
            if(originalName!=null){RESOURCE_NAMES.put(image,originalName);if(current!=null)DRAWABLE_RESOURCES.put(current,originalName);}
            else RESOURCE_NAMES.remove(image);
            if(entry.wrapper!=null)entry.wrapper.release();
            entry.wrappedBackground=false;
            entry.wrapper=new StatusBarAssetDrawable(current,(canvas,area)->entry.drawWrapped(canvas,area));
            image.setImageDrawable(entry.wrapper);entry.wrapper.attach();return true;
        }
        if(!(target instanceof ViewGroup)&&!(target instanceof TextView)&&target.getClass()==View.class){
            Drawable current=target.getBackground();if(current==entry.wrapper)return true;
            if(entry.wrapper!=null)entry.wrapper.release();
            entry.wrappedBackground=true;
            entry.wrapper=new StatusBarAssetDrawable(current,(canvas,area)->entry.drawWrapped(canvas,area));
            target.setBackground(entry.wrapper);entry.wrapper.attach();return true;
        }
        Class<?> type=target.getClass();if(UNSUPPORTED_DRAW_CLASSES.contains(type))return false;
        Method draw=drawingMethod(target);
        if(draw==null){UNSUPPORTED_DRAW_CLASSES.add(type);return false;}
        if(DRAW_HOOKS.containsKey(draw))return true;
        try{
            draw.setAccessible(true);
            HookHandle handle=hookModule.prepareFeatureHook(draw,"systemui.assets."+draw.getDeclaringClass().getName()+"."+draw.getName(),false).intercept(chain->{
                if((!artworkActive&&!visibilityActive)||Looper.myLooper()!=Looper.getMainLooper())return chain.proceed();
                Entry selected=ENTRIES.get(chain.getThisObject());
                if(chain.getThisObject() instanceof ConnectivityIconView)
                    return drawCircle((ConnectivityIconView)chain.getThisObject(),(Canvas)chain.getArgs().get(0),chain::proceed);
                if(selected!=null&&selected.suppressed())return null;
                if(selected==null||!selected.canRender())return chain.proceed();
                drawCallbackCount++;
                Canvas canvas=(Canvas)chain.getArgs().get(0);
                if(selected.draw(canvas,"whole"))return null;
                selected.draw(canvas,"background");Object result=chain.proceed();selected.draw(canvas,"foreground");return result;
            });
            DRAW_HOOKS.put(draw,handle);return true;
        }catch(Throwable failure){UNSUPPORTED_DRAW_CLASSES.add(type);hookModule.logFeatureError("STATUSBAR_ASSETS_DRAW",failure);return false;}
    }
    private static boolean drawableAdapter(View view){return view instanceof ImageView||view.getClass()==View.class;}
    private static Method drawingMethod(View view){
        Class<?> type=view.getClass();if(DRAW_METHODS.containsKey(type))return DRAW_METHODS.get(type);
        Method draw=null;String event=view instanceof ViewGroup?"dispatchDraw":"onDraw";
        for(Class<?> at=type;at!=null&&!at.getName().startsWith("android.")&&!at.getName().startsWith("androidx.");at=at.getSuperclass()){
            try{draw=at.getDeclaredMethod(event,Canvas.class);break;}catch(NoSuchMethodException ignored){}
        }
        DRAW_METHODS.put(type,draw);return draw;
    }

    /** Read-only evidence. A wrapper alone is not evidence that any artwork decoded. */
    static final class LayoutRendering {
        final boolean current,series;
        final long generation;
        LayoutRendering(boolean current,boolean series,long generation){this.current=current;this.series=series;this.generation=generation;}
    }
    static LayoutRendering layoutRendering(View view){
        Entry entry=ENTRIES.get(view);boolean current=false,series=false;
        if(entry!=null&&artworkActive&&entry.capable&&!entry.hidden&&entry.drawingReady&&entry.renderEligible
                &&entry.inScope(view)&&!parentReplaced(view)&&!hiddenByPolicy(view)){
            boolean failed=false;for(Resource r:entry.resources.values()){
                if(r.art!=null&&!r.disposed)current=true;
                if(!r.error.isEmpty())failed=true;
            }
            series=!failed&&(current||entry.readyLayoutGeneration==layoutAssetGeneration);
        }
        return new LayoutRendering(current,series,layoutAssetGeneration);
    }
    static Drawable nativeDrawable(ImageView view){Drawable value=view.getDrawable();return WifiStandardHook.nativeDrawable(value instanceof StatusBarAssetDrawable?((StatusBarAssetDrawable)value).original():value);}

    private static final class Entry {
        final WeakReference<View> view;
        WeakReference<View> stateSource;
        final WeakReference<ViewGroup> root;
        final String id, instance, unsupportedReason;
        final boolean capable;
        final boolean external;
        boolean virtual;
        long seenAt;
        boolean animationLimited, renderEligible, drawingReady;
        boolean hidden;
        long readyLayoutGeneration=-1;
        String applicationCode="native",applicationReason="保留原厂显示",stateProvenance="unknown";
        int drawTint=0xffffffff;float density=1;
        StatusBarAssetDrawable wrapper;
        boolean wrappedBackground;
        final Map<String, Resource> resources = new LinkedHashMap<>();
        String[] states = {"default"};
        Entry(View view, ViewGroup root, String id, boolean capable, String reason) {
            this.view = new WeakReference<>(view); this.root = new WeakReference<>(root); this.id = id;
            this.stateSource=new WeakReference<>(view);
            this.instance = id + ":" + Integer.toHexString(System.identityHashCode(view));
            this.capable = capable; this.unsupportedReason = reason;
            this.external=root==null;
        }
        String surface() { ViewGroup parent = root.get(); return parent == null ? privacySurface() : surfaceOf(parent); }
        void update() {
            View target = view.get(); if (target == null || !inScope(target)) { dispose(); return; }
            boolean wasHidden=hidden;hidden=scopedHidden(target,id,surface());
            if(!hidden&&(!artworkActive||!bound(id))){
                if(!resources.isEmpty()||wrapper!=null)dispose();
                // readConfig may already have disposed the resource. Clear its old
                // matched/error reason even then; untouched native icons keep their class.
                if(!applicationCode.equals("native")){applicationCode="native_unmapped";applicationReason="当前状态未配置素材，保留原厂显示";}
                if(wasHidden)target.invalidate();return;
            }
            if(!virtual){String current=semantic(target,name(target),slotOf(target));if(!current.isEmpty()&&!current.equals(id)){
                dispose();applicationCode="native_identity_changed";applicationReason="系统图标绑定已改变，等待重新识别";return;}}
            stateUpdateCount++;
            ACTIVE_ENTRIES.add(this);
            if(!virtual)drawingReady=prepareDrawing(this,target);else drawingReady=true;
            if(!drawingReady){dispose();applicationCode="unsupported";applicationReason="未找到可安全替换的绘制入口，保留原厂";return;}
            View source=stateSource.get();StateEvidence evidence=readState(source==null?target:source,id);states=evidence.states;stateProvenance=evidence.source;
            boolean wasRenderable=renderEligible;int oldTint=drawTint;
            renderEligible=drawingReady&&observingSurface(surface())&&nativeIcon(target);
            drawTint=tint(target);density=target.getResources().getDisplayMetrics().density;
            if(wasRenderable!=renderEligible||oldTint!=drawTint||wasHidden!=hidden)target.invalidate();
            applicationCode=hidden?"hidden_by_policy":"native_unmapped";applicationReason=hidden?"已按此位置的显示设置隐藏":"当前状态未配置素材，保留原厂显示";
            for (String layer : LAYERS) {
                StatusBarAssetPolicy.Resolution resolution=StatusBarAssetPolicy.resolve(theme,themeId(id,layer,surface(),target),states,layer,surface());
                StatusBarThemeSpec.Binding binding = enabled && capable && !hidden ? resolution.binding : null;
                if(!hidden&&!resolution.code.equals("native_unmapped")){applicationCode=resolution.code;applicationReason=resolution.reason;}
                Resource resource = resources.get(layer);
                if (binding == null) { if (resource != null) { resource.dispose(); resources.remove(layer); target.invalidate(); } continue; }
                if (resource == null || !resource.binding.asset.equals(binding.asset)) {
                    if (resource != null) resource.dispose();
                    resource = new Resource(this, binding); resources.put(layer, resource); resource.load();
                } else {
                    if (resource.binding != binding) { resource.binding = binding;resource.drawn=false;target.invalidate(); }
                    if (resource.art == null && !resource.loading && SystemClock.uptimeMillis() >= resource.retryAt) resource.load();
                }
                if(resource.art!=null&&!resource.disposed)readyLayoutGeneration=layoutAssetGeneration;
            }
            StatusBarWifiAssetSpacingHook.changed(target);
            circleChanged(target);
        }
        boolean canRender() {
            if(hidden||!artworkActive||resources.isEmpty()||!renderEligible)return false;
            View target = view.get();
            return capable && target != null && inScope(target) && observingSurface(surface()) && displayed(target)
                    && (!virtual||SystemClock.uptimeMillis()-seenAt<1500)
                    && (!virtual||!virtualCovered(target,id)) && !resources.isEmpty() && !parentReplaced(target);
        }
        boolean inScope(View target){return external?privacyWindow(target):root.get()!=null&&below(target,root.get());}
        boolean suppressed(){View target=view.get();return hidden&&enabled&&drawingReady&&target!=null&&inScope(target)&&observingSurface(surface());}
        boolean draw(Canvas canvas, String layer) {
            View target = view.get();if(target==null)return false;
            Rect area = new Rect(target.getPaddingLeft(), target.getPaddingTop(),
                    target.getWidth()-target.getPaddingRight(), target.getHeight()-target.getPaddingBottom());
            return draw(canvas,layer,area);
        }
        boolean draw(Canvas canvas,String layer,Rect area){
            Resource resource = resources.get(layer); View target = view.get();
            if (resource == null || resource.art == null || target == null) return false;
            try {
                resource.art.draw(canvas, area, resource.binding, drawTint, density,wrapper==null?255:wrapper.originalAlpha());resource.drawn=true;
                return true;
            } catch (RuntimeException | OutOfMemoryError failure) {
                resource.art.dispose();resource.art=null;resource.error=failure.getClass().getSimpleName();resource.retryAt=SystemClock.uptimeMillis()+30000;
                readyLayoutGeneration=-1;StatusBarWifiAssetSpacingHook.changed(target);circleChanged(target);
                FeatureSettings.diagnostic(application,"ls_augment_statusbar_asset_error",bindingKey(resource)+":"+failure.getClass().getSimpleName());
                return false;
            }
        }
        void drawWrapped(Canvas canvas,Rect area){
            if(wrapper==null)return;
            if(suppressed())return;
            if(!canRender()||!StatusBarWifiAssetSpacingHook.allowArtwork(view.get())){wrapper.drawOriginal(canvas);return;}
            drawCallbackCount++;
            if(draw(canvas,"whole",area))return;
            draw(canvas,"background",area);wrapper.drawOriginal(canvas);draw(canvas,"foreground",area);
        }
        void dispose() {
            readyLayoutGeneration=-1;
            for (Resource r : resources.values()) r.dispose(); resources.clear();ACTIVE_ENTRIES.remove(this);renderEligible=false;
            View target=view.get();if(wrapper!=null&&target!=null){
                if(wrappedBackground&&target.getBackground()==wrapper)target.setBackground(wrapper.original());
                else if(!wrappedBackground&&target instanceof ImageView&&((ImageView)target).getDrawable()==wrapper)((ImageView)target).setImageDrawable(wrapper.original());
                wrapper.release();wrapper=null;target.invalidate();
            }
            StatusBarWifiAssetSpacingHook.changed(target);
        }
    }
    private static String bindingKey(Resource resource){return resource.binding.id+":"+resource.binding.asset;}
    private static final class Resource {
        final Entry owner;
        StatusBarThemeSpec.Binding binding;
        StatusBarArtwork art;
        boolean loading, disposed, drawn;
        String error="";
        long retryAt;
        Resource(Entry owner, StatusBarThemeSpec.Binding binding) { this.owner = owner; this.binding = binding; }
        void load() {
            if (loading || disposed || application == null) return;
            loading = true; String hash = binding.asset; Context context = application;long generation=layoutAssetGeneration;
            try { READER.execute(() -> {
                Drawable drawable = null; Rect inkBounds = null; String error = "";
                try {
                    byte[] encoded=read(context,hash);
                    drawable = StatusBarAssetStore.decode(encoded, StatusBarAssetStore.MAX_DECODE_SIDE);
                    inkBounds=StatusBarArtwork.staticPngInkBounds(drawable,encoded);
                }
                catch (Exception | OutOfMemoryError failed) { error = failed.getClass().getSimpleName(); }
                Drawable result = drawable; Rect resultInkBounds=inkBounds; String failure = error;
                MAIN.post(() -> {
                    loading = false; View target = owner.view.get();
                    if (disposed || target == null || generation!=layoutAssetGeneration || owner.resources.get(binding.layer)!=this) {release(result);return;}
                    if (result != null) { art = new StatusBarArtwork(result, target,resultInkBounds);this.error="";drawn=false;owner.readyLayoutGeneration=generation;target.invalidate();circleChanged(target); playback(); }
                    else { retryAt = SystemClock.uptimeMillis()+5000;
                        owner.readyLayoutGeneration=-1;
                        this.error=failure;
                        FeatureSettings.diagnostic(application, "ls_augment_statusbar_asset_error", hash+":"+failure); }
                    StatusBarWifiAssetSpacingHook.changed(target);
                });
            }); } catch (java.util.concurrent.RejectedExecutionException full) { loading = false;error="queue_full"; retryAt = SystemClock.uptimeMillis()+2000; }
        }
        void dispose() { disposed = true; if (art != null) art.dispose(); art = null; }
    }
    private static void release(Drawable drawable){if(drawable==null)return;if(drawable instanceof android.graphics.drawable.AnimatedImageDrawable)((android.graphics.drawable.AnimatedImageDrawable)drawable).stop();drawable.setCallback(null);}
    static byte[] read(Context context, String hash) throws Exception {
        synchronized (BYTES) { byte[] found = BYTES.get(hash); if (found != null) return found; }
        return ConfigReadRetry.read(() -> readUncached(context, hash));
    }
    private static byte[] readUncached(Context context, String hash) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (InputStream input = context.getContentResolver().openInputStream(Uri.parse(PROVIDER+"/statusbar-icon/"+hash))) {
            if (input == null) throw new java.io.IOException("missing artwork");
            byte[] block = new byte[8192]; int count;
            while ((count = input.read(block)) != -1) {
                if (bytes.size()+count > StatusBarAssetStore.MAX_BYTES) throw new java.io.IOException("artwork too large");
                bytes.write(block, 0, count);
            }
        }
        byte[] result = bytes.toByteArray(); StatusBarAssetStore.validate(hash, result);
        synchronized (BYTES) {
            BYTES.put(hash, result); int total = 0; for (byte[] value : BYTES.values()) total += value.length;
            java.util.Iterator<byte[]> iterator = BYTES.values().iterator();
            while (total > MAX_CACHE_BYTES && iterator.hasNext()) { total -= iterator.next().length; iterator.remove(); }
        }
        return result;
    }

    private static void playback() {
        if(ACTIVE_ENTRIES.isEmpty())return;
        int count = 0;
        List<Entry> entries = new ArrayList<>(ACTIVE_ENTRIES);
        entries.sort(Comparator.comparing((Entry e) -> e.surface()).thenComparing(e -> e.instance));
        for (Entry entry : entries) {
            boolean visible = interactive && !powerSave && entry.canRender();
            entry.animationLimited=false;
            Resource whole = entry.resources.get("whole"); boolean hasWhole = whole != null && whole.art != null;
            for (Map.Entry<String, Resource> selected : entry.resources.entrySet()) {
                Resource resource = selected.getValue(); if (resource.art == null) continue;
                boolean play = visible && (!hasWhole || selected.getKey().equals("whole")) && count < MAX_ANIMATIONS;
                if(visible&&(!hasWhole||selected.getKey().equals("whole"))&&count>=MAX_ANIMATIONS&&resource.art.animated())entry.animationLimited=true;
                if (play && resource.art.animated()) count++;
                resource.art.playing(play);
            }
        }
    }
    private static boolean parentReplaced(View view) {
        for (View parent = view.getParent() instanceof View ? (View)view.getParent() : null;
                parent != null; parent = parent.getParent() instanceof View ? (View)parent.getParent() : null) {
            Entry entry = ENTRIES.get(parent);
            if (entry != null&&entry.drawingReady&&entry.renderEligible) { Resource whole = entry.resources.get("whole"); if (whole != null && whole.art != null) return true; }
            if (StatusBarGridHook.isBarRoot(parent)) break;
        }
        return false;
    }
    private static boolean virtualCovered(View owner,String id){
        Entry physical=ENTRIES.get(owner);if(physical!=null&&physical.drawingReady&&physical.renderEligible){Resource whole=physical.resources.get("whole");if(whole!=null&&whole.art!=null)return true;}
        Map<String,Entry> parts=PARTS.get(owner);if(parts!=null&&!id.equals("dual_signal")){Entry dual=parts.get("dual_signal");if(dual!=null&&dual.drawingReady&&dual.renderEligible){Resource whole=dual.resources.get("whole");if(whole!=null&&whole.art!=null)return true;}}
        return false;
    }
    private static boolean nativeIcon(View view) {
        for (View at = view; at != null; at = at.getParent() instanceof View ? (View)at.getParent() : null) {
            Object state = cachedField(at, "mVisibleState", "iconVisibleState", "visibleState");
            if (state instanceof Number && ((Number)state).intValue()!=0) return false;
            if(!nativeCondition(at))return false;
            Object amount = cachedField(at,"mIconAppearAmount");
            if (amount instanceof Number && ((Number)amount).floatValue()<.999f) return false;
            if (StatusBarGridHook.isBarRoot(at)) break;
        }
        return true;
    }
    /** Modern containers stay attached when their bound icon has no native reason to appear. */
    private static boolean nativeCondition(View view){
        Class<?> type=view.getClass();ModernVisibility access=MODERN_VISIBILITY.get(type);
        if(access==null){access=new ModernVisibility(type);MODERN_VISIBILITY.put(type,access);}
        if(!access.modern)return true;
        if(access.predicate==null)return false;
        try{
            if(access.binding!=null&&access.binding.get(view)==null)return false;
            return Boolean.TRUE.equals(access.predicate.invoke(view));
        }catch(ReflectiveOperationException|RuntimeException unavailable){return false;}
    }
    private static boolean nativeConditions(View view){
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            if(!nativeCondition(at))return false;
            if(StatusBarGridHook.isBarRoot(at))break;
        }return true;
    }
    private static final class ModernVisibility {
        final boolean modern;
        final Method predicate;
        final java.lang.reflect.Field binding;
        ModernVisibility(Class<?> type){
            boolean found=false;for(Class<?> at=type;at!=null;at=at.getSuperclass())if(at.getSimpleName().equals("ModernStatusBarView")){found=true;break;}
            modern=found;Method method=null;java.lang.reflect.Field field=null;
            if(found){
                try{method=type.getMethod("isIconVisible");method.setAccessible(true);}catch(ReflectiveOperationException|RuntimeException ignored){}
                try{field=type.getField("binding");field.setAccessible(true);}catch(ReflectiveOperationException|RuntimeException ignored){}
            }
            predicate=method;binding=field;
        }
    }
    private static boolean displayed(View view) {
        if (!view.isAttachedToWindow() || !view.isShown() || view.getWindowVisibility()!=View.VISIBLE) return false;
        for (View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
            if (at.getVisibility()!=View.VISIBLE || at.getAlpha()<=0 || at.getTransitionAlpha()<=0) return false;
        return true;
    }
    private static String visibilityReason(View view) {
        if (!view.isAttachedToWindow()) return "所在状态栏未连接";
        String module=RedMagicLegacyUiHook.hiddenReason(view);if(!module.isEmpty())return module;
        String grid=StatusBarGridHook.hiddenReason(view);if(!grid.isEmpty())return grid;
        if (!displayed(view)) return "所在状态栏不可见";
        if (overflowDot(view)) return "溢出圆点";
        if (!nativeIcon(view)) return "系统隐藏或过渡中";
        if (view.getVisibility()!=View.VISIBLE || view.getAlpha()<=0 || view.getTransitionAlpha()<=0) return "系统当前未显示，触发条件未确认";
        return "当前显示";
    }
    private static String[] stateCandidates(View view, String id) {
        return readState(view,id).states;
    }
    private static final class StateEvidence {
        final String[] states;final String source;
        StateEvidence(String[] states,String source){this.states=states.clone();this.source=source;}
    }
    /** Adapter input from the actual bound OEM model. Never accepts guessed network state from the editor. */
    static void observeState(View view,String id,String[] states,String source){
        if(view==null||!StatusBarIconCatalog.validId(id)||states==null||states.length>24||source==null||source.length()>160)return;
        String[] copy=states.clone();for(String state:copy)if(!StatusBarThemeSpec.validState(state))return;
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(()->observeState(view,id,copy,source));return;}
        STATE_EVIDENCE.computeIfAbsent(view,key->new LinkedHashMap<>()).put(id,new StateEvidence(copy,source));
        Entry entry=ENTRIES.get(view);if(entry!=null)entry.update();
    }
    private static StateEvidence readState(View view,String id){
        Map<String,StateEvidence> explicit=STATE_EVIDENCE.get(view);if(explicit!=null&&explicit.containsKey(id))return explicit.get(id);
        List<String> states = new ArrayList<>();
        String resource=drawableResource(view).toLowerCase(java.util.Locale.ROOT);
        String provenance=resource.isEmpty()?"unknown":"native_resource:"+resource;
        if(nativeStates!=null)Collections.addAll(states,nativeStates.resolve(id,resource));
        boolean nativeSignal=false;for(String state:states)if(state.startsWith("level")||state.equals("disconnected"))nativeSignal=true;
        // Do not interpret arbitrary digits in a vendor resource name as signal strength.
        ConnectivityIconState live=view instanceof ConnectivityIconView?((ConnectivityIconView)view).sourceState():connectivity==null?ConnectivityIconState.unknown():connectivity.state;
        if (id.startsWith("battery") || id.equals("connectivity")) {
            Object raw = cachedField(view,"mBateryLevel","mBatteryLevel","level");
            Object charging = cachedField(view,"mIsCharing","mCharging","charging");
            if(live!=null&&live.bypassCharging)states.add("bypass");
            if (Boolean.TRUE.equals(charging)||live!=null&&live.charging) states.add("charging");
            if(powerSave)states.add("power_save");
            if(!(raw instanceof Number)&&live!=null)raw=live.battery;
            if (raw instanceof Number) { int level=((Number)raw).intValue(); if (level>=0&&level<=100) states.add("battery"+level); }
            if(live!=null&&live.battery>=0)provenance="battery_callback";
        }
        if (id.equals("bluetooth")) {
            if(resource.contains("disconnected"))states.add("disconnected");
            else if(resource.contains("connected"))states.add("connected");
        }
        if(id.equals("bluetooth.battery")&&bluetoothBattery>=0&&bluetoothBattery<=100){states.add("battery"+bluetoothBattery);provenance="bluetooth_battery_callback";}
        if(id.equals("wifi")||id.equals("wifi.signal")) {
            Object model=cachedField(view,"mState");Object noInternet=cachedField(model,"noDefaultNetwork","noValidatedNetwork");
            if(Boolean.TRUE.equals(noInternet))states.add("no_internet");
            if(!nativeSignal&&live!=null&&live.wifiKnown){
                if(!live.wifiConnected)states.add("disconnected");
                else if(live.wifiInternet==ConnectivityIconState.WifiInternet.UNKNOWN)states.add("unknown");
                else{if(live.wifiInternet==ConnectivityIconState.WifiInternet.NO_INTERNET)states.add("no_internet");states.add("level"+live.wifiLevel);}
                provenance="wifi_callback";
            }
        }
        if(id.matches("mobile[12](\\.signal)?")&&live!=null){
            int slot=id.charAt(6)-'1';
            for(ConnectivityIconState.Sim sim:live.sims)if(sim.slot==slot){
                if(live.airplane||sim.serviceKnown&&!sim.inService)states.add("disconnected");
                else if(!nativeSignal&&sim.serviceKnown&&sim.inService&&sim.level>=0)states.add("level"+sim.level);
                if(!nativeSignal)provenance="subscription:"+sim.subscriptionId+";slot:"+sim.slot;
            }
        }
        if(id.equals("refresh_rate")&&view instanceof TextView){String text=((TextView)view).getText().toString().trim();
            java.util.regex.Matcher refresh=java.util.regex.Pattern.compile("^(60|90|120|144|165)(?:\\s*[Hh][Zz])?$").matcher(text);
            if(refresh.matches()){states.add(refresh.group(1));provenance="native_text";}}
        states.add("default");
        // Exceptional native states must beat a simultaneously observed signal-strength asset.
        states.sort(Comparator.comparingInt(StatusBarAssetsHook::statePriority));
        return new StateEvidence(new java.util.LinkedHashSet<>(states).toArray(new String[0]),states.size()==1?"unknown":provenance);
    }
    private static int statePriority(String state){switch(state){case "bypass":return 0;case "charging":return 1;case "power_save":return 2;case "disconnected":return 3;case "no_internet":return 4;case "default":return 100;default:return state.startsWith("level")?20:10;}}
    private static String drawableResource(View view){
        if(view instanceof ImageView){int resource=WifiStandardHook.nativeResource((ImageView)view);
            if(resource>0)try{return view.getResources().getResourceEntryName(resource);}catch(RuntimeException ignored){}}
        String name=RESOURCE_NAMES.get(view);if(name!=null)return name;
        if(view instanceof ViewGroup){View signal=find(view,"wifi_signal");if(signal==null)signal=find(view,"mobile_signal");if(signal!=null&&signal!=view)return drawableResource(signal);}
        Object resource=cachedField(view,"mResource");if(resource instanceof Integer&&(Integer)resource!=0&&(Integer)resource!=View.NO_ID)try{return view.getResources().getResourceEntryName((Integer)resource);}catch(RuntimeException ignored){}
        Object icon=cachedField(view,"mIcon");Object nativeIcon=cachedField(icon,"icon");
        if(nativeIcon instanceof android.graphics.drawable.Icon){android.graphics.drawable.Icon value=(android.graphics.drawable.Icon)nativeIcon;
            if(value.getType()==android.graphics.drawable.Icon.TYPE_RESOURCE)try{return view.getResources().getResourceEntryName(value.getResId());}catch(RuntimeException ignored){}}
        return "";
    }

    private static void publish() {
        if (application==null) return;
        long now=SystemClock.uptimeMillis();
        if(now-reportedAt<5000)return;
        reportedAt=now;inventoryCount++;
        try {
            List<InventoryRow> rows=new ArrayList<>();
            Map<String,Integer> rowCounts=new HashMap<>();
            final java.util.Set<String> observedSurfaces=new java.util.LinkedHashSet<>();
            for(ViewGroup root:ROOTS.keySet())if(root!=null&&root.isAttachedToWindow()&&observingSurface(surfaceOf(root)))observedSurfaces.add(surfaceOf(root));
            List<Entry> all=allEntries(); all.sort(Comparator.comparing(e->e.instance));
            for(Entry entry:all) {
                View view=entry.view.get(); if(view==null||!entry.inScope(view))continue;
                if(!observedSurfaces.contains(entry.surface()))continue;
                int count=rowCounts.getOrDefault(entry.surface(),0);if(count>=120)continue;rowCounts.put(entry.surface(),count+1);
                if(!bound(entry.id)){View source=entry.stateSource.get();StateEvidence evidence=readState(source==null?view:source,entry.id);entry.states=evidence.states;entry.stateProvenance=evidence.source;}
                boolean visible=!entry.suppressed()&&displayed(view)&&nativeIcon(view)&&(!entry.virtual||SystemClock.uptimeMillis()-entry.seenAt<1500);
                boolean renderingSupported=entry.capable&&!UNSUPPORTED_DRAW_CLASSES.contains(view.getClass())&&(entry.virtual||drawableAdapter(view)||drawingMethod(view)!=null);
                rows.add(new InventoryRow(entry,entry.capable?(visible?"visible":overflowDot(view)?"dot":"hidden"):"unsupported",
                        !renderingSupported&&entry.capable?"已发现；此组件暂不支持安全替换":entry.suppressed()?"已按此位置的显示设置隐藏":entry.capable?(entry.animationLimited?"当前显示；超过 8 个动画预算，暂停动画":entry.virtual&&!visible?"对应模块组件当前未绘制":visibilityReason(view)):entry.unsupportedReason,
                        renderingSupported?"whole_layers":"observe_only"));
                if(rows.size()>=480)break;
            }
            JSONObject runtime=runtime();
            final long observed=System.currentTimeMillis();
            final long capturedElapsed=SystemClock.elapsedRealtime();
            Context context=application;
            synchronized(INVENTORY_SUBMISSION) {
            final long generation=++inventoryGeneration;
            REPORTER.execute(()->{try{
                if(generation!=inventoryGeneration)return;
                for(String surface:observedSurfaces){JSONArray current=new JSONArray();for(InventoryRow row:rows)if(row.surface.equals(surface))current.put(row.json());storeSurfaceSnapshot(surface,current,observed);}
                JSONObject surfaces=new JSONObject().put("main",mainSnapshot).put("lock",lockSnapshot).put("notification",notificationSnapshot).put("control",controlSnapshot);
                String payload=new JSONObject().put("version",1).put("session",SESSION).put("observedAt",observed)
                        .put("surfaceObservedAt",new JSONObject().put("main",mainObservedAt).put("lock",lockObservedAt).put("notification",notificationObservedAt).put("control",controlObservedAt))
                        .put("observedSurfaces",new JSONArray(new ArrayList<>(observedSurfaces)))
                        .put("surfaces",surfaces).put("runtime",runtime).toString();
                pendingInventory=new InventoryPublication(context,payload,capturedElapsed,generation);
                publishInventory(pendingInventory);
            }catch(Exception failure){FeatureSettings.diagnostic(context,"ls_augment_statusbar_inventory_error",failure.toString());}});
            }
        } catch(Exception failure) { FeatureSettings.diagnostic(application,"ls_augment_statusbar_inventory_error",failure.toString()); }
    }
    // Confined to REPORTER. Retry the latest captured payload without rescanning UI or
    // resending an obsolete surface observation after a new publication replaces it.

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static InventoryPublication pendingInventory;
    private static final ConfigBridgeReadiness INVENTORY_BRIDGE=new ConfigBridgeReadiness();
    private static final Object INVENTORY_SUBMISSION=new Object();
    private static volatile long inventoryGeneration;
    private static final java.util.concurrent.ScheduledExecutorService INVENTORY_RETRY=
            java.util.concurrent.Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"LSA-InventoryRetry");t.setDaemon(true);return t;});
    private static final class InventoryPublication {
        final Context context;final String payload;final long started,generation;int failures,waits;
        InventoryPublication(Context context,String payload,long capturedElapsed,long generation){this.context=context;this.payload=payload;this.started=capturedElapsed;this.generation=generation;}
    }
    private static void publishInventory(InventoryPublication item) {
        if(pendingInventory!=item||item.generation!=inventoryGeneration)return;
        String error="";
        try {
            ConfigBridgeReadiness.Result status=INVENTORY_BRIDGE.check(item.context);
            FeatureSettings.diagnostic(item.context,"ls_augment_statusbar_inventory_bridge_probe_error",status.probeError);
            if(status.waiting()){
                // Keep the latest captured payload and its original timestamp.
                // Startup waiting neither invents a failure nor clears history.
                long delay=Math.min(30_000L,1000L<<Math.min(5,item.waits++));
                scheduleInventoryRetry(item,delay,status.state);return;
            }
            if(!status.ready())error=status.error;
            else {
                if(SystemClock.elapsedRealtime()-item.started>=60_000L){
                    pendingInventory=null;
                    // Readiness may take longer than an observation's validity.
                    // Capture current UI state instead of publishing stale pixels.
                    MAIN.post(()->{reportedAt=0;publish();});return;
                }
                Bundle extras=new Bundle();extras.putString("payload",item.payload);
                Bundle response=item.context.getContentResolver().call(PROVIDER,"statusbar_inventory_publish",null,extras);
                if(response==null||!response.getBoolean("ok",false))error=inventoryRejection(response);
            }
        }catch(Exception failure){error=ConfigBridgeReadiness.callFailure(failure);}
        if(item.generation!=inventoryGeneration)return;
        FeatureSettings.diagnostic(item.context,"ls_augment_statusbar_inventory_error",error);
        if(error.isEmpty()) {
            pendingInventory=null;
            FeatureSettings.diagnostic(item.context,"ls_augment_statusbar_inventory_bridge_state","ready;time="+System.currentTimeMillis());
            return;
        }
        long delay=ls.augment.com.InventoryRetryPolicy.delay(++item.failures,SystemClock.elapsedRealtime()-item.started);
        scheduleInventoryRetry(item,delay,"failed");
    }
    private static String inventoryRejection(Bundle response){
        if(response==null)return "inventory_rejected:reply_missing";
        String reason=response.getString("reason","");
        // Only fixed protocol codes and numeric positions/limits cross into persistent logs.
        switch(reason){
            case "caller_user_mismatch":case "caller_not_systemui":case "payload_missing":case "payload_too_large":
            case "json_invalid":case "version_invalid":case "session_or_time_missing":case "session_invalid":case "observed_at_invalid":
            case "surfaces_invalid":case "surface_invalid":case "surface_rows_invalid":case "too_many_rows":
            case "row_invalid":case "row_id_missing":case "row_id_invalid":case "row_too_large":case "observation_out_of_order":break;
            default:return "inventory_rejected:reason_unavailable";
        }
        return "inventory_rejected:"+reason+";chars="+response.getInt("payloadChars",-1)
                +";surfaceIndex="+response.getInt("surfaceIndex",-1)+";rowIndex="+response.getInt("rowIndex",-1)
                +";actual="+response.getLong("actual",-1)+";limit="+response.getLong("limit",-1);
    }
    private static void scheduleInventoryRetry(InventoryPublication item,long delay,String state){
        FeatureSettings.diagnostic(item.context,"ls_augment_statusbar_inventory_bridge_state",
                state+";attempt="+item.failures+";retryMs="+delay+";time="+System.currentTimeMillis());
        if(delay>=0)INVENTORY_RETRY.schedule(()->{
            // The submission lock prevents an old retry from evicting a queued fresh
            // capture in REPORTER's bounded discard-oldest queue.
            synchronized(INVENTORY_SUBMISSION){
                if(item.generation==inventoryGeneration)REPORTER.execute(()->{
                    if(pendingInventory==item&&item.generation==inventoryGeneration)publishInventory(item);
                });
            }
        },delay,TimeUnit.MILLISECONDS);
        else if(pendingInventory==item)pendingInventory=null;
    }
    private static final class InventoryRow{
        final String id,instance,state,reason,capability,surface,application,applicationReason,matchedState,matchedAsset,coveredBy,stateSource,activeDataRole;final String[] states;
        InventoryRow(Entry entry,String state,String reason,String capability){
            this.id=inventoryId(entry.id);boolean unchanged=this.id.equals(entry.id);String instance=entry.instance;
            this.instance=unchanged&&instance!=null&&instance.length()<=128?instance:this.id+":"+Integer.toHexString(instance==null?0:instance.hashCode());
            this.state=unchanged?state:"unsupported";this.reason=unchanged?reason:"未识别的系统图标";
            this.capability=unchanged?capability:"observe_only";this.states=entry.states.clone();surface=entry.surface();stateSource=entry.stateProvenance;
            activeDataRole=activeRole(entry.id)?"mobile_data"+entry.id.substring(7):"";
            View view=entry.view.get();coveredBy=view==null?"":coveringId(view,entry.id,entry.virtual);
            String code=entry.applicationCode,detail=entry.applicationReason,matched="",asset="";
            Resource whole=entry.resources.get("whole");
            boolean wholeReady=whole!=null&&!whole.disposed&&!whole.loading&&whole.art!=null&&whole.error.isEmpty();
            for(Resource resource:entry.resources.values()){
                // A decoded whole replaces the other layers in the actual draw path.
                if(wholeReady&&resource!=whole)continue;
                if(!resource.error.isEmpty()){code="load_failed";detail="素材读取失败，暂用原厂："+resource.error;continue;}
                if(resource.loading||resource.art==null){code="loading";detail="正在加载素材，暂用原厂";continue;}
                matched=resource.binding.state;asset=resource.binding.asset;code=resource.drawn?"applied":"ready";
                detail=resource.drawn?"此状态素材已绘制":"素材就绪，等待该组件绘制";
            }
            if(!enabled){code="disabled";detail="状态栏自定义未启用，保留原厂";}
            else if(capability.equals("observe_only")){code="unsupported";detail="此组件仅可观察，保留原厂";}
            else if(entry.suppressed()){code="hidden_by_policy";detail="已按此位置的显示设置隐藏";}
            else if(!coveredBy.isEmpty()){code="covered_by_parent";detail="被 "+coveredBy+" 的整组素材覆盖";}
            else if(!state.equals("visible")){code="native_hidden";detail=reason;}
            application=code;applicationReason=detail;matchedState=matched;matchedAsset=asset;
        }
        JSONObject json()throws org.json.JSONException{return new JSONObject().put("id",id).put("instance",instance).put("state",state).put("reason",reason).put("capability",capability).put("states",new JSONArray(java.util.Arrays.asList(states)))
                .put("surface",surface).put("application",application).put("applicationReason",applicationReason).put("matchedState",matchedState).put("matchedAsset",matchedAsset).put("coveredBy",coveredBy).put("stateSource",stateSource).put("activeDataRole",activeDataRole);}
    }
    private static String coveringId(View view,String id,boolean virtual){
        for(View at=virtual?view:view.getParent() instanceof View?(View)view.getParent():null;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            Entry parent=ENTRIES.get(at);if(parent!=null&&parent.drawingReady&&parent.renderEligible){Resource whole=parent.resources.get("whole");if(whole!=null&&whole.art!=null)return parent.id;}
            if(StatusBarSurfaceSpec.valid(surfaceOf(at)))break;
        }
        if(virtual&&!id.equals("dual_signal")){Map<String,Entry> parts=PARTS.get(view);Entry dual=parts==null?null:parts.get("dual_signal");if(dual!=null&&dual.renderEligible){Resource whole=dual.resources.get("whole");if(whole!=null&&whole.art!=null)return dual.id;}}
        return "";
    }
    private static JSONObject runtime() throws org.json.JSONException {
        int loaded=0,playing=0,cached=0;
        for(Entry entry:allEntries())for(Resource resource:entry.resources.values())if(resource.art!=null){loaded++;if(resource.art.running())playing++;}
        synchronized(BYTES){for(byte[] bytes:BYTES.values())cached+=bytes.length;}
        return new JSONObject().put("enabled",enabled).put("interactive",interactive).put("powerSave",powerSave)
                .put("activeSurface",privacySurface()).put("playingAnimations",playing).put("loadedDrawables",loaded).put("cachedSourceBytes",cached)
                .put("treeScans",scanCount).put("stateUpdates",stateUpdateCount).put("drawCallbacks",drawCallbackCount).put("inventorySamples",inventoryCount)
                .put("drawHooks",DRAW_HOOKS.size());
    }

    static Typeface typeface(View view, String role, Typeface fallback) {
        return typeface(view,role,fallback,fallback);
    }
    static Typeface typeface(View view, String role, Typeface fallback, Typeface original) {
        if(!typographyActive||!enabled)return fallback;
        String reference=fonts.resolve(role,surfaceFor(view));
        if(reference==null||reference.isEmpty()||reference.equals("inherit"))return fallback;
        if (view==null || !inAssetSurface(view)) return fallback;
        if(!(view instanceof TextView))PAINT_FONTS.add(view);
        if(role.equals("clock")&&view instanceof TextView)original=nativeTypeface((TextView)view,original);
        if(view instanceof TextView&&original!=null&&!FONTS.containsKey(view))FONTS.put((TextView)view,new FontState(original));
        if (reference.equals("original")) return original;
        Typeface result=ManagedFont.loadAsync(view.getContext(),reference,FONT_READY);
        return result==null?fallback:weighted(result,weightBase(view,role,original));
    }
    static boolean ownsFont(View view) {
        if (!typographyActive||!(view instanceof TextView)||!enabled||!inAssetSurface(view))return false;
        String reference=fonts.resolve(fontRole(view),surfaceFor(view));return reference!=null&&!reference.isEmpty()&&!reference.equals("inherit");
    }
    static void applyFont(TextView view,String role) {
        // FONT_READY also reaches this path. Keep the visible fallback native;
        // the grid compares the resolved wanted font's geometry before retrying.
        if(role.equals("clock")&&SystemUiHook.holdsNativeClock(view)){view.invalidate();return;}
        if((!typographyActive||!enabled)&&!FONTS.containsKey(view))return;
        String selected=enabled&&typographyActive?fonts.resolve(role,surfaceFor(view)):"";
        if(selected==null||selected.isEmpty()||selected.equals("inherit")){restoreFont(view);return;}
        if (!inAssetSurface(view)) {restoreFont(view);return;}
        Typeface baseline=role.equals("clock")?nativeTypeface(view,view.getTypeface()):view.getTypeface();
        FontState state=FONTS.get(view);
        if(state==null){state=new FontState(baseline);FONTS.put(view,state);}
        Typeface next=selected.equals("original")?state.original:ManagedFont.loadAsync(view.getContext(),selected,FONT_READY);
        if(next==null)next=state.original;
        else if(!selected.equals("original"))next=weighted(next,weightBase(view,role,state.original));
        if(!java.util.Objects.equals(view.getTypeface(),next)){view.setTypeface(next);view.requestLayout();view.invalidate();}
        state.applied=next;
    }
    private static void restoreFont(TextView view) {
        FontState state=FONTS.remove(view);
        if(state!=null&&view.getTypeface()==state.applied){view.setTypeface(state.original);view.requestLayout();view.invalidate();}
    }
    private static final class FontState { final Typeface original;Typeface applied;FontState(Typeface type){original=type;} }
    /** Clock styling and global typography must share one pre-customization restoration baseline. */
    static Typeface nativeTypeface(TextView view,Typeface fallback){
        if(!CLOCK_BASELINES.containsKey(view))CLOCK_BASELINES.put(view,fallback);
        return CLOCK_BASELINES.get(view);
    }
    private static Typeface weighted(Typeface selected,Typeface original){return selected==null||original==null?selected:Typeface.create(selected,Math.max(1,Math.min(1000,original.getWeight())),original.isItalic());}
    private static Typeface weightBase(View view,String role,Typeface original){
        if(role.equals("clock")&&(FeatureSettings.enabled(view.getContext(),ConfigSchema.STATUSBAR_CLOCK_CUSTOM)
                ||SystemUiHook.GRID_CLOCK_TAG.equals(view.getTag())))
            return Typeface.create(original==null?Typeface.DEFAULT:original,FeatureSettings.integer(view.getContext(),ConfigSchema.STATUSBAR_CLOCK_WEIGHT,400,100,900),false);
        if(original==null&&role.equals("battery"))return Typeface.DEFAULT_BOLD;
        if(original==null&&role.equals("bluetooth"))return Typeface.create("sans-serif-medium",Typeface.NORMAL);
        return original;
    }
    private static void invalidatePaintFonts(){for(View view:new ArrayList<>(PAINT_FONTS))if(view!=null&&inAssetSurface(view)){view.invalidate();circleChanged(view);}}
    private static List<Entry> allEntries(){List<Entry> entries=new ArrayList<>(ENTRIES.values());for(Map<String,Entry> parts:PARTS.values())entries.addAll(parts.values());return entries;}
    static boolean drawLayer(View owner,Canvas canvas,String id,String layer,float left,float top,float right,float bottom,int color) {
        return drawLayer(owner,owner,canvas,id,layer,left,top,right,bottom,color);
    }
    static boolean drawLayer(View owner,View stateSource,Canvas canvas,String id,String layer,float left,float top,float right,float bottom,int color) {
        return drawLayer(owner,stateSource,canvas,id,layer,left,top,right,bottom,color,false);
    }
    static boolean drawLayer(View owner,View stateSource,Canvas canvas,String id,String layer,float left,float top,float right,float bottom,int color,boolean fitStaticPngInk) {
        if(isHidden(owner,id))return true;
        Entry entry=virtualEntry(owner,stateSource,id);if(entry==null)return false;
        Resource resource=entry.resources.get(layer);if(resource==null||resource.art==null)return false;
        try{resource.art.draw(canvas,new Rect((int)left,(int)top,(int)Math.ceil(right),(int)Math.ceil(bottom)),resource.binding,color,owner.getResources().getDisplayMetrics().density,255,fitStaticPngInk);resource.drawn=true;return true;}
        catch(RuntimeException|OutOfMemoryError failed){resource.art.dispose();resource.art=null;resource.error=failed.getClass().getSimpleName();resource.retryAt=SystemClock.uptimeMillis()+30000;circleChanged(owner);return false;}
    }
    /** Measurement and draw use the same live virtual resource eligibility. */
    static boolean virtualWholeReady(View owner,String id){
        if(isHidden(owner,id))return false;
        Entry entry=virtualEntry(owner,owner,id);
        Resource whole=entry==null?null:entry.resources.get("whole");
        return whole!=null&&!whole.disposed&&whole.art!=null;
    }
    private static Entry virtualEntry(View owner,View stateSource,String id){
        if(!artworkActive||!bound(id))return null;
        if(!inAssetSurface(owner))return null;
        Map<String,Entry> parts=PARTS.get(owner);if(parts==null){parts=new LinkedHashMap<>();PARTS.put(owner,parts);}
        Entry entry=parts.get(id);
        if(entry==null){ViewGroup root=null;for(View at=owner;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(at instanceof ViewGroup&&StatusBarSurfaceSpec.valid(surfaceOf(at))){root=(ViewGroup)at;break;}
            entry=new Entry(owner,root,id,supported(id),"");entry.virtual=true;parts.put(id,entry);entry.update();scheduleArtworkTick();}
        View source=stateSource==null?owner:stateSource;if(entry.stateSource.get()!=source)entry.stateSource=new WeakReference<>(source);
        entry.seenAt=SystemClock.uptimeMillis();
        if(!entry.canRender())return null;
        return entry;
    }
    interface CircleDrawing {Object draw() throws Throwable;}
    static Object drawCircle(ConnectivityIconView circle,Canvas canvas,CircleDrawing normal) throws Throwable {
        if(!circle.frameCurrent())return null;
        Entry selected=ENTRIES.get(circle);
        if(selected!=null&&selected.suppressed())return null;
        Rect area=circle.artworkRect();
        if(selected==null||!selected.canRender())return normal.draw();
        drawCallbackCount++;
        if(circle.wholeCovered()){
            if(!selected.draw(canvas,"whole",area))circle.drawFailed();
            return null;
        }
        selected.draw(canvas,"background",area);Object result=normal.draw();selected.draw(canvas,"foreground",area);return result;
    }
    /** Circle alone may measure its pending View while Grid still owns alpha=0.
     * Parents, native eligibility and transition alpha remain authoritative. */
    private static boolean circleMeasureEligible(Entry entry,ConnectivityIconView owner){
        if(entry==null||entry.hidden||!entry.capable||!entry.renderEligible||!entry.drawingReady
                ||!artworkActive||!entry.inScope(owner)||!observingSurface(entry.surface())||parentReplaced(owner)||!nativeIcon(owner)
                ||!owner.isAttachedToWindow()||!owner.isShown()||owner.getWindowVisibility()!=View.VISIBLE)return false;
        for(View at=owner;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
            if(at.getVisibility()!=View.VISIBLE||at.getTransitionAlpha()<=0||(at!=owner&&at.getAlpha()<=0))return false;
        return true;
    }
    private static void circleChanged(View view){if(view instanceof ConnectivityIconView)((ConnectivityIconView)view).artworkChanged();}
    private static final String[] CIRCLE_PARTS={"wifi.signal","mobile1.signal","mobile2.signal","battery.shell","battery.fill","battery.charging","battery.bypass"};
    static final class CircleLayers {
        final String token;final boolean whole,ring;final java.util.Set<String> readyParts;
        CircleLayers(String t,boolean w,boolean r,java.util.Set<String> p){token=t;whole=w;ring=r;readyParts=java.util.Collections.unmodifiableSet(new java.util.HashSet<>(p));}
    }
    /** Reuses physical ENTRIES for connectivity; never creates a virtual whole. */
    static CircleLayers prepareCircle(ConnectivityIconView owner){
        ViewGroup root=null;for(View at=owner;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
            if(at instanceof ViewGroup&&StatusBarGridHook.isBarRoot(at)){root=(ViewGroup)at;break;}
        if(root!=null&&(artworkActive||visibilityActive)){
            observe(owner,root,"connectivity",supported("connectivity"),"");
            Map<String,Entry> parts=PARTS.get(owner);
            for(String id:CIRCLE_PARTS)if(artworkActive&&bound(id)&&inAssetSurface(owner)){
                if(parts==null){parts=new LinkedHashMap<>();PARTS.put(owner,parts);}
                Entry entry=parts.get(id);
                if(entry==null){entry=new Entry(owner,root,id,supported(id),"");entry.virtual=true;parts.put(id,entry);}
                entry.seenAt=SystemClock.uptimeMillis();entry.update();
            }
        }
        return circleLayers(owner);
    }
    /** No state matching/loading here: safe for a draw-time generation check. */
    static CircleLayers circleLayers(ConnectivityIconView owner){
        StringBuilder token=new StringBuilder().append(layoutAssetGeneration).append('/').append(artworkActive).append('/').append(visibilityActive);
        Entry physical=ENTRIES.get(owner);boolean whole=circleReadyLayer(physical,owner,"whole");
        appendCircleEntry(token,physical,owner);boolean ring=false;java.util.Set<String> ready=new java.util.HashSet<>();Map<String,Entry> parts=PARTS.get(owner);
        for(String id:CIRCLE_PARTS){Entry e=parts==null?null:parts.get(id);token.append(';').append(id);appendCircleEntry(token,e,owner);
            for(String layer:LAYERS)if(circleReadyLayer(e,owner,layer)){
                ready.add(id);if(id.equals("battery.shell")||id.equals("battery.fill"))ring=true;}}
        return new CircleLayers(token.toString(),whole,ring,ready);
    }
    private static boolean circleReadyLayer(Entry e,ConnectivityIconView owner,String layer){
        Resource r=e==null?null:e.resources.get(layer);
        return circleMeasureEligible(e,owner)&&(!e.virtual||SystemClock.uptimeMillis()-e.seenAt<1500&&!virtualCovered(owner,e.id))
                &&r!=null&&!r.disposed&&r.art!=null;
    }
    private static void appendCircleEntry(StringBuilder out,Entry e,ConnectivityIconView owner){
        out.append(':').append(circleMeasureEligible(e,owner));if(e==null)return;
        out.append(':').append(java.util.Arrays.toString(e.states)).append(':').append(e.hidden);
        for(String layer:LAYERS){Resource r=e.resources.get(layer);out.append(':').append(layer);
            if(r!=null)out.append('=').append(r.binding.asset).append(',').append(r.binding.scale).append(',').append(r.binding.offsetX).append(',').append(r.binding.offsetY)
                    .append(',').append(r.binding.mirror).append(',').append(r.disposed).append(',').append(System.identityHashCode(r.art));}
    }
    static String fontRole(View view) {
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
            String role=role(at,"other");if(!role.equals("other"))return role;
            if(StatusBarGridHook.isBarRoot(at))break;
        }return "other";
    }
    private static String role(View view,String inherited) {
        String value=(name(view)+" "+view.getClass().getSimpleName()+" "+String.valueOf(view.getTag())).toLowerCase(java.util.Locale.ROOT);
        if(value.contains("metric")||value.contains("thermal")||value.contains("cpu")||value.contains("gpu"))return "metrics";
        if(value.contains("clock"))return "clock";
        if(value.contains("netspeed")||value.contains("network")||value.contains("speed"))return "network";
        if(value.contains("bluetooth"))return "bluetooth";
        if(value.contains("battery"))return "battery";
        return inherited;
    }
    /** Class/role adapters are deliberately narrow: never classify the complete panel or a tile as status-bar chrome. */
    private static String surfaceOf(View root) {
        Root known=ROOTS.get(root);return known==null?detectSurface(root):known.surface;
    }
    private static String detectSurface(View root) {
        if(root==null)return "";
        for(Class<?> type=root.getClass();type!=null;type=type.getSuperclass()){
            String name=type.getName();
            if(name.equals("com.android.systemui.statusbar.phone.PhoneStatusBarView"))return "main";
            if(name.equals("com.android.systemui.statusbar.phone.KeyguardStatusBarView"))return "lock";
            if(name.equals("com.zte.controlcenter.widget.CCHeaderView")){
                try{Object role=SystemUiAdapter.call(root,"getPanelType");if(role instanceof Integer){
                    return StatusBarSurfaceSpec.fromPanelType((Integer)role);
                }}catch(ReflectiveOperationException|RuntimeException ignored){}
                return "";
            }
            if(name.equals("com.android.systemui.util.NoRemeasureMotionLayout")&&name(root).equals("split_shade_status_bar"))return "notification";
        }
        return "";
    }
    static String surfaceFor(View view){
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){String surface=surfaceOf(at);if(!surface.isEmpty())return surface;}
        return view!=null&&privacyWindow(view)?privacySurface():"";
    }
    private static boolean inAssetSurface(View view){
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(!surfaceOf(at).isEmpty())return true;
        return false;
    }
    static boolean isHidden(View view,String semanticId){return view!=null&&(enabled&&visibilityActive&&scopedHidden(view,semanticId,surfaceFor(view))||RedMagicLegacyUiHook.hiddenFor(view,semanticId));}
    static boolean nativeLayoutHidden(View view){
        return view!=null&&enabled&&visibilityActive&&scopedHidden(view,semanticId(view),surfaceFor(view));
    }
    private static boolean scopedHidden(View view,String id,String surface){
        if(!enabled||!visibilityActive)return false;
        return visibility.hidden(surface,id)||activeRole(id,view)&&visibility.hidden(surface,"mobile_data"+id.substring(7));
    }
    static boolean hiddenByPolicy(View view){
        Entry entry=ENTRIES.get(view);return entry!=null&&entry.drawingReady&&entry.hidden;
    }
    private static boolean bound(String id){return BOUND_IDS.contains(id)||dataAliasBound&&mobileSlot(id)>=0&&BOUND_IDS.contains("mobile_data"+id.substring(7));}
    private static int mobileSlot(String id){return id!=null&&id.startsWith("mobile")&&id.length()>=7&&(id.length()==7||id.charAt(7)=='.')&&(id.charAt(6)=='1'||id.charAt(6)=='2')?id.charAt(6)-'1':-1;}
    private static boolean activeRole(String id){return activeRole(id,null);}
    private static boolean activeRole(String id,View owner){
        int slot=mobileSlot(id);if(slot<0)return false;
        ConnectivityIconState state=owner instanceof ConnectivityIconView?((ConnectivityIconView)owner).sourceState():connectivity==null?ConnectivityIconState.unknown():connectivity.state;
        ConnectivityIconState.Sim active=state.activeDataSim();
        return active!=null&&active.slot==slot;
    }
    private static String themeId(String id,String layer,String surface){return themeId(id,layer,surface,null);}
    private static String themeId(String id,String layer,String surface,View owner){
        if(!dataAliasBound||!activeRole(id,owner))return id;
        String alias="mobile_data"+id.substring(7);
        if(!BOUND_IDS.contains(alias))return id;
        for(StatusBarThemeSpec.Binding b:theme.entries())if(b.id.equals(id)&&b.layer.equals(layer)&&(b.surface.equals(surface)||b.surface.equals("all")))return id;
        return alias;
    }
    /** Cache successful and missing fields; missing vendor fields must not throw once per frame. */
    private static Object cachedField(Object owner,String...names){
        if(owner==null)return null;
        Map<String,java.lang.reflect.Field> byName=FIELDS.get(owner.getClass());
        if(byName==null){byName=new HashMap<>();FIELDS.put(owner.getClass(),byName);}
        for(String key:names){
            if(!byName.containsKey(key)){
                java.lang.reflect.Field found=null;
                for(Class<?> at=owner.getClass();at!=null;at=at.getSuperclass())try{found=at.getDeclaredField(key);found.setAccessible(true);break;}catch(ReflectiveOperationException|RuntimeException ignored){}
                byName.put(key,found);
            }
            java.lang.reflect.Field found=byName.get(key);if(found!=null)try{return found.get(owner);}catch(ReflectiveOperationException|RuntimeException ignored){}
        }return null;
    }
    private static String slotOf(View view){
        Class<?> type=view.getClass();String className=type.getName();
        if(!className.contains("StatusBar")&&!className.contains("StatusIcon")&&!className.contains("IconView"))return null;
        if(!SLOT_METHODS.containsKey(type)){
            Method found=null;for(Class<?> at=type;at!=null;at=at.getSuperclass())try{found=at.getDeclaredMethod("getSlot");found.setAccessible(true);break;}catch(ReflectiveOperationException|RuntimeException ignored){}
            SLOT_METHODS.put(type,found);
        }
        Method method=SLOT_METHODS.get(type);
        if(method!=null)try{Object value=method.invoke(view);if(value instanceof String)return ((String)value).trim();}catch(ReflectiveOperationException|RuntimeException ignored){}
        Object value=cachedField(view,"mSlot","slot");return value instanceof String?((String)value).trim():null;
    }
    private static String privacySurface() {
        String header="";
        for(ViewGroup root:ROOTS.keySet())if(root!=null&&displayed(root)){
            String surface=surfaceOf(root);if(!surface.equals("control")&&!surface.equals("notification"))continue;
            if(!header.isEmpty()&&!header.equals(surface))return "";
            header=surface;
        }
        return header.isEmpty()?activeSurface:header;
    }
    private static boolean below(View view,View root){for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(at==root)return true;return false;}
    private static String name(View view){if(view.getId()==View.NO_ID||view.getId()==0)return "";try{return view.getResources().getResourceEntryName(view.getId());}catch(Exception ignored){return "";}}
    private static View find(View view,String id){if(name(view).equals(id))return view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View found=find(((ViewGroup)view).getChildAt(i),id);if(found!=null)return found;}return null;}
    private static int tint(View view) {
        if(view instanceof TextView)return ((TextView)view).getCurrentTextColor();
        if(view instanceof ImageView){ColorStateList colors=((ImageView)view).getImageTintList();if(colors!=null)return colors.getColorForState(view.getDrawableState(),colors.getDefaultColor());}
        Drawable background=view.getBackground();if(background instanceof StatusBarAssetDrawable)background=((StatusBarAssetDrawable)background).original();
        if(background instanceof android.graphics.drawable.GradientDrawable){ColorStateList colors=((android.graphics.drawable.GradientDrawable)background).getColor();if(colors!=null)return colors.getColorForState(view.getDrawableState(),colors.getDefaultColor());}
        Object color=cachedField(view,"mCurrentSetColor","mDrawableColor","mIconColor");if(color instanceof Integer&&(Integer)color!=0)return (Integer)color;
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(StatusBarGridHook.isBarRoot(at)){View clock=find(at,"clock");if(clock instanceof TextView)return ((TextView)clock).getCurrentTextColor();break;}
        return 0xffffffff;
    }
}
