.class public Lf2/c;
.super Lf2/d;
.source "OverviewModalTaskState.java"


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
    sput v0, Lf2/c;->F:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    sget v1, Lf2/c;->F:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Lf2/d;-><init>(III)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static O(Lcom/android/quickstep/views/RecentsView;)[F
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getSelectedTaskBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->getModalTaskSize(Landroid/graphics/Rect;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    int-to-float p0, p0

    .line 18
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    int-to-float v2, v2

    .line 23
    div-float/2addr p0, v2

    .line 24
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-float v1, v1

    .line 29
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    int-to-float v0, v0

    .line 34
    div-float/2addr v1, v0

    .line 35
    invoke-static {p0, v1}, Ljava/lang/Math;->min(FF)F

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/4 v0, 0x2

    .line 40
    new-array v0, v0, [F

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    aput p0, v0, v1

    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    const/4 v1, 0x1

    .line 47
    aput p0, v0, v1

    .line 48
    .line 49
    return-object v0
.end method


# virtual methods
.method public B(Lcom/android/launcher3/C2;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/V3;->B(Lcom/android/launcher3/C2;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public E(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    const/16 p0, 0x12c

    .line 2
    .line 3
    return p0
.end method

.method public o()F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public p(Lcom/android/launcher3/C2;)[F
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Lf2/d;->p(Lcom/android/launcher3/C2;)[F

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 17
    .line 18
    invoke-static {p0}, Lf2/c;->O(Lcom/android/quickstep/views/RecentsView;)[F

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public t(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    const/16 p0, 0x8

    .line 2
    .line 3
    return p0
.end method
