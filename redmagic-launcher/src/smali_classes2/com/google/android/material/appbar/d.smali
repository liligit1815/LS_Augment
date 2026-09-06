.class abstract Lcom/google/android/material/appbar/d;
.super Lcom/google/android/material/appbar/e;
.source "HeaderScrollingViewBehavior.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/material/appbar/e<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field final j:Landroid/graphics/Rect;

.field final k:Landroid/graphics/Rect;

.field private l:I

.field private m:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/appbar/e;-><init>()V

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/appbar/d;->j:Landroid/graphics/Rect;

    .line 3
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/appbar/d;->k:Landroid/graphics/Rect;

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/google/android/material/appbar/d;->l:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/appbar/e;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 6
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/appbar/d;->j:Landroid/graphics/Rect;

    .line 7
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/appbar/d;->k:Landroid/graphics/Rect;

    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/google/android/material/appbar/d;->l:I

    return-void
.end method

.method private static R(I)I
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const p0, 0x800033

    .line 4
    .line 5
    .line 6
    :cond_0
    return p0
.end method


# virtual methods
.method protected J(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)V
    .locals 8

    .line 1
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r(Landroid/view/View;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/d;->L(Ljava/util/List;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 16
    .line 17
    iget-object v5, p0, Lcom/google/android/material/appbar/d;->j:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 24
    .line 25
    add-int/2addr v2, v3

    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 31
    .line 32
    add-int/2addr v3, v4

    .line 33
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    sub-int/2addr v4, v6

    .line 42
    iget v6, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 43
    .line 44
    sub-int/2addr v4, v6

    .line 45
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    add-int/2addr v6, v7

    .line 54
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    sub-int/2addr v6, v7

    .line 59
    iget v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 60
    .line 61
    sub-int/2addr v6, v7

    .line 62
    invoke-virtual {v5, v2, v3, v4, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getLastWindowInsets()LJ/Y;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    if-eqz v2, :cond_0

    .line 70
    .line 71
    invoke-static {p1}, LJ/I;->s(Landroid/view/View;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_0

    .line 76
    .line 77
    invoke-static {p2}, LJ/I;->s(Landroid/view/View;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_0

    .line 82
    .line 83
    iget p1, v5, Landroid/graphics/Rect;->left:I

    .line 84
    .line 85
    invoke-virtual {v2}, LJ/Y;->j()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    add-int/2addr p1, v3

    .line 90
    iput p1, v5, Landroid/graphics/Rect;->left:I

    .line 91
    .line 92
    iget p1, v5, Landroid/graphics/Rect;->right:I

    .line 93
    .line 94
    invoke-virtual {v2}, LJ/Y;->k()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    sub-int/2addr p1, v2

    .line 99
    iput p1, v5, Landroid/graphics/Rect;->right:I

    .line 100
    .line 101
    :cond_0
    iget-object v6, p0, Lcom/google/android/material/appbar/d;->k:Landroid/graphics/Rect;

    .line 102
    .line 103
    iget p1, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->c:I

    .line 104
    .line 105
    invoke-static {p1}, Lcom/google/android/material/appbar/d;->R(I)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    move v7, p3

    .line 118
    invoke-static/range {v2 .. v7}, LJ/h;->a(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/d;->M(Landroid/view/View;)I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    iget p3, v6, Landroid/graphics/Rect;->left:I

    .line 126
    .line 127
    iget v1, v6, Landroid/graphics/Rect;->top:I

    .line 128
    .line 129
    sub-int/2addr v1, p1

    .line 130
    iget v2, v6, Landroid/graphics/Rect;->right:I

    .line 131
    .line 132
    iget v3, v6, Landroid/graphics/Rect;->bottom:I

    .line 133
    .line 134
    sub-int/2addr v3, p1

    .line 135
    invoke-virtual {p2, p3, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 136
    .line 137
    .line 138
    iget p1, v6, Landroid/graphics/Rect;->top:I

    .line 139
    .line 140
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    sub-int/2addr p1, p2

    .line 145
    iput p1, p0, Lcom/google/android/material/appbar/d;->l:I

    .line 146
    .line 147
    return-void

    .line 148
    :cond_1
    move v7, p3

    .line 149
    invoke-super {p0, p1, p2, v7}, Lcom/google/android/material/appbar/e;->J(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)V

    .line 150
    .line 151
    .line 152
    const/4 p1, 0x0

    .line 153
    iput p1, p0, Lcom/google/android/material/appbar/d;->l:I

    .line 154
    .line 155
    return-void
.end method

.method abstract L(Ljava/util/List;)Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation
.end method

.method final M(Landroid/view/View;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/d;->m:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/d;->N(Landroid/view/View;)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget p0, p0, Lcom/google/android/material/appbar/d;->m:I

    .line 12
    .line 13
    int-to-float v0, p0

    .line 14
    mul-float/2addr p1, v0

    .line 15
    float-to-int p1, p1

    .line 16
    invoke-static {p1, v1, p0}, LE/a;->b(III)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method N(Landroid/view/View;)F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public final O()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/appbar/d;->m:I

    .line 2
    .line 3
    return p0
.end method

.method P(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method final Q()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/appbar/d;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public final S(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/d;->m:I

    .line 2
    .line 3
    return-void
.end method

.method protected T()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public q(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIII)Z
    .locals 6

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v2, -0x2

    .line 11
    if-ne v0, v2, :cond_5

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r(Landroid/view/View;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p0, v2}, Lcom/google/android/material/appbar/d;->L(Ljava/util/List;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-eqz v2, :cond_5

    .line 22
    .line 23
    invoke-static {p5}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 24
    .line 25
    .line 26
    move-result p5

    .line 27
    if-lez p5, :cond_1

    .line 28
    .line 29
    invoke-static {v2}, LJ/I;->s(Landroid/view/View;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getLastWindowInsets()LJ/Y;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    invoke-virtual {v3}, LJ/Y;->l()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {v3}, LJ/Y;->i()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    add-int/2addr v4, v3

    .line 50
    add-int/2addr p5, v4

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result p5

    .line 56
    :cond_2
    :goto_0
    invoke-virtual {p0, v2}, Lcom/google/android/material/appbar/d;->P(Landroid/view/View;)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    add-int/2addr p5, v3

    .line 61
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {p0}, Lcom/google/android/material/appbar/d;->T()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_3

    .line 70
    .line 71
    neg-int p0, v2

    .line 72
    int-to-float p0, p0

    .line 73
    invoke-virtual {p2, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    const/4 p0, 0x0

    .line 78
    invoke-virtual {p2, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 79
    .line 80
    .line 81
    sub-int/2addr p5, v2

    .line 82
    :goto_1
    if-ne v0, v1, :cond_4

    .line 83
    .line 84
    const/high16 p0, 0x40000000    # 2.0f

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_4
    const/high16 p0, -0x80000000

    .line 88
    .line 89
    :goto_2
    invoke-static {p5, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    move-object v0, p1

    .line 94
    move-object v1, p2

    .line 95
    move v2, p3

    .line 96
    move v3, p4

    .line 97
    move v5, p6

    .line 98
    invoke-virtual/range {v0 .. v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->J(Landroid/view/View;IIII)V

    .line 99
    .line 100
    .line 101
    const/4 p0, 0x1

    .line 102
    return p0

    .line 103
    :cond_5
    const/4 p0, 0x0

    .line 104
    return p0
.end method
