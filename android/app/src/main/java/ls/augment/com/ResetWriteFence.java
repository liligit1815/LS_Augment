package ls.augment.com;

/** Invalidates pre-reset editor drafts and blocks concurrent configuration writers. */
final class ResetWriteFence {
    private static volatile long generation;
    private static volatile Thread owner;
    private ResetWriteFence() { }
    static synchronized void begin() {
        if (owner != null) throw new IllegalStateException("已有重置正在进行");
        owner = Thread.currentThread(); generation++;
    }
    static synchronized void end() { if (owner == Thread.currentThread()) { generation++; owner = null; } }
    static long generation() { return generation; }
    static boolean active() { return owner != null; }
    static boolean owns() { return owner == Thread.currentThread(); }
    static boolean blocked() { Thread thread = owner; return thread != null && thread != Thread.currentThread(); }
    static boolean stale(long editorGeneration) { return blocked() || editorGeneration != generation; }
}
