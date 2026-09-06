.class public Lf2/b;
.super Lf2/d;
.source "BackgroundAppState.java"


# static fields
.field private static final F:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Lcom/android/launcher3/V3;->k:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    sget v1, Lcom/android/launcher3/V3;->f:I

    .line 6
    .line 7
    or-int/2addr v0, v1

    .line 8
    or-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    sget v1, Lcom/android/launcher3/V3;->j:I

    .line 11
    .line 12
    or-int/2addr v0, v1

    .line 13
    sput v0, Lf2/b;->F:I

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, p1, v0}, Lf2/b;-><init>(II)V

    return-void
.end method

.method protected constructor <init>(II)V
    .locals 1

    .line 2
    sget v0, Lf2/b;->F:I

    invoke-direct {p0, p1, p2, v0}, Lf2/d;-><init>(III)V

    return-void
.end method

.method public static O(Lcom/android/quickstep/views/RecentsView;)[F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getMaxScaleForFullScreen()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aput p0, v0, v1

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    aput p0, v0, v1

    .line 14
    .line 15
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

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public detachDesktopCarousel()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected g(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Z0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 14
    .line 15
    .line 16
    const/high16 p0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    return p0
.end method

.method public n()F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public p(Lcom/android/launcher3/C2;)[F
    .locals 0

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
    invoke-static {p0}, Lf2/b;->O(Lcom/android/quickstep/views/RecentsView;)[F

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public s(Lcom/android/launcher3/C2;)F
    .locals 3

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
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSizeStrategy()Lcom/android/quickstep/BaseContainerInterface;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {p1, v1, v2, v0}, Lcom/android/quickstep/util/LayoutUtils;->getShelfTrackingDistance(Landroid/content/Context;Lcom/android/launcher3/h0;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;Lcom/android/quickstep/BaseContainerInterface;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/G;->n()F

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/high16 v2, 0x3f800000    # 1.0f

    .line 47
    .line 48
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    int-to-float v0, v0

    .line 53
    div-float/2addr v0, v1

    .line 54
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    add-float/2addr p0, v0

    .line 59
    return p0
.end method

.method public showExplodedDesktopView()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public showTaskThumbnailSplash()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lf2/d;->t(Lcom/android/launcher3/C2;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    and-int/lit16 p0, p0, -0x11d

    .line 6
    .line 7
    return p0
.end method

.method public y(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
