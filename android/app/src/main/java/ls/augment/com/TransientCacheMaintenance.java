package ls.augment.com;

import android.content.Context;
import java.util.concurrent.atomic.AtomicBoolean;

/** One bounded housekeeping pass per module process, always off the UI/provider thread. */
final class TransientCacheMaintenance {
    private static final AtomicBoolean STARTED=new AtomicBoolean();
    static void request(Context context){
        if(!STARTED.compareAndSet(false,true))return;
        Context app=context.getApplicationContext();
        Thread worker=new Thread(()->{
            try{LogExportCache.clean(app.getCacheDir(),System.currentTimeMillis());}
            catch(Exception error){AuditLog.write(app,"CACHE_CLEANUP","log_export:"+error.getClass().getSimpleName());}
            try{UpdateApkProvider.clean(app);}
            catch(Exception error){AuditLog.write(app,"CACHE_CLEANUP","app_update:"+error.getClass().getSimpleName());}
        },"Duo-CacheCleanup");worker.setDaemon(true);worker.start();
    }
}
