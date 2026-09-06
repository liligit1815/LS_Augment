.class public Lf2/d;
.super Lcom/android/launcher3/V3;
.source "OverviewState.java"


# static fields
.field protected static final D:Landroid/graphics/Rect;

.field private static final E:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lf2/d;->D:Landroid/graphics/Rect;

    .line 7
    .line 8
    sget v0, Lcom/android/launcher3/V3;->g:I

    .line 9
    .line 10
    or-int/lit8 v0, v0, 0x2

    .line 11
    .line 12
    sget v1, Lcom/android/launcher3/V3;->k:I

    .line 13
    .line 14
    or-int/2addr v0, v1

    .line 15
    sget v1, Lcom/android/launcher3/V3;->f:I

    .line 16
    .line 17
    or-int/2addr v0, v1

    .line 18
    sget v1, Lcom/android/launcher3/V3;->j:I

    .line 19
    .line 20
    or-int/2addr v0, v1

    .line 21
    sput v0, Lf2/d;->E:I

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    sget v0, Lf2/d;->E:I

    invoke-direct {p0, p1, v0}, Lf2/d;-><init>(II)V

    return-void
.end method

.method protected constructor <init>(II)V
    .locals 1

    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, p1, v0, p2}, Lf2/d;-><init>(III)V

    return-void
.end method

.method protected constructor <init>(III)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/V3;-><init>(III)V

    return-void
.end method

.method public static J(Lcom/android/launcher3/C2;)F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lcom/android/quickstep/util/LayoutUtils;->getDefaultSwipeHeight(Landroid/content/Context;Lcom/android/launcher3/h0;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static K(I)Lf2/d;
    .locals 1

    .line 1
    new-instance v0, Lf2/b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lf2/b;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static L(I)Lf2/d;
    .locals 1

    .line 1
    new-instance v0, Lf2/c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lf2/c;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static M(I)Lf2/d;
    .locals 1

    .line 1
    new-instance v0, Lf2/i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lf2/i;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static N(I)Lf2/d;
    .locals 1

    .line 1
    new-instance v0, Lf2/e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lf2/e;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public A(Lcom/android/launcher3/C2;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public E(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->launchWithAnimation()Lcom/android/launcher3/util/Y1;

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->E(Lcom/android/launcher3/C2;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public detachDesktopCarousel()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method protected g(Landroid/content/Context;)F
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const-string v2, "ro.launcher.depth.overview"

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    return p1

    .line 21
    :cond_1
    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    return p1
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    const/16 p0, 0xfa

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-boolean p1, p1, Lcom/android/launcher3/util/C1;->g:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/16 p0, 0x17c

    .line 18
    .line 19
    :cond_0
    return p0
.end method

.method public h(Lcom/android/launcher3/C2;)Ljava/lang/String;
    .locals 0

    .line 1
    const p0, 0x7f140033

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public i(Lcom/android/launcher3/C2;)I
    .locals 1

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/V3;->c(Lcom/android/launcher3/C2;I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->i(Lcom/android/launcher3/C2;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public p(Lcom/android/launcher3/C2;)[F
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    return-object p0

    .line 8
    nop

    .line 9
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public q(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->isSplitSelectionActive()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectTranslation()F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    const p0, 0x7f140033

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public showExplodedDesktopView()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->H0:Z

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-boolean p0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 11
    .line 12
    xor-int/2addr p0, v2

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V3;->B(Lcom/android/launcher3/C2;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v2, 0x0

    .line 26
    :cond_2
    :goto_0
    move p0, v2

    .line 27
    :goto_1
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/16 p0, 0x198

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_3
    const/16 p0, 0x118

    .line 33
    .line 34
    :goto_2
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->isSplitSelectionActive()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_4

    .line 39
    .line 40
    and-int/lit16 p0, p0, -0x111

    .line 41
    .line 42
    :cond_4
    return p0
.end method

.method public v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;
    .locals 1

    .line 1
    new-instance p1, Lf2/d$a;

    .line 2
    .line 3
    sget-object v0, LJ0/h;->L:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    invoke-direct {p1, p0, v0}, Lf2/d$a;-><init>(Lf2/d;Landroid/view/animation/Interpolator;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    sget-object v0, Lf2/d;->D:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getTaskSize(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 17
    .line 18
    new-instance p0, Lcom/android/launcher3/V3$h;

    .line 19
    .line 20
    invoke-static {p1}, Lf2/d;->J(Lcom/android/launcher3/C2;)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    neg-float p1, p1

    .line 25
    const/high16 v0, 0x3f000000    # 0.5f

    .line 26
    .line 27
    mul-float/2addr p1, v0

    .line 28
    const v0, 0x3f6b851f    # 0.92f

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0, v0, v1, p1}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 33
    .line 34
    .line 35
    return-object p0
.end method

.method public y(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/H5$g;->a()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Lx1/O;->G0(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {}, Lx1/O;->c0()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/16 p1, 0x33

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/16 p1, 0x4c

    .line 33
    .line 34
    :goto_0
    invoke-static {p0, p1}, Ls1/q;->h(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method
