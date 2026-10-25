"""Read-only, bounded ADB resource observation. Does not install or change phone settings."""
from pathlib import Path
import argparse,datetime,json,re,shlex,subprocess,time,xml.etree.ElementTree as ET

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb',type=Path,required=True)
    parser.add_argument('--serial',required=True)
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--seconds',type=int,default=3600)
    parser.add_argument('--interval',type=int,default=30)
    args=parser.parse_args()
    if not 60<=args.seconds<=7200 or not 15<=args.interval<=120:parser.error('Use 60..7200 seconds and 15..120 second samples')
    out=args.output.resolve();out.mkdir(parents=True,exist_ok=True)
    if (out/'samples.jsonl').exists():raise RuntimeError('Refuse to overwrite previous evidence')
    def adb(*words):
        result=subprocess.run([str(args.adb),'-s',args.serial,*words],capture_output=True,timeout=30)
        if result.returncode:raise RuntimeError((result.stdout+result.stderr).decode('utf-8','replace')[-1000:])
        return result.stdout
    def shell(command,root=False):return adb('shell','su -c '+shlex.quote(command) if root else command).decode('utf-8','replace').replace('\r','').strip()
    def raw(command):return adb('exec-out','su -c '+shlex.quote(command))
    def stamp():return datetime.datetime.now(datetime.timezone.utc).isoformat()
    identity={'startedUtc':stamp(),'clientTimezone':'America/Los_Angeles','serial':args.serial,
              'fingerprint':shell('getprop ro.build.fingerprint'),'bootId':shell('cat /proc/sys/kernel/random/boot_id'),
              'clockTicksPerSecond':int(shell('getconf CLK_TCK')),'intervalSeconds':args.interval,'plannedSeconds':args.seconds,
              'scope':'READ_ONLY_OBSERVER; phase controlled separately; no forced GC or process restarts'}
    installed_apk=shell('pm path ls.augment.com').splitlines()[0].removeprefix('package:')
    identity['installedApkSha256']=shell('sha256sum '+shlex.quote(installed_apk)).split()[0]
    (out/'identity.json').write_text(json.dumps(identity,indent=2),encoding='utf-8')
    package='ls.augment.com';base='/data/user/0/'+package
    (out/'configuration-before-private.xml').write_bytes(raw('cat '+base+'/shared_prefs/ls_augment_config_v2.xml'))
    (out/'package-before.txt').write_text(shell('dumpsys package '+package),encoding='utf-8')
    processes=['system_server','com.android.systemui','ls.augment.com','ls.augment.com:boot_diagnostics','com.mi.health','com.mi.health:device','com.zte.mifavor.launcher']
    tracked_threads={};errors=[];start=time.monotonic();index=0
    while True:
        due=min(index*args.interval,args.seconds)
        time.sleep(max(0,start+due-time.monotonic()))
        sample={'index':index,'utc':stamp(),'elapsedSeconds':round(time.monotonic()-start,3),
                'phase':(out/'phase.txt').read_text(encoding='utf-8').strip() if (out/'phase.txt').exists() else 'baseline',
                'processes':{},'errors':[]}
        try:
            sample['bootId']=shell('cat /proc/sys/kernel/random/boot_id')
            sample['uptime']=float(shell('cat /proc/uptime').split()[0])
            inventory=shell('ps -A -o PID,NAME')
            entries=[line.split(None,1) for line in inventory.splitlines()[1:] if len(line.split(None,1))==2]
            for name in processes:
                candidates=[int(pid) for pid,comm in entries if comm==name]
                if not candidates:sample['processes'][name]={'present':False};continue
                pid=candidates[0];prefix=f'/proc/{pid}'
                try:
                    data=shell('cat '+prefix+'/stat',True);fields=data.rsplit(')',1)[1].split()
                    status=shell('cat '+prefix+'/status',True)
                    item={'present':True,'pid':pid,'startTicks':int(fields[19]),'cpuTicks':int(fields[11])+int(fields[12]),
                          'rssKiB':int(re.search(r'VmRSS:\s+(\d+)',status)[1]),'threads':int(re.search(r'Threads:\s+(\d+)',status)[1]),
                          'fdCount':int(shell('ls '+prefix+'/fd | wc -l',True)),
                          'io':{k:int(v) for k,v in re.findall(r'(rchar|wchar|read_bytes|write_bytes|syscr|syscw):\s+(\d+)',shell('cat '+prefix+'/io',True))}}
                    if pid not in tracked_threads or index%10==0:
                        listing=shell('for t in '+prefix+'/task/*; do n=$(cat "$t/comm"); case "$n" in *iagnostic*|*tartup*|*HealthLedger*|*RecorderRec*|*Content*) printf "%s %s\\n" "$t" "$n";; esac; done',True)
                        tracked_threads[pid]=[line.split(' ',1) for line in listing.splitlines() if line]
                    item['workers']={}
                    for thread_path,title in tracked_threads[pid]:
                        try:
                            stat=shell('cat '+thread_path+'/stat',True).rsplit(')',1)[1].split()
                            item['workers'][thread_path.rsplit('/',1)[1]]={'name':title,'cpuTicks':int(stat[11])+int(stat[12]),'state':stat[0]}
                        except RuntimeError:pass  # A short-lived worker may finish between reads.
                    sample['processes'][name]=item
                except Exception as error:sample['processes'][name]={'pid':pid,'error':str(error)}
            sample['moduleKiB']=int(shell('du -sk '+base,True).split()[0])
            sample['externalAllocatedKiB']=int(shell('du -sk /storage/emulated/0/Android/data/'+package,True).split()[0])
            sizes=shell('find '+base+'/files '+base+'/shared_prefs '+base+'/databases '+base+'/cache -maxdepth 1 -type f -printf "%p\\t%s\\n"',True)
            sample['fileSizes']={line.rsplit('\t',1)[0].removeprefix(base+'/'):int(line.rsplit('\t',1)[1]) for line in sizes.splitlines() if '\t' in line}
            exports=shell('find '+base+'/cache -maxdepth 1 -name "duo-log-*.txt" -type f -printf "%s\\n"',True)
            sample['exportBytes']=[int(n) for n in exports.splitlines() if n]
            sample['freeDataKiB']=int(shell('df -k /data').splitlines()[-1].split()[3])
            battery=shell('dumpsys battery')
            sample['battery']={k:int(v) for k,v in re.findall(r'^\s*(level|temperature|voltage):\s+(\d+)',battery,re.M)}
            # SharedPreferences briefly exposes its replacement file while committing.
            # Keep bounded read retries; a truncated observer read is not app corruption.
            for attempt in range(4):
                try:
                    hooks=ET.fromstring(raw('cat '+base+'/shared_prefs/hook-processes.xml'));break
                except (ET.ParseError,RuntimeError):
                    if attempt==3:raise
                    sample['telemetryReadRetries']=attempt+1;time.sleep(.15)
            sample['telemetry']={}
            for element in hooks:
                if element.tag!='string':continue
                value=json.loads(element.text);name=value.get('process');pid=value.get('pid')
                expected=sample['processes'].get('system_server' if name=='system' else name,{})
                if expected.get('pid')!=pid:continue
                delivery=value.get('detailDelivery',{})
                sample['telemetry'][name]={'pid':pid,'version':value.get('moduleVersion'),'snapshotAt':value.get('snapshotAt'),
                    'receivedAt':value.get('receivedAt'),'pendingEvents':delivery.get('pendingEvents'),'failure':delivery.get('currentPublishFailureReason'),
                    'reportedHooks':len(value.get('hooks',[])),'coverage':value.get('hookCoverage'),
                    'moduleThrows':sum(h.get('moduleCallbackThrows',0) for h in value.get('hooks',[]))}
            if index%10==0 or due==args.seconds:
                folder=out/('detail-'+str(index));folder.mkdir(exist_ok=True)
                for name,command in [('power','dumpsys power'),('jobs','dumpsys jobscheduler '+package),
                                     ('alarms','dumpsys alarm'),('thermal','dumpsys thermalservice'),
                                     ('memory-module','dumpsys meminfo '+package),('memory-systemui','dumpsys meminfo com.android.systemui')]:
                    (folder/(name+'.txt')).write_text(shell(command,True),encoding='utf-8')
            if sample['battery'].get('temperature',0)>=450:
                (out/'temperature-alert.json').write_text(json.dumps(sample['battery']),encoding='utf-8')
        except Exception as error:
            sample['errors'].append(type(error).__name__+': '+str(error));errors.append({'index':index,'error':sample['errors']})
        sample['samplingSeconds']=round(time.monotonic()-start-sample['elapsedSeconds'],3)
        encoded=json.dumps(sample,ensure_ascii=False)
        with (out/'samples.jsonl').open('a',encoding='utf-8') as f:f.write(encoded+'\n')
        (out/'latest.json').write_text(encoded,encoding='utf-8')
        if index%5==0 or sample['errors']:print('resource observer',index,'elapsed',round(sample['elapsedSeconds']),'phase',sample['phase'],'errors',sample['errors'],flush=True)
        if due>=args.seconds:break
        index+=1
    (out/'observer-complete.json').write_text(json.dumps({'finishedUtc':stamp(),'seconds':round(time.monotonic()-start,3),'samples':index+1,'errors':errors},indent=2),encoding='utf-8')
    print('OBSERVER_COMPLETE',index+1,'samples',flush=True)

if __name__=='__main__':main()
