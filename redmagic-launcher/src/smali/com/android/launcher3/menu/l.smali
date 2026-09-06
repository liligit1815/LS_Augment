.class public Lcom/android/launcher3/menu/l;
.super Lcom/android/launcher3/V3;
.source "MenuOverviewState.java"


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    const/4 v0, 0x6

    .line 2
    const/4 v1, 0x2

    .line 3
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/V3;-><init>(III)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static J(Lcom/android/launcher3/C2;)F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget v0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    iget p0, p0, Lcom/android/launcher3/h0;->N2:F

    .line 9
    .line 10
    sub-float/2addr v0, p0

    .line 11
    return v0
.end method


# virtual methods
.method public displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    const/16 p0, 0xfa

    .line 2
    .line 3
    return p0
.end method

.method public s(Lcom/android/launcher3/C2;)F
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/l;->t(Lcom/android/launcher3/C2;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/menu/l;->J(Lcom/android/launcher3/C2;)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/G;->n()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    div-float/2addr p0, p1

    .line 27
    const/high16 p1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    sub-float/2addr p1, p0

    .line 30
    return p1
.end method

.method public shouldDisableRestore()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/a;->shouldDisableRestore()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public shouldPreserveDataStateOnReapply()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/a;->shouldPreserveDataStateOnReapply()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public showTaskThumbnailSplash()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/a;->showTaskThumbnailSplash()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 6
    .line 7
    .line 8
    const/16 p0, 0x605

    .line 9
    .line 10
    return p0
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget p0, v0, Lcom/android/launcher3/X3;->O:F

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/V3$h;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1, p1}, Lcom/android/launcher3/X3;->s(Lcom/android/launcher3/C2;)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    int-to-float p1, p1

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-direct {v0, p0, v1, p1}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
