package ls.augment.com;

/** Actual phone access scope, separate from whether a query happened to return any rows. */
final class AtomicWorkbenchContentPermissionState {
    enum Scope { FULL, LIMITED, SELECTED, FOREGROUND_ONLY, DENIED, LOCKED, UNAVAILABLE }
    final Scope scope;
    final boolean images, videos, audio, selectedVisuals, allFiles;
    final int documentGrants;

    AtomicWorkbenchContentPermissionState(Scope scope, boolean images, boolean videos, boolean audio,
            boolean selectedVisuals, boolean allFiles, int grants) {
        this.scope = java.util.Objects.requireNonNull(scope); this.images = images; this.videos = videos;
        this.audio = audio; this.selectedVisuals = selectedVisuals; this.allFiles = allFiles;
        documentGrants = Math.max(0, grants);
    }
    static AtomicWorkbenchContentPermissionState simple(Scope scope) {
        return new AtomicWorkbenchContentPermissionState(scope, false, false, false, false, false, 0);
    }
    boolean accessible() { return scope != Scope.DENIED && scope != Scope.LOCKED && scope != Scope.UNAVAILABLE; }
    @Override public String toString() { return "WorkbenchContentPermission(" + scope + ')'; }
}
