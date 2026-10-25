package ls.augment.com;

public final class TestAtomicWorkbenchInputPolicy {
    public static void main(String[] args) {
        AtomicWorkbenchInputPolicy.Geometry plain = geometry(0);
        point(plain.map(10f, 20f), 0f, 0f, "content origin");
        point(plain.map(110f, 70f), 500f, 250f, "offset and scaled center");
        point(plain.map(210f, 120f), 1000f, 500f, "pixel spans");
        point(plain.map(0f, 10f), -50f, -50f, "outgoing drag retains coordinates");
        require(plain.contains(10f, 20f), "origin is inside");
        require(!plain.contains(9f, 20f) && !plain.contains(210f, 30f),
                "letterbox and far border do not start gestures");
        require(!plain.contains(Float.NaN, 30f), "invalid DOWN rejected");
        point(geometry(1).map(10f, 20f), 0f, 500f, "quarter turn origin");
        point(geometry(1).map(210f, 120f), 1000f, 0f, "quarter turn far corner");
        point(geometry(2).map(10f, 20f), 1000f, 500f, "half turn origin");
        point(geometry(2).map(210f, 120f), 0f, 0f, "half turn far corner");
        point(geometry(3).map(10f, 20f), 1000f, 0f, "three-quarter turn origin");
        point(geometry(3).map(210f, 120f), 0f, 500f, "three-quarter turn far corner");
        for (int turn = 0; turn < 4; turn++) {
            AtomicWorkbenchInputPolicy.Geometry value = geometry(turn);
            point(value.map(110f, 70f), 500f, 250f, "center rotation " + turn);
            float[] matrix = value.matrixValues();
            float[] mapped = value.map(34.5f, 91.25f);
            point(mapped, matrix[0] * 34.5f + matrix[1] * 91.25f + matrix[2],
                    matrix[3] * 34.5f + matrix[4] * 91.25f + matrix[5],
                    "Matrix and scalar mapping agree " + turn);
            matrix[2] = 9999f;
            point(value.map(110f, 70f), 500f, 250f, "matrix cannot mutate snapshot");
        }
        AtomicWorkbenchInputPolicy.Geometry onePixel =
                AtomicWorkbenchInputPolicy.Geometry.create(0, 0, 20, 30, 1, 1, 3);
        point(onePixel.map(15f, 20f), 0, 0, "single-pixel display");
        rejects(() -> AtomicWorkbenchInputPolicy.Geometry.create(0, 0, 0, 100, 100, 100, 0));
        rejects(() -> AtomicWorkbenchInputPolicy.Geometry.create(0, 0, -1, 100, 100, 100, 0));
        rejects(() -> AtomicWorkbenchInputPolicy.Geometry.create(Float.NaN, 0, 1, 1, 1, 1, 0));
        rejects(() -> AtomicWorkbenchInputPolicy.Geometry.create(0, 0, Float.POSITIVE_INFINITY, 1, 1, 1, 0));
        rejects(() -> AtomicWorkbenchInputPolicy.Geometry.create(0, 0, 1, 1, 0, 1, 0));
        rejects(() -> AtomicWorkbenchInputPolicy.Geometry.create(0, 0, 1, 1, 1, 1, 4));
        rejects(() -> plain.map(Float.NaN, 0));
        rejects(() -> plain.map(0, Float.NEGATIVE_INFINITY));

        AtomicWorkbenchInputPolicy.GestureSession session =
                new AtomicWorkbenchInputPolicy.GestureSession();
        require(!session.begin(1L, plain, 1, 1), "outside DOWN cannot own routing");
        require(session.begin(42L, plain, 20, 30), "inside DOWN starts routing");
        require(session.matches(42L) && !session.matches(43L), "exact session identity");
        require(session.geometry(43L) == null, "stale session receives no mapping");
        require(!session.begin(43L, geometry(1), 20, 30), "second DOWN cannot replace active mapping");
        point(session.geometry(42L).map(20, 30), 50, 50, "active geometry remains fixed");
        session.end();
        require(session.geometry(42L) == null && !session.matches(42L), "cancel invalidates routing");
        require(session.begin(43L, geometry(1), 20, 30), "new session starts after cancel");
        point(session.geometry(43L).map(20, 30), 100, 475, "new geometry only on next DOWN");
        session.end();
        session.end();
        System.out.println("Atomic workbench input policy checks: OK");
    }

    private static AtomicWorkbenchInputPolicy.Geometry geometry(int quarterTurns) {
        return AtomicWorkbenchInputPolicy.Geometry.create(10, 20, 200, 100, 1001, 501, quarterTurns);
    }

    private static void point(float[] actual, float x, float y, String description) {
        require(Math.abs(actual[0] - x) < 0.001f && Math.abs(actual[1] - y) < 0.001f,
                description + ": " + actual[0] + "," + actual[1]);
    }

    private static void rejects(Runnable operation) {
        try { operation.run(); }
        catch (IllegalArgumentException expected) { return; }
        throw new AssertionError("invalid geometry/coordinate accepted");
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
