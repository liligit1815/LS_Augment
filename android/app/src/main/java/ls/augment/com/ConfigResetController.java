package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.service.quicksettings.TileService;
import java.util.LinkedHashMap;
import java.util.function.Consumer;

/** Explicit total reset: verify external recovery before discarding its records. */
final class ConfigResetController {
    private ConfigResetController() { }
    static Result reset(Context context) { return reset(context, message -> { }); }
    static Result reset(Context context, Consumer<String> progress) {
        boolean fenced=false,locked=false,defaultsWritten=false;
        Context app=context.getApplicationContext();
        try {
            ResetWriteFence.begin(); fenced=true;
            progress.accept("正在恢复原子工作台的应用任务…");
            android.os.Bundle workbench=AtomicWorkbenchReset.restore(app);
            if(!workbench.getBoolean("success")||workbench.getBoolean("recovery_pending"))
                return failure(app,false,false,workbench.getString("message","工作台任务恢复尚未确认"));
            progress.accept("正在取消启动任务和旧执行队列…");
            BootJobService.ResetResult boot=BootJobService.cancelForReset(app);
            if(!boot.success)return failure(app,false,false,boot.message);
            RapidCaptureReset.Result capture=RapidCaptureReset.stopAndAwait(app);
            if(!capture.success)return failure(app,false,capture.reviewRequired,capture.message);
            RootHideManager.ACTION_LOCK.lock();locked=true;
            AppConfig config=new AppConfig(app);
            progress.accept("正在停止模块功能和自动隐藏…");
            LinkedHashMap<String,String> paused=new LinkedHashMap<>();
            for(String key:ConfigSchema.booleanKeys())
                if(ConfigSchema.isRuntimeKey(key))paused.put(key,"0");
            for(String key:new String[]{ConfigSchema.HIDE_MASTER,ConfigSchema.AUTOMATION_ENABLED,
                    ConfigSchema.HEALTH_ENABLED,ConfigSchema.HEALTH_BACKGROUND,ConfigSchema.HEALTH_MULTIPLY_ENABLED,
                    ConfigSchema.HEALTH_PLAN_ENABLED,ConfigSchema.HEALTH_DAILY_LIMIT_ENABLED,
                    ConfigSchema.FAN_FIXED_ENABLED,LauncherGridSpec.ENABLED,BrightnessRange.ENABLED})paused.put(key,"0");
            AppConfig.SaveResult pause=config.save(paused);
            if(!pause.success)return failure(app,false,false,pause.message);
            ScreenAutomation.sync(app);
            RootShell.Result sync=FrameworkConfigSync.publishForReset(app,false);
            if(!sync.isSuccess())return failure(app,false,false,"功能已暂停，但框架未同步。恢复依据保留，请连接 LSPosed 后重试。"+sync.publicError());

            progress.accept("正在恢复有记录的隐藏应用…");
            HideResetController hiding=new HideResetController(app);
            HideResetController.Result restored=hiding.restoreRecorded(progress);
            if(!restored.success)return failure(app,false,restored.reviewRequired,restored.message);
            GameHelperResetCache.Result game=GameHelperResetCache.clearAfterPause(app,true);
            if(!game.success)return failure(app,false,false,game.message);

            progress.accept("正在恢复系统设置、极暗及旧版电池策略…");
            ModuleSystemSettings.RestoreResult system=ModuleSystemSettings.restore(app);
            if(!system.success)return failure(app,false,system.reviewRequired,system.message);
            RootShell.Result battery=BatteryLifeControl.restore(app);
            if(!battery.isSuccess())return failure(app,false,false,"电池策略未能恢复，恢复依据保留："+battery.publicError());
            ModuleRetiredRootStorage.Result retired=ModuleRetiredRootStorage.clearAfterBatteryRestore(battery);
            if(!retired.success)return failure(app,false,false,retired.message);

            progress.accept("正在停止健康计划并清除模块健康记录…");
            HealthResetController.Result health=HealthResetController.clearModuleRecords(app,true);
            if(!health.success)return failure(app,false,false,health.message);

            progress.accept("正在清理模块磁贴、导入音频与旧系统配置…");
            ModuleExternalReset.Result external=ModuleExternalReset.restore(app);
            if(!external.success)return failure(app,false,external.reviewRequired,external.message);
            LauncherResetController.Result launcher=LauncherResetController.prepare(app);
            if(!launcher.success)return failure(app,false,false,launcher.message);

            progress.accept("正在再次核对应用状态并清除所有应用名单…");
            RootHideManager.OperationResult cleared=hiding.clearVerified(restored);
            if(!cleared.success)return failure(app,false,false,cleared.message);

            progress.accept("正在重置配置、绑定凭证和导入资源…");
            AppConfig.SaveResult saved=config.resetToDefaults();
            if(!saved.success)return failure(app,false,false,saved.message);
            defaultsWritten=true;
            HiddenEntrySession.lock();
            ModuleResetStorage.clear(app,workbench);
            RecentsCardRadiusStore.onStorageReset(app);
            ModuleRuntimeReset.Result notifications=ModuleRuntimeReset.clearNotifications(app);
            if(!notifications.success)return failure(app,true,false,notifications.message);
            app.getPackageManager().setComponentEnabledSetting(new ComponentName(app,app.getPackageName()+".LauncherAlias"),
                    PackageManager.COMPONENT_ENABLED_STATE_DEFAULT,PackageManager.DONT_KILL_APP);
            ScreenAutomation.sync(app);
            TileService.requestListeningState(app,new ComponentName(app,AugmentTileService.class));
            TileService.requestListeningState(app,new ComponentName(app,ExtraDimTileService.class));
            sync=FrameworkConfigSync.publishForReset(app,true);
            if(!sync.isSuccess())return failure(app,true,false,"本地配置与记录已清除，但默认启动配置尚未同步，请连接 LSPosed 后重试，再重启手机。"+sync.publicError());
            String message="模块默认设置已恢复；健康绑定和计划、所有应用名单、兼容测试凭据、导入素材、界面草稿及旧运行记录已清除。已显示 "+restored.restoredCount+" 个隐藏应用，并完成 "+restored.verifiedCount+" 条记录核验。\n\n请重启手机，让全部作用域按默认配置运行。";
            if(launcher.pendingGridRestore)message+=" 原始桌面行列的恢复依据会保留至桌面重新启动并核验成功，然后自动清除。";
            if(restored.restoredCount>0)message+="\n\n应用已恢复显示；启用、安装与停止状态保持不变。旧版本未记录的原停止状态无法追溯。";
            if(health.historyMayHaveBeenModified)message+="\n\n"+HealthResetController.HISTORY_LIMITATION;
            if(system.legacyDimHistoryUnknown)message+="\n\n旧版极暗的失效模块标记已清除，系统极暗保持关闭；原始强度未保存，当前系统强度保持不变，无法确认安装前的值。";
            if(launcher.pageHistoryPresent)message+="\n\n旧版本未保存完整的原始桌面页面与图标位置，历史手动调整无法自动还原。";
            return new Result(true,true,true,false,message);
        } catch(Exception error) {
            return failure(app,defaultsWritten,false,"重置未完成："+error.getClass().getSimpleName()+"；已停止的功能保持关闭，未完成项目请重试。");
        } finally {
            if(fenced)ResetWriteFence.end();
            if(locked)RootHideManager.ACTION_LOCK.unlock();
        }
    }
    private static Result failure(Context app,boolean settingsReset,boolean review,String message){
        AuditLog.write(app,"CONFIG_RESET_FAILED",message);
        return new Result(false,settingsReset,false,review,message);
    }
    static final class Result {
        final boolean success,settingsReset,runtimeSynced,reviewRequired;
        final String message;
        Result(boolean success,boolean settingsReset,String message){this(success,settingsReset,success,false,message);}
        Result(boolean success,boolean settingsReset,boolean synced,String message){this(success,settingsReset,synced,false,message);}
        Result(boolean success,boolean settingsReset,boolean synced,boolean review,String message){
            this.success=success;this.settingsReset=settingsReset;runtimeSynced=synced;reviewRequired=review;this.message=message;
        }
    }
}
