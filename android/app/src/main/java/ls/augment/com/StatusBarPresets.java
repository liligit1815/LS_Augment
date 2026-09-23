package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Presets own only layout keys. OEM behaviours and unrelated settings survive. */
final class StatusBarPresets {
    static final String[] NAMES={"原生简洁","双排信息","性能监控"};
    static final String[] DESCRIPTIONS={
        "保留系统原生时钟与图标，只整理位置；暂停自定义硬件信息。",
        "双排日期时钟、通知、网速与三合一电池，隐藏硬件读数。",
        "单排时钟，第二排集中显示温度、电流和功率，保留通知与网速。"};
    private StatusBarPresets(){}
    static StatusBarGridSpec arrange(StatusBarGridSpec source){
        String[] zones={"L1","L1","R1","RS","L2","L2","L2","R2","R2","R2"};
        int[] orders={0,10,0,90,20,30,40,10,20,30};
        StatusBarGridSpec result=source;
        for(int i=0;i<StatusBarGridSpec.IDS.length;i++){
            String id=StatusBarGridSpec.IDS[i];StatusBarGridSpec.Item old=source.get(id);
            String zone=old.zone.endsWith("S")?zones[i].substring(0,1)+"S":zones[i];
            result=result.with(id,new StatusBarGridSpec.Item(zone,orders[i],old.size,old.visible));
        }
        return result;
    }
    static Map<String,String> values(int preset){
        if(preset<0||preset>=NAMES.length)throw new IllegalArgumentException("preset");
        Map<String,String> values=new LinkedHashMap<>();
        values.put(ConfigSchema.SYSTEMUI_MASTER,"1");
        values.put(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,preset==0?"1":"0");
        values.put(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,"2");
        for(String key:new String[]{ConfigSchema.STATUSBAR_HEIGHT_DP,ConfigSchema.STATUSBAR_LEFT_MARGIN_DP,ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP,ConfigSchema.STATUSBAR_TOP_MARGIN_DP,ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP})values.put(key,"0");
        values.put(ConfigSchema.STATUSBAR_CLOCK_ROWS,preset==1?"2":"1");
        values.put(ConfigSchema.STATUSBAR_CLOCK_CUSTOM,preset==0?"0":"1");
        values.put(ConfigSchema.STATUSBAR_CLOCK_PATTERN,"HH:mm");
        values.put(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND,preset==1?"MM/dd E":"");
        values.put(ConfigSchema.STATUSBAR_CLOCK_SIZE_SP,"0");
        values.put(ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP,"0");
        values.put(ConfigSchema.STATUSBAR_NOTIFICATION_HIDE,"0");
        values.put(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,"0");
        values.put(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,"0");
        values.put(ConfigSchema.STATUSBAR_NETWORK_DISPLAY,"3");
        values.put(ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,"0");
        values.put(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,preset==0?"0":"1");
        values.put(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE,"26");
        StatusBarGridSpec grid=arrange(StatusBarGridSpec.defaults());
        for(int i=0;i<StatusBarGridSpec.IDS.length;i++){
            String id=StatusBarGridSpec.IDS[i];StatusBarGridSpec.Item old=grid.get(id);
            boolean visible=i<4||preset==2||preset==1&&id.equals("network");
            String zone=preset==0?(i<2?"LS":"RS"):id.equals("clock")&&preset==1?"LS":id.equals("clock")?"L1":id.equals("notifications")?"L1":id.equals("system_icons")?"R1":old.zone;
            grid=grid.with(id,new StatusBarGridSpec.Item(zone,old.order,i<4?11:9,visible));
        }
        values.put(ConfigSchema.STATUSBAR_GRID,grid.serialize());return values;
    }
}
