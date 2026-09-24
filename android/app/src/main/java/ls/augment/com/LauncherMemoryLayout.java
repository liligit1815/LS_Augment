package ls.augment.com;

/** A logical top/left region rotated inside the launcher's safe host bounds. */
public final class LauncherMemoryLayout {
    public final int rotation, width, height;
    private final int left, top, right, bottom;

    public LauncherMemoryLayout(int degrees, int left, int top, int right, int bottom) {
        rotation = ((Math.round(degrees / 90f) * 90) % 360 + 360) % 360;
        this.left = left;
        this.top = top;
        this.right = Math.max(left + 1, right);
        this.bottom = Math.max(top + 1, bottom);
        boolean sideways = rotation == 90 || rotation == 270;
        width = sideways ? this.bottom - top : this.right - left;
        height = sideways ? this.right - left : this.bottom - top;
    }

    public int x(int logicalLeft, int logicalTop) {
        switch (rotation) {
            case 90: return right - logicalTop;
            case 180: return right - logicalLeft;
            case 270: return left + logicalTop;
            default: return left + logicalLeft;
        }
    }

    public int y(int logicalLeft, int logicalTop) {
        switch (rotation) {
            case 90: return top + logicalLeft;
            case 180: return bottom - logicalTop;
            case 270: return bottom - logicalLeft;
            default: return top + logicalTop;
        }
    }
}
