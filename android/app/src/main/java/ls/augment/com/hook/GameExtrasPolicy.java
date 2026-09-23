package ls.augment.com.hook;

/** Limits redirects to the feature that asked for a capability, not every game-mode reader. */
public final class GameExtrasPolicy {
    public static boolean callerContains(StackTraceElement[] stack,String suffix) {
        if(stack==null)return false;
        for(StackTraceElement frame:stack)if(frame.getClassName().endsWith(suffix)
                ||frame.getClassName().contains(suffix+"$"))return true;
        return false;
    }
    public static boolean recordingCaller(StackTraceElement[] stack,boolean chicken) {
        return callerContains(stack,".MainActivity")||callerContains(stack,".ScreenRecordService")
                ||callerContains(stack,".TopService")
                ||(chicken&&callerContains(stack,".I1"));
    }
    public static boolean isExplicitDismiss(String reason) {
        if(reason==null)return true;
        String lower=reason.toLowerCase(java.util.Locale.ROOT);
        return lower.contains("back")||lower.contains("outside")||lower.contains("touch")
                ||lower.contains("user")||lower.contains("screen_off")||lower.contains("destroy")
                ||lower.contains("exit_game");
    }
    public static boolean isAutomaticPanelDismiss(String reason) {
        if(reason==null||isExplicitDismiss(reason)||isModeConfirmationDismiss(reason))return false;
        String lower=reason.toLowerCase(java.util.Locale.ROOT);
        return lower.contains("biablo")||lower.contains("superresolution")
                ||lower.contains("super_resolution");
    }
    public static boolean isModeConfirmationDismiss(String reason) {
        return "showBiabloModeDialog".equals(reason);
    }
    public static boolean isModeConfirmationCaller(StackTraceElement[] stack) {
        if(stack==null)return false;
        for(StackTraceElement frame:stack) {
            if(frame.getClassName().equals("cn.nubia.gameassist.performance.PerformanceModeController")
                    &&(frame.getMethodName().equals("F0")
                        ||frame.getMethodName().equals("showBiabloModeDialog")))return true;
            if(frame.getClassName().equals("cn.nubia.gameassist.plugin.tiles.SuperResolutionTile"))return true;
        }
        return false;
    }
    public static int recordMode(int original,boolean fromManualRecord) {
        return fromManualRecord&&(original==1||original==5)?2:original;
    }
    private GameExtrasPolicy(){}
}
