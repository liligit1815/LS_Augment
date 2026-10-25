package ls.augment.com.hook;

import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.HideUserIdentity;
import ls.augment.com.LauncherResetPolicy;

/** Only the owning launcher main process clears its module page preference caches. */
final class LauncherResetHook {
    private static final Uri PROVIDER=Uri.parse("content://ls.augment.com.config");
    private static final Uri URI=Uri.parse("content://ls.augment.com.config/launcher-reset");
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ScheduledExecutorService WORKER=Executors.newSingleThreadScheduledExecutor(r->{
        Thread t=new Thread(r,"LSA-LauncherReset");t.setDaemon(true);return t;
    });

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static volatile Context context;
    private static volatile LauncherResetPolicy.Request pending;
    private static ContentObserver observer;
    private static boolean installed;
    private LauncherResetHook(){ }
    static synchronized void install(AugmentModule module){
        if(installed)return;
        try{
            module.registerFeatureHook(module.prepareFeatureHook(Instrumentation.class.getDeclaredMethod(
                    "callApplicationOnCreate",Application.class),"launcher.reset.application",true).intercept(chain->{
                LauncherOwnedStateClient.preload((Application)chain.getArg(0));
                Object result=chain.proceed();
                attach((Application)chain.getArg(0));return result;
            }));
            installed=true;
            Context existing=FeatureSettings.from(null);if(existing!=null)attach(existing);
        }catch(Throwable error){module.logFeatureError("LAUNCHER_RESET_INSTALL",error);}
    }
    static synchronized void attach(Context supplied){
        if(observer!=null||supplied==null||!LauncherResetPolicy.PACKAGE.equals(supplied.getPackageName())
                ||!LauncherResetPolicy.PACKAGE.equals(Application.getProcessName()))return;
        Context app=supplied.getApplicationContext();if(app==null)app=supplied;
        if(app.getApplicationInfo().uid!=Process.myUid())return;
        context=app;
        ContentObserver candidate=new ContentObserver(MAIN){
            @Override public void onChange(boolean selfChange){WORKER.execute(LauncherResetHook::read);}
        };
        try{app.getContentResolver().registerContentObserver(URI,false,candidate);observer=candidate;}
        catch(RuntimeException unavailable){return;}
        WORKER.execute(LauncherResetHook::read);
    }
    private static void read(){
        Context app=context;if(app==null)return;
        try{
            Bundle b=app.getContentResolver().call(PROVIDER,"launcher_reset_read",null,null);
            if(b==null||!b.getBoolean("ok",false)){pending=null;return;}
            LauncherResetPolicy.Request r=new LauncherResetPolicy.Request(b.getString("nonce"),b.getInt("user",-1),
                    b.getLong("serial",-1),b.getInt("uid",-1),b.getInt("version",-1),b.getLong("revision",-1),
                    b.getString("checksum"),b.getLong("createdAt",-1),b.getLong("expiresAt",-1),b.getLong("generation",-1));
            if(!LauncherResetPolicy.valid(r,SystemClock.elapsedRealtime())||r.launcherUid!=Process.myUid()
                    ||r.user!=Process.myUid()/100000||r.moduleVersion!=BuildConfig.VERSION_CODE)return;
            LauncherResetPolicy.Request before=pending;pending=r;
            if(before==null||!before.nonce.equals(r.nonce))MAIN.post(()->apply(r));
        }catch(RuntimeException unavailable){pending=null;}
    }
    private static void apply(LauncherResetPolicy.Request r){
        Context app=context;
        if(app==null||pending==null||!r.nonce.equals(pending.nonce)
                ||!LauncherResetPolicy.valid(r,SystemClock.elapsedRealtime()))return;
        ConfigSnapshot snapshot=FeatureSettings.snapshot(app);
        if(!FeatureSettings.hasVerifiedSnapshot(app)||snapshot.revision!=r.revision||!snapshot.checksum.equals(r.checksum)){
            FeatureSettings.invalidateSnapshot();MAIN.postDelayed(()->apply(r),100L);return;
        }
        for(String key:ls.augment.com.ConfigSchema.booleanKeys())if(ls.augment.com.ConfigSchema.isRuntimeKey(key)
                &&!"0".equals(snapshot.get(key))){ack(r,false,"features_not_paused");return;}
        if(!HideUserIdentity.match(app,r.user,r.serial).success){ack(r,false,"user_changed");return;}
        try{
            if(!LauncherPagesHook.pauseForReset(r.revision)){
                MAIN.postDelayed(()->apply(r),80L);return;
            }
            WORKER.execute(()->{
                boolean cleared=LauncherOwnedStateClient.clearPagesForReset(app,r);
                ack(r,cleared,cleared?"pages_empty":"commit_failed");
            });
        }catch(Exception unsafe){ack(r,false,"storage_not_verified");}
    }

    // Root cross-user operation: these are validated target-package CE paths, not this module's own storage directory.
    //noinspection SdCardPath
    static void validateStorage(Context storage,int user,int uid,String name)throws Exception{
        if(!"ls_augment_launcher_pages".equals(name)&&!"ls_augment_launcher_grid_state".equals(name))throw new IOException("storage role");
        if(storage==null||!LauncherResetPolicy.PACKAGE.equals(storage.getPackageName()))throw new IOException("storage identity");
        File base=storage.getDataDir();
        String ce="/data/user/"+user+"/"+LauncherResetPolicy.PACKAGE;
        String de="/data/user_de/"+user+"/"+LauncherResetPolicy.PACKAGE;
        String alias="/data/data/"+LauncherResetPolicy.PACKAGE;
        if(base==null||!(base.getPath().equals(ce)||base.getPath().equals(de)||user==0&&base.getPath().equals(alias)))
            throw new IOException("storage path");
        String canonical=base.getCanonicalPath();
        if(!(canonical.equals(base.getPath())||user==0&&(canonical.equals(ce)||canonical.equals(alias))
                &&(base.getPath().equals(ce)||base.getPath().equals(alias))))throw new IOException("canonical storage path");
        StructStat root=Os.lstat(base.getPath());
        if(!OsConstants.S_ISDIR(root.st_mode)||root.st_uid!=uid)throw new IOException("storage owner");
        File folder=new File(base,"shared_prefs");StructStat dir=optional(folder);
        if(dir!=null&&(!OsConstants.S_ISDIR(dir.st_mode)||dir.st_uid!=uid
                ||!folder.getCanonicalPath().equals(canonical+"/shared_prefs")))throw new IOException("prefs directory");
        for(String fileName:new String[]{name+".xml",name+".xml.bak"}){
            File file=new File(folder,fileName);StructStat stat=optional(file);
            if(stat!=null&&(!OsConstants.S_ISREG(stat.st_mode)||stat.st_uid!=uid||stat.st_nlink!=1
                    ||stat.st_size<0||stat.st_size>262144||!file.getCanonicalPath().equals(canonical+"/shared_prefs/"+fileName)))
                throw new IOException("prefs file");
        }
    }
    private static StructStat optional(File file)throws ErrnoException{
        try{return Os.lstat(file.getPath());}catch(ErrnoException absent){if(absent.errno==OsConstants.ENOENT)return null;throw absent;}
    }
    private static void ack(LauncherResetPolicy.Request r,boolean success,String code){
        WORKER.execute(()->{
            Context app=context;if(app==null||pending==null||!r.nonce.equals(pending.nonce))return;
            Bundle b=new Bundle();b.putString("nonce",r.nonce);b.putInt("user",r.user);b.putLong("serial",r.serial);
            b.putInt("version",r.moduleVersion);b.putLong("revision",r.revision);b.putString("checksum",r.checksum);
            b.putLong("generation",r.generation);b.putBoolean("success",success);b.putString("code",code);
            try{
                Bundle receipt=app.getContentResolver().call(PROVIDER,"launcher_reset_ack",null,b);
                if(receipt!=null&&receipt.getBoolean("ok",false)){pending=null;return;}
            }catch(RuntimeException unavailable){ }
            if(LauncherResetPolicy.valid(r,SystemClock.elapsedRealtime()))WORKER.schedule(()->ack(r,success,code),200L,TimeUnit.MILLISECONDS);
        });
    }
}
