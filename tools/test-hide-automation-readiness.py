"""Compile the real activation policy and diagnostic reducer; no phone writes or Root calls."""
from pathlib import Path
import argparse
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com"

FIXTURE = r'''
package ls.augment.com;
import java.util.*;

public final class TestHideAutomationReadiness {
 static final String VERSION="2.0.0-alpha1-test20542",KEY="ls_augment_automation_runtime",PREFIX="ls_augment_automation_";
 static final long NOW=1791941917000L,UPTIME=1542530L,OBSERVED=1791941576439L;
 static final int BOOT=568;
 static int checks;
 static void check(boolean passed,String message){checks++;if(!passed)throw new AssertionError(message);}
 static Map<String,Object> diagnostics(String bridge,String enabled){
  AutomationDiagnosticState.State owner=new AutomationDiagnosticState.State();
  String error=bridge.equals("READY")||bridge.startsWith("WAITING_FOR_")?"":"fixture failure";
  check(owner.apply(new AutomationDiagnosticState.Update("3372:5865",1,OBSERVED,bridge,error,"",0,
    enabled.equals("false")?"disabled":"waiting_screen_off","",""),BOOT),"Fixture owner update rejected");
  Map<String,Object> values=new LinkedHashMap<>(owner.values());
  values.put(KEY,"version="+VERSION+";pid=3372;listener=system_server;enabled="+enabled+";time="+OBSERVED);
  return values;
 }
 static HideAutomationReadiness.Result read(boolean connected,Collection<String> scopes,Map<String,?> values){
  return HideAutomationReadiness.inspect(connected,scopes,VERSION,values,BOOT,NOW,UPTIME);
 }
 static HideAutomationReadiness.Result read(Map<String,?> values){return read(true,Set.of("system"),values);}
 static void blocked(Map<String,?> values,String reason){var result=read(values);
  check(!result.ready&&!result.needsScope&&result.reason.equals(reason),"Wrong readiness rejection: "+result.reason);}
 public static void main(String[] args){
  // These diagnostic/version/PID/boot/time values were read from the test20542 NX809J without touching its configuration.
  var device=diagnostics("READY","false");
  check(read(device).ready,"Canonical system scope + actual disabled listener must permit first activation");
  check(read(true,Set.of("android"),device).ready,"Framework package alias must remain compatible");
  check(read(diagnostics("READY","true")).ready,"Enabled listener should also be ready");
  check(read(true,Set.of("system","com.android.settings"),device).ready,"Additional scopes must not hide system readiness");
  var disconnected=read(false,Set.of("system"),device);
  check(!disconnected.ready&&disconnected.needsScope&&disconnected.reason.equals("framework_disconnected"),"Connection prerequisite bypassed");
  var missing=read(true,Set.of("com.android.settings"),device);
  check(!missing.ready&&missing.needsScope&&missing.reason.equals("system_scope_missing"),"Settings alone cannot replace system scope");
  check(read(true,null,device).needsScope,"Unavailable scopes must fail closed");
  check(!HideAutomationReadiness.inspect(true,Set.of("system"),VERSION,device,-1,NOW,UPTIME).ready,"Unavailable boot count accepted");
  var values=diagnostics("READY","false");values.remove(KEY);blocked(values,"listener_unreported");
  blocked(null,"listener_unreported");
  values=diagnostics("READY","false");values.put(KEY,values.get(KEY).toString().replace(VERSION,"older-version"));blocked(values,"listener_version_mismatch");
  values=diagnostics("READY","false");values.put(KEY,values.get(KEY)+";version="+VERSION);blocked(values,"listener_unreported");
  values=diagnostics("READY","false");values.put(KEY,values.get(KEY).toString().replace("system_server","com.android.settings"));blocked(values,"listener_invalid");
  values=diagnostics("READY","false");values.put(KEY,values.get(KEY).toString().replace("pid=3372","pid=0"));blocked(values,"listener_stale");
  values=diagnostics("READY","false");values.put(KEY,values.get(KEY).toString().replace(Long.toString(OBSERVED),Long.toString(NOW-UPTIME-4000)));blocked(values,"listener_stale");
  values=diagnostics("READY","false");values.put(KEY,values.get(KEY).toString().replace(Long.toString(OBSERVED),Long.toString(NOW+4000)));blocked(values,"listener_stale");
  values=diagnostics("READY","false");values.put(PREFIX+"owner_boot","567");blocked(values,"owner_stale");
  values=diagnostics("READY","false");values.put(PREFIX+"owner_observed_at",Long.toString(NOW-UPTIME-4000));blocked(values,"owner_stale");
  values=diagnostics("READY","false");values.put(PREFIX+"owner_session","3373:5865");blocked(values,"owner_mismatch");
  values=diagnostics("READY","false");values.put(PREFIX+"owner_session","3372:"+(UPTIME+4000));blocked(values,"owner_mismatch");
  values=diagnostics("READY","false");values.put(PREFIX+"owner_observed_at",Long.toString(OBSERVED-4000));blocked(values,"owner_mismatch");
  for(String bridge:List.of("FAILED","LISTENER_FAILED","WAITING_FOR_UNLOCK","WAITING_FOR_PROVIDER","WAITING_FOR_SERVICE")){
   var result=read(diagnostics(bridge,"false"));
   check(!result.ready&&!result.needsScope&&result.reason.equals("bridge_"+bridge.toLowerCase(Locale.ROOT)),"Live failed/waiting bridge accepted: "+bridge);
   check(!result.message.isEmpty(),"Bridge state lacks actionable message");
  }
  values=diagnostics("READY","false");values.put(PREFIX+"bridge_last_error","old recovered failure");values.put(PREFIX+"bridge_last_error_at",Long.toString(OBSERVED-5000));
  check(read(values).ready,"Recovered historical failure should not veto current READY owner");
  values=diagnostics("READY","false");values.put(PREFIX+"bridge_error","still failing");blocked(values,"bridge_ready");
  System.out.println("PASS HideAutomationReadiness: "+checks+" assertions; canonical scope, disabled activation, version/boot/PID and actual bridge prerequisites.");
 }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", type=Path, default=Path("C:/Program Files/Android/openjdk/jdk-21.0.8"))
    args = parser.parse_args()
    suffix = ".exe" if args.jdk.drive else ""
    with tempfile.TemporaryDirectory(prefix="lsa-hide-automation-readiness-") as temporary:
        folder = Path(temporary)
        fixture = folder / "TestHideAutomationReadiness.java"
        fixture.write_text(FIXTURE, encoding="utf-8")
        subprocess.run([str(args.jdk / "bin" / ("javac" + suffix)), "-J-Duser.language=en", "-encoding", "UTF-8",
                        "--release", "17", "-d", str(folder), str(fixture),
                        str(SOURCE / "HideAutomationReadiness.java"), str(SOURCE / "AutomationDiagnosticState.java")],
                       check=True, timeout=45)
        subprocess.run([str(args.jdk / "bin" / ("java" + suffix)), "-cp", str(folder),
                        "ls.augment.com.TestHideAutomationReadiness"], check=True, timeout=30)


if __name__ == "__main__":
    main()
