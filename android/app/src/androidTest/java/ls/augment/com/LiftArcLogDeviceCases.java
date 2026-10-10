package ls.augment.com;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONObject;

/** Log-channel stimuli only: no hook installation, lockscreen gesture, configuration write or restart. */
final class LiftArcLogDeviceCases {
    private LiftArcLogDeviceCases(){ }
    static JSONObject run(Context context)throws Exception{
        if(Looper.myLooper()==Looper.getMainLooper())throw new IllegalStateException("Run log fixture off the UI thread");
        String nonce=UUID.randomUUID().toString().replace("-","");
        JSONObject report=new JSONObject().put("testOnly",true).put("fixture",nonce)
                .put("pid",Process.myPid()).put("moduleVersion",BuildConfig.VERSION_NAME)
                .put("configurationWrites",0).put("lockscreenEffectsStarted",0).put("scopeRestarts",0);
        JSONArray passed=new JSONArray();report.put("passedCases",passed);
        Map<String,?> before=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        SharedPreferences snapshots=context.getSharedPreferences("hook-processes",0);
        String snapshotKey="pid_"+Process.myPid(),originalSnapshot=snapshots.getString(snapshotKey,null);
        Class<?> logger=Class.forName("ls.augment.com.hook.LiftArcLog");
        Method setContext=method(logger,"setContext",Context.class),getContext=method(logger,"context");
        Context original=(Context)getContext.invoke(null);
        Throwable failure=null;
        try{
            testStoreWithoutConfigurationGate(context,nonce,passed);
            setContext.invoke(null,context);
            Method info=method(logger,"d",String.class),warn=method(logger,"w",String.class,Throwable.class),error=method(logger,"e",String.class,Throwable.class);
            String marker="[log-channel-fixture:"+nonce+"] ";
            method(logger,"stageInfo",String.class).invoke(null,"LIFTARC_LOG_CHANNEL_FIXTURE "+marker+"stage-ready");
            method(logger,"stageError",String.class,Throwable.class).invoke(null,"LIFTARC_LOG_CHANNEL_FIXTURE "+marker+"stage-error",new IllegalStateException("synthetic-install-error"));
            method(logger,"stageInfo",String.class).invoke(null,"ls_augment_liftarc_detail="+marker+"latest-only");
            Class<?> telemetry=Class.forName("ls.augment.com.hook.HookTelemetry");
            method(telemetry,"event",String.class).invoke(null,"ls_augment_liftarc_views="+marker+"diagnostic-only");
            info.invoke(null,marker+"INFO native channel stimulus");
            warn.invoke(null,marker+"WARN native channel stimulus",new IllegalStateException("fixture-warning"));
            error.invoke(null,marker+"ERROR native channel stimulus",new IllegalStateException("fixture-error"));
            for(int i=0;i<50;i++)info.invoke(null,marker+"INFO native channel stimulus");
            for(int i=0;i<25;i++)info.invoke(null,marker+"burst-"+i);
            // INFO noise cannot exhaust the WARN/ERROR capacity.
            warn.invoke(null,marker+"WARN after INFO burst",null);
            error.invoke(null,marker+"ERROR after INFO burst",null);
            File file=new File(context.getFilesDir(),DiagnosticStore.LIFTARC_FILE);
            JSONArray records=new JSONArray();long deadline=SystemClock.elapsedRealtime()+15_000;
            while(SystemClock.elapsedRealtime()<deadline){
                records=fixtureRecords(file,marker);
                if(hasValue(records,marker+"ERROR after INFO burst"))break;
                SystemClock.sleep(100);
            }
            int infos=0,warns=0,errors=0,firstInfo=0;
            for(int i=0;i<records.length();i++){
                JSONObject record=records.getJSONObject(i);String value=record.getString("value"),level=record.getString("level");
                require("LIFTARC".equals(record.getString("feature")),"Wrong persisted feature");
                require(record.getInt("pid")==Process.myPid()&&record.getInt("uid")==Process.myUid(),"Caller attribution lost");
                require(BuildConfig.VERSION_NAME.equals(record.getString("moduleVersion")),"Module attribution lost");
                if(level.equals("INFO"))infos++;else if(level.equals("WARN"))warns++;else if(level.equals("ERROR"))errors++;else throw new AssertionError("Unsupported level stored");
                if(value.contains(marker+"INFO native channel stimulus"))firstInfo++;
            }
            require(infos>=2&&infos<=8&&warns==2&&errors==3,"Missing levels or unbounded INFO burst: "+records);
            require(hasValue(records,marker+"stage-ready")&&hasValue(records,marker+"stage-error"),"Explicit installation-stage logging was not persisted");
            require(!hasValue(records,marker+"latest-only")&&!hasValue(records,marker+"diagnostic-only"),"Latest-value diagnostics were promoted to persistent events");
            require(firstInfo==1,"Identical runtime event was not coalesced");
            long suppressed=((Number)method(logger,"suppressedEvents").invoke(null)).longValue();
            require(suppressed>=50,"Suppression counter did not retain discarded observations");
            require(file.length()<=DiagnosticStore.DETAIL_MAX_BYTES,"Persistent log exceeded its retention limit");
            report.put("fixtureRecords",records.length()).put("levels",new JSONObject().put("INFO",infos).put("WARN",warns).put("ERROR",errors))
                    .put("suppressedEvents",suppressed).put("persistentFile",file.getAbsolutePath());
            passed.put("production-logger-asynchronous-telemetry-provider-persistent-levels-and-caller-attribution");
            passed.put("same-event-coalescing-info-rate-limit-and-reserved-warning-error-capacity");
            passed.put("explicit-stage-logs-included-and-frequent-latest-value-diagnostics-excluded");
            StringBuilder export=new StringBuilder();DiagnosticExport.appendLiftArcLog(export,context);
            require(export.toString().contains("LIFTARC_RUNTIME INFO/WARN/ERROR")&&export.toString().contains(marker+"ERROR after INFO burst"),"Unified export log section missing fixture records");
            require("REDACTED / present:true".equals(DiagnosticExport.diagnosticValue(LiftArcOptions.key("hint_text"),"fixture-private-hint")),"Hint text was exported in full");
            passed.put("unconditional-unified-export-section-and-private-hint-redaction");
        }catch(Throwable error){failure=error;report.put("error",android.util.Log.getStackTraceString(error));}
        finally{
            setContext.invoke(null,original);
            // This worker was initialized in the module's instrumentation process only.
            // Stop it before restoring that PID's prior snapshot; other PIDs/log records are retained.
            try{
                Class<?> telemetry=Class.forName("ls.augment.com.hook.HookTelemetry");
                Field workerField=telemetry.getDeclaredField("worker");workerField.setAccessible(true);
                ScheduledExecutorService worker=(ScheduledExecutorService)workerField.get(null);
                worker.shutdown();require(worker.awaitTermination(5,TimeUnit.SECONDS),"Fixture telemetry writer did not stop");
                String current=snapshots.getString(snapshotKey,null);
                if(!java.util.Objects.equals(current,originalSnapshot)){
                    require(current!=null,"PID snapshot removed concurrently; not restoring it");
                    JSONObject owner=new JSONObject(current);
                    Field started=telemetry.getDeclaredField("startedWall");started.setAccessible(true);
                    require(owner.optInt("pid")==Process.myPid()&&owner.optInt("sourceUid")==Process.myUid()
                            &&owner.optLong("moduleLoadedAt")==started.getLong(null),"PID snapshot ownership changed; not restoring it");
                    SharedPreferences.Editor edit=snapshots.edit();
                    if(originalSnapshot==null)edit.remove(snapshotKey);else edit.putString(snapshotKey,originalSnapshot);
                    require(edit.commit(),"Fixture PID snapshot restore failed");
                }
                report.put("fixtureTelemetryStopped",true).put("ownPidSnapshotRestored",true)
                        .put("syntheticLogRecordsRetained",true);
            }catch(Throwable cleanup){
                report.put("cleanupError",android.util.Log.getStackTraceString(cleanup));
                if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);
            }
            boolean unchanged=before.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
            report.put("configurationUnchanged",unchanged);
            if(!unchanged&&failure==null)failure=new AssertionError("Log fixture changed module configuration");
            report.put("success",failure==null).put("status",failure==null?"pass":"fail");
            File folder=new File(context.getFilesDir(),"device-regression-results");
            if(!folder.isDirectory()&&!folder.mkdirs())throw new java.io.IOException("Cannot create fixture report folder");
            Files.write(new File(folder,"liftarc-log-fixture.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        }
        if(failure!=null)throw new AssertionError("LiftArc log-channel fixture failed: "+report,failure);
        return report;
    }
    private static Method method(Class<?> owner,String name,Class<?>...args)throws Exception{
        Method method=owner.getDeclaredMethod(name,args);method.setAccessible(true);return method;
    }
    private static JSONArray fixtureRecords(File file,String marker)throws Exception{
        JSONArray out=new JSONArray();if(!file.isFile())return out;
        String contents;
        synchronized(BoundedLog.class){contents=new String(BoundedLog.tail(file,DiagnosticStore.DETAIL_MAX_BYTES),StandardCharsets.UTF_8);}
        for(String line:contents.split("\\r?\\n")){
            if(!line.contains(marker))continue;
            JSONObject event=new JSONObject(line);if(event.optString("value").contains(marker))out.put(event);
        }
        return out;
    }
    private static boolean hasValue(JSONArray records,String value){
        for(int i=0;i<records.length();i++)if(records.optJSONObject(i).optString("value").contains(value))return true;
        return false;
    }
    private static void testStoreWithoutConfigurationGate(Context context,String nonce,JSONArray passed)throws Exception{
        File folder=new File(context.getCacheDir(),"liftarc-log-fixture-"+nonce);
        if(!folder.mkdirs())throw new java.io.IOException("Cannot create isolated store fixture");
        Set<String> stores=new LinkedHashSet<>();
        Context isolated=new ContextWrapper(context){
            @Override public File getFilesDir(){return folder;}
            @Override public SharedPreferences getSharedPreferences(String name,int mode){
                stores.add(name);
                if(AppConfig.PREFS.equals(name))throw new AssertionError("LiftArc logging read a configuration gate");
                return context.getSharedPreferences("liftarc_log_fixture_"+nonce+"_"+name,mode);
            }
        };
        try{
            JSONArray events=new JSONArray();
            for(String level:new String[]{"INFO","WARN","ERROR","DEBUG"})events.put(new JSONObject().put("feature","LIFTARC").put("level",level).put("value","isolated-channel-"+level));
            events.put(new JSONObject().put("feature","UNKNOWN").put("level","INFO").put("value","reject-unknown"));
            Bundle extras=new Bundle();extras.putString("snapshot",new JSONObject().put("pid",Process.myPid()).put("process","log-channel-fixture").put("moduleVersion",BuildConfig.VERSION_NAME).toString());
            extras.putString("events",events.toString());
            require(DiagnosticStore.record(isolated,extras).getBoolean("ok"),"Isolated persistent store rejected ordinary log events");
            require(!stores.contains(AppConfig.PREFS),"LiftArc logging depends on a feature configuration flag");
            String[] lines=new String(BoundedLog.tail(new File(folder,DiagnosticStore.LIFTARC_FILE),DiagnosticStore.DETAIL_MAX_BYTES),StandardCharsets.UTF_8).trim().split("\\r?\\n");
            require(lines.length==3,"Unsupported severity or feature was persisted");
            passed.put("provider-store-accepts-all-three-levels-without-reading-configuration-and-rejects-unknown-levels");
        }finally{
            for(String store:stores)require(context.getSharedPreferences("liftarc_log_fixture_"+nonce+"_"+store,0).edit().clear().commit(),"Isolated preferences cleanup failed");
            OwnedFileCleaner.clear(folder);require(folder.delete(),"Isolated log fixture cleanup failed");
        }
    }
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
