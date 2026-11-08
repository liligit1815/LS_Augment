package ls.augment.com.hook;

import android.os.SystemClock;
import java.util.LinkedHashMap;
import ls.augment.com.StartupDiagnostics;

/** Release-build evidence, using the existing bounded, phone-side journal. No I/O on hook threads. */
final class FeatureRuntimeLog {
    private static final LinkedHashMap<String, Gate> GATES = new LinkedHashMap<>();
    private static final int MAX_STAGES = 32;
    private static final class Gate {
        String state = "";
        long last, window, suppressed;
        int burst;
        boolean emitted;
    }

    static void event(String stage, String detail) { emit(stage, bounded(detail), detail, 250L); }
    static void state(String stage, String state, String detail) { emit(stage, state, detail, 300_000L); }

    private static synchronized void emit(String stage, String state, String detail, long interval) {
        try {
            state=bounded(state);
            long now = SystemClock.elapsedRealtime();
            Gate gate = GATES.get(stage);
            if (gate == null) {
                if (GATES.size() == MAX_STAGES) GATES.remove(GATES.keySet().iterator().next());
                gate = new Gate(); GATES.put(stage, gate);
            }
            if (now - gate.window >= 10_000L) { gate.window = now; gate.burst = 0; }
            if (gate.burst >= 12 || (gate.emitted && gate.state.equals(state) && now - gate.last < interval)) {
                gate.suppressed++; return;
            }
            long suppressed = gate.suppressed;
            gate.state = state; gate.last = now; gate.emitted = true; gate.suppressed = 0; gate.burst++;
            StartupDiagnostics.record(stage, bounded(detail) + ";suppressed=" + suppressed
                    + ";" + FeatureSettings.runtimeEvidence(), null);
        } catch (Throwable ignored) { /* Evidence must never change the OEM result or exception. */ }
    }

    static String failure(Throwable error) {
        for (int i = 0; i < 4 && error instanceof java.lang.reflect.InvocationTargetException
                && error.getCause() != null; i++) error = error.getCause();
        return error == null ? "none" : error.getClass().getName();
    }
    private static String bounded(String value) {
        if (value == null) return "";
        return value.length() <= 2048 ? value : value.substring(0, 2048) + ";truncated=true";
    }
    private FeatureRuntimeLog() { }
}
