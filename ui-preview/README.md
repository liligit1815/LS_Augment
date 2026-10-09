# 红魔Duo 网页界面原型

当前 Android 源码为 **test20496**。网页已同步 13 个功能分类、当前导航及部分编辑界面，通用目录仍含历史 250 项源配置，并未覆盖手机端的全部当前参数。最新功能以[模块功能说明](../docs/最新版功能说明.md)为准。

## 查看与运行

需要 Node.js `>=22.13.0`。在本目录执行：

```bash
npm ci
npm run dev -- --host 127.0.0.1 --port 3000
```

访问 `http://localhost:3000/#home`。沿用既有 Sites/Vinext 项目，依赖以 `package-lock.json` 为准。源码仓库不提供正在运行的预览服务。

## 当前代码与数据

- 主入口为 `app/current-prototype.tsx`；导航和层级分别由 `current-navigation.ts`、`current-hierarchy.ts` 管理。
- 通用目录、编辑参数和帮助位于 `app/current-*.json`；这些数据含历史快照，不能按条目数量推断手机功能数量。
- 页面使用公共 `current-ui.tsx`、功能行和路径导航组件；样式见 `current.css`、`current-detail.css` 及相关编辑器样式。
- `current-device.json` 是保存的 NX809J／Android 16 设备信息，包含采集时的模块版本，浏览器不实时检测手机。
- 当前状态保存在 `redmagic-duo-primary-prototype-20260930` 浏览器记录中。备份格式版本为 2，其中 `test20288` 为历史兼容标识。
- `native-pages.json`、`layout-overrides.ts` 等历史数据保留作对照，不能覆盖已经确认的当前布局。

## 功能边界

可讨论搜索、分组导航、开关与独立折叠、输入与自动保存、状态栏排列和素材、桌面布局、游戏参数、风扇面板、健康计划、配置维护及关于页面。控件是 DOM，`data-native-path` 与 `data-ui-label` 用于定位原生入口或配置。

手机状态、硬件读数、应用名单、兼容测试和执行结果均为浏览器样例。网页只改变原型状态，不执行 Root、重启、应用隐藏、风扇或健康数据写入。视觉效果是网页近似，实际手机行为由 Android 实现决定。

界面修改遵循[红魔Duo UI规范](../docs/红魔Duo-UI规范.md)，以当前手机界面和用户明确要求为准。取材、裁图与图像对照脚本需要独立输入；截图和逐次过程记录不随源码分发。缺少输入时不要运行会覆盖基准数据的导入脚本。

## 检查入口

```bash
node scripts/test-current-prototype.mjs
node scripts/test-prototype-settings.mjs
node scripts/test-feature-groups.mjs
node scripts/test-current-hierarchy.mjs
npx tsc --noEmit
npm run build
```

检查浏览器逻辑和类型不等于手机功能运行结果。换电脑步骤见[跨设备开发说明](../docs/跨设备开发说明.md)。
