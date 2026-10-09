package ls.augment.com;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewParent;

/** Maps a view's visible box, not its scrolled text/content, into an ancestor viewport. */
public final class GlassGeometry {
    private GlassGeometry() { }

    public static boolean map(View child, View ancestor, Rect bounds, boolean allowScale) {
        float left=bounds.left, top=bounds.top, right=bounds.right, bottom=bounds.bottom;
        for (View node=child; node!=ancestor; ) {
            if (node==null) return false;
            ViewParent parent=node.getParent();
            if (!(parent instanceof View)) return false;
            View container=(View)parent;
            float sx=node.getScaleX(), sy=node.getScaleY();
            if (!Float.isFinite(sx)||!Float.isFinite(sy)||node.getRotation()!=0
                    ||node.getRotationX()!=0||node.getRotationY()!=0
                    ||(allowScale ? sx<.5f||sx>1.5f||sy<.5f||sy>1.5f : sx!=1||sy!=1)) return false;
            float dx=node.getLeft()+node.getTranslationX()+node.getPivotX()*(1-sx)-container.getScrollX();
            float dy=node.getTop()+node.getTranslationY()+node.getPivotY()*(1-sy)-container.getScrollY();
            left=left*sx+dx; right=right*sx+dx;
            top=top*sy+dy; bottom=bottom*sy+dy;
            node=container;
        }
        if (!Float.isFinite(left)||!Float.isFinite(top)||!Float.isFinite(right)||!Float.isFinite(bottom)
                ||left<Integer.MIN_VALUE+1d||top<Integer.MIN_VALUE+1d
                ||right>Integer.MAX_VALUE-1d||bottom>Integer.MAX_VALUE-1d) return false;
        bounds.set((int)Math.floor(left),(int)Math.floor(top),(int)Math.ceil(right),(int)Math.ceil(bottom));
        return !bounds.isEmpty();
    }
}
