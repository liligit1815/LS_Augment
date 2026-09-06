package ls.augment.com;

import android.os.Bundle;
import android.os.SystemClock;

/** Fixed, read-only Root sampling shared by the authorized SystemUI caller. */
final class HardwareTelemetry {
    private static long sampledAt=-10000;
    private static Bundle cached=new Bundle();
    private HardwareTelemetry() { }
    static synchronized Bundle read() {
        long now=SystemClock.elapsedRealtime();
        if(now-sampledAt<2000)return new Bundle(cached);
        RootShell.Result result=RootShell.run("for z in /sys/class/thermal/thermal_zone*; do "
                +"[ -r \"$z/type\" ] && [ -r \"$z/temp\" ] || continue; "
                +"read -r t < \"$z/type\"; case \"$t\" in *cpu*|*gpu*) "
                +"read -r v < \"$z/temp\"; printf '%s|%s\\n' \"$t\" \"$v\";; esac; done",null,3,16384);
        double[] values=ThermalTelemetry.parse(result.isSuccess()?result.output:"");
        Bundle next=new Bundle();next.putDouble("cpu",values[0]);next.putDouble("gpu",values[1]);
        next.putLong("sampledAt",SystemClock.elapsedRealtime());cached=next;sampledAt=SystemClock.elapsedRealtime();
        return new Bundle(next);
    }
}
