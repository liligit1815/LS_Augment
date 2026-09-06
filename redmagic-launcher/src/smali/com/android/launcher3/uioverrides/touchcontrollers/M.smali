.class public Lcom/android/launcher3/uioverrides/touchcontrollers/M;
.super Lcom/android/launcher3/touch/d;
.source "TwoButtonNavbarTouchController.java"


# instance fields
.field private final g:Z

.field private h:Z

.field private i:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/touch/H;->x:Lcom/android/launcher3/touch/H$c;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 15
    .line 16
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/touch/d;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/touch/H$c;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->i:I

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->g:Z

    .line 31
    .line 32
    return-void
.end method

.method private c(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-boolean p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->h:Z

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return v1

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    return v2

    .line 28
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    and-int/lit16 p1, p1, 0x100

    .line 33
    .line 34
    if-nez p1, :cond_3

    .line 35
    .line 36
    return v2

    .line 37
    :cond_3
    iget-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->g:Z

    .line 38
    .line 39
    if-nez p1, :cond_4

    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 44
    .line 45
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    return v1

    .line 52
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 53
    .line 54
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 55
    .line 56
    invoke-interface {p0, p1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method


# virtual methods
.method protected canInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->c(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->i:I

    .line 9
    .line 10
    :cond_0
    return p1
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
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lcom/android/quickstep/util/LayoutUtils;->getDefaultSwipeHeight(Landroid/content/Context;Lcom/android/launcher3/h0;)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method protected getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->S0()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-ne p0, p2, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/android/launcher3/V3;->u:Lcom/android/launcher3/V3;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    move-object p1, p0

    .line 28
    :cond_2
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 29
    .line 30
    if-ne p1, p0, :cond_3

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    goto :goto_0

    .line 34
    :cond_3
    const/4 p0, 0x0

    .line 35
    :goto_0
    xor-int/2addr p0, p2

    .line 36
    if-eqz p0, :cond_4

    .line 37
    .line 38
    sget-object p0, Lcom/android/launcher3/V3;->u:Lcom/android/launcher3/V3;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_4
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 42
    .line 43
    return-object p0
.end method

.method protected initCurrentAnimation()F
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->getShiftRange()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    mul-float/2addr v1, v0

    .line 8
    float-to-long v1, v1

    .line 9
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 16
    .line 17
    invoke-virtual {v3, v4, v1, v2}, Lcom/android/launcher3/statemanager/d;->n(Lcom/android/launcher3/statemanager/a;J)Lcom/android/launcher3/anim/q;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->S0()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p0, -0x1

    .line 38
    :goto_0
    int-to-float p0, p0

    .line 39
    div-float/2addr p0, v0

    .line 40
    return p0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected onReinitToState(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onReinitToState(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->g:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->i:I

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->i:I

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 15
    .line 16
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    if-ne v0, v2, :cond_1

    .line 19
    .line 20
    sget-object v0, Lcom/android/launcher3/V3;->u:Lcom/android/launcher3/V3;

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 33
    .line 34
    const-string v0, "2BtnNavbarTouchCtrl"

    .line 35
    .line 36
    invoke-virtual {p1, v1, v0}, Lcom/android/quickstep/SystemUiProxy;->onOverviewShown(ZLjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    if-ne p1, v2, :cond_2

    .line 41
    .line 42
    iget p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->i:I

    .line 43
    .line 44
    const/4 v0, 0x3

    .line 45
    if-lt p1, v0, :cond_2

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->i:I

    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    const/16 v0, 0x200

    .line 53
    .line 54
    invoke-static {p1, v0}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView;->show(Lcom/android/launcher3/C2;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 66
    iput-object p1, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 67
    .line 68
    return-void
.end method

.method protected updateProgress(F)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->updateProgress(F)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    cmpl-float p1, p1, v0

    .line 7
    .line 8
    if-ltz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/V3;->u:Lcom/android/launcher3/V3;

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    const/4 v7, 0x0

    .line 21
    const/4 v8, 0x0

    .line 22
    const/4 v5, 0x1

    .line 23
    const/4 v6, 0x0

    .line 24
    move-wide v3, v1

    .line 25
    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method protected updateSwipeCompleteAnimation(Landroid/animation/ValueAnimator;JLcom/android/launcher3/V3;FZ)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p6}, Lcom/android/launcher3/touch/d;->updateSwipeCompleteAnimation(Landroid/animation/ValueAnimator;JLcom/android/launcher3/V3;FZ)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->g:Z

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 9
    .line 10
    sget-object p3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    if-ne p2, p3, :cond_0

    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p2, 0x0

    .line 17
    :goto_0
    iput-boolean p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;->h:Z

    .line 18
    .line 19
    sget-object p0, Lcom/android/launcher3/V3;->u:Lcom/android/launcher3/V3;

    .line 20
    .line 21
    if-ne p4, p0, :cond_1

    .line 22
    .line 23
    const-wide/16 p2, 0x0

    .line 24
    .line 25
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method
