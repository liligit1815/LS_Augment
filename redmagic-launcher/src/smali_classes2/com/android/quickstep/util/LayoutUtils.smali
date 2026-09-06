.class public Lcom/android/quickstep/util/LayoutUtils;
.super Ljava/lang/Object;
.source "LayoutUtils.java"


# static fields
.field private static final SQUARE_ASPECT_RATIO_TOLERANCE:F = 0.05f

.field private static final TAG:Ljava/lang/String; = "LayoutUtils"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getDefaultSwipeHeight(Landroid/content/Context;Lcom/android/launcher3/h0;)F
    .locals 2

    .line 1
    iget v0, p1, Lcom/android/launcher3/h0;->H2:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p1, Lcom/android/launcher3/h0;->N2:F

    .line 5
    .line 6
    sub-float/2addr v0, v1

    .line 7
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v1, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 12
    .line 13
    if-ne p0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 20
    .line 21
    int-to-float p0, p0

    .line 22
    sub-float/2addr v0, p0

    .line 23
    :cond_0
    return v0
.end method

.method public static getShelfTrackingDistance(Landroid/content/Context;Lcom/android/launcher3/h0;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;Lcom/android/quickstep/BaseContainerInterface;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/h0;",
            "Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;",
            "Lcom/android/quickstep/BaseContainerInterface<",
            "**>;)I"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3, p0, p1, v0, p2}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p2, p1, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDistanceToBottomOfRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static isAspectRatioSquare(F)Z
    .locals 1

    .line 1
    const v0, 0x3f733333    # 0.95f

    .line 2
    .line 3
    .line 4
    invoke-static {p0, v0}, Ljava/lang/Float;->compare(FF)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-ltz v0, :cond_0

    .line 9
    .line 10
    const v0, 0x3f866666    # 1.05f

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0}, Ljava/lang/Float;->compare(FF)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-gtz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static setViewEnabled(Landroid/view/View;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    move-object v1, p0

    .line 10
    check-cast v1, Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-ge v0, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1, p1}, Lcom/android/quickstep/util/LayoutUtils;->setViewEnabled(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method
