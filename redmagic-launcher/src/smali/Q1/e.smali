.class public LQ1/e;
.super Lcom/android/launcher3/V3;
.source "SpringLoadedState.java"


# static fields
.field private static final D:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Lcom/android/launcher3/V3;->e:I

    .line 2
    .line 3
    sget v1, Lcom/android/launcher3/V3;->f:I

    .line 4
    .line 5
    or-int/2addr v0, v1

    .line 6
    or-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    sget v1, Lcom/android/launcher3/V3;->g:I

    .line 9
    .line 10
    or-int/2addr v0, v1

    .line 11
    sget v1, Lcom/android/launcher3/V3;->h:I

    .line 12
    .line 13
    or-int/2addr v0, v1

    .line 14
    sput v0, LQ1/e;->D:I

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    sget v1, LQ1/e;->D:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/V3;-><init>(III)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method protected g(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const p0, 0x3e19999a    # 0.15f

    .line 8
    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    const/high16 p0, 0x3f000000    # 0.5f

    .line 12
    .line 13
    return p0
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    const/16 p0, 0x96

    .line 2
    .line 3
    return p0
.end method

.method public m(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 1

    .line 1
    new-instance p0, Lcom/android/launcher3/V3$h;

    .line 2
    .line 3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, v0, v0}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public u(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    const p0, 0x3e4ccccd    # 0.2f

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 4

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
    move-result v2

    .line 13
    if-nez v2, :cond_0

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
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->h0()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v0, p1}, Lcom/android/launcher3/h0;->N0(Landroid/content/Context;)F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    div-int/lit8 v0, v0, 0x2

    .line 33
    .line 34
    int-to-float v0, v0

    .line 35
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    int-to-float v2, v2

    .line 40
    add-float/2addr v2, v0

    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-virtual {v1, v3}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    int-to-float v1, v1

    .line 51
    sub-float/2addr v0, v1

    .line 52
    mul-float/2addr v0, p1

    .line 53
    sub-float/2addr v2, v0

    .line 54
    new-instance v0, Lcom/android/launcher3/V3$h;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    sub-float/2addr p0, v2

    .line 58
    invoke-direct {v0, p1, v1, p0}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method
