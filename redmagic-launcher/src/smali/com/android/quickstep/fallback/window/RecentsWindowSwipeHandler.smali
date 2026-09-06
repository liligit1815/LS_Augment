.class public Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;
.super Lcom/android/quickstep/AbsSwipeUpHandler;
.source "RecentsWindowSwipeHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;,
        Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;,
        Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/AbsSwipeUpHandler<",
        "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
        "Lcom/android/quickstep/fallback/FallbackRecentsView<",
        "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
        ">;",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RecentsWindowSwipeHandler"

.field private static sMessageReceiver:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;


# instance fields
.field private mActiveAnimationFactory:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;

.field private mAppCanEnterPip:Z

.field private mMaxLauncherScale:F

.field private final mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

.field private final mRunningOverHome:Z

.field private final mTmpMatrix:Landroid/graphics/Matrix;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;JZLcom/android/systemui/shared/system/InputConsumerController;Lcom/android/launcher3/util/s1;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lcom/android/quickstep/AbsSwipeUpHandler;-><init>(Landroid/content/Context;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;JZLcom/android/systemui/shared/system/InputConsumerController;Lcom/android/launcher3/util/s1;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/high16 p2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput p2, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mMaxLauncherScale:F

    .line 14
    .line 15
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->isHomeTask()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 p1, 0x0

    .line 50
    :goto_0
    iput-boolean p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRunningOverHome:Z

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->initTransformParams()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method static bridge synthetic A0()Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->sMessageReceiver:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic B0(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->sMessageReceiver:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;

    .line 2
    .line 3
    return-void
.end method

.method static synthetic access$000(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$100(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$200(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$300(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$400(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic access$500(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$600(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$700(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Lcom/android/quickstep/RecentsAnimationTargets;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$800(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Lcom/android/quickstep/RecentsAnimationTargets;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    return-object p0
.end method

.method private initTransformParams()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mActiveAnimationFactory:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;->g(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v0, Lcom/android/quickstep/fallback/window/o;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/android/quickstep/fallback/window/o;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SwipeUpAnimationLogic;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic lambda$finishRecentsControllerToHome$1(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHome()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private synthetic lambda$initTransformParams$0(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/android/quickstep/fallback/window/q;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/android/quickstep/fallback/window/q;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/TransformParams;->setHomeBuilderProxy(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/TransformParams;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private setHomeScaleAndAlpha(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;FF)V
    .locals 2

    .line 1
    iget-object v0, p2, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iget v1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mMaxLauncherScale:F

    .line 14
    .line 15
    invoke-static {p3, v0, v1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 20
    .line 21
    iget-object v1, p2, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/graphics/Rect;->exactCenterX()F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object p2, p2, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterY()F

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-virtual {v0, p3, p3, v1, p2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setShow()Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private updateHomeActivityTransformDuringSwipeUp(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 3

    .line 1
    iget-object p3, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mActiveAnimationFactory:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 7
    .line 8
    iget p3, p3, Lcom/android/launcher3/anim/d;->d:F

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    sub-float v1, v0, p3

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v1, v2, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->setHomeScaleAndAlpha(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;FF)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic v0(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->updateHomeActivityTransformDuringSwipeUp(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w0(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->lambda$initTransformParams$0(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x0(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->lambda$finishRecentsControllerToHome$1(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic y0(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRunningOverHome:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic z0(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;FF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->setHomeScaleAndAlpha(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected animateGestureEnd(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRunningOverHome:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 7
    .line 8
    if-ne p6, v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v1

    .line 13
    :goto_0
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 18
    .line 19
    invoke-virtual {v3}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v2, v3}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startHome(Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const-wide/16 p3, 0x0

    .line 35
    .line 36
    :cond_2
    move-object v0, p0

    .line 37
    move v1, p1

    .line 38
    move v2, p2

    .line 39
    move-wide v3, p3

    .line 40
    move-object v5, p5

    .line 41
    move-object v6, p6

    .line 42
    move-object v7, p7

    .line 43
    invoke-super/range {v0 .. v7}, Lcom/android/quickstep/AbsSwipeUpHandler;->animateGestureEnd(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method protected createHomeAnimationFactory(Ljava/util/List;JZZLandroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/IBinder;",
            ">;JZZ",
            "Landroid/view/RemoteAnimationTarget;",
            "Lcom/android/quickstep/views/TaskView;",
            ")",
            "Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;"
        }
    .end annotation

    .line 1
    iput-boolean p5, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mAppCanEnterPip:Z

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    new-instance p1, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackPipToHomeAnimationFactory;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Lcom/android/quickstep/fallback/window/w;)V

    .line 9
    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    new-instance p1, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;

    .line 13
    .line 14
    invoke-direct {p1, p0, p2, p3}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;J)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mActiveAnimationFactory:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;

    .line 18
    .line 19
    new-instance p1, Landroid/content/Intent;

    .line 20
    .line 21
    iget-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getHomeIntent()Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    if-eqz p6, :cond_1

    .line 31
    .line 32
    iget-object p2, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mActiveAnimationFactory:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;

    .line 33
    .line 34
    iget-object p3, p6, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 35
    .line 36
    invoke-static {p2, p1, p3}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;->f(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;Landroid/content/Intent;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mActiveAnimationFactory:Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$FallbackHomeAnimationFactory;

    .line 40
    .line 41
    return-object p0
.end method

.method protected finishRecentsControllerToHome(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mAppCanEnterPip:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/android/quickstep/fallback/window/p;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/fallback/window/p;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    check-cast v0, Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->cleanupRemoteTargets()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0, p1, v0}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method protected initTransitionEndpoints(Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->initTransitionEndpoints(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRunningOverHome:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    aget-object p1, p1, v0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/android/quickstep/util/TaskViewSimulator;->getFullScreenScale()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    div-float/2addr v0, p1

    .line 24
    iput v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mMaxLauncherScale:F

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method protected notifyGestureAnimationStartToRecents()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRunningOverHome:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/util/C1;->g:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    check-cast v0, Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPlaceholderGroupedTaskInfo([I)Lcom/android/wm/shell/shared/i;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lcom/android/quickstep/fallback/FallbackRecentsView;->onGestureAnimationStartOnHome(Lcom/android/wm/shell/shared/i;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    :cond_1
    invoke-super {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->notifyGestureAnimationStartToRecents()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/quickstep/AbsSwipeUpHandler;->onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->initTransformParams()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected switchToScreenshot()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;->mRunningOverHome:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 6
    .line 7
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_CAPTURED:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-super {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->switchToScreenshot()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
