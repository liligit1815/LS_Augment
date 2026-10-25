package ls.augment.com;

/** Pure workspace bookkeeping. A role proposal never authorizes or releases a real resource. */
public final class AtomicWorkbenchWorkspaceModel {
    public static final int WINDOW_COUNT = AtomicWorkbenchPoolTopology.POOL_SIZE;
    /** Compatibility name for the default, not the configured side capacity. */
    public static final int SIDE_COUNT = AtomicWorkbenchPoolTopology.DEFAULT_SIDE_COUNT;
    private final String[] components = new String[WINDOW_COUNT];
    private final boolean[] hosted = new boolean[WINDOW_COUNT];
    private final boolean[] emptyHome = new boolean[WINDOW_COUNT];
    private final String[][] runningPackages = new String[WINDOW_COUNT][];
    private final boolean[] desktop = new boolean[WINDOW_COUNT];
    private AtomicWorkbenchPoolTopology roles = AtomicWorkbenchPoolTopology.defaults();
    private int lastMainWindow = -1;
    private boolean mainExpanded;
    private long revision;

    public AtomicWorkbenchWorkspaceModel() { java.util.Arrays.fill(desktop, true); }

    public static final class LaunchPlan {
        public final int windowId, receivingMainId;
        public final boolean existing, replacesEmptyHome, exactPlacement;
        public final String component;
        private final long revision;
        private LaunchPlan(int id, int receiver, boolean existing, boolean replacesEmptyHome,
                String component, long revision) {
            this(id, receiver, existing, replacesEmptyHome, component, revision, false);
        }
        private LaunchPlan(int id, int receiver, boolean existing, boolean replacesEmptyHome,
                String component, long revision, boolean exact) {
            windowId = id; receivingMainId = receiver; this.existing = existing;
            this.replacesEmptyHome = replacesEmptyHome; this.component = component; this.revision = revision; exactPlacement = exact;
        }
        public boolean accepted() { return windowId >= 0; }
    }

    public AtomicWorkbenchPoolTopology topology() { return roles.withOwned(ownedIds()); }
    public int configuredSideCount() { return roles.sideIds().size(); }
    public boolean dualMain() { return roles.dual(); }
    public int[] mainWindowIds() { return array(roles.mainIdsOuterToRail()); }
    public int[] sideWindowIds() { return array(roles.sideIds()); }
    public int[] eligibleWindowIds() { return array(roles.eligibleIds()); }
    public int[] overflowWindowIds() { return array(topology().overflowOwnedIds()); }
    public long revision() { return revision; }

    /** Caller resolves actual capability/applicability. This operation changes no ownership. */
    public boolean configureCapacity(int sideCount, boolean twoMains) {
        return configureCapacity(sideCount,twoMains,new int[0]);
    }
    /** Pending content affects roles only; it does not become an observed Task/VD owner. */
    public boolean configureCapacity(int sideCount, boolean twoMains, int[] pendingContentIds) {
        java.util.LinkedHashSet<Integer> content=new java.util.LinkedHashSet<>();
        for(int id:ownedIds())content.add(id);
        if(pendingContentIds==null)throw new IllegalArgumentException("pending content");
        for(int id:pendingContentIds){check(id);content.add(id);}
        AtomicWorkbenchPoolTopology next = topology().configured(sideCount, twoMains, array(new java.util.ArrayList<>(content)));
        if (roles.mainIdsOuterToRail().equals(next.mainIdsOuterToRail())
                && roles.sideIds().equals(next.sideIds()) && roles.allSideIds().equals(next.allSideIds())
                && roles.activeMainId == next.activeMainId) return false;
        roles = next; mainExpanded = false; revision++;
        return true;
    }

    public LaunchPlan planLaunch(String component) { return planLaunch(component, mainWindowId()); }
    /** A normal App selection may bring back its already-owned hidden window. */
    public LaunchPlan planLaunch(String component, int receivingMainId) {
        if (component == null || component.trim().isEmpty()) throw new IllegalArgumentException("empty component");
        requireMain(receivingMainId);
        int existing = find(component);
        if (existing >= 0) return plan(existing, receivingMainId, true, false, component);
        if (emptyHome[receivingMainId]) return plan(receivingMainId, receivingMainId, false, true, component);
        if (!hasWindow(receivingMainId)) return plan(receivingMainId, receivingMainId, false, false, component);
        for (int id : roles.mainIdsOuterToRail()) if (!hasWindow(id)) return plan(id, receivingMainId, false, false, component);
        for (int id : roles.sideIds()) if (!hasWindow(id)) return plan(id, receivingMainId, false, false, component);
        for (int id : roles.sideIds()) if (emptyHome[id]) return plan(id, receivingMainId, false, true, component);
        return plan(-1, receivingMainId, false, false, component);
    }
    private LaunchPlan plan(int id, int receiver, boolean existing, boolean replacement, String component) {
        return new LaunchPlan(id, receiver, existing, replacement, component, revision);
    }

    /** Occupied destinations must first finish their real recovery; planning never evicts an owner. */
    public LaunchPlan planLaunchAt(String component, int target) {
        check(target);
        if (component == null || component.trim().isEmpty()) throw new IllegalArgumentException("empty component");
        int existing = find(component);
        boolean accepted = roles.eligible(target) && existing < 0 && (!hasWindow(target) || emptyHome[target]);
        return new LaunchPlan(accepted ? target : -1, mainWindowId(), false, accepted && emptyHome[target],
                component, revision, true);
    }

    public boolean placeWindowAt(int source, int target) {
        check(source); check(target);
        if (!hasWindow(source) || !roles.eligible(target)) return false;
        if (source == target) return true;
        roles = topology().placementProposal(source, target); mainExpanded = false; revision++;
        return true;
    }

    /** Planning cannot consume a slot. Any role/owner change invalidates an old proposal. */
    public boolean commitLaunch(LaunchPlan plan) {
        if (plan == null || !plan.accepted() || plan.revision != revision
                || !roles.eligible(plan.windowId) && !plan.existing) return false;
        if (plan.existing) {
            if (find(plan.component) != plan.windowId) return false;
        } else {
            if (plan.replacesEmptyHome) {
                if (!emptyHome[plan.windowId] || components[plan.windowId] != null) return false;
                emptyHome[plan.windowId] = false;
            } else if (hasWindow(plan.windowId)) return false;
            components[plan.windowId] = plan.component;
        }
        if (plan.exactPlacement) {
            desktop[plan.windowId] = false; mainExpanded = false; revision++; return true;
        }
        return promote(plan.windowId, plan.receivingMainId);
    }

    public boolean rollbackEmptyHomeReplacement(LaunchPlan plan) {
        if (plan == null || !plan.accepted() || !plan.replacesEmptyHome
                || !plan.component.equals(components[plan.windowId])) return false;
        components[plan.windowId] = null; hosted[plan.windowId] = true;
        emptyHome[plan.windowId] = false; revision++;
        return true;
    }

    public boolean promote(int windowId) { return promote(windowId, mainWindowId()); }
    public boolean promote(int windowId, int receivingMainId) {
        check(windowId); requireMain(receivingMainId);
        if (!hasWindow(windowId)) return false;
        if (roles.roleOf(windowId) == AtomicWorkbenchPoolTopology.Role.MAIN)
            roles = topology().activateMainProposal(windowId);
        else if(roles.eligible(windowId)) roles = topology().sidePromotionProposal(windowId, receivingMainId);
        else roles = topology().overflowPromotionProposal(windowId,receivingMainId);
        desktop[windowId] = false; lastMainWindow = windowId; mainExpanded = false; revision++;
        return true;
    }

    /** Compatibility alias; normal App selection follows the same promotion path. */
    public boolean promoteOverflow(int windowId, int receivingMainId) {
        check(windowId); requireMain(receivingMainId);
        if (!topology().overflowOwnedIds().contains(windowId)) return false;
        return promote(windowId,receivingMainId);
    }

    public boolean activateMain(int id) {
        requireMain(id);
        if (mainWindowId() == id) return false;
        roles = topology().activateMainProposal(id); mainExpanded = false; revision++;
        return true;
    }
    public boolean swapMainPositions() {
        if (!roles.dual()) return false;
        roles = topology().swapMainPositionsProposal(); revision++;
        return true;
    }

    public boolean parkMainInEmptySide(int sideIndex) {
        int empty = sideWindowId(sideIndex), old = mainWindowId();
        if (desktop[old] || !hasWindow(old) || hasWindow(empty)) return false;
        lastMainWindow = old; roles = topology().sidePromotionProposal(empty, old);
        desktop[empty] = true; mainExpanded = false; revision++;
        return true;
    }
    public void showDesktop() {
        int id = mainWindowId(); mainExpanded = false;
        if (components[id] != null) lastMainWindow = id;
        desktop[id] = true; revision++;
    }

    /** Call only after the real explicit close/recovery path confirms this owner can retire. */
    public void removeWindow(int windowId) {
        check(windowId); components[windowId] = null; hosted[windowId] = false;
        emptyHome[windowId] = false; runningPackages[windowId] = null; desktop[windowId] = true;
        if (mainWindowId() == windowId) mainExpanded = false;
        if (lastMainWindow == windowId) lastMainWindow = components[mainWindowId()] == null ? -1 : mainWindowId();
        revision++;
    }
    public void reset() {
        for (int id = 0; id < WINDOW_COUNT; id++) {
            components[id] = null; hosted[id] = false; emptyHome[id] = false;
            runningPackages[id] = null; desktop[id] = true;
        }
        roles = AtomicWorkbenchPoolTopology.defaults(); lastMainWindow = -1;
        mainExpanded = false; revision++;
    }
    public int mainWindowId() { return roles.activeMainId; }
    public int lastMainWindowId() { return lastMainWindow; }
    public boolean desktopVisible() { return desktop[mainWindowId()]; }
    public boolean desktopVisible(int mainId) { requireMain(mainId); return desktop[mainId]; }
    public boolean mainExpanded() { return mainExpanded; }
    public boolean setMainExpanded(boolean expanded) {
        if (expanded && (desktopVisible() || !hasWindow(mainWindowId()))) return false;
        if (mainExpanded == expanded) return true;
        mainExpanded = expanded; revision++; return true;
    }
    public String component(int id) { check(id); return components[id]; }
    public boolean hasWindow(int id) { check(id); return components[id] != null || hosted[id]; }
    public void setHostedWindow(int id, boolean value) {
        check(id);
        if (hosted[id] != value) { hosted[id] = value; revision++; }
        if (!value) setEmptyHomeWindow(id, false);
    }
    public void setEmptyHomeWindow(int id, boolean value) {
        check(id); value = value && hosted[id] && components[id] == null;
        if (emptyHome[id] != value) { emptyHome[id] = value; revision++; }
    }
    public int sideWindowId(int index) {
        if (index < 0 || index >= roles.sideIds().size()) throw new IllegalArgumentException("side index");
        return roles.sideIds().get(index);
    }
    public int sideIndexOf(int id) { check(id); return roles.sideIds().indexOf(id); }
    public int find(String component) {
        String pkg = packageName(component);
        if (!pkg.isEmpty()) for (int id = 0; id < WINDOW_COUNT; id++) {
            if (!hasWindow(id)) continue;
            if (pkg.equals(packageName(components[id]))) return id;
            if (runningPackages[id] != null) for (String running : runningPackages[id]) if (pkg.equals(running)) return id;
        }
        return -1;
    }
    public void setRunningPackages(int id, Iterable<String> packages) { setRunningPackages(id, packages, false); }
    /** Failed/missing snapshots never remove an owner; a retired component still retains its display lease. */
    public void setRunningPackages(int id, Iterable<String> packages, boolean reconcileComponent) {
        check(id); if (packages == null) return;
        java.util.TreeSet<String> observed = new java.util.TreeSet<>();
        for (String pkg : packages) if (pkg != null && !pkg.isEmpty() && pkg.indexOf('/') < 0) observed.add(pkg);
        String[] next = observed.toArray(new String[0]);
        boolean changed = !java.util.Arrays.equals(runningPackages[id], next); runningPackages[id] = next;
        if (reconcileComponent && components[id] != null && !observed.contains(packageName(components[id]))) {
            components[id] = null; hosted[id] = true; changed = true;
        }
        if (changed) revision++;
    }
    public int appCount() { int count = 0; for (String value : components) if (value != null) count++; return count; }
    public int[] visibleSideWindowIds(int emptyLimit) { return array(topology().visibleSides(emptyLimit)); }
    private int[] ownedIds() {
        int count = 0; for (int id = 0; id < WINDOW_COUNT; id++) if (hasWindow(id)) count++;
        int[] ids = new int[count]; count = 0;
        for (int id = 0; id < WINDOW_COUNT; id++) if (hasWindow(id)) ids[count++] = id;
        return ids;
    }
    private void requireMain(int id) {
        check(id); if (roles.roleOf(id) != AtomicWorkbenchPoolTopology.Role.MAIN) throw new IllegalArgumentException("receiving main");
    }
    private static int[] array(java.util.List<Integer> ids) {
        int[] result = new int[ids.size()]; for (int i = 0; i < result.length; i++) result[i] = ids.get(i); return result;
    }
    private static String packageName(String component) {
        if (component == null) return "";
        int separator = component.indexOf('/'); return separator > 0 ? component.substring(0, separator) : "";
    }
    private static void check(int id) { if (id < 0 || id >= WINDOW_COUNT) throw new IllegalArgumentException("window id"); }
}
