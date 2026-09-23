package ls.augment.com;

public final class TestHiddenEntrySession {
    public static void main(String[] args) {
        HiddenEntrySession.lock();
        long now = 1_000L;
        for (int i = 0; i < 6; i++) {
            require(HiddenEntrySession.recordSystemVersionTap(now += 100L)
                    == HiddenEntrySession.TapResult.NONE, "first six taps stay silent");
        }
        require(HiddenEntrySession.recordSystemVersionTap(now += 100L)
                == HiddenEntrySession.TapResult.OPENED, "seventh tap opens entry");
        require(HiddenEntrySession.isUnlocked(), "entry is open in current session");

        for (int i = 0; i < 6; i++) {
            require(HiddenEntrySession.recordSystemVersionTap(now += 100L)
                    == HiddenEntrySession.TapResult.NONE, "open state still needs seven taps");
        }
        require(HiddenEntrySession.recordSystemVersionTap(now += 100L)
                == HiddenEntrySession.TapResult.ALREADY_OPEN, "open state is not toggled off");

        HiddenEntrySession.lock();
        require(!HiddenEntrySession.isUnlocked(), "leaving foreground locks entry");
        require(HiddenEntrySession.recordSystemVersionTap(now += 3_000L)
                == HiddenEntrySession.TapResult.NONE, "tap window resets after a pause");
        require(!HiddenEntrySession.isUnlocked(), "one new tap cannot reopen entry");
        HiddenEntrySession.lock();
        for(int i=0;i<7;i++)HiddenEntrySession.recordSystemVersionTap(now+=2_000L);
        require(HiddenEntrySession.isUnlocked(),"seven adjacent taps at exactly two seconds remain valid");
        HiddenEntrySession.lock();
        for(int i=0;i<6;i++)HiddenEntrySession.recordSystemVersionTap(now+=100L);
        HiddenEntrySession.recordSystemVersionTap(now+=2_001L);
        require(!HiddenEntrySession.isUnlocked(),"a gap above two seconds resets the sequence");
        HiddenEntrySession.lock();
        for(int i=0;i<6;i++)HiddenEntrySession.recordSystemVersionTap(now+=100L);
        HiddenEntrySession.recordSystemVersionTap(1L);
        require(!HiddenEntrySession.isUnlocked(),"a restarted monotonic clock does not complete an old sequence");
        System.out.println("Hidden entry session checks: OK");
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
