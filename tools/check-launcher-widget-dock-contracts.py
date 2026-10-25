"""Read-only APK contract audit for widget resizing, dynamic Dock capacity and icon fit.

Passing proves defined DEX members/ancestry, not phone drag behavior or persistence.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import zipfile

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('launcher_dex', ROOT / 'tools/check-launcher-module-targets.py')
DEX = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(DEX)
L = 'Lcom/android/launcher3/'


def inspect(apk, framework=None):
    classes, _ = DEX.read_apk(apk)
    with zipfile.ZipFile(apk) as archive:
        identity = DEX.manifest_identity(archive.read('AndroidManifest.xml'))
    if framework:
        with zipfile.ZipFile(framework) as archive:
            for entry in archive.namelist():
                if entry.endswith('.dex'):
                    for key,value in DEX.dex_classes(archive.read(entry)).items():classes.setdefault(key,value)
    coordinates=L+'model/GridSizeMigrationLogic;' in classes
    named = L+'F1;' not in classes
    names = dict(idp=L+'InvariantDeviceProfile;', provider=L+'widget/LauncherAppWidgetProviderInfo;',
                 host=L+'widget/LauncherAppWidgetHostView;', launcher=L+'Launcher;', item=L+'model/data/ItemInfo;',
                 grid=L+'util/GridOccupancy;', cursor=L+'model/LoaderCursor;', utils=L+'hotseat/HotseatUtils;',
                 animation=L+'hotseat/HotseatDivideAnimation;', map=L+'util/IntSparseArrayMap;',
                 init='initSpans', setup='setupForWidget', resize='resizeWidgetIfNeeded',
                 capacity='getNumHotseatIcons', bind='setHotseatCountXY', enter='enterHotseatLayout',
                 reset='resetHotseatChildPosition', gethotseat='getHotseat', placement='checkItemPlacement',
                 minx='minSpanX', miny='minSpanY', maxx='maxSpanX', maxy='maxSpanY', rows='numRows', cols='numColumns',
                 dbcount='numDatabaseHotseatIcons', animlauncher='mLauncher', cursoridp='mIDP', occupied='mOccupied', cells='cells')
    names.update(bubble=L+'BubbleTextView;', folder=L+'folder/FolderIcon;',
                 drawable=L+'icons/FastBitmapDrawable;', preview=L+'folder/PreviewBackground;',
                 activity=L+'views/ActivityContext;', mfv=L+'mfvUtil/MFVUtils;',
                 bubble3='setIconSize', folder3='setIconSize', apply='applyCompoundDrawables',
                 previewsetup='setup', supportrecent='isSupportHotseatRecent')
    if not named:
        names.update(idp=L+'F1;', provider=L+'widget/U;', host=L+'widget/T;', launcher=L+'C2;', item=L+'model/data/y;',
                     grid=L+'util/t0;', cursor='Lz1/y1;', utils='Lp1/f;', animation='Lp1/a;', map=L+'util/A0;',
                     init='v', setup='l0', resize='j0', capacity='g', bind='A', enter='c', reset='i', gethotseat='X1',
                     placement='e', minx='i', miny='j', maxx='k', maxy='l', rows='G0', cols='H0', dbcount='e1',
                     animlauncher='g', cursoridp='l', occupied='p', cells='c')
        names.update(drawable='Ls1/o;', preview=L+'folder/u0;', activity=L+'views/k;', mfv='Lx1/O;',
                     bubble3='K0', folder3='k0', apply='t', previewsetup='Z0', supportrecent='C3')
    names.update(migration=L+'model/GridSizeMigrationUtil;' if named else 'Lz1/i1;',
                 reader=L+'model/GridSizeMigrationUtil$DbReader;' if named else 'Lz1/i1$a;',
                 helper=L+'model/DatabaseHelper;' if named else 'Lz1/I0;',
                 state=L+'model/DeviceGridState;' if named else 'Lz1/L0;',
                 migrationmethod='migrate' if named else 't',readerdb='mDb' if named else 'a',
                 readertable='mTableName' if named else 'b',readercontext='mContext' if named else 'c',
                 cursorcontext='mContext' if named else 'h',dbfile='dbFile' if named else 'E1',
                 favorites=L+'LauncherSettings$Favorites;' if named else L+'S3;',table='TABLE_NAME' if named else 'a')
    if coordinates:
        names.update(cursoridp='idp',occupied='occupied',cursorcontext='context',migration=L+'model/GridSizeMigrationLogic;',
                     reader=L+'model/DbReader;',migrationmethod='migrateHotseat')
    ctx = 'Landroid/content/Context;'
    cell, hotseat = L+'CellLayout;', L+'Hotseat;'
    checks = []
    def member(owner, kind, signature, static=False, writable=False):
        actual = DEX.find_member(classes, owner, kind, signature)
        passed = actual is not None and (actual[0] == owner or (owner in [L+'AppWidgetResizeFrame;',names['host']] and kind=='methods')) and bool(actual[1]&8) == static
        if actual is not None:
            passed = passed and not actual[1]&0x400 and (not writable or not actual[1]&16)
        checks.append(dict(owner=owner, kind=kind, member=signature, passed=bool(passed),
                           definedBy=None if actual is None else actual[0]))
    def ancestor(owner, expected):
        current, seen = owner, set()
        framework = {'Landroid/widget/TextView;': 'Landroid/view/View;',
                     'Landroid/widget/FrameLayout;': 'Landroid/view/ViewGroup;',
                     'Landroid/view/ViewGroup;': 'Landroid/view/View;'}
        while current != expected and (current in classes or current in framework) and current not in seen:
            seen.add(current)
            current = classes[current]['parent'] if current in classes else framework[current]
        checks.append(dict(owner=owner, ancestor=expected, passed=current == expected))
    for owner, name, args, result, static in [
        (names['provider'], names['init'], ctx+names['idp'], 'V', False),
        (L+'AppWidgetResizeFrame;', names['setup'], names['host']+cell+L+'dragndrop/DragLayer;', 'V', False),
        (L+'AppWidgetResizeFrame;', names['resize'], 'Z', 'V', False),
        (L+'AppWidgetResizeFrame;', 'onDetachedFromWindow', '', 'V', False),
        (cell, 'getCountX', '', 'I', False), (cell, 'getCountY', '', 'I', False),
        (cell, 'onMeasure', 'II', 'V', False),
        (names['utils'], names['capacity'], ctx, 'I', True),
        (names['utils'], names['bind'], hotseat+'I', 'V', True),
        (names['animation'], names['enter'], cell+'Landroid/view/View;Z', 'V', False),
        (names['animation'], names['reset'], 'Z', 'V', False),
        (names['launcher'], names['gethotseat'], '', hotseat, False),
        (names['cursor'], names['placement'], names['item']+('' if coordinates else 'Z'), 'Z', False),
        (names['grid'], '<init>', 'II', 'V', False),
        (names['bubble'], 'onMeasure', 'II', 'V', False),
        (names['bubble'], 'getIconSize', '', 'I', False),
        (names['bubble'], 'setIconSize', 'I', 'V', False),
        (names['bubble'], names['bubble3'], 'III', 'V', False),
        (names['bubble'], names['apply'], 'Landroid/graphics/drawable/Drawable;', 'V', False),
        (names['bubble'], 'setIconBoundsScale', 'F', 'V', False),
        (names['bubble'], 'getIcon', '', names['drawable'], False),
        (names['folder'], 'onMeasure', 'II', 'V', False),
        (names['folder'], 'getIconSize', '', 'I', False),
        (names['folder'], 'setIconSize', 'I', 'V', False),
        (names['folder'], names['folder3'], 'III', 'V', False),
        (names['preview'], names['previewsetup'], ctx+names['activity']+'Landroid/view/View;II', 'V', False),
        (names['mfv'], names['supportrecent'], '', 'Z', True),
    ]:
        member(owner, 'methods', name+'('+args+')'+result, static)
    for owner, key, typ, writable in [
        (names['provider'], 'minx', 'I', True), (names['provider'], 'miny', 'I', True),
        (names['provider'], 'maxx', 'I', True), (names['provider'], 'maxy', 'I', True),
        (names['idp'], 'rows', 'I', True), (names['idp'], 'cols', 'I', True),
        (names['idp'], 'dbcount', 'I', True),
        (names['animation'], 'animlauncher', names['launcher'], False),
        (names['cursor'], 'cursoridp', names['idp'], False),
        (names['cursor'], 'occupied', names['map'], False), (names['grid'], 'cells', '[[Z', False),
    ]:
        member(owner, 'fields', names[key]+':'+typ, writable=writable)
    for name in ['container', 'screenId']:
        member(names['item'], 'fields', name+':I')
    identifiers=[signature for signature in classes.get(names['item'],{}).get('fields',{})
                 if signature in {'id:I','id:J'}]
    checks.append(dict(owner=names['item'],contract='one native persisted item identity',members=identifiers,passed=len(identifiers)==1))
    member(names['cursor'],'fields',names['cursorcontext']+':'+ctx)
    member(names['idp'],'fields',names['dbfile']+':Ljava/lang/String;')
    member(names['favorites'],'fields',names['table']+':Ljava/lang/String;',static=True)
    for key,kind in [('readerdb','Landroid/database/sqlite/SQLiteDatabase;'),('readertable','Ljava/lang/String;'),('readercontext',ctx)]:
        member(names['reader'],'fields',names[key]+':'+kind)
    args=names['helper']+names['reader']+names['reader']+('I' if named else 'II')+'Landroid/graphics/Point;'+names['state']+names['state']
    if coordinates:
        args='II'+names['reader']+names['reader']+names['helper']+'Ljava/util/List;'
    member(names['migration'],'methods',names['migrationmethod']+'('+args+')'+('V' if coordinates else 'Z'),static=not coordinates)
    getters = [s for s in classes.get(cell, {}).get('methods', {}) if s.startswith('getShortcutsAndWidgets()')]
    checks.append(dict(owner=cell, contract='unique native child container getter', passed=len(getters)==1, members=getters))
    if len(getters)==1:
        childcontainer = getters[0].split(')', 1)[1]
        ancestor(childcontainer, 'Landroid/view/ViewGroup;')
        member(childcontainer, 'methods', 'onViewRemoved(Landroid/view/View;)V')
    for owner, expected in [
        (names['provider'], 'Landroid/appwidget/AppWidgetProviderInfo;'),
        (names['host'], 'Landroid/appwidget/AppWidgetHostView;'),
        (hotseat, 'Landroid/view/ViewGroup;'),
        (names['map'], 'Landroid/util/SparseArray;'),
        (names['cursor'], 'Landroid/database/CursorWrapper;'),
        (names['bubble'], 'Landroid/view/View;'),
        (names['folder'], 'Landroid/view/ViewGroup;'),
        (names['drawable'], 'Landroid/graphics/drawable/Drawable;'),
    ]:
        ancestor(owner, expected)
    if named:
        member(names['host'], 'methods', 'getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;')
    return dict(apk=str(apk.resolve()), identity=identity, sha256=hashlib.sha256(apk.read_bytes()).hexdigest(),
                adapter='named_workspace_data' if coordinates else 'android15_named' if named else 'android16_obfuscated', checks=checks,
                allInterfacesPass=all(check['passed'] for check in checks), deviceBehaviorVerified=False,
                scope='Defined DEX interfaces only; no rendering, phone drag or model reload verification.')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('--json', type=Path, required=True)
    parser.add_argument('--framework',type=Path)
    args = parser.parse_args()
    report = inspect(args.apk,args.framework)
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
