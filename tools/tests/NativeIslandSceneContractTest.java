package ls.augment.com.hook;

/** Contracts must accept older inherited/subclass APIs and reject incomplete shapes. */
public final class NativeIslandSceneContractTest {
    static class Panel { }
    static class ChildPanel extends Panel { }
    interface Listener { }
    static class Legacy {
        private ChildPanel panel;
        protected Panel getPanelIsland() { return panel; }
        public boolean isEnabled() { return true; }
        public void addCallback(Listener listener) { }
    }
    static class Newer extends Legacy {
        private int panelIndex;
        public ChildPanel specializedPanel() { return new ChildPanel(); }
        public void addCallback(String unsupported) { }
    }
    static class Missing {
        public String panel;
        public String isEnabled() { return "yes"; }
        public void addCallback(String unsupported) { }
    }
    static int checks;
    static void check(boolean value, String description) {
        checks++; if (!value) throw new AssertionError(description);
    }
    public static void main(String[] args) throws Exception {
        check(NativeIslandSceneContract.field(Newer.class, "panel", Panel.class) != null, "inherited panel field");
        check(NativeIslandSceneContract.field(Missing.class, "panel", Panel.class) == null, "reject wrong field type");
        check(NativeIslandSceneContract.field(Newer.class, "missing", Panel.class) == null, "absent field");
        check(NativeIslandSceneContract.method(Newer.class, "getPanelIsland", Panel.class) != null, "legacy inherited getter");
        check(NativeIslandSceneContract.method(Newer.class, "specializedPanel", Panel.class) != null, "panel subclass return");
        check(NativeIslandSceneContract.method(Missing.class, "isEnabled", boolean.class) == null, "reject nonboolean state");
        check(NativeIslandSceneContract.method(Newer.class, "isEnabled", boolean.class) != null, "inherited state method");
        check(NativeIslandSceneContract.method(Newer.class, "addCallback", void.class, Listener.class).getDeclaringClass() == Legacy.class,
                "listener overload must resolve to compatible ancestor");
        check(NativeIslandSceneContract.method(Missing.class, "addCallback", void.class, Listener.class) == null,
                "missing compatible listener stays native");
        check(NativeIslandSceneContract.method(Newer.class, "removeCallback", void.class, Listener.class) == null,
                "missing release interface fails closed");
        System.out.println("PASS NativeIslandSceneContract " + checks + " checks");
    }
}
