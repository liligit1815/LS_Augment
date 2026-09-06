package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.view.Gravity;
import android.widget.*;
import java.util.Collections;
import java.util.concurrent.ExecutorService;

/** Uses the same real cropper and content-addressed image store as launcher icons. */
final class TileImageEditor {
    private final Activity activity; private final UiKit ui; private final AppConfig config;
    private final ExecutorService worker; private ImageView preview;
    TileImageEditor(Activity activity,UiKit ui,AppConfig config,ExecutorService worker) {
        this.activity=activity;this.ui=ui;this.config=config;this.worker=worker;
    }
    LinearLayout view() {
        LinearLayout panel=new LinearLayout(activity);panel.setOrientation(LinearLayout.VERTICAL);
        panel.addView(ui.section("磁贴图片","点击图片选择并裁剪；控制中心会按系统样式显示。"));
        preview=new ImageView(activity);preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        preview.setContentDescription("选择并裁剪磁贴图片");preview.setBackground(ui.round(ui.accentContainer,12));
        LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(ui.dp(84),ui.dp(84));p.gravity=Gravity.CENTER_HORIZONTAL;p.setMargins(0,ui.dp(10),0,ui.dp(10));panel.addView(preview,p);
        preview.setOnClickListener(v->activity.startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),61));
        Button choose=ui.tonalButton("选择图片");choose.setOnClickListener(v->preview.performClick());
        Button reset=ui.tonalButton("恢复默认图片");reset.setOnClickListener(v->save(""));
        LinearLayout actions=new LinearLayout(activity);actions.addView(choose,new LinearLayout.LayoutParams(0,ui.dp(44),1));
        LinearLayout.LayoutParams rp=new LinearLayout.LayoutParams(0,ui.dp(44),1);rp.setMargins(ui.dp(8),0,0,0);actions.addView(reset,rp);panel.addView(actions);render();return panel;
    }
    void onResult(int request,int result,Intent data) {
        if(result!=Activity.RESULT_OK||data==null)return;
        if(request==61&&data.getData()!=null)activity.startActivityForResult(new Intent(activity,IconCropActivity.class).setData(data.getData()).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),62);
        if(request==62)save(data.getStringExtra("icon"));
    }
    private void save(String icon) {
        if(icon==null)return;
        worker.execute(()->{AppConfig.SaveResult result=config.save(Collections.singletonMap(ConfigSchema.TILE_ICON,icon));
            android.service.quicksettings.TileService.requestListeningState(activity,new android.content.ComponentName(activity,AugmentTileService.class));
            activity.runOnUiThread(()->{if(activity.isDestroyed())return;render();if(!result.success)Toast.makeText(activity,result.message,Toast.LENGTH_LONG).show();});});
    }
    private void render(){
        String hash=config.get(ConfigSchema.TILE_ICON);
        try{if(!hash.isEmpty()){preview.setColorFilter(null);preview.setImageBitmap(BitmapFactory.decodeFile(LauncherIconStore.file(activity,hash).getPath()));return;}}catch(Exception ignored){}
        preview.setImageResource(R.drawable.ic_tile);preview.setColorFilter(ui.accent);
    }
}
