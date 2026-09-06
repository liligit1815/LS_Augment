.class public Landroidx/constraintlayout/motion/widget/p;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "MotionLayout.java"

# interfaces
.implements LJ/v;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/motion/widget/p$g;,
        Landroidx/constraintlayout/motion/widget/p$i;,
        Landroidx/constraintlayout/motion/widget/p$f;,
        Landroidx/constraintlayout/motion/widget/p$d;,
        Landroidx/constraintlayout/motion/widget/p$h;,
        Landroidx/constraintlayout/motion/widget/p$e;
    }
.end annotation


# static fields
.field public static z0:Z


# instance fields
.field private A:F

.field private B:F

.field C:I

.field D:Landroidx/constraintlayout/motion/widget/p$d;

.field private E:Z

.field private F:Landroidx/constraintlayout/motion/widget/b;

.field G:I

.field H:I

.field I:I

.field J:I

.field K:Z

.field L:F

.field M:F

.field N:J

.field O:F

.field private P:Z

.field private Q:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/n;",
            ">;"
        }
    .end annotation
.end field

.field private R:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/n;",
            ">;"
        }
    .end annotation
.end field

.field private S:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/n;",
            ">;"
        }
    .end annotation
.end field

.field private T:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Landroidx/constraintlayout/motion/widget/p$h;",
            ">;"
        }
    .end annotation
.end field

.field private U:I

.field private V:J

.field private W:F

.field private a0:I

.field private b0:F

.field c0:Z

.field protected d0:Z

.field e0:I

.field f0:I

.field g:Landroidx/constraintlayout/motion/widget/r;

.field g0:I

.field h:Landroid/view/animation/Interpolator;

.field h0:I

.field i:Landroid/view/animation/Interpolator;

.field i0:I

.field j:F

.field j0:I

.field private k:I

.field k0:F

.field l:I

.field private l0:Lr/d;

.field private m:I

.field private m0:Z

.field private n:I

.field private n0:Landroidx/constraintlayout/motion/widget/p$g;

.field private o:I

.field private o0:Ljava/lang/Runnable;

.field private p:Z

.field private p0:[I

.field q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Landroidx/constraintlayout/motion/widget/m;",
            ">;"
        }
    .end annotation
.end field

.field q0:I

.field private r:J

.field private r0:I

.field private s:F

.field private s0:Z

.field t:F

.field t0:Landroidx/constraintlayout/motion/widget/p$i;

.field u:F

.field private u0:Z

.field private v:J

.field private v0:Landroid/graphics/RectF;

.field w:F

.field private w0:Landroid/view/View;

.field private x:Z

.field private x0:Landroid/graphics/Matrix;

.field y:Z

.field y0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private z:Landroidx/constraintlayout/motion/widget/p$h;


# direct methods
.method private B()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->z:Landroidx/constraintlayout/motion/widget/p$h;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/p;->c0:Z

    .line 18
    .line 19
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->y0:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_4

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/Integer;

    .line 36
    .line 37
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->z:Landroidx/constraintlayout/motion/widget/p$h;

    .line 38
    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-interface {v2, p0, v3}, Landroidx/constraintlayout/motion/widget/p$h;->b(Landroidx/constraintlayout/motion/widget/p;I)V

    .line 46
    .line 47
    .line 48
    :cond_3
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 49
    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Landroidx/constraintlayout/motion/widget/p$h;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    invoke-interface {v3, p0, v4}, Landroidx/constraintlayout/motion/widget/p$h;->b(Landroidx/constraintlayout/motion/widget/p;I)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->y0:Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method private static P(FFF)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    const/high16 v4, 0x40000000    # 2.0f

    .line 7
    .line 8
    if-lez v1, :cond_1

    .line 9
    .line 10
    div-float v0, p0, p2

    .line 11
    .line 12
    mul-float/2addr p0, v0

    .line 13
    mul-float/2addr p2, v0

    .line 14
    mul-float/2addr p2, v0

    .line 15
    div-float/2addr p2, v4

    .line 16
    sub-float/2addr p0, p2

    .line 17
    add-float/2addr p1, p0

    .line 18
    const/high16 p0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    cmpl-float p0, p1, p0

    .line 21
    .line 22
    if-lez p0, :cond_0

    .line 23
    .line 24
    return v3

    .line 25
    :cond_0
    return v2

    .line 26
    :cond_1
    neg-float v1, p0

    .line 27
    div-float/2addr v1, p2

    .line 28
    mul-float/2addr p0, v1

    .line 29
    mul-float/2addr p2, v1

    .line 30
    mul-float/2addr p2, v1

    .line 31
    div-float/2addr p2, v4

    .line 32
    add-float/2addr p0, p2

    .line 33
    add-float/2addr p1, p0

    .line 34
    cmpg-float p0, p1, v0

    .line 35
    .line 36
    if-gez p0, :cond_2

    .line 37
    .line 38
    return v3

    .line 39
    :cond_2
    return v2
.end method

.method static synthetic a(Landroidx/constraintlayout/motion/widget/p;)Landroidx/constraintlayout/motion/widget/p$g;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic i(Landroidx/constraintlayout/motion/widget/p;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic j(Landroidx/constraintlayout/motion/widget/p;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 2
    .line 3
    return p0
.end method

.method private l(Landroid/view/View;Landroid/view/MotionEvent;FF)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/graphics/Matrix;->isIdentity()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, p3, p4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    neg-float p1, p3

    .line 19
    neg-float p3, p4

    .line 20
    invoke-virtual {p2, p1, p3}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 21
    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2, p3, p4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 29
    .line 30
    .line 31
    iget-object p3, p0, Landroidx/constraintlayout/motion/widget/p;->x0:Landroid/graphics/Matrix;

    .line 32
    .line 33
    if-nez p3, :cond_1

    .line 34
    .line 35
    new-instance p3, Landroid/graphics/Matrix;

    .line 36
    .line 37
    invoke-direct {p3}, Landroid/graphics/Matrix;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p3, p0, Landroidx/constraintlayout/motion/widget/p;->x0:Landroid/graphics/Matrix;

    .line 41
    .line 42
    :cond_1
    iget-object p3, p0, Landroidx/constraintlayout/motion/widget/p;->x0:Landroid/graphics/Matrix;

    .line 43
    .line 44
    invoke-virtual {v0, p3}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->x0:Landroid/graphics/Matrix;

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Landroid/view/MotionEvent;->transform(Landroid/graphics/Matrix;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    invoke-virtual {p2}, Landroid/view/MotionEvent;->recycle()V

    .line 57
    .line 58
    .line 59
    return p0
.end method

.method private o()V
    .locals 15

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 2
    .line 3
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/p;->h:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    iget-wide v4, p0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 17
    .line 18
    sub-long v4, v1, v4

    .line 19
    .line 20
    long-to-float v4, v4

    .line 21
    mul-float/2addr v4, v0

    .line 22
    const v5, 0x3089705f    # 1.0E-9f

    .line 23
    .line 24
    .line 25
    mul-float/2addr v4, v5

    .line 26
    iget v6, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 27
    .line 28
    div-float/2addr v4, v6

    .line 29
    iget v6, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 30
    .line 31
    add-float/2addr v6, v4

    .line 32
    iget-boolean v4, p0, Landroidx/constraintlayout/motion/widget/p;->x:Z

    .line 33
    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    iget v6, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 37
    .line 38
    :cond_0
    const/4 v4, 0x0

    .line 39
    cmpl-float v7, v0, v4

    .line 40
    .line 41
    const/4 v8, 0x0

    .line 42
    if-lez v7, :cond_1

    .line 43
    .line 44
    iget v9, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 45
    .line 46
    cmpl-float v9, v6, v9

    .line 47
    .line 48
    if-gez v9, :cond_2

    .line 49
    .line 50
    :cond_1
    cmpg-float v9, v0, v4

    .line 51
    .line 52
    if-gtz v9, :cond_3

    .line 53
    .line 54
    iget v9, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 55
    .line 56
    cmpg-float v9, v6, v9

    .line 57
    .line 58
    if-gtz v9, :cond_3

    .line 59
    .line 60
    :cond_2
    iget v6, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 61
    .line 62
    const/4 v9, 0x1

    .line 63
    goto :goto_0

    .line 64
    :cond_3
    move v9, v8

    .line 65
    :goto_0
    if-eqz v3, :cond_5

    .line 66
    .line 67
    if-nez v9, :cond_5

    .line 68
    .line 69
    iget-boolean v9, p0, Landroidx/constraintlayout/motion/widget/p;->E:Z

    .line 70
    .line 71
    if-eqz v9, :cond_4

    .line 72
    .line 73
    iget-wide v9, p0, Landroidx/constraintlayout/motion/widget/p;->r:J

    .line 74
    .line 75
    sub-long/2addr v1, v9

    .line 76
    long-to-float v1, v1

    .line 77
    mul-float/2addr v1, v5

    .line 78
    invoke-interface {v3, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    goto :goto_1

    .line 83
    :cond_4
    invoke-interface {v3, v6}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    :cond_5
    :goto_1
    if-lez v7, :cond_6

    .line 88
    .line 89
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 90
    .line 91
    cmpl-float v1, v6, v1

    .line 92
    .line 93
    if-gez v1, :cond_7

    .line 94
    .line 95
    :cond_6
    cmpg-float v0, v0, v4

    .line 96
    .line 97
    if-gtz v0, :cond_8

    .line 98
    .line 99
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 100
    .line 101
    cmpg-float v0, v6, v0

    .line 102
    .line 103
    if-gtz v0, :cond_8

    .line 104
    .line 105
    :cond_7
    iget v6, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 106
    .line 107
    :cond_8
    iput v6, p0, Landroidx/constraintlayout/motion/widget/p;->k0:F

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 114
    .line 115
    .line 116
    move-result-wide v12

    .line 117
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->i:Landroid/view/animation/Interpolator;

    .line 118
    .line 119
    if-nez v1, :cond_9

    .line 120
    .line 121
    :goto_2
    move v11, v6

    .line 122
    goto :goto_3

    .line 123
    :cond_9
    invoke-interface {v1, v6}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    goto :goto_2

    .line 128
    :goto_3
    if-ge v8, v0, :cond_b

    .line 129
    .line 130
    invoke-virtual {p0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v10

    .line 134
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 135
    .line 136
    invoke-virtual {v1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    move-object v9, v1

    .line 141
    check-cast v9, Landroidx/constraintlayout/motion/widget/m;

    .line 142
    .line 143
    if-eqz v9, :cond_a

    .line 144
    .line 145
    iget-object v14, p0, Landroidx/constraintlayout/motion/widget/p;->l0:Lr/d;

    .line 146
    .line 147
    invoke-virtual/range {v9 .. v14}, Landroidx/constraintlayout/motion/widget/m;->q(Landroid/view/View;FJLr/d;)Z

    .line 148
    .line 149
    .line 150
    :cond_a
    add-int/lit8 v8, v8, 0x1

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_b
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/p;->d0:Z

    .line 154
    .line 155
    if-eqz v0, :cond_c

    .line 156
    .line 157
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->requestLayout()V

    .line 158
    .line 159
    .line 160
    :cond_c
    return-void
.end method

.method private p()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->z:Landroidx/constraintlayout/motion/widget/p$h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 6
    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_4

    .line 14
    .line 15
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->b0:F

    .line 16
    .line 17
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 18
    .line 19
    cmpl-float v0, v0, v1

    .line 20
    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->a0:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    const/4 v2, -0x1

    .line 27
    if-eq v0, v2, :cond_1

    .line 28
    .line 29
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/p;->r()V

    .line 30
    .line 31
    .line 32
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->c0:Z

    .line 33
    .line 34
    :cond_1
    iput v2, p0, Landroidx/constraintlayout/motion/widget/p;->a0:I

    .line 35
    .line 36
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 37
    .line 38
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->b0:F

    .line 39
    .line 40
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->z:Landroidx/constraintlayout/motion/widget/p$h;

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    iget v3, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 45
    .line 46
    iget v4, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 47
    .line 48
    invoke-interface {v2, p0, v3, v4, v0}, Landroidx/constraintlayout/motion/widget/p$h;->a(Landroidx/constraintlayout/motion/widget/p;IIF)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Landroidx/constraintlayout/motion/widget/p$h;

    .line 70
    .line 71
    iget v3, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 72
    .line 73
    iget v4, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 74
    .line 75
    iget v5, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 76
    .line 77
    invoke-interface {v2, p0, v3, v4, v5}, Landroidx/constraintlayout/motion/widget/p$h;->a(Landroidx/constraintlayout/motion/widget/p;IIF)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->c0:Z

    .line 82
    .line 83
    :cond_4
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->z:Landroidx/constraintlayout/motion/widget/p$h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 6
    .line 7
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 8
    .line 9
    invoke-interface {v0, p0, v1, v2}, Landroidx/constraintlayout/motion/widget/p$h;->c(Landroidx/constraintlayout/motion/widget/p;II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroidx/constraintlayout/motion/widget/p$h;

    .line 31
    .line 32
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 33
    .line 34
    iget v3, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 35
    .line 36
    invoke-interface {v1, p0, v2, v3}, Landroidx/constraintlayout/motion/widget/p$h;->c(Landroidx/constraintlayout/motion/widget/p;II)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method

.method private x(FFLandroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    instance-of v0, p3, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    move-object v0, p3

    .line 7
    check-cast v0, Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sub-int/2addr v2, v1

    .line 14
    :goto_0
    if-ltz v2, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    int-to-float v4, v4

    .line 25
    add-float/2addr v4, p1

    .line 26
    invoke-virtual {p3}, Landroid/view/View;->getScrollX()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    int-to-float v5, v5

    .line 31
    sub-float/2addr v4, v5

    .line 32
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    int-to-float v5, v5

    .line 37
    add-float/2addr v5, p2

    .line 38
    invoke-virtual {p3}, Landroid/view/View;->getScrollY()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    int-to-float v6, v6

    .line 43
    sub-float/2addr v5, v6

    .line 44
    invoke-direct {p0, v4, v5, v3, p4}, Landroidx/constraintlayout/motion/widget/p;->x(FFLandroid/view/View;Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_0

    .line 49
    .line 50
    move v0, v1

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/4 v0, 0x0

    .line 56
    :goto_1
    if-nez v0, :cond_3

    .line 57
    .line 58
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->v0:Landroid/graphics/RectF;

    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/view/View;->getRight()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    int-to-float v3, v3

    .line 65
    add-float/2addr v3, p1

    .line 66
    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    int-to-float v4, v4

    .line 71
    sub-float/2addr v3, v4

    .line 72
    invoke-virtual {p3}, Landroid/view/View;->getBottom()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    int-to-float v4, v4

    .line 77
    add-float/2addr v4, p2

    .line 78
    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    int-to-float v5, v5

    .line 83
    sub-float/2addr v4, v5

    .line 84
    invoke-virtual {v2, p1, p2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getAction()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-nez v2, :cond_2

    .line 92
    .line 93
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->v0:Landroid/graphics/RectF;

    .line 94
    .line 95
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getX()F

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-virtual {p4}, Landroid/view/MotionEvent;->getY()F

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_3

    .line 108
    .line 109
    :cond_2
    neg-float p1, p1

    .line 110
    neg-float p2, p2

    .line 111
    invoke-direct {p0, p3, p4, p1, p2}, Landroidx/constraintlayout/motion/widget/p;->l(Landroid/view/View;Landroid/view/MotionEvent;FF)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_3

    .line 116
    .line 117
    return v1

    .line 118
    :cond_3
    return v0
.end method


# virtual methods
.method A()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Landroidx/constraintlayout/motion/widget/r;->g(Landroidx/constraintlayout/motion/widget/p;I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->requestLayout()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    if-eq v0, v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 24
    .line 25
    invoke-virtual {v1, p0, v0}, Landroidx/constraintlayout/motion/widget/r;->f(Landroidx/constraintlayout/motion/widget/p;I)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r;->X()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r;->V()V

    .line 39
    .line 40
    .line 41
    :cond_3
    :goto_0
    return-void
.end method

.method public C()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public D(FF)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$g;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$g;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/p$g;->e(F)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Landroidx/constraintlayout/motion/widget/p$g;->h(F)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p;->setProgress(F)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 35
    .line 36
    .line 37
    iput p2, p0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    cmpl-float p2, p2, v0

    .line 41
    .line 42
    const/high16 v1, 0x3f800000    # 1.0f

    .line 43
    .line 44
    if-eqz p2, :cond_3

    .line 45
    .line 46
    if-lez p2, :cond_2

    .line 47
    .line 48
    move v0, v1

    .line 49
    :cond_2
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->k(F)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    cmpl-float p2, p1, v0

    .line 54
    .line 55
    if-eqz p2, :cond_5

    .line 56
    .line 57
    cmpl-float p2, p1, v1

    .line 58
    .line 59
    if-eqz p2, :cond_5

    .line 60
    .line 61
    const/high16 p2, 0x3f000000    # 0.5f

    .line 62
    .line 63
    cmpl-float p1, p1, p2

    .line 64
    .line 65
    if-lez p1, :cond_4

    .line 66
    .line 67
    move v0, v1

    .line 68
    :cond_4
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->k(F)V

    .line 69
    .line 70
    .line 71
    :cond_5
    return-void
.end method

.method public E(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$g;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$g;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/p$g;->f(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Landroidx/constraintlayout/motion/widget/p$g;->d(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 35
    .line 36
    iput p2, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 37
    .line 38
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/motion/widget/r;->T(II)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 47
    .line 48
    invoke-virtual {p0, p2}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    throw p0
.end method

.method public F(IFF)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 7
    .line 8
    cmpl-float v0, v0, p2

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/p;->E:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/p;->r:J

    .line 21
    .line 22
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/r;->n()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-float v1, v1

    .line 29
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 30
    .line 31
    div-float/2addr v1, v2

    .line 32
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 33
    .line 34
    iput p2, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 35
    .line 36
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 37
    .line 38
    const/4 p2, 0x7

    .line 39
    const/4 v1, 0x6

    .line 40
    const/4 v2, 0x2

    .line 41
    const/4 v3, 0x0

    .line 42
    if-eqz p1, :cond_5

    .line 43
    .line 44
    if-eq p1, v0, :cond_5

    .line 45
    .line 46
    if-eq p1, v2, :cond_5

    .line 47
    .line 48
    const/4 v4, 0x4

    .line 49
    if-eq p1, v4, :cond_4

    .line 50
    .line 51
    const/4 v4, 0x5

    .line 52
    if-eq p1, v4, :cond_2

    .line 53
    .line 54
    if-eq p1, v1, :cond_5

    .line 55
    .line 56
    if-eq p1, p2, :cond_5

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/p;->x:Z

    .line 60
    .line 61
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 62
    .line 63
    .line 64
    move-result-wide p1

    .line 65
    iput-wide p1, p0, Landroidx/constraintlayout/motion/widget/p;->r:J

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 72
    .line 73
    iget-object p2, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 74
    .line 75
    invoke-virtual {p2}, Landroidx/constraintlayout/motion/widget/r;->r()F

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    invoke-static {p3, p1, p2}, Landroidx/constraintlayout/motion/widget/p;->P(FFF)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r;->r()F

    .line 88
    .line 89
    .line 90
    throw v3

    .line 91
    :cond_3
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->r()F

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r;->s()F

    .line 99
    .line 100
    .line 101
    throw v3

    .line 102
    :cond_4
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r;->r()F

    .line 105
    .line 106
    .line 107
    throw v3

    .line 108
    :cond_5
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 109
    .line 110
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->i()I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_6

    .line 115
    .line 116
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 117
    .line 118
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->r()F

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 122
    .line 123
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r;->s()F

    .line 124
    .line 125
    .line 126
    throw v3

    .line 127
    :cond_6
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 128
    .line 129
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->y()F

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 133
    .line 134
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->z()F

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 138
    .line 139
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->x()F

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 143
    .line 144
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->A()F

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 148
    .line 149
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r;->w()I

    .line 150
    .line 151
    .line 152
    throw v3
.end method

.method public G()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->k(F)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->o0:Ljava/lang/Runnable;

    .line 8
    .line 9
    return-void
.end method

.method public H(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->k(F)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->o0:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->k(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public J(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$g;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$g;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p$g;->d(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const/4 v0, -0x1

    .line 25
    invoke-virtual {p0, p1, v0, v0}, Landroidx/constraintlayout/motion/widget/p;->K(III)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public K(III)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/constraintlayout/motion/widget/p;->L(IIII)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public L(IIII)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/r;->b:Landroidx/constraintlayout/widget/k;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 11
    .line 12
    int-to-float p2, p2

    .line 13
    int-to-float p3, p3

    .line 14
    invoke-virtual {v0, v2, p1, p2, p3}, Landroidx/constraintlayout/widget/k;->a(IIFF)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eq p2, v1, :cond_0

    .line 19
    .line 20
    move p1, p2

    .line 21
    :cond_0
    iget p2, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 22
    .line 23
    if-ne p2, p1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget p3, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 30
    .line 31
    if-ne p3, p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->k(F)V

    .line 34
    .line 35
    .line 36
    if-lez p4, :cond_4

    .line 37
    .line 38
    int-to-float p1, p4

    .line 39
    div-float/2addr p1, v2

    .line 40
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget p3, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 44
    .line 45
    const/high16 v3, 0x3f800000    # 1.0f

    .line 46
    .line 47
    if-ne p3, p1, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0, v3}, Landroidx/constraintlayout/motion/widget/p;->k(F)V

    .line 50
    .line 51
    .line 52
    if-lez p4, :cond_4

    .line 53
    .line 54
    int-to-float p1, p4

    .line 55
    div-float/2addr p1, v2

    .line 56
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 60
    .line 61
    if-eq p2, v1, :cond_5

    .line 62
    .line 63
    invoke-virtual {p0, p2, p1}, Landroidx/constraintlayout/motion/widget/p;->E(II)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v3}, Landroidx/constraintlayout/motion/widget/p;->k(F)V

    .line 67
    .line 68
    .line 69
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 70
    .line 71
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->G()V

    .line 72
    .line 73
    .line 74
    if-lez p4, :cond_4

    .line 75
    .line 76
    int-to-float p1, p4

    .line 77
    div-float/2addr p1, v2

    .line 78
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 79
    .line 80
    :cond_4
    :goto_0
    return-void

    .line 81
    :cond_5
    const/4 p2, 0x0

    .line 82
    iput-boolean p2, p0, Landroidx/constraintlayout/motion/widget/p;->E:Z

    .line 83
    .line 84
    iput v3, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 85
    .line 86
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 87
    .line 88
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 89
    .line 90
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 91
    .line 92
    .line 93
    move-result-wide v3

    .line 94
    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 95
    .line 96
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 97
    .line 98
    .line 99
    move-result-wide v3

    .line 100
    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/p;->r:J

    .line 101
    .line 102
    iput-boolean p2, p0, Landroidx/constraintlayout/motion/widget/p;->x:Z

    .line 103
    .line 104
    const/4 p3, 0x0

    .line 105
    iput-object p3, p0, Landroidx/constraintlayout/motion/widget/p;->h:Landroid/view/animation/Interpolator;

    .line 106
    .line 107
    if-ne p4, v1, :cond_6

    .line 108
    .line 109
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 110
    .line 111
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r;->n()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    int-to-float v0, v0

    .line 116
    div-float/2addr v0, v2

    .line 117
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 118
    .line 119
    :cond_6
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 120
    .line 121
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 122
    .line 123
    iget v3, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 124
    .line 125
    invoke-virtual {v0, v1, v3}, Landroidx/constraintlayout/motion/widget/r;->T(II)V

    .line 126
    .line 127
    .line 128
    new-instance v0, Landroid/util/SparseArray;

    .line 129
    .line 130
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 131
    .line 132
    .line 133
    if-nez p4, :cond_7

    .line 134
    .line 135
    iget-object p4, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 136
    .line 137
    invoke-virtual {p4}, Landroidx/constraintlayout/motion/widget/r;->n()I

    .line 138
    .line 139
    .line 140
    move-result p4

    .line 141
    int-to-float p4, p4

    .line 142
    div-float/2addr p4, v2

    .line 143
    iput p4, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_7
    if-lez p4, :cond_8

    .line 147
    .line 148
    int-to-float p4, p4

    .line 149
    div-float/2addr p4, v2

    .line 150
    iput p4, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 151
    .line 152
    :cond_8
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 153
    .line 154
    .line 155
    move-result p4

    .line 156
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 159
    .line 160
    .line 161
    :goto_2
    if-ge p2, p4, :cond_9

    .line 162
    .line 163
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    new-instance v2, Landroidx/constraintlayout/motion/widget/m;

    .line 168
    .line 169
    invoke-direct {v2, v1}, Landroidx/constraintlayout/motion/widget/m;-><init>(Landroid/view/View;)V

    .line 170
    .line 171
    .line 172
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 173
    .line 174
    invoke-virtual {v3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 182
    .line 183
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    check-cast v1, Landroidx/constraintlayout/motion/widget/m;

    .line 188
    .line 189
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    add-int/lit8 p2, p2, 0x1

    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_9
    const/4 p2, 0x1

    .line 196
    iput-boolean p2, p0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 197
    .line 198
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 199
    .line 200
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 201
    .line 202
    .line 203
    throw p3
.end method

.method public M()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 9
    .line 10
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    throw p0
.end method

.method public N(ILandroidx/constraintlayout/widget/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/motion/widget/r;->Q(ILandroidx/constraintlayout/widget/d;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->M()V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 12
    .line 13
    if-ne v0, p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Landroidx/constraintlayout/widget/d;->i(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public varargs O(I[Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/constraintlayout/motion/widget/r;->Y(I[Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "MotionLayout"

    .line 10
    .line 11
    const-string p1, " no motionScene"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b(Landroid/view/View;Landroid/view/View;II)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iput-wide p1, p0, Landroidx/constraintlayout/motion/widget/p;->N:J

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->O:F

    .line 9
    .line 10
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->L:F

    .line 11
    .line 12
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->M:F

    .line 13
    .line 14
    return-void
.end method

.method public c(Landroid/view/View;I)V
    .locals 1

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget p2, p0, Landroidx/constraintlayout/motion/widget/p;->O:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    cmpl-float v0, p2, v0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->L:F

    .line 14
    .line 15
    div-float/2addr v0, p2

    .line 16
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->M:F

    .line 17
    .line 18
    div-float/2addr p0, p2

    .line 19
    invoke-virtual {p1, v0, p0}, Landroidx/constraintlayout/motion/widget/r;->M(FF)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public d(Landroid/view/View;II[II)V
    .locals 10

    .line 1
    iget-object p5, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez p5, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    iget-object v0, p5, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 8
    .line 9
    if-eqz v0, :cond_b

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->A()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_1
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->A()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, -0x1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->z()Landroidx/constraintlayout/motion/widget/s;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/s;->q()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eq v1, v2, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eq v3, v1, :cond_2

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :cond_2
    invoke-virtual {p5}, Landroidx/constraintlayout/motion/widget/r;->t()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/high16 v3, 0x3f800000    # 1.0f

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    if-eqz v1, :cond_5

    .line 54
    .line 55
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->z()Landroidx/constraintlayout/motion/widget/s;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/s;->e()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    and-int/lit8 v1, v1, 0x4

    .line 66
    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    move v2, p3

    .line 70
    :cond_3
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 71
    .line 72
    cmpl-float v5, v1, v3

    .line 73
    .line 74
    if-eqz v5, :cond_4

    .line 75
    .line 76
    cmpl-float v1, v1, v4

    .line 77
    .line 78
    if-nez v1, :cond_5

    .line 79
    .line 80
    :cond_4
    invoke-virtual {p1, v2}, Landroid/view/View;->canScrollVertically(I)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_5

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->z()Landroidx/constraintlayout/motion/widget/s;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const/4 v2, 0x0

    .line 92
    const/4 v5, 0x1

    .line 93
    if-eqz v1, :cond_8

    .line 94
    .line 95
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->z()Landroidx/constraintlayout/motion/widget/s;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/s;->e()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    and-int/2addr v0, v5

    .line 104
    if-eqz v0, :cond_8

    .line 105
    .line 106
    int-to-float v0, p2

    .line 107
    int-to-float v1, p3

    .line 108
    invoke-virtual {p5, v0, v1}, Landroidx/constraintlayout/motion/widget/r;->u(FF)F

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 113
    .line 114
    cmpg-float v6, v1, v4

    .line 115
    .line 116
    if-gtz v6, :cond_6

    .line 117
    .line 118
    cmpg-float v6, v0, v4

    .line 119
    .line 120
    if-ltz v6, :cond_7

    .line 121
    .line 122
    :cond_6
    cmpl-float v1, v1, v3

    .line 123
    .line 124
    if-ltz v1, :cond_8

    .line 125
    .line 126
    cmpl-float v0, v0, v4

    .line 127
    .line 128
    if-lez v0, :cond_8

    .line 129
    .line 130
    :cond_7
    invoke-virtual {p1, v2}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    .line 131
    .line 132
    .line 133
    new-instance p2, Landroidx/constraintlayout/motion/widget/p$b;

    .line 134
    .line 135
    invoke-direct {p2, p0, p1}, Landroidx/constraintlayout/motion/widget/p$b;-><init>(Landroidx/constraintlayout/motion/widget/p;Landroid/view/View;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_8
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 143
    .line 144
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 145
    .line 146
    .line 147
    move-result-wide v0

    .line 148
    int-to-float v3, p2

    .line 149
    iput v3, p0, Landroidx/constraintlayout/motion/widget/p;->L:F

    .line 150
    .line 151
    int-to-float v4, p3

    .line 152
    iput v4, p0, Landroidx/constraintlayout/motion/widget/p;->M:F

    .line 153
    .line 154
    iget-wide v6, p0, Landroidx/constraintlayout/motion/widget/p;->N:J

    .line 155
    .line 156
    sub-long v6, v0, v6

    .line 157
    .line 158
    long-to-double v6, v6

    .line 159
    const-wide v8, 0x3e112e0be826d695L    # 1.0E-9

    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    mul-double/2addr v6, v8

    .line 165
    double-to-float v6, v6

    .line 166
    iput v6, p0, Landroidx/constraintlayout/motion/widget/p;->O:F

    .line 167
    .line 168
    iput-wide v0, p0, Landroidx/constraintlayout/motion/widget/p;->N:J

    .line 169
    .line 170
    invoke-virtual {p5, v3, v4}, Landroidx/constraintlayout/motion/widget/r;->L(FF)V

    .line 171
    .line 172
    .line 173
    iget p5, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 174
    .line 175
    cmpl-float p1, p1, p5

    .line 176
    .line 177
    if-eqz p1, :cond_9

    .line 178
    .line 179
    aput p2, p4, v2

    .line 180
    .line 181
    aput p3, p4, v5

    .line 182
    .line 183
    :cond_9
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/motion/widget/p;->n(Z)V

    .line 184
    .line 185
    .line 186
    aget p1, p4, v2

    .line 187
    .line 188
    if-nez p1, :cond_a

    .line 189
    .line 190
    aget p1, p4, v5

    .line 191
    .line 192
    if-eqz p1, :cond_b

    .line 193
    .line 194
    :cond_a
    iput-boolean v5, p0, Landroidx/constraintlayout/motion/widget/p;->K:Z

    .line 195
    .line 196
    :cond_b
    :goto_0
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->S:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Landroidx/constraintlayout/motion/widget/n;

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Landroidx/constraintlayout/motion/widget/n;->z(Landroid/graphics/Canvas;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->n(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, v1, Landroidx/constraintlayout/motion/widget/r;->r:Landroidx/constraintlayout/motion/widget/v;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/v;->c()V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 44
    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    goto/16 :goto_4

    .line 48
    .line 49
    :cond_2
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->C:I

    .line 50
    .line 51
    const/4 v2, 0x1

    .line 52
    and-int/2addr v1, v2

    .line 53
    if-ne v1, v2, :cond_6

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-nez v1, :cond_6

    .line 60
    .line 61
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->U:I

    .line 62
    .line 63
    add-int/2addr v1, v2

    .line 64
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p;->U:I

    .line 65
    .line 66
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 67
    .line 68
    .line 69
    move-result-wide v3

    .line 70
    iget-wide v5, p0, Landroidx/constraintlayout/motion/widget/p;->V:J

    .line 71
    .line 72
    const-wide/16 v7, -0x1

    .line 73
    .line 74
    cmp-long v1, v5, v7

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    sub-long v5, v3, v5

    .line 79
    .line 80
    const-wide/32 v7, 0xbebc200

    .line 81
    .line 82
    .line 83
    cmp-long v1, v5, v7

    .line 84
    .line 85
    if-lez v1, :cond_4

    .line 86
    .line 87
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->U:I

    .line 88
    .line 89
    int-to-float v1, v1

    .line 90
    long-to-float v5, v5

    .line 91
    const v6, 0x3089705f    # 1.0E-9f

    .line 92
    .line 93
    .line 94
    mul-float/2addr v5, v6

    .line 95
    div-float/2addr v1, v5

    .line 96
    const/high16 v5, 0x42c80000    # 100.0f

    .line 97
    .line 98
    mul-float/2addr v1, v5

    .line 99
    float-to-int v1, v1

    .line 100
    int-to-float v1, v1

    .line 101
    div-float/2addr v1, v5

    .line 102
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p;->W:F

    .line 103
    .line 104
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->U:I

    .line 105
    .line 106
    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/p;->V:J

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/p;->V:J

    .line 110
    .line 111
    :cond_4
    :goto_1
    new-instance v0, Landroid/graphics/Paint;

    .line 112
    .line 113
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 114
    .line 115
    .line 116
    const/high16 v1, 0x42280000    # 42.0f

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getProgress()F

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 126
    .line 127
    mul-float/2addr v1, v3

    .line 128
    float-to-int v1, v1

    .line 129
    int-to-float v1, v1

    .line 130
    const/high16 v3, 0x41200000    # 10.0f

    .line 131
    .line 132
    div-float/2addr v1, v3

    .line 133
    new-instance v4, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    iget v5, p0, Landroidx/constraintlayout/motion/widget/p;->W:F

    .line 139
    .line 140
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v5, " fps "

    .line 144
    .line 145
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v5, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 149
    .line 150
    invoke-static {p0, v5}, Landroidx/constraintlayout/motion/widget/a;->d(Landroidx/constraintlayout/motion/widget/p;I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v5, " -> "

    .line 158
    .line 159
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    new-instance v5, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    iget v4, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 175
    .line 176
    invoke-static {p0, v4}, Landroidx/constraintlayout/motion/widget/a;->d(Landroidx/constraintlayout/motion/widget/p;I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v4, " (progress: "

    .line 184
    .line 185
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v1, " ) state="

    .line 192
    .line 193
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 197
    .line 198
    const/4 v4, -0x1

    .line 199
    if-ne v1, v4, :cond_5

    .line 200
    .line 201
    const-string v1, "undefined"

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_5
    invoke-static {p0, v1}, Landroidx/constraintlayout/motion/widget/a;->d(Landroidx/constraintlayout/motion/widget/p;I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    :goto_2
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    const/high16 v4, -0x1000000

    .line 216
    .line 217
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    add-int/lit8 v4, v4, -0x1d

    .line 225
    .line 226
    int-to-float v4, v4

    .line 227
    const/high16 v5, 0x41300000    # 11.0f

    .line 228
    .line 229
    invoke-virtual {p1, v1, v5, v4, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 230
    .line 231
    .line 232
    const v4, -0x77ff78

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 239
    .line 240
    .line 241
    move-result v4

    .line 242
    add-int/lit8 v4, v4, -0x1e

    .line 243
    .line 244
    int-to-float v4, v4

    .line 245
    invoke-virtual {p1, v1, v3, v4, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 246
    .line 247
    .line 248
    :cond_6
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->C:I

    .line 249
    .line 250
    if-le v0, v2, :cond_8

    .line 251
    .line 252
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->D:Landroidx/constraintlayout/motion/widget/p$d;

    .line 253
    .line 254
    if-nez v0, :cond_7

    .line 255
    .line 256
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$d;

    .line 257
    .line 258
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$d;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 259
    .line 260
    .line 261
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->D:Landroidx/constraintlayout/motion/widget/p$d;

    .line 262
    .line 263
    :cond_7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->D:Landroidx/constraintlayout/motion/widget/p$d;

    .line 264
    .line 265
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 266
    .line 267
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 268
    .line 269
    invoke-virtual {v2}, Landroidx/constraintlayout/motion/widget/r;->n()I

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    iget v3, p0, Landroidx/constraintlayout/motion/widget/p;->C:I

    .line 274
    .line 275
    invoke-virtual {v0, p1, v1, v2, v3}, Landroidx/constraintlayout/motion/widget/p$d;->a(Landroid/graphics/Canvas;Ljava/util/HashMap;II)V

    .line 276
    .line 277
    .line 278
    :cond_8
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->S:Ljava/util/ArrayList;

    .line 279
    .line 280
    if-eqz p0, :cond_9

    .line 281
    .line 282
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    if-eqz v0, :cond_9

    .line 291
    .line 292
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    check-cast v0, Landroidx/constraintlayout/motion/widget/n;

    .line 297
    .line 298
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/n;->y(Landroid/graphics/Canvas;)V

    .line 299
    .line 300
    .line 301
    goto :goto_3

    .line 302
    :cond_9
    :goto_4
    return-void
.end method

.method public f(Landroid/view/View;IIIII[I)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Landroidx/constraintlayout/motion/widget/p;->K:Z

    .line 2
    .line 3
    const/4 p6, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    :cond_0
    aget p1, p7, p6

    .line 11
    .line 12
    add-int/2addr p1, p4

    .line 13
    aput p1, p7, p6

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    aget p2, p7, p1

    .line 17
    .line 18
    add-int/2addr p2, p5

    .line 19
    aput p2, p7, p1

    .line 20
    .line 21
    :cond_1
    iput-boolean p6, p0, Landroidx/constraintlayout/motion/widget/p;->K:Z

    .line 22
    .line 23
    return-void
.end method

.method public g(Landroid/view/View;IIIII)V
    .locals 0

    .line 1
    return-void
.end method

.method public getConstraintSetIds()[I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r;->l()[I

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getCurrentState()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public getDefinedTransitions()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/r$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r;->m()Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getDesignTool()Landroidx/constraintlayout/motion/widget/b;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->F:Landroidx/constraintlayout/motion/widget/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/constraintlayout/motion/widget/b;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/b;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->F:Landroidx/constraintlayout/motion/widget/b;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->F:Landroidx/constraintlayout/motion/widget/b;

    .line 13
    .line 14
    return-object p0
.end method

.method public getEndState()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 2
    .line 3
    return p0
.end method

.method protected getNanoTime()J
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public getProgress()F
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 2
    .line 3
    return p0
.end method

.method public getScene()Landroidx/constraintlayout/motion/widget/r;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartState()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public getTargetPosition()F
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 2
    .line 3
    return p0
.end method

.method public getTransitionState()Landroid/os/Bundle;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$g;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$g;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p$g;->c()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p$g;->b()Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public getTransitionTimeMs()J
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r;->n()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v0, v0

    .line 12
    div-float/2addr v0, v1

    .line 13
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 14
    .line 15
    :cond_0
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 16
    .line 17
    mul-float/2addr p0, v1

    .line 18
    float-to-long v0, p0

    .line 19
    return-wide v0
.end method

.method public getVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 2
    .line 3
    return p0
.end method

.method public h(Landroid/view/View;Landroid/view/View;II)Z
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p1, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r$b;->z()Landroidx/constraintlayout/motion/widget/s;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 16
    .line 17
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r$b;->z()Landroidx/constraintlayout/motion/widget/s;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/s;->e()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    and-int/lit8 p0, p0, 0x2

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method k(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 7
    .line 8
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 9
    .line 10
    cmpl-float v1, v1, v2

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->x:Z

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iput v2, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 19
    .line 20
    :cond_1
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 21
    .line 22
    cmpl-float v2, v1, p1

    .line 23
    .line 24
    if-nez v2, :cond_2

    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :cond_2
    const/4 v2, 0x0

    .line 28
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/p;->E:Z

    .line 29
    .line 30
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 31
    .line 32
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r;->n()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    int-to-float p1, p1

    .line 37
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 38
    .line 39
    div-float/2addr p1, v0

    .line 40
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 41
    .line 42
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p;->setProgress(F)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->h:Landroid/view/animation/Interpolator;

    .line 49
    .line 50
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->q()Landroid/view/animation/Interpolator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->i:Landroid/view/animation/Interpolator;

    .line 57
    .line 58
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/p;->x:Z

    .line 59
    .line 60
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 61
    .line 62
    .line 63
    move-result-wide v2

    .line 64
    iput-wide v2, p0, Landroidx/constraintlayout/motion/widget/p;->r:J

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 68
    .line 69
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 70
    .line 71
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public loadLayoutDescription(I)V
    .locals 4

    .line 1
    const-string v0, "unable to parse MotionScene file"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_9

    .line 5
    .line 6
    :try_start_0
    new-instance v2, Landroidx/constraintlayout/motion/widget/r;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    invoke-direct {v2, v3, p0, p1}, Landroidx/constraintlayout/motion/widget/r;-><init>(Landroid/content/Context;Landroidx/constraintlayout/motion/widget/p;I)V

    .line 13
    .line 14
    .line 15
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 16
    .line 17
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 18
    .line 19
    const/4 v3, -0x1

    .line 20
    if-ne p1, v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {v2}, Landroidx/constraintlayout/motion/widget/r;->B()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 27
    .line 28
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->B()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 35
    .line 36
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->o()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    goto/16 :goto_4

    .line 47
    .line 48
    :cond_0
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 49
    .line 50
    .line 51
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    if-eqz p1, :cond_8

    .line 53
    .line 54
    :try_start_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDisplay()Landroid/view/Display;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    :goto_1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->r0:I

    .line 67
    .line 68
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 69
    .line 70
    if-eqz p1, :cond_4

    .line 71
    .line 72
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 73
    .line 74
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Landroidx/constraintlayout/motion/widget/r;->P(Landroidx/constraintlayout/motion/widget/p;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->S:Ljava/util/ArrayList;

    .line 84
    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_2

    .line 96
    .line 97
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Landroidx/constraintlayout/motion/widget/n;

    .line 102
    .line 103
    invoke-virtual {v2, p0}, Landroidx/constraintlayout/motion/widget/n;->x(Landroidx/constraintlayout/motion/widget/p;)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :catch_1
    move-exception p0

    .line 108
    goto :goto_3

    .line 109
    :cond_2
    if-eqz p1, :cond_3

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/widget/d;->i(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 115
    .line 116
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 117
    .line 118
    :cond_4
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->A()V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 122
    .line 123
    if-eqz p1, :cond_6

    .line 124
    .line 125
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->s0:Z

    .line 126
    .line 127
    if-eqz v1, :cond_5

    .line 128
    .line 129
    new-instance p1, Landroidx/constraintlayout/motion/widget/p$a;

    .line 130
    .line 131
    invoke-direct {p1, p0}, Landroidx/constraintlayout/motion/widget/p$a;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_5
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p$g;->a()V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_6
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 143
    .line 144
    if-eqz p1, :cond_7

    .line 145
    .line 146
    iget-object p1, p1, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 147
    .line 148
    if-eqz p1, :cond_7

    .line 149
    .line 150
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r$b;->v()I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    const/4 v1, 0x4

    .line 155
    if-ne p1, v1, :cond_7

    .line 156
    .line 157
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->G()V

    .line 158
    .line 159
    .line 160
    sget-object p1, Landroidx/constraintlayout/motion/widget/p$i;->h:Landroidx/constraintlayout/motion/widget/p$i;

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 163
    .line 164
    .line 165
    sget-object p1, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 166
    .line 167
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 168
    .line 169
    .line 170
    :cond_7
    return-void

    .line 171
    :goto_3
    :try_start_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 172
    .line 173
    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 174
    .line 175
    .line 176
    throw p1

    .line 177
    :cond_8
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 178
    .line 179
    return-void

    .line 180
    :goto_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 181
    .line 182
    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 183
    .line 184
    .line 185
    throw p1

    .line 186
    :cond_9
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 187
    .line 188
    return-void
.end method

.method m(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Landroidx/constraintlayout/motion/widget/m;

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {v2, p1}, Landroidx/constraintlayout/motion/widget/m;->e(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
.end method

.method n(Z)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 4
    .line 5
    const-wide/16 v3, -0x1

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 16
    .line 17
    :cond_0
    iget v1, v0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    cmpl-float v3, v1, v2

    .line 21
    .line 22
    const/4 v4, -0x1

    .line 23
    const/high16 v5, 0x3f800000    # 1.0f

    .line 24
    .line 25
    if-lez v3, :cond_1

    .line 26
    .line 27
    cmpg-float v3, v1, v5

    .line 28
    .line 29
    if-gez v3, :cond_1

    .line 30
    .line 31
    iput v4, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 32
    .line 33
    :cond_1
    iget-boolean v3, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 34
    .line 35
    const/4 v6, 0x1

    .line 36
    const/4 v7, 0x0

    .line 37
    if-nez v3, :cond_2

    .line 38
    .line 39
    iget-boolean v3, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 40
    .line 41
    if-eqz v3, :cond_26

    .line 42
    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 46
    .line 47
    cmpl-float v3, v3, v1

    .line 48
    .line 49
    if-eqz v3, :cond_26

    .line 50
    .line 51
    :cond_2
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 52
    .line 53
    sub-float/2addr v3, v1

    .line 54
    invoke-static {v3}, Ljava/lang/Math;->signum(F)F

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 59
    .line 60
    .line 61
    move-result-wide v8

    .line 62
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/p;->h:Landroid/view/animation/Interpolator;

    .line 63
    .line 64
    instance-of v10, v3, Landroidx/constraintlayout/motion/widget/o;

    .line 65
    .line 66
    const v11, 0x3089705f    # 1.0E-9f

    .line 67
    .line 68
    .line 69
    if-nez v10, :cond_3

    .line 70
    .line 71
    iget-wide v12, v0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 72
    .line 73
    sub-long v12, v8, v12

    .line 74
    .line 75
    long-to-float v10, v12

    .line 76
    mul-float/2addr v10, v1

    .line 77
    mul-float/2addr v10, v11

    .line 78
    iget v12, v0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 79
    .line 80
    div-float/2addr v10, v12

    .line 81
    goto :goto_0

    .line 82
    :cond_3
    move v10, v2

    .line 83
    :goto_0
    iget v12, v0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 84
    .line 85
    add-float/2addr v12, v10

    .line 86
    iget-boolean v13, v0, Landroidx/constraintlayout/motion/widget/p;->x:Z

    .line 87
    .line 88
    if-eqz v13, :cond_4

    .line 89
    .line 90
    iget v12, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 91
    .line 92
    :cond_4
    cmpl-float v13, v1, v2

    .line 93
    .line 94
    if-lez v13, :cond_5

    .line 95
    .line 96
    iget v14, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 97
    .line 98
    cmpl-float v14, v12, v14

    .line 99
    .line 100
    if-gez v14, :cond_6

    .line 101
    .line 102
    :cond_5
    cmpg-float v14, v1, v2

    .line 103
    .line 104
    if-gtz v14, :cond_7

    .line 105
    .line 106
    iget v14, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 107
    .line 108
    cmpg-float v14, v12, v14

    .line 109
    .line 110
    if-gtz v14, :cond_7

    .line 111
    .line 112
    :cond_6
    iget v12, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 113
    .line 114
    iput-boolean v7, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 115
    .line 116
    move v14, v6

    .line 117
    goto :goto_1

    .line 118
    :cond_7
    move v14, v7

    .line 119
    :goto_1
    iput v12, v0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 120
    .line 121
    iput v12, v0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 122
    .line 123
    iput-wide v8, v0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 124
    .line 125
    if-eqz v3, :cond_d

    .line 126
    .line 127
    if-nez v14, :cond_d

    .line 128
    .line 129
    iget-boolean v14, v0, Landroidx/constraintlayout/motion/widget/p;->E:Z

    .line 130
    .line 131
    if-eqz v14, :cond_a

    .line 132
    .line 133
    iget-wide v14, v0, Landroidx/constraintlayout/motion/widget/p;->r:J

    .line 134
    .line 135
    sub-long v14, v8, v14

    .line 136
    .line 137
    long-to-float v10, v14

    .line 138
    mul-float/2addr v10, v11

    .line 139
    invoke-interface {v3, v10}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    iget-object v10, v0, Landroidx/constraintlayout/motion/widget/p;->h:Landroid/view/animation/Interpolator;

    .line 144
    .line 145
    if-eqz v10, :cond_9

    .line 146
    .line 147
    iput v3, v0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 148
    .line 149
    iput-wide v8, v0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 150
    .line 151
    instance-of v8, v10, Landroidx/constraintlayout/motion/widget/o;

    .line 152
    .line 153
    if-eqz v8, :cond_c

    .line 154
    .line 155
    check-cast v10, Landroidx/constraintlayout/motion/widget/o;

    .line 156
    .line 157
    invoke-virtual {v10}, Landroidx/constraintlayout/motion/widget/o;->a()F

    .line 158
    .line 159
    .line 160
    move-result v8

    .line 161
    iput v8, v0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 162
    .line 163
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    .line 164
    .line 165
    .line 166
    cmpl-float v9, v8, v2

    .line 167
    .line 168
    if-lez v9, :cond_8

    .line 169
    .line 170
    cmpl-float v9, v3, v5

    .line 171
    .line 172
    if-ltz v9, :cond_8

    .line 173
    .line 174
    iput v5, v0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 175
    .line 176
    iput-boolean v7, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 177
    .line 178
    move v3, v5

    .line 179
    :cond_8
    cmpg-float v8, v8, v2

    .line 180
    .line 181
    if-gez v8, :cond_c

    .line 182
    .line 183
    cmpg-float v8, v3, v2

    .line 184
    .line 185
    if-gtz v8, :cond_c

    .line 186
    .line 187
    iput v2, v0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 188
    .line 189
    iput-boolean v7, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 190
    .line 191
    move v12, v2

    .line 192
    goto :goto_3

    .line 193
    :cond_9
    const/4 v0, 0x0

    .line 194
    throw v0

    .line 195
    :cond_a
    invoke-interface {v3, v12}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/p;->h:Landroid/view/animation/Interpolator;

    .line 200
    .line 201
    instance-of v9, v8, Landroidx/constraintlayout/motion/widget/o;

    .line 202
    .line 203
    if-eqz v9, :cond_b

    .line 204
    .line 205
    check-cast v8, Landroidx/constraintlayout/motion/widget/o;

    .line 206
    .line 207
    invoke-virtual {v8}, Landroidx/constraintlayout/motion/widget/o;->a()F

    .line 208
    .line 209
    .line 210
    move-result v8

    .line 211
    iput v8, v0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 212
    .line 213
    goto :goto_2

    .line 214
    :cond_b
    add-float/2addr v12, v10

    .line 215
    invoke-interface {v8, v12}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 216
    .line 217
    .line 218
    move-result v8

    .line 219
    sub-float/2addr v8, v3

    .line 220
    mul-float/2addr v8, v1

    .line 221
    div-float/2addr v8, v10

    .line 222
    iput v8, v0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 223
    .line 224
    :cond_c
    :goto_2
    move v12, v3

    .line 225
    goto :goto_3

    .line 226
    :cond_d
    iput v10, v0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 227
    .line 228
    :goto_3
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 229
    .line 230
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    const v8, 0x3727c5ac    # 1.0E-5f

    .line 235
    .line 236
    .line 237
    cmpl-float v3, v3, v8

    .line 238
    .line 239
    if-lez v3, :cond_e

    .line 240
    .line 241
    sget-object v3, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 242
    .line 243
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 244
    .line 245
    .line 246
    :cond_e
    if-lez v13, :cond_f

    .line 247
    .line 248
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 249
    .line 250
    cmpl-float v3, v12, v3

    .line 251
    .line 252
    if-gez v3, :cond_10

    .line 253
    .line 254
    :cond_f
    cmpg-float v3, v1, v2

    .line 255
    .line 256
    if-gtz v3, :cond_11

    .line 257
    .line 258
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 259
    .line 260
    cmpg-float v3, v12, v3

    .line 261
    .line 262
    if-gtz v3, :cond_11

    .line 263
    .line 264
    :cond_10
    iget v12, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 265
    .line 266
    iput-boolean v7, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 267
    .line 268
    :cond_11
    cmpl-float v3, v12, v5

    .line 269
    .line 270
    if-gez v3, :cond_12

    .line 271
    .line 272
    cmpg-float v3, v12, v2

    .line 273
    .line 274
    if-gtz v3, :cond_13

    .line 275
    .line 276
    :cond_12
    iput-boolean v7, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 277
    .line 278
    sget-object v3, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 279
    .line 280
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 281
    .line 282
    .line 283
    :cond_13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 284
    .line 285
    .line 286
    move-result v3

    .line 287
    iput-boolean v7, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 288
    .line 289
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    .line 290
    .line 291
    .line 292
    move-result-wide v17

    .line 293
    iput v12, v0, Landroidx/constraintlayout/motion/widget/p;->k0:F

    .line 294
    .line 295
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/p;->i:Landroid/view/animation/Interpolator;

    .line 296
    .line 297
    if-nez v8, :cond_14

    .line 298
    .line 299
    move/from16 v16, v12

    .line 300
    .line 301
    goto :goto_4

    .line 302
    :cond_14
    invoke-interface {v8, v12}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 303
    .line 304
    .line 305
    move-result v8

    .line 306
    move/from16 v16, v8

    .line 307
    .line 308
    :goto_4
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/p;->i:Landroid/view/animation/Interpolator;

    .line 309
    .line 310
    if-eqz v8, :cond_15

    .line 311
    .line 312
    iget v9, v0, Landroidx/constraintlayout/motion/widget/p;->s:F

    .line 313
    .line 314
    div-float v9, v1, v9

    .line 315
    .line 316
    add-float/2addr v9, v12

    .line 317
    invoke-interface {v8, v9}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 318
    .line 319
    .line 320
    move-result v8

    .line 321
    iput v8, v0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 322
    .line 323
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/p;->i:Landroid/view/animation/Interpolator;

    .line 324
    .line 325
    invoke-interface {v9, v12}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 326
    .line 327
    .line 328
    move-result v9

    .line 329
    sub-float/2addr v8, v9

    .line 330
    iput v8, v0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 331
    .line 332
    :cond_15
    move v8, v7

    .line 333
    :goto_5
    if-ge v8, v3, :cond_17

    .line 334
    .line 335
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 336
    .line 337
    .line 338
    move-result-object v15

    .line 339
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 340
    .line 341
    invoke-virtual {v9, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    move-result-object v9

    .line 345
    move-object v14, v9

    .line 346
    check-cast v14, Landroidx/constraintlayout/motion/widget/m;

    .line 347
    .line 348
    if-eqz v14, :cond_16

    .line 349
    .line 350
    iget-boolean v9, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 351
    .line 352
    iget-object v10, v0, Landroidx/constraintlayout/motion/widget/p;->l0:Lr/d;

    .line 353
    .line 354
    move-object/from16 v19, v10

    .line 355
    .line 356
    invoke-virtual/range {v14 .. v19}, Landroidx/constraintlayout/motion/widget/m;->q(Landroid/view/View;FJLr/d;)Z

    .line 357
    .line 358
    .line 359
    move-result v10

    .line 360
    or-int/2addr v9, v10

    .line 361
    iput-boolean v9, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 362
    .line 363
    :cond_16
    add-int/lit8 v8, v8, 0x1

    .line 364
    .line 365
    goto :goto_5

    .line 366
    :cond_17
    if-lez v13, :cond_18

    .line 367
    .line 368
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 369
    .line 370
    cmpl-float v3, v12, v3

    .line 371
    .line 372
    if-gez v3, :cond_19

    .line 373
    .line 374
    :cond_18
    cmpg-float v3, v1, v2

    .line 375
    .line 376
    if-gtz v3, :cond_1a

    .line 377
    .line 378
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 379
    .line 380
    cmpg-float v3, v12, v3

    .line 381
    .line 382
    if-gtz v3, :cond_1a

    .line 383
    .line 384
    :cond_19
    move v3, v6

    .line 385
    goto :goto_6

    .line 386
    :cond_1a
    move v3, v7

    .line 387
    :goto_6
    iget-boolean v8, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 388
    .line 389
    if-nez v8, :cond_1b

    .line 390
    .line 391
    iget-boolean v8, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 392
    .line 393
    if-nez v8, :cond_1b

    .line 394
    .line 395
    if-eqz v3, :cond_1b

    .line 396
    .line 397
    sget-object v8, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 398
    .line 399
    invoke-virtual {v0, v8}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 400
    .line 401
    .line 402
    :cond_1b
    iget-boolean v8, v0, Landroidx/constraintlayout/motion/widget/p;->d0:Z

    .line 403
    .line 404
    if-eqz v8, :cond_1c

    .line 405
    .line 406
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->requestLayout()V

    .line 407
    .line 408
    .line 409
    :cond_1c
    iget-boolean v8, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 410
    .line 411
    xor-int/2addr v3, v6

    .line 412
    or-int/2addr v3, v8

    .line 413
    iput-boolean v3, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 414
    .line 415
    cmpg-float v3, v12, v2

    .line 416
    .line 417
    if-gtz v3, :cond_1d

    .line 418
    .line 419
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 420
    .line 421
    if-eq v3, v4, :cond_1d

    .line 422
    .line 423
    iget v4, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 424
    .line 425
    if-eq v4, v3, :cond_1d

    .line 426
    .line 427
    iput v3, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 428
    .line 429
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 430
    .line 431
    invoke-virtual {v4, v3}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    invoke-virtual {v3, v0}, Landroidx/constraintlayout/widget/d;->g(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 436
    .line 437
    .line 438
    sget-object v3, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 439
    .line 440
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 441
    .line 442
    .line 443
    move v7, v6

    .line 444
    :cond_1d
    float-to-double v3, v12

    .line 445
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    .line 446
    .line 447
    cmpl-double v3, v3, v8

    .line 448
    .line 449
    if-ltz v3, :cond_1e

    .line 450
    .line 451
    iget v3, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 452
    .line 453
    iget v4, v0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 454
    .line 455
    if-eq v3, v4, :cond_1e

    .line 456
    .line 457
    iput v4, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 458
    .line 459
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 460
    .line 461
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 462
    .line 463
    .line 464
    move-result-object v3

    .line 465
    invoke-virtual {v3, v0}, Landroidx/constraintlayout/widget/d;->g(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 466
    .line 467
    .line 468
    sget-object v3, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 469
    .line 470
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 471
    .line 472
    .line 473
    move v7, v6

    .line 474
    :cond_1e
    iget-boolean v3, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 475
    .line 476
    if-nez v3, :cond_22

    .line 477
    .line 478
    iget-boolean v3, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 479
    .line 480
    if-eqz v3, :cond_1f

    .line 481
    .line 482
    goto :goto_7

    .line 483
    :cond_1f
    if-lez v13, :cond_20

    .line 484
    .line 485
    cmpl-float v3, v12, v5

    .line 486
    .line 487
    if-eqz v3, :cond_21

    .line 488
    .line 489
    :cond_20
    cmpg-float v3, v1, v2

    .line 490
    .line 491
    if-gez v3, :cond_23

    .line 492
    .line 493
    cmpl-float v3, v12, v2

    .line 494
    .line 495
    if-nez v3, :cond_23

    .line 496
    .line 497
    :cond_21
    sget-object v3, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 498
    .line 499
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 500
    .line 501
    .line 502
    goto :goto_8

    .line 503
    :cond_22
    :goto_7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->invalidate()V

    .line 504
    .line 505
    .line 506
    :cond_23
    :goto_8
    iget-boolean v3, v0, Landroidx/constraintlayout/motion/widget/p;->P:Z

    .line 507
    .line 508
    if-nez v3, :cond_26

    .line 509
    .line 510
    iget-boolean v3, v0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 511
    .line 512
    if-nez v3, :cond_26

    .line 513
    .line 514
    if-lez v13, :cond_24

    .line 515
    .line 516
    cmpl-float v3, v12, v5

    .line 517
    .line 518
    if-eqz v3, :cond_25

    .line 519
    .line 520
    :cond_24
    cmpg-float v1, v1, v2

    .line 521
    .line 522
    if-gez v1, :cond_26

    .line 523
    .line 524
    cmpl-float v1, v12, v2

    .line 525
    .line 526
    if-nez v1, :cond_26

    .line 527
    .line 528
    :cond_25
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->A()V

    .line 529
    .line 530
    .line 531
    :cond_26
    iget v1, v0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 532
    .line 533
    cmpl-float v3, v1, v5

    .line 534
    .line 535
    if-ltz v3, :cond_28

    .line 536
    .line 537
    iget v1, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 538
    .line 539
    iget v2, v0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 540
    .line 541
    if-eq v1, v2, :cond_27

    .line 542
    .line 543
    goto :goto_9

    .line 544
    :cond_27
    move v6, v7

    .line 545
    :goto_9
    iput v2, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 546
    .line 547
    :goto_a
    move v7, v6

    .line 548
    goto :goto_c

    .line 549
    :cond_28
    cmpg-float v1, v1, v2

    .line 550
    .line 551
    if-gtz v1, :cond_2a

    .line 552
    .line 553
    iget v1, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 554
    .line 555
    iget v2, v0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 556
    .line 557
    if-eq v1, v2, :cond_29

    .line 558
    .line 559
    goto :goto_b

    .line 560
    :cond_29
    move v6, v7

    .line 561
    :goto_b
    iput v2, v0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 562
    .line 563
    goto :goto_a

    .line 564
    :cond_2a
    :goto_c
    iget-boolean v1, v0, Landroidx/constraintlayout/motion/widget/p;->u0:Z

    .line 565
    .line 566
    or-int/2addr v1, v7

    .line 567
    iput-boolean v1, v0, Landroidx/constraintlayout/motion/widget/p;->u0:Z

    .line 568
    .line 569
    if-eqz v7, :cond_2b

    .line 570
    .line 571
    iget-boolean v1, v0, Landroidx/constraintlayout/motion/widget/p;->m0:Z

    .line 572
    .line 573
    if-nez v1, :cond_2b

    .line 574
    .line 575
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->requestLayout()V

    .line 576
    .line 577
    .line 578
    :cond_2b
    iget v1, v0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 579
    .line 580
    iput v1, v0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 581
    .line 582
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDisplay()Landroid/view/Display;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->r0:I

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 17
    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 21
    .line 22
    const/4 v2, -0x1

    .line 23
    if-eq v1, v2, :cond_3

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Landroidx/constraintlayout/motion/widget/r;->P(Landroidx/constraintlayout/motion/widget/p;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->S:Ljava/util/ArrayList;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Landroidx/constraintlayout/motion/widget/n;

    .line 53
    .line 54
    invoke-virtual {v2, p0}, Landroidx/constraintlayout/motion/widget/n;->x(Landroidx/constraintlayout/motion/widget/p;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    if-eqz v0, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/d;->i(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 64
    .line 65
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 66
    .line 67
    :cond_3
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->A()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 71
    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->s0:Z

    .line 75
    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$c;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$c;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p$g;->a()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_5
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 92
    .line 93
    if-eqz v0, :cond_6

    .line 94
    .line 95
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 96
    .line 97
    if-eqz v0, :cond_6

    .line 98
    .line 99
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->v()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    const/4 v1, 0x4

    .line 104
    if-ne v0, v1, :cond_6

    .line 105
    .line 106
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->G()V

    .line 107
    .line 108
    .line 109
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->h:Landroidx/constraintlayout/motion/widget/p$i;

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 112
    .line 113
    .line 114
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 117
    .line 118
    .line 119
    :cond_6
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    iget-boolean v2, p0, Landroidx/constraintlayout/motion/widget/p;->p:Z

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto/16 :goto_0

    .line 11
    .line 12
    :cond_0
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/r;->r:Landroidx/constraintlayout/motion/widget/v;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/v;->g(Landroid/view/MotionEvent;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 20
    .line 21
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 22
    .line 23
    if-eqz v0, :cond_5

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->A()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_5

    .line 30
    .line 31
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->z()Landroidx/constraintlayout/motion/widget/s;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_5

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_2

    .line 42
    .line 43
    new-instance v2, Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p0, v2}, Landroidx/constraintlayout/motion/widget/s;->p(Landroid/view/ViewGroup;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-eqz v2, :cond_2

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-nez v2, :cond_2

    .line 67
    .line 68
    return v1

    .line 69
    :cond_2
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/s;->q()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const/4 v2, -0x1

    .line 74
    if-eq v0, v2, :cond_5

    .line 75
    .line 76
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 77
    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eq v2, v0, :cond_4

    .line 85
    .line 86
    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 91
    .line 92
    :cond_4
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 93
    .line 94
    if-eqz v0, :cond_5

    .line 95
    .line 96
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->v0:Landroid/graphics/RectF;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    int-to-float v0, v0

    .line 103
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 104
    .line 105
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    int-to-float v3, v3

    .line 110
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 111
    .line 112
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    int-to-float v4, v4

    .line 117
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 118
    .line 119
    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    int-to-float v5, v5

    .line 124
    invoke-virtual {v2, v0, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->v0:Landroid/graphics/RectF;

    .line 128
    .line 129
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    invoke-virtual {v0, v2, v3}, Landroid/graphics/RectF;->contains(FF)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_5

    .line 142
    .line 143
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 144
    .line 145
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    int-to-float v0, v0

    .line 150
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 151
    .line 152
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    int-to-float v2, v2

    .line 157
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/p;->w0:Landroid/view/View;

    .line 158
    .line 159
    invoke-direct {p0, v0, v2, v3, p1}, Landroidx/constraintlayout/motion/widget/p;->x(FFLandroid/view/View;Landroid/view/MotionEvent;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-nez v0, :cond_5

    .line 164
    .line 165
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    return p0

    .line 170
    :cond_5
    :goto_0
    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/p;->m0:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    invoke-super/range {p0 .. p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->onLayout(ZIIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->m0:Z

    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    move-object p1, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sub-int/2addr p4, p2

    .line 19
    sub-int/2addr p5, p3

    .line 20
    :try_start_1
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->I:I

    .line 21
    .line 22
    if-ne p1, p4, :cond_1

    .line 23
    .line 24
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->J:I

    .line 25
    .line 26
    if-eq p1, p5, :cond_2

    .line 27
    .line 28
    :cond_1
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->C()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->n(Z)V

    .line 32
    .line 33
    .line 34
    :cond_2
    iput p4, p0, Landroidx/constraintlayout/motion/widget/p;->I:I

    .line 35
    .line 36
    iput p5, p0, Landroidx/constraintlayout/motion/widget/p;->J:I

    .line 37
    .line 38
    iput p4, p0, Landroidx/constraintlayout/motion/widget/p;->G:I

    .line 39
    .line 40
    iput p5, p0, Landroidx/constraintlayout/motion/widget/p;->H:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->m0:Z

    .line 43
    .line 44
    return-void

    .line 45
    :goto_0
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->m0:Z

    .line 46
    .line 47
    throw p1
.end method

.method protected onMeasure(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->n:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne v0, p1, :cond_2

    .line 14
    .line 15
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->o:I

    .line 16
    .line 17
    if-eq v0, p2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    move v0, v1

    .line 21
    goto :goto_1

    .line 22
    :cond_2
    :goto_0
    move v0, v2

    .line 23
    :goto_1
    iget-boolean v3, p0, Landroidx/constraintlayout/motion/widget/p;->u0:Z

    .line 24
    .line 25
    if-eqz v3, :cond_3

    .line 26
    .line 27
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->u0:Z

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->A()V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/p;->B()V

    .line 33
    .line 34
    .line 35
    move v0, v2

    .line 36
    :cond_3
    iget-boolean v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 37
    .line 38
    if-eqz v1, :cond_4

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_4
    move v2, v0

    .line 42
    :goto_2
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->n:I

    .line 43
    .line 44
    iput p2, p0, Landroidx/constraintlayout/motion/widget/p;->o:I

    .line 45
    .line 46
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r;->B()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/r;->o()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v3, 0x0

    .line 59
    if-eqz v2, :cond_b

    .line 60
    .line 61
    iget v4, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 62
    .line 63
    const/4 v5, -0x1

    .line 64
    if-ne v4, v5, :cond_a

    .line 65
    .line 66
    if-eqz v2, :cond_5

    .line 67
    .line 68
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    .line 69
    .line 70
    .line 71
    :cond_5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    add-int/2addr p1, p2

    .line 80
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p2, v0

    .line 89
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Lt/f;

    .line 90
    .line 91
    invoke-virtual {v0}, Lt/e;->W()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr v0, p2

    .line 96
    iget-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Lt/f;

    .line 97
    .line 98
    invoke-virtual {p2}, Lt/e;->x()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    add-int/2addr p2, p1

    .line 103
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->i0:I

    .line 104
    .line 105
    const/high16 v1, -0x80000000

    .line 106
    .line 107
    if-eq p1, v1, :cond_6

    .line 108
    .line 109
    if-nez p1, :cond_7

    .line 110
    .line 111
    :cond_6
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->e0:I

    .line 112
    .line 113
    int-to-float v0, p1

    .line 114
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->k0:F

    .line 115
    .line 116
    iget v3, p0, Landroidx/constraintlayout/motion/widget/p;->g0:I

    .line 117
    .line 118
    sub-int/2addr v3, p1

    .line 119
    int-to-float p1, v3

    .line 120
    mul-float/2addr v2, p1

    .line 121
    add-float/2addr v0, v2

    .line 122
    float-to-int v0, v0

    .line 123
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->requestLayout()V

    .line 124
    .line 125
    .line 126
    :cond_7
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->j0:I

    .line 127
    .line 128
    if-eq p1, v1, :cond_8

    .line 129
    .line 130
    if-nez p1, :cond_9

    .line 131
    .line 132
    :cond_8
    iget p1, p0, Landroidx/constraintlayout/motion/widget/p;->f0:I

    .line 133
    .line 134
    int-to-float p2, p1

    .line 135
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->k0:F

    .line 136
    .line 137
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->h0:I

    .line 138
    .line 139
    sub-int/2addr v2, p1

    .line 140
    int-to-float p1, v2

    .line 141
    mul-float/2addr v1, p1

    .line 142
    add-float/2addr p2, v1

    .line 143
    float-to-int p2, p2

    .line 144
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->requestLayout()V

    .line 145
    .line 146
    .line 147
    :cond_9
    invoke-virtual {p0, v0, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 148
    .line 149
    .line 150
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/p;->o()V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_a
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 163
    .line 164
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 165
    .line 166
    .line 167
    throw v3

    .line 168
    :cond_b
    throw v3
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onRtlPropertiesChanged(I)V
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->isRtl()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/r;->S(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/p;->p:Z

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r;->X()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 16
    .line 17
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->A()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getCurrentState()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, p1, v1, p0}, Landroidx/constraintlayout/motion/widget/r;->N(Landroid/view/MotionEvent;ILandroidx/constraintlayout/motion/widget/p;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 42
    .line 43
    iget-object p1, p1, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 44
    .line 45
    const/4 v0, 0x4

    .line 46
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/r$b;->B(I)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 53
    .line 54
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/r$b;->z()Landroidx/constraintlayout/motion/widget/s;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/s;->r()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0

    .line 65
    :cond_1
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :cond_2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    return p0
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Landroidx/constraintlayout/motion/widget/n;

    .line 5
    .line 6
    if-eqz v0, :cond_6

    .line 7
    .line 8
    check-cast p1, Landroidx/constraintlayout/motion/widget/n;

    .line 9
    .line 10
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/n;->w()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->Q:Ljava/util/ArrayList;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->Q:Ljava/util/ArrayList;

    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->Q:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_2
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/n;->v()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->R:Ljava/util/ArrayList;

    .line 55
    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    new-instance v0, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->R:Ljava/util/ArrayList;

    .line 64
    .line 65
    :cond_3
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->R:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_4
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/n;->u()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->S:Ljava/util/ArrayList;

    .line 77
    .line 78
    if-nez v0, :cond_5

    .line 79
    .line 80
    new-instance v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->S:Ljava/util/ArrayList;

    .line 86
    .line 87
    :cond_5
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->S:Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_6
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->Q:Ljava/util/ArrayList;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->R:Ljava/util/ArrayList;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method protected parseLayoutDescription(I)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintLayoutSpec:Landroidx/constraintlayout/widget/c;

    .line 3
    .line 4
    return-void
.end method

.method protected q()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->z:Landroidx/constraintlayout/motion/widget/p$h;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->a0:I

    .line 17
    .line 18
    const/4 v2, -0x1

    .line 19
    if-ne v0, v2, :cond_2

    .line 20
    .line 21
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 22
    .line 23
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->a0:I

    .line 24
    .line 25
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->y0:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->y0:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    sub-int/2addr v3, v1

    .line 40
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/lang/Integer;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move v0, v2

    .line 52
    :goto_0
    iget v3, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 53
    .line 54
    if-eq v0, v3, :cond_2

    .line 55
    .line 56
    if-eq v3, v2, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->y0:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :cond_2
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/p;->B()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->o0:Ljava/lang/Runnable;

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->o0:Ljava/lang/Runnable;

    .line 79
    .line 80
    :cond_3
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->p0:[I

    .line 81
    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->q0:I

    .line 85
    .line 86
    if-lez v2, :cond_4

    .line 87
    .line 88
    const/4 v2, 0x0

    .line 89
    aget v0, v0, v2

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->J(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->p0:[I

    .line 95
    .line 96
    array-length v3, v0

    .line 97
    sub-int/2addr v3, v1

    .line 98
    invoke-static {v0, v1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    .line 100
    .line 101
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->q0:I

    .line 102
    .line 103
    sub-int/2addr v0, v1

    .line 104
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->q0:I

    .line 105
    .line 106
    :cond_4
    return-void
.end method

.method public requestLayout()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/p;->d0:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r$b;->x()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const/4 v1, 0x2

    .line 26
    if-ne v0, v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x0

    .line 33
    :goto_0
    if-ge v1, v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Landroidx/constraintlayout/motion/widget/m;

    .line 46
    .line 47
    invoke-virtual {v2}, Landroidx/constraintlayout/motion/widget/m;->r()V

    .line 48
    .line 49
    .line 50
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    :goto_1
    return-void

    .line 54
    :cond_2
    invoke-super {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public s(IZF)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->z:Landroidx/constraintlayout/motion/widget/p$h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Landroidx/constraintlayout/motion/widget/p$h;->d(Landroidx/constraintlayout/motion/widget/p;IZF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->T:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Landroidx/constraintlayout/motion/widget/p$h;

    .line 27
    .line 28
    invoke-interface {v1, p0, p1, p2, p3}, Landroidx/constraintlayout/motion/widget/p$h;->d(Landroidx/constraintlayout/motion/widget/p;IZF)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-void
.end method

.method public setDebugMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->C:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDelayedApplicationOfInitialState(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/p;->s0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInteractionEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/p;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInterpolatedProgress(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r;->q()Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {v0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p;->setProgress(F)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p;->setProgress(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setOnHide(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->R:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, v0, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->R:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Landroidx/constraintlayout/motion/widget/n;

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Landroidx/constraintlayout/motion/widget/n;->setProgress(F)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public setOnShow(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->Q:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, v0, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p;->Q:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Landroidx/constraintlayout/motion/widget/n;

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Landroidx/constraintlayout/motion/widget/n;->setProgress(F)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public setProgress(F)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-ltz v1, :cond_0

    .line 7
    .line 8
    cmpl-float v3, p1, v2

    .line 9
    .line 10
    if-lez v3, :cond_1

    .line 11
    .line 12
    :cond_0
    const-string v3, "MotionLayout"

    .line 13
    .line 14
    const-string v4, "Warning! Progress is defined for values between 0.0 and 1.0 inclusive"

    .line 15
    .line 16
    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-nez v3, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$g;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$g;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 35
    .line 36
    :cond_2
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p$g;->e(F)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    if-gtz v1, :cond_5

    .line 43
    .line 44
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 45
    .line 46
    cmpl-float v1, v1, v2

    .line 47
    .line 48
    if-nez v1, :cond_4

    .line 49
    .line 50
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 51
    .line 52
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 53
    .line 54
    if-ne v1, v2, :cond_4

    .line 55
    .line 56
    sget-object v1, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 62
    .line 63
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 64
    .line 65
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 66
    .line 67
    cmpl-float v0, v1, v0

    .line 68
    .line 69
    if-nez v0, :cond_8

    .line 70
    .line 71
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    cmpl-float v1, p1, v2

    .line 78
    .line 79
    if-ltz v1, :cond_7

    .line 80
    .line 81
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 82
    .line 83
    cmpl-float v0, v1, v0

    .line 84
    .line 85
    if-nez v0, :cond_6

    .line 86
    .line 87
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 88
    .line 89
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 90
    .line 91
    if-ne v0, v1, :cond_6

    .line 92
    .line 93
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 96
    .line 97
    .line 98
    :cond_6
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 99
    .line 100
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 101
    .line 102
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 103
    .line 104
    cmpl-float v0, v0, v2

    .line 105
    .line 106
    if-nez v0, :cond_8

    .line 107
    .line 108
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_7
    const/4 v0, -0x1

    .line 115
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 116
    .line 117
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 120
    .line 121
    .line 122
    :cond_8
    :goto_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 123
    .line 124
    if-nez v0, :cond_9

    .line 125
    .line 126
    return-void

    .line 127
    :cond_9
    const/4 v0, 0x1

    .line 128
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/p;->x:Z

    .line 129
    .line 130
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    .line 131
    .line 132
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 133
    .line 134
    const-wide/16 v1, -0x1

    .line 135
    .line 136
    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 137
    .line 138
    iput-wide v1, p0, Landroidx/constraintlayout/motion/widget/p;->r:J

    .line 139
    .line 140
    const/4 p1, 0x0

    .line 141
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->h:Landroid/view/animation/Interpolator;

    .line 142
    .line 143
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/p;->y:Z

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public setScene(Landroidx/constraintlayout/motion/widget/r;)V
    .locals 1

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->isRtl()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/r;->S(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->C()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method setStartState(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$g;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$g;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/p$g;->f(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p$g;->d(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 30
    .line 31
    return-void
.end method

.method public setState(III)V
    .locals 1

    .line 10
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->h:Landroidx/constraintlayout/motion/widget/p$i;

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 11
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    const/4 v0, -0x1

    .line 12
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 13
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 14
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintLayoutSpec:Landroidx/constraintlayout/widget/c;

    if-eqz v0, :cond_0

    int-to-float p0, p2

    int-to-float p2, p3

    .line 15
    invoke-virtual {v0, p1, p0, p2}, Landroidx/constraintlayout/widget/c;->d(IFF)V

    return-void

    .line 16
    :cond_0
    iget-object p2, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    if-eqz p2, :cond_1

    .line 17
    invoke-virtual {p2, p1}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroidx/constraintlayout/widget/d;->i(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    :cond_1
    return-void
.end method

.method setState(Landroidx/constraintlayout/motion/widget/p$i;)V
    .locals 4

    .line 1
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    if-ne p1, v0, :cond_0

    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->t0:Landroidx/constraintlayout/motion/widget/p$i;

    .line 3
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->t0:Landroidx/constraintlayout/motion/widget/p$i;

    .line 4
    sget-object v2, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    if-ne v1, v2, :cond_1

    if-ne p1, v2, :cond_1

    .line 5
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/p;->p()V

    .line 6
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_3

    const/4 v3, 0x1

    if-eq v1, v3, :cond_3

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2

    goto :goto_0

    :cond_2
    if-ne p1, v0, :cond_5

    .line 7
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->q()V

    return-void

    :cond_3
    if-ne p1, v2, :cond_4

    .line 8
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/p;->p()V

    :cond_4
    if-ne p1, v0, :cond_5

    .line 9
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->q()V

    :cond_5
    :goto_0
    return-void
.end method

.method public setTransition(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    if-eqz v0, :cond_2

    .line 2
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/p;->w(I)Landroidx/constraintlayout/motion/widget/r$b;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r$b;->y()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 4
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r$b;->w()I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_1

    .line 6
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    if-nez p1, :cond_0

    .line 7
    new-instance p1, Landroidx/constraintlayout/motion/widget/p$g;

    invoke-direct {p1, p0}, Landroidx/constraintlayout/motion/widget/p$g;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 8
    :cond_0
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/p$g;->f(I)V

    .line 9
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/p$g;->d(I)V

    return-void

    .line 10
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/r;->U(Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 11
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 12
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 13
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    const/4 p0, 0x0

    .line 14
    throw p0

    :cond_2
    return-void
.end method

.method protected setTransition(Landroidx/constraintlayout/motion/widget/r$b;)V
    .locals 2

    .line 15
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/r;->U(Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 16
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->h:Landroidx/constraintlayout/motion/widget/p$i;

    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 17
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->l:I

    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/r;->o()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 19
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 20
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 22
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->t:F

    .line 23
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->w:F

    :goto_0
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/r$b;->B(I)Z

    move-result p1

    if-eqz p1, :cond_1

    const-wide/16 v0, -0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->getNanoTime()J

    move-result-wide v0

    :goto_1
    iput-wide v0, p0, Landroidx/constraintlayout/motion/widget/p;->v:J

    .line 25
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/r;->B()I

    move-result p1

    .line 26
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/r;->o()I

    move-result v0

    .line 27
    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    if-ne p1, v1, :cond_2

    iget v1, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    if-ne v0, v1, :cond_2

    return-void

    .line 28
    :cond_2
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 29
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 30
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    invoke-virtual {v1, p1, v0}, Landroidx/constraintlayout/motion/widget/r;->T(II)V

    .line 31
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 32
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 33
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    const/4 p0, 0x0

    .line 34
    throw p0
.end method

.method public setTransitionDuration(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "MotionLayout"

    .line 6
    .line 7
    const-string p1, "MotionScene not defined"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/r;->R(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setTransitionListener(Landroidx/constraintlayout/motion/widget/p$h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p;->z:Landroidx/constraintlayout/motion/widget/p$h;

    .line 2
    .line 3
    return-void
.end method

.method public setTransitionState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$g;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/widget/p$g;-><init>(Landroidx/constraintlayout/motion/widget/p;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/p$g;->g(Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->n0:Landroidx/constraintlayout/motion/widget/p$g;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p$g;->a()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method t(IFFF[F)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroidx/constraintlayout/motion/widget/m;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, p2, p3, p4, p5}, Landroidx/constraintlayout/motion/widget/m;->k(FFF[F)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getY()F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p2, p0, Landroidx/constraintlayout/motion/widget/p;->A:F

    .line 23
    .line 24
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p;->B:F

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    if-nez v1, :cond_1

    .line 28
    .line 29
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string p2, ""

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string p2, "WARNING could not find view id "

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "MotionLayout"

    .line 77
    .line 78
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->k:I

    .line 11
    .line 12
    invoke-static {v0, v2}, Landroidx/constraintlayout/motion/widget/a;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "->"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p;->m:I

    .line 25
    .line 26
    invoke-static {v0, v2}, Landroidx/constraintlayout/motion/widget/a;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v0, " (pos:"

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p;->u:F

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, " Dpos/Dt:"

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p;->j:F

    .line 49
    .line 50
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public u(I)Landroidx/constraintlayout/widget/d;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/r;->j(I)Landroidx/constraintlayout/widget/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method v(I)Landroidx/constraintlayout/motion/widget/m;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p;->q:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroidx/constraintlayout/motion/widget/m;

    .line 12
    .line 13
    return-object p0
.end method

.method public w(I)Landroidx/constraintlayout/motion/widget/r$b;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/p;->g:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/r;->C(I)Landroidx/constraintlayout/motion/widget/r$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public y()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/motion/widget/p;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method protected z()Landroidx/constraintlayout/motion/widget/p$e;
    .locals 0

    .line 1
    invoke-static {}, Landroidx/constraintlayout/motion/widget/p$f;->f()Landroidx/constraintlayout/motion/widget/p$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
