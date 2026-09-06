.class public Lf2/a;
.super Lcom/android/launcher3/V3;
.source "AllAppsState.java"


# static fields
.field private static final D:I

.field private static final E:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget v0, Lcom/android/launcher3/V3;->f:I

    .line 2
    .line 3
    sget v1, Lcom/android/launcher3/V3;->j:I

    .line 4
    .line 5
    or-int/2addr v0, v1

    .line 6
    sget v1, Lcom/android/launcher3/V3;->l:I

    .line 7
    .line 8
    or-int/2addr v0, v1

    .line 9
    sput v0, Lf2/a;->D:I

    .line 10
    .line 11
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 12
    .line 13
    const-wide/16 v1, 0x5

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    sput-wide v0, Lf2/a;->E:J

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    sget v1, Lf2/a;->D:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/V3;-><init>(III)V

    .line 5
    .line 6
    .line 7
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

.method public static K(Lcom/android/launcher3/C2;)F
    .locals 1

    .line 1
    invoke-static {p0}, Lf2/a;->J(Lcom/android/launcher3/C2;)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/G;->n()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    div-float/2addr v0, p0

    .line 14
    const/high16 p0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    sub-float/2addr p0, v0

    .line 17
    return p0
.end method


# virtual methods
.method protected C(Z)V
    .locals 0

    .line 1
    const/16 p0, 0x59

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public D(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->D(Lcom/android/launcher3/C2;)V

    .line 2
    .line 3
    .line 4
    const/16 p0, 0x59

    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    const/16 v0, 0x59

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->isInstrumenting(I)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->E(Lcom/android/launcher3/C2;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public G(Lcom/android/launcher3/C2;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x59

    .line 6
    .line 7
    sget-wide v2, Lf2/a;->E:J

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;IJ)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->G(Lcom/android/launcher3/C2;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected g(Landroid/content/Context;)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DEVICE_PROFI",
            "LE_CONTEXT:Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TDEVICE_PROFI",
            "LE_CONTEXT;",
            ")F"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->e1()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget p0, p0, Lcom/android/launcher3/h0;->B2:F

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 21
    .line 22
    .line 23
    const/high16 p0, 0x40000000    # 2.0f

    .line 24
    .line 25
    return p0
.end method

.method public bridge synthetic getHistoryForState(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lf2/a;->l(Lcom/android/launcher3/V3;)Lcom/android/launcher3/V3;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Lcom/android/launcher3/h0;->F2:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget p0, p0, Lcom/android/launcher3/h0;->G2:I

    .line 15
    .line 16
    return p0
.end method

.method public h(Lcom/android/launcher3/C2;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getDescription()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j(Lcom/android/launcher3/C2;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget v0, p0, Lcom/android/launcher3/h0;->L2:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->X(Landroid/content/Context;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public k(Lcom/android/launcher3/C2;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget v0, p0, Lcom/android/launcher3/h0;->L2:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->X(Landroid/content/Context;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public l(Lcom/android/launcher3/V3;)Lcom/android/launcher3/V3;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 9
    .line 10
    if-ne p1, p0, :cond_1

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    return-object p0
.end method

.method public m(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lf2/a;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()I
    .locals 0

    .line 1
    const p0, 0x7f14006e

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public s(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    const/16 p0, 0x82

    .line 2
    .line 3
    return p0
.end method

.method public v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;

    .line 2
    .line 3
    .line 4
    new-instance p1, Lf2/a$a;

    .line 5
    .line 6
    sget-object v0, LJ0/h;->L:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    invoke-direct {p1, p0, v0}, Lf2/a$a;-><init>(Lf2/a;Landroid/view/animation/Interpolator;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    new-instance p0, Lcom/android/launcher3/V3$h;

    .line 15
    .line 16
    invoke-direct {p0, v0, v1, v1}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance p0, Lcom/android/launcher3/V3$h;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {p1, v2}, Lcom/android/quickstep/util/LayoutUtils;->getDefaultSwipeHeight(Landroid/content/Context;Lcom/android/launcher3/h0;)F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    neg-float p1, p1

    .line 31
    const/high16 v2, 0x3f000000    # 0.5f

    .line 32
    .line 33
    mul-float/2addr p1, v2

    .line 34
    invoke-direct {p0, v0, v1, p1}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method
