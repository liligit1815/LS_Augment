# LS_Augment v1 — target ROM hook notes

These notes record the exact artifacts used to select the v1 Settings hook point.

## ROM artifacts

```text
Settings_MFV.apk
sha256 66c738fc5715a736fa7daec516a691104d0bbcbddf28d64f02ee5fa2820f3762

Launcher_MFV.apk
sha256 cce32bcfa1fce5a4c208ea510594a1c7d0e6ad614588334a12753f2819cf3f7c

SystemUI_MFV.apk
sha256 4cdfae2a60f69f4614b0d764508bb35706afd0d5352483d48f04363bf08a3710
```

## Verified Settings hook point

DEX inspection of `Settings_MFV.apk` found:

```text
Lcom/android/settings/applications/manageapplications/ManageApplications$ApplicationsAdapter;
removeHideApk(Ljava/util/ArrayList;)->Ljava/util/ArrayList;
```

The vendor method already differentiates hidden entries by user and treats clone user 999 separately. LS_Augment reuses this list-processing boundary but supplies its own exact `(userId, packageName)` filter from `ls_augment_hidden_targets`.

## Why heartyservice is not the v1 hide backend

Ordinary ZTE AppHide for `com.ss.android.ugc.aweme` can hide user0 from Settings, but it also makes the user999 launcher Activity unresolvable. Explicit:

```sh
am start --user 999 -n com.ss.android.ugc.aweme/.splash.SplashActivity
```

returned `Error type 3 ... Activity ... does not exist` while AppHide was active. This violates cross-user isolation.

## Why `pm hide --user` is the backend

With only:

```sh
pm hide --user 0 com.ss.android.ugc.aweme
```

verified behavior was:

```text
user0: pm list absent, resolve absent, launcher absent
user999: pm list present, resolve present, launcher present, explicit start succeeds
```

Only Settings kept displaying the user0 item because of its cross-user application enumeration. This is exactly the defect the LSPosed hook addresses.
