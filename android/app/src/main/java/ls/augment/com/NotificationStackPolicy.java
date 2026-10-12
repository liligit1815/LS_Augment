package ls.augment.com;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Logical shade stacks. No screen position, clipped-card count or scroll gesture defines a group. */
public final class NotificationStackPolicy {
    public static final String MERGED="all", ALERTING="alerting", SILENT="silent";
    private NotificationStackPolicy() { }
    public static final class Item<T> {
        public final T value;
        public final String key,appUserKey;
        public final boolean silent;
        public final long postTime;
        public Item(T value,String key,String appUserKey,boolean silent,long postTime) {
            this.value=value;this.key=key;this.appUserKey=appUserKey;this.silent=silent;this.postTime=postTime;
        }
    }
    public static final class Node<T> {
        public final Item<T> item;
        public final String groupKey,label;
        public final boolean expanded;
        public final int count;
        private Node(Item<T> item,String groupKey,String label,boolean expanded,int count) {
            this.item=item;this.groupKey=groupKey;this.label=label;this.expanded=expanded;this.count=count;
        }
    }
    public static final class Plan<T> {
        public final List<Node<T>> nodes=new ArrayList<>();
        public final Set<String> hiddenKeys=new LinkedHashSet<>();
        public final Map<String,List<Item<T>>> groups=new LinkedHashMap<>();
    }
    public static <T> Plan<T> plan(List<Item<T>> items,boolean big,boolean small,Set<String> expanded) {
        Plan<T> result=new Plan<>();
        if(!big&&!small) {
            // Native mode must keep its own order, section labels and grouping.
            for(Item<T> item:items)result.nodes.add(new Node<>(item,"","",true,1));
            return result;
        }
        List<Item<T>> alert=new ArrayList<>(),silent=new ArrayList<>();
        for(Item<T> item:items)(item.silent?silent:alert).add(item);
        if(big&&!items.isEmpty()) {
            boolean open=expanded.contains(MERGED);
            result.groups.put(MERGED,new ArrayList<>(items));
            result.nodes.add(new Node<>(null,MERGED,"通知",open,items.size()));
            if(!open) {
                Item<T> front=newest(alert.isEmpty()?silent:alert);
                result.nodes.add(new Node<>(front,MERGED,"",false,items.size()));
                for(Item<T> item:items)if(item!=front)result.hiddenKeys.add(item.key);
                return result;
            }
        }
        section(result,alert,ALERTING,"通知",small,expanded);
        section(result,silent,SILENT,"静默",small,expanded);
        return result;
    }
    private static <T> void section(Plan<T> result,List<Item<T>> items,String key,String label,
                                    boolean small,Set<String> expanded) {
        if(items.isEmpty())return;
        // A native category is a visible section, never another expandable stack.
        // Its noninteractive label survives even when there is a single card.
        result.nodes.add(new Node<>(null,key,label,true,items.size()));
        if(!small) {
            for(Item<T> item:items)result.nodes.add(new Node<>(item,"","",true,1));
            return;
        }
        Map<String,List<Item<T>>> apps=new LinkedHashMap<>();
        for(Item<T> item:items)apps.computeIfAbsent(item.appUserKey,ignored->new ArrayList<>()).add(item);
        for(Map.Entry<String,List<Item<T>>> app:apps.entrySet()) {
            List<Item<T>> members=app.getValue();
            if(members.size()==1) { result.nodes.add(new Node<>(members.get(0),"","",true,1));continue; }
            String appKey=key+":app:"+app.getKey();boolean appOpen=expanded.contains(appKey);
            result.groups.put(appKey,new ArrayList<>(members));
            result.nodes.add(new Node<>(null,appKey,app.getKey(),appOpen,members.size()));
            if(appOpen)for(Item<T> item:members)result.nodes.add(new Node<>(item,appKey,"",true,members.size()));
            else {
                Item<T> front=newest(members);result.nodes.add(new Node<>(front,appKey,"",false,members.size()));
                for(Item<T> item:members)if(item!=front)result.hiddenKeys.add(item.key);
            }
        }
    }
    private static <T> Item<T> newest(List<Item<T>> items) {
        Item<T> winner=items.get(0);
        for(Item<T> item:items)if(item.postTime>winner.postTime)winner=item;
        return winner;
    }
}
