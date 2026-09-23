"""Run privacy toggle regressions against the production Java view-state code.

Requires a JDK on PATH. Optionally pass --apk to verify the new animated-chip
entry point against a captured SystemUI APK. This is a host-side state test;
it does not replace a device check of the actual rendered privacy indicators.
"""
import argparse
import importlib.util
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/RedMagicSystemUiHook.java'


def source_block(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


HARNESS = r'''import java.util.*;
public class PrivacyRenderRegression {
  // PRODUCTION_MEMBERS
  static final class Context { }
  static final class View {
    float alpha = 1f, transition = 1f; int visibility = 0;
    final Context context = new Context();
    Context getContext() { return context; }
    float getTransitionAlpha() { return transition; }
    void setTransitionAlpha(float value) { transition = value; }
    float renderedAlpha() { return visibility == 0 ? alpha * transition : 0; }
  }
  static final class Looper {
    static final Object MAIN = new Object();
    static Object myLooper() { return MAIN; }
    static Object getMainLooper() { return MAIN; }
  }
  static final class Main { void post(Runnable action) { action.run(); } }
  static final class FeatureSettings {
    static boolean enabled;
    static boolean enabled(Context context, String key) { return enabled; }
  }
  static final class SystemUiOptions { static final String PRIVACY_HIDE = "privacy"; }
  static final class RedMagicLegacyUiHook {
    static boolean nativeAppearance;
    static boolean positionSizeOnly(Context context) { return nativeAppearance; }
  }
  static final Main MAIN = new Main();
  static void ensureObserver(Context context) { }
  static int assertions;
  static void equal(float wanted, float actual) {
    assertions++;
    if (Math.abs(wanted - actual) > 0.00001f) throw new AssertionError(wanted + " != " + actual);
  }
  static void toggle(boolean value) { FeatureSettings.enabled = value; hidePrivacyViews(); }
  public static void main(String[] args) {
    View active = new View(); active.transition = .8f;
    rememberPrivacy(active); equal(1, PRIVACY_VIEWS.size()); equal(.8f, active.renderedAlpha());
    toggle(true); equal(0, active.renderedAlpha()); equal(1, active.alpha);
    // Native animated show continues under the independent rendering multiplier.
    active.alpha = .35f; rememberPrivacy(active); equal(0, active.renderedAlpha());
    toggle(false); equal(.8f, active.transition); equal(.35f, active.alpha); equal(.28f, active.renderedAlpha());
    active.alpha = 1; equal(.8f, active.renderedAlpha());
    // Repeated enable retains the pre-mask multiplier, rather than capturing zero.
    toggle(true); rememberPrivacy(active); rememberPrivacy(active); toggle(false); equal(.8f, active.transition);
    // Ending a permission session while hidden must not resurrect its indicator.
    toggle(true); active.alpha = 0; active.visibility = 4; rememberPrivacy(active);
    toggle(false); equal(0, active.renderedAlpha()); equal(0, active.alpha); equal(4, active.visibility);
    // Startup with the switch already enabled masks newly initialized views.
    PRIVACY_VIEWS.clear(); FeatureSettings.enabled = true;
    View restarted = new View(); rememberPrivacy(restarted); equal(0, restarted.renderedAlpha()); equal(1, restarted.alpha);
    toggle(false); equal(1, restarted.renderedAlpha());
    // Every initialized corner/rotation registers even while the switch is off.
    PRIVACY_VIEWS.clear(); View[] corners = {new View(), new View(), new View(), new View()};
    for (View corner : corners) rememberPrivacy(corner);
    equal(4, PRIVACY_VIEWS.size()); toggle(true);
    for (View corner : corners) equal(0, corner.renderedAlpha());
    toggle(false); for (View corner : corners) equal(1, corner.renderedAlpha());
    equal(4, PRIVACY_VIEWS.size());
    // Geometry-only mode restores native indicators while retaining the user's
    // hide preference, then reapplies it when the mode is disabled.
    toggle(true); RedMagicLegacyUiHook.nativeAppearance = true; hidePrivacyViews();
    for (View corner : corners) equal(1, corner.renderedAlpha());
    RedMagicLegacyUiHook.nativeAppearance = false; hidePrivacyViews();
    for (View corner : corners) equal(0, corner.renderedAlpha());
    System.out.println("Privacy rendering regression: " + assertions + " assertions passed");
  }
}
'''


def verify_apk(apk):
    spec = importlib.util.spec_from_file_location('systemui_adapters', ROOT / 'tools/check-systemui-adapters.py')
    adapters = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(adapters)
    actual = set()
    with zipfile.ZipFile(apk) as archive:
        for name in archive.namelist():
            if re.fullmatch(r'classes\d*\.dex', name):
                actual.update(adapters.methods_in_dex(archive.read(name)))
    expected = [
        ('com.android.systemui.statusbar.events.SystemStatusAnimationSchedulerImpl', 'onStatusEvent', 1, 'V'),
        ('com.android.systemui.statusbar.events.PrivacyDotViewControllerImpl', 'initialize', 4, 'V'),
        ('com.android.systemui.statusbar.events.PrivacyDotViewControllerImpl', 'showDotView', 2, 'V'),
        ('com.android.systemui.statusbar.events.PrivacyDotViewControllerImpl', 'hideDotView', 2, 'V'),
        ('com.android.systemui.statusbar.events.SystemEventChipAnimationControllerImpl', 'prepareChipAnimation', 1, 'V'),
        ('com.android.systemui.privacy.OngoingPrivacyChip', 'setPrivacyList', 1, 'V'),
    ]
    missing = [entry for entry in expected if entry not in actual]
    if missing:
        raise AssertionError(f'Missing privacy entry points: {missing}')
    print(f'Privacy APK entry points: {len(expected)}/{len(expected)} verified')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--apk', type=Path)
    args = parser.parse_args()
    source = SOURCE.read_text(encoding='utf-8')
    scheduler = re.search(
        r'count\s*\+=\s*(\w+)\(loader,\s*"com.android.systemui.statusbar.events.SystemStatusAnimationSchedulerImpl"',
        source,
    )
    if scheduler is None or scheduler.group(1) != 'hook':
        raise AssertionError('Privacy events must reach the original scheduler')
    hook = source_block(source, 'private static int hook(')
    if hook.index('chain.proceed()') > hook.index('after.run('):
        raise AssertionError('The original scheduler must run before observation')
    parts = [source_block(source, marker) for marker in (
        'private static void rememberPrivacy(',
        'private static void hidePrivacyViews(',
        'private static final class PrivacyViewState',
    )]
    if any('animate().cancel()' in part for part in parts):
        raise AssertionError('Privacy rendering must not cancel native animation end actions')
    registry = re.search(r'private static final Map<View, PrivacyViewState> PRIVACY_VIEWS[^;]*;', source)
    if registry is None:
        raise AssertionError('Production privacy view registry was not found')
    members = registry.group(0) + '\n' + '\n'.join(parts)
    java = HARNESS.replace('// PRODUCTION_MEMBERS', members).replace('RedMagicSystemUiHook::', 'PrivacyRenderRegression::')
    with tempfile.TemporaryDirectory(prefix='lsa-privacy-regression-') as directory:
        test = Path(directory) / 'PrivacyRenderRegression.java'
        test.write_text(java, encoding='utf-8')
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', directory, str(test)], check=True)
        subprocess.run(['java', '-cp', directory, 'PrivacyRenderRegression'], check=True)
    print('Privacy scheduler preservation: verified')
    if args.apk:
        verify_apk(args.apk)


if __name__ == '__main__':
    main()
