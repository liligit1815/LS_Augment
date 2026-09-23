package ls.augment.com;

import java.text.SimpleDateFormat;
import java.util.Locale;

/** Unit-tested UI mappings; these values are not Android USB function bit masks. */
public final class ConnectionExtrasPolicy {
    public static final String[] PERIODS={"凌晨","早上","上午","中午","下午","傍晚","晚上"};
    private static final int[] HOURS={2,7,10,12,15,18,21};
    public static int usbMode(int choice){return choice>=0&&choice<4?new int[]{0,2,3,4}[choice]:-1;}
    public static int nfcScreenState(int original){return original==1||original==2||original==4?8:original;}
    public static int periodIndex(int hour){
        if(hour<0||hour>23)return -1;
        return hour<6?0:hour<9?1:hour<12?2:hour==12?3:hour<18?4:hour==18?5:6;
    }
    public static String period(int hour){int i=periodIndex(hour);return i<0?"":PERIODS[i];}
    public static int periodHour(int index){return index>=0&&index<HOURS.length?HOURS[index]:-1;}
    public static String time(int hour,int minute,boolean use24,String prefix){
        int displayHour=use24?hour:hour%12==0?12:hour%12;
        return (prefix==null?"":prefix)+period(hour)+" "+String.format(Locale.ROOT,"%02d:%02d",displayHour,minute);
    }
    public static String normalizeClockPattern(String value){
        if(value==null||value.isEmpty()||value.length()>80)return null;
        try{new SimpleDateFormat(value,Locale.ROOT);return value;}catch(IllegalArgumentException invalid){return null;}
    }
    private ConnectionExtrasPolicy(){}
}
