package ls.augment.com;

import java.util.*;

public final class TestNativeFeatureGroups {
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
    private static final Map<String,EnhancementOption> OPTIONS=new HashMap<>();
    private static int independent;
    public static void main(String[] args){
        for(EnhancementOption option:EnhancementCatalog.options())OPTIONS.put(option.key,option);
        Set<String> expected=new HashSet<>(),seen=new HashSet<>();
        for(HookAppCatalog.Target target:HookAppCatalog.targets()){
            Set<String> targetExpected=new HashSet<>(),targetActual=new HashSet<>();
            for(HookAppCatalog.Section s:HookAppCatalog.sections(target.id))for(EnhancementOption o:s.options){targetExpected.add(o.key);expected.add(o.key);}
            for(NativeFeatureGroups.Section section:NativeFeatureGroups.forTarget(target.id))for(NativeFeatureGroups.Feature f:section.features){check(f,seen);targetActual.addAll(f.allKeys());}
            require(targetExpected.equals(targetActual),"target ownership differs: "+target.id);
        }
        require(expected.equals(seen),"native options must be covered exactly once");
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
        require(independent==14,"all 14 independent value overrides retain their real no-op semantics");
        NativeFeatureGroups.Feature wifi=find("ls_augment_rm_wifi_country_enabled");
        require(wifi.allKeys().equals(Arrays.asList("ls_augment_rm_wifi_country_enabled","ls_augment_rm_wifi_country")),"Wi-Fi country is owned by its true switch");
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
        System.out.println("Native feature grouping and value gates: OK ("+seen.size()+" options)");
    }
    private static NativeFeatureGroups.Feature find(String key){for(NativeFeatureGroups.Section section:NativeFeatureGroups.SECTIONS)for(NativeFeatureGroups.Feature f:section.features)if(key.equals(f.toggleKey))return f;throw new AssertionError("missing feature "+key);}
    private static void check(NativeFeatureGroups.Feature f,Set<String> seen){
        if(f.toggleKey!=null){require(OPTIONS.get(f.toggleKey).kind==EnhancementOption.Kind.BOOLEAN,"parent must be a real boolean");require(seen.add(f.toggleKey),"duplicate switch "+f.toggleKey);}
        else{independent++;require(f.parameterKeys.length==1,"independent parameters cannot be accidentally grouped");EnhancementOption o=OPTIONS.get(f.parameterKeys[0]);require(o.normalize(f.noOpValue)!=null,"no-op must be a valid native value");require(!ValueOverrideState.active(f.comparison,o.defaultValue,f.noOpValue),"native default must not enable override");}
        for(String key:f.parameterKeys){require(OPTIONS.containsKey(key),"unknown key "+key);require(OPTIONS.get(key).kind!=EnhancementOption.Kind.BOOLEAN,"dependent booleans must be nested features");require(seen.add(key),"duplicate parameter "+key);}
        for(NativeFeatureGroups.Feature child:f.children)check(child,seen);
    }
}
