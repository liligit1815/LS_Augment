package ls.augment.com;

import java.util.*;

/** Phone-side workspace contract. Zero rows retains pre-workspace behavior. */
public final class StatusBarWorkspaceSpec {
    public static final String ROWS="ls_augment_statusbar_rows";
    public static final String ICONS="ls_augment_statusbar_icon_positions_v1";
    private final LinkedHashMap<String,StatusBarGridSpec.Item> items;
    private StatusBarWorkspaceSpec(LinkedHashMap<String,StatusBarGridSpec.Item> items){this.items=items;}
    public static StatusBarWorkspaceSpec empty(){return new StatusBarWorkspaceSpec(new LinkedHashMap<>());}
    public StatusBarGridSpec.Item get(String id){return items.get(id);}
    public Set<String> ids(){return Collections.unmodifiableSet(items.keySet());}
    public static boolean independentSlot(String id){return StatusBarIconCatalog.validId(id)&&!id.contains(".")&&!Arrays.asList("connectivity","dual_signal","mobile_data","system_activity","privacy","user_avatar","operator","carrier").contains(id);}
    public static String stableOrderKey(String node){
        String id=node;
        if(node.startsWith("system_icons@")){String[] parts=node.split("@",3);if(parts.length>1)id=parts[1];}
        if(node.contains("#icon:"))id=node.substring(node.indexOf("#icon:")+6);
        int rank=0;for(StatusBarIconCatalog.Icon icon:StatusBarIconCatalog.all()){if(icon.id.equals(id))return String.format(Locale.ROOT,"%03d:%s",rank,node);rank++;}
        return "999:"+id;
    }
    public StatusBarWorkspaceSpec with(String id,StatusBarGridSpec.Item item){
        if(!StatusBarIconCatalog.validId(id))throw new IllegalArgumentException("icon id");
        LinkedHashMap<String,StatusBarGridSpec.Item> next=new LinkedHashMap<>(items);
        if(item==null)next.remove(id);else next.put(id,item);return new StatusBarWorkspaceSpec(next);
    }
    public static StatusBarWorkspaceSpec parse(String raw){
        if(raw==null||raw.isEmpty())return empty();
        if(raw.length()>65536)return null;String[] rows=raw.split(";",-1);
        if(rows.length>257||!rows[0].equals("SI1"))return null;
        StatusBarWorkspaceSpec result=empty();
        try{for(int i=1;i<rows.length;i++){
            String[] p=rows[i].split(",",-1);if(p.length!=4||result.items.containsKey(p[0]))return null;
            result=result.with(p[0],new StatusBarGridSpec.Item(p[1],Integer.parseInt(p[2]),Integer.parseInt(p[3]),true));
        }}catch(IllegalArgumentException e){return null;}return result;
    }
    public String serialize(){if(items.isEmpty())return "";StringBuilder out=new StringBuilder("SI1");
        for(Map.Entry<String,StatusBarGridSpec.Item> e:items.entrySet()){StatusBarGridSpec.Item i=e.getValue();out.append(';').append(e.getKey()).append(',').append(i.zone).append(',').append(i.order).append(',').append(i.size);}return out.toString();}
    public static String effectiveValue(String key,String value,String rows){
        if(!"1".equals(rows))return value;
        if(ConfigSchema.STATUSBAR_CLOCK_ROWS.equals(key))return "1";
        if(Arrays.asList(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP).contains(key))return "0";
        if(ConfigSchema.STATUSBAR_NETWORK_DISPLAY.equals(key)&&"4".equals(value))return "3";
        return value;
    }
    public static StatusBarGridSpec.Item effectiveItem(StatusBarGridSpec.Item item,String rows){return !"1".equals(rows)?item:new StatusBarGridSpec.Item(item.zone.substring(0,1)+"S",item.order,item.size,item.visible);}
    public static StatusBarGridSpec effectiveGrid(StatusBarGridSpec grid,String rows){if(!"1".equals(rows))return grid;for(String id:StatusBarGridSpec.IDS)grid=grid.with(id,effectiveItem(grid.get(id),rows));return grid;}
    public static Map<String,String> preset(boolean dual){return preset(dual,Collections.emptyMap());}
    public static Map<String,String> preset(boolean dual,Map<String,String> source){
        Map<String,String> out=new LinkedHashMap<>();out.put(ConfigSchema.SYSTEMUI_MASTER,"1");out.put(ROWS,dual?"2":"1");
        out.put(StatusBarEditPolicy.KEY,StatusBarEditPolicy.full().serialize());
        for(String key:new String[]{ConfigSchema.STATUSBAR_HEIGHT_DP,ConfigSchema.STATUSBAR_LEFT_MARGIN_DP,ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP,ConfigSchema.STATUSBAR_TOP_MARGIN_DP,ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP})out.put(key,"0");
        out.put(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,dual?"2":"0");
        // Start with the proven two-row geometry, then define the workspace's
        // clock/notification/power arrangement. This is an applied layout, not
        // a constraint on subsequent individual edits.
        out.putAll(StatusBarPresets.values(dual?1:0));
        // A complete single-row preset retains artwork/fonts and unrelated
        // icon appearance; the legacy preset's style resets are not needed.
        out.remove(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE);out.remove(ConfigSchema.STATUSBAR_VPN_STYLE);
        out.put(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,dual?"2":"0");
        out.put(ConfigSchema.STATUSBAR_CLOCK_PATTERN,dual?"HH:mmIIE":"");
        out.put(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND,dual?"MM.ddN月e":"");
        out.put(ConfigSchema.STATUSBAR_CLOCK_LINE_SPACING_DP,"0");
        out.put(SystemUiOptions.PREFIX+"metrics_charging_only","0");
        out.put(SystemUiOptions.PREFIX+"metric_width_power","0");
        StatusBarGridSpec grid=StatusBarGridSpec.parse(out.get(ConfigSchema.STATUSBAR_GRID));
        grid=grid.with("battery",new StatusBarGridSpec.Item("RS",998,dual?11:0,true))
                .with("power",new StatusBarGridSpec.Item("R2",10,9,dual))
                .with("network",new StatusBarGridSpec.Item("RS",20,9,dual));
        if(!dual)grid=effectiveGrid(grid,"1");
        out.put(ConfigSchema.STATUSBAR_NETWORK_DISPLAY,dual?"4":"3");
        out.put(ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,dual?"1":"0");
        if(dual){out.put(SystemUiOptions.PREFIX+"network_hide_below_kb","0");out.put(SystemUiOptions.PREFIX+"network_width_dp","0");}
        out.put(ConfigSchema.STATUSBAR_GRID,grid.serialize());
        // Old per-icon placement/spacing must not override the preset's rows
        // or place another icon beyond its rightmost spanning battery.
        out.put(ICONS,"");out.put(StatusBarIconSpacingSpec.KEY,"");
        // The regular two-row choice reproduces the user's recorded phone
        // appearance, including internal icon geometry and text formatting.
        if(dual)StatusBarRegularDualPreset.applyTo(out);
        StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.parse(source.get(StatusBarVisibilitySpec.KEY));
        if(visibility==null)visibility=StatusBarVisibilitySpec.empty();
        for(String surface:new String[]{"all","main","lock","notification","control"})
            for(String id:dual?new String[]{"clock","notifications","power","network","battery","connectivity"}:new String[]{"clock","notifications","battery","wifi","mobile1","mobile2"})
                visibility=visibility.with(surface,id,false);
        out.put(StatusBarVisibilitySpec.KEY,visibility.serialize());
        return out;
    }
    public static boolean ownsKey(String key){
        if(key==null)return false;
        if(key.startsWith("ls_augment_statusbar_")||key.startsWith("ls_augment_notification_summary_")||ConfigSchema.SYSTEMUI_MASTER.equals(key))return true;
        for(EnhancementOption option:EnhancementCatalog.options())if("statusbar".equals(option.group)&&key.equals(option.key))return true;
        return false;
    }
    public static Map<String,String> reset(){
        Map<String,String> out=new LinkedHashMap<>();for(String key:ConfigSchema.keys())if(ownsKey(key))out.put(key,ConfigSchema.defaultValue(key));
        out.put(ConfigSchema.SYSTEMUI_MASTER,"0");out.put(ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,"0");out.put(ROWS,"1");
        return out;
    }
}
