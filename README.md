# LS_Augment

LS_Augment 是面向红魔 11S Pro / Android 16 / RedMagicOS 11.5 的Root + LSPosed 增强工具。

当前开发版本：`2.0.0-alpha1-test20035`（versionCode `20035`）<br>
正式包名：`ls.augment.com`<br>
LSPosed API：Modern libxposed API 102

## 当前进度

- 已完成全部核心功能开发。
- 已知问题：最近任务横向堆叠仍存在少许卡顿，原因暂未定位；介意的话可先关闭该功能。

## 功能

### 最近任务

- 仿iOS横向重叠
- 保留点击进入、上滑关闭及红魔原生多窗口、锁定和菜单按钮。
- 底部新增`可用内存 / 总内存` 显示；比例、字号和间距可配置。
- 当前仍存在少许卡顿，介意可先关闭（见“当前进度”）。

### 游戏增强

- 肩键全应用：自动解锁加入游戏空间的 App肩键使用资格。
- 辅助线：解除原厂资格限制。
- 一键连招：解锁一键连招支持，支持 1–10 倍连招加速。
- 超境与破坏神共存：允许同时开启超境与破坏神模式，支持任意模式使用超境。

### 状态栏

- 左/右双排、时钟跨双排、状态栏高度和四向边距。
- 双行时钟：两行可分别配置日期格式，并可调整字体、字号、字重、字间距、行距、对齐和宽度。
- 网速、CPU/GPU/电池温度、电流、功率和通知图标数量；实时数据可独立定位。
- 组件组和本机动态发现的单个图标均可在整个状态栏内自由定位，中间区域不被硬性锁定。
- 配置保存后约一秒生效，无需重启 SystemUI；实际宽高、越界、碰撞和动态占位风险会实时反馈。
- 适配 Android 16 `calculateIconXTranslations()`，保留旧方法兼容。

### 应用增强

- 扩展双开保留红魔原生候选，并自动加入主空间中已安装、已启用的第三方 App；系统 App、停用 App 和受保护组件不会加入。
- 可选移除低内存限制；克隆空间仍由红魔 DoubleApp Framework 管理。
- 无限期试用覆盖外屏壁纸及主题、字体、动态壁纸，不修改付费流程。
- 登录、账号和付费专属资源价格、购买入口、支付结果与服务器权益保持原厂流程。

## 安装与使用

1. 安装 APK：`adb install LS_Augment-v2.0.0-alpha1-test20035.apk`。
2. 打开 LS_Augment，按需授予 Root；若拒绝，应用不会反复请求，可在诊断页主动重新授权。
3. 在 LSPosed 中启用模块并确认静态作用域，重启手机后生效。
4. 后续修改参数：保存后需重启对应作用域（功能详情页提供“重启作用域”按钮），直接重启手机也可以；状态栏参数为实时生效。

`ls.augment.com` 是全新包，不继承旧 `io.github.lsf.augment` 配置。

## LSPosed 静态作用域

- `com.android.settings`
- `com.android.systemui`
- `com.zte.mifavor.launcher`
- `com.zte.cn.doubleapp`
- `com.zte.beautify`
- `com.zte.beautifyadapter`
- `cn.nubia.gamelauncher`
- `cn.nubia.gameassist`
- `cn.nubia.gamehelpmodule`
- `cn.nubia.gamehelperline`
