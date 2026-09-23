package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.Consumer;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.HookHandle;

/**
 * Tightens only the vendor AI-trigger scheduling loops.  The ROM contains two
 * independent engines: the template/click plug-in process, the GameLab
 * template matcher, and the YOLO loop inside GameAssist. Hooking Handler
 * globally would speed up unrelated work, so every replacement is additionally
 * checked by handler class, message, and the original delay value.
 */
final class AiTriggerSpeedHook {
    private static final String PLUGIN_PACKAGE = "com.zte.game.plugintrigger";
    private static final String GAME_ASSIST_PACKAGE = "cn.nubia.gameassist";
    private static final String GAME_LAB_PACKAGE = "cn.nubia.gamelab";
    private static final String TEMPLATE_HANDLER =
            "com.zte.game.plugintrigger.service.PluginTriggerService$WorkHandler";
    private static final String CLICK_HANDLER =
            "com.zte.game.plugintrigger.plugins.click.TouchScreenPlugin$WorkHandler";
    private static final String POLICY_INTERVAL_HANDLER =
            "com.zte.game.plugintrigger.policy.PolicyManager$PolicyIntervalHandler";
    private static final String ACTION_HANDLER =
            "com.zte.game.plugintrigger.service.PluginsController$2";
    private static final String LEGACY_ACTION_HANDLER =
            "com.zte.game.plugintrigger.service.PluginsController$MyHandler";
    /** autoClick plugin type (11) plus the vendor completion-message offset. */
    private static final int AUTO_CLICK_COMPLETION_MESSAGE = 1011;
    private static final String YOLO_HANDLER =
            "com.zte.aivibrate.processor.YoloDataProcessor$1";
    private static final String GAME_LAB_BASE_SCENE =
            "cn.nubia.gamelab.scene.BaseScene";
    private static final String GAME_LAB_BASE_TOY =
            "cn.nubia.gamelab.toy.BaseToy";
    private static final String GAME_LAB_COMMON_TOY =
            "cn.nubia.gamelab.toy.CommonToy";
    /** 王者荣耀 uses SGameToy on the current Nubia GameLab build. */
    private static final String GAME_LAB_SGAME_TOY =
            "cn.nubia.gamelab.toy.SGameToy";
    private static final String GAME_LAB_COMMON_SCENE =
            "cn.nubia.gamelab.scene.CommonScene";
    private static final String POLICY_MANAGER =
            "com.zte.game.plugintrigger.policy.PolicyManager";
    private static final String GAME_LAB_INTERFACE_MANAGER =
            "com.zte.game.plugintrigger.service.GameLabInterfaceManager";
    private static final String POLICY_INFO =
            "com.zte.game.plugintrigger.policy.PolicyInfo";
    private static final String TRIGGER_INFO =
            "com.zte.game.plugintrigger.policy.TriggerInfo";
    private static final int TEMPLATE_SEARCH_MARGIN_X = 48;
    private static final int TEMPLATE_SEARCH_MARGIN_Y = 80;
    /** Template matching below 80 ms is intentionally unsupported. */
    private static final long MIN_TEMPLATE_SCAN_MS = 80L;
    /**
     * GameLab hard-codes 0.99 for the source-template pass.  The source
     * image is captured by the browser at a slightly different scale/colour
     * on the test page, so a real S icon scores about 0.958 and is rejected
     * before it can emit the click event.  Lower only this source pass; the
     * same-frame foreground/correlation check below remains the final gate.
     */
    private static final float GAME_LAB_SOURCE_MATCH_THRESHOLD = 0.90f;
    /** Dedicated trace tag for one reproducible AI-trigger transaction. */
    private static final String TRACE_TAG = "LS_Augment_AI";

    private static final String ENABLED = FeatureSettings.AI_TRIGGER_ENABLED;
    private static final String GAME_MASTER = FeatureSettings.GAME_MASTER;
    private static final String DIAGNOSTICS = FeatureSettings.AI_TRIGGER_DIAGNOSTICS;
    private static final String TEMPLATE_SCAN = FeatureSettings.AI_TRIGGER_TEMPLATE_SCAN_MS;
    private static final String CLICK_DELAY = FeatureSettings.AI_TRIGGER_CLICK_MS;
    private static final String COOLDOWN = FeatureSettings.AI_TRIGGER_COOLDOWN_MS;
    private static final String YOLO_SCAN = FeatureSettings.AI_TRIGGER_YOLO_SCAN_MS;

    private static volatile Config cachedConfig;
    private static volatile long lastConfigRead;
    private static final AtomicLong TRACE_SEQUENCE = new AtomicLong();
    private static final ThreadLocal<SceneFrame> LAST_SCENE_FRAME = new ThreadLocal<>();
    /** Template Mats are stable for a policy lifetime; retain their decoded pixels by identity. */
    private static final Map<Object, TemplateSnapshot> TEMPLATE_CACHE = new WeakHashMap<>();
    private static final Map<Object, FrameRecognition> FRAME_CACHE = new WeakHashMap<>();
    private static final Map<String, Long> LAST_ENGINE_DIAGNOSTIC = new HashMap<>();

    private AiTriggerSpeedHook() { }

    static int install(AugmentModule module, ClassLoader classLoader, String packageName) {
        if (module == null || classLoader == null) return 0;
        int installed = 0;
        try {
            Class<?> handler = Class.forName("android.os.Handler", false, classLoader);
            Method empty = handler.getDeclaredMethod(
                    "sendEmptyMessageDelayed", int.class, long.class);
            empty.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                    empty, "ai.handler.empty." + safeId(packageName), true)
                    .intercept(chain -> interceptEmpty(module, chain, packageName));
            module.registerFeatureHook(handle);
            installed++;

            Method message = handler.getDeclaredMethod(
                    "sendMessageDelayed", Message.class, long.class);
            message.setAccessible(true);
            HookHandle messageHandle = module.prepareFeatureHook(
                    message, "ai.handler.message." + safeId(packageName), true)
                    .intercept(chain -> interceptMessage(module, chain, packageName));
            module.registerFeatureHook(messageHandle);
            installed++;

            Method dispatch = handler.getDeclaredMethod("dispatchMessage", Message.class);
            dispatch.setAccessible(true);
            HookHandle dispatchHandle = module.prepareFeatureHook(
                    dispatch, "ai.handler.dispatch." + safeId(packageName), true)
                    .intercept(chain -> interceptDispatch(module, chain, packageName));
            module.registerFeatureHook(dispatchHandle);
            installed++;
            module.logFeatureInfo("AI_HANDLER_INSTALLED package=" + packageName);
        } catch (Throwable error) {
            module.logFeatureError("AI_HANDLER_FAILED package=" + packageName, error);
        }

        if (PLUGIN_PACKAGE.equals(packageName)) {
            try {
                Class<?> policy = Class.forName(POLICY_MANAGER, false, classLoader);
                Method legal = findMethod(policy, "getLegalRangeValue", long.class,
                        long.class, long.class, long.class);
                if (legal != null) {
                    legal.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            legal, "ai.policy.cooldown", true)
                            .intercept(chain -> interceptPolicy(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_POLICY_INSTALLED " + legal.toGenericString());
                } else {
                    module.logFeatureInfo("AI_POLICY_MISSING " + POLICY_MANAGER);
                }
            } catch (Throwable error) {
                module.logFeatureError("AI_POLICY_FAILED", error);
            }
            try {
                // PolicyIntervalHandler overrides Handler.sendMessageDelayed.
                // Hooking only android.os.Handler therefore misses the actual
                // 2-second policy reschedule on this firmware.
                Class<?> interval = Class.forName(POLICY_INTERVAL_HANDLER, false, classLoader);
                Method send = findMethod(interval, "sendMessageDelayed", boolean.class,
                        Message.class, long.class);
                if (send != null) {
                    send.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            send, "ai.policy.interval.send", true)
                            .intercept(chain -> interceptPolicyInterval(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_POLICY_INTERVAL_INSTALLED "
                            + send.toGenericString());
                } else {
                    module.logFeatureInfo("AI_POLICY_INTERVAL_MISSING "
                            + POLICY_INTERVAL_HANDLER);
                }
            } catch (Throwable error) {
                module.logFeatureError("AI_POLICY_INTERVAL_FAILED", error);
            }
            try {
                // The vendor clamps every policy interval to a hard-coded
                // 2000 ms in triggerStart() (Math.max(2000, interval)).
                // Reschedule only the policies that actually started in this
                // invocation, after the vendor has queued its original message.
                // This avoids touching unrelated Handler messages and also
                // avoids continuously postponing the timeout while a policy is
                // already marked as running.
                Class<?> policy = Class.forName(POLICY_MANAGER, false, classLoader);
                Method triggerStart = findMethod(policy, "triggerStart", void.class,
                        List.class);
                if (triggerStart != null) {
                    triggerStart.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            triggerStart, "ai.policy.trigger.start", false)
                            .intercept(chain -> interceptTriggerStart(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_POLICY_TRIGGER_INSTALLED "
                            + triggerStart.toGenericString());
                } else {
                    module.logFeatureInfo("AI_POLICY_TRIGGER_MISSING " + POLICY_MANAGER);
                }
            } catch (Throwable error) {
                module.logFeatureError("AI_POLICY_TRIGGER_FAILED", error);
            }
            try {
                // The vendor stores only the exact template rectangle as the
                // live search window. Small layout changes (status bar, browser
                // toolbar, centred timer text) can therefore move a valid icon
                // completely outside the 1:1 crop. Refresh GameLab's runtime
                // scene with a bounded search margin immediately before the
                // scene is registered. The source policy and UI values remain
                // untouched.
                Class<?> manager = Class.forName(
                        GAME_LAB_INTERFACE_MANAGER, false, classLoader);
                Method register = findRegisterScenesMethod(manager);
                if (register != null) {
                    register.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            register, "ai.gamelab.scene.search.window", true)
                            .intercept(chain -> interceptRegisterScenes(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_GAMELAB_SCENE_WINDOW_INSTALLED "
                            + register.toGenericString());
                } else {
                    module.logFeatureInfo("AI_GAMELAB_SCENE_WINDOW_MISSING "
                            + GAME_LAB_INTERFACE_MANAGER);
                }
            } catch (Throwable error) {
                module.logFeatureError("AI_GAMELAB_SCENE_WINDOW_FAILED", error);
            }
        }

        if (GAME_LAB_PACKAGE.equals(packageName)) {
            try {
                Class<?> handler = Class.forName("android.os.Handler", false, classLoader);
                Method postDelayed = handler.getDeclaredMethod(
                        "postDelayed", Runnable.class, long.class);
                postDelayed.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        postDelayed, "ai.gamelab.scan.post", true)
                        .intercept(chain -> interceptGameLabPostDelayed(module, chain));
                module.registerFeatureHook(handle);
                installed++;
                module.logFeatureInfo("AI_GAMELAB_SCAN_POST_INSTALLED "
                        + postDelayed.toGenericString());
            } catch (Throwable error) {
                module.logFeatureError("AI_GAMELAB_SCAN_POST_FAILED", error);
            }
            installed += installGameLabToyHooks(module, classLoader);
            installed += installGameLabEventFlushHook(module, classLoader);
            try {
                Class<?> baseScene = Class.forName(GAME_LAB_BASE_SCENE, false, classLoader);
                Class<?> commonScene = Class.forName(GAME_LAB_COMMON_SCENE, false, classLoader);
                Method matchThreshold = findGameLabMatchThresholdMethod(baseScene);
                if (matchThreshold != null) {
                    matchThreshold.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            matchThreshold, "ai.gamelab.match.threshold", true)
                            .intercept(chain -> interceptGameLabMatchThreshold(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_GAMELAB_MATCH_THRESHOLD_INSTALLED "
                            + matchThreshold.toGenericString());
                } else {
                    module.logFeatureInfo("AI_GAMELAB_MATCH_THRESHOLD_MISSING "
                            + GAME_LAB_BASE_SCENE);
                }
                Method crop = findGameLabCropMethod(baseScene);
                if (crop != null) {
                    crop.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            crop, "ai.gamelab.crop.runtime", true)
                            .intercept(chain -> interceptGameLabCrop(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_GAMELAB_RUNTIME_CROP_INSTALLED "
                            + crop.toGenericString());
                } else {
                    module.logFeatureInfo("AI_GAMELAB_RUNTIME_CROP_MISSING "
                            + GAME_LAB_BASE_SCENE);
                }
                Method recognize = findGameLabTemplateRecognizeMethod(commonScene);
                if (recognize != null) {
                    recognize.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            recognize, "ai.gamelab.template.verify", true)
                            .intercept(chain -> interceptGameLabTemplateRecognize(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_GAMELAB_TEMPLATE_VERIFY_INSTALLED "
                            + recognize.toGenericString());
                } else {
                    module.logFeatureInfo("AI_GAMELAB_TEMPLATE_VERIFY_MISSING "
                            + GAME_LAB_COMMON_SCENE);
                }
                Method colorRecognize = findGameLabColorRecognizeMethod(commonScene);
                if (colorRecognize != null) {
                    colorRecognize.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            colorRecognize, "ai.gamelab.color.verify", true)
                            .intercept(chain -> interceptGameLabColorRecognize(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_GAMELAB_COLOR_VERIFY_INSTALLED "
                            + colorRecognize.toGenericString());
                } else {
                    module.logFeatureInfo("AI_GAMELAB_COLOR_VERIFY_MISSING "
                            + GAME_LAB_COMMON_SCENE);
                }
            } catch (Throwable error) {
                module.logFeatureError("AI_GAMELAB_TEMPLATE_VERIFY_FAILED", error);
            }
        }

        writeDiagnostic(module, "installed", packageName + "=" + installed);
        return installed;
    }

    /**
     * The original hook targeted CommonToy, but the Nubia King of Glory build
     * actually runs SGameToy. Keep CommonToy as a compatibility fallback while
     * installing the real SGameToy scheduling methods when present.
     */
    private static int installGameLabToyHooks(AugmentModule module, ClassLoader classLoader) {
        int installed = 0;
        String[] candidates = {GAME_LAB_SGAME_TOY, GAME_LAB_COMMON_TOY};
        for (String className : candidates) {
            final Class<?> toy;
            try {
                toy = Class.forName(className, false, classLoader);
                module.logFeatureInfo("AI_GAMELAB_TOY_FOUND " + className);
            } catch (Throwable missing) {
                module.logFeatureInfo("AI_GAMELAB_TOY_MISSING " + className);
                continue;
            }

            try {
                Method scheduleDetect = findMethod(toy, "scheduleDetectRunnable", void.class);
                if (scheduleDetect != null) {
                    scheduleDetect.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            scheduleDetect, "ai.gamelab.scan.schedule." + safeId(className), true)
                            .intercept(chain -> interceptGameLabSchedule(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_GAMELAB_SCAN_SCHEDULE_INSTALLED "
                            + scheduleDetect.toGenericString());
                } else {
                    module.logFeatureInfo("AI_GAMELAB_SCAN_SCHEDULE_MISSING " + className);
                }

                Method startDetect = findMethod(toy, "startDetectBitmap", void.class);
                if (startDetect != null) {
                    startDetect.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                            startDetect, "ai.gamelab.scan.singleflight." + safeId(className), true)
                            .intercept(chain -> interceptGameLabStartDetect(module, chain));
                    module.registerFeatureHook(handle);
                    installed++;
                    module.logFeatureInfo("AI_GAMELAB_SINGLEFLIGHT_INSTALLED "
                            + startDetect.toGenericString());
                } else {
                    module.logFeatureInfo("AI_GAMELAB_SINGLEFLIGHT_MISSING " + className);
                }
            } catch (Throwable error) {
                module.logFeatureError("AI_GAMELAB_TOY_HOOK_FAILED " + className, error);
            }
        }
        return installed;
    }

    /**
     * BaseToy batches scene events until the end of the full detection task.
     * On the current SGameToy that leaves a confirmed template match waiting
     * behind the other scene recognizers for roughly 300 ms.  Flush only
     * policy-bearing bundles immediately after they have passed the verified
     * template path; other GameLab telemetry remains batched as before.
     */
    private static int installGameLabEventFlushHook(AugmentModule module,
            ClassLoader classLoader) {
        try {
            Class<?> baseToy = Class.forName(GAME_LAB_BASE_TOY, false, classLoader);
            Method addMsg = findMethod(baseToy, "addMsg", void.class, Bundle.class);
            if (addMsg == null) {
                module.logFeatureInfo("AI_GAMELAB_EVENT_FLUSH_MISSING " + GAME_LAB_BASE_TOY);
                return 0;
            }
            addMsg.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                    addMsg, "ai.gamelab.event.flush", true)
                    .intercept(chain -> interceptGameLabAddMsg(module, chain));
            module.registerFeatureHook(handle);
            module.logFeatureInfo("AI_GAMELAB_EVENT_FLUSH_INSTALLED "
                    + addMsg.toGenericString());
            return 1;
        } catch (Throwable error) {
            module.logFeatureError("AI_GAMELAB_EVENT_FLUSH_FAILED", error);
            return 0;
        }
    }

    private static Object interceptEmpty(AugmentModule module, Chain chain, String packageName)
            throws Throwable {
        int what = intArg(chain.getArg(0));
        long originalDelay = longArg(chain.getArg(1));
        Long replacement = replacementFor(module, chain.getThisObject(),
                what, originalDelay, packageName);
        traceTouchSchedule(chain.getThisObject(), packageName, what, originalDelay, replacement);
        if (replacement != null && alreadyQueued(chain.getThisObject(), what)) {
            return Boolean.TRUE;
        }
        return replacement == null ? chain.proceed()
                : chain.proceed(new Object[]{chain.getArg(0), replacement});
    }

    private static Object interceptMessage(AugmentModule module, Chain chain, String packageName)
            throws Throwable {
        Message message = chain.getArg(0) instanceof Message
                ? (Message) chain.getArg(0) : null;
        int what = message == null ? Integer.MIN_VALUE : message.what;
        long originalDelay = longArg(chain.getArg(1));
        Long replacement = replacementFor(module, chain.getThisObject(), what,
                originalDelay, packageName);
        traceTouchSchedule(chain.getThisObject(), packageName, what, originalDelay, replacement);
        if (replacement != null && alreadyQueued(chain.getThisObject(), what)) {
            return Boolean.TRUE;
        }
        return replacement == null ? chain.proceed()
                : chain.proceed(new Object[]{chain.getArg(0), replacement});
    }

    /**
     * The vendor click plugin executes its native touch calls from a Handler.
     * Logging at dispatch time distinguishes "queued" from "actually run".
     */
    private static Object interceptDispatch(AugmentModule module, Chain chain,
            String packageName) throws Throwable {
        Object owner = chain.getThisObject();
        Message message = chain.getArg(0) instanceof Message
                ? (Message) chain.getArg(0) : null;
        int what = message == null ? Integer.MIN_VALUE : message.what;
        if (!PLUGIN_PACKAGE.equals(packageName)
                || owner == null
                || !CLICK_HANDLER.equals(owner.getClass().getName())
                || !isTouchMessage(what)) {
            return chain.proceed();
        }

        traceStage("TOUCH_DISPATCH_BEGIN what=" + what
                + " arg1=" + (message == null ? "-" : message.arg1)
                + " arg2=" + (message == null ? "-" : message.arg2));
        try {
            Object result = chain.proceed();
            traceStage("TOUCH_DISPATCH_END what=" + what);
            return result;
        } catch (Throwable error) {
            traceStage("TOUCH_DISPATCH_ERROR what=" + what
                    + " error=" + error.getClass().getName()
                    + ":" + traceError(error));
            throw error;
        }
    }

    private static void traceTouchSchedule(Object owner, String packageName, int what,
            long originalDelay, Long replacement) {
        if (!PLUGIN_PACKAGE.equals(packageName)
                || owner == null
                || !CLICK_HANDLER.equals(owner.getClass().getName())
                || !isTouchMessage(what)) {
            return;
        }
        String phase;
        switch (what) {
            case 101:
                phase = "ACTION_QUEUE";
                break;
            case 102:
                phase = "TOUCH_DOWN_QUEUE";
                break;
            case 103:
                phase = "TOUCH_UP_QUEUE";
                break;
            case 104:
                phase = "TOUCH_DISABLE_QUEUE";
                break;
            default:
                phase = "TOUCH_QUEUE";
                break;
        }
        traceStage(phase + " what=" + what
                + " originalDelay=" + originalDelay
                + " scheduledDelay=" + (replacement == null
                ? originalDelay : replacement.longValue()));
    }

    private static boolean isTouchMessage(int what) {
        return what >= 101 && what <= 104;
    }

    private static boolean alreadyQueued(Object owner, int what) {
        if (!(owner instanceof Handler) || isTouchMessage(what)) return false;
        try {
            return ((Handler) owner).hasMessages(what);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Object interceptGameLabPostDelayed(AugmentModule module, Chain chain)
            throws Throwable {
        Config config = config(module, chain.getThisObject());
        Object callback = chain.getArg(0);
        long delay = longArg(chain.getArg(1));
        if (!config.enabled || delay != 2000L || !isGameLabDetectRunnable(callback)) {
            return chain.proceed();
        }
        long target = AiTriggerTimingPolicy.scanDelay(
                delay, config.templateScanMs, MIN_TEMPLATE_SCAN_MS);
        traceStage("GAMELAB_SCAN_POST originalDelay=" + delay + " scheduledDelay=" + target
                + " runnable=" + callback.getClass().getName());
        hit(module, GAME_LAB_PACKAGE + "|scan_post|" + delay + "->" + target);
        return chain.proceed(new Object[]{callback, Long.valueOf(target)});
    }

    /**
     * GameLab's 王者荣耀 path calls CommonToy.scheduleDetectRunnable() from
     * the detection runnable itself.  On that build the Handler.postDelayed
     * hook does not observe the call, leaving the vendor's 2000 ms delay in
     * place. Replace the scheduling method directly and remove any stale
     * vendor callback before posting the configured cadence.
     */
    private static Object interceptGameLabSchedule(AugmentModule module, Chain chain)
            throws Throwable {
        Config config = config(module, chain.getThisObject());
        if (!config.enabled) return chain.proceed();

        Object toy = chain.getThisObject();
        Object handlerValue = readField(toy, "mHandler");
        Object runnableValue = readField(toy, "mDetectRunnable");
        if (!(handlerValue instanceof Handler) || !(runnableValue instanceof Runnable)) {
            traceStage("GAMELAB_SCAN_SCHEDULE_SKIPPED owner=" + toy.getClass().getName()
                    + " handler=" + (handlerValue == null ? "null"
                    : handlerValue.getClass().getName())
                    + " runnable=" + (runnableValue == null ? "null"
                    : runnableValue.getClass().getName()));
            return chain.proceed();
        }

        Handler handler = (Handler) handlerValue;
        Runnable runnable = (Runnable) runnableValue;
        long original = intField(toy, "MSG_DELAY_TIME", 2000);
        long target = AiTriggerTimingPolicy.scanDelay(
                original, config.templateScanMs, MIN_TEMPLATE_SCAN_MS);
        handler.removeCallbacks(runnable);
        traceStage("GAMELAB_SCAN_SCHEDULE owner=" + toy.getClass().getName()
                + " originalDelay=" + original + " scheduledDelay=" + target);
        hit(module, GAME_LAB_PACKAGE + "|scan_schedule|2000->" + target);
        handler.postDelayed(runnable, target);
        return null;
    }

    private static Object interceptGameLabStartDetect(AugmentModule module, Chain chain)
            throws Throwable {
        Config config = config(module, chain.getThisObject());
        if (!config.enabled || !isGameLabBusy(chain.getThisObject())) {
            return chain.proceed();
        }
        hit(module, GAME_LAB_PACKAGE + "|scan_skip_busy");
        // CommonToy$2 always schedules its next pass after this method returns.
        // Skipping only the capture/submission prevents an executor backlog
        // without disturbing the vendor's working-state transitions.
        return null;
    }

    private static Object interceptGameLabAddMsg(AugmentModule module, Chain chain)
            throws Throwable {
        Object result = chain.proceed();
        Config config = config(module, chain.getThisObject());
        if (!config.enabled) return result;

        Object value = chain.getArg(0);
        if (!(value instanceof Bundle)) return result;
        Bundle message = (Bundle) value;
        if (!message.containsKey("policy_id")) return result;

        int policyId = message.getInt("policy_id", -1);
        flushGameLabEventConsumer(module, chain.getThisObject(), policyId);
        return result;
    }

    /**
     * The template recognizer receives BaseToy$1, whose accept() implementation
     * appends directly to BaseToy.mMsgList instead of calling BaseToy.addMsg().
     * Resolve the anonymous consumer's synthetic outer reference and flush the
     * policy event immediately so it does not wait for DetectBitmapTask.run().
     */
    private static void flushGameLabEventConsumer(AugmentModule module,
            Object consumerOrToy, int policyId) {
        Object toy = consumerOrToy;
        if (toy != null && toy.getClass().getName().contains("BaseToy$1")) {
            Object outer = readField(toy, "this$0");
            if (outer != null) toy = outer;
        }
        Method flush = findMethod(toy == null ? null : toy.getClass(),
                "sendEventToClient", void.class);
        if (flush == null) {
            traceStage("GAMELAB_EVENT_FLUSH_SKIPPED policy=" + policyId
                    + " owner=" + (toy == null ? "null" : toy.getClass().getName()));
            return;
        }
        flush.setAccessible(true);
        traceStage("GAMELAB_EVENT_FLUSH_BEGIN policy=" + policyId);
        try {
            flush.invoke(toy);
            traceStage("GAMELAB_EVENT_FLUSH_END policy=" + policyId);
        } catch (Throwable error) {
            traceStage("GAMELAB_EVENT_FLUSH_ERROR policy=" + policyId
                    + " error=" + error.getClass().getName()
                    + ":" + traceError(error));
        }
    }

    /**
     * Replaces only GameLab's hard-coded source-template threshold.  The
     * caller supplies the Mat pair, so the later same-frame validator can
     * still reject a page background or a stale queued event.
     */
    private static Object interceptGameLabMatchThreshold(AugmentModule module, Chain chain)
            throws Throwable {
        Config config = config(module, chain.getThisObject());
        Object value = chain.getArg(2);
        if (!config.enabled || !(value instanceof Number)) return chain.proceed();
        float original = ((Number) value).floatValue();
        if (!(original > GAME_LAB_SOURCE_MATCH_THRESHOLD)) return chain.proceed();
        hit(module, GAME_LAB_PACKAGE + "|match_threshold|"
                + Float.toString(original) + "->"
                + Float.toString(GAME_LAB_SOURCE_MATCH_THRESHOLD));
        return chain.proceed(new Object[]{chain.getArg(0), chain.getArg(1),
                Float.valueOf(GAME_LAB_SOURCE_MATCH_THRESHOLD)});
    }

    private static boolean isGameLabDetectRunnable(Object value) {
        if (value == null) return false;
        String name = value.getClass().getName();
        return (GAME_LAB_SGAME_TOY + "$1").equals(name)
                || (GAME_LAB_COMMON_TOY + "$2").equals(name);
    }

    private static boolean isGameLabBusy(Object toy) {
        try {
            Object value = readField(toy, "mExecutor");
            if (!(value instanceof ThreadPoolExecutor)) return false;
            ThreadPoolExecutor executor = (ThreadPoolExecutor) value;
            return executor.getActiveCount() > 0 || !executor.getQueue().isEmpty();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Long replacementFor(AugmentModule module, Object owner, int what,
            long delay, String packageName) {
        if (delay <= 0) return null;
        Config config = config(module, owner);
        if (!config.enabled) return null;
        String handler = handlerDescription(owner);
        long target = -1L;
        String reason = null;
        if (PLUGIN_PACKAGE.equals(packageName)) {
            if (TEMPLATE_HANDLER.equals(handler) && delay == 2000L) {
                target = AiTriggerTimingPolicy.scanDelay(
                        delay, config.templateScanMs, MIN_TEMPLATE_SCAN_MS);
                reason = "template_scan";
            } else if (CLICK_HANDLER.equals(handler)) {
                // TouchScreenPlugin's three delayed messages are one click
                // transaction, not the inter-click cooldown:
                //   102/down=50 ms, 103/up=450 ms, 104/disable=500 ms.
                // Reducing only the last message to 25 ms disables the
                // virtual touch before the down/up messages are delivered,
                // which produces the vendor "triggered" prompt but no input.
                // Keep the transaction ordered while shortening its internal
                // timings to the configured极速 click delay.
                if (what == 102 && delay == 50L) {
                    target = AiTriggerTimingPolicy.touchDelay(what, config.clickDelayMs);
                    reason = "touch_down";
                } else if (what == 103 && delay == 450L) {
                    target = AiTriggerTimingPolicy.touchDelay(what, config.clickDelayMs);
                    reason = "touch_up";
                } else if (what == 104 && delay == 500L) {
                    target = AiTriggerTimingPolicy.touchDelay(what, config.clickDelayMs);
                    reason = "touch_disable";
                }
            } else if (POLICY_INTERVAL_HANDLER.equals(handler)
                    && delay >= 2000L && delay <= 30000L) {
                // PolicyManager starts the next recognition pass with a
                // separate Handler.  Its legal-range helper is not enough:
                // triggerStart() then clamps the result back to the policy's
                // 2-second interval.
                target = config.cooldownMs;
                reason = "policy_interval";
            } else if ((isHandlerType(owner, ACTION_HANDLER)
                    || isHandlerType(owner, LEGACY_ACTION_HANDLER))
                    && what == AUTO_CLICK_COMPLETION_MESSAGE
                    && delay >= 2000L && delay <= 30000L) {
                // PluginsController has another independent 2-second
                // completion gate for autoClick.  Both gates must be
                // shortened for the configured极速 cadence to take effect.
                target = AiTriggerTimingPolicy.actionCooldown(delay, config.cooldownMs, config.clickDelayMs);
                reason = "action_cooldown";
            }
        } else if (GAME_ASSIST_PACKAGE.equals(packageName)
                && YOLO_HANDLER.equals(handler) && what == 2 && delay == 1500L) {
            target = AiTriggerTimingPolicy.scanDelay(delay, config.yoloScanMs, 150L);
            reason = "yolo_scan";
        }
        if (target < 0 || target >= delay) {
            if (PLUGIN_PACKAGE.equals(packageName) && delay >= 2000L && delay <= 30000L) {
                hit(module, packageName + "|long_unmatched|" + handler + "|what=" + what
                        + "|" + delay);
            }
            return null;
        }
        if ("policy_interval".equals(reason) || "action_cooldown".equals(reason)) {
            traceStage("PLUGIN_DELAY_REPLACED reason=" + reason
                    + " handler=" + handler + " what=" + what
                    + " originalDelay=" + delay + " scheduledDelay=" + target);
        }
        hit(module, packageName + "|" + reason + "|" + delay + "->" + target);
        return target;
    }

    private static Object interceptPolicy(AugmentModule module, Chain chain) throws Throwable {
        Config config = config(module, chain.getThisObject());
        if (!config.enabled) return chain.proceed();
        long min = longArg(chain.getArg(1));
        long max = longArg(chain.getArg(2));
        if (min != 2000L || max != 30000L) return chain.proceed();
        hit(module, "com.zte.game.plugintrigger|policy|" + min + ".." + max
                + "->" + config.cooldownMs);
        // The vendor method returns primitive long. Returning the int field
        // directly boxes it as Integer, which makes the hook bridge fail when
        // it casts the replacement result back to Long.
        return Long.valueOf(config.cooldownMs);
    }

    private static Object interceptPolicyInterval(AugmentModule module, Chain chain)
            throws Throwable {
        Config config = config(module, chain.getThisObject());
        long delay = longArg(chain.getArg(1));
        if (!config.enabled || delay < 2000L || delay > 30000L
                || config.cooldownMs >= delay) {
            return chain.proceed();
        }
        hit(module, "com.zte.game.plugintrigger|policy_interval|" + delay
                + "->" + config.cooldownMs);
        return chain.proceed(new Object[]{chain.getArg(0), Long.valueOf(config.cooldownMs)});
    }

    private static Object interceptTriggerStart(AugmentModule module, Chain chain)
            throws Throwable {
        Object manager = chain.getThisObject();
        List<Integer> started = policyIdsStartingNow(manager, chain.getArg(0));
        Object result = chain.proceed();
        if (!started.isEmpty()) {
            Config config = config(module, manager);
            if (config.enabled) {
                reschedulePolicyIntervals(module, manager, started, config.cooldownMs);
            }
        }
        return result;
    }

    /**
     * Records policies whose running flag was not set before triggerStart().
     * triggerStart() silently returns for a policy that is already running;
     * rescheduling those entries would keep moving the timeout and could
     * prevent the next recognition pass from ever becoming eligible.
     */
    private static List<Integer> policyIdsStartingNow(Object manager, Object value) {
        List<Integer> result = new ArrayList<>();
        if (!(value instanceof Iterable<?>)) return result;
        Object runningValue = readField(manager, "mIsPolicyRunning");
        Map<?, ?> running = runningValue instanceof Map ? (Map<?, ?>) runningValue : null;
        for (Object policy : (Iterable<?>) value) {
            int id = intField(policy, "policyId", Integer.MIN_VALUE);
            if (id == Integer.MIN_VALUE) continue;
            Object state = running == null ? null : running.get(Integer.valueOf(id));
            if (!(state instanceof Boolean) || !((Boolean) state)) {
                result.add(id);
            }
        }
        return result;
    }

    private static void reschedulePolicyIntervals(AugmentModule module, Object manager,
            List<Integer> policyIds, long delayMs) {
        try {
            Object value = readField(manager, "mIntervalHandler");
            if (!(value instanceof Handler) || delayMs <= 0L) return;
            Handler handler = (Handler) value;
            int count = 0;
            for (Integer id : policyIds) {
                if (id == null) continue;
                int what = id.intValue() + 1000;
                handler.removeMessages(what);
                Message message = handler.obtainMessage();
                message.what = what;
                message.arg1 = id.intValue();
                handler.sendMessageDelayed(message, delayMs);
                count++;
            }
            if (count > 0) {
                hit(module, PLUGIN_PACKAGE + "|policy_reschedule|" + count
                        + "->" + delayMs);
            }
        } catch (Throwable error) {
            error(module, "plugin", "policy_reschedule", error);
        }
    }

    private static Object interceptRegisterScenes(AugmentModule module, Chain chain)
            throws Throwable {
        Object result = chain.proceed();
        try {
            String packageName = String.valueOf(chain.getArg(0));
            Object idsValue = chain.getArg(1);
            if (idsValue instanceof int[]) {
                // The previous implementation sent an expanded TriggerInfo to
                // updateScene().  GameLab persists that object, so the runtime
                // crop silently changed the vendor database from 71x74 to
                // 167x234.  Re-register the source rectangle after the vendor
                // call; the actual runtime expansion now happens in GameLab's
                // crop hook and never reaches the database.
                restoreTemplateScenes(module, chain.getThisObject(), packageName,
                        (int[]) idsValue);
            }
        } catch (Throwable error) {
            error(module, "gamelab", "scene_restore", error);
        }
        return result;
    }

    /**
     * Restores the original policy rectangle through the vendor API.  This is
     * deliberately called even when the feature is disabled so an older build
     * cannot leave its expanded rectangle persisted in GameLab.
     */
    private static void restoreTemplateScenes(AugmentModule module, Object manager,
            String packageName, int[] policyIds) throws Throwable {
        if (manager == null || policyIds == null || policyIds.length == 0
                || packageName == null || packageName.isEmpty()) return;
        Object contextValue = readField(manager, "mContext");
        if (!(contextValue instanceof Context)) return;
        Context context = (Context) contextValue;
        ClassLoader loader = manager.getClass().getClassLoader();
        Class<?> policyManagerType = Class.forName(POLICY_MANAGER, false, loader);
        Class<?> policyInfoType = Class.forName(POLICY_INFO, false, loader);
        Class<?> triggerInfoType = Class.forName(TRIGGER_INFO, false, loader);
        Method getInstance = findMethod(policyManagerType, "getInstance",
                policyManagerType, Context.class);
        Method getPolicy = findMethod(policyManagerType, "getPolicyInfoById",
                policyInfoType, int.class);
        Method updateScene = findMethod(manager.getClass(), "updateScene", void.class,
                String.class, triggerInfoType);
        if (getInstance == null || getPolicy == null || updateScene == null) return;
        getInstance.setAccessible(true);
        getPolicy.setAccessible(true);
        updateScene.setAccessible(true);
        Object policyManager = getInstance.invoke(null, context);
        Object policyHandler = readField(policyManager, "mHandler");
        if (policyHandler == null) return;
        Method assemble = findMethod(policyHandler.getClass(), "assembleTriggerInfo",
                triggerInfoType, int.class, Bundle.class);
        if (assemble == null) return;
        assemble.setAccessible(true);

        for (int policyId : policyIds) {
            Object policy = getPolicy.invoke(policyManager, policyId);
            if (policy == null) continue;
            String sceneImage = stringField(policy, "sceneImageUri");
            String colorImage = stringField(policy, "colorImageUri");
            // Colour scenes use a different area-ratio algorithm; keep their
            // original rectangle and expand template scenes only.
            if (sceneImage.isEmpty() || !colorImage.isEmpty()) continue;
            int x = intField(policy, "image_x", -1);
            int y = intField(policy, "image_y", -1);
            int width = intField(policy, "image_width", -1);
            int height = intField(policy, "image_height", -1);
            if (x < 0 || y < 0 || width <= 0 || height <= 0) continue;

            Bundle data = new Bundle();
            data.putString("packageName", packageName);
            data.putInt("uid", context.getPackageManager().getPackageUid(packageName, 0));
            data.putInt("image_x", x);
            data.putInt("image_y", y);
            data.putInt("image_width", width);
            data.putInt("image_height", height);
            data.putParcelable("scene_image_uri", Uri.parse(sceneImage));
            data.putInt("accuracy", intField(policy, "accuracy", 80));
            data.putInt("colorTolerance", intField(policy, "colorTolerance", 0));
            Object trigger = assemble.invoke(policyHandler, policyId, data);
            if (trigger == null) continue;

            updateScene.invoke(manager, packageName, trigger);
            hit(module, PLUGIN_PACKAGE + "|scene_restore|" + policyId + "|"
                    + x + "," + y + "," + width + "x" + height);
        }
    }

    /**
     * Expands only the Mat crop used for this recognition call.  The scene
     * coordinates are restored before returning, so updateScene()/GameLab's
     * database never receives the expanded rectangle.
     */
    private static Object interceptGameLabCrop(AugmentModule module, Chain chain)
            throws Throwable {
        Config config = config(module, chain.getThisObject());
        Object scene = chain.getThisObject();
        if (!config.enabled || !isTemplateScene(scene)) return chain.proceed();

        Object screen = chain.getArg(0);
        int cols = matDimension(screen, "cols");
        int rows = matDimension(screen, "rows");
        int x = intField(scene, "mX", -1);
        int y = intField(scene, "mY", -1);
        int endX = intField(scene, "mEndX", -1);
        int endY = intField(scene, "mEndY", -1);
        if (cols <= 0 || rows <= 0 || x < 0 || y < 0 || endX <= x || endY <= y
                || endX > cols || endY > rows) {
            return chain.proceed();
        }

        int templateCols = matDimension(readField(scene, "mSceneTemplateSrc"), "cols");
        int templateRows = matDimension(readField(scene, "mSceneTemplateSrc"), "rows");
        int width = endX - x;
        int height = endY - y;
        int marginX = Math.max(TEMPLATE_SEARCH_MARGIN_X, Math.min(96, width / 2));
        int marginY = Math.max(TEMPLATE_SEARCH_MARGIN_Y, Math.min(128, height));
        int left = Math.max(0, x - marginX);
        int top = Math.max(0, y - marginY);
        int right = Math.min(cols, endX + marginX);
        int bottom = Math.min(rows, endY + marginY);
        if (templateCols > 0 && templateRows > 0
                && width > templateCols + marginX * 2
                && height > templateRows + marginY * 2) {
            // A stale scene from an older build is already expanded.  Do not
            // grow it again; the validator can still search the existing crop.
            left = x;
            top = y;
            right = endX;
            bottom = endY;
        }
        if (right <= left || bottom <= top) return chain.proceed();

        LAST_SCENE_FRAME.remove();
        boolean changedX = writeField(scene, "mX", left);
        boolean changedY = writeField(scene, "mY", top);
        boolean changedEndX = writeField(scene, "mEndX", right);
        boolean changedEndY = writeField(scene, "mEndY", bottom);
        try {
            Object result = chain.proceed();
            if (result != null) {
                LAST_SCENE_FRAME.set(new SceneFrame(scene, result,
                        Math.max(0, x - left), Math.max(0, y - top)));
            }
            hit(module, GAME_LAB_PACKAGE + "|runtime_crop|"
                    + x + "," + y + "," + width + "x" + height + "->"
                    + left + "," + top + "," + (right - left) + "x"
                    + (bottom - top));
            return result;
        } finally {
            if (changedX) writeField(scene, "mX", x);
            if (changedY) writeField(scene, "mY", y);
            if (changedEndX) writeField(scene, "mEndX", endX);
            if (changedEndY) writeField(scene, "mEndY", endY);
        }
    }

    @SuppressWarnings("unchecked")
    private static Object interceptGameLabTemplateRecognize(AugmentModule module, Chain chain)
            throws Throwable {
        Config config = config(module, chain.getThisObject());
        if (!config.enabled) return chain.proceed();

        Object scene = chain.getThisObject();
        Object template = readField(scene, "mSceneTemplateSrc");
        long frameDigest = frameDigest(chain.getArg(0));
        if (isRepeatedNonMatch(scene, template, frameDigest, config.templateScanMs)) {
            hit(module, GAME_LAB_PACKAGE + "|same_frame_skip");
            return Boolean.FALSE;
        }

        Object consumerValue = chain.getArg(2);
        if (!(consumerValue instanceof Consumer)) {
            hit(module, GAME_LAB_PACKAGE + "|reject_consumer");
            rememberFrame(scene, template, frameDigest, false);
            return Boolean.FALSE;
        }
        Consumer<Object> consumer = (Consumer<Object>) consumerValue;
        List<Object> pending = new ArrayList<>();
        Consumer<Object> buffer = pending::add;
        LAST_SCENE_FRAME.remove();
        try {
            Object result = chain.proceed(new Object[]{chain.getArg(0), chain.getArg(1), buffer});
            if (!(result instanceof Boolean) || !((Boolean) result)) {
                rememberFrame(scene, template, frameDigest, false);
                return result;
            }
            int policyId = intField(chain.getThisObject(), "mPolicyId", -1);
            traceStage("RECOGNITION_MATCH policy=" + policyId
                    + " pendingEvents=" + pending.size());
            SceneFrame frame = LAST_SCENE_FRAME.get();
            if (frame == null || frame.scene != chain.getThisObject()
                    || !hasMatchingForeground(frame, template)) {
                traceStage("RECOGNITION_REJECT_TEMPLATE policy=" + policyId);
                hit(module, GAME_LAB_PACKAGE + "|reject_template|"
                        + policyId);
                rememberFrame(scene, template, frameDigest, false);
                return Boolean.FALSE;
            }
            if (pending.isEmpty()) {
                traceStage("RECOGNITION_REJECT_EMPTY_EVENT policy=" + policyId);
                hit(module, GAME_LAB_PACKAGE + "|reject_empty_event|"
                        + policyId);
                rememberFrame(scene, template, frameDigest, false);
                return Boolean.FALSE;
            }
            traceStage("ACTION_EVENT_DELIVERY_BEGIN policy=" + policyId
                    + " count=" + pending.size());
            for (Object event : pending) consumer.accept(event);
            flushGameLabEventConsumer(module, consumer, policyId);
            traceStage("ACTION_EVENT_DELIVERY_END policy=" + policyId);
            hit(module, GAME_LAB_PACKAGE + "|verified|"
                    + policyId);
            traceStage("RECOGNITION_VERIFIED policy=" + policyId);
            rememberFrame(scene, template, frameDigest, true);
            return result;
        } finally {
            LAST_SCENE_FRAME.remove();
        }
    }

    /**
     * Color-region recognition uses the same BaseToy consumer as the template
     * path, but the vendor normally keeps the event in mMsgList until every
     * SGame scene recognizer has finished.  Buffer only this recognizer call,
     * deliver its confirmed policy event immediately, then flush the toy.
     */
    @SuppressWarnings("unchecked")
    private static Object interceptGameLabColorRecognize(AugmentModule module, Chain chain)
            throws Throwable {
        Config config = config(module, chain.getThisObject());
        if (!config.enabled) return chain.proceed();

        Object consumerValue = chain.getArg(2);
        if (!(consumerValue instanceof Consumer)) return chain.proceed();
        Consumer<Object> consumer = (Consumer<Object>) consumerValue;
        List<Object> pending = new ArrayList<>();
        Consumer<Object> buffer = pending::add;
        long started = SystemClock.uptimeMillis();
        Object result = chain.proceed(new Object[]{chain.getArg(0), chain.getArg(1), buffer});
        long recognitionMs = SystemClock.uptimeMillis() - started;
        if (!(result instanceof Boolean) || !((Boolean) result)) return result;

        int policyId = intField(chain.getThisObject(), "mPolicyId", -1);
        traceStage("COLOR_RECOGNITION_MATCH policy=" + policyId
                + " pendingEvents=" + pending.size()
                + " recognitionMs=" + recognitionMs);
        if (pending.isEmpty()) return result;

        traceStage("COLOR_ACTION_EVENT_DELIVERY_BEGIN policy=" + policyId
                + " count=" + pending.size());
        for (Object event : pending) consumer.accept(event);
        flushGameLabEventConsumer(module, consumer, policyId);
        traceStage("COLOR_ACTION_EVENT_DELIVERY_END policy=" + policyId);
        hit(module, GAME_LAB_PACKAGE + "|color_verified|" + policyId);
        return result;
    }

    private static boolean isTemplateScene(Object scene) {
        if (scene == null || !GAME_LAB_COMMON_SCENE.equals(scene.getClass().getName())) {
            return false;
        }
        return readField(scene, "mSceneTemplateSrc") != null
                && intField(scene, "mSceneType", -1) == 1;
    }

    private static boolean hasMatchingForeground(SceneFrame frame, Object template) {
        long started = SystemClock.uptimeMillis();
        try {
            if (frame == null || frame.crop == null || template == null) return false;
            int step = AiTemplatePixels.samplingStep(
                    matDimension(frame.crop, "rows"), matDimension(frame.crop, "cols"),
                    matDimension(template, "rows"), matDimension(template, "cols"));
            if (step <= 0) return false;
            AiTemplatePixels screen = AiTemplatePixels.read(frame.crop, step);
            TemplateSnapshot snapshot = templateSnapshot(template, step);
            AiTemplatePixels sample = snapshot == null ? null : snapshot.pixels;
            List<Integer> anchors = snapshot == null ? null : snapshot.anchors;
            int result = AiTemplateMatcher.match(screen, sample, anchors,
                    Math.round((float) frame.expectedLeft / step),
                    Math.round((float) frame.expectedTop / step));
            traceStage((result == AiTemplateMatcher.FAST ? "RECOGNITION_VALIDATE_FAST_PASS"
                    : "RECOGNITION_VALIDATE_FALLBACK result=" + (result != AiTemplateMatcher.NONE))
                    + " durationMs=" + (SystemClock.uptimeMillis() - started)
                    + " sampleStep=" + step);
            return result != AiTemplateMatcher.NONE;
        } catch (Throwable ignored) {
            // A validator failure must never turn into an unintended click.
            return false;
        }
    }

    private static TemplateSnapshot templateSnapshot(Object template, int step) throws Throwable {
        if (template == null) return null;
        synchronized (TEMPLATE_CACHE) {
            TemplateSnapshot cached = TEMPLATE_CACHE.get(template);
            if (cached != null && cached.sampleStep == step) return cached;
            AiTemplatePixels sample = AiTemplatePixels.read(template, step);
            if (sample == null) return null;
            TemplateSnapshot snapshot = new TemplateSnapshot(sample,
                    sample.foregroundAnchors(96), step);
            TEMPLATE_CACHE.put(template, snapshot);
            return snapshot;
        }
    }

    private static long frameDigest(Object frame) {
        if (frame == null) return Long.MIN_VALUE;
        try {
            AiTemplatePixels pixels = AiTemplatePixels.read(frame);
            if (pixels == null) return Long.MIN_VALUE;
            long value = 1469598103934665603L;
            value = (value ^ pixels.rows) * 1099511628211L;
            value = (value ^ pixels.cols) * 1099511628211L;
            value = (value ^ pixels.channels) * 1099511628211L;
            value = (value ^ Arrays.hashCode(pixels.values)) * 1099511628211L;
            return value;
        } catch (Throwable ignored) {
            return Long.MIN_VALUE;
        }
    }

    private static boolean isRepeatedNonMatch(Object owner, Object template,
            long digest, int scanMs) {
        if (owner == null || template == null || digest == Long.MIN_VALUE) return false;
        synchronized (FRAME_CACHE) {
            FrameRecognition previous = FRAME_CACHE.get(owner);
            return previous != null && previous.template == template
                    && previous.digest == digest && !previous.matched
                    && SystemClock.uptimeMillis() - previous.checkedAt
                    <= Math.max(500L, Math.min(5000L, scanMs * 4L));
        }
    }

    private static void rememberFrame(Object owner, Object template,
            long digest, boolean matched) {
        if (owner == null || template == null || digest == Long.MIN_VALUE) return;
        synchronized (FRAME_CACHE) {
            FRAME_CACHE.put(owner, new FrameRecognition(
                    template, digest, matched, SystemClock.uptimeMillis()));
        }
    }

    private static Config config(AugmentModule module, Object owner) {
        long now = System.currentTimeMillis();
        Config value = cachedConfig;
        if (value != null && now - lastConfigRead < 1000L) return value;
        synchronized (AiTriggerSpeedHook.class) {
            value = cachedConfig;
            if (value != null && now - lastConfigRead < 1000L) return value;
            try {
                Context context = FeatureSettings.from(owner);
                value = new Config(
                        FeatureSettings.enabled(context, GAME_MASTER, false)
                                && FeatureSettings.enabled(context, ENABLED, false),
                        FeatureSettings.enabled(context, DIAGNOSTICS, false),
                        FeatureSettings.integer(context, TEMPLATE_SCAN, 180, 80, 2000),
                        FeatureSettings.integer(context, CLICK_DELAY, 25, 10, 500),
                        FeatureSettings.integer(context, COOLDOWN, 180, 50, 30000),
                        FeatureSettings.integer(context, YOLO_SCAN, 400, 150, 1500));
            } catch (Throwable ignored) {
                value = Config.DISABLED;
            }
            cachedConfig = value;
            lastConfigRead = now;
            return value;
        }
    }

    /**
     * Per-transaction trace.  This intentionally uses a separate log tag and
     * does not write Settings.Global on the hot path, so timing is unaffected.
     */
    private static void traceStage(String value) {
        Config current = cachedConfig;
        if (current == null || !current.enabled || !current.diagnostics) return;
        try {
            HookTelemetry.detail("AI",value);
            long sequence = TRACE_SEQUENCE.incrementAndGet();
            Log.i(TRACE_TAG, "AI_STAGE seq=" + sequence
                    + " wall=" + System.currentTimeMillis()
                    + " uptime=" + SystemClock.uptimeMillis()
                    + " thread=" + Thread.currentThread().getName()
                    + " " + value);
        } catch (Throwable ignored) {
            // Diagnostic logging must never affect the vendor touch path.
        }
    }

    private static String traceError(Throwable error) {
        String message = error == null ? "" : error.getMessage();
        return message == null ? "" : message.replace('\n', ' ').replace('\r', ' ');
    }

    private static void hit(AugmentModule module, String value) {
        long now = System.currentTimeMillis();
        String scoped = value.startsWith(PLUGIN_PACKAGE) ? "plugin"
                : value.startsWith(GAME_LAB_PACKAGE) ? "gamelab"
                : value.startsWith(GAME_ASSIST_PACKAGE) ? "assist" : "other";
        synchronized (LAST_ENGINE_DIAGNOSTIC) {
            Long previous = LAST_ENGINE_DIAGNOSTIC.get(scoped);
            if (previous != null && now - previous < 5000L) return;
            LAST_ENGINE_DIAGNOSTIC.put(scoped, now);
        }
        writeDiagnostic(module, "last_hit", value + "|" + now);
        writeDiagnostic(module, "last_hit_" + scoped, value + "|" + now);
    }

    private static void error(AugmentModule module, String engine, String stage,
            Throwable error) {
        long now = System.currentTimeMillis();
        String scoped = "error:" + engine;
        synchronized (LAST_ENGINE_DIAGNOSTIC) {
            Long previous = LAST_ENGINE_DIAGNOSTIC.get(scoped);
            if (previous != null && now - previous < 5_000L) return;
            LAST_ENGINE_DIAGNOSTIC.put(scoped, now);
        }
        if (module != null) module.logFeatureError(
                "AI_" + stage.toUpperCase(Locale.ROOT), error);
        writeDiagnostic(module, "last_error", engine + '|' + stage + '|'
                + (error == null ? "unknown" : error.getClass().getSimpleName()) + '|' + now);
    }

    private static void writeDiagnostic(AugmentModule module, String suffix, String value) {
        try {
            Context context = FeatureSettings.from(null);
            FeatureSettings.diagnostic(context, "ls_augment_ai_trigger_" + suffix, value);
        } catch (Throwable error) {
            if (module != null) module.logFeatureError("AI_DIAGNOSTIC_FAILED", error);
        }
    }

    private static int intArg(Object value) {
        return value instanceof Number ? ((Number) value).intValue() : Integer.MIN_VALUE;
    }

    private static long longArg(Object value) {
        return value instanceof Number ? ((Number) value).longValue() : Long.MIN_VALUE;
    }

    private static boolean isHandlerType(Object owner, String expectedClassName) {
        if (owner == null || expectedClassName == null) return false;
        if (expectedClassName.equals(owner.getClass().getName())) return true;
        Object callback = readField(owner, "mCallback");
        return callback != null && expectedClassName.equals(callback.getClass().getName());
    }

    private static String handlerDescription(Object owner) {
        if (owner == null) return "";
        String ownerName = owner.getClass().getName();
        Object callback = readField(owner, "mCallback");
        return callback == null ? ownerName
                : ownerName + "|callback=" + callback.getClass().getName();
    }

    private static String safeId(String value) {
        return value == null ? "unknown" : value.replace('.', '_');
    }

    private static String safeText(String value) {
        if (value == null) return "unknown";
        String result = value.replace('|', '_').replace('\r', ' ').replace('\n', ' ');
        return result.length() > 80 ? result.substring(0, 80) : result;
    }

    private static int matDimension(Object mat, String methodName) {
        if (mat == null || methodName == null) return -1;
        try {
            Method method = mat.getClass().getMethod(methodName);
            return ((Number) method.invoke(mat)).intValue();
        } catch (Throwable ignored) {
            return -1;
        }
    }

    private static Object readField(Object owner, String name) {
        if (owner == null || name == null) return null;
        for (Class<?> current = owner.getClass(); current != null;
                current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (NoSuchFieldException ignored) {
                // Continue through the vendor's class hierarchy.
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static int intField(Object owner, String name, int fallback) {
        Object value = readField(owner, name);
        return value instanceof Number ? ((Number) value).intValue() : fallback;
    }

    private static String stringField(Object owner, String name) {
        Object value = readField(owner, name);
        return value == null ? "" : String.valueOf(value);
    }

    private static boolean writeField(Object owner, String name, Object value) {
        if (owner == null || name == null) return false;
        for (Class<?> current = owner.getClass(); current != null;
                current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                field.set(owner, value);
                return true;
            } catch (NoSuchFieldException ignored) {
                // Continue through the vendor's class hierarchy.
            } catch (Throwable ignored) {
                return false;
            }
        }
        return false;
    }

    /** Small reflection-only view of an OpenCV Mat; avoids linking OpenCV into the module. */
    private static Method findMethod(Class<?> type, String name, Class<?> returnType,
            Class<?>... parameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                for (Method method : current.getDeclaredMethods()) {
                    if (!name.equals(method.getName()) || method.getParameterTypes().length
                            != parameters.length || method.getReturnType() != returnType) continue;
                    Class<?>[] actual = method.getParameterTypes();
                    boolean match = true;
                    for (int i = 0; i < actual.length; i++) {
                        if (!actual[i].isAssignableFrom(parameters[i])
                                && !parameters[i].isAssignableFrom(actual[i])) {
                            match = false;
                            break;
                        }
                    }
                    if (match) return method;
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static Method findGameLabCropMethod(Class<?> type) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                for (Method method : current.getDeclaredMethods()) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if (!"cutSceneImgBlock".equals(method.getName())
                            || method.getReturnType() == null || parameters.length != 1) continue;
                    if ("org.opencv.core.Mat".equals(method.getReturnType().getName())
                            && "org.opencv.core.Mat".equals(parameters[0].getName())) {
                        return method;
                    }
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static Method findGameLabMatchThresholdMethod(Class<?> type) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                for (Method method : current.getDeclaredMethods()) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if (!"distinguishByMatchTemplate".equals(method.getName())
                            || method.getReturnType() != boolean.class || parameters.length != 3
                            || !"org.opencv.core.Mat".equals(parameters[0].getName())
                            || !"org.opencv.core.Mat".equals(parameters[1].getName())
                            || parameters[2] != float.class) continue;
                    return method;
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static Method findGameLabTemplateRecognizeMethod(Class<?> type) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                for (Method method : current.getDeclaredMethods()) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if (!"recognizeTemplateScene".equals(method.getName())
                            || method.getReturnType() != boolean.class || parameters.length != 3
                            || !"org.opencv.core.Mat".equals(parameters[0].getName())
                            || parameters[1] != long.class
                            || !Consumer.class.isAssignableFrom(parameters[2])) continue;
                    return method;
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static Method findGameLabColorRecognizeMethod(Class<?> type) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                for (Method method : current.getDeclaredMethods()) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if (!"recognizeColorScene".equals(method.getName())
                            || method.getReturnType() != boolean.class || parameters.length != 3
                            || !"org.opencv.core.Mat".equals(parameters[0].getName())
                            || parameters[1] != long.class
                            || !Consumer.class.isAssignableFrom(parameters[2])) continue;
                    return method;
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static Method findRegisterScenesMethod(Class<?> type) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                for (Method method : current.getDeclaredMethods()) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if (!"registerScenes".equals(method.getName())
                            || method.getReturnType() != void.class || parameters.length != 3
                            || parameters[0] != String.class || parameters[1] != int[].class) {
                        continue;
                    }
                    return method;
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static final class SceneFrame {
        final Object scene;
        final Object crop;
        final int expectedLeft;
        final int expectedTop;

        SceneFrame(Object scene, Object crop, int expectedLeft, int expectedTop) {
            this.scene = scene;
            this.crop = crop;
            this.expectedLeft = expectedLeft;
            this.expectedTop = expectedTop;
        }
    }

    private static final class TemplateSnapshot {
        final AiTemplatePixels pixels;
        final List<Integer> anchors;
        final int sampleStep;

        TemplateSnapshot(AiTemplatePixels pixels, List<Integer> anchors, int sampleStep) {
            this.pixels = pixels;
            this.anchors = anchors;
            this.sampleStep = sampleStep;
        }
    }

    private static final class FrameRecognition {
        final Object template;
        final long digest;
        final boolean matched;
        final long checkedAt;

        FrameRecognition(Object template, long digest, boolean matched, long checkedAt) {
            this.template = template;
            this.digest = digest;
            this.matched = matched;
            this.checkedAt = checkedAt;
        }
    }

    private static final class Config {
        static final Config DISABLED = new Config(false, false, 180, 25, 180, 400);
        final boolean enabled;
        final boolean diagnostics;
        final int templateScanMs;
        final int clickDelayMs;
        final int cooldownMs;
        final int yoloScanMs;

        Config(boolean enabled, boolean diagnostics, int templateScanMs, int clickDelayMs,
                int cooldownMs, int yoloScanMs) {
            this.enabled = enabled;
            this.diagnostics = diagnostics;
            this.templateScanMs = templateScanMs;
            this.clickDelayMs = clickDelayMs;
            this.cooldownMs = cooldownMs;
            this.yoloScanMs = yoloScanMs;
        }
    }
}
