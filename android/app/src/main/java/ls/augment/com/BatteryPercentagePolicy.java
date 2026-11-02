package ls.augment.com;

import java.math.BigDecimal;
import java.math.RoundingMode;

/** One display policy; Android status 2/3 means actively charging/discharging. */
public final class BatteryPercentagePolicy {
    public static final String DIGITS="ls_augment_statusbar_battery_digits";
    public static final String RULE="ls_augment_statusbar_battery_digits_rule";
    public static final String[] RULE_LABELS={"仅放电","仅充电","充放电"};
    public static boolean matches(int rule,int status){
        return status==3&&(rule==0||rule==2)||status==2&&(rule==1||rule==2);
    }
    public static boolean validRaw(int raw,int level){
        // The inspected OEM ChargingView divides the event's capacity by 100.0.
        // Zero is its unavailable sentinel. Reject stale/different-cell readings.
        return raw>0&&raw<=10000&&level>=0&&level<=100&&Math.abs(raw-level*100)<=150;
    }
    public static String format(int level,int raw,int digits,int rule,int status){
        if(level<0||level>100)return "";
        if(digits<1||digits>2||!matches(rule,status)||!validRaw(raw,level))return Integer.toString(level);
        return BigDecimal.valueOf(raw,2).setScale(digits,RoundingMode.HALF_UP).toPlainString();
    }
    private BatteryPercentagePolicy(){}
}
