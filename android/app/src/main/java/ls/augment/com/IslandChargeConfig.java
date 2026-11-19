package ls.augment.com;

/** Shared content and lifetime choices; no OEM class or device-name assumptions. */
public final class IslandChargeConfig {
    public static final String LEFT=SystemUiOptions.PREFIX+"island_charge_left";
    public static final String RIGHT=SystemUiOptions.PREFIX+"island_charge_right";
    public static final String DURATION=SystemUiOptions.PREFIX+"island_charge_duration";
    public static final String SECONDS=SystemUiOptions.PREFIX+"island_charge_seconds";
    public static final int ORIGINAL=0,POWER=1,VOLTAGE=2,CURRENT=3,LEVEL=4,TEMPERATURE=5;
    public static final int SYSTEM=0,CUSTOM=1,PERSISTENT=2;
    public static int mode(String value){return integer(value,0,0,5);}
    public static int duration(String value){return integer(value,0,0,2);}
    public static int seconds(String value){return integer(value,10,1,86400);}
    private static int integer(String value,int fallback,int min,int max){
        if(value==null||!value.matches("[0-9]{1,5}"))return fallback;
        try{int result=Integer.parseInt(value);return result>=min&&result<=max?result:fallback;}
        catch(NumberFormatException invalid){return fallback;}
    }
    private IslandChargeConfig(){}
}
