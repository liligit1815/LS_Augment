.class public Lcom/android/launcher3/widget/WidgetImageView;
.super Landroid/view/View;
.source "WidgetImageView.java"


# instance fields
.field protected final g:Landroid/graphics/RectF;

.field protected h:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/WidgetImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    int-to-float v2, v2

    .line 18
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    int-to-float v3, v3

    .line 25
    div-float v4, v2, v3

    .line 26
    .line 27
    div-float v5, v0, v1

    .line 28
    .line 29
    cmpl-float v4, v4, v5

    .line 30
    .line 31
    if-lez v4, :cond_0

    .line 32
    .line 33
    div-float v4, v0, v2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    div-float v4, v1, v3

    .line 37
    .line 38
    :goto_0
    iget-object v5, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    instance-of v6, v5, Ls1/k0;

    .line 41
    .line 42
    if-eqz v6, :cond_1

    .line 43
    .line 44
    const/high16 v6, 0x3f800000    # 1.0f

    .line 45
    .line 46
    cmpg-float v6, v4, v6

    .line 47
    .line 48
    if-gtz v6, :cond_1

    .line 49
    .line 50
    check-cast v5, Ls1/k0;

    .line 51
    .line 52
    invoke-virtual {v5, v4}, Ls1/k0;->a(F)V

    .line 53
    .line 54
    .line 55
    :cond_1
    mul-float/2addr v2, v4

    .line 56
    mul-float/2addr v3, v4

    .line 57
    cmpl-float v4, v2, v0

    .line 58
    .line 59
    const/4 v5, 0x0

    .line 60
    const/high16 v6, 0x40000000    # 2.0f

    .line 61
    .line 62
    if-lez v4, :cond_2

    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 65
    .line 66
    iput v5, v0, Landroid/graphics/RectF;->left:F

    .line 67
    .line 68
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 72
    .line 73
    sub-float v7, v0, v2

    .line 74
    .line 75
    div-float/2addr v7, v6

    .line 76
    iput v7, v4, Landroid/graphics/RectF;->left:F

    .line 77
    .line 78
    add-float/2addr v0, v2

    .line 79
    div-float/2addr v0, v6

    .line 80
    iput v0, v4, Landroid/graphics/RectF;->right:F

    .line 81
    .line 82
    :goto_1
    cmpl-float v0, v3, v1

    .line 83
    .line 84
    if-lez v0, :cond_3

    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 87
    .line 88
    iput v5, p0, Landroid/graphics/RectF;->top:F

    .line 89
    .line 90
    iput v3, p0, Landroid/graphics/RectF;->bottom:F

    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 94
    .line 95
    sub-float v0, v1, v3

    .line 96
    .line 97
    div-float/2addr v0, v6

    .line 98
    iput v0, p0, Landroid/graphics/RectF;->top:F

    .line 99
    .line 100
    add-float/2addr v1, v3

    .line 101
    div-float/2addr v1, v6

    .line 102
    iput v1, p0, Landroid/graphics/RectF;->bottom:F

    .line 103
    .line 104
    return-void
.end method

.method public getBitmapBounds()Landroid/graphics/Rect;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetImageView;->a()V

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
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetImageView;->a()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetImageView;->getBitmapBounds()Landroid/graphics/Rect;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
