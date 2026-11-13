"""Check supplemental native card contracts in original OEM DEX/resources, without claiming device acceptance."""
from pathlib import Path
import argparse, hashlib, importlib.util, json, re, zipfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)

def check(apk,mode='both'):
    classes,resources=dex.read_apk(apk);missing=[]
    prefix='Lcom/zte/feature/dynamicisland/'
    base=prefix+'DynamicPermanentIsland;';host=prefix+'PermanentIslandManager;'
    island=prefix+'RemoteViewIsland;'
    def has(owner,kind,signature):
        while owner in classes:
            members=classes[owner][kind]
            if signature in members:return not(members[signature]&8) and not(kind=='methods' and members[signature]&1024)
            owner=classes[owner]['parent']
        return False
    def require(owner,kind,signature):
        if not has(owner,kind,signature):missing.append(owner+' '+signature)
    init=['initIsland(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;IZZ)V','initIsland(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;I)V','initIsland(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V']
    if not any(has(island,'methods',s) for s in init):missing.append('initIsland: no supported signature')
    for signature in ['setPanelIsland('+base+')V','setSmallIsland(Landroid/view/View;)V','handleIslandClick()Z']:
        require(island,'methods',signature)
    methods=['getPermanentIsland()'+base,'updatePanelHeight(Landroid/view/View;)V','forceNotClick()Z','onClick()V','onLongClick()V']
    if mode!='ordinary':
        methods+=['addPermanentIslandFullScreen('+base+'Z)V','handleRemoveIsland(Ljava/lang/String;)V']
    if mode!='fullscreen':
        methods+=['addPermanentIslandInner('+base+')V','removePermanentIsland('+base+')V','showPermanentPanelIsland()V','updateDynamicWindowHeightParams(Z)V']
        require(host,'fields','mDynamicIslandContainer:Landroid/view/ViewGroup;')
        if has(host,'fields','mDynamicPanelClosing:Z') and has(host,'fields','mDynamicIslandPanelRoot:Landroid/view/View;'):
            methods+=['onPermanentIslandPanelCloseAnimationStart()V','onPermanentIslandPanelCloseAnimationEnd('+base+'ZZ)V','removePermanentIslandInner('+base+')V']
    for signature in methods:
        require(host,'methods',signature)
    require(host,'fields','mAppIslandList:Ljava/util/Map;')
    require(base,'fields','mViewList:Ljava/util/List;')
    require(base,'fields','mKeyguardIsland:Z')
    beat=has(host,'methods','handleIslandHeartBeat(Ljava/lang/String;)V')
    if beat and mode!='ordinary':
        for signature in ['markIslandOnTime(Ljava/lang/String;)V','reportIslandStatus('+base+'I)V','setIslandShowing(Ljava/lang/String;Z)V']:
            require(host,'methods',signature)
    for resource in ['layout/remote_view_island_layout','layout/remote_view_panel_island_layout','layout/remote_view_small_island_layout','layout/app_island_layout','layout/app_island_panel_layout','dimen/dynamic_island_window_width','dimen/dynamic_island_panel_height_normal']:
        if resource not in resources:missing.append(resource)
    return {'apk':str(apk),'sha256':hashlib.sha256(apk.read_bytes()).hexdigest(),'mode':mode,'heartbeat':beat,'missing':missing,'scope':'Static OEM contracts only'}

def check_framework(path):
    required={
        'Landroid/app/INotificationManager;': {'getNotificationChannelsForPackage(Ljava/lang/String;IZ)Landroid/content/pm/ParceledListSlice;'},
        'Landroid/app/INotificationManager$Stub;': {'asInterface(Landroid/os/IBinder;)Landroid/app/INotificationManager;'},
        'Landroid/service/notification/NotificationListenerService;': {
            'getActiveNotifications([Ljava/lang/String;)[Landroid/service/notification/StatusBarNotification;'},
    }
    slices={};slice_type='Landroid/content/pm/ParceledListSlice;'
    with zipfile.ZipFile(path) as archive:
        for filename in archive.namelist():
            if not re.fullmatch(r'classes\d*\.dex',filename): continue
            data=archive.read(filename)
            if not any(owner.encode() in data for owner in required) and b'ParceledListSlice;' not in data: continue
            classes=dex.dex_classes(data)
            slices.update((name,info) for name,info in classes.items() if name.endswith('ParceledListSlice;'))
            for owner, methods in required.items():
                methods.difference_update(classes.get(owner,{}).get('methods',{}))
    missing=[owner+method for owner,methods in required.items() for method in sorted(methods)]
    owner=slice_type
    while owner in slices:
        flags=slices[owner]['methods'].get('getList()Ljava/util/List;')
        if flags is not None and flags&1 and not flags&(8|1024):break
        owner=slices[owner]['parent']
    else:missing.append(slice_type+'getList()Ljava/util/List;')
    return {'apk':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),
            'missing':missing,
            'scope':'Static notification service and channel inventory contracts only'}

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('apk',type=Path,nargs='+');parser.add_argument('--out',type=Path,required=True)
    parser.add_argument('--framework',type=Path)
    parser.add_argument('--mode',choices=('ordinary','fullscreen','both'),default='both');args=parser.parse_args()
    results=[check(p,args.mode) for p in args.apk]
    if args.framework: results.append(check_framework(args.framework))
    args.out.parent.mkdir(parents=True,exist_ok=True);args.out.write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    for r in results:print(Path(r['apk']).name+': '+('PASS' if not r['missing'] else 'MISSING '+repr(r['missing'])))
    raise SystemExit(any(r['missing'] for r in results))
