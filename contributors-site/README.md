# 红魔 Duo 贡献者网页

这是独立的静态网页，支持手机、电脑、深色与浅色模式，无需安装依赖或数据库。

正式网址：[红魔Duo贡献名单](https://redmagic-duo-contributors.pages.dev/)。Cloudflare Pages 项目：`redmagic-duo-contributors`，采用 Direct Upload，App 使用此固定网址。

## 预览与维护

直接用浏览器打开 `public/index.html`。贡献者在 `ul.people` 中，捐赠者在 `ul.donors` 中，按文件里的中文注释增加、删除或修改名单。保留文档头部 `redmagic-duo-contributors` 标记，App 用它识别有效页面，避免把错误页当作名单。

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

用户打开页面时，先显示构建时下载的网页快照，同时请求网站最新内容。有网络且加载成功就替换为最新网页；无网络或请求失败则静默显示构建时的网页快照；重新进入页面会再次尝试获取最新内容。App Java 源码中不再维护任何贡献者姓名。

远程页面必须公开可读，不要给此路径加登录或浏览器挑战。App 仅接收 HTTPS、200 状态、`text/html` 类型、带有效标记且不超过 512 KiB 的完整页面；脚本、远程子资源和页面跳转均关闭。`_headers` 设置重新验证缓存，App 同时主动请求最新内容。

## 维护检查

更新网页时检查手机与电脑布局、深浅色和放大字体，保留有效页面标记及缓存响应头。修改接入逻辑后检查首次加载、名单刷新、断网快照、重新进入和返回行为。网页源码、部署 ZIP 和 APK 离线快照分别维护；生成的 ZIP 与构建快照不提交源码仓库。
