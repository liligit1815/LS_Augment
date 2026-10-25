package ls.augment.com;

import android.app.ActivityManager;
import android.app.Instrumentation;
import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Developer APK only: own corpus and private generated files; no clipboard, Root or UI input. */
final class AtomicWorkbenchTextSegmenterDeviceCases {
    private interface Start { void run(AtomicWorkbenchTextSegmenter.Callback callback); }
    static JSONObject run(Instrumentation test, Bundle arguments) throws Exception {
        Context target = test.getTargetContext();
        JSONArray cases = new JSONArray();
        JSONObject report = new JSONObject().put("scope", "PHONE_REAL_CPPJIEBA_JNI_OWN_CORPUS_PRIVATE_ASSETS")
                .put("clipboardTouched", false).put("systemSettingsChanged", false).put("cases", cases);
        AtomicWorkbenchTextSegmenter.Result ready = await(callback -> AtomicWorkbenchTextSegmenter.preload(target, callback));
        require(ready.success && ready.preload, "REAL_NATIVE_PRELOAD_REQUIRED");
        for (String text : new String[]{"南京市长江大桥", "我爱北京天安门", "云计算区块链", "", " \t\r\n\n",
                "abc123, 42.5!", "你好，世界！\n\n🙂𠀀𠀁", "e\u0301👨‍👩‍👧‍👦", "A\u0000B"}) {
            AtomicWorkbenchTextSegmenter.Result result = await(callback -> AtomicWorkbenchTextSegmenter.segment(target, text, callback));
            require(result.success && result.text.equals(text) && result.failureCode == AtomicWorkbenchTextSegmenter.Failure.NONE,
                    "REAL_NATIVE_RESULT_REQUIRED");
            StringBuilder rebuilt = new StringBuilder(); int cursor = 0;
            for (AtomicWorkbenchTextSegmenter.Token token : result.tokens) {
                require(token.startUtf16 == cursor && token.endUtf16 > cursor
                        && token.text.equals(text.substring(token.startUtf16, token.endUtf16)), "ORIGINAL_SUBSTRING_CONTIGUOUS_SPANS_REQUIRED");
                require(token.startUtf16 == 0 || !Character.isLowSurrogate(text.charAt(token.startUtf16)), "SURROGATE_START_SPLIT");
                require(token.endUtf16 == text.length() || !Character.isLowSurrogate(text.charAt(token.endUtf16)), "SURROGATE_END_SPLIT");
                rebuilt.append(token.text); cursor = token.endUtf16;
            }
            require(cursor == text.length() && text.contentEquals(rebuilt), "SOURCE_LOSS_OR_CHANGED_WHITESPACE");
            if (text.equals("南京市长江大桥")) require(result.tokens.size() == 2
                    && result.tokens.get(0).text.equals("南京市") && result.tokens.get(1).text.equals("长江大桥"), "REAL_WORD_SEGMENTATION_REQUIRED");
            cases.put(new JSONObject().put("name", "own_corpus_" + cases.length()).put("status", "passed")
                    .put("utf16Length", text.length()).put("tokenCount", result.tokens.size()).put("requestId", result.requestId));
        }
        for (String invalid : new String[]{"\ud800", "\udc00", "x".repeat(32769)}) {
            AtomicWorkbenchTextSegmenter.Result result = await(callback -> AtomicWorkbenchTextSegmenter.segment(target, invalid, callback));
            require(!result.success && result.tokens.isEmpty(), "INVALID_INPUT_MUST_NOT_RETURN_FAKE_TOKENS");
            cases.put(new JSONObject().put("name", "invalid_input_" + cases.length()).put("status", "passed")
                    .put("failureCode", result.failureCode.name()));
        }
        if (arguments != null && "true".equals(arguments.getString("probeInitializationFailure", "false"))) {
            ActivityManager manager = target.getSystemService(ActivityManager.class);
            require(manager != null && !AtomicWorkbenchCleanup.pending(), "CLOSE_WORKBENCH_BEFORE_NATIVE_FAILURE_PROBE");
            for (ActivityManager.AppTask task : manager.getAppTasks()) {
                ActivityManager.RecentTaskInfo info = task.getTaskInfo();
                require((info.topActivity == null || !AtomicWorkbenchActivity.class.getName().equals(info.topActivity.getClassName()))
                        && (info.baseActivity == null || !AtomicWorkbenchActivity.class.getName().equals(info.baseActivity.getClassName())),
                        "ACTIVE_WORKBENCH_PROHIBITS_NATIVE_FAILURE_PROBE");
            }
            File empty = new File(target.getCacheDir(), "owned-text-hmm-negative-" + UUID.randomUUID());
            try {
                try (FileOutputStream output = new FileOutputStream(empty)) { output.getFD().sync(); }
                File[] files = AtomicWorkbenchTextSegmenter.installAssets(target);
                Method initialize = AtomicWorkbenchTextSegmenter.class.getDeclaredMethod("nativeInitialize", byte[].class, byte[].class, byte[].class);
                initialize.setAccessible(true); boolean failed = false;
                try { initialize.invoke(null, AtomicWorkbenchTextSegmenter.utf8(files[0].getAbsolutePath()),
                        AtomicWorkbenchTextSegmenter.utf8(empty.getAbsolutePath()), AtomicWorkbenchTextSegmenter.utf8(files[2].getAbsolutePath())); }
                catch (InvocationTargetException expected) {
                    failed = expected.getCause() instanceof IllegalStateException
                            && "TEXT_NATIVE_INITIALIZATION_FAILED".equals(expected.getCause().getMessage());
                }
                Method nativeReady = AtomicWorkbenchTextSegmenter.class.getDeclaredMethod("nativeReady"); nativeReady.setAccessible(true);
                require(failed && !(Boolean) nativeReady.invoke(null), "FAILED_INIT_MUST_REMOVE_PARTIAL_NATIVE_READY");
                AtomicWorkbenchTextSegmenter.Result loss = await(callback -> AtomicWorkbenchTextSegmenter.segment(target, "own input", callback));
                require(!loss.success && loss.tokens.isEmpty(), "FAILED_NATIVE_MUST_NOT_FAKE_SEGMENTATION");
                require(await(callback -> AtomicWorkbenchTextSegmenter.retryPreload(target, callback)).success, "EXPLICIT_NATIVE_RETRY_MUST_RELOAD");
                cases.put(new JSONObject().put("name", "real_native_failed_init_and_explicit_retry").put("status", "passed"));
            } finally {
                AtomicWorkbenchTextSegmenter.Result restored = await(callback -> AtomicWorkbenchTextSegmenter.segment(target, "", callback));
                if (!restored.success) restored = await(callback -> AtomicWorkbenchTextSegmenter.retryPreload(target, callback));
                require(restored.success, "RESTORE_NATIVE_ENGINE_AFTER_NEGATIVE_PROBE");
                require(!empty.exists() || empty.delete(), "OWN_NEGATIVE_FILE_NOT_REMOVED");
            }
        } else report.put("initializationFailureProbe", "NOT_REQUESTED");
        return report.put("nativeState", AtomicWorkbenchTextSegmenter.state().name()).put("success", true);
    }
    private static AtomicWorkbenchTextSegmenter.Result await(Start start) throws Exception {
        CountDownLatch latch = new CountDownLatch(1);
        AtomicReference<AtomicWorkbenchTextSegmenter.Result> result = new AtomicReference<>();
        AtomicReference<Boolean> main = new AtomicReference<>(false);
        start.run(value -> { main.set(Looper.myLooper() == Looper.getMainLooper()); result.set(value); latch.countDown(); });
        require(latch.await(35, TimeUnit.SECONDS) && result.get() != null && main.get(), "BOUNDED_MAIN_THREAD_CALLBACK_REQUIRED");
        return result.get();
    }
    private static void require(boolean value, String code) { if (!value) throw new AssertionError(code); }
}
