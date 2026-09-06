package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Bounded per-session, per-phase evidence. Keys are actual transport codes, not sides. */
public final class RapidFireRouteEvidence {
    public static final String DIAGNOSTIC_PREFIX = "ls_augment_tgk_rapid_fire_test_routes_";
    public final String sessionId;
    public final String phase;
    private final Map<Integer, Integer> routes = new LinkedHashMap<>();
    private boolean conflict;

    private RapidFireRouteEvidence(String id, String phase) {
        this.sessionId = id;
        this.phase = phase;
    }

    public static RapidFireRouteEvidence start(String id, String phase) {
        return id != null && id.matches("[0-9a-f]{32}")
                && ("WAIT_LEFT".equals(phase) || "WAIT_RIGHT".equals(phase))
                ? new RapidFireRouteEvidence(id, phase) : null;
    }

    public boolean matches(String id, String expectedPhase) {
        return sessionId.equals(id) && phase.equals(expectedPhase);
    }

    public void record(int upper, int system) {
        if (!code(upper) || !code(system)) { conflict = true; return; }
        Integer previous = routes.get(system);
        if (previous != null) {
            if (previous != upper) conflict = true;
            return;
        }
        if (routes.size() >= 16 || routes.containsValue(upper)) { conflict = true; return; }
        routes.put(system, upper);
    }

    public int resolve(int observedSystemCode) {
        Integer value = routes.get(observedSystemCode);
        return conflict || value == null ? -1 : value;
    }

    public boolean isConflicted() { return conflict; }

    public String serialize() {
        StringBuilder out = new StringBuilder("RFR1|").append(sessionId).append('|')
                .append(phase).append('|').append(conflict ? '1' : '0').append('|');
        for (Map.Entry<Integer, Integer> route : routes.entrySet()) {
            if (out.charAt(out.length() - 1) != '|') out.append(',');
            out.append(route.getKey()).append(':').append(route.getValue());
        }
        return out.toString();
    }

    public static RapidFireRouteEvidence parse(String value) {
        if (value == null || value.length() > 1024) return null;
        try {
            String[] fields = value.split("\\|", -1);
            if (fields.length != 5 || !"RFR1".equals(fields[0])
                    || !("0".equals(fields[3]) || "1".equals(fields[3]))) return null;
            RapidFireRouteEvidence result = start(fields[1], fields[2]);
            if (result == null) return null;
            if (!fields[4].isEmpty()) {
                String[] pairs = fields[4].split(",", -1);
                if (pairs.length > 16) return null;
                for (String pair : pairs) {
                    String[] codes = pair.split(":", -1);
                    if (codes.length != 2) return null;
                    result.record(Integer.parseInt(codes[1]), Integer.parseInt(codes[0]));
                }
            }
            result.conflict |= "1".equals(fields[3]);
            return result;
        } catch (RuntimeException ignored) { return null; }
    }

    private static boolean code(int value) { return value > 0 && value <= 65535; }

    /** Lives only for a single synchronous upper call; no time-window/code-equality guessing. */
    public static final class Trace {
        private int system = -1;
        private boolean ambiguous;

        public void observe(int systemCode) {
            if (!code(systemCode) || (system > 0 && system != systemCode)) ambiguous = true;
            else system = systemCode;
        }

        public void reject() { ambiguous = true; }
        public int resolvedSystem() { return ambiguous ? -1 : system; }
    }

    public static final class Calls {
        private final ThreadLocal<Trace> current = new ThreadLocal<>();
        public Trace current() { return current.get(); }
        public Scope begin() { return new Scope(); }

        public final class Scope implements AutoCloseable {
            public final Trace trace = new Trace();
            private final Trace previous = current.get();
            private boolean closed;

            private Scope() {
                if (previous != null) { previous.reject(); trace.reject(); }
                current.set(trace);
            }

            @Override public void close() {
                if (closed) return;
                closed = true;
                if (previous == null) current.remove(); else current.set(previous);
            }
        }
    }
}
