"""Audit rebind contracts in an actual launcher DEX; not device behavior proof."""
import argparse,hashlib,importlib.util,json,re,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)
p=argparse.ArgumentParser(description=__doc__);p.add_argument('apk',type=Path);p.add_argument('--json',type=Path,required=True);args=p.parse_args()
classes,_=dex.read_apk(args.apk);cell='Lcom/android/launcher3/CellLayout;'
methods=classes[cell]['methods'];checks=[]
def check(owner,kind,signature):
 member=dex.find_member(classes,owner,kind,signature)
 checks.append(dict(owner=owner,member=signature,passed=member is not None and not member[1]&8 and not (kind=='methods' and member[1]&0x400)))
candidates=[s for s in methods if re.fullmatch(r'(addViewToCellLayout|e)\(Landroid/view/View;IIL[^;]+;Z\)Z',s)]
assert len(candidates)==1,candidates
add=candidates[0];named=add.startswith('addView');params=add.split('II',1)[1].split(';Z',1)[0]+';'
check(cell,'methods',add)
for signature in [('setGridSize' if named else 'C0')+'(II)V',('markCellsAsOccupiedForView' if named else 'f0')+'(Landroid/view/View;)V','getCountX()I','getCountY()I']:
 check(cell,'methods',signature)
for signature in [('getCellX' if named else 'a')+'()I',('getCellY' if named else 'b')+'()I']:check(params,'methods',signature)
for field in ['cellHSpan','cellVSpan'] if named else ['f','g']:check(params,'fields',field+':I')
check('Lcom/android/launcher3/model/data/'+('ItemInfo' if named else 'y')+';','fields','container:I')
with zipfile.ZipFile(args.apk) as z:identity=dex.manifest_identity(z.read('AndroidManifest.xml'))
report=dict(apk=str(args.apk.resolve()),sha256=hashlib.sha256(args.apk.read_bytes()).hexdigest(),identity=identity,checks=checks,allPass=all(c['passed'] for c in checks),deviceBehaviorVerified=False)
args.json.parent.mkdir(parents=True,exist_ok=True);args.json.write_text(json.dumps(report,ensure_ascii=False,indent=2),'utf8')
print(identity,'contracts=',len(checks),'pass=',report['allPass'])
assert report['allPass']
