.class public Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;
.super Lcom/android/launcher3/widget/WidgetImageView;
.source "WidgetImageViewTwoPanel.java"


# instance fields
.field private final i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/WidgetImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07007f

    .line 4
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;->i:I

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;->i:I

    .line 6
    .line 7
    mul-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    int-to-float v0, v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;->i:I

    .line 16
    .line 17
    mul-int/lit8 v2, v2, 0x2

    .line 18
    .line 19
    sub-int/2addr v1, v2

    .line 20
    int-to-float v1, v1

    .line 21
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    int-to-float v2, v2

    .line 28
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-float v3, v3

    .line 35
    div-float v4, v2, v3

    .line 36
    .line 37
    div-float v5, v0, v1

    .line 38
    .line 39
    cmpl-float v4, v4, v5

    .line 40
    .line 41
    if-lez v4, :cond_0

    .line 42
    .line 43
    div-float v4, v0, v2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    div-float v4, v1, v3

    .line 47
    .line 48
    :goto_0
    const/high16 v5, 0x3f800000    # 1.0f

    .line 49
    .line 50
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    iget-object v6, p0, Lcom/android/launcher3/widget/WidgetImageView;->h:Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    instance-of v7, v6, Ls1/k0;

    .line 57
    .line 58
    if-eqz v7, :cond_1

    .line 59
    .line 60
    cmpg-float v5, v4, v5

    .line 61
    .line 62
    if-gtz v5, :cond_1

    .line 63
    .line 64
    check-cast v6, Ls1/k0;

    .line 65
    .line 66
    invoke-virtual {v6, v4}, Ls1/k0;->a(F)V

    .line 67
    .line 68
    .line 69
    :cond_1
    mul-float/2addr v2, v4

    .line 70
    mul-float/2addr v3, v4

    .line 71
    cmpl-float v4, v2, v0

    .line 72
    .line 73
    const/high16 v5, 0x40000000    # 2.0f

    .line 74
    .line 75
    if-lez v4, :cond_2

    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 78
    .line 79
    iget v4, p0, Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;->i:I

    .line 80
    .line 81
    int-to-float v6, v4

    .line 82
    iput v6, v0, Landroid/graphics/RectF;->left:F

    .line 83
    .line 84
    int-to-float v4, v4

    .line 85
    add-float/2addr v4, v2

    .line 86
    iput v4, v0, Landroid/graphics/RectF;->right:F

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 90
    .line 91
    iget v6, p0, Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;->i:I

    .line 92
    .line 93
    int-to-float v7, v6

    .line 94
    sub-float v8, v0, v2

    .line 95
    .line 96
    div-float/2addr v8, v5

    .line 97
    add-float/2addr v7, v8

    .line 98
    iput v7, v4, Landroid/graphics/RectF;->left:F

    .line 99
    .line 100
    int-to-float v6, v6

    .line 101
    add-float/2addr v0, v2

    .line 102
    div-float/2addr v0, v5

    .line 103
    add-float/2addr v6, v0

    .line 104
    iput v6, v4, Landroid/graphics/RectF;->right:F

    .line 105
    .line 106
    :goto_1
    cmpl-float v0, v3, v1

    .line 107
    .line 108
    if-lez v0, :cond_3

    .line 109
    .line 110
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 111
    .line 112
    iget p0, p0, Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;->i:I

    .line 113
    .line 114
    int-to-float v1, p0

    .line 115
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 116
    .line 117
    int-to-float p0, p0

    .line 118
    add-float/2addr p0, v3

    .line 119
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 120
    .line 121
    return-void

    .line 122
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetImageView;->g:Landroid/graphics/RectF;

    .line 123
    .line 124
    iget p0, p0, Lcom/android/launcher3/widget/WidgetImageViewTwoPanel;->i:I

    .line 125
    .line 126
    int-to-float v2, p0

    .line 127
    sub-float v4, v1, v3

    .line 128
    .line 129
    div-float/2addr v4, v5

    .line 130
    add-float/2addr v2, v4

    .line 131
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 132
    .line 133
    int-to-float p0, p0

    .line 134
    add-float/2addr v1, v3

    .line 135
    div-float/2addr v1, v5

    .line 136
    add-float/2addr p0, v1

    .line 137
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 138
    .line 139
    return-void
.end method
