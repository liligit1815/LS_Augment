package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

public final class TestConfigSnapshot {
    public static void main(String[] args) throws Exception {
        Map<String, String> values = new LinkedHashMap<>(ConfigSchema.defaults());
        values.put(ConfigSchema.AI_TRIGGER_ENABLED, "1");
        values.put(ConfigSchema.AI_TRIGGER_TEMPLATE_SCAN_MS, "80");
        values.put(ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN, "token-payload");
        ConfigSnapshot snapshot = ConfigSnapshot.create(42L, 123456L, values);
        if (snapshot == null) throw new AssertionError("snapshot creation failed");
        ConfigSnapshot parsed = ConfigSnapshot.parse(snapshot.serialize());
        if (parsed == null || parsed.revision != 42L || parsed.updatedAt != 123456L
                || !"1".equals(parsed.get(ConfigSchema.AI_TRIGGER_ENABLED))
                || !"80".equals(parsed.get(ConfigSchema.AI_TRIGGER_TEMPLATE_SCAN_MS))
                || !"token-payload".equals(parsed.get(
                ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN))) {
            throw new AssertionError("snapshot roundtrip failed");
        }
        String damaged = snapshot.serialize().substring(0,
                snapshot.serialize().length() - 1) + "A";
        if (ConfigSnapshot.parse(damaged) != null) {
            throw new AssertionError("damaged checksum/payload accepted");
        }
        if (!ConfigSnapshot.safeDefaults().values().keySet()
                .equals(ConfigSchema.runtimeKeys())) {
            throw new AssertionError("safe snapshot key drift");
        }
        if (!"0".equals(ConfigSnapshot.safeDefaults().get(
                ConfigSchema.TGK_RAPID_FIRE_ENABLED))) {
            throw new AssertionError("safe defaults enabled native feature");
        }
        if (!"红魔Duo".equals(ConfigSchema.defaults().get(ConfigSchema.TILE_LABEL))
                || !"红魔Duo".equals(ConfigSchema.normalize(ConfigSchema.TILE_LABEL,"LS_Augment"))
                || !"我的磁贴".equals(ConfigSchema.normalize(ConfigSchema.TILE_LABEL,"我的磁贴")))
            throw new AssertionError("brand migration overwrote custom label or missed legacy default");
        ConfigSnapshot legacy = ConfigSnapshot.parse(withLabel(snapshot,"LS_Augment"));
        if (legacy == null || !"1".equals(legacy.get(ConfigSchema.AI_TRIGGER_ENABLED))
                || !"LS_Augment".equals(legacy.get(ConfigSchema.TILE_LABEL))
                || !legacy.serialize().equals(withLabel(snapshot,"LS_Augment")))
            throw new AssertionError("legacy snapshot rejected or checksum bytes changed by rename");
        if (ConfigSnapshot.parse(withLabel(snapshot,"  非规范值  ")) != null)
            throw new AssertionError("rename compatibility accepted other unnormalized values");
        System.out.println("PASS TestConfigSnapshot (including legacy brand snapshot compatibility)");
    }
    private static String withLabel(ConfigSnapshot snapshot,String label) throws Exception {
        var decoder=java.util.Base64.getUrlDecoder();var encoder=java.util.Base64.getUrlEncoder().withoutPadding();
        var utf=java.nio.charset.StandardCharsets.UTF_8;
        String body=new String(decoder.decode(snapshot.serialize().split("\\.",3)[2]),utf);
        body=body.replace(ConfigSchema.TILE_LABEL+"="+encoder.encodeToString(snapshot.get(ConfigSchema.TILE_LABEL).getBytes(utf)),
                ConfigSchema.TILE_LABEL+"="+encoder.encodeToString(label.getBytes(utf)));
        byte[] digest=java.security.MessageDigest.getInstance("SHA-256").digest(body.getBytes(utf));
        return "LSA1."+java.util.HexFormat.of().formatHex(digest)+"."+encoder.encodeToString(body.getBytes(utf));
    }
}
