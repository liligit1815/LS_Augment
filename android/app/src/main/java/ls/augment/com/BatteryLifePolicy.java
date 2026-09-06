package ls.augment.com;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** The OEM age-voltage policy is distinct from learned capacity and cycle counters. */
public final class BatteryLifePolicy {
    private static final Pattern REDUCTION = Pattern.compile("(?m)^(\\s*zbl,reduce-fcv-enable\\s*=\\s*<)([01])(>[^\\r\\n]*)$");
    private BatteryLifePolicy() { }
    public static Boolean reductionEnabled(String config) {
        if (config == null || config.length() > 32768) return null;
        Matcher m = REDUCTION.matcher(config);
        if (!m.find()) return null;
        boolean value = m.group(2).equals("1");
        return m.find() ? null : value;
    }
    public static String disableReduction(String config) {
        if (reductionEnabled(config) == null) return null;
        Matcher match = REDUCTION.matcher(config);
        if (!match.find()) return null;
        return config.substring(0, match.start(2)) + "0" + config.substring(match.end(2));
    }
    public static Long lastRecordedCycles(String record) {
        if (record == null) return null;
        Matcher m = Pattern.compile("(?:^|;)\\s*1:([0-9]+);").matcher(record);
        Long result = null;
        while (m.find()) try { result = Long.parseLong(m.group(1)); } catch (NumberFormatException ignored) { }
        return result;
    }
}
