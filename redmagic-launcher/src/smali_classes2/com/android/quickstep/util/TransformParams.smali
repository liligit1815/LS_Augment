.class public Lcom/android/quickstep/util/TransformParams;
.super Ljava/lang/Object;
.source "TransformParams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/TransformParams$BuilderProxy;
    }
.end annotation


# static fields
.field public static final NO_NEED_WINDOW_BLUR_RADIUS:I = -0x1

.field public static PROGRESS:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/util/TransformParams;",
            ">;"
        }
    .end annotation
.end field

.field public static TARGET_ALPHA:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/util/TransformParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBaseBuilderProxy:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

.field private mCornerRadius:F

.field private mCornerRadiusIsOverridden:Z

.field private mCurrentProgress:F

.field private mCurrentScrollOffset:F

.field private mHomeBuilderProxy:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

.field private mParams:Lcom/android/quickstep/util/SurfaceTransaction;

.field private mProgress:F

.field private mSurfaceTransactionSupplier:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Lcom/android/quickstep/util/SurfaceTransaction;",
            ">;"
        }
    .end annotation
.end field

.field private mSyncTransactionApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field private mTargetAlpha:F

.field private mTargetSet:Lcom/android/quickstep/RemoteAnimationTargets;

.field private mTransitionInfo:Landroid/window/TransitionInfo;

.field private mWindowBlurRadius:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/TransformParams$1;

    .line 2
    .line 3
    const-string v1, "progress"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/TransformParams$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/util/TransformParams;->PROGRESS:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/util/TransformParams$2;

    .line 11
    .line 12
    const-string v1, "targetAlpha"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/TransformParams$2;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/quickstep/util/TransformParams;->TARGET_ALPHA:Landroid/util/FloatProperty;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/B1;

    invoke-direct {v0}, Lcom/android/quickstep/util/B1;-><init>()V

    invoke-direct {p0, v0}, Lcom/android/quickstep/util/TransformParams;-><init>(Ljava/util/function/Supplier;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/function/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Supplier<",
            "Lcom/android/quickstep/util/SurfaceTransaction;",
            ">;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    sget-object v0, Lcom/android/quickstep/util/TransformParams$BuilderProxy;->ALWAYS_VISIBLE:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

    iput-object v0, p0, Lcom/android/quickstep/util/TransformParams;->mHomeBuilderProxy:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

    .line 4
    iput-object v0, p0, Lcom/android/quickstep/util/TransformParams;->mBaseBuilderProxy:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/quickstep/util/TransformParams;->mWindowBlurRadius:I

    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/android/quickstep/util/TransformParams;->mProgress:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    iput v0, p0, Lcom/android/quickstep/util/TransformParams;->mTargetAlpha:F

    const/high16 v0, -0x40800000    # -1.0f

    .line 8
    iput v0, p0, Lcom/android/quickstep/util/TransformParams;->mCornerRadius:F

    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/TransformParams;->mSurfaceTransactionSupplier:Ljava/util/function/Supplier;

    return-void
.end method

.method private getChangeLeashForApp(Landroid/view/RemoteAnimationTarget;)Landroid/view/SurfaceControl;
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TransformParams;->mTransitionInfo:Landroid/window/TransitionInfo;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Landroid/window/TransitionInfo$Change;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    invoke-virtual {v1}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget v2, v2, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 39
    .line 40
    iget v3, p1, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 41
    .line 42
    if-ne v2, v3, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_3
    return-object v0
.end method

.method private overrideFreeformChangeLeashCornerRadiusToZero(Landroid/view/RemoteAnimationTarget;Landroid/view/SurfaceControl$Transaction;)V
    .locals 1

    .line 1
    invoke-static {}, LG2/c;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/app/ActivityManager$RunningTaskInfo;->isFreeform()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/TransformParams;->getChangeLeashForApp(Landroid/view/RemoteAnimationTarget;)Landroid/view/SurfaceControl;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p2, p0, p1}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public applySurfaceParams(Lcom/android/quickstep/util/SurfaceTransaction;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TransformParams;->mSyncTransactionApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/android/quickstep/util/SurfaceTransaction;->getTransaction()Landroid/view/SurfaceControl$Transaction;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public createSurfaceParams(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/SurfaceTransaction;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TransformParams;->mTargetSet:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/TransformParams;->mSurfaceTransactionSupplier:Ljava/util/function/Supplier;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    const/4 v2, 0x0

    .line 16
    move v3, v2

    .line 17
    :goto_0
    iget-object v4, v0, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredApps:[Landroid/view/RemoteAnimationTarget;

    .line 18
    .line 19
    array-length v5, v4

    .line 20
    if-ge v3, v5, :cond_5

    .line 21
    .line 22
    aget-object v4, v4, v3

    .line 23
    .line 24
    iget-object v5, v4, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 25
    .line 26
    invoke-virtual {v1, v5}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    iget-object v6, v4, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 31
    .line 32
    invoke-virtual {v6}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    const/4 v7, 0x2

    .line 37
    if-ne v6, v7, :cond_1

    .line 38
    .line 39
    iget-object v6, p0, Lcom/android/quickstep/util/TransformParams;->mHomeBuilderProxy:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget v6, v4, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 43
    .line 44
    iget v7, v0, Lcom/android/quickstep/RemoteAnimationTargets;->targetMode:I

    .line 45
    .line 46
    if-ne v6, v7, :cond_2

    .line 47
    .line 48
    move-object v6, p1

    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iget-object v6, p0, Lcom/android/quickstep/util/TransformParams;->mBaseBuilderProxy:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

    .line 51
    .line 52
    :goto_1
    iget v7, v4, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 53
    .line 54
    iget v8, v0, Lcom/android/quickstep/RemoteAnimationTargets;->targetMode:I

    .line 55
    .line 56
    if-ne v7, v8, :cond_3

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/quickstep/util/TransformParams;->getTargetAlpha()F

    .line 59
    .line 60
    .line 61
    move-result v7

    .line 62
    invoke-virtual {v5, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/quickstep/util/TransformParams;->getWindowBlurRadius()I

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    invoke-virtual {v5, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowBlurRadius(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 70
    .line 71
    .line 72
    :cond_3
    invoke-interface {v6, v5, v4, p0}, Lcom/android/quickstep/util/TransformParams$BuilderProxy;->onBuildTargetParams(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V

    .line 73
    .line 74
    .line 75
    iget-boolean v5, p0, Lcom/android/quickstep/util/TransformParams;->mCornerRadiusIsOverridden:Z

    .line 76
    .line 77
    if-nez v5, :cond_4

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/android/quickstep/util/SurfaceTransaction;->getTransaction()Landroid/view/SurfaceControl$Transaction;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-direct {p0, v4, v5}, Lcom/android/quickstep/util/TransformParams;->overrideFreeformChangeLeashCornerRadiusToZero(Landroid/view/RemoteAnimationTarget;Landroid/view/SurfaceControl$Transaction;)V

    .line 84
    .line 85
    .line 86
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    const/4 p1, 0x1

    .line 90
    iput-boolean p1, p0, Lcom/android/quickstep/util/TransformParams;->mCornerRadiusIsOverridden:Z

    .line 91
    .line 92
    iget-object p0, v0, Lcom/android/quickstep/RemoteAnimationTargets;->wallpapers:[Landroid/view/RemoteAnimationTarget;

    .line 93
    .line 94
    if-eqz p0, :cond_6

    .line 95
    .line 96
    array-length p0, p0

    .line 97
    goto :goto_2

    .line 98
    :cond_6
    move p0, v2

    .line 99
    :goto_2
    if-ge v2, p0, :cond_7

    .line 100
    .line 101
    iget-object p1, v0, Lcom/android/quickstep/RemoteAnimationTargets;->wallpapers:[Landroid/view/RemoteAnimationTarget;

    .line 102
    .line 103
    aget-object p1, p1, v2

    .line 104
    .line 105
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 106
    .line 107
    invoke-virtual {v1, p1}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    const/high16 v3, -0x80000000

    .line 112
    .line 113
    invoke-virtual {p1, v3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setLayer(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 114
    .line 115
    .line 116
    add-int/lit8 v2, v2, 0x1

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_7
    :goto_3
    return-object v1
.end method

.method public getApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TransformParams;->mSyncTransactionApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCornerRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/TransformParams;->mCornerRadius:F

    .line 2
    .line 3
    return p0
.end method

.method public getProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/TransformParams;->mProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public getTargetAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/TransformParams;->mTargetAlpha:F

    .line 2
    .line 3
    return p0
.end method

.method public getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TransformParams;->mTargetSet:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWindowBlurRadius()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/TransformParams;->mWindowBlurRadius:I

    .line 2
    .line 3
    return p0
.end method

.method public setBaseBuilderProxy(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TransformParams;->mBaseBuilderProxy:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCornerRadius(F)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TransformParams;->mCornerRadius:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final setCurrentProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TransformParams;->mCurrentProgress:F

    .line 2
    .line 3
    return-void
.end method

.method public final setCurrentScrollOffset(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TransformParams;->mCurrentScrollOffset:F

    .line 2
    .line 3
    return-void
.end method

.method public setHomeBuilderProxy(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TransformParams;->mHomeBuilderProxy:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public setProgress(F)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TransformParams;->mProgress:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setSyncTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TransformParams;->mSyncTransactionApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTargetAlpha(F)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TransformParams;->mTargetAlpha:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TransformParams;->mTargetSet:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTransitionInfo(Landroid/window/TransitionInfo;)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/TransformParams;->mTransitionInfo:Landroid/window/TransitionInfo;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/util/TransformParams;->mCornerRadiusIsOverridden:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public setWindowBlurRadius(I)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/TransformParams;->mWindowBlurRadius:I

    .line 2
    .line 3
    return-object p0
.end method
