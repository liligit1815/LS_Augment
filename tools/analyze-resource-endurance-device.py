"""Summarize bounded real-device samples without equating normal RSS/cache changes to leaks."""
from pathlib import Path
import argparse,csv,json,statistics,datetime

def slope(points):
    if len(points)<2:return 0
    xs,ys=zip(*points);xm=statistics.mean(xs);ym=statistics.mean(ys)
    den=sum((x-xm)**2 for x in xs)
    return round(sum((x-xm)*(y-ym) for x,y in points)/den*60,3) if den else 0

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('directory',type=Path);parser.add_argument('--continuation',type=Path)
    args=parser.parse_args();root=args.directory.resolve()
    clock_ticks=json.loads((root/'identity.json').read_text(encoding='utf-8'))['clockTicksPerSecond']
    samples=[json.loads(line) for line in (root/'samples.jsonl').read_text(encoding='utf-8').splitlines() if line]
    if args.continuation:
        extra=[json.loads(line) for line in (args.continuation/'samples.jsonl').read_text(encoding='utf-8').splitlines() if line]
        offset=(datetime.datetime.fromisoformat(extra[0]['utc'])-datetime.datetime.fromisoformat(samples[0]['utc'])).total_seconds()-extra[0]['elapsedSeconds']
        assert offset>samples[-1]['elapsedSeconds'],'Observations overlap or host clock moved backwards'
        base=len(samples)
        for sample in extra:
            sample['sourceIndex']=sample['index'];sample['sourceSegment']='continuation';sample['index']+=base;sample['elapsedSeconds']+=offset
        samples.extend(extra)
    report={'samples':len(samples),'observedSeconds':samples[-1]['elapsedSeconds']-samples[0]['elapsedSeconds'],
            'bootIds':sorted(set(s.get('bootId','') for s in samples)),
            'errors':[{'index':s['index'],'errors':s['errors']} for s in samples if s.get('errors')],
            'maxBatteryC':max(s.get('battery',{}).get('temperature',0) for s in samples)/10,
            'phases':{},'allProcessPids':{},'telemetryErrors':[],'processReadErrors':[]}
    for sample in samples:
        phase=sample['phase'].lstrip('\ufeff')
        # An early orchestration label preceded discovery that Android restarts the target
        # when instrumentation ends. PID evidence, never that label, defines continuity.
        if phase=='post-stress-same-process-idle':phase='post-instrumentation-idle'
        report['phases'].setdefault(phase,[]).append(sample)
        for name,item in sample['processes'].items():
            if 'pid' in item:report['allProcessPids'].setdefault(name,set()).add(item['pid'])
            if 'error' in item:report['processReadErrors'].append({'index':sample['index'],'name':name,'error':item['error']})
        for name,item in sample.get('telemetry',{}).items():
            if item.get('failure') or item.get('moduleThrows'):
                report['telemetryErrors'].append({'index':sample['index'],'name':name,'evidence':item})
    report['allProcessPids']={name:sorted(pids) for name,pids in report['allProcessPids'].items()}
    for phase,rows in list(report['phases'].items()):
        summary={'samples':len(rows),'firstSeconds':rows[0]['elapsedSeconds'],'lastSeconds':rows[-1]['elapsedSeconds'],
                 'moduleKiB':{'first':rows[0].get('moduleKiB'),'last':rows[-1].get('moduleKiB'),'min':min(r.get('moduleKiB',0) for r in rows),'max':max(r.get('moduleKiB',0) for r in rows)},
                 'processes':{},'logBytes':{}}
        for name in report['allProcessPids']:
            for pid in report['allProcessPids'][name]:
                points=[(r['elapsedSeconds'],r['processes'].get(name,{})) for r in rows if r['processes'].get(name,{}).get('pid')==pid and 'rssKiB' in r['processes'].get(name,{})]
                if not points:continue
                first,last=points[0][1],points[-1][1];seconds=points[-1][0]-points[0][0]
                item={'pid':pid,'sampleCount':len(points),'seconds':seconds,
                      'cpuOneCorePercent':round((last['cpuTicks']-first['cpuTicks'])*100/(clock_ticks*seconds),4) if seconds else None,
                      'rssKiB':{'first':first['rssKiB'],'last':last['rssKiB'],'min':min(p['rssKiB'] for _,p in points),'max':max(p['rssKiB'] for _,p in points),
                                'slopeKiBPerMinute':slope([(t,p['rssKiB']) for t,p in points])},
                      'threads':{'first':first['threads'],'last':last['threads'],'min':min(p['threads'] for _,p in points),'max':max(p['threads'] for _,p in points)},
                      'fds':{'first':first['fdCount'],'last':last['fdCount'],'min':min(p['fdCount'] for _,p in points),'max':max(p['fdCount'] for _,p in points)},
                      'workerCpuTicks':{}}
                for tid,worker in last.get('workers',{}).items():
                    old=first.get('workers',{}).get(tid)
                    if old:item['workerCpuTicks'][worker['name']]=worker['cpuTicks']-old['cpuTicks']
                summary['processes'][name+':'+str(pid)]=item
        for file in sorted(set().union(*(set(r.get('fileSizes',{})) for r in rows))):
            if not file.endswith('.log'):continue
            sizes=[r['fileSizes'][file] for r in rows if file in r.get('fileSizes',{})]
            summary['logBytes'][file]={'first':sizes[0],'last':sizes[-1],'max':max(sizes)}
        summary['exportFileCountMax']=max(len(r.get('exportBytes',[])) for r in rows)
        report['phases'][phase]=summary
    report['limitations']=['RSS includes mapped/shared pages and cache; slope alone does not identify a leak.',
                          'The observer creates ADB/shell traffic; core-process totals are not exclusively module CPU.',
                          'Only this Android 16 device is real-device evidence; no forced GC was used.',
                          'Instrumentation launches/installations restart the module app; compare each PID separately.']
    (root/'resource-summary.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
    with (root/'resource-samples.csv').open('w',newline='',encoding='utf-8-sig') as stream:
        writer=csv.writer(stream);writer.writerow(['utc','elapsedSeconds','phase','process','pid','rssKiB','cpuTicks','threads','fds','moduleAllocatedKiB','batteryC','exportFiles'])
        for row in samples:
            for name,item in row['processes'].items():
                writer.writerow([row['utc'],row['elapsedSeconds'],row['phase'].lstrip('\ufeff'),name,item.get('pid'),item.get('rssKiB'),item.get('cpuTicks'),item.get('threads'),item.get('fdCount'),row.get('moduleKiB'),row.get('battery',{}).get('temperature',0)/10,len(row.get('exportBytes',[]))])
    print(json.dumps({'samples':report['samples'],'seconds':report['observedSeconds'],'phases':list(report['phases']),'maxBatteryC':report['maxBatteryC'],'errors':report['errors']},ensure_ascii=False))

if __name__=='__main__':main()
