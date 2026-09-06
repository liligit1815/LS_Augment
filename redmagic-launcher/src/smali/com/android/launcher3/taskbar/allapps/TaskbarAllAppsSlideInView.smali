.class public Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;
.super Lcom/android/launcher3/views/f;
.source "TaskbarAllAppsSlideInView.java"

# interfaces
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/X3$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/views/f<",
        "La2/a;",
        ">;",
        "Lcom/android/launcher3/g1;",
        "Lcom/android/launcher3/X3$b;"
    }
.end annotation


# instance fields
.field private final E:Landroid/os/Handler;

.field private final F:I

.field private G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

.field private H:F

.field private I:I

.field private J:Ljava/lang/Runnable;

.field private K:Lcom/android/launcher3/taskbar/allapps/l$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/views/f;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->E:Landroid/os/Handler;

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0706ce

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->F:I

    return-void
.end method

.method public static synthetic o0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->x0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;ZLandroid/view/animation/Interpolator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->w0(ZLandroid/view/animation/Interpolator;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic r0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->E:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic s0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->J:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method private setShiftRange(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->H:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic t0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->J:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic u0(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->z0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w0(ZLandroid/view/animation/Interpolator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    sub-float/2addr p1, p3

    .line 15
    :goto_0
    iget p3, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->F:I

    .line 16
    .line 17
    int-to-float p3, p3

    .line 18
    invoke-interface {p2, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    mul-float/2addr p3, p1

    .line 23
    float-to-int p1, p3

    .line 24
    iput p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->I:I

    .line 25
    .line 26
    return-void
.end method

.method private synthetic x0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/allapps/l$a;->f(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private z0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/allapps/l$a;->g(Z)V

    .line 5
    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Lcom/android/launcher3/taskbar/allapps/l$a;->f(Z)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->setTranslationShift(F)V

    .line 16
    .line 17
    .line 18
    iget p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->F:I

    .line 19
    .line 20
    iput p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->I:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/allapps/l$a;->c()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    int-to-long v0, p1

    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/views/f;->k0(J)Lcom/android/launcher3/anim/q;

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Lcom/android/launcher3/taskbar/allapps/g;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/allapps/g;-><init>(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method protected X(Landroid/content/Context;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, La2/a;

    .line 4
    .line 5
    invoke-virtual {p0}, La2/a;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->e1()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const p0, 0x7f040061

    .line 16
    .line 17
    .line 18
    invoke-static {p1, p0}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->b()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const p0, 0x7f040062

    .line 30
    .line 31
    .line 32
    invoke-static {p1, p0}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const p1, 0x7f06085e

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0
.end method

.method protected Z(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getVisibleContainerView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method protected d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/allapps/l$a;->f(Z)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/views/f;->d0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getBottomOffsetPx()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-interface {v0, p1, v1}, Lcom/android/launcher3/views/ScrimView$a;->c(Landroid/graphics/Canvas;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 11
    .line 12
    check-cast v0, La2/a;

    .line 13
    .line 14
    invoke-virtual {v0}, La2/a;->o()La2/e;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget v1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->I:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, La2/e;->t(I)V

    .line 21
    .line 22
    .line 23
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected e0(Lcom/android/launcher3/anim/V;)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/f;->q:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 12
    .line 13
    check-cast v1, La2/a;

    .line 14
    .line 15
    invoke-virtual {v1}, La2/a;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->H0:Z

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    sget-object v1, Lcom/android/launcher3/touch/e;->B:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    invoke-static {v1}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 33
    .line 34
    const/high16 v3, 0x3f800000    # 1.0f

    .line 35
    .line 36
    iget v4, p0, Lcom/android/launcher3/views/f;->q:F

    .line 37
    .line 38
    sub-float/2addr v3, v4

    .line 39
    invoke-virtual {p1, v2, v3, v1}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    :cond_2
    invoke-static {}, Lcom/android/launcher3/y0;->b()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_4

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_3
    sget-object v1, LJ0/h;->y:Landroid/view/animation/Interpolator;

    .line 54
    .line 55
    :goto_2
    new-instance v2, Lcom/android/launcher3/taskbar/allapps/f;

    .line 56
    .line 57
    invoke-direct {v2, p0, v0, v1}, Lcom/android/launcher3/taskbar/allapps/f;-><init>(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;ZLandroid/view/animation/Interpolator;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v2}, Lcom/android/launcher3/anim/f;->i(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 64
    .line 65
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/taskbar/allapps/l$a;->e(Lcom/android/launcher3/anim/V;Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method protected f0()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/f;->f0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/android/launcher3/views/f;->w:Z

    .line 7
    .line 8
    xor-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setClipChildren(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-boolean p0, p0, Lcom/android/launcher3/views/f;->w:Z

    .line 20
    .line 21
    xor-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method getAppsView()Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getIdleInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getScrimInterpolator()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, La2/a;

    .line 4
    .line 5
    invoke-virtual {v0}, La2/a;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-super {p0}, Lcom/android/launcher3/views/f;->getScrimInterpolator()Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget p0, p0, Lcom/android/launcher3/views/f;->q:F

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    cmpl-float p0, p0, v0

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Lcom/android/launcher3/touch/e;->z:Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    sget-object p0, Lcom/android/launcher3/touch/e;->z:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method protected getShiftRange()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->H:F

    .line 2
    .line 3
    return p0
.end method

.method protected handleClose(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->J:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->E:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->J:Ljava/lang/Runnable;

    .line 12
    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/allapps/l$a;->g(Z)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/allapps/l$a;->b()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    int-to-long v0, v0

    .line 30
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x40000

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public n0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/l$a;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, La2/a;

    .line 7
    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/views/f;->A:Landroid/view/ViewOutlineProvider;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->findOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-interface {v0, v1, p0}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public onBackInvoked()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/allapps/l$a;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/taskbar/allapps/e;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/allapps/e;-><init>(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/a;->onBackInvoked()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/allapps/r;->z0(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 16
    .line 17
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 18
    .line 19
    const v1, 0x7ff8febf

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 32
    :goto_1
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 33
    .line 34
    :cond_2
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, La2/a;

    .line 7
    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->findOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-interface {v0, p0}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iget p1, p1, Lcom/android/launcher3/h0;->D2:I

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->setShiftRange(F)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->setTranslationShift(F)V

    .line 9
    .line 10
    .line 11
    iget p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->F:I

    .line 12
    .line 13
    iput p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->I:I

    .line 14
    .line 15
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b00e7

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 16
    .line 17
    check-cast v0, La2/a;

    .line 18
    .line 19
    invoke-virtual {v0}, La2/a;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->H0:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 36
    .line 37
    new-instance v1, Lcom/android/launcher3/taskbar/allapps/d;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/allapps/d;-><init>(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;->setOnInvalidateHeaderListener(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView$a;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 46
    .line 47
    check-cast v0, La2/a;

    .line 48
    .line 49
    invoke-virtual {v0}, La2/a;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v0, v0, Lcom/android/launcher3/h0;->D2:I

    .line 54
    .line 55
    int-to-float v0, v0

    .line 56
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->setShiftRange(F)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->setTranslationShift(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->G:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/r;->setInsets(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method v0(Lcom/android/launcher3/taskbar/allapps/l$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;->K:Lcom/android/launcher3/taskbar/allapps/l$a;

    .line 2
    .line 3
    return-void
.end method

.method y0(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView$a;-><init>(Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->T()V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method
