package ls.augment.com;

/** Pure policy shared by the event owner and the privileged execution boundary. */
public final class ScreenAutomationPolicy {
    private ScreenAutomationPolicy() { }

    public static boolean mayRun(boolean master, boolean automatic,
            boolean rootGranted, boolean screenOff) {
        return master && automatic && rootGranted && screenOff;
    }

    /** A screen-off epoch runs at most once, including configuration/boot retries. */
    public static final class Epoch {
        private boolean handled;

        public synchronized void screenOn() { handled = false; }
        public synchronized void failed() { handled = false; }

        public synchronized boolean claim(boolean enabled, boolean screenOff) {
            if (!screenOff) {
                handled = false;
                return false;
            }
            if (!enabled || handled) return false;
            handled = true;
            return true;
        }
    }
}
