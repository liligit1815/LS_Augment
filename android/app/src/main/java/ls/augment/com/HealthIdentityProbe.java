package ls.augment.com;

import java.util.UUID;

/** One short-lived, explicit account discovery request; never persisted in configuration. */
public final class HealthIdentityProbe {
    public static final String EXTRA = "ls_augment_health_identity_probe_v1";
    public static final long LIFETIME_MS = 30_000L;
    private HealthIdentityProbe() { }
    public static String create(ConfigSnapshot snapshot, int user, long now) {
        if (snapshot == null || user < 0 || now < 1) return "";
        return "HP1|" + now + "|" + user + "|" + snapshot.checksum + "|"
                + UUID.randomUUID().toString().replace("-", "");
    }
    public static boolean pending(String request, int user, long now) {
        if (request == null) return false;
        try {
            String[] parts = request.split("\\|", -1);
            if (parts.length != 5 || !"HP1".equals(parts[0]) || !parts[3].matches("[0-9a-f]{64}")
                    || !parts[4].matches("[0-9a-f]{32}")) return false;
            long issued = Long.parseLong(parts[1]);
            return Integer.parseInt(parts[2]) == user && issued > 0 && now >= issued
                    && now - issued < LIFETIME_MS;
        } catch (RuntimeException ignored) { return false; }
    }
    public static boolean valid(String request, ConfigSnapshot snapshot, int user, long now) {
        return snapshot != null && pending(request, user, now)
                && request.split("\\|", -1)[3].equals(snapshot.checksum);
    }
}
