package ls.augment.com;

/** Stable identity syntax only. This class grants no live display, task or allocation authority. */
public final class AtomicWorkbenchSlotDomain {
    public static final int LOW_POOL_SIZE = 4, POOL_SIZE = 8;
    private AtomicWorkbenchSlotDomain() { }
    public static boolean contains(int slot) { return slot >= 0 && slot < POOL_SIZE; }
    public static boolean high(int slot) { return slot >= LOW_POOL_SIZE && contains(slot); }

    static boolean highDisplayName(String name) {
        if(name==null) return false;
        java.util.regex.Matcher match=java.util.regex.Pattern.compile("DuoAtomic-[0-9]+-w([0-9]+)-[0-9a-f-]{36}").matcher(name);
        if(!match.matches()) return false;
        String slot=match.group(1);
        if(!slot.matches("[0-7]")) throw new IllegalArgumentException("recovery_slot_syntax");
        return high(Integer.parseInt(slot));
    }
}
