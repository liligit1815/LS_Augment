package ls.augment.com;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Map;

public final class TestHealthDailyLimitConfig {
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    public static void main(String[] args) {
        String enabled = ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED;
        String steps = ConfigSchema.HEALTH_DAILY_LIMIT_STEPS;
        check("0".equals(ConfigSchema.defaultValue(enabled)), "daily limit defaults off");
        check("10000".equals(ConfigSchema.defaultValue(steps)), "default limit is 10000 steps");
        check(ConfigSchema.isRuntimeKey(enabled) && ConfigSchema.isRuntimeKey(steps),
                "limit settings reach runtime snapshots");
        for (String value : new String[]{"1", "10000", "1000000"}) {
            check(value.equals(ConfigSchema.normalize(steps, value)), "valid limit " + value);
        }
        for (String value : new String[]{"", "0", "-1", "1000001", "1.5", "abc",
                "2147483648", "999999999999999999999999999999"}) {
            check(ConfigSchema.normalize(steps, value) == null, "reject invalid limit " + value);
        }

        StepPlan plan = new StepPlan("1".repeat(32), "2".repeat(64), "Asia/Shanghai",
                LocalDate.of(2026, 9, 11), 540, 1080, 10, 200, 127, 42);
        Map<String, String> old = new LinkedHashMap<>();
        old.put(ConfigSchema.HEALTH_ENABLED, "1");
        old.put(ConfigSchema.HEALTH_MULTIPLY_ENABLED, "1");
        old.put(ConfigSchema.HEALTH_MULTIPLIER, "300");
        old.put(ConfigSchema.HEALTH_PLAN_ENABLED, "1");
        old.put(ConfigSchema.HEALTH_PLAN, plan.serialize());
        old.put(ConfigSchema.HEALTH_ACCOUNT, plan.account);
        old.put(ConfigSchema.HEALTH_SINCE, "1700000000");
        ConfigSnapshot upgraded = ConfigSnapshot.create(5, 12345, old);
        check(upgraded != null, "older configuration upgrades");
        check("0".equals(upgraded.get(enabled)) && "10000".equals(upgraded.get(steps)),
                "upgrade adds safe limit defaults");
        checkExisting(old, upgraded);

        Map<String, String> values = new LinkedHashMap<>(upgraded.values());
        for (String cap : new String[]{"1", "10000", "1000000"}) {
            values.put(enabled, "1");
            values.put(steps, cap);
            ConfigSnapshot saved = ConfigSnapshot.create(6, 12346, values);
            ConfigSnapshot restored = ConfigSnapshot.parse(saved.serialize());
            check(restored != null && "1".equals(restored.get(enabled))
                    && cap.equals(restored.get(steps)), "limit survives save/restore " + cap);
            checkExisting(old, restored);
        }
        values.put(enabled, "0");
        ConfigSnapshot disabled = ConfigSnapshot.create(7, 12347, values);
        check(disabled != null && "1000000".equals(disabled.get(steps)),
                "disabling retains the configured upper limit");
        checkExisting(old, disabled);
        values.put(steps, "1000001");
        check(ConfigSnapshot.create(8, 12348, values) == null,
                "invalid upper limit cannot enter a runtime snapshot");

        Map<String, String> unbound = new LinkedHashMap<>();
        unbound.put(enabled, "1");
        unbound.put(steps, "20000");
        ConfigSnapshot standalone = ConfigSnapshot.create(9, 12349, unbound);
        check(standalone != null && "".equals(standalone.get(ConfigSchema.HEALTH_ACCOUNT))
                && "0".equals(standalone.get(ConfigSchema.HEALTH_ENABLED)),
                "limit can be configured independently without enabling or binding health");
        System.out.println("PASS TestHealthDailyLimitConfig");
    }

    private static void checkExisting(Map<String, String> expected, ConfigSnapshot actual) {
        for (Map.Entry<String, String> entry : expected.entrySet()) {
            check(entry.getValue().equals(actual.get(entry.getKey())),
                    "limit change preserves existing setting " + entry.getKey());
        }
    }
}
