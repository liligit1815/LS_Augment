package ls.augment.com;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Instrumentation;
import android.app.BroadcastOptions;
import android.app.KeyguardManager;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.PowerManager;
import android.os.SystemClock;
import android.provider.Settings;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only: real SeaWave gestures, pixel comparisons, and per-case configuration rollback. */
final class BackGestureCustomizationDeviceCases {
    private static final String LAUNCHER="com.zte.mifavor.launcher", ASSIST="com.zte.floatassist";
    private static final int PIXEL_THRESHOLD=24;
    private static final String POST_CANCEL_OBSERVATION_POLICY="native-terminal-before-window-v1";
    private final Context context;
    private final UiAutomation automation;
    private final AppConfig config;
    private final File directory;
    private final String phase;
    private final Set<String> selectedCases=new LinkedHashSet<>();
    private final JSONObject report=new JSONObject();
    private final JSONArray cases=new JSONArray(),actions=new JSONArray(),screens=new JSONArray(),acknowledgements=new JSONArray(),restorations=new JSONArray(),idleChecks=new JSONArray();
    private int width,height,failed,skipped,passed;
    private int runtimePid;
    private long runtimeProcessStart=-1,lastExpectedAt;
    private ConfigSnapshot lastExpected;
    private String[] hashes;
    private final boolean traceDiagnostic;
    private final String traceRunId;
    private JSONObject traceGate;
    private long traceReadyElapsed;
    private int traceDownClaims;

    private BackGestureCustomizationDeviceCases(Instrumentation test,Bundle args)throws Exception {
        context=test.getTargetContext();
        automation=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
        config=new AppConfig(context);phase=args.getString("phase","all");
        require("all".equals(phase)||"state".equals(phase)||"geometry".equals(phase),"phase must be all, state, or geometry");
        require(!args.containsKey("holdMillis"),"holdMillis is retired; sample targets are DOWN+180/295 ms, at least 120 ms after the last actual MOVE completion, with a 350 ms hard CANCEL");
        String filter=args.getString("case","");
        if(!filter.trim().isEmpty())for(String name:filter.split(",")){name=name.trim();require(knownCase(name),"Unknown case filter: "+name);selectedCases.add(name);}
        String label=args.getString("label","back-gesture-customization");
        require(label.matches("[A-Za-z0-9_.-]+"),"Invalid evidence label");
        String traceMode=args.getString("traceProbe","");
        traceDiagnostic=!traceMode.isEmpty();traceRunId=args.getString("traceRunId","");
        require(!traceDiagnostic||"right-custom-baseline".equals(traceMode),"Unknown trace diagnostic mode");
        require(traceDiagnostic||traceRunId.isEmpty(),"traceRunId requires explicit diagnostic mode");
        require(!traceDiagnostic||(traceRunId.matches("[a-f0-9]{32}")&&selectedCases.isEmpty()
                &&label.equals("gesture-trace-"+traceRunId)),"Diagnostic needs unique bound label/runId and no case suite");
        directory=new File(context.getExternalFilesDir(null),"back-gesture-tests/"+label);
        require(directory.isDirectory()||directory.mkdirs(),"Evidence directory unavailable");
        require(!traceDiagnostic||(!new File(directory,"trace-ready.json").exists()&&!new File(directory,"trace-gate.json").exists()),"Trace handshake already exists; never replay a run");
        report.put("phase",phase).put("caseFilter",new JSONArray(selectedCases))
                .put("testInputCadence",BackGestureProbeTimeline.INPUT_CADENCE)
                .put("postCancelObservationPolicy",POST_CANCEL_OBSERVATION_POLICY)
                .put("firstSampleTargetMillis",BackGestureProbeTimeline.FIRST_SAMPLE_MILLIS)
                .put("minimumStationaryBeforeFirstMillis",BackGestureProbeTimeline.MIN_STATIONARY_MILLIS)
                .put("moveStepMillis",BackGestureProbeTimeline.MOVE_STEP_MILLIS)
                .put("secondSampleTargetMillis",BackGestureProbeTimeline.SECOND_SAMPLE_MILLIS)
                .put("secondCaptureBudgetMillis",BackGestureProbeTimeline.SECOND_CAPTURE_BUDGET_MILLIS)
                .put("cancelReserveMillis",BackGestureProbeTimeline.CANCEL_RESERVE_MILLIS)
                .put("stableSampleGapMillis",BackGestureProbeTimeline.SAMPLE_GAP_MILLIS).put("evidence",directory.getAbsolutePath()).put("cases",cases)
                .put("idleStablePairsRequired",2).put("idleMaxChangedFraction",.005).put("idleChecks",idleChecks)
                .put("actions",actions).put("screenshots",screens).put("runtimeAcknowledgements",acknowledgements).put("restorations",restorations)
                .put("installedTestBuild",BuildConfig.VERSION_CODE).put("installedTestVersion",BuildConfig.VERSION_NAME)
                .put("cancelDeadlineMillis",BackGestureProbeTimeline.DEADLINE_MILLIS)
                .put("inputAcceptanceMeaning","Asynchronous injection returning true only means queued; a valid short timeline plus two stable, visible screenshots is required for pixel comparisons")
                .put("pixelComparison","Each gesture is compared with an adjacent idle screenshot; comparisons use the RGB change caused by the gesture in its physical edge region")
                .put("scope","Normal left/right gestures with bundled static artwork; this does not certify picker UI, cropping, GIF/WebP decoding, or long-swipe hover");
        if(traceDiagnostic)report.put("diagnosticOnly",true).put("traceRunId",traceRunId)
                .put("traceProbe",traceMode).put("plannedGestureCount",1).put("wholeFeaturePassed",false);
    }

    static JSONObject run(Instrumentation test,Bundle args)throws Exception {
        return new BackGestureCustomizationDeviceCases(test,args).run();
    }

    private JSONObject run()throws Exception {
        long started=SystemClock.uptimeMillis();
        PowerManager power=context.getSystemService(PowerManager.class);
        KeyguardManager keyguard=context.getSystemService(KeyguardManager.class);
        require(power!=null&&power.isInteractive()&&keyguard!=null&&!keyguard.isKeyguardLocked(),"Wake and unlock before gesture verification");
        int feedback=Settings.System.getInt(context.getContentResolver(),"gesture_visual_feedback",0);
        report.put("oemGestureVisualFeedback",feedback).put("diagnosticsBefore",diagnostics());
        if(feedback!=0)return skipAll("OEM gesture feedback is disabled (gesture_visual_feedback must be 0); no native setting was changed");
        JSONObject diagnostic=diagnostics();
        if(!diagnostic.getString("adapter").contains("installed=true")||!diagnostic.getString("adapter").contains("wave=true"))
            return skipAll("SeaWave icon/background adapter is not installed; normal native side gestures must be available before running this suite");
        AccessibilityServiceInfo oldInfo=automation.getServiceInfo();int oldFlags=oldInfo==null?0:oldInfo.flags;
        Map<String,String> original=snapshot();report.put("before",new JSONObject(original));persist();
        Throwable failure=null;
        try {
            AccessibilityServiceInfo info=automation.getServiceInfo();
            if(info!=null){info.flags|=AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;automation.setServiceInfo(info);}
            home();requireLauncher();
            Bitmap display=automation.takeScreenshot();require(display!=null,"Display size unavailable");
            width=display.getWidth();height=display.getHeight();display.recycle();
            if(height<=width)return skipAll("Run portrait verification; native orientation was not changed");
            report.put("displayWidth",width).put("displayHeight",height);
            hashes=traceDiagnostic?existingTraceAssets():BackGesturePresets.importMiku(context);
            report.put("presetAssets",new JSONArray(hashes)).put("assetCleanup",traceDiagnostic?
                    "Existing exact-hash preset files reused without writes or deletion":"Bundled preset assets are retained; no user asset is deleted");persist();
            if(traceDiagnostic)singleRightTrace();
            else {
            if(!"geometry".equals(phase)) {
                Map<String,String> stock=fixture(false,false),left=fixture(true,false);
                pair("left-custom-right-stock",stock,left,true,false);
                pair("right-custom-left-unchanged",left,fixture(true,true),false,true);
            }
            if(!"state".equals(phase)) {
                Map<String,String> base=fixture(true,true),next=new LinkedHashMap<>(base);
                sideValue(next,"scale_percent","350","110");pair("independent-icon-scale",base,next,true,true);
                next=new LinkedHashMap<>(base);sideValue(next,"background_scale_percent","160","70");
                pair("independent-background-scale",base,next,true,true);
                next=new LinkedHashMap<>(base);sideValue(next,"opacity_percent","25","45");
                pair("independent-icon-opacity",base,next,true,true);
                next=new LinkedHashMap<>(base);sideValue(next,"inset_dp","48","32");
                pair("physical-inward-offset",base,next,true,true);
                next=new LinkedHashMap<>(base);sideValue(next,"offset_y_dp","-42","36");
                pair("independent-vertical-offset",base,next,true,true);
                next=new LinkedHashMap<>(base);sideValue(next,"mirror","1","0");
                pair("independent-icon-mirror",base,next,true,true);
            }
            if(!"geometry".equals(phase))cycle();
            }
        } catch(Throwable error){failure=error;report.put("error",error.toString());}
        finally {
            try {
                restore(original);report.put("configurationRestored",true).put("restoredKeyCount",original.size());
            }catch(Throwable cleanup){report.put("configurationRestored",false).put("restoreError",cleanup.toString());if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            if(oldInfo!=null){oldInfo.flags=oldFlags;automation.setServiceInfo(oldInfo);}
            report.put("passedCount",passed).put("failedCount",failed).put("skippedCount",skipped)
                    .put("durationMillis",SystemClock.uptimeMillis()-started).put("diagnosticsAfter",diagnostics());persist();
        }
        if(failure!=null)throw new AssertionError("Gesture customization suite failed; evidence at "+directory,failure);
        require(failed==0,"Gesture pixel/configuration checks failed; inspect "+new File(directory,"evidence.json"));
        report.put("passed",!traceDiagnostic&&skipped==0).put("visualReviewRequired",true);
        if(traceDiagnostic)report.put("traceDownClaims",traceDownClaims).put("diagnosticCompleted",screens.length()==1);
        persist();return report;
    }

    /** Exactly one diagnostic sample; no comparison, left warm-up, or retry. */
    private void singleRightTrace()throws Exception {
        Map<String,String> baseline=snapshot();JSONObject item=new JSONObject().put("name","trace-right-custom-baseline");
        cases.put(item);persist();
        try {
            Map<String,String> values=fixture(true,true);item.put("parameters",new JSONObject(values));
            apply(values);gesture("trace-right-custom-baseline",1);
            item.put("status","diagnostic-observed");
        }catch(UnsafeInputState error){throw error;}
        catch(Inconclusive error){item.put("status","skipped").put("reason",error.getMessage());skipped++;}
        finally {restore(baseline);item.put("configurationRestored",true).put("restoredKeyCount",baseline.size());persist();}
    }

    private String[] existingTraceAssets()throws Exception {
        String[] existing={"11b8f83aea744f2b9811ad62146ec93a57ba69305d48357d45a6b6c8d81b19d8","d64d63c9425a3d6b0e0fb0ef1d88ddf607f6452a4c94591de65d45ca58d34589"};
        for(String hash:existing){
            File file=LauncherIconStore.file(context,hash);
            if(!file.isFile()||file.length()>2097152)throw new Inconclusive("Existing trace preset unavailable; no import attempted");
            byte[] bytes=java.security.MessageDigest.getInstance("SHA-256").digest(Files.readAllBytes(file.toPath()));
            StringBuilder actual=new StringBuilder();for(byte b:bytes)actual.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
            if(!hash.equals(actual.toString()))throw new Inconclusive("Existing trace preset content changed; preserve it");
        }
        return existing;
    }

    private JSONObject skipAll(String reason)throws Exception {
        report.put("skipped",true).put("reason",reason).put("configurationRestored",true);persist();return report;
    }

    private Map<String,String> snapshot() {
        Map<String,String> values=new LinkedHashMap<>();
        for(String key:BackGestureIconPolicy.parameterKeys())values.put(key,config.get(key));
        values.put(BackGestureIconPolicy.ENABLED,config.get(BackGestureIconPolicy.ENABLED));
        values.put(ConfigSchema.SYSTEMUI_MASTER,config.get(ConfigSchema.SYSTEMUI_MASTER));
        require(values.size()==20,"Expected twenty gesture/master keys");return values;
    }

    private Map<String,String> fixture(boolean left,boolean right) {
        Map<String,String> values=new LinkedHashMap<>();
        for(int side=0;side<2;side++) {
            boolean custom=side==0?left:right;
            if(custom)values.putAll(BackGesturePresets.values(side,hashes));
            else for(String field:BackGestureIconPolicy.FIELDS) {
                String key=BackGestureIconPolicy.key(side,field);values.put(key,ConfigSchema.defaultValue(key));
            }
        }
        values.put(BackGestureIconPolicy.ENABLED,"1");values.put(ConfigSchema.SYSTEMUI_MASTER,"1");return values;
    }

    private static void sideValue(Map<String,String> values,String field,String left,String right) {
        values.put(BackGestureIconPolicy.key(0,field),left);values.put(BackGestureIconPolicy.key(1,field),right);
    }

    private void apply(Map<String,String> values)throws Exception {
        long savedAt=SystemClock.elapsedRealtime();
        require(config.save(values).success,"Cannot save gesture test configuration");
        verifyValues(values);
        awaitArtwork(values,savedAt);
    }

    private void verifyValues(Map<String,String> values) {
        for(Map.Entry<String,String> entry:values.entrySet())require(entry.getValue().equals(config.get(entry.getKey())),"Saved value differs: "+entry.getKey());
    }

    private void awaitArtwork(Map<String,String> values,long savedAt)throws Exception {
        ConfigSnapshot expected=config.configSnapshot();
        String fingerprint=BackGestureRuntimeObservation.signature(values::get);
        require(fingerprint.equals(BackGestureRuntimeObservation.signature(expected::get)),"Gesture configuration changed before runtime acknowledgement");
        JSONObject record=new JSONObject().put("revision",expected.revision).put("signature",fingerprint)
                .put("snapshotChecksum",expected.checksum).put("saveStartedElapsed",savedAt)
                .put("requiredMask",BackGestureRuntimeObservation.requiredMask(expected::get));acknowledgements.put(record);
        long deadline=SystemClock.elapsedRealtime()+8000;String raw="";
        do {
            raw=config.diagnostic(BackGestureRuntimeObservation.KEY);
            BackGestureRuntimeObservation ack=BackGestureRuntimeObservation.parse(raw);
            long now=SystemClock.elapsedRealtime();
            if(ack!=null&&ack.confirms(expected.revision,expected::get,BuildConfig.VERSION_CODE,runtimePid,runtimeProcessStart,savedAt,now)) {
                if(config.configSnapshot().revision!=expected.revision)throw new Inconclusive("Configuration changed while waiting for SystemUI");
                runtimePid=ack.pid;runtimeProcessStart=ack.processStarted;lastExpected=expected;lastExpectedAt=savedAt;
                record.put("confirmed",true).put("raw",raw).put("observedElapsed",now);persist();return;
            }
            SystemClock.sleep(80);
        }while(SystemClock.elapsedRealtime()<deadline);
        record.put("confirmed",false).put("raw",raw).put("observedElapsed",SystemClock.elapsedRealtime());persist();
        throw new Inconclusive("Current-build SystemUI readiness was not observed for revision "+expected.revision+"; legacy ready text is not an acknowledgement");
    }

    private void restore(Map<String,String> values)throws Exception {
        long savedAt=SystemClock.elapsedRealtime();
        require(config.save(values).success,"Cannot restore baseline gesture configuration");
        for(Map.Entry<String,String> entry:values.entrySet())require(entry.getValue().equals(config.get(entry.getKey())),"Baseline not restored: "+entry.getKey());
        JSONObject restored=new JSONObject().put("valuesRestored",true).put("keyCount",values.size());restorations.put(restored);
        try{awaitArtwork(values,savedAt);restored.put("runtimeConfirmed",true);}
        catch(Inconclusive unavailable){restored.put("runtimeConfirmed",false).put("runtimeReason",unavailable.getMessage());}
    }

    private void pair(String name,Map<String,String> first,Map<String,String> second,boolean leftChanged,boolean rightChanged)throws Exception {
        if(!selectedCases.isEmpty()&&!selectedCases.contains(name))return;
        Map<String,String> baseline=snapshot();JSONObject item=new JSONObject().put("name",name)
                .put("first",new JSONObject(first)).put("second",new JSONObject(second));cases.put(item);persist();
        try {
            apply(first);Shot[] a=shots(name+"-a");
            apply(second);Shot[] b=shots(name+"-b");
            JSONArray comparisons=new JSONArray();item.put("comparisons",comparisons);
            compare(a[0],b[0],leftChanged,comparisons);compare(a[1],b[1],rightChanged,comparisons);
            if("independent-icon-scale".equals(name)){
                // With this preset, the character extends past the unchanged wave. A missing
                // enlarged icon also changes pixels, so require the actual inward extent to grow.
                boolean larger=b[0].bounds.right>a[0].bounds.right+12;
                boolean smaller=b[1].bounds.left>a[1].bounds.left+8;
                item.put("scaleDirection",new JSONObject().put("leftInwardExtentGrew",larger).put("rightInwardExtentShrank",smaller)
                        .put("leftBefore",a[0].bounds.flattenToString()).put("leftAfter",b[0].bounds.flattenToString())
                        .put("rightBefore",a[1].bounds.flattenToString()).put("rightAfter",b[1].bounds.flattenToString()));
                require(larger&&smaller,"Icon scale pixels changed without the expected growth/shrink direction; a missing icon must not pass");
            }
            item.put("status","pass");passed++;
        }catch(UnsafeInputState error){throw error;}
        catch(Inconclusive error){item.put("status","skipped").put("reason",error.getMessage());skipped++;}
        catch(Throwable error){item.put("status","fail").put("error",error.toString());failed++;}
        finally {restore(baseline);item.put("configurationRestored",true).put("restoredKeyCount",baseline.size());persist();}
    }

    private void cycle()throws Exception {
        String name="disable-reenable-preserves-parameters";Map<String,String> baseline=snapshot();
        if(!selectedCases.isEmpty()&&!selectedCases.contains(name))return;
        JSONObject item=new JSONObject().put("name",name);cases.put(item);persist();
        try {
            apply(fixture(false,false));Shot[] stock=shots(name+"-stock");
            Map<String,String> enabled=fixture(true,true);sideValue(enabled,"scale_percent","280","160");
            sideValue(enabled,"opacity_percent","70","80");sideValue(enabled,"inset_dp","24","18");
            item.put("enabled",new JSONObject(enabled));apply(enabled);Shot[] on=shots(name+"-on");
            Map<String,String> off=new LinkedHashMap<>(enabled);off.put(BackGestureIconPolicy.ENABLED,"0");
            toggle(false,off);Shot[] disabled=shots(name+"-off");
            JSONArray comparisons=new JSONArray();item.put("comparisons",comparisons);
            compare(on[0],disabled[0],true,comparisons);compare(on[1],disabled[1],true,comparisons);
            compare(stock[0],disabled[0],false,comparisons);compare(stock[1],disabled[1],false,comparisons);
            // All eighteen side values must survive the off/on cycle, and re-enabling must reproduce pixels.
            toggle(true,enabled);Shot[] again=shots(name+"-again");
            compare(on[0],again[0],false,comparisons);compare(on[1],again[1],false,comparisons);
            item.put("parametersPreserved",true).put("status","pass");passed++;
        }catch(UnsafeInputState error){throw error;}
        catch(Inconclusive error){item.put("status","skipped").put("reason",error.getMessage());skipped++;}
        catch(Throwable error){item.put("status","fail").put("error",error.toString());failed++;}
        finally {restore(baseline);item.put("configurationRestored",true).put("restoredKeyCount",baseline.size());persist();}
    }

    private void toggle(boolean enabled,Map<String,String> expected)throws Exception {
        Map<String,String> change=new LinkedHashMap<>();change.put(BackGestureIconPolicy.ENABLED,enabled?"1":"0");
        long savedAt=SystemClock.elapsedRealtime();
        require(config.save(change).success,"Cannot toggle gesture customization");
        verifyValues(expected);awaitArtwork(expected,savedAt);
    }

    private Shot[] shots(String name)throws Exception {return new Shot[]{gesture(name+"-left",0),gesture(name+"-right",1)};}

    private Shot gesture(String name,int side)throws Exception {
        prepareLauncher();
        BackGestureRuntimeObservation ack=BackGestureRuntimeObservation.parse(config.diagnostic(BackGestureRuntimeObservation.KEY));
        if(lastExpected==null||config.configSnapshot().revision!=lastExpected.revision||ack==null
                ||!ack.confirms(lastExpected.revision,lastExpected::get,BuildConfig.VERSION_CODE,runtimePid,runtimeProcessStart,lastExpectedAt,SystemClock.elapsedRealtime()))
            throw new Inconclusive("Runtime configuration changed before "+name);
        Bitmap idle=stableIdle(name,side);
        Bitmap active=null,later=null;
        float start=side==0?1:width-2,y=height*.55f,destination=side==0?width*.20f:width*.80f;
        BackGestureProbeTimeline input=new BackGestureProbeTimeline(SystemClock::uptimeMillis,SystemClock::sleep,this::inject,start,destination,y);
        long firstStart=0,firstEnd=0,secondStart=0,secondEnd=0;
        JSONObject sample=new JSONObject().put("name",name).put("side",BackGestureIconPolicy.SIDES[side])
                .put("runtimeAck",ack.serialize()).put("runtimeRevision",lastExpected.revision);
        String probeNonce=java.util.UUID.randomUUID().toString().replace("-","");
        try {
            armProbe(probeNonce,side,start,y,ack);
            if(traceDiagnostic)prepareTraceDown(probeNonce,side,ack,sample);
            try {
                // From DOWN until CANCEL: no JSON creation, file writes, diagnostics, or window-tree calls.
                // The independent watchdog runs while a screenshot or injection Binder call is stalled.
                input.begin();
                if(input.movesCompleted==0||input.cancelling.get())throw new Inconclusive("Short movement did not complete in "+name);
                if(!input.awaitFirstSample())throw new Inconclusive("First animation-settled sample did not fit the short window in "+name);
                firstStart=SystemClock.uptimeMillis();
                active=automation.takeScreenshot();require(active!=null,"Gesture screenshot unavailable");
                firstEnd=SystemClock.uptimeMillis();
                if(input.cancelling.get())throw new Inconclusive("First screenshot exceeded the short-gesture window in "+name);
                if(!input.awaitSecondSample(firstEnd))throw new Inconclusive("No second screenshot budget remains before hard CANCEL in "+name);
                secondStart=SystemClock.uptimeMillis();
                later=automation.takeScreenshot();require(later!=null,"Second gesture screenshot unavailable");
                secondEnd=SystemClock.uptimeMillis();
                // Separate screenshot completion from CANCEL by a measurable clock tick; never extend the deadline.
                SystemClock.sleep(3);
            } finally {
                boolean safelyCancelled=input.finish();
                sample.put("sampleStartedElapsedMillis",firstStart==0?JSONObject.NULL:firstStart-input.down)
                        .put("movementCompletedElapsedMillis",input.movesCompleted==0?JSONObject.NULL:input.movesCompleted-input.down)
                        .put("stationaryBeforeFirstMillis",firstStart==0||input.movesCompleted==0?JSONObject.NULL:firstStart-input.movesCompleted)
                        .put("sampleCompletedElapsedMillis",firstEnd==0?JSONObject.NULL:firstEnd-input.down)
                        .put("stableSampleStartedElapsedMillis",secondStart==0?JSONObject.NULL:secondStart-input.down)
                        .put("stableSampleCompletedElapsedMillis",secondEnd==0?JSONObject.NULL:secondEnd-input.down)
                        .put("cancelCompleted",safelyCancelled);
                synchronized(input.events){for(BackGestureProbeTimeline.Event event:input.events)
                    actions.put(new JSONObject().put("gesture",name).put("action",event.action).put("x",event.x).put("y",event.y)
                            .put("downTime",event.down).put("eventTime",event.time).put("returnedTime",event.returned)
                            .put("accepted",event.accepted).put("error",event.error==null?JSONObject.NULL:event.error.toString()));}
                String timing=input.invalidReason(firstStart,firstEnd,secondStart,secondEnd);
                sample.put("shortTimelineObserved",timing==null).put("timingReason",timing==null?JSONObject.NULL:timing);
                if(!safelyCancelled) {
                    screens.put(sample);persist();
                    throw new UnsafeInputState("CANCEL failed or remained in flight; no further gesture/HOME actions may run");
                }
                JSONObject nativeProbe;
                try {
                    nativeProbe=observeNativeCancelThenRecover(probeNonce,side,input.down,ack,firstStart,sample);
                } finally {
                    JSONObject terminal=sample.optJSONObject("nativeProbe");
                    if(traceDiagnostic&&terminal!=null&&terminal.optBoolean("terminalConfirmed",false))
                        traceAnchor("terminal",probeNonce,sample);
                    // Preserve acquired pixels even when the terminal is absent or recovery fails.
                    // This never takes another screenshot or queries a window while cancellation is unknown.
                    screens.put(sample);
                    try {if(active!=null)writePng(active,name+".png");
                        if(later!=null)writePng(later,name+"-stable.png");writePng(idle,name+"-idle.png");}
                    finally {persist();}
                }
                boolean unchanged=sample.optBoolean("configurationStayedCurrent",false);
                boolean hover=sample.optBoolean("shortcutVisibleAfterCancel",false);
                if(!unchanged)throw new Inconclusive("Configuration changed during "+name+"; these pixels cannot be assigned to the requested parameters");
                if(hover)throw new Inconclusive("Native shortcut hover appeared in "+name+"; CANCEL/HOME recovery completed");
                if(timing!=null)throw new Inconclusive(timing+" in "+name);
                if(!nativeProbe.optBoolean("matched",false))throw new Inconclusive("Native receive/draw trace unavailable or unmatched in "+name);
                if(!nativeProbe.optBoolean("diagnosticComplete",false))throw new Inconclusive("Native receive/draw trace overflowed or could not read this ROM in "+name);
                if(!nativeProbe.optBoolean("nativeCancelWithinDeadline",false))
                    throw new Inconclusive(nativeProbe.optString("nativeCancelTimingReason","Actual native CANCEL completion unavailable")+" in "+name);
                if(!nativeProbe.optBoolean("nativeStationaryBeforeFirst",false))
                    throw new Inconclusive("Actual native MOVE receipt did not leave 120 ms before the first sample in "+name);
            }
            Rect region=new Rect(side==0?0:Math.round(width*.55f),Math.round(height*.27f),side==0?Math.round(width*.45f):width,Math.round(height*.83f));
            Shot early=new Shot(name+"-early",side,region,idle,active);
            Shot shot=new Shot(name,side,region,idle,later);sample.put("measurement",shot.measurement());
            int changed=0;for(int pixel=0;pixel<shot.active.length;pixel++)if(distance(early.active[pixel],shot.active[pixel])>PIXEL_THRESHOLD)changed++;
            double unstable=changed/(double)Math.max(1,Math.max(early.foreground,shot.foreground));
            sample.put("stableSampleChangedPixels",changed).put("stableSampleChangedFraction",unstable).put("stable",unstable<=.05);
            if(unstable>.05)throw new Inconclusive("Gesture was still animating across the two stationary samples of "+name+"; foreground difference="+unstable);
            if(shot.foreground<16)throw new Inconclusive("No measurable native/custom gesture appeared in "+name+"; check active navigation mode and SeaWave feedback");
            persist();SystemClock.sleep(160);return shot;
        } finally {sample.put("nativeProbeDisarmSent",disarmProbe(probeNonce));idle.recycle();if(active!=null)active.recycle();if(later!=null)later.recycle();}
    }

    private void armProbe(String nonce,int side,float x,float y,BackGestureRuntimeObservation ack)throws Exception {
        Intent intent=new Intent(BackGestureProbeTrace.ACTION).setPackage("com.android.systemui")
                .putExtra("command","arm").putExtra("nonce",nonce).putExtra("side",side).putExtra("startX",x).putExtra("startY",y)
                .putExtra("pid",ack.pid).putExtra("build",ack.build).putExtra("processStarted",ack.processStarted)
                .putExtra("revision",ack.revision).putExtra("generation",ack.generation);
        try{context.sendBroadcast(intent,null,BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());}
        catch(RuntimeException|LinkageError unavailable){throw new Inconclusive("Authenticated probe broadcast unavailable: "+unavailable.getClass().getSimpleName());}
        long until=SystemClock.uptimeMillis()+3000;
        while(SystemClock.uptimeMillis()<until){
            JSONObject value=probeJson(BackGestureProbeTrace.KEY+"_arm");
            if(probeIdentity(value,nonce,side,0,ack)&&"armed".equals(value.optString("phase"))
                    &&value.optLong("expiresAt")-SystemClock.uptimeMillis()>1000)return;
            SystemClock.sleep(60);
        }
        throw new Inconclusive("Temporary native gesture observation could not be armed with authenticated sender identity");
    }
    private boolean disarmProbe(String nonce){
        try{context.sendBroadcast(new Intent(BackGestureProbeTrace.ACTION).setPackage("com.android.systemui")
                .putExtra("command","disarm").putExtra("nonce",nonce),null,
                BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());return true;
        }catch(RuntimeException|LinkageError unavailable){return false;}
    }

    private void prepareTraceDown(String nonce,int side,BackGestureRuntimeObservation ack,JSONObject sample)throws Exception {
        if(side!=1||traceDownClaims!=0)throw new Inconclusive("Trace diagnostic permits exactly one right DOWN");
        traceReadyElapsed=SystemClock.elapsedRealtime();
        JSONObject ready=new JSONObject().put("schema",1).put("runId",traceRunId).put("nonce",nonce).put("side",side)
                .put("runtimeAck",ack.serialize()).put("readyElapsed",traceReadyElapsed)
                .put("readyUptime",SystemClock.uptimeMillis()).put("width",width).put("height",height);
        report.put("traceHandshake",ready);writeTraceJson("trace-ready.json",ready);persist();
        long until=traceReadyElapsed+8000;
        File file=new File(directory,"trace-gate.json");
        while(!file.isFile()&&SystemClock.elapsedRealtime()<until)SystemClock.sleep(40);
        if(!file.isFile())throw new Inconclusive("Trace host did not acknowledge this ready nonce within 8 seconds");
        traceGate=new JSONObject(new String(Files.readAllBytes(file.toPath()),StandardCharsets.UTF_8));
        if(!validTraceGate(traceGate,traceRunId,nonce,ack.serialize(),traceReadyElapsed,SystemClock.elapsedRealtime()))
            throw new Inconclusive("Trace gate identity, startup confirmation, freshness or remaining window is invalid");
        // No finger is down. Reject a changed foreground/configuration rather than issuing a warm-up.
        requireLauncher();if(shortcutVisible())throw new Inconclusive("Shortcut window appeared while waiting for trace");
        BackGestureRuntimeObservation current=BackGestureRuntimeObservation.parse(config.diagnostic(BackGestureRuntimeObservation.KEY));
        if(lastExpected==null||config.configSnapshot().revision!=lastExpected.revision||current==null
                ||!current.confirms(lastExpected.revision,lastExpected::get,BuildConfig.VERSION_CODE,runtimePid,runtimeProcessStart,lastExpectedAt,SystemClock.elapsedRealtime())
                ||!current.serialize().equals(ack.serialize()))throw new Inconclusive("Current configuration ACK changed before trace DOWN");
        sample.put("traceRunId",traceRunId).put("traceGate",traceGate);
        traceAnchor("before-down",nonce,sample);
        // Last gate is memory-only, immediately before input.begin(); never re-arm/retry on failure.
        if(!validTraceGate(traceGate,traceRunId,nonce,ack.serialize(),traceReadyElapsed,SystemClock.elapsedRealtime()))
            throw new Inconclusive("Trace window expired during final pre-DOWN checks");
        traceDownClaims++;
    }

    private static boolean validTraceGate(JSONObject gate,String runId,String nonce,String ack,long ready,long now) {
        if(gate==null)return false;
        long start=gate.optLong("traceStartBeforeElapsed",-1),started=gate.optLong("traceStartedAckElapsed",-1);
        long issued=gate.optLong("issuedElapsed",-1),expires=gate.optLong("expiresElapsed",-1);
        return gate.optInt("schema",-1)==1&&runId.equals(gate.optString("runId"))&&nonce.equals(gate.optString("nonce"))
                &&ack.equals(gate.optString("runtimeAck"))&&gate.optLong("readyElapsed",-1)==ready
                &&gate.optInt("side",-1)==1&&gate.optBoolean("dataSourcesStarted",false)
                &&gate.optInt("tracePid",-1)>0&&gate.optString("traceStartTicks").matches("[0-9]+")
                &&gate.optString("sessionName").equals("lsa_gesture_"+runId)
                &&start>=ready&&started>=start&&issued>=started&&issued<=now
                &&now-ready<=8000&&now-issued<=3000&&expires==start+20000&&expires-now>=6000;
    }

    private void traceAnchor(String stage,String nonce,JSONObject sample)throws Exception {
        long before=SystemClock.uptimeMillis();
        android.os.Trace.beginSection("LSA-gesture:"+stage+":"+traceRunId+":"+nonce);android.os.Trace.endSection();
        long after=SystemClock.uptimeMillis();
        sample.put("traceAnchor_"+stage,new JSONObject().put("uptimeBefore",before).put("uptimeAfter",after)
                .put("elapsedAfter",SystemClock.elapsedRealtime()).put("nonce",nonce));
    }

    private void writeTraceJson(String name,JSONObject value)throws Exception {
        File target=new File(directory,name),temporary=new File(directory,name+".tmp");
        try(FileOutputStream stream=new FileOutputStream(temporary)){stream.write(value.toString().getBytes(StandardCharsets.UTF_8));stream.getFD().sync();}
        if(target.exists()||!temporary.renameTo(target))throw new Inconclusive("Cannot publish unique trace handshake");
    }

    /** Injection acceptance is not native completion. No window/HOME call precedes a matched terminal. */
    private JSONObject observeNativeCancelThenRecover(String nonce,int side,long down,BackGestureRuntimeObservation ack,
            long firstStart,JSONObject sample)throws Exception {
        sample.put("postCancelObservationPolicy",POST_CANCEL_OBSERVATION_POLICY)
                .put("launcherRecoveryAttempted",false).put("nativeTerminalBeforeUi",false);
        JSONObject nativeProbe;
        try{nativeProbe=collectProbe(nonce,side,down,ack,firstStart);}
        catch(Exception error){
            sample.put("nativeProbeError",error.toString());
            throw new UnsafeInputState("Native CANCEL terminal could not be read; no window/HOME or further gesture is allowed",error);
        }
        sample.put("nativeProbe",nativeProbe);
        if(!nativeProbe.optBoolean("terminalConfirmed",false))
            throw new UnsafeInputState("Matching native CANCEL terminal not observed; no window/HOME or further gesture is allowed");
        sample.put("nativeTerminalBeforeUi",true).put("windowObservationStartedUptime",SystemClock.uptimeMillis());
        boolean hover=shortcutVisible();sample.put("shortcutVisibleAfterCancel",hover);
        // A known late terminal permits cleanup, but the unchanged native deadline still rejects its pixels.
        sample.put("launcherRecoveryAttempted",true);
        try{prepareLauncher();sample.put("launcherRecovered",true);}
        catch(Exception error){sample.put("launcherRecovered",false).put("recoveryError",error.toString());throw error;}
        sample.put("configurationStayedCurrent",config.configSnapshot().revision==lastExpected.revision);
        return nativeProbe;
    }

    private static boolean confirmedNativeTerminal(JSONObject head,String nonce,int side,long down,
            BackGestureRuntimeObservation ack,long now) {
        return probeIdentity(head,nonce,side,down,ack)&&head.optInt("part",-1)==0
                &&"cancelled".equals(head.optString("phase"))&&down>0
                &&head.optLong("cancelReceived")>=down&&head.optLong("cancelReturned")>=head.optLong("cancelReceived")
                &&head.optLong("cancelReturned")<=now;
    }
    private JSONObject collectProbe(String nonce,int side,long down,BackGestureRuntimeObservation ack,long firstStart)throws Exception {
        JSONObject result=new JSONObject().put("matched",false).put("terminalConfirmed",false)
                .put("expectedNonce",nonce).put("expectedDownTime",down);
        long until=SystemClock.uptimeMillis()+3500;
        while(SystemClock.uptimeMillis()<until){
            JSONObject head=probeJson(BackGestureProbeTrace.KEY);
            // Local preferences only; do not parse old parts or invoke UI APIs while native input is unconfirmed.
            if(!confirmedNativeTerminal(head,nonce,side,down,ack,SystemClock.uptimeMillis())){
                SystemClock.sleep(60);continue;
            }
            if(!result.optBoolean("terminalConfirmed",false))result.put("terminalObservedUptime",SystemClock.uptimeMillis());
            result.put("terminalConfirmed",true).put("head",head);
            long last=Math.max(head.optLong("lastMoveReceived"),head.optLong("lastWaveMoveReturned"));
            long received=head.optLong("cancelReceived"),returned=head.optLong("cancelReturned");
            String cancelReason=BackGestureProbeTimeline.nativeCancelReason(down,received,returned);
            result.put("nativeCancelReceivedElapsedMillis",received-down).put("nativeCancelReturnedElapsedMillis",returned-down)
                    .put("nativeCancelWithinDeadline",cancelReason==null).put("nativeCancelTimingReason",cancelReason==null?JSONObject.NULL:cancelReason)
                    .put("nativeStationaryMillis",last>0&&firstStart>0?firstStart-last:JSONObject.NULL)
                    .put("nativeStationaryBeforeFirst",last>0&&firstStart-last>=BackGestureProbeTimeline.MIN_STATIONARY_MILLIS);
            JSONArray parts=new JSONArray();boolean matched=true;
            for(int part=1;part<=BackGestureProbeTrace.PARTS;part++){
                JSONObject value=probeJson(BackGestureProbeTrace.KEY+"_"+part);parts.put(value==null?JSONObject.NULL:value);
                matched&=probeIdentity(value,nonce,side,down,ack)&&"cancelled".equals(value.optString("phase"))&&value.optInt("part",-1)==part;
            }
            result.put("parts",parts);
            if(matched){return result.put("matched",true)
                        .put("diagnosticComplete",head.optInt("overflow",1)==0&&head.optInt("errors",1)==0);
            }
            SystemClock.sleep(60);
        }
        return result.put("status",result.optBoolean("terminalConfirmed",false)?"native_cancel_parts_not_observed":"native_cancel_terminal_not_observed");
    }
    private JSONObject probeJson(String key){try{return new JSONObject(config.diagnostic(key));}catch(Exception ignored){return null;}}
    private static boolean probeIdentity(JSONObject value,String nonce,int side,long down,BackGestureRuntimeObservation ack){
        return value!=null&&value.optInt("schema")==1&&nonce.equals(value.optString("nonce"))
                &&value.optInt("pid")==ack.pid&&value.optInt("build")==ack.build&&value.optInt("side",-1)==side
                &&value.optLong("processStarted",-1)==ack.processStarted&&value.optLong("revision",-1)==ack.revision
                &&value.optLong("generation",-1)==ack.generation&&value.optLong("downTime",-1)==down;
    }

    /** No finger is down here. Preserve a measured idle baseline, not merely a HOME delay. */
    private Bitmap stableIdle(String name,int side)throws Exception {
        JSONObject item=new JSONObject().put("name",name).put("accepted",false);
        JSONArray samples=new JSONArray();item.put("samples",samples);idleChecks.put(item);
        Rect region=new Rect(side==0?0:Math.round(width*.55f),Math.round(height*.27f),side==0?Math.round(width*.45f):width,Math.round(height*.83f));
        Bitmap previous=automation.takeScreenshot();require(previous!=null,"Idle screenshot unavailable");
        BackGestureProbeTimeline.IdleWindow idleWindow=new BackGestureProbeTimeline.IdleWindow();
        long deadline=SystemClock.uptimeMillis()+2000;
        try {
            for(int attempt=0;attempt<6&&SystemClock.uptimeMillis()<deadline;attempt++) {
                SystemClock.sleep(100);Bitmap next=automation.takeScreenshot();require(next!=null,"Idle confirmation screenshot unavailable");
                Shot difference;
                try {difference=new Shot(name+"-idle-check",side,region,previous,next);}
                catch(Throwable error){next.recycle();throw error;}
                boolean stable=BackGestureProbeTimeline.stableIdle(difference.foreground,difference.active.length);
                boolean accepted=idleWindow.observe(difference.foreground,difference.active.length);
                samples.put(new JSONObject().put("elapsed",SystemClock.uptimeMillis()).put("changedPixels",difference.foreground)
                        .put("area",difference.active.length).put("stable",stable).put("consecutive",idleWindow.consecutive));
                if(accepted) {
                    try {writePng(previous,name+"-idle-check.png");previous.recycle();previous=null;
                        item.put("accepted",true);persist();return next;
                    }catch(Throwable error){next.recycle();throw error;}
                }
                previous.recycle();previous=next;
            }
            writePng(previous,name+"-idle-unstable.png");persist();
            throw new Inconclusive("Launcher idle pixels did not stabilize in two adjacent pairs before "+name);
        } finally {if(previous!=null)previous.recycle();}
    }

    private void compare(Shot first,Shot second,boolean shouldChange,JSONArray comparisons)throws Exception {
        require(first.side==second.side&&first.region.equals(second.region),"Mismatched gesture sample region");
        int changed=0,backgroundChanged=0;long absoluteChange=0;
        for(int pixel=0;pixel<first.active.length;pixel++) {
            int a=first.active[pixel],b=second.active[pixel],ia=first.idle[pixel],ib=second.idle[pixel];
            int red=Math.abs((Color.red(a)-Color.red(ia))-(Color.red(b)-Color.red(ib)));
            int green=Math.abs((Color.green(a)-Color.green(ia))-(Color.green(b)-Color.green(ib)));
            int blue=Math.abs((Color.blue(a)-Color.blue(ia))-(Color.blue(b)-Color.blue(ib)));
            int distance=Math.max(red,Math.max(green,blue));if(distance>PIXEL_THRESHOLD)changed++;
            absoluteChange+=red+green+blue;
            if(distance(ia,ib)>PIXEL_THRESHOLD)backgroundChanged++;
        }
        int area=Math.max(first.foreground,second.foreground);
        double ratio=changed/(double)Math.max(1,area),noise=backgroundChanged/(double)first.active.length;
        JSONObject comparison=new JSONObject().put("first",first.name).put("second",second.name)
                .put("expectedPixelsChanged",shouldChange).put("changedForegroundPixels",changed)
                .put("firstForegroundPixels",first.foreground).put("secondForegroundPixels",second.foreground)
                .put("changedFractionOfForeground",ratio).put("idleBackgroundChangedFraction",noise)
                .put("absoluteRgbDelta",absoluteChange);
        comparisons.put(comparison);persist();
        // A moving wallpaper can make image equivalence unknowable; report it explicitly instead of passing.
        if(noise>.05)throw new Inconclusive("Launcher background changed over 5% between "+first.name+" and "+second.name);
        boolean matched=shouldChange?changed>=Math.max(24,area*.025):ratio<=.20;
        comparison.put("passed",matched);persist();
        require(matched,(shouldChange?"Expected visible change":"Expected unchanged/restored pixels")+" between "+first.name+" and "+second.name+"; changed="+changed+", foregroundRatio="+ratio);
    }

    private static final class Shot {
        final String name;final int side;final Rect region;final int[] idle,active;final int foreground;final Rect bounds;
        Shot(String name,int side,Rect region,Bitmap before,Bitmap during) {
            this.name=name;this.side=side;this.region=region;
            int width=region.width(),height=region.height();idle=new int[width*height];active=new int[idle.length];
            before.getPixels(idle,0,width,region.left,region.top,width,height);during.getPixels(active,0,width,region.left,region.top,width,height);
            int count=0,left=width,top=height,right=0,bottom=0;
            for(int i=0;i<active.length;i++)if(distance(active[i],idle[i])>PIXEL_THRESHOLD) {
                count++;int x=i%width,y=i/width;left=Math.min(left,x);top=Math.min(top,y);right=Math.max(right,x+1);bottom=Math.max(bottom,y+1);
            }
            foreground=count;bounds=count==0?new Rect():new Rect(region.left+left,region.top+top,region.left+right,region.top+bottom);
        }
        JSONObject measurement()throws Exception {return new JSONObject().put("region",region.flattenToString()).put("foregroundPixels",foreground).put("foregroundBounds",bounds.flattenToString());}
    }

    private static int distance(int a,int b) {return Math.max(Math.abs(Color.red(a)-Color.red(b)),Math.max(Math.abs(Color.green(a)-Color.green(b)),Math.abs(Color.blue(a)-Color.blue(b))));}
    private static final class Inconclusive extends Exception {Inconclusive(String message){super(message);}}
    private static final class UnsafeInputState extends Exception {
        UnsafeInputState(String message){super(message);}
        UnsafeInputState(String message,Throwable cause){super(message,cause);}
    }
    private static boolean knownCase(String name){return java.util.Arrays.asList("left-custom-right-stock","right-custom-left-unchanged",
            "independent-icon-scale","independent-background-scale","independent-icon-opacity","physical-inward-offset",
            "independent-vertical-offset","independent-icon-mirror","disable-reenable-preserves-parameters").contains(name);}

    private boolean inject(long down,long time,int action,float x,float y) {
        MotionEvent event=MotionEvent.obtain(down,time,action,x,y,0);event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{return automation.injectInputEvent(event,false);}finally{event.recycle();}
    }

    private void home()throws Exception {
        actions.put(new JSONObject().put("action","HOME").put("at",SystemClock.uptimeMillis()));persist();
        require(automation.performGlobalAction(AccessibilityService.GLOBAL_ACTION_HOME),"Cannot return to launcher");SystemClock.sleep(500);
    }

    private void requireLauncher() {
        require(isLauncher(),"Only the confirmed system launcher may receive the side gesture");
    }

    private boolean isLauncher() {
        AccessibilityNodeInfo root=automation.getRootInActiveWindow();
        try{return root!=null&&LAUNCHER.contentEquals(root.getPackageName()==null?"":root.getPackageName());}
        finally{if(root!=null)root.recycle();}
    }

    private void prepareLauncher()throws UnsafeInputState {
        try {
            home();long deadline=SystemClock.uptimeMillis()+2500;
            do {
                if(isLauncher()&&!shortcutVisible())return;
                SystemClock.sleep(80);
            }while(SystemClock.uptimeMillis()<deadline);
            throw new UnsafeInputState("HOME did not restore the confirmed launcher without a shortcut window; stopping instead of cascading case failures");
        }catch(UnsafeInputState error){throw error;}
        catch(Throwable error){throw new UnsafeInputState("Launcher recovery could not be verified; stopping the suite",error);}
    }

    private boolean shortcutVisible() {
        for(AccessibilityWindowInfo window:automation.getWindows()) {
            AccessibilityNodeInfo root=window.getRoot();if(root==null)continue;
            try{if(ASSIST.contentEquals(root.getPackageName()==null?"":root.getPackageName())&&root.isVisibleToUser())return true;}
            finally{root.recycle();}
        }
        return false;
    }

    private JSONObject diagnostics()throws Exception {
        JSONObject result=new JSONObject();for(String suffix:new String[]{"adapter","resources","error","left","right","runtime_v1"})result.put(suffix,config.diagnostic("ls_augment_back_icon_"+suffix));return result;
    }
    private void writePng(Bitmap bitmap,String name)throws Exception {
        try(FileOutputStream out=new FileOutputStream(new File(directory,name))){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot write failed: "+name);}
    }
    private void persist()throws Exception {Files.write(new File(directory,"evidence.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));}
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
