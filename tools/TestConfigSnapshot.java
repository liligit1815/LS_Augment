package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

public final class TestConfigSnapshot {
    public static void main(String[] args) {
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
        System.out.println("PASS TestConfigSnapshot");
    }
}
