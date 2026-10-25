package ls.augment.com;

import android.app.Instrumentation;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only: real Android storage/receivers, synthetic records, unique disposable namespaces.
 * Does not modify native health rows, live update grants, clipboard or recorder state. */
final class ResourceBoundaryDeviceCases {
    private int checks;
    private final JSONArray cases=new JSONArray();
    private void require(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
    private interface Checked {void run()throws Exception;}
    private void denied(Checked action,String reason)throws Exception {
        try{action.run();}catch(IOException|IllegalStateException expected){checks++;return;}
        throw new AssertionError(reason);
    }
    static JSONObject run(Instrumentation test)throws Exception{return new ResourceBoundaryDeviceCases().execute(test);}
    private JSONObject execute(Instrumentation test)throws Exception {
        File root=new File(test.getTargetContext().getCacheDir(),"resource-regression-"+UUID.randomUUID());
        require(root.mkdir(),"fixture directory unavailable");
        Isolated context=new Isolated(test.getTargetContext(),root,"rb-"+UUID.randomUUID()+"-");
        JSONObject result=new JSONObject().put("scope","REAL_ANDROID_STORAGE_SYNTHETIC_DATA")
                .put("sdk",android.os.Build.VERSION.SDK_INT).put("cases",cases)
                .put("nativeHealthRowsWritten",0).put("microphoneUsed",false);
        try {
            health(context);updates(context);exports(context);workbench(test,context,result);recorder(context);startup();
            result.put("checks",checks).put("success",true);
        }finally{
            context.clean();OwnedFileCleaner.clear(root);
            require(root.delete(),"fixture directory cleanup failed");
        }
        return result.put("fixtureStorageRemoved",!root.exists());
    }
    private void health(Isolated context)throws Exception {
        String account="a".repeat(64);long now=System.currentTimeMillis()/1000,recent=(now-366L*86400)/60*60;
        for(int version:new int[]{1,2,3}){
            Isolated sample=context.child("health-"+version);HealthLedgerDatabase ledger=new HealthLedgerDatabase(sample);
            try{
                ledger.put(account,"phone",recent,new HealthLedgerDatabase.Record("raw","out","stable-token",true));
                ledger.put(account,"phone",1,new HealthLedgerDatabase.Record("old","old","old",false));
                SQLiteDatabase sql=ledger.getWritableDatabase();
                sql.execSQL("INSERT INTO events(account,id,day,time,steps,admitted) VALUES(?,?,'1970-01-01',?,40,1)",new Object[]{account,"legacy",recent});
                if(version==1)sql.execSQL("DROP TABLE plan_awards");if(version<3)sql.execSQL("DROP TABLE migration");
                sql.execSQL("PRAGMA user_version="+version);ledger.close();ledger=new HealthLedgerDatabase(sample);
                require("stable-token".equals(ledger.get(account,"phone",recent).token),"upgrade lost dedup token v"+version);
                ledger.maintain(now);long floor=ledger.retiredBefore();
                require(floor>1&&floor<recent,"retention no longer covers old catch-up range");
                HealthLedgerDatabase upgraded=ledger;denied(()->upgraded.get(account,"phone",1),"retired intent can be reapplied");
                ledger.admit(new StepPlan("b".repeat(32),account,"UTC",java.time.LocalDate.now(java.time.ZoneOffset.UTC),0,60,30,false,42),now);
                require(ledger.award(account,recent).allowed==40,"v1 credit not sealed before admission");
                ledger.close();ledger=new HealthLedgerDatabase(sample);ledger.maintain(now-86400);
                require(ledger.retiredBefore()==floor,"clock rollback moved dedup boundary backwards");
                try(Cursor size=ledger.getReadableDatabase().rawQuery("PRAGMA max_page_count",null);
                    Cursor page=ledger.getReadableDatabase().rawQuery("PRAGMA page_size",null)){
                    require(size.moveToFirst()&&page.moveToFirst()&&size.getLong(0)*page.getLong(0)<=HealthLedgerDatabase.MAX_BYTES,"Android SQLite growth limit missing");
                }
                try(Cursor check=ledger.getReadableDatabase().rawQuery("PRAGMA quick_check",null)){require(check.moveToFirst()&&"ok".equals(check.getString(0)),"SQLite integrity");}
            }finally{ledger.close();}
        }
        cases.put("health_schema_1_2_3_upgrade_retention_dedup_reopen_real_sqlite");
    }
    private void updates(Isolated context)throws Exception {
        File root=UpdateApkProvider.directory(context);require(root.mkdirs(),"update fixture directory");
        File apk=new File(root,"verified-"+"a".repeat(64)+".apk");Files.write(apk.toPath(),new byte[]{1,2,3});
        Uri uri=UpdateApkProvider.grant(context,apk);UpdateApkProvider provider=new UpdateApkProvider();
        ProviderInfo info=new ProviderInfo();info.authority=context.getPackageName()+".updates";provider.attachInfo(context,info);
        try(android.os.ParcelFileDescriptor descriptor=provider.openFile(uri,"r")){require(descriptor.getStatSize()==3,"verified URI read");}
        String token=uri.getPathSegments().get(1);Uri old=Uri.parse("content://"+info.authority+"/"+token+"/"+apk.getName());
        try(android.os.ParcelFileDescriptor descriptor=provider.openFile(old,"r")){require(descriptor.getStatSize()==3,"old installer URI compatibility");}
        denied(()->provider.openFile(uri,"rw"),"write access accepted");
        File orphan=new File(root,"download-dead.part");Files.write(orphan.toPath(),new byte[]{1});
        try(UpdateApkProvider.DownloadLease lease=UpdateApkProvider.beginDownload(context,"b".repeat(64),3)){
            Files.write(lease.temporary.toPath(),new byte[]{4});UpdateApkProvider.clean(context);
            require(lease.temporary.exists()&&apk.exists()&&!orphan.exists(),"cleanup touched live lease or kept orphan");
            Files.write(lease.cached.toPath(),new byte[]{4,5,6});UpdateApkProvider.grant(context,lease.cached);
        }
        denied(()->UpdateApkProvider.beginDownload(context,"c".repeat(64),3),"third APK evicted a live installer");
        SharedPreferences grants=context.getSharedPreferences("update-apk-grants",0);
        for(String key:grants.getAll().keySet())if(key.endsWith(":expires"))require(grants.edit().putLong(key,0).commit(),"expire fixture grant");
        UpdateApkProvider.clean(context);require(grants.getAll().isEmpty(),"expired grant metadata retained");
        denied(()->provider.openFile(uri,"r"),"expired URI still opens");
        cases.put("update_real_fd_old_new_uri_readonly_expiry_quota_inflight_protection");
    }
    private void exports(Isolated context)throws Exception {
        File root=new File(context.getCacheDir(),"exports");require(root.mkdir(),"export fixture directory");long now=System.currentTimeMillis();
        File foreign=new File(root,"keep.txt");Files.write(foreign.toPath(),new byte[]{1});
        for(int i=0;i<20;i++){File f=new File(root,"duo-log-"+Integer.toHexString(i)+".txt");Files.write(f.toPath(),new byte[]{1});}
        LogExportCache.clean(root,now+1000);require(root.listFiles(f->f.getName().startsWith("duo-log-")).length==2,"orphan quota");
        File first=null,second=null;
        try{
            first=LogExportCache.acquire(root,"duo-log-aa.txt",now);Files.write(first.toPath(),new byte[]{1});
            require(first.setLastModified(now-LogExportCache.MAX_AGE_MS-1),"fixture clock");
            second=LogExportCache.acquire(root,"duo-log-bb.txt",now);Files.write(second.toPath(),new byte[]{1});
            LogExportCache.clean(root,now);require(first.exists()&&second.exists(),"active export removed");
            denied(()->LogExportCache.acquire(root,"duo-log-cc.txt",now),"unbounded active exports");
            denied(()->LogExportCache.acquire(root,"../escape",now),"export path escape");
        }finally{LogExportCache.release(first);LogExportCache.release(second);}
        File huge=new File(root,"duo-log-dd.txt");try(RandomAccessFile file=new RandomAccessFile(huge,"rw")){file.setLength(LogExportCache.MAX_FILE_BYTES+1);}
        LogExportCache.clean(root,System.currentTimeMillis());require(!huge.exists()&&foreign.exists(),"oversized export/unrelated file boundary");
        File expired=new File(root,"duo-log-ee.txt");Files.write(expired.toPath(),new byte[]{1});require(expired.setLastModified(now-LogExportCache.MAX_AGE_MS-1),"expired fixture clock");
        LogExportCache.clean(root,now);require(!expired.exists(),"abandoned export TTL");
        cases.put("export_quota_size_expiry_active_leases_and_unrelated_files");
    }
    private void workbench(Instrumentation test,Isolated context,JSONObject result)throws Exception {
        File directory=new File(context.getFilesDir(),"content");AtomicWorkbenchContentStore store=new AtomicWorkbenchContentStore(directory);
        AtomicWorkbenchContentStore.Stored saved=new AtomicWorkbenchContentStore.Stored();
        saved.items.put(AtomicWorkbenchContentItem.Kind.CLIPBOARD,List.of(AtomicWorkbenchContentItem.clipboard("owned fixture",1)));
        store.write(saved);require(store.read().items.get(AtomicWorkbenchContentItem.Kind.CLIPBOARD).size()==1,"Android history fsync/readback");
        AtomicWorkbenchContentSource source=new AtomicWorkbenchContentSource(){
            public Result scan(AtomicWorkbenchContentItem.Kind kind){return new Result(List.of(),AtomicWorkbenchContentPermissionState.simple(AtomicWorkbenchContentPermissionState.Scope.FULL),State.READY);}
            public void start(Runnable hint){}public void stop(){}public void close(){}
        };
        AtomicWorkbenchContentRepository repo=new AtomicWorkbenchContentRepository(source,store,Runnable::run);
        Field worker=AtomicWorkbenchContentRepository.class.getDeclaredField("ownedWorker");worker.setAccessible(true);ThreadPoolExecutor pool=(ThreadPoolExecutor)worker.get(repo);
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
        try{
            pool.submit(()->{}).get(5,TimeUnit.SECONDS);
            require(repo.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).items.size()==1,"history restore");
            pool.execute(()->{entered.countDown();try{release.await(10,TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}});
            require(entered.await(2,TimeUnit.SECONDS),"blocked writer fixture");
            for(int i=0;i<10000;i++)repo.recordClipboard("owned-"+i,1,false,AtomicWorkbenchContentRepository.ClipboardOrigin.USER_READ);
            require(pool.getQueue().size()<=128,"writer queue unbounded");
            require(!repo.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).storageAvailable,"overload hidden from UI");
            FutureTask<Long> ui=new FutureTask<>(()->{long start=SystemClock.uptimeMillis();repo.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD);repo.observe(AtomicWorkbenchContentItem.Kind.MEDIA,s->{}).close();repo.setVisible(true);repo.refresh(AtomicWorkbenchContentItem.Kind.MEDIA,true);repo.close();return SystemClock.uptimeMillis()-start;});
            new android.os.Handler(android.os.Looper.getMainLooper()).post(ui);long elapsed=ui.get(1,TimeUnit.SECONDS);
            require(elapsed<500,"UI lifecycle blocked by pending writer");result.put("workbenchUiCallMillis",elapsed);
        }finally{repo.close();release.countDown();require(pool.awaitTermination(5,TimeUnit.SECONDS),"writer did not terminate");}
        cases.put("workbench_real_history_io_bounded_10000_requests_main_thread_lifecycle");
    }
    private void recorder(Isolated context)throws Exception {
        int uid=context.getPackageManager().getApplicationInfo("com.android.systemui",0).uid;Bundle get=new Bundle();get.putString("op","get");
        Bundle first=NativeIslandRecoveryStore.call(context,null,get,uid,"com.android.systemui",new String[]{"com.android.systemui"});
        require(first.getBoolean("ok"),"private recorder store read");
        Bundle put=new Bundle();put.putString("op","put");put.putString("epoch",first.getString("epoch"));put.putInt("status",2);
        put.putInt("boot",RuntimeEnvironment.bootCount(context));put.putString("key","fixture-only");put.putLong("posted",System.currentTimeMillis());put.putString("duration","00:00:05");put.putString("rawCount","00:00:05");
        require(NativeIslandRecoveryStore.call(context,null,put,uid,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"private recorder durable write");
        require(!NativeIslandRecoveryStore.call(context,null,get,uid+1,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"forged caller");
        put.putString("epoch","expired");require(!NativeIslandRecoveryStore.call(context,null,put,uid,"com.android.systemui",new String[]{"com.android.systemui"}).getBoolean("ok"),"stale recorder epoch");
        require(NativeIslandRecoveryStore.clearForReset(context),"isolated recovery cleanup");
        Bundle after=NativeIslandRecoveryStore.call(context,null,get,uid,"com.android.systemui",new String[]{"com.android.systemui"});
        require(after.getBoolean("migrated")&&!after.containsKey("status"),"reset tombstone missing");
        Bundle rejected=context.getBaseContext().getContentResolver().call(Uri.parse("content://ls.augment.com.config"),NativeIslandRecoveryStore.METHOD,null,get);
        require(rejected!=null&&!rejected.getBoolean("ok"),"real Binder route admitted module UID as SystemUI");
        cases.put("recorder_real_private_preferences_uid_epoch_reset_binder_denial_oem_flow_separate");
    }
    private void startup()throws Exception {
        StartupDiagnostics.record("RESOURCE_BOUNDARY_DEVICE_FIXTURE","synthetic regression",null);
        Field lock=StartupDiagnostics.class.getDeclaredField("LOCK"),queue=StartupDiagnostics.class.getDeclaredField("QUEUE"),scheduled=StartupDiagnostics.class.getDeclaredField("scheduled");
        lock.setAccessible(true);queue.setAccessible(true);scheduled.setAccessible(true);long deadline=SystemClock.elapsedRealtime()+12000;
        boolean idle=false;
        while(SystemClock.elapsedRealtime()<deadline){
            synchronized(lock.get(null)){ScheduledFuture<?> pending=(ScheduledFuture<?>)scheduled.get(null);idle=((Collection<?>)queue.get(null)).isEmpty()&&(pending==null||pending.isDone());}
            if(idle)break;Thread.sleep(100);
        }
        require(idle,"startup diagnostics did not drain/stop scheduling on real Android");cases.put("startup_real_provider_delivery_then_no_idle_task");
    }
    private static final class Isolated extends ContextWrapper {
        final File root;final String prefix;final Set<String> preferences=new HashSet<>();final List<Isolated> children=new ArrayList<>();
        Isolated(Context base,File root,String prefix){super(base);this.root=root;this.prefix=prefix;}
        Isolated child(String name)throws IOException{File folder=new File(root,name);if(!folder.mkdir())throw new IOException("fixture child");Isolated child=new Isolated(getBaseContext(),folder,prefix+name+"-");children.add(child);return child;}
        @Override public Context getApplicationContext(){return this;}
        @Override public File getCacheDir(){File file=new File(root,"cache");file.mkdirs();return file;}
        @Override public File getFilesDir(){File file=new File(root,"files");file.mkdirs();return file;}
        @Override public File getDatabasePath(String name){File directory=new File(root,"databases");directory.mkdirs();return new File(directory,name);}
        @Override public SharedPreferences getSharedPreferences(String name,int mode){String key=prefix+name;preferences.add(key);return getBaseContext().getSharedPreferences(key,mode);}
        @Override public SQLiteDatabase openOrCreateDatabase(String name,int mode,SQLiteDatabase.CursorFactory factory){return openOrCreateDatabase(name,mode,factory,null);}
        @Override public SQLiteDatabase openOrCreateDatabase(String name,int mode,SQLiteDatabase.CursorFactory factory,DatabaseErrorHandler handler){return SQLiteDatabase.openDatabase(getDatabasePath(name).getPath(),factory,SQLiteDatabase.CREATE_IF_NECESSARY,handler);}
        void clean()throws IOException{for(Isolated child:children)child.clean();for(String name:preferences)if(!getBaseContext().deleteSharedPreferences(name))throw new IOException("fixture preferences cleanup");}
    }
}
