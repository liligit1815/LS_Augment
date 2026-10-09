"""Focused offline safety/merge/recovery tests. No ADB, phone or Gradle."""
from pathlib import Path
import copy,importlib.util,json,sys,tempfile
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
import adb_regression as ar
with patch.object(ar,'shell',side_effect=AssertionError('Device call during import')),patch.object(ar,'adb',side_effect=AssertionError('Device call during import')):
    import main_statusbar_device_collector as m
count=0
def require(condition,label):
    global count
    assert condition,label;count+=1
def rejects(fn,label):
    try:fn()
    except (ValueError,RuntimeError,AssertionError):require(True,label);return
    raise AssertionError('Must reject: '+label)

h='a'*64;raw='2;all:global=original;main:battery=original;control:clock=font:'+'b'*64
merged=m.font_with(raw,h)
require(merged=='2;all:global=original;main:clock=font:'+h+';main:battery=original;control:clock=font:'+'b'*64,'Only main clock changes; user font roles/scopes preserved')
require(m.font_with('1;global=original',h)=='2;all:global=original;main:clock=font:'+h,'Shared old format retained')
rejects(lambda:m.font_with('1;main:clock=original',h),'V1 scoped malformed rejected')
rejects(lambda:m.font_with('2;main:clock=original;main:clock=original',h),'Duplicate roles rejected')
inv={'surfaces':{'main':[{'id':i,'state':'visible','coveredBy':'','capability':'whole_layers'}for i in ['mobile1.signal','mobile2.signal','wifi.signal','volume']]}}
require(m.dual_ready(inv),'Both actual independent SIM signals required')
for field,value in [('state','hidden'),('coveredBy','connectivity'),('capability','observe_only')]:
    bad=copy.deepcopy(inv);bad['surfaces']['main'][1][field]=value
    require(not m.dual_ready(bad),'SIM not forced: '+field)
require(not m.dual_ready({'surfaces':{'control':inv['surfaces']['main']}}),'Header observation cannot authorize main dual SIM')
require([list(v.values())for _,v in m.row_plan()]==[['0','0'],['1','0'],['0','1'],['1','1']],'Independent row mapping matrix, not only coupled00/11')
require(all(set(values)=={m.SYSTEM,m.NOTIFICATIONS} for _,values in m.row_plan()),'Rows do not touch clock/grid/neighbor visibility')

with tempfile.TemporaryDirectory(prefix='main-statusbar-local-') as temp:
    folder=Path(temp)
    pack=m.make_pack(inv,folder,'offline')
    require(set(pack['signals'])=={'mobile1.signal','mobile2.signal','wifi.signal'},'Only actually visible signals selected')
    require(all(r[10]=='main' for r in m.wifi.theme_rows(pack['theme'])),'No foreign surface artwork override')
    require(pack['animationTarget']=='volume','Existing visible animation target selected')
    _,original=m.checked_pack('signal-state-test-fixture.zip');_,spin=m.checked_pack('gentle-spin-1.0.0.zip')
    import zipfile
    with zipfile.ZipFile(pack['path']) as z:
        manifest=json.loads(z.read('manifest.json'))
        require(all(z.read(file)==dict(original,**spin)[h] for h,file in manifest['images'].items()),'Real user PNG and animation bytes unchanged')
        require(manifest['fontFiles']=={} and manifest['fonts']=='','Pack cannot touch font roles')
    whole='1;volume,default,whole,'+'c'*64+',0,100,0,0,100,0'
    rejects(lambda:m.make_pack(inv,folder,'covered',whole),'Whole-image user binding prevents misleading background animation')
    baseline={m.SYSTEM:'0',m.NOTIFICATIONS:'0',m.DUAL:'0',m.ART:'',m.FONT:'',m.P+'statusbar_clock_pattern':'HH:MMIIE',m.P+'statusbar_grid_v2':'USER_NEIGHBORS'}
    baseline.update({'fixtureKey'+str(i):'unchanged' for i in range(490)})
    require(len(baseline)==497,'Whole schema fixture')
    j=m.Journal(folder/'restore.json',baseline,{'nativeBaseline':{'global/wifi_on':'1'}},resources_before={'existing':'hash'},names_before={'existing':'name'})
    initial=json.loads(j.path.read_text())
    require(initial['resourcesBefore']=={'existing':'hash'} and initial['namesBefore']=={'existing':'name'},'First atomic journal already contains complete resource recovery inputs')
    rejects(lambda:j.plan({m.P+'statusbar_clock_pattern':'Mi1W'},baseline),'No clock format rewrite')
    rejects(lambda:j.plan({m.P+'statusbar_grid_v2':''},baseline),'No hidden neighbors through grid rewrite')
    rejects(lambda:j.plan({m.SYSTEM:'2'},baseline),'Nonbinary row setting rejected')
    j.plan({m.SYSTEM:'1'},baseline)
    require(j.data['inflight'][m.SYSTEM]==['0','1'] and json.loads(j.path.read_text())['pending'],'Write-ahead before UI save')
    require(j.owned_value(m.SYSTEM,'1'),'Recovery recognizes unacknowledged applied value')
    require(not j.owned_value(m.SYSTEM,'unknown'),'Unowned external setting not overwritten')
    j.acknowledge({m.SYSTEM:'1'})
    require(j.data['expected'][m.SYSTEM]=='1' and not j.data['inflight'],'Acknowledged exact current value')
    resources={'original.asset':'hash1'};names={'original':'User Name'}
    def recovery(change=None,resource=None,native=None):
        local=m.Journal(folder/(str(len(list(folder.iterdir())))+'-restore.json'),baseline,{'nativeBaseline':{'global/wifi_on':'1'}})
        local.plan({m.SYSTEM:'1'},baseline);local.acknowledge({m.SYSTEM:'1'})
        local.data.update(resourcesBefore=resources,namesBefore=names)
        current=dict(baseline);current[m.SYSTEM]='1'
        if change:current.update(change)
        collector=m.Collector.__new__(m.Collector);collector.journal=local;collector.report={};collector.persist=lambda:None
        saved=[]
        def instrument(op,label,values=None):
            if op=='set':saved.append(values);current.update(values);return {}
            return {'settings':dict(current)}
        collector.instrument=instrument;collector.resources=lambda:dict(resources,**(resource or {}));collector.names=lambda:dict(names);collector.native=lambda:native or {'global/wifi_on':'1'}
        with patch.object(m.time,'sleep',lambda _:None):
            try:collector.restore()
            except RuntimeError:pass
        return local,saved,current
    local,saved,after=recovery()
    require(not local.data['pending'] and local.data['configurationRestored'] and after==baseline,'Full497 successful restore requires exact equality')
    local,saved,after=recovery({m.SYSTEM:'outside'})
    require(local.data['pending'] and after[m.SYSTEM]=='outside' and not saved,'External row value preserved with pending journal')
    local,saved,after=recovery({'fixtureKey12':'external'})
    require(local.data['pending'] and after['fixtureKey12']=='external','Untouched-key change also keeps restore pending')
    local,_,_=recovery(resource={'original.asset':'changed'})
    require(local.data['pending'] and local.data['resourceDifferences'],'Original bytes mismatch cannot become restored')
    local,_,_=recovery(native={'global/wifi_on':'0'})
    require(local.data['pending'] and not local.data['nativeSettingsUnchanged'],'Radio restoration cannot be invented')
    local,_,_=recovery(resource={'new.asset':'owned'})
    require(not local.data['pending'] and local.data['retainedNewResources']=={'new.asset':'owned'},'New resources retained, never deleted')

def node(text='',children=None,**kw):return dict(package='ls.augment.com',text=text,visible=True,enabled=True,clickable=False,children=children or [],**kw)
button=node('导入字体');button['clickable']=True
clock=node(children=[node('时钟'),button]);other=node(children=[node('统一字体'),dict(button)])
windows=[{'root':node(children=[other,clock])}]
require(m.choose_card_button(windows,'时钟','导入字体') is button,'Actual clock card button, not global font button')
windows[0]['root']['children'].append(copy.deepcopy(clock))
require(m.choose_card_button(windows,'时钟','导入字体') is None,'Ambiguous duplicate clock card rejected')
owned=node('Apply');owned['clickable']=True
foreground={'type':1,'active':True,'focused':True,'root':node(children=[owned])}
native='mCurrentFocus=Window{abc u0 ls.augment.com/.StatusBarAssetsActivity}'
require(m.interactive_window([foreground],native,owned) is foreground,'Editor target has both UI-window and native focus evidence')
overlay={'type':1,'active':True,'focused':True,'root':dict(package='com.android.permissioncontroller',children=[])}
underlying=copy.deepcopy(foreground);underlying.update(active=False,focused=False)
rejects(lambda:m.interactive_window([underlying,overlay],native,underlying['root']['children'][0]),'Visible underlying editor cannot receive an overlay tap')
rejects(lambda:m.interactive_window([foreground,overlay],native,owned),'Multiple focused windows are ambiguous')
rejects(lambda:m.interactive_window([foreground],'mCurrentFocus=Window{abc u0 other.app/.Main}',owned),'Native focus disagrees with accessibility')
rejects(lambda:m.interactive_window([foreground],native,copy.deepcopy(owned)),'Equal-looking node from another tree is not the observed target')
source=(ROOT/'tools/main_statusbar_device_collector.py').read_text('utf8')
require('svc wifi' not in source and 'dumpsys battery set' not in source and 'kill -9' not in source,'No radio forcing, battery mock or SystemUI kill')
require("grid(only=" not in source and "'Mi1W'" not in source,'No isolated-neighbor shortcut or user text replacement')
require("self.before('font-apply-ui'" not in source and "self.ui_before_apply('font-apply-ui'" in source,'No target-app instrumentation destroys font draft before Apply')
require("self.instrument('statusbar-assets-screen-off'" not in source,'No extra legacy screen-off instrumentation lifecycle')
require(source.index('resources_before=reader.resources()')<source.index("journal=Journal(folder/'restore.json'"),'Read-only resource failure cannot strand a journal missing its baseline')
require("if not font['alreadyImported']:self.stage" in source and "self.font_button('选择已导入字体')" in source,'Already imported font uses real selection without rewriting bytes')
require("'status':'reconstructed_for_recovery'" in source,'Missing report never blocks valid journal recovery')
print(json.dumps({'passed':count,'adbInvoked':False,'productionChanged':False}))
