.class public Lcom/android/launcher3/blur/b;
.super Lcom/android/launcher3/blur/a;
.source "FolderPreviewBgBlurImageView.java"


# instance fields
.field private n:I

.field private o:I

.field private p:I

.field private q:I

.field private final r:[I

.field private s:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field private t:Landroid/graphics/Rect;

.field private u:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/blur/a;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/android/launcher3/blur/b;->n:I

    .line 6
    .line 7
    iput p1, p0, Lcom/android/launcher3/blur/b;->o:I

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    new-array p1, p1, [I

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/blur/b;->r:[I

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/blur/b;->s:Ljava/util/ArrayList;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/launcher3/blur/b;->t:Landroid/graphics/Rect;

    .line 18
    .line 19
    new-instance p1, Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/blur/b;->u:Landroid/graphics/Rect;

    .line 25
    .line 26
    iput-boolean p3, p0, Lcom/android/launcher3/blur/a;->m:Z

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public b(ZLcom/android/launcher3/CellLayout;Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/android/launcher3/CellLayout;",
            "Lcom/android/launcher3/folder/u0;",
            "Landroid/graphics/drawable/Drawable;",
            "Landroid/graphics/Rect;",
            "Ljava/util/ArrayList<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p4, :cond_4

    .line 2
    .line 3
    if-nez p5, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    iget v1, p3, Lc1/d;->a:I

    .line 12
    .line 13
    iget p3, p3, Lc1/d;->b:I

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/blur/b;->r:[I

    .line 16
    .line 17
    invoke-virtual {p2, v1, p3, v2}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/android/launcher3/blur/b;->r:[I

    .line 21
    .line 22
    aget p3, p2, v0

    .line 23
    .line 24
    int-to-float p3, p3

    .line 25
    const/4 v1, 0x1

    .line 26
    aget p2, p2, v1

    .line 27
    .line 28
    int-to-float p2, p2

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 p3, 0x0

    .line 31
    move p2, p3

    .line 32
    :goto_0
    new-instance v1, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 35
    .line 36
    .line 37
    instance-of v2, p4, LU1/a;

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    check-cast p4, LU1/a;

    .line 42
    .line 43
    invoke-virtual {p4}, LU1/a;->a()LU1/a$a;

    .line 44
    .line 45
    .line 46
    move-result-object p4

    .line 47
    iget v2, p4, LU1/a$a;->a:I

    .line 48
    .line 49
    iget v3, p4, LU1/a$a;->b:I

    .line 50
    .line 51
    iget v4, p4, LU1/a$a;->c:I

    .line 52
    .line 53
    iget p4, p4, LU1/a$a;->d:I

    .line 54
    .line 55
    invoke-virtual {v1, v2, v3, v4, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 56
    .line 57
    .line 58
    :cond_2
    iput-object p5, p0, Lcom/android/launcher3/blur/b;->u:Landroid/graphics/Rect;

    .line 59
    .line 60
    iput-object p6, p0, Lcom/android/launcher3/blur/b;->s:Ljava/util/ArrayList;

    .line 61
    .line 62
    iput-object v1, p0, Lcom/android/launcher3/blur/b;->t:Landroid/graphics/Rect;

    .line 63
    .line 64
    iget p4, p5, Landroid/graphics/Rect;->left:I

    .line 65
    .line 66
    int-to-float p4, p4

    .line 67
    add-float/2addr p3, p4

    .line 68
    iget p4, v1, Landroid/graphics/Rect;->left:I

    .line 69
    .line 70
    int-to-float p4, p4

    .line 71
    add-float/2addr p3, p4

    .line 72
    float-to-int p3, p3

    .line 73
    iput p3, p0, Lcom/android/launcher3/blur/b;->n:I

    .line 74
    .line 75
    iget p3, p5, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    int-to-float p3, p3

    .line 78
    add-float/2addr p2, p3

    .line 79
    iget p3, v1, Landroid/graphics/Rect;->top:I

    .line 80
    .line 81
    int-to-float p3, p3

    .line 82
    add-float/2addr p2, p3

    .line 83
    float-to-int p2, p2

    .line 84
    iput p2, p0, Lcom/android/launcher3/blur/b;->o:I

    .line 85
    .line 86
    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    iget p3, v1, Landroid/graphics/Rect;->left:I

    .line 91
    .line 92
    sub-int/2addr p2, p3

    .line 93
    iget p3, v1, Landroid/graphics/Rect;->right:I

    .line 94
    .line 95
    sub-int/2addr p2, p3

    .line 96
    iput p2, p0, Lcom/android/launcher3/blur/b;->p:I

    .line 97
    .line 98
    invoke-virtual {p5}, Landroid/graphics/Rect;->height()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    iget p3, v1, Landroid/graphics/Rect;->top:I

    .line 103
    .line 104
    sub-int/2addr p2, p3

    .line 105
    iget p3, v1, Landroid/graphics/Rect;->bottom:I

    .line 106
    .line 107
    sub-int/2addr p2, p3

    .line 108
    iput p2, p0, Lcom/android/launcher3/blur/b;->q:I

    .line 109
    .line 110
    if-eqz p1, :cond_3

    .line 111
    .line 112
    invoke-virtual {p0, v0, v0}, Landroid/widget/ImageView;->measure(II)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/android/launcher3/blur/b;->layout(IIII)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_3
    invoke-virtual {p0}, Landroid/widget/ImageView;->requestLayout()V

    .line 120
    .line 121
    .line 122
    :cond_4
    :goto_1
    return-void
.end method

.method public layout(IIII)V
    .locals 0

    .line 1
    iget p3, p0, Lcom/android/launcher3/blur/b;->n:I

    .line 2
    .line 3
    if-ltz p3, :cond_0

    .line 4
    .line 5
    move p1, p3

    .line 6
    :cond_0
    iget p3, p0, Lcom/android/launcher3/blur/b;->o:I

    .line 7
    .line 8
    if-ltz p3, :cond_1

    .line 9
    .line 10
    move p2, p3

    .line 11
    :cond_1
    iget p3, p0, Lcom/android/launcher3/blur/b;->p:I

    .line 12
    .line 13
    if-lez p3, :cond_2

    .line 14
    .line 15
    iget p4, p0, Lcom/android/launcher3/blur/b;->q:I

    .line 16
    .line 17
    if-lez p4, :cond_2

    .line 18
    .line 19
    add-int/2addr p3, p1

    .line 20
    add-int/2addr p4, p2

    .line 21
    goto :goto_0

    .line 22
    :cond_2
    move p3, p1

    .line 23
    move p4, p2

    .line 24
    :goto_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;->layout(IIII)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onDrawForeground(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDrawForeground(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/blur/b;->s:Ljava/util/ArrayList;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/blur/b;->t:Landroid/graphics/Rect;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/android/launcher3/blur/b;->u:Landroid/graphics/Rect;

    .line 23
    .line 24
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 25
    .line 26
    neg-int v2, v2

    .line 27
    iget-object v3, p0, Lcom/android/launcher3/blur/b;->t:Landroid/graphics/Rect;

    .line 28
    .line 29
    iget v4, v3, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    sub-int/2addr v2, v4

    .line 32
    int-to-float v2, v2

    .line 33
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 34
    .line 35
    neg-int v1, v1

    .line 36
    iget v3, v3, Landroid/graphics/Rect;->top:I

    .line 37
    .line 38
    sub-int/2addr v1, v3

    .line 39
    int-to-float v1, v1

    .line 40
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/blur/b;->s:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    add-int/lit8 v1, v1, -0x1

    .line 50
    .line 51
    :goto_0
    if-ltz v1, :cond_1

    .line 52
    .line 53
    iget-object v2, p0, Lcom/android/launcher3/blur/b;->s:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    if-eqz v2, :cond_0

    .line 62
    .line 63
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 70
    .line 71
    .line 72
    :cond_2
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/android/launcher3/blur/b;->p:I

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    if-lez p1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move p1, p2

    .line 8
    :goto_0
    const/high16 v0, 0x40000000    # 2.0f

    .line 9
    .line 10
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget v1, p0, Lcom/android/launcher3/blur/b;->q:I

    .line 15
    .line 16
    if-lez v1, :cond_1

    .line 17
    .line 18
    move p2, v1

    .line 19
    :cond_1
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
