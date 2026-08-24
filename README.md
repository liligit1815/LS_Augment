# LS_Augment

LS_Augment 是面向红魔 11S Pro、Android 16、RedMagicOS 11.5 的 Root + LSPosed 系统增强工具。项目采用单 APK 架构，不再依赖旧版 KernelSU 模块或 WebUI。

## 当前版本与进度

- 开发版本：`2.0.0-alpha1-test20121`（versionCode `20121`）
- 正式包名：`ls.augment.com`
- LSPosed API：Modern libxposed API 102
- 架构：`arm64-v8a`
- 版本唯一来源：`android/version.properties`，构建过程不会自动修改版本号

截至 2026-08-24，项目已通过：

- 完整 Debug APK 构建，包括 Java 与 C++ 原生库。
- Modern Xposed 入口、API版本和静态作用域检查。
- 二进制 AndroidManifest、快速设置磁贴权限和 APK 4字节对齐检查。
- 最近任务、状态栏、隐藏入口、配置匹配和一键连招等纯 Java 回归测试。

当前仍是 Alpha 测试版本。基础功能和配置界面已接入，新增的肩键高速连点、AI触发器极速响应和小窗增强仍需在目标 ROM 上继续进行实际游戏与长期稳定性验证。

## 支持环境

| 项目 | 当前配置 |
|---|---|
| 目标设备 | 红魔 11S Pro |
| 目标系统 | Android 16 / RedMagicOS 11.5 |
| 最低 Android版本 | Android 9（API 28） |
| 编译/目标 SDK | API 36 |
| CPU架构 | arm64-v8a |
| Java | 17 |
| NDK | 27.2.12479018 |
| LSPosed | 支持 Modern libxposed API 102 的实现 |

其他机型、系统版本或 OTA 后的红魔组件结构可能不同。所有依赖厂商类、方法或原生库版本的功能都采用失败关闭策略：未找到已验证目标时保留系统原始行为，并在诊断页记录状态。

## 功能

### 应用隐藏与自动化

- 按“用户ID + 包名”精确管理隐藏目标，避免主空间与分身空间互相影响。
- 支持多用户/分身空间、批量隐藏、恢复和受保护组件拦截。
- 可在锁屏后自动执行隐藏操作。
- 提供快速设置磁贴、Root状态检查、有限日志、诊断导出和紧急恢复。
- 桌面入口可以隐藏；重新进入隐藏管理页需要连续点击版本号7次。

### 最近任务

- 仿 iOS 横向重叠卡片，只改变视觉布局，不接管原生分页、fling 或 snap。
- 保留点击进入、上滑关闭、锁定、菜单和红魔原生多窗口操作。
- 后层展开比例和前两张卡片重叠比例可配置，并可恢复推荐参数。
- 底部可显示唯一一条整机 `可用内存 / 总内存` 数据，字号和卡片间距可调。

已知问题：横向堆叠在部分操作中仍有少量卡顿，原因尚未完全定位；对流畅度敏感时可关闭该功能。

### 游戏增强

- **全应用肩键**：自动适配主空间中已安装、已启用的第三方 App；系统组件、LS_Augment 和 Root/LSPosed 管理器不会被放行。
- **肩键极速连点**：左、右肩键支持 10～50次/秒，默认20次/秒；40～50次/秒可能被个别游戏丢弃。
- **AI触发器极速响应**：可调整模板扫描、点击队列、策略冷却和 YOLO 扫描间隔；保留原厂识别阈值，并对同一画面进行模板复核。
- **辅助线**：解除原厂应用资格限制，实际开关状态仍由红魔组件管理。
- **一键连招速度**：保留原始录制，支持 1～10倍整数倍率，并缓存对应的加速动作文件。
- **性能模式超分**：放行红魔原生超分 Tile 的性能模式资格，不修改温控、GPU服务或厂商数据库。
- **超分与破坏神共存**：阻止两种模式自动互斥，保留用户主动关闭能力。

肩键极速连点的原生 Hook 只适用于已经验证的 `/system/lib64/libinputreader.so`。当前验证 SHA-256 为：

```text
203e202857b42e9b043466a8ddf793a5972278c3f1af71f244be790322a17d1a
```

原生库哈希不匹配或不可读取时不会安装内联 Hook，红魔原生输入行为保持不变。

### 小窗增强

- 可解除红魔自由窗口的创建、最小化和数量限制。
- 可强制普通第三方应用进入自由窗口。
- 系统关键界面保留保护名单，不强制修改。
- 总开关关闭时完整保留系统和红魔原生小窗策略。

部分原本不支持多窗口的应用可能出现画面裁切、比例异常或触控错位。首次安装或更新模块代码后需重启手机；普通配置保存后约1秒重新读取。

### 状态栏

- 左/右双排、时钟跨双排、状态栏高度和四向边距。
- 双行时钟，两行格式可独立配置。
- 支持字体、字号、字重、字间距、行距、对齐方式和固定宽度。
- 时钟格式支持普通日期时间、中文时段以及扩展的农历/节气显示标记。
- CPU/GPU/电池温度、电流、电压、功率和通知图标数量可配置。
- 组件组和动态发现的单个图标可自由定位、缩放或隐藏。
- 提供布局调试覆盖层以及越界、碰撞、动态占位风险反馈。
- 适配 Android 16 `calculateIconXTranslations()`，同时保留旧方法兼容。

状态栏配置保存后会直接反馈，通常无需重启 SystemUI；首次安装或模块代码更新后仍需重启一次 SystemUI。

### 应用增强

- 扩展红魔双开候选列表，自动加入主空间中已安装、已启用的第三方 App。
- 可选移除低内存限制；克隆空间仍由红魔 DoubleApp Framework 管理。
- 无限期试用只处理原厂明确试用资源的本地到期流程。
- 不修改登录、账号、付费资源价格、购买入口、支付结果或服务器权益。

## 安装与使用

1. 安装 APK：`adb install LS_Augment-v<版本号>.apk`。
2. 打开 LS_Augment，按需授予 Root权限；拒绝后应用不会反复弹窗，可在诊断页主动重新授权。
3. 在 LSPosed 中启用模块并确认静态作用域。
4. 首次安装或更新模块代码后重启手机，或按功能页提示重启对应作用域。
5. 后续修改状态栏参数通常实时生效；游戏、桌面、应用增强和小窗功能按页面提示重启对应作用域。

`ls.augment.com` 是全新包，不继承旧 `io.github.lsf.augment` 配置。

## 本地构建

需要准备：

- JDK 17或更高版本
- Gradle
- Android SDK 36与 Build Tools
- Android NDK 27.2.12479018
- CMake与 Ninja
- Python 3
- Bash环境

执行：

```bash
./build-module.sh
```

脚本会构建单一 APK，并依次检查 Modern Xposed 元数据、二进制 Manifest、APK对齐和可用的签名信息。输出位置为：

```text
out/LS_Augment-v<versionName>.apk
```

生成源码压缩包：

```bash
./build-source.sh
```

## LSPosed 静态作用域

- `com.android.settings`
- `com.android.systemui`
- `com.zte.beautify`
- `com.zte.beautifyadapter`
- `com.zte.cn.doubleapp`
- `com.zte.mifavor.launcher`
- `com.zte.recommend`
- `com.zte.game.plugintrigger`
- `cn.nubia.gamelauncher`
- `cn.nubia.gameassist`
- `cn.nubia.gamelab`
- `cn.nubia.gamehelperline`
- `cn.nubia.gamehelpmodule`
- `system`
- `android`

## 安全与隐私边界

- 应用未申请 `android.permission.INTERNET`，不包含云端统计或用户行为上传。
- Root操作限制在经过校验的包名和用户ID范围内，并保护关键系统组件。
- 原生肩键功能在目标库哈希不匹配时失败关闭。
- 主题试用功能不修改支付流程或服务器权益。
- 所有增强功能默认关闭；关闭对应总开关后保留系统原始行为。
