# 红魔原生桌面修改版源码

目标包：`com.zte.mifavor.launcher`。本目录从原 `out/redmagic_launcher_stack/` 整理而来，保留整理时的当前源码，不回退历史版本。

## 目录

- `src/`：Apktool 工程，包含修改后的完整 Smali、资源、原生库和打包配置，可直接回编译。
- `helper-src/main/`：`LsNativeStack.java` 辅助实现源码。
- `helper-src/stubs/`：辅助 Java 源码编译所需的厂商类型声明。
- `tooling/apktool_3.0.3.jar`：回编译工具。
- `tooling/framework-res-NX809J.apk`：目标设备的原厂框架资源。
- `framework/cache/1.apk`：原工程使用的 Apktool 框架缓存，作为回编译依赖保留。
- `original.apk`：原厂桌面底包，用于对照和恢复。

原有历史编译目录、实验版本、设备日志、截图录像、分析材料与重复工具已清理。

## 回编译当前 Smali 工程

需要 JDK，以及 Android SDK Build Tools 提供的 `zipalign` 和 `apksigner`。在本目录运行 PowerShell：

```powershell
New-Item -ItemType Directory -Force build | Out-Null
java -jar tooling/apktool_3.0.3.jar b src -p framework/cache -o build/launcher-unsigned.apk
zipalign -f -p 4 build/launcher-unsigned.apk build/launcher-aligned.apk
```

再使用原开发环境的签名密钥，通过 `apksigner` 签名 `build/launcher-aligned.apk`。签名密钥属于本地开发环境，本目录不包含 ZTE 官方私钥。

`src/` 中已包含当前辅助类的 Smali。后续修改 `helper-src/main/` 时，需要先结合 `helper-src/stubs/` 和 Android SDK 编译 Java，以 D8 生成 DEX，再将辅助类转换为 Smali 并同步至 `src/smali_classes2/`，之后再回编译；不能仅修改 Java 就直接打包。

## 源码检查

在项目根目录执行：

```powershell
python tools/test-launcher-entry-selection.py
python tools/check-launcher-recents-smali.py redmagic-launcher/src/smali_classes2/com/android/quickstep/views/RecentsView.smali
python tools/check-xiaomi-recents-stack.py
```

检查脚本和测试源码保留在根目录 `tools/`，新生成的编译产物放在 `build/` 并由 Git 忽略。
