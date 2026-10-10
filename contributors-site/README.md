# 红魔 Duo 项目致谢网页

这是独立的静态网页，支持手机、电脑、深色与浅色模式，无需安装依赖或数据库。

正式网址：[红魔Duo贡献名单](https://redmagic-duo-contributors.pages.dev/)。Cloudflare Pages 项目：`redmagic-duo-contributors`，采用 Direct Upload，App 使用此固定网址。

## 预览与维护

直接用浏览器打开 [public/index.html](public/index.html)。首个分组为“感谢”，下面完整保留说明：“红魔Duo使用了以下开源项目的部分或全部内容，感谢这些项目的开发者提供的大力支持（排名顺序不分先后）。”`ul.projects` 只显示 **HyperCeiler、LiftArc、红魔助手** 三个项目名称，不显示项目介绍、版本或许可小字；原“贡献者”栏目及个人／团队名单已删除。捐赠列表仍在 `ul.donors` 中，现有8位名单保持原样。

项目使用 `.projects`、`.project`、`.project-link`、`.project-static` 类，沿用原页面的蓝色、卡片、字级和双列／手机单列布局；`.thanks-description` 为分组说明。App内“感谢”“捐赠列表”采用公共compactTextSize(16)、700字重及正文色，说明使用compactTextSize(12)及次要文字色，保留自然字体缩放。导航到首标题总间距8dp，左右16dp，标题到首内容16dp；链接整项至少48dp，名称用公共强调色和下划线提示可点击，按压和键盘焦点沿用公共颜色。项目正文只维护在网页中，不增加原生引用卡、弹窗或复制按钮。保留文档头部 `redmagic-duo-contributors` 标记，App 用它识别有效页面，避免把错误页当作名单。

HyperCeiler与LiftArc分别使用语义链接[ReChronoRain/HyperCeiler](https://github.com/ReChronoRain/HyperCeiler)和[miyupyxh/LiftArc](https://github.com/miyupyxh/LiftArc)，整项可点击；红魔助手保持静态名称，不编造链接。项目致谢不代替原始版权、许可和源码记录；LiftArc[来源记录](../third_party/LiftArc/README.md)、[许可原文](../third_party/LiftArc/LICENSE)及APK完整GPL资源继续保留。

三项目使用真实图标，来源、文件大小及摘要记录在[icons/sources.json](icons/sources.json)：HyperCeiler为上游README原始[icon.webp](https://raw.githubusercontent.com/ReChronoRain/HyperCeiler/main/imgs/icon.webp)；LiftArc来自原应用drawable/ic_app_icon.xml；红魔助手来自红魔助手.apk的manifest应用图标res/i5.xml。后两项忠实保留原向量路径、颜色、描边及viewport转为SVG。网页用img.project-icon，图片字节base64内联为data:image/webp或data:image/svg+xml，空alt配合aria-hidden避免重复朗读项目名；不依赖远程图片，不使用字母占位或添加色底。网站48px、App36dp固定图标槽，object-fit:contain保留原比例与颜色，不裁切原图。项目卡片继续服从App公共圆角／直角设置。更换图标时先更新来源记录，再将相同字节内联到HTML，核对解码后的摘要，不将icons目录当作App运行时资源路径。图标提取原件不提交仓库。

所有样式和图标都内联，网页不使用 JavaScript、外部字体或跟踪服务；不要引入远程资源，App 离线显示依赖此约定。独立浏览器跟随系统主题，App 中跟随应用主题。

## Cloudflare Pages 部署

### 直接上传

1. 进入 Cloudflare 控制台的 Workers & Pages，创建 Pages 应用，选择 Direct Upload（直接上传）。
2. 项目名可使用 `redmagic-duo-contributors`，实际可用性以 Cloudflare 为准。
3. 上传 `public` 文件夹，或下方脚本生成的 ZIP。ZIP 根目录应直接包含 `index.html` 和 `_headers`。
4. 部署成功后打开 Cloudflare 给出的 HTTPS 地址，确认显示完整名单。也可以绑定自有域名。

在仓库根目录重新打包：

```powershell
powershell -ExecutionPolicy Bypass -File contributors-site/package.ps1
```

输出：`out/redmagic-duo-contributors-cloudflare.zip`。这条命令只打包，不自动登录或部署。

### 后续更新

修改 `public/index.html` 后运行打包脚本，在 Cloudflare Pages 的 `redmagic-duo-contributors` 项目选择创建新部署，上传 ZIP 并部署到 Production。正式网址不变，App 下次打开时读取更新后的网页。

### Git 自动部署（新建项目时的替代方式）

Cloudflare Pages 连接当前 Git 仓库，根目录设为 `contributors-site`，构建命令设为 `exit 0`，构建输出目录设为 `public`。选择你实际维护的分支。以后提交网页修改即可触发部署。

官方说明：[静态 HTML](https://developers.cloudflare.com/pages/framework-guides/deploy-anything/)、[直接上传](https://developers.cloudflare.com/pages/get-started/direct-upload/)。直接上传项目不能直接切换成 Git 集成项目，请按维护习惯选择。

## App 接入

在 `android/app/src/main/res/values/contributors.xml` 的 `contributors_page_url` 中填入部署后的固定 HTTPS 地址，再构建并发布一次 App。推荐填网站根地址（结尾 `/`）或最终自定义域名地址，不要填临时预览地址、HTTP 地址或会发生重定向的地址。

当前已配置正式网址 `https://redmagic-duo-contributors.pages.dev/`。每次构建都直接下载正式网站的最新 HTML，生成 APK 内的离线快照；不会从本地网页源码复制，也不会因增量构建跳过下载。构建时无网络、地址失效或内容不合法都会终止构建，不会悄悄使用旧快照。即使 Gradle 使用 `--offline`（依赖离线），这个任务仍需要网络。

用户打开页面时，先显示构建时下载的网页快照，同时请求网站最新内容。有网络且加载成功就替换为最新网页；无网络或请求失败则静默显示构建时的网页快照；重新进入页面会再次尝试获取最新内容。项目致谢和捐赠名单由网页统一维护，App Java 源码中不嵌入项目条目或姓名。

远程页面必须公开可读，不要给此路径加登录或浏览器挑战。App 仅接收 HTTPS、200 状态、`text/html` 类型、带有效标记且不超过 512 KiB 的完整页面；脚本、文件／内容访问、远程子资源与WebView内部导航均关闭。仅用户在主框架点击上面两个精确HTTPS仓库地址时，使用ACTION_VIEW交手机浏览器打开；拒绝用户信息、显式端口、查询、片段、其他网址、子框架和自动／重定向请求。无法打开浏览器时显示普通提示。URL校验及Intent生成由ContributorsActivity包内可检查方法实现，不把网页正文复制到原生界面。`_headers` 设置重新验证缓存，App 同时主动请求最新内容。

## 维护检查

更新网页时核对“感谢”标题、完整说明、三个纯名称项目、两个正确链接／一个静态项及捐赠名单，再检查手机与电脑布局、深浅色、放大字体和横屏，保留有效页面标记及缓存响应头。修改接入逻辑后检查首次加载、网页刷新、断网快照、重新进入、返回行为及浏览器链接范围。网页源码、部署 ZIP 和 APK 离线快照分别维护；只修改本地网页不会更新线上内容或现有APK快照，需按上文流程另行部署和构建。生成的 ZIP 与构建快照不提交源码仓库。
