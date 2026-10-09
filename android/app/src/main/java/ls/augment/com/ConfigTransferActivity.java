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
import java.lang.ref.WeakReference;
import java.util.function.Consumer;

/** Transparent action host for the three configuration rows on the Module page. */
public final class ConfigTransferActivity extends Activity {
    private static final int MAX_DOCUMENT_BYTES=32*1024*1024;
    private ExecutorService worker;private AppConfig config;private TransferSession transfer;
    private static ResetJob resetJob;
    private AlertDialog resetProgress,actionDialog;
    private android.app.Dialog restartDialog;
    private boolean resetReportShown;
    private long editorResetGeneration;
    private static final Set<String> EXCLUDED=new HashSet<>(Arrays.asList(ConfigSchema.HEALTH_ACCOUNT,ConfigSchema.HEALTH_SINCE,
        ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN,ConfigSchema.TGK_RAPID_FIRE_TEST_SESSION,ConfigSchema.FAN_CALIBRATION_REQUEST,ConfigSchema.FAN_MEASUREMENT));
    @Override public void onCreate(Bundle state){super.onCreate(state);config=new AppConfig(this);
        TransferSession retained=(TransferSession)getLastNonConfigurationInstance();
        transfer=retained==null?new TransferSession():retained;worker=transfer.worker;transfer.attach(this);
        editorResetGeneration=retained!=null?transfer.editorResetGeneration:state==null?ResetWriteFence.generation():state.getLong("reset_generation",ResetWriteFence.generation());
        transfer.editorResetGeneration=editorResetGeneration;
        String action=getIntent().getStringExtra("action");
        if(!"export".equals(action)&&!"import".equals(action)&&!"reset".equals(action)){openModule();return;}
        getWindow().getDecorView().post(()->{
            if(isFinishing()||isDestroyed())return;
            if(resetJob!=null){resetJob.attach(this);return;}
            if(retained!=null){transfer.dispatch();return;}
            if(state!=null){
                transfer.phase=state.getString("phase","");
                if("picker".equals(transfer.phase))return;
                if(!"reset_confirmation".equals(transfer.phase)){complete("操作已中断，请从模块页重新操作");return;}
            }
            if("export".equals(action))beginExport();
            else if("import".equals(action))openPicker(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*"),72);
            else transfer.deliver(ConfigTransferActivity::confirmReset);
        });
    }
    /** Carries in-flight work across recreation without keeping an obsolete window. */
    private static final class TransferSession {
        final ExecutorService worker=Executors.newSingleThreadExecutor();
        final android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
        WeakReference<ConfigTransferActivity> owner=new WeakReference<>(null);
        volatile Consumer<ConfigTransferActivity> pendingUi;
        Consumer<ConfigTransferActivity> deliveredUi;
        WeakReference<ConfigTransferActivity> deliveredTo=new WeakReference<>(null);
        volatile String phase="starting";
        volatile byte[] pendingExport;
        long editorResetGeneration;
        void attach(ConfigTransferActivity screen){owner=new WeakReference<>(screen);}
        void detach(ConfigTransferActivity screen){if(owner.get()==screen)owner.clear();}
        void deliver(Consumer<ConfigTransferActivity> action){pendingUi=action;dispatch();}
        void dispatch(){main.post(()->{ConfigTransferActivity screen=owner.get();Consumer<ConfigTransferActivity> action=pendingUi;
            if(screen!=null&&action!=null&&!screen.isFinishing()&&!screen.isDestroyed()
                    &&(deliveredTo.get()!=screen||deliveredUi!=action)){
                deliveredTo=new WeakReference<>(screen);deliveredUi=action;action.accept(screen);
            }});}
        void clearUi(){pendingUi=null;}
    }
    private void beginExport(){
        transfer.phase="export_preparing";
        worker.execute(()->{try{
            transfer.pendingExport=exportDocument().toString(2).getBytes(StandardCharsets.UTF_8);
            Files.write(new File(getCacheDir(),"pending-config-export.json").toPath(),transfer.pendingExport);
            transfer.deliver(screen->screen.openPicker(new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("application/json").putExtra(Intent.EXTRA_TITLE,"红魔Duo-config-"+System.currentTimeMillis()+".json"),71));
        }catch(Exception error){complete("导出失败："+error.getMessage());}});
    }
    private void openPicker(Intent intent,int request){
        transfer.phase="picker";transfer.clearUi();
        try{startActivityForResult(intent,request);}catch(Exception error){complete("无法打开文件选择器："+error.getMessage());}
    }
    @Override public Object onRetainNonConfigurationInstance(){return transfer;}
    @Override protected void onSaveInstanceState(Bundle state){
        state.putString("phase",transfer.phase);state.putLong("reset_generation",editorResetGeneration);super.onSaveInstanceState(state);
    }
    private void confirmReset(){
        if(resetJob!=null){resetJob.attach(this);return;}
        transfer.phase="reset_confirmation";
        actionDialog=AppDialogs.builder(this).setTitle("重置配置？")
                .setMessage("将停止模块功能，恢复有可靠记录的系统改动，并将模块记录名单内隐藏的应用恢复显示（包括已移出选择列表的应用）。\n\n清除健康绑定凭证与计划、全部应用名单、自定义素材、测试凭据、界面草稿和旧日志，恢复默认设置及模块入口。恢复失败时保留所需记录，并说明未完成项目。\n\n旧版本未保存原值的系统设置、已选用的主题与指纹样式、桌面页面、图标位置和健康历史，以及已同步的云端数据，无法可靠还原；自行安装的应用和外部导出文件需自行处理。重置完成后需要重启手机。")
                .setNegativeButton("取消",(dialog,which)->finishDirect()).setOnCancelListener(dialog->finishDirect()).setPositiveButton("确认重置",(dialog,which)->{
                    transfer.phase="reset_running";transfer.clearUi();
                    ResetJob job=new ResetJob(getApplicationContext());resetJob=job;
                    job.attach(this);job.start();
                }).show();
    }
    /** Application-owned job survives recreation without retaining an Activity or stale editor. */
    private static final class ResetJob {
        final android.content.Context app;
        final android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
        WeakReference<ConfigTransferActivity> screen=new WeakReference<>(null);
        volatile String stage="正在准备重置…";
        volatile ConfigResetController.Result result;
        ResetJob(android.content.Context app){this.app=app;}
        void attach(ConfigTransferActivity activity){screen=new WeakReference<>(activity);render();}
        void detach(ConfigTransferActivity activity){if(screen.get()==activity)screen.clear();}
        void render(){main.post(()->{ConfigTransferActivity activity=screen.get();if(activity!=null&&!activity.isFinishing()&&!activity.isDestroyed())activity.renderReset(this);});}
        void start(){ExecutorService resetWorker=Executors.newSingleThreadExecutor();resetWorker.execute(()->{
            try{result=ConfigResetController.reset(app,message->{stage=message;render();});}
            catch(Exception error){result=new ConfigResetController.Result(false,false,"重置未完成，请重新进入后重试。");}
            finally{resetWorker.shutdown();render();}
        });}
    }
    private void renderReset(ResetJob job){
        if(job.result==null){
            if(resetProgress==null){resetProgress=AppDialogs.builder(this).setTitle("正在重置配置").setMessage(job.stage).setCancelable(false).create();resetProgress.show();}
            else resetProgress.setMessage(job.stage);
            return;
        }
        if(resetProgress!=null){resetProgress.dismiss();resetProgress=null;}
        if(resetReportShown)return;resetReportShown=true;
        ConfigResetController.Result completed=job.result;
        AlertDialog.Builder report=AppDialogs.builder(this).setTitle(completed.success?"重置完成":"重置未完成")
                .setMessage(completed.message).setNegativeButton("关闭",(d,w)->reopenModule())
                .setOnCancelListener(d->reopenModule());
        if(completed.success&&completed.runtimeSynced)report.setPositiveButton("重启手机",(d,w)->{
            restartDialog=ScopeRestartDialog.show(this,ScopeRestartDialog.DEVICE);
            restartDialog.setOnDismissListener(dialog->{if(!isChangingConfigurations()&&!isFinishing()&&!isDestroyed())reopenModule();});
        });
        actionDialog=report.show();
    }
    private void reopenModule(){resetJob=null;startActivity(new Intent(this,SettingsActivity.class)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK).putExtra("tab","settings"));finish();}
    private void openModule(){startActivity(new Intent(this,SettingsActivity.class)
            .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP).putExtra("tab","settings"));finish();}
    @Override public void onBackPressed(){
        if(resetJob!=null){if(resetJob.result==null){Toast.makeText(this,"重置正在进行，请稍候",Toast.LENGTH_SHORT).show();return;}reopenModule();return;}
        super.onBackPressed();
    }
    private JSONObject exportDocument()throws Exception{
        JSONObject values=new JSONObject(),images=new JSONObject(),fonts=new JSONObject(),artwork=new JSONObject();for(Map.Entry<String,String> e:config.snapshot().entrySet())if(!EXCLUDED.contains(e.getKey())){
            String value=e.getValue();if(e.getKey().equals(ConfigSchema.HEALTH_PLAN)&&!value.isEmpty()){String[] parts=value.split("\\|",-1);parts[2]="0".repeat(64);value=String.join("|",parts);}values.put(e.getKey(),value);
        }
        JSONObject notices=StatusBarAssetPack.exportNotices(this,noticeHashes(valueMap(values)));
        JSONObject document=new JSONObject().put("format","LS_Augment.settings").put("version",1).put("moduleName","红魔Duo").put("moduleVersion",BuildConfig.VERSION_NAME).put("exportedAt",System.currentTimeMillis()).put("settings",values).put("images",images).put("fonts",fonts).put("statusbarArtwork",artwork).put("statusbarNotices",notices);
        long[] budget={document.toString(2).getBytes(StandardCharsets.UTF_8).length};
        for(String hash:iconHashes(values))images.put(hash,backupFile(LauncherIconStore.file(this,hash),GestureArtwork.MAX_BYTES,budget));
        for(String hash:fontHashes(values))fonts.put(hash,backupFile(ManagedFont.file(this,hash),ManagedFont.MAX_BYTES,budget));
        for(String hash:StatusBarAssetReferences.statusbarIcons(valueMap(values)))artwork.put(hash,backupFile(StatusBarAssetStore.file(this,hash),StatusBarAssetStore.MAX_BYTES,budget));
        if(document.toString(2).getBytes(StandardCharsets.UTF_8).length>MAX_DOCUMENT_BYTES)throw new IOException("配置及资源超过 32 MiB，请减少自定义图片或字体后再备份");
        return document;
    }
    /** Reject oversized collections before allocating their base64 strings. */
    private static String backupFile(File file,int perFileLimit,long[] budget)throws IOException {
        long length=file.length(),encoded=((length+2)/3)*4+128;
        if(!file.isFile()||length<=0||length>perFileLimit)throw new IOException("自定义资源缺失或大小无效");
        if(budget[0]+encoded>MAX_DOCUMENT_BYTES)throw new IOException("配置及资源超过 32 MiB，请减少自定义图片或字体后再备份");
        byte[] bytes;try(InputStream input=new FileInputStream(file);ByteArrayOutputStream out=new ByteArrayOutputStream((int)length)){
            byte[] block=new byte[8192];int count;while((count=input.read(block))!=-1){if(out.size()+count>perFileLimit||out.size()+count>length)throw new IOException("资源在备份期间发生变化，请重试");out.write(block,0,count);}bytes=out.toByteArray();
        }
        budget[0]+=((bytes.length+2L)/3)*4+128;return Base64.getEncoder().encodeToString(bytes);
    }
    private static Set<String> fontHashes(JSONObject values) {
        return StatusBarAssetReferences.fonts(valueMap(values));
    }
    private static Map<String,String> valueMap(JSONObject values) {
        Map<String,String> result=new LinkedHashMap<>();Iterator<String> keys=values.keys();
        while(keys.hasNext()){String key=keys.next();result.put(key,values.optString(key));}return result;
    }
    private static Set<String> noticeHashes(Map<String,String> values){Set<String> hashes=new LinkedHashSet<>(StatusBarAssetReferences.statusbarIcons(values));hashes.addAll(StatusBarAssetReferences.fonts(values));return hashes;}
    private static Set<String> iconHashes(JSONObject values)throws Exception{
        Set<String> hashes=new HashSet<>();String tile=values.optString(ConfigSchema.TILE_ICON);if(!tile.isEmpty())hashes.add(tile);
        for(int side=0;side<2;side++)for(String slot:new String[]{"asset","background_asset"}){
            String hash=values.optString(BackGestureIconPolicy.key(side,slot));if(!hash.isEmpty())hashes.add(hash);
        }
        LauncherOverrides overrides=LauncherOverrides.parse(values.optString(ConfigSchema.LAUNCHER_OVERRIDES,""));if(overrides==null)throw new IOException("图标配置格式错误");
        for(LauncherOverrides.Entry e:overrides.entries())if(!e.icon.isEmpty())hashes.add(e.icon);return hashes;
    }
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request!=71&&request!=72){finishDirect();return;}if(result!=RESULT_OK||data==null||data.getData()==null){finishDirect();return;}
        transfer.phase=request==71?"export_writing":"import_reading";
        worker.execute(()->{try{if(request==71){if(transfer.pendingExport==null)transfer.pendingExport=Files.readAllBytes(new File(getCacheDir(),"pending-config-export.json").toPath());try(OutputStream out=getContentResolver().openOutputStream(data.getData(),"wt")){if(out==null)throw new IOException("无法打开文件");out.write(transfer.pendingExport);}complete("配置已导出");}
            else if(request==72){byte[] bytes;try(InputStream in=getContentResolver().openInputStream(data.getData())){if(in==null)throw new IOException("无法读取文件");ByteArrayOutputStream buffer=new ByteArrayOutputStream();byte[] chunk=new byte[8192];int n;while((n=in.read(chunk))!=-1){buffer.write(chunk,0,n);if(buffer.size()>MAX_DOCUMENT_BYTES)throw new IOException("配置文件超过 32 MiB");}bytes=buffer.toByteArray();if(bytes.length>MAX_DOCUMENT_BYTES)throw new IOException("配置文件超过 32 MiB");}
                prepareImport(new JSONObject(new String(bytes,StandardCharsets.UTF_8)));}
        }catch(Exception e){AuditLog.write(this,"CONFIG_TRANSFER_FAILED","request="+request+" "+e.getClass().getSimpleName()+": "+e.getMessage());complete("未导入或导出失败："+e.getMessage());}});
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
        JSONObject normalizedValues=new JSONObject(updates);long resourceBytes=0;
        LinkedHashMap<String,byte[]> media=new LinkedHashMap<>();for(String hash:iconHashes(normalizedValues)){
            if(!hash.matches("[0-9a-f]{64}"))throw new IOException("图片标识无效");
            if(!images.has(hash)){if(!LauncherIconStore.file(this,hash).isFile())throw new IOException("缺少自定义图片");continue;}
            byte[] image=Base64.getDecoder().decode(images.getString(hash));boolean gesture=false;for(int side=0;side<2;side++)for(String slot:new String[]{"asset","background_asset"})gesture|=hash.equals(normalizedValues.optString(BackGestureIconPolicy.key(side,slot)));
            if(image.length>(gesture?GestureArtwork.MAX_BYTES:2097152))throw new IOException("图片过大");
            resourceBytes=importedSize(resourceBytes,image.length);
            StringBuilder digest=new StringBuilder();for(byte b:java.security.MessageDigest.getInstance("SHA-256").digest(image))digest.append(String.format(Locale.ROOT,"%02x",b&255));if(!digest.toString().equals(hash))throw new IOException("图片校验失败");
            if(gesture){GestureArtwork.decode(image,false,false).stop();media.put(hash,image);continue;}
            android.graphics.BitmapFactory.Options options=new android.graphics.BitmapFactory.Options();options.inJustDecodeBounds=true;android.graphics.BitmapFactory.decodeByteArray(image,0,image.length,options);
            if(options.outWidth<1||options.outHeight<1||options.outWidth>1024||options.outHeight>1024)throw new IOException("图片尺寸无效");media.put(hash,image);
        }
        LinkedHashMap<String,byte[]> fontMedia=new LinkedHashMap<>();JSONObject fonts=document.optJSONObject("fonts");
        for(String hash:fontHashes(normalizedValues)) {
            byte[] data;
            if(fonts!=null&&fonts.has(hash))data=Base64.getDecoder().decode(fonts.getString(hash));
            else if(ManagedFont.file(this,hash).isFile())data=Files.readAllBytes(ManagedFont.file(this,hash).toPath());
            else throw new IOException("缺少自定义字体");
            resourceBytes=importedSize(resourceBytes,data.length);ManagedFont.validate(hash,data);fontMedia.put(hash,data);
        }
        LinkedHashMap<String,byte[]> statusbarMedia=new LinkedHashMap<>();JSONObject artwork=document.optJSONObject("statusbarArtwork");
        for(String hash:StatusBarAssetReferences.statusbarIcons(updates)) {
            byte[] data;
            if(artwork!=null&&artwork.has(hash))data=Base64.getDecoder().decode(artwork.getString(hash));
            else if(StatusBarAssetStore.file(this,hash).isFile())data=StatusBarAssetStore.read(this,hash);
            else throw new IOException("缺少状态栏素材");
            resourceBytes=importedSize(resourceBytes,data.length);StatusBarAssetStore.validate(hash,data);statusbarMedia.put(hash,data);
        }
        if(document.has("statusbarNotices")&&!(document.get("statusbarNotices") instanceof JSONObject))throw new IOException("素材授权信息格式无效");
        Map<String,String> statusbarNotices=importedNotices(document.optJSONObject("statusbarNotices"),updates);
        String raw=updates.remove(ConfigSchema.HIDE_TARGETS);
        Set<RootHideManager.Target> targets=importTargets(raw);
        if(raw!=null){RootHideManager.OperationResult validation=new RootHideManager(this).validateImportTargets(targets);if(!validation.success)throw new IOException(validation.message);}
        transfer.phase="import_confirmation";
        transfer.deliver(screen->screen.confirmImport(updates,media,statusbarMedia,fontMedia,statusbarNotices,raw,targets));
    }
    /** Old backups may carry worksheet-only notices; validate them without restoring an inactive reference. */
    private static Map<String,String> importedNotices(JSONObject object,Map<String,String> values)throws Exception {
        Set<String> active=noticeHashes(values),compatible=new LinkedHashSet<>(active);
        StatusBarSheetSpec retired=StatusBarSheetSpec.parse(values.getOrDefault(StatusBarSheetSpec.KEY,""));
        if(retired!=null)for(StatusBarSheetSpec.Cell cell:retired.cells)
            if("image".equals(cell.content)&&!cell.image.isEmpty())compatible.add(cell.image);
        Map<String,String> notices=StatusBarAssetPack.parseNotices(object,compatible);
        notices.keySet().retainAll(active);
        return notices;
    }
    private void confirmImport(LinkedHashMap<String,String> updates,LinkedHashMap<String,byte[]> media,
            LinkedHashMap<String,byte[]> statusbarMedia,LinkedHashMap<String,byte[]> fontMedia,
            Map<String,String> statusbarNotices,String raw,Set<RootHideManager.Target> targets){
        actionDialog=AppDialogs.builder(this).setTitle("导入配置").setMessage("已校验 "+updates.size()+" 项设置与 "+media.size()+" 张图片、"+statusbarMedia.size()+" 个状态栏素材和 "+fontMedia.size()+" 个字体。导入将替换对应设置；应用选择全部作为待确认名单保留，导入不会绑定当前空间。请进入应用隐藏页面，在当前空间重新勾选需要的应用。移出清单不会改变应用显示状态，历史记录保留。账户绑定与本机兼容性测试保留。")
            .setNegativeButton("取消",(dialog,which)->finishDirect()).setOnCancelListener(dialog->finishDirect()).setPositiveButton("导入",(dialog,which)->{
                transfer.phase="import_applying";transfer.clearUi();worker.execute(()->{RootHideManager.ACTION_LOCK.lock();try{
                if(ResetWriteFence.stale(editorResetGeneration))throw new IOException("配置已被重置，请重新打开此页面后再导入");
                RootHideManager manager=new RootHideManager(this);
                if(raw!=null){RootHideManager.OperationResult validation=manager.validateImportTargets(targets);if(!validation.success)throw new IOException(validation.message);}
                LauncherIconStore.directory(this).mkdirs();for(Map.Entry<String,byte[]> e:media.entrySet()){android.util.AtomicFile file=new android.util.AtomicFile(LauncherIconStore.file(this,e.getKey()));FileOutputStream out=file.startWrite();try{out.write(e.getValue());file.finishWrite(out);}catch(Exception error){file.failWrite(out);throw error;}}
                for(Map.Entry<String,byte[]> e:fontMedia.entrySet())ManagedFont.store(this,e.getKey(),e.getValue());
                for(Map.Entry<String,byte[]> e:statusbarMedia.entrySet())StatusBarAssetStore.store(this,e.getKey(),e.getValue());
                StatusBarAssetPack.restoreNotices(this,statusbarNotices);
                boolean synced;
                if(raw!=null){
                    RootHideManager.OperationResult selection=manager.saveTargets(targets,updates);
                    if(selection.reviewRequired){reviewReport("导入未完成",selection.message);return;}
                    if(!selection.success)throw new IOException(selection.message);synced=selection.runtimeSynced;
                }else{AppConfig.SaveResult saved=config.save(updates);if(!saved.success)throw new IOException(saved.message);synced=saved.runtimeSynced;}
                ScreenAutomation.sync(this);AuditLog.write(this,"CONFIG_IMPORT","settings="+updates.size()+" runtime_synced="+synced);
                getSharedPreferences("native_value_overrides",0).edit().clear().commit();
                getSharedPreferences("native_launcher_drafts",0).edit().clear().commit();
                complete(synced?"配置已导入，按需重启作用域":"配置已导入并保存；启动配置正等待框架后台同步，无需重新导入，同步完成后再按需重启作用域");
            }catch(Exception e){AuditLog.write(this,"CONFIG_IMPORT_FAILED",e.getClass().getSimpleName()+": "+e.getMessage());complete("导入未完成："+e.getMessage());}finally{RootHideManager.ACTION_LOCK.unlock();}});}).show();
    }
    private static long importedSize(long total,int length)throws IOException {if(total+length>MAX_DOCUMENT_BYTES)throw new IOException("配置引用的资源合计超过 32 MiB，请分批导入素材");return total+length;}
    private static Set<RootHideManager.Target> importTargets(String raw) throws IOException {
        Set<RootHideManager.Target> targets = new LinkedHashSet<>();
        if (raw == null) return targets;
        HideTargetCodec.Selection parsed = HideTargetCodec.parse(raw);
        if (!parsed.valid) throw new IOException("应用选择格式无效：" + parsed.message);
        for (HideTargetCodec.Entry entry : parsed.entries)
            targets.add(new RootHideManager.Target(entry.asPending()));
        return targets;
    }
    private void complete(String message){transfer.deliver(screen->{Toast.makeText(screen,message,Toast.LENGTH_LONG).show();screen.finishDirect();});}
    private void reviewReport(String title,String message){transfer.phase="report";transfer.deliver(screen->
            screen.actionDialog=AppDialogs.builder(screen).setTitle(title).setMessage(message)
                    .setPositiveButton("关闭",(d,w)->screen.finishDirect()).setOnCancelListener(d->screen.finishDirect()).show());}
    private void finishDirect(){transfer.clearUi();transfer.phase="finished";finish();}
    @Override protected void onDestroy(){
        if(resetJob!=null)resetJob.detach(this);
        if(resetProgress!=null){resetProgress.dismiss();resetProgress=null;}
        if(actionDialog!=null){actionDialog.dismiss();actionDialog=null;}
        if(restartDialog!=null){restartDialog.setOnDismissListener(null);restartDialog.dismiss();restartDialog=null;}
        if(transfer!=null){transfer.detach(this);if(!isChangingConfigurations())transfer.worker.shutdown();}
        super.onDestroy();
    }
}
