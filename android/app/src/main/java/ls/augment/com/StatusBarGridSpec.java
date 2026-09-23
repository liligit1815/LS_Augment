package ls.augment.com;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/** Shared, validated model for the preview and the real status bar. */
public final class StatusBarGridSpec {
    public static final String[] IDS = {"clock", "notifications", "system_icons", "battery",
            "cpu", "gpu", "battery_temp", "current", "power", "network"};
    public static final String[] LABELS = {"时钟", "通知图标", "系统图标", "电池图标",
            "CPU 温度", "GPU 温度", "电池温度", "电流", "功率", "网速"};
    public static final String[] ZONES = {"L1", "L2", "LS", "C1", "C2", "CS", "R1", "R2", "RS"};
    public static final String[] ZONE_LABELS = {"左上", "左下", "左侧跨两排", "中上", "中下", "中间跨两排", "右上", "右下", "右侧跨两排"};
    public static final Item DEFAULT_BATTERY = new Item("RS",3,13,true);
    private final LinkedHashMap<String, Item> items;
    private StatusBarGridSpec(LinkedHashMap<String, Item> items) { this.items = items; }

    public static StatusBarGridSpec defaults() {
        LinkedHashMap<String, Item> result = new LinkedHashMap<>();
        String[] zones = {"LS", "LS", "RS", "RS", "L2", "L2", "C2", "R2", "R2", "CS"};
        for (int i = 0; i < IDS.length; i++) {
            result.put(IDS[i], new Item(zones[i], i, i < 4 ? 13 : 9, i < 4));
        }
        return new StatusBarGridSpec(result);
    }

    public static StatusBarGridSpec parse(String raw) {
        StatusBarGridSpec result = defaults();
        if (raw == null || raw.isEmpty()) return result;
        String[] lines = raw.split(";", -1);
        if (lines.length != IDS.length + 1 || !"SG2".equals(lines[0])) return null;
        java.util.HashSet<String> seen = new java.util.HashSet<>();
        for (int i = 1; i < lines.length; i++) {
            String[] p = lines[i].split(",", -1);
            if (p.length != 5 || !result.items.containsKey(p[0]) || !seen.add(p[0])) return null;
            try {
                if (!"0".equals(p[4]) && !"1".equals(p[4])) return null;
                result.items.put(p[0], new Item(p[1], Integer.parseInt(p[2]),
                        Integer.parseInt(p[3]), "1".equals(p[4])));
            } catch (IllegalArgumentException bad) { return null; }
        }
        return result;
    }

    public Item get(String id) { return items.get(id); }
    public Map<String, Item> items() { return Collections.unmodifiableMap(items); }
    public StatusBarGridSpec with(String id, Item item) {
        if (!items.containsKey(id) || item == null) throw new IllegalArgumentException("unknown component");
        LinkedHashMap<String, Item> copy = new LinkedHashMap<>(items);
        copy.put(id, item);
        return new StatusBarGridSpec(copy);
    }
    public String serialize() {
        StringBuilder result = new StringBuilder("SG2");
        for (Map.Entry<String, Item> e : items.entrySet()) {
            Item i = e.getValue();
            result.append(';').append(e.getKey()).append(',').append(i.zone).append(',')
                    .append(i.order).append(',').append(i.size).append(',').append(i.visible ? 1 : 0);
        }
        return result.toString();
    }
    public static final class Item {
        public final String zone;
        public final int order, size;
        public final boolean visible;
        public Item(String zone, int order, int size, boolean visible) {
            if (!java.util.Arrays.asList(ZONES).contains(zone) || order < 0 || order > 99
                    || size < 6 || size > 32) throw new IllegalArgumentException("invalid layout item");
            this.zone = zone; this.order = order; this.size = size; this.visible = visible;
        }
    }
}
