package ls.augment.com;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

/** Deletes contents of an explicitly supplied module-private directory without following links. */
final class OwnedFileCleaner {
    private OwnedFileCleaner() { }
    static void clear(File directory) throws IOException {
        if (Files.isSymbolicLink(directory.toPath())) throw new IOException("模块数据目录无效");
        if (!directory.exists()) return;
        if (!directory.isDirectory())
            throw new IOException("模块数据目录无效");
        File root = directory.getCanonicalFile();
        File[] entries = directory.listFiles();
        if (entries == null) throw new IOException("无法读取模块数据目录");
        for (File entry : entries) remove(root, entry);
    }
    private static void remove(File root, File entry) throws IOException {
        if (!entry.getParentFile().getCanonicalFile().toPath().startsWith(root.toPath()))
            throw new IOException("数据路径超出模块目录");
        if (Files.isSymbolicLink(entry.toPath())) { Files.delete(entry.toPath()); return; }
        File resolved = entry.getCanonicalFile();
        if (!resolved.toPath().startsWith(root.toPath())) throw new IOException("数据路径超出模块目录");
        if (entry.isDirectory()) {
            File[] children = entry.listFiles();
            if (children == null) throw new IOException("无法读取模块数据");
            for (File child : children) remove(root, child);
        }
        if (!entry.delete() && entry.exists()) throw new IOException("未能清除模块数据：" + entry.getName());
    }
}
