# LS_Augment 网页界面原型（test20288 基准）

用途：以留存的手机界面和操作为基础，通过控件标注讨论 UI 修改。

2026-09-23 核对：Android 源码已经是 **test20354**，本网页仍保留 **test20288** 的数据和布局。以下“当前”指本网页入口，不代表最新版手机模块。最新功能以[模块功能说明](../docs/最新版功能说明.md)为准。

最新一轮已落实10条浏览器标注：主页与设置精简，配置维护合并，18个应用配置页直接显示分组功能。简单功能为「名称＋开关」；可配置功能再加展开箭头，关闭时隐藏，开启后可手动收起并自动保存。具体记录见 `annotation-changes.md`，新分组从属关系见 `app/current-feature-groups.json`。

## 查看与运行

启动后访问 `http://localhost:3000/#home`。仓库只保存源码，不代表当前已有预览服务运行。

需要 Node.js `>=22.13.0`。在本目录执行 `npm ci`，再运行 `npm run dev -- --host 127.0.0.1 --port 3000`。沿用原 Sites/Vinext 项目；本次文档更新没有发布网站。

## 2026-09-12 当前基准

- LS_Augment `2.0.0-alpha1-test20288`；NX809J，Android 16，RedMagicOS11.5.7MR1。
- 对照当前 Android 源码、1216 × 2688 真机截图，以及导出的配置目录和帮助文案。
- 18 个应用分类、199 项应用通用配置、16 个专用编辑器入口；另含设置、26 项作用域、备份、诊断、兼容性和关于页面。
- 当前入口为 `app/current-prototype.tsx`。目录、字段和帮助基准在 `app/current-*.json`，当前页面样式为 `app/current.css`。
- 使用实际手机字体子集、模块图标、可取得的应用图标、原始支持图片；背景按当前 Android 绘制逻辑生成并核对。部分系统及导航图标使用接近的图标库图形，玻璃折射由网页样式近似。

## 可以讨论和操作的内容

主页搜索；应用分组配置；帮助弹窗；开关与独立折叠；滑杆、选项和有效输入自动保存；状态栏四分页和实时预览；步数账户绑定、计划与上限；图标名称自动保存与图片裁剪；风扇和肩键测试步骤；关于页滚动淡出及返回位置；设置页直接导入、导出与重置。

页面和控件是真实 DOM。主要控件有 `data-native-path` 与 `data-ui-label`，可把标注定位到页面、配置键或原生入口。界面状态保存在独立的 `ls-augment-current-prototype-20288` 浏览器记录中。网页备份格式版本为 2；旧版本下载接口仍兼容。

手机状态、硬件读数、检测进度及应用列表使用留存示例。网页操作只改变原型，不执行真实 Root、重启、隐藏、风扇或健康数据写入。

## 历史标注与后续修改

以前的 `app/native-pages.json`、`app/layout-overrides.ts`、重组页和 `annotation-changes.md` 历史记录完整保留。旧文件描述的是之前版本，不作为 test20288 新页面的布局来源。当前实界面优先；不把过时标注机械套入已改变的模块界面。

新标注应优先针对当前控件。调整后在 `annotation-changes.md` 继续记载页面、控件、修改内容和验证结果。确认前只调整原型。

## 验证

精简后的项目已不含 `../outputs/ui-refresh-20288/screens/`、`../outputs/prototype-current/` 和 `../out/ui-faithful/`。网页现存图标、字体及 JSON 数据可独立使用，但 `prepare-current-assets.py`、`compare-current.py`、`import-native.py` 需要先恢复或重新采集对应输入；不要在缺少输入时执行导入，以免覆盖基准数据。`refine-current*.py` 是历史阶段修改脚本，不是日常启动或更新入口。

历史验收记录见 `design-qa.md`，该文件被 Git 忽略，只在本地保留。逻辑检查：`node scripts/test-current-prototype.mjs`；旧配置兼容检查：`node scripts/test-prototype-settings.mjs`；类型检查：`npx tsc --noEmit`；构建：`npm run build`。上述命令是验证入口，不表示本轮全部执行并通过。

本轮分组覆盖及关闭恢复检查：`node scripts/test-feature-groups.mjs`。
