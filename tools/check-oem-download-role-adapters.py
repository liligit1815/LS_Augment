"""Verify download/HOME adapters against the two inspected OEM APKs (read only)."""
import argparse
import hashlib
import importlib.util
from pathlib import Path
import re
import zipfile

spec = importlib.util.spec_from_file_location('systemui_dex', Path(__file__).with_name('check-systemui-adapters.py'))
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)

BASE = 'com.zte.beautify.view.common.preview.'
AOD = BASE + 'online.AodPreviewFragment'
THEME = [
    (BASE + 'online.OnlineThemePreviewFragment', 'themeDownload', 1, 'Z'),
    (BASE + 'online.OnlineThemePreviewFragment', 'doDownload', 2, 'V'),
    (AOD, 'aodDownload', 0, 'Z'), (AOD, 'doDownload', 1, 'V'),
    (AOD, 'checkDownloadUrl', 0, 'Z'),
    (AOD + '$5', 'onNoDoubleClick', 1, 'V'),
    (AOD + '$AodTryDownloadListener', '<init>', 2, 'V'),
    (BASE + 'BeautyPreviewActivity', 'ResourceDownload', 1, 'V'),
    (BASE + 'BeautyPreviewActivity', 'doDownload', 1, 'V'),
    (BASE + 'BeautyPreviewActivity', 'startAccountManager', 0, 'V'),
    ('androidx.fragment.app.FragmentManager', 'findFragment', 1, 'Landroidx/fragment/app/Fragment;'),
    ('com.zte.beautify.view.common.tools.SaveAodPreviewTask', '<init>', 2, 'V'),
    ('com.zte.beautify.util.CommonExecUtil', 'setFuncAndExec', 2, 'V'),
    ('com.zte.beautify.model.download.DownloadManager', 'startDownloadTask', 3, 'V'),
]
HOME = [
    ('com.android.permissioncontroller.role.ui.DefaultAppChildFragment', 'addApplicationPreferences', 4, 'V'),
    ('com.android.permissioncontroller.role.ui.DefaultAppChildFragment', 'onApplicationListChanged', 0, 'V'),
    ('K2.D', 'm', 1, 'Z'), ('K2.D', 'o', 1, 'Z'),
]


def check(path, expected_hash, expected):
    data = Path(path).read_bytes()
    assert hashlib.sha256(data).hexdigest() == expected_hash, f'{path}: APK changed; inspect again'
    actual = set()
    with zipfile.ZipFile(path) as archive:
        for name in archive.namelist():
            if re.fullmatch(r'classes\d*\.dex', name):
                actual.update(dex.methods_in_dex(archive.read(name)))
    missing = [entry for entry in expected if entry not in actual]
    assert not missing, f'{path}: missing {missing}'
    print(f'{Path(path).name}: SHA-256 and {len(expected)} native signatures verified')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('theme_apk')
    parser.add_argument('permission_apk')
    args = parser.parse_args()
    check(args.theme_apk, '8be52b9cf0690c760e3f6d6b696212fe8a06b86c1d6eb17746ca230d17d60ed1', THEME)
    check(args.permission_apk, 'c44df5031f8270817432c8489c29b554c093675e43aade7b338d05549a04c452', HOME)
