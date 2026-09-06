.class public abstract LO0/d;
.super LO/a;
.source "DragAndDropAccessibilityDelegate.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnHoverListener;


# instance fields
.field protected final A:Lcom/android/launcher3/views/k;

.field protected final B:LO0/r;

.field protected final C:Lcom/android/launcher3/views/BaseDragLayer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/views/BaseDragLayer<",
            "*>;"
        }
    .end annotation
.end field

.field protected final w:Landroid/graphics/Rect;

.field protected final x:[I

.field protected final y:Lcom/android/launcher3/CellLayout;

.field protected final z:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/CellLayout;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, LO/a;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LO0/d;->w:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, LO0/d;->x:[I

    .line 15
    .line 16
    iput-object p1, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, LO0/d;->z:Landroid/content/Context;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 29
    .line 30
    iput-object p1, p0, LO0/d;->A:Lcom/android/launcher3/views/k;

    .line 31
    .line 32
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, LO0/r;

    .line 37
    .line 38
    iput-object v0, p0, LO0/d;->B:LO0/r;

    .line 39
    .line 40
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, LO0/d;->C:Lcom/android/launcher3/views/BaseDragLayer;

    .line 45
    .line 46
    return-void
.end method

.method private Z(I)Landroid/graphics/Rect;
    .locals 7

    .line 1
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    rem-int v2, p1, v0

    .line 8
    .line 9
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    div-int v3, p1, v0

    .line 16
    .line 17
    iget-object p1, p0, LO0/d;->B:LO0/r;

    .line 18
    .line 19
    invoke-virtual {p1}, LO0/c;->c()LO0/c$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v1, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    iget-object p1, p1, LO0/c$a;->b:Lcom/android/launcher3/model/data/y;

    .line 26
    .line 27
    iget v4, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 28
    .line 29
    iget v5, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 30
    .line 31
    iget-object v6, p0, LO0/d;->w:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, LO0/d;->w:Landroid/graphics/Rect;

    .line 37
    .line 38
    return-object p0
.end method


# virtual methods
.method public C(FF)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-ltz v1, :cond_1

    .line 5
    .line 6
    cmpg-float v0, p2, v0

    .line 7
    .line 8
    if-ltz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    cmpl-float v0, p1, v0

    .line 18
    .line 19
    if-gtz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    cmpl-float v0, p2, v0

    .line 29
    .line 30
    if-lez v0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 34
    .line 35
    float-to-int p1, p1

    .line 36
    float-to-int p2, p2

    .line 37
    iget-object v1, p0, LO0/d;->x:[I

    .line 38
    .line 39
    invoke-virtual {v0, p1, p2, v1}, Lcom/android/launcher3/CellLayout;->o0(II[I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, LO0/d;->x:[I

    .line 43
    .line 44
    const/4 p2, 0x0

    .line 45
    aget p2, p1, p2

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    aget p1, p1, v0

    .line 49
    .line 50
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    mul-int/2addr p1, v0

    .line 57
    add-int/2addr p2, p1

    .line 58
    invoke-virtual {p0, p2}, LO0/d;->b0(I)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    return p0

    .line 63
    :cond_1
    :goto_0
    const/high16 p0, -0x80000000

    .line 64
    .line 65
    return p0
.end method

.method public D(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    mul-int/2addr v0, v1

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v1}, LO0/d;->b0(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-ne v2, v1, :cond_0

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public K(IILandroid/os/Bundle;)Z
    .locals 1

    .line 1
    const/16 p3, 0x10

    .line 2
    .line 3
    if-ne p2, p3, :cond_0

    .line 4
    .line 5
    const/high16 p2, -0x80000000

    .line 6
    .line 7
    if-eq p1, p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, LO0/d;->X(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object p3, p0, LO0/d;->B:LO0/r;

    .line 14
    .line 15
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    invoke-direct {p0, p1}, LO0/d;->Z(I)Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p3, v0, p0, p2}, LO0/c;->e(Landroid/view/View;Landroid/graphics/Rect;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method protected M(ILandroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    .line 1
    const/high16 v0, -0x80000000

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, LO0/d;->z:Landroid/content/Context;

    .line 6
    .line 7
    const p1, 0x7f14003f

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p2, p0}, Landroid/view/accessibility/AccessibilityEvent;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 19
    .line 20
    const-string p1, "Invalid virtual view id"

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0
.end method

.method public O(ILK/d;)V
    .locals 5

    .line 1
    const/high16 v0, -0x80000000

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, LO0/d;->a0(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2, v0}, LK/d;->m0(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1}, LO0/d;->Z(I)Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p2, p1}, LK/d;->e0(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, LO0/d;->x:[I

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    const/4 v2, 0x0

    .line 23
    aput v2, v0, v1

    .line 24
    .line 25
    aput v2, v0, v2

    .line 26
    .line 27
    iget-object v3, p0, LO0/d;->C:Lcom/android/launcher3/views/BaseDragLayer;

    .line 28
    .line 29
    iget-object v4, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 30
    .line 31
    invoke-virtual {v3, v4, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v3, p0, LO0/d;->w:Landroid/graphics/Rect;

    .line 36
    .line 37
    iget-object p0, p0, LO0/d;->x:[I

    .line 38
    .line 39
    aget v2, p0, v2

    .line 40
    .line 41
    iget v4, p1, Landroid/graphics/Rect;->left:I

    .line 42
    .line 43
    int-to-float v4, v4

    .line 44
    mul-float/2addr v4, v0

    .line 45
    float-to-int v4, v4

    .line 46
    add-int/2addr v4, v2

    .line 47
    iput v4, v3, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    iget v4, p1, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    int-to-float v4, v4

    .line 52
    mul-float/2addr v4, v0

    .line 53
    float-to-int v4, v4

    .line 54
    add-int/2addr v2, v4

    .line 55
    iput v2, v3, Landroid/graphics/Rect;->right:I

    .line 56
    .line 57
    aget p0, p0, v1

    .line 58
    .line 59
    iget v2, p1, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    int-to-float v2, v2

    .line 62
    mul-float/2addr v2, v0

    .line 63
    float-to-int v2, v2

    .line 64
    add-int/2addr v2, p0

    .line 65
    iput v2, v3, Landroid/graphics/Rect;->top:I

    .line 66
    .line 67
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    int-to-float p1, p1

    .line 70
    mul-float/2addr p1, v0

    .line 71
    float-to-int p1, p1

    .line 72
    add-int/2addr p0, p1

    .line 73
    iput p0, v3, Landroid/graphics/Rect;->bottom:I

    .line 74
    .line 75
    invoke-virtual {p2, v3}, LK/d;->f0(Landroid/graphics/Rect;)V

    .line 76
    .line 77
    .line 78
    const/16 p0, 0x10

    .line 79
    .line 80
    invoke-virtual {p2, p0}, LK/d;->a(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, v1}, LK/d;->j0(Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v1}, LK/d;->q0(Z)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 91
    .line 92
    const-string p1, "Invalid virtual view id"

    .line 93
    .line 94
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p0
.end method

.method protected abstract X(I)Ljava/lang/String;
.end method

.method public Y()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method protected abstract a0(I)Ljava/lang/String;
.end method

.method protected abstract b0(I)I
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, LO/a;->A()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/16 v0, 0x10

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, p1, v0, v1}, LO0/d;->K(IILandroid/os/Bundle;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, LO/a;->v(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
