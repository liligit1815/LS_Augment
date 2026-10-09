"""Focused real Android View/Canvas invalidation regression; no phone or Gradle."""
from pathlib import Path
import argparse
ROOT=Path(__file__).resolve().parents[1]
def run(mutation=False):
    original=ROOT/'tools/test-wifi-native-budget-android.py'
    source=original.read_text('utf-8').replace("BASE=ROOT/'out/wifi-managed-header-band/android-runtime'", "BASE=ROOT/'out/wifi-replan-invalidation/android-runtime'")
    source=source.replace("paths.append(ROOT/'tools/tests/WifiManagedHeaderAndroidTest.java')", "paths.append(ROOT/'tools/tests/WifiReplanInvalidationAndroidTest.java');paths.append(production/'hook/StatusBarAssetDrawable.java')")
    source=source.replace("'ls.augment.com.hook.WifiNativeBudgetAndroidTest','ls.augment.com.hook.WifiManagedHeaderAndroidTest'", "'ls.augment.com.hook.WifiReplanInvalidationAndroidTest'")
    start=source.index('    if mutations:');end=source.index('    outcomes=[]',start)
    source=source[:start]+'''    if mutations:
        old="signal.requestLayout();activity.requestLayout();signal.invalidate();activity.invalidate();changed(signal);"
        assert old in hook
        candidates.append(('drop-transition-invalidation',hook.replace(old,"/* missing redraw ownership */")))
'''+source[end:]
    scope={'__file__':str(original),'__name__':'focused_wifi_invalidation'};exec(compile(source,str(original),'exec'),scope);return scope['run'](mutations=mutation)
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('--mutation',action='store_true');args=ap.parse_args();raise SystemExit(run(args.mutation))
