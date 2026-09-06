.class public Lcom/android/quickstep/util/BaseDepthController;
.super Ljava/lang/Object;
.source "BaseDepthController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;
    }
.end annotation


# static fields
.field protected static final BLUR_DISABLED:Z

.field private static final DEBUG:Z = true

.field public static final DEPTH:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/util/BaseDepthController;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEPTH_0_PERCENT:F = 0.0f

.field public static final DEPTH_60_PERCENT:F = 0.6f

.field public static final DEPTH_70_PERCENT:F = 0.7f

.field private static final DEPTH_INDEX_COUNT:I = 0x2

.field private static final DEPTH_INDEX_STATE_TRANSITION:I = 0x0

.field private static final DEPTH_INDEX_WIDGET:I = 0x1

.field public static final DEPTH_WITHOUT_ZOOM:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/util/BaseDepthController;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "BaseDepthController"


# instance fields
.field protected mBaseSurface:Landroid/view/SurfaceControl;

.field protected mBaseSurfaceOverride:Landroid/view/SurfaceControl;

.field protected mBlueEnableCallBack:Ljava/lang/Boolean;

.field public mBlur:Z

.field private mBlurSurface:Landroid/view/SurfaceControl;

.field protected mBlurValue:I

.field protected mCrossWindowBlursEnabled:Z

.field protected mCurrentBlur:I

.field protected mDepth:F

.field private mHasContentBehindLauncher:Z

.field protected mInEarlyWakeUp:Z

.field protected final mLauncher:Lcom/android/launcher3/C2;

.field protected final mMaxBlurRadius:I

.field protected mPauseBlurs:Z

.field protected mWaitingOnSurfaceValidity:Z

.field protected final mWallpaperManager:Landroid/app/WallpaperManager;

.field protected mZoom:Z

.field public final stateDepth:Lcom/android/launcher3/util/v1$c;

.field public final widgetDepth:Lcom/android/launcher3/util/v1$c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/BaseDepthController$1;

    .line 2
    .line 3
    const-string v1, "depth"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/BaseDepthController$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/util/BaseDepthController;->DEPTH:Landroid/util/FloatProperty;

    .line 9
    .line 10
    invoke-static {}, Lx1/O;->N1()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lx1/O;->C2()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lx1/O;->m1()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-static {}, Lx1/O;->l2()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 38
    :goto_1
    sput-boolean v0, Lcom/android/quickstep/util/BaseDepthController;->BLUR_DISABLED:Z

    .line 39
    .line 40
    new-instance v0, Lcom/android/quickstep/util/BaseDepthController$2;

    .line 41
    .line 42
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/BaseDepthController$2;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sput-object v0, Lcom/android/quickstep/util/BaseDepthController;->DEPTH_WITHOUT_ZOOM:Landroid/util/FloatProperty;

    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurSurface:Landroid/view/SurfaceControl;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlur:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mZoom:Z

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlueEnableCallBack:Ljava/lang/Boolean;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/y0;->b()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const v2, 0x7f0706ce

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mMaxBlurRadius:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const v2, 0x7f0c00b6

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mMaxBlurRadius:I

    .line 48
    .line 49
    :goto_0
    const-class v0, Landroid/app/WallpaperManager;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Landroid/app/WallpaperManager;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 58
    .line 59
    new-instance p1, Lcom/android/launcher3/util/v1;

    .line 60
    .line 61
    sget-object v0, Lcom/android/quickstep/util/BaseDepthController;->DEPTH:Landroid/util/FloatProperty;

    .line 62
    .line 63
    new-instance v2, Lcom/android/launcher3/taskbar/P;

    .line 64
    .line 65
    invoke-direct {v2}, Lcom/android/launcher3/taskbar/P;-><init>()V

    .line 66
    .line 67
    .line 68
    const/4 v3, 0x2

    .line 69
    invoke-direct {p1, p0, v0, v3, v2}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    .line 70
    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iput-object v2, p0, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 78
    .line 79
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->widgetDepth:Lcom/android/launcher3/util/v1$c;

    .line 84
    .line 85
    invoke-static {}, Lcom/android/launcher3/y0;->J()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_1

    .line 90
    .line 91
    new-instance p1, Landroid/view/SurfaceControl$Builder;

    .line 92
    .line 93
    invoke-direct {p1}, Landroid/view/SurfaceControl$Builder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v1, "Overview Blur"

    .line 97
    .line 98
    invoke-virtual {p1, v1}, Landroid/view/SurfaceControl$Builder;->setName(Ljava/lang/String;)Landroid/view/SurfaceControl$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1, v0}, Landroid/view/SurfaceControl$Builder;->setHidden(Z)Landroid/view/SurfaceControl$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Builder;->build()Landroid/view/SurfaceControl;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurSurface:Landroid/view/SurfaceControl;

    .line 111
    .line 112
    :cond_1
    return-void
.end method

.method private static mapDepthToBlur(F)F
    .locals 1

    .line 1
    const/high16 v0, 0x40400000    # 3.0f

    .line 2
    .line 3
    mul-float/2addr p0, v0

    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-static {p0, v0}, Ljava/lang/Math;->min(FF)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method


# virtual methods
.method protected applyDepthAndBlur()V
    .locals 1

    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0, v0, v0}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlur(ZZZ)V

    return-void
.end method

.method protected applyDepthAndBlur(ZZZ)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 2
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_1

    if-nez p1, :cond_1

    .line 3
    iget-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mZoom:Z

    if-eqz p1, :cond_1

    sget-boolean p1, Lcom/android/quickstep/util/BaseDepthController;->BLUR_DISABLED:Z

    if-nez p1, :cond_1

    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    sub-float p1, v2, v0

    .line 5
    invoke-static {}, Lx1/O;->k5()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    invoke-static {v3}, Lx1/O;->v0(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez p3, :cond_0

    const/high16 p3, 0x3f000000    # 0.5f

    mul-float/2addr p1, p3

    .line 6
    :cond_0
    iget-object p3, p0, Lcom/android/quickstep/util/BaseDepthController;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p3, v1, p1}, Landroid/app/WallpaperManager;->setWallpaperZoomOut(Landroid/os/IBinder;F)V

    .line 7
    :cond_1
    invoke-static {}, Lcom/android/systemui/shared/system/BlurUtils;->supportsBlursOnWindows()Z

    move-result p1

    if-nez p1, :cond_2

    goto/16 :goto_6

    .line 8
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    const-string p3, "BaseDepthController"

    const/4 v1, 0x0

    if-nez p1, :cond_3

    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "mSurface is null and mCurrentBlur is: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    iput v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurValue:I

    return-void

    .line 11
    :cond_3
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->isValid()Z

    move-result p1

    const/4 v3, 0x1

    if-nez p1, :cond_4

    .line 12
    const-string p1, "mSurface is not valid"

    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    iput v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurValue:I

    .line 14
    iput-boolean v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mWaitingOnSurfaceValidity:Z

    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->onInvalidSurface()V

    return-void

    .line 16
    :cond_4
    iget-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlur:Z

    if-eqz p1, :cond_f

    invoke-static {}, Lx1/O;->c0()Z

    move-result p1

    if-eqz p1, :cond_f

    sget-boolean p1, Lcom/android/quickstep/util/BaseDepthController;->BLUR_DISABLED:Z

    if-eqz p1, :cond_5

    goto/16 :goto_6

    .line 17
    :cond_5
    iput-boolean v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mWaitingOnSurfaceValidity:Z

    .line 18
    iget-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/views/ScrimView;->isFullyOpaque()Z

    move-result p1

    .line 19
    iget-boolean v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mHasContentBehindLauncher:Z

    if-nez v4, :cond_6

    if-eqz p1, :cond_6

    iget-boolean v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mPauseBlurs:Z

    if-nez v4, :cond_6

    move v4, v3

    goto :goto_0

    :cond_6
    move v4, v1

    .line 20
    :goto_0
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 21
    iget-boolean v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mCrossWindowBlursEnabled:Z

    if-eqz v5, :cond_8

    if-nez p1, :cond_8

    iget-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mPauseBlurs:Z

    if-eqz p1, :cond_7

    goto :goto_1

    .line 22
    :cond_7
    iget p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mMaxBlurRadius:I

    int-to-float p1, p1

    mul-float/2addr p1, v0

    float-to-int p1, p1

    goto :goto_2

    :cond_8
    :goto_1
    move p1, v1

    :goto_2
    iput p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    .line 23
    new-instance p1, Landroid/view/SurfaceControl$Transaction;

    invoke-direct {p1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 24
    invoke-static {}, Lcom/android/launcher3/y0;->J()Z

    move-result v5

    if-eqz v5, :cond_a

    iget-object v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurSurface:Landroid/view/SurfaceControl;

    if-eqz v5, :cond_a

    .line 25
    iget v6, p0, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    invoke-virtual {p1, v5, v6}, Landroid/view/SurfaceControl$Transaction;->setBackgroundBlurRadius(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    move-result-object v5

    iget-object v6, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurSurface:Landroid/view/SurfaceControl;

    iget-object v7, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 26
    invoke-virtual {v5, v6, v7}, Landroid/view/SurfaceControl$Transaction;->reparent(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 27
    iget-object v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurfaceOverride:Landroid/view/SurfaceControl;

    const/4 v6, -0x1

    if-eqz v5, :cond_9

    invoke-virtual {v5}, Landroid/view/SurfaceControl;->isValid()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 28
    iget-object v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurSurface:Landroid/view/SurfaceControl;

    iget-object v7, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurfaceOverride:Landroid/view/SurfaceControl;

    invoke-virtual {p1, v5, v7, v6}, Landroid/view/SurfaceControl$Transaction;->setRelativeLayer(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    goto :goto_3

    .line 29
    :cond_9
    iget-object v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurSurface:Landroid/view/SurfaceControl;

    iget-object v7, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    invoke-virtual {p1, v5, v7, v6}, Landroid/view/SurfaceControl$Transaction;->setRelativeLayer(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    goto :goto_3

    .line 30
    :cond_a
    iget-object v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    iget v6, p0, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    invoke-virtual {p1, v5, v6}, Landroid/view/SurfaceControl$Transaction;->setBackgroundBlurRadius(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 31
    :goto_3
    iget-object v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    invoke-virtual {p1, v5, v4}, Landroid/view/SurfaceControl$Transaction;->setOpaque(Landroid/view/SurfaceControl;Z)Landroid/view/SurfaceControl$Transaction;

    .line 32
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "dispatchTransactionSurface: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mCrossWindowBlursEnabled:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, " , "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, p0, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mZoom:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, ", call back blur enable: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlueEnableCallBack:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    iget v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    iput v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurValue:I

    const/4 v4, 0x0

    cmpl-float v4, v0, v4

    if-lez v4, :cond_b

    cmpg-float v0, v0, v2

    if-gez v0, :cond_b

    move v0, v3

    goto :goto_4

    :cond_b
    move v0, v1

    :goto_4
    if-eqz v0, :cond_c

    .line 34
    iget-boolean v2, p0, Lcom/android/quickstep/util/BaseDepthController;->mInEarlyWakeUp:Z

    if-nez v2, :cond_c

    .line 35
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->setEarlyWakeupStart()Landroid/view/SurfaceControl$Transaction;

    .line 36
    iput-boolean v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mInEarlyWakeUp:Z

    goto :goto_5

    :cond_c
    if-nez v0, :cond_d

    .line 37
    iget-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mInEarlyWakeUp:Z

    if-eqz v0, :cond_d

    .line 38
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->setEarlyWakeupEnd()Landroid/view/SurfaceControl$Transaction;

    .line 39
    iput-boolean v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mInEarlyWakeUp:Z

    .line 40
    :cond_d
    :goto_5
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getRootSurfaceControl()Landroid/view/AttachedSurfaceControl;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 42
    invoke-interface {v0, p1}, Landroid/view/AttachedSurfaceControl;->applyTransactionOnDraw(Landroid/view/SurfaceControl$Transaction;)Z

    :cond_e
    if-eqz p2, :cond_f

    .line 43
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "dispatchTransactionSurface blurForMiBoardAfterUnlockPhone mCurrentBlur="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    :cond_f
    :goto_6
    return-void
.end method

.method protected applyDepthAndBlurWithEnsureDependencies(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0, p1}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlur(ZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public getBlurValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurValue:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxBlurRadius()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mMaxBlurRadius:I

    .line 2
    .line 3
    return p0
.end method

.method public getWallPaperManager()Landroid/app/WallpaperManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onInvalidSurface()V
    .locals 0

    .line 1
    return-void
.end method

.method public pauseBlursOnWindows(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mPauseBlurs:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mPauseBlurs:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlur()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public resetWallpaperScale(F)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float p1, p1, v0

    .line 3
    .line 4
    if-lez p1, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    invoke-static {}, Lx1/O;->k5()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const v0, 0x3f8a3d71    # 1.08f

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-static {p1}, Lx1/O;->v0(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const p1, 0x3f947ae1    # 1.16f

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 29
    .line 30
    move v9, v0

    .line 31
    move v0, p1

    .line 32
    move p1, v9

    .line 33
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    new-instance v8, Landroid/os/Bundle;

    .line 46
    .line 47
    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v1, "animation_type"

    .line 51
    .line 52
    const-string v2, "scale"

    .line 53
    .line 54
    invoke-virtual {v8, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const-string v1, "targetZoom"

    .line 58
    .line 59
    invoke-virtual {v8, v1, v0}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 60
    .line 61
    .line 62
    const-string v1, "action"

    .line 63
    .line 64
    const-string v2, "move_animation"

    .line 65
    .line 66
    invoke-virtual {v8, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v1, "scale_from_x"

    .line 70
    .line 71
    invoke-virtual {v8, v1, p1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 72
    .line 73
    .line 74
    const-string p1, "scale_to_x"

    .line 75
    .line 76
    invoke-virtual {v8, p1, v0}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Lcom/android/quickstep/util/BaseDepthController;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 80
    .line 81
    const/4 v6, 0x0

    .line 82
    const/4 v7, 0x0

    .line 83
    const-string v4, "zte.wallpaper.animation"

    .line 84
    .line 85
    const/4 v5, 0x0

    .line 86
    invoke-virtual/range {v2 .. v8}, Landroid/app/WallpaperManager;->sendWallpaperCommand(Landroid/os/IBinder;Ljava/lang/String;IIILandroid/os/Bundle;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    :goto_1
    return-void
.end method

.method protected setBaseSurface(Landroid/view/SurfaceControl;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mWaitingOnSurfaceValidity:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, "setSurface:\n\tmWaitingOnSurfaceValidity: "

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mWaitingOnSurfaceValidity:Z

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, "\n\tmBaseSurface: "

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v0, "BaseDepthController"

    .line 43
    .line 44
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlurWithEnsureDependencies(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public setBaseSurfaceOverride(Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurfaceOverride:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlur()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBlur(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlur:Z

    .line 2
    .line 3
    return-void
.end method

.method protected setCrossWindowBlursEnabled(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mCrossWindowBlursEnabled:Z

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlueEnableCallBack:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlur()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 19
    .line 20
    invoke-static {p0, p1}, Lcom/android/launcher3/blur/f;->k(Lcom/android/launcher3/C2;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public setDepth(F)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0, v0}, Lcom/android/quickstep/util/BaseDepthController;->setDepth(FZZ)V

    return-void
.end method

.method protected setDepth(FZZ)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 2
    invoke-static {p1, v1, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    move-result p1

    const/high16 v0, 0x43800000    # 256.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    int-to-float p1, p1

    div-float/2addr p1, v0

    .line 3
    iget v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    invoke-static {v0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    move-result v0

    if-nez v0, :cond_1

    .line 4
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurValue:I

    if-nez v0, :cond_1

    :cond_0
    return-void

    .line 5
    :cond_1
    iput p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p2, p3, p1}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlur(ZZZ)V

    return-void
.end method

.method public setHasContentBehindLauncher(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mHasContentBehindLauncher:Z

    .line 2
    .line 3
    return-void
.end method

.method public setWallpaperBlur(I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->g0:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move v0, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v0, v1

    .line 24
    :goto_0
    sget-boolean v3, Lcom/android/quickstep/util/BaseDepthController;->BLUR_DISABLED:Z

    .line 25
    .line 26
    if-nez v3, :cond_6

    .line 27
    .line 28
    invoke-static {}, Lx1/O;->c0()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_6

    .line 33
    .line 34
    iget-boolean v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mCrossWindowBlursEnabled:Z

    .line 35
    .line 36
    if-eqz v3, :cond_6

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    goto/16 :goto_1

    .line 43
    .line 44
    :cond_1
    invoke-static {}, Lcom/android/systemui/shared/system/BlurUtils;->supportsBlursOnWindows()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 51
    .line 52
    if-eqz v3, :cond_6

    .line 53
    .line 54
    invoke-virtual {v3}, Landroid/view/SurfaceControl;->isValid()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_2

    .line 59
    .line 60
    goto/16 :goto_1

    .line 61
    .line 62
    :cond_2
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    const/4 v4, 0x0

    .line 67
    const-string v5, "BaseDepthController"

    .line 68
    .line 69
    if-eqz v3, :cond_3

    .line 70
    .line 71
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->k()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_3

    .line 76
    .line 77
    iget-object v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 78
    .line 79
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->p(Lcom/android/launcher3/C2;)F

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    new-instance v6, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v7, "setWallpaperBlur aiFutureScreenBlurPro="

    .line 89
    .line 90
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v7, " old blur="

    .line 97
    .line 98
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v7, " getState="

    .line 105
    .line 106
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v7, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 110
    .line 111
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    invoke-virtual {v7}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    cmpl-float v6, v3, v4

    .line 130
    .line 131
    if-ltz v6, :cond_3

    .line 132
    .line 133
    const/high16 v6, 0x3f800000    # 1.0f

    .line 134
    .line 135
    cmpg-float v6, v3, v6

    .line 136
    .line 137
    if-gtz v6, :cond_3

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->getMaxBlurRadius()I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    int-to-float p1, p1

    .line 144
    mul-float/2addr v3, p1

    .line 145
    float-to-int p1, v3

    .line 146
    :cond_3
    iput p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurValue:I

    .line 147
    .line 148
    new-instance v3, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    const-string v6, "setWallpaperBlur: "

    .line 154
    .line 155
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v6, " ,supportsBlur: "

    .line 162
    .line 163
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    if-eqz v0, :cond_5

    .line 177
    .line 178
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Lcom/android/launcher3/views/ScrimView;->isFullyOpaque()Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    iget-boolean v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mHasContentBehindLauncher:Z

    .line 189
    .line 190
    if-nez v3, :cond_4

    .line 191
    .line 192
    if-eqz v0, :cond_4

    .line 193
    .line 194
    move v1, v2

    .line 195
    :cond_4
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 196
    .line 197
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 198
    .line 199
    .line 200
    iget-object v2, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 201
    .line 202
    invoke-virtual {v0, v2, p1}, Landroid/view/SurfaceControl$Transaction;->setBackgroundBlurRadius(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iget-object v2, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 207
    .line 208
    invoke-virtual {v0, v2, v1}, Landroid/view/SurfaceControl$Transaction;->setOpaque(Landroid/view/SurfaceControl;Z)Landroid/view/SurfaceControl$Transaction;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 213
    .line 214
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getRootSurfaceControl()Landroid/view/AttachedSurfaceControl;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    if-eqz v1, :cond_5

    .line 223
    .line 224
    invoke-interface {v1, v0}, Landroid/view/AttachedSurfaceControl;->applyTransactionOnDraw(Landroid/view/SurfaceControl$Transaction;)Z

    .line 225
    .line 226
    .line 227
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 228
    .line 229
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 230
    .line 231
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-eqz v0, :cond_6

    .line 236
    .line 237
    if-nez p1, :cond_6

    .line 238
    .line 239
    iput v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 240
    .line 241
    :cond_6
    :goto_1
    return-void
.end method

.method public setZoom(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mZoom:Z

    .line 2
    .line 3
    return-void
.end method

.method public startWallpaperAnimation(FFI)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    new-instance v7, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, "animation_type"

    .line 19
    .line 20
    const-string v1, "scale"

    .line 21
    .line 22
    invoke-virtual {v7, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string v0, "targetZoom"

    .line 26
    .line 27
    invoke-virtual {v7, v0, p2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 28
    .line 29
    .line 30
    const-string v0, "scale_from_x"

    .line 31
    .line 32
    invoke-virtual {v7, v0, p1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 33
    .line 34
    .line 35
    const-string p1, "scale_to_x"

    .line 36
    .line 37
    invoke-virtual {v7, p1, p2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 38
    .line 39
    .line 40
    const-string p1, "duration"

    .line 41
    .line 42
    invoke-virtual {v7, p1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    const-string p1, "interpolator"

    .line 46
    .line 47
    const-string p2, "path_interpolator"

    .line 48
    .line 49
    invoke-virtual {v7, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 53
    .line 54
    const/4 v5, 0x0

    .line 55
    const/4 v6, 0x0

    .line 56
    const-string v3, "zte.wallpaper.animation"

    .line 57
    .line 58
    const/4 v4, 0x0

    .line 59
    invoke-virtual/range {v1 .. v7}, Landroid/app/WallpaperManager;->sendWallpaperCommand(Landroid/os/IBinder;Ljava/lang/String;IIILandroid/os/Bundle;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method
