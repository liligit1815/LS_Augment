"""Offline behavior checks for the actual clear collector; any ADB use is forbidden."""
from pathlib import Path
import copy, importlib.util, io, json, struct, sys, tempfile, time
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'tools'))
import adb_regression as ar
def forbidden(*a,**k):raise AssertionError('Offline test attempted device access')
ar.adb=ar.shell=ar.instrument=forbidden
spec=importlib.util.spec_from_file_location('clear_test',ROOT/'tools/run-safe-notification-clear-device.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
checks=0;HOME='com.zte.mifavor.launcher';SIZE=(1216,2688)
def check(v,label):
    global checks
    assert v,label;checks+=1
def raises(fn,typ=Exception):
    global checks
    try:fn()
    except typ:checks+=1;return
    raise AssertionError('Expected rejection')
def baseline():
    d={'user'+str(i):'keep' for i in range(497-len(m.KEYS))}
    d.update({m.EN:'0',m.STACK:'0',m.ALIGN:'0',m.X:'0',m.Y:'0',m.LIGHT:'#E3E3E8',m.DARK:'#44444C',m.TRAVEL:'12',m.DURATION:'220'})
    return d
def journal(folder,theme='light'):
    return m.Journal(folder/'restore.json',baseline(),{'theme':theme,'nativeBaseline':{'native':'same'},'notificationsBefore':[],'homeComponent':HOME+'/.Launcher'}, {'asset':'hash'},{'font':'name'})
def window(package,kind=1):return {'type':kind,'active':True,'focused':True,'bounds':'[0,0][1216,2688]','root':{'package':package,'visible':True,'bounds':'[0,0][1216,2688]','children':[]}}
def focus(package):return 'mCurrentFocus=Window{a u0 '+package+'/Window}\n'
def home_ui():
    w=window(HOME);bar=window('com.android.systemui',3);bar.update(active=False,focused=False,bounds='[0,0][1216,131]');bar['root'].update(bounds='[0,0][1216,131]',id=m.ID+'status_bar')
    return [w,bar],focus(HOME)
def panel_ui():
    w=window('com.android.systemui',3);button={'id':m.ID+'iv_dismiss_notification_view','package':'com.android.systemui','class':'android.widget.ImageButton','bounds':'[540,2388][677,2525]','enabled':True,'visible':True,'clickable':True,'description':'清除全部'}
    w['root']['children']=[{'id':m.ID+n,'visible':True,'bounds':'[0,0][1216,2362]','children':[]} for n in ('notification_panel','notification_stack_scroller')]+[button]
    return [w],focus('com.android.systemui'),button
def notification(items=()):return 'Notification service\n  Notification List:\n'+''.join('    NotificationRecord(x: pkg='+p+' user=UserHandle{'+str(u)+'} id='+str(i)+' tag='+tag+' importance=3 key='+str(u)+'|'+p+'|'+str(i)+'|'+tag+'|42: Notification())\n' for p,u,i,tag in items)+'  Notification listeners:\n'

class Fake(m.Collector):
    def __init__(self,j):
        self.journal=j;self.folder=j.path.parent;self.report={'cases':[]};self.current=dict(j.data['baseline']);self.sets=[];self.events=[];self.flags=set();self.deadline=time.monotonic()+100
    def instrument(self,op,label,values=None):
        self.events.append(label)
        if op=='set':
            disk=json.loads(self.journal.path.read_text('utf-8'))
            check(all(v in disk['inflight'].get(k,[]) for k,v in values.items()),'Actual recovery commit has durable inflight first')
            self.sets.append(dict(values));self.current.update(values)
            if 'restore-ack-loss' in self.flags:raise OSError('Transport lost after restore applied')
        return {'settings':dict(self.current)}
    def artifact_identity(self):
        if 'apk-change' in self.flags:raise m.extra.Inconclusive('APK changed')
    def identity(self,label):
        self.events.append(label+'-identity')
        if 'pid-change' in self.flags:raise m.extra.Inconclusive('SystemUI changed')
    def observe_all(self,label):
        self.events.append(label)
        if 'pixel-error' in self.flags:raise m.extra.Inconclusive('No image')
        if 'pixel-race' in self.flags:self.current['user0']='external'
        w,n,_=panel_ui();return w,n,SIZE
    def protected(self,label):
        self.events.append(label+'-protection')
        if 'protection-race' in self.flags:self.current['user0']='external'
        if 'resource-change' in self.flags:raise m.extra.Inconclusive('Resource changed')
        return {}
    def notifications(self,label):
        self.events.append(label+'-notifications')
        if 'notification-race' in self.flags:self.current['user0']='external'
        if 'notification-error' in self.flags:raise m.extra.Inconclusive('Truncated native dump')
        return 'notification-churn' not in self.flags
    def persist(self):m.atomic(self.folder/'report.json',self.report)

with tempfile.TemporaryDirectory() as td:
    parent=Path(td)
    def folder(n):p=parent/n;p.mkdir();return p
    j=journal(folder('journal'));check(len(m.Journal(j.path).data['baseline'])==497,'Complete durable journal')
    check(j.data['pending'] and j.data['resourcesBefore']=={'asset':'hash'},'Pending/full protection written before first transport')
    for k,v in [(m.EN,'true'),(m.ALIGN,'4'),(m.X,'-121'),(m.Y,'25'),(m.TRAVEL,'41'),(m.DURATION,'601'),(m.LIGHT,'blue'),(m.X,'01'),('user0','change'),(m.DARK,'#000000')]:raises(lambda k=k,v=v:j.plan({k:v},baseline()),ValueError)
    for theme in ('light','dark'):
        z=journal(folder(theme),theme);allvalues={k:v for _,vs in m.phases(theme) for k,v in vs.items()}
        check(set(allvalues)<=z.allowed_keys(),'Each phase obeys active-theme whitelist')
        check((m.LIGHT if theme=='dark' else m.DARK) not in allvalues,'Inactive theme never written')
        for _,vs in m.phases(theme):check(z.valid_values(vs),'Real phase range accepted')
    j.plan({m.X:'-8',m.EN:'1'},baseline());disk=json.loads(j.path.read_text('utf-8'));check(disk['inflight'][m.EN]==['0','1'] and not disk['expected'],'ACK-loss ownership durable before write')
    j.acknowledge({m.X:'-8',m.EN:'1'});j.plan({m.X:'8'},dict(baseline(),**j.data['expected']));j.acknowledge({m.X:'8'})
    check(not j.owned_value(m.X,'-8') and j.owned_value(m.X,'8'),'Historical values do not remain owned')
    for name,change in [('kind',lambda d:d.update(kind='foreign')),('full',lambda d:d['baseline'].pop('user0')),('restore',lambda d:d['restore'].update({m.X:'99'})),('theme',lambda d:d['expected'].update({m.DARK:'#000000'})),('orphan',lambda d:d['expected'].update({m.ALIGN:'1'})),('range',lambda d:d['expected'].update({m.X:'121'})),('resource',lambda d:d.pop('resourcesBefore'))]:
        bad=copy.deepcopy(j.data);change(bad);p=folder('bad-'+name)/'restore.json';m.atomic(p,bad);raises(lambda:m.Journal(p),ValueError)
    for name in ('normal','pixel-error','pixel-race','protection-race','notification-race','resource-change','notification-error','notification-churn'):
        z=journal(folder('restore-'+name));z.plan({m.EN:'1',m.X:'-8'},baseline());f=Fake(z);f.current.update({m.EN:'1',m.X:'-8'});f.flags={name}
        with patch.object(m.time,'sleep',lambda _:None):
            if name in ('pixel-race','protection-race','notification-race','resource-change'):raises(f.restore,m.extra.Inconclusive)
            else:f.restore()
        check(f.current[m.EN]=='0' and f.current[m.X]=='0','Own confirmed/inflight values restored')
        check(f.report['clearButtonActions']==0 and f.report['visualPass'] is False and f.report['wholeFeaturePassed'] is False,'Recovery never claims appearance pass')
        check(f.events[-1]=='recovery-terminal','Full497 is terminal after all slow protection reads')
        if name in ('pixel-race','protection-race','notification-race'):check(z.data['pending'] and not z.data['configurationRestored'],'Late external configuration cannot close journal')
        elif name=='resource-change':check(z.data['pending'],'Resource change cannot close journal')
        else:check(not z.data['pending'] and z.data['configurationRestored'],'Exact config recovery independent of pixels/notification churn')
        if name=='pixel-error':check(z.data['restoredPixels']=='not-observed','No pixel is not a failed save')
        if name.startswith('notification-') and name!='notification-race':check(z.data['notificationsUnchanged'] is False,'Unknown/changed user identities not reported unchanged')
        check(set(z.data['actualChangedKeys'])=={m.EN,m.X},'Lost ACK observations count as changed')
    z=journal(folder('external-own'));z.plan({m.EN:'1',m.X:'-8'},baseline());z.acknowledge({m.EN:'1',m.X:'-8'});f=Fake(z);f.current.update({m.EN:'2',m.X:'-8'})
    with patch.object(m.time,'sleep',lambda _:None):raises(f.restore,m.extra.Inconclusive)
    check(f.current[m.EN]=='2' and f.current[m.X]=='0' and all(m.EN not in vs for vs in f.sets),'External own-key value preserved while other key restores')
    z=journal(folder('old-own'));z.plan({m.X:'-8'},baseline());z.acknowledge({m.X:'-8'});z.plan({m.X:'8'},dict(baseline(),**z.data['expected']));z.acknowledge({m.X:'8'});f=Fake(z);f.current[m.X]='-8'
    with patch.object(m.time,'sleep',lambda _:None):raises(f.restore,m.extra.Inconclusive)
    check(f.current[m.X]=='-8' and not f.sets,'Do not overwrite old historical-but-no-longer-owned value')
    for unrelated in (False,True):
        z=journal(folder('external-original-'+str(unrelated)));z.plan({m.EN:'1',m.X:'-8'},baseline());z.acknowledge({m.EN:'1',m.X:'-8'})
        f=Fake(z);f.current.update({m.EN:'0',m.X:'-8'})
        if unrelated:f.current['user0']='external'
        with patch.object(m.time,'sleep',lambda _:None):raises(f.restore,m.extra.Inconclusive)
        check(z.data['externalValuesPreserved']=={m.EN:'0'} and z.data['pending'],'External return to original is not current ownership and remains pending')
        check(f.current[m.EN]=='0' and f.current[m.X]=='0' and all(m.EN not in vs for vs in f.sets),'Do not reassert external original; restore only remaining owned key')
        check(f.current['user0']==('external' if unrelated else 'keep'),'Other external values remain untouched')
        check(z.data['configurationRestored']==(not unrelated),'Matching full dictionary is separate from ownership conflict')
    for flag in ('restore-ack-loss','apk-change','pid-change'):
        z=journal(folder(flag));z.plan({m.EN:'1'},baseline());z.acknowledge({m.EN:'1'});f=Fake(z);f.current[m.EN]='1';f.flags={flag}
        with patch.object(m.time,'sleep',lambda _:None):raises(f.restore,m.extra.Inconclusive)
        check(z.data['pending'],'Lost ACK or changed identity cannot declare terminal cleanup')
        if flag=='apk-change':check(not f.sets,'APK change blocks recovery transport')
        if flag=='restore-ack-loss':
            reloaded=m.Journal(z.path);check(reloaded.data['inflight'][m.EN]==['1','0'],'Restore crash retains both immediately-before and original values')
            resumed=Fake(reloaded);resumed.current=dict(f.current)
            with patch.object(m.time,'sleep',lambda _:None):resumed.restore()
            check(not reloaded.data['pending'] and resumed.current==baseline(),'Restoration after commit-before-ACK crash')

    for raw,expected in [('config: zh-rCN-port-notnight-xhdpi\nabi: x\n','light'),('config: zh-rCN-port-night-xhdpi\n','dark')]:check(m.theme_from_config(raw)==expected,'Effective Configuration parse')
    for raw in ('Night mode: auto','config: port\n','config: night-notnight\n','config: night\nconfig: notnight\n'):raises(lambda raw=raw:m.theme_from_config(raw),m.extra.Inconclusive)
    rows=m.notification_records(notification([('user.app',0,1,'a'),('user.app',10,1,'a'),('android',0,-1,'null')]))
    check(len(rows)==3 and rows[1][1]!=rows[2][1],'Complete all-profile identities retained')
    check(m.notification_records(notification())==[],'Explicit bounded empty section')
    for raw in ('Notification List:',notification()[:30],notification().replace('  Notification listeners:',''),notification([('a',0,1,'x')]).replace('id=1','wrong=1'),notification([('a',0,1,'x'),('a',0,1,'x')]),notification()+'\nDUMP TIMEOUT'):
        raises(lambda raw=raw:m.notification_records(raw),m.extra.Inconclusive)
    # Real selectors, including object ownership and nonfocused overlays.
    w,n=home_ui();check(m.opening_path(w,n,SIZE,HOME)==[182,5,182,1774,650],'Only actual HOME/statusbar path')
    p,pn,b=panel_ui();check(m.clear_geometry(p,pn,SIZE,HOME)['button']['bounds']==b['bounds'],'Actual OEM button observed')
    for name,mutate in [('wrongfocus',lambda w:w[0].update(focused=False)),('smallscreen',lambda w:w[0].update(bounds='[0,0][1200,2688]')),('oversizedroot',lambda w:w[0]['root'].update(bounds='[0,0][1216,2800]')),('unknownhome',lambda w:w[0]['root'].update(package='other.app')),('statusmissing',lambda w:w.pop()),('overlay',lambda w:w.append(dict(window('overlay.app',4),active=False,focused=False))),('duplicatefocus',lambda w:w.append(window(HOME)))]:
        w,n=home_ui();mutate(w);raises(lambda:m.opening_path(w,n,SIZE,HOME),m.extra.Inconclusive)
    w,n=home_ui();raises(lambda:m.opening_path(w,focus('other.app'),SIZE,HOME),m.extra.Inconclusive);raises(lambda:m.opening_path(w,n,(2688,1216),HOME),m.extra.Inconclusive)
    for name,mutate in [('missing',lambda p,b:p[0]['root']['children'].remove(b)),('duplicate',lambda p,b:p[0]['root']['children'].append(copy.deepcopy(b))),('disabled',lambda p,b:b.update(enabled=False)),('clipped',lambda p,b:b.update(bounds='[540,2388][677,2800]')),('aosp',lambda p,b:b.update(id=m.ID+'dismiss_text')),('control',lambda p,b:p[0]['root']['children'].append({'id':m.ID+'control_panel','visible':True})),('overlay',lambda p,b:p.append(dict(window('cover.app',4),active=False,focused=False)))]:
        p,n,b=panel_ui();mutate(p,b);raises(lambda:m.clear_geometry(p,n,SIZE,HOME),m.extra.Inconclusive)
    # Fresh action gate cannot admit any press/tap, even on the genuine button.
    z=journal(folder('actions'));f=Fake(z);calls=[];f.ar=type('AR',(),{'shell':staticmethod(lambda cmd:calls.append(cmd))})()
    f.interaction_observation=(None,None,time.monotonic());f.fresh_action('open','input swipe 182 5 182 1774 650');check(len(calls)==1,'Observed opening gesture allowed')
    for command in ('input tap 608 2450','input swipe 608 2450 608 2450 1000','input keyevent KEYCODE_HOME','wm dismiss-keyguard'):
        raises(lambda command=command:f.fresh_action('forbidden',command),ValueError)
    f.interaction_observation=(None,None,time.monotonic()-3);raises(lambda:f.fresh_action('stale','cmd statusbar collapse'),m.extra.Inconclusive)
    f.interaction_observation=(None,None,time.monotonic());f.deadline=time.monotonic()-1;raises(lambda:f.fresh_action('overtime','cmd statusbar collapse'),m.extra.Inconclusive)
    check(len(calls)==1,'No late/forbidden input')
    # A failed native observer must still preserve the newly acquired PNG.
    z=journal(folder('failed-observer'));f=Fake(z)
    png=b'\x89PNG\r\n\x1a\n'+b'\0'*8+struct.pack('>II',*SIZE)+b'raw-evidence'
    def broken(label):raise RuntimeError('observer failed')
    f.ui=type('UI',(),{'all_windows':staticmethod(broken)})();f.awake=lambda:None
    f.ar=type('AR',(),{'adb':staticmethod(lambda *a:png),'shell':staticmethod(lambda *a,**k:focus(HOME))})()
    raises(lambda:m.Collector.observe_all(f,'failed'),m.extra.Inconclusive)
    check((f.folder/'failed/screen.png').read_bytes()==png,'Failed original observation PNG remains exact')
    check('observer failed' in json.loads((f.folder/'failed/observation.json').read_text())['observerError'],'Failure cause retained beside PNG')
    # Real method ordering: a slow PNG is before the fresh budget; a slow tree
    # still fails the exact 2.5s gate. No extra PNG is obtained after the tree.
    for purpose in ('input','static'):
        for tree_duration in (2.0,2.6):
            z=journal(folder('sequence-'+purpose+str(tree_duration)));f=Fake(z);f.awake=lambda:None;now=[100.0];order=[]
            w,n=home_ui()
            def screenshot(*args):order.append('png');now[0]+=1.0;return png
            def tree(label):order.append('tree');now[0]+=tree_duration;return w
            def native_dump(*args,**kwargs):order.append('native');now[0]+=.15;return n
            f.ar=type('AR',(),{'adb':staticmethod(screenshot),'shell':staticmethod(native_dump)})();f.ui=type('UI',(),{'all_windows':staticmethod(tree)})();f.deadline=1000
            with patch.object(m.time,'monotonic',lambda:now[0]):
                (m.Collector.observe_input if purpose=='input' else m.Collector.observe_all)(f,'measured')
                d=json.loads((f.folder/'measured/observation.json').read_text())
                check(order==['png','tree','native'],'No PNG work after fresh tree')
                check(d['intervals']['png']=={'start':100.0,'end':101.0} and d['freshRequestedMonotonic']==101.0,'Early PNG exact interval is independent of fresh interval')
                check(d['freshAgeMs']==round((tree_duration+.15)*1000) and d['purpose']==('input-prerequisite' if purpose=='input' else 'static-evidence'),'Actual tree and focus duration recorded')
                calls=[];f.ar=type('AR',(),{'shell':staticmethod(lambda command:calls.append(command))})()
                if tree_duration>2.5:raises(lambda:f.fresh_action('late','input swipe 182 5 182 1774 650'),m.extra.Inconclusive);check(not calls,'Slow tree still refuses without retry')
                else:f.fresh_action('eligible','input swipe 182 5 182 1774 650');check(len(calls)==1,'Long PNG does not age newer actual tree')
    # Actual identity method rejects process generation drift at equal version/PID.
    z=journal(folder('identity'));f=Fake(z);z.data['metadata'].update(mainApkSha256='a'*64,testApkSha256='b'*64)
    state={'ticks':444};native_record={'receivedBoot':'524','moduleLoadedAt':17000,'processStartedElapsed':12000}
    def original_identity(self,label):m.atomic(self.folder/(label+'-runtime.json'),{'pid':'123','records':[native_record]})
    def shell(command,**kwargs):
        if command=='settings get global boot_count':return '524'
        if command=='cat /proc/123/stat':return '123 (sysui) '+' '.join(['S']+['0']*18+[str(state['ticks'])])
        raise AssertionError(command)
    f.ar=type('AR',(),{'shell':staticmethod(shell),'adb':staticmethod(lambda *a,**k:b'123\n')})()
    with patch.object(m.base.Collector,'identity',original_identity):
        m.Collector.identity(f,'first');m.Collector.identity(f,'same');check(z.data['systemuiIdentity']['startTicks']==444,'Native generation retained')
        state['ticks']=445;raises(lambda:m.Collector.identity(f,'reused-pid'),m.extra.Inconclusive)
    with patch.object(m,'main_apk_hash',lambda _: 'c'*64),patch.object(m.base,'test_apk_hash',lambda _:'b'*64):raises(lambda:m.Collector.artifact_identity(f),m.extra.Inconclusive)
    with patch.object(m,'main_apk_hash',lambda _: 'a'*64),patch.object(m.base,'test_apk_hash',lambda _:'c'*64):raises(lambda:m.Collector.artifact_identity(f),m.extra.Inconclusive)
    # Actual open_panel does not send anything for unknown foreground, and proves hidden HOME before pulling.
    for kind in ('home','panel','unknown','overlay','stale'):
        z=journal(folder('open-'+kind));f=Fake(z);calls=[];f.ar=type('AR',(),{'shell':staticmethod(lambda cmd:calls.append(cmd))})();count=[0]
        def observe(label):
            count[0]+=1;w,n=(panel_ui()[:2] if kind=='panel' and count[0]==1 else home_ui())
            if kind=='unknown':w=[window('other.app')];n=focus('other.app')
            if kind=='overlay':w.append(dict(window('overlay.app',4),active=False,focused=False))
            f.interaction_observation=(w,n,time.monotonic()-(3 if kind=='stale' else 0));return w,n,SIZE
        f.observe_input=observe
        with patch.object(m.time,'sleep',lambda _:None):
            if kind in ('unknown','overlay','stale'):raises(lambda:f.open_panel(kind),m.extra.Inconclusive)
            else:f.open_panel(kind)
        check(calls==(['cmd statusbar collapse','input swipe 182 5 182 1774 650'] if kind=='panel' else ['input swipe 182 5 182 1774 650'] if kind=='home' else []),'Only proven native transition sequence')
    # Capture/report logic requires two current samples, but never promotes active telemetry to pixels.
    z=journal(folder('capture'));f=Fake(z);f.open_panel=lambda label:None;f.diagnostic=lambda label:{'ls_augment_notification_clear_runtime':'active;latched'}
    def fresh_observe(label):
        p,n,_=panel_ui();f.interaction_observation=(p,n,time.monotonic());return p,n,SIZE
    f.observe_all=fresh_observe
    with patch.object(m.time,'sleep',lambda _:None):row=f.capture('paired')
    check(len(row['samples'])==2 and row['visualPass'] is False and row['pixelReviewRequired'],'Active diagnostic is not pixel pass')
    def stale_observe(label):
        p,n,_=panel_ui();f.interaction_observation=(p,n,time.monotonic()-3);return p,n,SIZE
    f.observe_all=stale_observe;raises(lambda:f.capture('stale'),m.extra.Inconclusive)

# Original matching native focus dumps and trees, never a synthesized focus for device replay.
for rel,kind in [('out/full-function-audit-20261004/header-extras-safe-20454-20261004-070632/weather-on-panel-1','notification'),('out/full-function-audit-20261004/island-20460-notification-click-20261004-130510/restored-observation-2','home'),('out/full-function-audit-20261004/notification-clear-static-20460-20261004-134850/original-prerequisite-hidden-home','home')]:
    p=ROOT/rel;w=json.loads((p/'result-private.json').read_text('utf-8'))['uiWindows'];native=(p/'activity-private.txt').read_text('utf-8')
    if kind=='notification':check(m.clear_geometry(w,native,SIZE,HOME)['button']['bounds']=='[540,2388][677,2525]','Real NotificationShade focus/tree compatibility')
    else:check(m.opening_path(w,native,SIZE,HOME)==[182,5,182,1774,650],'Real HOME focus/tree/path compatibility')
    raises(lambda:m.surface(w,native.replace('mCurrentFocus=','oldFocus='),SIZE,HOME),m.extra.Inconclusive)
check(m.focus_packages('mCurrentFocus=Window{x u0 NotificationShade}')=={'com.android.systemui'},'Exact native shade title')
check(not m.focus_packages('mCurrentFocus=Window{x u0 OtherShade}'),'Unknown anonymous native title rejected')
check(not m.focus_packages('mCurrentFocus=Window{x u0 NotificationShade}\nmCurrentFocus=Window{y u0 NotificationShade}'),'Duplicate native focus rejected')
check(m.proc_start('123 (sys ui) '+' '.join(['S']+['0']*18+['444']+['0']*3),'123')==444,'Parse actual proc stat field22 after parentheses')
for raw in ('123 (x) S 1','124 (x) '+' '.join(['S']+['0']*18+['444']),'123 (x) '+' '.join(['S']+['0']*19)):
    raises(lambda raw=raw:m.proc_start(raw,'123'),m.extra.Inconclusive)
print(json.dumps({'status':'pass','checks':checks,'phoneUsed':False,'scope':'Actual collector journal/recovery/window/notification parser behavior; no SystemUI pixel pass'}))
