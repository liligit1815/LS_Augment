"""Read-only DEX audit of both inspected launcher customization model families."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import zipfile

ROOT = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location('launcher_dex', ROOT / 'check-launcher-module-targets.py')
DEX = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(DEX)
L = 'Lcom/android/launcher3/'
C = 'Landroid/content/Context;'


def check(path):
    classes, _ = DEX.read_apk(path)
    with zipfile.ZipFile(path) as archive:
        identity = DEX.manifest_identity(archive.read('AndroidManifest.xml'))
    named = L + 'model/data/z;' not in classes
    info, item, workspace = [L + 'model/data/' + name + ';' for name in
                            (('ItemInfoWithIcon', 'ItemInfo', 'WorkspaceItemInfo') if named else ('z', 'y', 'I'))]
    rows = []

    def member(owner, kind, signature, static=False):
        found = DEX.find_member(classes, owner, kind, signature)
        passed = found is not None and bool(found[1] & 8) == static and not found[1] & 1024
        rows.append({'class': owner, 'kind': kind, 'member': signature, 'pass': bool(passed)})
        return found

    def method(owner, name, args, static=False):
        values = [s for s in classes.get(owner, {}).get('methods', {}) if s.startswith(name + '(' + args + ')')]
        if len(values) == 1:
            return member(owner, 'methods', values[0], static)
        rows.append({'class': owner, 'member': name + '(' + args + ')', 'matches': values, 'pass': False})
        return None

    method(info, 'newIcon' if named else 'G', C + 'I')
    member(L + 'BubbleTextView;', 'methods', ('applyLabel' if named else 'B') + '(' + item + ')V')
    for signature in ('title:Ljava/lang/CharSequence;', 'contentDescription:Ljava/lang/CharSequence;',
                      'user:Landroid/os/UserHandle;', 'itemType:I'):
        member(item, 'fields', signature)
    for owner in (item, workspace):
        methods = [s for s, flags in classes.get(owner, {}).get('methods', {}).items()
                   if s.startswith(('onAddToDatabase(', 'writeToValues(')) and not flags & (8 | 1024)]
        rows.append({'class': owner, 'contract': 'native persistence interception', 'methods': methods, 'pass': bool(methods)})
    candidates = []
    owner = info
    while owner in classes:
        for signature, flags in classes[owner]['fields'].items():
            if flags & (8 | 16):
                continue
            typ = signature.split(':', 1)[1]
            bitmap, metadata, badge = ('icon', 'flags', 'badgeInfo') if typ == L + 'icons/BitmapInfo;' else ('a', 'd', 'f')
            expected = [('methods', '<init>(Landroid/graphics/Bitmap;I)V', False),
                        ('fields', bitmap + ':Landroid/graphics/Bitmap;', False),
                        ('fields', metadata + ':I', True), ('fields', badge + ':' + typ, True)]
            found = [DEX.find_member(classes, typ, kind, value) for kind, value, writable in expected]
            if all(value is not None and not value[1] & 8 and (not writable or not value[1] & 16)
                   for value, (_, _, writable) in zip(found, expected)):
                candidates.append(owner + '->' + signature)
            elif typ==L+'icons/BitmapInfo;':
                shape=L+'icons/IconShape;';theme=L+'icons/ThemedBitmap;';delegate=L+'icons/FastBitmapDrawableDelegate$DelegateFactory;';provider=L+'BadgeProvider;'
                required=[('methods','<init>(Landroid/graphics/Bitmap;II'+shape+theme+typ+delegate+provider+')V',False),
                          ('methods','fromBitmap(Landroid/graphics/Bitmap;)'+typ,True),
                          *[('fields',name+':'+kind,False) for name,kind in [('icon','Landroid/graphics/Bitmap;'),('color','I'),('flags','I'),
                            ('badgeInfo',typ),('defaultIconShape',shape),('themedBitmap',theme),('delegateFactory',delegate),('badgeProvider',provider)]]]
                matches=[DEX.find_member(classes,typ,kind,value) for kind,value,_ in required]
                if all(value is not None and bool(value[1]&8)==static and not value[1]&1024 for value,(_,_,static) in zip(matches,required)):
                    candidates.append(owner+'->'+signature+' (immutable native factory)')
        owner = classes[owner]['parent']
    rows.append({'contract': 'unique writable BitmapInfo model field', 'candidates': candidates, 'pass': len(candidates) == 1})
    refresh = []
    for state, getter, model, reload in [('P2', 'h', 'j', 'a0'), ('V2', 'h', 'j', 'a0'),
                                         ('LauncherAppState', 'getInstance', 'getModel', 'forceReload')]:
        state = L + state + ';'
        factory = DEX.find_member(classes, state, 'methods', getter + '(' + C + ')' + state)
        models = [s for s, flags in classes.get(state, {}).get('methods', {}).items()
                  if s.startswith(model + '()') and not flags & (8 | 1024)]
        if factory is None or not factory[1] & 8 or len(models) != 1:
            continue
        typ = models[0].split(')', 1)[1]
        reset = DEX.find_member(classes, typ, 'methods', reload + '()V')
        if reset is None and state==L+'LauncherAppState;':
            reset=DEX.find_member(classes,typ,'methods','forceReload(Ljava/lang/String;)Ljava/util/concurrent/CompletionStage;')
        if reset is not None and not reset[1] & (8 | 1024):
            refresh.append(state + '->' + models[0] + '->' + reload)
    rows.append({'contract': 'unique native model refresh', 'candidates': refresh, 'pass': len(refresh) == 1})
    return {'apk': str(path.resolve()), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'identity': identity, 'adapter': 'android15_named' if named else 'android16',
            'checks': rows, 'pass': all(row['pass'] for row in rows), 'deviceBehaviorVerified': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apks', type=Path, nargs='+')
    parser.add_argument('--json', type=Path)
    args = parser.parse_args()
    reports = [check(path) for path in args.apks]
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(reports, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for report in reports:
        print(('PASS' if report['pass'] else 'FAIL') + ': ' + str(report['identity']) + '; adapter=' + report['adapter'])
        for row in report['checks']:
            if not row['pass']:
                print(row)
    print('Defined APK contracts only; phone behavior is not verified.')
    return 0 if all(report['pass'] for report in reports) else 1


if __name__ == '__main__':
    raise SystemExit(main())
