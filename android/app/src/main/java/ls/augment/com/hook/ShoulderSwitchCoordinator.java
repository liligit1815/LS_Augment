package ls.augment.com.hook;

import ls.augment.com.ShoulderQuickSwitchPolicy.CaseRef;

/** One owner, one latest intent. Old completions cannot apply a superseded scheme. */
final class ShoulderSwitchCoordinator {
    enum Phase { PERSISTING, APPLYING, APPLIED, FAILED, CANCELLED }

    static final class Ticket {
        final long sequence;
        final CaseRef previous;
        final CaseRef target;
        volatile Phase phase = Phase.PERSISTING;
        Ticket(long sequence, CaseRef previous, CaseRef target) {
            this.sequence = sequence;
            this.previous = previous;
            this.target = target;
        }
    }

    private long sequence;
    private Ticket current;

    synchronized Ticket begin(CaseRef previous, CaseRef target) {
        if (previous == null || target == null || previous.userId != target.userId
                || !previous.gamePackage.equals(target.gamePackage)) {
            throw new IllegalArgumentException("incompatible shoulder selection");
        }
        if (current != null) current.phase = Phase.CANCELLED;
        return current = new Ticket(++sequence, previous, target);
    }

    synchronized Ticket current() { return current; }

    synchronized CaseRef logicalCurrent(CaseRef fallback) {
        return current == null ? fallback : current.target;
    }

    synchronized boolean isLatest(Ticket ticket) {
        return current == ticket && ticket != null
                && ticket.phase != Phase.CANCELLED && ticket.phase != Phase.FAILED;
    }

    synchronized boolean beginApply(Ticket ticket) {
        if (!isLatest(ticket) || ticket.phase != Phase.PERSISTING) return false;
        ticket.phase = Phase.APPLYING;
        return true;
    }

    synchronized boolean complete(Ticket ticket) {
        if (!isLatest(ticket) || ticket.phase != Phase.APPLYING) return false;
        ticket.phase = Phase.APPLIED;
        current = null;
        return true;
    }

    synchronized boolean fail(Ticket ticket) {
        if (!isLatest(ticket)) return false;
        ticket.phase = Phase.FAILED;
        current = null;
        return true;
    }

    synchronized void cancel() {
        if (current != null) current.phase = Phase.CANCELLED;
        current = null;
        sequence++;
    }
}
