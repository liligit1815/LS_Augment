package ls.augment.com;

import java.util.*;

/** Notification meaning, independent of layout and source permission. */
public final class IslandTemplateRules {
    public static final String KEY="ls_augment_rm_island_template_rules";
    public static final int INHERIT=0,AUTO=1,TEXT=2,PROGRESS=3,COUNT=4;
    private final TreeMap<String,Integer> values=new TreeMap<>();
    public static String key(int user,String pkg,String channel){
        if(user<0||user>21474||pkg==null||channel==null||channel.length()>1000)return "";
        if(pkg.isEmpty())return channel.isEmpty()?user+"||":"";
        if(!IslandDownloadConfig.validApp(user,pkg))return "";
        return channel.isEmpty()?user+"|"+pkg+"|":IslandNoticeRules.channel(user,pkg,channel);
    }
    public static String[] parts(String key){
        try{
            String[] p=key.split("\\|",-1);if(p.length!=3)return null;
            String channel=p[2].isEmpty()?"":IslandNoticeRules.parts(key)[2];
            return key.equals(key(Integer.parseInt(p[0]),p[1],channel))?new String[]{p[0],p[1],channel}:null;
        }catch(RuntimeException invalid){return null;}
    }
    public static IslandTemplateRules parse(String raw){
        if(raw==null||raw.length()>16384)return null;IslandTemplateRules rules=new IslandTemplateRules();
        if(raw.isEmpty())return rules;
        for(String row:raw.split(",",-1)){
            if(row.length()<2)return null;int mode=row.charAt(0)-'0';String key=row.substring(1);
            if(mode<AUTO||mode>COUNT||parts(key)==null||rules.values.put(key,mode)!=null||rules.values.size()>128)return null;
        }return rules;
    }
    public static String normalize(String raw){IslandTemplateRules r=parse(raw);return r==null?null:r.encode();}
    public int mode(String key){return values.getOrDefault(key,INHERIT);}
    public int resolve(int user,String pkg,String channel){
        if(key(user,pkg,channel).isEmpty())return AUTO;
        for(String key:new String[]{key(user,pkg,channel),key(user,pkg,""),key(user,"","")}){
            int value=mode(key);if(value!=INHERIT)return value;
        }return AUTO;
    }
    public Set<String> keys(){return Collections.unmodifiableSet(values.keySet());}
    public String updated(String key,int mode){
        if(parts(key)==null||mode<INHERIT||mode>COUNT)return null;
        IslandTemplateRules copy=new IslandTemplateRules();copy.values.putAll(values);
        if(mode==INHERIT)copy.values.remove(key);else copy.values.put(key,mode);
        String raw=copy.encode();return copy.values.size()<=128&&raw.length()<=16384?raw:null;
    }
    private String encode(){StringJoiner rows=new StringJoiner(",");values.forEach((key,value)->rows.add(value+key));return rows.toString();}
}
