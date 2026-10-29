"""Check Duo ordinary-host interfaces/resources in OEM APKs; not a device acceptance claim."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('dex', ROOT / 'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)

def check(apk):
    classes, resources = dex.read_apk(apk)
    n = 'Lcom/zte/feature/dynamicisland/'
    manager, pm, island = n + 'DynamicIslandManager;', n + 'PermanentIslandManager;', n + 'DynamicPermanentIsland;'
    missing = []
    def members(owner, kind, prefix):
        while owner in classes:
            matches = [(k, v) for k, v in classes[owner][kind].items() if k.startswith(prefix)]
            if matches:
                return matches
            owner = classes[owner]['parent']
        return []
    def member(owner, kind, signature, static=False):
        prefix = signature[:signature.index(')') + 1] if kind == 'methods' else signature.split(':')[0] + ':'
        found = members(owner, kind, prefix)
        return len(found) == 1 and found[0][0] == signature and bool(found[0][1] & 8) == static and not (kind == 'methods' and found[0][1] & 1024)
    def require(owner, kind, signatures):
        missing.extend(signature for signature in signatures if not member(owner, kind, signature))
    require(manager, 'methods', ['initDynamicIsland()V'])
    require(manager, 'fields', ['mContext:Landroid/content/Context;'])
    require(pm, 'fields', ['mDynamicIslandRoot:Landroid/view/ViewGroup;', 'mDynamicIslandContainer:Landroid/view/ViewGroup;',
                          'mDynamicPanelContainer:Landroid/view/ViewGroup;', 'mParams:Landroid/view/WindowManager$LayoutParams;',
                          'mWindowManager:Landroid/view/WindowManager;', 'mIsDynamicIslandEnable:Z'])
    require(pm, 'methods', [f'addPermanentIslandInner({island})V', f'removePermanentIslandInner({island})V',
                           f'getPermanentIsland(){island}', 'showPermanentPanelIsland()V', 'onKeyguardStateChanged(Z)V'])
    missing.extend(name for name in ['dynamic_island_layout', 'media_island_layout', 'charging_island_layout'] if 'layout/' + name not in resources)
    flag = members('Lcom/zte/tools/AppTools;', 'fields', 'ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN:')
    if flag and not member('Lcom/zte/tools/AppTools;', 'fields', 'ZTE_FEATURE_LIVE_ISLAND_FULL_SCREEN:Z', static=True):
        missing.append('fullscreen flag type/static')
    wake = next((label for label, owner in [('manager', manager), ('permanent', pm)] if member(owner, 'methods', 'onStartedWakingUp()V')), None)
    if wake is None:
        require(pm, 'fields', ['mAODVisibility:Z', 'mIsDynamicIslandEnable:Z', 'mPayJoyControlled:Z', 'mCurRotation:I'])
        require(pm, 'methods', ['setAODVisibility(Z)V', 'updateRooterVisibility()V'])
        if members(pm, 'fields', 'mInteractive:'):
            missing.append('interactive host without wake callback')
        wake = 'permanent_visibility'
    if not flag:
        if wake != 'permanent_visibility':
            missing.append('missing fullscreen flag on new host')
        for name in ['mDynamicIslandPanelRoot', 'mDynamicIslandFuncEnable', 'mStickyAnimationView']:
            if members(pm, 'fields', name + ':'):
                missing.append('missing fullscreen flag with ' + name)
    app = 'layout/app_island_layout' in resources
    panel = 'layout/app_island_panel_layout' in resources
    if app or panel:
        route = 'app_template_ordinary'
        if not app or not panel:
            missing.append('partial templates')
        require(island, 'methods', ['initAppIsland(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B[BLjava/lang/String;[BLjava/lang/String;)V',
                                    'initPanelIsland(Ljava/lang/String;Ljava/lang/String;)V', f'setPanelIsland({island})V'])
        require(pm, 'methods', ['updateResources()V', 'updateDynamicWindowParams()V'])
        require(manager, 'methods', ['registerConfigChangeListener()V'])
    else:
        route = 'legacy_ordinary'
        if wake != 'permanent_visibility':
            missing.append('legacy cards on unknown wake host')
        require(island, 'methods', ['<init>(Landroid/content/Context;Landroid/util/AttributeSet;)V', f'getPanelIsland(){island}',
                                    'getPanelType()I', 'updateViewVisibility(ZZ)V', 'updatePanelVisibility(ZZZ)V', 'updateViewAlpha(Landroid/view/View;ZZ)V'])
        require(island, 'fields', ['mViewList:Ljava/util/List;', 'mKeyguardIsland:Z'])
        require(pm, 'methods', ['updateDynamicWindowHeightParams(Z)V'])
    return dict(apk=str(apk), sha256=hashlib.sha256(apk.read_bytes()).hexdigest(), route=route, wake=wake,
                fullscreenFlag='present: runtime must be false for Duo' if flag else 'absent: legacy ordinary contract',
                missing=missing, passed=not missing, evidence='DEX and resources only; no device acceptance')

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--systemui', type=Path, action='append', required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    results = [check(apk) for apk in args.systemui]
    args.output.write_text(json.dumps(results, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for r in results:
        print(json.dumps(r, ensure_ascii=False))
    if any(not r['passed'] for r in results):
        raise SystemExit(1)

if __name__ == '__main__':
    main()
