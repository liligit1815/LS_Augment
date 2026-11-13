package ls.augment.com;

import java.util.Set;
import java.util.TreeSet;

/** App-wide exclusions for ordinary notification cards, scoped to the Android user. */
public final class IslandNoticeBlacklist {
    public static final String KEY="ls_augment_rm_island_notice_blacklist";
    private final TreeSet<String> entries=new TreeSet<>();
    public static IslandNoticeBlacklist parse(String raw) {
        if(raw==null||raw.length()>16384)return null;
        IslandNoticeBlacklist result=new IslandNoticeBlacklist();
        if(raw.isEmpty())return result;
        for(String entry:raw.split(";",-1)) {
            String[] parts=entry.split("\\|",-1);
            if(parts.length!=2)return null;
            try {
                int user=Integer.parseInt(parts[0]);
                if(!IslandDownloadConfig.validApp(user,parts[1])||!entry.equals(user+"|"+parts[1])
                        ||!result.entries.add(entry)||result.entries.size()>128)return null;
            } catch(NumberFormatException invalid){return null;}
        }
        return result;
    }
    public static String normalize(String raw) {
        IslandNoticeBlacklist value=parse(raw);return value==null?null:String.join(";",value.entries);
    }
    public boolean contains(int user,String pkg){return entries.contains(user+"|"+pkg);}
    Set<String> packages(int user) {
        TreeSet<String> result=new TreeSet<>();String prefix=user+"|";
        for(String entry:entries)if(entry.startsWith(prefix))result.add(entry.substring(prefix.length()));
        return result;
    }
    String updated(int user,String packages) {
        String normalized=AppPackageSet.normalize(packages);if(normalized==null)return null;
        TreeSet<String> next=new TreeSet<>(entries);next.removeIf(entry->entry.startsWith(user+"|"));
        for(String pkg:AppPackageSet.parse(normalized))next.add(user+"|"+pkg);
        return normalize(String.join(";",next));
    }
}
