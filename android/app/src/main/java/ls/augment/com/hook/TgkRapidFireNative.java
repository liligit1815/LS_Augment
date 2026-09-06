package ls.augment.com.hook;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;

import ls.augment.com.RapidFireCompatibility;

import java.io.File;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Small system_server bridge for structurally verified libinputreader layouts.
 *
 * The native library is loaded lazily on the first request above the OEM
 * ceiling. The native probe verifies the actual function and derives its field
 * offsets. File hashes invalidate old test results but never decide eligibility.
 */
final class TgkRapidFireNative {
    private static final String LIBRARY_NAME = "lsaugment_tgk";
    private static final String NATIVE_LIBRARY_NAME = "liblsaugment_tgk.so";
    private static boolean attempted;
    private static boolean loaded;
    private static String state = "not_loaded";
    private static int configuredLeft = -1;
    private static int configuredRight = -1;

    private TgkRapidFireNative() { }

    static synchronized boolean ensureInstalled(AugmentModule module, Context context) {
        if (attempted) return loaded;
        attempted = true;

        String sha256 = getInputReaderSha256();
        writeHash(context, sha256);
        String profile = RapidFireCompatibility.nativeProfile();
        if (profile == null) {
            state = "incompatible|stage=structure|sha256=" + safe(sha256);
            writeState(context, state);
            return false;
        }

        try {
            if (!RapidFireCrashFuse.beforeInstall(context)) {
                state = "fused_or_marker_unavailable";
                writeState(context, state);
                return false;
            }
            ApplicationInfo info = module.getModuleApplicationInfo();
            String nativeDir = info == null ? null : info.nativeLibraryDir;
            loadLibrary(info, nativeDir, NATIVE_LIBRARY_NAME, LIBRARY_NAME);
            state = nativeInstall();
            loaded = state != null && state.startsWith("installed|");
            if (!loaded && (state == null || state.isEmpty())) state = "error|empty_native_state";
            if (loaded) {
                FeatureSettings.diagnostic(context,
                        FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR, "");
                RapidFireCrashFuse.armStableClear(context);
            }
            else RapidFireCrashFuse.installationFailed(context);
        } catch (Throwable error) {
            state = "error|load=" + error.getClass().getSimpleName()
                    + ":" + safe(error.getMessage());
            loaded = false;
            RapidFireCrashFuse.installationFailed(context);
        }
        writeState(context, state);
        return loaded;
    }

    static boolean isLoaded() { return loaded; }

    /** Returns the SHA-256 of the system input-reader library on this device. */
    static String getInputReaderSha256() {
        return RapidFireCompatibility.inputReaderSha256();
    }

    static synchronized void configureKeys(Context context, int leftKey, int rightKey) {
        if (!loaded || leftKey <= 0 || rightKey <= 0 || leftKey == rightKey) return;
        try {
            if (configuredLeft != leftKey || configuredRight != rightKey) {
                nativeClearTargets();
                nativeConfigureKeys(leftKey, rightKey);
                configuredLeft = leftKey;
                configuredRight = rightKey;
            }
        } catch (Throwable error) {
            state = "error|configure_keys=" + error.getClass().getSimpleName();
            writeState(context, state);
        }
    }

    static synchronized void configureTestKey(Context context, String side, int keyCode) {
        if (!loaded || keyCode <= 0) return;
        int left = "left".equals(side) ? keyCode : configuredLeft;
        int right = "right".equals(side) ? keyCode : configuredRight;
        if (left > 0 && right > 0 && left == right) return;
        try {
            nativeClearTargets();
            nativeConfigureKeys(left, right);
            configuredLeft = left;
            configuredRight = right;
        } catch (Throwable error) {
            state = "error|configure_test=" + error.getClass().getSimpleName();
            writeState(context, state);
        }
    }

    static void setTarget(Context context, int keyCode, int cps) {
        if (!loaded) return;
        try {
            nativeSetTarget(keyCode, Math.max(0, Math.min(50, cps)));
        } catch (Throwable error) {
            state = "error|set_target=" + error.getClass().getSimpleName();
            writeState(context, state);
        }
    }

    static synchronized void clearTargets(Context context) {
        if (!loaded) {
            configuredLeft = -1;
            configuredRight = -1;
            if (!attempted) {
                state = "not_loaded";
                FeatureSettings.diagnostic(context,
                        FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR, "");
            }
            writeState(context, state);
            return;
        }
        try {
            nativeClearTargets();
            nativeArmCadence(null,-1);
            configuredLeft = -1;
            configuredRight = -1;
            state = nativeState();
            writeState(context, state);
        } catch (Throwable error) {
            state = "error|clear_targets=" + error.getClass().getSimpleName();
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

    /** Read-only native observation used only by the explicit compatibility test. */
    static synchronized String observation() {
        if (!loaded) return "";
        try { return nativeObservation(); }
        catch (Throwable ignored) { return ""; }
    }

    static void armCadence(String id,String phase,int code){if(loaded)try{nativeArmCadence(id+":"+phase+":"+code,code);}catch(Throwable ignored){}}
    static String cadence(){if(loaded)try{return nativeCadence();}catch(Throwable ignored){}return "ready=0";}

    private static void loadLibrary(ApplicationInfo info, String nativeDir,
            String fileName, String libraryName) {
        Set<File> candidates = new LinkedHashSet<>();
        addCandidate(candidates, nativeDir, fileName);

        // libxposed may expose an APK-internal nativeLibraryDir to the module
        // class loader even when PackageManager extracted the libraries. Derive
        // the real, package-owned extraction directory from sourceDir instead of
        // relying on the injected class loader's lookup path.
        File sourceApk = info == null || info.sourceDir == null
                ? null : new File(info.sourceDir);
        File codeDir = sourceApk == null ? null : sourceApk.getParentFile();
        File extractedRoot = codeDir == null ? null : new File(codeDir, "lib");
        if (extractedRoot != null) {
            for (String abi : Build.SUPPORTED_ABIS) {
                addCandidate(candidates, new File(extractedRoot, abi).getPath(), fileName);
                String runtimeArch = runtimeArchDirectory(abi);
                if (!runtimeArch.equals(abi)) {
                    addCandidate(candidates,
                            new File(extractedRoot, runtimeArch).getPath(), fileName);
                }
            }
        }

        UnsatisfiedLinkError firstError = null;
        for (File candidate : candidates) {
            if (!candidate.isFile()) continue;
            try {
                System.load(candidate.getAbsolutePath());
                return;
            } catch (UnsatisfiedLinkError error) {
                if (firstError == null) firstError = error;
            }
        }
        try {
            System.loadLibrary(libraryName);
        } catch (UnsatisfiedLinkError error) {
            if (firstError != null) error.addSuppressed(firstError);
            throw error;
        }
    }

    private static void addCandidate(Set<File> candidates, String directory,
            String fileName) {
        if (directory == null || directory.isEmpty()) return;
        candidates.add(new File(directory, fileName));
    }

    private static String runtimeArchDirectory(String abi) {
        if ("arm64-v8a".equals(abi)) return "arm64";
        if ("armeabi-v7a".equals(abi) || "armeabi".equals(abi)) return "arm";
        return abi;
    }

    private static void writeHash(Context context, String value) {
        FeatureSettings.diagnostic(context,
                FeatureSettings.TGK_RAPID_FIRE_NATIVE_SHA256,
                value == null ? "" : value);
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

    private static native String nativeInstall();
    private static native void nativeConfigureKeys(int leftKeyCode, int rightKeyCode);
    private static native void nativeClearTargets();
    private static native void nativeSetTarget(int keyCode, int cps);
    private static native String nativeState();
    private static native String nativeObservation();
    private static native void nativeArmCadence(String identity,int keyCode);
    private static native String nativeCadence();
}
