package ls.augment.com.hook;

/** Fits two signal glyphs without flattening them or exceeding their native slot. */
final class SignalStackLayout {
    private SignalStackLayout() { }
    static Geometry compact(float left,float top,float width,float height,float slotWidth,float slotHeight,float requestedGap){
        if(!Float.isFinite(left)||!Float.isFinite(top)||!Float.isFinite(width)||!Float.isFinite(height)
                ||!Float.isFinite(slotWidth)||!Float.isFinite(slotHeight)||width<=0||height<=0||slotWidth<=0||slotHeight<=0)return null;
        float h=Math.min(height,slotHeight),w=Math.min(Math.min(width,slotWidth),h*1.3f);
        h=w/1.3f;float gap=h*.14f;
        float x=Math.max(0,Math.min(slotWidth-w,left+(width-w)/2));
        float y=Math.max(0,Math.min(slotHeight-h,top+(height-h)/2));
        return new Geometry(x,y,w,(h-gap)/2,gap);
    }

    static final class Geometry {
        final float left, top, width, rowHeight, gap;
        Geometry(float left, float top, float width, float rowHeight, float gap) {
            this.left = left;
            this.top = top;
            this.width = width;
            this.rowHeight = rowHeight;
            this.gap = gap;
        }
        float height() { return rowHeight * 2 + gap; }
    }

    static Geometry fit(float left, float top, float width, float height,
            float slotWidth, float slotHeight, float requestedGap) {
        if (!Float.isFinite(left) || !Float.isFinite(top)
                || !Float.isFinite(width) || !Float.isFinite(height)
                || !Float.isFinite(slotWidth) || !Float.isFinite(slotHeight)
                || !Float.isFinite(requestedGap)
                || width <= 0 || height <= 0 || slotWidth <= 0 || slotHeight < 2) return null;
        float gap = Math.min(Math.max(0, requestedGap), slotHeight - 2);
        float rowHeight = Math.min(height, (slotHeight - gap) / 2);
        rowHeight = Math.min(rowHeight, slotWidth * height / width);
        float rowWidth = width * rowHeight / height;
        float totalHeight = rowHeight * 2 + gap;
        float x = Math.max(0, Math.min(slotWidth - rowWidth, left + (width - rowWidth) / 2));
        float y = Math.max(0, Math.min(slotHeight - totalHeight, top + (height - totalHeight) / 2));
        return new Geometry(x, y, rowWidth, rowHeight, gap);
    }
}
