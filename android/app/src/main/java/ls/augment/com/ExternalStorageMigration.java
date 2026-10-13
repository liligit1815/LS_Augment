package ls.augment.com;

import android.content.Context;
import java.util.ArrayList;

/** Phone-side upgrade work; runs only on the already-authorized root migration worker. */
final class ExternalStorageMigration {
    private static boolean retiredBattery;
    private static long completedGeneration=-1;
    private ExternalStorageMigration() { }
    static RootShell.Result run(Context context) {
        RootHideManager.ACTION_LOCK.lock();
        try {
            if(ResetWriteFence.active())return new RootShell.Result(130,"正在重置，存储迁移稍后重试",false);
            if(completedGeneration==ResetWriteFence.generation())return new RootShell.Result(0,"模块外部旧数据已迁移",false);
            ArrayList<String> errors=new ArrayList<>();
            HidePrivateStorage.configure(context.getFilesDir(),android.os.Process.myUid()/100000==0);
            RootShell.Result hide=HidePrivateStorage.prepare();
            if(!hide.isSuccess())errors.add(hide.output);
            HealthLedgerMigration.Result health=HealthLedgerMigration.migrate(context);
            if(!health.success)errors.add(health.message);
            GameHelperResetCache.Result combo=GameHelperResetCache.retireLegacy(context);
            if(!combo.success)errors.add(combo.message);
            if(!retiredBattery) {
                ModuleRetiredRootStorage.Result battery=ModuleRetiredRootStorage.clearAfterBatteryRestore(BatteryLifeControl.restore(context));
                retiredBattery=battery.success;
                if(!battery.success)errors.add(battery.message);
            }
            RootShell.Result boot=RootShell.run(bootCleanup(),null,12,4096);
            if(!boot.isSuccess()||!"LSA_BOOT_CACHE_RETIRED".equals(boot.output))errors.add("旧启动缓存未能安全清理");
            RootShell.Result legacyRoot=LegacyRootStorageMigration.run(context);
            if(!legacyRoot.isSuccess())errors.add(legacyRoot.output);
            String message=errors.isEmpty()?"模块外部旧数据已迁移或安全清理":String.join("；",errors);
            context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).edit()
                    .putString("private_storage_migration",message).commit();
            if(errors.isEmpty())completedGeneration=ResetWriteFence.generation();
            return new RootShell.Result(errors.isEmpty()?0:74,message,false);
        } finally { RootHideManager.ACTION_LOCK.unlock(); }
    }
    /** The current private configuration has already been published before this worker is invoked. */
    static String bootCleanup() {
        return RetiredBootCache.command(false) + "echo LSA_BOOT_CACHE_RETIRED\n";
    }
}
