package ls.augment.com.step;

/** Physical keyboard edge and the app's native visible bottom share logical display coordinates. */
public final class WorkspaceImeGeometry {
    public static final class Pose {
        public final float scale,x,y;
        Pose(float scale,float x,float y){this.scale=scale;this.x=x;this.y=y;}
    }
    public static int visibleBottom(int windowBottom,int keyboardTop) {
        // ADJUST_NOTHING describes the WindowManager policy, not whether the app
        // consumes IME insets itself. Keep that native visible area in every mode.
        return windowBottom>0 && keyboardTop>0?Math.min(windowBottom,keyboardTop):0;
    }
    public static float top(WorkspaceLayout layout,boolean docked,int keyboardTop,int contentBottom,int clearance){
        return pose(layout,docked,keyboardTop,contentBottom,clearance).y;
    }
    public static Pose pose(WorkspaceLayout layout,boolean docked,int keyboardTop,int contentBottom,int clearance){
        Pose normal=new Pose(layout.mainScale,layout.mainX,layout.top);
        if(!docked || keyboardTop<=0 || keyboardTop>=layout.height || contentBottom<=0 || contentBottom>layout.height)
            return normal;
        float room=keyboardTop-Math.max(0,clearance)-layout.top;
        if(room<=0)return normal;
        // Fit the verified native visible viewport between the toolbar and IME.
        // Translating it upwards hides top editors even when bottom editors fit.
        // Only the main pane changes; the physical keyboard and native resize/pan stay native.
        float scale=Math.min(layout.mainScale,room/contentBottom);
        return new Pose(scale,layout.mainX+layout.width*(layout.mainScale-scale)/2f,layout.top);
    }
}
