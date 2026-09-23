package ls.augment.com.hook;

public final class TestFanLevelCommand {
    public static void main(String[] args) {
        FanLevelCommand command = new FanLevelCommand();
        check(command, 3, 2, 0, FanLevelCommand.Action.WRITE);
        check(command, 3, 2, 1, FanLevelCommand.Action.WAIT);
        check(command, 3, 2, 900, FanLevelCommand.Action.WAIT);
        check(command, 3, 2, 2999, FanLevelCommand.Action.WAIT);
        check(command, 3, 3, 3000, FanLevelCommand.Action.READY);
        check(command, 3, 2, 3001, FanLevelCommand.Action.FAIL);
        command.reset();
        check(command, 1, 2, 4000, FanLevelCommand.Action.WRITE);
        check(command, 1, 2, 7000, FanLevelCommand.Action.FAIL);
        command.reset();
        check(command, 3, 2, 8000, FanLevelCommand.Action.WRITE);
        check(command, 1, 2, 8100, FanLevelCommand.Action.WRITE);
        check(command, 1, 3, 8200, FanLevelCommand.Action.WAIT);
        check(command, 1, 1, 8300, FanLevelCommand.Action.READY);
        command.reset();
        check(command, 3, 2, 9000, FanLevelCommand.Action.WRITE);
        check(command, 2, 2, 9100, FanLevelCommand.Action.WRITE);
        check(command, 2, 3, 9200, FanLevelCommand.Action.WAIT);
        check(command, 2, 2, 9300, FanLevelCommand.Action.READY);
        command.reset();
        check(command, 2, 2, 10000, FanLevelCommand.Action.READY);
        duration(command, 10000, 0);
        duration(command, 13000, 3000);
        check(command, 2, 2, 14000, FanLevelCommand.Action.READY);
        duration(command, 14000, 4000);
        command.reset();
        duration(command, 15000, 0);
        check(command, 3, 2, 20000, FanLevelCommand.Action.WRITE);
        check(command, 3, 2, 22500, FanLevelCommand.Action.WAIT);
        duration(command, 22500, 0);
        check(command, 3, 3, 23000, FanLevelCommand.Action.READY);
        duration(command, 23000, 0);
        duration(command, 25999, 2999);
        duration(command, 26000, 3000);
        check(command, 3, 2, 26000, FanLevelCommand.Action.FAIL);
        duration(command, 27000, 0);
        System.out.println("PASS TestFanLevelCommand: bounded ack, native takeover, superseded queue, confirmed-level dwell, reset");
    }

    private static void duration(FanLevelCommand command, long now, long expected) {
        long actual = command.confirmedDuration(now);
        if (actual != expected) throw new AssertionError(actual + " != " + expected);
    }

    private static void check(FanLevelCommand command, int target, int actual, long now,
                              FanLevelCommand.Action expected) {
        FanLevelCommand.Action result = command.observe(target, actual, now);
        if (result != expected) throw new AssertionError(expected + " != " + result);
    }
}
