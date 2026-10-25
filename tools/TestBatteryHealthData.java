package ls.augment.com;

public final class TestBatteryHealthData {
    static int checks;
    static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    static String node(String name,String type,String fields){String root="/sys/class/power_supply/"+name+"|";return root+"type|"+type+"\n"+fields.replace("@",root);}
    static BatteryHealthData.Reading read(String fields){return BatteryHealthData.parse(node("battery","Battery",fields)).get(0);}
    public static void main(String[] args){
        BatteryHealthData.Reading measured=read("@charge_full|6842000\n@charge_full_design|8000000\n@cycle_count|187\n");
        check(Math.abs(measured.percent-85.525)<.0001,"Physical fixture estimates 85.525 percent");
        check(measured.full==6842000&&measured.design==8000000&&measured.cycles==187,"Original units and cycles retained");
        check("mAh".equals(measured.unit),"Charge unit is mAh after presentation conversion");
        check(read("@capacity|100\n@charge_counter|8000000\n@health|Good\n").percent==null,"Charge level, current counter and Good do not imply 100 percent health");
        for(String value:new String[]{"0","-1","bad","8000","9223372036854775807","1000000001"})
            check(read("@charge_full|6842000\n@charge_full_design|"+value+"\n").percent==null,"Reject missing/invalid/wrong-unit design: "+value);
        check(read("@charge_full|16000000\n@charge_full_design|8000000\n").percent==null,"Reject implausible capacity ratio");
        check(read("@charge_full|8200000\n@charge_full_design|8000000\n").percent==102.5,"Never silently cap learned capacity to 100 percent");
        check(read("@charge_full|4000000\n@energy_full_design|8000000\n").percent==null,"Never mix charge and energy units");
        BatteryHealthData.Reading energy=read("@energy_full|26000000\n@energy_full_design|30000000\n@cycle_count|0\n");
        check(energy.percent!=null&&"mWh".equals(energy.unit)&&energy.cycles==0,"Energy-only interface and zero cycles remain valid");
        check(read("@cycle_count|-1\n").cycles==null,"Missing cycle count is unavailable, not zero");
        String partial=node("battery","Battery","@charge_full|6842000\n");
        String other=node("bms","BMS","@charge_full_design|8000000\n");
        var separate=BatteryHealthData.parse(partial+other);
        check(separate.size()==2&&separate.get(0).percent==null&&separate.get(1).percent==null,"Different nodes cannot supply a misleading combined ratio");
        check(BatteryHealthData.parse(node("usb","USB","@charge_full|7000000\n@charge_full_design|8000000\n")).isEmpty(),"Ignore charger interfaces");
        check(BatteryHealthData.parse("/data/battery|type|Battery\n").isEmpty(),"Reject paths outside the power supply interface");
        check(BatteryHealthData.parse(null).isEmpty()&&BatteryHealthData.parse("x".repeat(32769)).isEmpty(),"Empty and oversized samples stay bounded");
        String route="group/system_settings/battery_health";
        check(ModuleHierarchy.path(route).equals(java.util.List.of("home","target-system_settings",route)),"Health detection stays at the third level");
        check(ModuleHierarchy.sections("system_settings").stream().anyMatch(section->section.route().equals(route)),"System settings exposes its navigation");
        check(ModuleHierarchy.restartScopes(ModuleHierarchy.group(route)).isEmpty(),"Read-only detection needs no process restart");
        System.out.println("Battery health: "+checks+" parsing, unit isolation, fallback and navigation checks passed");
    }
}
