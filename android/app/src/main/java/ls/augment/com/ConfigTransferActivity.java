package ls.augment.com;

import android.app.*;
import android.content.Intent;
import android.os.Bundle;
import android.widget.*;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;

/** Versioned native settings backup. Import validates the complete document before applying. */
public final class ConfigTransferActivity extends Activity {
    private final ExecutorService worker=Executors.newSingleThreadExecutor();private AppConfig config;private byte[] pending;
    private static final Set<String> EXCLUDED=new HashSet<>(Arrays.asList(ConfigSchema.HEALTH_ACCOUNT,ConfigSchema.HEALTH_SINCE,
        ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN,ConfigSchema.TGK_RAPID_FIRE_TEST_SESSION,ConfigSchema.FAN_CALIBRATION_REQUEST,ConfigSchema.FAN_MEASUREMENT));
    @Override public void onCreate(Bundle state){super.onCreate(state);config=new AppConfig(this);UiKit ui=new UiKit(this);LinearLayout page=ui.detailPage("配置导入导出",null);
        LinearLayout card=ui.card();page.addView(card,ui.margins(0,10,0,0));card.addView(ui.section("配置备份","导出功能设置、应用选择与自定义图片。不包含账户绑定、执行日志和设备测试凭据。导入后按需重启作用域。"));
        Button export=ui.tonalButton("导出配置");card.addView(export,ui.margins(0,12,0,0));export.setOnClickListener(v->{export.setEnabled(false);worker.execute(()->{try{pending=exportDocument().toString(2).getBytes(StandardCharsets.UTF_8);Files.write(new File(getCacheDir(),"pending-config-export.json").toPath(),pending);runOnUiThread(()->startActivityForResult(new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("application/json").putExtra(Intent.EXTRA_TITLE,"LS_Augment-config-"+System.currentTimeMillis()+".json"),71));}catch(Exception e){notice("导出失败："+e.getMessage());}finally{runOnUiThread(()->export.setEnabled(true));}});});
        Button load=ui.tonalButton("导入配置");card.addView(load,ui.margins(0,8,0,0));load.setOnClickListener(v->startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*"),72));
    }
    private JSONObject exportDocument()throws Exception{
        JSONObject values=new JSONObject(),images=new JSONObject();for(Map.Entry<String,String> e:config.snapshot().entrySet())if(!EXCLUDED.contains(e.getKey())){
            String value=e.getValue();if(e.getKey().equals(ConfigSchema.HEALTH_PLAN)&&!value.isEmpty()){String[] parts=value.split("\\|",-1);parts[2]="0".repeat(64);value=String.join("|",parts);}values.put(e.getKey(),value);
        }
        for(String hash:iconHashes(values)){File file=LauncherIconStore.file(this,hash);images.put(hash,Base64.getEncoder().encodeToString(Files.readAllBytes(file.toPath())));}
        return new JSONObject().put("format","LS_Augment.settings").put("version",1).put("moduleVersion",BuildConfig.VERSION_NAME).put("exportedAt",System.currentTimeMillis()).put("settings",values).put("images",images);
    }
    private static Set<String> iconHashes(JSONObject values)throws Exception{
        Set<String> hashes=new HashSet<>();String tile=values.optString(ConfigSchema.TILE_ICON);if(!tile.isEmpty())hashes.add(tile);
        LauncherOverrides overrides=LauncherOverrides.parse(values.optString(ConfigSchema.LAUNCHER_OVERRIDES,""));if(overrides==null)throw new IOException("图标配置格式错误");
        for(LauncherOverrides.Entry e:overrides.entries())if(!e.icon.isEmpty())hashes.add(e.icon);return hashes;
    }
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(result!=RESULT_OK||data==null||data.getData()==null)return;
        worker.execute(()->{try{if(request==71){if(pending==null)pending=Files.readAllBytes(new File(getCacheDir(),"pending-config-export.json").toPath());try(OutputStream out=getContentResolver().openOutputStream(data.getData(),"wt")){if(out==null)throw new IOException("无法打开文件");out.write(pending);}notice("配置已导出");}
            else if(request==72){byte[] bytes;try(InputStream in=getContentResolver().openInputStream(data.getData())){if(in==null)throw new IOException("无法读取文件");ByteArrayOutputStream buffer=new ByteArrayOutputStream();byte[] chunk=new byte[8192];int n;while((n=in.read(chunk))!=-1){buffer.write(chunk,0,n);if(buffer.size()>16*1024*1024)throw new IOException("配置文件超过 16 MiB");}bytes=buffer.toByteArray();if(bytes.length>16*1024*1024)throw new IOException("配置文件超过 16 MiB");}
                prepareImport(new JSONObject(new String(bytes,StandardCharsets.UTF_8)));}
        }catch(Exception e){notice("未导入或导出失败："+e.getMessage());}});
    }
    private void prepareImport(JSONObject document)throws Exception{
        if(!document.optString("format").equals("LS_Augment.settings")||document.optInt("version")!=1)throw new IOException("不是支持的模块配置文件");
        JSONObject values=document.getJSONObject("settings"),images=document.optJSONObject("images");if(images==null)images=new JSONObject();
        LinkedHashMap<String,String> updates=new LinkedHashMap<>();Iterator<String> keys=values.keys();
        while(keys.hasNext()){String key=keys.next();if(EXCLUDED.contains(key))continue;if(!ConfigSchema.contains(key)||!(values.get(key) instanceof String))throw new IOException("未知或无效配置项："+key);
            String value=ConfigSchema.normalize(key,values.getString(key));if(value==null)throw new IOException("配置值无效："+key);updates.put(key,value);}
        // Health bindings and hardware compatibility remain specific to this installation.
        String plan=updates.get(ConfigSchema.HEALTH_PLAN);if(plan!=null&&!plan.isEmpty()){
            String account=config.get(ConfigSchema.HEALTH_ACCOUNT);String[] parts=plan.split("\\|",-1);parts[2]=account.isEmpty()?"0".repeat(64):account;updates.put(ConfigSchema.HEALTH_PLAN,String.join("|",parts));
            if(account.isEmpty()){updates.put(ConfigSchema.HEALTH_ENABLED,"0");updates.put(ConfigSchema.HEALTH_MULTIPLY_ENABLED,"0");updates.put(ConfigSchema.HEALTH_PLAN_ENABLED,"0");}
        }
        RapidFireCompatibility.Token token=RapidFireCompatibility.Token.parse(config.get(ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN));
        if(token==null||!token.validFor(RapidFireCompatibility.currentFingerprint(this)))updates.put(ConfigSchema.TGK_RAPID_FIRE_ENABLED,"0");
        LinkedHashMap<String,byte[]> media=new LinkedHashMap<>();for(String hash:iconHashes(values)){
            if(!hash.matches("[0-9a-f]{64}"))throw new IOException("图片标识无效");
            if(!images.has(hash)){if(!LauncherIconStore.file(this,hash).isFile())throw new IOException("缺少自定义图片");continue;}
            byte[] image=Base64.getDecoder().decode(images.getString(hash));if(image.length>2097152)throw new IOException("图片过大");
            StringBuilder digest=new StringBuilder();for(byte b:java.security.MessageDigest.getInstance("SHA-256").digest(image))digest.append(String.format(Locale.ROOT,"%02x",b&255));if(!digest.toString().equals(hash))throw new IOException("图片校验失败");
            android.graphics.BitmapFactory.Options options=new android.graphics.BitmapFactory.Options();options.inJustDecodeBounds=true;android.graphics.BitmapFactory.decodeByteArray(image,0,image.length,options);
            if(options.outWidth<1||options.outHeight<1||options.outWidth>1024||options.outHeight>1024)throw new IOException("图片尺寸无效");media.put(hash,image);
        }
        Set<RootHideManager.Target> targets=new LinkedHashSet<>();String raw=updates.remove(ConfigSchema.HIDE_TARGETS);
        if(raw!=null&&!raw.isEmpty())for(String item:raw.split(";")){String[] parts=item.split(":",2);if(parts.length!=2)throw new IOException("应用选择格式无效");targets.add(new RootHideManager.Target(Integer.parseInt(parts[0]),parts[1]));}
        runOnUiThread(()->new AlertDialog.Builder(this).setTitle("导入配置").setMessage("已校验 "+updates.size()+" 项设置与 "+media.size()+" 张图片。导入将替换对应设置；移出隐藏清单的应用会恢复显示。账户绑定与本机兼容性测试保留。")
            .setNegativeButton("取消",null).setPositiveButton("导入",(dialog,which)->worker.execute(()->{try{
                LauncherIconStore.directory(this).mkdirs();for(Map.Entry<String,byte[]> e:media.entrySet()){android.util.AtomicFile file=new android.util.AtomicFile(LauncherIconStore.file(this,e.getKey()));FileOutputStream out=file.startWrite();try{out.write(e.getValue());file.finishWrite(out);}catch(Exception error){file.failWrite(out);throw error;}}
                // Save settings first; a failed target update is reported explicitly and never hidden.
                AppConfig.SaveResult saved=config.save(updates);if(!saved.success)throw new IOException(saved.message);
                if(raw!=null){RootHideManager.OperationResult selection=new RootHideManager(this).saveTargets(targets);if(!selection.success){notice("功能设置已导入，但应用清单未全部更新："+selection.message);return;}}
                ScreenAutomation.sync(this);AuditLog.write(this,"CONFIG_IMPORT","settings="+updates.size());notice("配置已导入，按需重启作用域");
            }catch(Exception e){notice("导入未完成："+e.getMessage());}})).show());
    }
    private void notice(String message){runOnUiThread(()->Toast.makeText(this,message,Toast.LENGTH_LONG).show());}
    @Override protected void onDestroy(){worker.shutdown();super.onDestroy();}
}
