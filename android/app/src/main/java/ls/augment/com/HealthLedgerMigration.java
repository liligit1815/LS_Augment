package ls.augment.com;

import android.content.ContentValues;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Process;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Upgrade only module-owned legacy ledger files; native Xiaomi fitness data is never opened. */
final class HealthLedgerMigration {
    private static final String PREFS="health-ledger-migration-v1";
    private static DurablePreferences state;
    private static final String[] TABLES={"records","plans","events","plan_awards"};
    private static final String[][] COLUMNS={
        {"account","sid","time","raw","output","token","generated"},
        {"account","id","day","spec"},
        {"account","id","day","time","steps","admitted"},
        {"account","time","requested","allowed"}
    };
    private HealthLedgerMigration(){}

    // Root cross-user operation: these are validated target-package CE paths, not this module's own storage directory.
    //noinspection SdCardPath
    static synchronized Result migrate(Context context){
        Context app=context.getApplicationContext();
        if(state==null)state=new DurablePreferences(app.getSharedPreferences(PREFS,Context.MODE_PRIVATE));
        if(state.getBoolean("complete",false))return new Result(true,"");
        if(ResetWriteFence.active())return new Result(false,"正在重置，健康账本迁移稍后重试");
        int user=Process.myUid()/100000;HideUserIdentity.Snapshot identity=HideUserIdentity.read(app,user);
        if(!identity.success)return new Result(false,"无法核验健康账本所属用户");
        File stage=new File(app.getCacheDir(),"health-ledger-migrate-"+UUID.randomUUID());
        try{
            if(!stage.mkdir())throw new IllegalStateException("staging unavailable");
            android.system.Os.chmod(stage.getAbsolutePath(),0700);
            ApplicationInfo health;
            try{health=app.getPackageManager().getApplicationInfo("com.mi.health",0);}
            catch(PackageManager.NameNotFoundException missing){
                // Hidden packages also report missing; only verified filesystem absence is safe.
                health=new ApplicationInfo();health.uid=user*100000+10000;
            }
            if(health.uid/100000!=user||health.uid%100000<10000)throw new IllegalStateException("health identity");
            String script;try(java.io.InputStream input=app.getAssets().open("health_ledger_migrate.sh")){script=new String(input.readAllBytes(),StandardCharsets.UTF_8);}
            String prefix="expected_uid="+health.uid+"\nexpected_user="+user+"\nmodule_uid="+Process.myUid()+"\nbase="+RootShell.quote("/data/user/"+user+"/com.mi.health")+"\nstage="+RootShell.quote(stage.getAbsolutePath())+"\n";
            RootShell.Result snapshot=RootShell.run("nsenter -t 1 -m -- sh",prefix+"phase=snapshot\n"+script,60,4096);
            if(!snapshot.isSuccess())throw new IllegalStateException("legacy_snapshot:"+snapshot.publicError());
            boolean absent=snapshot.output.trim().equals("HEALTH_LEDGER_ABSENT=1");
            String digest="";
            if(!absent){
                String[] lines=snapshot.output.trim().split("\\r?\\n");
                if(lines.length!=1||!lines[0].matches("HEALTH_LEDGER_DIGEST=[0-9a-f]{64}"))throw new IllegalStateException("snapshot verification");
                digest=lines[0].substring("HEALTH_LEDGER_DIGEST=".length());
            }
            File source=new File(stage,"ls_augment_steps_v1.db");
            if(!absent&&!source.exists()&&(new File(stage,"ls_augment_steps_v1.db-wal").exists()||new File(stage,"ls_augment_steps_v1.db-shm").exists()||new File(stage,"ls_augment_steps_v1.db-journal").exists()))
                throw new IllegalStateException("incomplete legacy database");
            if(!HealthLedgerStore.importLegacy(app,source.exists()?source:null))throw new IllegalStateException("private import not durable");
            if(!absent){
                RootShell.Result cleanup=RootShell.run("nsenter -t 1 -m -- sh",prefix+"phase=cleanup\nexpected_digest="+digest+"\n"+script,60,4096);
                if(!cleanup.isSuccess())throw new IllegalStateException("legacy_cleanup:"+cleanup.publicError());
                if(!cleanup.output.trim().equals("HEALTH_LEDGER_CLEANED=1"))throw new IllegalStateException("legacy cleanup not verified");
            }
            if(!HideUserIdentity.match(app,user,identity.userSerial).success)throw new IllegalStateException("user changed");
            if(!HealthLedgerStore.finishMigration(app))throw new IllegalStateException("private readiness not durable");
            if(!state.edit().putBoolean("complete",true).commit())throw new IllegalStateException("migration checkpoint");
            return new Result(true,"");
        }catch(Exception unavailable){
            AuditLog.write(app,"HEALTH_LEDGER_MIGRATION_FAILED",unavailable.getClass().getSimpleName()+":"+Objects.toString(unavailable.getMessage(),"unavailable"));
            return new Result(false,"健康模块账本迁移未完成，旧记录已保留或已安全导入；稍后重试");
        }
        finally{
            for(String name:new String[]{"ls_augment_steps_v1.db","ls_augment_steps_v1.db-wal","ls_augment_steps_v1.db-shm","ls_augment_steps_v1.db-journal","ls_augment_steps.lock"})new File(stage,name).delete();
            stage.delete();
            if(stage.exists())discardStage(app,user,stage);
        }
    }

    // Root cross-user operation: these are validated target-package CE paths, not this module's own storage directory.
    //noinspection SdCardPath
    private static void discardStage(Context context,int user,File stage){
        try(java.io.InputStream input=context.getAssets().open("health_ledger_migrate.sh")){
            int uid=Process.myUid();
            String prefix="expected_uid="+uid+"\nexpected_user="+user+"\nmodule_uid="+uid
                    +"\nbase="+RootShell.quote("/data/user/"+user+"/com.mi.health")
                    +"\nstage="+RootShell.quote(stage.getAbsolutePath())+"\nphase=discard_stage\n";
            RootShell.Result result=RootShell.run("nsenter -t 1 -m -- sh",prefix+new String(input.readAllBytes(),StandardCharsets.UTF_8),10,1024);
            if(!result.isSuccess()||!result.output.trim().equals("HEALTH_LEDGER_STAGE_REMOVED=1"))
                AuditLog.write(context,"HEALTH_LEDGER_STAGE_RETAINED",result.publicError());
        }catch(Exception unavailable){AuditLog.write(context,"HEALTH_LEDGER_STAGE_RETAINED",unavailable.getClass().getSimpleName());}
    }
    static boolean importDatabase(HealthLedgerDatabase ledger,File source){
        SQLiteDatabase target=ledger.getWritableDatabase();
        // A newly reappeared legacy database must never be deleted without being imported.
        if(ledger.ready())return source==null;
        // Source deletion may succeed just before this app is reclaimed. Keep the
        // already committed import when the retry can no longer see the old files.
        if(source==null)try(Cursor c=target.rawQuery("SELECT value FROM migration WHERE key='import_staged'",null)){
            if(c.moveToFirst()&&"1".equals(c.getString(0)))return true;
        }
        SQLiteDatabase legacy=null;
        try{
            if(source!=null){
                // This is the verified copy inside the module's own staging directory.
                // Permit SQLite to recover its copied WAL/hot journal without opening
                // or modifying any file in the health application's sandbox.
                legacy=SQLiteDatabase.openDatabase(source.getAbsolutePath(),null,SQLiteDatabase.OPEN_READWRITE);
                if(legacy.getVersion()!=1&&legacy.getVersion()!=2)return false;
                try(Cursor check=legacy.rawQuery("PRAGMA quick_check",null)){if(!check.moveToFirst()||!"ok".equals(check.getString(0))||check.moveToNext())return false;}
                for(int i=0;i<TABLES.length;i++){
                    if(i==3&&legacy.getVersion()==1)continue;
                    List<String> names=new ArrayList<>();try(Cursor c=legacy.rawQuery("PRAGMA table_info("+TABLES[i]+")",null)){while(c.moveToNext())names.add(c.getString(1));}
                    if(!names.equals(Arrays.asList(COLUMNS[i])))return false;
                }
            }
            target.beginTransaction();
            try{
                // No new private writer is admitted before migration completes. A changed
                // legacy source can therefore replace an earlier staged import safely.
                for(String table:TABLES)target.delete(table,null,null);
                if(legacy!=null)for(int i=0;i<TABLES.length;i++){
                    if(i==3&&legacy.getVersion()==1)continue;
                    long imported=0;
                    try(Cursor c=legacy.rawQuery("SELECT "+String.join(",",COLUMNS[i])+" FROM "+TABLES[i],null)){
                        while(c.moveToNext()){
                            ContentValues values=new ContentValues();
                            for(int column=0;column<COLUMNS[i].length;column++){
                                if(c.isNull(column))throw new IllegalStateException("null legacy value");
                                String name=COLUMNS[i][column];
                                boolean number=Arrays.asList("time","generated","steps","admitted","requested","allowed").contains(name);
                                if(number&&c.getType(column)==Cursor.FIELD_TYPE_INTEGER)values.put(name,c.getLong(column));
                                else if(!number&&c.getType(column)==Cursor.FIELD_TYPE_STRING)values.put(name,c.getString(column));
                                else throw new IllegalStateException("invalid legacy type");
                            }
                            target.insertOrThrow(TABLES[i],null,values);imported++;
                        }
                    }
                    try(Cursor c=target.rawQuery("SELECT COUNT(*) FROM "+TABLES[i],null)){if(!c.moveToFirst()||c.getLong(0)!=imported)throw new IllegalStateException("import count");}
                    if(!fingerprint(legacy,i).equals(fingerprint(target,i)))throw new IllegalStateException("import content");
                }
                target.execSQL("INSERT OR REPLACE INTO migration(key,value) VALUES('import_staged','1')");
                target.setTransactionSuccessful();
            }finally{target.endTransaction();}
            // A FULL checkpoint confirms the committed WAL is durable before source deletion.
            try(Cursor checkpoint=target.rawQuery("PRAGMA wal_checkpoint(FULL)",null)){if(!checkpoint.moveToFirst()||checkpoint.getInt(0)!=0)return false;}
            return true;
        }catch(RuntimeException invalid){return false;}
        finally{if(legacy!=null)legacy.close();}
    }
    private static String fingerprint(SQLiteDatabase db,int table){
        try{
            java.security.MessageDigest digest=java.security.MessageDigest.getInstance("SHA-256");
            String columns=String.join(",",COLUMNS[table]);
            try(Cursor c=db.rawQuery("SELECT "+columns+" FROM "+TABLES[table]+" ORDER BY "+columns,null)){
                while(c.moveToNext())for(int i=0;i<COLUMNS[table].length;i++){
                    byte[] value=c.getString(i).getBytes(StandardCharsets.UTF_8);
                    digest.update(java.nio.ByteBuffer.allocate(4).putInt(value.length).array());digest.update(value);
                }
            }
            return java.util.Base64.getEncoder().encodeToString(digest.digest());
        }catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException(impossible);}
    }
    static final class Result {final boolean success;final String message;Result(boolean success,String message){this.success=success;this.message=message;}}
}
