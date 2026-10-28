# 红魔Duo · 红魔系统增强模块

红魔Duo 是面向红魔手机的 Android 增强模块。通过独立应用配置功能，由 Root、Modern LSPosed 和原厂组件共同执行，涵盖状态栏、通知与控制中心、游戏与肩键、风扇、桌面、应用管理和小米运动健康。

**当前源码版本：`2.0.0-alpha1-test20678`，内部版本号 `20678`。** 以 [android/version.properties](android/version.properties) 为准。当前能力与限制见[最新版功能说明](docs/最新版功能说明.md)，数据归属与迁移规则见[模块私有存储](docs/模块私有存储.md)。[本版更新说明](docs/releases/v2.0.0-alpha1-test20678.md)记录用户可见的更新内容。

当前在线版本为 test20678：[下载 APK](https://github.com/liligit1815/lispacerelease/releases/download/redmagic-duo-v20678/redmagic-duo-20678.apk)，[版本页面](https://github.com/liligit1815/lispacerelease/releases/tag/redmagic-duo-v20678)。源码仓库 [liligit1815/LS_Augment](https://github.com/liligit1815/LS_Augment) 维护源码、必要资源与当前文档；安装包及在线更新清单由 `lispacerelease` 分发。

后续推送版本以[红魔 Duo 专属更新清单](https://raw.githubusercontent.com/liligit1815/lispacerelease/main/updates/redmagic-duo.json)为准。更新仓库同时分发多个软件，不能使用仓库级 `releases/latest` 作为红魔 Duo 下载入口；下载 `.apk` 附件，GitHub 自动生成的 Source code ZIP/TAR 不能安装。

## 文档导航

| 文档 | 内容 |
|---|---|
| [最新版功能说明](docs/最新版功能说明.md) | 当前入口、操作、参数和适用限制 |
| [模块私有存储](docs/模块私有存储.md) | 模块数据归属、跨进程访问、旧数据迁移与原生状态边界 |
| [项目结构与文件说明](docs/项目结构与文件说明.md) | 当前目录职责、运行关系与维护入口 |
| [配置定义](android/app/src/main/java/ls/augment/com/ConfigSchema.java)、[锁屏上滑配置](android/app/src/main/java/ls/augment/com/LiftArcOptions.java) | 当前配置字段、默认值与取值范围 |
| [网页原型说明](ui-preview/README.md) | 当前预览运行方式、样例数据和手机功能边界 |
| [跨设备开发说明](docs/跨设备开发说明.md) | 拉取、环境准备、构建和签名 |
| [发布与在线更新](docs/发布与在线更新.md) | 清单字段、当前 JSON 示例、发布流程及手机更新操作 |

## 当前源码版本要点

- 重构状态栏自定义，四组配置共用预览，支持独立图标排序与筛选、简洁单排与常规双排预设，以及一键恢复原厂样式。
- 新增最近任务隐私屏。
- 完善通知堆叠，分组中的子通知独立显示，改善底部卡片滚动与点击响应。
- 新增省电模式保持当前帧率，电池健康度检测统一收纳到“系统设置 → 电池”。
- 新增相册水印机型文字自定义。
- 自定义性能监测支持项目间距调节；修复肩键方案切换与极速连点同时开启时的误报。
- 修复控制中心亮度、音量控件的深色显示，完善完整亮度的本机标定及红魔Step、最近任务等功能的接口兼容。

更新后请重启手机，使系统服务与桌面相关改动生效。

## 功能概览

| 分类 | 主要能力 |
|---|---|
| 通知与控制中心 | 状态栏排列、素材与字体、三合一电池、温度与网速、灵动岛、通知外观、控制中心 |
| 桌面与最近任务 | 图标名称、页面排序、空白页、行列布局、时钟、任务卡片圆角、隐私屏、清理动画及内存信息 |
| 主题与锁屏 | 主题下载与使用、联名主题、指纹、充电动画、锁屏上滑效果、锁屏与息屏显示 |
| 声音与音量 | 本机联名音频、音量档数、软件增益和面板百分比 |
| 操作与手势 | 侧滑图标与背景、高级重启、助理、单手模式和剪贴板 |
| 小窗与多任务 | 跨应用跳转、小窗数量与应用范围、触摸规则 |
| 红魔Step | 全局手势、原生桌面、主区与侧窗、音乐卡和应用栏、主侧交换及任务恢复；需手机 Root、系统框架和系统桌面作用域 |
| 相册与编辑 | 相册水印文字、捕获画面的状态栏隐藏、窗口限制、截图与相册编辑裁剪解限 |
| 游戏空间 | 肩键、极速连点、连招、超分、性能监测、AI 触发器及游戏录制 |
| 散热风扇 | 固定一至五档、本机转速测量、原厂磁贴增强及息屏延续 |
| 网络与连接 | USB、MTP、调试、NFC、Wi-Fi、热点及飞行模式 |
| 应用管理 | 安装规则、并发下载、双开、默认打开及应用隐藏 |
| 系统设置 | 电池健康度检测、省电模式刷新率、系统更新、设置入口、自动息屏选项及开发者设置 |
| 小米运动健康 | 账户绑定、步数倍率、随机计划及每日上限 |

详细参数见[最新版功能说明](docs/最新版功能说明.md)。配置字段数不等于独立功能数。

## 使用条件与安装

- 最低 Android 15（API 35）；编译与目标 API 36（Android 16），原生库为 `arm64-v8a`。
- 需要支持 **libxposed API 102** 的框架；Root 用于配置桥接、应用隐藏及部分硬件／系统操作。
- 主要适配基准为 **NX809J／RedMagicOS 11.5.7MR1／Android 16**。风扇定速、测量和息屏延续限定已适配的 NX809J；完整亮度按实际 Root 与屏幕驱动接口判断，不再按机型名称限制。游戏性能监测按 GameAssist 16／17 的完整接口适配。具体功能按本机原厂接口决定可用性。

1. 安装签名正确的 APK，在框架中启用模块并配置所需作用域。
2. 首次进入确认使用说明，按功能需要授予 Root。
3. 在“设置 → 日志及运行诊断”查看框架和当前版本兼容性，再逐项启用。
4. 按页面提示重启应用、系统界面或设备。极速连点先完成双侧兼容测试；风扇固定档位无需先测量。

## 当前项目目录

```text
LS_Augment/
├── android/          应用、Hook、原生库、资源、设备测试与构建配置
├── docs/             当前功能、结构、UI规范、开发及公开发布说明
├── tools/            检查、回归、设备测试、构建辅助和签名工具
├── ui-preview/       独立网页界面原型与浏览器样例状态
├── contributors-site/ 贡献名单静态网页源码
├── third_party/      引用项目的来源与许可记录
├── .gitattributes    跨平台换行规则
├── .gitignore        产物、过程目录和私有材料忽略规则
├── build-module.sh   构建并检查模块 APK
├── build-source.sh   打包可分发源码
└── README.md         项目入口说明
```

## 构建与验证

需要 JDK 17+、Android SDK 36、Build Tools 35.0.0、NDK `27.2.12479018`、CMake 3.22.1+、Python 3；脚本打包还需要 Bash 和 `sha256sum`。Gradle Wrapper 固定 **8.13**，Android Gradle Plugin 为 **8.13.2**。构建会从已配置的 HTTPS 贡献名单网页取得离线快照，需要联网。

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
| 当前版本本地 Release APK | `out/RedMagicDuo-v<versionName>-release.apk` |
| 脚本整理调试 APK | `out/LS_Augment-v<versionName>.apk` |
| 源码包 | `out/LS_Augment-v<versionName>-source.zip` |
| 校验值 | 整理产物旁的 `.sha256` 文件 |


目录按需生成。安装包及校验值通过 [lispacerelease 的 Release 附件](https://github.com/liligit1815/lispacerelease/releases/tag/redmagic-duo-v20678)分发，不提交源码仓库；本地源码压缩包仅作为打包输出。`build-module.sh` 为调试包入口，检查 Xposed 元数据、编译后的 Manifest 和 APK 对齐；存在 `apksigner` 时追加签名验证。构建不会自动改号。

签名通过 `LS_AUGMENT_KEYSTORE`、`LS_AUGMENT_STORE_PASSWORD`、`LS_AUGMENT_KEY_ALIAS`、`LS_AUGMENT_KEY_PASSWORD` 环境变量或被忽略的本地配置注入。Release 构建使用 `:app:assembleRelease`，正式打包使用 `tools/build-release.py` 校验证书、版本与对齐。公开 `.pem` 不能代替私钥。当前发布证书 SHA-256 为 `4e5c23c41de3d7d56f120309e9fe8dab7d53483c50ef18a176e00558abf7b8cb`，覆盖更新需要相同证书。

Shell 文件需保持 UTF-8 无 BOM、LF 换行。`.gitattributes` 固定源码为 LF、Windows 批处理为 CRLF；构建会检查 Shell 资源。Windows 执行 Bash 命令时使用 Git Bash。

## 发布新版并推送在线更新

红魔 Duo 使用公共更新仓库 [liligit1815/lispacerelease](https://github.com/liligit1815/lispacerelease)，软件标识为 `redmagic-duo`，包名为 `ls.augment.com`。客户端固定读取 [updates/redmagic-duo.json](https://raw.githubusercontent.com/liligit1815/lispacerelease/main/updates/redmagic-duo.json)。发布 APK 时必须同时推进这份清单；仓库级 Latest 标记不参与客户端版本判断。

1. 递增 `android/version.properties`，使用现有发行私钥构建 Release，并完成对应功能检查。已发布版本号不得换包。
2. 将本版要点写入 `docs/releases/` 的 UTF-8 文件，与版本和安装包保持一致。源码仓库只维护当前版本说明，历史版本保留在 Git 历史和 GitHub Release。
3. 同步更新仓库的 `main`，使用其 `tools/publish.py` 运行 `--dry-run`，核对 APK、签名、说明及目标版本。
4. 执行正式发布。工具先上传并校验公开 APK，再更新红魔 Duo 专属清单，保持其他软件的清单不变。
5. 重新读取公网清单和安装包，核对客户端解析、大小、摘要与签名，再同步源码仓库的在线版本和下载链接。

完整命令、协议和核验步骤见[发布与在线更新](docs/发布与在线更新.md)。本地[清单示例](docs/examples/redmagic-duo.json)说明当前清单字段，发布工具根据实际 APK 生成新版清单。

在线更新由手机端检查、下载、校验并交给系统安装器完成，无需电脑配合。客户端仅在远端内部版本号更高且系统兼容时提示升级，下载后核对摘要、包名、版本与发行签名。20518 之前的版本需先手动安装具有在线更新能力的版本。当前只有一个更新通道，正式发布的 alpha / test 版本同样会推送。

## 网页原型

```bash
cd ui-preview
npm ci
npm run dev -- --host 127.0.0.1 --port 3000
```

打开 `http://localhost:3000/#home`，需要 Node.js `>=22.13.0`。原型保留此前 13 分类导航和部分编辑界面，尚未加入手机端新增的“红魔Step”，配置数据仍包含历史快照。它只改变浏览器样例状态，不执行手机 Root、重启、应用隐藏、风扇或健康数据操作；当前手机功能以 Android 源码和[功能说明](docs/最新版功能说明.md)为准。

## 维护边界

- 保留源码、Wrapper、依赖锁、必要应用视频、公开证书及使用中的图片和字体。
- 构建缓存、过程文件、日志、录屏截图、素材原件、本机配置及私有签名不纳入 Git，源码包也排除这些内容。
- 电池老化策略入口已移除，保留类仅用于升级清理和回归。
- 日志排查：开启详细诊断 → 重启相关作用域 → 复现 → 导出。模块的网络权限用于获取贡献名单网页、检查更新及在确认后下载 GitHub Release 安装包，健康同步由健康应用负责。
