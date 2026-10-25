package ls.augment.com;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/** Phone-only real cppjieba engine. No text, paths or dictionary data are logged. */
final class AtomicWorkbenchTextSegmenter {
    static final int MAX_UTF16_LENGTH = 32768;
    enum State { NOT_LOADED, LOADING, READY, FAILED }
    enum Failure { NONE, INVALID_UTF16, INPUT_TOO_LONG, BUSY, ASSET_ERROR, NATIVE_UNAVAILABLE, NATIVE_ERROR, OFFSET_ERROR }
    enum Kind { WORD, WHITESPACE, PUNCTUATION }
    interface Callback { void complete(Result result); }

    static final class Token {
        final int startUtf16, endUtf16;
        final String text;
        final Kind kind;
        Token(String source, int start, int end) {
            startUtf16 = start; endUtf16 = end; text = source.substring(start, end);
            boolean whitespace = true, punctuation = true;
            for (int index = 0; index < text.length();) {
                int point = text.codePointAt(index); index += Character.charCount(point);
                whitespace &= Character.isWhitespace(point) || Character.isSpaceChar(point);
                int type = Character.getType(point);
                punctuation &= !(Character.isLetterOrDigit(point) || type == Character.NON_SPACING_MARK
                        || type == Character.COMBINING_SPACING_MARK || type == Character.ENCLOSING_MARK);
            }
            kind = whitespace ? Kind.WHITESPACE : punctuation ? Kind.PUNCTUATION : Kind.WORD;
        }
    }
    static final class Result {
        final long requestId;
        final String text;
        final boolean preload, success;
        final State state;
        final Failure failureCode;
        final List<Token> tokens;
        Result(long id, String text, boolean preload, State state, Failure failure, List<Token> tokens) {
            requestId = id; this.text = text; this.preload = preload; this.state = state; failureCode = failure;
            success = state == State.READY && failure == Failure.NONE;
            this.tokens = Collections.unmodifiableList(new ArrayList<>(tokens));
        }
        int[] utf16Spans() {
            int[] spans = new int[tokens.size() * 2];
            for (int index = 0; index < tokens.size(); index++) {
                spans[index * 2] = tokens.get(index).startUtf16; spans[index * 2 + 1] = tokens.get(index).endUtf16;
            }
            return spans;
        }
    }
    static final class Request {
        final long id;
        private final AtomicBoolean cancelled = new AtomicBoolean();
        Request(long id) { this.id = id; }
        void cancel() { cancelled.set(true); }
        boolean cancelled() { return cancelled.get(); }
    }

    // The small internal interfaces make scheduling/offset contracts independently executable
    // on the host. Production always uses the real JNI backend and private asset installer.
    interface NativeApi {
        void initialize(File[] dictionaries) throws Exception;
        boolean ready();
        int[] cut(byte[] standardUtf8) throws Exception;
    }
    interface Dispatcher { void post(Runnable completion); }
    interface Installer { File[] install(Context context) throws Exception; }

    private static final class RealNative implements NativeApi {
        @Override public void initialize(File[] files) throws Exception {
            System.loadLibrary("lsaugment_text");
            if (!nativeInitialize(utf8(files[0].getAbsolutePath()), utf8(files[1].getAbsolutePath()), utf8(files[2].getAbsolutePath())))
                throw new IllegalStateException("TEXT_NATIVE_INITIALIZATION_FAILED");
        }
        @Override public boolean ready() { return nativeReady(); }
        @Override public int[] cut(byte[] bytes) { return nativeCut(bytes); }
    }
    private static final Service SHARED = new Service(new RealNative(),
            completion -> new Handler(Looper.getMainLooper()).post(completion), AtomicWorkbenchTextSegmenter::installAssets);

    static State state() { return SHARED.state; }
    static Request preload(Context context, Callback callback) { return SHARED.submit(context, "", true, callback); }
    static Request retryPreload(Context context, Callback callback) { return SHARED.submit(context, "", true, true, callback); }
    static Request segment(Context context, String text, Callback callback) { return SHARED.submit(context, text, false, callback); }

    static final class Service {
        private final NativeApi nativeApi;
        private final Dispatcher dispatcher;
        private final Installer installer;
        private final AtomicLong nextId = new AtomicLong();
        private final ThreadPoolExecutor worker = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS,
                new ArrayBlockingQueue<>(2), task -> { Thread thread = new Thread(task, "DuoTextSegmenter"); thread.setDaemon(true); return thread; },
                new ThreadPoolExecutor.AbortPolicy());
        volatile State state = State.NOT_LOADED;
        private volatile Failure permanentFailure = Failure.NONE;
        Service(NativeApi nativeApi, Dispatcher dispatcher, Installer installer) {
            this.nativeApi = nativeApi; this.dispatcher = dispatcher; this.installer = installer;
        }
        Request submit(Context context, String text, boolean preload, Callback callback) {
            return submit(context, text, preload, false, callback);
        }
        Request submit(Context context, String text, boolean preload, boolean explicitRetry, Callback callback) {
            if (callback == null) throw new IllegalArgumentException("Callback required");
            Request request = new Request(nextId.incrementAndGet());
            String source = text == null ? "" : text;
            Failure invalid = text == null ? Failure.INVALID_UTF16 : source.length() > MAX_UTF16_LENGTH
                    ? Failure.INPUT_TOO_LONG : validUtf16(source) ? Failure.NONE : Failure.INVALID_UTF16;
            if (invalid != Failure.NONE) {
                finish(request, callback, new Result(request.id, source, preload, state, invalid, Collections.emptyList()));
                return request;
            }
            Context app = context == null ? null : context.getApplicationContext();
            if (app == null) app = context;
            Context application = app;
            try {
                worker.execute(() -> {
                    // Cancellation only hides this callback. It never interrupts a shared load.
                    try {
                        if (explicitRetry && state == State.FAILED) {
                            permanentFailure = Failure.NONE; state = State.NOT_LOADED;
                        }
                        ensureReady(application);
                        List<Token> tokens = preload ? Collections.emptyList() : tokens(source, nativeApi.cut(utf8(source)));
                        if (!nativeApi.ready()) throw new IllegalStateException("TEXT_NATIVE_READINESS_LOST");
                        finish(request, callback, new Result(request.id, source, preload, state, Failure.NONE, tokens));
                    } catch (OffsetFailure invalidOffsets) {
                        fail(Failure.OFFSET_ERROR);
                        finishFailure(request, callback, source, preload);
                    } catch (AssetFailure unavailable) {
                        fail(Failure.ASSET_ERROR);
                        finishFailure(request, callback, source, preload);
                    } catch (LinkageError unavailable) {
                        fail(Failure.NATIVE_UNAVAILABLE);
                        finishFailure(request, callback, source, preload);
                    } catch (Exception unavailable) {
                        if (state != State.FAILED) fail(Failure.NATIVE_ERROR);
                        finishFailure(request, callback, source, preload);
                    }
                });
            } catch (RejectedExecutionException full) {
                finish(request, callback, new Result(request.id, source, preload, state, Failure.BUSY, Collections.emptyList()));
            }
            return request;
        }
        private void ensureReady(Context context) throws Exception {
            if (state == State.FAILED) throw new IllegalStateException("TEXT_ENGINE_FAILED");
            if (state == State.READY) {
                if (!nativeApi.ready()) throw new IllegalStateException("TEXT_NATIVE_READINESS_LOST");
                return;
            }
            state = State.LOADING;
            File[] dictionaries;
            try { dictionaries = installer.install(context); }
            catch (Exception problem) { throw new AssetFailure(); }
            nativeApi.initialize(dictionaries);
            if (!nativeApi.ready()) throw new IllegalStateException("TEXT_NATIVE_NOT_READY");
            state = State.READY;
        }
        private void fail(Failure failure) { permanentFailure = failure; state = State.FAILED; }
        private void finishFailure(Request request, Callback callback, String text, boolean preload) {
            finish(request, callback, new Result(request.id, text, preload, state, permanentFailure, Collections.emptyList()));
        }
        private void finish(Request request, Callback callback, Result result) {
            dispatcher.post(() -> { if (!request.cancelled()) callback.complete(result); });
        }
    }

    static boolean validUtf16(String value) {
        for (int index = 0; index < value.length(); index++) {
            char unit = value.charAt(index);
            if (Character.isHighSurrogate(unit)) {
                if (++index >= value.length() || !Character.isLowSurrogate(value.charAt(index))) return false;
            } else if (Character.isLowSurrogate(unit)) return false;
        }
        return true;
    }
    static byte[] utf8(String value) throws CharacterCodingException {
        ByteBuffer encoded = StandardCharsets.UTF_8.newEncoder().onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT).encode(CharBuffer.wrap(value));
        byte[] bytes = new byte[encoded.remaining()]; encoded.get(bytes); return bytes;
    }
    static List<Token> tokens(String source, int[] byteOffsets) throws Exception {
        if (!validUtf16(source) || byteOffsets == null || (byteOffsets.length & 1) != 0) throw new OffsetFailure();
        byte[] encoded = utf8(source);
        int[] byteToUtf16 = new int[encoded.length + 1]; Arrays.fill(byteToUtf16, -1);
        int offset = 0;
        for (int index = 0; index < source.length();) {
            byteToUtf16[offset] = index;
            int point = source.codePointAt(index);
            offset += point <= 0x7f ? 1 : point <= 0x7ff ? 2 : point <= 0xffff ? 3 : 4;
            index += Character.charCount(point);
        }
        byteToUtf16[offset] = source.length();
        if (offset != encoded.length) throw new OffsetFailure();
        ArrayList<Token> result = new ArrayList<>(); int cursor = 0;
        for (int index = 0; index < byteOffsets.length; index += 2) {
            int begin = byteOffsets[index], end = byteOffsets[index + 1];
            if (begin != cursor || begin < 0 || begin >= end || end > encoded.length
                    || byteToUtf16[begin] < 0 || byteToUtf16[end] < 0) throw new OffsetFailure();
            result.add(new Token(source, byteToUtf16[begin], byteToUtf16[end])); cursor = end;
        }
        if (cursor != encoded.length) throw new OffsetFailure();
        return Collections.unmodifiableList(result);
    }

    private static final String[] NAMES = {"jieba.dict.utf8", "hmm_model.utf8", "user.dict.utf8"};
    private static final long[] SIZES = {5420189L, 519773L, 39L};
    private static final String[] HASHES = {
            "2eed8a617b330a0d1117f78312f122d37373cd9db29b5515ca5098fcfa608de7",
            "c2781984c4c6be66862ff1bc9aace264256bcd174cd900d7f3725debe6c71255",
            "cef393d44bf2a7ca792819309cde4a30adf89ad1da808763443aa9476cf3c561"};
    static File[] installAssets(Context context) throws Exception {
        if (context == null || context.isDeviceProtectedStorage()) throw new AssetFailure();
        File base = context.getNoBackupFilesDir(), directory = new File(base, "workbench-text-dict-v1");
        if (Files.isSymbolicLink(directory.toPath()) || !directory.isDirectory() && !directory.mkdirs()
                || !directory.getCanonicalFile().getParentFile().equals(base.getCanonicalFile())) throw new AssetFailure();
        File[] result = new File[NAMES.length];
        for (int index = 0; index < NAMES.length; index++) {
            File destination = new File(directory, NAMES[index]);
            if (Files.isSymbolicLink(destination.toPath())) throw new AssetFailure();
            if (!verified(destination, index)) {
                File temporary = new File(directory, NAMES[index] + "." + UUID.randomUUID() + ".tmp");
                try {
                    try (InputStream input = context.getAssets().open("workbench-text-dict/" + NAMES[index]);
                            FileOutputStream output = new FileOutputStream(temporary)) {
                        byte[] buffer = new byte[8192]; long total = 0; int count;
                        while ((count = input.read(buffer)) != -1) {
                            if (count == 0) continue;
                            total += count; if (total > SIZES[index]) throw new AssetFailure();
                            output.write(buffer, 0, count);
                        }
                        output.getFD().sync();
                    }
                    if (!verified(temporary, index)) throw new AssetFailure();
                    Files.move(temporary.toPath(), destination.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
                } finally { if (temporary.exists() && !temporary.delete()) throw new AssetFailure(); }
            }
            if (!verified(destination, index)) throw new AssetFailure();
            result[index] = destination;
        }
        return result;
    }
    private static boolean verified(File file, int index) throws Exception {
        if (!file.isFile() || file.length() != SIZES[index] || Files.isSymbolicLink(file.toPath())) return false;
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (InputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[8192]; int count;
            while ((count = input.read(buffer)) != -1) if (count > 0) digest.update(buffer, 0, count);
        }
        StringBuilder hash = new StringBuilder(64);
        for (byte value : digest.digest()) { hash.append(Character.forDigit((value >>> 4) & 15, 16)); hash.append(Character.forDigit(value & 15, 16)); }
        return HASHES[index].contentEquals(hash);
    }
    private static final class AssetFailure extends IOException { AssetFailure() { super("TEXT_ASSET_ERROR"); } }
    private static final class OffsetFailure extends IOException { OffsetFailure() { super("TEXT_OFFSET_ERROR"); } }
    private static native boolean nativeInitialize(byte[] dictionaryPath, byte[] hmmPath, byte[] userPath);
    private static native boolean nativeReady();
    private static native int[] nativeCut(byte[] standardUtf8);
    private AtomicWorkbenchTextSegmenter() { }
}
