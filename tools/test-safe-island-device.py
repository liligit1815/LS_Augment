"""Offline tests of the real collector. No device/ADB/installation is permitted."""
import copy, importlib.util, io, json, struct, sys, tempfile
from pathlib import Path
from unittest.mock import patch
from PIL import Image

ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'tools'))
import adb_regression as ar
def forbidden(*a,**k):raise AssertionError('Offline test attempted a phone operation')
ar.adb=ar.shell=ar.instrument=forbidden
spec=importlib.util.spec_from_file_location('island_test',ROOT/'tools/run-safe-island-device.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
checks=0;RUN='a'*32;SECRET='b'*32;EN=m.P+'enabled'
def check(v,label):
    global checks
    assert v,label;checks+=1
def raises(fn,typ=Exception):
    global checks
    try:fn()
    except typ:checks+=1;return
    raise AssertionError('Expected rejection')
def baseline():
    d={'user'+str(i):'unchanged' for i in range(497-len(m.KEYS))}
    d.update({m.P+s:v for s,v in [('enabled','0'),('music','1'),('notifications','0'),('charging','0'),('width','164'),('height','26'),('offset_x','7'),('notice_seconds','6')]})
    return d
def make(folder):return m.Journal(folder/'restore.json',baseline(),{'case':'lifecycle','runId':RUN,'secret':SECRET,'nativeBaseline':{'font':'1.3'},'notificationsBefore':[]}, {'asset':'hash'},{'user':'name'})
def progress(**kwargs):
    d={'schema':1,'fixtureRevision':'island-lifecycle-r2-controls','package':m.PACKAGE,'runId':RUN,'pid':111,'startedElapsed':1000,'deadlineElapsed':176000,'observedElapsed':1200,'sequence':0,'audioOutput':False,'audioFocusRequested':False,'ownNotificationIds':[],'closed':False,'sessionReleased':False,'contentCallbacks':0,'phase':'initial-paused','musicActive':False,'error':''}
    d.update(kwargs);return d
def media(items=()):
    return 'MEDIA SESSION SERVICE (dumpsys media_session)\nUser Records:\n Sessions Stack - have '+str(len(items))+' sessions:\n'+''.join('  package='+p+'\n  active='+str(active).lower()+'\n  state='+state+'\n' for p,active,state in items)+'Audio playback (lastly played comes first)\n'
def notices(items=()):
    return '  Notification List:\n'+''.join('    NotificationRecord(x: pkg='+p+' user=UserHandle{0} id='+str(i)+' tag='+tag+' importance=3 key=0|'+p+'|'+str(i)+'|'+tag+'|123: Notification())\n' for p,i,tag in items)+'  Notification listeners:\n'
def owned_ui():
    pkg=m.PACKAGE
    app={'type':1,'active':True,'focused':True,'bounds':'[0,0][1216,2688]','root':{'package':pkg,'visible':True,'bounds':'[0,0][1216,2688]','text':'Duo 灵动岛事件验证\n'+RUN,'children':[]}}
    pill={'package':'com.android.systemui','visible':True,'enabled':True,'clickable':True,'description':'灵动岛：'+m.TITLE+'。轻点打开，长按展开','bounds':'[300,24][850,108]'}
    bar={'type':3,'active':False,'focused':False,'root':{'package':'com.android.systemui','id':m.extra.ID+'status_bar','visible':True,'bounds':'[0,0][1216,110]','children':[pill]}}
    native='mCurrentFocus=Window{abc u0 '+pkg+'/'+m.BACKGROUND+'}\n topResumedActivity=ActivityRecord{abc u0 '+pkg+'/'+m.BACKGROUND+' t42}\n'
    return [app,bar],native,pill

class Fake(m.Collector):
    def __init__(self,journal):
        self.journal=journal;self.folder=journal.path.parent;self.report={'cases':[]};self.current=dict(journal.data['baseline']);self.sets=[];self.cleanup_error=False;self.pixel_error=False;self.external_pixel=False;self.protect_error=False;self.external_final=False
    def cleanup_fixture(self):
        if self.cleanup_error:raise m.extra.Inconclusive('Owned process not observed')
    def instrument(self,operation,label,values=None):
        if operation=='set':self.sets.append(dict(values));self.current.update(values)
        elif operation!='snapshot':raise AssertionError('Unknown operation')
        return {'settings':dict(self.current)}
    def protected(self,label):
        if self.protect_error:raise m.extra.Inconclusive('Original asset changed')
        if self.external_final and label=='recovery-after-observation':self.current['user0']='external'
    def observe_all(self,label):
        if self.external_pixel:self.current['user0']='external'
        if self.pixel_error:raise m.extra.Inconclusive('No pixels available')
        return owned_ui()[:2]+((1216,2688),)
    def persist(self):m.atomic(self.folder/'report.json',self.report)

with tempfile.TemporaryDirectory() as td:
    parent=Path(td)
    def folder(name):p=parent/name;p.mkdir();return p
    j=make(folder('journal'))
    loaded=m.Journal(j.path)
    check(len(loaded.data['baseline'])==497 and loaded.data['resourcesBefore']=={'asset':'hash'} and loaded.data['namesBefore']=={'user':'name'},'Complete initial durable protection')
    check(loaded.data['pending'] and not loaded.data['fixture']['startAttempted'],'Write-ahead exists before fixture')
    check(not (j.path.parent/'report.json').exists(),'Recovery loads without report')
    for key,value in [(EN,'true'),(EN,'2'),(m.P+'width','95'),(m.P+'width','241'),(m.P+'height','19'),(m.P+'height','49'),(m.P+'notice_seconds','2'),(m.P+'notice_seconds','16'),(m.P+'offset_x','-121'),(m.P+'offset_x','121'),(m.P+'width','0164'),('ls_augment_master','1')]:
        raises(lambda k=key,v=value:j.plan({k:v},baseline()),ValueError)
    j.plan({EN:'1',m.P+'offset_x':'-120'},baseline())
    disk=json.loads(j.path.read_text('utf-8'));check(disk['inflight'][EN]==['0','1'] and disk['expected']=={},'Durable before transport ACK')
    check(j.owned_value(EN,'1') and not j.owned_value(EN,'external'),'Lost ACK remains owned; unrelated value not owned')
    j.acknowledge({EN:'1',m.P+'offset_x':'-120'})
    j.plan({m.P+'offset_x':'120'},dict(baseline(),**j.data['expected']));j.acknowledge({m.P+'offset_x':'120'})
    check(not j.owned_value(m.P+'offset_x','-120'),'Old historical own value is no longer blanket ownership')
    for label,alter in [('kind',lambda d:d.update(kind='foreign')),('full',lambda d:d['baseline'].pop('user0')),('key',lambda d:d['restore'].update(user0='unchanged')),('baseline',lambda d:d['restore'].update({EN:'changed'})),('nonce',lambda d:d['metadata'].update(runId='other')),('resources',lambda d:d.pop('resourcesBefore')),('native',lambda d:d['metadata'].pop('nativeBaseline'))]:
        d=copy.deepcopy(j.data);alter(d);p=folder('bad-'+label)/'restore.json';m.atomic(p,d);raises(lambda p=p:m.Journal(p),ValueError)
    for label,flag in [('normal',None),('no-pixel','pixel_error'),('changed-pixel','external_pixel'),('changed-protection','external_final'),('failed-cleanup','cleanup_error'),('changed-resource','protect_error')]:
        owner=make(folder(label));owner.plan({EN:'1'},baseline());fake=Fake(owner);fake.current[EN]='1'
        if flag:setattr(fake,flag,True)
        with patch.object(m.time,'sleep',lambda _:None):
            if flag in ('external_pixel','external_final','cleanup_error','protect_error'):raises(fake.restore,m.extra.Inconclusive)
            else:fake.restore()
        check(fake.current[EN]=='0','Restore owned value even if fixture cleanup fails')
        check(fake.current[m.P+'offset_x']=='7' and len(fake.current)==497,'Keep original geometry/all unrelated keys')
        check(fake.report['wholeFeaturePassed'] is False,'Cleanup/pixels never become feature pass')
        if flag in ('external_pixel','external_final'):check(not owner.data['configurationRestored'] and owner.data['pending'],'Final race keeps recovery pending')
        elif flag in ('cleanup_error','protect_error'):check(owner.data['pending'],'Fixture/resource uncertainty remains pending')
        else:check(owner.data['configurationRestored'] and not owner.data['pending'],'Exact complete restoration')
        if flag=='pixel_error':check(owner.data['restoredPixels']=='not-observed','Pixel loss separate from configuration recovery')
    owner=make(folder('external-owned'));owner.plan({EN:'1',m.P+'width':'200'},baseline());owner.acknowledge({EN:'1',m.P+'width':'200'});fake=Fake(owner);fake.current.update({EN:'external',m.P+'width':'200'})
    with patch.object(m.time,'sleep',lambda _:None):raises(fake.restore,m.extra.Inconclusive)
    check(fake.current[EN]=='external' and fake.current[m.P+'width']=='164','External owned-key change preserved; other own value restored')
    check(all(EN not in x for x in fake.sets),'No overwrite of external value')
    owner=make(folder('external-unrelated'));owner.plan({EN:'1'},baseline());fake=Fake(owner);fake.current.update({EN:'1','user0':'external'})
    with patch.object(m.time,'sleep',lambda _:None):raises(fake.restore,m.extra.Inconclusive)
    check(fake.current[EN]=='0' and fake.current['user0']=='external' and owner.data['pending'],'Unrelated external change never overwritten')

    check(m.media_records(media())==[],'Recognized empty session list')
    for state in range(12):
        rows=m.media_records(media([('user.player',True,'PlaybackState {state=STATE('+str(state)+'), position=0}')]))
        check(m.no_user_playing(rows)==(state not in (3,4,5,6,8,9,10,11)),'Actual state safety gate '+str(state))
    check(m.no_user_playing(m.media_records(media([('user.player',False,'PlaybackState {state=3, position=0}'),('other',True,'null')]))),'Inactive/null sessions do not assert playback')
    check(m.no_user_playing(m.media_records(media([(m.PACKAGE,True,'PlaybackState {state=3, position=0}')]))),'Own no-audio session is allowed')
    for raw in ['',media().replace('have 0','have 1'),media([('u',True,'UNKNOWN')]),media([('u',True,'PlaybackState {state=12, position=0}')]),media().replace('User Records:','')]:raises(lambda raw=raw:m.media_records(raw),m.extra.Inconclusive)
    for real in [ROOT/'out/integration-20458/media-sessions-private.txt',ROOT/'out/island-validation-plan-20460/root-preflight/media-session-private.txt']:
        if real.exists():check(isinstance(m.media_records(real.read_text('utf-8')),list),'Read-only actual saved ROM format')
    n=notices([('user.app',7,'native'),(m.PACKAGE,1,'island-'+RUN)])
    check(len(m.notification_records(n,RUN))==1,'Only exact owned tag excluded from preservation comparison')
    for raw,nonce in [(n,None),(n,'c'*32),(notices([(m.PACKAGE,3,'island-'+RUN)]),RUN),('Permission Denial',RUN),('  Notification List:\n    NotificationRecord(unknown)\n  More:\n',RUN)]:raises(lambda raw=raw,nonce=nonce:m.notification_records(raw,nonce),m.extra.Inconclusive)
    check(m.fixture_valid(progress(),RUN)['phase']=='initial-paused','Current fixture identity valid')
    for kw in [{'runId':'c'*32},{'pid':-1},{'deadlineElapsed':181001},{'observedElapsed':999},{'ownNotificationIds':[99]},{'audioOutput':True},{'audioFocusRequested':True},{'phase':'unknown'},{'closed':None},{'contentCallbacks':-1}]:raises(lambda kw=kw:m.fixture_valid(progress(**kw),RUN),m.extra.Inconclusive)
    raises(lambda:m.fixture_valid(progress(pid=112),RUN,progress()),m.extra.Inconclusive)
    check(m.fixture_valid(progress(closed=True,error='cleanup source failure',phase='closed'),RUN)['error'],'Error terminal state remains available for recovery')

    windows,native,pill=owned_ui();node,xy=m.choose_capsule(windows,native,RUN,(1216,2688));check(node is pill and xy==(575,66),'Actual unique owned capsule selected')
    for label,change in [('focus',lambda w:w[0].update(focused=False)),('run',lambda w:w[0]['root'].update(text='Other run')),('description',lambda w:w[1]['root']['children'][0].update(description='User notification')),('invisible',lambda w:w[1]['root']['children'][0].update(visible=False)),('outside',lambda w:w[1]['root']['children'][0].update(bounds='[1,500][30,550]')),('duplicate',lambda w:w[1]['root']['children'].append(copy.deepcopy(w[1]['root']['children'][0]))),('panel',lambda w:w[0]['root']['children'].append({'visible':True,'id':m.extra.ID+'control_panel'})),('overlay',lambda w:w.append({'root':{'package':'other.overlay','visible':True,'bounds':'[100,0][1000,120]'}}))]:
        w=copy.deepcopy(windows);change(w);raises(lambda w=w:m.choose_capsule(w,native,RUN,(1216,2688)),m.extra.Inconclusive)
    raises(lambda:m.choose_capsule(windows,native.replace(m.BACKGROUND,m.CONTENT),RUN,(1216,2688)),m.extra.Inconclusive)
    short=native.replace(m.PACKAGE+'/'+m.BACKGROUND,m.PACKAGE+'/.IslandFixtureRunner$BackgroundActivity')
    check(m.foreground_component(short,m.BACKGROUND),'Short Activity component normalization')
    check(not m.foreground_component(native+'mResumedActivity=ActivityRecord{x u0 other.app/.Activity t2}',m.BACKGROUND),'Conflicting resumed component rejected')

    # Screenshots are actual bytes from a fake transport, not a diagnostic ACK.
    im=Image.new('RGB',(40,100),'gray');buf=io.BytesIO();im.save(buf,format='PNG');png=buf.getvalue()
    owner=make(folder('frames'));owner.data['metadata']['displaySize']=[40,100];fake=Fake(owner)
    class Transport:
        def adb(self,*a):return png
    fake.ar=Transport();clock=iter([1300,1330,1700,1730]);fake.elapsed=lambda:next(clock)
    with patch.object(m.time,'sleep',lambda _:None):row=fake.frames('valid',progress(),2000)
    check(len(row['frames'])==2 and not row['pixelPass'] and row['independentPixelReviewRequired'],'Original frames need independent review')
    clock=iter([1900,2030]);fake.elapsed=lambda:next(clock)
    with patch.object(m.time,'sleep',lambda _:None):raises(lambda:fake.frames('late',progress(),2000),m.extra.Inconclusive)
    check((fake.folder/'late/frame-00.png').read_bytes()==png and json.loads((fake.folder/'late/frames.json').read_text())[0]['beforeDeadline'] is False,'Late evidence preserved without passing missed window')
    check(len(fake.report['cases'])==1,'Late frame not promoted to completed case')
    owner.data['metadata']['displaySize']=[100,40];clock=iter([1300,1330]);fake.elapsed=lambda:next(clock)
    raises(lambda:fake.frames('changed-profile',progress()),m.extra.Inconclusive)

    # The actual command method journals before transport, and does not replay an uncertain command.
    owner=make(folder('command'));fake=Fake(owner);fake.elapsed=lambda:2000;v=progress();fake.progress=lambda:dict(v)
    class Commands:
        def shell(self,cmd,**kw):
            d=json.loads(owner.path.read_text('utf-8'))
            check(d['fixture']['commandAttempt']=={'sequence':1,'command':'play'},'Command write-ahead durable before broadcast')
            raise TimeoutError('Transport acknowledgement lost')
    fake.ar=Commands();raises(lambda:fake.command('play'),TimeoutError)
    check(owner.data['fixture']['sequence']==0,'No synthetic source ACK')
    v['sequence']=1;raises(lambda:fake.command('pause'),m.extra.Inconclusive)
    owner.data['fixture']['sequence']=1;v['deadlineElapsed']=15000;raises(lambda:fake.command('pause'),m.extra.Inconclusive)
    owner=make(folder('finish-deadline'));fake=Fake(owner);fake.elapsed=lambda:176001
    before=progress();after=progress(closed=True,phase='closed',sessionReleased=True)
    values=iter([before,after]);fake.progress=lambda:next(values)
    class FinishTransport:
        def shell(self,cmd,**kw):check(' --es command finish' in cmd,'Only exact own finish')
    fake.ar=FinishTransport();result=fake.command('finish',True)
    check(result['closed'] and owner.data['fixture']['sequence']==0,'Actual deadline cleanup accepted without forged sequence')
    check(owner.data['fixture']['finishCommandAcknowledged'] is False and owner.data['fixture']['finishOutcome']=='owned-terminal-observed','Terminal outcome distinguished from command ACK')
    owner=make(folder('closed-command'));fake=Fake(owner);fake.elapsed=lambda:2000;values=iter([before,after]);fake.progress=lambda:next(values)
    class NormalTransport:
        def shell(self,*a,**kw):return ''
    fake.ar=NormalTransport();raises(lambda:fake.command('play'),m.extra.Inconclusive)

    # Real cleanup path requires both source cleanup and independent native disappearance.
    owner=make(folder('cleanup'));fake=Fake(owner);owner.data['metadata']['fixtureApkSha256']='f'*64;owner.data['fixture']['startAttempted']=True
    terminal=progress(closed=True,phase='closed',sessionReleased=True,receiverRegistered=False,channelPresent=False,activitiesFinishing=True,error='Source failed before cleanup')
    fake.progress=lambda:dict(terminal)
    class Native:
        sessions=media();notifications=notices()
        def shell(self,cmd,**kwargs):
            if cmd=='dumpsys media_session':return self.sessions
            if cmd=='dumpsys notification':return self.notifications
            raise AssertionError('Unexpected native operation')
    fake.ar=Native()
    with patch.object(m,'apk_hash',lambda *_:'f'*64):
        m.Collector.cleanup_fixture(fake)
        check(owner.data['fixture']['cleanupVerified'],'Failed source can still have verified cleanup')
        for key,bad in [('closed',False),('sessionReleased',False),('ownNotificationIds',[1]),('receiverRegistered',True),('channelPresent',True),('activitiesFinishing',False)]:
            old=terminal[key];terminal[key]=bad
            if key=='closed':
                fake.command=lambda *args:dict(terminal)
            raises(lambda:m.Collector.cleanup_fixture(fake),m.extra.Inconclusive);terminal[key]=old
        fake.ar.sessions=media([(m.PACKAGE,False,'PlaybackState {state=2, position=0}')]);raises(lambda:m.Collector.cleanup_fixture(fake),m.extra.Inconclusive)
        fake.ar.sessions=media();fake.ar.notifications=notices([(m.PACKAGE,1,'island-'+RUN)]);raises(lambda:m.Collector.cleanup_fixture(fake),m.extra.Inconclusive)
        fake.ar.notifications=notices([('user.new',12,'arrived')]);raises(lambda:m.Collector.cleanup_fixture(fake),m.extra.Inconclusive)
        check(not any(x.get('command')=='cancelAll' for x in owner.data['history']),'No user-notification cleanup operation')
    with patch.object(m,'apk_hash',lambda *_:'e'*64):raises(lambda:m.Collector.cleanup_fixture(fake),m.extra.Inconclusive)
    fake.progress=lambda:None
    with patch.object(m,'apk_hash',lambda *_:'f'*64):raises(lambda:m.Collector.cleanup_fixture(fake),m.extra.Inconclusive)

    # Execute the real click method with controlled transports, costs and actual-style UI data.
    class FakeClick(Fake):
        def __init__(self,journal):
            super().__init__(journal);self.clock=100.;self.tree_cost=1.4;self.focus_cost=.1;self.progress_cost=.1;self.elapsed_cost=.1;self.observe_cost=.7;self.now=5000
            self.windows,self.native,_=owned_ui();self.source=progress(phase='notice-click',ownNotificationIds=[2],sessionReleased=True,sequence=4,observedElapsed=2000)
            self.final_changes={};self.commands=[];self.taps=[];self.calls=[];self.allow_callback=True;self.wrong_post=False
            journal.data['metadata']['displaySize']=[1216,2688];journal.data['fixture']['identity']={k:self.source[k] for k in ['pid','startedElapsed','deadlineElapsed']}
            self.report['cases']=[{'phase':'notification-appeared','frames':[{'size':[1216,2688]},{'size':[1216,2688]}]}]
            (self.folder/'click-source-fresh').mkdir()
            outer=self
            class UI:
                def all_windows(self,label):outer.calls.append('tree');outer.clock+=outer.tree_cost;return outer.windows
            class AR:
                def shell(self,cmd,**kwargs):
                    if cmd=='dumpsys activity activities':outer.calls.append('focus');outer.clock+=outer.focus_cost;return outer.native
                    if cmd.startswith('input tap '):outer.calls.append('tap');outer.taps.append(cmd);outer.clock+=.05;return ''
                    raise AssertionError('Unrelated shell operation in click path')
                def adb(self,*args,**kwargs):raise AssertionError('Redundant screenshot in the fresh click path')
            self.ui=UI();self.ar=AR()
        def command(self,name):self.commands.append(name);self.calls.append('observe');self.clock+=self.observe_cost;return dict(self.source)
        def progress(self):
            self.calls.append('source');self.clock+=self.progress_cost;d=dict(self.source,**self.final_changes)
            if self.taps and self.allow_callback:d.update(contentCallbacks=1,contentKind='CLICK')
            return d
        def elapsed(self):self.calls.append('elapsed');self.clock+=self.elapsed_cost;return self.now
        def observe_all(self,label):
            check(label=='source-opened','Only post-click full image/tree observation');self.calls.append('source-opened');self.clock+=1
            w,n,_=owned_ui();w[0]['root']['text']='Duo 已打开自有来源\n'+RUN+'\nCLICK';n=n.replace(m.BACKGROUND,'wrong.Activity' if self.wrong_post else m.CONTENT)
            return w,n,(1216,2688)
    def click(name,change=None,expected=True):
        c=FakeClick(make(folder('click-'+name)))
        if change:change(c)
        with patch.object(m.time,'monotonic',lambda:c.clock),patch.object(m.time,'sleep',lambda s:setattr(c,'clock',c.clock+s)):
            if expected:m.Collector.click_source(c,progress(),20000)
            else:raises(lambda:m.Collector.click_source(c,progress(),20000),m.extra.Inconclusive)
        stored=json.loads((c.folder/'report.json').read_text('utf-8'))
        check('sourceClickAttempt' in stored and stored['sourceClickAttempt']['stages'],'All outcomes persist real stage timing')
        check(c.commands==['observe'],'Exactly one observe, no repost or deadline renewal')
        return c
    c=click('positive');a=c.report['sourceClickAttempt']
    check(c.taps==['input tap 575 66'] and c.calls.index('observe')<c.calls.index('tree')<c.calls.index('focus')<c.calls.index('tap'),'Observe before fresh tree; only exact node point tapped')
    check(abs(a['freshAgeMs']-1700)<.001 and a['deadlineMarginMs']==15000,'Measured fresh age excludes earlier source command; actual phone deadline recorded')
    check(a['tapAttempted'] and a['tapCompleted'] and a['outcome']=='exact-owned-source-opened' and c.report['sourceClick']['pixelPass'] is False,'Exact callback/foreground required; no pixel pass')
    check([s['stage'] for s in a['stages']]==['source-observe-before-fresh-ui','fresh-all-window-tree','fresh-native-focus','fresh-window-dimension-check','fresh-ownership-validation','final-source-state-read','final-phone-elapsed-read','owned-source-tap','source-callback-wait','source-opened-full-evidence'],'Timing covers every expensive operation')
    for name,change in [('slow-tree',lambda c:setattr(c,'tree_cost',2.202)),('slow-final-clock',lambda c:setattr(c,'elapsed_cost',.902)),('deadline-equal',lambda c:setattr(c,'now',18000)),('deadline-past',lambda c:setattr(c,'now',21000)),('source-closed',lambda c:c.final_changes.update(closed=True)),('id-missing',lambda c:c.final_changes.update(ownNotificationIds=[])),('other-id',lambda c:c.final_changes.update(ownNotificationIds=[1,2])),('already-clicked',lambda c:c.final_changes.update(contentCallbacks=1)),('seq-changed',lambda c:c.final_changes.update(sequence=5)),('phase-changed',lambda c:c.final_changes.update(phase='released')),('source-error',lambda c:c.final_changes.update(error='failed')),('source-audio',lambda c:c.final_changes.update(musicActive=True)),('foreign-run',lambda c:c.final_changes.update(runId='c'*32)),('foreign-pid',lambda c:c.final_changes.update(pid=112)),('clock-backward',lambda c:setattr(c,'now',1999)),('root-size',lambda c:c.windows[0]['root'].update(bounds='[0,0][1000,2688]')),('rotated-window',lambda c:c.windows[0].update(bounds='[0,0][2688,1216]')),('letterbox',lambda c:c.windows[0].update(bounds='[1,0][1217,2688]')),('old-png-size',lambda c:c.report['cases'][0]['frames'][1].update(size=[1080,2400])),('missing-originals',lambda c:c.report.update(cases=[])),('wrong-foreground',lambda c:setattr(c,'native',c.native.replace(m.BACKGROUND,m.CONTENT))),('overlay',lambda c:c.windows.append({'root':{'package':'foreign','visible':True,'bounds':'[400,0][900,120]'}})),('missing-run-title',lambda c:c.windows[0]['root'].update(text='Duo 灵动岛事件验证\nother')),('duplicate-pill',lambda c:c.windows[1]['root']['children'].append(copy.deepcopy(c.windows[1]['root']['children'][0]))),('not-visible',lambda c:c.windows[1]['root']['children'][0].update(visible=False))]:
        c=click(name,change,False);check(not c.taps and not c.report['sourceClickAttempt']['tapAttempted'],'Unsafe observation never sends input: '+name)
    c=click('deadline-one-ms',lambda c:setattr(c,'now',17999));check(c.report['sourceClickAttempt']['deadlineMarginMs']==2001,'Strictly more than 2 seconds allowed')
    c=click('age-below',lambda c:setattr(c,'tree_cost',2.199));check(2498<c.report['sourceClickAttempt']['freshAgeMs']<2500,'Just below 2.5 seconds still requires every other gate')
    c=click('no-callback',lambda c:setattr(c,'allow_callback',False),False);check(c.taps and 'sourceClick' not in c.report,'Submitted input without actual callback not success')
    c=click('wrong-source-page',lambda c:setattr(c,'wrong_post',True),False);check(c.taps and 'sourceClick' not in c.report,'Callback alone insufficient without exact foreground source')

    # Full reads are outside short events; preparation precedes the fixed lifetime.
    owner=make(folder('sequence'));fake=Fake(owner);calls=[]
    fake.identity=lambda label:calls.append(('identity',label));fake.media=lambda label,*args:calls.append(('media',label));fake.notices=lambda label:calls.append(('notices',label))
    fake.start_fixture=lambda:(calls.append(('start',None)) or progress())
    fake.observe_all=lambda label:(calls.append(('tree',label)) or (owned_ui()[0],owned_ui()[1],(1216,2688)))
    def setting(label,values):calls.append(('set',label));fake.current.update(values);fake.journal.data['expected'].update(values)
    fake.set=setting;fake.command=lambda name:(calls.append(('command',name)) or progress(phase='playing'))
    fake.frames=lambda label,*args:(calls.append(('frame',label)) or {})
    fake.wait_after=lambda event,ms:calls.append(('wait',ms));fake.protected=lambda label:calls.append(('protect',label))
    fake.exercise();start=calls.index(('start',None));first=calls.index(('command','play'));last=calls.index(('frame','released'))
    check(calls.index(('set','prepare-disabled'))<start,'Slow preparation before lifetime')
    check(sum(x[0]=='set' for x in calls[start:])==1,'Only one full configuration change during fixture lifetime')
    check(not any(x[0] in ('set','tree','identity','protect','notices') for x in calls[first:last+1]),'No slow complete queries within short lifecycle event sequence')
    check(('wait',4700) in calls,'Pause grace actually exceeded')
    check([x[1] for x in calls if x[0]=='command']==['observe','play','pause','play','stop','release'],'Actual lifecycle source sequence, no invented timer/navigation feature')

print(json.dumps({'status':'pass','checks':checks,'phoneUsed':False,'scope':'collector ownership, durable recovery, fresh source/click/window evidence; not Android or module behavior'},indent=2))
