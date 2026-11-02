package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.*;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;
import java.util.function.Supplier;

/** Inline image selection shares the launcher cropper, image store and settings transaction. */
final class CleanupIconEditor extends LinearLayout {
    private static final int PICK=86,CROP=87;
    private final Activity owner;
    private final Supplier<String> value;
    private final BooleanSupplier available;
    private final Consumer<String> save;
    private final ImageView preview;
    private final TextView status;
    private final Button choose;
    private int pending;
    private String original="";
    CleanupIconEditor(Activity owner,UiKit ui,Supplier<String> value,BooleanSupplier available,
            Consumer<String> save,Bundle state){
        super(owner);this.owner=owner;this.value=value;this.available=available;this.save=save;
        setOrientation(VERTICAL);setTag("config:"+LauncherOptions.CLEANUP_ICON);
        if(state!=null){pending=state.getInt("pending");original=state.getString("original","");}
        preview=new ImageView(owner);preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        preview.setContentDescription("当前清理图标预览");preview.setBackground(ui.round(ui.accentContainer,12));
        LayoutParams image=new LayoutParams(ui.dp(72),ui.dp(72));image.gravity=Gravity.CENTER_HORIZONTAL;
        image.setMargins(0,0,0,ui.dp(8));addView(preview,image);
        status=ui.text("",12,ui.muted,false);addView(status,ui.wrap());
        choose=ui.tonalButton("选择图片");choose.setOnClickListener(v->{
            if(!editable())return;original=value.get();pending=PICK;
            try{owner.startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("image/*").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),PICK);}
            catch(RuntimeException error){pending=0;Toast.makeText(owner,"无法打开图片选择器",Toast.LENGTH_LONG).show();}
        });addView(choose,ui.margins(0,8,0,0));
        Button reset=ui.textButton("移除自定义图片");reset.setOnClickListener(v->{if(editable()){pending=0;save.accept("");}});
        addView(reset,ui.wrap());render(value.get());
    }
    private boolean editable(){return !owner.isDestroyed()&&!owner.isFinishing()&&isEnabled()&&available.getAsBoolean();}
    void cancelPending(){pending=0;}
    Bundle state(){Bundle b=new Bundle();b.putInt("pending",pending);b.putString("original",original);return b;}
    boolean onResult(int request,int result,Intent data){
        if(request!=PICK&&request!=CROP)return false;
        if(request!=pending)return true;
        pending=0;
        if(!editable()||!original.equals(value.get())||result!=Activity.RESULT_OK||data==null)return true;
        if(request==PICK&&data.getData()!=null){
            pending=CROP;
            try{owner.startActivityForResult(new Intent(owner,IconCropActivity.class).setData(data.getData())
                    .putExtra("gesture_icon",true).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),CROP);}
            catch(RuntimeException error){pending=0;Toast.makeText(owner,"无法打开图片裁剪",Toast.LENGTH_LONG).show();}
        }else if(request==CROP){
            String hash=data.getStringExtra("icon");
            try{if(hash==null||!LauncherIconStore.file(owner,hash).isFile())throw new IllegalArgumentException();save.accept(hash);}
            catch(Exception error){Toast.makeText(owner,"图标未保存，请重新选择",Toast.LENGTH_LONG).show();}
        }
        return true;
    }
    void render(String hash){
        Bitmap bitmap=null;
        if(hash!=null&&!hash.isEmpty())try{bitmap=BitmapFactory.decodeFile(LauncherIconStore.file(owner,hash).getPath());}catch(Exception ignored){}
        preview.setImageBitmap(bitmap);preview.setVisibility(bitmap==null?View.GONE:View.VISIBLE);
        status.setText(hash==null||hash.isEmpty()?"尚未上传，当前保留原厂图标":bitmap==null?"图片不可用，请重新选择":"当前：自定义图片");
        choose.setText(hash==null||hash.isEmpty()?"选择图片":"更换图片");
    }
}
