package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/** Immutable, checksummed all-or-nothing runtime configuration snapshot. */
public final class ConfigSnapshot {
    private static final String PREFIX = "LSA1";
    private static final int MAX_SERIALIZED_LENGTH = 256 * 1024;

    public final int schemaVersion;
    public final long revision;
    public final long updatedAt;
    public final String scope;
    public final String checksum;
    private final Map<String, String> values;
    private final String serialized;

    private ConfigSnapshot(int schemaVersion, long revision, long updatedAt,
            String scope, Map<String, String> values, String checksum, String serialized) {
        this.schemaVersion = schemaVersion;
        this.revision = revision;
        this.updatedAt = updatedAt;
        this.scope = scope;
        this.values = Collections.unmodifiableMap(new LinkedHashMap<>(values));
        this.checksum = checksum;
        this.serialized = serialized;
    }

    public static ConfigSnapshot create(long revision, long updatedAt,
            Map<String, String> source) {
        if (revision < 1L || updatedAt < 1L || source == null) return null;
        LinkedHashMap<String, String> normalized = new LinkedHashMap<>();
        for (Map.Entry<String, String> entry : ConfigSchema.runtimeDefaults().entrySet()) {
            String raw = source.containsKey(entry.getKey())
                    ? source.get(entry.getKey()) : entry.getValue();
            String value = ConfigSchema.normalize(entry.getKey(), raw);
            if (value == null) return null;
            normalized.put(entry.getKey(), value);
        }
        String body = body(ConfigSchema.VERSION, revision, updatedAt,
                ConfigSchema.SCOPE_DEVICE, normalized);
        String checksum = sha256(body);
        String encoded = Base64.getUrlEncoder().withoutPadding().encodeToString(
                body.getBytes(StandardCharsets.UTF_8));
        String serialized = PREFIX + "." + checksum + "." + encoded;
        // Large worksheets share the snapshot with other settings. Never persist
        // a snapshot that our reader would reject after the next process restart.
        if (serialized.length() > MAX_SERIALIZED_LENGTH) return null;
        return new ConfigSnapshot(ConfigSchema.VERSION, revision, updatedAt,
                ConfigSchema.SCOPE_DEVICE, normalized, checksum, serialized);
    }

    public static ConfigSnapshot safeDefaults() {
        LinkedHashMap<String, String> safe = new LinkedHashMap<>(ConfigSchema.runtimeDefaults());
        // Defaults already disable every enhancement. Use a stable synthetic
        // revision that can never supersede a persisted snapshot.
        return create(1L, 1L, safe);
    }

    public static ConfigSnapshot parse(String serialized) {
        try {
            if (serialized == null || serialized.length() > MAX_SERIALIZED_LENGTH) return null;
            String[] parts = serialized.split("\\.", 3);
            if (parts.length != 3 || !PREFIX.equals(parts[0])
                    || !parts[1].matches("[0-9a-f]{64}")) return null;
            String body = new String(Base64.getUrlDecoder().decode(parts[2]),
                    StandardCharsets.UTF_8);
            if (!constantTimeEquals(parts[1], sha256(body))) return null;

            String[] lines = body.split("\\n", -1);
            if (lines.length < 5) return null;
            int version = parseInt(header(lines[0], "v="), -1);
            long revision = parseLong(header(lines[1], "r="), -1L);
            long updatedAt = parseLong(header(lines[2], "t="), -1L);
            String scope = header(lines[3], "s=");
            if (version != ConfigSchema.VERSION || revision < 1L || updatedAt < 1L
                    || !ConfigSchema.SCOPE_DEVICE.equals(scope)) return null;

            LinkedHashMap<String, String> values = new LinkedHashMap<>();
            java.util.HashSet<String> seen = new java.util.HashSet<>();
            for (int i = 4; i < lines.length; i++) {
                String line = lines[i];
                if (line.isEmpty()) continue;
                int separator = line.indexOf('=');
                if (separator <= 0) return null;
                String key = line.substring(0, separator);
                if (!seen.add(key)) return null;
                String value = new String(Base64.getUrlDecoder().decode(
                        line.substring(separator + 1)), StandardCharsets.UTF_8);
                // Validate, then discard the two retired fan fields from older signed
                // snapshots. Their presence must not reset unrelated active features.
                if (ConfigSchema.FAN_UNLOCK_MAX.equals(key)) {
                    if (!"0".equals(value) && !"1".equals(value)) return null;
                    continue;
                }
                if (ConfigSchema.FAN_TARGET_RPM.equals(key)) {
                    int rpm = parseInt(value, -1);
                    if (rpm < 500 || rpm > 100000 || !String.valueOf(rpm).equals(value)) return null;
                    continue;
                }
                if (!ConfigSchema.isRuntimeKey(key)) return null;
                String normalized = ConfigSchema.normalize(key, value);
                // Older signed snapshots retain their original bytes/checksum. Accept only the
                // former default label; AppConfig applies the new display name when reading it.
                boolean legacyLabel = ConfigSchema.TILE_LABEL.equals(key) && "LS_Augment".equals(value);
                boolean legacyFanLevel = ConfigSchema.FAN_FIXED_LEVEL.equals(key) && "0".equals(value);
                boolean retiredSheetMode = ConfigSchema.STATUSBAR_LAYOUT_MODE.equals(key) && "sheet".equals(value);
                if (normalized == null || (!normalized.equals(value) && !legacyLabel && !legacyFanLevel && !retiredSheetMode)) return null;
                values.put(key, legacyFanLevel || retiredSheetMode ? normalized : value);
            }
            // Before LiftArc existed, a complete signed snapshot had none of this
            // family. Preserve its bytes/checksum and existing settings while
            // supplying the new, disabled-by-default feature. A partially missing
            // new family remains invalid; this is not a general missing-key repair.
            if (!values.keySet().equals(ConfigSchema.runtimeKeys())) {
                boolean hasLiftArc = false;
                for (String key : values.keySet())
                    if (key.startsWith("ls_augment_liftarc_")) { hasLiftArc = true; break; }
                if (hasLiftArc) return null;
                for (Map.Entry<String, String> entry : ConfigSchema.runtimeDefaults().entrySet())
                    if (entry.getKey().startsWith("ls_augment_liftarc_"))
                        values.put(entry.getKey(), entry.getValue());
                if (!values.keySet().equals(ConfigSchema.runtimeKeys())) return null;
            }
            return new ConfigSnapshot(version, revision, updatedAt, scope, values,
                    parts[1], serialized);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public String get(String key) {
        return values.get(key);
    }

    public Map<String, String> values() {
        return values;
    }

    public String serialize() {
        return serialized;
    }

    private static String body(int version, long revision, long updatedAt,
            String scope, Map<String, String> values) {
        StringBuilder result = new StringBuilder(8192);
        result.append("v=").append(version).append('\n');
        result.append("r=").append(revision).append('\n');
        result.append("t=").append(updatedAt).append('\n');
        result.append("s=").append(scope).append('\n');
        for (String key : ConfigSchema.runtimeKeys()) {
            String value = values.get(key);
            result.append(key).append('=').append(Base64.getUrlEncoder().withoutPadding()
                    .encodeToString(value.getBytes(StandardCharsets.UTF_8))).append('\n');
        }
        return result.toString();
    }

    private static String header(String line, String prefix) {
        return line.startsWith(prefix) ? line.substring(prefix.length()) : "";
    }

    private static int parseInt(String value, int fallback) {
        try { return Integer.parseInt(value); } catch (Throwable ignored) { return fallback; }
    }

    private static long parseLong(String value, long fallback) {
        try { return Long.parseLong(value); } catch (Throwable ignored) { return fallback; }
    }

    private static String sha256(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(
                    value.getBytes(StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder(64);
            for (byte item : digest) {
                result.append(String.format(java.util.Locale.ROOT, "%02x", item & 0xff));
            }
            return result.toString();
        } catch (Throwable impossible) {
            throw new IllegalStateException("SHA-256 unavailable", impossible);
        }
    }

    private static boolean constantTimeEquals(String left, String right) {
        if (left == null || right == null || left.length() != right.length()) return false;
        int difference = 0;
        for (int i = 0; i < left.length(); i++) {
            difference |= left.charAt(i) ^ right.charAt(i);
        }
        return difference == 0;
    }
}
