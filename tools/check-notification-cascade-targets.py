"""Check cascade's required signatures against actual SystemUI DEX definitions."""
from pathlib import Path
import argparse,hashlib,importlib.util,json
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)
P='Lcom/android/systemui/statusbar/notification/'
A=P+'stack/StackScrollAlgorithm;';S=P+'stack/ExpandableViewState;';E=P+'row/ExpandableView;';R=P+'row/ExpandableNotificationRow;';B=P+'stack/AmbientState;';T=P+'stack/StackScrollAlgorithm$StackScrollAlgorithmState;'
methods=[(A,'resetViewStates('+B+'I)V'),(A,'updateViewWithShelf('+E+S+'F)V'),
 (A,'updateChild(I'+T+B+')V'),(A,'updatePositionsForState('+T+B+')V'),(A,'resetChildViewStates()V'),
 (E,'getViewState()'+S),(E,'resetViewState()'+S),(E,'getClipTopAmount()I'),(E,'setClipTopAmount(I)V'),(S,'getAlpha()F')]
methods += [(B,n+r) for n,r in [('isOnKeyguard','()Z'),('isDozing','()Z'),('getHideAmount','()F'),('getExpansionFraction','()F')]]
methods += [(R,n+'()Z') for n in ['isPinned','isHeadsUpAnimatingAway','isExpandAnimationRunning','areGutsExposed','isGroupExpansionChanging']]
fields=[(A,'mHostView:Landroid/view/ViewGroup;'),(P+'stack/NotificationStackScrollLayout;','mMaxLayoutHeight:I')]
N=P+'stack/NotificationStackScrollLayout;'
methods += [(N,s) for s in ['getScrollRange()I','updateScrollability()V','clampScrollPosition()V','requestChildrenUpdate()V',
 'isScrollingEnabled()Z','onScrollTouch(Landroid/view/MotionEvent;)Z','onInterceptTouchEventScroll(Landroid/view/MotionEvent;)Z',
 'getChildAtPosition(FF)'+E]]
methods += [(B,'getStackY()F'),(B,'getInterpolatedStackHeight()F')]
fields += [(N,'mOwnScrollY:I'),(A,'mKeyguardNotificationSpace:F'),(T,'visibleChildren:Ljava/util/ArrayList;')]
fields += [(S,n+':F') for n in ['mYTranslation','mZTranslation','mScaleX','mScaleY']]
fields += [(S,n+':'+t) for n,t in [('height','I'),('gone','Z'),('hidden','Z'),('clipTopAmount','I'),('clipBottomAmount','I')]]
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--systemui',type=Path,action='append',required=True);parser.add_argument('--output',type=Path);args=parser.parse_args()
reports=[]
for apk in args.systemui:
    classes,_=dex.read_apk(apk);checked=[];missing=[]
    def found(owner,kind,signature):
        member=dex.find_member(classes,owner,kind,signature)
        return member is not None and not(member[1]&8) and not(kind=='methods' and member[1]&1024)
    for kind,items in [('methods',methods),('fields',fields)]:
        for owner,signature in items:
            (checked if found(owner,kind,signature) else missing).append(owner+signature)
    routes={}
    for name,owner,options in [('alpha',S,['setAlpha(F)V','setAlpha(FLjava/lang/String;)V']),('gesture',R,['isUserLocked()Z','isUserSwipingToExpandRow()Z'])]:
        matches=[s for s in options if found(owner,'methods',s)];routes[name]=matches
        if not matches:missing.append(name)
    header='Lcom/zte/controlcenter/widget/CCHeaderView;'
    header_fields={}
    for name in ['panelType','mClockView','mDateView']:
        owner=header
        while owner in classes:
            matches=[s for s,flags in classes[owner]['fields'].items() if s.startswith(name+':') and not flags&8]
            if matches:
                header_fields[name]=matches[0].split(':',1)[1];break
            owner=classes[owner]['parent']
    def text_view(kind):
        seen=set()
        while kind and kind not in seen:
            if kind=='Landroid/widget/TextView;':return True
            seen.add(kind);kind=classes.get(kind,{}).get('parent')
        return False
    if header_fields.get('panelType')!='I':missing.append('clock_backdrop.panelType:I')
    for name in ['mClockView','mDateView']:
        if not text_view(header_fields.get(name)):missing.append('clock_backdrop.'+name+':TextView_subclass')
    report={'apk':str(apk),'sha256':hashlib.sha256(apk.read_bytes()).hexdigest(),'checked':len(checked),'routes':routes,
            'clockBackdropFields':header_fields,'missing':missing,'passed':not missing}
    reports.append(report);print(json.dumps(report,ensure_ascii=False))
if args.output:args.output.write_text(json.dumps(reports,ensure_ascii=False,indent=2),encoding='utf-8')
if any(not r['passed'] for r in reports):raise SystemExit(1)
