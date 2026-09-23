package ls.augment.com;

import java.util.HashSet;

public final class TestSystemUiPolicy {
    private static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
    public static void main(String[] args){
        check(SystemUiPolicy.withSeconds("h:mm a").equals("h:mm:ss a"),"preserve 12-hour period");
        check(SystemUiPolicy.withSeconds("HH:mm:ss").equals("HH:mm:ss"),"avoid duplicate seconds");
        check(SystemUiPolicy.withSeconds("HH:mm 'seconds'").equals("HH:mm:ss 'seconds'"),"quoted s is literal");
        check(SystemUiPolicy.withSeconds("HH 'mm'").equals("HH 'mm'"),"do not insert into literals");
        check(SystemUiPolicy.withSeconds("HH:mm 'o''clock'").equals("HH:mm:ss 'o''clock'"),"escaped quote");
        check(SystemUiPolicy.batteryBand(19)==0&&SystemUiPolicy.batteryBand(20)==1,"20% boundary");
        check(SystemUiPolicy.batteryBand(50)==1&&SystemUiPolicy.batteryBand(51)==2,"50% boundary");
        check(SystemUiPolicy.batteryBand(79)==2&&SystemUiPolicy.batteryBand(80)==3,"80% boundary");
        check(SystemUiPolicy.nativeBatteryMode(0)==-1,"default must defer to ROM");
        check(SystemUiPolicy.nativeBatteryMode(6)==3,"hidden maps to native hidden mode");
        check(SystemUiPolicy.period(0).equals("凌晨")&&SystemUiPolicy.period(12).equals("中午")&&SystemUiPolicy.period(23).equals("晚上"),"period boundaries");
        check(SystemUiPolicy.networkRate(1024,3,0,true).equals("1.00K/s"),"network precision and unit");
        check(SystemUiPolicy.networkRate(1048576,3,0,false).equals("1.00M"),"automatic megabyte unit");
        check(SystemUiPolicy.networkRate(-1,3,1,false).equals("0.00KB"),"invalid counters cannot show negative speed");
        check(!SystemUiPolicy.hideNetwork(0,0,0),"zero disables threshold");
        check(SystemUiPolicy.hideNetwork(1023,10,1)&&!SystemUiPolicy.hideNetwork(1024,0,1),"threshold byte conversion boundary");
        HashSet<String> keys=new HashSet<>();
        for(EnhancementOption option:SystemUiOptions.options()){
            check(keys.add(option.key),"duplicate key "+option.key);
            check(option.normalize(option.defaultValue)!=null,"invalid default "+option.key);
            if(option.kind==EnhancementOption.Kind.BOOLEAN)check(option.defaultValue.equals("0"),"opt in default "+option.key);
        }
        System.out.println("SystemUI policy and option checks passed ("+keys.size()+" options)");
    }
}
