package ls.augment.com.step;

/** The top band spans the screen. Three full-aspect side cells and the main pane share a baseline. */
public final class WorkspaceLayout {
    public final int sideX, sideWidth, top, railHeight, gap, mainX, width, height;
    public final float mainScale;
    public WorkspaceLayout(int width, int height, float density, boolean left) {
        if (width < 1 || height<1 || !Float.isFinite(density) || density <= 0) throw new IllegalArgumentException("工作区尺寸不可用");
        this.width=width; this.height=height;
        gap=Math.max(2,Math.round(2.18f*density));
        int column=Math.round((width + 3f*gap - 2f*gap*width/height)/4f);
        sideWidth=column-gap;
        int threeRowTop=Math.round((float)height*column/width);
        // Two 44dp action rows also need room for the existing control/music page.
        // Both the native display owner and SystemUI derive the same physical geometry.
        top=Math.max(threeRowTop,Math.min(height/2,Math.round(208*density)));
        railHeight=height-top;
        if (sideWidth<=0 || railHeight<=4*gap) throw new IllegalArgumentException("副格尺寸不足");
        mainScale=Math.min((float)(width-column)/width,(float)railHeight/height);
        mainX=(left?column:0)+Math.round((width-column-width*mainScale)/2);
        sideX=left?0:width-sideWidth;
    }
    public int rowTop(int slot,int count) {
        return (railHeight+gap)*slot/count;
    }
    public int rowHeight(int slot,int count) {
        return rowTop(slot+1,count)-rowTop(slot,count)-gap;
    }
    public static float outward(float delta,boolean left) { return left?-delta:delta; }
}
