package ls.augment.com;

import android.content.Context;
import java.io.File;
import java.io.IOException;
import java.util.Set;

/** Used only after external restoration: clears module-owned state, never another app's data. */
final class ModuleResetStorage {
    private ModuleResetStorage() { }
    static void clear(Context app) throws IOException { clear(app,null); }
    static void clear(Context app,android.os.Bundle workbench) throws IOException {
        AtomicWorkbenchReset.requireClearSafe(app,workbench);
        AtomicWorkbenchExtractionPresentation.clear();
        LegacyRootStorageMigration.requireResetSafe(app);
        AtomicWorkbenchTransferStore.clearForReset(app);
        if (!RuntimeStateStore.clearForReset(app) || !CrashFuseStore.clearForReset(app))
            throw new IOException("运行状态未能清除，请重试重置");
        // The cached durable stores have their own reset APIs; all other prefs use Android's cached editor.
        // A native recovery journal is not disposable cache. The runtime removes
        // its contents only after native recovery has been verified.
        if(!NativeIslandRecoveryStore.clearForReset(app))throw new IOException("录音恢复状态未清理完成");
        Set<String> handled = Set.of(AppConfig.PREFS, NativeIslandRecoveryStore.PREFS, "ls_augment_runtime_v2", "ls_augment_crash_fuse_v2",
                GfrcRecoveryStore.PREFS, LauncherOwnedStateStore.GRID_PREFS);
        File folder = new File(app.getDataDir(), "shared_prefs");
        if (java.nio.file.Files.isSymbolicLink(folder.toPath())) throw new IOException("模块偏好目录无效");
        File[] files = folder.listFiles();
        if (folder.exists() && files == null) throw new IOException("无法读取模块偏好");
        if (files != null) for (File file : files) {
            String name = file.getName();
            if (java.nio.file.Files.isSymbolicLink(file.toPath())) throw new IOException("模块偏好文件无效");
            if (name.endsWith(".xml.bak")) name = name.substring(0, name.length()-8);
            else if (name.endsWith(".xml")) name = name.substring(0, name.length()-4);
            else continue;
            if (!name.matches("[a-zA-Z0-9_.-]+")) throw new IOException("模块偏好名称无效");
            if (!handled.contains(name) && !app.getSharedPreferences(name,0).edit().clear().commit())
                throw new IOException("偏好未能清除：" + name);
        }
        AtomicWorkbenchReset.clearFiles(app,workbench);
        AtomicWorkbenchSettingsActivity.onStorageReset();
        HidePrivateStorage.clearedForReset();
        OwnedFileCleaner.clear(app.getCacheDir());
        OwnedFileCleaner.clear(app.getCodeCacheDir());
        for (File file : app.getExternalFilesDirs(null)) if (file != null) OwnedFileCleaner.clear(file);
        for (File file : app.getExternalCacheDirs()) if (file != null) OwnedFileCleaner.clear(file);
        // Revokes imported-file access retained by this module, without deleting the original documents.
        for (android.content.UriPermission permission : app.getContentResolver().getPersistedUriPermissions()) {
            int flags = (permission.isReadPermission()?android.content.Intent.FLAG_GRANT_READ_URI_PERMISSION:0)
                    | (permission.isWritePermission()?android.content.Intent.FLAG_GRANT_WRITE_URI_PERMISSION:0);
            try { app.getContentResolver().releasePersistableUriPermission(permission.getUri(), flags); }
            catch (RuntimeException error) { throw new IOException("导入文件授权未能清除", error); }
        }
    }
}
