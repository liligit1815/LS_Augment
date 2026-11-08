package ls.augment.com.step;

import java.util.HashSet;

/** Submitted preview writes must drain before another process restores their parents. */
final class PreviewFrames {
    private final HashSet<Long> pending=new HashSet<>();
    private long sequence;
    private boolean sealed;
    synchronized long add() {
        if(sealed)throw new IllegalStateException("preview writes stopped");
        long ticket=++sequence;pending.add(ticket);return ticket;
    }
    synchronized void commit(long ticket) {pending.remove(ticket);}
    synchronized void seal() {sealed=true;}
    synchronized boolean ready() {return sealed && pending.isEmpty();}
    synchronized int pending() {return pending.size();}
}
