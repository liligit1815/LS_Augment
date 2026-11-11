package ls.augment.com;

/** Normalized crop pose, independent of density and view size. */
final class WallpaperCropTransform {
    float zoom=1,x,y;
    float ratio(float width,float height,float imageWidth,float imageHeight){
        return Math.max(width/imageWidth,height/imageHeight)*zoom;
    }
    void constrain(float width,float height,float imageWidth,float imageHeight){
        zoom=Math.max(1,Math.min(4,zoom));
        if(width<=0 || height<=0 || imageWidth<=0 || imageHeight<=0)return;
        float ratio=ratio(width,height,imageWidth,imageHeight);
        float maxX=Math.max(0,(imageWidth*ratio/width-1)/2),maxY=Math.max(0,(imageHeight*ratio/height-1)/2);
        x=Math.max(-maxX,Math.min(maxX,x));y=Math.max(-maxY,Math.min(maxY,y));
    }
    void zoomAt(float value,float focusX,float focusY){
        float next=Math.max(1,Math.min(4,value)),factor=next/zoom;
        x=focusX-.5f-(focusX-.5f-x)*factor;
        y=focusY-.5f-(focusY-.5f-y)*factor;zoom=next;
    }
}
