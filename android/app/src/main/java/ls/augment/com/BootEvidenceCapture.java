package ls.augment.com;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.PersistableBundle;
import android.os.Process;
import android.os.SystemClock;
import java.io.File;
import java.nio.charset.StandardCharsets;

/** Independent phone-side collection; remains usable when LSPosed has disabled injection. */
final class BootEvidenceCapture {
    static final int JOB=205900;
    static final String PROCESS="ls.augment.com:boot_diagnostics";
    private BootEvidenceCapture() { }
    static void schedule(Context context,String phase) {
        try {
            if(!BootEvidenceArchive.PHASES.contains(phase))return;
            JobScheduler scheduler=context.getSystemService(JobScheduler.class);if(scheduler==null)return;
            PersistableBundle extras=new PersistableBundle();extras.putString("phase",phase);
            int id=JOB+("LOCKED_BOOT".equals(phase)?1:"BOOT".equals(phase)?2:0);
            scheduler.schedule(new JobInfo.Builder(id,new ComponentName(context,DiagnosticCaptureService.class))
                    .setExtras(extras).setMinimumLatency(0).setOverrideDeadline(5000).build());
        }catch(RuntimeException ignored){/* Export always retries independently and reports actual read status. */}
    }
    private static File directory(Context context){return new File(context.createDeviceProtectedStorageContext().getFilesDir(),"boot-evidence-v1");}
    static String capture(Context context,String phase,int timeoutSeconds) {
        String boot=SystemUiCrashJournal.bootId();
        if("unknown".equals(boot))try {
            int count=android.provider.Settings.Global.getInt(context.getContentResolver(),"boot_count",-1);
            boot=count>=0?"bootcount-"+count:"unknown-"+System.currentTimeMillis();
        }catch(Throwable unavailable){boot="unknown-"+System.currentTimeMillis();}
        StringBuilder out=new StringBuilder("BOOT_EVIDENCE_ARCHIVE schema=1 version=").append(BuildConfig.VERSION_NAME)
                .append(" boot=").append(boot).append(" phase=").append(phase).append(" collectedWall=").append(System.currentTimeMillis())
                .append(" collectedElapsed=").append(SystemClock.elapsedRealtime()).append(" native_abort_and_sigkill_journal=NOT_CAPTURED\n");
        try {
            android.os.UserManager users=context.getSystemService(android.os.UserManager.class);
            out.append("storage=DEVICE_PROTECTED userUnlocked=").append(users==null?"UNKNOWN":String.valueOf(users.isUserUnlocked())).append('\n');
        }catch(Throwable unavailable){out.append("storage=DEVICE_PROTECTED userUnlocked=UNKNOWN\n");}
        try {
            ApplicationInfo info=context.getPackageManager().getApplicationInfo(SystemUiCrashJournal.PACKAGE,0);
            int user=Process.myUid()/100000;if(info.uid/100000!=user)throw new SecurityException("user_identity");
            String command="CLASSPATH="+RootShell.quote(context.getApplicationInfo().sourceDir)
                    +" exec /system/bin/app_process /system/bin ls.augment.com.SystemUiNativeCrashEvidence "+user+" "+info.uid;
            RootShell.Result result=RootShell.run(command,null,timeoutSeconds,BootEvidenceArchive.LIMIT-4096);
            out.append("rootExit=").append(result.exitCode).append(" timeout=").append(result.timedOut)
                    .append(" captureComplete=").append(result.capture!=null&&result.capture.complete&&!result.capture.failed)
                    .append(" captureTruncated=").append(result.capture!=null&&result.capture.truncated).append('\n');
            String text=result.output;
            if(text.startsWith("BOOT_CRASH_EVIDENCE protocol=1 ")) {
                out.append(text).append('\n');
                if(!text.trim().endsWith("END_BOOT_CRASH_EVIDENCE"))out.append("sourceResult=INCOMPLETE;missing_end_marker=true\n");
            }else out.append("sourceResult=UNAVAILABLE;valid_protocol=false\n");
        }catch(Throwable failure){out.append("sourceResult=UNAVAILABLE;error=").append(failure.getClass().getSimpleName()).append('\n');}
        out.append("END_BOOT_EVIDENCE_ARCHIVE\n");
        if(Thread.currentThread().isInterrupted())return out.append("archiveWrite=CANCELLED;previous_evidence_preserved=true\n").toString();
        try {
            String text=out.toString();
            if(text.getBytes(StandardCharsets.UTF_8).length>BootEvidenceArchive.LIMIT)throw new IllegalStateException("archive_limit");
            BootEvidenceArchive.save(directory(context),boot,phase,text);
        }catch(Throwable failure){out.append("archiveWrite=FAILED;error=").append(failure.getClass().getSimpleName()).append('\n');}
        return out.toString();
    }
    static void appendForExport(StringBuilder out,Context context) {
        String fresh=capture(context,"EXPORT",20);
        out.append("\n===== SOURCE BOOT_CRASH_EVIDENCE_CURRENT =====\n").append(fresh);
        out.append("\n===== SOURCE BOOT_CRASH_EVIDENCE_RETAINED; boot identity and phase delimit history =====\n");
        try{out.append(BootEvidenceArchive.read(directory(context)));}
        catch(Throwable failure){out.append("status=UNAVAILABLE;error=").append(failure.getClass().getSimpleName()).append('\n');}
    }
}
