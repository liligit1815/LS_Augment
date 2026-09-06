.class public Lcom/android/launcher3/taskbar/c4;
.super Ljava/lang/Object;
.source "TaskbarThresholdUtils.java"


# direct methods
.method public static a(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I
    .locals 2

    .line 1
    const v0, 0x7f070b6b

    .line 2
    .line 3
    .line 4
    const v1, 0x7f070b6c

    .line 5
    .line 6
    .line 7
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/c4;->e(Landroid/content/res/Resources;Lcom/android/launcher3/h0;II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static b(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I
    .locals 2

    .line 1
    const v0, 0x7f070b76

    .line 2
    .line 3
    .line 4
    const v1, 0x7f070b77

    .line 5
    .line 6
    .line 7
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/c4;->e(Landroid/content/res/Resources;Lcom/android/launcher3/h0;II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static c(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I
    .locals 2

    .line 1
    const v0, 0x7f070b93

    .line 2
    .line 3
    .line 4
    const v1, 0x7f070ba4

    .line 5
    .line 6
    .line 7
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/c4;->e(Landroid/content/res/Resources;Lcom/android/launcher3/h0;II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static d(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I
    .locals 2

    .line 1
    const v0, 0x7f070b95

    .line 2
    .line 3
    .line 4
    const v1, 0x7f070b96

    .line 5
    .line 6
    .line 7
    invoke-static {p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/c4;->e(Landroid/content/res/Resources;Lcom/android/launcher3/h0;II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static e(Landroid/content/res/Resources;Lcom/android/launcher3/h0;II)I
    .locals 0

    .line 1
    iget-boolean p2, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 6
    .line 7
    :goto_0
    int-to-float p1, p1

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :goto_1
    const p2, 0x3c4ccccd    # 0.0125f

    .line 13
    .line 14
    .line 15
    mul-float/2addr p1, p2

    .line 16
    sget p2, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/android/launcher3/N5;->j(FI)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-static {p1}, Lcom/android/launcher3/N5;->i(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    int-to-float p1, p1

    .line 27
    invoke-static {p0, p3}, LA/h;->g(Landroid/content/res/Resources;I)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    mul-float/2addr p1, p0

    .line 32
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method
