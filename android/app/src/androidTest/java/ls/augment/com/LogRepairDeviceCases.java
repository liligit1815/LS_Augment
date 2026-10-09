package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Process;
import android.os.SystemClock;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import ls.augment.com.hook.LogRepairHookDeviceCases;
import ls.augment.com.hook.LogRepairRuntimeDeviceCases;
import org.json.JSONArray;
import org.json.JSONObject;

/** Production reducers and Android preference side effects, with isolated diagnostic keys. */
final class LogRepairDeviceCases {
    private LogRepairDeviceCases(){ }
    static JSONObject run(Context context)throws Throwable{
        JSONObject report=new JSONObject().put("moduleVersion",BuildConfig.VERSION_NAME)
                .put("moduleVersionCode",BuildConfig.VERSION_CODE).put("pid",Process.myPid())
                .put("at",System.currentTimeMillis()).put("configurationWrites",0)
                .put("hiddenApplicationsTouched",0).put("testOnly",true);
        JSONArray passed=new JSONArray();report.put("passedCases",passed);
        String prefix="ls_augment_test_logrepair_"+Long.toHexString(System.nanoTime())+"_";
        String[] keys={prefix+"current",prefix+"same",prefix+"legacy",prefix+"normalized",prefix+"invalid-key"};
        SharedPreferences diagnostics=context.getSharedPreferences(AppConfig.DIAGNOSTICS,0);
        SharedPreferences evidence=context.getSharedPreferences(DiagnosticEvidenceStore.STORE,0);
        Map<String,Object> originalDiagnostics=remember(diagnostics,keys),originalEvidence=remember(evidence,keys);
        Throwable failure=null;
        try{
            JSONObject hooks=new JSONObject();report.put("hookObserver",hooks);LogRepairHookDeviceCases.run(hooks);
            JSONObject runtime=new JSONObject();report.put("runtimeEvidence",runtime);LogRepairRuntimeDeviceCases.run(context,runtime);
            testEvidencePolicy(passed);
            testPreferenceEvidence(context,diagnostics,evidence,keys,passed,report);
            testAutomation(passed);
        }catch(Throwable error){failure=error;report.put("error",android.util.Log.getStackTraceString(error));}
        finally{
            try{
                restore(diagnostics,keys,originalDiagnostics);restore(evidence,keys,originalEvidence);
                for(String key:keys){
                    require(matches(diagnostics,key,originalDiagnostics),"Diagnostic fixture key not restored: "+key);
                    require(matches(evidence,key,originalEvidence),"Evidence fixture key not restored: "+key);
                }
                report.put("cleanupComplete",true).put("fixtureKeys",new JSONArray(keys));
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);
                report.put("cleanupComplete",false).put("cleanupError",android.util.Log.getStackTraceString(cleanup));}
            report.put("success",failure==null).put("status",failure==null?"pass":"fail");
            File folder=new File(context.getFilesDir(),"device-regression-results");
            if(!folder.isDirectory()&&!folder.mkdirs())throw new java.io.IOException("Cannot create fixture report folder");
            File file=new File(folder,"log-repair-fixture.json");
            Files.write(file.toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
            report.put("fixtureReport",file.getAbsolutePath());
        }
        if(failure!=null)throw failure;
        return report;
    }
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    private static Map<String,Object> remember(SharedPreferences prefs,String[] keys){
        Map<String,Object> out=new LinkedHashMap<>();Map<String,?> existing=prefs.getAll();
        for(String key:keys)if(existing.containsKey(key))out.put(key,existing.get(key));return out;
    }
    @SuppressWarnings("unchecked")
    private static void restore(SharedPreferences prefs,String[] keys,Map<String,Object> originals){
        SharedPreferences.Editor editor=prefs.edit();
        for(String key:keys){Object value=originals.get(key);
            if(!originals.containsKey(key))editor.remove(key);
            else if(value instanceof String)editor.putString(key,(String)value);
            else if(value instanceof Boolean)editor.putBoolean(key,(Boolean)value);
            else if(value instanceof Integer)editor.putInt(key,(Integer)value);
            else if(value instanceof Long)editor.putLong(key,(Long)value);
            else if(value instanceof Float)editor.putFloat(key,(Float)value);
            else if(value instanceof Set)editor.putStringSet(key,(Set<String>)value);
            else throw new AssertionError("Unsupported existing fixture preference type");
        }
        require(editor.commit(),"Cannot commit fixture key cleanup");
    }
    private static boolean matches(SharedPreferences prefs,String key,Map<String,Object> originals){
        return originals.containsKey(key)?java.util.Objects.equals(prefs.getAll().get(key),originals.get(key)):!prefs.contains(key);
    }
    private static void testEvidencePolicy(JSONArray passed){
        String current="fixture-version";
        require("CURRENT_PROCESS_OBSERVATION".equals(DiagnosticEvidencePolicy.classify(true,current,current,5,5,123,true,1000,2000,1500)),"Current evidence misclassified");
        require("HISTORICAL".equals(DiagnosticEvidencePolicy.classify(true,"old",current,5,5,123,true,1000,2000,1500)),"Old version is current");
        require("HISTORICAL".equals(DiagnosticEvidencePolicy.classify(true,current,current,4,5,123,true,1000,2000,1500)),"Old boot is current");
        require("HISTORICAL".equals(DiagnosticEvidencePolicy.classify(true,current,current,5,5,123,false,1000,2000,1500)),"Dead process is current");
        require("LEGACY_OR_UNVERIFIED".equals(DiagnosticEvidencePolicy.classify(false,current,current,5,5,123,true,1000,2000,1500)),"Mismatched value is current");
        require("OLDER_OBSERVATION".equals(DiagnosticEvidencePolicy.classify(true,current,current,5,5,123,true,1000,61001,1500)),"Old event age ignored");
        require("HISTORICAL".equals(DiagnosticEvidencePolicy.classify(true,current,current,5,5,123,true,3000,2000,1500)),"Future observed timestamp accepted");
        passed.put("evidence-policy-version-boot-process-hash-age-and-future-time");
    }
    private static Bundle metadata(String version){
        Bundle out=new Bundle();out.putString("moduleVersion",version);
        out.putString("process",android.app.Application.getProcessName());
        out.putLong("observedAt",System.currentTimeMillis());out.putLong("observedElapsed",SystemClock.elapsedRealtime());return out;
    }
    private static void accepted(Context context,String key,String value,Bundle extras){
        require(ProviderDiagnostics.record(context,Process.myUid(),Process.myPid(),key,value,extras)==ProviderDiagnostics.Result.ACCEPTED,
                "Provider rejected fixture key: "+key);
    }
    private static void testPreferenceEvidence(Context context,SharedPreferences diagnostics,SharedPreferences evidence,
            String[] keys,JSONArray passed,JSONObject report)throws Exception{
        require(RuntimeEnvironment.bootCount(context)>=0,"Boot count unavailable for current-evidence test");
        Map<Integer,String> live=Collections.singletonMap(Process.myPid(),android.app.Application.getProcessName());
        Bundle extras=metadata(BuildConfig.VERSION_NAME);accepted(context,keys[0],"fixture-current",extras);
        require("fixture-current".equals(diagnostics.getString(keys[0],"")),"Diagnostic string reader compatibility lost");
        JSONObject current=DiagnosticEvidenceStore.describe(context,keys[0],"fixture-current",live);
        require("CURRENT_PROCESS_OBSERVATION".equals(current.optString("evidenceStatus")),"New actual preference evidence not current: "+current);
        require(current.optInt("pid")==Process.myPid()&&current.optInt("sourceUid")==Process.myUid(),"Caller ownership not saved");
        require(current.optLong("observedAt")==extras.getLong("observedAt")&&current.optLong("receivedAt")>=extras.getLong("observedAt"),"Observed/receipt times not saved");
        require(!current.has("valueDigest"),"Internal value digest exposed by describe");
        require("LEGACY_OR_UNVERIFIED".equals(DiagnosticEvidenceStore.describe(context,keys[0],"different-value",live).optString("evidenceStatus")),"Metadata incorrectly binds a changed value");
        require("HISTORICAL".equals(DiagnosticEvidenceStore.describe(context,keys[0],"fixture-current",Collections.emptyMap()).optString("evidenceStatus")),"Missing owner incorrectly current");
        report.put("currentEvidence",current);passed.put("actual-provider-preferences-current-owner-and-value-binding");
        accepted(context,keys[1],"same-value",metadata(BuildConfig.VERSION_NAME));
        String before=evidence.getString(keys[1],"");accepted(context,keys[1],"same-value",metadata(BuildConfig.VERSION_NAME+"-fixture-old"));
        require("same-value".equals(diagnostics.getString(keys[1],"")),"Same-value publication mutated string");
        require(!before.equals(evidence.getString(keys[1],"")),"Same-value publication failed to refresh metadata");
        require("HISTORICAL".equals(DiagnosticEvidenceStore.describe(context,keys[1],"same-value",live).optString("evidenceStatus")),"Previous-version evidence treated current");
        passed.put("same-value-publication-updates-version-metadata");
        accepted(context,keys[2],"no-source-metadata",null);
        require("LEGACY_OR_UNVERIFIED".equals(DiagnosticEvidenceStore.describe(context,keys[2],"no-source-metadata",live).optString("evidenceStatus")),"Unknown source claimed current");
        accepted(context,keys[3],"line\nbreak\rvalue",metadata(BuildConfig.VERSION_NAME));
        require("line break value".equals(diagnostics.getString(keys[3],"")),"Diagnostic normalization changed");
        require("CURRENT_PROCESS_OBSERVATION".equals(DiagnosticEvidenceStore.describe(context,keys[3],"line break value",live).optString("evidenceStatus")),"Digest bound before normalization");
        require(ProviderDiagnostics.record(context,Process.myUid(),keys[4],"invalid")==ProviderDiagnostics.Result.INVALID,"Invalid diagnostic key accepted");
        require(!diagnostics.contains(keys[4])&&!evidence.contains(keys[4]),"Invalid request wrote preferences");
        passed.put("legacy-source-normalized-digest-and-invalid-request-storage");
    }
    private static AutomationDiagnosticState.Update update(long sequence,String bridge,String error,String history,String runtime,String request,String transport){
        return new AutomationDiagnosticState.Update("123:1000",sequence,10000+sequence,bridge,error,history,
                history.isEmpty()?0:10001,runtime,request,transport);
    }
    private static void testAutomation(JSONArray passed){
        AutomationDiagnosticState.State state=new AutomationDiagnosticState.State();
        require(state.apply(update(1,"FAILED","Unknown authority","Unknown authority","unknown","",""),5),"Bridge failure not accepted");
        require("CONFIG_BRIDGE".equals(state.errorSource()),"Bridge error source lost");
        require(state.apply(update(2,"READY","","Unknown authority","disabled","",""),5),"Bridge recovery not accepted");
        require(state.error().isEmpty()&&"disabled".equals(state.runtime)&&!state.lastBridgeError.isEmpty(),"Recovered disabled state retained active bridge error or erased history");
        require(state.reserve("123:1100",11000),"Execution request not reserved");state.complete("123:1100",false,"execution-failed",11001);
        require(state.apply(update(3,"READY","","Unknown authority","disabled","",""),5),"Ready-disabled update rejected");
        require("EXECUTION_RESULT".equals(state.errorSource())&&"execution-failed".equals(state.error()),"Config recovery erased execution failure");
        require(state.reserve("123:1200",12000),"Second request not reserved");
        require(state.errorAt()==11001&&state.executionAt==12000,"New attempt changed the previous execution failure timestamp");
        require(AutomationDiagnosticState.State.read(state.values()).executionErrorAt==11001,"Execution failure time did not survive reload");
        state.uncertain("123:1200","reply-lost",12001);
        AutomationDiagnosticState.State restored=AutomationDiagnosticState.State.read(state.values());
        require("UNKNOWN".equals(restored.outcomeFor("123:1200"))&&!restored.reserve("123:1200",12002),"Unknown request replayed after reload");
        require("123:1200".equals(restored.pendingRequestForEpoch("123:1200")),"Unknown request epoch lost on reload");
        require(!restored.reserve("123:1201","123:1200",12003),"Unknown epoch replayed using a new attempt ID");
        require(restored.reserve("123:1300",13000),"Third request not reserved");restored.complete("123:1300",true,"completed",13001);
        require(restored.apply(update(4,"READY","","Unknown authority","unknown","123:1300","late-reply-lost"),5),"Late publication not accepted");
        require("SUCCEEDED".equals(restored.outcomeFor("123:1300"))&&restored.error().isEmpty()
                &&"handled".equals(restored.runtime),"Late transport error overwrote confirmed success");
        require(restored.executionErrorAt==0,"Confirmed success retained current execution failure time");
        require(!restored.reserve("123:1301","123:1300",13002),"Successful screen epoch allowed a new attempt ID");
        require("completed".equals(AutomationDiagnosticState.State.read(restored.values()).successForEpoch("123:1300")),"Successful screen epoch lost on reload");
        require(!restored.apply(update(3,"FAILED","old-failure","old-failure","unknown","",""),5),"Old callback sequence accepted");
        passed.put("automation-bridge-recovery-keeps-execution-failure-and-deduplicates-unknown");
        passed.put("automation-late-transport-cannot-overwrite-success-and-old-sequence-rejected");
        passed.put("automation-execution-failure-time-and-successful-screen-epoch-survive-reload");

        Map<String,Object> legacy=new LinkedHashMap<>();legacy.put(AutomationDiagnosticState.LAST_ERROR,"old-event-error");
        AutomationDiagnosticState.State old=AutomationDiagnosticState.State.read(legacy);
        old.apply(update(1,"READY","","","disabled","",""),5);
        require("LEGACY_UNKNOWN".equals(old.errorSource()),"Unknown old error provenance was invented or erased");
        old.reserve("123:2000",20000);old.complete("123:2000",true,"done",20001);
        require(old.error().isEmpty()&&!old.legacyUnknown.isEmpty(),"Legacy history erased on confirmed recovery");
        AutomationDiagnosticState.State capacity=new AutomationDiagnosticState.State();
        for(int i=1;i<=16;i++)require(capacity.reserve("123:"+i,30000+i),"Bounded unknown request reservation failed");
        require(!capacity.reserve("123:17",30017),"Unknown reservation evicted to permit a new operation");
        capacity.complete("123:16",true,"done",30018);
        require(capacity.reserve("123:17",30019),"Confirmed terminal reservation was not compactable");
        require(!capacity.reserve("123:16",30020),"Compacted old owner request replayed");
        require(!AutomationDiagnosticState.State.read(capacity.values()).reserve("123:17",30021),"Request deduplication lost on reload");
        Map<String,String> malformed=capacity.values();malformed.put("ls_augment_automation_request_ledger","bad-base64!");
        require(!AutomationDiagnosticState.State.read(malformed).reserve("123:18",30022),"Corrupt ledger did not fail closed");
        passed.put("automation-legacy-origin-bounded-unknown-ledger-and-corruption-fail-closed");

        AutomationDiagnosticState.State sessions=new AutomationDiagnosticState.State();sessions.apply(update(10,"READY","","","disabled","",""),5);
        require(!sessions.apply(new AutomationDiagnosticState.Update("124:999",11,40000,"READY","","",0,"disabled","",""),5),"Older process publication accepted");
        require(sessions.apply(new AutomationDiagnosticState.Update("124:1001",1,40001,"READY","","",0,"disabled","",""),5),"New process sequence rejected");
        require(sessions.apply(new AutomationDiagnosticState.Update("125:1",1,40002,"READY","","",0,"disabled","",""),6),"New boot monotonic origin rejected");
        require(AutomationDiagnosticState.Update.parse(update(1,"READY","","","disabled","","").encode())!=null,"Owner publication round trip failed");
        require(AutomationDiagnosticState.Update.parse(update(1,"READY","contradiction","","disabled","","").encode())==null,"Contradictory ready publication accepted");
        require(AutomationDiagnosticState.Update.parse("ADU1|bad")==null,"Incomplete publication accepted");
        require(AutomationDiagnosticState.Update.parse(new AutomationDiagnosticState.Update("123:1000",1,1,"FAILED","错".repeat(140),"错".repeat(140),1,"unknown","123:3","错".repeat(140)).encode())!=null,"Bounded multilingual publication truncated");
        passed.put("automation-process-boot-ordering-and-publication-envelope-boundaries");
    }
}
