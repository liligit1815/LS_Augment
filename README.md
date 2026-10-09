# 红魔Duo · 红魔系统增强模块

红魔Duo 是面向红魔手机的 Android 增强模块。通过独立应用配置功能，由 Root、Modern LSPosed 和原厂组件共同执行，涵盖状态栏、通知与控制中心、游戏与肩键、风扇、桌面、应用管理和小米运动健康。

**当前源码版本：`2.0.0-alpha1-test20497`，内部版本号 `20497`。** 以 [android/version.properties](android/version.properties) 为准。源码仓库：[liligit1815/LS_Augment](https://github.com/liligit1815/LS_Augment)。安装包和更新内容见 [test20497 GitHub Release](https://github.com/liligit1815/LS_Augment/releases/tag/v2.0.0-alpha1-test20497)。本版本为 Alpha 预发布版本。

## 文档导航

| 文档 | 内容 |
|---|---|
| [最新版功能说明](docs/最新版功能说明.md) | 当前入口、操作、参数和适用限制 |
| [项目结构与文件说明](docs/项目结构与文件说明.md) | 目录职责、运行关系与历史逐文件索引 |
| [配置项参考](docs/配置项参考-test20354.md) | test20354 通用配置字段参考；新增配置以当前源码为准 |
| [网页原型说明](ui-preview/README.md) | 当前预览运行方式、样例数据和手机功能边界 |
| [跨设备开发说明](docs/跨设备开发说明.md) | 拉取、环境准备、构建和签名 |

## 当前版本要点

- **日志与运行诊断**：区分模块和原调用链异常，按版本、进程及开机记录归因；完善息屏自动化结果确认、状态栏清单重试、连招缓存校验与连点决策记录。
- **下拉与状态栏性能**：减少通知中心、控制中心下拉时的重复扫描、测量和反射查找，稳定画面复用布局。
- **统一功能导航**：主页整理为 13 个分类，搜索显示完整路径，旧入口与已有配置保持兼容。
- **状态栏自定义**：组件排列、单双排、顺序与间距、真实状态素材和字体；桌面、锁屏、通知中心、控制中心可独立设置。旧表格输出已移除。
- **通知与控制中心**：灵动岛音乐、通知、充电活动；通知大时钟、汇总与清除按钮外观；磁贴圆角、渐变和音乐封面背景。
- **桌面、风扇与游戏**：桌面 3～12 行列；风扇固定五档、磁贴增强与息屏延续；游戏性能监测项目及背景透明度自定义。
- **系统与维护**：蓝牙电量图标、跨应用小窗、验证码剪贴板、极暗与亮度扩展；完善全部重置，修复音量百分比、电源菜单和长侧滑背景。

本次更新见 [test20497 发布说明](docs/releases/v2.0.0-alpha1-test20497.md)，此前累计更新见 [test20496 发布说明](docs/releases/v2.0.0-alpha1-test20496.md)。

## 功能概览

| 分类 | 主要能力 |
|---|---|
| 通知与控制中心 | 状态栏排列、素材与字体、三合一电池、温度与网速、灵动岛、通知外观、控制中心 |
| 桌面与最近任务 | 图标名称、页面排序、空白页、行列布局、时钟、清理动画及内存信息 |
| 主题与锁屏 | 主题下载与使用、联名主题、指纹、充电动画、锁屏与息屏显示 |
| 声音与音量 | 本机联名音频、音量档数、软件增益和面板百分比 |
| 操作与手势 | 侧滑图标与背景、高级重启、助理、单手模式和剪贴板 |
| 小窗与多任务 | 跨应用跳转、小窗数量与应用范围、触摸规则 |
| 截图与录屏 | 捕获画面的状态栏隐藏及窗口限制 |
| 游戏空间 | 肩键、极速连点、连招、超分、性能监测、AI 触发器及游戏录制 |
| 散热风扇 | 固定一至五档、本机转速测量、原厂磁贴增强及息屏延续 |
| 网络与连接 | USB、MTP、调试、NFC、Wi-Fi、热点及飞行模式 |
| 应用管理 | 安装规则、并发下载、双开、默认打开及应用隐藏 |
| 系统设置 | 系统更新、设置入口、自动息屏选项及开发者设置 |
| 小米运动健康 | 账户绑定、步数倍率、随机计划及每日上限 |

详细参数见[最新版功能说明](docs/最新版功能说明.md)。配置字段数不等于独立功能数。

## 使用条件与安装

- 最低 Android 15（API 35）；编译与目标 API 36（Android 16），原生库为 `arm64-v8a`。
- 需要支持 **libxposed API 102** 的框架；Root 用于配置桥接、应用隐藏及部分硬件／系统操作。
- 主要适配基准为 **NX809J／RedMagicOS 11.5.7MR1／Android 16**。风扇定速、测量、息屏延续和完整亮度扩展限定已适配的 NX809J；游戏性能监测适配 GameAssist 17。其他功能按本机原厂接口决定可用性。

1. 安装签名正确的 APK，在框架中启用模块并配置所需作用域。
2. 首次进入确认使用说明，按功能需要授予 Root。
3. 在“设置 → 日志及运行诊断”查看框架和当前版本兼容性，再逐项启用。
4. 按页面提示重启应用、系统界面或设备。极速连点先完成双侧兼容测试；风扇固定档位无需先测量。

## 当前项目目录

```text
LS_Augment/
├── android/          应用、Hook、原生库、资源、设备测试与构建配置
├── docs/             当前功能、结构、UI规范、配置及公开发布说明
├── tools/            检查、回归、设备测试、构建辅助和签名工具
├── ui-preview/       独立网页界面原型与浏览器样例状态
├── contributors-site/ 贡献名单静态网页源码
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
| 本次 Release APK | `out/RedMagicDuo-v2.0.0-alpha1-test20497-release.apk` |
| 脚本整理调试 APK | `out/LS_Augment-v<versionName>.apk` |
| 源码包 | `out/LS_Augment-v<versionName>-source.zip` |
| 校验值 | 整理产物旁的 `.sha256` 文件 |

目录按需生成。安装包及校验值仅通过 Release 附件分发，不提交源码仓库。`build-module.sh` 为调试包入口，检查 Xposed 元数据、编译后的 Manifest 和 APK 对齐；存在 `apksigner` 时追加签名验证。构建不会自动改号。

签名通过 `LS_AUGMENT_KEYSTORE`、`LS_AUGMENT_STORE_PASSWORD`、`LS_AUGMENT_KEY_ALIAS`、`LS_AUGMENT_KEY_PASSWORD` 环境变量或被忽略的本地配置注入。Release 构建使用 `:app:assembleRelease`，正式打包使用 `tools/build-release.py` 校验证书、版本与对齐。公开 `.pem` 不能代替私钥。当前发布证书 SHA-256 为 `4e5c23c41de3d7d56f120309e9fe8dab7d53483c50ef18a176e00558abf7b8cb`，覆盖更新需要相同证书。

Shell 文件需保持 UTF-8 无 BOM、LF 换行。`.gitattributes` 固定源码为 LF、Windows 批处理为 CRLF；构建会检查 Shell 资源。Windows 执行 Bash 命令时使用 Git Bash。

## 网页原型

```bash
cd ui-preview
npm ci
npm run dev -- --host 127.0.0.1 --port 3000
```

打开 `http://localhost:3000/#home`，需要 Node.js `>=22.13.0`。原型已同步当前 13 分类导航和部分编辑界面，配置数据仍包含历史快照。它只改变浏览器样例状态，不执行手机 Root、重启、应用隐藏、风扇或健康数据操作；当前手机功能以 Android 源码和[功能说明](docs/最新版功能说明.md)为准。

## 维护边界

- 保留源码、Wrapper、依赖锁、必要应用视频、公开证书及使用中的图片和字体。
- 构建缓存、过程文件、日志、录屏截图、素材原件、本机配置及私有签名不纳入 Git，源码包也排除这些内容。
- 电池老化策略入口已移除，保留类仅用于升级清理和回归。
- 日志排查：开启详细诊断 → 重启相关作用域 → 复现 → 导出。模块的网络权限用于获取贡献名单网页，健康同步由健康应用负责。
