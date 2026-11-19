package ls.augment.com;

import java.util.Locale;

/** Android-defined units. Net battery power is distinct from charger input power. */
public final class IslandBatteryReading {
    public final long at;
    public final boolean present,connected;
    public final int status;
    public final Double level,volts,amps,temperature,watts;
    public IslandBatteryReading(long at,boolean present,int plugged,int status,int level,int scale,
            int millivolts,int microamps,int deciCelsius){
        this.at=at;this.present=present;connected=present&&plugged>0;this.status=status;
        this.level=present&&level>=0&&scale>0&&level<=scale?level*100d/scale:null;
        volts=present&&millivolts>=1000&&millivolts<=30000?millivolts/1000d:null;
        amps=present&&microamps!=Integer.MIN_VALUE&&Math.abs((long)microamps)<=50_000_000?microamps/1_000_000d:null;
        temperature=present&&deciCelsius>=-500&&deciCelsius<=1500?deciCelsius/10d:null;
        watts=volts!=null&&amps!=null?volts*amps:null;
    }
    public static IslandBatteryReading unavailable(long at){
        return new IslandBatteryReading(at,false,0,0,-1,0,-1,Integer.MIN_VALUE,Integer.MIN_VALUE);
    }
    public boolean fresh(long now){return now>=at&&now-at<=5000;}
    public String text(int mode,long now){
        if(!fresh(now))return null;
        switch(mode){
            case IslandChargeConfig.POWER:return format(watts,2," W");
            case IslandChargeConfig.VOLTAGE:return format(volts,2," V");
            case IslandChargeConfig.CURRENT:return format(amps,3," A");
            case IslandChargeConfig.LEVEL:return format(level,0,"%");
            case IslandChargeConfig.TEMPERATURE:return format(temperature,1,"°C");
            default:return null;
        }
    }
    private static String format(Double value,int decimals,String unit){
        if(value==null||!Double.isFinite(value))return null;
        // Preserve the signed flow; never turn discharge into a positive charging reading.
        double rounded=Math.round(value*Math.pow(10,decimals))/Math.pow(10,decimals);
        return String.format(Locale.ROOT,"%."+decimals+"f",rounded==0?0:rounded)+unit;
    }
}
