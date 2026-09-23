"""Verify inspected RedMagic SystemUI entry points against an APK, without executing it."""
import argparse
import re
import struct
import zipfile


def methods_in_dex(data):
    def number(offset):
        value = shift = 0
        while True:
            byte = data[offset]
            offset += 1
            value |= (byte & 127) << shift
            if byte < 128:
                return value, offset
            shift += 7

    count, offset = struct.unpack_from('<II', data, 56)
    strings = []
    for index in range(count):
        start = struct.unpack_from('<I', data, offset + index * 4)[0]
        _, start = number(start)
        strings.append(data[start:data.index(b'\0', start)].decode('utf-8', 'replace'))
    count, offset = struct.unpack_from('<II', data, 64)
    types = [strings[struct.unpack_from('<I', data, offset + index * 4)[0]] for index in range(count)]
    count, offset = struct.unpack_from('<II', data, 72)
    prototypes = []
    for index in range(count):
        _, result, arguments = struct.unpack_from('<III', data, offset + index * 12)
        argc = struct.unpack_from('<I', data, arguments)[0] if arguments else 0
        prototypes.append((argc, types[result]))
    count, offset = struct.unpack_from('<II', data, 88)
    methods = [struct.unpack_from('<HHI', data, offset + index * 8) for index in range(count)]
    count, offset = struct.unpack_from('<II', data, 96)
    for index in range(count):
        encoded = struct.unpack_from('<I', data, offset + index * 32 + 24)[0]
        if not encoded:
            continue
        counts = []
        for _ in range(4):
            value, encoded = number(encoded)
            counts.append(value)
        for _ in range(sum(counts[:2])):
            _, encoded = number(encoded)
            _, encoded = number(encoded)
        for size in counts[2:]:
            method_id = 0
            for _ in range(size):
                difference, encoded = number(encoded)
                method_id += difference
                _, encoded = number(encoded)
                _, encoded = number(encoded)
                owner, prototype, name = methods[method_id]
                argc, result = prototypes[prototype]
                yield types[owner][1:-1].replace('/', '.'), strings[name], argc, result


EXPECTED = [
    ('com.android.systemui.qs.external.CustomTile', 'handleUpdateState', 2, 'V'),
    ('com.android.systemui.statusbar.phone.ui.StatusBarIconControllerImpl', 'onTuningChanged', 2, 'V'),
    ('com.android.systemui.statusbar.phone.ui.StatusBarIconController', 'getIconHideList', 2, 'Landroid/util/ArraySet;'),
    ('com.android.systemui.statusbar.phone.ui.IconManager', 'addIcon', 4, 'Lcom/android/systemui/statusbar/StatusBarIconView;'),
    ('com.android.systemui.statusbar.StatusBarIconView', 'isIconBlocked', 0, 'Z'),
    ('com.android.systemui.statusbar.events.PrivacyDotViewControllerImpl', 'showDotView', 2, 'V'),
    ('com.android.systemui.statusbar.events.PrivacyDotViewControllerImpl', 'hideDotView', 2, 'V'),
    ('com.android.systemui.statusbar.events.PrivacyDotViewControllerImpl', 'initialize', 4, 'V'),
    ('com.android.systemui.statusbar.events.SystemStatusAnimationSchedulerImpl', 'onStatusEvent', 1, 'V'),
    ('com.android.systemui.privacy.OngoingPrivacyChip', 'setPrivacyList', 1, 'V'),
    ('com.android.systemui.volume.VolumeDialogImpl', 'showSafetyWarningH', 1, 'V'),
    ('com.android.systemui.volume.VolumeDialogImpl', 'showCsdWarningH', 2, 'V'),
    ('com.android.systemui.statusbar.pipeline.mobile.ui.view.ModernStatusBarMobileView', 'getSubId', 0, 'I'),
    ('com.zte.feature.signal.WifiUtils$Companion', 'getWifiSignalStrengthIconId', 6, 'I'),
    ('com.zte.mifavor.views.MFVBatteryViewLayout', 'getLevelDisplayMode', 0, 'I'),
    ('com.zte.mifavor.views.MFVBatteryViewLayout', 'updateBatteryLayout', 2, 'V'),
    ('com.zte.mifavor.views.MFVBatteryViewLayout', 'updateBatteryLevelText', 0, 'V'),
    ('com.zte.mifavor.views.MFVBatteryViewLayout', 'updateColor', 0, 'V'),
    ('com.zte.mifavor.views.MFVBatteryViewLayout', 'updateBatteryLevelColor', 1, 'V'),
    ('com.zte.mifavor.views.MFVBatteryViewLayout', 'getMappedBatteryIconFgColor', 1, 'I'),
    ('com.zte.mifavor.views.MFVBatteryViewLayout', 'getMappedBatteryIconTextColor', 1, 'I'),
    ('com.zte.mifavor.views.MFVBatteryMeterView', 'setColorTint', 2, 'V'),
    ('com.zte.mifavor.views.MFVBatteryLevelView', 'updateLevelColor', 1, 'V'),
    ('com.zte.feature.volume.MfvVolumeDialog', 'shouldKeyguardHandleVolumeKeys', 0, 'Z'),
    ('com.zte.adapt.mifavor.volume.VolumeDialogImplAdapt', 'richTapVibrateForVolumeKeyLongPress', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.BaseLockScreenClock', 'refreshAmPm', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.BaseLockScreenClock', 'onAttachedToWindow', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.BaseLockScreenClock', 'onDetachedFromWindow', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockDefault', 'refreshAmPm', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockDefault', 'refreshTime', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockDefault', 'refreshClockViewFont', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockHorizen', 'refreshAmPm', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockHorizen', 'refreshTime', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockHorizen', 'refreshClockViewFont', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockVertical', 'refreshAmPm', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockVertical', 'refreshTime', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockVertical', 'refreshClockViewFont', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockClip', 'refreshAmPm', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockClip', 'refreshTime', 0, 'V'),
    ('com.zte.mifavor.keyguard.settings.LockScreenClockClip', 'updateClockFont', 1, 'V'),
    ('com.android.systemui.statusbar.KeyguardIndicationController', 'setVisible', 1, 'V'),
    ('com.zte.mifavor.views.TextClock', 'onTimeChanged', 0, 'V'),
    ('com.zte.mifavor.views.TextClock', 'getFormat24Hour', 0, 'Ljava/lang/CharSequence;'),
    ('com.zte.feature.doze.AodClock.nubia.NubiaAodTextClock', 'onTimeChanged', 0, 'V'),
    ('com.zte.feature.doze.AodClock.nubia.NubiaAodTextClock', 'getFormat24Hour', 0, 'Ljava/lang/CharSequence;'),
    ('com.zte.feature.charging.ChargingFeature', 'hideChargingViewDelayed', 0, 'V'),
    ('com.zte.feature.charging.ChargingFeature', 'startChargingAnimation', 1, 'V'),
    ('com.zte.feature.charging.ChargingFeature', 'onFinishedWakingUp', 0, 'V'),
    ('com.zte.utils.QsDimenUtils$Companion', 'getTileColumns', 0, 'I'),
    ('com.zte.utils.QsDimenUtils$Companion', 'getMaxQsPanelRowCount', 0, 'I'),
    ('com.zte.adapt.mifavor.qs.MfvTileLayoutAdapt', 'getRows', 1, 'I'),
    ('com.zte.feature.qs.layout.QsCustomizerModule', 'getColumns', 0, 'I'),
    ('com.zte.controlcenter.view.ControlCenterTileLayout', 'onUpdateColumns', 0, 'V'),
    ('com.zte.controlcenter.view.ControlCenterTileLayout', 'onAttachedToWindow', 0, 'V'),
    ('com.zte.controlcenter.view.ControlCenterTileLayout', 'onDetachedFromWindow', 0, 'V'),
    ('com.zte.controlcenter.view.ControlCenterTileLayout', 'updateResources', 0, 'Z'),
    ('com.zte.adapt.mifavor.qs.MfvTileLayoutAdapt', 'getCellWidth', 1, 'I'),
    ('com.zte.adapt.mifavor.qs.MfvTileLayoutAdapt', 'getCellHeight', 1, 'I'),
    ('com.zte.qs.tileimpl.QSTileViewCircle', 'onMeasure', 2, 'V'),
    ('com.zte.controlcenter.view.ControlCenterTileLayout', 'onLayout', 5, 'V'),
    ('com.zte.mifavor.qs.MfvTileLayout', 'onLayout', 5, 'V'),
    ('com.zte.mifavor.qs.MfvPagedTileLayout', 'onFinishInflate', 0, 'V'),
    ('com.zte.mifavor.qs.MfvPagedTileLayout', 'updateResources', 0, 'Z'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'handleClickDate', 0, 'V'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'getPanelType', 0, 'I'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'onFinishInflate', 0, 'V'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'onAttachedToWindow', 0, 'V'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'onDetachedFromWindow', 0, 'V'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'updateHeaderResources', 0, 'V'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'updateVisibilities', 0, 'V'),
    ('com.android.keyguard.CarrierTextManager', 'setListening', 1, 'V'),
    ('com.zte.controlcenter.CCCustomizerController', 'onViewAttached', 0, 'V'),
    ('com.zte.controlcenter.CCCustomizerController', 'onViewDetached', 0, 'V'),
    ('com.android.systemui.qs.customize.TileAdapter', 'onCreateViewHolder', 2, 'Lcom/android/systemui/qs/customize/TileAdapter$Holder;'),
    ('com.android.systemui.qs.customize.TileAdapter', 'updateNumColumns', 0, 'Z'),
    ('com.android.systemui.qs.customize.TileAdapter', 'getNumColumns', 0, 'I'),
    ('com.android.systemui.qs.customize.QSCustomizer', 'getRecyclerView', 0, 'Landroidx/recyclerview/widget/RecyclerView;'),
    ('com.zte.feature.qs.layout.QsCustomizerModule', 'updateTileAdapterResource', 0, 'V'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'handleClickSearch', 0, 'V'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'postStartActivityDismissingKeyguard', 1, 'V'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'shouldQsCarrierVisible', 0, 'Z'),
    ('com.zte.controlcenter.widget.CCHeaderView', 'showSearchButton', 0, 'Z'),
    ('com.zte.feature.notification.NotificationUtil', 'shouldShowAppIcon', 1, 'Z'),
    ('com.zte.feature.notification.NotificationUtil', 'getAppIconBackgroundDrawable', 2, 'Landroid/graphics/drawable/Drawable;'),
    ('com.zte.feature.notification.MfvNotificationExtKt', 'mfvDecideStatusBarNotifIconColor', 1, 'I'),
    ('com.zte.feature.notification.MfvNotificationExtKt', 'mfvUpdateBackground', 1, 'Lcom/android/systemui/statusbar/StatusBarIconView;'),
    ('com.android.systemui.statusbar.StatusBarIconView', 'setUseAppIcon', 1, 'V'),
    ('com.android.systemui.statusbar.StatusBarIconView', 'updateDrawable', 0, 'V'),
    ('com.zte.feature.notification.module.NotificationViewWrapperModule', 'processAppIcon', 4, 'V'),
    ('com.zte.feature.fake.FakeNotchFeature', 'updateBlackVisibility', 3, 'V'),
    ('com.android.systemui.clipboardoverlay.ClipboardListener', 'forceSuppressOverlay', 0, 'Z'),
    ('com.zte.adapt.mifavor.navbar.AssistManagerAdapt', 'getAssistInfoForUser', 1, 'Landroid/content/ComponentName;'),
    ('com.zte.adapt.mifavor.navbar.AssistManagerAdapt', 'handleStartAssist', 2, 'Z'),
    ('com.android.wm.shell.onehanded.OneHandedDisplayAreaOrganizer', 'scheduleOffset', 2, 'V'),
    ('com.android.wm.shell.onehanded.OneHandedTutorialHandler', 'getTutorialTargetLayoutParams', 0, 'Landroid/view/WindowManager$LayoutParams;'),
    ('com.android.systemui.doze.DozeUi', 'roundToNextMinute', 1, 'J'),
    ('com.android.systemui.statusbar.KeyguardIndicationController', 'computePowerIndication', 0, 'Ljava/lang/String;'),
    ('com.android.systemui.statusbar.KeyguardIndicationController', 'updateIndicationPublic', 1, 'V'),
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk')
    args = parser.parse_args()
    actual = set()
    with zipfile.ZipFile(args.apk) as archive:
        for name in archive.namelist():
            if re.fullmatch(r'classes\d*\.dex', name):
                actual.update(methods_in_dex(archive.read(name)))
    missing = [entry for entry in EXPECTED if entry not in actual]
    for entry in missing:
        print('MISSING', entry)
    print(f'SystemUI adapter signatures: {len(EXPECTED)-len(missing)}/{len(EXPECTED)} verified')
    raise SystemExit(bool(missing))


if __name__ == '__main__':
    main()
