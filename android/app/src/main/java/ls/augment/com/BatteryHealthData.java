package ls.augment.com;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Linux power_supply charge values are microamp-hours; never substitute current SOC/counter.
 * See https://docs.kernel.org/power/power_supply_class.html . */
final class BatteryHealthData {
    static final String[] FIELDS={"type","charge_full","charge_full_design","energy_full","energy_full_design","cycle_count"};
    static final class Reading {
        final String source,unit,reason;
        final Long full,design,cycles;
        final Double percent;
        Reading(String source,Map<String,String> fields){
            this.source=source;
            Long charge=capacity(fields.get("charge_full")),chargeDesign=capacity(fields.get("charge_full_design"));
            Long energy=capacity(fields.get("energy_full")),energyDesign=capacity(fields.get("energy_full_design"));
            boolean useEnergy=(charge==null||chargeDesign==null)&&energy!=null&&energyDesign!=null;
            full=useEnergy?energy:charge;design=useEnergy?energyDesign:chargeDesign;unit=useEnergy?"mWh":"mAh";
            Long count=number(fields.get("cycle_count"));cycles=count!=null&&count>=0&&count<=100000?count:null;
            double ratio=full==null||design==null?Double.NaN:full*100d/design;
            percent=Double.isFinite(ratio)&&ratio>0&&ratio<=150?ratio:null;
            reason=percent!=null?"":full==null||design==null?"系统未提供有效的满充容量和设计容量，无法估算健康度":"容量数据比例异常，无法估算健康度";
        }
    }
    static List<Reading> parse(String raw){
        Map<String,Map<String,String>> nodes=new LinkedHashMap<>();
        if(raw==null||raw.length()>32768)return new ArrayList<>();
        for(String line:raw.split("\\r?\\n")){
            String[] parts=line.trim().split("\\|",-1);
            if(parts.length!=3||!parts[0].matches("/sys/class/power_supply/[A-Za-z0-9_.:-]{1,100}")
                    ||!java.util.Arrays.asList(FIELDS).contains(parts[1])||parts[2].length()>128)continue;
            if(!nodes.containsKey(parts[0])&&nodes.size()>=32)continue;
            nodes.computeIfAbsent(parts[0],key->new LinkedHashMap<>()).put(parts[1],parts[2]);
        }
        List<Reading> result=new ArrayList<>();
        for(Map.Entry<String,Map<String,String>> node:nodes.entrySet()){
            String type=node.getValue().get("type");
            if("Battery".equalsIgnoreCase(type)||"BMS".equalsIgnoreCase(type))result.add(new Reading(node.getKey(),node.getValue()));
        }
        return result;
    }
    private static Long capacity(String value){Long number=number(value);return number!=null&&number>=100000&&number<=1000000000?number:null;}
    private static Long number(String value){try{return value!=null&&value.matches("[0-9]{1,12}")?Long.parseLong(value):null;}catch(NumberFormatException ignored){return null;}}
    private BatteryHealthData(){}
}
