package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/** Bounded active downloads. Source progress/ongoing/removal are authoritative; text never supplies state. */
public final class IslandDownloadPolicy<T> {
    public static final int MAX_ACTIVE=32;
    public static final class Entry<T> {
        public final String key,channel;
        public final int uid,percent;
        public final long postedAt,revision;
        public final boolean indeterminate;
        public final T source;
        Entry(String key,String channel,int uid,long postedAt,long revision,int percent,boolean indeterminate,T source){
            this.key=key;this.channel=channel;this.uid=uid;this.postedAt=postedAt;this.revision=revision;
            this.percent=percent;this.indeterminate=indeterminate;this.source=source;
        }
    }
    private final Map<String,Entry<T>> entries=new LinkedHashMap<>();
    private static final class Stamp {
        final int uid;final long time;final boolean ended;
        Stamp(int uid,long time,boolean ended){this.uid=uid;this.time=time;this.ended=ended;}
    }
    private final Map<String,Stamp> history=new LinkedHashMap<>();
    private long revision;
    public static boolean progress(boolean indeterminate,int progress,int maximum){
        return indeterminate||maximum>0&&progress>=0&&progress<=maximum;
    }
    public boolean update(String key,String channel,int uid,long postedAt,boolean ongoing,
            boolean indeterminate,int progress,int maximum,T source){
        Entry<T> previous=entries.get(key);Stamp last=history.get(key);
        if(last!=null&&(uid!=last.uid||postedAt<last.time||postedAt==last.time&&last.ended))return false;
        if(!ongoing||!progress(indeterminate,progress,maximum)||!indeterminate&&progress==maximum){
            remember(key,new Stamp(uid,postedAt,true));
            return entries.remove(key)!=null;
        }
        if(previous==null&&entries.size()>=MAX_ACTIVE)return false;
        remember(key,new Stamp(uid,postedAt,false));
        int percent=indeterminate?-1:(int)((long)progress*100/maximum);
        entries.put(key,new Entry<>(key,channel,uid,postedAt,++revision,percent,indeterminate,source));return true;
    }
    public boolean remove(String key,int uid,long postedAt){
        Entry<T> entry=entries.get(key);
        if(entry==null||entry.uid!=uid||postedAt<entry.postedAt)return false;
        entries.remove(key);remember(key,new Stamp(uid,postedAt,true));return true;
    }
    public void retainChannels(Set<String> selected){entries.values().removeIf(e->!selected.contains(e.channel));}
    public void retainKeys(Set<String> keys){entries.keySet().retainAll(keys);}
    public Entry<T> get(String key){return entries.get(key);}
    public Entry<T> choose(String current){
        Entry<T> entry=entries.get(current);if(entry!=null)return entry;
        for(Entry<T> candidate:entries.values())if(entry==null||candidate.revision>entry.revision)entry=candidate;
        return entry;
    }
    public int size(){return entries.size();}
    public Set<String> keys(){return new java.util.LinkedHashSet<>(entries.keySet());}
    private void remember(String key,Stamp value){
        history.remove(key);history.put(key,value);
        if(history.size()>128)history.remove(history.keySet().iterator().next());
    }
    public void clear(){entries.clear();history.clear();}
}
