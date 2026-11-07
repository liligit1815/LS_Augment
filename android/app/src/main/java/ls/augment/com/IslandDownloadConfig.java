package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.LinkedHashSet;
import java.util.Set;

/** User-scoped, exact notification channels. An empty selection never means all apps. */
public final class IslandDownloadConfig {
    public static final String ENABLED="ls_augment_rm_island_downloads";
    public static final String CHANNELS="ls_augment_rm_island_download_channels";
    public static final String DISCOVERED="ls_augment_island_download_channels";
    public static final int MAX_CHANNELS=32;
    private IslandDownloadConfig(){}
    public static String channel(int user,String pkg,String id){
        return channel(user,pkg,id,256);
    }
    static boolean validApp(int user,String pkg){
        return user>=0&&pkg!=null&&pkg.matches("[A-Za-z_][A-Za-z0-9_]*(\\.[A-Za-z_][A-Za-z0-9_]*)+");
    }
    static String channel(int user,String pkg,String id,int limit){
        if(!validApp(user,pkg)||id==null||id.isEmpty()||id.length()>limit)return "";
        return user+"|"+pkg+"|"+Base64.getUrlEncoder().withoutPadding().encodeToString(id.getBytes(StandardCharsets.UTF_8));
    }
    public static String[] parts(String key){
        return parts(key,256);
    }
    static String[] parts(String key,int limit){
        try{
            String[] p=key.split("\\|",-1);if(p.length!=3)return null;
            int user=Integer.parseInt(p[0]);String id=new String(Base64.getUrlDecoder().decode(p[2]),StandardCharsets.UTF_8);
            return channel(user,p[1],id,limit).equals(key)?new String[]{p[0],p[1],id}:null;
        }catch(RuntimeException invalid){return null;}
    }
    public static String normalize(String raw){
        if(raw==null||raw.length()>16384)return null;
        if(raw.isEmpty())return "";
        Set<String> keys=new LinkedHashSet<>();
        for(String key:raw.split(",",-1)){if(parts(key)==null)return null;keys.add(key);}
        return keys.size()<=MAX_CHANNELS?String.join(",",keys):null;
    }
    public static Set<String> selected(String raw){
        Set<String> keys=new LinkedHashSet<>();String value=normalize(raw);
        if(value!=null&&!value.isEmpty())java.util.Collections.addAll(keys,value.split(","));return keys;
    }
}
