"""Validate independent-notification contracts using original SystemUI DEX definitions."""
import argparse, hashlib, importlib.util, json, re, zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--systemui',type=Path,action='append',required=True);p.add_argument('--output',type=Path);args=p.parse_args()
B='Lcom/android/systemui/statusbar/notification/collection/'
S=B+'ShadeListBuilder;';N=B+'NotificationEntry;';G=B+'GroupEntry;';P=B+'listbuilder/pluggable/NotifPromoter;'
mandatory=[(S,'buildList()V'),(S,'addPromoter('+P+')V'),(S,'promoteNotifs(Ljava/util/List;)V'),
 (S,'applyTopLevelPromoters('+N+')Z'),(S,'findPromoter('+N+')'+P),
 (S,'pruneIncompleteGroups(Ljava/util/List;)V'),(S,'addGroupsWithChildrenLostToPromotion(Ljava/util/List;Ljava/util/Set;)V'),
 (P,'<init>(Ljava/lang/String;)V'),(P,'invalidateList(Ljava/lang/String;)V'),(G,'getSummary()'+N),(G,'getChildren()Ljava/util/List;'),
 ('Lcom/android/systemui/statusbar/StatusBarStateControllerImpl;','getState()I'),
 ('Lcom/android/systemui/statusbar/StatusBarStateControllerImpl;','isDozing()Z')]
for action in ['addCallback','removeCallback']:
 mandatory.append(('Lcom/android/systemui/statusbar/StatusBarStateControllerImpl;',action+'(Lcom/android/systemui/plugins/statusbar/StatusBarStateController$StateListener;)V'))
reports=[]
for apk in args.systemui:
 classes={}
 with zipfile.ZipFile(apk) as archive:
  for name in archive.namelist():
   if re.fullmatch(r'classes\d*\.dex',name):classes.update(dex.dex_classes(archive.read(name)))
 missing=[];checked=[]
 def check(owner,sig,static=False,abstract=False):
  member=dex.find_member(classes,owner,'methods',sig)
  ok=member is not None and bool(member[1]&8)==static and bool(member[1]&1024)==abstract
  (checked if ok else missing).append(owner+'->'+sig)
 for owner,sig in mandatory:check(owner,sig)
 check(P,'shouldPromoteToTopLevel('+N+')Z',abstract=True)
 check('Lcom/android/systemui/Dependency;','get(Ljava/lang/Class;)Ljava/lang/Object;',static=True)
 parents=[B+'PipelineEntry;',G]
 if not any(dex.find_member(classes,N,'methods','getParent()'+c) for c in parents):missing.append('NotificationEntry.getParent')
 bundle='groups'
 if any(n.startswith(('bundleNotifs(','getBundleEntry(')) for n in classes[S]['methods']):
  bundle='groups_and_bundles';check(S,'bundleNotifs(Ljava/util/List;Ljava/util/List;)V');check(S,'getBundleEntry(Ljava/lang/String;)'+B+'BundleEntry;');check(B+'BundleEntry;','getChildren()Ljava/util/List;')
 report={'apk':str(apk),'sha256':hashlib.sha256(apk.read_bytes()).hexdigest(),'route':bundle,'checked':len(checked),'missing':missing,'passed':not missing}
 reports.append(report);print(json.dumps(report,ensure_ascii=False))
if args.output:args.output.write_text(json.dumps(reports,ensure_ascii=False,indent=2),encoding='utf-8')
if any(not r['passed'] for r in reports):raise SystemExit(1)
