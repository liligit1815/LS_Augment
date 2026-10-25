package ls.augment.com;

/** Permission scope policy. A bounded scan never implies access to private app directories. */
final class AtomicWorkbenchContentAccess {
    private AtomicWorkbenchContentAccess() { }

    static AtomicWorkbenchContentPermissionState permission(AtomicWorkbenchContentItem.Kind kind,
            boolean images, boolean videos, boolean audio, boolean selectedVisuals,
            boolean allFiles, int documentGrants) {
        AtomicWorkbenchContentPermissionState.Scope scope;
        if (kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD) {
            scope = AtomicWorkbenchContentPermissionState.Scope.UNAVAILABLE;
        } else if (allFiles || (kind == AtomicWorkbenchContentItem.Kind.MEDIA && images && videos)) {
            scope = AtomicWorkbenchContentPermissionState.Scope.FULL;
        } else if (videos || (kind == AtomicWorkbenchContentItem.Kind.MEDIA ? images : audio)) {
            scope = AtomicWorkbenchContentPermissionState.Scope.LIMITED;
        } else if (selectedVisuals || documentGrants > 0) {
            scope = AtomicWorkbenchContentPermissionState.Scope.SELECTED;
        } else {
            scope = AtomicWorkbenchContentPermissionState.Scope.DENIED;
        }
        return new AtomicWorkbenchContentPermissionState(scope, images, videos, audio,
                selectedVisuals, allFiles, documentGrants);
    }
}
