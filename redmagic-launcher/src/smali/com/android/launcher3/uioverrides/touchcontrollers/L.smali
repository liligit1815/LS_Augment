.class public Lcom/android/launcher3/uioverrides/touchcontrollers/L;
.super Lcom/android/launcher3/uioverrides/touchcontrollers/z;
.source "TransposedQuickSwitchTouchController.java"


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/touch/H$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
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
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->S0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/2addr p2, v0

    .line 12
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method protected initCurrentAnimation()F
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;->initCurrentAnimation()F

    .line 2
    .line 3
    .line 4
    move-result v0

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
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    neg-float p0, v0

    .line 19
    return p0
.end method
