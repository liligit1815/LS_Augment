package ls.augment.com;

import android.app.job.JobParameters;
import android.app.job.JobService;

/** DE-only job process: does not initialize configuration, hooks or ordinary app features. */
public final class DiagnosticCaptureService extends JobService {
    private final java.util.concurrent.ConcurrentMap<JobParameters,Run> runs=new java.util.concurrent.ConcurrentHashMap<>();
    private static final class Run {volatile boolean cancelled;Thread worker;}
    @Override public boolean onStartJob(JobParameters params) {
        String phase=params.getExtras().getString("phase","BOOT");
        Run run=new Run();
        run.worker=new Thread(()->{try{BootEvidenceCapture.capture(this,phase,20);}finally{
            runs.remove(params,run);if(!run.cancelled)jobFinished(params,false);
        }},"Duo-BootEvidence");
        runs.put(params,run);run.worker.start();return true;
    }
    @Override public boolean onStopJob(JobParameters params) {
        Run run=runs.remove(params);if(run!=null){run.cancelled=true;run.worker.interrupt();}return true;
    }
}
