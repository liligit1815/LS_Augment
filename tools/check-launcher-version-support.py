"""Read-only DEX audit of the launcher's contracts used by the current module.

This inspects defined members, static access and inheritance. It never installs
the launcher, initializes its classes, changes layout data or proves phone behavior.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
import zipfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('launcher_dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)
L='Lcom/android/launcher3/'
Q='Lcom/android/quickstep/views/'
CTX='Landroid/content/Context;'

def inspect(apk):
    classes,resources=dex.read_apk(apk)
    with zipfile.ZipFile(apk) as archive:
        identity=dex.manifest_identity(archive.read('AndroidManifest.xml'))

    def member(owner,kind,signature,static=False,declared=True):
        actual=dex.find_member(classes,owner,kind,signature)
        passed=actual is not None and bool(actual[1]&8)==static and not actual[1]&0x400
        if declared and actual is not None: passed=passed and actual[0]==owner
        return {'class':owner,'kind':kind,'member':signature,'definedBy':None if actual is None else actual[0],
                'expectedStatic':static,'pass':bool(passed)}

    def method(owner,name,args,static=False,result=None):
        prefix=name+'('+args+')'
        matches=[s for s in classes.get(owner,{}).get('methods',{}) if s.startswith(prefix) and (result is None or s==prefix+result)]
        if len(matches)!=1:return {'class':owner,'member':prefix,'pass':False,'matches':matches}
        return member(owner,'methods',matches[0],static)

    def ancestor(owner,expected):
        current=owner;seen=set()
        while current!=expected and current in classes and current not in seen:
            seen.add(current);current=classes[current]['parent']
        return {'class':owner,'expectedAncestor':expected,'pass':current==expected}

    def group(name,rows):
        return {'feature':name,'interfacePass':all(row['pass'] for row in rows),'checks':rows,
                'failedChecks':sum(not row['pass'] for row in rows)}

    pages=[member(owner,kind,signature,static) for owner,kind,signature,static in dex.contracts() if not owner.startswith(Q)]
    for owner,parent in [('Workspace;','V4;'),('K5;','')]:
        pages.append(ancestor(L+owner,L+parent if parent else 'Landroid/view/ViewGroup;'))
    pages.append(ancestor(L+'util/A0;','Landroid/util/SparseArray;'))
    groups=[group('页面管理与保留空白页',pages)]

    desktop=L+'b0;';idp=L+'F1;';item=L+'model/data/y;';occupied=L+'util/t0;';dp=L+'h0;';cell=L+'CellLayout;';launcher=L+'C2;'
    grid=[]
    for owner,name,args,result in [
        (desktop,'r',idp+CTX+'II','V'),(desktop,'i',CTX,'Landroid/graphics/Point;'),(desktop,'k',CTX,'Landroid/graphics/Point;'),
        (desktop,'j',CTX,'I'),(desktop,'u',CTX+idp+item+occupied,'Z'),(desktop,'g',idp+'Lz1/y0;'+CTX+'Z','V'),
        (occupied,'d','IIII','Z'),(occupied,'g',item+'Z','V'),(dp,'p1','F'+CTX,'V'),(dp,'h1',CTX,'V'),
        (dp,'k0','','Landroid/graphics/Point;'),(cell,'getDeviceProfile','',dp),
        (cell,'getCountX','','I'),(cell,'getCountY','','I'),(launcher,'h',L+'util/z0;','V'),(launcher,'B2','',L+'Workspace;')]:
        grid.append(method(owner,name,args,result=result))
    for owner,fields in [(desktop,['d:Z']),(idp,['G0:I','H0:I','E1:Ljava/lang/String;']),
        (item,['container:I','cellX:I','cellY:I','spanX:I','spanY:I','screenId:I']),
        (dp,['B1:I','C1:I','D1:I','Z0:Z','b1:Z'])]:
        grid.extend(member(owner,'fields',field) for field in fields)
    # Production casts a to Map and uses Field.getLong(id), which also widens int.
    for owner,name,types in [(desktop,'a',{'Ljava/util/Map;','Ljava/util/HashMap;','Ljava/util/LinkedHashMap;','Landroid/util/ArrayMap;'}),
            (item,'id',{'I','J','S','B'})]:
        matches=[s for s in classes.get(owner,{}).get('fields',{}) if s.startswith(name+':') and s.split(':',1)[1] in types]
        grid.append(member(owner,'fields',matches[0]) if len(matches)==1 else {'class':owner,'field':name,'pass':False,'matches':matches})
    groups.append(group('桌面行列与图标尺寸适配',grid))

    model=L+'model/data/z;'
    custom=[method(model,'G',CTX+'I'),method(L+'BubbleTextView;','B',item)]
    for name,typ in [('title','Ljava/lang/CharSequence;'),('contentDescription','Ljava/lang/CharSequence;'),('user','Landroid/os/UserHandle;'),('itemType','I')]:
        custom.append(member(model,'fields',name+':'+typ,declared=False))
    candidates=[];current=model
    while current in classes:
        for signature,flags in classes[current]['fields'].items():
            if flags&8:continue
            typ=signature.split(':',1)[1]
            if typ not in classes:continue
            rows=[member(typ,'methods','<init>(Landroid/graphics/Bitmap;I)V'),
                  member(typ,'fields','a:Landroid/graphics/Bitmap;',declared=False),member(typ,'fields','d:I',declared=False),
                  member(typ,'fields','f:'+typ,declared=False)]
            if all(r['pass'] for r in rows) and not flags&16:
                writable=all(not dex.find_member(classes,typ,'fields',s)[1]&16 for s in ['d:I','f:'+typ])
                if writable:candidates.append({'modelField':current+'->'+signature,'bitmapInfo':typ,'checks':rows})
        current=classes[current]['parent']
    custom.append({'contract':'unique writable BitmapInfo field','pass':len(candidates)==1,'candidates':candidates})
    refresh=[]
    for owner in [L+'P2;',L+'V2;']:
        state=method(owner,'h',CTX,True,owner)
        getter=method(owner,'j','')
        if not state['pass'] or not getter['pass']:continue
        result=getter['member'].split(')',1)[1]
        reload=method(result,'a0','',result='V')
        if reload['pass']:refresh.append([state,getter,reload])
    custom.append({'contract':'unique native model reload entry','pass':len(refresh)==1,'candidates':refresh})
    for owner in [item,L+'model/data/I;']:
        writes=[s for s in classes.get(owner,{}).get('methods',{}) if s.startswith(('onAddToDatabase(','writeToValues('))]
        custom.append({'class':owner,'contract':'native database persistence interception','pass':bool(writes),'methods':writes})
    groups.append(group('自定义图标与名称',custom))

    recents=Q+'RecentsView;'
    memory=[member(recents,'fields',s) for s in ['mOverviewStateEnabled:Z','mContentAlpha:F']]
    for signature in ['onAttachedToWindow()V','onDetachedFromWindow()V','onLayout(ZIIII)V','setOverviewStateEnabled(Z)V',
        'setContentAlpha(F)V','setVisibility(I)V','onWindowVisibilityChanged(I)V','setLayoutRotation(II)V']:
        memory.append(member(recents,'methods',signature))
    groups.append(group('最近任务内存信息',memory))
    cleanup=[method(recents,'dismissAllTasks','Landroid/view/View;'),method(recents,'createAllTasksDismissAnimation','J'),
        method(Q+'ClearAllButton;','draw','Landroid/graphics/Canvas;',result='V'),member(recents,'fields','mOverviewStateEnabled:Z')]
    cleanup.append({'contract':'original native cleanup button draw','pass':Q+'ClearAllButton;' in classes})
    groups.append(group('最近任务清理动画核心入口',cleanup))
    hotseat=L+'Hotseat;'
    dock=[method(hotseat,'onDraw','Landroid/graphics/Canvas;',result='V'),method(hotseat,'dispatchTouchEvent','Landroid/view/MotionEvent;',result='Z')]
    shortcuts=[s for s in classes.get(hotseat,{}).get('methods',{}) if s.startswith('getShortcutsAndWidgets()')]
    current=hotseat
    while not shortcuts and current in classes:
        current=classes[current]['parent']
        shortcuts=[s for s in classes.get(current,{}).get('methods',{}) if s.startswith('getShortcutsAndWidgets()')]
    dock.append({'contract':'dock child container getter','pass':len(shortcuts)==1,'methods':shortcuts})
    groups.append(group('Dock 液态玻璃核心入口',dock))
    return {'apk':str(apk.resolve()),'sha256':hashlib.sha256(apk.read_bytes()).hexdigest(),'identity':identity,
        'definedClasses':len(classes),'moduleSource':'current working tree','groups':groups,
        'allInspectedInterfacesPass':all(g['interfacePass'] for g in groups),'deviceBehaviorVerified':False,
        'scope':'Defined DEX interfaces only. Passing interfaces do not prove runtime behavior, initialization, or migration.'}

def main():
    if hasattr(sys.stdout,'reconfigure'):sys.stdout.reconfigure(encoding='utf8')
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk',type=Path)
    parser.add_argument('--json',type=Path,required=True)
    args=parser.parse_args()
    report=inspect(args.apk)
    args.json.parent.mkdir(parents=True,exist_ok=True)
    args.json.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf8')
    print(json.dumps(report['identity'],ensure_ascii=False))
    for group in report['groups']:
        print(('INTERFACE PASS' if group['interfacePass'] else 'INCOMPATIBLE')+': '+group['feature']+'; missing='+str(group['failedChecks']))
        for row in [r for r in group['checks'] if not r['pass']][:3]:print('  '+json.dumps(row,ensure_ascii=False))
    print('Phone behavior not verified; full details: '+str(args.json))

if __name__=='__main__':main()
