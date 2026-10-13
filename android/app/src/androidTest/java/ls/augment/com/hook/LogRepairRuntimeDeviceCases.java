package ls.augment.com.hook;

import android.content.Context;
import android.os.ParcelFileDescriptor;
import ls.augment.com.BuildConfig;
import ls.augment.com.ComboPrivateProviderFixture;
import ls.augment.com.DiagnosticEvidencePolicy;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.attribute.FileTime;
import java.util.Comparator;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only: real Android JSON and cache I/O against fixture-owned recordings. */
public final class LogRepairRuntimeDeviceCases {
    private LogRepairRuntimeDeviceCases(){ }
    private static final class Checks {
        int count;
        final java.util.List<ComboMotionFileScaler.Result> comboLeases=new java.util.ArrayList<>();
        void require(boolean value,String message){count++;if(!value)throw new AssertionError(message);}
    }
    public static void run(Context context,JSONObject report)throws Throwable{
        Checks checks=new Checks();JSONArray passed=new JSONArray();
        report.put("moduleVersion",BuildConfig.VERSION_NAME).put("passedCases",passed)
                .put("testOnly",true).put("actualGamePlaybackTested",false).put("physicalRapidFireTested",false);
        File cacheRoot=context.getCacheDir().getCanonicalFile();
        Path owned=Files.createTempDirectory(cacheRoot.toPath(),"log-repair-runtime-").toRealPath();
        checks.require(owned.getParent().equals(cacheRoot.toPath()),"Fixture directory escaped app cache root");
        ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread thread=new Thread(r,"LogRepairComboFixture");thread.setDaemon(true);return thread;});
        Throwable failure=null;
        try{
            aiScope(checks,passed);rapidDecision(checks,passed);snapshotPolicy(checks,passed);
            worker.submit(()->{
                try{combo(context,owned,report,checks,passed);}catch(Exception error){throw new RuntimeException(error);}
            }).get(10,TimeUnit.SECONDS);
        }catch(Throwable error){failure=error;}
        finally{
            int behaviorAssertions=checks.count;
            report.put("behaviorAssertions",behaviorAssertions);
            worker.shutdownNow();
            try{
                checks.require(worker.awaitTermination(5,TimeUnit.SECONDS),"Fixture worker did not stop before cleanup");
                for(ComboMotionFileScaler.Result result:checks.comboLeases)result.retire();
                // Walk does not follow symbolic links. Delete only this newly-created
                // directory and its descendants, never the application's cache root.
                checks.require(owned.getParent().equals(cacheRoot.toPath()),"Cleanup target escaped fixture parent");
                try(java.util.stream.Stream<Path> entries=Files.walk(owned)){
                    for(Path entry:entries.sorted(Comparator.reverseOrder()).toArray(Path[]::new)){
                        checks.require(entry.toAbsolutePath().normalize().startsWith(owned),"Cleanup entry outside owned directory");
                        Files.deleteIfExists(entry);
                    }
                }
                checks.require(!Files.exists(owned),"Fixture directory not removed");report.put("cleanupComplete",true);
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);
                report.put("cleanupComplete",false).put("cleanupError",cleanup.toString());}
            report.put("cleanupAssertions",checks.count-behaviorAssertions).put("assertions",checks.count).put("success",failure==null);
        }
        if(failure!=null)throw failure;
    }
    private static void aiScope(Checks checks,JSONArray passed){
        String[] packages={"com.zte.game.plugintrigger","cn.nubia.gameassist","cn.nubia.gamelab","com.android.systemui","",null};
        boolean[] scheduling={true,true,false,false,false,false},dispatch={true,false,false,false,false,false};
        for(int i=0;i<packages.length;i++){
            checks.require(AiHandlerScope.scheduling(packages[i])==scheduling[i],"AI scheduling scope: "+packages[i]);
            checks.require(AiHandlerScope.dispatch(packages[i])==dispatch[i],"AI dispatch scope: "+packages[i]);
        }
        passed.put("ai-handler-scheduling-and-dispatch-package-matrix");
    }
    private static void rapidDecision(Checks checks,JSONArray passed){
        boolean[][] inputs={{false,false,false,false,false},{true,false,true,false,false},{true,true,false,false,false},
                {true,true,true,false,false},{true,true,true,true,true},{true,true,true,true,false}};
        String[] tokens={"MISSING","MALFORMED","IDENTITY_NOT_READY","ENVIRONMENT_MISMATCH","VALID_CURRENT","VALID_LEGACY_EQUIVALENT"};
        for(int i=0;i<inputs.length;i++){
            boolean[] value=inputs[i];String status=RapidFireDecisionEvidence.tokenStatus(value[0],value[1],value[2],value[3],value[4]);
            checks.require(tokens[i].equals(status),"Rapid token classification: "+tokens[i]);
            if(i<4){
                String reason=RapidFireDecisionEvidence.disabledReason(true,true,status,false);
                String witness=RapidFireDecisionEvidence.describe(BuildConfig.VERSION_NAME,123,456,"PASSED",false,false,status,false,reason,
                        "installed|token=fixture-private-marker|sha256=fixture-hash");
                checks.require(witness.contains("|state=DISABLED|")&&witness.contains("|sessionState=PASSED|")
                        &&witness.contains("|effectiveEnabled=false|"),"Saved PASSED obscured invalid token decision");
                checks.require(!witness.contains("fixture-private-marker")&&!witness.contains("fixture-hash"),"Decision leaked native private fields");
            }
        }
        checks.require("GAME_MASTER_OFF".equals(RapidFireDecisionEvidence.disabledReason(false,true,"VALID_CURRENT",false)),"Rapid master-off reason");
        checks.require("FEATURE_OFF".equals(RapidFireDecisionEvidence.disabledReason(true,false,"VALID_CURRENT",false)),"Rapid feature-off reason");
        checks.require("FUSED".equals(RapidFireDecisionEvidence.disabledReason(true,true,"VALID_CURRENT",true)),"Rapid fused reason");
        String testing=RapidFireDecisionEvidence.describe(BuildConfig.VERSION_NAME,123,456,"WAIT_LEFT",true,true,"MISSING",false,"TEST_OBSERVING","installed");
        checks.require(testing.contains("|state=TESTING|")&&testing.contains("|effectiveEnabled=false|"),"Observation test confused with enabled feature");
        passed.put("rapid-stored-passed-invalid-token-and-testing-decision-witnesses");
    }
    private static void snapshotPolicy(Checks checks,JSONArray passed){
        String version=BuildConfig.VERSION_NAME;long nowWall=100000,nowElapsed=90000;
        checks.require(DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,123,true,true,5000,nowElapsed,99999,nowWall,8,8),"Valid process snapshot rejected");
        checks.require(!DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,123,true,true,5000,nowElapsed,99999,nowWall,7,8),"Same PID/version old boot treated current");
        for(long loaded:new long[]{0,-1,90001})checks.require(!DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,123,true,true,loaded,nowElapsed,99999,nowWall,8,8),"Invalid module load elapsed accepted");
        checks.require(!DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,123,true,true,5000,nowElapsed,100001,nowWall,8,8),"Future receipt treated current");
        checks.require(DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,123,true,true,5000,nowElapsed,40001,nowWall,8,8),"59999ms receipt incorrectly expired");
        checks.require(!DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,123,true,true,5000,nowElapsed,40000,nowWall,8,8),"60000ms receipt remained current");
        checks.require(!DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,123,true,false,5000,nowElapsed,99999,nowWall,8,8),"Unloaded module treated current");
        // A live receipt may arrive during collection; freshness uses the time
        // after reading the snapshot map, rather than collectionStarted.
        checks.require(DiagnosticEvidencePolicy.currentProcessSnapshot(version,version,123,true,true,5000,nowElapsed,99999,100001,8,8),"Receipt arriving during collection was rejected");
        passed.put("process-snapshot-boot-loaded-clock-and-receipt-age-boundaries");
    }
    private static JSONObject recording(long end)throws Exception{
        JSONArray events=new JSONArray()
                .put(new JSONObject().put("sampleEventTime",1000).put("downTime",1000).put("action",0).put("x",7).put("y",11))
                .put(new JSONObject().put("sampleEventTime",2000).put("downTime",1000).put("action",2).put("x",9).put("y",13))
                .put(new JSONObject().put("sampleEventTime",end).put("downTime",1000).put("action",1).put("x",9).put("y",13));
        return new JSONObject().put("name","fixture-macro").put("vendorMetadata",new JSONObject().put("tag","fixture-owned")).put("events",events);
    }
    private static void write(Path file,String text)throws Exception{Files.write(file,text.getBytes(StandardCharsets.UTF_8));}
    private static String read(Path file)throws Exception{return new String(Files.readAllBytes(file),StandardCharsets.UTF_8);}
    private static ComboMotionFileScaler.Result scale(ComboPrivateProviderFixture fixture,Path source,float rate,Checks checks){
        ComboMotionCache.Request request=ComboMotionCache.Request.capture(fixture.client(),source.toString(),rate,0);
        checks.require(request.valid,"Source request capture failed: "+request.error);
        ComboMotionFileScaler.Result result=ComboMotionFileScaler.scale(fixture.client(),request);
        checks.comboLeases.add(result);return result;
    }
    private static String readMotion(ComboMotionFileScaler.Result result)throws Exception {
        Object player=new Object();
        if(!ComboMotionFileScaler.pin(player,result))throw new AssertionError("Playback descriptor not pinnable");
        try {
            ParcelFileDescriptor fd=ComboMotionFileScaler.openNative(result.outputPath).getParcelable("fd");
            if(fd==null)throw new AssertionError("Native descriptor missing");
            try(ParcelFileDescriptor.AutoCloseInputStream input=new ParcelFileDescriptor.AutoCloseInputStream(fd)){
                if((android.system.Os.fcntlInt(fd.getFileDescriptor(),android.system.OsConstants.F_GETFL,0)
                        &android.system.OsConstants.O_ACCMODE)!=android.system.OsConstants.O_RDONLY)
                    throw new AssertionError("Playback descriptor is writable");
                return new String(input.readAllBytes(),StandardCharsets.UTF_8);
            }
        }finally{ComboMotionFileScaler.releasePlayback(player);}
    }
    private static void metrics(ComboMotionFileScaler.Result value,long sourceSpan,long outputSpan,String evidence,Checks checks){
        checks.require(value.success,"Combo transform failed: "+value.error);
        checks.require(value.eventCount==3&&value.sourceSpanMs==sourceSpan&&value.outputSpanMs==outputSpan,"Combo evidence metrics mismatched");
        checks.require(evidence.equals(value.evidenceSource),"Combo evidence source mismatch: "+value.evidenceSource);
    }
    private static void combo(Context context,Path owned,JSONObject report,Checks checks,JSONArray passed)throws Exception{
        Path source=owned.resolve("source.json"),cache=owned.resolve("isolated-cache");Files.createDirectory(cache);
        try(ComboPrivateProviderFixture fixture=new ComboPrivateProviderFixture(context,cache.toFile())){
        checks.require(fixture.rejectsUntrustedCaller(),"Module provider admitted unrelated or cross-user caller");
        String original=recording(3000).toString();write(source,original);
        ComboMotionFileScaler.Result first=scale(fixture,source,2,checks);metrics(first,2000,1000,"GENERATED",checks);
        checks.require(!first.cacheHit,"First source transform reported cache hit");Path output=fixture.privateOutput(first.cacheIdentity).toPath();
        checks.require(output.toAbsolutePath().normalize().startsWith(owned),"Combo output escaped isolated fixture cache");
        checks.require(ComboMotionFileScaler.isVirtualPath(first.outputPath)&&!new File(first.outputPath).exists(),"Host received a filesystem cache path");
        String bytes=readMotion(first);checks.require(bytes.equals(readMotion(first)),"Independent playback descriptors share a consumed offset");
        JSONObject transformed=new JSONObject(bytes);JSONArray events=transformed.getJSONArray("events");
        checks.require(events.getJSONObject(0).getLong("sampleEventTime")==1000&&events.getJSONObject(1).getLong("sampleEventTime")==1500
                &&events.getJSONObject(2).getLong("sampleEventTime")==2000,"2x motion timestamps not transformed once");
        checks.require(events.getJSONObject(2).getInt("action")==1&&events.getJSONObject(2).getInt("x")==9
                &&"fixture-owned".equals(transformed.getJSONObject("vendorMetadata").getString("tag")),"Release/coordinates/vendor metadata altered");
        checks.require(original.equals(read(source)),"Source recording modified by scale");
        passed.put("combo-android-json-atomic-generation-release-payload-and-span");
        ComboMotionFileScaler.Result disk=scale(fixture,source,2,checks);metrics(disk,2000,1000,"DISK_CACHE_VERIFIED",checks);
        checks.require(disk.cacheHit&&bytes.equals(read(output)),"Valid disk cache rewritten or double-scaled");
        ComboMotionFileScaler.Result memory=disk.asPublishedHit();metrics(memory,2000,1000,"MEMORY_CACHE",checks);
        checks.require(memory.cacheHit&&memory.cacheIdentity.equals(first.cacheIdentity),"Published memory hit lost identity");
        ComboMotionCache coordinator=new ComboMotionCache();ComboMotionFileScaler.Result prepared=coordinator
                .prepareAsync(fixture.client(),source.toString(),2).get(5,TimeUnit.SECONDS);
        checks.comboLeases.add(prepared);
        metrics(prepared,2000,1000,"DISK_CACHE_VERIFIED",checks);
        metrics(coordinator.lookupPublished(source.toString(),2),2000,1000,"MEMORY_CACHE",checks);
        passed.put("combo-disk-verification-published-memory-evidence-and-real-cache-worker");
        JSONObject damaged=new JSONObject(bytes);damaged.getJSONArray("events").getJSONObject(2).put("sampleEventTime",1500);write(output,damaged.toString());
        ComboMotionFileScaler.Result repaired=scale(fixture,source,2,checks);metrics(repaired,2000,1000,"GENERATED",checks);
        checks.require(!repaired.cacheHit&&bytes.equals(read(output)),"Double-scaled cache not reconstructed from original source");
        damaged=new JSONObject(bytes);damaged.getJSONArray("events").getJSONObject(2).put("action",0);write(output,damaged.toString());
        repaired=scale(fixture,source,2,checks);metrics(repaired,2000,1000,"GENERATED",checks);
        checks.require(!repaired.cacheHit&&new JSONObject(read(output)).getJSONArray("events").getJSONObject(2).getInt("action")==1,"Corrupt release action retained");
        damaged=new JSONObject(bytes);damaged.getJSONObject("vendorMetadata").put("tag","corrupt");write(output,damaged.toString());
        repaired=scale(fixture,source,2,checks);metrics(repaired,2000,1000,"GENERATED",checks);
        checks.require(bytes.equals(read(output)),"Corrupt nested OEM metadata retained");
        write(output,"broken-json");repaired=scale(fixture,source,2,checks);metrics(repaired,2000,1000,"GENERATED",checks);
        checks.require(bytes.equals(read(output))&&original.equals(read(source)),"Malformed cache recovery corrupted source/output");
        passed.put("combo-double-scaled-release-metadata-and-malformed-cache-rebuild");
        long modified=Files.getLastModifiedTime(source).toMillis(),size=Files.size(source);
        String changed=recording(5000).toString();write(source,changed);Files.setLastModifiedTime(source,FileTime.fromMillis(modified));
        checks.require(Files.size(source)==size&&new File(source.toString()).lastModified()==modified,"Changed source fixture did not preserve size/mtime");
        ComboMotionFileScaler.Result fresh=scale(fixture,source,2,checks);metrics(fresh,4000,2000,"GENERATED",checks);
        checks.require(!fresh.cacheIdentity.equals(first.cacheIdentity),"Same-size/mtime content change reused source cache identity");
        for(int rate:new int[]{1,2,10}){
            ComboMotionFileScaler.Result result=scale(fixture,source,rate,checks);
            checks.require(result.success&&result.eventCount==3&&result.sourceSpanMs==4000&&result.outputSpanMs==4000/rate,"Span wrong at rate "+rate);
            JSONObject last=new JSONObject(readMotion(result)).getJSONArray("events").getJSONObject(2);
            checks.require(last.getInt("action")==1&&last.getLong("sampleEventTime")==1000+4000/rate,"Release timestamp wrong at rate "+rate);
        }
        checks.require(changed.equals(read(source)),"Rate transformations changed OEM source");
        passed.put("combo-source-content-identity-and-1x-2x-10x-time-spans");
        report.put("combo",new JSONObject().put("events",3).put("firstSourceSpanMs",2000).put("firstOutputSpanMs",1000)
                .put("changedSourceSpanMs",4000).put("testedRates",new JSONArray(new int[]{1,2,10}))
                .put("androidJson",true).put("actualFileIo",true).put("atomicPublication",true)
                .put("modulePrivateProvider",true).put("readOnlyPlaybackDescriptors",true).put("binderCallerAuthenticationTested",false));
        }
    }
}
