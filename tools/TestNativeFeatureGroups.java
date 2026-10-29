package ls.augment.com;

import java.util.*;

public final class TestNativeFeatureGroups {
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
    private static final Map<String,EnhancementOption> OPTIONS=new HashMap<>();
    private static int independent;
    public static void main(String[] args){
        for(EnhancementOption option:EnhancementCatalog.options()){
            OPTIONS.put(option.key,option);
            if(option.kind!=EnhancementOption.Kind.INTERNAL)require(!FeatureHelp.forOption(option).isEmpty(),"Every rendered control has help: "+option.key);
        }
        Set<String> expected=new HashSet<>(),seen=new HashSet<>();
        for(HookAppCatalog.Target target:HookAppCatalog.targets()){
            Set<String> targetExpected=new HashSet<>(),targetActual=new HashSet<>();
            for(HookAppCatalog.Section s:HookAppCatalog.sections(target.id))for(EnhancementOption o:s.options){targetExpected.add(o.key);expected.add(o.key);}
            for(NativeFeatureGroups.Section section:NativeFeatureGroups.forTarget(target.id))for(NativeFeatureGroups.Feature f:section.features){check(f,seen);targetActual.addAll(f.allKeys());}
            Set<String> missing=new HashSet<>(targetExpected);missing.removeAll(targetActual);
            Set<String> extra=new HashSet<>(targetActual);extra.removeAll(targetExpected);
            require(targetExpected.equals(targetActual),"target ownership differs: "+target.id+" missing="+missing+" extra="+extra);
        }
        require(expected.equals(seen),"native options must be covered exactly once");
        require(NativeFeatureGroups.forTarget("launcher").stream().filter(s->s.id.equals("dock_glass")).flatMap(s->s.features.stream()).anyMatch(f->f.toggleKey.equals(LauncherOptions.DOCK_UNLIMITED)),"Dock capacity switch belongs to the native Dock section");
        require(NativeFeatureGroups.forTarget("launcher").stream().filter(s->s.id.equals("launcher_grid")||s.id.equals("launcher")).flatMap(s->s.features.stream()).noneMatch(f->f.allKeys().contains(LauncherOptions.DOCK_UNLIMITED)),"Desktop layout and page sections do not duplicate the Dock capacity switch");
        require(!seen.contains(SystemOptions.key("thermal_notifications")),"retired thermal control must be absent");
        Set<String> destinations=new HashSet<>();
        for(NativeFeatureGroups.Section section:NativeFeatureGroups.forTarget("systemui"))if(section.id.equals("statusbar"))
            for(NativeFeatureGroups.Feature feature:section.features){
                String destination=NativeFeatureGroups.statusBarDestination(feature);
                require(Arrays.asList("layout","clock","network","metrics","icons","battery","notifications").contains(destination),"unreachable status setting: "+feature.id);
                destinations.add(destination);
            }
        require(destinations.size()==7,"all seven groups of related status settings remain reachable");
        require("battery".equals(NativeFeatureGroups.statusBarDestination(find("ls_augment_rm_battery_colors"))),"battery appearance stays with battery");
        require("notifications".equals(NativeFeatureGroups.statusBarDestination(find("ls_augment_rm_notification_native"))),"notification appearance stays with notifications");
        require("network".equals(NativeFeatureGroups.statusBarDestination(find("ls_augment_rm_network_custom"))),"network options stay together");
        require("息屏时钟".equals(NativeFeatureGroups.objectGroup(find("ls_augment_rm_aod_seconds"))),"AOD seconds stays with clock appearance");
        require("息屏时钟".equals(NativeFeatureGroups.objectGroup(find("ls_augment_rm_aod_period"))),"AOD period stays with clock appearance");
        require(independent==15,"all 15 independent value overrides retain their real no-op semantics");
        require("assets".equals(NativeFeatureGroups.statusBarDestination(find(StatusBarIconSpacingSpec.KEY))),"per-icon spacing belongs to its asset editor");
        NativeFeatureGroups.Feature wifi=find("ls_augment_rm_wifi_country_enabled");
        require(wifi.allKeys().equals(Arrays.asList("ls_augment_rm_wifi_country_enabled","ls_augment_rm_wifi_country")),"Wi-Fi country is owned by its true switch");
        NativeFeatureGroups.Feature radius=find(RecentsCardRadiusOptions.OFFSET);
        require(RecentsCardRadiusOptions.ENABLED.equals(radius.toggleKey)&&radius.allKeys().equals(Arrays.asList(RecentsCardRadiusOptions.ENABLED,RecentsCardRadiusOptions.OFFSET)),"Recent-task radius uses a real independent switch and one retained signed parameter");
        require(radius.hasConfiguration()&&OPTIONS.get(RecentsCardRadiusOptions.OFFSET).kind==EnhancementOption.Kind.INTEGER,"Recent-task radius expands into the shared signed integer editor");
        NativeFeatureGroups.Feature usb=find("ls_augment_rm_usb_hide_dialog");
        require(usb.children.length==1&&usb.children[0].toggleKey.equals("ls_augment_rm_usb_hide_notification_dialog"),"USB notification boolean stays inside its parent configuration");
        NativeFeatureGroups.Feature ota=find("ls_augment_rm_ota_spoof_enabled");
        require(ota.children.length==9&&ota.parameterKeys.length==0,"OTA has nine separately guarded fields");
        for(NativeFeatureGroups.Feature field:ota.children)require(field.parameterKeys.length==1&&field.toggleKey.equals(field.parameterKeys[0]+"_enabled"),"OTA field guard matches its own input");
        require(!ValueOverrideState.active("number","1","1.0"),"decimal equivalent default is off");
        require(!ValueOverrideState.active("number","100.0","100"),"opacity equivalent default is off");
        require(ValueOverrideState.active("number","0","100"),"transparent opacity is an active override");
        require(!ValueOverrideState.active("number","NaN","1"),"invalid numeric memory cannot enable a feature");
        require(!ValueOverrideState.active("nonEmptyCommaSeparatedTokens"," , , ",""),"empty icon tokens do not enable hiding");
        require(ValueOverrideState.active("nonEmptyCommaSeparatedTokens"," , vpn ",""),"one real slot enables hiding");
        EnhancementOption scale=OPTIONS.get("ls_augment_rm_lock_clock_scale");
        require("1.0".equals(ValueOverrideState.restore(scale,"99","1.0")),"invalid remembered scale falls back safely");
        require("1.5".equals(ValueOverrideState.restore(scale,"1.5","1.0")),"valid remembered scale restores exactly");
        EnhancementOption islandY=OPTIONS.get(SystemUiOptions.ISLAND_OFFSET_Y);
        require("0".equals(islandY.defaultValue)&&"-24".equals(islandY.normalize("-24"))&&"24".equals(islandY.normalize("24")),"island vertical position defaults to center and accepts both directions");
        require(islandY.normalize("-25")==null&&islandY.normalize("25")==null,"island vertical position rejects values outside its supported range");
        EnhancementOption transparent=OPTIONS.get(SystemUiOptions.ISLAND_TRANSPARENT);
        require(transparent.kind==EnhancementOption.Kind.CHOICE&&"0".equals(transparent.defaultValue),"island background defaults to the classic style");
        require(Arrays.equals(transparent.choices,new String[]{"经典黑色","透明","液态玻璃"}),"island background includes liquid glass");
        for(String valid:new String[]{"0","1","2"})require(valid.equals(transparent.normalize(valid)),"background style preserves legacy and glass values");
        for(String invalid:new String[]{"-1","3","glass",""})require(transparent.normalize(invalid)==null,"reject unknown background style");
        require(find(SystemUiOptions.ISLAND_TRANSPARENT).toggleKey.equals(SystemUiOptions.ISLAND),"island owns its style and keeps it behind the master switch");
        EnhancementOption appStyle=OPTIONS.get(SystemUiOptions.ISLAND_APP_STYLE);
        require(appStyle.kind==EnhancementOption.Kind.CHOICE&&"0".equals(appStyle.defaultValue),"island app style defaults to rounded square");
        require("灵动岛显示样式".equals(appStyle.title)&&Arrays.equals(appStyle.choices,new String[]{"圆角方形","圆形"}),"island app style exposes exactly the requested display choices");
        require("0".equals(appStyle.normalize("0"))&&"1".equals(appStyle.normalize("1")),"both island app display styles are valid");
        for(String invalid:new String[]{"-1","2","circle","true",""})require(appStyle.normalize(invalid)==null,"island app style rejects invalid value: "+invalid);
        NativeFeatureGroups.Feature island=find(SystemUiOptions.ISLAND_APP_STYLE);
        require("systemui:island_enabled".equals(island.id)&&SystemUiOptions.ISLAND.equals(island.toggleKey),"app display style belongs to the island feature and its master switch");
        System.out.println("Native feature grouping and value gates: OK ("+seen.size()+" options)");
    }
    private static NativeFeatureGroups.Feature find(String key){for(NativeFeatureGroups.Section section:NativeFeatureGroups.SECTIONS)for(NativeFeatureGroups.Feature f:section.features)if(f.allKeys().contains(key))return f;throw new AssertionError("missing feature "+key);}
    private static void check(NativeFeatureGroups.Feature f,Set<String> seen){
        if(f.toggleKey!=null){require(OPTIONS.get(f.toggleKey).kind==EnhancementOption.Kind.BOOLEAN,"parent must be a real boolean");require(seen.add(f.toggleKey),"duplicate switch "+f.toggleKey);}
        else{independent++;require(f.parameterKeys.length==1,"independent parameters cannot be accidentally grouped");EnhancementOption o=OPTIONS.get(f.parameterKeys[0]);require(o.normalize(f.noOpValue)!=null,"no-op must be a valid native value");require(!ValueOverrideState.active(f.comparison,o.defaultValue,f.noOpValue),"native default must not enable override");}
        for(String key:f.parameterKeys){
            require(OPTIONS.containsKey(key),"unknown key "+key);
            // The existing side-gesture editor owns its two mirror switches directly.
            boolean gestureMirror="systemui:back_icon_enabled".equals(f.id)
                    &&(key.equals(BackGestureIconPolicy.key(0,"mirror"))||key.equals(BackGestureIconPolicy.key(1,"mirror")));
            // The lock-swipe editor owns all subordinate switches under one master.
            boolean lockSwipe="liftarc:enabled".equals(f.id)&&key.startsWith("ls_augment_liftarc_");
            require(gestureMirror||lockSwipe||OPTIONS.get(key).kind!=EnhancementOption.Kind.BOOLEAN,"dependent boolean must be a nested feature: "+key);
            require(seen.add(key),"duplicate parameter "+key);
        }
        for(NativeFeatureGroups.Feature child:f.children)check(child,seen);
    }
}
