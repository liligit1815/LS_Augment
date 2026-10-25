package ls.augment.com;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public final class DiagnosticBootReceiver extends BroadcastReceiver {
    @Override public void onReceive(Context context,Intent intent) {
        String action=intent==null?"":intent.getAction();
        if(Intent.ACTION_SHUTDOWN.equals(action)) {
            PendingResult pending=goAsync();
            new Thread(()->{try{BootEvidenceCapture.capture(context,"SHUTDOWN",3);}finally{pending.finish();}},"Duo-ShutdownEvidence").start();
        }else if(Intent.ACTION_LOCKED_BOOT_COMPLETED.equals(action))BootEvidenceCapture.schedule(context,"LOCKED_BOOT");
        else if(Intent.ACTION_BOOT_COMPLETED.equals(action))
            BootEvidenceCapture.schedule(context,"BOOT");
        else if(Intent.ACTION_MY_PACKAGE_REPLACED.equals(action))BootEvidenceCapture.schedule(context,"APP");
    }
}
