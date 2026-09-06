package ls.augment.com;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;

import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.Locale;
import java.util.UUID;

/** Versioned compatibility identity, guided-test session and unlock token. */
public final class RapidFireCompatibility {
    public static final long SESSION_MAX_MS = 10L * 60L * 1000L;
    public static final long STABILITY_REQUIRED_MS = 10_000L;
    public static final int TEST_CPS = 20;
    public static final String INPUT_READER_PATH = "/system/lib64/libinputreader.so";
    public static final String SYMBOL_SIGNATURE =
            "android::EventProducer::updateTgkRapidFireData(int)/v1";

    private static final String TOKEN_PREFIX = "RFT2";
    private static final String SESSION_PREFIX = "RFS2";
    private static volatile String cachedNativeHash;
    private static volatile String cachedFingerprint;
    private static volatile long cachedFingerprintAt;

    private RapidFireCompatibility() { }

    public enum State {
        UNTESTED, PREFLIGHT, NEEDS_RESTART, WAIT_LEFT, WAIT_RIGHT,
        VERIFYING, PASSED, FAILED, FUSED
    }

    public static String currentFingerprint(Context context) {
        long now = System.currentTimeMillis();
        String value = cachedFingerprint;
        if (value != null && now - cachedFingerprintAt < 5_000L) return value;
        synchronized (RapidFireCompatibility.class) {
            value = cachedFingerprint;
            if (value != null && now - cachedFingerprintAt < 5_000L) return value;
            StringBuilder source = new StringBuilder();
            source.append("sdk=").append(Build.VERSION.SDK_INT)
                    .append("|release=").append(Build.VERSION.RELEASE)
                    .append("|security=").append(Build.VERSION.SECURITY_PATCH)
                    .append("|buildId=").append(Build.ID)
                    .append("|fingerprint=").append(Build.FINGERPRINT)
                    .append("|abi=").append(Build.SUPPORTED_ABIS.length == 0
                            ? "" : Build.SUPPORTED_ABIS[0])
                    .append("|gamespace=").append(packageVersion(context,
                            "cn.nubia.gamelauncher"))
                    .append("|gameassist=").append(packageVersion(context,
                            "cn.nubia.gameassist"))
                    .append("|inputreader=").append(inputReaderSha256())
                    .append("|symbol=").append(SYMBOL_SIGNATURE)
                    .append("|module=").append(BuildConfig.VERSION_NAME)
                    .append("|schema=").append(ConfigSchema.VERSION);
            cachedFingerprint = sha256(source.toString());
            cachedFingerprintAt = now;
            return cachedFingerprint;
        }
    }

    public static String inputReaderSha256() {
        String cached = cachedNativeHash;
        if (cached != null) return cached;
        synchronized (RapidFireCompatibility.class) {
            if (cachedNativeHash != null) return cachedNativeHash;
            try (FileInputStream input = new FileInputStream(INPUT_READER_PATH)) {
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] buffer = new byte[64 * 1024];
                int read;
                while ((read = input.read(buffer)) >= 0) {
                    if (read > 0) digest.update(buffer, 0, read);
                }
                cachedNativeHash = hex(digest.digest());
            } catch (Throwable error) {
                cachedNativeHash = "unreadable:" + error.getClass().getSimpleName();
            }
            return cachedNativeHash;
        }
    }

    public static String nativeProfile() {
        return RapidFireNativeLayout.inspectFile(new java.io.File(INPUT_READER_PATH)) != null
                ? RapidFireNativeLayout.PROFILE : null;
    }

    private static String packageVersion(Context context, String packageName) {
        if (context == null) return "context_missing";
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(packageName, 0);
            return info.versionName + ":" + info.getLongVersionCode();
        } catch (Throwable error) {
            return "missing";
        }
    }

    public static final class Token {
        public final String fingerprint;
        public final int physicalLeft;
        public final int upperLeft;
        public final int systemLeft;
        public final int physicalRight;
        public final int upperRight;
        public final int systemRight;
        public final long passedAt;

        private Token(String fingerprint, int physicalLeft, int upperLeft, int systemLeft,
                int physicalRight, int upperRight, int systemRight, long passedAt) {
            this.fingerprint = fingerprint;
            this.physicalLeft = physicalLeft;
            this.upperLeft = upperLeft;
            this.systemLeft = systemLeft;
            this.physicalRight = physicalRight;
            this.upperRight = upperRight;
            this.systemRight = systemRight;
            this.passedAt = passedAt;
        }

        public static Token issue(String fingerprint, int physicalLeft, int upperLeft,
                int systemLeft, int physicalRight, int upperRight, int systemRight,
                long passedAt) {
            Token token = new Token(fingerprint, physicalLeft, upperLeft, systemLeft,
                    physicalRight, upperRight, systemRight, passedAt);
            return token.isStructurallyValid() ? token : null;
        }

        public boolean validFor(String currentFingerprint) {
            return isStructurallyValid() && fingerprint.equals(currentFingerprint);
        }

        public boolean acceptsUpper(int keyCode) {
            return keyCode == upperLeft || keyCode == upperRight;
        }

        public boolean acceptsSystem(int keyCode) {
            return keyCode == systemLeft || keyCode == systemRight;
        }

        public String serialize() {
            String body = fingerprint + "," + physicalLeft + "," + upperLeft + ","
                    + systemLeft + "," + physicalRight + "," + upperRight + ","
                    + systemRight + "," + passedAt;
            return encode(TOKEN_PREFIX, body);
        }

        public static Token parse(String encoded) {
            String body = decode(TOKEN_PREFIX, encoded);
            if (body == null) return null;
            try {
                String[] values = body.split(",", -1);
                if (values.length != 8) return null;
                return issue(values[0], Integer.parseInt(values[1]),
                        Integer.parseInt(values[2]), Integer.parseInt(values[3]),
                        Integer.parseInt(values[4]), Integer.parseInt(values[5]),
                        Integer.parseInt(values[6]), Long.parseLong(values[7]));
            } catch (Throwable ignored) {
                return null;
            }
        }

        private boolean isStructurallyValid() {
            return fingerprint != null && fingerprint.matches("[0-9a-f]{64}")
                    && code(physicalLeft) && code(upperLeft) && code(systemLeft)
                    && code(physicalRight) && code(upperRight) && code(systemRight)
                    && physicalLeft != physicalRight && upperLeft != upperRight
                    && systemLeft != systemRight && passedAt > 0L;
        }
    }

    public static final class Session {
        public final String id;
        public final String fingerprint;
        public final State state;
        public final long createdAt;
        public final long expiresAt;
        public final long verifyingSince;
        public final int physicalLeft;
        public final int upperLeft;
        public final int systemLeft;
        public final int physicalRight;
        public final int upperRight;
        public final int systemRight;

        private Session(String id, String fingerprint, State state,
                long createdAt, long expiresAt,
                long verifyingSince, int physicalLeft, int upperLeft, int systemLeft,
                int physicalRight, int upperRight, int systemRight) {
            this.id = id;
            this.fingerprint = fingerprint;
            this.state = state;
            this.createdAt = createdAt;
            this.expiresAt = expiresAt;
            this.verifyingSince = verifyingSince;
            this.physicalLeft = physicalLeft;
            this.upperLeft = upperLeft;
            this.systemLeft = systemLeft;
            this.physicalRight = physicalRight;
            this.upperRight = upperRight;
            this.systemRight = systemRight;
        }

        public static Session start(String fingerprint, long now) {
            if (fingerprint == null || !fingerprint.matches("[0-9a-f]{64}")) return null;
            return new Session(UUID.randomUUID().toString().replace("-", ""), fingerprint,
                    State.PREFLIGHT, now, now + SESSION_MAX_MS, 0L,
                    -1, -1, -1, -1, -1, -1);
        }

        public Session withState(State value, long now) {
            return new Session(id, fingerprint, value, createdAt, expiresAt,
                    value == State.VERIFYING ? now : verifyingSince,
                    physicalLeft, upperLeft, systemLeft,
                    physicalRight, upperRight, systemRight);
        }

        public Session withLeft(int physical, int upper, int system) {
            return new Session(id, fingerprint, state, createdAt, expiresAt, verifyingSince,
                    physical, upper, system, physicalRight, upperRight, systemRight);
        }

        public Session withRight(int physical, int upper, int system) {
            return new Session(id, fingerprint, state, createdAt, expiresAt, verifyingSince,
                    physicalLeft, upperLeft, systemLeft, physical, upper, system);
        }

        public boolean isExpired(long now) {
            return RapidFireLifecyclePolicy.expired(state.name(), now, expiresAt);
        }

        public boolean validFor(String currentFingerprint) {
            return fingerprint != null && fingerprint.equals(currentFingerprint);
        }

        public boolean active(long now) {
            return !isExpired(now) && (state == State.WAIT_LEFT
                    || state == State.WAIT_RIGHT || state == State.VERIFYING);
        }

        public String serialize() {
            String body = id + "," + fingerprint + "," + state.name() + ","
                    + createdAt + "," + expiresAt
                    + "," + verifyingSince + "," + physicalLeft + "," + upperLeft
                    + "," + systemLeft + "," + physicalRight + "," + upperRight
                    + "," + systemRight;
            return encode(SESSION_PREFIX, body);
        }

        public static Session parse(String encoded) {
            String body = decode(SESSION_PREFIX, encoded);
            if (body == null) return null;
            try {
                String[] value = body.split(",", -1);
                if (value.length != 12 || !value[0].matches("[0-9a-f]{32}")
                        || !value[1].matches("[0-9a-f]{64}")) return null;
                long created = Long.parseLong(value[3]);
                long expires = Long.parseLong(value[4]);
                if (created <= 0 || expires <= created || expires - created > SESSION_MAX_MS) {
                    return null;
                }
                Session session = new Session(value[0], value[1], State.valueOf(value[2]),
                        created, expires, Long.parseLong(value[5]),
                        Integer.parseInt(value[6]), Integer.parseInt(value[7]),
                        Integer.parseInt(value[8]), Integer.parseInt(value[9]),
                        Integer.parseInt(value[10]), Integer.parseInt(value[11]));
                return session.isStructurallyValid() ? session : null;
            } catch (Throwable ignored) {
                return null;
            }
        }

        private boolean isStructurallyValid() {
            if (id == null || !id.matches("[0-9a-f]{32}")
                    || fingerprint == null || !fingerprint.matches("[0-9a-f]{64}")
                    || state == null || createdAt <= 0L || expiresAt <= createdAt
                    || expiresAt - createdAt > SESSION_MAX_MS
                    || !optionalCode(physicalLeft) || !optionalCode(upperLeft)
                    || !optionalCode(systemLeft) || !optionalCode(physicalRight)
                    || !optionalCode(upperRight) || !optionalCode(systemRight)
                    || (verifyingSince != 0L
                    && (verifyingSince < createdAt || verifyingSince > expiresAt))) {
                return false;
            }
            if (state == State.WAIT_RIGHT) {
                return code(physicalLeft) && code(upperLeft) && code(systemLeft);
            }
            if (state == State.VERIFYING || state == State.PASSED) {
                return verifyingSince > 0L
                        && code(physicalLeft) && code(upperLeft) && code(systemLeft)
                        && code(physicalRight) && code(upperRight) && code(systemRight)
                        && physicalLeft != physicalRight && upperLeft != upperRight
                        && systemLeft != systemRight;
            }
            return true;
        }
    }

    private static boolean code(int value) { return value > 0 && value <= 65535; }

    private static boolean optionalCode(int value) { return value == -1 || code(value); }

    private static String encode(String prefix, String body) {
        String encoded = Base64.getUrlEncoder().withoutPadding().encodeToString(
                body.getBytes(StandardCharsets.UTF_8));
        return prefix + "." + encoded + "." + sha256(prefix + "|" + body);
    }

    private static String decode(String prefix, String encoded) {
        if (encoded == null) return null;
        String[] values = encoded.split("\\.", -1);
        if (values.length != 3 || !prefix.equals(values[0])) return null;
        try {
            String body = new String(Base64.getUrlDecoder().decode(values[1]),
                    StandardCharsets.UTF_8);
            return sha256(prefix + "|" + body).equals(values[2]) ? body : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String sha256(String value) {
        try { return hex(MessageDigest.getInstance("SHA-256").digest(
                value.getBytes(StandardCharsets.UTF_8))); }
        catch (Throwable error) { return ""; }
    }

    private static String sha256(byte[] value) {
        try { return hex(MessageDigest.getInstance("SHA-256").digest(value)); }
        catch (Throwable error) { return ""; }
    }

    private static String hex(byte[] value) {
        StringBuilder out = new StringBuilder(value.length * 2);
        for (byte item : value) out.append(String.format(Locale.ROOT, "%02x", item & 0xff));
        return out.toString();
    }
}
