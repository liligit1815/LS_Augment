# 临时非全屏相机预览夹具

独立包 `ls.augment.privacycamerafixture`，入口 `.PrivacyCameraActivity`。本地构建运行 `tools/build-privacy-camera-fixture.py`，输出 `out/full-function-audit-20261004/privacy-camera-fixture/privacy-camera-fixture.apk` 和包含哈希、签名、权限检查记录的 `build-report.json`。构建工具不连接手机。

此页面用于区分 ROM 全屏策略与隐私圆点适配。版本 2 / `1.1-preview` 只声明 CAMERA 权限，不主动弹出权限请求，不包含网络、存储、麦克风权限或任何服务。负责设备验证的操作者先安装并仅授权 CAMERA，再启动入口。

页面使用普通系统主题，保留状态栏及导航栏。通过 camera2 向页面内可见的 SurfaceView 提交 `TEMPLATE_PREVIEW` 重复预览请求，优先使用相机声明支持的 640×480 输出，否则选择其最小可用预览尺寸。该 SurfaceView 是唯一输出；不创建 ImageReader、编码器、MediaRecorder 或静态照片请求，不读回、保存或发送帧。页面有等待授权、等待预览窗口、正在打开、已打开、预览请求已提交、错误和已关闭状态，方便与实际画面、AppOps、SystemUI 原生指示器分别核对。**预览请求已提交不等于 ROM 指示器已通过验证**，是否有 AppOps running 和真实原生圆点仍须分别观察。

点击“结束验证”立即停止重复请求、关闭会话和句柄，并显示“已关闭”，按钮变为“退出”。120 秒超时、onPause、onDestroy、Surface 销毁或相机错误/断开同样关闭；迟到的异步打开/会话回调会直接关闭。离开前台后本次页面不会自行重开相机，需结束页面后重新启动一轮。该夹具不修改红魔Duo配置或主模块 manifest，验证结束应卸载。

版本 1 仅打开句柄。父任务实测 `privacy-dot-20452-041950` 页面显示已打开，但 CAMERA AppOps 没有 running，也没有有效圆点/PDS1；未将现有绿色电池图标计为圆点。AOSP 的 `notifyCameraOpening` 可以只检查权限，`startCameraStreamingOps` 在流开始后启动 AppOps/data-delivery。这与观察一致，但本地没有读取设备 native camera service 的执行状态，不能把源码推断当作该 ROM 的直接证明。[AOSP CameraService](https://android.googlesource.com/platform/frameworks/av/+/main/services/camera/libcameraservice/CameraService.cpp)

版本 2 由父任务明确授权改为短暂真实预览。使用单 SurfaceView 与重复预览请求符合 Android camera2 预览流程。[Android 官方会话与请求文档](https://developer.android.com/media/camera/camera2/capture-sessions-requests?hl=en)

本地验证仅包括 Java 编译、DEX 打包、签名、对齐和 APK manifest 静态核验。新预览版尚未由本任务在手机执行，不声明相机生命周期、系统非全屏状态或原生圆点显示已经通过实机验证。构建后 APK 版本 2 的 SHA-256 为 `829dd9552672e3bea4d120637c6e78572b4d17bed068664018c04390b7e41269`；实际安装前应以 `build-report.json` 及文件哈希再次核对。
