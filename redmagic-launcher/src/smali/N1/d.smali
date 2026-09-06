.class public LN1/d;
.super Ln1/d;
.source "ShortcutDragPreviewProvider.java"


# instance fields
.field private final i:Landroid/graphics/Point;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ln1/d;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, LN1/d;->i:Landroid/graphics/Point;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic t(LN1/d;ILandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LN1/d;->v(ILandroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private u(Landroid/graphics/Canvas;F)V
    .locals 3

    .line 1
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ln1/d;->j(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget p0, p0, Ln1/d;->d:I

    .line 12
    .line 13
    div-int/lit8 v2, p0, 0x2

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    div-int/lit8 p0, p0, 0x2

    .line 17
    .line 18
    int-to-float p0, p0

    .line 19
    invoke-virtual {p1, v2, p0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    int-to-float p0, p0

    .line 27
    div-float p0, p2, p0

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    div-float/2addr p2, v2

    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {p1, p0, p2, v2, v2}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 37
    .line 38
    .line 39
    iget p0, v1, Landroid/graphics/Rect;->left:I

    .line 40
    .line 41
    int-to-float p0, p0

    .line 42
    iget p2, v1, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    int-to-float p2, p2

    .line 45
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private synthetic v(ILandroid/graphics/Canvas;)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-direct {p0, p2, p1}, LN1/d;->u(Landroid/graphics/Canvas;F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public f()Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Lcom/android/launcher3/h0;->B1:I

    .line 18
    .line 19
    iget v1, p0, Ln1/d;->d:I

    .line 20
    .line 21
    add-int v2, v0, v1

    .line 22
    .line 23
    add-int/2addr v1, v0

    .line 24
    new-instance v3, LN1/c;

    .line 25
    .line 26
    invoke-direct {v3, p0, v0}, LN1/c;-><init>(LN1/d;I)V

    .line 27
    .line 28
    .line 29
    invoke-static {v2, v1, v3}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ln1/d;->s(Landroid/graphics/Bitmap;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Ls1/o;

    .line 37
    .line 38
    invoke-direct {p0, v0}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 39
    .line 40
    .line 41
    return-object p0
.end method

.method public m(Landroid/graphics/drawable/Drawable;[I)F
    .locals 8

    .line 1
    iget-object v0, p0, Ln1/d;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    iget-object v1, p0, Ln1/d;->b:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Ln1/d;->j(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, p0, Ln1/d;->b:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v2, v3, p2}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v3, p0, Ln1/d;->b:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {v3}, Landroid/view/View;->getPaddingStart()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    iget-object v4, p0, Ln1/d;->b:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-static {v4}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_0

    .line 54
    .line 55
    iget-object v4, p0, Ln1/d;->b:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    sub-int/2addr v4, v1

    .line 62
    sub-int v3, v4, v3

    .line 63
    .line 64
    :cond_0
    const/4 v4, 0x0

    .line 65
    aget v5, p2, v4

    .line 66
    .line 67
    int-to-float v3, v3

    .line 68
    mul-float/2addr v3, v2

    .line 69
    int-to-float v1, v1

    .line 70
    mul-float/2addr v1, v2

    .line 71
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    int-to-float v6, v6

    .line 76
    sub-float v6, v1, v6

    .line 77
    .line 78
    const/high16 v7, 0x40000000    # 2.0f

    .line 79
    .line 80
    div-float/2addr v6, v7

    .line 81
    add-float/2addr v3, v6

    .line 82
    iget-object v6, p0, LN1/d;->i:Landroid/graphics/Point;

    .line 83
    .line 84
    iget v6, v6, Landroid/graphics/Point;->x:I

    .line 85
    .line 86
    int-to-float v6, v6

    .line 87
    add-float/2addr v3, v6

    .line 88
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    add-int/2addr v5, v3

    .line 93
    aput v5, p2, v4

    .line 94
    .line 95
    const/4 v3, 0x1

    .line 96
    aget v4, p2, v3

    .line 97
    .line 98
    iget-object v5, p0, Ln1/d;->b:Landroid/view/View;

    .line 99
    .line 100
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    int-to-float v5, v5

    .line 105
    mul-float/2addr v2, v5

    .line 106
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    int-to-float p1, p1

    .line 111
    sub-float/2addr v2, p1

    .line 112
    div-float/2addr v2, v7

    .line 113
    iget-object p0, p0, LN1/d;->i:Landroid/graphics/Point;

    .line 114
    .line 115
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 116
    .line 117
    int-to-float p0, p0

    .line 118
    add-float/2addr v2, p0

    .line 119
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    add-int/2addr v4, p0

    .line 124
    aput v4, p2, v3

    .line 125
    .line 126
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 131
    .line 132
    int-to-float p0, p0

    .line 133
    div-float/2addr v1, p0

    .line 134
    return v1
.end method
