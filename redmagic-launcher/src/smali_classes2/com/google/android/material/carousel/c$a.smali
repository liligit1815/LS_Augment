.class Lcom/google/android/material/carousel/c$a;
.super Lcom/google/android/material/carousel/c;
.source "CarouselOrientationHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/carousel/c;->d(Lcom/google/android/material/carousel/CarouselLayoutManager;)Lcom/google/android/material/carousel/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Lcom/google/android/material/carousel/CarouselLayoutManager;


# direct methods
.method constructor <init>(ILcom/google/android/material/carousel/CarouselLayoutManager;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/material/carousel/c$a;->b:Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/carousel/c;-><init>(ILcom/google/android/material/carousel/c$a;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    iget p0, p2, Landroid/graphics/RectF;->top:F

    .line 2
    .line 3
    iget v0, p3, Landroid/graphics/RectF;->top:F

    .line 4
    .line 5
    cmpg-float v1, p0, v0

    .line 6
    .line 7
    if-gez v1, :cond_0

    .line 8
    .line 9
    iget v1, p2, Landroid/graphics/RectF;->bottom:F

    .line 10
    .line 11
    cmpl-float v1, v1, v0

    .line 12
    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    sub-float/2addr v0, p0

    .line 16
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 17
    .line 18
    add-float/2addr p0, v0

    .line 19
    iput p0, p1, Landroid/graphics/RectF;->top:F

    .line 20
    .line 21
    iget p0, p3, Landroid/graphics/RectF;->top:F

    .line 22
    .line 23
    add-float/2addr p0, v0

    .line 24
    iput p0, p3, Landroid/graphics/RectF;->top:F

    .line 25
    .line 26
    :cond_0
    iget p0, p2, Landroid/graphics/RectF;->bottom:F

    .line 27
    .line 28
    iget p3, p3, Landroid/graphics/RectF;->bottom:F

    .line 29
    .line 30
    cmpl-float v0, p0, p3

    .line 31
    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    iget v0, p2, Landroid/graphics/RectF;->top:F

    .line 35
    .line 36
    cmpg-float v0, v0, p3

    .line 37
    .line 38
    if-gez v0, :cond_1

    .line 39
    .line 40
    sub-float/2addr p0, p3

    .line 41
    iget p3, p1, Landroid/graphics/RectF;->bottom:F

    .line 42
    .line 43
    sub-float/2addr p3, p0

    .line 44
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 45
    .line 46
    invoke-static {p3, v0}, Ljava/lang/Math;->max(FF)F

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    iput p3, p1, Landroid/graphics/RectF;->bottom:F

    .line 51
    .line 52
    iget p1, p2, Landroid/graphics/RectF;->bottom:F

    .line 53
    .line 54
    sub-float/2addr p1, p0

    .line 55
    iget p0, p2, Landroid/graphics/RectF;->top:F

    .line 56
    .line 57
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    iput p0, p2, Landroid/graphics/RectF;->bottom:F

    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public e(Landroidx/recyclerview/widget/RecyclerView$LayoutParams;)F
    .locals 0

    .line 1
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 2
    .line 3
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 4
    .line 5
    add-int/2addr p0, p1

    .line 6
    int-to-float p0, p0

    .line 7
    return p0
.end method

.method public f(FFFF)Landroid/graphics/RectF;
    .locals 0

    .line 1
    new-instance p0, Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 p4, 0x0

    .line 4
    sub-float/2addr p1, p3

    .line 5
    invoke-direct {p0, p4, p3, p2, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method g()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/c$a;->b:Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method h()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/c$a;->g()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method i()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/c$a;->b:Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPaddingLeft()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method j()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/carousel/c$a;->b:Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/google/android/material/carousel/c$a;->b:Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPaddingRight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sub-int/2addr v0, p0

    .line 14
    return v0
.end method

.method k()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/c$a;->l()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method l()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public m(Landroid/view/View;II)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/c$a;->i()I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/carousel/c$a;->p(Landroid/view/View;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int v4, v2, v0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/material/carousel/c$a;->b:Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    move v3, p2

    .line 15
    move v5, p3

    .line 16
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 3

    .line 1
    iget p0, p2, Landroid/graphics/RectF;->bottom:F

    .line 2
    .line 3
    iget v0, p3, Landroid/graphics/RectF;->top:F

    .line 4
    .line 5
    cmpg-float p0, p0, v0

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 12
    .line 13
    float-to-double v1, p0

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    double-to-float p0, v1

    .line 19
    sub-float/2addr p0, v0

    .line 20
    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 21
    .line 22
    iget v1, p1, Landroid/graphics/RectF;->top:F

    .line 23
    .line 24
    invoke-static {v1, p0}, Ljava/lang/Math;->min(FF)F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    iput p0, p1, Landroid/graphics/RectF;->top:F

    .line 29
    .line 30
    :cond_0
    iget p0, p2, Landroid/graphics/RectF;->top:F

    .line 31
    .line 32
    iget p2, p3, Landroid/graphics/RectF;->bottom:F

    .line 33
    .line 34
    cmpl-float p0, p0, p2

    .line 35
    .line 36
    if-ltz p0, :cond_1

    .line 37
    .line 38
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 39
    .line 40
    float-to-double p2, p0

    .line 41
    invoke-static {p2, p3}, Ljava/lang/Math;->ceil(D)D

    .line 42
    .line 43
    .line 44
    move-result-wide p2

    .line 45
    double-to-float p0, p2

    .line 46
    add-float/2addr p0, v0

    .line 47
    iput p0, p1, Landroid/graphics/RectF;->top:F

    .line 48
    .line 49
    iget p2, p1, Landroid/graphics/RectF;->bottom:F

    .line 50
    .line 51
    invoke-static {p0, p2}, Ljava/lang/Math;->max(FF)F

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public o(Landroid/view/View;Landroid/graphics/Rect;FF)V
    .locals 0

    .line 1
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    add-float/2addr p0, p3

    .line 5
    sub-float/2addr p4, p0

    .line 6
    float-to-int p0, p4

    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method p(Landroid/view/View;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/material/carousel/c$a;->b:Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 14
    .line 15
    add-int/2addr p0, p1

    .line 16
    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 17
    .line 18
    add-int/2addr p0, p1

    .line 19
    return p0
.end method
