package ls.augment.com;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.io.*;
import java.nio.channels.FileLock;
import java.util.concurrent.atomic.AtomicBoolean;

final class LogCleanup {
    private static final AtomicBoolean RUNNING=new AtomicBoolean();
    static boolean running(){return RUNNING.get();}
    static void start(Context context,java.util.function.Consumer<String> done) {
        if(!RUNNING.compareAndSet(false,true)){done.accept("正在清空日志，请稍候");return;}
        Context app=context.getApplicationContext();
        new Thread(()->{
            String result;
            try{long bytes=clear(app);result="日志已清空，释放约 "+android.text.format.Formatter.formatFileSize(app,bytes)+"；新的运行日志会继续记录";}
            catch(Exception error){result="日志未全部清空："+error.getMessage();}
            finally{RUNNING.set(false);}
            String message=result;new Handler(Looper.getMainLooper()).post(()->done.accept(message));
        },"Duo-LogCleanup").start();
    }
    static long clear(Context context)throws Exception {
        return clear(context,LogCleanup::clearSystemUi);
    }
    interface RootCleaner {long clear(Context context)throws Exception;}
    static long clear(Context context,RootCleaner rootCleaner)throws Exception {
        LogExportCache.beginClear();
        try {
            AuditLog.resetHistory();AtomicWorkbenchDiagnostics.resetLogFailures();
            long released;
            synchronized(LogHistory.LOCK){
                Context device=context.createDeviceProtectedStorageContext();
                // Cross-process archive writes and clear share the same phone-side lock.
                File lockFile=new File(device.getFilesDir(),"log-history.lock");
                if(java.nio.file.Files.isSymbolicLink(lockFile.toPath()))throw new IOException("日志锁路径异常");
                try(RandomAccessFile lock=new RandomAccessFile(lockFile,"rw");FileLock ignored=lock.getChannel().lock()){
                    LogHistory.mark(context,System.currentTimeMillis());
                    released=LogCleanupFiles.clear(context.getFilesDir(),context.getCacheDir(),device.getFilesDir());
                }
                for(String name:new String[]{"hook-processes",DiagnosticEvidenceStore.STORE,"diagnostic-retention"}){
                    if(!context.getSharedPreferences(name,0).edit().clear().commit())throw new IOException("诊断记录清理失败："+name);
                }
                // AppConfig.DIAGNOSTICS also holds live capability/readiness state. Keep
                // those functional values; export only newly attributed observations.
            }
            return released+rootCleaner.clear(context);
        }finally{LogExportCache.endClear();}
    }
    private static long clearSystemUi(Context context)throws Exception {
            android.content.pm.ApplicationInfo info=context.getPackageManager().getApplicationInfo(SystemUiCrashJournal.PACKAGE,0);
            int user=android.os.Process.myUid()/100000;
            if(info.uid/100000!=user)throw new IOException("系统界面用户不匹配");
            String command="CLASSPATH="+RootShell.quote(context.getApplicationInfo().sourceDir)
                    +" exec /system/bin/app_process /system/bin ls.augment.com.DuoLogRootCleanup "+user+" "+info.uid;
            RootShell.Result root=RootShell.run(command,null,12,4096);
            String answer=root.output.trim();
            if(!root.isSuccess()||!answer.matches("DUO_LOG_CLEAR_OK bytes=[0-9]+"))
                throw new IOException("应用内日志已清理，系统界面的Duo崩溃记录未能清除，请检查Root授权后重试");
            return Long.parseLong(answer.substring(answer.indexOf('=')+1));
    }
}
