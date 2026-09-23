"""Capture native Control Center geometry without triggering any tile action."""
import json
import time
from statusbar_device_helpers import OUTPUT, adb, shell, all_windows, nodes, bounds, require_systemui_build


def restart_ui(label):
    shell('kill -9 '+shell('pidof com.android.systemui'),root=True);time.sleep(5)
    shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard')
    require_systemui_build(label)


def capture(label,expand=True):
    shell('input keyevent 224')
    if expand:
        shell('cmd statusbar collapse');time.sleep(.35)
        shell('cmd statusbar expand-settings')
    time.sleep(.6)
    windows=all_windows(label)
    folder=OUTPUT/label
    (folder/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    panels=[n for n in nodes(windows) if n.get('visible') and n.get('id')=='com.android.systemui:id/control_panel']
    assert len(panels)==1
    panel=list(nodes([{'root':panels[0]}]))
    pools=[n for n in panel if n.get('visible') and n.get('id')=='com.android.systemui:id/control_center_all_tiles']
    assert len(pools)==1
    labels=[n for n in nodes([{'root':pools[0]}]) if n.get('visible') and n.get('id')=='com.android.systemui:id/tile_label']
    tiles=[{'text':n['text'],'bounds':bounds(n)} for n in labels]
    targets=[{'text':n['text'],'bounds':bounds(n)} for n in nodes([{'root':pools[0]}])
             if n.get('visible') and n.get('clickable') and n.get('text') in {t['text'] for t in tiles}]
    header=[{k:n.get(k) for k in ('id','text','description','bounds','clickable')} for n in panel if n.get('visible') and n.get('id') in [
        'com.android.systemui:id/clock','com.android.systemui:id/date','com.android.systemui:id/search_button','com.android.systemui:id/header_carrier_text']]
    row_tops=[]
    for top in sorted(n['bounds'][1] for n in tiles):
        if not row_tops or top-row_tops[-1]>5:row_tops.append(top)
    result={'tiles':tiles,'columns':len({(n['bounds'][0]+n['bounds'][2])//2 for n in tiles}),
        'rows':len(row_tops),'pool':bounds(pools[0]),'header':header,'rotation':shell('wm user-rotation')}
    result['scroller']=[bounds(n) for n in panel if n.get('visible') and n.get('id')=='com.android.systemui:id/content_scroller']
    result['clickTargets']=targets
    result['wideTiles']=[{'text':n['text'],'bounds':bounds(n)} for n in panel if n.get('visible') and n.get('id')=='com.android.systemui:id/tile_label' and n not in labels and n['text'] in ['数据','WLAN','手电筒','蓝牙']]
    (folder/'geometry.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print(label,result,flush=True)
    return result
