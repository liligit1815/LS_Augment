.class public Lcom/android/launcher3/uioverrides/touchcontrollers/z;
.super Lcom/android/launcher3/touch/d;
.source "QuickSwitchTouchController.java"


# instance fields
.field protected final g:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/touch/H;->x:Lcom/android/launcher3/touch/H$c;

    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/touch/H$c;)V

    return-void
.end method

.method protected constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/touch/H$c;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/touch/d;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/touch/H$c;)V

    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->g:Lcom/android/quickstep/views/RecentsView;

    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/uioverrides/touchcontrollers/z;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->d(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d(Landroid/animation/ValueAnimator;)V
    .locals 0

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
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->f(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private e(LQ1/f;)V
    .locals 3

    .line 1
    sget-object v0, LJ0/h;->L:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-virtual {p1, v1, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 5
    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    invoke-virtual {p1, v1, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v0, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x2

    .line 22
    if-ne p0, v0, :cond_0

    .line 23
    .line 24
    sget-object p0, LJ0/h;->G:Landroid/view/animation/Interpolator;

    .line 25
    .line 26
    invoke-virtual {p1, v2, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v1, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x6

    .line 33
    invoke-virtual {p1, v0, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x8

    .line 37
    .line 38
    invoke-virtual {p1, v0, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 39
    .line 40
    .line 41
    const/16 p0, 0x9

    .line 42
    .line 43
    sget-object v0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    invoke-virtual {p1, p0, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 50
    .line 51
    invoke-virtual {p1, v2, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v1, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private f(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->g:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsView;->setFullscreenProgress(F)V

    .line 4
    .line 5
    .line 6
    const v0, 0x3f59999a    # 0.85f

    .line 7
    .line 8
    .line 9
    cmpl-float p1, p1, v0

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    const/4 v1, 0x0

    .line 13
    if-lez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->g:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getSysUiStatusNavFlags()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method protected canInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    return v0

    .line 19
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    and-int/lit16 p0, p0, 0x100

    .line 24
    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    return v1
.end method

.method protected getShiftRange()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 8
    .line 9
    int-to-float p0, p0

    .line 10
    const/high16 v0, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr p0, v0

    .line 13
    return p0
.end method

.method protected getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;
    .locals 2

    .line 1
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->getLastSystemUiStateFlags()J

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    const-wide/16 v0, 0x80

    .line 16
    .line 17
    and-long/2addr p0, v0

    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    cmp-long p0, p0, v0

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    if-eqz p2, :cond_1

    .line 28
    .line 29
    sget-object p0, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 33
    .line 34
    return-object p0
.end method

.method protected initCurrentAnimation()F
    .locals 5

    .line 1
    new-instance v0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {v0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->e(LQ1/f;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->getShiftRange()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/high16 v2, 0x40000000    # 2.0f

    .line 14
    .line 15
    mul-float/2addr v1, v2

    .line 16
    float-to-long v1, v1

    .line 17
    iput-wide v1, v0, LQ1/f;->g:J

    .line 18
    .line 19
    sget-object v1, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->g:Lcom/android/quickstep/views/RecentsView;

    .line 22
    .line 23
    sget-object v3, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 24
    .line 25
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Lcom/android/launcher3/V3;->p(Lcom/android/launcher3/C2;)[F

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const/4 v4, 0x0

    .line 32
    aget v3, v3, v4

    .line 33
    .line 34
    const v4, 0x3f59999a    # 0.85f

    .line 35
    .line 36
    .line 37
    mul-float/2addr v3, v4

    .line 38
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v1, v2, v3}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 43
    .line 44
    .line 45
    sget-object v1, Lcom/android/quickstep/views/RecentsView;->ADJACENT_PAGE_HORIZONTAL_OFFSET:Landroid/util/FloatProperty;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->g:Lcom/android/quickstep/views/RecentsView;

    .line 48
    .line 49
    const/high16 v3, 0x3f800000    # 1.0f

    .line 50
    .line 51
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v1, v2, v4}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->g:Lcom/android/quickstep/views/RecentsView;

    .line 59
    .line 60
    invoke-virtual {v1, v3}, Lcom/android/quickstep/views/RecentsView;->setContentAlpha(F)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 70
    .line 71
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/statemanager/d;->p(Lcom/android/launcher3/statemanager/a;LQ1/f;)Lcom/android/launcher3/anim/q;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mClearStateOnCancelListener:Landroid/animation/Animator$AnimatorListener;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/y;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/y;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/z;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->getShiftRange()F

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    div-float/2addr v3, p0

    .line 105
    return v3
.end method

.method public onDragStart(ZF)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/touch/d;->onDragStart(ZF)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/android/launcher3/touch/d;->mStartContainerType:I

    .line 6
    .line 7
    const-string p0, "recentapps"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected updateProgress(F)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->updateProgress(F)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->f(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
