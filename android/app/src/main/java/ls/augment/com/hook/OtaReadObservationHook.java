package ls.augment.com.hook;

import android.util.Log;
import java.security.MessageDigest;
import ls.augment.com.BuildConfig;

/** Opt-in debug observation at the OEM consumer boundary; never changes a read. */
final class OtaReadObservationHook {
    private static final String TAG = "LSA.OtaRead";
    private OtaReadObservationHook() { }

    static void install(AugmentModule module, ClassLoader loader) {
        if (!BuildConfig.DEBUG) return;
        observe(module, loader, "d", "locale");
        observe(module, loader, "e", "manufacturer");
        observe(module, loader, "k", "fingerprint");
    }

    private static void observe(AugmentModule module, ClassLoader loader, String subtype, String field) {
        OemHooks.methods(module, loader,
                "com.zte.zdm.mo.ReadEnum$DevInfoReadHandler$" + subtype,
                "b", int.class, 2, "", chain -> {
                    Object result = chain.proceed();
                    if (!Log.isLoggable(TAG, Log.DEBUG)) return result;
                    // This is the buffer returned to the OEM caller after its normal reader ran.
                    // Log only a digest, never device identifiers, fingerprints, or field text.
                    try {
                        Object output = chain.getArg(1);
                        if (output instanceof byte[] && Integer.valueOf(0).equals(result)) {
                            byte[] bytes = (byte[]) output;
                            byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
                            StringBuilder hex = new StringBuilder(64);
                            for (byte value : digest) {
                                hex.append(Character.forDigit((value & 255) >>> 4, 16));
                                hex.append(Character.forDigit(value & 15, 16));
                            }
                            Log.d(TAG, "field=" + field + " bytes=" + bytes.length + " sha256=" + hex);
                        }
                    } catch (RuntimeException | java.security.NoSuchAlgorithmException ignored) {
                        // Optional observation must not alter the OEM result or exception behavior.
                    }
                    return result;
                });
    }
}
