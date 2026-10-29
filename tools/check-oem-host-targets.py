"""Verify the reported Android 17 OEM member contracts directly in APK DEX files."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import re

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('dex', ROOT / 'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--launcher', type=Path, required=True)
parser.add_argument('--systemui', type=Path, required=True)
parser.add_argument('--output', type=Path, required=True)
args = parser.parse_args()
results = []

def scan(apk, required):
    classes, _ = dex.read_apk(apk)
    checks = []
    for cls, kind, signature in required:
        owner = 'L' + cls.replace('.', '/') + ';'
        found = None
        while owner in classes:
            if signature in classes[owner][kind]:
                found = classes[owner][kind][signature]
                break
            owner = classes[owner]['parent']
        checks.append({'class': cls, 'signature': signature, 'present': found is not None,
                       'instanceConcrete': found is not None and not found & (8 | (1024 if kind == 'methods' else 0))})
    if apk == args.launcher:
        for cls, name, count in [('TouchInteractionHandler', 'createGestureState', 4),
                                 ('RecentsAnimationCallbacks', 'onAnimationStart', 6),
                                 ('RecentsAnimationCallbacks', 'lambda$onAnimationStart$4', 2)]:
            owner = 'Lcom/android/quickstep/' + cls + ';'
            matches = [s for s, flags in classes[owner]['methods'].items()
                       if s.startswith(name + '(') and not flags & (8 | 1024)
                       and len(re.findall(r'\[*L[^;]+;|\[*[ZBCSIFJD]', s.split('(', 1)[1].split(')', 1)[0])) == count]
            checks.append({'class': owner, 'signature': matches or name, 'present': bool(matches), 'instanceConcrete': len(matches) == 1})
    results.append({'apk': str(apk), 'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(),
                    'checks': checks, 'passed': all(c['instanceConcrete'] for c in checks),
                    'evidence': 'Defined DEX members including inheritance; not device acceptance'})

quick = 'com.android.quickstep.'
scan(args.launcher, [(quick + cls, 'methods', method) for cls, method in [
    ('TopTaskTracker$CachedTaskInfo', '<init>(Ljava/util/List;Landroid/content/Context;II)V'),
    ('RecentsAnimationController', 'finishController(ZLjava/lang/Runnable;ZZLcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V'),
    ('RecentsAnimationController$1', 'send(ILandroid/os/Bundle;)V'),
    ('RecentsAnimationCallbacks', 'onAnimationCanceled(Ljava/util/HashMap;)V'),
    ('views.RecentsView', 'applyLoadPlan(Ljava/util/List;I)V'),
    ('views.RecentsView', 'setContentAlpha(F)V'),
    ('views.RecentsView', 'reloadIfNeeded(Z)V'),
    ('AbsSwipeUpHandler', 'getLaunchIntent()Landroid/content/Intent;'),
    ('AbsSwipeUpHandler', 'onLauncherStart()V'),
    ('AbsSwipeUpHandler$AppToHomeAnimationSuccessListener', 'onAnimationEnd(Landroid/animation/Animator;)V'),
    ('window.RecentsWindowContext', 'getForeColor()I'),
    ('window.RecentsWindowManager', 'isInState(Lcom/android/launcher3/statemanager/BaseState;)Z'),
    ('GestureState', 'useSyntheticRecentsTransition()Z'),
    ('TaskShortcutFactory$SplitSelectSystemShortcut', 'onClick(Landroid/view/View;)V'),
    ('inputconsumers.OtherActivityInputConsumer', 'startTouchTrackingForWindowAnimation(J)V'),
    ('TouchInteractionHandler', 'onInputEvent(Landroid/view/InputEvent;)V'),
    ('TouchInteractionHandler', 'getInputResource(I)Lcom/android/quickstep/TouchInteractionHandler$InputResource;'),
]] + [
    (quick + 'views.RecentsView', 'fields', 'mAppliedTaskListChangeId:I'),
    ('com.android.launcher3.mfvUtil.CrashHandler', 'methods', 'cleaner(Landroid/content/Context;)V'),
    ('com.android.launcher3.mfvUtil.CrashHandler$1', 'methods', 'uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V'),
    ('com.android.launcher3.mfvUtil.CrashHandler$1', 'fields', 'this$0:Lcom/android/launcher3/mfvUtil/CrashHandler;'),
])
island = 'com.zte.feature.dynamicisland.'
scan(args.systemui, [(island + 'DynamicIslandManager', 'fields', 'mDynamicIslandEnable:Z')] + [
    (island + 'PermanentIslandManager', kind, name) for kind, name in [
        ('fields', 'mDynamicIslandFuncEnable:Z'),
        ('methods', 'updateDynamicIslandEnabled(Z)V'),
        ('methods', 'onDynamicIslandSettingsChanged(Z)V'),
        ('methods', 'onKeyguardStateChanged(Z)V'),
        ('fields', 'mDynamicIslandRoot:Landroid/view/ViewGroup;'),
        ('fields', 'mDynamicIslandPanelRoot:Landroid/view/View;'),
        ('fields', 'mDynamicIslandTouchHelper:Landroid/view/ViewGroup;'),
        ('fields', 'mStickyAnimationView:Lcom/zte/feature/dynamicisland/StickyAnimationView;'),
    ]
])
args.output.write_text(json.dumps(results, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
for report in results:
    print(report['apk'], 'PASS' if report['passed'] else 'FAIL', len(report['checks']), 'contracts')
    for check in report['checks']:
        if not check['instanceConcrete']:
            print('  MISSING', check['class'], check['signature'])
raise SystemExit(0 if all(r['passed'] for r in results) else 1)
