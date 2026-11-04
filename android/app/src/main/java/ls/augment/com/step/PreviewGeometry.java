package ls.augment.com.step;

/** Fit the full logical frame into the preview; never crop or change the app's density. */
public final class PreviewGeometry {
    public final float scale, x, y;
    public PreviewGeometry(int logicalWidth, int logicalHeight, int boxWidth, int boxHeight) {
        if (logicalWidth <= 0 || logicalHeight <= 0 || boxWidth <= 0 || boxHeight <= 0)
            throw new IllegalArgumentException("empty preview geometry");
        scale = Math.min((float) boxWidth / logicalWidth, (float) boxHeight / logicalHeight);
        x = (boxWidth - logicalWidth * scale) / 2f;
        y = (boxHeight - logicalHeight * scale) / 2f;
    }
}
