"""Operate the module's real settings controls using freshly observed Android nodes."""
import json
import re
import shlex
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, shell, snapshot, tap as _tap


def wake():
    if 'mWakefulness=Awake' not in shell('dumpsys power'):
        shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard')


def tap(label,text):
    wake();return _tap(label,text)


def hierarchy(label):
    wake()
    folder=snapshot(label,verbose=False)
    return ET.fromstring((folder/'window.xml').read_bytes())


def visible(node):
    return node.get('visible-to-user')=='true'


def matches(root,text):
    return [n for n in root.iter('node') if visible(n) and text in (n.get('text'),n.get('content-desc'))]


def tap_node(label,node):
    b=list(map(int,re.findall(r'-?\d+',node.get('bounds',''))))
    assert len(b)==4 and b[2]>b[0] and b[3]>b[1],b
    x,y=(b[0]+b[2])//2,(b[1]+b[3])//2
    shell(f'input tap {x} {y}')
    folder=OUTPUT/label;folder.mkdir(exist_ok=True)
    (folder/'action.json').write_text(json.dumps({'node':node.attrib,'x':x,'y':y},ensure_ascii=False,indent=2),encoding='utf-8')


def scroll(root,up=False,short=False):
    areas=[n for n in root.iter('node') if visible(n) and n.get('class')=='android.widget.ScrollView']
    assert areas,'No visible module scroll area'
    b=list(map(int,re.findall(r'-?\d+',areas[0].get('bounds'))))
    x=(b[0]+b[2])*3//5;low=min(2420,b[3]-140);high=max(550,b[1]+140)
    # A fast full-height swipe flings past unseen cards on the long settings
    # pages. Keep each movement smaller than the visible viewport.
    high=max(high,low-(450 if short else 1000))
    shell(f'input swipe {x} {high if up else low} {x} {low if up else high} 800');time.sleep(.3)


def find(label,text,up=False):
    for attempt in range(15):
        root=hierarchy(label+'-find'+str(attempt))
        found=matches(root,text)
        if found:return root,found
        scroll(root,up)
    raise AssertionError('Module control not found: '+text)


def open_system_group(label,title):
    shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard')
    shell('am start -W -n ls.augment.com/.SettingsActivity')
    root=hierarchy(label+'-home')
    for _ in range(4):
        if matches(root,'应用增强'):break
        shell('input keyevent 4');root=hierarchy(label+'-back'+str(_))
    tap(label+'-system','系统增强')
    find(label+'-group',title);tap(label+'-open',title)


def row_button(label,title,up=False):
    for attempt in range(4):
        root,found=find(label+'-row'+str(attempt),title,up)
        parent={child:node for node in root.iter() for child in node}
        current=found[0]
        while current in parent:
            current=parent[current]
            buttons=[n for n in current.iter('node') if n.get('class')=='android.widget.Button']
            if len(buttons)==1:
                if visible(buttons[0]):tap_node(label+'-button',buttons[0]);return
                break
        scroll(root,short=True)
    raise AssertionError('No visible button for '+title)


def replace_dialog_value(label,new):
    root=hierarchy(label+'-dialog');fields=[n for n in root.iter('node') if visible(n) and n.get('class')=='android.widget.EditText']
    assert len(fields)==1
    field=fields[0];tap_node(label+'-field',field)
    shell('input keyevent 123')
    old=field.get('text','')
    if old:shell('input keyevent '+' '.join(['67']*len(old)))
    if new:shell('input text '+shlex.quote(new))
    shell('input keyevent 4');time.sleep(.2)


def setting(key):
    raw=shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml',root=True)
    node=next(n for n in ET.fromstring(raw) if n.get('name')=='ls_augment_'+key)
    return (node.text or '') if node.tag=='string' else node.get('value')
