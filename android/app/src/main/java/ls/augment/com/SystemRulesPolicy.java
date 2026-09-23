package ls.augment.com;

public final class SystemRulesPolicy {
    public static boolean assistantPowerBehavior(int behavior){return behavior==4||behavior==5;}
    public static int audioSteps(int steps){return Math.max(1,Math.min(200,steps));}
    public static boolean quietNotification(boolean interactive,boolean keyguardLocked){return interactive&&!keyguardLocked;}
    private SystemRulesPolicy(){}
}
