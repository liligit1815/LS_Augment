package ls.augment.com;

/** Bounded, content-free capture timing. This record never decides capture behavior. */
public final class CaptureRuntimeObservation {
    public final int build, pid, kind;
    public final long sequence, started;
    public long revision;
    public boolean placeholder, gate, gateObserved, cancelled;
    public int lookups, callerPid, attached, valid, changed, leases;
    public long endpointMs = -1, transactionMs = -1;
    public String phase = "created", wait = "pending", transaction = "none", cleanup = "none";
    public boolean exclude, applied;

    public CaptureRuntimeObservation(int build, int pid, int kind, long sequence, long started) {
        this.build = build; this.pid = pid; this.kind = kind;
        this.sequence = sequence; this.started = started;
    }

    /** Only fixed internal tokens/numbers are accepted; no package names, paths or error text. */
    private static String token(String value) {
        return value != null && value.matches("[a-z0-9_]{1,28}") ? value : "invalid";
    }

    public synchronized String serialize(long elapsed) {
        return "CV1|b=" + build + "|p=" + pid + "|k=" + kind + "|q=" + sequence
                + "|t0=" + started + "|t=" + elapsed + "|r=" + revision
                + "|default=" + bit(placeholder) + "|g=" + bit(gate) + "|seen=" + bit(gateObserved) + "|s=" + token(phase)
                + "|w=" + token(wait) + "|n=" + lookups + "|ep=" + endpointMs
                + "|tx=" + token(transaction) + "|dt=" + transactionMs + "|cancel=" + bit(cancelled)
                + "|cleanup=" + token(cleanup) + "|cp=" + callerPid + "|a=" + attached
                + "|v=" + valid + "|c=" + changed + "|l=" + leases
                + "|ex=" + bit(exclude) + "|ap=" + bit(applied);
    }
    private static int bit(boolean value) { return value ? 1 : 0; }
}
