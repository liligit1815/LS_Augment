package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Stable selection and one-time new-source focus, independent of Android Views. */
final class AtomicWorkbenchCardPageModel {
    static final int MAX_DYNAMIC=16;
    static final class Item {
        final String id;
        final long appeared;
        Item(String id,long appeared){if(id==null||id.isEmpty()||id.length()>96||appeared<0)throw new IllegalArgumentException("invalid_card_page");this.id=id;this.appeared=appeared;}
    }
    private final List<String> base=new ArrayList<>();
    private final Map<String,Item> dynamic=new LinkedHashMap<>();
    private List<String> ordered=List.of();
    private String selected="music";
    private long acknowledgedAppearance;
    private String navigationBoot="";
    private long navigationBirth;
    AtomicWorkbenchCardPageModel(){base.add("music");rebuild();}
    void base(boolean navigation){base.clear();base.add("music");if(navigation)base.add("navigation");rebuild();}
    void navigation(boolean available,String sourceGeneration){
        if(sourceGeneration!=null&&(sourceGeneration.length()>128||sourceGeneration.chars().anyMatch(Character::isISOControl)))throw new IllegalArgumentException("invalid_navigation_source");
        base(available);
        // Only authenticated NotificationRecords.newId has this contract: BOOT32 +
        // Long.toHexString(++next). It is an NMS lifetime birth, never a route/title.
        if(available&&sourceGeneration!=null&&sourceGeneration.matches("[0-9a-f]{33,48}")){
            String boot=sourceGeneration.substring(0,32),suffix=sourceGeneration.substring(32);
            try{
                long birth=Long.parseUnsignedLong(suffix,16);
                if(birth==0||!Long.toUnsignedString(birth,16).equals(suffix))return;
                if(navigationBoot.isEmpty())navigationBoot=boot;
                // A different system-server epoch requires the caller's explicit reset.
                if(navigationBoot.equals(boot)&&Long.compareUnsigned(birth,navigationBirth)>0){navigationBirth=birth;selected="navigation";}
            }catch(NumberFormatException invalid){/* Unknown ID encoding cannot become an appearance. */}
        }
    }
    void resetNavigationSource(){navigationBoot="";navigationBirth=0;}
    void dynamic(List<Item> incoming,boolean complete){
        if(incoming==null||incoming.size()>MAX_DYNAMIC)throw new IllegalArgumentException("invalid_card_pages");
        LinkedHashMap<String,Item> valid=new LinkedHashMap<>();
        for(Item item:incoming){if(item==null||item.id.equals("music")||item.id.equals("navigation")||valid.put(item.id,item)!=null)throw new IllegalArgumentException("duplicate_card_page");}
        if(complete)dynamic.keySet().retainAll(valid.keySet());
        for(Item item:valid.values())if(dynamic.containsKey(item.id)||dynamic.size()<MAX_DYNAMIC)dynamic.put(item.id,item);
        String newest=null;long newestRevision=acknowledgedAppearance;
        for(Item item:valid.values())if(dynamic.containsKey(item.id)&&item.appeared>newestRevision){newestRevision=item.appeared;newest=item.id;}
        acknowledgedAppearance=Math.max(acknowledgedAppearance,newestRevision);
        if(newest!=null&&dynamic.containsKey(newest))selected=newest;
        rebuild();
    }
    void resetDynamic(){dynamic.clear();acknowledgedAppearance=0;rebuild();}
    boolean select(String id){if(!ordered.contains(id)||id.equals(selected))return false;selected=id;return true;}
    boolean move(int amount){int next=index()+amount;if(next<0||next>=ordered.size())return false;return select(ordered.get(next));}
    String selected(){return selected;}
    int index(){return ordered.indexOf(selected);}
    int size(){return ordered.size();}
    List<String> ids(){return ordered;}
    private void rebuild(){ArrayList<String> result=new ArrayList<>(base);result.addAll(dynamic.keySet());ordered=Collections.unmodifiableList(result);if(!ordered.contains(selected))selected="music";}
}
