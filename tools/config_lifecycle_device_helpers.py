"""Real SAF lifecycle evidence; fixture bytes never commit without an explicit UI click."""
import json,re,time
from adb_regression import OUTPUT,adb,shell
from fan_device_helpers import prefs
from game_device_helpers import touch,capture
from module_ui_helpers import hierarchy,visible,tap_node
EVENTS='/data/user/0/ls.augment.regression.importio/files/import-io-events.jsonl'
def events():
    raw=shell('/system/bin/cat '+EVENTS,root=True)
    return raw,[json.loads(s) for s in raw.splitlines() if s.strip()]
def open_import(label):
    shell('am start -W -f 0x10008000 -n ls.augment.com/.ConfigTransferActivity',root=True)
    touch(label+'-import',text='导入配置')
    root=hierarchy(label+'-picker')
    if any(n.get('text')=='03-slow-healthy.json' and visible(n) for n in root.iter('node')):return
    handles=[n for n in root.iter('node') if visible(n) and (n.get('content-desc') in ('显示根目录','Show roots') or n.get('resource-id')=='android:id/home')]
    assert len(handles)==1,[n.attrib for n in handles]
    tap_node(label+'-drawer',handles[0]);root=hierarchy(label+'-roots')
    parents={c:n for n in root.iter() for c in n}
    def in_roots(n):
        while n in parents:
            n=parents[n]
            if n.get('resource-id')=='com.android.documentsui:id/roots_list':return True
        return False
    found=[n for n in root.iter('node') if visible(n) and n.get('text')=='LS Import IO Test' and in_roots(n)]
    assert len(found)==1,[n.attrib for n in found]
    tap_node(label+'-owned-root',found[0])
def slow_start(label):
    touch(label+'-select-slow',text='03-slow-healthy.json')
    for _ in range(15):
        raw,records=events()
        if records and records[-1].get('event')=='slow_pause_started':
            f=OUTPUT/label;f.mkdir(exist_ok=True);(f/'events-before-action.jsonl').write_text(raw,encoding='utf-8')
            activity=shell('dumpsys activity activities');(f/'activity-before-action-private.txt').write_text(activity,encoding='utf-8')
            assert re.search(r'topResumedActivity=.*ls\.augment\.com/\.ConfigTransferActivity',activity)
            return records[-1]['attempt']
        time.sleep(.1)
    raise AssertionError(records[-4:])
def collect(label):
    f=OUTPUT/label;f.mkdir(exist_ok=True)
    commands={'activity-private':'dumpsys activity activities','windows-private':'dumpsys window windows','exit-info':'dumpsys activity exit-info ls.augment.com','dropbox-private':'dumpsys dropbox --print data_app_crash','audit-private':'/system/bin/cat /data/user/0/ls.augment.com/files/ls_augment.log'}
    texts={}
    for name,cmd in commands.items():
        texts[name]=shell(cmd,root=True);(f/(name+'.txt')).write_text(texts[name],encoding='utf-8')
    raw,records=events();(f/'events.jsonl').write_text(raw,encoding='utf-8')
    config=prefs('ls_augment_config_v2');(f/'config.json').write_text(json.dumps(config,ensure_ascii=False,indent=2),encoding='utf-8')
    nodes=capture(label+'-screen');visible_text=[n.get('text') for n in nodes if n.get('text') not in (None,'null','')]
    crash_pids=re.findall(r'Process: ls\.augment\.com\s+PID: (\d+)',texts['dropbox-private'])
    result={'crash_pids':crash_pids,'current_pid':adb('shell','pidof ls.augment.com',check=False).decode().strip(),'texts':visible_text}
    (f/'observation.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    return config,result,records
