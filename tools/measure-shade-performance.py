"""Compare native notification/control shade touch pulls without changing settings."""
from pathlib import Path
import argparse,json,re,shlex,subprocess,time

ROOT=Path(__file__).resolve().parents[1]

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb',required=True)
    parser.add_argument('--serial',required=True)
    parser.add_argument('--label',required=True)
    parser.add_argument('--panel',choices=['notifications','control'],required=True)
    parser.add_argument('--rounds',type=int,default=8)
    args=parser.parse_args()
    if not re.fullmatch('[A-Za-z0-9_-]{1,60}',args.label) or not 1<=args.rounds<=20:
        parser.error('Invalid label/rounds')
    folder=ROOT/'out/shade-performance-20496'/args.label
    folder.mkdir(parents=True,exist_ok=True)
    def adb(*arguments):
        result=subprocess.run([args.adb,'-s',args.serial,*arguments],capture_output=True,timeout=35)
        if result.returncode:raise RuntimeError(result.stderr.decode('utf-8',errors='replace'))
        return result.stdout
    def shell(command,root=False):
        return adb('shell','su -c '+shlex.quote(command) if root else command).decode('utf-8',errors='replace').strip()
    def ticks(pid,main=False):
        path=f'/proc/{pid}/task/{pid}/stat' if main else f'/proc/{pid}/stat'
        values=shell('cat '+path,True).rsplit(') ',1)[1].split()
        return int(values[11])+int(values[12])
    def temperature():
        match=re.search(r'temperature:\s*(\d+)',shell('dumpsys battery'))
        return int(match[1])/10 if match else None
    size=re.search(r'Physical size:\s*(\d+)x(\d+)',shell('wm size'))
    if not size:raise RuntimeError('Display dimensions unavailable')
    width,height=map(int,size.groups())
    pid=shell('pidof com.android.systemui')
    if not pid.isdigit():raise RuntimeError('A single SystemUI process is required')
    hz=int(shell('getconf CLK_TCK'))
    configuration=shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml',True)
    x=int(width*(.13 if args.panel=='notifications' else .88))
    start_y=60 if args.panel=='control' else 4
    def pull():shell(f'input swipe {x} {start_y} {x} {int(height*.78)} 420')
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('input keyevent 3')
    shell('cmd statusbar collapse');time.sleep(.6)
    pull();time.sleep(.7)
    (folder/'opened-private.png').write_bytes(adb('exec-out','screencap -p'))
    (folder/'opened-window-private.txt').write_text(shell('dumpsys window windows'),encoding='utf-8')
    shell('cmd statusbar collapse');time.sleep(.6)
    shell('dumpsys gfxinfo com.android.systemui reset')
    before_process,before_main=ticks(pid),ticks(pid,True)
    before_temperature=temperature();start=time.monotonic()
    try:
        for _ in range(args.rounds):
            pull();time.sleep(.65)
            shell('cmd statusbar collapse');time.sleep(.45)
    finally:shell('cmd statusbar collapse')
    elapsed=time.monotonic()-start
    after_process,after_main=ticks(pid),ticks(pid,True)
    if shell('pidof com.android.systemui')!=pid:raise RuntimeError('SystemUI process changed')
    if configuration!=shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml',True):
        raise RuntimeError('Module configuration changed during comparison')
    gfx=shell('dumpsys gfxinfo com.android.systemui framestats')
    (folder/'gfx.txt').write_text(gfx,encoding='utf-8')
    fields={}
    for key in ['Total frames rendered','Janky frames','Number Slow UI thread','Number Frame deadline missed','50th percentile','90th percentile','95th percentile','99th percentile','99th gpu percentile']:
        match=re.search(r'^'+re.escape(key)+r':\s*([^\r\n]+)',gfx,re.MULTILINE)
        fields[key]=match[1] if match else None
    report={'label':args.label,'panel':args.panel,'touchPulls':args.rounds,'systemuiPid':int(pid),
        'screen':[width,height],'startY':start_y,'elapsedSeconds':round(elapsed,3),
        'processCpuMs':round((after_process-before_process)/hz*1000),
        'mainThreadCpuMs':round((after_main-before_main)/hz*1000),
        'mainThreadCpuPercent':round((after_main-before_main)/hz/elapsed*100,2),
        'batteryStartCelsius':before_temperature,'batteryEndCelsius':temperature(),
        'moduleConfigurationUnchanged':True,'gfx':fields}
    (folder/'summary.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(report,ensure_ascii=True),flush=True)

if __name__=='__main__':main()
