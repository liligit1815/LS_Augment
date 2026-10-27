package ls.augment.com;

import android.content.*;
import android.os.*;
import android.os.Process;
import java.io.*;
import java.nio.file.Files;
import java.util.*;
import org.json.*;

/** Uses isolated files/preferences. Never clears the user's real history or public logs. */
final class LogCleanupCases {
    private static int checks;
    private static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
    private static void write(File file,String value)throws Exception{file.getParentFile().mkdirs();Files.write(file.toPath(),value.getBytes(java.nio.charset.StandardCharsets.UTF_8));}
    private static String read(File file)throws Exception{return new String(Files.readAllBytes(file.toPath()),java.nio.charset.StandardCharsets.UTF_8);}
    private static final class Fixture extends ContextWrapper {
        final File root,files,cache,deviceFiles;final String prefix;final Set<String> names=new HashSet<>();
        final boolean device;final Fixture owner;
        Fixture(Context base)throws Exception{super(base);prefix="clear-log-test-"+UUID.randomUUID();root=new File(base.getCacheDir(),prefix);files=new File(root,"files");cache=new File(root,"cache");deviceFiles=new File(root,"device-files");files.mkdirs();cache.mkdirs();deviceFiles.mkdirs();device=false;owner=this;}
        Fixture(Fixture parent){super(parent.getBaseContext());root=parent.root;files=parent.files;cache=parent.cache;deviceFiles=parent.deviceFiles;prefix=parent.prefix;device=true;owner=parent;}
        @Override public Context getApplicationContext(){return this;}
        @Override public Context createDeviceProtectedStorageContext(){return device?this:new Fixture(owner);}
        @Override public File getFilesDir(){return device?deviceFiles:files;}
        @Override public File getCacheDir(){return cache;}
        @Override public File getDataDir(){return root;}
        @Override public SharedPreferences getSharedPreferences(String name,int mode){synchronized(owner.names){owner.names.add(prefix+"-"+name);}return getBaseContext().getSharedPreferences(prefix+"-"+name,mode);}
        void close()throws Exception{OwnedFileCleaner.clear(root);Files.delete(root.toPath());for(String name:names)getBaseContext().deleteSharedPreferences(name);}
    }
    static JSONObject run(Context base)throws Exception {
        checks=0;Fixture f=new Fixture(base);
        try {
            for(String name:LogCleanupFiles.LOGS)write(new File(f.files,name),"OLD_USER_LOG_FIXTURE");
            write(new File(f.files,"device-regression-results/test.json"),"OLD_TEST");
            write(new File(f.deviceFiles,"boot-evidence-v1/test--BOOT.txt"),"OLD_BOOT");
            write(new File(f.cache,"duo-log-abc.txt"),"OLD_EXPORT");
            write(new File(f.cache,"app-updates/keep.apk"),"KEEP_UPDATE");
            write(new File(f.files,"native-recovery.json"),"KEEP_RECOVERY");
            f.getSharedPreferences(AppConfig.PREFS,0).edit().putString("user-setting","KEEP").commit();
            f.getSharedPreferences(AppConfig.DIAGNOSTICS,0).edit().putString("native-capability","KEEP").commit();
            for(String name:new String[]{"hook-processes",DiagnosticEvidenceStore.STORE,"diagnostic-retention"})f.getSharedPreferences(name,0).edit().putString("old","OLD").commit();
            File crash=new File(f.files,"app-crash.log");
            try(RandomAccessFile descriptor=new RandomAccessFile(crash,"rw")){
                check(LogCleanup.clear(f,context->0)>0,"reports released bytes");
                check(crash.length()==0&&descriptor.length()==0,"crash inode truncated");
                descriptor.writeBytes("NEW_CRASH");check(read(crash).equals("NEW_CRASH"),"held descriptor can record a new crash");
            }
            for(String name:LogCleanupFiles.LOGS)if(!name.equals("app-crash.log"))check(!new File(f.files,name).exists(),"cleared "+name);
            check(!new File(f.files,"device-regression-results").exists()&&!new File(f.deviceFiles,"boot-evidence-v1").exists(),"archives/test records removed");
            check(!new File(f.cache,"duo-log-abc.txt").exists(),"export temporary removed");
            check(read(new File(f.cache,"app-updates/keep.apk")).equals("KEEP_UPDATE"),"update cache retained");
            check(read(new File(f.files,"native-recovery.json")).equals("KEEP_RECOVERY"),"recovery journal retained");
            check(f.getSharedPreferences(AppConfig.PREFS,0).getString("user-setting","").equals("KEEP"),"settings unchanged");
            check(f.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString("native-capability","").equals("KEEP"),"live capability unchanged");
            for(String name:new String[]{"hook-processes",DiagnosticEvidenceStore.STORE,"diagnostic-retention"})check(f.getSharedPreferences(name,0).getAll().isEmpty(),"cleared history store "+name);
            long cutoff=LogHistory.cutoff(f);check(cutoff>0&&LogHistory.old(new Fixture(f),cutoff-1),"durable cross-context boundary");
            Bundle startup=new Bundle();startup.putString("event",new JSONObject().put("wall",cutoff-1)
                    .put("pid",Process.myPid()).put("uid",Process.myUid()).put("protocol",1)
                    .put("session","log-clear-test").put("stage","TEST").put("sequence",1).toString());
            check(StartupDiagnosticStore.record(f,startup).getBoolean("ok")&&!new File(f.files,"startup-diagnostics.log").exists(),"old startup queue acknowledged without replay");
            JSONObject snapshot=new JSONObject().put("pid",Process.myPid()).put("moduleLoadedAt",cutoff-100).put("moduleLoaded",true)
                    .put("process","test").put("hooks",new JSONArray().put(new JSONObject().put("id","test").put("registration","REGISTERED").put("lastError","OLD_ERROR")));
            Bundle telemetry=new Bundle();telemetry.putString("snapshot",snapshot.toString());telemetry.putString("events","[]");
            Bundle reply=DiagnosticStore.record(f,telemetry);
            String stored=f.getSharedPreferences("hook-processes",0).getString("pid_"+Process.myPid(),"");
            check(reply.getBoolean("ok")&&reply.getLong("historyCutoff")==cutoff&&!stored.contains("OLD_ERROR")&&stored.contains("REGISTERED"),"old telemetry becomes live registration only");
            File active=LogExportCache.acquire(f.cache,"duo-log-def.txt",System.currentTimeMillis());
            try{try{LogCleanup.clear(f,c->0);throw new AssertionError("active export cleared");}catch(IOException expected){check(LogHistory.cutoff(f)==cutoff,"busy export rejects before mutation");}}
            finally{LogExportCache.release(active);}
            AuditLog.write(f,"TEST","NEW_LOG");check(AuditLog.read(f).contains("NEW_LOG")&&!AuditLog.read(f).contains("OLD_USER_LOG_FIXTURE"),"new logging resumes");
            File outside=new File(f.root,"outside.txt");write(outside,"KEEP_OUTSIDE");
            Files.createSymbolicLink(new File(f.files,"ls_augment.log.link").toPath(),outside.toPath());
            Files.delete(new File(f.files,"ls_augment.log").toPath());Files.createSymbolicLink(new File(f.files,"ls_augment.log").toPath(),outside.toPath());
            try{LogCleanupFiles.clear(f.files,f.cache,f.deviceFiles);throw new AssertionError("symlink accepted");}catch(IOException expected){check(read(outside).equals("KEEP_OUTSIDE"),"symlink target protected");}
            Files.delete(new File(f.files,"ls_augment.log").toPath());
            File journals=new File(f.root,"journals");journals.mkdirs();
            File owned=new File(journals,"duo-1-"+UUID.randomUUID()+".txt");write(owned,"OLD_CRASH");write(new File(journals,"rom-log.txt"),"KEEP_ROM");
            try(RandomAccessFile descriptor=new RandomAccessFile(owned,"rw")){
                check(DuoLogRootCleanup.clearJournals(journals.getCanonicalFile(),Process.myUid())==9,"owned journal truncated");
                descriptor.writeBytes("NEW_FATAL");check(read(owned).equals("NEW_FATAL"),"journal descriptor retained");
            }
            check(read(new File(journals,"rom-log.txt")).equals("KEEP_ROM"),"other app/ROM logs untouched");
            File link=new File(journals,"duo-2-"+UUID.randomUUID()+".txt");Files.createSymbolicLink(link.toPath(),outside.toPath());
            try{DuoLogRootCleanup.clearJournals(journals.getCanonicalFile(),Process.myUid());throw new AssertionError("journal link accepted");}catch(Exception expected){check(read(outside).equals("KEEP_OUTSIDE"),"root journal link refused");}
            return new JSONObject().put("checks",checks).put("realUserLogsCleared",false).put("configurationChanged",false);
        }finally{f.close();}
    }
}
