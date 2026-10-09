"""Offline collector checks. Optional saved-tree replay, never invokes ADB."""
import argparse,copy,importlib.util,json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('appearance',ROOT/'tools/run-safe-control-appearance-device.py')
appearance=importlib.util.module_from_spec(spec);spec.loader.exec_module(appearance)

def run(evidence):
    checks=0
    def require(value,message):
        nonlocal checks
        assert value,message
        checks+=1
    all_phases=appearance.phase_plan('all');fill=appearance.phase_plan('fill-only')
    require(len(all_phases)==12 and len(fill)==8,'Original phases and bounded fill-only scope')
    require(fill[0]==('both-off',{'corners_enabled':'0','tile_fill_enabled':'0'}),'Fill starts with controlled off baseline')
    require(fill[-1]==('both-off-again',{'corners_enabled':'0','tile_fill_enabled':'0'}),'Fill ends with native off observation')
    journal=appearance.Journal.__new__(appearance.Journal)
    for name,values in all_phases:
        require(journal.valid_values({appearance.P+k:v for k,v in values.items()}),'Phase exceeds permitted settings: '+name)
    if evidence is None:
        print(json.dumps({'passed':checks,'treeReplay':'not requested','adbInvoked':False}));return
    trees=[json.loads((evidence/('solid-half-panel-'+str(i))/'result-private.json').read_text(encoding='utf-8'))['uiWindows'] for i in range(4)]
    signatures=[appearance.control_signature(tree) for tree in trees]
    require(all(x==signatures[0] for x in signatures),'Actual native appearance controls must be stable across the four saved trees')
    raw=[appearance.panel(tree) for tree in trees]
    require(len(raw[0])!=len(raw[1]),'Raw dynamic header nodes remain preserved in geometry')
    require(not any('wifi_inout' in str(row.get('id')) for row in signatures[0]),'Header activity arrow does not gate appearance stability')
    def mutate(predicate,change):
        tree=copy.deepcopy(trees[0]);nodes=[n for w in tree for n,p in appearance.extra.walk(w['root'])]
        target=next(n for n in nodes if predicate(n));change(target)
        return tree
    checks_to_change=[
        (lambda n:n.get('class')=='android.widget.Switch' and n.get('checked') is True,lambda n:n.update(checked=False)),
        (lambda n:n.get('id')==appearance.extra.ID+'slider',lambda n:n['rangeInfo'].update(current=n['rangeInfo']['current']+1)),
        (lambda n:n.get('id')==appearance.extra.ID+'slider',lambda n:n.update(enabled=False)),
        (lambda n:n.get('id')==appearance.extra.ID+'play_pause_button',lambda n:n.update(description='changed native media state')),
        (lambda n:n.get('id')==appearance.extra.ID+'control_center_media_container',lambda n:n.update(bounds='[114,416][578,900]')),
        (lambda n:n.get('class')=='android.widget.Switch' and n.get('clickable'),lambda n:n.update(bounds='[638,938][1102,1139]')),
        (lambda n:n.get('class')=='android.widget.Switch' and n.get('clickable'),lambda n:n.update(visible=False)),
    ]
    for predicate,change in checks_to_change:
        require(appearance.control_signature(mutate(predicate,change))!=signatures[0],'A real tile/slider/media change cannot be ignored')
    null_tree=mutate(lambda n:n.get('id')==appearance.extra.ID+'slider',lambda n:n.update(text=None,description=None))
    require(appearance.control_signature(null_tree)==signatures[0],'Serialized null is not meaningful control text')
    missing=mutate(lambda n:n.get('id')==appearance.extra.ID+'volume_slider',lambda n:n.update(visible=False))
    try:appearance.control_signature(missing)
    except appearance.extra.Inconclusive:checks+=1
    else:raise AssertionError('Missing appearance surface must reject stability')
    print(json.dumps({'passed':checks,'actualTrees':4,'nativeSignatureEntries':len(signatures[0]),
                      'rawGeometryEntries':[len(x)for x in raw],'adbInvoked':False},ensure_ascii=False))

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--evidence',type=Path)
    run(parser.parse_args().evidence)
