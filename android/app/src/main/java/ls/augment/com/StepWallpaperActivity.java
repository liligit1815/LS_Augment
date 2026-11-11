package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.ImageDecoder;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.View;
import android.widget.*;
import ls.augment.com.step.TopWallpaper;

/** Gallery selection followed by an explicit, local 16:9 crop confirmation. */
public final class StepWallpaperActivity extends Activity {
    final java.util.concurrent.ExecutorService worker=java.util.concurrent.Executors.newSingleThreadExecutor();
    ImageView preview;WallpaperCropView crop;TextView status;Button choose,reset,save,cancel;
    LinearLayout editor;ParameterSlider zoom;
    volatile boolean closed;
    boolean saving;
    long generation;int operation;
    Uri pending;
    @Override protected void onCreate(Bundle state){
        super.onCreate(state);generation=ResetWriteFence.generation();
        UiKit ui=new UiKit(this);LinearLayout body=ui.detailPage("顶部壁纸","device");
        ui.addDetailSectionTitle(body,"顶部工作区");LinearLayout card=ui.preferenceCard();body.addView(card,ui.wrap());
        preview=new ImageView(this){@Override protected void onMeasure(int width,int height){
            int w=View.MeasureSpec.getSize(width);super.onMeasure(width,View.MeasureSpec.makeMeasureSpec(Math.round(w*9f/16),View.MeasureSpec.EXACTLY));
        }};
        preview.setScaleType(ImageView.ScaleType.CENTER_CROP);preview.setContentDescription("顶部壁纸预览");card.addView(preview,ui.wrap());
        editor=new LinearLayout(this);editor.setOrientation(LinearLayout.VERTICAL);editor.setVisibility(View.GONE);card.addView(editor,ui.wrap());
        crop=new WallpaperCropView(this);editor.addView(crop,ui.wrap());
        editor.addView(ui.text("拖动调整位置，双指缩放。框内画面将保存为顶部壁纸。",12,ui.muted,false),ui.margins(0,8,0,4));
        TextView zoomTitle=ui.text("缩放（%）",14,ui.text,true);editor.addView(zoomTitle,ui.wrap());
        zoom=new ParameterSlider(ui,EnhancementOption.integer("step_wallpaper_zoom","device","缩放（%）","",100,100,400),"100",value->{
            if(saving)return;crop.pose.zoomAt(Integer.parseInt(value)/100f,.5f,.5f);crop.update();
        });editor.addView(zoom,ui.wrap());zoom.bindTitle(zoomTitle);
        crop.changed=()->zoom.setValue(Integer.toString(Math.round(crop.pose.zoom*100)));
        save=ui.accentButton("使用此裁剪");save.setOnClickListener(v->save());editor.addView(save,ui.margins(0,12,0,0));
        cancel=ui.textButton("取消裁剪");cancel.setOnClickListener(v->{if(!saving){operation++;pending=null;crop.bitmap=null;editing(false);load();}});editor.addView(cancel,ui.wrap());
        status=ui.text("",12,ui.muted,false);card.addView(status,ui.margins(0,8,0,8));
        choose=ui.tonalButton("从图库选择");choose.setOnClickListener(v->{
            if(ResetWriteFence.stale(generation)){finish();return;}
            Intent gallery=new Intent(Intent.ACTION_PICK).setType("image/*").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            try{
                if(gallery.resolveActivity(getPackageManager())==null)gallery=new Intent(MediaStore.ACTION_PICK_IMAGES).setType("image/*");
                startActivityForResult(gallery,1);
            }catch(RuntimeException error){status.setText("当前没有可用的图库图片选择器");}
        });card.addView(choose,ui.wrap());
        reset=ui.textButton("跟随桌面壁纸");reset.setOnClickListener(v->{
            if(ResetWriteFence.stale(generation)){finish();return;}TopWallpaper.reset(this);load();
        });card.addView(reset,ui.wrap());
        String restored=state==null?null:state.getString("pending");
        if(restored!=null)decode(Uri.parse(restored),state);else load();
    }
    void editing(boolean value){editor.setVisibility(value?View.VISIBLE:View.GONE);preview.setVisibility(value?View.GONE:View.VISIBLE);
        choose.setVisibility(value?View.GONE:View.VISIBLE);reset.setVisibility(value?View.GONE:View.VISIBLE);}
    void load(){int stamp=++operation;worker.execute(()->{Bitmap image=TopWallpaper.load(this);runOnUiThread(()->{
        if(closed || stamp!=operation)return;preview.setImageBitmap(image);preview.setVisibility(image==null?View.GONE:View.VISIBLE);
        status.setText((TopWallpaper.custom(this)?"使用单独设置的壁纸":"跟随桌面壁纸")+"。顶部保持16:9，可左右滑动切换壁纸、应用和音乐。");
    });});}
    @Override protected void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);
        if(request==1 && result==RESULT_OK && data!=null && data.getData()!=null)decode(data.getData(),null);
    }
    void decode(Uri uri,Bundle restored){
        if(ResetWriteFence.stale(generation)){finish();return;}
        pending=uri;int stamp=++operation;choose.setEnabled(false);reset.setEnabled(false);status.setText("正在读取图片…");
        worker.execute(()->{
            Bitmap image=null;try{
                image=ImageDecoder.decodeBitmap(ImageDecoder.createSource(getContentResolver(),uri),(decoder,info,source)->{
                    int w=info.getSize().getWidth(),h=info.getSize().getHeight();float scale=Math.min(1f,4096f/Math.max(w,h));
                    decoder.setTargetSize(Math.max(1,Math.round(w*scale)),Math.max(1,Math.round(h*scale)));decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);
                });
            }catch(Exception ignored){}
            final Bitmap decoded=image;
            runOnUiThread(()->{if(closed || stamp!=operation)return;choose.setEnabled(true);reset.setEnabled(true);
                if(decoded==null){pending=null;status.setText("无法读取这张图片，原壁纸已保留");return;}
                crop.bitmap=decoded;crop.pose.zoom=restored==null?1:restored.getFloat("zoom",1);
                crop.pose.x=restored==null?0:restored.getFloat("x");crop.pose.y=restored==null?0:restored.getFloat("y");
                editing(true);crop.update();status.setText("调整完成后，点击“使用此裁剪”保存。");
            });
        });
    }
    void save(){
        if(saving || crop.bitmap==null)return;
        if(ResetWriteFence.stale(generation)){finish();return;}
        saving=true;save.setEnabled(false);cancel.setEnabled(false);crop.setEnabled(false);zoom.bar.setEnabled(false);
        Bitmap result=crop.render();status.setText("正在保存壁纸…");
        worker.execute(()->{String error=null;
            try{if(closed || ResetWriteFence.stale(generation))throw new IllegalStateException();TopWallpaper.save(this,result);}
            catch(Exception failure){error="壁纸保存失败，原壁纸已保留";}
            finally{result.recycle();}
            final String problem=error;
            runOnUiThread(()->{if(closed)return;saving=false;save.setEnabled(true);cancel.setEnabled(true);crop.setEnabled(true);zoom.bar.setEnabled(true);
                if(problem!=null)status.setText(problem);else{pending=null;crop.bitmap=null;editing(false);load();}
            });
        });
    }
    @Override protected void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);
        if(pending!=null)state.putString("pending",pending.toString());state.putFloat("zoom",crop.pose.zoom);state.putFloat("x",crop.pose.x);state.putFloat("y",crop.pose.y);}
    @Override protected void onDestroy(){closed=true;worker.shutdown();super.onDestroy();}
}
