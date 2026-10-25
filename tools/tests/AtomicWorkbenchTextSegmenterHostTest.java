package ls.augment.com;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class AtomicWorkbenchTextSegmenterHostTest {
    private static int checks, cases;
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static synchronized void check(boolean value, String code) {
        checks++; if (!value) throw new AssertionError(code);
    }
    private interface Start { void run(AtomicWorkbenchTextSegmenter.Callback done); }
    private static AtomicWorkbenchTextSegmenter.Result await(Start start) throws Exception {
        CountDownLatch ready = new CountDownLatch(1);
        AtomicReference<AtomicWorkbenchTextSegmenter.Result> result = new AtomicReference<>();
        start.run(value -> { check(Thread.currentThread().getName().equals("HostMain"), "CALLBACK_MAIN_DISPATCH"); result.set(value); ready.countDown(); });
        check(ready.await(40, TimeUnit.SECONDS), "BOUNDED_CALLBACK_WAIT"); return result.get();
    }
    private static void exact(AtomicWorkbenchTextSegmenter.Result result, String text) {
        check(result.success && result.state == AtomicWorkbenchTextSegmenter.State.READY
                && result.failureCode == AtomicWorkbenchTextSegmenter.Failure.NONE, "TRUE_READY_RESULT");
        check(result.text.equals(text) && !result.preload, "IMMUTABLE_ORIGINAL_SOURCE_BINDING");
        StringBuilder rebuilt = new StringBuilder(); int cursor = 0;
        for (AtomicWorkbenchTextSegmenter.Token token : result.tokens) {
            check(token.startUtf16 == cursor && token.endUtf16 > cursor, "CONTIGUOUS_UTF16_TOKEN");
            check(token.text.equals(text.substring(token.startUtf16, token.endUtf16)), "ORIGINAL_SUBSTRING_TOKEN");
            check(token.startUtf16 == 0 || !Character.isLowSurrogate(text.charAt(token.startUtf16)), "NO_SURROGATE_START_SPLIT");
            check(token.endUtf16 == text.length() || !Character.isLowSurrogate(text.charAt(token.endUtf16)), "NO_SURROGATE_END_SPLIT");
            rebuilt.append(token.text); cursor = token.endUtf16;
        }
        check(cursor == text.length() && rebuilt.toString().equals(text), "LOSSLESS_ORIGINAL_COVERAGE");
    }
    private static void invalidOffsets(String text, int[] spans) throws Exception {
        boolean rejected = false;
        try { AtomicWorkbenchTextSegmenter.tokens(text, spans); } catch (Exception invalid) { rejected = true; }
        check(rejected, "INVALID_NATIVE_OFFSET_REJECTED"); cases++;
    }
    public static void main(String[] arguments) throws Exception {
        Context context = new Context(new File(arguments[0]), new File(arguments[1], "词库-🙂"));
        check(context.getNoBackupFilesDir().isDirectory(), "HOST_PRIVATE_ROOT_CREATED");
        context.getAssets().corrupt = true;
        AtomicWorkbenchTextSegmenter.Result first = await(done -> AtomicWorkbenchTextSegmenter.preload(context, done));
        check(!first.success && first.state == AtomicWorkbenchTextSegmenter.State.FAILED
                && first.failureCode == AtomicWorkbenchTextSegmenter.Failure.ASSET_ERROR && first.tokens.isEmpty(), "CORRUPT_ASSET_FAILS_BEFORE_NATIVE"); cases++;
        context.getAssets().corrupt = false;
        AtomicWorkbenchTextSegmenter.Result noRetry = await(done -> AtomicWorkbenchTextSegmenter.segment(context, "own input", done));
        check(noRetry.failureCode == AtomicWorkbenchTextSegmenter.Failure.ASSET_ERROR && noRetry.tokens.isEmpty(), "NO_BACKGROUND_RETRY_OR_FAKE_TOKENS"); cases++;
        AtomicWorkbenchTextSegmenter.Result retry = await(done -> AtomicWorkbenchTextSegmenter.retryPreload(context, done));
        check(retry.success && retry.preload && retry.tokens.isEmpty(), "EXPLICIT_RETRY_REPAIRS_AND_LOADS_REAL_JNI_" + retry.state + "_" + retry.failureCode); cases++;
        for (String text : new String[]{"南京市长江大桥", "我爱北京天安门", "云计算区块链", "", " \t\r\n\n", "abc123, 42.5!",
                "你好，世界！\n\n🙂𠀀𠀁", "e\u0301👨‍👩‍👧‍👦", "A\u0000B"}) {
            AtomicWorkbenchTextSegmenter.Result result = await(done -> AtomicWorkbenchTextSegmenter.segment(context, text, done));
            exact(result, text); cases++;
            if (text.equals("南京市长江大桥")) check(result.tokens.size() == 2 && result.tokens.get(0).text.equals("南京市")
                    && result.tokens.get(1).text.equals("长江大桥"), "REAL_JNI_DICTIONARY_NOT_IDENTITY_FALLBACK");
        }
        AtomicWorkbenchTextSegmenter.Result immutable = await(done -> AtomicWorkbenchTextSegmenter.segment(context, "中文🙂", done));
        boolean frozen = false;
        try { immutable.tokens.clear(); } catch (UnsupportedOperationException expected) { frozen = true; }
        check(frozen, "IMMUTABLE_TOKEN_LIST");
        int[] copy = immutable.utf16Spans(); copy[0] = 999;
        check(immutable.tokens.get(0).startUtf16 == 0, "DEFENSIVE_SPAN_ARRAY"); cases++;
        for (String invalid : new String[]{"\ud800", "\udc00", "x\ud800z"}) {
            AtomicWorkbenchTextSegmenter.Result rejected = await(done -> AtomicWorkbenchTextSegmenter.segment(context, invalid, done));
            check(!rejected.success && rejected.failureCode == AtomicWorkbenchTextSegmenter.Failure.INVALID_UTF16
                    && rejected.tokens.isEmpty(), "INVALID_UTF16_FIXED_FAILURE"); cases++;
        }
        String maximum = "x".repeat(32768);
        exact(await(done -> AtomicWorkbenchTextSegmenter.segment(context, maximum, done)), maximum); cases++;
        AtomicWorkbenchTextSegmenter.Result tooLong = await(done -> AtomicWorkbenchTextSegmenter.segment(context, maximum + "x", done));
        check(!tooLong.success && tooLong.failureCode == AtomicWorkbenchTextSegmenter.Failure.INPUT_TOO_LONG, "UTF16_LIMIT"); cases++;
        check(Arrays.equals(AtomicWorkbenchTextSegmenter.utf8("🙂\u0000"), new byte[]{(byte)0xf0,(byte)0x9f,(byte)0x99,(byte)0x82,0}), "STANDARD_UTF8_NOT_MODIFIED"); cases++;
        invalidOffsets("🙂", new int[]{0, 1, 1, 4});
        invalidOffsets("中", new int[]{0, 2, 2, 3});
        invalidOffsets("abc", new int[]{1, 3});
        invalidOffsets("abc", new int[]{0, 1, 0, 3});
        invalidOffsets("abc", new int[]{0, 2});
        invalidOffsets("abc", new int[]{0, 4});
        invalidOffsets("abc", new int[]{0});
        invalidOffsets("abc", null);
        invalidOffsets("", new int[]{0, 0});
        // Exercise the actual independent JNI constructor failure and loss of native READY.
        File[] dictionaries = AtomicWorkbenchTextSegmenter.installAssets(context);
        File damaged = new File(context.getNoBackupFilesDir(), "owned-empty-hmm");
        try (FileOutputStream output = new FileOutputStream(damaged)) { output.getFD().sync(); }
        Method initialize = AtomicWorkbenchTextSegmenter.class.getDeclaredMethod("nativeInitialize", byte[].class, byte[].class, byte[].class);
        initialize.setAccessible(true); boolean nativeFailure = false;
        try { initialize.invoke(null, AtomicWorkbenchTextSegmenter.utf8(dictionaries[0].getAbsolutePath()),
                AtomicWorkbenchTextSegmenter.utf8(damaged.getAbsolutePath()), AtomicWorkbenchTextSegmenter.utf8(dictionaries[2].getAbsolutePath())); }
        catch (InvocationTargetException expected) {
            nativeFailure = expected.getCause() instanceof IllegalStateException
                    && "TEXT_NATIVE_INITIALIZATION_FAILED".equals(expected.getCause().getMessage());
        }
        Method ready = AtomicWorkbenchTextSegmenter.class.getDeclaredMethod("nativeReady"); ready.setAccessible(true);
        check(nativeFailure && !(Boolean) ready.invoke(null), "ACTUAL_NATIVE_FAILED_INIT_NO_PARTIAL_READY_NO_ABORT"); cases++;
        AtomicWorkbenchTextSegmenter.Result lost = await(done -> AtomicWorkbenchTextSegmenter.segment(context, "own input", done));
        check(!lost.success && lost.failureCode == AtomicWorkbenchTextSegmenter.Failure.NATIVE_ERROR && lost.tokens.isEmpty(), "LOST_READY_NO_FAKE_FALLBACK"); cases++;
        check(await(done -> AtomicWorkbenchTextSegmenter.retryPreload(context, done)).success, "ACTUAL_NATIVE_EXPLICIT_RETRY"); cases++;
        exact(await(done -> AtomicWorkbenchTextSegmenter.segment(context, "重新分词🙂", done)), "重新分词🙂"); cases++;
        // Private cache tampering must be repaired only from the hashed packaged asset.
        try (FileOutputStream output = new FileOutputStream(dictionaries[2])) { output.write(1); }
        File[] repaired = AtomicWorkbenchTextSegmenter.installAssets(context);
        check(repaired[2].length() == 39, "REAL_PRIVATE_ASSET_HASH_REPAIR"); cases++;
        queueAndCancellation(context);
        System.out.println("PASS actual_host_jni_java cases=" + cases + " checks=" + checks);
    }
    private static void queueAndCancellation(Context context) throws Exception {
        CountDownLatch entered = new CountDownLatch(1), release = new CountDownLatch(1), last = new CountDownLatch(1);
        AtomicInteger loads = new AtomicInteger(), cancelledCallbacks = new AtomicInteger();
        AtomicWorkbenchTextSegmenter.NativeApi controlled = new AtomicWorkbenchTextSegmenter.NativeApi() {
            volatile boolean loaded;
            @Override public void initialize(File[] files) throws Exception {
                loads.incrementAndGet(); entered.countDown(); check(release.await(5, TimeUnit.SECONDS), "CONTROLLED_LOAD_BOUND"); loaded = true;
            }
            @Override public boolean ready() { return loaded; }
            @Override public int[] cut(byte[] bytes) { return bytes.length == 0 ? new int[0] : new int[]{0, bytes.length}; }
        };
        AtomicWorkbenchTextSegmenter.Service service = new AtomicWorkbenchTextSegmenter.Service(controlled, main::post, ignored -> new File[0]);
        AtomicWorkbenchTextSegmenter.Request first = service.submit(context, "A", true, ignored -> cancelledCallbacks.incrementAndGet());
        check(entered.await(5, TimeUnit.SECONDS), "LOAD_STARTED");
        AtomicWorkbenchTextSegmenter.Request second = service.submit(context, "B", false, ignored -> cancelledCallbacks.incrementAndGet());
        service.submit(context, "C", false, value -> { check(value.success, "QUEUED_REQUEST_COMPLETES"); last.countDown(); });
        AtomicWorkbenchTextSegmenter.Result busy = await(done -> service.submit(context, "D", false, done));
        check(!busy.success && busy.failureCode == AtomicWorkbenchTextSegmenter.Failure.BUSY && busy.tokens.isEmpty(), "BOUNDED_QUEUE_REJECTION");
        first.cancel(); second.cancel(); release.countDown();
        check(last.await(5, TimeUnit.SECONDS), "UNCANCELLED_REQUEST_COMPLETES");
        CountDownLatch flushed = new CountDownLatch(1); main.post(flushed::countDown);
        check(flushed.await(5, TimeUnit.SECONDS) && cancelledCallbacks.get() == 0 && loads.get() == 1
                && service.state == AtomicWorkbenchTextSegmenter.State.READY, "CANCEL_ONLY_CALLBACK_SHARED_LOAD_CONTINUES"); cases += 2;
    }
}
