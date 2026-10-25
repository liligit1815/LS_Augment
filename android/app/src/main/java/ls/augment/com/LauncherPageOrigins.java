package ls.augment.com;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

/** Explicit module-created empty pages, scoped to one real launcher database file. */
public final class LauncherPageOrigins {
    private LauncherPageOrigins() { }
    private static boolean source(String value) {
        return value.matches("LDI1\\|[0-9]{1,10}\\|[0-9]{1,5}\\|(credential|device)\\|[A-Za-z0-9_\\-]+\\.db\\|[a-f0-9]{64}\\|-?[0-9]{1,20}\\|-?[0-9]{1,20}");
    }
    private static Map<String,List<Integer>> parse(String raw) {
        if (raw == null || raw.length() > 8192) throw new IllegalArgumentException("pages_origins_size");
        Map<String,List<Integer>> result = new LinkedHashMap<>();
        if (raw.isEmpty()) return result;
        for (String group : raw.split(";", -1)) {
            int equal = group.indexOf('=');
            if (equal < 0 || !source(group.substring(0, equal))) throw new IllegalArgumentException("pages_origin_source");
            String key = group.substring(0, equal);
            if (result.containsKey(key) || result.size() >= 16) throw new IllegalArgumentException("pages_origin_duplicate");
            List<Integer> ids = new ArrayList<>();
            String value = group.substring(equal + 1);
            if (value.isEmpty()) throw new IllegalArgumentException("pages_origin_ids");
            for (String part : value.split(",", -1)) {
                if (!part.matches("[0-9]{1,10}")) throw new IllegalArgumentException("pages_origin_id");
                int id = Integer.parseInt(part);
                if (id < 0 || ids.contains(id) || ids.size() >= 128) throw new IllegalArgumentException("pages_origin_id");
                ids.add(id);
            }
            result.put(key, ids);
        }
        return result;
    }
    public static void validate(String raw) { parse(raw); }
    public static List<Integer> ids(String raw, String source) {
        if (source == null || source.isEmpty()) return java.util.Collections.emptyList();
        return new ArrayList<>(parse(raw).getOrDefault(source, java.util.Collections.emptyList()));
    }
    public static String add(String raw, String source, int id) {
        if (!source(source) || id < 0) throw new IllegalArgumentException("pages_origin_source");
        Map<String,List<Integer>> values = parse(raw);
        List<Integer> ids = values.computeIfAbsent(source, ignored -> new ArrayList<>());
        if (!ids.contains(id)) ids.add(id);
        return encode(values);
    }
    public static String remove(String raw, String source, int id) {
        Map<String,List<Integer>> values = parse(raw);
        List<Integer> ids = values.get(source);
        if (ids != null) { ids.remove(Integer.valueOf(id)); if (ids.isEmpty()) values.remove(source); }
        return encode(values);
    }
    public static boolean referencedByOtherSource(String raw, String source, int id) {
        for (Map.Entry<String,List<Integer>> entry : parse(raw).entrySet())
            if (!entry.getKey().equals(source) && entry.getValue().contains(id)) return true;
        return false;
    }
    private static String encode(Map<String,List<Integer>> values) {
        StringBuilder text = new StringBuilder();
        for (Map.Entry<String,List<Integer>> entry : values.entrySet()) {
            if (text.length() > 0) text.append(';');
            text.append(entry.getKey()).append('=');
            for (int id : new LinkedHashSet<>(entry.getValue())) {
                if (text.charAt(text.length() - 1) != '=') text.append(',');
                text.append(id);
            }
        }
        String raw = text.toString(); validate(raw); return raw;
    }
}
