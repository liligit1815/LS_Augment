"""Exercise the fixed Root reboot transport without starting a process or rebooting a device."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
files = {
    'android/os/Bundle.java': '''package android.os;public class Bundle{
        public boolean ok;public String message;public void putBoolean(String k,boolean v){ok=v;}
        public void putString(String k,String v){message=v;}}''',
    'android/os/SystemClock.java': '''package android.os;public class SystemClock{
        public static long now;public static long elapsedRealtime(){return now;}}''',
    'ls/augment/com/RootShell.java': '''package ls.augment.com;public class RootShell{
        static int calls,code;static boolean timeout;static String command;static Runnable during;
        static Result run(String c,String input,long seconds,int limit){
            if(input!=null||seconds!=8||limit!=4096)throw new AssertionError("unbounded transport");
            calls++;command=c;if(during!=null)during.run();return new Result();}
        static class Result{int exitCode=code;boolean timedOut=timeout;}}''',
    'ls/augment/com/TestPowerModeControl.java': '''package ls.augment.com;
        import android.os.SystemClock;public class TestPowerModeControl{
        static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
        public static void main(String[] args){
            String ui="com.android.systemui";String[] packages={ui};
            check(PowerModePolicy.allowedCaller(10343,10400,ui,packages),"verified SystemUI UID allowed");
            check(!PowerModePolicy.allowedCaller(110343,10400,ui,packages),"cross-user denied");
            check(!PowerModePolicy.allowedCaller(10343,10400,"evil",packages),"calling package checked");
            check(!PowerModePolicy.allowedCaller(10343,10400,ui,new String[]{"evil"}),"UID membership checked");
            check(!PowerModePolicy.allowedCaller(10343,10400,ui,null),"unknown UID denied");
            check(!PowerModePolicy.allowedCaller(-1,10400,ui,packages),"invalid UID denied");
            for(String invalid:new String[]{"", "reboot", "edl; id", "recovery\\nreboot", "9008", "bootloader --force"}){
                check(!PowerModeControl.reboot(invalid).ok&&RootShell.calls==0,"bad target never reaches Root");
            }
            check(!PowerModeControl.reboot(null).ok&&RootShell.calls==0,"null target rejected");
            for(String mode:new String[]{"bootloader","fastboot","recovery","edl"}){
                SystemClock.now+=6000;int before=RootShell.calls;
                RootShell.during=()->check(!PowerModeControl.reboot("edl").ok,"concurrent reboot rejected");
                check(PowerModeControl.reboot(mode).ok,"accepted "+mode);
                check(RootShell.command.equals("/system/bin/reboot "+mode),"exact mode mapping");
                check(RootShell.calls==before+1,"one Root call only");
                check(!PowerModeControl.reboot(mode).ok&&RootShell.calls==before+1,"success cooldown");
            }
            RootShell.during=null;SystemClock.now+=6000;RootShell.code=1;
            int before=RootShell.calls;check(!PowerModeControl.reboot("edl").ok,"Root denial reported");
            check(RootShell.calls==before+1,"denial does not retry or substitute mode");
            RootShell.code=0;RootShell.timeout=true;check(!PowerModeControl.reboot("edl").ok,"timeout not success");
            RootShell.timeout=false;check(PowerModeControl.reboot("recovery").ok,"failure releases busy state");
            System.out.println("PASS Root reboot control: "+checks+" checks, no real process started");
        }}'''
}
for name in ('PowerModePolicy.java', 'PowerModeControl.java'):
    files['ls/augment/com/' + name] = (SRC / name).read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='duo-power-control-') as temp:
    sources = []
    for name, source in files.items():
        path = Path(temp) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        sources.append(str(path))
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', temp, *sources], check=True)
    subprocess.run(['java', '-cp', temp, 'ls.augment.com.TestPowerModeControl'], check=True)
