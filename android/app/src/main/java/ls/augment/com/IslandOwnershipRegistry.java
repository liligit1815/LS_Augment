package ls.augment.com;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/** Rendering ownership is earned by a displayed instance, never by a feature switch or queue entry. */
public final class IslandOwnershipRegistry {
    public static final long TRANSITION_MS=600;
    private static final class Claim {
        final Object instance;
        long hiddenAt=-1;
        Claim(Object instance){this.instance=instance;}
    }
    private final Map<String,Claim> claims=new HashMap<>();
    public synchronized void reconcile(Map<String,Object> visible,Map<String,Object> transitioning,long now) {
        for(String scene:new HashSet<>(claims.keySet())) {
            Claim claim=claims.get(scene);
            if(visible.get(scene)==claim.instance){claim.hiddenAt=-1;continue;}
            if(transitioning.get(scene)!=claim.instance){claims.remove(scene);continue;}
            if(claim.hiddenAt<0)claim.hiddenAt=now;
            if(now<claim.hiddenAt||now-claim.hiddenAt>=TRANSITION_MS)claims.remove(scene);
        }
        for(Map.Entry<String,Object> entry:visible.entrySet()) if(entry.getValue()!=null) {
            Claim old=claims.get(entry.getKey());
            if(old==null||old.instance!=entry.getValue())claims.put(entry.getKey(),new Claim(entry.getValue()));
        }
    }
    public synchronized boolean owns(String scene,long now) {
        Claim claim=claims.get(scene);
        return claim!=null&&(claim.hiddenAt<0||now>=claim.hiddenAt&&now-claim.hiddenAt<TRANSITION_MS);
    }
    public synchronized Set<String> scenes(long now) {
        Set<String> result=new HashSet<>();for(String scene:claims.keySet())if(owns(scene,now))result.add(scene);return result;
    }
    public synchronized long nextExpiry() {
        long next=0;
        for(Claim claim:claims.values()) if(claim.hiddenAt>=0) {
            long deadline=claim.hiddenAt+TRANSITION_MS;if(next==0||deadline<next)next=deadline;
        }
        return next;
    }
    public synchronized void clear(){claims.clear();}
}
