"""Read-only APK audit of the new-install pipeline and last-page placement interfaces."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('launcher_dex', ROOT / 'tools/check-launcher-module-targets.py')
DEX = importlib.util.module_from_spec(spec)
spec.loader.exec_module(DEX)
L = 'Lcom/android/launcher3/'


def inspect(apk):
    classes, _ = DEX.read_apk(apk)
    with zipfile.ZipFile(apk) as archive:
        identity = DEX.manifest_identity(archive.read('AndroidManifest.xml'))
    coordinates=L+'model/tasks/PackageUpdatedTask;' in classes
    named = L+'F1;' not in classes
    names = dict(callbacks=L+'model/ModelLauncherCallbacks;', model=L+'LauncherModel;',
                 task=L+'LauncherModel$ModelUpdateTask;', controller=L+'model/ModelTaskController;',
                 bg=L+'model/BgDataModel;', apps=L+'model/AllAppsList;', state=L+'LauncherAppState;',
                 db=L+'model/ModelDbController;', finder=L+'model/WorkspaceItemSpaceFinder;',
                 list=L+'util/IntArray;', item=L+'model/data/ItemInfo;', launcher=L+'Launcher;',
                 package=L+'model/PackageUpdatedTask;', add=L+'model/AddWorkspaceItemsTask;',
                 loader=L+'model/LoaderTask;', resource=L+'resource/ResourceManagerProxy;', callbacks_model=L+'ModelCallbacks;',
                 utilities=L+'Utilities;', map=L+'util/IntSparseArrayMap;', enqueue='enqueueModelUpdateTask',
                 execute='execute', bind='bindAddedWorkspaceItems', layer='isSingleLayer', saved='useSavedLocation',
                 database='getModelDbController', next='getNewScreenId', array='toArray', list_add='add',
                 op='mOp', packages='mPackages', user='mUser', move='isMoveDataFlag', items='itemsIdMap',
                 workspace_launcher='mLauncher', binding='mModelCallbacks', pinned='isFirstPagePinnedItemEnabled',
                 vendor_pinned='SHOULD_SHOW_FIRST_PAGE_WIDGET')
    if not named:
        names.update(callbacks='Lz1/Q2;', model=L+'D3;', task=L+'D3$d;', controller='Lz1/o3;',
                     bg='Lz1/y0;', apps='Lz1/m;', state=L+'P2;', db='Lz1/k2;', finder='Lz1/z5;',
                     list=L+'util/x0;', item=L+'model/data/y;', launcher=L+'C2;', package='Lz1/h4;',
                     add='Lz1/j;', loader='Lz1/c2;', resource=L+'resource/g0;', callbacks_model=L+'B4;',
                     utilities=L+'N5;', map=L+'util/A0;', enqueue='W', execute='a', bind='x', layer='M0',
                     saved='g', database='m0', next='F', array='A', list_add='m', op='a', packages='c',
                     user='b', move='c', items='a', workspace_launcher='x', binding='h', pinned='j', vendor_pinned='j')
    if coordinates:
        names.update(package=L+'model/tasks/PackageUpdatedTask;',add=L+'model/tasks/AddWorkspaceItemsTask;',
                     op='mIsUpdate',map=L+'model/data/WorkspaceData;')
    checks = []
    def member(owner, kind, signature, static=False, inherited=False, abstract=False):
        actual = DEX.find_member(classes, owner, kind, signature)
        passed = actual is not None and (inherited or actual[0] == owner) and bool(actual[1]&8) == static and (abstract or not actual[1]&0x400)
        checks.append(dict(owner=owner, kind=kind, member=signature, passed=bool(passed),
                           definedBy=None if actual is None else actual[0]))
    ctx, user = 'Landroid/content/Context;', 'Landroid/os/UserHandle;'
    bg, state, finder, item, array = [names[key] for key in ('bg', 'state', 'finder', 'item', 'list')]
    for owner, name, args, result in [
        (names['loader'], 'run', '', 'V'),
        (names['callbacks'], 'onPackageAdded', 'Ljava/lang/String;'+user, 'V'),
        (names['model'], names['enqueue'], names['task'], 'V'),
        (names['package'], names['execute'], names['controller']+bg+names['apps'], 'V'),
        (names['add'], names['execute'], names['controller']+bg+names['apps'], 'V'),
        (names['controller'], names['bind'], 'Ljava/util/ArrayList;', 'V'),
        (names['resource'], names['layer'], '', 'Z'),
        (names['add'], names['saved'], names['controller']+item+bg, '[I'),
        (names['model'], names['database'], '', names['db']),
        (names['db'], names['next'], '', 'I'),
        (item, 'getTargetComponent', '', 'Landroid/content/ComponentName;'),
        (L+'Workspace;', 'onLayout', 'ZIIII', 'V'),
        (L+'Workspace;', 'getScreenOrder', '', array),
        (array, names['array'], '', '[I'),
        (array, names['list_add'], 'I', 'V'),
        (array, 'clear', '', 'V'),
    ]:
        if coordinates and name==names['bind']:continue
        member(owner, 'methods', name+'('+args+')'+result)
    if coordinates:
        coord=L+'model/data/WorkspaceItemCoordinates;';excluded=L+'util/IntSet;';idp=L+'InvariantDeviceProfile;'
        for owner,signature in [
            (finder,'findSpaceForItem(Ljava/util/ArrayList;II'+excluded+'Z)'+coord),
            (finder,'findNextAvailableIconSpaceInScreen(Ljava/util/List;IIII[I)Z'),
            (names['controller'],'getContext()'+ctx),(state,'getContext()'+ctx),(state,'getModel()'+names['model']),
            (coord,'<init>(III)V'),(excluded,'contains(I)Z')]:member(owner,'methods',signature)
        member(idp,'methods','getBestieNeedCardPageScreen()Z',inherited=True)
        for name,kind in [('mDataModel',bg),('mModel',names['model']),('mIDP',idp)]:member(finder,'fields',name+':'+kind)
        member(L+'widget/custom/future/AIFutureWidgetUtils;','methods','getAIFutureScreenId('+ctx+')I',static=True)
    elif named:
        for owner, signature in [
            (finder, 'findSpaceForItem('+state+bg+array+array+'IIZ)[I'),
            (finder, 'findNextAvailableIconSpaceInScreen('+state+'Ljava/util/ArrayList;[III)Z'),
            (names['controller'], 'getApp()'+state), (state, 'getContext()'+ctx),
            (state, 'getModel()'+names['model']),
        ]:
            member(owner, 'methods', signature)
    else:
        member(finder, 'methods', 'c('+array+array+'IIZ)[I')
        member(finder, 'methods', 'a(Ljava/util/ArrayList;[III)Z')
        member(names['controller'], 'methods', 'V()'+ctx)
        member(finder, 'fields', 'a:'+bg)
        member(finder, 'fields', 'c:'+names['model'])
        member(L+'widget/custom/future/AIFutureWidgetUtils;', 'methods', 'l('+ctx+')I', static=True)
    for owner, name, typ in [
        (names['package'], names['op'], 'Z' if coordinates else 'I'), (names['package'], names['packages'], 'Ljava/util/Set;' if coordinates else '[Ljava/lang/String;'),
        (names['package'], names['user'], user), (names['add'], names['move'], 'Z'),
        (bg, names['items'], names['map']), (L+'Workspace;', names['workspace_launcher'], names['launcher']),
        (names['launcher'], names['binding'], names['callbacks_model']),
        (names['callbacks_model'], names['pinned'], 'Z'),
    ]:
        if coordinates and owner in [names['launcher'],names['callbacks_model']]:continue
        member(owner, 'fields', name+':'+typ)
    for name, typ in [('id', 'I'), ('itemType', 'I'), ('user', user), ('container', 'I'), ('screenId', 'I')]:
        member(item, 'fields', name+':'+typ)
    if not coordinates:member(names['utilities'], 'fields', names['vendor_pinned']+':Z', static=True)
    member(names['map'], 'methods', 'iterator()Ljava/util/Iterator;',abstract=coordinates)
    return dict(apk=str(apk.resolve()), identity=identity, sha256=hashlib.sha256(apk.read_bytes()).hexdigest(),
                adapter='named_coordinates' if coordinates else 'android15_named' if named else 'android16_obfuscated', checks=checks,
                allInterfacesPass=all(check['passed'] for check in checks), deviceBehaviorVerified=False,
                scope='Defined DEX interfaces only; no installation or model persistence verification.')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('--json', type=Path, required=True)
    args = parser.parse_args()
    report = inspect(args.apk)
    args.json.parent.mkdir(parents=True, exist_ok=True)
    args.json.write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print(json.dumps(report['identity'], ensure_ascii=False))
    print(report['adapter']+': '+str(len(report['checks']))+' contracts; pass='+str(report['allInterfacesPass']))
    for failure in [check for check in report['checks'] if not check['passed']]:
        print(json.dumps(failure, ensure_ascii=False))
    if not report['allInterfacesPass']:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
