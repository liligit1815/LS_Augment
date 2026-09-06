.class abstract Lcom/google/android/material/appbar/c;
.super Lcom/google/android/material/appbar/e;
.source "HeaderBehavior.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/appbar/c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Lcom/google/android/material/appbar/e<",
        "TV;>;"
    }
.end annotation


# instance fields
.field private j:Ljava/lang/Runnable;

.field k:Landroid/widget/OverScroller;

.field private l:Z

.field private m:I

.field private n:I

.field private o:I

.field private p:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/appbar/e;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 3
    iput v0, p0, Lcom/google/android/material/appbar/c;->o:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 4
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/appbar/e;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 6
    iput p1, p0, Lcom/google/android/material/appbar/c;->o:I

    return-void
.end method

.method private M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public H(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    const/4 v6, -0x1

    .line 6
    const/4 v7, 0x1

    .line 7
    const/4 v8, 0x0

    .line 8
    if-eq v1, v7, :cond_4

    .line 9
    .line 10
    const/4 v3, 0x2

    .line 11
    if-eq v1, v3, :cond_2

    .line 12
    .line 13
    const/4 v2, 0x3

    .line 14
    if-eq v1, v2, :cond_5

    .line 15
    .line 16
    const/4 v2, 0x6

    .line 17
    if-eq v1, v2, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    move v1, v7

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v1, v8

    .line 29
    :goto_0
    invoke-virtual {p3, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iput v2, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 34
    .line 35
    invoke-virtual {p3, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/high16 v2, 0x3f000000    # 0.5f

    .line 40
    .line 41
    add-float/2addr v1, v2

    .line 42
    float-to-int v1, v1

    .line 43
    iput v1, p0, Lcom/google/android/material/appbar/c;->n:I

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    iget v1, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 47
    .line 48
    invoke-virtual {p3, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-ne v1, v6, :cond_3

    .line 53
    .line 54
    return v8

    .line 55
    :cond_3
    invoke-virtual {p3, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    float-to-int v1, v1

    .line 60
    iget v3, p0, Lcom/google/android/material/appbar/c;->n:I

    .line 61
    .line 62
    sub-int/2addr v3, v1

    .line 63
    iput v1, p0, Lcom/google/android/material/appbar/c;->n:I

    .line 64
    .line 65
    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/c;->O(Landroid/view/View;)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    const/4 v5, 0x0

    .line 70
    move-object v0, p0

    .line 71
    move-object v1, p1

    .line 72
    move-object v2, p2

    .line 73
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/appbar/c;->S(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)I

    .line 74
    .line 75
    .line 76
    :goto_1
    move v1, v8

    .line 77
    goto :goto_3

    .line 78
    :cond_4
    iget-object v1, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 79
    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {v1, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 86
    .line 87
    const/16 v3, 0x3e8

    .line 88
    .line 89
    invoke-virtual {v1, v3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 93
    .line 94
    iget v3, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 95
    .line 96
    invoke-virtual {v1, v3}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/c;->P(Landroid/view/View;)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    neg-int v3, v1

    .line 105
    const/4 v4, 0x0

    .line 106
    move-object v0, p0

    .line 107
    move-object v1, p1

    .line 108
    move-object v2, p2

    .line 109
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/appbar/c;->N(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIF)Z

    .line 110
    .line 111
    .line 112
    move v1, v7

    .line 113
    goto :goto_2

    .line 114
    :cond_5
    move v1, v8

    .line 115
    :goto_2
    iput-boolean v8, p0, Lcom/google/android/material/appbar/c;->l:Z

    .line 116
    .line 117
    iput v6, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 118
    .line 119
    iget-object v2, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 120
    .line 121
    if-eqz v2, :cond_6

    .line 122
    .line 123
    invoke-virtual {v2}, Landroid/view/VelocityTracker;->recycle()V

    .line 124
    .line 125
    .line 126
    const/4 v2, 0x0

    .line 127
    iput-object v2, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 128
    .line 129
    :cond_6
    :goto_3
    iget-object v2, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 130
    .line 131
    if-eqz v2, :cond_7

    .line 132
    .line 133
    invoke-virtual {v2, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 134
    .line 135
    .line 136
    :cond_7
    iget-boolean v0, p0, Lcom/google/android/material/appbar/c;->l:Z

    .line 137
    .line 138
    if-nez v0, :cond_9

    .line 139
    .line 140
    if-eqz v1, :cond_8

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_8
    return v8

    .line 144
    :cond_9
    :goto_4
    return v7
.end method

.method L(Landroid/view/View;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method final N(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIF)Z
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;IIF)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/c;->j:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/google/android/material/appbar/c;->j:Ljava/lang/Runnable;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/appbar/c;->k:Landroid/widget/OverScroller;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Landroid/widget/OverScroller;

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/google/android/material/appbar/c;->k:Landroid/widget/OverScroller;

    .line 25
    .line 26
    :cond_1
    iget-object v2, p0, Lcom/google/android/material/appbar/c;->k:Landroid/widget/OverScroller;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/google/android/material/appbar/e;->I()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-static/range {p5 .. p5}, Ljava/lang/Math;->round(F)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    const/4 v7, 0x0

    .line 37
    const/4 v8, 0x0

    .line 38
    const/4 v3, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    move v9, p3

    .line 41
    move v10, p4

    .line 42
    invoke-virtual/range {v2 .. v10}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    .line 43
    .line 44
    .line 45
    iget-object p3, p0, Lcom/google/android/material/appbar/c;->k:Landroid/widget/OverScroller;

    .line 46
    .line 47
    invoke-virtual {p3}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-eqz p3, :cond_2

    .line 52
    .line 53
    new-instance p3, Lcom/google/android/material/appbar/c$a;

    .line 54
    .line 55
    invoke-direct {p3, p0, p1, p2}, Lcom/google/android/material/appbar/c$a;-><init>(Lcom/google/android/material/appbar/c;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    iput-object p3, p0, Lcom/google/android/material/appbar/c;->j:Ljava/lang/Runnable;

    .line 59
    .line 60
    invoke-static {p2, p3}, LJ/I;->a0(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :cond_2
    invoke-virtual/range {p0 .. p2}, Lcom/google/android/material/appbar/c;->R(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    return p0
.end method

.method O(Landroid/view/View;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    neg-int p0, p0

    .line 6
    return p0
.end method

.method P(Landroid/view/View;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method Q()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/e;->I()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method R(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method final S(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;III)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/c;->Q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int p3, v0, p3

    .line 6
    .line 7
    invoke-virtual/range {p0 .. p5}, Lcom/google/android/material/appbar/c;->U(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method T(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;I)I"
        }
    .end annotation

    .line 1
    const/high16 v4, -0x80000000

    .line 2
    .line 3
    const v5, 0x7fffffff

    .line 4
    .line 5
    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v3, p3

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/appbar/c;->U(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method U(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;III)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/e;->I()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    if-lt p1, p4, :cond_0

    .line 8
    .line 9
    if-gt p1, p5, :cond_0

    .line 10
    .line 11
    invoke-static {p3, p4, p5}, LE/a;->b(III)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eq p1, p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/e;->K(I)Z

    .line 18
    .line 19
    .line 20
    sub-int/2addr p1, p2

    .line 21
    return p1

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public o(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/c;->o:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/google/android/material/appbar/c;->o:I

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x2

    .line 24
    const/4 v2, 0x1

    .line 25
    const/4 v3, -0x1

    .line 26
    const/4 v4, 0x0

    .line 27
    if-ne v0, v1, :cond_3

    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/google/android/material/appbar/c;->l:Z

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget v0, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 34
    .line 35
    if-ne v0, v3, :cond_1

    .line 36
    .line 37
    return v4

    .line 38
    :cond_1
    invoke-virtual {p3, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-ne v0, v3, :cond_2

    .line 43
    .line 44
    return v4

    .line 45
    :cond_2
    invoke-virtual {p3, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    float-to-int v0, v0

    .line 50
    iget v1, p0, Lcom/google/android/material/appbar/c;->n:I

    .line 51
    .line 52
    sub-int v1, v0, v1

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iget v5, p0, Lcom/google/android/material/appbar/c;->o:I

    .line 59
    .line 60
    if-le v1, v5, :cond_3

    .line 61
    .line 62
    iput v0, p0, Lcom/google/android/material/appbar/c;->n:I

    .line 63
    .line 64
    return v2

    .line 65
    :cond_3
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iput v3, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 72
    .line 73
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    float-to-int v0, v0

    .line 78
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    float-to-int v1, v1

    .line 83
    invoke-virtual {p0, p2}, Lcom/google/android/material/appbar/c;->L(Landroid/view/View;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_4

    .line 88
    .line 89
    invoke-virtual {p1, p2, v0, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->B(Landroid/view/View;II)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_4

    .line 94
    .line 95
    move p1, v2

    .line 96
    goto :goto_0

    .line 97
    :cond_4
    move p1, v4

    .line 98
    :goto_0
    iput-boolean p1, p0, Lcom/google/android/material/appbar/c;->l:Z

    .line 99
    .line 100
    if-eqz p1, :cond_5

    .line 101
    .line 102
    iput v1, p0, Lcom/google/android/material/appbar/c;->n:I

    .line 103
    .line 104
    invoke-virtual {p3, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iput p1, p0, Lcom/google/android/material/appbar/c;->m:I

    .line 109
    .line 110
    invoke-direct {p0}, Lcom/google/android/material/appbar/c;->M()V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/google/android/material/appbar/c;->k:Landroid/widget/OverScroller;

    .line 114
    .line 115
    if-eqz p1, :cond_5

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_5

    .line 122
    .line 123
    iget-object p0, p0, Lcom/google/android/material/appbar/c;->k:Landroid/widget/OverScroller;

    .line 124
    .line 125
    invoke-virtual {p0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 126
    .line 127
    .line 128
    return v2

    .line 129
    :cond_5
    iget-object p0, p0, Lcom/google/android/material/appbar/c;->p:Landroid/view/VelocityTracker;

    .line 130
    .line 131
    if-eqz p0, :cond_6

    .line 132
    .line 133
    invoke-virtual {p0, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 134
    .line 135
    .line 136
    :cond_6
    return v4
.end method
