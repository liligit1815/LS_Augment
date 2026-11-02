package ls.augment.com;

import java.util.*;

public final class TestComboButtonSizeSettings {
    static int checks;
    static void check(boolean ok,String text){checks++;if(!ok)throw new AssertionError(text);}
    public static void main(String[] args){
        String enabled=GameOptions.COMBO_BUTTON_SIZE_ENABLED,size=GameOptions.COMBO_BUTTON_SIZE;
        check("0".equals(ConfigSchema.defaultValue(enabled)),"opt in only");
        check("100".equals(ConfigSchema.defaultValue(size)),"default is native size");
        check(ConfigSchema.isRuntimeKey(enabled)&&ConfigSchema.isRuntimeKey(size),"both keys cross process");
        for(String valid:List.of("50","100","151","200"))check(valid.equals(ConfigSchema.normalize(size,valid)),"accepted "+valid);
        for(String invalid:List.of("49","201","75.5","NaN",""))check(ConfigSchema.normalize(size,invalid)==null,"reject "+invalid);
        Set<String> expected=new HashSet<>(),actual=new HashSet<>();
        for(HookAppCatalog.Section s:HookAppCatalog.sections("game"))for(EnhancementOption o:s.options)expected.add(o.key);
        for(NativeFeatureGroups.Section s:NativeFeatureGroups.forTarget("game"))for(NativeFeatureGroups.Feature f:s.features){
            actual.addAll(f.allKeys());
            if(enabled.equals(f.id))check("combo".equals(s.id)&&f.parameterKeys.length==1&&size.equals(f.parameterKeys[0]),"size belongs to combo fold");
        }
        check(expected.equals(actual),"game feature ownership complete");
        for(String key:List.of(enabled,size))check(HookAppCatalog.affectedPackages(key).equals(List.of("cn.nubia.gamehelpmodule")),"actual consuming process "+key);
        check(ComboButtonSizeConfig.maximum(100,80,1000,600)==200,"normal full range");
        check(ComboButtonSizeConfig.maximum(800,800,1000,600)==75,"integer screen bound");
        check(ComboButtonSizeConfig.maximum("1|800|800|1000|600|3.25",3.25f)==75,"shared editor calibration");
        check(ComboButtonSizeConfig.maximum("1|800|800|1000|600|3.25",2f)==0,"stale density rejected");
        check(ComboButtonSizeConfig.maximum("invalid",1)==0,"malformed calibration rejected");
        System.out.println("PASS combo size settings checks="+checks);
    }
}
