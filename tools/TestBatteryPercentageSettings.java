package ls.augment.com;

public final class TestBatteryPercentageSettings {
    private static int checks;
    private static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
    public static void main(String[] args){
        for(String key:new String[]{BatteryPercentagePolicy.DIGITS,BatteryPercentagePolicy.RULE}){
            for(int v=0;v<=2;v++)check(Integer.toString(v).equals(ConfigSchema.normalize(key,Integer.toString(v))),"valid choice saves");
            for(String invalid:new String[]{"-1","3","1.5","NaN","all"})check(ConfigSchema.normalize(key,invalid)==null,"invalid choice rejected");
            check(StatusBarWorkspaceSpec.ownsKey(key),"editor persists and exports shared key");
            check(StatusBarWorkspaceSpec.reset().get(key).equals(ConfigSchema.defaultValue(key)),"reset shares defaults");
        }
        check(ConfigSchema.defaultValue(BatteryPercentagePolicy.DIGITS).equals("0"),"integer default");
        check(ConfigSchema.defaultValue(BatteryPercentagePolicy.RULE).equals("2"),"charge/discharge default");
        check(java.util.Arrays.equals(BatteryPercentagePolicy.RULE_LABELS,new String[]{"仅放电","仅充电","充放电"}),"no all-scenes option");
        System.out.println("Battery settings: "+checks+" checks");
    }
}
