package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Immutable presentation facts for the fixed eight-identity pool.
 * This class never authorizes Task/VD allocation or input delivery.
 */
public final class AtomicWorkbenchPoolTopology {
    public static final int POOL_SIZE = 8, DEFAULT_SIDE_COUNT = 3, MIN_SIDES = 3, MAX_SIDES = 6;
    public enum Role { MAIN, SIDE, NONE }
    private static final List<Integer> POOL = List.of(0,1,2,3,4,5,6,7);
    private final List<Integer> mains, sides, sideOrder, owned, eligible, overflow, unused;
    public final int activeMainId;

    /** mains are ordered outer-edge -> rail-adjacent, never absolute left -> right. */
    private AtomicWorkbenchPoolTopology(int[] mains, int active, int[] sideOrder, int visibleSides, int[] owned) {
        this.mains = ids(mains); this.sideOrder = ids(sideOrder); this.owned = ids(owned);
        if (this.mains.size()<1 || this.mains.size()>2 || visibleSides<MIN_SIDES || visibleSides>MAX_SIDES
                || this.sideOrder.size()!=POOL_SIZE-this.mains.size() || visibleSides>this.sideOrder.size()
                || !this.mains.contains(active)) throw new IllegalArgumentException("main/side/active scope");
        for (int id : this.sideOrder) if (this.mains.contains(id)) throw new IllegalArgumentException("overlapping main and side");
        this.sides = Collections.unmodifiableList(new ArrayList<>(this.sideOrder.subList(0, visibleSides)));
        ArrayList<Integer> eligible = new ArrayList<>(this.mains);
        for (int id : this.sides) if (eligible.contains(id)) throw new IllegalArgumentException("overlapping main and side"); else eligible.add(id);
        if (eligible.size()>POOL_SIZE) throw new IllegalArgumentException("capacity");
        this.eligible = Collections.unmodifiableList(eligible); activeMainId = active;
        ArrayList<Integer> overflow = new ArrayList<>(), unused = new ArrayList<>();
        for (int id : POOL) {
            if (this.owned.contains(id) && !eligible.contains(id)) overflow.add(id);
            else if (!eligible.contains(id) && !this.owned.contains(id)) unused.add(id);
        }
        this.overflow=Collections.unmodifiableList(overflow); this.unused=Collections.unmodifiableList(unused);
    }
    public static AtomicWorkbenchPoolTopology of(int[] mains, int active, int[] sides, int[] owned) {
        List<Integer> mainIds = ids(mains), shown = ids(sides);
        ArrayList<Integer> ordered = new ArrayList<>(shown);
        for (int id : POOL) if (!mainIds.contains(id) && !ordered.contains(id)) ordered.add(id);
        return new AtomicWorkbenchPoolTopology(mains,active,array(ordered),shown.size(),owned);
    }
    public static AtomicWorkbenchPoolTopology defaults() { return of(new int[]{0},0,new int[]{1,2,3},new int[0]); }
    public List<Integer> poolIds() { return POOL; }
    public List<Integer> mainIdsOuterToRail() { return mains; }
    public List<Integer> sideIds() { return sides; }
    /** All non-main identities in stable order; only sideIds() are currently enabled. */
    public List<Integer> allSideIds() { return sideOrder; }
    public List<Integer> ownedIds() { return owned; }
    public List<Integer> eligibleIds() { return eligible; }
    /** Owned but currently role-less; callers must keep/query its real resources. */
    public List<Integer> overflowOwnedIds() { return overflow; }
    /** Neither eligible nor owned. Empty eligible placeholders are NOT in this set. */
    public List<Integer> unusedIds() { return unused; }
    public boolean eligible(int id) { check(id); return eligible.contains(id); }
    /** Refresh resource observations without altering any visual role. */
    public AtomicWorkbenchPoolTopology withOwned(int[] nextOwned) {
        return new AtomicWorkbenchPoolTopology(array(mains), activeMainId, array(sideOrder), sides.size(), nextOwned);
    }
    /**
     * Reconcile a requested capacity, preserving role order where possible and every owner.
     * Like Van, shrinking only hides the tail. Selecting a second main uses content,
     * not an empty resource identity. No resources are created or released here.
     */
    public AtomicWorkbenchPoolTopology configured(int sideCount, boolean twoMains) {
        return configured(sideCount, twoMains, array(owned));
    }
    /** Content can include pending UI content; it is not added to resource ownership. */
    public AtomicWorkbenchPoolTopology configured(int sideCount, boolean twoMains, int[] contentIds) {
        if (sideCount < MIN_SIDES || sideCount > MAX_SIDES) throw new IllegalArgumentException("side count");
        List<Integer> content = ids(contentIds);
        ArrayList<Integer> nextMains = new ArrayList<>();
        ArrayList<Integer> nextOrder = new ArrayList<>(sideOrder);
        if (twoMains && dual()) nextMains.addAll(mains);
        else nextMains.add(activeMainId);
        if (twoMains && nextMains.size() == 1) {
            Integer additional = null;
            for (int i=0; i<Math.min(sideCount, sideOrder.size()); i++)
                if (content.contains(sideOrder.get(i))) { additional=sideOrder.get(i); break; }
            if (additional == null) for (int id : sideOrder) if (content.contains(id)) { additional = id; break; }
            if (additional == null) additional = sideOrder.get(0);
            nextMains.add(additional);
            nextOrder.remove(additional);
        } else if (!twoMains && dual()) {
            int demoted = mains.get(0)==activeMainId ? mains.get(1) : mains.get(0);
            nextOrder.remove(Integer.valueOf(demoted));
            nextOrder.add(0,demoted);
        }
        return new AtomicWorkbenchPoolTopology(array(nextMains),activeMainId,array(nextOrder),sideCount,array(owned));
    }
    public boolean dual() { return mains.size()==2; }
    public int middleMainId() { return mains.get(mains.size()-1); }
    public boolean owned(int id) { check(id); return owned.contains(id); }
    public Role roleOf(int id) { check(id); return mains.contains(id)?Role.MAIN:sides.contains(id)?Role.SIDE:Role.NONE; }
    /** Role-only reconfiguration cannot discard any old owned identity. */
    public AtomicWorkbenchPoolTopology reconfigure(int[] nextMains,int active,int[] nextSides) {
        List<Integer> newMains=ids(nextMains), visible=ids(nextSides);
        ArrayList<Integer> order=new ArrayList<>(visible);
        for(int id:sideOrder)if(!newMains.contains(id)&&!order.contains(id))order.add(id);
        for(int id:POOL)if(!newMains.contains(id)&&!order.contains(id))order.add(id);
        return new AtomicWorkbenchPoolTopology(nextMains,active,array(order),visible.size(),array(owned));
    }
    public AtomicWorkbenchPoolTopology activateMainProposal(int id) {
        return new AtomicWorkbenchPoolTopology(array(mains),id,array(sideOrder),sides.size(),array(owned));
    }
    public AtomicWorkbenchPoolTopology swapMainPositionsProposal() {
        if (!dual()) throw new IllegalStateException("two mains required");
        return new AtomicWorkbenchPoolTopology(new int[]{mains.get(1),mains.get(0)},activeMainId,array(sideOrder),sides.size(),array(owned));
    }
    /** Exchange visual positions only; both task/display owners keep their identities. */
    public AtomicWorkbenchPoolTopology placementProposal(int source, int target) {
        check(source); check(target);
        if (!owned.contains(source) || !eligible.contains(target)) throw new IllegalArgumentException("placement scope");
        int[] nextMains = array(mains), nextOrder = array(sideOrder);
        for (int i = 0; i < nextMains.length; i++) nextMains[i] = exchanged(nextMains[i], source, target);
        for (int i = 0; i < nextOrder.length; i++) nextOrder[i] = exchanged(nextOrder[i], source, target);
        int active = exchanged(activeMainId, source, target);
        return new AtomicWorkbenchPoolTopology(nextMains, active, nextOrder, sides.size(), array(owned));
    }
    private static int exchanged(int id, int a, int b) { return id == a ? b : id == b ? a : id; }
    /** Receiver is explicit. A future authenticated receipt chooses/commits it, not this model. */
    public AtomicWorkbenchPoolTopology sidePromotionProposal(int sideId,int receivingMainId) {
        if (!sides.contains(sideId) || !mains.contains(receivingMainId)) throw new IllegalArgumentException("promotion roles");
        int[] nextMains=array(mains),nextSides=array(sideOrder);
        nextMains[mains.indexOf(receivingMainId)]=sideId;
        nextSides[sideOrder.indexOf(sideId)]=receivingMainId;
        return new AtomicWorkbenchPoolTopology(nextMains,sideId,nextSides,sides.size(),array(owned));
    }
    /** Normal explicit App selection can promote a hidden owner at its original side-order index. */
    public AtomicWorkbenchPoolTopology overflowPromotionProposal(int overflowId,int receivingMainId) {
        if(!overflow.contains(overflowId)||!mains.contains(receivingMainId))throw new IllegalArgumentException("owned overflow roles");
        int[] nextMains=array(mains),nextOrder=array(sideOrder);
        nextMains[mains.indexOf(receivingMainId)]=overflowId;
        nextOrder[sideOrder.indexOf(overflowId)]=receivingMainId;
        return new AtomicWorkbenchPoolTopology(nextMains,overflowId,nextOrder,sides.size(),array(owned));
    }
    public List<Integer> visibleSides(int maxEmptyPlaceholders) {
        if (maxEmptyPlaceholders<0 || maxEmptyPlaceholders>sides.size()) throw new IllegalArgumentException("empty placeholder limit");
        ArrayList<Integer> result=new ArrayList<>(); int empties=0;
        for(int id:sides) if(owned.contains(id)||empties++<maxEmptyPlaceholders)result.add(id);
        return Collections.unmodifiableList(result);
    }
    private static List<Integer> ids(int[] values) {
        if(values==null||values.length>POOL_SIZE)throw new IllegalArgumentException("identity list");
        ArrayList<Integer> result=new ArrayList<>(); Set<Integer> seen=new HashSet<>();
        for(int id:values){check(id);if(!seen.add(id))throw new IllegalArgumentException("duplicate identity");result.add(id);}
        return Collections.unmodifiableList(result);
    }
    private static int[] array(List<Integer> values){int[] result=new int[values.size()];for(int i=0;i<result.length;i++)result[i]=values.get(i);return result;}
    private static void check(int id){if(id<0||id>=POOL_SIZE)throw new IllegalArgumentException("pool identity");}
}
