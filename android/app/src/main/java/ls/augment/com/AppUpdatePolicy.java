package ls.augment.com;

import java.net.URI;
import java.security.MessageDigest;
import java.util.Locale;

/** Small, platform-independent rules used before any APK is trusted. */
final class AppUpdatePolicy {
    static final String APP_ID = "redmagic-duo";
    static final String PACKAGE_NAME = "ls.augment.com";
    static final String MANIFEST_URL = "https://raw.githubusercontent.com/liligit1815/lispacerelease/main/updates/redmagic-duo.json";
    static final long MAX_APK_BYTES = 2L * 1024 * 1024 * 1024 - 1;
    static final long REMIND_LATER_MS = 24L * 60 * 60 * 1000;
    private static final String ASSET_PREFIX = "/liligit1815/lispacerelease/releases/download/";

    private AppUpdatePolicy() { }

    /** Activity navigation overlaps starts/stops; recreation keeps the same foreground session. */
    static final class ForegroundSession {
        private int started;
        private boolean foreground;
        boolean started() {
            boolean opening = !foreground;
            foreground = true;
            started++;
            return opening;
        }
        boolean stopped(boolean changingConfigurations) {
            started = Math.max(0, started - 1);
            if (started != 0 || changingConfigurations) return false;
            foreground = false;
            return true;
        }
    }

    static boolean assetUrl(String address) {
        try {
            URI uri = URI.create(address);
            if (!https(uri) || !"github.com".equalsIgnoreCase(uri.getHost())
                    || uri.getRawQuery() != null || !uri.getRawPath().startsWith(ASSET_PREFIX)) return false;
            String path = uri.getPath();
            if (!path.startsWith(ASSET_PREFIX) || path.indexOf('\\') >= 0
                    || path.contains("/../") || path.contains("/./")) return false;
            String[] rest = path.substring(ASSET_PREFIX.length()).split("/", -1);
            return rest.length == 2 && !rest[0].isEmpty() && !rest[1].isEmpty()
                    && !".".equals(rest[0]) && !"..".equals(rest[0])
                    && !".".equals(rest[1]) && !"..".equals(rest[1]);
        } catch (Exception ignored) { return false; }
    }

    static boolean redirectUrl(String address) {
        try {
            URI uri = URI.create(address);
            if (!https(uri)) return false;
            String host = uri.getHost().toLowerCase(Locale.ROOT);
            return host.equals("github.com") || host.endsWith(".githubusercontent.com");
        } catch (Exception ignored) { return false; }
    }

    private static boolean https(URI uri) {
        return "https".equalsIgnoreCase(uri.getScheme()) && uri.getHost() != null
                && uri.getRawUserInfo() == null && uri.getRawFragment() == null
                && (uri.getPort() == -1 || uri.getPort() == 443);
    }

    static boolean digest(String text) { return text != null && text.matches("[0-9a-fA-F]{64}"); }

    /** Checking is per foreground session; only the reminder is deferred, for that exact release. */
    static boolean shouldPrompt(int version, boolean manual, int skippedVersion,
            int deferredVersion, long deferredAt, long now) {
        if (manual) return true;
        if (version == skippedVersion) return false;
        return version != deferredVersion || deferredAt <= 0 || now < deferredAt
                || now - deferredAt >= REMIND_LATER_MS;
    }

    static String sha256(byte[] bytes) {
        try { return hex(MessageDigest.getInstance("SHA-256").digest(bytes)); }
        catch (Exception impossible) { throw new IllegalStateException(impossible); }
    }

    static String hex(byte[] bytes) {
        StringBuilder result = new StringBuilder(bytes.length * 2);
        for (byte value : bytes) result.append(String.format(Locale.ROOT, "%02x", value & 255));
        return result.toString();
    }

    static boolean compatibleSigner(String installed, String[] verifiedIncomingHistory) {
        if (!digest(installed) || verifiedIncomingHistory == null) return false;
        for (String item : verifiedIncomingHistory) if (installed.equalsIgnoreCase(item)) return true;
        return false;
    }
}
