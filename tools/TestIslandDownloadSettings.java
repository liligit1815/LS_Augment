package ls.augment.com;
import java.util.*;
public final class TestIslandDownloadSettings {
    private static int checks;
    private static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    public static void main(String[] args){
        Map<String,EnhancementOption> options=new HashMap<>();for(EnhancementOption o:EnhancementCatalog.options())options.put(o.key,o);
        check("0".equals(options.get(IslandDownloadConfig.ENABLED).defaultValue),"downloads default disabled");
        check("".equals(options.get(IslandDownloadConfig.CHANNELS).defaultValue),"downloads select no channels by default");
        String token=IslandDownloadConfig.channel(0,"com.example.downloader","download,progress");
        check(token.equals(options.get(IslandDownloadConfig.CHANNELS).normalize(token)),"channel validation is wired to real option");
        check(options.get(IslandDownloadConfig.CHANNELS).normalize("*")==null,"config import cannot enable all channels by wildcard");
        for(String key:new String[]{IslandDownloadConfig.ENABLED,IslandDownloadConfig.CHANNELS}){
            int owners=0;
            for(NativeFeatureGroups.Section section:NativeFeatureGroups.SECTIONS)for(NativeFeatureGroups.Feature feature:section.features)
                if(feature.allKeys().contains(key)){owners++;check(SystemUiOptions.ISLAND.equals(feature.toggleKey),"existing Duo island owns download controls");}
            check(owners==1,"download key has exactly one page owner");
        }
        System.out.println("PASS download settings/catalog/import: "+checks+" checks");
    }
}
