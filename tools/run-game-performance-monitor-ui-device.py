"""Run monitor UI controls and retain same-device font/orientation evidence.

Requires the current application and DeviceRegressionRunner test APK to be installed.
This development-only script never installs APKs or restarts game-space processes.
The optional matrix temporarily changes the system font scale and restores it.
"""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import time


ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, default=Path(os.environ.get(
        'LS_AUGMENT_ADB', ROOT / 'audit-output/android-sdk/platform-tools/adb.exe')))
    parser.add_argument('--serial', default=os.environ.get('LS_AUGMENT_DEVICE', '9125258103D6'))
    parser.add_argument('--output', type=Path, default=ROOT / 'out/game-performance-monitor-ui-device')
    parser.add_argument('--layout-matrix', action='store_true',
                        help='Test font scale 1.0 and 1.3 in portrait and landscape, restoring the original scale')
    parser.add_argument('--layout-only', action='store_true')
    parser.add_argument('--landscape', action='store_true')
    args = parser.parse_args()
    if not args.adb.is_file():
        raise FileNotFoundError(args.adb)
    if not re.fullmatch(r'[A-Za-z0-9_.:-]+', args.serial):
        raise ValueError('Invalid device serial')
    args.output.mkdir(parents=True, exist_ok=True)

    def adb(*arguments, timeout=40, check=True):
        result = subprocess.run([str(args.adb), '-s', args.serial, *map(str, arguments)],
                                capture_output=True, timeout=timeout)
        if check and result.returncode:
            raise RuntimeError(result.stderr.decode('utf-8', 'replace') + result.stdout.decode('utf-8', 'replace'))
        return result.stdout.decode('utf-8', 'replace').strip()

    def shell(*arguments, **kwargs):
        return adb('shell', *arguments, **kwargs)

    if adb('get-state') != 'device':
        raise RuntimeError('Selected device is unavailable')
    package = shell('dumpsys', 'package', 'ls.augment.com')
    code = re.search(r'\bversionCode=(\d+)', package)
    if not code:
        raise RuntimeError('Application is not installed')
    version_code = int(code.group(1))
    if 'ls.augment.com.DeviceRegressionRunner' not in shell('pm', 'list', 'instrumentation'):
        raise RuntimeError('DeviceRegressionRunner test APK is not installed')

    original_font = shell('settings', 'get', 'system', 'font_scale')
    if original_font not in ('null', '') and not re.fullmatch(r'\d+(?:\.\d+)?', original_font):
        raise RuntimeError('System font scale has an unexpected value; no matrix changes were made')
    baseline = {
        'serial': args.serial,
        'versionCode': version_code,
        'model': shell('getprop', 'ro.product.model'),
        'density': shell('wm', 'density'),
        'displaySize': shell('wm', 'size'),
        'fontScaleSetting': original_font,
        'nightMode': shell('settings', 'get', 'secure', 'ui_night_mode'),
        'screenState': shell('dumpsys', 'window', 'displays'),
    }
    (args.output / 'same-device-baseline.json').write_text(
        json.dumps(baseline, ensure_ascii=False, indent=2), encoding='utf-8')
    reports, failure = [], None
    runs = ([('normal-portrait', '1.0', False, False),
             ('normal-landscape', '1.0', True, True),
             ('large-portrait', '1.3', True, False),
             ('large-landscape', '1.3', True, True)] if args.layout_matrix else
            [('current-font-' + ('landscape' if args.landscape else 'portrait'),
              None, args.layout_only, args.landscape)])
    font_changed = False
    try:
        shell('input', 'keyevent', 'KEYCODE_WAKEUP')
        shell('wm', 'dismiss-keyguard')
        time.sleep(.8)
        for label, scale, layout_only, landscape in runs:
            if scale is not None:
                shell('settings', 'put', 'system', 'font_scale', scale)
                font_changed = True
                time.sleep(.8)
            folder = args.output / label
            folder.mkdir(exist_ok=True)
            output = shell('am', 'instrument', '-w', '-r',
                           '-e', 'operation', 'game-performance-monitor-ui',
                           '-e', 'label', 'monitor-ui-' + label,
                           '-e', 'layoutOnly', str(layout_only).lower(),
                           '-e', 'landscape', str(landscape).lower(),
                           'ls.augment.com.test/ls.augment.com.DeviceRegressionRunner', timeout=180)
            (folder / 'instrumentation.txt').write_text(output, encoding='utf-8')
            status = re.search(r'^INSTRUMENTATION_RESULT: status=(\w+)\s*$', output, re.MULTILINE)
            raw = re.search(r'^INSTRUMENTATION_RESULT: gamePerformanceMonitorUi=(\{.*\})\s*$', output, re.MULTILINE)
            # Pull even a failed run so its screen and actual boundary measurements remain reviewable.
            pulled = adb('pull', f'/sdcard/Android/data/ls.augment.com/files/game-performance-monitor-ui-{version_code}',
                         folder, timeout=60, check=False)
            (folder / 'evidence-pull.txt').write_text(pulled, encoding='utf-8')
            if not status or status.group(1) != 'pass' or not raw:
                raise AssertionError(f'{label} failed; inspect {folder / "instrumentation.txt"}')
            report = json.loads(raw.group(1))
            if not report.get('success') or not report.get('configurationUnchanged'):
                raise AssertionError(f'{label} did not preserve configuration')
            for layout in report['layouts']:
                if not 7.5 <= layout['navigationGapDp'] <= 12.5:
                    raise AssertionError(f'{label} navigation gap is outside 8–12 dp')
                if scale is not None and abs(layout['fontScale'] - float(scale)) > .01:
                    raise AssertionError(f'{label} did not render the requested font scale')
                if landscape and layout['orientation'] != 2:
                    raise AssertionError(f'{label} did not render landscape')
            report['label'] = label
            reports.append(report)
            (folder / 'report.json').write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
            print(json.dumps({'label': label, 'checks': report['checks'], 'pass': True,
                              'layouts': report['layouts']}, ensure_ascii=False), flush=True)
    except BaseException as error:
        failure = error
    finally:
        if font_changed:
            if original_font in ('null', ''):
                shell('settings', 'delete', 'system', 'font_scale')
            else:
                shell('settings', 'put', 'system', 'font_scale', original_font)
            time.sleep(.8)
        restored_font = shell('settings', 'get', 'system', 'font_scale')
        summary = {'pass': failure is None and restored_font == original_font,
                   'sameDevice': baseline, 'runs': reports,
                   'fontScaleRestored': restored_font == original_font,
                   'restoredFontScaleSetting': restored_font}
        if failure is not None:
            summary['error'] = str(failure)
        (args.output / 'results.json').write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding='utf-8')
        if restored_font != original_font:
            raise AssertionError('Original system font scale was not restored') from failure
    if failure is not None:
        raise failure
    print(json.dumps({'pass': True, 'runs': len(reports), 'output': str(args.output)}, ensure_ascii=False))


if __name__ == '__main__':
    main()
