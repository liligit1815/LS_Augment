package ls.augment.com.hook;

/** Only engines which use message delays need the common Handler adapters. */
final class AiHandlerScope {
    private AiHandlerScope() { }

    static boolean scheduling(String packageName) {
        return "com.zte.game.plugintrigger".equals(packageName)
                || "cn.nubia.gameassist".equals(packageName);
    }

    static boolean dispatch(String packageName) {
        return "com.zte.game.plugintrigger".equals(packageName);
    }
}
