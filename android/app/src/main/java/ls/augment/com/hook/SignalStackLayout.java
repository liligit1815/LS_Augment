package ls.augment.com.hook;

/** Fits two signal glyphs without flattening them or exceeding their native slot. */
final class SignalStackLayout {
    private SignalStackLayout() { }
    /** Use the native image content frame, capped to a modest increase over its glyph. */
    static float referenceHeight(float nativeHeight,float frameHeight,float slotHeight){
        if(!Float.isFinite(nativeHeight)||!Float.isFinite(slotHeight)||nativeHeight<=0||slotHeight<=0)return 0;
        float frame=Float.isFinite(frameHeight)&&frameHeight>0?frameHeight:nativeHeight;
        return Math.min(slotHeight,Math.max(nativeHeight,Math.min(frame,nativeHeight*1.2f)));
    }
    /** Fit the supplied PNG ink at native glyph height, without Honor's wide-frame shrink. */
    static Geometry ios(float left,float top,float width,float height,float slotWidth,float slotHeight,boolean single){
        if(!Float.isFinite(left)||!Float.isFinite(top)||!Float.isFinite(width)||!Float.isFinite(height)
                ||!Float.isFinite(slotWidth)||!Float.isFinite(slotHeight)||width<=0||height<=0||slotWidth<=0||slotHeight<=0)return null;
        float units=single?42:37;
        float h=Math.min(height,slotHeight),w=h*47f/units;
        if(w>slotWidth){w=slotWidth;h=w*units/47f;}
        float gap=single?0:h*2f/37f;
        float x=Math.max(0,Math.min(slotWidth-w,left+(width-w)/2));
        float y=Math.max(0,Math.min(slotHeight-h,top+(height-h)/2));
        return new Geometry(x,y,w,single?h:(h-gap)/2,gap,single?1:2);
    }
    static Geometry compact(float left,float top,float width,float height,float slotWidth,float slotHeight,float requestedGap){
        if(!Float.isFinite(left)||!Float.isFinite(top)||!Float.isFinite(width)||!Float.isFinite(height)
                ||!Float.isFinite(slotWidth)||!Float.isFinite(slotHeight)||width<=0||height<=0||slotWidth<=0||slotHeight<=0)return null;
        float h=Math.min(height,slotHeight),w=h*(85f/75f);
        if(w>slotWidth){w=slotWidth;h=w/(85f/75f);}
        float gap=h*(5f/75f);
        float x=Math.max(0,Math.min(slotWidth-w,left+(width-w)/2));
        float y=Math.max(0,Math.min(slotHeight-h,top+(height-h)/2));
        return new Geometry(x,y,w,(h-gap)/2,gap);
    }
    static Geometry compactSingle(float left,float top,float width,float height,float slotWidth,float slotHeight){
        if(!Float.isFinite(left)||!Float.isFinite(top)||!Float.isFinite(width)||!Float.isFinite(height)
                ||!Float.isFinite(slotWidth)||!Float.isFinite(slotHeight)||width<=0||height<=0||slotWidth<=0||slotHeight<=0)return null;
        float h=Math.min(height,slotHeight),w=h*(85f/35f);
        if(w>slotWidth){w=slotWidth;h=w/(85f/35f);}
        float x=Math.max(0,Math.min(slotWidth-w,left+(width-w)/2));
        float y=Math.max(0,Math.min(slotHeight-h,top+(height-h)/2));
        return new Geometry(x,y,w,h,0,1);
    }

    static final class Geometry {
        final float left, top, width, rowHeight, gap;
        final int rows;
        Geometry(float left, float top, float width, float rowHeight, float gap) {
            this(left,top,width,rowHeight,gap,2);
        }
        Geometry(float left, float top, float width, float rowHeight, float gap,int rows) {
            this.left = left;
            this.top = top;
            this.width = width;
            this.rowHeight = rowHeight;
            this.gap = gap;
            this.rows=rows;
        }
        float height() { return rowHeight * rows + gap; }
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
