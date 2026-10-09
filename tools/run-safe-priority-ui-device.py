"""Finite NEW-12 UI-order audit only. Imports are offline; no native writes."""
from pathlib import Path
import argparse, datetime, importlib.util, json, re, time, traceback, uuid

ROOT=Path(__file__).resolve().parents[1]
def load(name,file):
    spec=importlib.util.spec_from_file_location(name,ROOT/'tools'/file)
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
icons=load('priority_readonly_observation','run-safe-statusbar-notification-icons-device.py')
rows,core,base,extra=icons.rows,icons.core,icons.base,icons.extra
atomic,difference=core.atomic,core.difference
PR,LIMIT,ORDER=['ls_augment_statusbar_hint_'+x for x in ('priority','limit','order')]
KEYS={PR,LIMIT,ORDER};APP='ls.augment.com';GRID='ls_augment_statusbar_grid_v2'
IDS='privacy.camera,privacy.microphone,privacy.projection,privacy.location,vpn,screen_record,cast,connected_display,location,sensors_off,zen,mute,volume,alarm_clock,bluetooth,headset,nfc,hotspot,airplane,data_saver,managed_profile,rotate,tty,cooling_fan,liquid_cooling,refresh_rate'.split(',')
TITLES={'volume':'音量 / 振动','bluetooth':'蓝牙','cooling_fan':'散热风扇','nfc':'NFC'}
OPEN='am start -W -n ls.augment.com/.StatusBarSettingsActivity --es module_route status_icons --es status_component system_icons'
EDITOR_ACTIVITY=APP+'/.StatusBarSettingsActivity'
ENTRY_POLICY='development-root-exact-priority-editor-v1'


def valid_value(key,value):
    if not isinstance(value,str):return False
    if key==PR:return value in ('0','1')
    if key==LIMIT:return bool(re.fullmatch('0|[1-9][0-9]*',value)) and 0<=int(value)<=20
    if key==ORDER:
        ids=value.split(',') if value else []
        return len(value)<=2048 and len(ids)==len(set(ids)) and all(x in IDS for x in ids)
    return False


def order(raw):
    if not valid_value(ORDER,raw):raise core.Unobserved('Non-canonical priority order; do not normalize user data')
    return list(dict.fromkeys((raw.split(',') if raw else [])+IDS))


def moved(raw,identity,action):
    ids=order(raw);index=ids.index(identity)
    target={'上移一位':max(0,index-1),'下移一位':min(len(ids)-1,index+1),'置于首位':0}[action]
    ids.pop(index);ids.insert(target,identity);return ','.join(ids)


def grid_roundtrip(raw):
    """Reject any input changed by the production parse->serialize path."""
    ids='clock,notifications,system_icons,battery,cpu,gpu,battery_temp,current,power,network'.split(',')
    parts=raw.split(';')
    if len(parts)!=11 or parts[0]!='SG2':return False
    parsed={}
    for line in parts[1:]:
        p=line.split(',')
        if len(p)!=5 or p[0] not in ids or p[0] in parsed or p[1] not in ('L1','L2','LS','C1','C2','CS','R1','R2','RS') or p[4] not in ('0','1'):return False
        if not re.fullmatch(r'0|[1-9][0-9]*',p[2]) or not re.fullmatch(r'[1-9][0-9]*',p[3]) or not 0<=int(p[2])<=99 or not 6<=int(p[3])<=32:return False
        parsed[p[0]]=p
    return raw=='SG2;'+ ';'.join(','.join(parsed[i]) for i in ids)


class Journal(core.Journal):
    KIND='safe-statusbar-priority-ui'
    def validate(self):
        d=self.data;m=d.get('metadata',{});b=d.get('baseline',{})
        if d.get('kind')!=self.KIND or d.get('schema')!=1 or m.get('case')!='priority-ui':raise ValueError('Foreign UI journal')
        if len(b)!=497 or not all(isinstance(k,str) and isinstance(v,str) for k,v in b.items()) or not KEYS<=b.keys():raise ValueError('Complete497 required')
        if not all(valid_value(k,b[k]) for k in KEYS) or not grid_roundtrip(b.get(GRID,'')):raise ValueError('Original config would normalize')
        required=('serial','installedVersion','installedVersionName','mainApkSha256','testApkSha256','observerApkSha256','process','nativeBaseline','notificationsBefore','homeComponent','runId','rawBaseline','runtimeSchema')
        if any(k not in m for k in required):raise ValueError('Incomplete identity baseline')
        if not all(isinstance(d.get(k),dict) for k in ('resourcesBefore','namesBefore','targets')) or d['targets']:raise ValueError('Resources/names required; assets never mutable')
        for field in ('restore','confirmed','inflight'):
            if not isinstance(d.get(field),dict) or not set(d[field])<=KEYS:raise ValueError('Foreign key')
        if not set(d['confirmed'])<=d['restore'].keys() or not set(d['inflight'])<=d['restore'].keys():raise ValueError('Ownership without original')
        if any(v!=b[k] for k,v in d['restore'].items()):raise ValueError('Original changed')
        for k,v in d['confirmed'].items():self.values({k:v})
        for k,values in d['inflight'].items():
            if not isinstance(values,list) or len(values)!=2:raise ValueError('Invalid inflight')
            for v in values:self.values({k:v})
        if any(d.get(k)!={} for k in ('nativeRestore','nativeConfirmed','nativeInflight')):raise ValueError('No native writes')
    def values(self,values):
        if not values or not set(values)<=KEYS or not all(valid_value(k,v) for k,v in values.items()):raise ValueError('Only three priority keys')
    def native_value(self,*args):raise ValueError('No native preferences')


def focused(windows):
    matches=[w for w in windows if w.get('active') and w.get('focused')]
    if len(matches)!=1 or matches[0].get('root',{}).get('package')!=APP:raise core.Unobserved('Unique current Duo window required')
    return matches[0]


def named(windows,text,dialog=None):
    w=focused(windows);visible=[n for n,_ in core.walk(w['root']) if n.get('visible')]
    if dialog and sum(n.get('text')==dialog for n in visible)!=1:raise core.Unobserved('Expected actual dialog title absent/ambiguous')
    result=[]
    for n,parents in core.walk(w['root']):
        if not n.get('visible') or n.get('text')!=text:continue
        target=next((x for x in (n,*reversed(parents)) if x.get('visible') and x.get('enabled') and x.get('clickable')),None)
        if target and target is not w['root']:result.append(target)
    if len(result)!=1:raise core.Unobserved('Unique actual enabled target absent: '+text)
    return result[0]


def priority_fold(windows):
    """Find only the arrow directly beside the exact enabled priority switch."""
    w=focused(windows);control=core.row_switch(windows,'系统提示图标优先级')
    if control.get('checked') is not True:raise core.Unobserved('Priority must already be enabled; do not toggle for expansion')
    parents=[p[-1] for n,p in core.walk(w['root']) if n is control and p]
    if len(parents)!=1:raise core.Unobserved('Priority switch direct row absent/ambiguous')
    row=parents[0]
    if row.get('class')!='android.widget.LinearLayout' or not row.get('visible') or not row.get('enabled'):
        raise core.Unobserved('Unknown priority row structure')
    children=row.get('children',[])
    switches=[n for n in children if n.get('checkable') and 'Switch' in n.get('class','')]
    arrows=[n for n in children if n.get('class')=='android.widget.ImageButton' and n.get('description') in ('展开配置','收起配置')]
    if len(switches)!=1 or switches[0] is not control or len(arrows)!=1:
        raise core.Unobserved('Unique priority row arrow absent; do not use another group')
    arrow=arrows[0]
    if not all(arrow.get(k) for k in ('visible','enabled','clickable')) or arrow.get('checkable'):
        raise core.Unobserved('Priority arrow cannot be safely clicked')
    b=core.rect(arrow['bounds']);rb=core.rect(row['bounds']);wb=core.rect(w['bounds'])
    if not core.inside(b,rb) or not core.inside(b,wb) or core.overlaps(b,core.rect(control['bounds'])):
        raise core.Unobserved('Priority arrow clipped or intersects its switch')
    return control,arrow


def scroll_path(windows,direction):
    w=focused(windows);all_nodes=[n for n,_ in core.walk(w['root']) if n.get('visible')]
    containers=[n for n in all_nodes if n.get('scrollable') and n.get('enabled') and n.get('class') in ('android.widget.ScrollView','android.widget.ListView')]
    if len(containers)!=1:raise core.Unobserved('Unique scroll container absent; no guessed swipe')
    b=core.rect(containers[0]['bounds']);wb=core.rect(w['bounds'])
    if not core.inside(b,wb):raise core.Unobserved('Scroll container clipped')
    hazards=[core.rect(n['bounds']) for n in all_nodes if any(x in n.get('class','') for x in ('SeekBar','Spinner','Switch','EditText'))]
    for fraction in (.5,.15,.85):
        x=round(b[0]+(b[2]-b[0])*fraction)
        for frac in (.78,.68,.58):
            start=round(b[1]+(b[3]-b[1])*(frac if direction=='down' else 1-frac))
            end=round(start+(b[3]-b[1])*(-.38 if direction=='down' else .38))
            area=(x-2,min(start,end),x+2,max(start,end))
            if core.inside(area,b) and not any(core.overlaps((x-2,start-2,x+2,start+2),h) for h in hazards):return area,(x,start,x,end)
    raise core.Unobserved('No swipe origin clear of sliders/spinners/switches')


class Collector(base.Collector):
    native=icons.Collector.native;identity=rows.Collector.identity;protect=rows.Collector.protect
    raw_settings=rows.Collector.raw_settings;assert_config=rows.Collector.assert_config;config=rows.Collector.config
    diagnostic=rows.Collector.diagnostic;png=icons.Collector.png;observe=icons.Collector.observe
    def __init__(self,*args):
        super().__init__(*args);self.deadline=time.monotonic()+720;self.recovering=False;self.editor=False;self.swipes=0
        rows.font.validate_schema(self.journal.data['metadata']['runtimeSchema'],self.journal.data['metadata']['installedVersion'],self.journal.data['baseline'])
    def bounded(self):
        if not self.recovering and time.monotonic()>self.deadline:raise core.Unobserved('Finite UI batch expired')
    def instrument(self,operation,label,values=None,**kw):
        if self.editor:raise core.Unobserved('Editor open; use raw497 rather than killing its draft')
        if operation not in ('snapshot','set','statusbar-assets-runtime'):raise ValueError('Unknown test operation')
        if operation=='set':self.journal.values(values)
        return rows.Collector.instrument(self,operation,label,values,**kw)
    def notifications(self,label):
        raw=self.ar.shell('dumpsys notification',timeout=40);(self.folder/(label+'-notifications-private.txt')).write_text(raw,encoding='utf-8')
        records=rows.clear.notification_records(raw)
        if records!=self.journal.data['metadata']['notificationsBefore']:raise core.Unobserved('Full user notification identity set changed')
        return records
    def owner(self,ob,area=None):
        if core.canonical_component(core.focus_title(ob['native']))!=core.canonical_component(EDITOR_ACTIVITY):
            raise core.Unobserved('Exact priority editor Activity is not the native focus')
        return core.owner(ob['windows'],ob['native'],ob['wm'],ob['size'],{APP},area,
                          self.journal.data['metadata']['process']['pid'] if area is None else None,self.journal.data['metadata']['process']['pid'])
    def action(self,label,command,ob,values=None,current=None):
        self.bounded()
        if command not in (OPEN,'input keyevent KEYCODE_HOME','input keyevent KEYCODE_BACK') and not re.fullmatch(r'input (?:tap \d+ \d+|swipe \d+ \d+ \d+ \d+ 350)',command):raise ValueError('Outside finite UI inputs')
        editor=command==OPEN
        if editor:
            if values is not None:raise ValueError('Editor entry cannot claim configuration mutations')
            atomic(self.folder/(label+'-transport-policy.json'),dict(policy=ENTRY_POLICY,requestedRootTransport=True,
                exactCommand=OPEN,activity=EDITOR_ACTIVITY,route='status_icons',component='system_icons',
                actualTransportReceipt=label+'-action.json',navigationCoverage='direct-owned-editor; not homepage-path verification'))
        result=core.invoke_logged(self.folder/(label+'-action.json'),command,lambda:self.ar.shell(command,root=editor,timeout=20),ob['started'],
            time.monotonic()+2.5 if self.recovering else self.deadline,journal=self.journal if values else None,values=values,current=current)
        if editor:
            (self.folder/(label+'-launch-output.txt')).write_text(result,encoding='utf-8')
            statuses=re.findall(r'(?m)^Status:\s*(\S+)\s*$',result)
            activities=re.findall(r'(?m)^Activity:\s*(\S+)\s*$',result)
            valid=(statuses==['ok'] and len(activities)==1 and not re.search(r'Error:|Exception|Permission Denial',result)
                and core.canonical_component(activities[0])==core.canonical_component(EDITOR_ACTIVITY))
            atomic(self.folder/(label+'-launch-receipt.json'),dict(policy=ENTRY_POLICY,statuses=statuses,
                actualActivities=activities,expectedActivity=EDITOR_ACTIVITY,valid=bool(valid)))
            if not valid:raise core.Unobserved('Exact priority editor launch receipt absent; no tap or retry')
        return result
    def navigate(self,label,command):
        current=self.raw_settings(label+'-before')
        if not self.recovering:self.assert_config(current)
        else:atomic(self.folder/(label+'-recovery-current.json'),dict(differences=difference(self.journal.expected(),current)))
        ob=self.observe(label+'-before');m=self.journal.data['metadata'];home=m['homeComponent']
        title=core.focus_title(ob['native']);packages={APP,home.split('/')[0]}
        if title.split('/')[0] not in packages:raise core.Unobserved('No ordinary Duo/HOME focus; no navigation')
        core.owner(ob['windows'],ob['native'],ob['wm'],ob['size'],packages,navigation_pid=m['process']['pid'])
        if rows.keyguard(self.ar.shell('dumpsys window policy'))['showing']:raise core.Unobserved('Locked; do not navigate')
        output=self.action(label,command,ob)
        (self.folder/(label+'-transport-output.txt')).write_text(output,encoding='utf-8')
        if command==OPEN:
            self.editor=True
            if not re.search(r'(?m)^Status: ok\s*$',output) or re.search(r'Error:|Exception|Permission Denial',output):raise core.Unobserved('Explicit editor launch did not succeed')
        time.sleep(.45)
        if command=='input keyevent KEYCODE_HOME':
            after=self.observe(label+'-home-confirmed')
            core.native_owner(after['native'],after['wm'],after['size'],{home},m['process']['pid'])
            self.editor=False
    def current_ui(self,label):
        self.assert_config(self.raw_settings(label+'-settings'));return self.observe(label)
    def find(self,label,text,dialog=None,switch=False):
        for attempt in range(7):
            ob=self.current_ui(label+'-'+str(attempt));self.owner(ob)
            visible=[n for n,_ in core.walk(focused(ob['windows'])['root']) if n.get('visible')]
            if dialog and sum(n.get('text')==dialog for n in visible)!=1:raise core.Unobserved('Wrong current dialog; no input')
            matches=[n for n in visible if n.get('text')==text]
            if not matches:
                if attempt==6 or self.swipes>=24:raise core.Unobserved('Finite scroll bound reached without target')
                hidden=[n for n,_ in core.walk(focused(ob['windows'])['root']) if n.get('text')==text and not n.get('visible')]
                direction='down'
                if len(hidden)==1:
                    hb=core.rect(hidden[0].get('bounds'));wb=core.rect(focused(ob['windows'])['bounds'])
                    if hb[3]<=wb[1]+(wb[3]-wb[1])*.25:direction='up'
                area,points=scroll_path(ob['windows'],direction);self.owner(ob,area)
                self.action(label+'-scroll-'+str(attempt),'input swipe %d %d %d %d 350'%points,ob);self.swipes+=1;time.sleep(.3)
                continue
            if len(matches)!=1:raise core.Unobserved('Ambiguous visible label; no scroll or tap')
            node=core.row_switch(ob['windows'],text) if switch else named(ob['windows'],text,dialog)
            b=core.rect(node['bounds']);w=focused(ob['windows'])
            if not core.inside(b,core.rect(w['bounds'])):raise core.Unobserved('Target clipped; no click')
            point=((b[0]+b[2])//2,(b[1]+b[3])//2);self.owner(ob,(point[0],point[1],point[0]+1,point[1]+1))
            return ob,node,point
        raise core.Unobserved('Finite search exhausted')
    def readback(self,label,values):
        expected=dict(self.journal.expected(),**values)
        for i in range(10):
            current=self.raw_settings(label+'-'+str(i));diff=difference(expected,current)
            if not diff:self.journal.acknowledge(values,current);return
            if any(k not in values for k in diff):raise core.Unobserved('UI wrote outside planned exact keys')
            time.sleep(.3)
        raise core.Unobserved('Actual auto-save did not settle; no synthetic success')
    def ensure_priority_expanded(self,label):
        if self.journal.expected()[PR]!='1':raise core.Unobserved('Priority parameters require the existing enabled setting')
        ob,node,_=self.find(label+'-row','系统提示图标优先级',switch=True)
        control,arrow=priority_fold(ob['windows'])
        if control is not node:raise core.Unobserved('Priority row changed during selection')
        if arrow['description']=='收起配置':return
        b=core.rect(arrow['bounds']);point=((b[0]+b[2])//2,(b[1]+b[3])//2)
        self.owner(ob,(point[0],point[1],point[0]+1,point[1]+1))
        self.action(label+'-expand','input tap %d %d'%point,ob)
        self.assert_config(self.raw_settings(label+'-no-write'))
        time.sleep(.2)
        after,_,_=self.find(label+'-confirmed','系统提示图标优先级',switch=True)
        _,expanded=priority_fold(after['windows'])
        if expanded['description']!='收起配置':raise core.Unobserved('Priority parameters did not visibly expand; no second tap')
        self.assert_config(self.raw_settings(label+'-confirmed-no-write'))
    def tap(self,label,text,dialog=None,values=None):
        current=self.raw_settings(label+'-before');self.assert_config(current)
        if dialog is None and text in ('调整保留优先级','恢复默认优先级与数量'):
            self.ensure_priority_expanded(label+'-parameters')
        ob,node,point=self.find(label+'-find',text,dialog)
        self.action(label,'input tap %d %d'%point,ob,values,current)
        if values:self.readback(label+'-saved',values)
        else:self.assert_config(self.raw_settings(label+'-no-write'))
        time.sleep(.2)
    def toggle(self,label,value):
        current=self.raw_settings(label+'-before');self.assert_config(current)
        ob,node,point=self.find(label+'-switch','系统提示图标优先级',switch=True)
        if node.get('checked') is not (current[PR]=='1'):raise core.Unobserved('Switch state differs from actual saved setting')
        if current[PR]!=value:
            self.action(label,'input tap %d %d'%point,ob,{PR:value},current);self.readback(label+'-saved',{PR:value})
        self.evidence(label)
    def evidence(self,label):
        ob=self.current_ui(label+'-state');self.owner(ob);folder=self.folder/(label+'-state')
        frames=[self.png(folder,'frame-00')];time.sleep(.45);frames.append(self.png(folder,'frame-01'))
        result=dict(label=label,interval=ob['interval'],frames=frames,windows=ob['windows'],values={k:self.journal.expected()[k] for k in KEYS},visualPass=False,pixelReviewRequired=True)
        self.assert_config(self.raw_settings(label+'-after'));self.report['cases'].append(result);atomic(folder/'evidence.json',result);self.persist();return ob
    def change_order(self,label,identity,action):
        current=self.journal.expected();ids=order(current[ORDER]);title=str(ids.index(identity)+1)+'. '+TITLES[identity]
        self.tap(label+'-item',title,'优先保留顺序')
        expected=moved(current[ORDER],identity,action)
        self.tap(label+'-action',action,title,{ORDER:expected});self.evidence(label)
    def exercise(self):
        self.identity('preflight');self.protect('preflight');self.notifications('preflight')
        self.navigate('baseline-home','input keyevent KEYCODE_HOME')
        after=int(self.ar.shell('date +%s%3N'));inventory=self.inventory('baseline-main',after)
        visible=base.visible_rows(inventory);candidates=[i for i in TITLES if any(r.get('id')==i and r.get('application') in ('native','native_unmapped','applied') for r in visible)]
        if not candidates:raise core.Unobserved('No actually observed UI hint candidate; no radio/fan/substitute state')
        ob=self.observe('baseline-main');core.native_owner(ob['native'],ob['wm'],ob['size'],{self.journal.data['metadata']['homeComponent']},self.journal.data['metadata']['process']['pid'])
        ids=order(self.journal.data['baseline'][ORDER]);usable=[i for i in candidates if 0<ids.index(i)<len(ids)-1]
        if not usable:raise core.Unobserved('No observed non-boundary candidate')
        target=sorted(usable,key=ids.index)[len(usable)//2]
        self.report['sourceCandidates']=dict(ids=candidates,selected=target,inventory=inventory,evidence='baseline-main',pixelReviewRequired=True,eligibleBeyondNativeVisibleNotProved=True);self.persist()
        self.navigate('open-editor',OPEN);self.toggle('priority-on','1')
        self.tap('open-order','调整保留优先级')
        original_effective=','.join(order(self.journal.expected()[ORDER]))
        self.change_order('move-up',target,'上移一位');self.change_order('move-down',target,'下移一位')
        if self.journal.expected()[ORDER]!=original_effective:raise core.Unobserved('Up/down did not restore effective order')
        self.change_order('move-first',target,'置于首位');self.tap('finish-order','完成','优先保留顺序')
        self.navigate('leave-editor','input keyevent KEYCODE_HOME');self.assert_config(self.config('saved-outside-editor'))
        self.navigate('reopen-editor',OPEN);self.tap('reopen-order','调整保留优先级')
        self.change_order('first-up-boundary',target,'上移一位')
        first='1. '+TITLES[target];self.tap('cancel-item',first,'优先保留顺序');self.tap('cancel-action','取消',first);self.evidence('cancel-keeps-saved-order')
        # Cancelling the action dialog does not restore the previous list dialog.
        self.toggle('priority-off-keeps-values','0');self.toggle('priority-on-again','1')
        self.tap('reset-defaults','恢复默认优先级与数量',values={ORDER:'',LIMIT:'0'});self.evidence('default-order-and-count')
        self.navigate('end-editor','input keyevent KEYCODE_HOME');self.assert_config(self.config('ui-final'))
        self.report['status']='ui-actions-observed-visual-review-pending';self.persist()
    def restore(self):
        self.recovering=True;d=self.journal.data;d.update(pending=True,configurationRestored=False);self.journal.save()
        errors=[];external={};terminal=[];identity_ok=False;pixel_error=None
        try:
            self.identity('recovery-identity');identity_ok=True
            # A fresh observed HOME ends any owned editor/dialog; if unavailable,
            # recovery remains pending instead of blindly dismissing another app.
            self.navigate('recovery-home','input keyevent KEYCODE_HOME');self.editor=False
            current=self.config('recovery-before');external.update(self.journal.settle_inflight(current));changes={}
            for k,v in d['restore'].items():
                if self.journal.owns(k,current.get(k)):changes[k]=v
                else:external[k]=current.get(k)
            d['externalValuesPreserved']=external;self.journal.save()
            if changes:
                self.instrument('set','recovery-set',changes,tracked=True,current=current,recovery=True)
                self.journal.acknowledge(changes,self.config('recovery-readback'),recovery=True)
            if external:errors.append('Latest ownership conflict preserved')
        except BaseException as error:errors.append(repr(error))
        if identity_ok:
            try:
                self.navigate('restored-reopen',OPEN);self.evidence('restored-priority-page')
                self.navigate('restored-home','input keyevent KEYCODE_HOME')
            except BaseException as error:pixel_error=repr(error)
            if self.editor:
                try:self.navigate('restored-home-after-observation-failure','input keyevent KEYCODE_HOME')
                except BaseException as error:errors.append('Editor could not safely close: '+repr(error))
            try:self.identity('recovery-final');self.protect('recovery-final',d['metadata']['nativeBaseline']);self.notifications('recovery-final')
            except BaseException as error:errors.append(repr(error))
            try:
                for i in range(2):
                    terminal.append(difference(d['baseline'],self.config('recovery-terminal-'+str(i))))
                    if i==0:time.sleep(.4)
                if any(terminal):errors.append('Terminal full497 differs')
            except BaseException as error:errors.append(repr(error))
        d.update(terminalDifferences=terminal,configurationRestored=len(terminal)==2 and not any(terminal) and not external,
                 cleanupErrors=errors,pending=bool(errors),restoredPixelError=pixel_error)
        self.journal.save();self.report.update(configurationRestored=d['configurationRestored'],restorePending=d['pending'],cleanupErrors=errors,
            restoredPixelError=pixel_error,wholeFeaturePassed=False);self.persist()
        if errors:raise core.Unobserved('Exact recovery pending')


def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',required=True,type=int);parser.add_argument('--runtime-schema',type=Path)
    parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk')
    args=parser.parse_args()
    if args.run and not args.runtime_schema:parser.error('--run requires runtime schema')
    import adb_regression as ar
    restore=args.restore_only
    if restore and restore.is_dir():restore=restore/'restore.json'
    extra.gates(ar,restore)
    code,name=base.version(ar.shell('dumpsys package '+APP))
    if code!=args.expected_version:raise core.Unobserved('Explicit installed build differs')
    if restore:
        journal=Journal(restore);m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or (code,name)!=(m['installedVersion'],m['installedVersionName']):raise core.Unobserved('Original device/build changed')
        path=restore.parent/'report.json';report=json.loads(path.read_text('utf-8')) if path.exists() else dict(cases=[],status='reconstructed-recovery')
        ar.OUTPUT=restore.parent;Collector(ar,restore.parent,journal,report).restore();return
    schema=json.loads(args.runtime_schema.read_text('utf-8'));testhash=base.digest(args.test_apk.read_bytes())
    if rows.package_hash(ar,APP+'.test')!=testhash:raise core.Unobserved('Installed TestAPK hash differs')
    folder=extra.safe.AUDIT/('priority-ui-%d-%s'%(code,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    initial=ar.instrument('snapshot','baseline')
    if initial.get('status')!='pass' or initial.get('moduleVersion')!=code:raise core.Unobserved('Baseline snapshot invalid')
    settings=initial['settings'];rows.prerequisites(settings);rows.font.validate_schema(schema,code,settings)
    if not grid_roundtrip(settings.get(GRID,'')):raise core.Unobserved('UI changed() would normalize existing GRID; no journal/mutation')
    reader=Collector.__new__(Collector);reader.ar=ar;resources,names,native=reader.resources(),reader.names(),reader.native()
    raw=ar.shell('cat '+base.APP+'shared_prefs/ls_augment_config_v2.xml',root=True);raw_baseline=rows.raw_preferences(raw)
    if rows.resolve_raw(raw_baseline,raw_baseline,settings)!=settings:raise core.Unobserved('Raw/full497 disagree')
    notifications=rows.clear.notification_records(ar.shell('dumpsys notification',timeout=40))
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    metadata=dict(case='priority-ui',serial=ar.SERIAL,installedVersion=code,installedVersionName=name,mainApkSha256=rows.package_hash(ar,APP),testApkSha256=testhash,
        observerApkSha256=rows.package_hash(ar,'ls.augment.regression.ui'),process=rows.strong_identity(ar,name),nativeBaseline=native,
        notificationsBefore=notifications,homeComponent=home,runId=uuid.uuid4().hex,runtimeSchema=schema,rawBaseline=raw_baseline,
        collectorSha256=base.digest(Path(__file__).read_bytes()))
    journal=Journal.create(folder/'restore.json',settings,metadata,resources,names,{})
    report=dict(case='priority-ui',installedVersion=code,cases=[],status='prepared',mutableKeys=sorted(KEYS),nativeMutableKeys=[],wholeFeaturePassed=False,entryPolicy=ENTRY_POLICY,navigationCoverage='direct-owned-editor',
        limits=['UI interactions only; no control/notification retention pixel claim','No radio/fan/notification state or neighbor/font/asset changes',
                'Limit changes only through visible default reset','One currently visible registered non-boundary target is sufficient for UI operations; no three-source retention claim; actual glyph reviewed separately'])
    collector=Collector(ar,folder,journal,report);collector.persist()
    try:collector.exercise()
    except BaseException as error:report.update(status='incomplete',error=repr(error),traceback=traceback.format_exc());raise
    finally:
        collector.persist()
        try:collector.restore()
        finally:print(json.dumps(dict(report=str(folder/'report.json'),pending=journal.data['pending'])))


if __name__=='__main__':main()
