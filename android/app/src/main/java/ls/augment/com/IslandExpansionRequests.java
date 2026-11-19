package ls.augment.com;

import java.util.*;

/** A source revision can request automatic expansion once; redraws and environment changes cannot renew it. */
public final class IslandExpansionRequests {
    private static final class Entry {
        final Object instance,revision;boolean pending;
        Entry(Object instance,Object revision,boolean pending){this.instance=instance;this.revision=revision;this.pending=pending;}
    }
    private final Map<String,Entry> entries=new HashMap<>();
    public void observe(String key,Object instance,Object revision,int mode){
        Entry old=entries.get(key);
        if(old==null||!Objects.equals(old.instance,instance)||!Objects.equals(old.revision,revision)){
            if(old!=null||entries.size()<384)entries.put(key,new Entry(instance,revision,mode==IslandEnvironmentRules.EXPAND));
        }else if(mode!=IslandEnvironmentRules.EXPAND)old.pending=false;
    }
    public boolean take(String key,Object instance,Object revision){
        Entry entry=entries.get(key);if(entry==null||!entry.pending||!Objects.equals(entry.instance,instance)||!Objects.equals(entry.revision,revision))return false;
        entry.pending=false;return true;
    }
    public void retain(Set<String> keys){entries.keySet().retainAll(keys);}
    public void cancel(){for(Entry entry:entries.values())entry.pending=false;}
    public void clear(){entries.clear();}
}
