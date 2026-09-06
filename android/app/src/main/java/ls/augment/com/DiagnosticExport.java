package ls.augment.com;

import android.content.Context;
import android.os.Build;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

/** A real, fresh, bounded collection. Missing evidence is never interpreted as success. */
final class DiagnosticExport {
    static String build(Context context){
        long start=System.currentTimeMillis();StringBuilder out=new StringBuilder();AppConfig config=new AppConfig(context);
        boolean ai=config.getBoolean(ConfigSchema.AI_TRIGGER_DIAGNOSTICS),shoulder=config.getBoolean(ConfigSchema.SHOULDER_DIAGNOSTICS);
        out.append("LS_Augment device diagnostic export v1\nmodule=").append(BuildConfig.VERSION_NAME)
            .append("\ncollectionStarted=").append(start).append("\ndevice=").append(Build.MANUFACTURER).append(' ').append(Build.MODEL)
            .append("\nandroid=").append(Build.VERSION.RELEASE).append(" SDK=").append(Build.VERSION.SDK_INT).append("\nROM=").append(Build.FINGERPRINT)
            .append("\ndetailedShoulder=").append(shoulder).append(" detailedAI=").append(ai).append("\n")
            .append("说明：REGISTERED 仅说明 Hook 注册完成；callbackCalls 是回调进入次数，callbackReturns 不是业务成功。真实生效须结合功能命中、执行结果和复现时段。没有记录表示 UNKNOWN / 未触发 / 数据已轮转，不能直接认定失败。\n")
            .append("详细记录仅包含开启后的有界窗口。队列丢弃、文件轮转、旧版本与停止的进程都会明确标出；不采集账号凭据。\n");
        source(out,"ROOT",RootShell.run("id",null,5,4096),4096);
        for(String pkg:HookTargetRegistry.packages()){
            if(pkg.equals("system"))continue;
            try{android.content.pm.PackageInfo info=context.getPackageManager().getPackageInfo(pkg,0);out.append("packageVersion ").append(pkg).append('=').append(info.versionName).append(" (").append(info.getLongVersionCode()).append(")\n");}
            catch(Exception e){out.append("packageVersion ").append(pkg).append("=NOT_INSTALLED_OR_NOT_VISIBLE\n");}
        }
        out.append("\n===== CONFIGURATION AT EXPORT =====\n");
        for(Map.Entry<String,String> e:config.snapshot().entrySet()){
            if(e.getKey().equals(ConfigSchema.HEALTH_ACCOUNT)||e.getKey().equals(ConfigSchema.HEALTH_PLAN)||e.getKey().contains("compat_token"))out.append(e.getKey()).append("=REDACTED / present:").append(!e.getValue().isEmpty()).append('\n');
            else out.append(e.getKey()).append('=').append(e.getValue()).append('\n');
        }
        RootShell.Result processes=RootShell.run("ps -A -o PID,NAME",null,6,256*1024);
        Map<Integer,String> live=new HashMap<>();if(processes.isSuccess())for(String line:processes.output.split("\\r?\\n")){String[] p=line.trim().split("\\s+",2);try{live.put(Integer.parseInt(p[0]),p[1]);}catch(Exception ignored){}}
        out.append("\n===== PER-PROCESS HOOK EVIDENCE =====\n");Set<String> observed=new HashSet<>();
        Map<String,?> snapshots=context.getSharedPreferences("hook-processes",0).getAll();
        if(snapshots.isEmpty())out.append("NOT_COLLECTED: 没有进程快照，请重启相关作用域并复现；也可能模块未加载或进程无法访问诊断接口。\n");
        for(Object value:snapshots.values())try{
            JSONObject snapshot=new JSONObject(value.toString());int pid=snapshot.getInt("pid");String name=snapshot.optString("process");
            boolean systemServer=name.equals("system")&&"system_server".equals(live.get(pid))&&snapshot.optInt("sourceUid")==1000;
            if(systemServer)snapshot.put("hostedPackage",snapshot.optString("package")).put("package","system");
            boolean current=BuildConfig.VERSION_NAME.equals(snapshot.optString("moduleVersion"))&&(name.equals(live.get(pid))||systemServer)
                &&snapshot.optLong("moduleLoadedElapsed")<=android.os.SystemClock.elapsedRealtime()&&start-snapshot.optLong("receivedAt")<60000;
            snapshot.put("currentEvidence",current).put("evidenceStatus",current?"CURRENT_PROCESS_SNAPSHOT":"STALE_OR_STOPPED_OR_UNVERIFIED");
            if(current)observed.add(snapshot.optString("package"));out.append(snapshot.toString(2)).append('\n');
        }catch(Exception e){out.append("snapshot_parse_error=").append(e.getClass().getSimpleName()).append('\n');}
        for(String pkg:HookTargetRegistry.packages())if(!observed.contains(pkg))out.append(pkg).append(": current module/registration/hit/result = UNKNOWN (no current snapshot)\n");
        out.append("\n===== FEATURE LATEST VALUES (same keys replace previous values; may be stale) =====\n");
        Map<String,?> diagnostic=context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getAll();
        for(String key:new TreeSet<>(diagnostic.keySet()))if(!key.contains("account")&&!key.contains("health_plan"))out.append(key).append('=').append(diagnostic.get(key)).append('\n');
        source(out,"GLOBAL_LATEST_VALUES (fallback; timestamps determine freshness)",RootShell.run("settings list global | grep '^ls_augment_' | grep -v 'config_snapshot\\|health_account\\|health_plan'",null,8,512*1024),512*1024);
        file(out,context,"BASIC","ls_augment.log",192*1024,"basic");
        if(shoulder)file(out,context,"SHOULDER_DETAIL","detail-SHOULDER.log",512*1024,"SHOULDER");
        if(ai)file(out,context,"AI_DETAIL","detail-AI.log",512*1024,"AI");
        if(shoulder||ai){
            String since=new SimpleDateFormat("MM-dd HH:mm:ss.SSS",Locale.US).format(new Date(start-30*60*1000));
            String tags="LS_Augment:I "+(ai?"LS_Augment_AI:I ":"")+(shoulder?"LS_Augment_TGK:I LS_AugmentNative:I ":"")+"*:S";
            RootShell.Result logs=RootShell.run("logcat -d -v epoch -T "+RootShell.quote(since)+" "+tags,null,12,1024*1024);
            source(out,"LOGCAT module tags; requested last 30 minutes; unavailable historical buffer cannot be reconstructed",filter(logs,ai,shoulder),1024*1024);
            RootShell.Result listing=RootShell.run("ls -1 /data/adb/lspd/log",null,5,8192);
            if(!listing.isSuccess())source(out,"LSPOSED_CURRENT_LOG_DIRECTORY",listing,8192);
            else {int files=0;for(String name:listing.output.split("\\r?\\n")){
                name=name.trim();if(!name.matches("[A-Za-z0-9_.-]+")||files++>=6)continue;
                RootShell.Result log=RootShell.run("tail -c 524288 "+RootShell.quote("/data/adb/lspd/log/"+name)+" | grep 'LS_Augment'",null,8,512*1024);
                source(out,"LSPOSED "+name+"; module-only lines in latest 512 KiB; historical window may precede this reproduction",filter(log,ai,shoulder),512*1024);
            }if(files==0)out.append("LSPOSED: NO_FILES; framework log is not collected\n");}
        }
        out.append("\ncollectionFinished=").append(System.currentTimeMillis()).append("\n");return out.toString();
    }
    private static RootShell.Result filter(RootShell.Result source,boolean ai,boolean shoulder){StringBuilder out=new StringBuilder();
        for(String line:source.output.split("\\r?\\n")){String u=line.toUpperCase(Locale.ROOT);if(!ai&&(u.contains("AI_STAGE")||u.contains("AI_TRIGGER")||u.contains("FEATURE_AI")))continue;
            if(!shoulder&&(u.contains("TGK")||u.contains("SHOULDER")||u.contains("RAPID")))continue;out.append(line).append('\n');}
        out.insert(0,"upstreamCapturedBytes="+source.output.getBytes(StandardCharsets.UTF_8).length+"; feature filtering follows collection; upstream buffer may already be bounded\n");
        return new RootShell.Result(source.exitCode,out.toString(),source.timedOut);
    }
    private static void source(StringBuilder out,String name,RootShell.Result result,int limit){
        out.append("\n===== SOURCE ").append(name).append(" =====\ncollectedAt=").append(System.currentTimeMillis()).append(" status=").append(result.isSuccess()?"READ":"UNAVAILABLE_OR_NO_MATCHES")
            .append(" exit=").append(result.exitCode).append(" timeout=").append(result.timedOut).append(" bytesLimit=").append(limit)
            .append(" limitReachedOrPossiblyTruncated=").append(result.output.getBytes(StandardCharsets.UTF_8).length>=limit-512)
            .append(" lines=").append(result.output.isEmpty()?0:result.output.split("\\r?\\n").length).append('\n').append(result.output).append('\n');
    }
    private static void file(StringBuilder out,Context context,String label,String name,int limit,String stat){try{
        File file=new File(context.getFilesDir(),name);out.append("\n===== SOURCE ").append(label).append(" ").append(name).append(" =====\n");
        if(!file.isFile()){out.append("NOT_COLLECTED: 文件不存在；未复现、未开启或未接入。\n");return;}
        String data=new String(BoundedLog.tail(file,limit),StandardCharsets.UTF_8);String[] lines=data.split("\\r?\\n");
        out.append("collectedAt=").append(System.currentTimeMillis()).append(" bytes=").append(file.length()).append(" lines=").append(lines.length)
            .append(" rotations=").append(context.getSharedPreferences("diagnostic-retention",0).getLong(stat+"_rotations",0)).append(" lastWrite=").append(file.lastModified())
            .append(" retention=latest complete lines; first/last record timestamps delimit the actual window\n").append(data).append('\n');
    }catch(Exception e){out.append("READ_FAILED:").append(e.getClass().getSimpleName()).append('\n');}}
}
