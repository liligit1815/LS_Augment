package ls.augment.com;

import org.json.JSONObject;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/** Private durable recovery scope. This metadata never grants Task or display authority. */
public final class AtomicWorkbenchRecoveryScope {
    // Fixed implementation readers; syntax/read coverage is never allocation authority.
    enum ReaderProfile {
        LOW4(4), FULL8(8);
        final int poolCount;
        ReaderProfile(int count) { poolCount = count; }
        boolean contains(int slot) { return slot >= 0 && slot < poolCount; }
    }
    public enum Phase { LEGACY_ONLY, HIGH_REQUIRED, DRAINING }
    public final int poolLimit;
    public final Phase phase;
    public final String epoch;

    private AtomicWorkbenchRecoveryScope(int poolLimit, Phase phase, String epoch) throws IOException {
        boolean legacy = poolLimit == 4 && phase == Phase.LEGACY_ONLY && "".equals(epoch);
        boolean high = poolLimit == 8 && (phase == Phase.HIGH_REQUIRED || phase == Phase.DRAINING)
                && epoch != null && epoch.matches("[0-9a-f]{32}");
        if (!legacy && !high) throw new IOException("shelf_scope_shape");
        this.poolLimit = poolLimit; this.phase = phase; this.epoch = epoch;
    }

    static AtomicWorkbenchRecoveryScope legacy() throws IOException {
        return new AtomicWorkbenchRecoveryScope(4, Phase.LEGACY_ONLY, "");
    }
    static AtomicWorkbenchRecoveryScope high(String epoch) throws IOException {
        return new AtomicWorkbenchRecoveryScope(8, Phase.HIGH_REQUIRED, epoch);
    }
    public boolean requiresHighScopeReader() { return phase != Phase.LEGACY_ONLY; }

    /** Compatibility default: the currently composed phone Engine still has four owners. */
    void requireCurrentReader() throws IOException { requireReader(ReaderProfile.LOW4); }

    void requireReader(ReaderProfile reader) throws IOException {
        if (reader == null) throw new IOException("shelf_reader_missing");
        if (requiresHighScopeReader() && reader != ReaderProfile.FULL8)
            throw new IOException("shelf_scope_unsupported_full_scope");
    }

    JSONObject json() throws Exception {
        JSONObject out = new JSONObject(); out.put("schema", 1); out.put("pool_limit", poolLimit);
        out.put("phase", phase.name()); out.put("epoch", epoch); return out;
    }
    static AtomicWorkbenchRecoveryScope parse(JSONObject json) throws Exception {
        Set<String> keys = new HashSet<>(); Iterator<String> iterator = json.keys();
        while (iterator.hasNext()) keys.add(iterator.next());
        if (!keys.equals(new HashSet<>(Arrays.asList("schema", "pool_limit", "phase", "epoch")))
                || integer(json, "schema") != 1 || !(json.get("phase") instanceof String)
                || !(json.get("epoch") instanceof String)) throw new IOException("shelf_scope_shape");
        final Phase phase;
        try { phase = Phase.valueOf((String) json.get("phase")); }
        catch (IllegalArgumentException invalid) { throw new IOException("shelf_scope_phase", invalid); }
        return new AtomicWorkbenchRecoveryScope(integer(json, "pool_limit"), phase, (String) json.get("epoch"));
    }
    private static int integer(JSONObject json, String key) throws Exception {
        Object raw = json.get(key);
        if (!(raw instanceof Integer) && !(raw instanceof Long)) throw new IOException("shelf_scope_integer");
        long value = ((Number) raw).longValue();
        if (value < Integer.MIN_VALUE || value > Integer.MAX_VALUE) throw new IOException("shelf_scope_integer");
        return (int) value;
    }
}
