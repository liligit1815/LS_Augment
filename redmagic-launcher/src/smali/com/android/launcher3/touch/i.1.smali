.class public Lcom/android/launcher3/touch/i;
.super Ljava/lang/Object;
.source "DefaultPagedViewHandler.java"

# interfaces
.implements Lcom/android/launcher3/touch/G;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public calculateDoubleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public calculateDoubleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public calculateMultiGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;IF)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public calculateMultiGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;IF)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public calculateSingleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public calculateSingleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public calculateWindowRadiusToHome(Landroid/graphics/RectF;FF)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    mul-float/2addr p0, p3

    .line 6
    div-float/2addr p0, p2

    .line 7
    return p0
.end method

.method public getCenterForPage(Landroid/view/View;Landroid/graphics/Rect;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p0, v0

    .line 10
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 11
    .line 12
    add-int/2addr p0, p2

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    sub-int/2addr p0, p1

    .line 18
    div-int/lit8 p0, p0, 0x2

    .line 19
    .line 20
    return p0
.end method

.method public getChildBounds(Landroid/view/View;IIZ)Lcom/android/launcher3/touch/G$a;
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int v0, p2, p0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    div-int/lit8 v2, v1, 0x2

    .line 12
    .line 13
    sub-int/2addr p3, v2

    .line 14
    add-int v2, p3, v1

    .line 15
    .line 16
    if-eqz p4, :cond_2

    .line 17
    .line 18
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 19
    .line 20
    .line 21
    move-result-object p4

    .line 22
    invoke-virtual {p4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 23
    .line 24
    .line 25
    move-result p4

    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz p4, :cond_0

    .line 28
    .line 29
    instance-of p4, p1, Lcom/android/launcher3/CellLayout;

    .line 30
    .line 31
    if-eqz p4, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    instance-of p4, p4, Lcom/android/launcher3/Workspace;

    .line 38
    .line 39
    if-eqz p4, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    check-cast p3, Landroid/view/ViewGroup;

    .line 46
    .line 47
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    move p3, v3

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 54
    .line 55
    .line 56
    move-result p4

    .line 57
    if-eqz p4, :cond_1

    .line 58
    .line 59
    instance-of p4, p1, Lcom/android/launcher3/CellLayout;

    .line 60
    .line 61
    if-eqz p4, :cond_1

    .line 62
    .line 63
    move-object p4, p1

    .line 64
    check-cast p4, Lcom/android/launcher3/CellLayout;

    .line 65
    .line 66
    invoke-virtual {p4}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    if-eqz v4, :cond_1

    .line 71
    .line 72
    invoke-virtual {p4}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 73
    .line 74
    .line 75
    move-result-object p4

    .line 76
    invoke-virtual {p4}, Lcom/android/launcher3/K5;->k()Z

    .line 77
    .line 78
    .line 79
    move-result p4

    .line 80
    if-eqz p4, :cond_1

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Landroid/view/ViewGroup;

    .line 87
    .line 88
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    check-cast p2, Landroid/view/ViewGroup;

    .line 97
    .line 98
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    move p2, v3

    .line 103
    move p3, p2

    .line 104
    :cond_1
    :goto_0
    invoke-virtual {p1, p2, p3, v0, v2}, Landroid/view/View;->layout(IIII)V

    .line 105
    .line 106
    .line 107
    :cond_2
    new-instance p1, Lcom/android/launcher3/touch/G$a;

    .line 108
    .line 109
    invoke-direct {p1, p0, v1, v0, p3}, Lcom/android/launcher3/touch/G$a;-><init>(IIII)V

    .line 110
    .line 111
    .line 112
    return-object p1
.end method

.method public getChildStart(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getMeasuredSize(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPrimaryDirection(Landroid/view/MotionEvent;I)F
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPrimaryScale(Landroid/view/View;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPrimaryScroll(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPrimaryValue(FF)F
    .locals 0

    .line 1
    return p1
.end method

.method public getPrimaryValue(II)I
    .locals 0

    .line 2
    return p1
.end method

.method public getPrimaryVelocity(Landroid/view/VelocityTracker;I)F
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getRecentsRtlSetting(Landroid/content/res/Resources;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public getScrollOffsetEnd(Landroid/view/View;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p0, p1

    .line 10
    iget p1, p2, Landroid/graphics/Rect;->right:I

    .line 11
    .line 12
    sub-int/2addr p0, p1

    .line 13
    return p0
.end method

.method public getScrollOffsetStart(Landroid/view/View;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    add-int/2addr p0, p1

    .line 8
    return p0
.end method

.method public getSecondaryDirection(Landroid/view/MotionEvent;I)F
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getSecondaryValue(FF)F
    .locals 0

    .line 1
    return p2
.end method

.method public getSecondaryValue(II)I
    .locals 0

    .line 2
    return p2
.end method

.method public setMaxScroll(Landroid/view/accessibility/AccessibilityEvent;I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/accessibility/AccessibilityEvent;->setMaxScrollX(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/android/launcher3/touch/G$b<",
            "TT;>;F)V"
        }
    .end annotation

    const/4 p0, 0x0

    .line 2
    invoke-interface {p2, p1, p3, p0}, Lcom/android/launcher3/touch/G$b;->a(Ljava/lang/Object;FF)V

    return-void
.end method

.method public setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/android/launcher3/touch/G$c<",
            "TT;>;I)V"
        }
    .end annotation

    const/4 p0, 0x0

    .line 1
    invoke-interface {p2, p1, p3, p0}, Lcom/android/launcher3/touch/G$c;->a(Ljava/lang/Object;II)V

    return-void
.end method
