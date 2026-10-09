package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

public final class TestBluetoothFreeformConfig {
    private static void check(boolean ok,String reason){if(!ok)throw new AssertionError(reason);}
    public static void main(String[] args){
        Map<String,String> values=new LinkedHashMap<>(ConfigSchema.runtimeDefaults());
        for(String key:new String[]{ConfigSchema.FREEFORM_GAME_LOGIN,ConfigSchema.FREEFORM_EXTERNAL_APPS,
                ConfigSchema.STATUSBAR_BLUETOOTH_STYLE})check("0".equals(values.get(key)),"upgrade defaults: "+key);
        check("".equals(values.get(ConfigSchema.FREEFORM_GAME_APPS)),"empty manual game list");
        for(String style:new String[]{"0","1","2"}){
            values.put(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE,style);
            values.put(ConfigSchema.FREEFORM_GAME_LOGIN,"1");
            values.put(ConfigSchema.FREEFORM_EXTERNAL_APPS,"0");
            values.put(ConfigSchema.FREEFORM_GAME_APPS,"example.game,example.second");
            ConfigSnapshot snapshot=ConfigSnapshot.create(20,200,values);
            check(snapshot!=null,"snapshot creation");
            ConfigSnapshot restored=ConfigSnapshot.parse(snapshot.serialize());
            check(restored!=null&&style.equals(restored.get(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE)),"style round trip");
            check("1".equals(restored.get(ConfigSchema.FREEFORM_GAME_LOGIN))
                    &&"0".equals(restored.get(ConfigSchema.FREEFORM_EXTERNAL_APPS)),"independent launch switches");
            check(AppPackageSet.parse(restored.get(ConfigSchema.FREEFORM_GAME_APPS)).size()==2,"game list round trip");
        }
        check(ConfigSchema.normalize(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE,"capsule")==null,"invalid style rejected");
        System.out.println("Bluetooth/freeform config: defaults and snapshot round trips passed");
    }
}
