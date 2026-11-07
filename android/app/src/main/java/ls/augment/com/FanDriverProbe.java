package ls.augment.com;

import android.os.Bundle;
import android.os.SystemClock;
import ls.augment.com.hook.FanDriverContract;

/** Read-only attestation requested by the OEM fan worker. No caller controls a path or command. */
final class FanDriverProbe {
    private static final String SCRIPT =
            "for n in fan_enable fan_speed_level fan_speed_count; do test -r /sys/kernel/fan/\"$n\" || { echo nodes_unavailable; exit 1; }; done\n"
            + "test -r /sys/module/soc_fan/notes/.note.gnu.build-id || { echo loaded_note_unavailable; exit 1; }\n"
            + "uname -r || exit 1\n"
            + "od -An -v -tx1 /sys/module/soc_fan/notes/.note.gnu.build-id | tr -d ' \\n'; echo\n"
            + "for f in /vendor_dlkm/lib/modules/soc_fan.ko /vendor_dlkm/lib/modules/16k-mode/soc_fan.ko "
            + "/vendor/lib/modules/soc_fan.ko /vendor/lib/modules/16k-mode/soc_fan.ko "
            + "/lib/modules/soc_fan.ko /lib/modules/$(uname -r)_16k/soc_fan.ko; do\n"
            + "  if [ -f \"$f\" ]; then sha256sum \"$f\" | cut -d ' ' -f 1; fi\n"
            + "done";
    private static long nextCheck;
    private static String state="pending";
    static synchronized Bundle read() {
        long now=SystemClock.elapsedRealtime();
        if(now>=nextCheck){
            RootShell.Result proof=RootShell.run(SCRIPT,null,5,2048);
            String detail=proof.output.trim();
            if (proof.isSuccess()) state=FanDriverContract.proofStatus(detail);
            else if ("nodes_unavailable".equals(detail) || "loaded_note_unavailable".equals(detail)) state=detail;
            else state="root_probe_failed";
            nextCheck=now+("verified".equals(state)?300_000L:30_000L);
        }
        Bundle result=new Bundle();
        result.putBoolean("verified","verified".equals(state));
        result.putString("state",state);
        return result;
    }
    private FanDriverProbe() {}
}
