.class public Lcom/android/quickstep/LauncherBackAnimationController;
.super Ljava/lang/Object;
.source "LauncherBackAnimationController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;,
        Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;
    }
.end annotation


# static fields
.field private static final MAX_BLUR_RADIUS:I = 0x14

.field private static final MAX_SCRIM_ALPHA_DARK:F = 0.8f

.field private static final MAX_SCRIM_ALPHA_LIGHT:F = 0.2f

.field private static final MIN_BLUR_RADIUS_PRE_COMMIT:I = 0xa

.field private static final MIN_WINDOW_SCALE:F

.field private static final SCRIM_FADE_DURATION:I = 0xe9

.field public static final TAG:Ljava/lang/String; = "LauncherBackAnimationController"


# instance fields
.field private mAnimationFinishedCallback:Landroid/view/IRemoteAnimationFinishedCallback;

.field private mBackCallback:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

.field private mBackInProgress:Z

.field private mBackProgress:F

.field private mBackTarget:Landroid/view/RemoteAnimationTarget;

.field private final mComponentCallbacks:Landroid/content/ComponentCallbacks;

.field private final mCurrentRect:Landroid/graphics/RectF;

.field private final mInitialTouchPos:Landroid/graphics/PointF;

.field private mLastBlurRadius:I

.field private final mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private mLauncherTarget:Landroid/view/RemoteAnimationTarget;

.field private mLauncherTargetView:Landroid/view/View;

.field private mOverridingStatusBarFlags:Z

.field private final mProgressAnimator:Landroid/window/BackProgressAnimator;

.field private final mProgressInterpolator:Landroid/view/animation/Interpolator;

.field private final mQuickstepTransitionManager:Lcom/android/launcher3/q5;

.field private mScrimAlpha:F

.field private mScrimAlphaAnimator:Landroid/animation/ValueAnimator;

.field private mScrimLayer:Landroid/view/SurfaceControl;

.field private final mStartRect:Landroid/graphics/Rect;

.field private mStatusBarHeight:I

.field private final mTransaction:Landroid/view/SurfaceControl$Transaction;

.field private final mTransformMatrix:Landroid/graphics/Matrix;

.field private final mVerticalMoveInterpolator:Landroid/view/animation/Interpolator;

.field private mWaitStartTransition:Z

.field private mWindowScaleEndCornerRadius:F

.field private final mWindowScaleMarginX:I

.field private mWindowScaleStartCornerRadius:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x3f400000    # 0.75f

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const v0, 0x3f59999a    # 0.85f

    .line 11
    .line 12
    .line 13
    :goto_0
    sput v0, Lcom/android/quickstep/LauncherBackAnimationController;->MIN_WINDOW_SCALE:F

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/q5;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransformMatrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mCurrentRect:Landroid/graphics/RectF;

    .line 24
    .line 25
    sget-object v0, LJ0/h;->b0:Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mProgressInterpolator:Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mVerticalMoveInterpolator:Landroid/view/animation/Interpolator;

    .line 35
    .line 36
    new-instance v0, Landroid/graphics/PointF;

    .line 37
    .line 38
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mInitialTouchPos:Landroid/graphics/PointF;

    .line 42
    .line 43
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    iput v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackProgress:F

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    iput-boolean v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackInProgress:Z

    .line 55
    .line 56
    iput-boolean v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWaitStartTransition:Z

    .line 57
    .line 58
    new-instance v1, Landroid/window/BackProgressAnimator;

    .line 59
    .line 60
    invoke-direct {v1}, Landroid/window/BackProgressAnimator;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 64
    .line 65
    iput v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLastBlurRadius:I

    .line 66
    .line 67
    new-instance v0, Lcom/android/quickstep/LauncherBackAnimationController$1;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Lcom/android/quickstep/LauncherBackAnimationController$1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mComponentCallbacks:Landroid/content/ComponentCallbacks;

    .line 73
    .line 74
    iput-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 75
    .line 76
    iput-object p2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mQuickstepTransitionManager:Lcom/android/launcher3/q5;

    .line 77
    .line 78
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->loadResources()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const p2, 0x7f070ab7

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleMarginX:I

    .line 93
    .line 94
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->finishAnimation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private applyTransaction()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/view/Choreographer;->getVsyncId()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setFrameTimelineVsync(J)Landroid/view/SurfaceControl$Transaction;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private applyTransform(Landroid/graphics/RectF;F)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    int-to-float v1, v1

    .line 12
    div-float/2addr v0, v1

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransformMatrix:Landroid/graphics/Matrix;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransformMatrix:Landroid/graphics/Matrix;

    .line 19
    .line 20
    invoke-virtual {v1, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransformMatrix:Landroid/graphics/Matrix;

    .line 24
    .line 25
    iget v1, p1, Landroid/graphics/RectF;->left:F

    .line 26
    .line 27
    iget p1, p1, Landroid/graphics/RectF;->top:F

    .line 28
    .line 29
    invoke-virtual {v0, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 33
    .line 34
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 45
    .line 46
    iget-object v0, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransformMatrix:Landroid/graphics/Matrix;

    .line 49
    .line 50
    const/16 v2, 0x9

    .line 51
    .line 52
    new-array v2, v2, [F

    .line 53
    .line 54
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setMatrix(Landroid/view/SurfaceControl;Landroid/graphics/Matrix;[F)Landroid/view/SurfaceControl$Transaction;

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 60
    .line 61
    iget-object v0, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 64
    .line 65
    invoke-virtual {p1, v0, v1}, Landroid/view/SurfaceControl$Transaction;->setWindowCrop(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)Landroid/view/SurfaceControl$Transaction;

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 71
    .line 72
    iget-object v0, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 73
    .line 74
    invoke-virtual {p1, v0, p2}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 75
    .line 76
    .line 77
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->applyTransaction()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherBackAnimationController;->lambda$startTransitionAnimations$0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/LauncherBackAnimationController;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackInProgress:Z

    .line 2
    .line 3
    return p0
.end method

.method private customizeStatusBarAppearance(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mOverridingStatusBarFlags:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mOverridingStatusBarFlags:Z

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    and-int/lit16 p1, p1, 0x2000

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move p1, v0

    .line 30
    :goto_0
    iget-boolean v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mOverridingStatusBarFlags:Z

    .line 31
    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    new-instance v1, Lcom/android/internal/view/AppearanceRegion;

    .line 35
    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    const/16 v0, 0x8

    .line 39
    .line 40
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 41
    .line 42
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/app/WindowConfiguration;->getBounds()Landroid/graphics/Rect;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {v1, v0, p1}, Lcom/android/internal/view/AppearanceRegion;-><init>(ILandroid/graphics/Rect;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    const/4 v1, 0x0

    .line 53
    :goto_1
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Lcom/android/quickstep/SystemUiProxy;->customizeStatusBarAppearance(Lcom/android/internal/view/AppearanceRegion;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method static bridge synthetic d(Lcom/android/quickstep/LauncherBackAnimationController;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackProgress:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/LauncherBackAnimationController;)Landroid/view/RemoteAnimationTarget;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/LauncherBackAnimationController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method private finishAnimation()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->d6(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 20
    .line 21
    iget-object v0, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->release()V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncherTarget:Landroid/view/RemoteAnimationTarget;

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, v2, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/view/SurfaceControl;->isValid()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncherTarget:Landroid/view/RemoteAnimationTarget;

    .line 42
    .line 43
    iget-object v2, v2, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/view/SurfaceControl;->release()V

    .line 46
    .line 47
    .line 48
    :cond_1
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncherTarget:Landroid/view/RemoteAnimationTarget;

    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackInProgress:Z

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    iput v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackProgress:F

    .line 54
    .line 55
    iget-object v3, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransformMatrix:Landroid/graphics/Matrix;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 58
    .line 59
    .line 60
    iget-object v3, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mCurrentRect:Landroid/graphics/RectF;

    .line 61
    .line 62
    invoke-virtual {v3}, Landroid/graphics/RectF;->setEmpty()V

    .line 63
    .line 64
    .line 65
    iget-object v3, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/graphics/Rect;->setEmpty()V

    .line 68
    .line 69
    .line 70
    iget-object v3, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mInitialTouchPos:Landroid/graphics/PointF;

    .line 71
    .line 72
    invoke-virtual {v3, v2, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 73
    .line 74
    .line 75
    const/4 v2, 0x1

    .line 76
    invoke-direct {p0, v2}, Lcom/android/quickstep/LauncherBackAnimationController;->setLauncherTargetViewVisible(Z)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncherTargetView:Landroid/view/View;

    .line 80
    .line 81
    iput-boolean v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mOverridingStatusBarFlags:Z

    .line 82
    .line 83
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mAnimationFinishedCallback:Landroid/view/IRemoteAnimationFinishedCallback;

    .line 84
    .line 85
    if-eqz v2, :cond_2

    .line 86
    .line 87
    :try_start_0
    invoke-interface {v2}, Landroid/view/IRemoteAnimationFinishedCallback;->onAnimationFinished()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :catch_0
    move-exception v2

    .line 92
    const-string v3, "ShellBackPreview"

    .line 93
    .line 94
    const-string v4, "Failed call onBackAnimationFinished"

    .line 95
    .line 96
    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 97
    .line 98
    .line 99
    :goto_0
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mAnimationFinishedCallback:Landroid/view/IRemoteAnimationFinishedCallback;

    .line 100
    .line 101
    :cond_2
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlphaAnimator:Landroid/animation/ValueAnimator;

    .line 102
    .line 103
    if-eqz v2, :cond_3

    .line 104
    .line 105
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-eqz v2, :cond_3

    .line 110
    .line 111
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlphaAnimator:Landroid/animation/ValueAnimator;

    .line 112
    .line 113
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlphaAnimator:Landroid/animation/ValueAnimator;

    .line 117
    .line 118
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 119
    .line 120
    if-eqz v0, :cond_4

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->removeScrimLayer()V

    .line 123
    .line 124
    .line 125
    :cond_4
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    invoke-static {}, Lcom/android/launcher3/y0;->s0()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_5

    .line 136
    .line 137
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->F1()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_5

    .line 148
    .line 149
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 150
    .line 151
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 152
    .line 153
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_5

    .line 158
    .line 159
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/BaseDepthController;->pauseBlursOnWindows(Z)V

    .line 166
    .line 167
    .line 168
    :cond_5
    iput v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLastBlurRadius:I

    .line 169
    .line 170
    return-void
.end method

.method static bridge synthetic g(Lcom/android/quickstep/LauncherBackAnimationController;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWaitStartTransition:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mAnimationFinishedCallback:Landroid/view/IRemoteAnimationFinishedCallback;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/quickstep/LauncherBackAnimationController;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackProgress:F

    .line 2
    .line 3
    return-void
.end method

.method private initBackMotion(Landroid/window/BackMotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/BackProgressAnimator;->removeOnBackCancelledFinishCallback()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, LG2/c;->l()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/window/BackMotionEvent;->getDepartingAnimationTarget()Landroid/view/RemoteAnimationTarget;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v1, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    return-void

    .line 33
    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackInProgress:Z

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mInitialTouchPos:Landroid/graphics/PointF;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/window/BackMotionEvent;->getTouchX()F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p1}, Landroid/window/BackMotionEvent;->getTouchY()F

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {p0, v0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method static bridge synthetic j(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncherTarget:Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/quickstep/LauncherBackAnimationController;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWaitStartTransition:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic lambda$startTransitionAnimations$0(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 24
    .line 25
    iget v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlpha:F

    .line 26
    .line 27
    mul-float/2addr v2, p1

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 29
    .line 30
    .line 31
    iget v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLastBlurRadius:I

    .line 32
    .line 33
    const/high16 v1, 0x3f800000    # 1.0f

    .line 34
    .line 35
    sub-float/2addr v1, p1

    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-static {v0, p1, v1}, Landroid/util/MathUtils;->lerp(IIF)F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    float-to-int p1, p1

    .line 42
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherBackAnimationController;->setBlur(I)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->applyTransaction()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method private loadResources()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/systemui/shared/system/QuickStepContract;->supportsRoundedCornersOnWindows(Landroid/content/res/Resources;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f070ab6

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :goto_0
    iput v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleEndCornerRadius:F

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleStartCornerRadius:F

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/android/internal/policy/SystemBarUtils;->getStatusBarHeight(Landroid/content/Context;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStatusBarHeight:I

    .line 46
    .line 47
    return-void
.end method

.method static bridge synthetic m(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/window/BackMotionEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherBackAnimationController;->initBackMotion(Landroid/window/BackMotionEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic n(Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->loadResources()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic o(Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->onCancelFinished()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private onCancelFinished()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/LauncherBackAnimationController;->customizeStatusBarAppearance(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->F1()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    const/high16 v0, 0x3f800000    # 1.0f

    .line 34
    .line 35
    invoke-direct {p0, v0}, Lcom/android/quickstep/LauncherBackAnimationController;->setLauncherScale(F)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->finishAnimation()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method static bridge synthetic p(Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->resetScrim()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic q(Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->startTransition()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic r(Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->tryStartBackAnimation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private resetScrim()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->removeScrimLayer()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlpha:F

    .line 6
    .line 7
    return-void
.end method

.method static bridge synthetic s(Lcom/android/quickstep/LauncherBackAnimationController;FLandroid/window/BackEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/LauncherBackAnimationController;->updateBackProgress(FLandroid/window/BackEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private setBlur(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->s0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1}, Landroid/view/SurfaceControl$Transaction;->setBackgroundBlurRadius(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private setLauncherScale(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->setScaleX(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private setLauncherTargetViewVisible(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncherTargetView:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setIconVisible(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/widget/T;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/high16 p1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method private startTransition()V
    .locals 12

    .line 1
    invoke-static {}, LG2/c;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->finishAnimation()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput-boolean v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWaitStartTransition:Z

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {v0, v2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->d6(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/V;->F(Z)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 45
    .line 46
    const/16 v3, 0x8

    .line 47
    .line 48
    invoke-virtual {v0, v3}, Lcom/android/launcher3/v;->hasSomeInvisibleFlag(I)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 55
    .line 56
    const/4 v3, 0x4

    .line 57
    invoke-virtual {v0, v3}, Lcom/android/launcher3/v;->addForceInvisibleFlag(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 67
    .line 68
    .line 69
    :cond_4
    invoke-direct {p0, v2}, Lcom/android/quickstep/LauncherBackAnimationController;->setLauncherTargetViewVisible(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 73
    .line 74
    const v3, 0x70d66274

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1, v3}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    .line 78
    .line 79
    .line 80
    iget v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackProgress:F

    .line 81
    .line 82
    iget v3, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleStartCornerRadius:F

    .line 83
    .line 84
    iget v4, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleEndCornerRadius:F

    .line 85
    .line 86
    invoke-static {v0, v3, v4}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 87
    .line 88
    .line 89
    move-result v10

    .line 90
    new-instance v9, Landroid/graphics/RectF;

    .line 91
    .line 92
    invoke-direct {v9}, Landroid/graphics/RectF;-><init>()V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mQuickstepTransitionManager:Lcom/android/launcher3/q5;

    .line 96
    .line 97
    iget-object v3, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 98
    .line 99
    iget-object v4, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mCurrentRect:Landroid/graphics/RectF;

    .line 100
    .line 101
    invoke-virtual {v0, v3, v4, v2, v9}, Lcom/android/launcher3/q5;->d1(Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;ZLandroid/graphics/RectF;)V

    .line 102
    .line 103
    .line 104
    iget-object v5, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mQuickstepTransitionManager:Lcom/android/launcher3/q5;

    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 107
    .line 108
    filled-new-array {v0}, [Landroid/view/RemoteAnimationTarget;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    new-array v7, v1, [Landroid/view/RemoteAnimationTarget;

    .line 113
    .line 114
    new-array v8, v1, [Landroid/view/RemoteAnimationTarget;

    .line 115
    .line 116
    iget-boolean v11, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackInProgress:Z

    .line 117
    .line 118
    invoke-virtual/range {v5 .. v11}, Lcom/android/launcher3/q5;->U([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;FZ)Lcom/android/quickstep/util/BackAnimState;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-direct {p0, v0}, Lcom/android/quickstep/LauncherBackAnimationController;->startTransitionAnimations(Lcom/android/quickstep/util/BackAnimState;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 126
    .line 127
    const/16 v1, 0xf

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lcom/android/launcher3/v;->clearForceInvisibleFlag(I)V

    .line 130
    .line 131
    .line 132
    invoke-direct {p0, v2}, Lcom/android/quickstep/LauncherBackAnimationController;->customizeStatusBarAppearance(Z)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method private startTransitionAnimations(Lcom/android/quickstep/util/BackAnimState;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/k1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/k1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Lcom/android/quickstep/util/BackAnimState;->addOnAnimCompleteCallback(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->addScrimLayer()V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    new-array v0, v0, [F

    .line 23
    .line 24
    fill-array-data v0, :array_0

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlphaAnimator:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    new-instance v1, Lcom/android/quickstep/l1;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Lcom/android/quickstep/l1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlphaAnimator:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    new-instance v1, Lcom/android/quickstep/LauncherBackAnimationController$2;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lcom/android/quickstep/LauncherBackAnimationController$2;-><init>(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlphaAnimator:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    const-wide/16 v0, 0xe9

    .line 54
    .line 55
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 60
    .line 61
    .line 62
    invoke-interface {p1}, Lcom/android/quickstep/util/BackAnimState;->start()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    nop

    .line 67
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private tryStartBackAnimation()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-static {}, LG2/c;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackInProgress:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 20
    .line 21
    iget-object v1, v1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/view/SurfaceControl$Transaction;->setAnimationTransaction()Landroid/view/SurfaceControl$Transaction;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 33
    .line 34
    iget-object v1, v1, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/app/WindowConfiguration;->getMaxBounds()Landroid/graphics/Rect;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, LG2/c;->j()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, 0x0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget-object v2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 67
    .line 68
    if-ne v0, v2, :cond_2

    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 73
    .line 74
    iget-object v2, v2, Landroid/view/RemoteAnimationTarget;->contentInsets:Landroid/graphics/Rect;

    .line 75
    .line 76
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 77
    .line 78
    invoke-virtual {v0, v1, v1, v1, v2}, Landroid/graphics/Rect;->inset(IIII)V

    .line 79
    .line 80
    .line 81
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mQuickstepTransitionManager:Lcom/android/launcher3/q5;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 84
    .line 85
    filled-new-array {v2}, [Landroid/view/RemoteAnimationTarget;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v0, v2}, Lcom/android/launcher3/q5;->a0([Landroid/view/RemoteAnimationTarget;)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncherTargetView:Landroid/view/View;

    .line 94
    .line 95
    invoke-direct {p0, v1}, Lcom/android/quickstep/LauncherBackAnimationController;->setLauncherTargetViewVisible(Z)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mCurrentRect:Landroid/graphics/RectF;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->F1()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_4

    .line 122
    .line 123
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 124
    .line 125
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 126
    .line 127
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-nez v0, :cond_4

    .line 132
    .line 133
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, LJ0/a;->a(Landroid/view/View;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v0}, LJ0/a;->a(Landroid/view/View;)V

    .line 149
    .line 150
    .line 151
    invoke-static {}, Lcom/android/launcher3/y0;->s0()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-eqz v0, :cond_3

    .line 156
    .line 157
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    const/4 v1, 0x1

    .line 164
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/BaseDepthController;->pauseBlursOnWindows(Z)V

    .line 165
    .line 166
    .line 167
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 168
    .line 169
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget-object v0, v0, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 174
    .line 175
    sget-object v1, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 176
    .line 177
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 178
    .line 179
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V3;->e(Landroid/content/Context;)F

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 184
    .line 185
    .line 186
    const v0, 0x3f59999a    # 0.85f

    .line 187
    .line 188
    .line 189
    invoke-direct {p0, v0}, Lcom/android/quickstep/LauncherBackAnimationController;->setLauncherScale(F)V

    .line 190
    .line 191
    .line 192
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 193
    .line 194
    if-nez v0, :cond_5

    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->addScrimLayer()V

    .line 197
    .line 198
    .line 199
    :cond_5
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->applyTransaction()V

    .line 200
    .line 201
    .line 202
    :cond_6
    :goto_0
    return-void
.end method

.method private updateBackProgress(FLandroid/window/BackEvent;)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackInProgress:Z

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackTarget:Landroid/view/RemoteAnimationTarget;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->addScrimLayer()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/16 v0, 0x14

    .line 20
    .line 21
    const/16 v1, 0xa

    .line 22
    .line 23
    invoke-static {v0, v1, p1}, Landroid/util/MathUtils;->lerp(IIF)F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    float-to-int v0, v0

    .line 28
    iput v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLastBlurRadius:I

    .line 29
    .line 30
    invoke-direct {p0, v0}, Lcom/android/quickstep/LauncherBackAnimationController;->setBlur(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    int-to-float v0, v0

    .line 40
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStartRect:Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    sget v2, Lcom/android/quickstep/LauncherBackAnimationController;->MIN_WINDOW_SCALE:F

    .line 48
    .line 49
    const/high16 v3, 0x3f800000    # 1.0f

    .line 50
    .line 51
    invoke-static {p1, v3, v2}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    mul-float/2addr v2, v0

    .line 56
    div-float v4, v1, v0

    .line 57
    .line 58
    mul-float/2addr v4, v2

    .line 59
    invoke-virtual {p2}, Landroid/window/BackEvent;->getTouchY()F

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    iget-object v6, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mInitialTouchPos:Landroid/graphics/PointF;

    .line 64
    .line 65
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 66
    .line 67
    sub-float/2addr v5, v6

    .line 68
    const/4 v6, 0x0

    .line 69
    cmpg-float v7, v5, v6

    .line 70
    .line 71
    if-gez v7, :cond_2

    .line 72
    .line 73
    const/high16 v3, -0x40800000    # -1.0f

    .line 74
    .line 75
    :cond_2
    const/high16 v7, 0x40000000    # 2.0f

    .line 76
    .line 77
    div-float v8, v1, v7

    .line 78
    .line 79
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    invoke-static {v8, v5}, Ljava/lang/Math;->min(FF)F

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    div-float/2addr v5, v8

    .line 88
    iget-object v8, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mVerticalMoveInterpolator:Landroid/view/animation/Interpolator;

    .line 89
    .line 90
    invoke-interface {v8, v5}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    mul-float/2addr v3, v5

    .line 95
    sub-float/2addr v1, v4

    .line 96
    div-float v5, v1, v7

    .line 97
    .line 98
    iget v8, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleMarginX:I

    .line 99
    .line 100
    int-to-float v8, v8

    .line 101
    sub-float/2addr v5, v8

    .line 102
    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    mul-float/2addr v3, v5

    .line 107
    const/high16 v5, 0x3f000000    # 0.5f

    .line 108
    .line 109
    mul-float/2addr v1, v5

    .line 110
    add-float/2addr v1, v3

    .line 111
    invoke-virtual {p2}, Landroid/window/BackEvent;->getSwipeEdge()I

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    const/4 v3, 0x1

    .line 116
    if-eqz p2, :cond_4

    .line 117
    .line 118
    if-eq p2, v3, :cond_3

    .line 119
    .line 120
    sub-float/2addr v0, v2

    .line 121
    div-float/2addr v0, v7

    .line 122
    goto :goto_1

    .line 123
    :cond_3
    iget p2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleMarginX:I

    .line 124
    .line 125
    int-to-float p2, p2

    .line 126
    mul-float v0, p1, p2

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_4
    iget p2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleMarginX:I

    .line 130
    .line 131
    int-to-float p2, p2

    .line 132
    mul-float/2addr p2, p1

    .line 133
    sub-float/2addr v0, p2

    .line 134
    sub-float/2addr v0, v2

    .line 135
    :goto_1
    iget-object p2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mCurrentRect:Landroid/graphics/RectF;

    .line 136
    .line 137
    add-float/2addr v2, v0

    .line 138
    add-float/2addr v4, v1

    .line 139
    invoke-virtual {p2, v0, v1, v2, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 140
    .line 141
    .line 142
    iget p2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleStartCornerRadius:F

    .line 143
    .line 144
    iget v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mWindowScaleEndCornerRadius:F

    .line 145
    .line 146
    invoke-static {p1, p2, v0}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    iget-object p2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mCurrentRect:Landroid/graphics/RectF;

    .line 151
    .line 152
    invoke-direct {p0, p2, p1}, Lcom/android/quickstep/LauncherBackAnimationController;->applyTransform(Landroid/graphics/RectF;F)V

    .line 153
    .line 154
    .line 155
    iget p1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mStatusBarHeight:I

    .line 156
    .line 157
    div-int/lit8 p1, p1, 0x2

    .line 158
    .line 159
    int-to-float p1, p1

    .line 160
    cmpl-float p1, v1, p1

    .line 161
    .line 162
    if-lez p1, :cond_5

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_5
    const/4 v3, 0x0

    .line 166
    :goto_2
    invoke-direct {p0, v3}, Lcom/android/quickstep/LauncherBackAnimationController;->customizeStatusBarAppearance(Z)V

    .line 167
    .line 168
    .line 169
    :cond_6
    :goto_3
    return-void
.end method


# virtual methods
.method addScrimLayer()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncherTarget:Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    new-instance v2, Landroid/view/SurfaceControl$Builder;

    .line 25
    .line 26
    invoke-direct {v2}, Landroid/view/SurfaceControl$Builder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v3, "Back to launcher background scrim"

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Landroid/view/SurfaceControl$Builder;->setName(Ljava/lang/String;)Landroid/view/SurfaceControl$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "LauncherBackAnimationController"

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Landroid/view/SurfaceControl$Builder;->setCallsite(Ljava/lang/String;)Landroid/view/SurfaceControl$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Landroid/view/SurfaceControl$Builder;->setColorLayer()Landroid/view/SurfaceControl$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2, v0}, Landroid/view/SurfaceControl$Builder;->setParent(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {v0, v2}, Landroid/view/SurfaceControl$Builder;->setOpaque(Z)Landroid/view/SurfaceControl$Builder;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v2}, Landroid/view/SurfaceControl$Builder;->setHidden(Z)Landroid/view/SurfaceControl$Builder;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Landroid/view/SurfaceControl$Builder;->build()Landroid/view/SurfaceControl;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 63
    .line 64
    const/4 v0, 0x3

    .line 65
    new-array v0, v0, [F

    .line 66
    .line 67
    fill-array-data v0, :array_0

    .line 68
    .line 69
    .line 70
    if-eqz v1, :cond_2

    .line 71
    .line 72
    const v1, 0x3f4ccccd    # 0.8f

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    const v1, 0x3e4ccccd    # 0.2f

    .line 77
    .line 78
    .line 79
    :goto_1
    iput v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlpha:F

    .line 80
    .line 81
    const/16 v1, 0x14

    .line 82
    .line 83
    invoke-direct {p0, v1}, Lcom/android/quickstep/LauncherBackAnimationController;->setBlur(I)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 87
    .line 88
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 89
    .line 90
    invoke-virtual {v1, v2, v0}, Landroid/view/SurfaceControl$Transaction;->setColor(Landroid/view/SurfaceControl;[F)Landroid/view/SurfaceControl$Transaction;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 95
    .line 96
    iget v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimAlpha:F

    .line 97
    .line 98
    invoke-virtual {v0, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 109
    .line 110
    const/16 v1, 0x3e8

    .line 111
    .line 112
    invoke-virtual {v0, p0, v1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 113
    .line 114
    .line 115
    :cond_3
    :goto_2
    return-void

    .line 116
    nop

    .line 117
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public registerBackCallbacks(Landroid/os/Handler;)V
    .locals 6

    .line 1
    new-instance v0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mProgressInterpolator:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v4, p0

    .line 9
    move-object v1, p1

    .line 10
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;-><init>(Landroid/os/Handler;Landroid/window/BackProgressAnimator;Landroid/view/animation/Interpolator;Lcom/android/quickstep/LauncherBackAnimationController;Lcom/android/quickstep/t1;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, v4, Lcom/android/quickstep/LauncherBackAnimationController;->mBackCallback:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

    .line 14
    .line 15
    sget-object p0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 16
    .line 17
    iget-object p1, v4, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 24
    .line 25
    iget-object p1, v4, Lcom/android/quickstep/LauncherBackAnimationController;->mBackCallback:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

    .line 26
    .line 27
    new-instance v0, Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;

    .line 28
    .line 29
    invoke-static {}, LG2/c;->l()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v3, 0x0

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object v1, v3

    .line 38
    :goto_0
    invoke-direct {v0, v4, v1, v3}, Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;-><init>(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/os/Handler;Lcom/android/quickstep/t1;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/SystemUiProxy;->setBackToLauncherCallback(Landroid/window/IOnBackInvokedCallback;Landroid/view/IRemoteAnimationRunner;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public registerComponentCallbacks()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mComponentCallbacks:Landroid/content/ComponentCallbacks;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/app/Activity;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method removeScrimLayer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl$Transaction;->remove(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->applyTransaction()V

    .line 20
    .line 21
    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mScrimLayer:Landroid/view/SurfaceControl;

    .line 24
    .line 25
    return-void
.end method

.method public unregisterBackCallbacks()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackCallback:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackCallback:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->clearBackToLauncherCallback(Landroid/window/IOnBackInvokedCallback;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/window/BackProgressAnimator;->reset()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mBackCallback:Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;

    .line 27
    .line 28
    return-void
.end method

.method public unregisterComponentCallbacks()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController;->mComponentCallbacks:Landroid/content/ComponentCallbacks;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/app/Activity;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
