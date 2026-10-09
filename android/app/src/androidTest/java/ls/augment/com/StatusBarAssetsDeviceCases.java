package ls.augment.com;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.Drawable;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/** Real Android image decoding and transfer boundaries; never applies test appearance to the phone. */
final class StatusBarAssetsDeviceCases {
    private interface Action {void run()throws Exception;}
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    private static void rejects(Action action,String message)throws Exception {boolean rejected=false;try{action.run();}catch(Exception expected){rejected=true;}require(rejected,message);}
    private static final String GIF="R0lGODlhDAAMAIEAAP8AAAAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQADAAAACwAAAAADAAMAAAIFgABCBxIsKDBgwgTKlzIsKHDhxARBgQAIfkEAQwAAQAsAAAAAAwADACBAP8AAAAAAAAAAAAACBYAAQgcSLCgwYMIEypcyLChw4cQEQYEADs=";
    static JSONObject run(Context context)throws Exception {
        JSONArray cases=new JSONArray();Map<String,String> before=new AppConfig(context).snapshot();
        byte[] png=png(73,29),animation=Base64.getDecoder().decode(GIF);
        String imageHash=StatusBarAssetStore.hash(png),animationHash=StatusBarAssetStore.hash(animation);
        boolean imageExisted=StatusBarAssetStore.file(context,imageHash).exists(),animationExisted=StatusBarAssetStore.file(context,animationHash).exists();
        try{
            StatusBarAssetStore.Asset image=StatusBarAssetStore.validate(imageHash,png);
            require(image.width==73&&image.height==29&&!image.animated,"static dimensions are preserved");cases.put("真实 PNG 校验与长宽比");
            Drawable scaled=StatusBarAssetStore.decode(png,32);require(scaled.getIntrinsicWidth()<=32&&scaled.getIntrinsicHeight()<32,"bounded, non-square decode");cases.put("按目标尺寸等比解码");
            require(StatusBarAssetStore.validate(animationHash,animation).animated,"GIF remains animated");
            Drawable animated=StatusBarAssetStore.decode(animation,6);require(animated instanceof AnimatedImageDrawable&&animated.getIntrinsicWidth()==6,"GIF all-frame scaled decoder");((AnimatedImageDrawable)animated).stop();cases.put("GIF 动画类型保留与缩放");
            rejects(()->StatusBarAssetStore.validate(imageHash,animation),"hash mismatch must reject");
            rejects(()->StatusBarAssetStore.decode("<svg><script/></svg>".getBytes(StandardCharsets.UTF_8),64),"unaccepted decoder type must reject");
            rejects(()->StatusBarAssetStore.decode(png(4097,1),64),"oversized image header must reject");cases.put("哈希、格式与超大尺寸拒绝");
            String imported=StatusBarAssetStore.importFile(context,new ByteArrayInputStream(png),"测试图样.png");
            require(imported.equals(imageHash)&&Arrays.equals(png,StatusBarAssetStore.read(context,imported)),"import copies source bytes");
            StatusBarAssetStore.importFile(context,new ByteArrayInputStream(png),"相同图样.png");
            int duplicates=0;for(StatusBarAssetStore.Asset asset:StatusBarAssetStore.list(context))if(asset.hash.equals(imported))duplicates++;
            require(duplicates==1,"content deduplication");cases.put("本地保存与哈希去重");
            java.lang.reflect.Method backupFile=ConfigTransferActivity.class.getDeclaredMethod("backupFile",File.class,int.class,long[].class);backupFile.setAccessible(true);
            String encoded=(String)backupFile.invoke(null,StatusBarAssetStore.file(context,imageHash),StatusBarAssetStore.MAX_BYTES,new long[]{0});
            require(Arrays.equals(png,Base64.getDecoder().decode(encoded)),"bounded backup preserves raw image bytes");
            rejects(()->backupFile.invoke(null,StatusBarAssetStore.file(context,imageHash),StatusBarAssetStore.MAX_BYTES,new long[]{32*1024*1024}),"full backup refuses aggregate overflow before encoding");cases.put("完整备份累计大小限额");
            StatusBarAssetStore.store(context,animationHash,animation);
            StatusBarThemeSpec theme=StatusBarThemeSpec.empty().with(new StatusBarThemeSpec.Binding("alarm_clock","default","whole",imageHash,false,110,1,-1,90,false))
                    .with(new StatusBarThemeSpec.Binding("cooling_fan","default","whole",animationHash,true,100,0,0,100,false));
            Map<String,String> selected=new LinkedHashMap<>();selected.put(StatusBarThemeSpec.KEY,theme.serialize());selected.put(StatusBarFontSpec.KEY,"");
            // Deliberately include sensitive-looking settings: the exporter may only read appearance keys.
            selected.put(ConfigSchema.HIDE_TARGETS,"private-selection-must-not-be-shared");selected.put(ConfigSchema.HEALTH_ACCOUNT,"private-account-must-not-be-shared");
            ByteArrayOutputStream output=new ByteArrayOutputStream();StatusBarAssetPack.export(context,selected,"往返测试","Device tests","CC0-1.0",output);
            byte[] zip=output.toByteArray();StatusBarAssetPack.Preview preview=StatusBarAssetPack.inspect(new ByteArrayInputStream(zip));
            require(preview.imageCount==2&&preview.animatedCount==1&&preview.fontCount==0,"package counts");
            require(preview.theme.equals(theme.serialize()),"package transforms/state binding roundtrip");
            Map<String,String> updates=StatusBarAssetPack.install(context,preview);
            require(updates.size()==2&&updates.get(StatusBarThemeSpec.KEY).equals(theme.serialize()),"install only returns appearance updates");
            Map<String,String> previous=new LinkedHashMap<>();previous.put(StatusBarThemeSpec.KEY,StatusBarThemeSpec.empty().with(new StatusBarThemeSpec.Binding("wifi","level3","background",imageHash,false,100,0,0,100,false)).serialize());previous.put(StatusBarFontSpec.KEY,StatusBarFontSpec.empty().with("clock","original").serialize());
            Map<String,String> merged=StatusBarAssetPack.merge(previous,preview);
            require(StatusBarThemeSpec.parse(merged.get(StatusBarThemeSpec.KEY)).entries().size()==3,"unmentioned icon remains during package merge");
            require(StatusBarFontSpec.parse(merged.get(StatusBarFontSpec.KEY)).get("clock").equals("original"),"icon package leaves font overrides intact");
            require(before.equals(new AppConfig(context).snapshot()),"inspect/install/export must not modify settings");cases.put("素材包往返及不自动修改配置");
            JSONObject manifest=new JSONObject().put("format",StatusBarAssetPack.FORMAT).put("version",1)
                    .put("metadata",new JSONObject().put("name","测试").put("author","test").put("license","CC0"))
                    .put("theme","").put("fonts","").put("images",new JSONObject()).put("fontFiles",new JSONObject());
            rejects(()->StatusBarAssetPack.inspect(new ByteArrayInputStream(archive(manifest,"../escape",new byte[]{1}))),"ZIP traversal rejected");
            JSONObject extra=new JSONObject(manifest.toString()).put("settings",new JSONObject().put("private",true));
            rejects(()->StatusBarAssetPack.inspect(new ByteArrayInputStream(archive(extra,null,null))),"full config cannot enter asset pack");
            JSONObject missing=new JSONObject(manifest.toString()).put("theme",theme.serialize());
            rejects(()->StatusBarAssetPack.inspect(new ByteArrayInputStream(archive(missing,null,null))),"missing referenced files rejected");
            rejects(()->StatusBarAssetPack.inspect(new ByteArrayInputStream(Arrays.copyOf(zip,zip.length-22))),"truncated ZIP rejected");cases.put("路径穿越、额外配置、缺失资源及截断包拒绝");
            File fixtures=context.getExternalFilesDir("statusbar-asset-tests");JSONArray examplePacks=new JSONArray();
            if(fixtures!=null)for(String name:new String[]{"mono-essentials-1.0.0.zip","gentle-spin-1.0.0.zip","noto-sans-1.0.0.zip"}){
                File fixture=new File(fixtures,name);if(!fixture.isFile())continue;
                StatusBarAssetPack.Preview example;try(InputStream input=new FileInputStream(fixture)){example=StatusBarAssetPack.inspect(input);}
                if(name.startsWith("noto"))require(example.fontCount==1,"Noto real font decoded and validated");
                if(name.startsWith("gentle"))require(example.animatedCount==1,"WebP real animation preserved");
                examplePacks.put(new JSONObject().put("name",name).put("images",example.imageCount).put("fonts",example.fontCount).put("animated",example.animatedCount));
            }
            require(before.equals(new AppConfig(context).snapshot()),"example inspection must leave user config unchanged");
            return new JSONObject().put("success",true).put("cases",cases).put("catalogCount",StatusBarIconCatalog.all().size()).put("zipBytes",zip.length).put("settingsUnchanged",true).put("examplePacks",examplePacks);
        }finally{
            if(!imageExisted)StatusBarAssetStore.deleteUnused(context,imageHash);
            if(!animationExisted)StatusBarAssetStore.deleteUnused(context,animationHash);
        }
    }
    private static byte[] png(int width,int height){Bitmap bitmap=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);bitmap.eraseColor(Color.argb(190,17,128,230));ByteArrayOutputStream output=new ByteArrayOutputStream();bitmap.compress(Bitmap.CompressFormat.PNG,100,output);bitmap.recycle();return output.toByteArray();}
    private static byte[] archive(JSONObject manifest,String extra,byte[] bytes)throws Exception {
        ByteArrayOutputStream output=new ByteArrayOutputStream();try(ZipOutputStream zip=new ZipOutputStream(output)){
            zip.putNextEntry(new ZipEntry("manifest.json"));zip.write(manifest.toString().getBytes(StandardCharsets.UTF_8));zip.closeEntry();
            if(extra!=null){zip.putNextEntry(new ZipEntry(extra));zip.write(bytes);zip.closeEntry();}
        }return output.toByteArray();
    }
}
