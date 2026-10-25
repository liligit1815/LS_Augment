package ls.augment.com;

import java.util.Arrays;
import java.util.HashSet;

/** Execute the real model across role permutations, capacity changes and stale plans. */
public final class TestAtomicWorkbenchPlacement {
    private static int checks;
    private static void require(boolean value, String message) { checks++; if (!value) throw new AssertionError(message); }
    public static void main(String[] args) {
        for (int capacity = 3; capacity <= 6; capacity++) for (boolean dual : new boolean[]{false, true}) {
            for (int sourceIndex = 0; sourceIndex < capacity + (dual ? 2 : 1); sourceIndex++) {
                for (int targetIndex = 0; targetIndex < capacity + (dual ? 2 : 1); targetIndex++) {
                    AtomicWorkbenchWorkspaceModel m = new AtomicWorkbenchWorkspaceModel();
                    m.configureCapacity(capacity, dual);
                    int[] ids = m.eligibleWindowIds();
                    int active = m.mainWindowId();
                    for (int id : ids) {
                        AtomicWorkbenchWorkspaceModel.LaunchPlan plan = m.planLaunchAt("app" + id + "/Main", id);
                        require(plan.accepted() && plan.exactPlacement && m.commitLaunch(plan), "exact initial launch");
                        require(m.mainWindowId() == active, "side launch preserves active main");
                    }
                    String[] components = new String[8];
                    for (int id : ids) components[id] = m.component(id);
                    int source = ids[sourceIndex], target = ids[targetIndex];
                    int[] oldMains = m.mainWindowIds(), oldSides = m.sideWindowIds();
                    require(m.placeWindowAt(source, target), "placement accepted");
                    int[] mains = m.mainWindowIds(), sides = m.sideWindowIds();
                    for (int i = 0; i < mains.length; i++) require(mains[i] == exchange(oldMains[i], source, target), "main role exact");
                    for (int i = 0; i < sides.length; i++) require(sides[i] == exchange(oldSides[i], source, target), "side role exact");
                    for (int id : ids) require(components[id].equals(m.component(id)), "task owner unchanged");
                    require(new HashSet<>(m.topology().eligibleIds()).size() == ids.length, "unique role mapping");
                    require(!m.planLaunchAt("replacement/Main", target).accepted(), "occupied target never evicted by plan");
                    require(!m.planLaunch("replacement/Main").accepted(), "full launch requires explicit choice");
                    m.removeWindow(target); // only a confirmed native recovery may invoke this production method
                    AtomicWorkbenchWorkspaceModel.LaunchPlan replacement = m.planLaunchAt("replacement/Main", target);
                    require(replacement.accepted(), "confirmed recovery enables exact replacement");
                    int current = m.mainWindowId();
                    require(m.commitLaunch(replacement) && m.mainWindowId() == current, "replacement does not promote a side");
                    for (int id : ids) if (id != target) require(components[id].equals(m.component(id)), "unrelated owner retained");
                }
            }
        }
        AtomicWorkbenchWorkspaceModel m = new AtomicWorkbenchWorkspaceModel();
        AtomicWorkbenchWorkspaceModel.LaunchPlan stale = m.planLaunchAt("first/Main", 2);
        m.configureCapacity(6, false);
        require(!m.commitLaunch(stale) && !m.hasWindow(2), "capacity invalidates exact plan");
        stale = m.planLaunchAt("first/Main", 2); m.reset();
        require(!m.commitLaunch(stale), "reset cannot resurrect exact request");
        m.setHostedWindow(2, true); m.setEmptyHomeWindow(2, true);
        stale = m.planLaunchAt("first/Main", 2);
        require(stale.replacesEmptyHome && m.commitLaunch(stale), "empty home uses original display");
        require(m.rollbackEmptyHomeReplacement(stale) && m.hasWindow(2), "failed home replacement retains owner");
        require(!m.planLaunchAt("first/Main", 7).accepted(), "hidden identity cannot be a new placement target");
        System.out.println("PASS placement assertions=" + checks);
    }
    private static int exchange(int id, int a, int b) { return id == a ? b : id == b ? a : id; }
}
