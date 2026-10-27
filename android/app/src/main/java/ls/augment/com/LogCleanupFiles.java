package ls.augment.com;

import java.io.*;
import java.nio.file.Files;
import java.util.Set;

/** Explicit log allowlist. Never traverses a link or touches configuration/resources. */
final class LogCleanupFiles {
    static final Set<String> LOGS=Set.of("ls_augment.log","startup-diagnostics.log","app-crash.log",
            "atomic-workbench.log","detail-AI.log","detail-SHOULDER.log","detail-LIFTARC.log",
            "detail-SHOULDER_SWITCH.log","detail-ATOMIC_WORKBENCH.log","last-diagnostic-export.txt");
    static long clear(File files,File cache,File deviceFiles)throws IOException {
        long bytes=0;
        for(String name:LOGS)bytes+=remove(files,name,"app-crash.log".equals(name));
        bytes+=directory(files,"device-regression-results");
        bytes+=directory(deviceFiles,"boot-evidence-v1");
        File[] temporary=cache.listFiles((dir,name)->name.matches("duo-log-[a-f0-9-]+\\.txt"));
        if(temporary==null&&cache.exists())throw new IOException("无法读取日志导出缓存");
        if(temporary!=null)for(File file:temporary)bytes+=remove(cache,file.getName(),false);
        return bytes;
    }
    private static File child(File parent,String name)throws IOException {
        if(Files.isSymbolicLink(parent.toPath()))throw new IOException("日志目录异常");
        File root=parent.getCanonicalFile(),file=new File(root,name);
        if(Files.isSymbolicLink(file.toPath())||!file.getCanonicalFile().getParentFile().equals(root))
            throw new IOException("日志路径异常："+name);
        return file;
    }
    private static long remove(File parent,String name,boolean truncate)throws IOException {
        File file=child(parent,name);if(!file.exists())return 0;
        if(!file.isFile())throw new IOException("日志文件异常："+name);
        long bytes=file.length();
        // The crash handler owns a preopened descriptor; retain the inode for future failures.
        if(truncate)try(FileOutputStream output=new FileOutputStream(file,false)){output.getFD().sync();}
        else Files.delete(file.toPath());
        return bytes;
    }
    private static long directory(File parent,String name)throws IOException {
        File file=child(parent,name);if(!file.exists())return 0;
        if(!file.isDirectory())throw new IOException("日志目录异常："+name);
        long bytes=size(file);OwnedFileCleaner.clear(file);Files.delete(file.toPath());return bytes;
    }
    private static long size(File file)throws IOException {
        if(Files.isSymbolicLink(file.toPath()))return 0;
        if(file.isFile())return file.length();
        File[] children=file.listFiles();if(children==null)throw new IOException("无法读取日志目录");
        long sum=0;for(File child:children)sum+=size(child);return sum;
    }
}
