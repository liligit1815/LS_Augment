package ls.augment.com;

import java.util.HashSet;
import java.util.Set;

public final class TestNotificationLayoutPolicy {
    static int checks;
    static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
    static void near(float actual,float expected,String message){check(Math.abs(actual-expected)<.01f,message+": "+actual+" != "+expected);}
    public static void main(String[] args){
        near(NotificationLayoutPolicy.clockSize(64,24,0,120),64,"initial clock");
        near(NotificationLayoutPolicy.clockSize(64,24,120,120),24,"collapsed clock");
        near(NotificationLayoutPolicy.clockSize(64,24,-40,120),64,"overscroll must not grow clock");
        near(NotificationLayoutPolicy.clockSize(24,48,120,120),24,"compact size never enlarges clock");
        float previous=Float.MAX_VALUE;
        for(int scroll=0;scroll<=400;scroll++){
            float size=NotificationLayoutPolicy.clockSize(64,24,scroll,120);
            check(size<=previous&&size>=24&&size<=64,"continuous monotonic clock collapse");previous=size;
        }
        check(NotificationLayoutPolicy.shadeAllowed(0,false,false,true),"normal notification shade allowed");
        for(int state:new int[]{-1,1,2})check(!NotificationLayoutPolicy.shadeAllowed(state,false,false,true),"unknown, keyguard and shade-locked retain native layout");
        check(!NotificationLayoutPolicy.shadeAllowed(0,true,false,true)&&!NotificationLayoutPolicy.shadeAllowed(0,false,true,true)
                &&!NotificationLayoutPolicy.shadeAllowed(0,false,false,false),"doze, lockscreen transition and closed shade preserve native");
        Set<String> keys=new HashSet<>();
        for(EnhancementOption option:NotificationAppearanceOptions.options()){
            check(keys.add(option.key),"duplicate option key");check(option.normalize(option.defaultValue)!=null,"invalid default");
            if(option.kind==EnhancementOption.Kind.INTEGER){check(option.normalize("NaN")==null,"reject invalid integer");check(option.normalize(String.valueOf((int)option.maximum+1))==null,"reject value beyond real parameter bound");}
        }
        check(keys.contains(NotificationAppearanceOptions.CLOCK_PORTRAIT)&&keys.contains(NotificationAppearanceOptions.CLOCK_LANDSCAPE),"independent orientation master switches");
        check(!NotificationAppearanceOptions.clock(false,"size").equals(NotificationAppearanceOptions.clock(true,"size")),"orientation settings cannot overwrite each other");
        check(keys.contains(NotificationAppearanceOptions.STACK_SHADE)&&keys.contains(NotificationAppearanceOptions.STACK_LOCK),"shade and lock settings are independent");
        System.out.println("Notification policy "+checks+" checks: native scene exclusions, clock collapse, native scene rules and "+keys.size()+" valid independent options passed; cascade hooks tested separately");
    }
}
