# 红魔Duo · 红魔系统增强模块

红魔Duo 是面向红魔手机的 Android 增强模块。通过独立应用配置功能，由 Root、Modern LSPosed 和原厂组件共同执行，涵盖状态栏、控制中心、游戏与肩键、风扇、桌面、应用管理和小米运动健康。

**当前源码版本：`2.0.0-alpha1-test20378`，内部版本号 `20378`。** 以 [android/version.properties](android/version.properties) 为准。源码仓库：[liligit1815/LS_Augment](https://github.com/liligit1815/LS_Augment)。最新测试版安装包和更新内容见 [GitHub Release](https://github.com/liligit1815/LS_Augment/releases/tag/v2.0.0-alpha1-test20378)。本版本为预发布测试版，不代表所有设备均已验证。

## 文档导航

| 文档 | 内容 |
|---|---|
| [最新版功能说明](docs/最新版功能说明.md) | 按实际入口说明功能、操作方式、参数和适用限制 |
| [项目结构与文件说明](docs/项目结构与文件说明.md) | 当前目录、运行关系、逐文件用途及精简后的资料缺口 |
| [配置项参考](docs/配置项参考-test20354.md) | 从当前通用配置源码提取的字段、默认值、范围和选项 |
| [网页原型说明](ui-preview/README.md) | test20288 界面讨论原型的运行方式与版本边界 |
| [跨设备开发说明](docs/跨设备开发说明.md) | 换电脑拉取、环境准备、验证结果、签名与当前开发进度 |

## 当前版本要点

- **红魔Duo 与联名定制**：统一应用名称；新增联名主题、指纹、充电动画和本机音频导入。独立“臻金 · GOLDEN SAGA”位于原厂“焰旋流光”之前，保留原厂样式及已保存选择。
- **侧滑返回**：左右两侧独立设置图标与背景，支持 GIF、动态 WebP、10%–1000% 缩放、镜像和位置调整；内置初音未来预设，自定义图片随配置备份。
- **桌面与最近任务**：重构页面管理，支持页面排序、拖动及空白页；新增爆炸声光、晶片解构清理动画，保留原厂任务保护，并修复清理黑屏与图标占位问题。
- **电源菜单**：增加四种高级重启入口，统一原厂入场动画及确认页显隐，并为各模式提供识别图标。
- **系统界面**：修正最近任务下时钟与散热图标显示、双排信号比例及音量百分比重复显示；新增通知堆叠、控制中心与 Dock 液态玻璃候选效果。
- **兼容与维护**：修正全应用肩键／连招资格并保留应用开关；新增健康使用手机入口及未成年人模式图标隐藏；扩展崩溃、清理与绘制诊断。

完整更新与验证边界见 [test20378 发布说明](docs/releases/v2.0.0-alpha1-test20378.md)。

## 功能概览

| 分类 | 主要能力 |
|---|---|
| 系统框架 | 小窗数量与应用范围、音量档数和增益、安装规则、系统行为、Wi-Fi 与热点 |
| 系统界面 | 状态栏布局、三合一与原生电池、实时温度和网速、控制中心、通知天气、锁屏与息屏时钟 |
| 系统设置 | 息屏时间、中文时段、USB 用途及调试相关原厂开关 |
| 系统桌面 | 按空间修改图标和名称、整页排序、空白页、时钟、最近任务内存信息 |
| 游戏与 AI | 全应用肩键、兼容测试后的极速连点、方案切换、连招倍率、超分与破坏神共存、AI 识别节拍 |
| 散热风扇 | 硬件档位、实测转速匹配、原厂全速模式、控制中心风扇面板 |
| 原厂应用 | 主题本地试用与下载入口、双开候选、并发下载、安装器界面、更新链接与设备信息 |
| 健康与连接 | 账户绑定后的步数倍速、随机增步和每日上限；NFC、MTP、默认桌面、截图录屏 |
| 模块维护 | 配置与自定义资源备份、导入与重置、桌面入口、兼容性检查、日志导出 |

详细入口和参数见[最新版功能说明](docs/最新版功能说明.md)。配置字段数不等于独立功能数。

## 使用条件与安装

- 最低 Android API 35（Android 15）；当前编译与目标 API 36（Android 16），原生库目标 `arm64-v8a`。
- 需要支持 **libxposed API 102** 的框架；Root 用于配置桥接、应用隐藏及部分硬件／系统操作。
- 主要保留基准是 **NX809J / RedMagicOS11.5.7MR1 / Android 16**。源码包含其他版本及 NX769J 的部分适配，不作全功能通用保证。

1. 安装签名正确的 APK，在框架中启用模块并配置所需作用域。
2. 首次进入确认使用说明，按功能需要授予 Root。
3. 在“设置 → 日志及运行诊断”查看框架和当前版本兼容性，再逐项启用。
4. 按页面提示重启应用、系统界面或设备。极速连点先完成双侧兼容测试，按目标 RPM 控制风扇前先做本机测量。


## 当前项目目录

```text
LS_Augment/
├── android/          应用、Hook、原生库、资源、设备测试与构建配置
├── docs/             当前功能说明、结构索引与配置参考
├── tools/            检查、回归、真机测试、构建辅助和签名工具
├── ui-preview/       独立网页界面原型，基准 test20288
├── .gitattributes    统一跨平台换行，防止 Shell 资源构建失败
├── .gitignore        产物、过程目录和私有材料忽略规则
├── build-module.sh   构建并检查模块 APK
├── build-source.sh   打包可分发源码
└── README.md         项目入口说明
```


## 构建与验证

需要 JDK 17+、Android SDK 36、Build Tools 35.0.0、NDK `27.2.12479018`、CMake 3.22.1+、Python 3；脚本打包还需要 Bash 和 `sha256sum`。Gradle Wrapper 固定 **8.13**，Android Gradle Plugin 为 **8.13.2**。

在项目根目录运行：

```bash
bash build-module.sh
python tools/check-project.py
bash tools/run-java-tests.sh
bash build-source.sh
```

Windows 也可直接构建：

```powershell
.\android\gradlew.bat -p android :app:assembleDebug
```

| 输出 | 位置 |
|---|---|
| Gradle 调试 APK | `android/app/build/outputs/apk/debug/app-debug.apk` |
| 本次 Release APK | `out/红魔Duo-v2.0.0-alpha1-test20378-release.apk` |
| 脚本整理调试 APK | `out/LS_Augment-v<versionName>.apk` |
| 源码包（运行 `build-source.sh` 时生成） | `out/LS_Augment-v<versionName>-source.zip` |
| 校验值 | 整理产物旁的 `.sha256` 文件 |

目录按需生成。发布安装包仅作为 GitHub Release 附件分发，不提交源码仓库；更新与验证状态见[发布说明](docs/releases/v2.0.0-alpha1-test20378.md)。`build-module.sh` 仍为调试包入口，检查 Xposed 元数据、编译后的 Manifest 和 APK 对齐；存在 `apksigner` 时追加签名验证。构建不会自动改号。

签名由 `LS_AUGMENT_KEYSTORE`、`LS_AUGMENT_STORE_PASSWORD`、`LS_AUGMENT_KEY_ALIAS`、`LS_AUGMENT_KEY_PASSWORD` 环境变量注入，Debug 与 Release 均可使用同一证书。注入后以 `:app:assembleRelease` 构建非调试包；未注入时 Debug 使用本机默认调试签名，Release 输出未签名包，**不能据此覆盖已有版本**。公开 `.pem` 证书不能代替私钥。此次 Release 已有发布证书基准为 `4e5c23c41de3d7d56f120309e9fe8dab7d53483c50ef18a176e00558abf7b8cb`。

Shell 文件需保持 UTF-8 无 BOM、LF 换行。`.gitattributes` 固定源码为 LF、Windows 批处理为 CRLF；构建会检查打包用的 Shell 资源。Windows 执行 Bash 命令时使用 Git Bash。


## 网页原型

```bash
cd ui-preview
npm ci
npm run dev -- --host 127.0.0.1 --port 3000
```

打开 `http://localhost:3000/#home`，需要 Node.js `>=22.13.0`。原型只改变浏览器样例状态，不执行手机 Root、隐藏、风扇或健康数据操作。当前基准仍是 **test20288**，不能代表 test20354 的完整功能和布局；精简后原始截图输出已不在项目，重新取材／图像对照脚本需要补充输入。

## 维护边界

- 保留源码、Wrapper、依赖锁、应用视频、公开证书及所用图片和字体，它们不是编译缓存。
- `out/`、`outputs/`、`audit-output/`、构建缓存、网页依赖、素材原件、逐次测试记录与私有签名不纳入 Git，源码包也排除过程目录和私有材料。
- 电池老化策略入口已移除，保留类用于升级清理和回归，不是当前可开启功能。
- 日志排查：开启详细诊断 → 重启相关作用域 → 复现 → 导出。模块不申请网络权限，健康同步由健康应用负责。
