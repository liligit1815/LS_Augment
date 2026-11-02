package ls.augment.com;
import java.util.*;
public final class TestCleanupIconSettings {
    static int checks;
    static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
    public static void main(String[] args){
        String hash="a".repeat(64);
        check("".equals(ConfigSchema.normalize(LauncherOptions.CLEANUP_ICON,"")),"default reset valid");
        check(hash.equals(ConfigSchema.normalize(LauncherOptions.CLEANUP_ICON,hash)),"image digest valid");
        check(ConfigSchema.normalize(LauncherOptions.CLEANUP_ICON,"content://foreign/image")==null,"raw external URI rejected");
        check(ConfigSchema.normalize(LauncherOptions.CLEANUP_ICON,"../image.png")==null,"path rejected");
        check("0".equals(ConfigSchema.normalize(LauncherOptions.CLEANUP_ICON_STYLE,"0"))&&"1".equals(ConfigSchema.normalize(LauncherOptions.CLEANUP_ICON_STYLE,"1")),"two supported styles");
        check(ConfigSchema.normalize(LauncherOptions.CLEANUP_ICON_STYLE,"2")==null,"unknown style rejected");
        EnhancementOption style=EnhancementCatalog.options().stream().filter(o->o.key.equals(LauncherOptions.CLEANUP_ICON_STYLE)).findFirst().orElseThrow();
        check(Arrays.equals(style.choices,new String[]{"C17样式","自定义"})&&style.defaultValue.equals("0"),"requested dropdown order and default");
        long owners=NativeFeatureGroups.forTarget("launcher").stream().flatMap(s->s.features.stream())
            .filter(f->f.allKeys().contains(LauncherOptions.CLEANUP_ICON)&&f.allKeys().contains(LauncherOptions.CLEANUP_STYLE)
                &&f.allKeys().contains(LauncherOptions.CLEANUP_ICON_STYLE)&&LauncherOptions.CLEANUP_BOMB.equals(f.toggleKey)).count();
        check(owners==1,"icon and animation belong to same existing cleanup control");
        check(EnhancementCatalog.options().stream().filter(o->o.key.equals(LauncherOptions.CLEANUP_ICON)).count()==1,"one visible icon setting");
        System.out.println("PASS cleanup settings: "+checks+" checks");
    }
}
