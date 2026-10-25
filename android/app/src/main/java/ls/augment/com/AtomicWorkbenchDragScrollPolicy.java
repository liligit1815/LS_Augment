package ls.augment.com;

/** Density-independent edge speed; callers supply physical viewport and density-scaled limits. */
final class AtomicWorkbenchDragScrollPolicy {
    static float velocity(float pointer, float start, float end, float edge, float maximum) {
        if (!Float.isFinite(pointer) || !Float.isFinite(start) || !Float.isFinite(end)
                || !Float.isFinite(edge) || !Float.isFinite(maximum) || end <= start || edge <= 0 || maximum <= 0
                || pointer < start || pointer > end) return 0;
        float distance = Math.min(edge, (end - start) / 2f);
        if (pointer < start + distance) {
            float amount = (start + distance - pointer) / distance; return -maximum * amount * amount;
        }
        if (pointer > end - distance) {
            float amount = (pointer - end + distance) / distance; return maximum * amount * amount;
        }
        return 0;
    }
    static float distance(float velocity, long elapsedMillis) {
        if (!Float.isFinite(velocity) || elapsedMillis <= 0) return 0;
        return velocity * Math.min(64L, elapsedMillis) / 1000f;
    }
    private AtomicWorkbenchDragScrollPolicy() { }
}
