package ls.augment.com;

import android.os.Build;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public final class FanHardwareIdentity {
    private FanHardwareIdentity() { }

    public static String current() {
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(
                    (Build.FINGERPRINT + "|" + System.getProperty("os.version", "")
                            + "|soc_fan.level.0-5.oem_max128.v2").getBytes(StandardCharsets.UTF_8));
            StringBuilder value = new StringBuilder();
            for (byte b : hash) value.append(String.format(java.util.Locale.US, "%02x", b & 255));
            return value.toString();
        } catch (Exception ignored) { return "unavailable"; }
    }
}
