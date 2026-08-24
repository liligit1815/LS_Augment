package ls.augment.com;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Compact, version-independent status-bar position storage.
 *
 * <p>Coordinates describe the centre of a real status-bar view in thousandths
 * of the current status-bar width/height.  Keeping them normalized lets the
 * same setting survive density and resolution changes without inventing a
 * separate preview canvas.</p>
 */
public final class StatusBarLayoutSpec {
    private static final Pattern ID = Pattern.compile("[A-Za-z0-9_.:-]{1,80}");

    private final LinkedHashMap<String, Position> positions;

    private StatusBarLayoutSpec(LinkedHashMap<String, Position> positions) {
        this.positions = positions;
    }

    public static StatusBarLayoutSpec empty() {
        return new StatusBarLayoutSpec(new LinkedHashMap<>());
    }

    public static ParseResult parse(String raw) {
        LinkedHashMap<String, Position> values = new LinkedHashMap<>();
        String clean = raw == null ? "" : raw.trim();
        if (clean.isEmpty()) return ParseResult.valid(new StatusBarLayoutSpec(values));
        String[] entries = clean.split(";", -1);
        for (String entry : entries) {
            String[] parts = entry.split(",", -1);
            if (parts.length < 3 || parts.length > 4 || !ID.matcher(parts[0]).matches()) {
                return ParseResult.invalid("位置配置格式无效：" + entry);
            }
            if (values.containsKey(parts[0])) {
                return ParseResult.invalid("位置项目重复：" + parts[0]);
            }
            try {
                int x = Integer.parseInt(parts[1]);
                int y = Integer.parseInt(parts[2]);
                boolean hidden = false;
                float scale = 1.0f;
                if (parts.length == 4) {
                    String fourth = parts[3].trim();
                    if (fourth.equalsIgnoreCase("hidden")) {
                        hidden = true;
                    } else if (fourth.startsWith("hidden:") || fourth.startsWith("Hidden:")) {
                        hidden = true;
                        String scaleStr = fourth.substring(7);
                        if (!scaleStr.isEmpty()) {
                            scale = Float.parseFloat(scaleStr);
                        }
                    } else {
                        scale = Float.parseFloat(fourth);
                    }
                }
                if (x < 0 || x > 1000 || y < 0 || y > 1000) {
                    return ParseResult.invalid("位置坐标超出 0–1000：" + parts[0]);
                }
                if (scale < 0.5f || scale > 2.0f) {
                    return ParseResult.invalid("图标缩放超出 0.5–2.0：" + parts[0]);
                }
                values.put(parts[0], new Position(x, y, scale, hidden));
            } catch (NumberFormatException error) {
                return ParseResult.invalid("位置坐标或缩放不是数字：" + parts[0]);
            }
        }
        return ParseResult.valid(new StatusBarLayoutSpec(values));
    }

    public Map<String, Position> positions() {
        return Collections.unmodifiableMap(positions);
    }

    public Position get(String id) {
        return positions.get(id);
    }

    public String serialize() {
        StringBuilder value = new StringBuilder();
        for (Map.Entry<String, Position> entry : positions.entrySet()) {
            if (value.length() > 0) value.append(';');
            Position p = entry.getValue();
            value.append(entry.getKey()).append(',')
                    .append(p.x).append(',').append(p.y);
            if (p.hidden) {
                value.append(",hidden");
            }
            if (p.scale != 1.0f) {
                value.append(',').append(String.format(Locale.ROOT, "%.2f", p.scale));
            }
        }
        return value.toString();
    }

    public static String serialize(Map<String, Position> positions) {
        LinkedHashMap<String, Position> safe = new LinkedHashMap<>();
        if (positions != null) safe.putAll(positions);
        return new StatusBarLayoutSpec(safe).serialize();
    }

    public static int pixel(int normalized, int extent) {
        return Math.round(Math.max(0, extent) * normalized / 1000.0f);
    }

    public static final class Position {
        public final int x;
        public final int y;
        public final float scale;
        public final boolean hidden;

        public Position(int x, int y) {
            this(x, y, 1.0f, false);
        }

        public Position(int x, int y, float scale) {
            this(x, y, scale, false);
        }

        public Position(int x, int y, float scale, boolean hidden) {
            if (x < 0 || x > 1000 || y < 0 || y > 1000) {
                throw new IllegalArgumentException("position outside 0..1000");
            }
            if (scale < 0.5f || scale > 2.0f) {
                throw new IllegalArgumentException("scale outside 0.5..2.0");
            }
            this.x = x;
            this.y = y;
            this.scale = scale;
            this.hidden = hidden;
        }
    }

    public static final class ParseResult {
        public final boolean valid;
        public final StatusBarLayoutSpec spec;
        public final String error;

        private ParseResult(boolean valid, StatusBarLayoutSpec spec, String error) {
            this.valid = valid;
            this.spec = spec;
            this.error = error;
        }

        private static ParseResult valid(StatusBarLayoutSpec spec) {
            return new ParseResult(true, spec, "");
        }

        private static ParseResult invalid(String error) {
            return new ParseResult(false, StatusBarLayoutSpec.empty(), error);
        }
    }
}
