package ls.augment.com;

import java.io.File;
import java.io.IOException;

/** App-UID storage transport. Root is used only to import the retired root-owned records. */
final class HidePrivateStorage {
    private static File directory;
    private static boolean primaryUser, ready;
    private HidePrivateStorage() { }
    static synchronized void clearedForReset() { ready=false; }

    static synchronized void configure(File files, boolean primary) {
        File next;
        try {
            // Resolve Android's trusted data-directory alias, never a child link.
            next = new File(files.getCanonicalFile(), "hide-recovery").getAbsoluteFile();
            if (java.nio.file.Files.isSymbolicLink(next.toPath()) || !next.getCanonicalFile().equals(next))
                throw new IOException("Linked recovery directory");
        }
        catch (IOException error) { throw new IllegalStateException("Invalid private path", error); }
        if (directory != null && !directory.equals(next)) throw new IllegalStateException("Different storage owner");
        directory = next;
        primaryUser = primary;
    }

    static synchronized RootShell.Result prepare() {
        if (ready) return new RootShell.Result(0, "应用私有恢复记录已就绪", false);
        if (directory == null) return new RootShell.Result(74, "应用私有存储尚未初始化", false);
        try {
            HideLegacyStorageMigration.migrate(directory, primaryUser);
            ready = true;
            return new RootShell.Result(0, "隐藏应用记录已迁入应用私有存储", false);
        } catch (Exception error) {
            return new RootShell.Result(74, "隐藏应用记录迁移未完成，旧数据已保留：" + error.getMessage(), false);
        }
    }

    static synchronized RootShell.Result run(String command, String input, long timeout, int limit) {
        RootShell.Result prepared = prepare();
        if (!prepared.isSuccess()) return prepared;
        try {
            File root = directory.getCanonicalFile();
            if (!root.equals(directory.getAbsoluteFile()) || !root.isDirectory())
                throw new IOException("invalid private directory");
            ProcessBuilder builder = new ProcessBuilder("/system/bin/sh", "-c", command)
                    .directory(root).redirectErrorStream(true);
            builder.environment().put("LSA_PRIVATE_ROOT", root.getPath());
            return RootShell.runProcess(builder, input, timeout, limit, null);
        } catch (Exception error) {
            return new RootShell.Result(74, "应用私有记录读写失败", false);
        }
    }
}
