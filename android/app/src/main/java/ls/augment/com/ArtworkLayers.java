package ls.augment.com;

import android.graphics.Canvas;

/** Optional artwork overlay for individual parts of an existing vector painter. */
public interface ArtworkLayers {
    boolean draw(Canvas canvas,String id,String layer,float left,float top,float right,float bottom,int color);
}
