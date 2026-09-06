.class public final Lcom/android/quickstep/util/LauncherRemoteAnimUtil;
.super Ljava/lang/Object;
.source "LauncherRemoteAnimUtil.java"


# static fields
.field public static final OPS_PENDING_PROGRESS:F = 0.0f

.field private static final TAG:Ljava/lang/String; = "LauncherRemoteAnimUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createParamForTaskLayerRestore(I[Lu2/s;Z)Lcom/android/quickstep/util/SurfaceTransaction;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0, p1, p2}, Lcom/android/quickstep/util/LauncherRemoteAnimUtil;->restoreTaskLayer(Lcom/android/quickstep/util/SurfaceTransaction;I[Lu2/s;Z)Lcom/android/quickstep/util/SurfaceTransaction;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static getWindowCorner(Landroid/content/Context;)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static isAppWindowAnimRunning(Lcom/android/launcher3/C2;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->isAppWindowAnimRunning()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const/16 v0, 0x100

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->hasOpenView(Lcom/android/launcher3/views/k;I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public static isDistortScale(ZZZ)Z
    .locals 0

    .line 1
    if-nez p0, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public static isShellTransitionRecentAnimRunning(Lcom/android/launcher3/C2;)Z
    .locals 0

    .line 1
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public static restoreTaskLayer(Lcom/android/quickstep/util/SurfaceTransaction;I[Lu2/s;Z)Lcom/android/quickstep/util/SurfaceTransaction;
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-static {p0, p1, p2, p3, v0}, Lcom/android/quickstep/util/LauncherRemoteAnimUtil;->restoreTaskLayer(Lcom/android/quickstep/util/SurfaceTransaction;I[Lu2/s;ZZ)Lcom/android/quickstep/util/SurfaceTransaction;

    move-result-object p0

    return-object p0
.end method

.method public static restoreTaskLayer(Lcom/android/quickstep/util/SurfaceTransaction;I[Lu2/s;ZZ)Lcom/android/quickstep/util/SurfaceTransaction;
    .locals 10

    const/4 v0, 0x1

    .line 2
    const-string v1, "transaction"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    const-string v1, "appTargets"

    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    :try_start_0
    array-length v1, p2

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_5

    aget-object v4, p2, v3

    .line 5
    iget-object v5, v4, Lu2/s;->x:Landroid/view/SurfaceControl;

    if-eqz v5, :cond_0

    .line 6
    invoke-virtual {v5}, Landroid/view/SurfaceControl;->isValid()Z

    move-result v6

    if-eqz v6, :cond_0

    move v6, v0

    goto :goto_1

    :catch_0
    move-exception p1

    goto/16 :goto_5

    :cond_0
    move v6, v2

    .line 7
    :goto_1
    iget v4, v4, Lu2/s;->m:I

    .line 8
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Restore, taskLeash.isValid = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 10
    const-string v8, ", it.mode = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    const-string v8, ", targetMode = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    const-string v8, "LauncherRemoteAnimUtil"

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v6, :cond_4

    if-eq v4, p1, :cond_1

    const/4 v6, 0x2

    if-ne v4, v6, :cond_4

    .line 15
    :cond_1
    invoke-virtual {p0, v5}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    move-result-object v4

    .line 16
    new-instance v6, Landroid/graphics/Matrix;

    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    const/4 v7, 0x0

    .line 17
    invoke-virtual {v6, v7, v7}, Landroid/graphics/Matrix;->setTranslate(FF)V

    const/high16 v7, 0x3f800000    # 1.0f

    .line 18
    invoke-virtual {v6, v7, v7}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 19
    invoke-virtual {v5}, Landroid/view/SurfaceControl;->isValid()Z

    move-result v5

    if-eqz v5, :cond_4

    const/4 v5, -0x1

    if-eqz p3, :cond_3

    .line 20
    const-class v8, Lu2/p;

    monitor-enter v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    :try_start_1
    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    move-result-object v6

    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9, v2, v2, v5, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v6, v9}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    move-result-object v5

    invoke-virtual {v5, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    if-eqz p4, :cond_2

    .line 22
    invoke-virtual {v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setShow()Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    .line 23
    :cond_2
    :goto_2
    sget-object v4, Lcom/android/quickstep/util/anim/IconSurfaceLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/IconSurfaceLockObject;

    .line 24
    monitor-exit v8

    goto :goto_4

    :goto_3
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1

    .line 25
    :cond_3
    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    move-result-object v6

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8, v2, v2, v5, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v6, v8}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    move-result-object v5

    invoke-virtual {v5, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    if-eqz p4, :cond_4

    .line 26
    invoke-virtual {v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setShow()Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_2 .. :try_end_2} :catch_0

    :cond_4
    :goto_4
    add-int/2addr v3, v0

    goto/16 :goto_0

    .line 27
    :goto_5
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_5
    return-object p0
.end method
