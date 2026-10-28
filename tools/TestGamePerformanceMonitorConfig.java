package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Monitor presets must survive disabled states, process restarts and invalid imports. */
public final class TestGamePerformanceMonitorConfig {
    private static int checks, presets;
    private static void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}

    public static void main(String[] args){
        String[] expected={"time","fps","network","battery","duration","battery_temperature","cpu_temperature","gpu_temperature","power"};
        require(Arrays.equals(expected,GamePerformanceMonitorConfig.items()),"Native items precede the four sensor readings");
        require(Arrays.equals(new String[]{"时间","FPS","网速","电量","游戏时长","电池温度","CPU 温度","GPU 温度","功耗"},GamePerformanceMonitorConfig.labels()),"Native items have unambiguous user labels");
        String[] copied=GamePerformanceMonitorConfig.items();copied[0]="unknown";
        String[] copiedLabels=GamePerformanceMonitorConfig.labels();copiedLabels[0]="changed";
        require(Arrays.equals(expected,GamePerformanceMonitorConfig.items()),"Callers cannot mutate the monitor inventory");
        require("时间".equals(GamePerformanceMonitorConfig.labels()[0]),"Callers cannot mutate the labels");
        Map<String,String> defaults=ConfigSchema.runtimeDefaults();
        require("0".equals(defaults.get(GameOptions.PERFORMANCE_MONITOR)),"Upgrade leaves native monitoring unmodified until enabled");
        require(GamePerformanceMonitorConfig.DEFAULT_ITEMS.equals(defaults.get(GameOptions.MONITOR_ITEMS)),"Upgrade retains all native items");
        require("50".equals(defaults.get(GameOptions.MONITOR_TRANSPARENCY)),"Initial transparency is 50 percent");
        for(String invalid:new String[]{""," ",",",",fps","fps,","fps,,battery","FPS","cpu","time,cpu","fps;time","fps\nbattery"})
            require(ConfigSchema.normalize(GameOptions.MONITOR_ITEMS,invalid)==null,"Malformed or unknown monitor preset rejected: "+invalid);
        require(GamePerformanceMonitorConfig.normalizeItems(null)==null,"Null item preset rejected");
        for(String invalid:new String[]{"-1","101","1.5","NaN","infinity",""," ","50%","2147483648"})
            require(ConfigSchema.normalize(GameOptions.MONITOR_TRANSPARENCY,invalid)==null,"Invalid transparency rejected: "+invalid);
        require(!GamePerformanceMonitorConfig.selected("fps","time")&&!GamePerformanceMonitorConfig.selected("fps","f"),"Selection requires exact item tokens");
        require(!GamePerformanceMonitorConfig.selected("unknown,fps","fps"),"Malformed item list cannot be partially enabled");

        // Every nonempty subset represents a real user choice, including one-item presets.
        for(int mask=1;mask<(1<<expected.length);mask++){
            List<String> selected=new ArrayList<>();
            for(int index=0;index<expected.length;index++)if((mask&(1<<index))!=0)selected.add(expected[index]);
            String canonical=String.join(",",selected);
            Collections.reverse(selected);
            String unordered=" "+String.join(" , ",selected)+" , "+selected.get(0)+" ";
            require(canonical.equals(ConfigSchema.normalize(GameOptions.MONITOR_ITEMS,unordered)),"Unordered duplicated selection preserves exactly the requested items: "+canonical);
            for(int index=0;index<expected.length;index++)
                require(GamePerformanceMonitorConfig.selected(canonical,expected[index])==((mask&(1<<index))!=0),"Selected items remain independent: "+canonical+" / "+expected[index]);
            for(int transparency:new int[]{0,50,100}){
                Map<String,String> values=new LinkedHashMap<>(defaults);
                values.put(GameOptions.MONITOR_ITEMS,canonical);
                values.put(GameOptions.MONITOR_TRANSPARENCY,String.valueOf(transparency));
                values.put(GameOptions.PERFORMANCE_MONITOR,"1");
                // Plugin qualification and appearance customisation have independent switches.
                values.put(GameOptions.PLUGINS,"0");
                ConfigSnapshot enabled=ConfigSnapshot.create(2+presets,1000+presets,values);
                require(enabled!=null,"Enabled preset accepted by atomic runtime snapshot");
                ConfigSnapshot restarted=ConfigSnapshot.parse(enabled.serialize());
                require(restarted!=null&&canonical.equals(restarted.get(GameOptions.MONITOR_ITEMS))
                        &&String.valueOf(transparency).equals(restarted.get(GameOptions.MONITOR_TRANSPARENCY)),"Process restart retains the selected items and exact transparency");
                require("0".equals(restarted.get(GameOptions.PLUGINS)),"Custom monitoring does not silently unlock other game plugins");
                values.put(GameOptions.PERFORMANCE_MONITOR,"0");
                ConfigSnapshot off=ConfigSnapshot.create(1002+presets,2000+presets,values);
                ConfigSnapshot restored=off==null?null:ConfigSnapshot.parse(off.serialize());
                require(restored!=null&&"0".equals(restored.get(GameOptions.PERFORMANCE_MONITOR))
                        &&canonical.equals(restored.get(GameOptions.MONITOR_ITEMS))
                        &&String.valueOf(transparency).equals(restored.get(GameOptions.MONITOR_TRANSPARENCY)),"Disabling persists both parameters for the next enable");
                presets++;
            }
        }
        Map<String,String> malformed=new LinkedHashMap<>(defaults);
        malformed.put(GameOptions.MONITOR_ITEMS,"fps,cpu");
        require(ConfigSnapshot.create(2000,3000,malformed)==null,"Snapshot import rejects an unknown item atomically");
        malformed.put(GameOptions.MONITOR_ITEMS,"fps");malformed.put(GameOptions.MONITOR_TRANSPARENCY,"101");
        require(ConfigSnapshot.create(2000,3000,malformed)==null,"Snapshot import rejects out-of-range transparency atomically");
        NativeFeatureGroups.Feature owner=null;
        for(NativeFeatureGroups.Section section:NativeFeatureGroups.forTarget("game"))for(NativeFeatureGroups.Feature feature:section.features)
            if(GameOptions.PERFORMANCE_MONITOR.equals(feature.id))owner=feature;
        require(owner!=null&&GameOptions.PERFORMANCE_MONITOR.equals(owner.toggleKey)
                &&owner.allKeys().equals(Arrays.asList(GameOptions.PERFORMANCE_MONITOR,GameOptions.MONITOR_TRANSPARENCY,GameOptions.MONITOR_MARGIN,GameOptions.MONITOR_PIN)),"Transparency and spacing belong to the real monitor switch");
        EnhancementOption itemsOption=null;
        for(EnhancementOption option:GameOptions.options())if(GameOptions.MONITOR_ITEMS.equals(option.key))itemsOption=option;
        require(itemsOption!=null&&itemsOption.kind==EnhancementOption.Kind.INTERNAL
                &&ConfigSchema.isRuntimeKey(GameOptions.MONITOR_ITEMS),"Custom checkbox selection remains a runtime-backed internal preset rather than a duplicate generic field");
        System.out.println("Game performance monitor: "+checks+" checks passed; "+presets+" enabled/disabled preset round trips");
    }
}
