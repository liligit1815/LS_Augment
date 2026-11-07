package ls.augment.com;

import java.util.Map;
import java.util.TreeMap;

/** Per-user ordinary notification overrides. Omitted keys inherit their parent. */
public final class IslandNoticeRules {
    public static final String KEY = "ls_augment_rm_island_notice_rules";
    public static final int INHERIT = 0, OFF = 1, COMPACT = 2, EXPAND = 3;
    private static final int LIMIT = 128;
    private static final int CHANNEL_LENGTH = 1000;
    private final Map<String,Integer> entries = new TreeMap<>();

    public static String app(int user, String pkg) {
        return IslandDownloadConfig.validApp(user,pkg) ? user + "|" + pkg + "|" : "";
    }
    static String channel(int user,String pkg,String id) { return IslandDownloadConfig.channel(user,pkg,id,CHANNEL_LENGTH); }
    static String[] parts(String key) { return IslandDownloadConfig.parts(key,CHANNEL_LENGTH); }

    public static IslandNoticeRules parse(String raw) {
        if (raw == null || raw.length() > 16384) return null;
        IslandNoticeRules rules = new IslandNoticeRules();
        if (raw.isEmpty()) return rules;
        for (String item : raw.split(",", -1)) {
            if (item.length() < 2) return null;
            int mode = item.charAt(0) - '0';
            String key = item.substring(1);
            if (mode < OFF || mode > EXPAND || !valid(key)
                    || rules.entries.put(key, mode) != null || rules.entries.size() > LIMIT) return null;
        }
        return rules;
    }

    private static boolean valid(String key) {
        // An empty final field denotes the app; channel IDs are nonempty Base64URL.
        if (!key.endsWith("|")) return parts(key) != null;
        String[] parts = key.split("\\|", -1);
        if (parts.length != 3) return false;
        try { return key.equals(app(Integer.parseInt(parts[0]), parts[1])); }
        catch (NumberFormatException invalid) { return false; }
    }

    public static String normalize(String raw) {
        IslandNoticeRules rules = parse(raw);
        return rules == null ? null : rules.encode();
    }

    public int mode(String key) { return entries.getOrDefault(key, INHERIT); }

    public int resolve(int user, String pkg, String channel) {
        int override = mode(channel(user, pkg, channel));
        return override == INHERIT ? mode(app(user, pkg)) : override;
    }

    java.util.Set<String> keys() { return entries.keySet(); }

    String updated(String key, int mode) {
        if (!valid(key) || mode < INHERIT || mode > EXPAND) return null;
        IslandNoticeRules copy = new IslandNoticeRules();
        copy.entries.putAll(entries);
        if (mode == INHERIT) copy.entries.remove(key); else copy.entries.put(key, mode);
        String encoded = copy.encode();
        return copy.entries.size() <= LIMIT && encoded.length() <= 16384 ? encoded : null;
    }

    private String encode() {
        java.util.StringJoiner joined = new java.util.StringJoiner(",");
        entries.forEach((key, mode) -> joined.add(mode + key));
        return joined.toString();
    }
}
