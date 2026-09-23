"""Drive the actual new clock-font controls and verify persisted values and pixels."""
import json
import xml.etree.ElementTree as ET
import numpy as np
from PIL import Image
from statusbar_device_helpers import *
from adb_regression import snapshot, tap

folder=OUTPUT/'round14b-font-ui-results';folder.mkdir(exist_ok=True)
results=[]

def find(label,text,up=False):
    for attempt in range(8):
        p=snapshot(label+'-find'+str(attempt),verbose=False)
        root=ET.fromstring((p/'window.xml').read_bytes())
        matches=[n for n in root.iter('node') if n.get('visible-to-user')!='false' and text in (n.get('text'),n.get('content-desc'))]
        if matches:return root,matches
        scrolls=[n for n in root.iter('node') if n.get('class')=='android.widget.ScrollView' and n.get('visible-to-user')!='false']
        assert scrolls, text
        b=list(map(int,re.findall(r'-?\d+',scrolls[0].get('bounds'))))
        x=(b[0]+b[2])*3//5;low=min(2450,b[3]-150);high=max(600,b[1]+150)
        shell(f'input swipe {x} {high if up else low} {x} {low if up else high} 350');time.sleep(.2)
    raise AssertionError('Control not found: '+text)

def value(key):
    raw=shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml',root=True)
    node=next(n for n in ET.fromstring(raw) if n.get('name')=='ls_augment_'+key)
    return node.text if node.tag=='string' else node.get('value')

def edit(label,description,new):
    root,matches=find(label,description)
    field=next(n for n in matches if n.get('class')=='android.widget.EditText')
    old=field.get('text','')
    tap(label+'-tap',description)
    shell('input keyevent 123')
    if old:shell('input keyevent '+' '.join(['67']*len(old)))
    shell('input text '+new);shell('input keyevent 4');time.sleep(1)

def sample(label):
    observed=observe(label)
    a=np.array(Image.open(OUTPUT/label/'screen.png').convert('RGB'))[:260]
    mask=a.max(axis=2)<180;y,x=np.where(mask)
    return {'text':clock(observed)['text'],'ink':[int(x.min()),int(y.min()),int(x.max()+1),int(y.max()+1)],'pixels':int(mask.sum())}

def check(name,condition,evidence):
    results.append({'case':name,'pass':bool(condition),'evidence':evidence})
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    assert condition, results[-1]

configure('round14b-font-ui-start',{'systemui_master':1,'statusbar_grid_v2':grid({'clock':{'zone':'CS'}},only=['clock']),
    'statusbar_height_dp':80,'statusbar_clock_custom':1,'statusbar_clock_rows':1,'statusbar_clock_pattern':"'Mi1W'",
    'statusbar_clock_pattern_second':'','statusbar_clock_size_sp':13,'statusbar_clock_font_family':'monospace',
    'statusbar_clock_weight':400,'statusbar_clock_line_spacing_dp':0,'statusbar_clock_letter_spacing':0,'statusbar_clock_width_dp':0})
tap('round14b-font-ui-system-open','系统增强');tap('round14b-font-ui-status-open','打开状态栏详情');tap('round14b-font-ui-tab','时钟')
find('round14b-font-ui-section','字体与排版');tap('round14b-font-ui-expand','字体与排版')
before=sample('round14b-font-ui-before-edit')
edit('round14b-font-ui-size-edit','单独字号 sp（0 使用上方大小）','26')
after=sample('round14b-font-ui-size26')
check('actual-size-edit',float(value('statusbar_clock_size_sp'))==26 and after['ink'][3]-after['ink'][1]>(before['ink'][3]-before['ink'][1])*1.8,after)
edit('round14b-font-ui-family-edit','字体名称（sans-serif / serif / monospace）','serif')
serif=sample('round14b-font-ui-serif')
check('actual-family-edit',value('statusbar_clock_font_family')=='serif' and abs(serif['pixels']-after['pixels'])>100,serif)
edit('round14b-font-ui-invalid-size','单独字号 sp（0 使用上方大小）','41')
check('invalid-size-preserves-value',float(value('statusbar_clock_size_sp'))==26,sample('round14b-font-ui-invalid-rejected'))
edit('round14b-font-ui-repair-draft','单独字号 sp（0 使用上方大小）','26')
root,matches=find('round14b-font-ui-grid-size','大小 · 13',up=True)
label=matches[0]
parent=next(n for n in root.iter('node') if label in list(n))
items=list(parent);bar=next(n for n in items[items.index(label)+1:] if n.get('class')=='android.widget.SeekBar')
b=list(map(int,re.findall(r'-?\d+',bar.get('bounds'))))
shell(f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}');time.sleep(1)
current=value('statusbar_grid_v2');size=int(next(i for i in current.split(';') if i.startswith('clock,')).split(',')[3])
result=sample('round14b-font-ui-grid-restored')
check('grid-size-clears-override',float(value('statusbar_clock_size_sp'))==0 and size!=13 and result['ink'][3]-result['ink'][1]<serif['ink'][3]-serif['ink'][1],{'size':size,'display':result})
print('Four actual clock-font UI cases passed')
