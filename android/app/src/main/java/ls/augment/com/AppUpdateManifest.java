package ls.augment.com;

import java.io.IOException;
import java.time.Instant;
import java.util.Locale;
import org.json.JSONObject;

/** The shared release repository's version 1 contract, with a distinct application identity. */
final class AppUpdateManifest {
    final int versionCode, minSdk;
    final String versionName, publishedAt, notes, url, sha256, certificateSha256;
    final long size;

    private AppUpdateManifest(JSONObject release) throws Exception {
        versionCode = integer(release, "versionCode", 1, 2100000000);
        minSdk = integer(release, "minSdk", 1, 1000);
        versionName = text(release, "versionName", 100, false);
        publishedAt = text(release, "publishedAt", 80, false);
        if (!publishedAt.endsWith("Z")) throw new IOException();
        Instant.parse(publishedAt);
        notes = text(release, "notes", 12000, true);
        JSONObject apk = release.getJSONObject("apk");
        url = text(apk, "url", 2048, false);
        if (!AppUpdatePolicy.assetUrl(url)) throw new IOException();
        size = number(apk, "size", 1, AppUpdatePolicy.MAX_APK_BYTES);
        sha256 = text(apk, "sha256", 64, false).toLowerCase(Locale.ROOT);
        certificateSha256 = text(apk, "certificateSha256", 64, false).toLowerCase(Locale.ROOT);
        if (!AppUpdatePolicy.digest(sha256) || !AppUpdatePolicy.digest(certificateSha256)) throw new IOException();
    }

    static AppUpdateManifest parse(String document) throws IOException {
        try {
            JSONObject root = new JSONObject(document);
            if (integer(root, "schemaVersion", 1, 1) != 1
                    || !AppUpdatePolicy.APP_ID.equals(root.getString("appId"))
                    || !AppUpdatePolicy.PACKAGE_NAME.equals(root.getString("packageName"))
                    || !root.has("release")) throw new IOException();
            return root.isNull("release") ? null : new AppUpdateManifest(root.getJSONObject("release"));
        } catch (Exception invalid) { throw new IOException("更新信息无效，请稍后重试。", invalid); }
    }

    private static int integer(JSONObject object, String key, int min, int max) throws Exception {
        return (int) number(object, key, min, max);
    }

    private static long number(JSONObject object, String key, long min, long max) throws Exception {
        Object value = object.get(key);
        if (!(value instanceof Number)) throw new IOException();
        Number number = (Number) value;
        long result = number.longValue();
        if (!Double.isFinite(number.doubleValue()) || number.doubleValue() != (double) result
                || result < min || result > max) throw new IOException();
        return result;
    }

    private static String text(JSONObject object, String key, int max, boolean empty) throws Exception {
        Object value = object.get(key);
        if (!(value instanceof String)) throw new IOException();
        String result = (String) value;
        if ((!empty && result.trim().isEmpty()) || result.length() > max || result.indexOf('\0') >= 0)
            throw new IOException();
        return result;
    }
}
