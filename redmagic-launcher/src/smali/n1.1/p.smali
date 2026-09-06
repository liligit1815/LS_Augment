.class public Ln1/p;
.super Ljava/lang/Object;
.source "IconPalette.java"


# direct methods
.method public static a(Landroid/content/Context;I)I
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    aget p1, v0, p1

    .line 9
    .line 10
    const v1, 0x3e4ccccd    # 0.2f

    .line 11
    .line 12
    .line 13
    cmpg-float p1, p1, v1

    .line 14
    .line 15
    if-gez p1, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/launcher3/util/F2;->h(Landroid/content/Context;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const p0, 0x3f19999a    # 0.6f

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x2

    .line 26
    aget v1, v0, p1

    .line 27
    .line 28
    invoke-static {p0, v1}, Ljava/lang/Math;->max(FF)F

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    aput p0, v0, p1

    .line 33
    .line 34
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method
