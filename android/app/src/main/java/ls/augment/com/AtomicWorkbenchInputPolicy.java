package ls.augment.com;

/** Immutable view-to-display geometry and a gesture's fixed routing snapshot. */
public final class AtomicWorkbenchInputPolicy {
    private AtomicWorkbenchInputPolicy() { }

    public static final class Geometry {
        public final float left, top, viewWidth, viewHeight;
        public final int displayWidth, displayHeight, rotationQuarterTurns;
        private final float[] values;

        private Geometry(float left, float top, float viewWidth, float viewHeight,
                int displayWidth, int displayHeight, int rotationQuarterTurns) {
            this.left = left;
            this.top = top;
            this.viewWidth = viewWidth;
            this.viewHeight = viewHeight;
            this.displayWidth = displayWidth;
            this.displayHeight = displayHeight;
            this.rotationQuarterTurns = rotationQuarterTurns;
            float w = displayWidth - 1f, h = displayHeight - 1f;
            float sx = w / viewWidth, sy = h / viewHeight;
            switch (rotationQuarterTurns) {
                case 1:
                    values = new float[] {0f, w / viewHeight, -top * w / viewHeight,
                            -h / viewWidth, 0f, h + left * h / viewWidth, 0f, 0f, 1f};
                    break;
                case 2:
                    values = new float[] {-sx, 0f, w + left * sx,
                            0f, -sy, h + top * sy, 0f, 0f, 1f};
                    break;
                case 3:
                    values = new float[] {0f, -w / viewHeight, w + top * w / viewHeight,
                            h / viewWidth, 0f, -left * h / viewWidth, 0f, 0f, 1f};
                    break;
                default:
                    values = new float[] {sx, 0f, -left * sx,
                            0f, sy, -top * sy, 0f, 0f, 1f};
            }
            for (float value : values) {
                if (!Float.isFinite(value)) throw new IllegalArgumentException("geometry overflows");
            }
        }

        /** Rotation is the clockwise rotation of the displayed image, in quarter turns. */
        public static Geometry create(float left, float top, float viewWidth, float viewHeight,
                int displayWidth, int displayHeight, int rotationQuarterTurns) {
            if (!Float.isFinite(left) || !Float.isFinite(top)
                    || !Float.isFinite(viewWidth) || !Float.isFinite(viewHeight)
                    || viewWidth <= 0f || viewHeight <= 0f
                    || !Float.isFinite(left + viewWidth) || !Float.isFinite(top + viewHeight)
                    || displayWidth < 1 || displayHeight < 1
                    || rotationQuarterTurns < 0 || rotationQuarterTurns > 3) {
                throw new IllegalArgumentException("invalid display geometry");
            }
            return new Geometry(left, top, viewWidth, viewHeight,
                    displayWidth, displayHeight, rotationQuarterTurns);
        }

        /** Suitable for Matrix.setValues; a defensive copy protects an active gesture. */
        public float[] matrixValues() { return values.clone(); }

        /** Gate a new DOWN; later drag events may legitimately leave this rectangle. */
        public boolean contains(float x, float y) {
            return Float.isFinite(x) && Float.isFinite(y)
                    && x >= left && y >= top && x < left + viewWidth && y < top + viewHeight;
        }

        /** Finite out-of-bounds coordinates are retained so drags are not cut off at the edge. */
        public float[] map(float x, float y) {
            if (!Float.isFinite(x) || !Float.isFinite(y))
                throw new IllegalArgumentException("invalid pointer coordinate");
            float mappedX = values[0] * x + values[1] * y + values[2];
            float mappedY = values[3] * x + values[4] * y + values[5];
            if (!Float.isFinite(mappedX) || !Float.isFinite(mappedY))
                throw new IllegalArgumentException("pointer mapping overflows");
            return new float[] {mappedX, mappedY};
        }
    }

    /** One DOWN owns its geometry and session until UP/CANCEL; stale sessions cannot reuse it. */
    public static final class GestureSession {
        private long sessionId = -1L;
        private Geometry geometry;

        public boolean begin(long newSessionId, Geometry snapshot, float downX, float downY) {
            if (geometry != null || newSessionId < 0L || snapshot == null
                    || !snapshot.contains(downX, downY)) return false;
            sessionId = newSessionId;
            geometry = snapshot;
            return true;
        }

        public boolean matches(long candidateSessionId) {
            return geometry != null && sessionId == candidateSessionId;
        }

        public Geometry geometry(long candidateSessionId) {
            return matches(candidateSessionId) ? geometry : null;
        }

        public void end() {
            geometry = null;
            sessionId = -1L;
        }
    }
}
