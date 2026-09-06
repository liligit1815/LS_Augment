package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.*;

/** Per Android user and package, so a work/clone icon never changes the main-space icon. */
public final class LauncherOverrides {
    public static final class Entry {
        public final int user;public final String packageName,name,icon;
        public Entry(int user,String packageName,String name,String icon){
            if(user<0||user>99999||!packageName.matches("[A-Za-z0-9_]+(?:\\.[A-Za-z0-9_]+)+")
                    ||name.codePointCount(0,name.length())>80||name.codePoints().anyMatch(Character::isISOControl)
                    ||!(icon.isEmpty()||icon.matches("[0-9a-f]{64}")))throw new IllegalArgumentException("invalid launcher override");
            this.user=user;this.packageName=packageName;this.name=name.trim();this.icon=icon;
        }
        public String key(){return user+":"+packageName;}
    }
    private final SortedMap<String,Entry> entries;
    private LauncherOverrides(Map<String,Entry> values){entries=Collections.unmodifiableSortedMap(new TreeMap<>(values));}
    public static LauncherOverrides empty(){return new LauncherOverrides(Collections.emptyMap());}
    public Collection<Entry> entries(){return entries.values();}
    public Entry get(int user,String pkg){return entries.get(user+":"+pkg);}
    public LauncherOverrides with(Entry entry){TreeMap<String,Entry> all=new TreeMap<>(entries);if(entry.name.isEmpty()&&entry.icon.isEmpty())all.remove(entry.key());else all.put(entry.key(),entry);return new LauncherOverrides(all);}
    public String serialize(){StringBuilder out=new StringBuilder("LI1");for(Entry e:entries.values())out.append(';').append(e.key()).append('|').append(Base64.getUrlEncoder().withoutPadding().encodeToString(e.name.getBytes(StandardCharsets.UTF_8))).append('|').append(e.icon);return out.toString();}
    public static LauncherOverrides parse(String value){
        try{if(value==null||value.length()>65536)return null;if(value.isEmpty())return empty();String[] lines=value.split("[;\n]",-1);
            if(!lines[0].equals("LI1")||lines.length>501)return null;TreeMap<String,Entry> all=new TreeMap<>();
            for(int i=1;i<lines.length;i++){String[] parts=lines[i].split("\\|",-1);if(parts.length!=3)return null;int colon=parts[0].indexOf(':');if(colon<1)return null;
                Entry e=new Entry(Integer.parseInt(parts[0].substring(0,colon)),parts[0].substring(colon+1),new String(Base64.getUrlDecoder().decode(parts[1]),StandardCharsets.UTF_8),parts[2]);
                if(!e.key().equals(parts[0])||all.put(e.key(),e)!=null)return null;}
            return new LauncherOverrides(all);
        }catch(Exception e){return null;}
    }
}
