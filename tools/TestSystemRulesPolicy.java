package ls.augment.com;
public final class TestSystemRulesPolicy {
    public static void main(String[] args){
        check(SystemRulesPolicy.audioSteps(15)==15,"media property is real steps, never multiplied by ten");
        check(SystemRulesPolicy.audioSteps(200)==200,"upper bound");
        check(SystemRulesPolicy.audioSteps(0)==1,"lower bound");
        for(int mode:new int[]{0,1,2,3,6})check(!SystemRulesPolicy.assistantPowerBehavior(mode),"native power action retained "+mode);
        check(SystemRulesPolicy.assistantPowerBehavior(4)&&SystemRulesPolicy.assistantPowerBehavior(5),"assistant actions redirected");
        check(SystemRulesPolicy.quietNotification(true,false),"unlocked interactive quiet");
        check(!SystemRulesPolicy.quietNotification(true,true),"locked notification retained");
        check(!SystemRulesPolicy.quietNotification(false,false),"screen-off notification retained");
        System.out.println("Framework volume scaling, power behavior and notification policy passed");
    }
    private static void check(boolean result,String message){if(!result)throw new AssertionError(message);}
}
