package ls.augment.com;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Snapshot ordering, real source lifetimes and conservative failed/limited enumeration semantics. */
final class AtomicWorkbenchNotificationCardsModel {
    private final Map<String,AtomicWorkbenchNotificationCardData> cards=new LinkedHashMap<>();
    private long issued,applied,event;
    private boolean complete=true,limited;
    synchronized long beginUpdate(){if(issued==Long.MAX_VALUE)throw new IllegalStateException("notification_ui_generation_exhausted");return ++issued;}
    synchronized void reset(){applied=beginUpdate();cards.clear();event=0;complete=true;limited=false;}
    synchronized boolean apply(AtomicWorkbenchNotificationCardData.Snapshot snapshot,long update){
        if(update<=applied||update>issued)return false;applied=update;
        boolean valid=snapshot!=null&&snapshot.valid&&snapshot.event>=event;
        if(valid)for(AtomicWorkbenchNotificationCardData next:snapshot.cards.values()){
            AtomicWorkbenchNotificationCardData previous=cards.get(next.id);
            if(previous!=null&&(!previous.sameLifetime(next)||next.revision<previous.revision)){valid=false;break;}
        }
        complete=valid&&snapshot.complete;limited=valid&&snapshot.limited;
        if(complete)cards.keySet().retainAll(snapshot.cards.keySet());
        for(String id:new ArrayList<>(cards.keySet()))cards.put(id,cards.get(id).stale());
        if(valid){
            event=Math.max(event,snapshot.event);
            for(AtomicWorkbenchNotificationCardData next:snapshot.cards.values()){
                if(cards.containsKey(next.id)||snapshot.available&&cards.size()<AtomicWorkbenchNotificationCardData.MAX_CARDS)
                    cards.put(next.id,snapshot.available?next:next.stale());
            }
        }
        return true;
    }
    synchronized List<AtomicWorkbenchNotificationCardData> cards(){return List.copyOf(cards.values());}
    synchronized AtomicWorkbenchNotificationCardData source(String id){return cards.get(id);}
    synchronized boolean complete(){return complete;}
    synchronized boolean limited(){return limited;}
}
