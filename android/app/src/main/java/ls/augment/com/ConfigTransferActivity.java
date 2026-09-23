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
    private static final int MAX_DOCUMENT_BYTES=32*1024*1024;
    private final ExecutorService worker=Executors.newSingleThreadExecutor();private AppConfig config;private byte[] pending;
    private Button exportButton, importButton, resetButton;
    private boolean directAction;
    private static final Set<String> EXCLUDED=new HashSet<>(Arrays.asList(ConfigSchema.HEALTH_ACCOUNT,ConfigSchema.HEALTH_SINCE,
        ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN,ConfigSchema.TGK_RAPID_FIRE_TEST_SESSION,ConfigSchema.FAN_CALIBRATION_REQUEST,ConfigSchema.FAN_MEASUREMENT));
    @Override public void onCreate(Bundle state){super.onCreate(state);config=new AppConfig(this);UiKit ui=new UiKit(this);LinearLayout page=ui.detailPage("配置备份与重置",null);
        LinearLayout card=ui.card();page.addView(card,ui.margins(0,10,0,0));card.addView(ui.section("配置备份","导出功能设置、应用选择、自定义图片、字体与肩键候选。不包含账户绑定、执行日志和设备测试凭据。导入后按需重启作用域。"));
        Button export=ui.tonalButton("导出配置");card.addView(export,ui.margins(0,12,0,0));export.setOnClickListener(v->{export.setEnabled(false);worker.execute(()->{try{pending=exportDocument().toString(2).getBytes(StandardCharsets.UTF_8);Files.write(new File(getCacheDir(),"pending-config-export.json").toPath(),pending);runWhileOpen(()->startActivityForResult(new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("application/json").putExtra(Intent.EXTRA_TITLE,"LS_Augment-config-"+System.currentTimeMillis()+".json"),71));}catch(Exception e){notice("导出失败："+e.getMessage());}finally{runWhileOpen(()->export.setEnabled(true));}});});
        Button load=ui.tonalButton("导入配置");card.addView(load,ui.margins(0,8,0,0));load.setOnClickListener(v->startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*"),72));
        exportButton=export;importButton=load;
        LinearLayout resetCard=ui.card();page.addView(resetCard,ui.margins(0,14,0,0));
        resetCard.addView(ui.section("恢复默认设置","暂停自动隐藏并恢复模块设置及桌面入口。独立应用名单和当前隐藏状态保留，不会自动显示应用。需要显示时，请到“消失吧APP → 应用隐藏”使用“全部显示”。重置前可先导出配置。"));
        resetButton=ui.tonalButton("重置全部配置");resetCard.addView(resetButton,ui.margins(0,12,0,0));
        resetButton.setOnClickListener(v->confirmReset());
        String action=getIntent().getStringExtra("action");
        directAction="export".equals(action)||"import".equals(action)||"reset".equals(action);
        if(state==null&&directAction)page.post(()->{
            if(isFinishing()||isDestroyed())return;
            if("export".equals(action))exportButton.performClick();
            else if("import".equals(action))importButton.performClick();
            else resetButton.performClick();
        });
    }
    private void confirmReset(){
        AppDialogs.builder(this).setTitle("重置全部配置？")
                .setMessage("将先关闭隐藏管理并暂停自动隐藏，再恢复模块默认设置及桌面入口；健康绑定和本机测试凭据也会重置。\n\n独立应用名单、当前隐藏状态与诊断日志保留，不会因重置自动显示应用。需要显示时，请到“消失吧APP → 应用隐藏”使用“全部显示”。\n\n不会卸载应用或重排桌面页面。重置完成后需要重启手机。")
                .setNegativeButton("取消",(dialog,which)->finishDirect()).setOnCancelListener(dialog->finishDirect()).setPositiveButton("确认重置",(dialog,which)->{
                    transferEnabled(false);
                    worker.execute(()->{
                        ConfigResetController.Result result;
                        try{result=ConfigResetController.reset(this);}
                        catch(Exception error){AuditLog.write(this,"CONFIG_RESET_FAILED",error.getClass().getSimpleName());result=new ConfigResetController.Result(false,false,"重置未完成："+error.getMessage());}
                        final ConfigResetController.Result completed=result;
                        runWhileOpen(()->{
                            transferEnabled(true);
                            AlertDialog.Builder report=AppDialogs.builder(this).setTitle(completed.success?"重置完成":"重置未完成").setMessage(completed.message).setNegativeButton("关闭",(d,w)->finishDirect()).setOnCancelListener(d->finishDirect());
                            if(completed.success&&completed.runtimeSynced)report.setPositiveButton("重启作用域",(d,w)->ScopeRestartDialog.show(this,ScopeRestartDialog.DEVICE));
                            report.show();
                        });
                    });
                }).show();
    }
    private void transferEnabled(boolean enabled){exportButton.setEnabled(enabled);importButton.setEnabled(enabled);resetButton.setEnabled(enabled);}
    private JSONObject exportDocument()throws Exception{
        JSONObject values=new JSONObject(),images=new JSONObject(),fonts=new JSONObject();for(Map.Entry<String,String> e:config.snapshot().entrySet())if(!EXCLUDED.contains(e.getKey())){
            String value=e.getValue();if(e.getKey().equals(ConfigSchema.HEALTH_PLAN)&&!value.isEmpty()){String[] parts=value.split("\\|",-1);parts[2]="0".repeat(64);value=String.join("|",parts);}values.put(e.getKey(),value);
        }
        for(String hash:iconHashes(values)){File file=LauncherIconStore.file(this,hash);images.put(hash,Base64.getEncoder().encodeToString(Files.readAllBytes(file.toPath())));}
        for(String hash:fontHashes(values))fonts.put(hash,Base64.getEncoder().encodeToString(Files.readAllBytes(ManagedFont.file(this,hash).toPath())));
        JSONObject document=new JSONObject().put("format","LS_Augment.settings").put("version",1).put("moduleVersion",BuildConfig.VERSION_NAME).put("exportedAt",System.currentTimeMillis()).put("settings",values).put("images",images).put("fonts",fonts);
        if(document.toString(2).getBytes(StandardCharsets.UTF_8).length>MAX_DOCUMENT_BYTES)throw new IOException("配置及资源超过 32 MiB，请减少自定义图片或字体后再备份");
        return document;
    }
    private static Set<String> fontHashes(JSONObject values) {
        Set<String> hashes=new LinkedHashSet<>();
        for(EnhancementOption option:EnhancementCatalog.options())if(option.key.endsWith("_clock_font")) {
            String value=values.optString(option.key);if(ManagedFont.reference(value))hashes.add(value.substring(5));
        }
        return hashes;
    }
    private static Set<String> iconHashes(JSONObject values)throws Exception{
        Set<String> hashes=new HashSet<>();String tile=values.optString(ConfigSchema.TILE_ICON);if(!tile.isEmpty())hashes.add(tile);
        LauncherOverrides overrides=LauncherOverrides.parse(values.optString(ConfigSchema.LAUNCHER_OVERRIDES,""));if(overrides==null)throw new IOException("图标配置格式错误");
        for(LauncherOverrides.Entry e:overrides.entries())if(!e.icon.isEmpty())hashes.add(e.icon);return hashes;
    }
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(result!=RESULT_OK||data==null||data.getData()==null){finishDirect();return;}
        worker.execute(()->{try{if(request==71){if(pending==null)pending=Files.readAllBytes(new File(getCacheDir(),"pending-config-export.json").toPath());try(OutputStream out=getContentResolver().openOutputStream(data.getData(),"wt")){if(out==null)throw new IOException("无法打开文件");out.write(pending);}notice("配置已导出");runWhileOpen(this::finishDirect);}
            else if(request==72){byte[] bytes;try(InputStream in=getContentResolver().openInputStream(data.getData())){if(in==null)throw new IOException("无法读取文件");ByteArrayOutputStream buffer=new ByteArrayOutputStream();byte[] chunk=new byte[8192];int n;while((n=in.read(chunk))!=-1){buffer.write(chunk,0,n);if(buffer.size()>MAX_DOCUMENT_BYTES)throw new IOException("配置文件超过 32 MiB");}bytes=buffer.toByteArray();if(bytes.length>MAX_DOCUMENT_BYTES)throw new IOException("配置文件超过 32 MiB");}
                prepareImport(new JSONObject(new String(bytes,StandardCharsets.UTF_8)));}
        }catch(Exception e){AuditLog.write(this,"CONFIG_TRANSFER_FAILED","request="+request+" "+e.getClass().getSimpleName()+": "+e.getMessage());notice("未导入或导出失败："+e.getMessage());}});
    }
    private void prepareImport(JSONObject document)throws Exception{
        if(!document.optString("format").equals("LS_Augment.settings")||document.optInt("version")!=1)throw new IOException("不是支持的模块配置文件");
        JSONObject values=document.getJSONObject("settings"),images=document.optJSONObject("images");if(images==null)images=new JSONObject();
        LinkedHashMap<String,String> updates=new LinkedHashMap<>();Iterator<String> keys=values.keys();
        while(keys.hasNext()){String key=keys.next();if(EXCLUDED.contains(key))continue;if(!ConfigSchema.contains(key)||!(values.get(key) instanceof String))throw new IOException("未知或无效配置项："+key);
            String value=key.equals(ConfigSchema.HIDE_TARGETS)?values.getString(key):ConfigSchema.normalize(key,values.getString(key));if(value==null)throw new IOException("配置值无效："+key);updates.put(key,value);}
        // Health bindings and hardware compatibility remain specific to this installation.
        String plan=updates.get(ConfigSchema.HEALTH_PLAN);if(plan!=null&&!plan.isEmpty()){
            String account=config.get(ConfigSchema.HEALTH_ACCOUNT);String[] parts=plan.split("\\|",-1);parts[2]=account.isEmpty()?"0".repeat(64):account;updates.put(ConfigSchema.HEALTH_PLAN,String.join("|",parts));
            if(account.isEmpty()){updates.put(ConfigSchema.HEALTH_ENABLED,"0");updates.put(ConfigSchema.HEALTH_MULTIPLY_ENABLED,"0");updates.put(ConfigSchema.HEALTH_PLAN_ENABLED,"0");}
        }
        RapidFireCompatibility.Token token=RapidFireCompatibility.Token.parse(config.get(ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN));
        if(token==null||!token.validFor(RapidFireCompatibility.currentFingerprint(this)))updates.put(ConfigSchema.TGK_RAPID_FIRE_ENABLED,"0");
        JSONObject normalizedValues=new JSONObject(updates);
        LinkedHashMap<String,byte[]> media=new LinkedHashMap<>();for(String hash:iconHashes(normalizedValues)){
            if(!hash.matches("[0-9a-f]{64}"))throw new IOException("图片标识无效");
            if(!images.has(hash)){if(!LauncherIconStore.file(this,hash).isFile())throw new IOException("缺少自定义图片");continue;}
            byte[] image=Base64.getDecoder().decode(images.getString(hash));if(image.length>2097152)throw new IOException("图片过大");
            StringBuilder digest=new StringBuilder();for(byte b:java.security.MessageDigest.getInstance("SHA-256").digest(image))digest.append(String.format(Locale.ROOT,"%02x",b&255));if(!digest.toString().equals(hash))throw new IOException("图片校验失败");
            android.graphics.BitmapFactory.Options options=new android.graphics.BitmapFactory.Options();options.inJustDecodeBounds=true;android.graphics.BitmapFactory.decodeByteArray(image,0,image.length,options);
            if(options.outWidth<1||options.outHeight<1||options.outWidth>1024||options.outHeight>1024)throw new IOException("图片尺寸无效");media.put(hash,image);
        }
        LinkedHashMap<String,byte[]> fontMedia=new LinkedHashMap<>();JSONObject fonts=document.optJSONObject("fonts");
        for(String hash:fontHashes(normalizedValues)) {
            byte[] data;
            if(fonts!=null&&fonts.has(hash))data=Base64.getDecoder().decode(fonts.getString(hash));
            else if(ManagedFont.file(this,hash).isFile())data=Files.readAllBytes(ManagedFont.file(this,hash).toPath());
            else throw new IOException("缺少自定义字体");
            ManagedFont.validate(hash,data);fontMedia.put(hash,data);
        }
        String raw=updates.remove(ConfigSchema.HIDE_TARGETS);
        Set<RootHideManager.Target> targets=importTargets(raw);
        if(raw!=null){RootHideManager.OperationResult validation=new RootHideManager(this).validateImportTargets(targets);if(!validation.success)throw new IOException(validation.message);}
        runWhileOpen(()->AppDialogs.builder(this).setTitle("导入配置").setMessage("已校验 "+updates.size()+" 项设置与 "+media.size()+" 张图片和 "+fontMedia.size()+" 个字体。导入将替换对应设置；应用选择全部作为待确认名单保留，导入不会绑定当前空间。请进入应用隐藏页面，在当前空间重新勾选需要的应用。移出清单不会改变应用显示状态，历史记录保留。账户绑定与本机兼容性测试保留。")
            .setNegativeButton("取消",(dialog,which)->finishDirect()).setOnCancelListener(dialog->finishDirect()).setPositiveButton("导入",(dialog,which)->worker.execute(()->{try{
                RootHideManager manager=new RootHideManager(this);
                if(raw!=null){RootHideManager.OperationResult validation=manager.validateImportTargets(targets);if(!validation.success)throw new IOException(validation.message);}
                LauncherIconStore.directory(this).mkdirs();for(Map.Entry<String,byte[]> e:media.entrySet()){android.util.AtomicFile file=new android.util.AtomicFile(LauncherIconStore.file(this,e.getKey()));FileOutputStream out=file.startWrite();try{out.write(e.getValue());file.finishWrite(out);}catch(Exception error){file.failWrite(out);throw error;}}
                for(Map.Entry<String,byte[]> e:fontMedia.entrySet())ManagedFont.store(this,e.getKey(),e.getValue());
                boolean synced;
                if(raw!=null){
                    RootHideManager.OperationResult selection=manager.saveTargets(targets,updates);
                    if(selection.reviewRequired){reviewReport("导入未完成",selection.message);return;}
                    if(!selection.success)throw new IOException(selection.message);synced=selection.runtimeSynced;
                }else{AppConfig.SaveResult saved=config.save(updates);if(!saved.success)throw new IOException(saved.message);synced=saved.runtimeSynced;}
                ScreenAutomation.sync(this);AuditLog.write(this,"CONFIG_IMPORT","settings="+updates.size()+" runtime_synced="+synced);
                getSharedPreferences("native_value_overrides",0).edit().clear().commit();
                getSharedPreferences("native_launcher_drafts",0).edit().clear().commit();
                notice(synced?"配置已导入，按需重启作用域":"配置已导入并保存；启动配置正等待框架后台同步，无需重新导入，同步完成后再按需重启作用域");
                runWhileOpen(this::finishDirect);
            }catch(Exception e){AuditLog.write(this,"CONFIG_IMPORT_FAILED",e.getClass().getSimpleName()+": "+e.getMessage());notice("导入未完成："+e.getMessage());}})).show());
    }
    private static Set<RootHideManager.Target> importTargets(String raw) throws IOException {
        Set<RootHideManager.Target> targets = new LinkedHashSet<>();
        if (raw == null) return targets;
        HideTargetCodec.Selection parsed = HideTargetCodec.parse(raw);
        if (!parsed.valid) throw new IOException("应用选择格式无效：" + parsed.message);
        for (HideTargetCodec.Entry entry : parsed.entries)
            targets.add(new RootHideManager.Target(entry.asPending()));
        return targets;
    }
    private void notice(String message){runWhileOpen(()->Toast.makeText(this,message,Toast.LENGTH_LONG).show());}
    private void reviewReport(String title,String message){runWhileOpen(()->AppDialogs.builder(this)
            .setTitle(title).setMessage(message).setPositiveButton("关闭",(d,w)->finishDirect()).show());}
    private void finishDirect(){if(directAction)finish();}
    // A document provider can finish after Back or recreation. Check on the UI thread,
    // while allowing an already confirmed import/export/reset to finish its writes.
    private void runWhileOpen(Runnable action){
        runOnUiThread(()->{if(!isFinishing()&&!isDestroyed())action.run();});
    }
    @Override protected void onDestroy(){worker.shutdown();super.onDestroy();}
}
