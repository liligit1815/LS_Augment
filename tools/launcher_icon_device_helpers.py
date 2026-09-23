"""Real settings/picker/desktop operations for disposable launcher icon cases."""
import json
import re
import shlex
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, shell, snapshot, tap
from module_ui_helpers import hierarchy, matches, tap_node

PACKAGE = 'ls.augment.regression.launcher'


def saved(key='launcher_overrides'):
    raw=shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml',root=True)
    return next((n.text or '' for n in ET.fromstring(raw) if n.get('name')=='ls_augment_'+key),'')


def choose_fixture(label, user=None):
    if user is not None:
        root=hierarchy(label+'-space-before')
        fields=[n for n in root.iter('node') if n.get('class')=='android.widget.CheckedTextView' and n.get('visible-to-user')=='true']
        assert len(fields)==1
        if fields[0].get('text')!=user:
            tap_node(label+'-space',fields[0]);tap(label+'-select-space',user)
    tap(label+'-choose','选择应用')
    for i in range(8):
        root=hierarchy(label+'-loading'+str(i));fields=matches(root,'搜索名称或包名')
        if fields:break
        time.sleep(.5)
    else:raise AssertionError('The real application picker did not load')
    tap_node(label+'-search',fields[0]);shell('input text '+PACKAGE);shell('input keyevent 4')
    root=hierarchy(label+'-filtered')
    found=[n for n in root.iter('node') if n.get('visible-to-user')=='true' and n.get('text','').endswith('\n'+PACKAGE)]
    assert len(found)==1
    tap_node(label+'-select',found[0]);return hierarchy(label+'-selected')


def edit_name(label, text):
    root=hierarchy(label+'-before');fields=[n for n in root.iter('node') if n.get('visible-to-user')=='true' and n.get('class')=='android.widget.EditText']
    assert len(fields)==1
    tap_node(label+'-field',fields[0]);shell('input keyevent 123')
    old=fields[0].get('text','')
    if old=='自定义名称，留空恢复原名':old=''
    if old:shell('input keyevent '+' '.join(['67']*len(old)))
    if text:shell('input text '+shlex.quote(text))
    shell('input keyevent 4');return hierarchy(label+'-after')


def open_editor(label):
    shell('am start -W -n ls.augment.com/.SettingsActivity')
    for i in range(5):
        root=hierarchy(label+'-home'+str(i))
        if matches(root,'应用增强'):break
        shell('input keyevent 4')
    else:raise AssertionError('Module overview unavailable')
    tap(label+'-apps','应用增强');tap(label+'-editor','APP图标名称编辑')


def desktop(label, expected):
    shell('input keyevent 3');shell('input keyevent 3');time.sleep(.6)
    observations=[]
    for i in range(9):
        folder=snapshot(label+'-'+str(i),verbose=False);root=ET.fromstring((folder/'window.xml').read_bytes())
        found=[n.attrib for n in root.iter('node') if n.get('visible-to-user')=='true' and n.get('text') in expected]
        observations.append({'evidence':folder.name,'icons':found})
        if all(any(n.get('text')==name for n in found) for name in expected):break
        if i<8:
            shell('input swipe '+('1000 1800 180 1800' if i<4 else '180 1800 1000 1800')+' 450');time.sleep(.3)
    else:raise AssertionError('Expected desktop icons not visible: '+str(expected))
    (folder/'matched-icons.json').write_text(json.dumps(observations,ensure_ascii=False,indent=2),encoding='utf-8')
    return folder,found
