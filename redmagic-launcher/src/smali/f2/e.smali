.class public Lf2/e;
.super Lf2/b;
.source "QuickSwitchState.java"


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lf2/b;-><init>(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public A(Lcom/android/launcher3/C2;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public B(Lcom/android/launcher3/C2;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->q3:Z

    .line 6
    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method protected g(Landroid/content/Context;)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public s(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/G;->n()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, p1}, Lf2/e;->s(Lcom/android/launcher3/C2;)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    sub-float/2addr p0, p1

    .line 20
    mul-float/2addr p0, v0

    .line 21
    new-instance p1, Lcom/android/launcher3/V3$h;

    .line 22
    .line 23
    const v0, 0x3f666666    # 0.9f

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-direct {p1, v0, v1, p0}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 28
    .line 29
    .line 30
    return-object p1
.end method

.method public y(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Z0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->q3:Z

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const p0, 0x7f0607e2

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/app/Activity;->getColor(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const p0, 0x7f04052d

    .line 26
    .line 27
    .line 28
    invoke-static {p1, p0}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method
