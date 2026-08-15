package ls.augment.com.hook;

import android.app.Application;
import android.app.Instrumentation;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.UserHandle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import io.github.libxposed.api.XposedInterface.ExceptionMode;
import io.github.libxposed.api.XposedInterface.HookBuilder;
import io.github.libxposed.api.XposedInterface.HookHandle;
import io.github.libxposed.api.XposedModule;
import io.github.libxposed.api.XposedModuleInterface.ModuleLoadedParam;
import io.github.libxposed.api.XposedModuleInterface.PackageReadyParam;

/**
 * LS_Augment Modern Xposed entry. libxposed API 102 only.
 *
 * The APK's Root bridge owns the real per-user PackageManager state. This
 * module is scoped to Settings, Launcher/Quickstep, SystemUI, Beautify,
 * DoubleApp, and the OEM game-assist packages. Settings keeps the exact
 * userId:packageName filtering path. The shoulder-key hooks only
 * relax OEM package-eligibility gates and leave TGK/InputManager execution,
 * mapping, persistence, and lifecycle ownership to the ROM.
 */
public final class AugmentModule extends XposedModule {
    private static final String TAG = "LS_Augment";
    private static final String VERSION = "2.0.0-alpha1-test20035";
    private static final String SETTINGS_PACKAGE = "com.android.settings";
    private static final String SETTINGS_PROCESS = "com.android.settings";
    private static final String SYSTEMUI_PACKAGE = "com.android.systemui";
    private static final String BEAUTIFY_PACKAGE = "com.zte.beautify";
    private static final String BEAUTIFY_ADAPTER_PACKAGE = "com.zte.beautifyadapter";
    private static final String DOUBLE_APP_PACKAGE = "com.zte.cn.doubleapp";
    private static final String LAUNCHER_PACKAGE = "com.zte.mifavor.launcher";
    private static final String GAME_SPACE_PACKAGE = "cn.nubia.gamelauncher";
    private static final String GAME_ASSIST_PACKAGE = "cn.nubia.gameassist";
    private static final String GAME_HELPER_PACKAGE = "cn.nubia.gamehelpmodule";
    private static final String GAME_HELPER_LINE_PACKAGE = "cn.nubia.gamehelperline";
    private static final String TGK_HELPER_CLASS = "cn.nubia.tgk.TgkHelper";
    private static final String TGK_MAP_VIEW_CLASS = "cn.nubia.tgk.TgkMapView";
    private static final String GAME_SPACE_PLUGIN_CONFIG_CLASS =
            "cn.nubia.gamelauncher.gamecontrolpanel.config.PluginConfig";
    private static final String GAME_ASSIST_PLUGIN_CONFIG_CLASS =
            "cn.nubia.gameassist.plugin.config.PluginConfig";
    private static final String GAME_ASSIST_FEATURE_CLASS =
            "com.zte.gameassist.config.ZteFeature";
    private static final String GAME_ASSIST_UTILS_CLASS =
            "cn.nubia.gameassist.utils.Utils";
    private static final String GAME_ASSIST_SUBVIEW_CONTROLLER_CLASS =
            "cn.nubia.gameassist.operation.SubViewController";
    private static final String GAME_HELPER_PACKAGE_UTILS_CLASS =
            "cn.nubia.gamehelper.utils.PackageUtils";
    private static final String GAME_HELPER_DB_HELPER_CLASS =
            "cn.nubia.gamehelper.db.DbHelper";
    private static final String GAME_HELPER_DATABASE_CLASS =
            "cn.nubia.gamehelper.db.RecordMotionDatabase";
    private static final String GAME_HELPER_PROVIDER_CLASS =
            "cn.nubia.gamehelper.db.GameTouchProvider";
    private static final String GAME_MOTION_MANAGER_CLASS =
            "cn.nubia.gamehelper.manager.GameMotionHelperManager";
    private static final String GAME_HELPER_MACRO_SWITCH_CLASS =
            "cn.nubia.gamehelper.MacroSwitch";
    private static final String GAME_HELPER_DEVICE_UTIL_CLASS =
            "cn.nubia.gamehelper.utils.DeviceUtil";
    private static final String GAME_RECORD_MOTION_BEAN_CLASS =
            "cn.nubia.gamehelper.bean.RecordMotionBean";
    private static final String GAME_TRAVEL_ACTION_CLASS =
            "cn.nubia.gamehelper.travel.action.TravelAction";
    private static final String GAME_HELPER_LINE_BLACKLIST_CLASS =
            "cn.nubia.gamehelperline.utils.BlacklistUtils";
    private static final String GAME_HELPER_LINE_SERVICE_CLASS =
            "cn.nubia.gamehelperline.LineService";
    private static final String ONE_KEY_LINK_TILE_CLASS =
            "cn.nubia.gameassist.plugin.tiles.OneKeyLinkTile";
    private static final String TILE_HOST_CLASS =
            "cn.nubia.gameassist.common.TileHost";
    private static final String TILE_FACTORY_CLASS =
            "cn.nubia.gameassist.common.TileFactory";
    private static final String QSTILE_CLASS =
            "cn.nubia.gameassist.common.QSTile";
    private static final String QSTILE_STATE_CLASS =
            "cn.nubia.gameassist.common.QSTile$State";
    private static final String ADAPTER_CLASS =
            "com.android.settings.applications.manageapplications.ManageApplications$ApplicationsAdapter";

    private static final String MIRROR_KEY = "ls_augment_hidden_targets";
    private static final String ACTIVE_KEY = "ls_augment_hook_active";
    private static final String VERSION_KEY = "ls_augment_hook_version";
    private static final String STRATEGY_KEY = "ls_augment_hook_strategy";
    private static final String LAST_FILTER_KEY = "ls_augment_hook_last_filter";
    private static final String LAST_ERROR_KEY = "ls_augment_hook_last_error";

    private static final String PROBE_VERSION_KEY = "ls_augment_probe_version";
    private static final String PROBE_API_KEY = "ls_augment_probe_api";
    private static final String PROBE_FRAMEWORK_KEY = "ls_augment_probe_framework";
    private static final String PROBE_MODULE_LOADED_KEY = "ls_augment_probe_module_loaded";
    private static final String PROBE_PACKAGE_READY_KEY = "ls_augment_probe_package_ready";
    private static final String PROBE_CONTEXT_READY_KEY = "ls_augment_probe_context_ready";
    private static final String PROBE_CLASS_FOUND_KEY = "ls_augment_probe_class_found";
    private static final String PROBE_REBUILD_HOOK_KEY = "ls_augment_probe_rebuild_hook";
    private static final String PROBE_REMOVE_HOOK_KEY = "ls_augment_probe_remove_hook";
    private static final String PROBE_HOOK_INSTALLED_KEY = "ls_augment_probe_hook_installed";
    private static final String PROBE_FILTER_CALLED_KEY = "ls_augment_probe_filter_called";
    private static final String PROBE_ERROR_KEY = "ls_augment_probe_error";
    private static final String SHOULDER_ACTIVE_KEY = "ls_augment_shoulder_active";
    private static final String SHOULDER_INSTALLED_KEY = "ls_augment_shoulder_installed";
    private static final String SHOULDER_LAST_HIT_KEY = "ls_augment_shoulder_last_hit";
    private static final String SHOULDER_LAST_ERROR_KEY = "ls_augment_shoulder_last_error";
    private static final String COMBO_SPEED_ACTIVE_KEY = "ls_augment_combo_speed_active";
    private static final String COMBO_SPEED_INSTALLED_KEY = "ls_augment_combo_speed_installed";
    private static final String COMBO_SPEED_LAST_HIT_KEY = "ls_augment_combo_speed_last_hit";
    private static final String COMBO_SPEED_LAST_ERROR_KEY = "ls_augment_combo_speed_last_error";
    private static final String COMBO_SPEED_CACHE_LAST_HIT_KEY =
            "ls_augment_combo_speed_cache_last_hit";
    private static final String COMBO_SPEED_ADJUSTED_FLAG =
            "ls_augment_combo_speed_adjusted";
    private static final String COMBO_SPEED_PREVIEW_INSTALLED_KEY =
            "ls_augment_combo_speed_preview_installed";

    private final List<HookHandle> hookHandles = new ArrayList<>();
    private final List<HookHandle> shoulderHookHandles = new ArrayList<>();
    private final List<HookHandle> comboSpeedHookHandles = new ArrayList<>();
    private final List<HookHandle> recentsHookHandles = new ArrayList<>();
    private final List<HookHandle> featureHookHandles = new ArrayList<>();
    private volatile String processName = "";
    private volatile String readyPackageName = "";
    private volatile boolean moduleLoaded;
    private volatile boolean packageReady;
    private volatile boolean adapterClassFound;
    private volatile boolean rebuildHookInstalled;
    private volatile boolean removeHookInstalled;
    private volatile boolean startupWitnessInstalled;
    private volatile boolean contextReady;
    private volatile String setupError = "";
    private volatile boolean shoulderHooksInstalled;
    private volatile boolean comboSpeedHooksInstalled;
    private volatile boolean comboSpeedEngineHooksInstalled;
    private volatile boolean comboSpeedMotionFileHookInstalled;
    private volatile boolean comboSpeedManagerHookInstalled;
    private volatile boolean comboSpeedPreviewHooksInstalled;
    private volatile boolean recentsHooksInstalled;
    private volatile String recentsSetupError = "";
    private volatile boolean systemUiHooksInstalled;
    private volatile boolean doubleAppHooksInstalled;
    private volatile boolean beautifyHooksInstalled;
    private volatile boolean beautifyAdapterHooksInstalled;
    private volatile boolean superMirrorHooksInstalled;
    private volatile String cachedMirrorRaw;
    private volatile Set<String> cachedTargets = Collections.emptySet();

    @Override
    public void onModuleLoaded(ModuleLoadedParam param) {
        processName = param.getProcessName();
        moduleLoaded = true;
        logInfo("API102 MODULE_LOADED process=" + processName
                + " api=" + getApiVersion()
                + " framework=" + getFrameworkName() + "/" + getFrameworkVersion());

        // PackageReady is the authoritative package discriminator. Do not
        // detach here: the same static-scope module instance may still be
        // preparing one of the OEM game packages in this process.
    }

    @Override
    public void onPackageReady(PackageReadyParam param) {
        readyPackageName = param.getPackageName();
        if (!SETTINGS_PACKAGE.equals(readyPackageName)
                && !SYSTEMUI_PACKAGE.equals(readyPackageName)
                && !BEAUTIFY_PACKAGE.equals(readyPackageName)
                && !BEAUTIFY_ADAPTER_PACKAGE.equals(readyPackageName)
                && !DOUBLE_APP_PACKAGE.equals(readyPackageName)
                && !LAUNCHER_PACKAGE.equals(readyPackageName)
                && !GAME_SPACE_PACKAGE.equals(readyPackageName)
                && !GAME_ASSIST_PACKAGE.equals(readyPackageName)
                && !GAME_HELPER_PACKAGE.equals(readyPackageName)
                && !GAME_HELPER_LINE_PACKAGE.equals(readyPackageName)) {
            logInfo("DETACH non-target package=" + readyPackageName
                    + " process=" + processName);
            detach(); // API 102
            return;
        }

        if (GAME_SPACE_PACKAGE.equals(readyPackageName)) {
            installGameSpaceShoulderHooks(param.getClassLoader());
            return;
        }
        if (GAME_HELPER_PACKAGE.equals(readyPackageName)) {
            installGameHelperShoulderHooks(param.getClassLoader());
            installGameHelperComboSpeedHooks(param.getClassLoader());
            installGameHelperPreviewSpeedHooks(param.getClassLoader());
            return;
        }
        if (GAME_HELPER_LINE_PACKAGE.equals(readyPackageName)) {
            installGameHelperLineHooks(param.getClassLoader());
            return;
        }
        if (GAME_ASSIST_PACKAGE.equals(readyPackageName)) {
            installGameAssistShoulderHooks(param.getClassLoader());
            installSuperMirrorHooks(param.getClassLoader());
            return;
        }
        if (LAUNCHER_PACKAGE.equals(readyPackageName)) {
            installLauncherRecentsHooks(param.getClassLoader());
            return;
        }
        if (SYSTEMUI_PACKAGE.equals(readyPackageName)) {
            installSystemUiFeatureHooks(param.getClassLoader());
            return;
        }
        if (DOUBLE_APP_PACKAGE.equals(readyPackageName)) {
            installDoubleAppFeatureHooks(param.getClassLoader());
            return;
        }
        if (BEAUTIFY_PACKAGE.equals(readyPackageName)) {
            installBeautifyFeatureHooks(param.getClassLoader());
            return;
        }
        if (BEAUTIFY_ADAPTER_PACKAGE.equals(readyPackageName)) {
            installBeautifyAdapterFeatureHooks(param.getClassLoader());
            return;
        }
        packageReady = true;
        logInfo("PACKAGE_READY package=" + readyPackageName);

        // Install the actual Settings hooks immediately when the app classloader
        // is ready. Filtering must not depend on the diagnostic Context witness.
        installSettingsHooks(param.getClassLoader());

        // Persist lifecycle/setup state as soon as a Settings Context is
        // available. This witness is diagnostic only; hooks above are already
        // installed independently.
        Context now = currentApplicationContext();
        if (now != null && SETTINGS_PACKAGE.equals(now.getPackageName())) {
            persistProbeSnapshot(now);
        } else {
            installApplicationWitness();
        }
    }

    private synchronized void installLauncherRecentsHooks(ClassLoader classLoader) {
        if (recentsHooksInstalled || !recentsHookHandles.isEmpty()) return;
        int installed = LauncherRecentsStackHook.install(this, classLoader);
        recentsHooksInstalled = installed > 0;
        recentsSetupError = installed > 0 ? "" : "no_supported_recents_hook_point";
        logInfo("RECENTS_READY installed=" + installed + " process=" + processName);
    }

    HookBuilder prepareRecentsHook(Method method) {
        return hook(method)
                .setPriority(PRIORITY_LOWEST)
                .setExceptionMode(ExceptionMode.PROTECTIVE);
    }

    void registerRecentsHook(HookHandle handle) {
        if (handle != null) recentsHookHandles.add(handle);
    }

    void logRecentsInfo(String message) {
        logInfo("RECENTS_" + message);
    }

    void logRecentsError(String message, Throwable error) {
        recentsSetupError = message + ":" + safeMessage(error);
        logError("RECENTS_" + message, error);
    }

    HookBuilder prepareFeatureHook(Method method, String id, boolean beforeOriginal) {
        return hook(method)
                .setId("ls_augment.api102." + id)
                .setPriority(beforeOriginal ? PRIORITY_HIGHEST : PRIORITY_LOWEST)
                .setExceptionMode(ExceptionMode.PROTECTIVE);
    }

    void registerFeatureHook(HookHandle handle) {
        if (handle != null) featureHookHandles.add(handle);
    }

    void logFeatureInfo(String message) {
        logInfo("FEATURE_" + message);
    }

    void logFeatureError(String message, Throwable error) {
        logError("FEATURE_" + message, error);
    }

    private synchronized void installSystemUiFeatureHooks(ClassLoader classLoader) {
        if (systemUiHooksInstalled) return;
        systemUiHooksInstalled = SystemUiHook.install(this, classLoader) > 0;
    }

    private synchronized void installDoubleAppFeatureHooks(ClassLoader classLoader) {
        if (doubleAppHooksInstalled) return;
        doubleAppHooksInstalled = DoubleAppHook.install(this, classLoader) > 0;
    }

    private synchronized void installBeautifyFeatureHooks(ClassLoader classLoader) {
        if (beautifyHooksInstalled) return;
        BeautifyCompatibilityProbe.run(this, classLoader);
        beautifyHooksInstalled = BeautifyHook.install(this, classLoader) > 0;
    }

    private synchronized void installBeautifyAdapterFeatureHooks(ClassLoader classLoader) {
        if (beautifyAdapterHooksInstalled) return;
        beautifyAdapterHooksInstalled = BeautifyAdapterHook.install(this, classLoader) > 0;
    }

    private synchronized void installSuperMirrorHooks(ClassLoader classLoader) {
        if (superMirrorHooksInstalled) return;
        superMirrorHooksInstalled = SuperMirrorDiabloHook.install(this, classLoader) > 0;
    }

    /** Install the explicit GameSpace eligibility gates from the device report. */
    private synchronized void installGameSpaceShoulderHooks(ClassLoader classLoader) {
        if (shoulderHooksInstalled) return;
        int installed = 0;
        try {
            Class<?> helper = Class.forName(TGK_HELPER_CLASS, false, classLoader);
            Method disable = findMethod(
                    helper, "disableTgkFunction", boolean.class, String.class);
            if (disable != null) {
                disable.setAccessible(true);
                HookHandle handle = hook(disable)
                        .setId("ls_augment.api102.shoulder.gamespace.disable_tgk")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String packageName = stringArg(chain, 0);
                            if (isShoulderTarget(packageName)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GS-01|" + packageName + "|false|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GS-01 disableTgkFunction pkg="
                                        + packageName + " result=false");
                                return false;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GS-01 " + disable.toGenericString());
            } else {
                logInfo("SHOULDER_METHOD_MISSING GS-01 " + TGK_HELPER_CLASS
                        + ".disableTgkFunction");
            }

            Method disableOpt = findMethod(
                    helper, "getTgkDisableOpt", int.class, ContentResolver.class, String.class);
            if (disableOpt != null) {
                disableOpt.setAccessible(true);
                HookHandle handle = hook(disableOpt)
                        .setId("ls_augment.api102.shoulder.gamespace.disable_mask")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String packageName = stringArg(chain, 1);
                            if (isShoulderTarget(packageName)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GS-02|" + packageName + "|0|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GS-02 getTgkDisableOpt pkg="
                                        + packageName + " result=0");
                                return 0;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GS-02 " + disableOpt.toGenericString());
            } else {
                logInfo("SHOULDER_METHOD_MISSING GS-02 " + TGK_HELPER_CLASS
                        + ".getTgkDisableOpt");
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMESPACE_HELPER_FAILED", t);
        }

        try {
            Class<?> mapView = Class.forName(TGK_MAP_VIEW_CLASS, false, classLoader);
            Method state = findMethod(
                    mapView, "getGameKeyLinkMotionState", null, new Class<?>[0]);
            if (state != null) {
                state.setAccessible(true);
                HookHandle handle = hook(state)
                        .setId("ls_augment.api102.shoulder.gamespace.link_state")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            boolean fieldChanged = forceSupportedGameKeyLink(
                                    chain.getThisObject());
                            if (result instanceof Boolean && isBooleanFalse(result)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GS-03|false-to-true|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GS-03 getGameKeyLinkMotionState"
                                        + " result=true fieldChanged=" + fieldChanged);
                                return true;
                            }
                            if (fieldChanged) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GS-03|field-changed|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GS-03 getGameKeyLinkMotionState"
                                        + " fieldChanged=true");
                            }
                            return result;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GS-03 " + state.toGenericString());
            } else {
                logInfo("SHOULDER_METHOD_MISSING GS-03 " + TGK_MAP_VIEW_CLASS
                        + ".getGameKeyLinkMotionState");
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMESPACE_MAP_FAILED", t);
        }

        try {
            Class<?> pluginConfig = Class.forName(
                    GAME_SPACE_PLUGIN_CONFIG_CLASS, false, classLoader);
            Method blackList = findMethod(
                    pluginConfig, "getBlackList", String[].class, Context.class, String.class);
            if (blackList != null) {
                blackList.setAccessible(true);
                HookHandle handle = hook(blackList)
                        .setId("ls_augment.api102.shoulder.gamespace.keylink_blacklist")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            String plugin = stringArg(chain, 1);
                            if (!isShoulderBlacklistPlugin(plugin)
                                    || !(result instanceof String[])) return result;

                            String[] original = (String[]) result;
                            ArrayList<String> filtered = new ArrayList<>(original.length);
                            int removed = 0;
                            for (String packageName : original) {
                                if (isShoulderTarget(packageName)) {
                                    removed++;
                                } else {
                                    filtered.add(packageName);
                                }
                            }
                            if (removed == 0) return result;

                            writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                    "GS-04|" + plugin + "|removed=" + removed + "|"
                                            + System.currentTimeMillis());
                            logInfo("SHOULDER_HIT GS-04 getBlackList plugin=" + plugin
                                    + " removed=" + removed);
                            return filtered.toArray(new String[0]);
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GS-04 "
                        + blackList.toGenericString());
            } else {
                logInfo("SHOULDER_METHOD_MISSING GS-04 "
                        + GAME_SPACE_PLUGIN_CONFIG_CLASS + ".getBlackList");
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMESPACE_PLUGIN_CONFIG_FAILED", t);
        }

        shoulderHooksInstalled = installed > 0;
        writeShoulderProbe(SHOULDER_ACTIVE_KEY, "1");
        writeShoulderProbe(SHOULDER_INSTALLED_KEY, "GameSpace=" + installed);
        logInfo("SHOULDER_GAMESPACE_READY installed=" + installed
                + " process=" + processName);
    }

    /** Install every server-side package qualification gate used by GameHelper. */
    private synchronized void installGameHelperShoulderHooks(ClassLoader classLoader) {
        if (shoulderHooksInstalled) return;
        int installed = 0;
        try {
            Class<?> utils = Class.forName(
                    GAME_HELPER_PACKAGE_UTILS_CLASS, false, classLoader);
            Method black = findMethod(
                    utils, "isBlackPackageName", boolean.class, String.class);
            if (black == null) {
                logInfo("SHOULDER_METHOD_MISSING GH-01 "
                        + GAME_HELPER_PACKAGE_UTILS_CLASS + ".isBlackPackageName");
            } else {
                black.setAccessible(true);
                HookHandle handle = hook(black)
                        .setId("ls_augment.api102.shoulder.gamehelper.black_package")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String packageName = stringArg(chain, 0);
                            // Preserve the OEM result as the first gate.  The
                            // GameHelper process may not be able to see a real
                            // foreground game through PackageManager, so the
                            // trusted-process fallback is only used after the
                            // OEM actually classified this package as blocked.
                            Object result = chain.proceed();
                            if (isBooleanTrue(result)
                                    && isShoulderTarget(packageName, true)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GH-01|" + packageName + "|false|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GH-01 isBlackPackageName pkg="
                                        + packageName + " result=false");
                                return false;
                            }
                            return result;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GH-01 " + black.toGenericString());
            }

            // Some provider and service paths use the set directly instead of
            // calling isBlackPackageName. Return a filtered copy so the OEM's
            // hard-coded blacklist remains intact for unrelated packages.
            Method blackSet = findMethod(utils, "getBlackPackageSet", Set.class);
            if (blackSet == null) {
                logInfo("SHOULDER_METHOD_MISSING GH-02 "
                        + GAME_HELPER_PACKAGE_UTILS_CLASS + ".getBlackPackageSet");
            } else {
                blackSet.setAccessible(true);
                HookHandle handle = hook(blackSet)
                        .setId("ls_augment.api102.shoulder.gamehelper.black_package_set")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            if (!(result instanceof Set)) return result;
                            Set<?> original = (Set<?>) result;
                            HashSet<Object> filtered = new HashSet<>(original);
                            int removed = 0;
                            for (Object item : original) {
                                if (item instanceof String
                                        && isShoulderTarget((String) item, true)
                                        && filtered.remove(item)) {
                                    removed++;
                                }
                            }
                            if (removed == 0) return result;
                            writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                    "GH-02|blackSet|removed=" + removed + "|"
                                            + System.currentTimeMillis());
                            logInfo("SHOULDER_HIT GH-02 getBlackPackageSet removed="
                                    + removed);
                            return filtered;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GH-02 " + blackSet.toGenericString());
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMEHELPER_FAILED", t);
        }

        // One-key combo has a second blacklist in recordmotion.db. The ROM
        // synchronizes Honor of Kings into this table even when the visible
        // GameAssist blacklist has already been bypassed. In this OTA the
        // misleadingly named isPackageCanUseMacro methods return true when a
        // package IS present in that blacklist, so false is the allowed state.
        String[] databaseClasses = {
                GAME_HELPER_DB_HELPER_CLASS,
                GAME_HELPER_DATABASE_CLASS
        };
        for (int i = 0; i < databaseClasses.length; i++) {
            String className = databaseClasses[i];
            String probeId = i == 0 ? "GH-03" : "GH-04";
            try {
                Class<?> database = Class.forName(className, false, classLoader);
                Method databaseBlacklist = findMethod(
                        database, "isPackageCanUseMacro", boolean.class, String.class);
                if (databaseBlacklist == null) {
                    logInfo("SHOULDER_METHOD_MISSING " + probeId + " "
                            + className + ".isPackageCanUseMacro");
                    continue;
                }
                databaseBlacklist.setAccessible(true);
                HookHandle handle = hook(databaseBlacklist)
                        .setId("ls_augment.api102.shoulder.gamehelper.db_blacklist_" + i)
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String packageName = stringArg(chain, 0);
                            if (isShoulderTarget(packageName, true)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        probeId + "|" + packageName + "|false|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT " + probeId
                                        + " database blacklist pkg=" + packageName
                                        + " result=false");
                                return false;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED " + probeId + " "
                        + databaseBlacklist.toGenericString());
            } catch (Throwable t) {
                logError("SHOULDER_GAMEHELPER_DB_FAILED " + probeId, t);
            }
        }

        // External one-key components can query the blacklist provider
        // directly instead of using either Java helper above. Filter only the
        // blacklist cursor and leave records, mappings and settings untouched.
        try {
            Class<?> provider = Class.forName(
                    GAME_HELPER_PROVIDER_CLASS, false, classLoader);
            Method query = findMethod(provider, "query", Cursor.class,
                    Uri.class, String[].class, String.class, String[].class, String.class);
            if (query == null) {
                logInfo("SHOULDER_METHOD_MISSING GH-05 "
                        + GAME_HELPER_PROVIDER_CLASS + ".query");
            } else {
                query.setAccessible(true);
                HookHandle handle = hook(query)
                        .setId("ls_augment.api102.shoulder.gamehelper.provider_blacklist")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            Object uriArg = chain.getArg(0);
                            if (!(uriArg instanceof Uri)
                                    || !"blacklist".equals(((Uri) uriArg).getLastPathSegment())
                                    || !(result instanceof Cursor)) {
                                return result;
                            }
                            Cursor filtered = filterShoulderBlacklistCursor((Cursor) result);
                            if (filtered != result) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GH-05|provider-blacklist|filtered|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GH-05 provider blacklist filtered");
                            }
                            return filtered;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GH-05 " + query.toGenericString());
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMEHELPER_PROVIDER_FAILED GH-05", t);
        }

        // The macro master value is another independent execution gate. Keep
        // the OEM value for unrelated apps, but do not let it disable the
        // selected foreground app while LS_Augment shoulder support is on.
        try {
            Class<?> manager = Class.forName(
                    GAME_MOTION_MANAGER_CLASS, false, classLoader);
            Method canUseMacro = findMethod(manager, "canUseMacro", boolean.class);
            if (canUseMacro == null) {
                logInfo("SHOULDER_METHOD_MISSING GH-06 "
                        + GAME_MOTION_MANAGER_CLASS + ".canUseMacro");
            } else {
                canUseMacro.setAccessible(true);
                HookHandle handle = hook(canUseMacro)
                        .setId("ls_augment.api102.shoulder.gamehelper.macro_enable")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String packageName = invokeStringMethod(
                                    chain.getThisObject(), "getCurrentPackageName");
                            if (isShoulderTarget(packageName, true)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GH-06|" + packageName + "|true|"
                                                + System.currentTimeMillis());
                                return true;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GH-06 "
                        + canUseMacro.toGenericString());
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMEHELPER_MACRO_FAILED GH-06", t);
        }

        // CoreService opens the one-key combo editor through an application
        // overlay when the current game has no saved macro. Some ROM builds
        // report this privileged package as denied even though its manifest
        // permission is granted. The Root bridge repairs the AppOp itself;
        // this process-local gate keeps the editor path consistent as well.
        try {
            Method canDrawOverlays = findMethod(
                    Settings.class, "canDrawOverlays", boolean.class, Context.class);
            if (canDrawOverlays == null) {
                logInfo("SHOULDER_METHOD_MISSING GH-07 Settings.canDrawOverlays");
            } else {
                canDrawOverlays.setAccessible(true);
                HookHandle handle = hook(canDrawOverlays)
                        .setId("ls_augment.api102.shoulder.gamehelper.overlay_gate")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object contextArg = chain.getArg(0);
                            String packageName = currentGameHelperPackage(classLoader);
                            if (contextArg instanceof Context
                                    && GAME_HELPER_PACKAGE.equals(
                                            ((Context) contextArg).getPackageName())
                                    && isShoulderTarget(packageName, true)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GH-07|" + packageName + "|true|"
                                                + System.currentTimeMillis());
                                return true;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GH-07 "
                        + canDrawOverlays.toGenericString());
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMEHELPER_OVERLAY_FAILED GH-07", t);
        }

        shoulderHooksInstalled = installed > 0;
        writeShoulderProbe(SHOULDER_ACTIVE_KEY, "1");
        writeShoulderProbe(SHOULDER_INSTALLED_KEY,
                "GameHelperModule=" + installed + ";version=" + VERSION);
        logInfo("SHOULDER_GAMEHELPER_READY installed=" + shoulderHooksInstalled
                + " hooks=" + installed + " process=" + processName);
    }

    /**
     * Install the complete real-playback path. The framework-side player
     * queues MotionEvents from timestamps stored inside the JSON file; its
     * recoveryTime/recoverRate values are only metadata and a watchdog. A
     * private accelerated copy therefore has to be selected before the OEM
     * manager publishes its startPlay notification.
     */
    private synchronized void installGameHelperComboSpeedHooks(ClassLoader classLoader) {
        if (comboSpeedHooksInstalled) return;
        int installed = 0;
        int engineInstalled = 0;
        engineInstalled += installGameHelperSpeedGateHook(
                classLoader, GAME_HELPER_MACRO_SWITCH_CLASS, "MacroSwitch",
                "isSpeedModeEnable",
                "ls_augment.api102.combo_speed.gamehelper.macro_switch");
        engineInstalled += installGameHelperSpeedGateHook(
                classLoader, GAME_HELPER_DEVICE_UTIL_CLASS, "DeviceUtil",
                "isUI85",
                "ls_augment.api102.combo_speed.gamehelper.device_util");
        int beanInstalled = installGameHelperRecordBeanSpeedHook(classLoader);
        engineInstalled += beanInstalled;
        engineInstalled += installGameHelperMotionFileHook(classLoader);
        engineInstalled += installGameHelperManagerSpeedHook(classLoader);
        comboSpeedEngineHooksInstalled = beanInstalled > 0;
        installed += engineInstalled;

        try {
            Class<?> provider = Class.forName(
                    GAME_HELPER_PROVIDER_CLASS, false, classLoader);

            Method recordMotionCall = findMethod(provider, "recordMotionCall", Bundle.class);
            if (recordMotionCall == null) {
                logInfo("COMBO_SPEED_METHOD_MISSING " + GAME_HELPER_PROVIDER_CLASS
                        + ".recordMotionCall");
            } else {
                recordMotionCall.setAccessible(true);
                HookHandle handle = hook(recordMotionCall)
                        .setId("ls_augment.api102.combo_speed.gamehelper.provider_record")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> adjustComboSpeedBundle(
                                chain.proceed(),
                                FeatureSettings.from(chain.getThisObject()),
                                "provider_record"));
                comboSpeedHookHandles.add(handle);
                installed++;
                logInfo("COMBO_SPEED_HOOK_INSTALLED "
                        + recordMotionCall.toGenericString());
            }

            Method call = findMethod(provider, "call", Bundle.class,
                    String.class, String.class, Bundle.class);
            if (call == null) {
                logInfo("COMBO_SPEED_METHOD_MISSING " + GAME_HELPER_PROVIDER_CLASS
                        + ".call");
                writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                        "provider_call_missing");
            } else {
                call.setAccessible(true);
                HookHandle handle = hook(call)
                        .setId("ls_augment.api102.combo_speed.gamehelper.provider_call")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> adjustComboSpeedBundle(
                                chain.proceed(),
                                FeatureSettings.from(chain.getThisObject()),
                                "provider_call"));
                comboSpeedHookHandles.add(handle);
                installed++;
                logInfo("COMBO_SPEED_HOOK_INSTALLED " + call.toGenericString());
            }
        } catch (Throwable error) {
            writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                    "install_failed|" + error.getClass().getSimpleName()
                            + "|" + safePart(safeMessage(error)));
            logError("COMBO_SPEED_GAMEHELPER_FAILED", error);
        }

        comboSpeedHooksInstalled = installed > 0;
        writeComboSpeedProbe(COMBO_SPEED_ACTIVE_KEY, "1");
        writeComboSpeedProbe(COMBO_SPEED_INSTALLED_KEY,
                "GameHelperModule=" + installed
                        + ";engine=" + engineInstalled + ";version=" + VERSION);
        logInfo("COMBO_SPEED_GAMEHELPER_READY installed=" + comboSpeedHooksInstalled
                + " hooks=" + installed + " engine=" + engineInstalled
                + " process=" + processName);
    }

    /**
     * Replace only the path published for this playback. The source recording
     * and its touch_key_map binding remain untouched, while GameMacroHelper
     * receives timestamps scaled to the configured rate through the OEM
     * provider's normal file-descriptor path.
     */
    private int installGameHelperMotionFileHook(ClassLoader classLoader) {
        try {
            Class<?> manager = Class.forName(
                    GAME_MOTION_MANAGER_CLASS, false, classLoader);
            Method notifyChange = findMethod(
                    manager, "notifyChange", void.class, String.class);
            if (notifyChange == null) {
                logInfo("COMBO_SPEED_METHOD_MISSING "
                        + GAME_MOTION_MANAGER_CLASS + ".notifyChange");
                return 0;
            }
            notifyChange.setAccessible(true);
            HookHandle handle = hook(notifyChange)
                    .setId("ls_augment.api102.combo_speed.gamehelper.motion_file")
                    .setPriority(PRIORITY_HIGHEST)
                    .setExceptionMode(ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        String action = stringArg(chain, 0);
                        if (!"startPlay".equals(action)) return chain.proceed();

                        try {
                            Context context = currentApplicationContext();
                            if (comboSpeedConfigured(context)) {
                                Object managerOwner = chain.getThisObject();
                                Object pathValue = readField(
                                        managerOwner, "mCurrentRecoverPath");
                                String sourcePath = pathValue instanceof String
                                        ? (String) pathValue : null;
                                float targetRate = comboSpeedRate(context);
                                ComboMotionFileScaler.Result scaled =
                                        ComboMotionFileScaler.scale(
                                                context.getCacheDir(), sourcePath, targetRate);
                                if (!scaled.success) {
                                    writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                                            "file_scale_failed|rate=" + targetRate
                                                    + "|reason=" + safePart(scaled.error));
                                } else if (!writeStringField(managerOwner,
                                        "mCurrentRecoverPath", scaled.outputPath)) {
                                    writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                                            "file_path_write_failed|rate=" + targetRate);
                                } else {
                                    String packageName = String.valueOf(readField(
                                            managerOwner, "mCurrentPackageName"));
                                    comboSpeedMotionFileHookInstalled = true;
                                    String cacheState = scaled.cacheHit ? "hit" : "miss";
                                    String timing = scaled.cacheHit ? ""
                                            : "|events=" + scaled.eventCount
                                            + "|span=" + scaled.sourceSpanMs
                                            + "->" + scaled.outputSpanMs;
                                    String diagnostic = "file|pkg="
                                            + safePart(packageName)
                                            + "|rate=" + Math.round(targetRate)
                                            + "|cache=" + cacheState
                                            + "|id=" + safePart(scaled.cacheIdentity)
                                            + timing;
                                    writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY, "");
                                    writeComboSpeedProbe(
                                            COMBO_SPEED_CACHE_LAST_HIT_KEY, diagnostic);
                                    writeComboSpeedProbe(COMBO_SPEED_LAST_HIT_KEY, diagnostic);
                                    logInfo("COMBO_SPEED_FILE_HIT pkg=" + packageName
                                            + " rate=" + Math.round(targetRate)
                                            + " cache=" + cacheState + timing);
                                }
                            }
                        } catch (Throwable error) {
                            writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                                    "file_scale_exception|"
                                            + error.getClass().getSimpleName()
                                            + "|" + safePart(safeMessage(error)));
                            logError("COMBO_SPEED_FILE_FAILED", error);
                        }
                        return chain.proceed();
                    });
            comboSpeedHookHandles.add(handle);
            logInfo("COMBO_SPEED_HOOK_INSTALLED " + notifyChange.toGenericString());
            return 1;
        } catch (Throwable error) {
            writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                    "file_install_failed|" + error.getClass().getSimpleName()
                            + "|" + safePart(safeMessage(error)));
            logError("COMBO_SPEED_FILE_INSTALL_FAILED", error);
            return 0;
        }
    }

    private int installGameHelperSpeedGateHook(
            ClassLoader classLoader, String className, String label,
            String methodName, String id) {
        try {
            Class<?> type = Class.forName(className, false, classLoader);
            Method gate = findMethod(type, methodName, boolean.class);
            if (gate == null) {
                logInfo("COMBO_SPEED_METHOD_MISSING " + label + "." + methodName);
                return 0;
            }
            gate.setAccessible(true);
            HookHandle handle = hook(gate)
                    .setId(id)
                    .setPriority(PRIORITY_HIGHEST)
                    .setExceptionMode(ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        Object original = chain.proceed();
                        Context context = currentApplicationContext();
                        if (comboSpeedConfigured(context)) {
                            writeComboSpeedProbe(COMBO_SPEED_LAST_HIT_KEY,
                                    "gate|" + label + "|original=" + original);
                            return true;
                        }
                        return original;
                    });
            comboSpeedHookHandles.add(handle);
            logInfo("COMBO_SPEED_HOOK_INSTALLED " + gate.toGenericString());
            return 1;
        } catch (Throwable error) {
            writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                    "gate_install_failed|" + label + "|"
                            + error.getClass().getSimpleName());
            logError("COMBO_SPEED_GATE_FAILED " + label, error);
            return 0;
        }
    }

    private int installGameHelperRecordBeanSpeedHook(ClassLoader classLoader) {
        try {
            Class<?> bean = Class.forName(
                    GAME_RECORD_MOTION_BEAN_CLASS, false, classLoader);
            Method getSpeed = findMethod(bean, "getSpeed", int.class);
            if (getSpeed == null) {
                logInfo("COMBO_SPEED_METHOD_MISSING "
                        + GAME_RECORD_MOTION_BEAN_CLASS + ".getSpeed");
                return 0;
            }
            getSpeed.setAccessible(true);
            HookHandle handle = hook(getSpeed)
                    .setId("ls_augment.api102.combo_speed.gamehelper.record_bean")
                    .setPriority(PRIORITY_HIGHEST)
                    .setExceptionMode(ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        Object original = chain.proceed();
                        Context context = currentApplicationContext();
                        if (!comboSpeedConfigured(context)) return original;
                        float targetRate = comboSpeedRate(context);
                        int engineRate = Math.max(1, Math.round(targetRate));
                        String packageName = String.valueOf(
                                readField(chain.getThisObject(), "packageName"));
                        writeComboSpeedProbe(COMBO_SPEED_LAST_HIT_KEY,
                                "bean|pkg=" + safePart(packageName)
                                        + "|original=" + original
                                        + "|engine=" + engineRate
                                        + "|rate=" + targetRate);
                        return engineRate;
                    });
            comboSpeedHookHandles.add(handle);
            logInfo("COMBO_SPEED_HOOK_INSTALLED " + getSpeed.toGenericString());
            return 1;
        } catch (Throwable error) {
            writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                    "bean_install_failed|" + error.getClass().getSimpleName()
                            + "|" + safePart(safeMessage(error)));
            logError("COMBO_SPEED_RECORD_BEAN_FAILED", error);
            return 0;
        }
    }

    private int installGameHelperManagerSpeedHook(ClassLoader classLoader) {
        try {
            Class<?> manager = Class.forName(
                    GAME_MOTION_MANAGER_CLASS, false, classLoader);
            Method recovery = findMethod(manager, "recoveryMotion", void.class, String.class);
            if (recovery == null) {
                logInfo("COMBO_SPEED_METHOD_MISSING "
                        + GAME_MOTION_MANAGER_CLASS + ".recoveryMotion");
                return 0;
            }
            recovery.setAccessible(true);
            HookHandle handle = hook(recovery)
                    .setId("ls_augment.api102.combo_speed.gamehelper.manager")
                    .setPriority(PRIORITY_LOWEST)
                    .setExceptionMode(ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        Context context = currentApplicationContext();
                        if (!comboSpeedConfigured(context)
                                || !comboSpeedEngineHooksInstalled) {
                            return result;
                        }
                        float targetRate = comboSpeedRate(context);
                        long currentTime = readLongField(
                                chain.getThisObject(), "mCurrentPlayTime");
                        if (currentTime <= 0L) return result;
                        int engineRate = Math.max(1, Math.round(targetRate));
                        long adjustedTime = ComboSpeedPolicy.adjustRecoveryTime(
                                currentTime, engineRate, targetRate);
                        if (adjustedTime > 0L
                                && writeLongField(chain.getThisObject(),
                                "mCurrentPlayTime", adjustedTime)) {
                            String packageName = String.valueOf(readField(
                                    chain.getThisObject(), "mCurrentPackageName"));
                            writeComboSpeedProbe(COMBO_SPEED_LAST_HIT_KEY,
                                    "manager|pkg=" + safePart(packageName)
                                            + "|engine=" + engineRate
                                            + "|rate=" + targetRate
                                            + "|recovery=" + currentTime
                                            + "->" + adjustedTime);
                        }
                        return result;
                    });
            comboSpeedHookHandles.add(handle);
            comboSpeedManagerHookInstalled = true;
            logInfo("COMBO_SPEED_HOOK_INSTALLED " + recovery.toGenericString());
            return 1;
        } catch (Throwable error) {
            writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                    "manager_install_failed|" + error.getClass().getSimpleName()
                            + "|" + safePart(safeMessage(error)));
            logError("COMBO_SPEED_MANAGER_FAILED", error);
            return 0;
        }
    }

    private Object adjustComboSpeedBundle(
            Object result, Context context, String source) {
        if (!(result instanceof Bundle) || !comboSpeedConfigured(context)) return result;
        Bundle original = (Bundle) result;
        if (original.getBoolean(COMBO_SPEED_ADJUSTED_FLAG, false)
                || !original.getBoolean("startRecoverRecord", false)
                || !original.containsKey("motionRecoverFd")) {
            return result;
        }

        try {
            float targetRate = comboSpeedRate(context);
            float originalRate = original.getFloat("recoverRate", 1.0f);
            long recoveryTime = original.getLong("recoveryTime", 0L);
            float timingSourceRate = comboSpeedManagerHookInstalled()
                    ? 1.0f : originalRate;
            // When the manager hook is present it has already converted the
            // watchdog duration to the requested rate.  Otherwise rebuild
            // the original duration from the provider's OEM rate here.
            long adjustedTime = comboSpeedManagerHookInstalled()
                    ? recoveryTime
                    : ComboSpeedPolicy.adjustRecoveryTime(
                    recoveryTime, timingSourceRate, targetRate);
            if (!ComboSpeedPolicy.isValidRate(targetRate)
                    || adjustedTime <= 0L
                    || recoveryTime <= 0L
                    || timingSourceRate <= 0f
                    || Float.isNaN(timingSourceRate)
                    || Float.isInfinite(timingSourceRate)) {
                writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                        "invalid_bundle|source=" + source
                                + "|rate=" + originalRate
                                + "|target=" + targetRate
                                + "|time=" + recoveryTime);
                return result;
            }

            Bundle adjusted = new Bundle(original);
            adjusted.putFloat("recoverRate", targetRate);
            adjusted.putLong("recoveryTime", adjustedTime);
            adjusted.putBoolean(COMBO_SPEED_ADJUSTED_FLAG, true);
            String packageName = original.getString("packageName", "");
            writeComboSpeedProbe(COMBO_SPEED_LAST_HIT_KEY,
                    "pkg=" + safePart(packageName)
                            + "|source=" + source
                            + "|rate=" + targetRate
                            + "|original=" + originalRate
                            + "|recovery=" + recoveryTime
                            + "->" + adjustedTime);
            logInfo("COMBO_SPEED_HIT source=" + source + " pkg=" + packageName
                    + " rate=" + originalRate + "->" + targetRate
                    + " recovery=" + recoveryTime + "->" + adjustedTime);
            return adjusted;
        } catch (Throwable error) {
            writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                    "adjust_failed|source=" + source + "|"
                            + error.getClass().getSimpleName()
                            + "|" + safePart(safeMessage(error)));
            logError("COMBO_SPEED_ADJUST_FAILED", error);
            return result;
        }
    }

    private boolean comboSpeedManagerHookInstalled() {
        return comboSpeedEngineHooksInstalled && comboSpeedManagerHookInstalled;
    }

    private static boolean comboSpeedConfigured(Context context) {
        if (!FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER, false)
                || !FeatureSettings.enabled(
                context, FeatureSettings.COMBO_SPEED_ENABLED, false)) {
            return false;
        }
        return ComboSpeedPolicy.isValidRate(comboSpeedRate(context));
    }

    private static float comboSpeedRate(Context context) {
        float configured = FeatureSettings.decimal(
                context, FeatureSettings.COMBO_SPEED_RATE, ComboSpeedPolicy.MIN_RATE,
                ComboSpeedPolicy.MIN_RATE, ComboSpeedPolicy.MAX_RATE);
        return ComboSpeedPolicy.normalizeRate(configured);
    }

    /**
     * The GameHelper editor's “test/preview” button does not call the
     * provider. It replays MotionEvents through TravelAction, whose worker
     * divides each delay by its private integer speed field. Keep that path
     * consistent with the real one-key bundle path.
     */
    private synchronized void installGameHelperPreviewSpeedHooks(ClassLoader classLoader) {
        if (comboSpeedPreviewHooksInstalled) return;
        int installed = 0;
        try {
            Class<?> travelAction = Class.forName(
                    GAME_TRAVEL_ACTION_CLASS, false, classLoader);
            Method playScript = findMethod(travelAction, "playScript", void.class);
            if (playScript == null) {
                logInfo("COMBO_SPEED_PREVIEW_METHOD_MISSING "
                        + GAME_TRAVEL_ACTION_CLASS + ".playScript");
                writeComboSpeedProbe(COMBO_SPEED_PREVIEW_INSTALLED_KEY,
                        "missing:playScript");
            } else {
                playScript.setAccessible(true);
                HookHandle handle = hook(playScript)
                        .setId("ls_augment.api102.combo_speed.gamehelper.preview")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Context context = FeatureSettings.from(chain.getThisObject());
                            if (FeatureSettings.enabled(
                                    context, FeatureSettings.GAME_MASTER, false)
                                    && FeatureSettings.enabled(
                                    context, FeatureSettings.COMBO_SPEED_ENABLED, false)) {
                                float targetRate = comboSpeedRate(context);
                                int previewRate = Math.max(1, Math.round(targetRate));
                                if (writeIntField(chain.getThisObject(), "speed", previewRate)) {
                                    writeComboSpeedProbe(COMBO_SPEED_LAST_HIT_KEY,
                                            "preview|rate=" + targetRate
                                                    + "|engine=" + previewRate);
                                } else {
                                    writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                                            "preview_speed_field_missing");
                                }
                            }
                            return chain.proceed();
                        });
                comboSpeedHookHandles.add(handle);
                installed++;
                logInfo("COMBO_SPEED_PREVIEW_HOOK_INSTALLED "
                        + playScript.toGenericString());
            }
        } catch (Throwable error) {
            writeComboSpeedProbe(COMBO_SPEED_LAST_ERROR_KEY,
                    "preview_install_failed|" + error.getClass().getSimpleName()
                            + "|" + safePart(safeMessage(error)));
            logError("COMBO_SPEED_PREVIEW_FAILED", error);
        }

        comboSpeedPreviewHooksInstalled = installed > 0;
        writeComboSpeedProbe(COMBO_SPEED_PREVIEW_INSTALLED_KEY,
                "GameHelperModule=" + installed + ";version=" + VERSION);
        logInfo("COMBO_SPEED_PREVIEW_READY installed="
                + comboSpeedPreviewHooksInstalled + " hooks=" + installed);
    }

    /** Auxiliary line is a separate OEM process from one-key combo. */
    private synchronized void installGameHelperLineHooks(ClassLoader classLoader) {
        if (shoulderHooksInstalled) return;
        int installed = 0;
        try {
            Class<?> blacklist = Class.forName(
                    GAME_HELPER_LINE_BLACKLIST_CLASS, false, classLoader);
            Method disabled = findMethod(
                    blacklist, "isDisableRangeLine", boolean.class, String.class);
            if (disabled == null) {
                logInfo("SHOULDER_METHOD_MISSING GL-01 "
                        + GAME_HELPER_LINE_BLACKLIST_CLASS + ".isDisableRangeLine");
            } else {
                disabled.setAccessible(true);
                HookHandle handle = hook(disabled)
                        .setId("ls_augment.api102.shoulder.line.blacklist")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String packageName = stringArg(chain, 0);
                            if (isShoulderTarget(packageName, true)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GL-01|" + packageName + "|false|"
                                                + System.currentTimeMillis());
                                return false;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GL-01 " + disabled.toGenericString());
            }
        } catch (Throwable t) {
            logError("SHOULDER_LINE_BLACKLIST_FAILED GL-01", t);
        }

        try {
            Class<?> service = Class.forName(
                    GAME_HELPER_LINE_SERVICE_CLASS, false, classLoader);
            Method unsupported = findMethod(
                    service, "isLineNotSupported", boolean.class, String.class);
            if (unsupported == null) {
                logInfo("SHOULDER_METHOD_MISSING GL-02 "
                        + GAME_HELPER_LINE_SERVICE_CLASS + ".isLineNotSupported");
            } else {
                unsupported.setAccessible(true);
                HookHandle handle = hook(unsupported)
                        .setId("ls_augment.api102.shoulder.line.support")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String packageName = stringArg(chain, 0);
                            if (isShoulderTarget(packageName, true)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GL-02|" + packageName + "|false|"
                                                + System.currentTimeMillis());
                                return false;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GL-02 "
                        + unsupported.toGenericString());
            }

            // Never hook LineService.pkgsArray(). The OEM method reads
            // Settings.Global[gamehelperline_enable_pkgs], which is the user's
            // persisted per-game on/off state. Expanding that list makes every
            // eligible game look enabled and auto-opens the auxiliary line.
        } catch (Throwable t) {
            logError("SHOULDER_LINE_SERVICE_FAILED", t);
        }

        shoulderHooksInstalled = installed > 0;
        writeShoulderProbe(SHOULDER_ACTIVE_KEY, "1");
        writeShoulderProbe(SHOULDER_INSTALLED_KEY,
                "GameHelperLine=" + installed + ";version=" + VERSION);
        logInfo("SHOULDER_LINE_READY installed=" + installed
                + " process=" + processName);
    }

    /**
     * Resolve the OneKeyLink eligibility method by class shape instead of the
     * current OTA's obfuscated method name (g0). The current class exposes
     * exactly one public no-argument boolean method; protected tile state
     * methods are deliberately ignored.
     */
    private synchronized void installGameAssistShoulderHooks(ClassLoader classLoader) {
        if (shoulderHooksInstalled) return;
        int installed = installGameAssistToolbarHooks(classLoader);
        try {
            Class<?> tile = Class.forName(ONE_KEY_LINK_TILE_CLASS, false, classLoader);
            Method eligibility = findPublicNoArgBooleanMethod(tile);
            if (eligibility == null) {
                logInfo("SHOULDER_METHOD_MISSING GA-01 " + ONE_KEY_LINK_TILE_CLASS
                        + " public-noarg-boolean");
            } else {
                eligibility.setAccessible(true);
                HookHandle handle = hook(eligibility)
                        .setId("ls_augment.api102.shoulder.gameassist.one_key_link")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            if (isBooleanFalse(result)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GA-01|OneKeyLinkTile|true|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GA-01 OneKeyLinkTile eligibility"
                                        + " result=true method=" + eligibility.getName());
                                return true;
                            }
                            return result;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-01 "
                        + eligibility.toGenericString());
            }

            Class<?> pluginConfig = Class.forName(
                    GAME_ASSIST_PLUGIN_CONFIG_CLASS, false, classLoader);
            // The current OTA exposes d(Context, String) -> String[].
            Method blackList = findMethod(
                    pluginConfig, "d", String[].class, Context.class, String.class);
            if (blackList == null) {
                logInfo("SHOULDER_METHOD_MISSING GA-05 "
                        + GAME_ASSIST_PLUGIN_CONFIG_CLASS + ".d");
            } else {
                blackList.setAccessible(true);
                HookHandle handle = hook(blackList)
                        .setId("ls_augment.api102.shoulder.gameassist.keylink_blacklist")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            String plugin = stringArg(chain, 1);
                            if (!isShoulderBlacklistPlugin(plugin)
                                    || !(result instanceof String[])) return result;

                            String[] original = (String[]) result;
                            ArrayList<String> filtered = new ArrayList<>(original.length);
                            int removed = 0;
                            for (String packageName : original) {
                                if (isShoulderTarget(packageName)) {
                                    removed++;
                                } else {
                                    filtered.add(packageName);
                                }
                            }
                            if (removed == 0) return result;

                            writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                    "GA-05|" + plugin + "|removed=" + removed + "|"
                                            + System.currentTimeMillis());
                            logInfo("SHOULDER_HIT GA-05 PluginConfig.d plugin=" + plugin
                                    + " removed=" + removed);
                            return filtered.toArray(new String[0]);
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-05 "
                        + blackList.toGenericString());
            }

            // PluginConfig.d is the normal reader, but the GameAssist process
            // also reads the raw Global blacklist while rebuilding its plugin
            // state. Filter that second read as well, otherwise a later
            // refresh can put keylink back into the disabled path.
            Class<?> globalSettings = Class.forName(
                    "android.provider.Settings$Global", false, classLoader);
            Method globalGetString = findMethod(
                    globalSettings, "getString", String.class,
                    ContentResolver.class, String.class);
            if (globalGetString == null) {
                logInfo("SHOULDER_METHOD_MISSING GA-18 Settings.Global.getString");
            } else {
                globalGetString.setAccessible(true);
                HookHandle handle = hook(globalGetString)
                        .setId("ls_augment.api102.shoulder.gameassist.raw_blacklist")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            String key = stringArg(chain, 1);
                            if (!(result instanceof String)) return result;
                            String filtered = filterShoulderBlacklistSetting(
                                    key, (String) result);
                            if (filtered == null || filtered.equals(result)) return result;

                            writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                    "GA-18|" + key + "|filtered|"
                                            + System.currentTimeMillis());
                            logInfo("SHOULDER_HIT GA-18 Settings.Global key=" + key);
                            return filtered;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-18 "
                        + globalGetString.toGenericString());
            }

            // PluginConfig.k is the independent enable switch for each
            // plugin.  Keep the user/system setting semantics for unrelated
            // plugins, but make keylink/range-line available for the selected
            // user app once the module's shoulder feature is enabled.
            Method pluginEnabled = findMethod(
                    pluginConfig, "k", boolean.class, Context.class, String.class);
            if (pluginEnabled == null) {
                logInfo("SHOULDER_METHOD_MISSING GA-04 "
                        + GAME_ASSIST_PLUGIN_CONFIG_CLASS + ".k");
            } else {
                pluginEnabled.setAccessible(true);
                HookHandle handle = hook(pluginEnabled)
                        .setId("ls_augment.api102.shoulder.gameassist.plugin_enable")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String plugin = stringArg(chain, 1);
                            if (isShoulderBlacklistPlugin(plugin)
                                    && isShoulderTarget(currentFullscreenPackage(classLoader))) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GA-04|" + plugin + "|true|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GA-04 PluginConfig.k plugin="
                                        + plugin + " result=true");
                                return true;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-04 "
                        + pluginEnabled.toGenericString());
            }

            Method displayEligibility = findMethod(
                    pluginConfig, "l", boolean.class,
                    Context.class, String.class, String.class);
            if (displayEligibility == null) {
                logInfo("SHOULDER_METHOD_MISSING GA-06 "
                        + GAME_ASSIST_PLUGIN_CONFIG_CLASS + ".l");
            } else {
                displayEligibility.setAccessible(true);
                HookHandle handle = hook(displayEligibility)
                        .setId("ls_augment.api102.shoulder.gameassist.display_eligibility")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String plugin = stringArg(chain, 1);
                            String packageName = stringArg(chain, 2);
                            if (isShoulderBlacklistPlugin(plugin)
                                    && isShoulderTarget(packageName)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GA-06|" + plugin + "|" + packageName + "|true|"
                                                + System.currentTimeMillis());
                                logInfo("SHOULDER_HIT GA-06 PluginConfig.l plugin="
                                        + plugin + " pkg=" + packageName + " result=true");
                                return true;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-06 "
                        + displayEligibility.toGenericString());
            }

            Method pluginList = findMethod(
                    pluginConfig, "g", List.class, Context.class);
            if (pluginList == null) {
                logInfo("SHOULDER_METHOD_MISSING GA-07 "
                        + GAME_ASSIST_PLUGIN_CONFIG_CLASS + ".g");
            } else {
                pluginList.setAccessible(true);
                HookHandle handle = hook(pluginList)
                        .setId("ls_augment.api102.shoulder.gameassist.plugin_list")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            if (!(result instanceof List)) return result;

                            String packageName = currentFullscreenPackage(classLoader);
                            if (!isShoulderTarget(packageName)) return result;

                            List<?> original = (List<?>) result;
                            if (original.contains("keylink")) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GA-07|keylink-present|" + packageName + "|"
                                                + System.currentTimeMillis());
                                return result;
                            }

                            ArrayList<Object> filtered = new ArrayList<>(original);
                            filtered.add("keylink");
                            writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                    "GA-07|keylink-added|" + packageName + "|"
                                            + System.currentTimeMillis());
                            logInfo("SHOULDER_HIT GA-07 PluginConfig.g pkg="
                                    + packageName + " keylink-added");
                            return filtered;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-07 "
                        + pluginList.toGenericString());
            }

            installed += installGameAssistTileDiagnostics(classLoader);
        } catch (Throwable t) {
            writeShoulderProbe(SHOULDER_LAST_ERROR_KEY,
                    "GA-01/GA-05/GA-06/GA-07|" + t.getClass().getName() + ":" + safeMessage(t));
            logError("SHOULDER_GAMEASSIST_FAILED", t);
        }
        shoulderHooksInstalled = installed > 0;
        writeShoulderProbe(SHOULDER_ACTIVE_KEY, "1");
        writeShoulderProbe(SHOULDER_INSTALLED_KEY, "GameAssist=" + installed);
        logInfo("SHOULDER_GAMEASSIST_READY installed=" + shoulderHooksInstalled
                + " process=" + processName);
    }

    /**
     * The visible shoulder-key entry is a fixed GameAssist toolbar button,
     * separate from the lower plugin-tile collection. Relax both of its
     * feature gates and repair the final view visibility after OEM binding.
     */
    private int installGameAssistToolbarHooks(ClassLoader classLoader) {
        int installed = 0;

        try {
            Class<?> feature = Class.forName(GAME_ASSIST_FEATURE_CLASS, false, classLoader);
            installed += hookGameAssistFeature(
                    feature, classLoader, "isSupportTouchGameKey", "GA-12");
            installed += hookGameAssistFeature(
                    feature, classLoader, "isSupportTouchCameraKey", "GA-13");
            // OneKeyLink has its own capability gate; the tile visibility hook
            // only checks package membership and cannot enable the action alone.
            installed += hookGameAssistFeature(
                    feature, classLoader, "isSupportOneKeyLink", "GA-16");
            // The physical RedMagic game-key capability is a separate feature
            // flag from the virtual touch-game-key and camera-key flags.
            installed += hookGameAssistFeature(
                    feature, classLoader, "isSuppprtRedMagicGameKey", "GA-17");
        } catch (Throwable t) {
            logError("SHOULDER_GAMEASSIST_FEATURE_FAILED", t);
        }

        try {
            Class<?> utils = Class.forName(GAME_ASSIST_UTILS_CLASS, false, classLoader);
            Method removed = findMethod(utils, "L", boolean.class, String.class);
            if (removed == null) {
                logInfo("SHOULDER_METHOD_MISSING GA-14 " + GAME_ASSIST_UTILS_CLASS + ".L");
            } else {
                removed.setAccessible(true);
                HookHandle handle = hook(removed)
                        .setId("ls_augment.api102.shoulder.gameassist.toolbar_removed_gate")
                        .setPriority(PRIORITY_HIGHEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            String packageName = stringArg(chain, 0);
                            if (isShoulderTarget(packageName)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GA-14|Utils.L|" + safePart(packageName)
                                                + "|false|" + System.currentTimeMillis());
                                return false;
                            }
                            return chain.proceed();
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-14 " + removed.toGenericString());
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMEASSIST_UTILS_FAILED", t);
        }

        try {
            Class<?> controller = Class.forName(
                    GAME_ASSIST_SUBVIEW_CONTROLLER_CLASS, false, classLoader);
            Method bind = findSingleViewGroupMethod(controller, "V");
            if (bind == null) {
                logInfo("SHOULDER_METHOD_MISSING GA-15 "
                        + GAME_ASSIST_SUBVIEW_CONTROLLER_CLASS + ".V");
            } else {
                bind.setAccessible(true);
                HookHandle handle = hook(bind)
                        .setId("ls_augment.api102.shoulder.gameassist.toolbar_visibility")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            String packageName = currentFullscreenPackage(classLoader);
                            if (isShoulderTarget(packageName)) {
                                Object button = readField(chain.getThisObject(), "t");
                                if (button instanceof View) {
                                    ((View) button).setVisibility(View.VISIBLE);
                                    writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                            "GA-15|SubViewController.V|"
                                                    + safePart(packageName)
                                                    + "|visible=true|" + System.currentTimeMillis());
                                }
                            }
                            return result;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-15 " + bind.toGenericString());
            }
        } catch (Throwable t) {
            logError("SHOULDER_GAMEASSIST_TOOLBAR_BIND_FAILED", t);
        }
        return installed;
    }

    private int hookGameAssistFeature(
            Class<?> feature, ClassLoader classLoader, String methodName, String probeId) {
        Method method = findMethod(feature, methodName, boolean.class);
        if (method == null) {
            logInfo("SHOULDER_METHOD_MISSING " + probeId + " "
                    + GAME_ASSIST_FEATURE_CLASS + "." + methodName);
            return 0;
        }
        try {
            method.setAccessible(true);
            HookHandle handle = hook(method)
                    .setId("ls_augment.api102.shoulder.gameassist." + methodName)
                    .setPriority(PRIORITY_HIGHEST)
                    .setExceptionMode(ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        String packageName = currentFullscreenPackage(classLoader);
                        if (isShoulderTarget(packageName)) {
                            writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                    probeId + "|" + methodName + "|" + safePart(packageName)
                                            + "|true|" + System.currentTimeMillis());
                            return true;
                        }
                        return chain.proceed();
                    });
            shoulderHookHandles.add(handle);
            logInfo("SHOULDER_HOOK_INSTALLED " + probeId + " " + method.toGenericString());
            return 1;
        } catch (Throwable t) {
            logError("SHOULDER_HOOK_FAILED " + probeId, t);
            return 0;
        }
    }

    /**
     * Record the downstream TileHost path after the package-list decision.
     * These hooks do not change OEM results; they only tell us whether
     * keylink was requested, instantiated, and returned to the panel.
     */
    private int installGameAssistTileDiagnostics(ClassLoader classLoader) {
        Context diagnosticContext = currentApplicationContext();
        if (!FeatureSettings.enabled(
                diagnosticContext, FeatureSettings.SHOULDER_DIAGNOSTICS, false)) {
            logInfo("SHOULDER_DIAGNOSTICS_DISABLED");
            return 0;
        }
        int installed = 0;
        try {
            Class<?> tileHost = Class.forName(TILE_HOST_CLASS, false, classLoader);
            Method refresh = findMethod(tileHost, "w", Collection.class, boolean.class);
            if (refresh != null) {
                refresh.setAccessible(true);
                HookHandle handle = hook(refresh)
                        .setId("ls_augment.api102.shoulder.gameassist.tilehost_refresh_probe")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            String packageName = currentFullscreenPackage(classLoader);
                            boolean present = containsOneKeyLinkTile(result);
                            int size = result instanceof Collection
                                    ? ((Collection<?>) result).size() : -1;
                            writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                    "GA-08|TileHost.w|" + safePart(packageName)
                                            + "|keylink=" + present + "|size=" + size
                                            + "|" + System.currentTimeMillis());
                            return result;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-08 " + refresh.toGenericString());
            } else {
                logInfo("SHOULDER_METHOD_MISSING GA-08 " + TILE_HOST_CLASS + ".w");
            }

            Method create = findMethod(tileHost, "l", null, String.class);
            if (create != null) {
                create.setAccessible(true);
                HookHandle handle = hook(create)
                        .setId("ls_augment.api102.shoulder.gameassist.tilehost_create_probe")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            String spec = stringArg(chain, 0);
                            if ("keylink".equals(spec)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GA-09|TileHost.l|" + safePart(
                                                currentFullscreenPackage(classLoader))
                                                + "|result=" + className(result)
                                                + "|" + System.currentTimeMillis());
                            }
                            return result;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-09 " + create.toGenericString());
            } else {
                logInfo("SHOULDER_METHOD_MISSING GA-09 " + TILE_HOST_CLASS + ".l");
            }
        } catch (Throwable t) {
            logError("SHOULDER_TILEHOST_DIAGNOSTICS_FAILED", t);
        }

        try {
            Class<?> tileFactory = Class.forName(TILE_FACTORY_CLASS, false, classLoader);
            Method create = findMethod(tileFactory, "a", null, String.class,
                    Class.forName(TILE_HOST_CLASS, false, classLoader));
            if (create != null) {
                create.setAccessible(true);
                HookHandle handle = hook(create)
                        .setId("ls_augment.api102.shoulder.gameassist.tilefactory_probe")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            String spec = stringArg(chain, 0);
                            if ("keylink".equals(spec)) {
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GA-10|TileFactory.a|" + safePart(
                                                currentFullscreenPackage(classLoader))
                                                + "|result=" + className(result)
                                                + "|" + System.currentTimeMillis());
                            }
                            return result;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-10 " + create.toGenericString());
            } else {
                logInfo("SHOULDER_METHOD_MISSING GA-10 " + TILE_FACTORY_CLASS + ".a");
            }
        } catch (Throwable t) {
            logError("SHOULDER_TILEFACTORY_DIAGNOSTICS_FAILED", t);
        }

        try {
            Class<?> qstile = Class.forName(QSTILE_CLASS, false, classLoader);
            Class<?> state = Class.forName(QSTILE_STATE_CLASS, false, classLoader);
            Method updateState = findMethod(qstile, "d0", null, state, Object.class);
            if (updateState != null) {
                updateState.setAccessible(true);
                HookHandle handle = hook(updateState)
                        .setId("ls_augment.api102.shoulder.gameassist.qstile_state_probe")
                        .setPriority(PRIORITY_LOWEST)
                        .setExceptionMode(ExceptionMode.PROTECTIVE)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            Object tile = chain.getThisObject();
                            if (tile != null && ONE_KEY_LINK_TILE_CLASS.equals(
                                    tile.getClass().getName())) {
                                Object tileState = readField(tile, "m");
                                writeShoulderProbe(SHOULDER_LAST_HIT_KEY,
                                        "GA-11|QSTile.d0|"
                                                + safePart(currentFullscreenPackage(classLoader))
                                                + "|tileEnabled=" + readBooleanField(tile, "t")
                                                + "|isGame=" + readBooleanField(tile, "r")
                                                + "|stateValue=" + readBooleanField(tileState, "i")
                                                + "|" + System.currentTimeMillis());
                            }
                            return result;
                        });
                shoulderHookHandles.add(handle);
                installed++;
                logInfo("SHOULDER_HOOK_INSTALLED GA-11 "
                        + updateState.toGenericString());
            } else {
                logInfo("SHOULDER_METHOD_MISSING GA-11 " + QSTILE_CLASS + ".d0");
            }
        } catch (Throwable t) {
            logError("SHOULDER_QSTILE_DIAGNOSTICS_FAILED", t);
        }
        return installed;
    }

    private static boolean containsOneKeyLinkTile(Object value) {
        if (!(value instanceof Collection)) return false;
        for (Object item : (Collection<?>) value) {
            if (item != null && ONE_KEY_LINK_TILE_CLASS.equals(item.getClass().getName())) {
                return true;
            }
        }
        return false;
    }

    private static String className(Object value) {
        return value == null ? "null" : value.getClass().getName();
    }

    private static Object readField(Object owner, String name) {
        if (owner == null) return null;
        for (Class<?> current = owner.getClass(); current != null;
                current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (NoSuchFieldException ignored) {
                // Continue into the superclass.
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static boolean writeIntField(Object owner, String name, int value) {
        if (owner == null) return false;
        for (Class<?> current = owner.getClass(); current != null;
                current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                if (field.getType() != int.class && field.getType() != Integer.class) {
                    return false;
                }
                if (field.getType() == int.class) field.setInt(owner, value);
                else field.set(owner, value);
                return true;
            } catch (NoSuchFieldException ignored) {
                // Continue through the superclass.
            } catch (Throwable ignored) {
                return false;
            }
        }
        return false;
    }

    private static long readLongField(Object owner, String name) {
        Object value = readField(owner, name);
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    private static boolean writeLongField(Object owner, String name, long value) {
        if (owner == null) return false;
        for (Class<?> current = owner.getClass(); current != null;
                current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                if (field.getType() != long.class && field.getType() != Long.class) {
                    return false;
                }
                if (field.getType() == long.class) field.setLong(owner, value);
                else field.set(owner, value);
                return true;
            } catch (NoSuchFieldException ignored) {
                // Continue through the superclass.
            } catch (Throwable ignored) {
                return false;
            }
        }
        return false;
    }

    private static boolean writeStringField(Object owner, String name, String value) {
        if (owner == null || value == null) return false;
        for (Class<?> current = owner.getClass(); current != null;
                current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                if (field.getType() != String.class) return false;
                field.set(owner, value);
                return true;
            } catch (NoSuchFieldException ignored) {
                // Continue through the superclass.
            } catch (Throwable ignored) {
                return false;
            }
        }
        return false;
    }

    private static String invokeStringMethod(Object owner, String name) {
        if (owner == null) return null;
        try {
            Method method = findMethod(owner.getClass(), name, String.class);
            if (method == null) return null;
            method.setAccessible(true);
            Object value = method.invoke(owner);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String currentGameHelperPackage(ClassLoader classLoader) {
        try {
            Class<?> manager = Class.forName(
                    GAME_MOTION_MANAGER_CLASS, false, classLoader);
            Method getInstance = findMethod(manager, "getInstance", manager);
            if (getInstance == null) return null;
            getInstance.setAccessible(true);
            return invokeStringMethod(getInstance.invoke(null), "getCurrentPackageName");
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Cursor filterShoulderBlacklistCursor(Cursor original) {
        if (original == null) return null;
        int packageColumn;
        String[] columns;
        int oldPosition = original.getPosition();
        try {
            packageColumn = original.getColumnIndex("package_name");
            if (packageColumn < 0) return original;
            columns = original.getColumnNames();
            MatrixCursor filtered = new MatrixCursor(columns, original.getCount());
            int removed = 0;
            original.moveToPosition(-1);
            while (original.moveToNext()) {
                String packageName = original.getString(packageColumn);
                if (isShoulderTarget(packageName, true)) {
                    removed++;
                    continue;
                }
                Object[] row = new Object[columns.length];
                for (int column = 0; column < columns.length; column++) {
                    switch (original.getType(column)) {
                        case Cursor.FIELD_TYPE_NULL:
                            row[column] = null;
                            break;
                        case Cursor.FIELD_TYPE_INTEGER:
                            row[column] = original.getLong(column);
                            break;
                        case Cursor.FIELD_TYPE_FLOAT:
                            row[column] = original.getDouble(column);
                            break;
                        case Cursor.FIELD_TYPE_BLOB:
                            row[column] = original.getBlob(column);
                            break;
                        case Cursor.FIELD_TYPE_STRING:
                        default:
                            row[column] = original.getString(column);
                            break;
                    }
                }
                filtered.addRow(row);
            }
            if (removed == 0) {
                original.moveToPosition(oldPosition);
                filtered.close();
                return original;
            }
            original.close();
            return filtered;
        } catch (Throwable ignored) {
            try {
                original.moveToPosition(oldPosition);
            } catch (Throwable ignoredAgain) {
                // Keep the provider fail-open if cursor restoration is unsupported.
            }
            return original;
        }
    }

    private static String readBooleanField(Object owner, String name) {
        Object value = readField(owner, name);
        return value instanceof Boolean ? value.toString() : "unknown";
    }

    private static String safePart(String value) {
        return value == null ? "null" : value.replace('|', '_');
    }

    private static Method findPublicNoArgBooleanMethod(Class<?> type) {
        Method candidate = null;
        for (Method method : type.getDeclaredMethods()) {
            if (!Modifier.isPublic(method.getModifiers())
                    || method.getParameterTypes().length != 0
                    || actualReturnType(method) != boolean.class) continue;
            if (candidate != null) return null;
            candidate = method;
        }
        return candidate;
    }

    private static Method findMethod(
            Class<?> type, String name, Class<?> returnType, Class<?>... expectedParameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            Method[] methods;
            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }
            for (Method method : methods) {
                if (!name.equals(method.getName())) continue;
                Class<?>[] actual = method.getParameterTypes();
                if (actual.length != expectedParameters.length) continue;
                if (returnType != null && actualReturnType(method) != returnType) continue;
                boolean match = true;
                for (int i = 0; i < actual.length; i++) {
                    Class<?> expected = expectedParameters[i];
                    if (!expected.isAssignableFrom(actual[i])
                            && !actual[i].isAssignableFrom(expected)) {
                        match = false;
                        break;
                    }
                }
                if (match) return method;
            }
        }
        return null;
    }

    private static Class<?> actualReturnType(Method method) {
        return method.getReturnType() == Boolean.class ? boolean.class : method.getReturnType();
    }

    private static String stringArg(
            io.github.libxposed.api.XposedInterface.Chain chain, int index) {
        try {
            Object value = chain.getArg(index);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isBooleanFalse(Object value) {
        return value instanceof Boolean && !((Boolean) value);
    }

    private static boolean isBooleanTrue(Object value) {
        return value instanceof Boolean && ((Boolean) value);
    }

    private static boolean isShoulderTarget(String packageName) {
        return isShoulderTarget(packageName, false);
    }

    /**
     * Check whether a package may use the shoulder-key path.  The optional
     * fallback is deliberately only used by the OEM GameHelper/GameHelperLine
     * hooks: Android package visibility can hide a real game from those
     * system processes even though the OEM has already supplied the package
     * to its own blacklist/current-game method.
     */
    private static boolean isShoulderTarget(
            String packageName, boolean allowGameHelperVisibilityFallback) {
        if (packageName == null || !packageName.matches(
                "[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+")) return false;
        if (isProtectedShoulderPackage(packageName)) return false;
        Context context = currentApplicationContext();
        if (!FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER)
                || !FeatureSettings.enabled(context, FeatureSettings.SHOULDER_ENABLED)) {
            return false;
        }
        try {
            ApplicationInfo info = context.getPackageManager().getApplicationInfo(packageName, 0);
            int systemFlags = ApplicationInfo.FLAG_SYSTEM
                    | ApplicationInfo.FLAG_UPDATED_SYSTEM_APP;
            return info.enabled
                    && (info.flags & ApplicationInfo.FLAG_INSTALLED) != 0
                    && (info.flags & systemFlags) == 0;
        } catch (Throwable ignored) {
            // GameHelper is a trusted, statically scoped OEM process. Its own
            // package-visibility filter cannot see many real games, so a
            // blacklist/current-game call from that process is authoritative
            // once the feature and protected-package gates above pass.
            return allowGameHelperVisibilityFallback
                    && isGameHelperVisibilityFallbackProcess(context);
        }
    }

    private static boolean isGameHelperVisibilityFallbackProcess(Context context) {
        if (context == null) return false;
        try {
            String packageName = context.getPackageName();
            return GAME_HELPER_PACKAGE.equals(packageName)
                    || GAME_HELPER_LINE_PACKAGE.equals(packageName);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isProtectedShoulderPackage(String packageName) {
        return "ls.augment.com".equals(packageName)
                || "io.github.lsf.augment".equals(packageName)
                || "me.weishu.kernelsu".equals(packageName)
                || "me.weishu.kernelsu.debug".equals(packageName)
                || "com.rifsxd.ksunext".equals(packageName)
                || "org.lsposed.manager".equals(packageName)
                || "com.topjohnwu.magisk".equals(packageName)
                || "me.bmax.apatch".equals(packageName);
    }

    private static boolean isShoulderBlacklistPlugin(String plugin) {
        return "keylink".equals(plugin)
                || "touch_long_keylink_point".equals(plugin)
                || "range_line".equals(plugin);
    }

    private static String filterShoulderBlacklistSetting(String key, String value) {
        if (!"game_assist_black_list_keylink".equals(key)
                && !"game_assist_black_list_range_line".equals(key)) {
            return value;
        }
        if (value == null || value.isEmpty()) return value;

        String[] packages = value.split(",");
        StringBuilder filtered = new StringBuilder(value.length());
        boolean removed = false;
        for (String packageName : packages) {
            String trimmed = packageName == null ? "" : packageName.trim();
            if (isShoulderTarget(trimmed)) {
                removed = true;
                continue;
            }
            if (filtered.length() > 0) filtered.append(',');
            filtered.append(trimmed);
        }
        return removed ? filtered.toString() : value;
    }

    private static String currentFullscreenPackage(ClassLoader classLoader) {
        try {
            Class<?> systemMgr = Class.forName(
                    "com.zte.gameassist.common.SystemMgr", false, classLoader);
            Method method = findMethod(systemMgr, "getCurFullscreenPackage", String.class);
            if (method == null) return null;
            method.setAccessible(true);
            Object value = method.invoke(null);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void writeShoulderProbe(String key, String value) {
        try {
            Context context = currentApplicationContext();
            FeatureSettings.diagnostic(context, key, value);
        } catch (Throwable ignored) {
            // Diagnostics must never affect the OEM shoulder-key path.
        }
    }

    private static void writeComboSpeedProbe(String key, String value) {
        try {
            Context context = currentApplicationContext();
            FeatureSettings.diagnostic(context, key, value);
        } catch (Throwable ignored) {
            // Diagnostics must never affect the OEM one-key playback path.
        }
    }

    private static boolean forceSupportedGameKeyLink(Object owner) {
        if (owner == null) return false;
        String[] names = {"mSupportedGameKeyLink", "supportedGameKeyLink",
                "mGameKeyLinkSupported", "gameKeyLinkSupported"};
        for (String name : names) {
            for (Class<?> current = owner.getClass(); current != null;
                    current = current.getSuperclass()) {
                try {
                    Field field = current.getDeclaredField(name);
                    field.setAccessible(true);
                    if (field.getType() != boolean.class && field.getType() != Boolean.class) continue;
                    field.set(owner, true);
                    return true;
                } catch (NoSuchFieldException ignored) {
                    // Continue into the superclass.
                } catch (Throwable ignored) {
                    return false;
                }
            }
        }
        return false;
    }

    private synchronized void installSettingsHooks(ClassLoader classLoader) {
        if (rebuildHookInstalled || removeHookInstalled || adapterClassFound) return;

        final Class<?> adapter;
        try {
            adapter = Class.forName(ADAPTER_CLASS, false, classLoader);
            adapterClassFound = true;
            logInfo("CLASS_FOUND " + ADAPTER_CLASS);
        } catch (Throwable t) {
            setupError = "adapter_class_missing:" + t.getClass().getName() + ":" + safeMessage(t);
            logError("CLASS_MISSING " + ADAPTER_CLASS, t);
            return;
        }

        // MyOS real-device acceptance proved removeHideApk(...) is the active
        // list path. Freeze it as the primary hook. onRebuildComplete remains a
        // compatibility fallback only when the vendor hook is absent.
        removeHookInstalled = installRemoveHideApk(adapter);
        if (!removeHookInstalled) {
            rebuildHookInstalled = installOnRebuildComplete(adapter);
        }
        if (!removeHookInstalled && !rebuildHookInstalled) {
            setupError = "no_supported_settings_hook_point";
        } else {
            setupError = "";
        }
    }

    private synchronized void installApplicationWitness() {
        if (startupWitnessInstalled || contextReady) return;
        try {
            Method method = Instrumentation.class.getDeclaredMethod(
                    "callApplicationOnCreate", Application.class);
            HookHandle handle = hook(method)
                    .setId("ls_augment.api102.application_on_create")
                    .setPriority(PRIORITY_HIGHEST)
                    .setExceptionMode(ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        Object arg = chain.getArg(0);
                        if (arg instanceof Application) {
                            Application app = (Application) arg;
                            if (SETTINGS_PACKAGE.equals(app.getPackageName())) {
                                persistProbeSnapshot(app);
                            }
                        }
                        return chain.proceed();
                    });
            hookHandles.add(handle);
            startupWitnessInstalled = true;
            logInfo("CONTEXT_WITNESS_INSTALLED");
        } catch (Throwable t) {
            setupError = "context_witness_failed:" + t.getClass().getName() + ":" + safeMessage(t);
            logError("CONTEXT_WITNESS_FAILED", t);
        }
    }

    private boolean installOnRebuildComplete(Class<?> adapter) {
        Method method = findSingleListMethod(adapter, "onRebuildComplete");
        if (method == null) {
            logInfo("METHOD_MISSING onRebuildComplete");
            return false;
        }
        try {
            method.setAccessible(true);
            HookHandle handle = hook(method)
                    .setId("ls_augment.api102.settings.onRebuildComplete")
                    .setPriority(PRIORITY_HIGHEST)
                    .setExceptionMode(ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        Context context = resolveSettingsContext(chain.getThisObject());
                        if (context != null) persistProbeSnapshot(context);

                        Object arg = chain.getArg(0);
                        if (context != null && arg instanceof List) {
                            Object filtered = filterCopy(
                                    context, (List<?>) arg, "onRebuildComplete");
                            return chain.proceed(new Object[]{filtered});
                        }
                        return chain.proceed();
                    });
            hookHandles.add(handle);
            logInfo("HOOK_INSTALLED onRebuildComplete signature=" + method.toGenericString());
            return true;
        } catch (Throwable t) {
            setupError = "rebuild_hook_failed:" + t.getClass().getName() + ":" + safeMessage(t);
            logError("HOOK_INSTALL_FAILED onRebuildComplete", t);
            return false;
        }
    }

    private boolean installRemoveHideApk(Class<?> adapter) {
        Method method = findSingleListMethod(adapter, "removeHideApk");
        if (method == null) {
            logInfo("METHOD_MISSING removeHideApk");
            return false;
        }
        try {
            method.setAccessible(true);
            HookHandle handle = hook(method)
                    .setId("ls_augment.api102.settings.removeHideApk")
                    .setPriority(PRIORITY_LOWEST)
                    .setExceptionMode(ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        Context context = resolveSettingsContext(chain.getThisObject());
                        if (context != null) persistProbeSnapshot(context);
                        if (context != null && result instanceof List) {
                            return filterCopy(context, (List<?>) result, "removeHideApk");
                        }
                        return result;
                    });
            hookHandles.add(handle);
            logInfo("HOOK_INSTALLED removeHideApk signature=" + method.toGenericString());
            return true;
        } catch (Throwable t) {
            setupError = "remove_hook_failed:" + t.getClass().getName() + ":" + safeMessage(t);
            logError("HOOK_INSTALL_FAILED removeHideApk", t);
            return false;
        }
    }

    /** Locate a one-argument method whose parameter is List/ArrayList-compatible. */
    private static Method findSingleListMethod(Class<?> type, String name) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            Method[] methods;
            try {
                methods = c.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }
            for (Method method : methods) {
                if (!name.equals(method.getName())) continue;
                Class<?>[] params = method.getParameterTypes();
                if (params.length != 1) continue;
                if (List.class.isAssignableFrom(params[0])) return method;
            }
        }
        return null;
    }

    private static Method findSingleViewGroupMethod(Class<?> type, String name) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            Method[] methods;
            try {
                methods = c.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }
            for (Method method : methods) {
                if (!name.equals(method.getName()) || method.getReturnType() != void.class) {
                    continue;
                }
                Class<?>[] params = method.getParameterTypes();
                if (params.length == 1 && ViewGroup.class.isAssignableFrom(params[0])) {
                    return method;
                }
            }
        }
        return null;
    }

    private synchronized void persistProbeSnapshot(Context context) {
        if (context == null || !SETTINGS_PACKAGE.equals(context.getPackageName())) return;
        contextReady = true;
        writeProbe(context, PROBE_VERSION_KEY, VERSION);
        writeProbe(context, PROBE_API_KEY, String.valueOf(getApiVersion()));
        writeProbe(context, PROBE_FRAMEWORK_KEY,
                getFrameworkName() + "/" + getFrameworkVersion() + "/" + getFrameworkVersionCode());
        writeProbe(context, PROBE_MODULE_LOADED_KEY, moduleLoaded ? "1" : "0");
        writeProbe(context, PROBE_PACKAGE_READY_KEY, packageReady ? "1" : "0");
        writeProbe(context, PROBE_CONTEXT_READY_KEY, "1");
        writeProbe(context, PROBE_CLASS_FOUND_KEY, adapterClassFound ? "1" : "0");
        writeProbe(context, PROBE_REBUILD_HOOK_KEY, rebuildHookInstalled ? "1" : "0");
        writeProbe(context, PROBE_REMOVE_HOOK_KEY, removeHookInstalled ? "1" : "0");
        writeProbe(context, PROBE_HOOK_INSTALLED_KEY,
                (rebuildHookInstalled || removeHookInstalled) ? "1" : "0");
        // Do not reset filter_called once it has become true.
        String called = Settings.Global.getString(context.getContentResolver(), PROBE_FILTER_CALLED_KEY);
        if (!"1".equals(called)) writeProbe(context, PROBE_FILTER_CALLED_KEY, "0");
        writeProbe(context, PROBE_ERROR_KEY, setupError == null ? "" : setupError);
    }

    /**
     * Resolve a Settings Context from vendor adapter ownership, with
     * ActivityThread.currentApplication() as the final public-process fallback.
     */
    private static Context resolveSettingsContext(Object owner) {
        if (owner instanceof Context) return (Context) owner;

        String[] fields = {"mContext", "context", "mManageApplications", "this$0", "mFragment"};
        for (String name : fields) {
            Object value = fieldValue(owner, name);
            Context c = contextFromObject(value);
            if (c != null) return c;
        }
        return currentApplicationContext();
    }

    private static Context contextFromObject(Object value) {
        if (value instanceof Context) return (Context) value;
        if (value == null) return null;
        try {
            Method m = value.getClass().getMethod("getContext");
            Object out = m.invoke(value);
            return out instanceof Context ? (Context) out : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Context currentApplicationContext() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Method m = at.getDeclaredMethod("currentApplication");
            m.setAccessible(true);
            Object app = m.invoke(null);
            return app instanceof Context ? (Context) app : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Return a filtered ArrayList copy; never mutate a Settings-owned list. */
    private Object filterCopy(Context context, List<?> input, String source) {
        writeProbe(context, PROBE_FILTER_CALLED_KEY, "1");
        final long now = System.currentTimeMillis();
        try {
            Set<String> targets = readActiveTargets(context);
            if (input == null || input.isEmpty() || targets.isEmpty()) {
                writeDiagnostics(context, source, now,
                        input == null ? 0 : input.size(), 0,
                        input == null ? 0 : input.size(), targets.size(), null);
                return input instanceof ArrayList ? input : new ArrayList<>(input);
            }

            ArrayList<Object> output = new ArrayList<>(input.size());
            int removed = 0;
            for (Object entry : input) {
                EntryIdentity identity = resolveEntryIdentity(entry);
                if (identity != null
                        && SettingsTargetMatcher.matches(
                        targets, identity.userId, identity.packageName)) {
                    removed++;
                    logInfo("REMOVE " + identity.userId + ":" + identity.packageName
                            + " source=" + source);
                } else {
                    output.add(entry);
                }
            }

            writeDiagnostics(context, source, now,
                    input.size(), removed, output.size(), targets.size(), null);
            return removed == 0 && input instanceof ArrayList ? input : output;
        } catch (Throwable t) {
            writeDiagnostics(context, source, now,
                    input == null ? -1 : input.size(), 0,
                    input == null ? -1 : input.size(), -1, t);
            logError("FILTER_FAILED_OPEN source=" + source, t);
            return input;
        }
    }

    private Set<String> readActiveTargets(Context context) {
        if (!FeatureSettings.enabled(context, FeatureSettings.HIDE_MASTER, false)) {
            return Collections.emptySet();
        }
        String raw = Settings.Global.getString(context.getContentResolver(), MIRROR_KEY);
        if (raw == null) raw = "";
        String cached = cachedMirrorRaw;
        if (cached != null && cached.equals(raw)) return cachedTargets;
        Set<String> parsed = SettingsTargetMatcher.parse(raw);
        // Preserve an immutable snapshot across hook invocations.
        parsed = Collections.unmodifiableSet(new HashSet<>(parsed));
        cachedTargets = parsed;
        cachedMirrorRaw = raw;
        return parsed;
    }

    private static EntryIdentity resolveEntryIdentity(Object entry) {
        if (entry == null) return null;

        ApplicationInfo info;
        if (entry instanceof ApplicationInfo) {
            info = (ApplicationInfo) entry;
        } else {
            info = applicationInfoField(entry, "info");
            if (info == null) info = applicationInfoField(entry, "mInfo");
            if (info == null) info = applicationInfoField(entry, "applicationInfo");
        }
        if (info == null || info.packageName == null || info.packageName.isEmpty()) return null;

        Integer explicitUser = intField(entry, "userId");
        if (explicitUser == null) explicitUser = intField(entry, "mUserId");
        int userId = explicitUser != null
                ? explicitUser
                : userIdFromUid(info.uid);
        return new EntryIdentity(userId, info.packageName);
    }

    /**
     * Public Android SDKs do not expose UserHandle#getIdentifier(). Android's
     * stable multi-user UID layout uses PER_USER_RANGE=100000; derive only the
     * fallback identity when the vendor entry has no explicit userId field.
     */
    private static int userIdFromUid(int uid) {
        if (uid < 0) return 0;
        return uid / 100000;
    }

    private static ApplicationInfo applicationInfoField(Object owner, String name) {
        Object value = fieldValue(owner, name);
        return value instanceof ApplicationInfo ? (ApplicationInfo) value : null;
    }

    private static Integer intField(Object owner, String name) {
        Object value = fieldValue(owner, name);
        return value instanceof Integer ? (Integer) value : null;
    }

    private static Object fieldValue(Object owner, String name) {
        if (owner == null) return null;
        for (Class<?> c = owner.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (NoSuchFieldException ignored) {
                // Continue into the superclass.
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private void writeDiagnostics(
            Context context,
            String source,
            long timestamp,
            int before,
            int removed,
            int after,
            int targetCount,
            Throwable error) {
        try {
            Settings.Global.putString(context.getContentResolver(), ACTIVE_KEY, "1");
            Settings.Global.putString(context.getContentResolver(), VERSION_KEY, VERSION);
            Settings.Global.putString(context.getContentResolver(), STRATEGY_KEY, source);
            Settings.Global.putString(
                    context.getContentResolver(),
                    LAST_FILTER_KEY,
                    "version=" + VERSION
                            + ";api=" + getApiVersion()
                            + ";ts=" + timestamp
                            + ";source=" + source
                            + ";before=" + before
                            + ";removed=" + removed
                            + ";after=" + after
                            + ";targets=" + targetCount);
            Settings.Global.putString(
                    context.getContentResolver(),
                    LAST_ERROR_KEY,
                    error == null ? "" : error.getClass().getName() + ":" + safeMessage(error));
        } catch (Throwable ignored) {
            // Diagnostics never control filtering.
        }
    }

    private static void writeProbe(Context context, String key, String value) {
        try {
            Settings.Global.putString(context.getContentResolver(), key, value);
        } catch (Throwable ignored) {
            // Probe failure must never crash Settings.
        }
    }

    private void logInfo(String message) {
        Log.i(TAG, message);
        log(Log.INFO, TAG, message);
    }

    private void logError(String message, Throwable throwable) {
        Log.e(TAG, message, throwable);
        log(Log.ERROR, TAG, message, throwable);
    }

    private static String safeMessage(Throwable throwable) {
        String msg = throwable == null ? "" : throwable.getMessage();
        return msg == null ? "" : msg.replace('\n', ' ').replace('\r', ' ');
    }

    private static final class EntryIdentity {
        final int userId;
        final String packageName;

        EntryIdentity(int userId, String packageName) {
            this.userId = userId;
            this.packageName = packageName;
        }
    }
}
