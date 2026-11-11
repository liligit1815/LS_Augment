package ls.augment.com;

import android.content.Context;
import android.graphics.*;
import android.view.*;

/** The entire visible 16:9 frame is the saved image. No external crop application is required. */
final class WallpaperCropView extends View {
    final WallpaperCropTransform pose=new WallpaperCropTransform();
    final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
    final ScaleGestureDetector detector;
    Bitmap bitmap;
    Runnable changed;
    float lastX,lastY;
    int pointer=-1;
    WallpaperCropView(Context context){
        super(context);setContentDescription("16:9 壁纸裁剪，拖动移动，双指缩放");
        detector=new ScaleGestureDetector(context,new ScaleGestureDetector.SimpleOnScaleGestureListener(){
            @Override public boolean onScale(ScaleGestureDetector d){
                pose.zoomAt(pose.zoom*d.getScaleFactor(),d.getFocusX()/getWidth(),d.getFocusY()/getHeight());update();return true;
            }
        });
    }
    @Override protected void onMeasure(int width,int height){
        int w=MeasureSpec.getSize(width);setMeasuredDimension(w,Math.round(w*9f/16));
    }
    void update(){
        if(bitmap!=null)pose.constrain(getWidth(),getHeight(),bitmap.getWidth(),bitmap.getHeight());
        invalidate();if(changed!=null)changed.run();
    }
    void drawImage(Canvas c,int width,int height){
        if(bitmap==null)return;
        pose.constrain(width,height,bitmap.getWidth(),bitmap.getHeight());
        float scale=pose.ratio(width,height,bitmap.getWidth(),bitmap.getHeight());
        c.save();c.translate(width*(.5f+pose.x),height*(.5f+pose.y));c.scale(scale,scale);
        c.drawBitmap(bitmap,-bitmap.getWidth()/2f,-bitmap.getHeight()/2f,paint);c.restore();
    }
    @Override protected void onDraw(Canvas c){super.onDraw(c);drawImage(c,getWidth(),getHeight());}
    @Override public boolean onTouchEvent(MotionEvent e){
        if(bitmap==null || !isEnabled())return false;
        int action=e.getActionMasked();
        if(action==MotionEvent.ACTION_DOWN){getParent().requestDisallowInterceptTouchEvent(true);pointer=e.getPointerId(0);lastX=e.getX();lastY=e.getY();}
        detector.onTouchEvent(e);
        int index=e.findPointerIndex(pointer);
        if(action==MotionEvent.ACTION_MOVE && index>=0){
            float x=e.getX(index),y=e.getY(index);
            if(!detector.isInProgress() && e.getPointerCount()==1){pose.x+=(x-lastX)/getWidth();pose.y+=(y-lastY)/getHeight();update();}
            lastX=x;lastY=y;
        }
        if(action==MotionEvent.ACTION_POINTER_UP){
            int next=e.getActionIndex()==0?1:0;pointer=e.getPointerId(next);lastX=e.getX(next);lastY=e.getY(next);
        }
        if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){pointer=-1;getParent().requestDisallowInterceptTouchEvent(false);if(action==MotionEvent.ACTION_UP)performClick();}
        return true;
    }
    @Override public boolean performClick(){super.performClick();return true;}
    Bitmap render(){Bitmap result=Bitmap.createBitmap(1920,1080,Bitmap.Config.ARGB_8888);drawImage(new Canvas(result),1920,1080);return result;}
}
