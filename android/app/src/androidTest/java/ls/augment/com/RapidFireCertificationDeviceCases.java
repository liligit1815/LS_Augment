package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONObject;

/** Read-only observation of the user's existing certification; never issues one. */
final class RapidFireCertificationDeviceCases {
    static JSONObject run(Context context) throws Exception {
        SharedPreferences prefs = context.getSharedPreferences(AppConfig.PREFS, 0);
        Map<String, ?> before = new LinkedHashMap<>(prefs.getAll());
        Object rawToken = before.get(ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN);
        String encoded = rawToken instanceof String ? (String) rawToken : "";
        RapidFireCompatibility.Token token = RapidFireCompatibility.Token.parse(encoded);
        String fingerprint = RapidFireCompatibility.currentFingerprint(context);
        boolean valid = token != null && token.validFor(fingerprint);
        boolean fused = context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                .getString("ls_augment_tgk_rapid_fire_fuse_state", "").startsWith("fused");
        boolean unchanged = before.equals(prefs.getAll());
        if (!unchanged) throw new AssertionError("Certification inspection changed configuration");
        // Report booleans only: no credential, key map, fingerprint or other settings.
        return new JSONObject().put("success", true)
                .put("tokenPresent", !encoded.isEmpty())
                .put("tokenStructurallyValid", token != null)
                .put("hasValidCertification", valid)
                .put("currentEnvironmentMatches", valid)
                .put("legacyCertificationRetained", valid && !token.fingerprint.equals(fingerprint))
                .put("fused", fused)
                .put("featureUnlocked", valid && !fused)
                .put("configurationUnchanged", unchanged);
    }
}
