package ls.augment.com;

import android.os.Bundle;
import android.os.SystemClock;
import ls.augment.com.hook.FanDriverContract;

/** Read-only attestation requested by the OEM fan worker. No caller controls a path or command. */
final class FanDriverProbe {
    private static final String SCRIPT =
            "for n in fan_enable fan_speed_level fan_speed_count; do test -r /sys/kernel/fan/\"$n\" || { echo nodes_unavailable:$n; exit 1; }; done\n"
            + "test -r /sys/module/soc_fan/notes/.note.gnu.build-id || { echo loaded_note_unavailable; exit 1; }\n"
            + "uname -r || exit 1\n"
            + "od -An -v -tx1 /sys/module/soc_fan/notes/.note.gnu.build-id | tr -d ' \\n'; echo\n"
            + "for f in /vendor_dlkm/lib/modules/soc_fan.ko /vendor_dlkm/lib/modules/16k-mode/soc_fan.ko "
            + "/vendor/lib/modules/soc_fan.ko /vendor/lib/modules/16k-mode/soc_fan.ko "
            + "/lib/modules/soc_fan.ko /lib/modules/$(uname -r)_16k/soc_fan.ko; do\n"
            + "  if [ -f \"$f\" ]; then echo driver_path=$f; sha256sum \"$f\" | cut -d ' ' -f 1; fi\n"
            + "done";
    private static long nextCheck;
    private static String state="pending";
    private static String evidence="";
    private static long checkedAt;
    static synchronized Bundle read() {
        long now=SystemClock.elapsedRealtime();
        if(now>=nextCheck){
            RootShell.Result proof=RootShell.run(SCRIPT,null,5,2048);
            String detail=proof.output.trim();
            checkedAt=SystemClock.elapsedRealtime();
            // Only the fixed read-only probe output, bounded and single-line. Never arbitrary node contents.
            evidence=detail.replaceAll("[^A-Za-z0-9._/=: +\\-\\r\\n]", "_").replace('\n',';').replace('\r',' ');
            if(evidence.length()>1800)evidence=evidence.substring(0,1800)+";truncated=true";
            if (proof.isSuccess()) state=FanDriverContract.proofStatus(detail);
            else if (detail.startsWith("nodes_unavailable:") || "loaded_note_unavailable".equals(detail)) state=detail;
            else state="root_probe_failed";
            nextCheck=now+("verified".equals(state)?300_000L:30_000L);
            StartupDiagnostics.record("FAN_DRIVER_READ", "state="+state+";evidence="+evidence, null);
        }
        Bundle result=new Bundle();
        result.putBoolean("verified","verified".equals(state));
        result.putString("state",state);
        result.putString("evidence",evidence);
        result.putLong("checkedElapsed",checkedAt);
        return result;
    }
    static String describe() {
        Bundle proof=read();
        return "state="+proof.getString("state")+";verified="+proof.getBoolean("verified")
                +";checkedElapsed="+checkedAt+";evidence="+evidence;
    }
    private FanDriverProbe() {}
}
