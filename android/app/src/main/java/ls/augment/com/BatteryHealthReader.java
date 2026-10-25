package ls.augment.com;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;

/** On-device, bounded read-only sampling. No charging policy or counter is written. */
final class BatteryHealthReader {
    static final String COMMAND="for d in /sys/class/power_supply/*; do "
            +"[ -r \"$d/type\" ] || continue; IFS= read -r t < \"$d/type\"; "
            +"case \"$t\" in Battery|BMS) ;; *) continue;; esac; "
            +"for f in type charge_full charge_full_design energy_full energy_full_design cycle_count; do "
            +"if [ -r \"$d/$f\" ]; then IFS= read -r v < \"$d/$f\"; printf '%s|%s|%s\\n' \"$d\" \"$f\" \"$v\"; fi; done; done";
    static final class Sample {
        final String raw,access,note;final long at;
        Sample(String raw,String access,String note,long at){this.raw=raw;this.access=access;this.note=note;this.at=at;}
    }
    static Sample read(){
        String direct=readDirect();
        java.util.List<BatteryHealthData.Reading> readings=BatteryHealthData.parse(direct);
        if(!readings.isEmpty()&&readings.stream().allMatch(item->item.percent!=null))
            return finish(direct,"系统接口","");
        RootShell.Result root=RootShell.run(COMMAND,null,8,32768);
        boolean complete=root.isSuccess()&&(root.capture==null||root.capture.reliable());
        String raw=complete?root.output:direct;
        String note=complete?"":"部分电池数据需要 Root 读取，请在授权后重试。";
        if(root.timedOut)note="电池接口读取超时，请重试。";
        if(!complete)StartupDiagnostics.record("BATTERY_HEALTH_UNAVAILABLE","root_read:"+root.publicError(),null);
        if(complete&&BatteryHealthData.parse(raw).isEmpty())note="系统未提供可读取的电池容量接口。";
        return finish(raw,complete?"系统接口（Root 读取）":"系统接口",note);
    }
    private static Sample finish(String raw,String access,String note){
        java.util.List<BatteryHealthData.Reading> readings=BatteryHealthData.parse(raw);
        if(readings.isEmpty())StartupDiagnostics.record("BATTERY_HEALTH_UNAVAILABLE","missing:battery_power_supply",null);
        for(BatteryHealthData.Reading reading:readings){
            String missing=(reading.full==null?"full_capacity;":"")+(reading.design==null?"design_capacity;":"")
                    +(reading.cycles==null?"cycle_count;":"")+(reading.percent==null&&reading.full!=null&&reading.design!=null?"capacity_ratio;":"");
            StartupDiagnostics.record(missing.isEmpty()?"BATTERY_HEALTH_READ":"BATTERY_HEALTH_UNAVAILABLE",
                    "source="+reading.source+";full="+reading.full+";design="+reading.design+";unit="+("mAh".equals(reading.unit)?"uAh":"uWh")+";cycles="+reading.cycles+";missing="+missing,null);
        }
        return new Sample(raw,access,note,System.currentTimeMillis());
    }
    private static String readDirect(){
        StringBuilder text=new StringBuilder();
        try{
            File[] nodes=new File("/sys/class/power_supply").listFiles();if(nodes==null)return "";
            int count=0;
            for(File node:nodes){
                if(++count>32)break;
                if(!node.getName().matches("[A-Za-z0-9_.:-]{1,100}"))continue;
                for(String name:BatteryHealthData.FIELDS)try(FileInputStream stream=new FileInputStream(new File(node,name))){
                    byte[] bytes=stream.readNBytes(129);if(bytes.length>128)continue;
                    String value=new String(bytes,StandardCharsets.UTF_8).trim();
                    text.append(node.getPath()).append('|').append(name).append('|').append(value).append('\n');
                }catch(java.io.IOException|SecurityException unavailable){/* Missing fields stay unavailable. */}
            }
        }catch(SecurityException unavailable){return "";}
        return text.toString();
    }
    private BatteryHealthReader(){}
}
