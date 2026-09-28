package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.View;
import android.widget.*;
import java.util.concurrent.ExecutorService;
import java.util.function.BiConsumer;
import java.util.function.Function;

/** Uses the host's draft and save queue, including recreation during document picking. */
final class BackGestureIconEditor {
    private static final int PICK=86, CROP=88, BACKGROUND=90;
    private final Activity owner;
    private final UiKit ui;
    private final ExecutorService worker;
    private final Function<String,String> value;
    private final BiConsumer<String,String> change;
    private final LinearLayout[] sides=new LinearLayout[2];
    private final BackGesturePreview[] previews=new BackGesturePreview[2];
    private final int[] generations=new int[2];
    private final String[] loaded={"",""};
    private final GestureArtwork[] images=new GestureArtwork[2];
    private final GestureArtwork[] backgrounds=new GestureArtwork[2];
    private final int[] edits=new int[2];
    private boolean applyingPreset;
    BackGestureIconEditor(Activity owner,UiKit ui,ExecutorService worker,Function<String,String> value,BiConsumer<String,String> change) {
        this.owner=owner;this.ui=ui;this.worker=worker;this.value=value;this.change=change;
    }
    View view() {
        LinearLayout body=column();
        body.addView(ui.text("两侧图标和遮罩独立选图，支持 GIF、动态 WebP；动图保留完整画面，静态图标可裁剪。大小最高 10 倍。下方为组合示意，实际跟手效果请从屏幕边缘滑动查看。",12,ui.muted,false));
        Button preset=ui.accentButton("初音未来 · 应用到双侧");
        preset.setOnClickListener(v->preset(-1));body.addView(preset,ui.margins(0,8,0,8));
        for(int side=0;side<2;side++) { sides[side]=column();body.addView(sides[side],ui.wrap());render(side); }
        return body;
    }
    private LinearLayout column(){LinearLayout view=new LinearLayout(owner);view.setOrientation(LinearLayout.VERTICAL);return view;}
    private String key(int side,String field){return BackGestureIconPolicy.key(side,field);}
    private int number(int side,String field){return Integer.parseInt(value.apply(key(side,field)));}
    private void update(int side,String field,String next){if(!next.equals(value.apply(key(side,field))))edits[side]++;change.accept(key(side,field),next);preview(side);}
    private void preset(int side) {
        if(applyingPreset)return;
        applyingPreset=true;int leftEdit=edits[0],rightEdit=edits[1];
        worker.execute(()->{
            try{
                String[] hashes=BackGesturePresets.importMiku(owner);
                owner.runOnUiThread(()->{
                    applyingPreset=false;if(owner.isDestroyed())return;
                    for(int i=0;i<2;i++)if((side==-1||side==i)&&edits[i]==(i==0?leftEdit:rightEdit)){
                        for(java.util.Map.Entry<String,String> e:BackGesturePresets.values(i,hashes).entrySet())change.accept(e.getKey(),e.getValue());
                        edits[i]++;render(i);
                    }
                });
            }catch(Exception error){owner.runOnUiThread(()->{applyingPreset=false;if(!owner.isDestroyed())Toast.makeText(owner,"预设未应用："+error.getMessage(),Toast.LENGTH_LONG).show();});}
        });
    }
    private void render(int side) {
        LinearLayout panel=sides[side];panel.removeAllViews();
        panel.addView(ui.section(side==0?"左边缘 → 向右滑":"右边缘 ← 向左滑","修改此侧不会联动另一侧"),ui.margins(0,16,0,6));
        Spinner mode=ui.choiceSpinner("图标来源",null);
        mode.setAdapter(new ArrayAdapter<>(owner,android.R.layout.simple_spinner_dropdown_item,new String[]{"原厂图标","自定义图片"}));
        mode.setSelection(number(side,"mode"));panel.addView(mode,ui.wrap());
        mode.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> parent){}
            public void onItemSelected(AdapterView<?> parent,View v,int position,long id){if(mode.getParent()==panel)update(side,"mode",String.valueOf(position));}
        });
        BackGesturePreview image=new BackGesturePreview(owner,side,ui);previews[side]=image;
        image.setContentDescription(side==0?"左侧自定义图片预览":"右侧自定义图片预览");
        panel.addView(image,new LinearLayout.LayoutParams(-1,ui.dp(172)));
        Button miku=ui.tonalButton("此侧使用初音未来");miku.setOnClickListener(v->preset(side));panel.addView(miku,ui.wrap());
        LinearLayout actions=new LinearLayout(owner);
        Button choose=ui.tonalButton("选择图标（含动图）");choose.setOnClickListener(v->pick(PICK+side));
        actions.addView(choose,new LinearLayout.LayoutParams(0,ui.dp(48),1));
        Button reset=ui.tonalButton("恢复本侧原厂");reset.setOnClickListener(v->{
            edits[side]++;
            for(String field:BackGestureIconPolicy.FIELDS)change.accept(key(side,field),ConfigSchema.defaultValue(key(side,field)));
            render(side);
        });actions.addView(reset,new LinearLayout.LayoutParams(0,ui.dp(48),1));panel.addView(actions,ui.wrap());
        Button background=ui.tonalButton("选择遮罩背景（含动图）");background.setOnClickListener(v->pick(BACKGROUND+side));panel.addView(background,ui.wrap());
        if(!value.apply(key(side,"background_asset")).isEmpty()){
            Button stockWave=ui.tonalButton("保留人物，恢复原厂波浪");
            stockWave.setOnClickListener(v->{update(side,"background_asset","");update(side,"background_scale_percent","100");render(side);});panel.addView(stockWave,ui.wrap());
        }
        Switch mirror=new Switch(owner);mirror.setChecked("1".equals(value.apply(key(side,"mirror"))));
        panel.addView(ui.featureRow("水平镜像","只翻转此侧图片",mirror),ui.wrap());
        mirror.setOnCheckedChangeListener((v,on)->update(side,"mirror",on?"1":"0"));
        slider(panel,side,"scale_percent","图标大小",10,1000,"%");
        slider(panel,side,"background_scale_percent","遮罩大小",10,1000,"%");
        slider(panel,side,"opacity_percent","不透明度",10,100,"%");
        slider(panel,side,"inset_dp","向屏幕内侧偏移",-256,512," dp");
        slider(panel,side,"offset_y_dp","向下偏移",-512,512," dp");
        Button copy=ui.tonalButton(side==0?"复制到右侧":"复制到左侧");copy.setOnClickListener(v->{
            edits[1-side]++;
            for(String field:BackGestureIconPolicy.FIELDS)change.accept(key(1-side,field),value.apply(key(side,field)));
            render(1-side);
        });panel.addView(copy,ui.wrap());preview(side);
    }
    private void slider(LinearLayout panel,int side,String field,String title,int min,int max,String unit) {
        TextView label=ui.text(title+"："+number(side,field)+unit,12,ui.text,false);panel.addView(label,ui.wrap());
        SeekBar bar=new SeekBar(owner);bar.setContentDescription((side==0?"左侧":"右侧")+title);
        bar.setMax(max-min);bar.setProgress(number(side,field)-min);panel.addView(bar,ui.wrap());
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            public void onStartTrackingTouch(SeekBar b){}
            public void onStopTrackingTouch(SeekBar b){}
            public void onProgressChanged(SeekBar b,int progress,boolean user){if(user){label.setText(title+"："+(progress+min)+unit);update(side,field,String.valueOf(progress+min));}}
        });
    }
    private void preview(int side) {
        String hash=value.apply(key(side,"asset")),background=value.apply(key(side,"background_asset"));BackGesturePreview view=previews[side];
        if(view==null)return;
        view.update(images[side],backgrounds[side],new BackGestureIconPolicy.Side(value,side));
        String token=hash+"|"+background;
        if(token.equals(loaded[side]))return;
        loaded[side]=token;images[side]=null;backgrounds[side]=null;
        view.update(null,null,new BackGestureIconPolicy.Side(value,side));int generation=++generations[side];
        if(!BackGestureIconPolicy.validAsset(hash)&&!BackGestureIconPolicy.validAsset(background))return;
        worker.execute(()->{
            GestureArtwork decoded=decode(hash),decodedBackground=decode(background);owner.runOnUiThread(()->{
                if(owner.isDestroyed()||generation!=generations[side])return;
                images[side]=decoded;backgrounds[side]=decodedBackground;
                previews[side].update(decoded,decodedBackground,new BackGestureIconPolicy.Side(value,side));
                if(decoded==null&&BackGestureIconPolicy.validAsset(hash))Toast.makeText(owner,"图片不可读取，此侧将使用原厂图标",Toast.LENGTH_LONG).show();
            });
        });
    }
    private GestureArtwork decode(String hash){
        try{if(!BackGestureIconPolicy.validAsset(hash))return null;
            try(java.io.InputStream in=new java.io.FileInputStream(LauncherIconStore.file(owner,hash))){
                return GestureArtwork.decode(GestureArtwork.read(in),false,false);
            }
        }catch(Exception|OutOfMemoryError ignored){}return null;
    }
    private void pick(int request) {
        owner.startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("image/*").putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"image/png","image/webp","image/jpeg","image/gif"})
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),request);
    }
    boolean onResult(int request,int result,Intent data) {
        if(request<PICK||request>BACKGROUND+1)return false;
        if(result!=Activity.RESULT_OK||data==null)return true;
        if(request==CROP||request==CROP+1){
            String hash=data.getStringExtra("icon");if(BackGestureIconPolicy.validAsset(hash)){
                int side=request-CROP;edits[side]++;change.accept(key(side,"asset"),hash);change.accept(key(side,"mode"),"1");render(side);
            }
            return true;
        }
        if(data.getData()==null)return true;
        boolean background=request>=BACKGROUND;int side=request-(background?BACKGROUND:PICK),edit=++edits[side];
        android.net.Uri uri=data.getData();
        worker.execute(()->{
            try(java.io.InputStream in=owner.getContentResolver().openInputStream(uri)){
                byte[] bytes=GestureArtwork.read(in);
                GestureArtwork checked=GestureArtwork.decode(bytes,false,false);
                boolean animated=checked.animated();checked.stop();
                if(!background&&!animated){
                    owner.runOnUiThread(()->{if(!owner.isDestroyed()&&edit==edits[side])owner.startActivityForResult(
                            new Intent(owner,IconCropActivity.class).setData(uri).putExtra("gesture_icon",true)
                                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION),CROP+side);});
                    return;
                }
                String hash=LauncherIconStore.saveBytes(owner,bytes);
                owner.runOnUiThread(()->{
                    if(owner.isDestroyed()||edit!=edits[side])return;
                    change.accept(key(side,background?"background_asset":"asset"),hash);
                    if(!background)change.accept(key(side,"mode"),"1");render(side);
                });
            }catch(Exception|OutOfMemoryError error){owner.runOnUiThread(()->{if(!owner.isDestroyed())Toast.makeText(owner,"图片未导入："+error.getMessage(),Toast.LENGTH_LONG).show();});}
        });
        return true;
    }
}
