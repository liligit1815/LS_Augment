.class public Lcom/android/launcher3/uioverrides/touchcontrollers/v;
.super Ljava/lang/Object;
.source "NoButtonQuickSwitchTouchController.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;
.implements Lcom/android/launcher3/touch/h$a;


# static fields
.field private static final w:Landroid/view/animation/Interpolator;

.field private static final x:Landroid/view/animation/Interpolator;

.field private static final y:Landroid/view/animation/Interpolator;


# instance fields
.field private final g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final h:Lcom/android/launcher3/touch/h;

.field private final i:F

.field private final j:F

.field private final k:F

.field private final l:Lcom/android/quickstep/util/MotionPauseDetector;

.field private final m:F

.field private final n:Lcom/android/quickstep/views/RecentsView;

.field protected final o:Landroid/animation/Animator$AnimatorListener;

.field private p:Z

.field private q:Lcom/android/launcher3/V3;

.field private r:Z

.field private s:Lcom/android/launcher3/anim/q;

.field private t:Lcom/android/launcher3/anim/q;

.field private u:Lcom/android/launcher3/anim/d;

.field private v:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LJ0/h;->N:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->w:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    sget-object v0, LJ0/h;->E:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->x:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->y:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/q;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/q;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Lcom/android/launcher3/G2;->f(Ljava/lang/Runnable;Z)Landroid/animation/Animator$AnimatorListener;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->o:Landroid/animation/Animator$AnimatorListener;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->r:Z

    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/touch/h;

    .line 22
    .line 23
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/touch/h;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/h$a;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 41
    .line 42
    int-to-float v1, v1

    .line 43
    const/high16 v2, 0x40000000    # 2.0f

    .line 44
    .line 45
    div-float/2addr v1, v2

    .line 46
    iput v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->i:F

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSizeStrategy()Lcom/android/quickstep/BaseContainerInterface;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {p1, v1, v2, v0}, Lcom/android/quickstep/util/LayoutUtils;->getShelfTrackingDistance(Landroid/content/Context;Lcom/android/launcher3/h0;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;Lcom/android/quickstep/BaseContainerInterface;)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    int-to-float v0, v0

    .line 65
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->j:F

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 72
    .line 73
    int-to-float v1, v1

    .line 74
    div-float/2addr v1, v0

    .line 75
    iput v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->k:F

    .line 76
    .line 77
    new-instance v0, Lcom/android/quickstep/util/MotionPauseDetector;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 84
    .line 85
    invoke-direct {v0, p1, v1}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;Z)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const v1, 0x7f070852

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->m:F

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->setMFVSpeedSlowSlop()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/uioverrides/touchcontrollers/v;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/uioverrides/touchcontrollers/v;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->o(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/uioverrides/touchcontrollers/v;Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->p(Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)Lcom/android/quickstep/views/RecentsView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/uioverrides/touchcontrollers/v;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->q(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/H4;->b(Landroid/view/MotionEvent;)Z

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
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v2, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 15
    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    and-int/lit16 v0, v0, 0x100

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    return v1

    .line 39
    :cond_2
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->getLastSystemUiStateFlags()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    const-wide/16 v4, 0x80

    .line 54
    .line 55
    and-long/2addr v2, v4

    .line 56
    const-wide/16 v4, 0x0

    .line 57
    .line 58
    cmp-long v0, v2, v4

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    return v1

    .line 63
    :cond_3
    invoke-static {p1}, Lcom/android/launcher3/H4;->c(Landroid/view/MotionEvent;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    invoke-static {p1}, Lcom/android/launcher3/H4;->a(Landroid/view/MotionEvent;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->v:Z

    .line 74
    .line 75
    return p1

    .line 76
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 77
    .line 78
    invoke-static {p1}, LO2/d;->c(Landroid/content/Context;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    const/4 v0, 0x1

    .line 83
    if-eqz p1, :cond_5

    .line 84
    .line 85
    sget-object p1, Landroid/window/DesktopModeFlags;->ENABLE_QUICKSWITCH_DESKTOP_SPLIT_BUGFIX:Landroid/window/DesktopModeFlags;

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_5

    .line 92
    .line 93
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getNonDesktopTaskViewCount()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-ge p0, v0, :cond_5

    .line 100
    .line 101
    return v1

    .line 102
    :cond_5
    return v0
.end method

.method private l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t:Lcom/android/launcher3/anim/q;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->h()V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private m()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t:Lcom/android/launcher3/anim/q;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->r:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/touch/g;->c()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/android/quickstep/views/RecentsView;->setOnEmptyMessageUpdatedListener(Lcom/android/quickstep/views/RecentsView$OnEmptyMessageUpdatedListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 35
    .line 36
    if-ne v0, v1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setTasksTitleHidden(Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method private synthetic n(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->q(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic o(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->f()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic p(Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->k:F

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->setProgress(FF)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private q(Lcom/android/launcher3/V3;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withSrcState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget v1, p1, Lcom/android/launcher3/V3;->b:I

    .line 17
    .line 18
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withDstState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->q:Lcom/android/launcher3/V3;

    .line 23
    .line 24
    iget v2, v1, Lcom/android/launcher3/V3;->b:I

    .line 25
    .line 26
    iget v3, p1, Lcom/android/launcher3/V3;->b:I

    .line 27
    .line 28
    sget-object v4, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 29
    .line 30
    if-ne p1, v4, :cond_0

    .line 31
    .line 32
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->o0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget v5, p1, Lcom/android/launcher3/V3;->a:I

    .line 36
    .line 37
    iget v1, v1, Lcom/android/launcher3/V3;->a:I

    .line 38
    .line 39
    if-le v5, v1, :cond_1

    .line 40
    .line 41
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->h0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->i0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 45
    .line 46
    :goto_0
    invoke-static {v2, v3, v1}, Lcom/android/launcher3/logging/StatsLogManager;->getLauncherAtomEvent(IILcom/android/launcher3/logging/StatsLogManager$d;)Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 51
    .line 52
    .line 53
    if-ne p1, v4, :cond_2

    .line 54
    .line 55
    const/16 v0, 0xb

    .line 56
    .line 57
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 62
    .line 63
    if-ne p1, v0, :cond_3

    .line 64
    .line 65
    const/16 v0, 0x42

    .line 66
    .line 67
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 68
    .line 69
    .line 70
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/q;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/q;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const/4 v2, 0x0

    .line 86
    invoke-virtual {v0, p1, v2, v1}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 87
    .line 88
    .line 89
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 90
    .line 91
    if-ne p1, v0, :cond_7

    .line 92
    .line 93
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 100
    .line 101
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 106
    .line 107
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->g0:Z

    .line 112
    .line 113
    const/4 v3, 0x1

    .line 114
    if-eqz v1, :cond_4

    .line 115
    .line 116
    if-eqz v0, :cond_4

    .line 117
    .line 118
    move v2, v3

    .line 119
    :cond_4
    if-eqz v2, :cond_5

    .line 120
    .line 121
    invoke-virtual {v0, v3}, Lcom/android/launcher3/a;->close(Z)V

    .line 122
    .line 123
    .line 124
    :cond_5
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1}, Lx1/Z;->d()Landroid/util/Pair;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget-object v1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 139
    .line 140
    check-cast v1, Ljava/lang/Integer;

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eq v0, v1, :cond_6

    .line 147
    .line 148
    if-nez v2, :cond_6

    .line 149
    .line 150
    new-instance v0, Lcom/android/launcher3/I1;

    .line 151
    .line 152
    invoke-direct {v0, p1}, Lcom/android/launcher3/I1;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 156
    .line 157
    .line 158
    :cond_6
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 159
    .line 160
    const/4 p1, 0x0

    .line 161
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setContentAlpha(F)V

    .line 162
    .line 163
    .line 164
    :cond_7
    return-void
.end method

.method private r()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/util/V2;

    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/util/V2;->i:Landroid/os/VibrationEffect;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private s()V
    .locals 4

    .line 1
    new-instance v0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {v0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->w:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    const/4 v2, 0x3

    .line 9
    invoke-virtual {v0, v2, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 10
    .line 11
    .line 12
    const/16 v2, 0xa

    .line 13
    .line 14
    invoke-virtual {v0, v2, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v0, v2, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 19
    .line 20
    .line 21
    const/16 v3, 0xd

    .line 22
    .line 23
    invoke-virtual {v0, v3, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 24
    .line 25
    .line 26
    sget-object v1, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->x:Landroid/view/animation/Interpolator;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {v0, v3, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 30
    .line 31
    .line 32
    sget-object v1, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 33
    .line 34
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u(Lcom/android/launcher3/V3;LQ1/f;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {v0, v3, v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->hasTaskViews()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 57
    .line 58
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/t;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/t;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setOnEmptyMessageUpdatedListener(Lcom/android/quickstep/views/RecentsView$OnEmptyMessageUpdatedListener;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 70
    .line 71
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->setTasksTitleHidden(Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private t()V
    .locals 14

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->CONTENT_ALPHA:Landroid/util/FloatProperty;

    .line 16
    .line 17
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-virtual {v2, v5, v6}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 24
    .line 25
    .line 26
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 29
    .line 30
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 31
    .line 32
    invoke-virtual {v1, v6}, Lcom/android/launcher3/V3;->p(Lcom/android/launcher3/C2;)[F

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    aget v6, v6, v4

    .line 37
    .line 38
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    invoke-virtual {v2, v5, v6}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 47
    .line 48
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 49
    .line 50
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 51
    .line 52
    invoke-virtual {v0, v6}, Lcom/android/launcher3/V3;->p(Lcom/android/launcher3/C2;)[F

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    aget v6, v6, v4

    .line 57
    .line 58
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-virtual {v2, v5, v6}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 63
    .line 64
    .line 65
    :goto_0
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->ADJACENT_PAGE_HORIZONTAL_OFFSET:Landroid/util/FloatProperty;

    .line 66
    .line 67
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 68
    .line 69
    const/high16 v6, 0x3f800000    # 1.0f

    .line 70
    .line 71
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    invoke-virtual {v2, v5, v7}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 76
    .line 77
    .line 78
    sget-object v5, Lcom/android/quickstep/views/RecentsView;->TASK_THUMBNAIL_SPLASH_ALPHA:Landroid/util/FloatProperty;

    .line 79
    .line 80
    iget-object v7, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 81
    .line 82
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/a;->showTaskThumbnailSplash()Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-eqz v8, :cond_1

    .line 87
    .line 88
    move v8, v6

    .line 89
    goto :goto_1

    .line 90
    :cond_1
    move v8, v3

    .line 91
    :goto_1
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    invoke-virtual {v5, v7, v8}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 96
    .line 97
    .line 98
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 99
    .line 100
    invoke-virtual {v5, v6}, Lcom/android/quickstep/views/RecentsView;->setContentAlpha(F)V

    .line 101
    .line 102
    .line 103
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/android/launcher3/V3;->n()F

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    invoke-virtual {v5, v7}, Lcom/android/quickstep/views/RecentsView;->setFullscreenProgress(F)V

    .line 110
    .line 111
    .line 112
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 113
    .line 114
    invoke-virtual {v5}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->getActionsView()Lcom/android/quickstep/views/OverviewActionsView;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-virtual {v5}, Lcom/android/quickstep/views/OverviewActionsView;->getVisibilityAlpha()Lcom/android/launcher3/anim/d;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    iget-object v7, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 123
    .line 124
    invoke-virtual {v0, v7}, Lcom/android/launcher3/V3;->t(Lcom/android/launcher3/C2;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    and-int/lit8 v0, v0, 0x8

    .line 129
    .line 130
    if-eqz v0, :cond_2

    .line 131
    .line 132
    move v3, v6

    .line 133
    :cond_2
    invoke-virtual {v5, v3}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 137
    .line 138
    invoke-virtual {v0, v4}, Lcom/android/quickstep/views/RecentsView;->setTaskIconVisible(Z)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 142
    .line 143
    invoke-virtual {v1, v0}, Lcom/android/launcher3/V3;->p(Lcom/android/launcher3/C2;)[F

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v5, Lcom/android/launcher3/anim/V;

    .line 148
    .line 149
    iget v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->i:F

    .line 150
    .line 151
    const/high16 v11, 0x40000000    # 2.0f

    .line 152
    .line 153
    mul-float/2addr v3, v11

    .line 154
    float-to-long v6, v3

    .line 155
    invoke-direct {v5, v6, v7}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 156
    .line 157
    .line 158
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 159
    .line 160
    const/4 v6, 0x1

    .line 161
    aget v6, v0, v6

    .line 162
    .line 163
    sget-object v10, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 164
    .line 165
    invoke-virtual {v5, v3, v2, v6, v10}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 166
    .line 167
    .line 168
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 169
    .line 170
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 175
    .line 176
    invoke-virtual {v1, v3}, Lcom/android/launcher3/V3;->y(Lcom/android/launcher3/C2;)I

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    invoke-virtual {v5, v2, v3, v10}, Lcom/android/launcher3/anim/f;->d(Landroid/view/View;ILandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 181
    .line 182
    .line 183
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 184
    .line 185
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->hasTaskViews()Z

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-nez v2, :cond_3

    .line 190
    .line 191
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 192
    .line 193
    sget-object v7, Lcom/android/quickstep/views/RecentsView;->CONTENT_ALPHA:Landroid/util/FloatProperty;

    .line 194
    .line 195
    const/4 v8, 0x0

    .line 196
    const/high16 v9, 0x3f800000    # 1.0f

    .line 197
    .line 198
    invoke-virtual/range {v5 .. v10}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 199
    .line 200
    .line 201
    :cond_3
    invoke-virtual {v5}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    iput-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t:Lcom/android/launcher3/anim/q;

    .line 206
    .line 207
    invoke-virtual {v2}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 208
    .line 209
    .line 210
    new-instance v2, Lcom/android/launcher3/anim/V;

    .line 211
    .line 212
    iget v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->j:F

    .line 213
    .line 214
    mul-float/2addr v3, v11

    .line 215
    float-to-long v5, v3

    .line 216
    invoke-direct {v2, v5, v6}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 217
    .line 218
    .line 219
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 220
    .line 221
    sget-object v5, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 222
    .line 223
    aget v0, v0, v4

    .line 224
    .line 225
    sget-object v4, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->y:Landroid/view/animation/Interpolator;

    .line 226
    .line 227
    invoke-virtual {v2, v3, v5, v0, v4}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 231
    .line 232
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    if-eqz v0, :cond_4

    .line 237
    .line 238
    :goto_2
    move-object v11, v5

    .line 239
    goto :goto_3

    .line 240
    :cond_4
    new-instance v5, Lcom/android/launcher3/uioverrides/touchcontrollers/v$a;

    .line 241
    .line 242
    const-string v0, "recentsScale"

    .line 243
    .line 244
    invoke-direct {v5, p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v$a;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    goto :goto_2

    .line 248
    :goto_3
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 249
    .line 250
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->FULLSCREEN_PROGRESS:Landroid/util/FloatProperty;

    .line 251
    .line 252
    invoke-virtual {v1}, Lcom/android/launcher3/V3;->n()F

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    invoke-virtual {v2, v0, v3, v1, v4}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 257
    .line 258
    .line 259
    invoke-virtual {v2}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 260
    .line 261
    .line 262
    move-result-object v6

    .line 263
    iget-object v7, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 264
    .line 265
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 266
    .line 267
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 268
    .line 269
    .line 270
    move-result-object v8

    .line 271
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 274
    .line 275
    .line 276
    move-result-object v9

    .line 277
    iget-object v10, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 278
    .line 279
    sget-object v13, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_TRANSLATION:Landroid/util/FloatProperty;

    .line 280
    .line 281
    move-object v12, v10

    .line 282
    invoke-static/range {v6 .. v13}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->createForRecents(Lcom/android/launcher3/anim/q;Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;)Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 287
    .line 288
    new-instance v2, Lcom/android/launcher3/uioverrides/touchcontrollers/u;

    .line 289
    .line 290
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/u;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V

    .line 291
    .line 292
    .line 293
    invoke-direct {v1, v2}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 294
    .line 295
    .line 296
    iput-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 297
    .line 298
    invoke-virtual {v6}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 299
    .line 300
    .line 301
    return-void
.end method

.method private u(Lcom/android/launcher3/V3;LQ1/f;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->i:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->j:F

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    mul-float/2addr v0, v1

    .line 12
    float-to-long v0, v0

    .line 13
    iput-wide v0, p2, LQ1/f;->g:J

    .line 14
    .line 15
    iget v0, p2, LQ1/f;->i:I

    .line 16
    .line 17
    or-int/lit8 v0, v0, 0xa

    .line 18
    .line 19
    iput v0, p2, LQ1/f;->i:I

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/statemanager/d;->p(Lcom/android/launcher3/statemanager/a;LQ1/f;)Lcom/android/launcher3/anim/q;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->o:Landroid/animation/Animator$AnimatorListener;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/PointF;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    iget-object v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 7
    .line 8
    iget v4, v1, Landroid/graphics/PointF;->x:F

    .line 9
    .line 10
    invoke-virtual {v3, v4}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    iget-object v4, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 15
    .line 16
    iget v5, v1, Landroid/graphics/PointF;->y:F

    .line 17
    .line 18
    invoke-virtual {v4, v5}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v5, 0x0

    .line 23
    const/4 v6, 0x1

    .line 24
    if-nez v3, :cond_0

    .line 25
    .line 26
    if-nez v4, :cond_0

    .line 27
    .line 28
    move v7, v6

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v7, v5

    .line 31
    :goto_0
    iget-object v8, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 32
    .line 33
    invoke-virtual {v8}, Lcom/android/quickstep/util/MotionPauseDetector;->isPaused()Z

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    const/16 v9, 0xb

    .line 38
    .line 39
    if-eqz v8, :cond_1

    .line 40
    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    invoke-static {v9}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 44
    .line 45
    .line 46
    new-instance v1, LQ1/f;

    .line 47
    .line 48
    invoke-direct {v1}, LQ1/f;-><init>()V

    .line 49
    .line 50
    .line 51
    const-wide/16 v2, 0x12c

    .line 52
    .line 53
    iput-wide v2, v1, LQ1/f;->g:J

    .line 54
    .line 55
    iget-object v2, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iget-object v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->q:Lcom/android/launcher3/V3;

    .line 62
    .line 63
    sget-object v4, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 64
    .line 65
    invoke-virtual {v2, v3, v4, v1}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    new-instance v3, Lcom/android/launcher3/uioverrides/touchcontrollers/v$b;

    .line 70
    .line 71
    invoke-direct {v3, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v$b;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 78
    .line 79
    .line 80
    iget-object v0, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-wide v1, v1, LQ1/f;->g:J

    .line 87
    .line 88
    invoke-virtual {v0, v4, v1, v2, v6}, Lcom/android/launcher3/statemanager/d;->o(Lcom/android/launcher3/statemanager/a;JI)Lcom/android/launcher3/anim/q;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_1
    const/16 v7, 0x42

    .line 97
    .line 98
    invoke-static {v7}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 99
    .line 100
    .line 101
    invoke-direct {v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l()V

    .line 102
    .line 103
    .line 104
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 105
    .line 106
    invoke-virtual {v7}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    const/high16 v8, 0x3f800000    # 1.0f

    .line 111
    .line 112
    const/4 v10, 0x0

    .line 113
    if-nez v7, :cond_2

    .line 114
    .line 115
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 116
    .line 117
    goto/16 :goto_3

    .line 118
    .line 119
    :cond_2
    if-eqz v3, :cond_6

    .line 120
    .line 121
    if-eqz v4, :cond_6

    .line 122
    .line 123
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 124
    .line 125
    cmpg-float v7, v3, v10

    .line 126
    .line 127
    if-gez v7, :cond_3

    .line 128
    .line 129
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 130
    .line 131
    goto/16 :goto_3

    .line 132
    .line 133
    :cond_3
    iget v7, v1, Landroid/graphics/PointF;->y:F

    .line 134
    .line 135
    cmpl-float v7, v7, v10

    .line 136
    .line 137
    if-lez v7, :cond_4

    .line 138
    .line 139
    sget-object v3, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_4
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    iget v7, v1, Landroid/graphics/PointF;->y:F

    .line 147
    .line 148
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    cmpl-float v3, v3, v7

    .line 153
    .line 154
    if-lez v3, :cond_5

    .line 155
    .line 156
    sget-object v3, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_5
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_6
    if-eqz v3, :cond_8

    .line 163
    .line 164
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 165
    .line 166
    cmpl-float v3, v3, v10

    .line 167
    .line 168
    if-lez v3, :cond_7

    .line 169
    .line 170
    sget-object v3, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_7
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_8
    if-eqz v4, :cond_a

    .line 177
    .line 178
    iget v3, v1, Landroid/graphics/PointF;->y:F

    .line 179
    .line 180
    cmpl-float v3, v3, v10

    .line 181
    .line 182
    if-lez v3, :cond_9

    .line 183
    .line 184
    sget-object v3, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_9
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_a
    iget-object v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t:Lcom/android/launcher3/anim/q;

    .line 191
    .line 192
    invoke-virtual {v3}, Lcom/android/launcher3/anim/q;->o()F

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    const/high16 v7, 0x3f000000    # 0.5f

    .line 197
    .line 198
    cmpl-float v3, v3, v7

    .line 199
    .line 200
    if-lez v3, :cond_b

    .line 201
    .line 202
    move v3, v6

    .line 203
    goto :goto_1

    .line 204
    :cond_b
    move v3, v5

    .line 205
    :goto_1
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 206
    .line 207
    iget v7, v7, Lcom/android/launcher3/anim/d;->d:F

    .line 208
    .line 209
    cmpl-float v7, v7, v8

    .line 210
    .line 211
    if-lez v7, :cond_c

    .line 212
    .line 213
    move v7, v6

    .line 214
    goto :goto_2

    .line 215
    :cond_c
    move v7, v5

    .line 216
    :goto_2
    if-eqz v3, :cond_d

    .line 217
    .line 218
    if-nez v7, :cond_d

    .line 219
    .line 220
    sget-object v3, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 221
    .line 222
    goto :goto_3

    .line 223
    :cond_d
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 224
    .line 225
    :goto_3
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t:Lcom/android/launcher3/anim/q;

    .line 226
    .line 227
    invoke-virtual {v7}, Lcom/android/launcher3/anim/q;->q()F

    .line 228
    .line 229
    .line 230
    move-result v7

    .line 231
    iget v11, v1, Landroid/graphics/PointF;->x:F

    .line 232
    .line 233
    iget-object v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 234
    .line 235
    invoke-static {v12}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 236
    .line 237
    .line 238
    move-result v12

    .line 239
    int-to-float v12, v12

    .line 240
    mul-float/2addr v11, v12

    .line 241
    iget v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->i:F

    .line 242
    .line 243
    div-float/2addr v11, v12

    .line 244
    add-float/2addr v7, v11

    .line 245
    invoke-static {v7, v10, v8}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 246
    .line 247
    .line 248
    move-result v7

    .line 249
    sget-object v11, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 250
    .line 251
    if-ne v3, v11, :cond_e

    .line 252
    .line 253
    move v12, v10

    .line 254
    goto :goto_4

    .line 255
    :cond_e
    move v12, v8

    .line 256
    :goto_4
    iget v13, v1, Landroid/graphics/PointF;->x:F

    .line 257
    .line 258
    sub-float v14, v12, v7

    .line 259
    .line 260
    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    .line 261
    .line 262
    .line 263
    move-result v14

    .line 264
    invoke-static {v13, v14}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 265
    .line 266
    .line 267
    move-result-wide v13

    .line 268
    iget-object v15, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t:Lcom/android/launcher3/anim/q;

    .line 269
    .line 270
    invoke-virtual {v15}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 271
    .line 272
    .line 273
    move-result-object v15

    .line 274
    move/from16 v16, v9

    .line 275
    .line 276
    new-array v9, v2, [F

    .line 277
    .line 278
    aput v7, v9, v5

    .line 279
    .line 280
    aput v12, v9, v6

    .line 281
    .line 282
    invoke-virtual {v15, v9}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v15, v13, v14}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 286
    .line 287
    .line 288
    move-result-object v7

    .line 289
    iget v9, v1, Landroid/graphics/PointF;->x:F

    .line 290
    .line 291
    invoke-static {v9}, LJ0/h;->o(F)Landroid/view/animation/Interpolator;

    .line 292
    .line 293
    .line 294
    move-result-object v9

    .line 295
    invoke-virtual {v7, v9}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 296
    .line 297
    .line 298
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t:Lcom/android/launcher3/anim/q;

    .line 299
    .line 300
    invoke-virtual {v7}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 301
    .line 302
    .line 303
    if-eqz v4, :cond_f

    .line 304
    .line 305
    iget v4, v1, Landroid/graphics/PointF;->y:F

    .line 306
    .line 307
    cmpg-float v4, v4, v10

    .line 308
    .line 309
    if-gez v4, :cond_f

    .line 310
    .line 311
    if-ne v3, v11, :cond_f

    .line 312
    .line 313
    move v4, v6

    .line 314
    goto :goto_5

    .line 315
    :cond_f
    move v4, v5

    .line 316
    :goto_5
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 317
    .line 318
    iget v7, v7, Lcom/android/launcher3/anim/d;->d:F

    .line 319
    .line 320
    iget v9, v1, Landroid/graphics/PointF;->y:F

    .line 321
    .line 322
    iget-object v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 323
    .line 324
    invoke-static {v12}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 325
    .line 326
    .line 327
    move-result v12

    .line 328
    int-to-float v12, v12

    .line 329
    mul-float/2addr v9, v12

    .line 330
    iget v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->j:F

    .line 331
    .line 332
    div-float/2addr v9, v12

    .line 333
    sub-float/2addr v7, v9

    .line 334
    iget v9, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->k:F

    .line 335
    .line 336
    invoke-static {v7, v10, v9}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 337
    .line 338
    .line 339
    move-result v7

    .line 340
    if-eqz v4, :cond_10

    .line 341
    .line 342
    move v9, v8

    .line 343
    goto :goto_6

    .line 344
    :cond_10
    if-ne v3, v11, :cond_11

    .line 345
    .line 346
    move v9, v7

    .line 347
    goto :goto_6

    .line 348
    :cond_11
    move v9, v10

    .line 349
    :goto_6
    sub-float v12, v9, v7

    .line 350
    .line 351
    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    .line 352
    .line 353
    .line 354
    move-result v12

    .line 355
    iget v10, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->j:F

    .line 356
    .line 357
    mul-float/2addr v12, v10

    .line 358
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 359
    .line 360
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    invoke-static {v8, v1}, Ljava/lang/Math;->max(FF)F

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    div-float/2addr v12, v1

    .line 369
    move-object v10, v3

    .line 370
    float-to-long v2, v12

    .line 371
    iget-object v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 372
    .line 373
    invoke-virtual {v12, v7, v9}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 374
    .line 375
    .line 376
    move-result-object v9

    .line 377
    invoke-virtual {v9, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 378
    .line 379
    .line 380
    iget-object v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 381
    .line 382
    invoke-virtual {v12, v7}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 383
    .line 384
    .line 385
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 386
    .line 387
    invoke-virtual {v7}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 388
    .line 389
    .line 390
    move-result-object v7

    .line 391
    if-eqz v4, :cond_12

    .line 392
    .line 393
    iget-boolean v4, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->r:Z

    .line 394
    .line 395
    if-nez v4, :cond_12

    .line 396
    .line 397
    new-instance v1, LQ1/f;

    .line 398
    .line 399
    invoke-direct {v1}, LQ1/f;-><init>()V

    .line 400
    .line 401
    .line 402
    iput v6, v1, LQ1/f;->i:I

    .line 403
    .line 404
    invoke-direct {v0, v10, v1}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u(Lcom/android/launcher3/V3;LQ1/f;)V

    .line 405
    .line 406
    .line 407
    iget-object v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 408
    .line 409
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 410
    .line 411
    .line 412
    move-result-object v7

    .line 413
    iget-object v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 414
    .line 415
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 416
    .line 417
    .line 418
    new-instance v1, Lcom/android/quickstep/util/WorkspaceRevealAnim;

    .line 419
    .line 420
    iget-object v4, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 421
    .line 422
    invoke-direct {v1, v4, v5}, Lcom/android/quickstep/util/WorkspaceRevealAnim;-><init>(Lcom/android/launcher3/C2;Z)V

    .line 423
    .line 424
    .line 425
    invoke-virtual {v1}, Lcom/android/quickstep/util/WorkspaceRevealAnim;->start()V

    .line 426
    .line 427
    .line 428
    goto :goto_8

    .line 429
    :cond_12
    if-ne v10, v11, :cond_13

    .line 430
    .line 431
    move v4, v6

    .line 432
    goto :goto_7

    .line 433
    :cond_13
    move v4, v5

    .line 434
    :goto_7
    if-eqz v4, :cond_14

    .line 435
    .line 436
    iget-object v11, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 437
    .line 438
    invoke-virtual {v11}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 439
    .line 440
    .line 441
    move-result-object v11

    .line 442
    iget-object v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->o:Landroid/animation/Animator$AnimatorListener;

    .line 443
    .line 444
    invoke-virtual {v11, v12}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 445
    .line 446
    .line 447
    iget-object v11, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 448
    .line 449
    invoke-virtual {v11}, Lcom/android/launcher3/anim/q;->i()Lcom/android/launcher3/anim/q;

    .line 450
    .line 451
    .line 452
    :cond_14
    iget-object v11, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 453
    .line 454
    invoke-virtual {v11}, Lcom/android/launcher3/anim/q;->q()F

    .line 455
    .line 456
    .line 457
    move-result v11

    .line 458
    if-eqz v4, :cond_15

    .line 459
    .line 460
    const/4 v8, 0x0

    .line 461
    :cond_15
    const/4 v1, 0x2

    .line 462
    new-array v1, v1, [F

    .line 463
    .line 464
    aput v11, v1, v5

    .line 465
    .line 466
    aput v8, v1, v6

    .line 467
    .line 468
    invoke-virtual {v7, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 469
    .line 470
    .line 471
    iget-object v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 472
    .line 473
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 474
    .line 475
    .line 476
    :goto_8
    sget-object v1, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 477
    .line 478
    if-ne v10, v1, :cond_16

    .line 479
    .line 480
    sget-object v1, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 481
    .line 482
    iget-object v4, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 483
    .line 484
    invoke-virtual {v1, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    move-result-object v1

    .line 488
    check-cast v1, Lcom/android/launcher3/util/V2;

    .line 489
    .line 490
    const v4, 0x3f19999a    # 0.6f

    .line 491
    .line 492
    .line 493
    sget-object v5, Lcom/android/quickstep/views/RecentsView;->SCROLL_VIBRATION_FALLBACK:Landroid/os/VibrationEffect;

    .line 494
    .line 495
    const/16 v6, 0x8

    .line 496
    .line 497
    invoke-virtual {v1, v6, v4, v5}, Lcom/android/launcher3/util/V2;->m(IFLandroid/os/VibrationEffect;)V

    .line 498
    .line 499
    .line 500
    goto :goto_9

    .line 501
    :cond_16
    invoke-static/range {v16 .. v16}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 502
    .line 503
    .line 504
    :goto_9
    invoke-static {v13, v14, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 505
    .line 506
    .line 507
    move-result-wide v1

    .line 508
    invoke-virtual {v7, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 509
    .line 510
    .line 511
    iget-object v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 512
    .line 513
    new-instance v2, Lcom/android/launcher3/uioverrides/touchcontrollers/s;

    .line 514
    .line 515
    invoke-direct {v2, v0, v10}, Lcom/android/launcher3/uioverrides/touchcontrollers/s;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;Lcom/android/launcher3/V3;)V

    .line 516
    .line 517
    .line 518
    invoke-virtual {v1, v2}, Lcom/android/launcher3/anim/q;->v(Ljava/lang/Runnable;)V

    .line 519
    .line 520
    .line 521
    invoke-virtual {v15}, Landroid/animation/ValueAnimator;->start()V

    .line 522
    .line 523
    .line 524
    invoke-virtual {v9}, Landroid/animation/ValueAnimator;->start()V

    .line 525
    .line 526
    .line 527
    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->start()V

    .line 528
    .line 529
    .line 530
    return-void
.end method

.method public b(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->v:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/MotionPauseDetector;->setIsTrackpadGesture(Z)V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    const/16 v0, 0xb

    .line 18
    .line 19
    invoke-static {p1, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 23
    .line 24
    const/16 v0, 0x42

    .line 25
    .line 26
    const-string v1, "Home"

    .line 27
    .line 28
    invoke-static {p1, v0, v1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/android/launcher3/V3;

    .line 42
    .line 43
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->q:Lcom/android/launcher3/V3;

    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 46
    .line 47
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/r;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/r;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->setOnMotionPauseListener(Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 56
    .line 57
    const/4 v0, 0x3

    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/touch/h;->u(IZ)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s()V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public c(Landroid/graphics/PointF;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->i:F

    .line 9
    .line 10
    div-float/2addr v0, v2

    .line 11
    iget v2, p1, Landroid/graphics/PointF;->y:F

    .line 12
    .line 13
    neg-float v2, v2

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->j:F

    .line 19
    .line 20
    div-float/2addr v1, v2

    .line 21
    const/high16 v2, 0x3e800000    # 0.25f

    .line 22
    .line 23
    const/high16 v3, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->r:Z

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->s:Lcom/android/launcher3/anim/q;

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 38
    .line 39
    .line 40
    :cond_0
    sget-object v2, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->w:Landroid/view/animation/Interpolator;

    .line 41
    .line 42
    invoke-interface {v2, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    const v3, 0x3f7d70a4    # 0.99f

    .line 47
    .line 48
    .line 49
    cmpg-float v2, v2, v3

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    const/4 v4, 0x1

    .line 53
    if-gtz v2, :cond_1

    .line 54
    .line 55
    move v2, v4

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    move v2, v3

    .line 58
    :goto_0
    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->r:Z

    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 61
    .line 62
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 63
    .line 64
    neg-float p1, p1

    .line 65
    iget v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->m:F

    .line 66
    .line 67
    cmpg-float p1, p1, v5

    .line 68
    .line 69
    if-ltz p1, :cond_2

    .line 70
    .line 71
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->n:Lcom/android/quickstep/views/RecentsView;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_3

    .line 78
    .line 79
    :cond_2
    move v3, v4

    .line 80
    :cond_3
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/MotionPauseDetector;->setDisallowPause(Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->l:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/MotionPauseDetector;->addPosition(Landroid/view/MotionEvent;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->t:Lcom/android/launcher3/anim/q;

    .line 89
    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 93
    .line 94
    .line 95
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->u:Lcom/android/launcher3/anim/d;

    .line 96
    .line 97
    if-eqz p0, :cond_5

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 100
    .line 101
    .line 102
    :cond_5
    return v4
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->k(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    xor-int/lit8 v2, v0, 0x1

    .line 13
    .line 14
    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->p:Z

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/touch/h;->u(IZ)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v2, "onControllerInterceptTouchEvent state: "

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/touch/g;->f()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, "-"

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/android/launcher3/touch/g;->i()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v2, "NoButtonQuickSwitchTouchController"

    .line 63
    .line 64
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->p:Z

    .line 68
    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 72
    .line 73
    sget-object v2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 74
    .line 75
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    return p0

    .line 92
    :cond_3
    :goto_0
    return v1
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->h:Lcom/android/launcher3/touch/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
