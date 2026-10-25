package ls.augment.com;

import android.content.Context;
import android.os.Build;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** A real, fresh, bounded collection. Missing evidence is never interpreted as success. */
final class DiagnosticExport {
    static String build(Context context){
        long start=System.currentTimeMillis();StringBuilder out=new StringBuilder();AppConfig config=new AppConfig(context);
        boolean ai=config.getBoolean(ConfigSchema.AI_TRIGGER_DIAGNOSTICS),shoulder=config.getBoolean(ConfigSchema.SHOULDER_DIAGNOSTICS);
        out.append("红魔Duo device diagnostic export v2\nmodule=").append(BuildConfig.VERSION_NAME)
            .append("\ninstallationId=").append(DiagnosticInstallIdentity.get(context))
            .append("\ncollectionStarted=").append(start).append("\ndevice=").append(Build.MANUFACTURER).append(' ').append(Build.MODEL)
            .append("\nandroid=").append(Build.VERSION.RELEASE).append(" SDK=").append(Build.VERSION.SDK_INT).append("\nROM=").append(Build.FINGERPRINT)
            .append("\ndetailedShoulder=").append(shoulder).append(" detailedAI=").append(ai).append("\n")
            .append("说明：REGISTERED 仅说明 Hook 注册完成；callbackCalls 是回调进入次数，callbackReturns 不是业务成功。真实生效须结合功能命中、执行结果和复现时段。没有记录表示 UNKNOWN / 未触发 / 数据已轮转，不能直接认定失败。\n")
            .append("callbackThrows 为传播异常总数；moduleCallbackThrows 是模块处理异常，proceedChainThrows 是继续调用链传回的异常。最后回调时间不等于错误发生时间，须查看 lastErrorAt 和来源。\n")
            .append("AI/肩键详细记录仅包含开启后的有界窗口；肩键快捷切换必要状态/错误、锁屏上滑及工作台 HOME/Quickstep/壁纸状态日志始终纳入采集。工作台 Hook 日志通过手机端异步队列保存，seq/session 属于各发出进程，模块版本/PID/启动时间用于区分历史记录；进程退出可能丢失尚未送达的队列，文件保留不代表画面首帧或业务成功。队列丢弃、重复事件抑制、文件轮转、旧版本与停止的进程都会明确标出；不采集账号凭据、原始肩键数据、自定义锁屏提示文字全文或壁纸内容。\n");
        RootShell.Result root=RootShell.run("id",null,5,4096);
        source(out,"ROOT",root,4096);
        source(out,"BACKLIGHT_INTERFACES read-only; capability evidence, not calibration",
                RootShell.run("for n in /sys/class/backlight/*; do [ -d \"$n\" ] || continue; echo node=$n; "
                    +"for f in max_brightness brightness actual_brightness bl_power; do if [ -r \"$n/$f\" ]; then echo field=$f; cat \"$n/$f\"; fi; done; done",null,5,16384),16384);
        source(out,"COLOR_DISPLAY live controller and matrix readback",RootShell.run("dumpsys color_display",null,5,49152),49152);
        source(out,"DISPLAY_BRIGHTNESS native state at export",RootShell.run("dumpsys display | grep -E 'BrightnessInfo|mScreenBrightness|mBrightness|mDisplayState|mReduceBright'",null,5,32768),32768);
        RootShell.Result processes=RootShell.run("ps -A -o PID,NAME",null,6,256*1024);
        source(out,"PROCESS_LIST",processes,256*1024);
        Map<Integer,String> live=processNames(processes);
        boolean lifecycleReceipt=RuntimeEnvironment.injected(context);
        String telemetryVersion=RuntimeEnvironment.telemetryVersion(context,systemPid(live));
        boolean currentTelemetry=BuildConfig.VERSION_NAME.equals(telemetryVersion);
        out.append("systemVersion=").append(new DeviceInfo(context).systemVersion).append('\n')
                .append("buildType=").append(BuildConfig.BUILD_TYPE).append('\n')
                .append("currentVersionInjection=").append(lifecycleReceipt||currentTelemetry?"VERIFIED_THIS_BOOT":"UNCONFIRMED").append('\n')
                .append("injectionEvidenceSource=").append(lifecycleReceipt?"LIFECYCLE_RECEIPT":currentTelemetry?"CURRENT_SYSTEM_PROCESS_TELEMETRY":"NO_CURRENT_PROOF").append('\n');
        out.append("\n===== ENABLED FEATURE SWITCHES (configuration, not proof of execution) =====\n");
        Map<String,String> values=config.snapshot();
        Set<String> labelled=new HashSet<>();
        for(EnhancementOption option:EnhancementCatalog.options())if(option.kind==EnhancementOption.Kind.BOOLEAN){
            labelled.add(option.key);if(ConfigSchema.truthy(values.get(option.key)))out.append(option.title).append(" | ").append(option.key).append("=1\n");
        }
        for(Map.Entry<String,String> item:values.entrySet())if(!labelled.contains(item.getKey())&&"1".equals(item.getValue()))
            out.append("enabled or numeric=1; see configuration: ").append(item.getKey()).append('\n');
        for(String pkg:HookTargetRegistry.packages()){
            if(pkg.equals("system"))continue;
            try{android.content.pm.PackageInfo info=context.getPackageManager().getPackageInfo(pkg,0);out.append("packageVersion ").append(pkg).append('=').append(info.versionName).append(" (").append(info.getLongVersionCode()).append(")\n");}
            catch(Exception e){out.append("packageVersion ").append(pkg).append("=NOT_INSTALLED_OR_NOT_VISIBLE\n");}
        }
        out.append("\n===== CONFIGURATION AT EXPORT =====\n");
        out.append(MigrationCompatibility.describe(context)).append('\n');
        for(Map.Entry<String,String> e:config.snapshot().entrySet())appendDiagnosticValue(out,e.getKey(),e.getValue());
        out.append("\n===== PER-PROCESS HOOK EVIDENCE =====\n");Set<String> observed=new HashSet<>();
        Map<String,?> snapshots=context.getSharedPreferences("hook-processes",0).getAll();
        long snapshotsWall=System.currentTimeMillis(),snapshotsElapsed=android.os.SystemClock.elapsedRealtime();
        int snapshotsBoot=RuntimeEnvironment.bootCount(context);
        if(snapshots.isEmpty())out.append("NOT_COLLECTED: 没有进程快照，请重启相关作用域并复现；也可能模块未加载或进程无法访问诊断接口。\n");
        for(Object value:snapshots.values())try{
            JSONObject snapshot=new JSONObject(value.toString());int pid=snapshot.getInt("pid");String name=snapshot.optString("process");
            boolean systemServer=name.equals("system")&&"system_server".equals(live.get(pid))&&snapshot.optInt("sourceUid")==1000;
            if(systemServer)snapshot.put("hostedPackage",snapshot.optString("package")).put("package","system");
            boolean current=DiagnosticEvidencePolicy.currentProcessSnapshot(snapshot.optString("moduleVersion"),
                BuildConfig.VERSION_NAME,pid,name.equals(live.get(pid))||systemServer,snapshot.optBoolean("moduleLoaded"),
                snapshot.optLong("moduleLoadedElapsed"),snapshotsElapsed,snapshot.optLong("receivedAt"),snapshotsWall,
                snapshot.optInt("receivedBoot",-1),snapshotsBoot);
            snapshot.put("currentEvidence",current).put("evidenceStatus",current?"CURRENT_PROCESS_SNAPSHOT":"STALE_OR_STOPPED_OR_UNVERIFIED");
            if(current)observed.addAll(currentPackages(snapshot));
            compactHooks(snapshot,current);
            out.append(snapshot.toString(2)).append('\n');
        }catch(Exception e){out.append("snapshot_parse_error=").append(e.getClass().getSimpleName()).append('\n');}
        for(String pkg:HookTargetRegistry.packages())if(!observed.contains(pkg))out.append(pkg).append(": current module/registration/hit/result = UNKNOWN (no current snapshot)\n");
        out.append("\n===== FEATURE LATEST VALUES (same keys replace previous values; may be stale) =====\n");
        Map<String,?> diagnostic=context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getAll();
        for(String key:new TreeSet<>(diagnostic.keySet()))appendDiagnosticValue(out,key,String.valueOf(diagnostic.get(key)));
        out.append("\n===== FEATURE VALUE ATTRIBUTION (older observations are not current results) =====\n");
        for(String key:new TreeSet<>(diagnostic.keySet())) {
            if(diagnosticValue(key,String.valueOf(diagnostic.get(key)))==null)continue;
            out.append(DiagnosticEvidenceStore.describe(context,key,String.valueOf(diagnostic.get(key)),live)).append('\n');
        }
        out.append("\n===== PRIVATE VERIFIED RUNTIME =====\n");
        for(Map.Entry<String,?> entry:RuntimeStateStore.values(context).entrySet())
            out.append(entry.getKey()).append('=').append(entry.getValue()).append('\n');
        out.append("frameworkConfiguration=").append(FrameworkConfigSync.isPublished(config.configSnapshot())?"SYNCED":"PENDING").append('\n');
        file(out,context,"BASIC","ls_augment.log",192*1024,"basic");
        file(out,context,"STARTUP_RUNTIME; session/sequence identify retries; retained history is not current execution proof",
                StartupDiagnostics.FILE,2*1024*1024,"startup");
        appendLiftArcLog(out,context);
        appendShoulderSwitchLog(out,context);
        appendAtomicWorkbenchLog(out,context);
        appendAppCrashLog(out,context);
        BootEvidenceCapture.appendForExport(out,context);
        // Cleanup failures need process death and graphics evidence even when AI /
        // shoulder detail switches are off. Read buffers without clearing them.
        source(out,"LAUNCHER_EXIT_INFO; historical entries must be matched to reproduction time",
                RootShell.run("dumpsys activity exit-info com.zte.mifavor.launcher",null,6,128*1024),128*1024);
        appendLauncherCrashHistory(out,context);
        source(out,"SYSTEMUI_EXIT_INFO; historical entries must be matched to reproduction time",
                RootShell.run("dumpsys activity exit-info com.android.systemui",null,6,128*1024),128*1024);
        source(out,"DUO_EXIT_INFO; app process only, not complete app_process Root death evidence; match reproduction time",
                RootShell.run("dumpsys activity exit-info ls.augment.com",null,6,128*1024),128*1024);
        appendLogcat(out,"CLEANUP_CRASH_GRAPHICS_LOGCAT",DiagnosticLogcat.cleanup(start,
                (command,timeout,limit)->RootShell.run(command,null,timeout,limit)),ai,shoulder);
        if(shoulder)file(out,context,"SHOULDER_DETAIL","detail-SHOULDER.log",512*1024,"SHOULDER");
        if(ai)file(out,context,"AI_DETAIL","detail-AI.log",512*1024,"AI");
        {
            appendLogcat(out,"LOGCAT module tags",DiagnosticLogcat.module(start,ai,shoulder,
                    (command,timeout,limit)->RootShell.run(command,null,timeout,limit)),ai,shoulder);
            appendFrameworkLogs(out,ai,shoulder);
        }
        out.append("\ncollectionFinished=").append(System.currentTimeMillis()).append("\n");return out.toString();
    }
    private static void appendFrameworkLogs(StringBuilder out,boolean ai,boolean shoulder) {
        RootShell.Result listing=RootShell.run("ls -1 /data/adb/lspd/log",null,5,8192);
        // Report capture proof without exporting the successful directory listing body.
        source(out,"LSPOSED_CURRENT_LOG_DIRECTORY",new RootShell.Result(listing.exitCode,
                listing.isSuccess()?"":listing.output,listing.timedOut,listing.capture),8192);
        if(!listing.isSuccess()||listing.capture==null||!listing.capture.reliable()) {
            out.append("LSPOSED: UNKNOWN; listed=UNKNOWN eligible=UNKNOWN attempted=0 rejected=UNKNOWN capSkipped=UNKNOWN readSuccess=0 readFailed=0 readUnknown=0; directory listing is not reliable; framework log is not collected\n");
            return;
        }
        int listed=0,eligible=0,attempted=0,rejected=0,capSkipped=0,readSuccess=0,readFailed=0,readUnknown=0;
        // Raw capture retains name boundaries that legacy Result.output.trim() removes.
        String names=listing.capture.text();
        for(String name:names.split("\\r?\\n")) {
            if(name.isEmpty())continue;
            listed++;
            if(name.equals(".")||name.equals("..")||!name.matches("[A-Za-z0-9_.:-]+")) {rejected++;continue;}
            eligible++;
            if(attempted>=6) {capSkipped++;continue;}
            attempted++;
            RootShell.Result log=RootShell.run("tail -c 524288 "+RootShell.quote("/data/adb/lspd/log/"+name),null,8,512*1024);
            if(!log.isSuccess())readFailed++;
            else if(log.capture==null||!log.capture.reliable())readUnknown++;
            else readSuccess++;
            filteredSource(out,"LSPOSED "+name+"; module and safety lines in latest 512 KiB; historical window may precede this reproduction",log,512*1024,ai,shoulder,true);
        }
        out.append("LSPOSED: ").append(names.isEmpty()?"NO_FILES":eligible==0?"NO_ELIGIBLE_FILES":"ATTEMPTED")
                .append("; listed=").append(listed).append(" eligible=").append(eligible)
                .append(" attempted=").append(attempted).append(" rejected=").append(rejected)
                .append(" capSkipped=").append(capSkipped).append(" readSuccess=").append(readSuccess)
                .append(" readFailed=").append(readFailed).append(" readUnknown=").append(readUnknown)
                .append("; readSuccess means reliable bounded capture, not matching content or complete history\n");
    }
    private static void appendAppCrashLog(StringBuilder out,Context context) {
        out.append(AppCrashDiagnostics.readForExport(context));
    }

    private static void appendLauncherCrashHistory(StringBuilder out,Context context) {
        try {
            int user = android.os.Process.myUid() / 100000;
            int uid = context.getPackageManager().getApplicationInfo(LauncherNativeCrashEvidence.PACKAGE,0).uid;
            if(uid / 100000 != user)throw new SecurityException("launcher user mismatch");
            String command = "CLASSPATH="+RootShell.quote(context.getApplicationInfo().sourceDir)
                    +" exec /system/bin/app_process /system/bin ls.augment.com.LauncherNativeCrashEvidence "+user+" "+uid;
            RootShell.Result raw=RootShell.run(command,null,8,16*1024);
            String safe=LauncherNativeCrashEvidence.sanitizeOutput(raw.output,user,uid);
            source(out,"LAUNCHER_NATIVE_CRASH_SUMMARIES; sanitized protocol only; ROM may self-kill after Java failure; retained history only",
                    new RootShell.Result(raw.exitCode,safe,raw.timedOut,raw.capture),16*1024);
        } catch(Exception error) {
            out.append("\n===== SOURCE LAUNCHER_NATIVE_CRASH_SUMMARIES =====\nstatus=UNAVAILABLE;error=")
                    .append(error.getClass().getSimpleName()).append('\n');
        }
    }
    static Map<Integer,String> processNames(RootShell.Result processes){
        Map<Integer,String> live=new HashMap<>();
        if(processes.isSuccess())for(String line:processes.output.split("\\r?\\n")){
            String[] fields=line.trim().split("\\s+",2);
            if(fields.length!=2)continue;
            try{int pid=Integer.parseInt(fields[0]);if(pid>0)live.put(pid,fields[1]);}catch(NumberFormatException ignored){}
        }
        return live;
    }
    static String systemPid(Map<Integer,String> live){
        for(Map.Entry<Integer,String> entry:live.entrySet())if("system_server".equals(entry.getValue()))return String.valueOf(entry.getKey());
        return "";
    }
    static Set<String> currentPackages(JSONObject snapshot){
        Set<String> packages=new LinkedHashSet<>();
        for(String legacy:new String[]{snapshot.optString("package"),snapshot.optString("process")})
            if(HookTargetRegistry.contains(legacy))packages.add(legacy);
        JSONArray targets=snapshot.optJSONArray("packages");
        if(targets!=null)for(int i=0;i<targets.length();i++){
            String target=targets.optString(i);if(HookTargetRegistry.contains(target))packages.add(target);
        }
        return packages;
    }
    /** Old successful registration lists add noise; retain their identity and all failures. */
    static void compactHooks(JSONObject snapshot,boolean current)throws JSONException {
        if(!snapshot.has("detailDelivery"))snapshot.put("detailDeliveryEvidence",snapshot.optLong("droppedDetailEvents")>0
                ?"LOSS_REPORTED_REASON_UNAVAILABLE":"LEGACY_TOTAL_ONLY");
        JSONArray hooks=snapshot.optJSONArray("hooks");if(hooks==null)return;
        JSONArray kept=new JSONArray();int omitted=0;
        for(int i=0;i<hooks.length();i++){
            JSONObject hook=hooks.getJSONObject(i);
            boolean failed=!"REGISTERED".equals(hook.optString("registration"))
                    ||hook.optLong("callbackThrows")>0||!hook.optString("lastError").isEmpty();
            if(!current&&!failed){omitted++;continue;}
            hook.remove("businessResult");
            if(hook.optString("lastError").isEmpty())hook.remove("lastError");
            if(hook.optString("lastErrorStack").isEmpty())hook.remove("lastErrorStack");
            kept.put(hook);
        }
        snapshot.put("hooks",kept).put("omittedHistoricalSuccessfulHooks",omitted);
    }
    private static RootShell.Result filter(RootShell.Result source,boolean ai,boolean shoulder,boolean moduleOnly){StringBuilder out=new StringBuilder();
        if(!source.isSuccess())return source;
        String input=moduleOnly?FrameworkDiagnosticFilter.retain(source.output):source.output;
        for(String line:input.split("\\r?\\n")){
            if(line.contains("DUO_STARTUP")||line.contains("DuoStartup")||moduleOnly&&FrameworkDiagnosticFilter.continuation(line)){
                out.append(line).append('\n');continue;
            }
            String u=line.toUpperCase(Locale.ROOT);if(!ai&&(u.contains("AI_STAGE")||u.contains("AI_TRIGGER")||u.contains("FEATURE_AI")))continue;
            boolean necessaryShoulder=ShoulderSwitchLogPolicy.necessaryLine(line);
            if(!shoulder&&(u.contains("TGK")||u.contains("SHOULDER")||u.contains("RAPID")||u.contains("LS_AUGMENTNATIVE"))&&!necessaryShoulder)continue;
            if(necessaryShoulder)line=ShoulderSwitchLogPolicy.safe(line);
            if(!line.isEmpty())out.append(line).append('\n');
        }
        return new RootShell.Result(source.exitCode,out.toString(),source.timedOut,source.capture);
    }
    private static void filteredSource(StringBuilder out,String name,RootShell.Result raw,int limit,
            boolean ai,boolean shoulder,boolean moduleOnly){
        source(out,name,filter(raw,ai,shoulder,moduleOnly),limit,false,true);
    }
    private static void appendLogcat(StringBuilder out,String name,DiagnosticLogcat.Collection collection,boolean ai,boolean shoulder){
        filteredSource(out,name+"; queryMode=TIME_WINDOW; requestedSinceWall="+collection.sinceWall
                +"; buffer may have rotated",collection.primary,collection.bytesLimit,ai,shoulder,false);
        out.append("logcatFallbackReason=").append(collection.fallbackReason.isEmpty()?"NOT_NEEDED":collection.fallbackReason)
                .append(';').append(DiagnosticLogcat.recordWindow(filter(collection.primary,ai,shoulder,false)))
                .append("; empty output is not proof of no errors\n");
        if(collection.fallback==null)return;
        source(out,name+" BUFFER_METADATA; contents not collected",collection.buffers,DiagnosticLogcat.BUFFER_BYTES);
        RootShell.Result retained=filter(collection.fallback,ai,shoulder,false);
        source(out,name+" FALLBACK; queryMode=RECENT_TAIL; maximumRecords="+DiagnosticLogcat.TAIL_RECORDS
                +"; coverage=AVAILABLE_BUFFER_TAIL_MAY_PRECEDE_REQUESTED_WINDOW",retained,collection.bytesLimit,false,true);
        out.append("logcatFallbackHasRecords=").append(DiagnosticLogcat.hasRecords(collection.fallback))
                .append(";fallbackRetainedLines=").append(lineCount(retained.output)).append(';').append(DiagnosticLogcat.recordWindow(retained))
                .append("; retained historical buffer cannot be reconstructed; read and capture status remain authoritative\n");
    }
    // Apply one policy to preferences and feature values. In
    // particular, a serialized snapshot contains protected values in Base64.
    static String diagnosticValue(String key,String value){
        if(key.contains("config_snapshot"))return null;
        boolean flag="0".equals(value)||"1".equals(value)||"true".equals(value)||"false".equals(value);
        boolean publicFlag=flag&&(key.equals("ls_augment_health_plan_enabled")||key.equals("ls_augment_rm_usb_install_no_account"));
        boolean protectedValue=key.equals("ls_augment_health_account")||key.equals("ls_augment_health_plan")
                ||key.equals(LiftArcOptions.key("hint_text"))
                ||key.equals("ls_augment_tgk_rapid_fire_test_session")
                ||key.contains("token")||((key.contains("account")||key.contains("health_plan"))&&!publicFlag)
                ||(key.startsWith("ls_augment_rm_ota_")&&!flag);
        return protectedValue?"REDACTED / present:"+!value.isEmpty():value;
    }
    static void appendDiagnosticValue(StringBuilder out,String key,String value){
        String safe=diagnosticValue(key,value);if(safe!=null)out.append(key).append('=').append(safe).append('\n');
        if(safe!=null&&safe.contains("[TRUNCATED"))out.append("diagnosticValueState key=").append(key)
                .append(" state=TRUNCATED; retainedChars=").append(safe.length())
                .append("; budgetChars=").append(DiagnosticWritePolicy.valueLimit(key))
                .append("; missing suffix is not evidence of missing views or a crash\n");
    }
    static String diagnosticValues(String raw){
        StringBuilder out=new StringBuilder();
        for(String line:raw.split("\\r*\\n")){
            int equals=line.indexOf('=');if(equals<=0)continue;
            String key=line.substring(0,equals);
            if(!DiagnosticWritePolicy.validKey(key))continue;
            appendDiagnosticValue(out,key,line.substring(equals+1));
        }
        return out.toString();
    }
    private static void source(StringBuilder out,String name,RootShell.Result result,int limit){source(out,name,result,limit,false,false);}
    private static void source(StringBuilder out,String name,RootShell.Result result,int limit,boolean values){source(out,name,result,limit,values,false);}
    private static void source(StringBuilder out,String name,RootShell.Result result,int limit,boolean values,boolean filtered){
        String output=values?diagnosticValues(result.output):result.output;
        RootShell.CapturedOutput capture=result.capture;
        int upstreamBytes=capture==null?result.output.getBytes(StandardCharsets.UTF_8).length:capture.bytes().length;
        String captureState=capture==null?"UNVERIFIED":capture.failed?"FAILED":!capture.complete?"INCOMPLETE":capture.truncated?"TRUNCATED":"COMPLETE";
        String filterState=!filtered?"NOT_APPLIED":!result.isSuccess()?"NOT_RUN_READ_FAILED":lineCount(output)>0?"MATCHES":upstreamBytes==0?"EMPTY_INPUT":"NO_MATCHES";
        out.append("\n===== SOURCE ").append(name).append(" =====\ncollectedAt=").append(System.currentTimeMillis()).append(" status=").append(result.isSuccess()?"READ":"READ_FAILED")
            .append(" exit=").append(result.exitCode).append(" timeout=").append(result.timedOut).append(" bytesLimit=").append(limit)
            .append(" captureState=").append(captureState).append(" upstreamCapturedBytes=").append(upstreamBytes)
            .append(" upstreamComplete=").append(capture==null?"UNKNOWN":String.valueOf(capture.complete))
            .append(" upstreamReadFailed=").append(capture==null?"UNKNOWN":String.valueOf(capture.failed))
            .append(" upstreamTruncated=").append(capture==null?"UNKNOWN":String.valueOf(capture.truncated))
            .append(" limitReachedOrPossiblyTruncated=").append((capture!=null&&capture.truncated)||upstreamBytes>=limit-512)
            .append(" filterState=").append(filterState).append(" lines=").append(lineCount(output)).append('\n').append(output).append('\n');
    }
    private static int lineCount(String value){return value==null||value.trim().isEmpty()?0:value.trim().split("\\r?\\n").length;}
    /** The unified export always includes this section, even when optional detailed logs are off. */
    static void appendLiftArcLog(StringBuilder out,Context context){
        file(out,context,"LIFTARC_RUNTIME INFO/WARN/ERROR",DiagnosticStore.LIFTARC_FILE,DiagnosticStore.DETAIL_MAX_BYTES,"LIFTARC");
    }
    static void appendShoulderSwitchLog(StringBuilder out,Context context){
        file(out,context,"SHOULDER_SWITCH_RUNTIME INFO/WARN/ERROR",DiagnosticStore.SHOULDER_SWITCH_FILE,DiagnosticStore.DETAIL_MAX_BYTES,ShoulderSwitchLogPolicy.FEATURE);
    }
    static void appendAtomicWorkbenchLog(StringBuilder out,Context context){
        out.append("\natomicWorkbenchWriteState=").append(AtomicWorkbenchDiagnostics.writeState(context)).append('\n');
        out.append("atomicWorkbenchSessionEvidence=").append(AtomicWorkbenchDiagnostics.sessionSummary(context)).append('\n');
        file(out,context,"ATOMIC_WORKBENCH; task state is not first-frame proof",AtomicWorkbenchDiagnostics.FILE_NAME,
                AtomicWorkbenchDiagnostics.MAX_BYTES,AtomicWorkbenchDiagnostics.STAT);
        file(out,context,"ATOMIC_WORKBENCH_HOOK_RUNTIME; retained history, not current/first-frame proof",
                AtomicWorkbenchLogPolicy.FILE,DiagnosticStore.DETAIL_MAX_BYTES,AtomicWorkbenchLogPolicy.FEATURE);
    }
    private static void file(StringBuilder out,Context context,String label,String name,int limit,String stat){try{
        File file=new File(context.getFilesDir(),name);out.append("\n===== SOURCE ").append(label).append(" ").append(name).append(" =====\n");
        if("basic".equals(stat))out.append("basicWriteState=").append(AuditLog.failureStatus(context)).append('\n');
        if(!file.isFile()){out.append("NOT_COLLECTED: 文件不存在；未复现、未开启或未接入。\n");return;}
        String data=new String(BoundedLog.tail(file,limit),StandardCharsets.UTF_8);
        out.append("collectedAt=").append(System.currentTimeMillis()).append(" bytes=").append(file.length()).append(" lines=").append(lineCount(data))
            .append(" rotations=").append(context.getSharedPreferences("diagnostic-retention",0).getLong(stat+"_rotations",0)).append(" lastWrite=").append(file.lastModified())
            .append(" retention=latest complete lines; first/last record timestamps delimit the actual window\n").append(data).append('\n');
    }catch(Exception e){out.append("READ_FAILED:").append(e.getClass().getSimpleName()).append('\n');}}
}
