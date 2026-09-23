package ls.augment.com;

/** A fresh command has a live, single-use reservation. Disk records can only be queried. */
final class HideManualClient {
    interface Runner { RootShell.Result run(HideRootProtocol.Request request); }
    private final Runner runner;

    HideManualClient() { this(r -> RootShell.run(r.command(), null, 15, 1024)); }
    HideManualClient(Runner runner) { this.runner = java.util.Objects.requireNonNull(runner); }

    static final class Reservation {
        final RootHideManager.Target target;
        final boolean hidden;
        final String nonce;
        private final HideManualClient client;
        private int phase;
        private Reservation(HideManualClient client, RootHideManager.Target target, boolean hidden, String nonce) {
            this.client = client; this.target = target; this.hidden = hidden; this.nonce = nonce;
        }
    }

    Reservation prepare(RootHideManager.Target target, boolean hidden) {
        HideRootProtocol.Request request = request(target, hidden
                ? HideRootProtocol.Verb.PREPARE : HideRootProtocol.Verb.PREPARE_SHOW, null);
        HideRootProtocol.Reply reply = exchange(request);
        // The first authenticated PREPARE after boot starts asynchronous backend
        // initialization. NOT_READY proves no reservation/action was dispatched.
        // Wait only for that exact reply; never retry unknown or reserved commands.
        for (int attempt = 0; reply != null && reply.outcome == HideRootProtocol.Outcome.NOT_READY
                && attempt < 4; attempt++) {
            try { Thread.sleep(100L << attempt); }
            catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); return null; }
            reply = exchange(request);
        }
        return reply != null && reply.outcome == HideRootProtocol.Outcome.RESERVED
                ? new Reservation(this, target, hidden, reply.nonce) : null;
    }

    /** Called only after this command and nonce have been acknowledged by durable storage. */
    boolean arm(Reservation reservation) {
        if (reservation == null || reservation.client != this) return false;
        synchronized (reservation) {
            if (reservation.phase != 0) return false;
            reservation.phase = 1;
            return true;
        }
    }

    HideRootProtocol.Reply execute(Reservation reservation) {
        if (reservation == null || reservation.client != this) return null;
        synchronized (reservation) {
            if (reservation.phase != 1) return null;
            reservation.phase = 2; // Claim before invoking the transport, including exceptions/timeouts.
        }
        return exchange(request(reservation.target, reservation.hidden
                ? HideRootProtocol.Verb.HIDE : HideRootProtocol.Verb.SHOW, reservation.nonce));
    }

    void cancel(Reservation reservation) {
        if (reservation == null || reservation.client != this) return;
        synchronized (reservation) {
            if (reservation.phase == 2) return;
            reservation.phase = 2;
        }
        retireReserved(reservation.target, reservation.hidden, reservation.nonce);
    }

    /** Retires only an unused backend reservation; never sends or repeats its application action. */
    HideRootProtocol.Reply retireReserved(RootHideManager.Target target, boolean hidden, String nonce) {
        return exchange(request(target, hidden ? HideRootProtocol.Verb.CANCEL
                : HideRootProtocol.Verb.CANCEL_SHOW, nonce));
    }

    HideRootProtocol.Reply status(RootHideManager.Target target, boolean hidden, String nonce) {
        return exchange(request(target, hidden ? HideRootProtocol.Verb.STATUS
                : HideRootProtocol.Verb.SHOW_STATUS, nonce));
    }

    private HideRootProtocol.Reply exchange(HideRootProtocol.Request request) {
        try { return HideRootProtocol.parse(request, runner.run(request)); }
        catch (RuntimeException unknown) { return null; }
    }

    private static HideRootProtocol.Request request(RootHideManager.Target target,
            HideRootProtocol.Verb verb, String nonce) {
        if (target == null || !target.isBound()) throw new IllegalArgumentException("Unbound command target");
        return new HideRootProtocol.Request(verb, target.userId, target.userSerial, target.packageName, nonce);
    }
}
