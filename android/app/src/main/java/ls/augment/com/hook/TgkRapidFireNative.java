package ls.augment.com.hook;

import android.content.Context;
import android.content.pm.ApplicationInfo;

import java.io.File;
import java.io.FileInputStream;
import java.security.MessageDigest;

/**
 * Small system_server bridge for the verified libinputreader profile.
 *
 * The native library is loaded lazily on the first request above the OEM
 * ceiling. Unknown libinputreader builds never load the inline hook and keep
 * the vendor implementation untouched.
 */
final class TgkRapidFireNative {
    static final String EXPECTED_INPUT_READER_SHA256 =
            "203e202857b42e9b043466a8ddf793a5972278c3f1af71f244be790322a17d1a";
    private static final String LIBRARY_NAME = "lsaugment_tgk";
    private static final String SHADOWHOOK_LIBRARY_NAME = "libshadowhook.so";
    private static final String NATIVE_LIBRARY_NAME = "liblsaugment_tgk.so";
    private static final String INPUT_READER_PATH = "/system/lib64/libinputreader.so";

    private static boolean attempted;
    private static boolean loaded;
    private static String state = "not_loaded";

    private TgkRapidFireNative() { }

    static synchronized boolean ensureInstalled(AugmentModule module, Context context) {
        if (attempted) return loaded;
        attempted = true;

        String sha256 = sha256(INPUT_READER_PATH);
        if (!EXPECTED_INPUT_READER_SHA256.equals(sha256)) {
            state = "unsupported|sha256=" + safe(sha256);
            writeState(context, state);
            return false;
        }

        try {
            ApplicationInfo info = module.getModuleApplicationInfo();
            String nativeDir = info == null ? null : info.nativeLibraryDir;
            loadLibrary(nativeDir, SHADOWHOOK_LIBRARY_NAME, "shadowhook");
            loadLibrary(nativeDir, NATIVE_LIBRARY_NAME, LIBRARY_NAME);
            state = nativeInstall(sha256);
            loaded = state != null && state.startsWith("installed|");
            if (!loaded && (state == null || state.isEmpty())) state = "error|empty_native_state";
        } catch (Throwable error) {
            state = "error|load=" + error.getClass().getSimpleName()
                    + ":" + safe(error.getMessage());
            loaded = false;
        }
        writeState(context, state);
        return loaded;
    }

    static boolean isLoaded() { return loaded; }

    static void setTarget(Context context, int keyCode, int cps) {
        if (!loaded) return;
        try {
            nativeSetTarget(keyCode, Math.max(0, Math.min(50, cps)));
        } catch (Throwable error) {
            state = "error|set_target=" + error.getClass().getSimpleName();
            writeState(context, state);
        }
    }

    static String state(Context context) {
        if (loaded) {
            try { state = nativeState(); }
            catch (Throwable ignored) { }
        }
        writeState(context, state);
        return state;
    }

    private static void loadLibrary(String nativeDir, String fileName, String libraryName) {
        if (nativeDir != null && !nativeDir.isEmpty()) {
            File candidate = new File(nativeDir, fileName);
            if (candidate.isFile()) {
                System.load(candidate.getAbsolutePath());
                return;
            }
        }
        System.loadLibrary(libraryName);
    }

    private static String sha256(String path) {
        try (FileInputStream input = new FileInputStream(path)) {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] buffer = new byte[65536];
            int read;
            while ((read = input.read(buffer)) >= 0) {
                if (read > 0) digest.update(buffer, 0, read);
            }
            StringBuilder result = new StringBuilder(64);
            for (byte value : digest.digest()) {
                result.append(String.format(java.util.Locale.ROOT, "%02x", value & 0xff));
            }
            return result.toString();
        } catch (Throwable error) {
            return "unreadable:" + error.getClass().getSimpleName();
        }
    }

    private static void writeState(Context context, String value) {
        FeatureSettings.diagnostic(context,
                FeatureSettings.TGK_RAPID_FIRE_NATIVE_STATE,
                value == null ? "" : value);
    }

    private static String safe(String value) {
        if (value == null || value.isEmpty()) return "";
        return value.replace('|', '_').replace('\n', ' ');
    }

    private static native String nativeInstall(String inputReaderSha256);
    private static native void nativeSetTarget(int keyCode, int cps);
    private static native String nativeState();
}

