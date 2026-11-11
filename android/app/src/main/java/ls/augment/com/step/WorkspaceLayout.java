package ls.augment.com.step;

/** One physical layout shared by the display owner, previews, input and transitions. */
public final class WorkspaceLayout {
    public final int sideX, sideWidth, top, railHeight, gap, mainX, width, height;
    public final int count, topInset;
    public final int contentHeight, mainLogicalHeight;
    public final boolean reflow;
    public final boolean compact;
    public final float mainScale;
    public WorkspaceLayout(int width, int height, float density, boolean left) {
        this(width,height,density,left,3,0);
    }
    public WorkspaceLayout(int width, int height, float density, boolean left,int count,int topInset) {
        this(width,height,density,left,count,topInset,false);
    }
    /** Reflow-capable systems keep a 16:9 top page and tile the remaining screen. */
    public WorkspaceLayout(int width,int height,float density,boolean left,int count,int topInset,boolean reflow){
        if (width < 1 || height<1 || !Float.isFinite(density) || density <= 0) throw new IllegalArgumentException("工作区尺寸不可用");
        if(count<1 || count>5 || topInset<0 || topInset>=height/3)throw new IllegalArgumentException("工作区格数或安全边界无效");
        this.width=width; this.height=height;
        this.count=count;this.topInset=topInset;this.reflow=reflow;
        if(reflow){
            compact=false;gap=0;
            contentHeight=Math.round(width*9f/16f);top=contentHeight;railHeight=height-top;
            if(contentHeight-topInset<Math.round(144*density) || railHeight<Math.round(160*density))
                throw new IllegalArgumentException("当前屏幕无法容纳顶区内容与可操作的工作区");
            sideWidth=Math.round(railHeight*(float)width/(height*Math.max(3,count)));
            int mainWidth=width-sideWidth;
            mainScale=mainWidth/(float)width;
            mainLogicalHeight=Math.round(railHeight/mainScale);
            mainX=left?sideWidth:0;sideX=left?0:mainWidth;
            return;
        }
        compact=count>3;mainLogicalHeight=height;
        gap=Math.max(2,Math.round(2.18f*density));
        int rows=Math.max(3,count);
        int column=Math.round((width + rows*(float)gap - (rows-1f)*gap*width/height)/(rows+1));
        // Solve both app regions together. Growing the toolbar independently
        // shrinks the main task below its column width and creates black gutters.
        top=Math.round((float)height*column/width);
        contentHeight=top;
        railHeight=height-top;
        sideWidth=column-gap;
        if (sideWidth<=0 || railHeight<=4*gap) throw new IllegalArgumentException("副格尺寸不足");
        mainScale=Math.min((float)(width-column)/width,(float)railHeight/height);
        mainX=left?column:0;
        sideX=left?0:width-sideWidth;
    }
    public int rowTop(int slot,int count) {
        if(count<1 || count>5 || slot<0 || slot>count)throw new IllegalArgumentException("副格位置无效");
        return (railHeight+gap)*slot/Math.max(3,count);
    }
    public int rowHeight(int slot,int count) {
        return rowTop(slot+1,count)-rowTop(slot,count)-gap;
    }
    public static WorkspaceLayout create(int w,int h,float d,boolean left,int count,int inset,boolean reflow){
        return new WorkspaceLayout(w,h,d,left,count,inset,reflow);
    }
    public static float outward(float delta,boolean left) { return left?-delta:delta; }
}
