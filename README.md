# 红魔Duo · 红魔系统增强模块

红魔Duo 是面向红魔手机的 Android 增强模块。通过独立应用配置功能，由 Root、Modern LSPosed 和原厂组件共同执行，涵盖状态栏、通知与控制中心、游戏与肩键、风扇、桌面、应用管理和小米运动健康。

**当前版本：`2.0.0-alpha1-test20518`，内部版本号 `20518`。** 以 [android/version.properties](android/version.properties) 为准。本版新增 GitHub 在线更新：前台自动检查在 24 小时内最多一次，“关于”可主动检查、查看说明、确认下载并通过系统安装器更新；无新版或自动检查失败时保持静默。继承 test20517 对通知区域拖动中整列通知反复展开、折回堆叠的修复；单卡展开、侧滑和清空继续保留原厂动画保护。继承 test20516 的状态栏裁剪修复。[下载当前 APK（20518）](https://github.com/liligit1815/lispacerelease/releases/download/redmagic-duo-v20518/redmagic-duo-20518.apk)，[查看对应 Release](https://github.com/liligit1815/lispacerelease/releases/tag/redmagic-duo-v20518)。源码仓库：[liligit1815/LS_Augment](https://github.com/liligit1815/LS_Augment)，仅维护源码、必要资源与公开文档；APK 及更新清单统一在 `lispacerelease` 分发。

后续推送版本以[红魔 Duo 专属更新清单](https://raw.githubusercontent.com/liligit1815/lispacerelease/main/updates/redmagic-duo.json)为准。更新仓库同时分发多个软件，不能使用仓库级 `releases/latest` 作为红魔 Duo 下载入口；下载 `.apk` 附件，GitHub 自动生成的 Source code ZIP/TAR 不能安装。

## 文档导航

| 文档 | 内容 |
|---|---|
| [最新版功能说明](docs/最新版功能说明.md) | 当前入口、操作、参数和适用限制 |
| [项目结构与文件说明](docs/项目结构与文件说明.md) | 当前目录职责、运行关系与维护入口 |
| [配置定义](android/app/src/main/java/ls/augment/com/ConfigSchema.java)、[锁屏上滑配置](android/app/src/main/java/ls/augment/com/LiftArcOptions.java) | 当前配置字段、默认值与取值范围 |
| [网页原型说明](ui-preview/README.md) | 当前预览运行方式、样例数据和手机功能边界 |
| [跨设备开发说明](docs/跨设备开发说明.md) | 拉取、环境准备、构建和签名 |
| [发布与在线更新验收](docs/发布与在线更新.md) | 清单字段、真实 JSON 示例、发布后联网核验及真机验收 |

## 当前版本要点

- **稳定拖动中的通知堆叠**：整个面板或快捷开关展开变化时，按当轮原厂位置持续计算堆叠，避免整列通知反复展开、收起；通知正常滚动及单卡交互保留。已通过真实 Hook 离线回归，连续拖动的真机画面待复测。
- **处理应用切换中的状态栏裁剪**：原厂只更新裁剪矩形、轮廓或父容器裁剪开关时，也在绘制前重新检查并释放影响自定义排列的裁剪；稳定帧继续复用。通知图标仍遵循原厂隐藏规则，诊断补充通知区域祖先及子图标状态，便于区分系统隐藏与裁剪。
- **修复通知卡片抖动**：在原厂通知更新计算前刷新已有头部布局和顶部间距，避免旧位置先画出一帧；只抑制模块拥有的顶部间距重复动画，保留原厂通知新增、移除、展开及原生头部模式的动画。
- **修复本次日志问题**：锁屏指示条检查原厂画笔颜色，保留有效主题色；配置桥等系统服务、用户解锁和模块配置提供者就绪后接入，持续不可用及真实权限错误继续报告。健康后台准确区分停止、等待连接、已连接和关闭状态；日志导出补充空来源备用采集、实际覆盖时间、截断及事件丢弃原因。
- **稳定通知间距**：通知列表按当前日期区域和已设置的通知间距定位，防止下拉结束后的原厂间距更新再次推开通知；关闭相关格式及大时钟后恢复原厂间距。
- **同步状态栏实际高度**：高度调整同时更新状态栏窗口及系统提供给应用的顶部空间，覆盖横竖屏与恢复默认；通话提示跟随状态栏尺寸。
- **按系统能力适配极暗**：移除 NX809J 型号限定，同步原生极暗开关与强度，并核验系统实际颜色变换；缺少执行能力或反馈时显示具体原因，保留关闭入口。更新后需重启手机。
- **修复横屏控制中心错位**：“下拉面板时钟显示秒”和“下拉面板时钟显示中文时段”在普通横屏面板中保留原厂时间、日期、流量、操作按钮及头部高度，只更新时钟文字；横屏切换和关闭功能时恢复原厂时段显示。
- **锁屏上滑效果**：在“主页 → 主题与锁屏”新增入口，整合 LiftArc 的指示条、触感反馈、内容联动、回弹、快速上甩、弧形、静态壁纸模糊、玻璃材质和提示文字；解锁继续遵循系统安全规则。
- **统一配置与维护**：39 项锁屏配置纳入现有导入、导出和全局重置；运行日志纳入现有查看、复制、清空、分享及统一导出，无额外日志开关。顶部复用“重启作用域”弹窗，保留“状态栏（SystemUI）”名称。
- **精简数值编辑**：锁屏页的 22 项数值使用滑动条及实时数值，移除重复输入框和本页恢复默认值按钮，保留文字、颜色与选项编辑，沿用公共 `UiKit` 样式。
- **更新网页感谢**：“关于 → 贡献名单”继续使用网页，展示 HyperCeiler、LiftArc、红魔助手及原始项目图标；前两个项目可点击打开 GitHub。新增“感谢”说明，加大加粗“感谢”“捐赠列表”标题，移除原贡献者栏目、名单及项目描述。
- **在线更新与离线显示**：贡献名单先显示构建时取得的正式网页，再自动请求最新内容；三个图标内联，离线也能显示。

完整更新与安装方式见[本版说明](docs/releases/v2.0.0-alpha1-test20518.md)。

## 功能概览

| 分类 | 主要能力 |
|---|---|
| 通知与控制中心 | 状态栏排列、素材与字体、三合一电池、温度与网速、灵动岛、通知外观、控制中心 |
| 桌面与最近任务 | 图标名称、页面排序、空白页、行列布局、时钟、清理动画及内存信息 |
| 主题与锁屏 | 主题下载与使用、联名主题、指纹、充电动画、锁屏上滑效果、锁屏与息屏显示 |
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
- 主要适配基准为 **NX809J／RedMagicOS 11.5.7MR1／Android 16**。风扇定速、测量、息屏延续和完整亮度扩展限定已适配的 NX809J；游戏性能监测适配 GameAssist 16／17 的两套完整接口，16.0.001.2512261709 已完成 APK 契约与离线运行回归，真机效果待验证。其他功能按本机原厂接口决定可用性。

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
| 当前本地 Release APK | `out/RedMagicDuo-v2.0.0-alpha1-test20518-release.apk` |
| 脚本整理调试 APK | `out/LS_Augment-v<versionName>.apk` |
| 源码包 | `out/LS_Augment-v<versionName>-source.zip` |
| 校验值 | 整理产物旁的 `.sha256` 文件 |

目录按需生成。安装包及校验值仅通过 [lispacerelease 的 Release 附件](https://github.com/liligit1815/lispacerelease/releases/tag/redmagic-duo-v20518)分发，不提交源码仓库；源码仓库不保留 Release 附件，本地源码压缩包仅作为打包输出。`build-module.sh` 为调试包入口，检查 Xposed 元数据、编译后的 Manifest 和 APK 对齐；存在 `apksigner` 时追加签名验证。构建不会自动改号。

签名通过 `LS_AUGMENT_KEYSTORE`、`LS_AUGMENT_STORE_PASSWORD`、`LS_AUGMENT_KEY_ALIAS`、`LS_AUGMENT_KEY_PASSWORD` 环境变量或被忽略的本地配置注入。Release 构建使用 `:app:assembleRelease`，正式打包使用 `tools/build-release.py` 校验证书、版本与对齐。公开 `.pem` 不能代替私钥。当前发布证书 SHA-256 为 `4e5c23c41de3d7d56f120309e9fe8dab7d53483c50ef18a176e00558abf7b8cb`，覆盖更新需要相同证书。

Shell 文件需保持 UTF-8 无 BOM、LF 换行。`.gitattributes` 固定源码为 LF、Windows 批处理为 CRLF；构建会检查 Shell 资源。Windows 执行 Bash 命令时使用 Git Bash。

## 发布新版并推送在线更新

红魔 Duo 使用公共更新仓库 [liligit1815/lispacerelease](https://github.com/liligit1815/lispacerelease)，软件标识为 `redmagic-duo`，包名为 `ls.augment.com`。客户端固定读取 [updates/redmagic-duo.json](https://raw.githubusercontent.com/liligit1815/lispacerelease/main/updates/redmagic-duo.json)。以后发布 APK 时必须使用更新仓库的发布工具推进这份清单；只在源码仓库上传 Release、修改显示版本名或标记 GitHub “Latest”，不会向现有客户端推送更新。继续保留当前更新实现和清单地址即可，无需每次重新接入。

1. **修改版本并构建同签名 Release。** 查看 `android/version.properties`、上一版安装包和远端清单。按本项目构建规则将 `versionCode` 比上一版增加 1，并同步 `versionName` 的 `-test<versionCode>` 后缀；新包内部版本号还必须高于线上清单。只改显示版本名不会触发更新。沿用现有发行私钥及签名配置，不能使用 Debug 签名或另换证书。以下以已发布的 `20518` 为上一版、下一版为 `20519` 举例，之后替换为实际相邻版本：

   ```powershell
   Set-Location 'E:\LS_Augment'
   $releasePython = 'C:\Users\P53\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
   $env:JAVA_HOME = 'C:\Program Files\Android\openjdk\jdk-21.0.8'
   & $releasePython tools/build-release.py --previous 'E:\LS_Augment\out\RedMagicDuo-v2.0.0-alpha1-test20518-release.apk'
   if ($LASTEXITCODE -ne 0) { throw 'Release 构建或验证失败，停止发布' }
   ```

   构建前需已按前文配置 SDK、依赖和签名；本工具给 Gradle 传入 `--offline`，首次开发环境需先联网缓存依赖，贡献名单网页快照仍需联网获取。工具检查版本递增、历史签名和对齐，输出 `out/RedMagicDuo-v<versionName>-release.apk`、校验值及验证记录。以输出的已签名 APK 发布，不使用 `app-debug.apk`；同时完成本次改动对应的回归检查。

2. **准备更新说明和发布环境。** 将本次变化、适用范围及必要操作写入 UTF-8 文件，例如 `docs/releases/v2.0.0-alpha1-test20519.md`，该内容会显示在软件更新弹窗中。发布工具需要 Python 3.11+、Android SDK build-tools 和 JDK；示例使用本机现有解释器，换电脑时调整 `$releasePython`。确认 `E:\lispacerelease` 已存在、位于 `main` 分支，并使用有此仓库 Contents 写权限的 GitHub 身份；工具支持已登录的 Git Credential Manager / GitHub CLI 或 `GH_TOKEN` / `GITHUB_TOKEN`。清单通过 API 直接提交到 `main`，发布身份必须满足分支保护与规则集要求，工具不会创建 PR。令牌、签名私钥和密码不写入 README、Git 或更新清单。

3. **同步清单并预检查。** 以下 PowerShell 示例使用本机现有路径；换电脑时调整路径，新版本发布时替换 APK 与说明文件名。`--dry-run` 只在本地核对 APK 和同步后的清单、显示发布计划，不访问或修改 GitHub：

   ```powershell
   Set-Location 'E:\lispacerelease'
   git pull --ff-only
   if ($LASTEXITCODE -ne 0) { throw '更新仓库同步失败，停止预检查' }
   $releasePython = 'C:\Users\P53\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
   $releaseApk = 'E:\LS_Augment\out\RedMagicDuo-v2.0.0-alpha1-test20519-release.apk'
   $releaseNotes = 'E:\LS_Augment\docs\releases\v2.0.0-alpha1-test20519.md'
   $releasePublishArgs = @(
       'tools/publish.py', '--app', 'redmagic-duo',
       '--apk', $releaseApk, '--notes-file', $releaseNotes,
       '--sdk', 'E:\LS_Augment\audit-output\android-sdk',
       '--java-home', 'C:\Program Files\Android\openjdk\jdk-21.0.8'
   )
   & $releasePython @releasePublishArgs --dry-run
   if ($LASTEXITCODE -ne 0) { throw '发布预检查失败，停止发布' }
   ```

4. **确认计划后正式发布。** 在同一 PowerShell 窗口中运行下面的命令。真实发布会重新读取线上版本，先上传并公开已校验的 APK，再更新红魔 Duo 清单；不会改变另外两个软件的推送版本。

   ```powershell
   & $releasePython @releasePublishArgs
   if ($LASTEXITCODE -ne 0) { throw '发布未确认成功，请先核对公网清单和附件' }
   git pull --ff-only
   if ($LASTEXITCODE -ne 0) { throw '发布后本地清单同步失败' }
   & $releasePython tools/validate.py
   if ($LASTEXITCODE -ne 0) { throw '本地清单验证失败' }
   ```

   标签和附件名自动生成为 `redmagic-duo-v<versionCode>`、`redmagic-duo-<versionCode>.apk`。包名、实际版本、最低系统版本、签名、大小和 SHA-256 均由工具生成，不手填清单，不覆盖旧附件。若中断或报错，核对结果后用同一 APK、同一更新说明和命令重试；工具会复用已核验附件，附件未完整公开前不会推进清单。重试时改动说明可能使清单与既有 Release 正文不同。同版本号不能换包，修正已推送 APK 应增加内部版本号。发布记录保存在更新仓库忽略的 `out/published/`，远端清单更新后需再次拉取才能同步本地文件。

5. **核对推送并验证客户端。** 按[发布后联网核验](docs/发布与在线更新.md#发布后联网核验)重新下载公网清单，用客户端实际解析器检查格式，再匿名下载清单指向的 APK，核对大小、SHA-256、包名、版本、最低系统版本和发行签名。`tools/validate.py` 只检查本地更新仓库，不能代替这些联网检查。在安装了较低版本且已具有在线更新功能的手机上，通过“关于 → 检查更新”验证说明、下载、权限授权及系统覆盖安装；验收步骤及已验证边界见[真机验收](docs/发布与在线更新.md#真机验收)。`20518` 之前的旧版需先手动安装具备在线更新功能的版本。每个软件目前只有一个通道，使用真实发布命令就表示将该版本推送给用户，`alpha` / `test` 版本也会被推送。

更新工具的完整说明和协议见[更新仓库 README](https://github.com/liligit1815/lispacerelease#发布新版)及[更新协议](https://github.com/liligit1815/lispacerelease/blob/main/docs/update-protocol.md)。

清单示例见 [docs/examples/redmagic-duo.json](docs/examples/redmagic-duo.json)，这是 `20518` 的已发布快照，仅用于理解字段和解析验证。下一版的实际清单必须由发布工具生成。客户端在远端 `versionCode` 更高且系统兼容时提示升级，下载后核对 APK 摘要、清单中的发行证书指纹及当前应用签名，兼容后才允许安装；JSON 清单本身没有数字签名。已安装 `20518` 再检查当前清单应显示“已是最新版本”。发布者使用的电脑工具只用于构建、发布和验收，手机检查、下载与安装更新无需电脑配合。

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
- 日志排查：开启详细诊断 → 重启相关作用域 → 复现 → 导出。模块的网络权限用于获取贡献名单网页、检查更新及在确认后下载 GitHub Release 安装包，健康同步由健康应用负责。
