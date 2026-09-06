.class public Lcom/android/launcher3/widget/WidgetImageViewMfv;
.super Lcom/android/launcher3/widget/WidgetImageView;
.source "WidgetImageViewMfv.java"


# instance fields
.field private i:I

.field private j:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/WidgetImageViewMfv;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/WidgetImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0709ff

    .line 4
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/WidgetImageViewMfv;->i:I

    const p2, 0x7f04049b

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    move-result p3

    .line 6
    invoke-static {p1, p2, p3}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 7

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
    cmpl-float v3, v2, v0

    .line 19
    .line 20
    if-lez v3, :cond_0

    .line 21
    .line 22
    div-float v3, v0, v2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/high16 v3, 0x3f800000    # 1.0f

    .line 26
    .line 27
    :goto_0
    mul-float/2addr v2, v3

    .line 28
    iget-object v4, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    int-to-float v4, v4

    .line 35
    mul-float/2addr v4, v3

    .line 36
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 37
    .line 38
    sub-float v5, v0, v2

    .line 39
    .line 40
    const/high16 v6, 0x40000000    # 2.0f

    .line 41
    .line 42
    div-float/2addr v5, v6

    .line 43
    iput v5, v3, Landroid/graphics/RectF;->left:F

    .line 44
    .line 45
    add-float/2addr v0, v2

    .line 46
    div-float/2addr v0, v6

    .line 47
    iput v0, v3, Landroid/graphics/RectF;->right:F

    .line 48
    .line 49
    cmpl-float v0, v4, v1

    .line 50
    .line 51
    if-lez v0, :cond_1

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    iput v0, v3, Landroid/graphics/RectF;->top:F

    .line 55
    .line 56
    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    sub-float v0, v1, v4

    .line 60
    .line 61
    div-float/2addr v0, v6

    .line 62
    iput v0, v3, Landroid/graphics/RectF;->top:F

    .line 63
    .line 64
    add-float/2addr v1, v4

    .line 65
    div-float/2addr v1, v6

    .line 66
    iput v1, v3, Landroid/graphics/RectF;->bottom:F

    .line 67
    .line 68
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetImageViewMfv;->j:Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 77
    .line 78
    iget v1, v1, Landroid/graphics/RectF;->right:F

    .line 79
    .line 80
    iget v2, p0, Lcom/android/launcher3/widget/WidgetImageViewMfv;->i:I

    .line 81
    .line 82
    int-to-float v2, v2

    .line 83
    add-float/2addr v1, v2

    .line 84
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    int-to-float v2, v2

    .line 89
    sub-float/2addr v1, v2

    .line 90
    float-to-int v1, v1

    .line 91
    iget v2, p0, Lcom/android/launcher3/widget/WidgetImageViewMfv;->i:I

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    sub-int/2addr v3, v4

    .line 102
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/N5;->c(III)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 107
    .line 108
    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    .line 109
    .line 110
    iget v3, p0, Lcom/android/launcher3/widget/WidgetImageViewMfv;->i:I

    .line 111
    .line 112
    int-to-float v3, v3

    .line 113
    add-float/2addr v2, v3

    .line 114
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    int-to-float v3, v3

    .line 119
    sub-float/2addr v2, v3

    .line 120
    float-to-int v2, v2

    .line 121
    iget v3, p0, Lcom/android/launcher3/widget/WidgetImageViewMfv;->i:I

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    sub-int/2addr v4, v5

    .line 132
    invoke-static {v2, v3, v4}, Lcom/android/launcher3/N5;->c(III)I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetImageViewMfv;->j:Landroid/graphics/drawable/Drawable;

    .line 137
    .line 138
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    add-int/2addr v3, v1

    .line 143
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    add-int/2addr v0, v2

    .line 148
    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 149
    .line 150
    .line 151
    :cond_2
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const v1, 0x7f04049b

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v1, v0}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/WidgetImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetImageViewMfv;->j:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const v0, 0x7f080a20

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
