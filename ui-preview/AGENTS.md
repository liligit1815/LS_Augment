# LS_Augment 界面原型

用户要求：必须按真实模块界面还原，作为双方明确界面布局修改的 UI 原型。

2026-09-06 最新范围：本轮仅做网页原型；用户确认布局后再修改手机模块。已落实的标注及新增需求见 `annotation-changes.md`。新增结构遵循现有真机字体和视觉样式。

- 以当前手机截图、Android 页面源码和 `app/native-pages.json` 中的实测控件为依据，不凭印象简化，不套用新的设计风格。
- 页面文字、字体、图标、位置、尺寸、卡片结构、分页、滚动边界和展开状态均属于还原范围。
- `native-pages.json` 是实测基准。用户标注引起的布局变化优先记录在 `app/layout-overrides.ts`；不要重新导入基准而覆盖已经确认的修改。
- 页面上的 `data-native-path` 和 `data-ui-label` 用于把用户标注对应到真实控件。
- 网页是独立原型。网页中的开关、输入和应用操作不得调用手机或执行实际 Root、隐藏、重启、健康数据等操作。
- 保留已有 Sites/Vinext 项目结构。不要重新初始化、创建第二个 Site 或更改访问范围。
- 修改后比较同页面、同状态、同尺度的真机与网页截图；浏览器截图要按嵌入的 ICC 色彩描述转换为 sRGB 后再比较颜色。
- 本地原型交付时保留服务和右侧浏览器页面，后续直接在该原型上迭代。


## 2026-09-12 当前底稿

当前入口 `app/current-prototype.tsx` 对照 test20288。`current-catalog.json`、`current-editor-data.json`、`current-editor-help.json` 和 `current-scope.json` 来自现有 Android 源码；基准截图在 `../outputs/ui-refresh-20288/screens/`。`native-pages.json` 和 `layout-overrides.ts` 继续保存旧版本及历史标注，不得覆盖。新标注先修改当前页面，并追加记录。

画面对照使用带 ICC 的 PNG 截图；JPEG 预览会丢失色彩描述，不可直接拿来调整颜色。浏览器对照视口为1000×883，手机374.15×827.08 CSS像素；设备截图为1216×2688。当前截图在 `../outputs/prototype-current/`，`scripts/compare-current.py` 先转换 sRGB，再同尺度裁剪。
