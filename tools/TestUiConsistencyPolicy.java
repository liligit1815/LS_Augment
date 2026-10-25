package ls.augment.com;

import java.util.*;

public final class TestUiConsistencyPolicy {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public static void main(String[] args){
        for(String metric:new String[]{"temperature","current","voltage","power"}){
            String key=SystemUiOptions.PREFIX+"lock_charge_show_"+metric;
            check("0".equals(ConfigSchema.defaultValue(key)),"charge data is opt in: "+metric);
            check("1".equals(ConfigSchema.normalize(key,"true")),"charge display switch publishes a Boolean");
            check(ConfigSchema.normalize(SystemUiOptions.PREFIX+"lock_charge_hide_"+metric,"1")!=null,"old exports remain readable");
        }
        String p="ls_augment_rm_recents_memory_";
        String[][] defaults={{"style","0"},{"content","5"},{"color_mode","1"},{"portrait_top","50"},{"portrait_left","220"},{"landscape_top","28"},{"landscape_left","660"}};
        for(String[] pair:defaults)check(pair[1].equals(ConfigSchema.defaultValue(p+pair[0])),"memory default "+pair[0]);
        check(FreeformLaunchPolicy.shouldOpen(true,false,"example.reader","example.oauth",true,true,true,true,false,false,true,false,false),"non-game login opens a window");
        check(!FreeformLaunchPolicy.shouldOpen(true,false,"example.reader","example.other",true,true,true,true,false,false,false,false,false),"ordinary cross-app launch stays unchanged");
        check(!FreeformLaunchPolicy.shouldOpen(true,false,"example.oauth","example.reader",true,true,true,true,false,false,true,false,true),"login result return stays native");
        check(!FreeformLaunchPolicy.shouldOpen(true,false,"example.reader","example.oauth",false,true,true,true,false,false,true,false,false),"background caller cannot redirect");
        check(!FreeformLaunchPolicy.shouldOpen(true,false,"example.reader","example.oauth",true,true,true,true,false,false,true,true,false),"excluded apps stay native");
        for(EnhancementOption option:EnhancementCatalog.options()){
            check(!option.title.contains("垂直"),"direction label: "+option.key);
            check(!option.title.startsWith("充电详情隐藏"),"retired inverse charge switch has no UI");
            check(option.normalize(option.defaultValue)!=null,"valid default: "+option.key);
        }
        System.out.println("PASS UI consistency policy: "+checks+" checks");
    }
}
