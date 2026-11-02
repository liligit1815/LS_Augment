package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Old offsets/content and the semantic center stop survive configuration transport. */
public final class TestLauncherMemorySettings {
    private static int checks;
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        String prefix = "ls_augment_rm_recents_memory_";
        Map<String, EnhancementOption> options = new LinkedHashMap<>();
        for (EnhancementOption option : LauncherOptions.options()) options.put(option.key, option);
        check("220".equals(options.get(prefix + "portrait_left").defaultValue), "Old default retained");
        check("5".equals(options.get(prefix + "content").defaultValue), "Old content default retained");
        check(options.get(prefix + "portrait_left").normalize("-2") == null, "Invalid negative offset rejected");
        check(options.get(prefix + "landscape_left").normalize("-1") == null, "Landscape unchanged");
        check(options.get(prefix + "content").normalize("7") == null, "Unknown content rejected");
        for (String left : new String[]{"-1", "0", "223", "2000"}) {
            for (int content = 0; content <= LauncherMemoryPresentation.FULL_LABELS; content++) {
                Map<String, String> values = new LinkedHashMap<>();
                values.put(prefix + "custom", "1");
                values.put(prefix + "portrait_left", left);
                values.put(prefix + "landscape_left", "660");
                values.put(prefix + "content", String.valueOf(content));
                ConfigSnapshot snapshot = ConfigSnapshot.create(4, 12345, values);
                ConfigSnapshot restored = snapshot == null ? null : ConfigSnapshot.parse(snapshot.serialize());
                check(restored != null, "Snapshot round trip");
                for (Map.Entry<String, String> value : values.entrySet())
                    check(value.getValue().equals(restored.get(value.getKey())), "Setting survives: " + value.getKey());
            }
        }
        System.out.println("PASS LauncherMemorySettings " + checks + " checks");
    }
}
