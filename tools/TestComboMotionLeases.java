package ls.augment.com.hook;

import java.io.Closeable;

public final class TestComboMotionLeases {
    private static int checks;
    private static void yes(boolean value, String message) { checks++; if (!value) throw new AssertionError(message); }
    private static final class Resource implements Closeable {
        int closes;
        @Override public void close() { closes++; }
    }
    public static void main(String[] args) throws Exception {
        ComboMotionLeases<Resource> leases = new ComboMotionLeases<>();
        Resource active = new Resource();
        var first = leases.register(active); Object player = new Object();
        yes(leases.duplicate(first.path, value -> value) == null, "unpublished token is unreadable");
        yes(leases.pin(player, first), "pin active playback");
        leases.retire(first);
        yes(active.closes == 0, "cache invalidation cannot close active playback");
        for (int i=0; i<100; i++) { Resource idle=new Resource(); var next=leases.register(idle); leases.retire(next); yes(idle.closes==1,"idle LRU closes once"); }
        yes(leases.duplicate(first.path, value -> value) == active, "active survives LRU churn");
        Resource replacement=new Resource(); var second=leases.register(replacement);
        yes(leases.pin(player,second), "new play replaces prior pin");
        yes(active.closes==1 && leases.duplicate(first.path,value -> value)==null,"superseded retired token released");
        leases.retire(second); leases.release(player); leases.release(player); leases.retire(second);
        yes(replacement.closes==1,"cancel/release idempotent");
        yes(!leases.pin(player,second),"cannot republish closed descriptor");
        ComboMotionLeases<Resource> bounded=new ComboMotionLeases<>();
        for(int i=0;i<32;i++) yes(bounded.register(new Resource())!=null,"bounded cache slot");
        Resource excess=new Resource(); yes(bounded.register(excess)==null&&excess.closes==1,"capacity fail closes refused resource");
        ComboMotionLeases<Resource> players=new ComboMotionLeases<>();
        for(int i=0;i<4;i++) yes(players.pin(new Object(),players.register(new Resource())),"bounded live player");
        yes(!players.pin(new Object(),players.register(new Resource())),"refuse fifth live player without evicting active");
        System.out.println("PASS combo private FD leases: "+checks+" checks");
    }
}
