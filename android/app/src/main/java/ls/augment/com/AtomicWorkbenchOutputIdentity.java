package ls.augment.com;

/** Immutable display lease identity; never accepts a recycled display number alone. */
final class AtomicWorkbenchOutputIdentity {
    final int displayId, userId;
    final String name, unique;

    AtomicWorkbenchOutputIdentity(int displayId, String name, String unique, int userId) {
        if (displayId <= 0 || userId < 0 || name == null || name.isEmpty() || name.length() > 512
                || unique == null || unique.isEmpty() || unique.length() > 1024)
            throw new IllegalArgumentException("output_identity");
        this.displayId = displayId; this.name = name; this.unique = unique; this.userId = userId;
    }

    boolean matches(int displayId, String name, String unique, int userId) {
        return this.displayId == displayId && this.userId == userId
                && this.name.equals(name) && this.unique.equals(unique);
    }
}
