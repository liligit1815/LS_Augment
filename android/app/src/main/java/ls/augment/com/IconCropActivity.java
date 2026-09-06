package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.graphics.*;
import android.net.Uri;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.util.concurrent.*;

/** The selected image is decoded with its orientation, then cropped locally. */
public final class IconCropActivity extends Activity {
    private UiKit ui;private Crop crop;private Button done;private final ExecutorService worker=Executors.newSingleThreadExecutor();
    @Override public void onCreate(Bundle saved){
        super.onCreate(saved);ui=new UiKit(this);LinearLayout page=ui.scrollPage();page.addView(ui.header("裁剪图片",true));
        page.addView(ui.text("拖动图片调整位置，双指缩放。方框内的内容会保存为图标。",12,ui.muted,false));
        crop=new Crop();page.addView(crop,new LinearLayout.LayoutParams(-1,ui.dp(300)));
        done=ui.accentButton("使用这张图片");done.setEnabled(false);page.addView(done,ui.margins(0,12,0,0));
        done.setOnClickListener(v->{done.setEnabled(false);Bitmap result=crop.render(512);worker.execute(()->{try{String hash=LauncherIconStore.save(this,result);runOnUiThread(()->{setResult(RESULT_OK,new Intent().putExtra("icon",hash));finish();});}
            catch(Exception e){runOnUiThread(()->{done.setEnabled(true);Toast.makeText(this,"图标保存失败",Toast.LENGTH_LONG).show();});}finally{result.recycle();}});});
        Uri uri=getIntent().getData();worker.execute(()->{try{Bitmap b=ImageDecoder.decodeBitmap(ImageDecoder.createSource(getContentResolver(),uri),(decoder,info,source)->{
                int w=info.getSize().getWidth(),h=info.getSize().getHeight();float f=Math.min(1f,2048f/Math.max(w,h));decoder.setTargetSize(Math.max(1,(int)(w*f)),Math.max(1,(int)(h*f)));decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);});
            runOnUiThread(()->{if(isDestroyed()){b.recycle();return;}crop.bitmap=b;if(saved!=null){crop.zoom=saved.getFloat("zoom",1);crop.x=saved.getFloat("x");crop.y=saved.getFloat("y");}crop.invalidate();done.setEnabled(true);});
        }catch(Exception e){runOnUiThread(()->{Toast.makeText(this,"无法读取所选图片",Toast.LENGTH_LONG).show();finish();});}});
    }
    @Override protected void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);state.putFloat("zoom",crop.zoom);state.putFloat("x",crop.x);state.putFloat("y",crop.y);}
    @Override protected void onDestroy(){worker.shutdown();super.onDestroy();}
    private final class Crop extends View {
        Bitmap bitmap;float zoom=1,x,y,lastX,lastY;final Paint paint=new Paint(3);final ScaleGestureDetector scale;
        Crop(){super(IconCropActivity.this);scale=new ScaleGestureDetector(getContext(),new ScaleGestureDetector.SimpleOnScaleGestureListener(){public boolean onScale(ScaleGestureDetector d){zoom=Math.max(1,Math.min(8,zoom*d.getScaleFactor()));clamp();invalidate();return true;}});setLayerType(View.LAYER_TYPE_SOFTWARE,null);}
        float edge(){return Math.min(getWidth(),getHeight())*.92f;}
        float ratio(){return bitmap==null?1:edge()/Math.min(bitmap.getWidth(),bitmap.getHeight())*zoom;}
        void clamp(){if(bitmap==null)return;float f=ratio(),e=edge();x=Math.max(-(bitmap.getWidth()*f-e)/2,Math.min((bitmap.getWidth()*f-e)/2,x));y=Math.max(-(bitmap.getHeight()*f-e)/2,Math.min((bitmap.getHeight()*f-e)/2,y));}
        void image(Canvas c,float centerX,float centerY,float factor){if(bitmap==null)return;c.translate(centerX+x*factor,centerY+y*factor);c.scale(ratio()*factor,ratio()*factor);c.drawBitmap(bitmap,-bitmap.getWidth()/2f,-bitmap.getHeight()/2f,paint);}
        @Override protected void onDraw(Canvas c){super.onDraw(c);c.drawColor(0xffdcefff);if(bitmap==null)return;clamp();float e=edge(),left=(getWidth()-e)/2,top=(getHeight()-e)/2;
            c.save();c.clipRect(left,top,left+e,top+e);image(c,getWidth()/2f,getHeight()/2f,1);c.restore();paint.setStyle(Paint.Style.STROKE);paint.setColor(ui.accent);paint.setStrokeWidth(ui.dp(2));c.drawRect(left,top,left+e,top+e,paint);paint.setStyle(Paint.Style.FILL);}
        @Override public boolean onTouchEvent(MotionEvent e){getParent().requestDisallowInterceptTouchEvent(true);scale.onTouchEvent(e);
            if(e.getActionMasked()==MotionEvent.ACTION_DOWN){lastX=e.getX();lastY=e.getY();return true;}
            if(e.getActionMasked()==MotionEvent.ACTION_MOVE){if(!scale.isInProgress()&&e.getPointerCount()==1){x+=e.getX()-lastX;y+=e.getY()-lastY;clamp();invalidate();}lastX=e.getX();lastY=e.getY();}
            if(e.getActionMasked()==MotionEvent.ACTION_UP){performClick();getParent().requestDisallowInterceptTouchEvent(false);}return true;}
        @Override public boolean performClick(){return super.performClick();}
        Bitmap render(int size){clamp();Bitmap b=Bitmap.createBitmap(size,size,Bitmap.Config.ARGB_8888);Canvas c=new Canvas(b);image(c,size/2f,size/2f,size/edge());return b;}
    }
}
