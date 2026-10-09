"""Opt-in, one right-gesture diagnostic with a nonce-bound 20 s Perfetto session.

No device access on import or without --run/--restore-only. Never a feature pass.
Uses the existing native runner only for its full configuration recovery helpers.
"""
from pathlib import Path
import argparse, base64, contextlib, datetime, hashlib, importlib.util, json, os, re, shlex, subprocess, time, traceback, uuid
import xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1]
AUDIT=ROOT/'out/full-function-audit-20261004'
APP='/data/user/0/ls.augment.com/'
HASHES=['11b8f83aea744f2b9811ad62146ec93a57ba69305d48357d45a6b6c8d81b19d8','d64d63c9425a3d6b0e0fb0ef1d88ddf607f6452a4c94591de65d45ca58d34589']
NATIVE={'system':['gesture_visual_feedback','font_scale','accelerometer_rotation','user_rotation','use_control_panel'],
        'secure':['navigation_mode','sysui_qs_tiles'],'global':['wifi_on','bluetooth_on']}
EVENTS=['sched/sched_switch','sched/sched_waking','sched/sched_blocked_reason','binder/binder_transaction','binder/binder_transaction_received']

def load(name,file):
    spec=importlib.util.spec_from_file_location(name,ROOT/'tools'/file)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module

safe=load('single_trace_native','run-safe-native-function-device.py')
def atomic(p,v):safe.atomic(Path(p),v)
def sha(data):return hashlib.sha256(data).hexdigest()
def difference(a,b):return {k:{'before':a.get(k),'after':b.get(k)} for k in a.keys()|b.keys() if a.get(k)!=b.get(k)}
def run_id(value):
    if not re.fullmatch('[a-f0-9]{32}',value):raise ValueError('Invalid run ID')
    return value

def thread_records(raw,pid):
    lines=raw.splitlines();records=[];errors=[];i=0
    while i<len(lines):
        marker=re.fullmatch(r'THREAD=([1-9][0-9]*)',lines[i])
        if not marker:errors.append({'line':i,'reason':'missing thread delimiter'});i+=1;continue
        tid=marker[1]
        if i+2>=len(lines) or lines[i+1].startswith('THREAD=') or lines[i+2].startswith('THREAD='):
            errors.append({'tid':tid,'reason':'thread exited during read'});i+=1;continue
        comm,stat=lines[i+1],lines[i+2];parts=stat.rsplit(') ',1)
        if len(parts)!=2 or not stat.startswith(tid+' (') or len(parts[1].split())<20:
            errors.append({'tid':tid,'reason':'stat unavailable or malformed'})
        else:records.append({'tid':int(tid),'comm':comm,'startTicks':parts[1].split()[19]})
        i+=3
    if not any(r['tid']==int(pid) for r in records):raise RuntimeError('Main process thread is missing from bounded thread inventory')
    return {'threads':records,'transientReadErrors':errors,'readScope':'comm and stat startTicks only; no stack sampling'}

def session_rows(raw):
    header=re.search(r'Tracing sessions:\s*(\d+)\s*\(started:\s*(\d+)\)',raw)
    if not header or 'TRACING SESSIONS:' not in raw:raise RuntimeError('Unrecognized Perfetto query; fail closed')
    rows=[]
    for line in raw.split('TRACING SESSIONS:',1)[1].splitlines():
        fields=line.split()
        if fields and fields[0].isdigit():rows.append({'id':int(fields[0]),'fields':fields,'name':fields[-1]})
    if len(rows)!=int(header[1]):raise RuntimeError('Incomplete Perfetto session table')
    return {'total':int(header[1]),'started':int(header[2]),'rows':rows}

def trace_config(identity):
    run_id(identity)
    events='\n'.join('      ftrace_events: "'+v+'"' for v in EVENTS)
    return ('unique_session_name: "lsa_gesture_'+identity+'"\n'
        'duration_ms: 20000\nbuffers { size_kb: 32768 fill_policy: RING_BUFFER }\n'
        'data_sources { config { name: "linux.ftrace" ftrace_config {\n'+events+'\n'
        '      atrace_categories: "input"\n      atrace_categories: "view"\n      atrace_categories: "gfx"\n'
        '      atrace_categories: "wm"\n      atrace_categories: "dalvik"\n      atrace_categories: "binder_driver"\n'
        '      atrace_apps: "ls.augment.com"\n      atrace_apps: "com.android.systemui"\n'
        '      atrace_apps: "system_server"\n      atrace_apps: "com.zte.floatassist"\n'
        '      atrace_apps: "/system/bin/surfaceflinger"\n    } } }\n'
        'data_sources { config { name: "linux.process_stats" process_stats_config { scan_all_processes_on_start: true } } }\n')

def ready_valid(ready,identity,version,pid,now):
    ack=ready.get('runtimeAck','').split(';')
    return (ready.get('schema')==1 and ready.get('runId')==identity and re.fullmatch('[a-f0-9]{32}',str(ready.get('nonce',''))) is not None
        and ready.get('side')==1 and ready.get('width')==1216 and ready.get('height')==2688
        and isinstance(ready.get('readyElapsed'),int) and 0<=now-ready['readyElapsed']<=8000
        and len(ack)==11 and ack[0]=='BG1' and ack[4]==str(pid) and ack[5]==str(version) and ack[8]=='ready'
        and ack[9]==ack[10]=='15' and re.fullmatch('[a-f0-9]{64}',ack[2]) is not None)

def gate_for(ready,identity,lease,start,started,issued):
    if not start>=ready['readyElapsed'] or not start<=started<=issued or issued-start>14000 or issued-ready['readyElapsed']>8000:
        raise RuntimeError('Trace startup did not leave the declared bounded window; no gate published')
    return dict(schema=1,runId=identity,nonce=ready['nonce'],side=1,runtimeAck=ready['runtimeAck'],readyElapsed=ready['readyElapsed'],
        tracePid=int(lease['pid']),traceStartTicks=lease['startTicks'],sessionName='lsa_gesture_'+identity,dataSourcesStarted=True,
        traceStartBeforeElapsed=start,traceStartedAckElapsed=started,issuedElapsed=issued,expiresElapsed=start+20000)

def classify(evidence,identity,gate):
    if evidence.get('diagnosticOnly') is not True or evidence.get('traceRunId')!=identity or evidence.get('traceProbe')!='right-custom-baseline':
        raise RuntimeError('Diagnostic output identity mismatch')
    downs=[a for a in evidence.get('actions',[]) if a.get('action')==0]
    screens=evidence.get('screenshots',[])
    if len(downs)>1 or len(screens)>1 or any(s.get('side')!='right' for s in screens):raise RuntimeError('Diagnostic violated single-right-only contract')
    if not downs:return {'status':'not-observed','reason':'No DOWN; prerequisite/gate refused','actualDownCount':0,'nativeTerminalConfirmed':False}
    if len(screens)!=1:raise RuntimeError('A DOWN has no durable sample; native terminal unknown')
    s=screens[0];p=s.get('nativeProbe',{});h=p.get('head',{});down=downs[0]['downTime']
    if not gate or s.get('traceRunId')!=identity or s.get('traceGate')!=gate or p.get('expectedNonce')!=gate['nonce']:
        raise RuntimeError('Sample is not bound to this host trace gate')
    ack=gate['runtimeAck'].split(';')
    identity_match=(len(ack)==11 and s.get('runtimeAck')==gate['runtimeAck'] and h.get('side')==1 and
        all(str(h.get(k))==ack[j] for j,k in ((1,'revision'),(3,'generation'),(4,'pid'),(5,'build'),(7,'processStarted'))))
    terminal=(identity_match and p.get('terminalConfirmed') is True and h.get('nonce')==gate['nonce'] and h.get('downTime')==down
        and h.get('phase')=='cancelled' and h.get('cancelReceived',0)>=down and h.get('cancelReturned',0)>=h.get('cancelReceived',0))
    valid=(terminal and p.get('matched') is True and p.get('diagnosticComplete') is True
        and h['cancelReceived']-down<=350 and h['cancelReturned']-down<=350 and p.get('nativeStationaryBeforeFirst') is True
        and s.get('shortTimelineObserved') is True and s.get('stable') is True and not s.get('shortcutVisibleAfterCancel')
        and s.get('nativeTerminalBeforeUi') is True and s.get('launcherRecovered') is True)
    return {'status':'diagnostic-valid-sample' if valid else 'diagnostic-rejected-sample','actualDownCount':1,
        'nativeTerminalConfirmed':terminal,'effectSampleValid':valid,'wholeFeaturePassed':False,
        'nativeCancelReceivedMs':h.get('cancelReceived',down)-down,'nativeCancelReturnedMs':h.get('cancelReturned',down)-down}

class Collector:
    def __init__(self,ar,folder,journal,report):
        self.ar,self.folder,self.journal,self.report=ar,folder,journal,report
        self.runner=safe.Runner(ar,folder,journal,report);self.child=None
        self.identity=run_id(journal.data['metadata']['runId']);self.label='gesture-trace-'+self.identity
        self.remote='/storage/emulated/0/Android/data/ls.augment.com/files/back-gesture-tests/'+self.label
        self.config_path='/data/local/tmp/lsa-gesture-'+self.identity+'.pbtxt'
        self.trace_path='/data/misc/perfetto-traces/lsa-gesture-'+self.identity+'.perfetto-trace'
    def persist(self):self.runner.persist();self.journal.save()
    def identity_current(self,label):
        expected=self.journal.data['metadata'];observed={}
        try:
            dump=self.ar.shell('dumpsys package ls.augment.com')
            code=re.search(r'\bversionCode=(\d+)',dump);name=re.search(r'\bversionName=(\S+)',dump)
            observed={'installedVersion':int(code[1]) if code else None,'installedVersionName':name[1] if name else None,
                'mainApkSha256':package_hash(self.ar,'ls.augment.com'),'testApkSha256':package_hash(self.ar,'ls.augment.com.test'),
                'systemuiIdentity':self.process_identity(self.ar.shell('pidof com.android.systemui'))}
            mismatch={k:{'expected':expected.get(k),'actual':v} for k,v in observed.items() if expected.get(k)!=v}
            atomic(self.folder/(label+'-identity.json'),{'observed':observed,'differences':mismatch})
            if mismatch:raise RuntimeError('Original APK/process identity changed; no new diagnostic or unreviewed recovery')
        except Exception as error:
            self.journal.data['identityError']=str(error);self.journal.data['pending']=True;self.persist();raise
        return observed
    def uptime(self):
        raw=self.ar.shell('cat /proc/uptime').split()
        if len(raw)!=2 or not re.fullmatch(r'\d+\.\d+',raw[0]):raise RuntimeError('Device elapsed clock unavailable')
        return int(float(raw[0])*1000)
    def sessions(self):
        raw=self.ar.shell('perfetto --query --long',root=True);return session_rows(raw),raw
    def idle_instrumentation(self):
        # Reuse the audited Android36 full-report parser; never the unsupported subcommand.
        module=load('single_trace_instrumentation','run-c17-summary-assets-device.py')
        state=module.instrumentation_state(self.ar.shell('dumpsys activity',timeout=40))
        if state['state']!='idle':raise RuntimeError('Instrumentation is active; no concurrent start or recovery')
    def record_threads(self):
        inventory={}
        for process in ('com.android.systemui','system_server','com.zte.floatassist','surfaceflinger'):
            pid=self.ar.shell('pidof '+process)
            before=self.process_identity(pid)
            command='for t in /proc/'+pid+'/task/[0-9]*; do if test -r "$t/comm" && test -r "$t/stat"; then printf "THREAD=%s\\n" "${t##*/}"; cat "$t/comm"; cat "$t/stat"; fi; done'
            raw=self.ar.shell(command,root=True)
            (self.folder/('threads-'+process+'-private.txt')).write_text(raw,encoding='utf-8')
            after=self.process_identity(pid)
            if before!=after:raise RuntimeError('Process replaced during pre-instrumentation thread inventory')
            inventory[process]={'processIdentity':before,**thread_records(raw,pid)}
        atomic(self.folder/'thread-identities-private.json',inventory)
    def process_identity(self,pid):
        if not re.fullmatch('[1-9][0-9]*',str(pid)):raise RuntimeError('Ambiguous process PID')
        raw=self.ar.shell('cat /proc/'+str(pid)+'/stat',root=True);parts=raw.rsplit(') ',1)
        if len(parts)!=2 or not raw.startswith(str(pid)+' (') or len(parts[1].split())<20:raise RuntimeError('Process identity unreadable')
        return {'pid':str(pid),'startTicks':parts[1].split()[19], 'bootId':self.ar.shell('cat /proc/sys/kernel/random/boot_id')}
    def write_remote(self,path,data):
        allowed={self.config_path,self.remote+'/trace-gate.json'}
        if path not in allowed:raise RuntimeError('Refuse unrelated remote write')
        encoded=base64.b64encode(data).decode();q=shlex.quote(path)
        self.ar.shell('test ! -e '+q+' && test ! -e '+q+'.tmp && umask 022 && printf %s '+shlex.quote(encoded)+' | base64 -d > '+q+'.tmp && mv '+q+'.tmp '+q,root=True)
    def protection(self):
        resources={}
        for name in ('statusbar-assets','fonts','statusbar-pack-notices','launcher-icons'):
            directory=APP+'files/'+name
            raw=self.ar.shell('if test -L '+directory+'; then echo REFUSE_LINK; elif test -d '+directory+'; then find '+directory+' -maxdepth 1 -type f -exec sha256sum {} \\; ; fi',root=True)
            for line in raw.splitlines():
                m=re.fullmatch(r'([a-f0-9]{64})\s+('+re.escape(directory)+r'/[a-f0-9]{64}\.(?:asset|json|font|png))',line)
                if not m:raise RuntimeError('Resource is unknown or being changed; preserve it')
                resources[m[2]]=m[1]
            if self.ar.shell('if test -d '+directory+'; then find '+directory+' -maxdepth 1 -type l; fi',root=True):raise RuntimeError('Resource symlink present')
        path=APP+'shared_prefs/statusbar_asset_names.xml'
        raw=self.ar.shell('if test -e '+path+'.bak; then echo PENDING; elif test -f '+path+'; then cat '+path+'; else echo ABSENT; fi',root=True)
        if raw=='ABSENT':names={}
        else:
            tree=ET.fromstring(raw)
            if tree.tag!='map' or any(n.tag!='string' for n in tree) or len({n.get('name') for n in tree})!=len(tree):raise RuntimeError('Unknown resource-name state')
            names={n.get('name'):n.text or '' for n in tree}
        native={ns+'/'+key:self.ar.shell('settings --user 0 get '+ns+' '+key) for ns,keys in NATIVE.items() for key in keys}
        return {'resources':resources,'names':names,'native':native}
    def start_trace(self,ready):
        sessions,raw=self.sessions()
        if sessions['total']!=0:raise RuntimeError('Another trace is active; no session started')
        config=trace_config(self.identity).encode();(self.folder/'trace-config.pbtxt').write_bytes(config)
        self.journal.data['traceConfigWriteAttempted']=True;self.persist()
        self.write_remote(self.config_path,config)
        self.journal.data['traceConfigWritten']=True;self.persist()
        if self.ar.shell('if test -e '+self.trace_path+'; then echo EXISTS; fi',root=True):raise RuntimeError('Unique trace output already exists')
        start=self.uptime();self.journal.data.update(traceStartBeforeElapsed=start,traceLaunchAttempted=True);self.persist()
        raw=self.ar.shell('perfetto --background-wait --txt -c '+self.config_path+' -o '+self.trace_path,root=True,timeout=10)
        (self.folder/'trace-start.txt').write_text(raw,encoding='utf-8')
        if not re.fullmatch(r'\s*[1-9][0-9]*\s*',raw):raise RuntimeError('Perfetto background startup did not return one PID; gate withheld')
        lease=self.process_identity(raw.strip());self.journal.data['traceLease']=lease;self.persist()
        cmdline=self.ar.shell('cat /proc/'+lease['pid']+'/cmdline',root=True)
        if self.config_path not in cmdline or self.trace_path not in cmdline:raise RuntimeError('Returned trace PID does not own requested paths')
        sessions,raw=self.sessions();(self.folder/'trace-active-query.txt').write_text(raw,encoding='utf-8')
        if sessions['total']!=1 or sessions['started']!=1 or sessions['rows'][0]['name']!='lsa_gesture_'+self.identity or sessions['rows'][0]['fields'][2]!='STARTED':raise RuntimeError('This named trace is not confirmed active; gate withheld')
        started=self.uptime();gate=gate_for(ready,self.identity,lease,start,started,self.uptime())
        self.journal.data['gate']=gate;self.persist()
        # Last host operation before the gesture. No dumps/window reads or polling after delivery.
        self.write_remote(self.remote+'/trace-gate.json',json.dumps(gate,separators=(',',':')).encode())
        self.journal.data['gateDelivered']=True;self.persist()
    def run(self):
        self.identity_current('before-run')
        self.idle_instrumentation()
        self.record_threads()  # One pre-instrumentation snapshot; never polled during input.
        args='am instrument -w -r -e operation back-gesture-customization -e traceProbe right-custom-baseline -e traceRunId '+self.identity+' -e label '+self.label+' ls.augment.com.test/ls.augment.com.DeviceRegressionRunner'
        self.journal.touch(self.journal.data['ownedExpected'])
        self.journal.data['instrumentationAttempted']=True;self.persist()
        failure=None
        with (self.folder/'instrumentation.txt').open('wb') as output:
            self.child=subprocess.Popen([str(self.ar.ADB),'-s',self.ar.SERIAL,'shell',args],stdout=output,stderr=subprocess.STDOUT,
                creationflags=getattr(subprocess,'CREATE_NO_WINDOW',0))
            ready=None;until=time.monotonic()+45
            try:
                while time.monotonic()<until and self.child.poll() is None:
                    raw=self.ar.shell('if test -f '+self.remote+'/trace-ready.json; then cat '+self.remote+'/trace-ready.json; fi',root=True)
                    if raw:
                        ready=json.loads(raw);atomic(self.folder/'trace-ready.json',ready)
                        if not ready_valid(ready,self.identity,self.journal.data['metadata']['installedVersion'],self.journal.data['systemuiPid'],self.uptime()):raise RuntimeError('Ready identity/current build/nonce/clock invalid; no gate')
                        self.start_trace(ready);break
                    time.sleep(.12)
                if ready is None:raise RuntimeError('No matching ready handshake; no trace or gate issued')
            except BaseException as error:failure=error
            finally:
                # Wait for this single instrumentation to exit. Never terminate it, inject recovery,
                # query windows, or launch another instrumentation while native input is unknown.
                self.report['instrumentationExitCode']=self.child.wait(timeout=35)
        self.idle_instrumentation()
        raw=self.ar.shell('cat '+self.remote+'/evidence.json',root=True);evidence=json.loads(raw)
        pixels=self.folder/'gesture-pixels';self.ar.adb('pull',self.remote,str(pixels),timeout=90)
        self.report['diagnostic']=classify(evidence,self.identity,self.journal.data.get('gate'));self.report['gesturePixelDirectory']=str(pixels)
        self.persist()
        if failure is not None:raise failure
    def stop_trace(self):
        sessions,raw=self.sessions();own=[x for x in sessions['rows'] if x['name']=='lsa_gesture_'+self.identity]
        if own:
            if len(own)!=1:raise RuntimeError('Ambiguous named trace session; refuse signal')
            lease=self.journal.data.get('traceLease')
            if not lease:raise RuntimeError('Own session exists without confirmed process lease; wait its fixed duration and use restore-only')
            if self.process_identity(lease['pid'])!=lease:raise RuntimeError('Trace PID identity changed; refuse signal')
            self.ar.shell('kill -TERM '+lease['pid'],root=True)
            for _ in range(30):
                sessions,raw=self.sessions()
                if not any(x['name']=='lsa_gesture_'+self.identity for x in sessions['rows']):break
                time.sleep(.1)
            else:raise RuntimeError('Owned trace did not stop')
        (self.folder/'trace-final-query.txt').write_text(raw,encoding='utf-8')
        self.journal.data['traceStopped']=True
        exists=self.ar.shell('if test -f '+self.trace_path+'; then echo EXISTS; fi',root=True)
        if exists and not self.journal.data.get('traceLaunchAttempted'):raise RuntimeError('Trace file exists without owned launch; preserve it')
        if exists and self.journal.data.get('traceLaunchAttempted'):
            if self.ar.shell('if test -L '+self.trace_path+'; then echo LINK; fi',root=True):raise RuntimeError('Trace path became a symlink; preserve it')
            expected=self.ar.shell('sha256sum '+self.trace_path,root=True).split()[0]
            data=self.ar.adb('exec-out','su -c '+shlex.quote('cat '+self.trace_path),timeout=60)
            if sha(data)!=expected:raise RuntimeError('Trace pull hash mismatch; preserve remote')
            local=self.folder/'gesture.perfetto-trace'
            with local.open('wb') as out:out.write(data);out.flush();os.fsync(out.fileno())
            if sha(local.read_bytes())!=expected:raise RuntimeError('Persisted local trace hash mismatch; preserve remote')
            self.report['trace']={'sha256':expected,'bytes':len(data),'path':str(self.folder/'gesture.perfetto-trace'),'coverageReviewed':False}
            if self.ar.shell('sha256sum '+self.trace_path,root=True).split()[0]!=expected:raise RuntimeError('Remote trace changed after pull; preserve it')
            self.ar.shell('rm -- '+self.trace_path+' && test ! -e '+self.trace_path,root=True)
            self.journal.data['traceRemoteRemoved']=True
        if self.journal.data.get('traceConfigWritten') and self.ar.shell('if test -f '+self.config_path+'; then sha256sum '+self.config_path+'; fi',root=True):
            expected=sha(trace_config(self.identity).encode())
            if self.ar.shell('sha256sum '+self.config_path,root=True).split()[0]!=expected:raise RuntimeError('Owned trace config changed; preserve remote')
            self.ar.shell('rm -- '+self.config_path+' && test ! -e '+self.config_path,root=True)
        residues=[]
        for path in (self.config_path+'.tmp',self.remote+'/trace-gate.json.tmp'):
            if self.ar.shell('if test -e '+path+'; then echo EXISTS; fi',root=True):residues.append(path)
        self.journal.data['unknownTemporaryResidues']=residues
        if residues:raise RuntimeError('Interrupted temporary files retained for explicit review: '+str(residues))
        self.persist()
    def restore(self):
        errors=[]
        if self.child is not None and self.child.poll() is None:
            raise RuntimeError('Original instrumentation remains active; fixed-duration trace will expire; no polling/UI/second instrumentation issued')
        self.idle_instrumentation()
        self.identity_current('before-restore')
        try:self.stop_trace()
        except Exception as e:errors.append('trace: '+str(e))
        try:
            self.idle_instrumentation()
            current=self.runner.instrument('snapshot','restore-before')['settings'];base=self.journal.data['baseline']
            changed=difference(base,current);own=self.journal.data.get('ownedExpected',{})
            if any(k not in own for k in changed):raise RuntimeError('External configuration change; preserve it')
            actual={k:current[k] for k in own};prior={k:base[k] for k in own}
            if actual not in (prior,own):raise RuntimeError('Gesture values no longer match baseline or owned preset; preserve them')
            for _ in range(2):self.journal.restore_config(self.runner.instrument)
            protection=self.protection();atomic(self.folder/'after-protection.json',protection)
            if self.journal.data.get('protectionBefore') is not None and protection!=self.journal.data['protectionBefore']:raise RuntimeError('Original resources/names/native preferences differ; preserve data')
            self.journal.data['protectionRestored']=True
            if self.report.get('diagnostic',{}).get('nativeTerminalConfirmed'):
                (self.folder/'post-run-screen.png').write_bytes(self.ar.adb('exec-out','screencap','-p'))
                (self.folder/'post-run-activities-private.txt').write_text(self.ar.shell('dumpsys activity activities'),encoding='utf-8')
                (self.folder/'post-run-windows-private.txt').write_text(self.ar.shell('dumpsys window windows'),encoding='utf-8')
            self.identity_current('after-restore')
            final=self.runner.instrument('snapshot','restore-final-readback')['settings']
            mismatch=difference(base,final);self.journal.data['postSamplingConfigurationDifference']=mismatch
            if mismatch:
                self.journal.data['configurationRestored']=False
                raise RuntimeError('Configuration changed during final observations; preserve external values and recovery journal')
        except Exception as e:errors.append('restore: '+str(e))
        self.journal.data['pending']=bool(errors);self.journal.data['cleanupErrors']=errors
        self.report['restoration']={k:self.journal.data.get(k) for k in ('pending','configurationRestored','configurationDifferences','protectionRestored','traceStopped','cleanupErrors')}
        self.persist()
        if errors:raise RuntimeError('; '.join(errors))

def owned_preset():
    result={'ls_augment_systemui_master':'1','ls_augment_rm_back_icon_enabled':'1'}
    for side in ('left','right'):
        for field,value in dict(mode='1',asset=HASHES[0],background_asset=HASHES[1],background_scale_percent='100',scale_percent='200',opacity_percent='100',mirror='1' if side=='right' else '0',inset_dp='6',offset_y_dp='0').items():
            result['ls_augment_rm_back_icon_'+side+'_'+field]=value
    return result

def package_hash(ar,package):
    lines=ar.shell('pm path '+package).splitlines()
    if len(lines)!=1 or not lines[0].startswith('package:'):raise RuntimeError('Package APK path ambiguous: '+package)
    result=ar.shell('sha256sum '+shlex.quote(lines[0][8:]),root=True).split()[0]
    if not re.fullmatch('[a-f0-9]{64}',result):raise RuntimeError('APK hash missing')
    return result

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    mode=parser.add_mutually_exclusive_group(required=True);mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);parser.add_argument('--expected-test-sha',required=True)
    args=parser.parse_args()
    if not re.fullmatch('[a-f0-9]{64}',args.expected_test_sha):parser.error('Expected exact local/installed TestAPK SHA256')
    import adb_regression as ar
    package=ar.shell('dumpsys package ls.augment.com');v=re.search(r'\bversionCode=(\d+)',package);name=re.search(r'\bversionName=(\S+)',package)
    if not v or not name or int(v[1])!=args.expected_version:raise RuntimeError('Installed module mismatch')
    if package_hash(ar,'ls.augment.com.test')!=args.expected_test_sha:raise RuntimeError('Installed TestAPK differs')
    if args.restore_only:
        journal=safe.Journal(args.restore_only.resolve());folder=journal.path.parent
        if journal.data['metadata']['serial']!=ar.SERIAL:raise RuntimeError('Journal belongs to another device')
        report=json.loads((folder/'report.json').read_text('utf-8')) if (folder/'report.json').exists() else {'restoredFromJournal':True}
        Collector(ar,folder,journal,report).restore();return
    for path in AUDIT.rglob('restore.json'):
        if json.loads(path.read_text('utf-8')).get('pending'):raise RuntimeError('Resolve pending journal first: '+str(path))
    identity=uuid.uuid4().hex;folder=AUDIT/('gesture-trace-%d-%s-%s'%(args.expected_version,datetime.datetime.now().strftime('%Y%m%d-%H%M%S'),identity[:8]))
    folder.mkdir(parents=True,exist_ok=False);ar.OUTPUT=folder
    # Read-only preconditions precede the write-ahead journal.
    if ar.shell('am get-current-user')!='0':raise RuntimeError('Primary Android user required')
    module=load('single_trace_idle','run-c17-summary-assets-device.py')
    if module.instrumentation_state(ar.shell('dumpsys activity'))['state']!='idle':raise RuntimeError('Another instrumentation is active')
    if session_rows(ar.shell('perfetto --query --long',root=True))['total']:raise RuntimeError('Another trace is active')
    if not ar.projection_is_idle(ar.shell('dumpsys media_projection')):raise RuntimeError('Projection state not explicitly idle')
    if ar.adb('shell','pidof com.android.ztescreenshot',check=False).strip():raise RuntimeError('Native capture process active')
    available=ar.shell('cat /sys/kernel/tracing/available_events',root=True)
    if not all(x.replace('/',':') in available.splitlines() for x in EVENTS):raise RuntimeError('Required trace events not available')
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as log:
        with contextlib.redirect_stdout(log):baseline=ar.instrument('snapshot','baseline')
    if baseline['moduleVersion']!=args.expected_version or len(baseline['settings'])!=497:raise RuntimeError('Test build/schema differs from planned 497-key baseline')
    main_hash=package_hash(ar,'ls.augment.com')
    reader=object.__new__(Collector);reader.ar=ar
    process=reader.process_identity(ar.shell('pidof com.android.systemui'))
    journal=safe.Journal(folder/'restore.json',baseline['settings'],dict(serial=ar.SERIAL,installedVersion=args.expected_version,installedVersionName=name[1],runId=identity,
        testApkSha256=args.expected_test_sha,mainApkSha256=main_hash,systemuiIdentity=process))
    report={'diagnosticOnly':True,'wholeFeaturePassed':False,'runId':identity,'mainApkSha256':main_hash,'testApkSha256':args.expected_test_sha}
    c=Collector(ar,folder,journal,report);failure=None
    try:
        if not c.runner.runtime_current('com.android.systemui','preflight'):raise RuntimeError('SystemUI has not loaded current module')
        journal.data['systemuiPid']=ar.shell('pidof com.android.systemui')
        journal.data['ownedExpected']=owned_preset()
        journal.data['protectionBefore']=c.protection();atomic(folder/'before-protection.json',journal.data['protectionBefore'])
        for h in HASHES:
            if journal.data['protectionBefore']['resources'].get(APP+'files/launcher-icons/'+h+'.png')!=h:raise RuntimeError('Bundled preset not already present; this trace must not import new resource content')
        c.persist();c.run()
    except BaseException as error:failure=error;report['error']=traceback.format_exc();c.persist()
    finally:
        # If no test-side mutation was authorized, do not invent a restore prerequisite.
        if not journal.data.get('instrumentationAttempted'):
            journal.data['pending']=False;journal.data['configurationRestored']=True;c.persist()
        else:
            try:c.restore()
            except Exception as error:
                report['restoreError']=str(error);c.persist()
                if failure is None:failure=error
        print(json.dumps({'report':str(folder/'report.json'),'pending':journal.data['pending'],'diagnostic':report.get('diagnostic')},ensure_ascii=False))
    if failure:raise failure

if __name__=='__main__':main()
