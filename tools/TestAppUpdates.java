package ls.augment.com;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;

/** Host-side contract/security cases; uses the cached org.json JVM artifact, not Android stubs. */
public final class TestAppUpdates {
    private static int checks;
    private static final String HASH = "a".repeat(64), OLD = "b".repeat(64);
    private static final String URL = "https://github.com/liligit1815/lispacerelease/releases/download/redmagic-duo-v2/RedMagicDuo.apk";

    public static void main(String[] args) throws Exception {
        require(AppUpdatePolicy.assetUrl(URL), "Normal repository release asset rejected");
        String[] unsafe = {
                URL.replace("https://", "http://"),
                URL.replace("lispacerelease", "another-repo"),
                URL.replace("liligit1815", "another-owner"),
                URL.replace("github.com", "github.com.attacker.example"),
                URL.replace("github.com", "attacker.example@github.com"),
                URL.replace("github.com", "github.com:8443"),
                URL + "#fragment", URL + "?redirect=evil", URL + "/extra",
                URL.replace("/redmagic-duo-v2/", "/../"),
                URL.replace("/redmagic-duo-v2/", "/%2e%2e/"),
                URL.replace("/redmagic-duo-v2/", "/redmagic%2fduo/"),
                "https://raw.githubusercontent.com/liligit1815/lispacerelease/main/app.apk"
        };
        for (String value : unsafe) require(!AppUpdatePolicy.assetUrl(value), "Unsafe release source accepted: " + value);
        require(AppUpdatePolicy.redirectUrl("https://release-assets.githubusercontent.com/file?token=signed"), "Official asset redirect rejected");
        require(AppUpdatePolicy.redirectUrl("https://objects.githubusercontent.com/file"), "Official objects redirect rejected");
        require(AppUpdatePolicy.redirectUrl(URL), "GitHub redirect rejected");
        for (String value : new String[]{"http://release-assets.githubusercontent.com/file", "https://githubusercontent.com.attacker.example/file",
                "https://github.io/file", "https://evilgithubusercontent.com/file", "https://github.com:444/file", "https://user@github.com/file"})
            require(!AppUpdatePolicy.redirectUrl(value), "Unsafe redirect accepted: " + value);
        require(AppUpdatePolicy.sha256("abc".getBytes(StandardCharsets.UTF_8)).equals("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"), "Incorrect APK checksum algorithm");
        require(AppUpdatePolicy.compatibleSigner(OLD, new String[]{OLD}), "Existing signer rejected");
        require(AppUpdatePolicy.compatibleSigner(OLD, new String[]{HASH, OLD}), "Verified signing rotation rejected");
        require(!AppUpdatePolicy.compatibleSigner(OLD, new String[]{HASH}), "Unrelated signer accepted");
        require(!AppUpdatePolicy.compatibleSigner("", new String[]{""}), "Absent certificate accepted");
        long start = 1800000000000L;
        require(AppUpdatePolicy.automaticCheckDue(0, start), "First automatic check skipped");
        require(!AppUpdatePolicy.automaticCheckDue(start, start + 86399999), "Automatic check repeated within 24 hours");
        require(AppUpdatePolicy.automaticCheckDue(start, start + 86400000), "24-hour boundary skipped");
        require(!AppUpdatePolicy.automaticCheckDue(start, start - 1), "Clock rollback caused a repeated check");
        require(AppUpdateManifest.parse(base().put("release", JSONObject.NULL).toString()) == null, "Empty published source rejected");
        AppUpdateManifest manifest = AppUpdateManifest.parse(base().toString());
        require(manifest.versionCode == 20519 && manifest.size == 8192 && manifest.url.equals(URL), "Published contract not parsed");
        invalid(base().put("schemaVersion", 2));
        invalid(base().put("schemaVersion", "1"));
        invalid(base().put("appId", "iqoo-shoulder"));
        invalid(base().put("packageName", "another.package"));
        JSONObject missing = base(); missing.remove("release"); invalid(missing);
        for (Object version : new Object[]{0, -1, 20519.5, "20519", 2147483647L}) {
            JSONObject value = base(); value.getJSONObject("release").put("versionCode", version); invalid(value);
        }
        for (Object size : new Object[]{0, -1, 2L * 1024 * 1024 * 1024, "8192", 8192.5}) {
            JSONObject value = base(); value.getJSONObject("release").getJSONObject("apk").put("size", size); invalid(value);
        }
        JSONObject wrongUrl = base(); wrongUrl.getJSONObject("release").getJSONObject("apk").put("url", URL.replace("lispacerelease", "wrong")); invalid(wrongUrl);
        JSONObject hash = base(); hash.getJSONObject("release").getJSONObject("apk").put("sha256", "z".repeat(64)); invalid(hash);
        JSONObject cert = base(); cert.getJSONObject("release").getJSONObject("apk").put("certificateSha256", ""); invalid(cert);
        JSONObject date = base(); date.getJSONObject("release").put("publishedAt", "2026-10-11T12:00:00+08:00"); invalid(date);
        JSONObject notes = base(); notes.getJSONObject("release").put("notes", "x".repeat(12001)); invalid(notes);
        System.out.println("App update contract/security checks passed: " + checks);
        if (args.length == 1) {
            byte[] bytes = java.nio.file.Files.readAllBytes(java.nio.file.Path.of(args[0]));
            require(bytes.length <= 64 * 1024, "Published manifest exceeds 64 KiB");
            AppUpdateManifest published = AppUpdateManifest.parse(new String(bytes, StandardCharsets.UTF_8));
            System.out.println("Published redmagic-duo manifest accepted: " + (published == null ? "no release yet" : published.versionName));
        }
    }

    private static JSONObject base() {
        return new JSONObject().put("schemaVersion", 1).put("appId", "redmagic-duo").put("packageName", "ls.augment.com")
                .put("release", new JSONObject().put("versionCode", 20519).put("versionName", "2.0.0-alpha1-test20519")
                        .put("minSdk", 35).put("publishedAt", "2026-10-11T12:00:00Z").put("notes", "更新说明\n第二行")
                        .put("apk", new JSONObject().put("url", URL).put("size", 8192).put("sha256", HASH).put("certificateSha256", OLD)));
    }
    private static void invalid(JSONObject document) throws Exception {
        try { AppUpdateManifest.parse(document.toString()); throw new AssertionError("Invalid update manifest accepted"); }
        catch (IOException expected) { checks++; }
    }
    private static void require(boolean result, String failure) {
        if (!result) throw new AssertionError(failure);
        checks++;
    }
}
