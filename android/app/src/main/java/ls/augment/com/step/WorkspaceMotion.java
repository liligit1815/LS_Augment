package ls.augment.com.step;

/** Physical coordinates on the original screen; scale is uniform throughout a flip. */
public final class WorkspaceMotion {
    public final float x, y, scale;
    public WorkspaceMotion(float x,float y,float scale) { this.x=x; this.y=y; this.scale=scale; }

    public static WorkspaceMotion place(WorkspaceLayout layout,int slot,int count) {
        if(slot<0)return new WorkspaceMotion(layout.mainX,layout.top,layout.mainScale);
        PreviewGeometry fit=new PreviewGeometry(layout.width,layout.height,layout.sideWidth,layout.rowHeight(slot,count));
        return new WorkspaceMotion(layout.sideX+fit.x,layout.top+layout.rowTop(slot,count)+fit.y,fit.scale);
    }
    public WorkspaceMotion towards(WorkspaceMotion to,float progress) {
        float p=Math.max(0,Math.min(1,progress));
        return new WorkspaceMotion(x+(to.x-x)*p,y+(to.y-y)*p,scale+(to.scale-scale)*p);
    }
    public static int destinationSlot(int source,int selected){
        if(source<0)return selected;
        return source==selected?-1:source;
    }
    public static boolean acceptsRelease(float outward,float vertical,int width,int minimum,int slop){
        return outward>=Math.max(width*.28f,Math.max(minimum,3f*slop))
                && outward>=Math.abs(vertical)*1.5f;
    }
    public static long releaseTime(float from,float to,int width) {
        if(width<=0)throw new IllegalArgumentException("副格尺寸无效");
        return Math.max(90, Math.round(220*Math.min(1f,Math.abs(to-from)/width)));
    }
}
