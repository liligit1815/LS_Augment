.class public Lcom/android/quickstep/views/FloatingWidgetView;
.super Landroid/widget/FrameLayout;
.source "FloatingWidgetView.java"

# interfaces
.implements Lcom/android/launcher3/anim/T;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Lcom/android/launcher3/views/J;
.implements Lcom/android/quickstep/util/RectFSpringAnim$OnDelayedAnimatorListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1f
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;
    }
.end annotation


# static fields
.field protected static final TAG:Ljava/lang/String; = "FloatingWidgetView"

.field public static final WIDGET_DELAYED_START_FACTOR:I = 0x2

.field private static final sTmpMatrix:Landroid/graphics/Matrix;


# instance fields
.field private mAppTargetIsTranslucent:Z

.field private mAppWidgetBackgroundView:Landroid/view/View;

.field private mAppWidgetView:Lcom/android/launcher3/widget/T;

.field private final mBackgroundOffset:Landroid/graphics/RectF;

.field private mBackgroundPosition:Landroid/graphics/RectF;

.field private mBackgroundPositionRound:Landroid/graphics/Rect;

.field private final mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

.field private mCornerRadius:F

.field private mDelayedFinishRunnable:Ljava/lang/Runnable;

.field private mEndRunnable:Ljava/lang/Runnable;

.field private mFactor:F

.field private mFastFinishRunnable:Ljava/lang/Runnable;

.field private mForegroundOverlayView:Landroid/view/GhostView;

.field private mIconOffsetY:F

.field private final mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final mListenerView:Lcom/android/launcher3/views/K;

.field private mOnTargetChangeRunnable:Ljava/lang/Runnable;

.field private mWindowAnimListener:Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/views/FloatingWidgetView;->sTmpMatrix:Landroid/graphics/Matrix;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/FloatingWidgetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/views/FloatingWidgetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundOffset:Landroid/graphics/RectF;

    .line 5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPositionRound:Landroid/graphics/Rect;

    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    iput v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mFactor:F

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->w5(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    move-result-object v1

    iput-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    new-instance v1, Lcom/android/launcher3/views/K;

    invoke-direct {v1, p1, p2}, Lcom/android/launcher3/views/K;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mListenerView:Lcom/android/launcher3/views/K;

    .line 10
    new-instance v1, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    invoke-direct {v1, p1, p2, p3}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 11
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mWindowAnimListener:Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/FloatingWidgetView;Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/FloatingWidgetView;->lambda$init$0(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/views/FloatingWidgetView;Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/FloatingWidgetView;->lambda$finish$1(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/views/FloatingWidgetView;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/views/FloatingWidgetView;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPositionRound:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/views/FloatingWidgetView;)Lcom/android/quickstep/views/FloatingWidgetBackgroundView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/views/FloatingWidgetView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method private finish(Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetHostView;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/view/GhostView;->removeGhost(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getOverlay()Landroid/view/ViewGroupOverlay;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/view/ViewGroupOverlay;->clear()V

    .line 18
    .line 19
    .line 20
    const-string v0, "FloatingWidgetView"

    .line 21
    .line 22
    const-string v1, "finish removeGhost mAppWidgetView"

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/view/ViewGroup;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 37
    .line 38
    new-instance v1, Lcom/android/quickstep/views/k;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/views/k;-><init>(Lcom/android/quickstep/views/FloatingWidgetView;Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->finish()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/android/launcher3/widget/T;->G()V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->recycle()V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const v0, 0x7f0e00da

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method static bridge synthetic g(Lcom/android/quickstep/views/FloatingWidgetView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mEndRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getDefaultBackgroundColor(Landroid/content/Context;Landroid/view/RemoteAnimationTarget;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/F2;->i(Landroid/content/Context;)I

    move-result p0

    if-nez p1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    if-nez p1, :cond_1

    :goto_0
    return p0

    .line 3
    :cond_1
    iget-object p0, p1, Landroid/app/TaskInfo;->taskDescription:Landroid/app/ActivityManager$TaskDescription;

    invoke-virtual {p0}, Landroid/app/ActivityManager$TaskDescription;->getBackgroundColor()I

    move-result p0

    return p0
.end method

.method public static getDefaultBackgroundColor(Landroid/content/Context;Lu2/s;)I
    .locals 0

    if-eqz p1, :cond_0

    .line 4
    iget-object p1, p1, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    if-eqz p1, :cond_0

    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskDescription:Landroid/app/ActivityManager$TaskDescription;

    if-eqz p1, :cond_0

    .line 5
    invoke-virtual {p1}, Landroid/app/ActivityManager$TaskDescription;->getBackgroundColor()I

    move-result p0

    return p0

    .line 6
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/util/F2;->i(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method private getDelayedAnimator()Landroid/animation/ValueAnimator;
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/android/quickstep/views/FloatingWidgetView$2;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/FloatingWidgetView$2;-><init>(Lcom/android/quickstep/views/FloatingWidgetView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/android/quickstep/views/FloatingWidgetView$3;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/FloatingWidgetView$3;-><init>(Lcom/android/quickstep/views/FloatingWidgetView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 v1, 0x320

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    return-object v0

    .line 33
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static getFloatingWidgetView(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Landroid/util/Size;FZI)Lcom/android/quickstep/views/FloatingWidgetView;
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    move-object v8, v0

    .line 10
    check-cast v8, Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const v2, 0x7f0e00da

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2, p0, v8}, Lcom/android/launcher3/util/X2;->b(ILandroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    move-object v0, p0

    .line 24
    check-cast v0, Lcom/android/quickstep/views/FloatingWidgetView;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/android/quickstep/views/FloatingWidgetView;->recycle()V

    .line 27
    .line 28
    .line 29
    move-object v2, p1

    .line 30
    move-object v3, p2

    .line 31
    move-object v4, p3

    .line 32
    move v5, p4

    .line 33
    move v6, p5

    .line 34
    move v7, p6

    .line 35
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/views/FloatingWidgetView;->init(Lcom/android/launcher3/dragndrop/DragLayer;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Landroid/util/Size;FZI)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v8, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method

.method private static getRelativePosition(Landroid/view/View;Landroid/view/View;Landroid/graphics/RectF;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    const/4 v2, 0x4

    .line 12
    new-array v2, v2, [F

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x0

    .line 16
    aput v3, v2, v4

    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    aput v3, v2, v5

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    aput v0, v2, v3

    .line 23
    .line 24
    const/4 v0, 0x3

    .line 25
    aput v1, v2, v0

    .line 26
    .line 27
    invoke-static {p0, p1, v2, v4, v5}, Lcom/android/launcher3/N5;->n(Landroid/view/View;Landroid/view/View;[FZZ)F

    .line 28
    .line 29
    .line 30
    aget p0, v2, v4

    .line 31
    .line 32
    aget p1, v2, v3

    .line 33
    .line 34
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    aget p1, v2, v5

    .line 39
    .line 40
    aget v1, v2, v0

    .line 41
    .line 42
    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    aget v1, v2, v4

    .line 47
    .line 48
    aget v3, v2, v3

    .line 49
    .line 50
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    aget v3, v2, v5

    .line 55
    .line 56
    aget v0, v2, v0

    .line 57
    .line 58
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p2, p0, p1, v1, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method static bridge synthetic h(Lcom/android/quickstep/views/FloatingWidgetView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/quickstep/views/FloatingWidgetView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mFactor:F

    .line 2
    .line 3
    return-void
.end method

.method private init(Lcom/android/launcher3/dragndrop/DragLayer;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Landroid/util/Size;FZI)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/launcher3/widget/T;->A()V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 7
    .line 8
    iput-boolean p6, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppTargetIsTranslucent:Z

    .line 9
    .line 10
    new-instance p2, Lcom/android/quickstep/views/l;

    .line 11
    .line 12
    invoke-direct {p2, p0, p1}, Lcom/android/quickstep/views/l;-><init>(Lcom/android/quickstep/views/FloatingWidgetView;Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mEndRunnable:Ljava/lang/Runnable;

    .line 16
    .line 17
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 18
    .line 19
    invoke-static {p2}, Lcom/android/launcher3/widget/I0;->e(Landroid/view/View;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 24
    .line 25
    if-nez p2, :cond_0

    .line 26
    .line 27
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 28
    .line 29
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 30
    .line 31
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 32
    .line 33
    iget-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-static {p2, p1, p3}, Lcom/android/quickstep/views/FloatingWidgetView;->getRelativePosition(Landroid/view/View;Landroid/view/View;Landroid/graphics/RectF;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 39
    .line 40
    iget-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 41
    .line 42
    iget-object p6, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundOffset:Landroid/graphics/RectF;

    .line 43
    .line 44
    invoke-static {p2, p3, p6}, Lcom/android/quickstep/views/FloatingWidgetView;->getRelativePosition(Landroid/view/View;Landroid/view/View;Landroid/graphics/RectF;)V

    .line 45
    .line 46
    .line 47
    iget-boolean p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppTargetIsTranslucent:Z

    .line 48
    .line 49
    if-nez p2, :cond_1

    .line 50
    .line 51
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 52
    .line 53
    iget-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 54
    .line 55
    iget-object p6, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {p2, p3, p6, p5, p7}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->init(Lcom/android/launcher3/widget/T;Landroid/view/View;FI)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p4}, Landroid/util/Size;->getWidth()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-virtual {p4}, Landroid/util/Size;->getHeight()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    const/4 p4, 0x0

    .line 69
    invoke-virtual {p0, p4, p4, p2, p3}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 73
    .line 74
    invoke-static {p2, p0}, Landroid/view/GhostView;->addGhost(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/GhostView;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mForegroundOverlayView:Landroid/view/GhostView;

    .line 79
    .line 80
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->positionViews()Z

    .line 81
    .line 82
    .line 83
    :cond_1
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mListenerView:Lcom/android/launcher3/views/K;

    .line 84
    .line 85
    new-instance p3, Lcom/android/quickstep/views/m;

    .line 86
    .line 87
    invoke-direct {p3, p0}, Lcom/android/quickstep/views/m;-><init>(Lcom/android/quickstep/views/FloatingWidgetView;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, p3}, Lcom/android/launcher3/views/K;->setListener(Ljava/lang/Runnable;)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mListenerView:Lcom/android/launcher3/views/K;

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    new-instance p1, Lcom/android/quickstep/views/FloatingWidgetView$1;

    .line 99
    .line 100
    invoke-direct {p1, p0}, Lcom/android/quickstep/views/FloatingWidgetView$1;-><init>(Lcom/android/quickstep/views/FloatingWidgetView;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 104
    .line 105
    .line 106
    const/4 p1, 0x1

    .line 107
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 108
    .line 109
    .line 110
    const/4 p1, 0x0

    .line 111
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    new-instance p1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string p2, "init: mAppWidgetBackgroundView "

    .line 123
    .line 124
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 128
    .line 129
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    const-string p1, "FloatingWidgetView"

    .line 137
    .line 138
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method private isUninitialized()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mForegroundOverlayView:Landroid/view/GhostView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic lambda$finish$1(Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mListenerView:Lcom/android/launcher3/views/K;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$init$0(Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/FloatingWidgetView;->finish(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private positionViews()Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    if-nez v2, :cond_2

    .line 17
    .line 18
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 19
    .line 20
    if-nez v2, :cond_2

    .line 21
    .line 22
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 23
    .line 24
    if-nez v2, :cond_2

    .line 25
    .line 26
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v0, v1

    .line 32
    goto :goto_1

    .line 33
    :cond_2
    :goto_0
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    move v0, v3

    .line 40
    :goto_1
    iget-object v2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 41
    .line 42
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 43
    .line 44
    iget v4, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mIconOffsetY:F

    .line 45
    .line 46
    add-float/2addr v2, v4

    .line 47
    iget-object v4, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 48
    .line 49
    invoke-virtual {v4}, Landroid/view/View;->getTranslationX()F

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    iget-object v5, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 54
    .line 55
    iget v5, v5, Landroid/graphics/RectF;->left:F

    .line 56
    .line 57
    cmpl-float v4, v4, v5

    .line 58
    .line 59
    if-nez v4, :cond_3

    .line 60
    .line 61
    iget-object v4, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    cmpl-float v4, v4, v2

    .line 68
    .line 69
    if-eqz v4, :cond_4

    .line 70
    .line 71
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 72
    .line 73
    iget-object v4, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 74
    .line 75
    iget v4, v4, Landroid/graphics/RectF;->left:F

    .line 76
    .line 77
    invoke-virtual {v0, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 83
    .line 84
    .line 85
    move v0, v3

    .line 86
    :cond_4
    iget-object v2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 87
    .line 88
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 93
    .line 94
    iget v4, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 95
    .line 96
    if-nez v4, :cond_5

    .line 97
    .line 98
    iget v4, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 99
    .line 100
    if-nez v4, :cond_5

    .line 101
    .line 102
    iget v4, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 103
    .line 104
    iget-object v5, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 105
    .line 106
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    if-ne v4, v5, :cond_5

    .line 115
    .line 116
    iget v4, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 117
    .line 118
    iget-object v5, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 119
    .line 120
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-eq v4, v5, :cond_6

    .line 129
    .line 130
    :cond_5
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 131
    .line 132
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 133
    .line 134
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 135
    .line 136
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 145
    .line 146
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 147
    .line 148
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 157
    .line 158
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 159
    .line 160
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 161
    .line 162
    .line 163
    move v0, v3

    .line 164
    :cond_6
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mForegroundOverlayView:Landroid/view/GhostView;

    .line 165
    .line 166
    if-eqz v1, :cond_7

    .line 167
    .line 168
    sget-object v1, Lcom/android/quickstep/views/FloatingWidgetView;->sTmpMatrix:Landroid/graphics/Matrix;

    .line 169
    .line 170
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 171
    .line 172
    .line 173
    iget v2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mFactor:F

    .line 174
    .line 175
    iget-object v4, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 176
    .line 177
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    iget-object v5, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 182
    .line 183
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    int-to-float v5, v5

    .line 188
    div-float/2addr v4, v5

    .line 189
    iget-object v5, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 190
    .line 191
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    iget-object v6, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 196
    .line 197
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    .line 198
    .line 199
    .line 200
    move-result v6

    .line 201
    int-to-float v6, v6

    .line 202
    div-float/2addr v5, v6

    .line 203
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    .line 204
    .line 205
    .line 206
    move-result v4

    .line 207
    mul-float/2addr v2, v4

    .line 208
    iget-object v4, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundOffset:Landroid/graphics/RectF;

    .line 209
    .line 210
    iget v4, v4, Landroid/graphics/RectF;->left:F

    .line 211
    .line 212
    neg-float v4, v4

    .line 213
    iget-object v5, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 214
    .line 215
    invoke-virtual {v5}, Landroid/appwidget/AppWidgetHostView;->getLeft()I

    .line 216
    .line 217
    .line 218
    move-result v5

    .line 219
    int-to-float v5, v5

    .line 220
    sub-float/2addr v4, v5

    .line 221
    iget-object v5, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundOffset:Landroid/graphics/RectF;

    .line 222
    .line 223
    iget v5, v5, Landroid/graphics/RectF;->top:F

    .line 224
    .line 225
    neg-float v5, v5

    .line 226
    iget-object v6, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 227
    .line 228
    invoke-virtual {v6}, Landroid/appwidget/AppWidgetHostView;->getTop()I

    .line 229
    .line 230
    .line 231
    move-result v6

    .line 232
    int-to-float v6, v6

    .line 233
    sub-float/2addr v5, v6

    .line 234
    invoke-virtual {v1, v4, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v1, v2, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 238
    .line 239
    .line 240
    iget-object v4, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 241
    .line 242
    iget v5, v4, Landroid/graphics/RectF;->left:F

    .line 243
    .line 244
    iget v4, v4, Landroid/graphics/RectF;->top:F

    .line 245
    .line 246
    iget v6, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mIconOffsetY:F

    .line 247
    .line 248
    add-float/2addr v4, v6

    .line 249
    invoke-virtual {v1, v5, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 250
    .line 251
    .line 252
    iget-object v4, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 253
    .line 254
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    iget-object v5, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 259
    .line 260
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    .line 261
    .line 262
    .line 263
    move-result v5

    .line 264
    int-to-float v5, v5

    .line 265
    mul-float/2addr v5, v2

    .line 266
    sub-float/2addr v4, v5

    .line 267
    const/high16 v5, 0x40000000    # 2.0f

    .line 268
    .line 269
    div-float/2addr v4, v5

    .line 270
    iget-object v6, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 271
    .line 272
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 273
    .line 274
    .line 275
    move-result v6

    .line 276
    iget-object v7, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 277
    .line 278
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    .line 279
    .line 280
    .line 281
    move-result v7

    .line 282
    int-to-float v7, v7

    .line 283
    mul-float/2addr v2, v7

    .line 284
    sub-float/2addr v6, v2

    .line 285
    div-float/2addr v6, v5

    .line 286
    invoke-virtual {v1, v4, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 287
    .line 288
    .line 289
    iget-object v2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mForegroundOverlayView:Landroid/view/GhostView;

    .line 290
    .line 291
    invoke-virtual {v2}, Landroid/view/GhostView;->getAnimationMatrix()Landroid/graphics/Matrix;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result v2

    .line 299
    if-nez v2, :cond_7

    .line 300
    .line 301
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mForegroundOverlayView:Landroid/view/GhostView;

    .line 302
    .line 303
    invoke-virtual {v0, v1}, Landroid/view/GhostView;->setMatrix(Landroid/graphics/Matrix;)V

    .line 304
    .line 305
    .line 306
    goto :goto_2

    .line 307
    :cond_7
    move v3, v0

    .line 308
    :goto_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 309
    .line 310
    .line 311
    return v3
.end method

.method private recycle()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mIconOffsetY:F

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mEndRunnable:Ljava/lang/Runnable;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mFastFinishRunnable:Ljava/lang/Runnable;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mOnTargetChangeRunnable:Ljava/lang/Runnable;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mListenerView:Lcom/android/launcher3/views/K;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/android/launcher3/views/K;->setListener(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mForegroundOverlayView:Landroid/view/GhostView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetBackgroundView:Landroid/view/View;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->recycle()V

    .line 27
    .line 28
    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    iput v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mFactor:F

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 41
    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public fastFinish()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->isUninitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mFastFinishRunnable:Ljava/lang/Runnable;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    iput-object v2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 19
    .line 20
    :cond_1
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mEndRunnable:Ljava/lang/Runnable;

    .line 26
    .line 27
    iput-object v2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mEndRunnable:Ljava/lang/Runnable;

    .line 28
    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 32
    .line 33
    .line 34
    :cond_3
    :goto_0
    return-void
.end method

.method public getAnimatorListener(Z)Lcom/android/launcher3/anim/U;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;-><init>(Lcom/android/quickstep/views/FloatingWidgetView;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mWindowAnimListener:Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;

    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mWindowAnimListener:Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;

    .line 11
    .line 12
    return-object p0
.end method

.method public getBackgroudnLocationOnScreen([I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "FloatingWidgetView"

    .line 10
    .line 11
    const-string p1, "getBackgroudnLocationOnScreen,mBackgroundView is null "

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public getInitialCornerRadius()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->getMaximumRadius()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isAlreadySetDelayedFinishRunnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mEndRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mEndRunnable:Ljava/lang/Runnable;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDelayedAnimationStart()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->getDelayedAnimator()Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onGlobalLayout()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->isUninitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->positionViews()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mOnTargetChangeRunnable:Ljava/lang/Runnable;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public setCornerRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mCornerRadius:F

    .line 2
    .line 3
    return-void
.end method

.method public setDelayedFinishRunnable(Ljava/lang/Runnable;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V
    .locals 1

    .line 1
    sget-boolean v0, Lf1/a;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v0, 0x40000000    # 2.0f

    .line 6
    .line 7
    iput v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mFactor:F

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->getDelayedAnimator()Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2, p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Landroid/animation/Animator;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setFastFinishRunnable(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mFastFinishRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setForegroundOverlayViewVisibility(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mForegroundOverlayView:Landroid/view/GhostView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/GhostView;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "FloatingWidgetView"

    .line 10
    .line 11
    const-string p1, "setForegroundOverlayViewVisibility,mForegroundOverlayView is null "

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setOnTargetChangeListener(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mOnTargetChangeRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setPositionOffsetY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mIconOffsetY:F

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->onGlobalLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public update(Landroid/graphics/RectF;FFFF)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->isUninitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppTargetIsTranslucent:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundView:Lcom/android/quickstep/views/FloatingWidgetBackgroundView;

    .line 16
    .line 17
    invoke-virtual {p2, p5, p4}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->update(FF)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mAppWidgetView:Lcom/android/launcher3/widget/T;

    .line 21
    .line 22
    invoke-virtual {p2, p3}, Landroid/appwidget/AppWidgetHostView;->setAlpha(F)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView;->mBackgroundPosition:Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->positionViews()Z

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method
