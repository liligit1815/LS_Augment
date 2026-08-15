package ls.augment.com;

public final class TestHiddenEntrySession {
    public static void main(String[] args) {
        HiddenEntrySession.lock();
        long now = 1_000L;
        for (int i = 0; i < 6; i++) {
            require(HiddenEntrySession.recordVersionTap(now += 100L)
                    == HiddenEntrySession.TapResult.NONE, "first six taps stay silent");
        }
        require(HiddenEntrySession.recordVersionTap(now += 100L)
                == HiddenEntrySession.TapResult.OPENED, "seventh tap opens entry");
        require(HiddenEntrySession.isUnlocked(), "entry is open in current session");

        for (int i = 0; i < 6; i++) {
            require(HiddenEntrySession.recordVersionTap(now += 100L)
                    == HiddenEntrySession.TapResult.NONE, "open state still needs seven taps");
        }
        require(HiddenEntrySession.recordVersionTap(now += 100L)
                == HiddenEntrySession.TapResult.ALREADY_OPEN, "open state is not toggled off");

        HiddenEntrySession.lock();
        require(!HiddenEntrySession.isUnlocked(), "leaving foreground locks entry");
        require(HiddenEntrySession.recordVersionTap(now += 3_000L)
                == HiddenEntrySession.TapResult.NONE, "tap window resets after a pause");
        require(!HiddenEntrySession.isUnlocked(), "one new tap cannot reopen entry");
        System.out.println("Hidden entry session checks: OK");
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
