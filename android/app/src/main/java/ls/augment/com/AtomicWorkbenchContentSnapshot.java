package ls.augment.com;

import java.util.List;

/** Immutable view state. Restored metadata is marked cached until the phone source is revalidated. */
final class AtomicWorkbenchContentSnapshot {
    final AtomicWorkbenchContentItem.Kind kind;
    final List<AtomicWorkbenchContentItem> items;
    final AtomicWorkbenchContentPermissionState permission;
    final AtomicWorkbenchContentSource.State state;
    final boolean loading, cached;
    final long generation, updatedAt;
    final boolean storageAvailable;
    AtomicWorkbenchContentSnapshot(AtomicWorkbenchContentItem.Kind kind, List<AtomicWorkbenchContentItem> items,
            AtomicWorkbenchContentPermissionState permission, AtomicWorkbenchContentSource.State state,
            boolean loading, boolean cached, long generation, long updatedAt, boolean storageAvailable) {
        this.kind = kind; this.items = List.copyOf(items); this.permission = permission; this.state = state;
        this.loading = loading; this.cached = cached; this.generation = generation;
        this.updatedAt = updatedAt; this.storageAvailable = storageAvailable;
    }
    @Override public String toString() { return "WorkbenchContentSnapshot(" + kind + ',' + state + ",count=" + items.size() + ')'; }
}
