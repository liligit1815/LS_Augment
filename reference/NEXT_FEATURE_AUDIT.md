# LS_Augment enhancement audit and hook delta

Audit date: 2026-08-13

## Repository state accepted as the baseline

- Git HEAD: `e7db8c5` (`release: prepare v1.0.0-rc1`).
- Git HEAD's KernelSU core release version remains `1.0.0-rc1` / `10034`;
  the working-tree feature bundle is coherently versioned as test10039.
- The pre-existing dirty worktree contains the Launcher Recents visual stack,
  memory overlay, HeartVoice experiment traces, documentation, scope and probe
  changes. Those changes were preserved; none were reset or overwritten.
- This enhancement pass uses KernelSU + Companion test revision
  `1.0.0-rc1-test10039` / `10039` because the new WebUI/config mirror spans
  both artifacts.

## Existing rc1 architecture

### KernelSU core

- `/data/adb/ls_augment/targets.conf` is the authoritative list of exact
  `userId:packageName` AppHide targets.
- Shell actions validate user IDs/package names, protect critical packages,
  serialize state-changing operations and use `pm hide/unhide --user`.
- Boot rebuilds runtime state and the Settings mirror from PackageManager truth;
  it never force-hides all configured apps.
- WebUI, tile presentation, lock-screen automation, logs and recovery are
  separate front ends over the same validated core.

### Modern LSPosed module

- Companion uses libxposed API 102 (`staticScope=true`), not the legacy
  `de.robv.android.xposed` API.
- Settings filters a copy of the OEM app list at
  `ManageApplications$ApplicationsAdapter.removeHideApk(...)`, with
  `onRebuildComplete(...)` as fallback.
- Matching is exact `(userId, packageName)` through `SettingsTargetMatcher`;
  no package-name-only or system_server/PMS hook is used.
- GameSpace/GameAssist/GameHelper hooks relax OEM shoulder-key eligibility while
  preserving TGK/InputManager ownership.
- The local `test10036` work adds a visual-only Launcher Recents layer and does
  not rewrite native scroll, snap, launch or dismiss state.

## Regression boundary

The following AppHide assets are intentionally unchanged by enhancement code:

```text
module/bin/hide.sh
module/bin/show.sh
module/bin/restore_all.sh
module/bin/save_config.sh
module/bin/sync_hook_mirror.sh
SettingsTargetMatcher.java
AugmentModule.filterCopy(...)
```

Enhancement settings use `/data/adb/ls_augment/features.conf` and distinct
`ls_augment_doubleapp_*` / `ls_augment_statusbar_*` keys. An empty or missing
feature setting always means disabled.

## Old release → current implementation delta

| Domain | RedMagicHelper 3.3.4 point | Current APK evidence | test10039 action |
|---|---|---|---|
| Low-memory clone gate | `com.zte.cn.doubleapp.common.Utils.showLimitedApps(Context)` | `com.zte.cn.doubleapp` 16.0.000.000.2604151541; method and boolean signature still present | Implemented with exact name/signature filtering, runtime fail-closed probe |
| Any-App clone list | `com.zte.cn.doubleapp.common.UpdateUtils.getSupportApps()` | Same APK; `getSupportApps()` returns `List<String>` and still feeds the whitelist | Implemented for the current no-arg List method; installed package names are appended while preserving OEM entries |
| Status-bar inflate | `PhoneStatusBarView.onFinishInflate()` | `SystemUI_MFV` 16.0.000.101.2604151744; class/method present | Implemented as compatibility-gated View wrapper; no controller replacement |
| Status-bar height | `PhoneStatusBarView.updateStatusBarHeight()` + framework `SystemBarUtils.getStatusBarHeight(Context)` | Current `PhoneStatusBarView` still calls both points | Both hooks implemented when signatures match |
| Clock | `com.android.systemui.statusbar.policy.Clock.updateClock()` | Current class/method present; class still extends `TextView` | Formatter/seconds ticker implemented and unit-tested; disabled by default |
| Network speed | OEM `StatusBarNetSpeedMFV` / `SpeedControllerImpl` | Both OEM classes present in current SystemUI | Independent `TrafficStats` delta fallback implemented; OEM controller remains untouched |
| Thermal/battery data | sysfs thermal + power_supply nodes | NX809J exposes CPU zones, `gpuss-*`, `battery/temp`, `current_now`, `voltage_now`, `power_now` | Runtime node discovery and unit normalization implemented; missing nodes omit their field |
| Notification count | `NotificationIconContainer` layout boundary | Current method is `calculateIconXTranslations()` (renamed from old `calculateIconTranslations`) | Hook now accepts both names; default system count when value is 0 |
| Beautify account gate | `ZteAccountManager.getCurrentUserInfo()` | `com.zte.beautify` 16.1.000.000.2604151530; method and no-arg `ZteAccountInfo()` constructor present | Optional guest account only for the local account-presence gate; free/trial download chain remains original and paid payment flow is untouched |
| Theme download | `OnlineThemePreviewFragment.themeDownload(...)` | Current method present; it only checks `getCurrentUserInfo()` before the original download chain | Account-presence gate bypass is optional; original free/trial path remains intact |
| Wallpaper/resource | `BeautyPreviewActivity.ResourceDownload(...)` + OEM listeners | Current private method present; paid branch still calls `PaymentManager`, free/time-limit branch calls OEM DownloadManager | Only account-presence gate is bypassed; paid branch is not altered |
| AOD | `AodPreviewFragment.aodDownload()` + OEM listeners/SaveAodPreviewTask | Current method present; same account-presence gate and OEM SaveAodPreviewTask path | Only account-presence gate is bypassed |

## Beautify safety boundary

The current APK confirms that free/time-limit resources already use the OEM
DownloadManager and that paid resources go through `PaymentManager`. The module
therefore only returns an empty `ZteAccountInfo` object when the local account
check would otherwise stop the flow. It does not change `Bean.getIsCharge()`,
payment state, download URLs, listeners, or server-side entitlement.

## Required artifacts for the remaining static delta

The current connected device has already supplied the static evidence used by
this revision. The pulled files are retained under `work/adb-target-apk/` and
the decompiled method surfaces under `work/smali-*` for reproducible audits.

For a future OTA, extract every base/split APK for:

```text
com.android.systemui
com.zte.beautify
com.zte.cn.doubleapp
```

Also capture build fingerprint/component versions and the readable battery/
thermal sysfs nodes. A connected rooted device can provide the same information
through the existing runtime compatibility diagnostics, but static APKs are
still required before enabling Beautify downloads.
