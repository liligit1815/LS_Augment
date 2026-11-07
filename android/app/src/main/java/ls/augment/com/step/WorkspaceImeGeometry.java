package ls.augment.com.step;

/** Physical keyboard edge and the app's native visible bottom share logical display coordinates. */
public final class WorkspaceImeGeometry {
    public static float top(WorkspaceLayout layout,boolean docked,int keyboardTop,int contentBottom,int clearance){
        if(!docked || keyboardTop<=0 || keyboardTop>=layout.height || contentBottom<=0 || contentBottom>layout.height)
            return layout.top;
        // Retain the app's own resize/pan. Correct only its extra displacement from Step.
        return Math.min(layout.top,keyboardTop-Math.max(0,clearance)-layout.mainScale*contentBottom);
    }
}
