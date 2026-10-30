"""Check the avoidance hook contracts in OEM APKs or decoded smali. No device claim."""
import argparse,importlib.util,json,re
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)
PM='Lcom/zte/feature/dynamicisland/PermanentIslandManager;'
ND='Lcom/zte/feature/notification/module/NotificationIconDisplay;'
IS='Lcom/zte/feature/dynamicisland/DynamicPermanentIsland;'
def check(path):
 if path.is_file():classes,_=dex.read_apk(path)
 else:
  classes={}
  for relative in ('com/zte/feature/dynamicisland/PermanentIslandManager.smali','com/zte/feature/notification/module/NotificationIconDisplay.smali'):
   raw=(path/relative).read_text('utf-8');name=re.search(r'^\.class .* (L[^\s]+;)',raw,re.M)[1]
   classes[name]={'parent':None,'methods':{},'fields':{}}
   for kind,pattern in [('methods',r'^\.method (.+)$'),('fields',r'^\.field (.+)$')]:
    for declaration in re.findall(pattern,raw,re.M):
     parts=declaration.split(' = ')[0].split();classes[name][kind][parts[-1]]=8 if 'static' in parts else 0
 missing=[]
 def require(owner,kind,sig):
  if sig not in classes[owner][kind] or classes[owner][kind][sig]&8:missing.append(sig)
 def methods(owner,*signatures):
  for sig in signatures:require(owner,'methods',sig)
 def container(name,parent):
  require(PM,'fields',name+':Landroid/widget/LinearLayout;');require(PM,'fields',parent+':Landroid/view/ViewGroup;')
 methods(ND,'setDynamicIslandShowing(ZZ)V','createNotificationIconAnimation(ZZ)Landroid/animation/Animator;')
 require(ND,'fields','mDynamicIslandShowing:Z')
 methods(PM,'setViewWidth(Landroid/view/View;I)V','updateKeyguardBarWidth(Z)V')
 pm=classes[PM]['methods']
 if 'updateSystemContainerWidth(ZZ)V' in pm:
  route='fixed_geometry';methods(PM,'updateSystemContainerWidth(ZZ)V','updateNotificationContainerWidthFullScreen(I)V','getRightBound()I')
 elif 'updateSystemContainerWidth(Z)V' in pm:
  route='legacy';methods(PM,'updateSystemContainerWidth(Z)V');container('mStatusIconContainer','mSystemParent')
 else:
  route='geometry';methods(PM,'updateSystemContainerWidth(ZZ'+IS+'I)V','updateNotificationContainerWidthFullScreen('+IS+'I)V','getRightBound(F)F','resetNotificationContainerWidth()V','resetSystemContainerWidth()V')
 if route!='legacy':
  container('mSystemIconContainer','mSystemParent');container('mKeyguardSystemContainer','mKeyguardSystemParent');require(PM,'fields','mRightBound:I')
 return {'source':str(path),'route':route,'missing':missing,'passed':not missing,'evidence':'OEM interface only; not device acceptance'}
if __name__=='__main__':
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--target',type=Path,action='append',required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
 results=[check(t) for t in a.target];a.output.write_text(json.dumps(results,ensure_ascii=False,indent=2)+'\n','utf-8')
 for result in results:print(json.dumps(result,ensure_ascii=False))
 raise SystemExit(0 if all(r['passed'] for r in results) else 1)
