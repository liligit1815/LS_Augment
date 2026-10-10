# LiftArc来源记录

上游项目：[miyupyxh/LiftArc](https://github.com/miyupyxh/LiftArc)。

- 移植基线：1.0.22。
- 提交：`13245bbdc1c5431b14d8016512463f8d336c6306`。
- 上游声明许可：GPL-3.0，原始文本保存在同目录 `LICENSE`，手机安装包内保存在 `assets/licenses/liftarc-GPL-3.0.txt`。
- 本项目用途：红魔Duo的锁屏上滑交互、弧形绘制、背景模糊与静态壁纸玻璃材质。

管理界面使用红魔Duo原有Android原生公共组件。Compose和Miuix管理界面未复制，也未新增为Duo依赖。

复制并改造的代码位于 `android/app/src/main/java/ls/augment/com/hook/`：

| LiftArc源文件 | 红魔Duo文件 |
|---|---|
| LockBarController | LiftArcController.java |
| LockHandleView | LiftArcHandleView.java |
| LockRimView | LiftArcRimView.java |
| LockGlassStrip（含AGSL与AGSL_BASIC） | LiftArcGlassStrip.java |
| LockGlass | LiftArcGeometry.java |
| WallCoverView | LiftArcWallCoverView.java |

上表源文件的共同目录为 `app/src/main/java/com/lockbar/app/xposed/`，文件扩展名均为 `.java`；目标文件共同目录为 `android/app/src/main/java/ls/augment/com/hook/`。

修改包括包名和类名、39项Duo配置桥、红魔SystemUI入口与原厂安全验证转交、关闭时撤销本功能持有的视图修改、静态壁纸异步加载、运行状态和当前进程异常暂停。LiftArcConfig、LiftArcLog、LiftArcRuntime、LiftArcUnlock、LiftArcHooks是本项目的接入代码，不复制上游独立配置Provider或管理界面。

上游README声明AndroidLiquidGlass（Kyant0，Apache-2.0）为实现参考、HyperBetter（酷安1030764）为动画参考；Controller和几何源码注释还引用HyperBetter ShadePullGlass。本项目保留这些上游参考声明、复制源码中的来源注释和完整GPL许可文本；它们不构成Duo新增运行依赖。上表记录本版实际移植文件及改动范围。
