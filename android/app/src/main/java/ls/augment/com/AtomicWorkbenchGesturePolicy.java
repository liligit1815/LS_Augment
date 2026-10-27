package ls.augment.com;

/** Single-finger, default-display corner gesture. Coordinates stay only in this live detector. */
public final class AtomicWorkbenchGesturePolicy {
    public static final int NONE = 0, LEFT = 1, RIGHT = 2;
    public static final int DOWN = 0, UP = 1, MOVE = 2, CANCEL = 3;
    public static final long COOLDOWN_MS = 1200L;
    public static final int AREA_DEFAULT = 100, AREA_MIN = 50, AREA_MAX = 120;
    public static final int SENSITIVITY_DEFAULT = 100, SENSITIVITY_MIN = 60, SENSITIVITY_MAX = 160;
    private AtomicWorkbenchGesturePolicy() { }

    public static final class Geometry {
        final float width, height, density, minY, maxY, edge, minInward;
        final int areaPercent, sensitivityPercent;
        private Geometry(float width, float height, float density, float statusBar,
                int areaPercent, int sensitivityPercent) {
            this.width = width; this.height = height; this.density = density;
            this.areaPercent = areaPercent; this.sensitivityPercent = sensitivityPercent;
            minY = statusBar + 8f * density;
            // A shallow band below the status bar, rather than the full side edge.
            // The status-bar exclusion leaves notification/control-center input native.
            maxY = Math.min(height * .20f, minY + 48f * density * areaPercent / 100f);
            edge = Math.min(48f * density * areaPercent / 100f, width * .16f);
            minInward = 88f * 100f / sensitivityPercent;
        }
        public static Geometry create(float width, float height, float density, float statusBar) {
            return create(width, height, density, statusBar, AREA_DEFAULT, SENSITIVITY_DEFAULT);
        }
        public static Geometry create(float width, float height, float density, float statusBar,
                int areaPercent, int sensitivityPercent) {
            if (!Float.isFinite(width) || !Float.isFinite(height) || !Float.isFinite(density)
                    || !Float.isFinite(statusBar) || width < 240f || height < 240f || density <= 0f
                    || density > 8f || statusBar < 0f || statusBar >= height
                    || areaPercent < AREA_MIN || areaPercent > AREA_MAX
                    || sensitivityPercent < SENSITIVITY_MIN || sensitivityPercent > SENSITIVITY_MAX)
                throw new IllegalArgumentException("invalid gesture display geometry");
            Geometry geometry = new Geometry(width, height, density, statusBar, areaPercent, sensitivityPercent);
            if (geometry.maxY <= geometry.minY) throw new IllegalArgumentException("gesture region unavailable");
            return geometry;
        }
        int side(float x, float y) {
            if (x < 0 || x >= width || y < minY || y > maxY) return NONE;
            return x <= edge ? LEFT : x >= width - edge ? RIGHT : NONE;
        }
        boolean same(Geometry other) {
            return other != null && width == other.width && height == other.height && density == other.density
                    && minY == other.minY && maxY == other.maxY
                    && areaPercent == other.areaPercent && sensitivityPercent == other.sensitivityPercent;
        }
    }

    public static final class Detector {
        private Geometry geometry;
        private int side;
        private float downX, downY, maxInward;
        private long downTime, lastTime, lastTriggered = -1L;
        public void cancel() { side = NONE; geometry = null; }

        /** A trigger is emitted once, on UP. Neither system nor application input is consumed. */
        public int event(int action, int displayId, int pointerCount, boolean touchscreen, boolean enabled,
                float x, float y, long when, Geometry current) {
            if (!enabled || !touchscreen || displayId != 0 || pointerCount != 1 || current == null
                    || !Float.isFinite(x) || !Float.isFinite(y) || when < 0
                    || action != DOWN && action != UP && action != MOVE && action != CANCEL) {
                cancel(); return NONE;
            }
            if (action == CANCEL) { cancel(); return NONE; }
            if (action == DOWN) {
                cancel();
                if (lastTriggered >= 0 && (when < lastTriggered || when - lastTriggered < COOLDOWN_MS)) return NONE;
                int candidate = current.side(x, y);
                if (candidate == NONE) return NONE;
                geometry = current; side = candidate; downX = x; downY = y;
                maxInward = 0; downTime = lastTime = when;
                return NONE;
            }
            if (side == NONE) return NONE;
            if (!geometry.same(current) || when < lastTime || when - downTime > 800L
                    || x < 0 || y < 0 || x >= geometry.width || y >= geometry.height) {
                cancel(); return NONE;
            }
            lastTime = when;
            float inward = (side == LEFT ? x - downX : downX - x) / geometry.density;
            float downward = (y - downY) / geometry.density;
            if (inward < -12f || maxInward - inward > 24f
                    || Math.abs(downward) > Math.min(24f, Math.max(12f, inward * .30f))) {
                cancel(); return NONE;
            }
            maxInward = Math.max(maxInward, inward);
            if (action != UP) return NONE;
            int triggered = NONE;
            if (when - downTime >= 80L && inward >= geometry.minInward) {
                triggered = side; lastTriggered = when;
            }
            cancel();
            return triggered;
        }
    }
}
