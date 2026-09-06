.class public final LX1/j;
.super Ljava/lang/Object;
.source "TransientBubbleStashController.kt"

# interfaces
.implements LX1/b;


# instance fields
.field private A:F

.field private final b:LX1/b$d;

.field private final c:Landroid/content/Context;

.field private d:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private e:Lcom/android/launcher3/taskbar/N2;

.field private f:LX1/b$c;

.field private g:Lcom/android/launcher3/taskbar/bubbles/A0;

.field private h:Lcom/android/launcher3/util/v1$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation
.end field

.field private i:Lcom/android/launcher3/anim/d;

.field private final j:F

.field private k:I

.field private l:Lcom/android/launcher3/util/v1$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation
.end field

.field private m:Lcom/android/launcher3/anim/d;

.field private n:Lcom/android/launcher3/anim/d;

.field private o:Lcom/android/launcher3/anim/d;

.field private p:Lcom/android/launcher3/anim/d;

.field private q:Lcom/android/launcher3/anim/d;

.field private r:Lcom/android/launcher3/anim/d;

.field private final s:F

.field private t:Landroid/animation/AnimatorSet;

.field private u:I

.field private v:Z

.field private w:LX1/b$a;

.field private x:Z

.field private final y:Z

.field private final z:F


# direct methods
.method public constructor <init>(LX1/b$d;Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "taskbarHotseatDimensionsProvider"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "context"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, LX1/j;->b:LX1/b$d;

    .line 15
    .line 16
    iput-object p2, p0, LX1/j;->c:Landroid/content/Context;

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 19
    .line 20
    new-instance v1, LX1/g;

    .line 21
    .line 22
    invoke-direct {v1, p0}, LX1/g;-><init>(LX1/j;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, LX1/j;->i:Lcom/android/launcher3/anim/d;

    .line 29
    .line 30
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const v1, 0x7f07017b

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, LX1/j;->j:F

    .line 42
    .line 43
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    const v0, 0x7f07017d

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    int-to-float p2, p2

    .line 55
    const/high16 v0, 0x40000000    # 2.0f

    .line 56
    .line 57
    div-float/2addr p2, v0

    .line 58
    iput p2, p0, LX1/j;->s:F

    .line 59
    .line 60
    sget-object p2, LX1/b$a;->i:LX1/b$a;

    .line 61
    .line 62
    iput-object p2, p0, LX1/j;->w:LX1/b$a;

    .line 63
    .line 64
    const/4 p2, 0x1

    .line 65
    iput-boolean p2, p0, LX1/j;->y:Z

    .line 66
    .line 67
    invoke-interface {p1}, LX1/b$d;->a()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    int-to-float p1, p1

    .line 72
    neg-float p1, p1

    .line 73
    iput p1, p0, LX1/j;->z:F

    .line 74
    .line 75
    return-void
.end method

.method private final A0(F)V
    .locals 2

    .line 1
    iget-object v0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "bubbleBarViewController"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->l0()Lcom/android/launcher3/anim/d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "animateToValue(...)"

    .line 20
    .line 21
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, p1}, LX1/j;->F0(Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-wide/16 v0, 0x12c

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private static final B0(LX1/j;Ljava/lang/Float;)V
    .locals 2

    .line 1
    iget-object v0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/A0;->y(F)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    const-string p0, "bubbleBarViewController"

    .line 20
    .line 21
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    :cond_1
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->A1(F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private final C0(Landroid/animation/Animator;Z)Landroid/animation/Animator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/animation/Animator;",
            ">(TT;Z)TT;"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance p2, LX1/j$i;

    .line 4
    .line 5
    invoke-direct {p2, p0}, LX1/j$i;-><init>(LX1/j;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 9
    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    new-instance p2, LX1/j$j;

    .line 13
    .line 14
    invoke-direct {p2, p0}, LX1/j$j;-><init>(LX1/j;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method

.method public static synthetic E0(LX1/j;ZZZZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p6, p5, 0x4

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    and-int/lit8 p5, p5, 0x8

    .line 7
    .line 8
    if-eqz p5, :cond_1

    .line 9
    .line 10
    const/4 p4, 0x1

    .line 11
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, LX1/j;->D0(ZZZZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private final F0(Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 1

    .line 1
    new-instance v0, LX1/j$k;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LX1/j$k;-><init>(LX1/j;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 7
    .line 8
    .line 9
    return-object p1
.end method

.method public static synthetic K(Lcom/android/launcher3/taskbar/bubbles/A0;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LX1/j;->g0(Lcom/android/launcher3/taskbar/bubbles/A0;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(LX1/j;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LX1/j;->B0(LX1/j;Ljava/lang/Float;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M(LX1/j;)V
    .locals 0

    .line 1
    invoke-static {p0}, LX1/j;->u0(LX1/j;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic N(LX1/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LX1/j;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic O(LX1/j;Z)F
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LX1/j;->n0(Z)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic P(LX1/j;)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->l:Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic Q(LX1/j;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->n:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic R(LX1/j;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->m:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic S(LX1/j;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->p:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic T(LX1/j;)Lcom/android/launcher3/taskbar/bubbles/g0;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic U(LX1/j;)LX1/b$c;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->f:LX1/b$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic V(LX1/j;)Lcom/android/launcher3/taskbar/N2;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->e:Lcom/android/launcher3/taskbar/N2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic W(LX1/j;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->i:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic X(LX1/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LX1/j;->t0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic Y(LX1/j;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LX1/j;->y0(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic Z(LX1/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LX1/j;->z0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/A0;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LX1/j;->i0(Lcom/android/launcher3/taskbar/bubbles/A0;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final a0()V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, LX1/b;->u()Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const/high16 v4, 0x3f800000    # 1.0f

    .line 13
    .line 14
    if-nez v3, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, LX1/b;->E()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0, v1}, LX1/j;->w0(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, LX1/j;->h:Lcom/android/launcher3/util/v1$c;

    .line 27
    .line 28
    if-eqz v0, :cond_8

    .line 29
    .line 30
    invoke-virtual {v0, v4}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    filled-new-array {v0}, [Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 39
    .line 40
    .line 41
    goto/16 :goto_2

    .line 42
    .line 43
    :cond_1
    :goto_0
    invoke-virtual {p0, v0}, LX1/j;->w0(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, LX1/j;->q:Lcom/android/launcher3/anim/d;

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    if-nez v3, :cond_2

    .line 50
    .line 51
    const-string v3, "bubbleBarBackgroundScaleX"

    .line 52
    .line 53
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    move-object v3, v5

    .line 57
    :cond_2
    invoke-virtual {v3, v4}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v6, p0, LX1/j;->r:Lcom/android/launcher3/anim/d;

    .line 62
    .line 63
    if-nez v6, :cond_3

    .line 64
    .line 65
    const-string v6, "bubbleBarBackgroundScaleY"

    .line 66
    .line 67
    invoke-static {v6}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    move-object v6, v5

    .line 71
    :cond_3
    invoke-virtual {v6, v4}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    iget-object v7, p0, LX1/j;->o:Lcom/android/launcher3/anim/d;

    .line 76
    .line 77
    if-nez v7, :cond_4

    .line 78
    .line 79
    const-string v7, "bubbleBarTranslationYAnimator"

    .line 80
    .line 81
    invoke-static {v7}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    move-object v7, v5

    .line 85
    :cond_4
    invoke-interface {p0}, LX1/b;->b()F

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    invoke-virtual {v7, v8}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    iget-object v8, p0, LX1/j;->l:Lcom/android/launcher3/util/v1$c;

    .line 94
    .line 95
    if-nez v8, :cond_5

    .line 96
    .line 97
    const-string v8, "bubbleBarAlpha"

    .line 98
    .line 99
    invoke-static {v8}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    move-object v8, v5

    .line 103
    :cond_5
    invoke-virtual {v8, v4}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    iget-object v9, p0, LX1/j;->m:Lcom/android/launcher3/anim/d;

    .line 108
    .line 109
    if-nez v9, :cond_6

    .line 110
    .line 111
    const-string v9, "bubbleBarBubbleAlpha"

    .line 112
    .line 113
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    move-object v9, v5

    .line 117
    :cond_6
    invoke-virtual {v9, v4}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 118
    .line 119
    .line 120
    move-result-object v9

    .line 121
    iget-object v10, p0, LX1/j;->n:Lcom/android/launcher3/anim/d;

    .line 122
    .line 123
    if-nez v10, :cond_7

    .line 124
    .line 125
    const-string v10, "bubbleBarBackgroundAlpha"

    .line 126
    .line 127
    invoke-static {v10}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_7
    move-object v5, v10

    .line 132
    :goto_1
    invoke-virtual {v5, v4}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    const/4 v5, 0x6

    .line 137
    new-array v5, v5, [Landroid/animation/Animator;

    .line 138
    .line 139
    aput-object v3, v5, v0

    .line 140
    .line 141
    aput-object v6, v5, v1

    .line 142
    .line 143
    const/4 v0, 0x2

    .line 144
    aput-object v7, v5, v0

    .line 145
    .line 146
    const/4 v0, 0x3

    .line 147
    aput-object v8, v5, v0

    .line 148
    .line 149
    const/4 v0, 0x4

    .line 150
    aput-object v9, v5, v0

    .line 151
    .line 152
    const/4 v0, 0x5

    .line 153
    aput-object v4, v5, v0

    .line 154
    .line 155
    invoke-virtual {v2, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 156
    .line 157
    .line 158
    :cond_8
    :goto_2
    invoke-virtual {p0}, LX1/j;->c()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    invoke-direct {p0, v2, v0}, LX1/j;->C0(Landroid/animation/Animator;Z)Landroid/animation/Animator;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-direct {p0, v0}, LX1/j;->F0(Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    const-wide/16 v0, 0x12c

    .line 171
    .line 172
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method private final b0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, LX1/j;->k()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, LX1/j;->A0(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final c0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, LX1/j;->l()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, LX1/j;->A0(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final d0()V
    .locals 1

    .line 1
    iget-object v0, p0, LX1/j;->t:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, LX1/j;->t:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    return-void
.end method

.method private final e0(Z)Landroid/animation/AnimatorSet;
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LX1/j;->n:Lcom/android/launcher3/anim/d;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v1, "bubbleBarBackgroundAlpha"

    .line 12
    .line 13
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    move-object v1, v2

    .line 17
    :cond_0
    invoke-direct {p0, p1}, LX1/j;->n0(Z)F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-direct {p0, p1}, LX1/j;->m0(Z)F

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-virtual {v1, v3, v4}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, LX1/j;->h:Lcom/android/launcher3/util/v1$c;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-direct {p0, p1}, LX1/j;->o0(Z)F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    :cond_1
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method private final f0(LN2/h;)Landroid/animation/Animator;
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x0

    .line 4
    iget-object v3, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 5
    .line 6
    if-nez v3, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/A0;->k()Lcom/android/launcher3/util/v1;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    sget-object v5, Lcom/android/launcher3/taskbar/a;->a:Lcom/android/launcher3/taskbar/a;

    .line 19
    .line 20
    iget-object v6, p0, LX1/j;->c:Landroid/content/Context;

    .line 21
    .line 22
    invoke-virtual {v5, v6}, Lcom/android/launcher3/taskbar/a;->e(Landroid/content/Context;)F

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    iget-object v6, p0, LX1/j;->c:Landroid/content/Context;

    .line 27
    .line 28
    invoke-static {v6}, LN2/m;->a(Landroid/content/Context;)Z

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    invoke-virtual {p1, v6}, LN2/h;->e(Z)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    neg-float v5, v5

    .line 40
    :goto_0
    new-array p1, v1, [F

    .line 41
    .line 42
    aput v5, p1, v2

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    aput v5, p1, v0

    .line 46
    .line 47
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance v5, LX1/h;

    .line 52
    .line 53
    invoke-direct {v5, v3}, LX1/h;-><init>(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 57
    .line 58
    .line 59
    const-wide/16 v5, 0x64

    .line 60
    .line 61
    invoke-virtual {p1, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    .line 64
    const/high16 v3, 0x3f800000    # 1.0f

    .line 65
    .line 66
    invoke-virtual {v4, v3}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 74
    .line 75
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 76
    .line 77
    .line 78
    new-array v1, v1, [Landroid/animation/Animator;

    .line 79
    .line 80
    aput-object p1, v1, v2

    .line 81
    .line 82
    aput-object v3, v1, v0

    .line 83
    .line 84
    invoke-virtual {v4, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 85
    .line 86
    .line 87
    new-instance p1, LX1/j$a;

    .line 88
    .line 89
    invoke-direct {p1, p0}, LX1/j$a;-><init>(LX1/j;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 93
    .line 94
    .line 95
    return-object v4
.end method

.method private static final g0(Lcom/android/launcher3/taskbar/bubbles/A0;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "v"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 11
    .line 12
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->x(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private final h0(LN2/h;)Landroid/animation/Animator;
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x0

    .line 4
    iget-object v3, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 5
    .line 6
    if-nez v3, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/A0;->k()Lcom/android/launcher3/util/v1;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    sget-object v5, Lcom/android/launcher3/taskbar/a;->a:Lcom/android/launcher3/taskbar/a;

    .line 19
    .line 20
    iget-object v6, p0, LX1/j;->c:Landroid/content/Context;

    .line 21
    .line 22
    invoke-virtual {v5, v6}, Lcom/android/launcher3/taskbar/a;->f(Landroid/content/Context;)F

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    iget-object p0, p0, LX1/j;->c:Landroid/content/Context;

    .line 27
    .line 28
    invoke-static {p0}, LN2/m;->a(Landroid/content/Context;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p1, p0}, LN2/h;->e(Z)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    neg-float v5, v5

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    new-array p1, v1, [F

    .line 41
    .line 42
    aput p0, p1, v2

    .line 43
    .line 44
    aput v5, p1, v0

    .line 45
    .line 46
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v5, LX1/i;

    .line 51
    .line 52
    invoke-direct {v5, v3}, LX1/i;-><init>(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 56
    .line 57
    .line 58
    const-wide/16 v5, 0x64

    .line 59
    .line 60
    invoke-virtual {p1, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    .line 63
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    new-instance v5, LX1/j$b;

    .line 67
    .line 68
    invoke-direct {v5, v3}, LX1/j$b;-><init>(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4, p0}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-wide/16 v3, 0x32

    .line 79
    .line 80
    invoke-virtual {p0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v3, v4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 84
    .line 85
    .line 86
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 87
    .line 88
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 89
    .line 90
    .line 91
    new-array v1, v1, [Landroid/animation/Animator;

    .line 92
    .line 93
    aput-object p1, v1, v2

    .line 94
    .line 95
    aput-object p0, v1, v0

    .line 96
    .line 97
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 98
    .line 99
    .line 100
    return-object v3
.end method

.method private static final i0(Lcom/android/launcher3/taskbar/bubbles/A0;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "v"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 11
    .line 12
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->x(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private final j0(Z)Landroid/animation/AnimatorSet;
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LX1/j;->p0()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v1, v0

    .line 11
    :goto_0
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, LX1/j;->q0()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :cond_1
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, LX1/j;->q:Lcom/android/launcher3/anim/d;

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    const-string v2, "bubbleBarBackgroundScaleX"

    .line 28
    .line 29
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    move-object v2, v3

    .line 33
    :cond_2
    invoke-virtual {v2, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, LX1/j;->r:Lcom/android/launcher3/anim/d;

    .line 41
    .line 42
    if-nez p0, :cond_3

    .line 43
    .line 44
    const-string p0, "bubbleBarBackgroundScaleY"

    .line 45
    .line 46
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    move-object v3, p0

    .line 51
    :goto_1
    invoke-virtual {v3, v0}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 56
    .line 57
    .line 58
    return-object p1
.end method

.method private final k0(Z)Landroid/animation/Animator;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, LX1/j;->i:Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "animateToValue(...)"

    .line 11
    .line 12
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p1, Lcom/android/launcher3/anim/f0;

    .line 17
    .line 18
    iget-object v1, p0, LX1/j;->c:Landroid/content/Context;

    .line 19
    .line 20
    invoke-direct {p1, v1}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, LX1/j;->i:Lcom/android/launcher3/anim/d;

    .line 24
    .line 25
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const/high16 v0, 0x3f000000    # 0.5f

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/high16 v0, 0x43480000    # 200.0f

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget v0, p0, LX1/j;->j:F

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/f0;->r(F)Lcom/android/launcher3/anim/f0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p0, p0, LX1/j;->i:Lcom/android/launcher3/anim/d;

    .line 54
    .line 55
    sget-object v0, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 56
    .line 57
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "build(...)"

    .line 62
    .line 63
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-object p0
.end method

.method private final l0(ZJ)Landroid/animation/AnimatorSet;
    .locals 12

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, LX1/j;->e0(Z)Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-wide/16 v2, 0x32

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    move-wide v4, p2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-wide v4, v2

    .line 17
    :goto_0
    const-wide/16 v6, 0x0

    .line 18
    .line 19
    const-wide/16 v8, 0x21

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    move-wide v10, v8

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    move-wide v10, v6

    .line 26
    :goto_1
    sub-long/2addr v4, v10

    .line 27
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    invoke-virtual {v1, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v10, v11}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 35
    .line 36
    .line 37
    sget-object v4, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 38
    .line 39
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, LX1/j;->m:Lcom/android/launcher3/anim/d;

    .line 46
    .line 47
    const/4 v5, 0x0

    .line 48
    if-nez v1, :cond_2

    .line 49
    .line 50
    const-string v1, "bubbleBarBubbleAlpha"

    .line 51
    .line 52
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    move-object v1, v5

    .line 56
    :cond_2
    invoke-direct {p0, p1}, LX1/j;->n0(Z)F

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    invoke-direct {p0, p1}, LX1/j;->m0(Z)F

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    invoke-virtual {v1, v6, v7}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v8, v9}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 78
    .line 79
    .line 80
    invoke-direct {p0, p1}, LX1/j;->k0(Z)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v1, p2, p3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 94
    .line 95
    const-string v2, "bubbleBarViewController"

    .line 96
    .line 97
    if-nez v1, :cond_3

    .line 98
    .line 99
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    move-object v1, v5

    .line 103
    :cond_3
    invoke-virtual {v1, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->Q(Z)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v1, p2, p3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    sget-object v3, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 111
    .line 112
    invoke-virtual {v1, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 116
    .line 117
    .line 118
    const/4 v1, 0x0

    .line 119
    if-eqz p1, :cond_4

    .line 120
    .line 121
    move v4, v1

    .line 122
    goto :goto_2

    .line 123
    :cond_4
    invoke-interface {p0}, LX1/b;->b()F

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    neg-float v4, v4

    .line 128
    :goto_2
    if-eqz p1, :cond_5

    .line 129
    .line 130
    invoke-interface {p0}, LX1/b;->b()F

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    neg-float v6, v6

    .line 135
    goto :goto_3

    .line 136
    :cond_5
    move v6, v1

    .line 137
    :goto_3
    iget-object v7, p0, LX1/j;->p:Lcom/android/launcher3/anim/d;

    .line 138
    .line 139
    if-nez v7, :cond_6

    .line 140
    .line 141
    const-string v7, "bubbleBarBubbleTranslationY"

    .line 142
    .line 143
    invoke-static {v7}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    move-object v7, v5

    .line 147
    :cond_6
    invoke-virtual {v7, v4, v6}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-virtual {v4, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v4, v3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 158
    .line 159
    .line 160
    iget-object v4, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 161
    .line 162
    if-eqz v4, :cond_7

    .line 163
    .line 164
    invoke-virtual {v4, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->g(Z)Landroid/animation/Animator;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    if-eqz v4, :cond_7

    .line 169
    .line 170
    invoke-virtual {v4, p2, p3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v4, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_7
    move-object v4, v5

    .line 178
    :goto_4
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 179
    .line 180
    .line 181
    iget-object v4, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 182
    .line 183
    if-nez v4, :cond_8

    .line 184
    .line 185
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    move-object v4, v5

    .line 189
    :cond_8
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/bubbles/g0;->z0()Z

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    const/high16 v4, 0x3f800000    # 1.0f

    .line 194
    .line 195
    if-eqz v2, :cond_9

    .line 196
    .line 197
    goto :goto_5

    .line 198
    :cond_9
    move v1, v4

    .line 199
    :goto_5
    invoke-direct {p0, p1}, LX1/j;->j0(Z)Landroid/animation/AnimatorSet;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-virtual {v2, p2, p3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 207
    .line 208
    .line 209
    invoke-direct {p0, v2, v1, v4}, LX1/j;->v0(Landroid/animation/Animator;FF)Landroid/animation/Animator;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 213
    .line 214
    .line 215
    if-eqz p1, :cond_a

    .line 216
    .line 217
    invoke-direct {p0}, LX1/j;->r0()F

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    goto :goto_6

    .line 222
    :cond_a
    invoke-interface {p0}, LX1/b;->b()F

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    :goto_6
    iget-object v2, p0, LX1/j;->o:Lcom/android/launcher3/anim/d;

    .line 227
    .line 228
    if-nez v2, :cond_b

    .line 229
    .line 230
    const-string v2, "bubbleBarTranslationYAnimator"

    .line 231
    .line 232
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    goto :goto_7

    .line 236
    :cond_b
    move-object v5, v2

    .line 237
    :goto_7
    invoke-virtual {v5, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-virtual {v1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 248
    .line 249
    .line 250
    new-instance p2, LX1/j$d;

    .line 251
    .line 252
    invoke-direct {p2, p0, p1}, LX1/j$d;-><init>(LX1/j;Z)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 256
    .line 257
    .line 258
    new-instance p2, LX1/j$c;

    .line 259
    .line 260
    invoke-direct {p2, p0, p1}, LX1/j$c;-><init>(LX1/j;Z)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v0, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 264
    .line 265
    .line 266
    return-object v0
.end method

.method private final m0(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    return p0
.end method

.method private final n0(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method private final o0(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method private final r0()F
    .locals 1

    .line 1
    invoke-interface {p0}, LX1/b;->b()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, LX1/j;->k:I

    .line 6
    .line 7
    int-to-float p0, p0

    .line 8
    sub-float/2addr v0, p0

    .line 9
    const/high16 p0, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method private final s0(LN2/h;LN2/h;)Z
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, LN2/m;->a(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p1, p0}, LN2/h;->e(Z)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p2, p0}, LN2/h;->e(Z)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-ne p1, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private final t0()V
    .locals 2

    .line 1
    iget-object v0, p0, LX1/j;->f:LX1/b$c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "controllersAfterInitAction"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    new-instance v1, LX1/f;

    .line 12
    .line 13
    invoke-direct {v1, p0}, LX1/f;-><init>(LX1/j;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, LX1/b$c;->a(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static final u0(LX1/j;)V
    .locals 1

    .line 1
    iget-object v0, p0, LX1/j;->e:Lcom/android/launcher3/taskbar/N2;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "taskbarInsetsController"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->s()V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method private final v0(Landroid/animation/Animator;FF)Landroid/animation/Animator;
    .locals 6

    .line 1
    new-instance v1, Lkotlin/jvm/internal/A;

    .line 2
    .line 3
    invoke-direct {v1}, Lkotlin/jvm/internal/A;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 7
    .line 8
    iput v0, v1, Lkotlin/jvm/internal/A;->g:F

    .line 9
    .line 10
    new-instance v3, Lkotlin/jvm/internal/A;

    .line 11
    .line 12
    invoke-direct {v3}, Lkotlin/jvm/internal/A;-><init>()V

    .line 13
    .line 14
    .line 15
    iput v0, v3, Lkotlin/jvm/internal/A;->g:F

    .line 16
    .line 17
    new-instance v0, LX1/j$g;

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move v4, p2

    .line 21
    move v5, p3

    .line 22
    invoke-direct/range {v0 .. v5}, LX1/j$g;-><init>(Lkotlin/jvm/internal/A;LX1/j;Lkotlin/jvm/internal/A;FF)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, LX1/j$f;

    .line 29
    .line 30
    invoke-direct {p0, v1, v3, v2}, LX1/j$f;-><init>(Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;LX1/j;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    return-object p1
.end method

.method private final y0(F)V
    .locals 2

    .line 1
    iget-object v0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/A0;->z(F)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, LX1/j;->h:Lcom/android/launcher3/util/v1$c;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 14
    .line 15
    .line 16
    :cond_1
    iget-object v0, p0, LX1/j;->o:Lcom/android/launcher3/anim/d;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    const-string v0, "bubbleBarTranslationYAnimator"

    .line 22
    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move-object v0, v1

    .line 27
    :cond_2
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, LX1/j;->l:Lcom/android/launcher3/util/v1$c;

    .line 31
    .line 32
    if-nez p1, :cond_3

    .line 33
    .line 34
    const-string p1, "bubbleBarAlpha"

    .line 35
    .line 36
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    move-object p1, v1

    .line 40
    :cond_3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, LX1/j;->m:Lcom/android/launcher3/anim/d;

    .line 46
    .line 47
    if-nez p1, :cond_4

    .line 48
    .line 49
    const-string p1, "bubbleBarBubbleAlpha"

    .line 50
    .line 51
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    move-object p1, v1

    .line 55
    :cond_4
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, LX1/j;->n:Lcom/android/launcher3/anim/d;

    .line 59
    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    const-string p1, "bubbleBarBackgroundAlpha"

    .line 63
    .line 64
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    move-object p1, v1

    .line 68
    :cond_5
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, LX1/j;->q:Lcom/android/launcher3/anim/d;

    .line 72
    .line 73
    if-nez p1, :cond_6

    .line 74
    .line 75
    const-string p1, "bubbleBarBackgroundScaleX"

    .line 76
    .line 77
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    move-object p1, v1

    .line 81
    :cond_6
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, LX1/j;->r:Lcom/android/launcher3/anim/d;

    .line 85
    .line 86
    if-nez p1, :cond_7

    .line 87
    .line 88
    const-string p1, "bubbleBarBackgroundScaleY"

    .line 89
    .line 90
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    move-object p1, v1

    .line 94
    :cond_7
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 95
    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    invoke-virtual {p0, p1}, LX1/j;->w0(Z)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 102
    .line 103
    if-nez p0, :cond_8

    .line 104
    .line 105
    const-string p0, "bubbleBarViewController"

    .line 106
    .line 107
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_8
    move-object v1, p0

    .line 112
    :goto_0
    invoke-virtual {v1, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->y1(Z)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private final z0()V
    .locals 5

    .line 1
    iget-object v0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/A0;->z(F)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, LX1/j;->h:Lcom/android/launcher3/util/v1$c;

    .line 10
    .line 11
    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, LX1/j;->o:Lcom/android/launcher3/anim/d;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    const-string v0, "bubbleBarTranslationYAnimator"

    .line 24
    .line 25
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object v0, v3

    .line 29
    :cond_2
    invoke-direct {p0}, LX1/j;->r0()F

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-virtual {v0, v4}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, LX1/j;->l:Lcom/android/launcher3/util/v1$c;

    .line 37
    .line 38
    if-nez v0, :cond_3

    .line 39
    .line 40
    const-string v0, "bubbleBarAlpha"

    .line 41
    .line 42
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    move-object v0, v3

    .line 46
    :cond_3
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, LX1/j;->m:Lcom/android/launcher3/anim/d;

    .line 50
    .line 51
    if-nez v0, :cond_4

    .line 52
    .line 53
    const-string v0, "bubbleBarBubbleAlpha"

    .line 54
    .line 55
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    move-object v0, v3

    .line 59
    :cond_4
    invoke-virtual {v0, v2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, LX1/j;->n:Lcom/android/launcher3/anim/d;

    .line 63
    .line 64
    if-nez v0, :cond_5

    .line 65
    .line 66
    const-string v0, "bubbleBarBackgroundAlpha"

    .line 67
    .line 68
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    move-object v0, v3

    .line 72
    :cond_5
    invoke-virtual {v0, v2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, LX1/j;->q:Lcom/android/launcher3/anim/d;

    .line 76
    .line 77
    if-nez v0, :cond_6

    .line 78
    .line 79
    const-string v0, "bubbleBarBackgroundScaleX"

    .line 80
    .line 81
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    move-object v0, v3

    .line 85
    :cond_6
    invoke-virtual {p0}, LX1/j;->p0()F

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, LX1/j;->r:Lcom/android/launcher3/anim/d;

    .line 93
    .line 94
    if-nez v0, :cond_7

    .line 95
    .line 96
    const-string v0, "bubbleBarBackgroundScaleY"

    .line 97
    .line 98
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    move-object v0, v3

    .line 102
    :cond_7
    invoke-virtual {p0}, LX1/j;->q0()F

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 107
    .line 108
    .line 109
    const/4 v0, 0x1

    .line 110
    invoke-virtual {p0, v0}, LX1/j;->w0(Z)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 114
    .line 115
    if-nez p0, :cond_8

    .line 116
    .line 117
    const-string p0, "bubbleBarViewController"

    .line 118
    .line 119
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_8
    move-object v3, p0

    .line 124
    :goto_0
    invoke-virtual {v3, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y1(Z)V

    .line 125
    .line 126
    .line 127
    return-void
.end method


# virtual methods
.method public A(F)V
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->z(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B()Lcom/android/launcher3/util/v1$c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, LX1/j;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "bubbleBarViewController"

    .line 13
    .line 14
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    move-object v0, v1

    .line 18
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, LX1/j;->h:Lcom/android/launcher3/util/v1$c;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    return-object v1
.end method

.method public C(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    const-string v0, "bounds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->h(Landroid/graphics/Rect;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public D()I
    .locals 0

    .line 1
    iget p0, p0, LX1/j;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public final D0(ZZZZ)V
    .locals 6

    .line 1
    iget-object v0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "bubbleBarViewController"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->E0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_1
    const/4 v0, 0x0

    .line 20
    const/4 v3, 0x1

    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    invoke-interface {p0}, LX1/b;->u()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    invoke-interface {p0}, LX1/b;->E()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    move p1, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move p1, v0

    .line 38
    :goto_0
    invoke-virtual {p0}, LX1/j;->c()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eq v4, p1, :cond_5

    .line 43
    .line 44
    invoke-virtual {p0, p1}, LX1/j;->w0(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 48
    .line 49
    if-nez v4, :cond_3

    .line 50
    .line 51
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    move-object v4, v1

    .line 55
    :cond_3
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/bubbles/g0;->j1()V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, LX1/j;->d0()V

    .line 59
    .line 60
    .line 61
    const-wide/16 v4, 0x12c

    .line 62
    .line 63
    invoke-direct {p0, p1, v4, v5}, LX1/j;->l0(ZJ)Landroid/animation/AnimatorSet;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-direct {p0, v4, p1}, LX1/j;->C0(Landroid/animation/Animator;Z)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    if-eqz p4, :cond_4

    .line 71
    .line 72
    invoke-direct {p0, v4}, LX1/j;->F0(Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    :cond_4
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 76
    .line 77
    .line 78
    iput-object v4, p0, LX1/j;->t:Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    :cond_5
    iget-object p1, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 81
    .line 82
    if-nez p1, :cond_6

    .line 83
    .line 84
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    move-object p1, v1

    .line 88
    :cond_6
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eq p1, p2, :cond_9

    .line 93
    .line 94
    if-eqz p2, :cond_7

    .line 95
    .line 96
    if-eqz p3, :cond_7

    .line 97
    .line 98
    move v0, v3

    .line 99
    :cond_7
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 100
    .line 101
    if-nez p0, :cond_8

    .line 102
    .line 103
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_8
    move-object v1, p0

    .line 108
    :goto_1
    invoke-virtual {v1, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v1(ZZ)V

    .line 109
    .line 110
    .line 111
    :cond_9
    :goto_2
    return-void
.end method

.method public F()I
    .locals 1

    .line 1
    invoke-virtual {p0}, LX1/j;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, LX1/j;->k:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, LX1/j;->v()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 17
    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    const-string p0, "bubbleBarViewController"

    .line 21
    .line 22
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->Y()F

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    float-to-int p0, p0

    .line 31
    return p0

    .line 32
    :cond_2
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public G()Z
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public H(F)V
    .locals 0

    .line 1
    iput p1, p0, LX1/j;->A:F

    .line 2
    .line 3
    return-void
.end method

.method public I(LN2/h;)V
    .locals 1

    .line 1
    const-string v0, "bubbleBarLocation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->t(LN2/h;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public J()V
    .locals 7

    .line 1
    const/16 v5, 0xc

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    move-object v0, p0

    .line 9
    invoke-static/range {v0 .. v6}, LX1/j;->E0(LX1/j;ZZZZILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LX1/j;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public d(LX1/b$a;)V
    .locals 10

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LX1/j;->w:LX1/b$a;

    .line 7
    .line 8
    if-ne v0, p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-object p1, p0, LX1/j;->w:LX1/b$a;

    .line 12
    .line 13
    iget-object p1, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const-string v1, "bubbleBarViewController"

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    move-object p1, v0

    .line 24
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object v2, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 29
    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    move-object v0, v2

    .line 37
    :goto_0
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->W0(Z)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    const/4 v1, 0x1

    .line 42
    if-nez p1, :cond_4

    .line 43
    .line 44
    invoke-virtual {p0}, LX1/j;->o()LX1/b$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    sget-object v2, LX1/b$a;->i:LX1/b$a;

    .line 49
    .line 50
    if-ne p1, v2, :cond_3

    .line 51
    .line 52
    move v0, v1

    .line 53
    :cond_3
    invoke-virtual {p0, v0}, LX1/j;->w0(Z)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_4
    iget-object p1, p0, LX1/j;->w:LX1/b$a;

    .line 58
    .line 59
    sget-object v2, LX1/b$a;->h:LX1/b$a;

    .line 60
    .line 61
    if-ne p1, v2, :cond_5

    .line 62
    .line 63
    invoke-direct {p0}, LX1/j;->b0()V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_5
    sget-object v2, LX1/b$a;->g:LX1/b$a;

    .line 68
    .line 69
    if-ne p1, v2, :cond_6

    .line 70
    .line 71
    invoke-direct {p0}, LX1/j;->c0()V

    .line 72
    .line 73
    .line 74
    :cond_6
    :goto_1
    iget-object p1, p0, LX1/j;->w:LX1/b$a;

    .line 75
    .line 76
    sget-object v2, LX1/b$a;->i:LX1/b$a;

    .line 77
    .line 78
    if-ne p1, v2, :cond_7

    .line 79
    .line 80
    move v4, v1

    .line 81
    goto :goto_2

    .line 82
    :cond_7
    move v4, v0

    .line 83
    :goto_2
    const/16 v8, 0xc

    .line 84
    .line 85
    const/4 v9, 0x0

    .line 86
    const/4 v5, 0x0

    .line 87
    const/4 v6, 0x0

    .line 88
    const/4 v7, 0x0

    .line 89
    move-object v3, p0

    .line 90
    invoke-static/range {v3 .. v9}, LX1/j;->E0(LX1/j;ZZZZILjava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public e(ZF)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, LX1/j;->q()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0, p2}, LX1/j;->x0(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, LX1/j;->x:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, LX1/j;->x:Z

    .line 7
    .line 8
    if-nez p1, :cond_2

    .line 9
    .line 10
    iget-object p1, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    const-string p1, "bubbleBarViewController"

    .line 15
    .line 16
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    invoke-direct {p0}, LX1/j;->a0()V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    return-void
.end method

.method public h(LN2/h;LN2/h;)V
    .locals 7

    .line 1
    const-string v0, "fromLocation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "toLocation"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, LX1/j;->s0(LN2/h;LN2/h;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/4 v5, 0x4

    .line 18
    const/4 v6, 0x0

    .line 19
    const/4 v1, 0x1

    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x0

    .line 22
    const/4 v4, 0x0

    .line 23
    move-object v0, p0

    .line 24
    invoke-static/range {v0 .. v6}, LX1/j;->E0(LX1/j;ZZZZILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    move-object v0, p0

    .line 29
    invoke-direct {v0}, LX1/j;->d0()V

    .line 30
    .line 31
    .line 32
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 33
    .line 34
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object p1, v0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    const-string p1, "bubbleBarViewController"

    .line 42
    .line 43
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    :cond_1
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->I(LN2/h;)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {v0, p2}, LX1/j;->f0(LN2/h;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    filled-new-array {p1, p2}, [Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 63
    .line 64
    .line 65
    iput-object p0, v0, LX1/j;->t:Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    return-void
.end method

.method public i()F
    .locals 2

    .line 1
    iget-object v0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "bubbleBarViewController"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->Y()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/high16 v1, 0x40000000    # 2.0f

    .line 16
    .line 17
    div-float/2addr v0, v1

    .line 18
    iget p0, p0, LX1/j;->s:F

    .line 19
    .line 20
    sub-float/2addr p0, v0

    .line 21
    return p0
.end method

.method public j()Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->n()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public k()F
    .locals 2

    .line 1
    iget-object v0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "bubbleBarViewController"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->Y()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, LX1/j;->D()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    neg-int p0, p0

    .line 20
    int-to-float p0, p0

    .line 21
    const/4 v1, 0x2

    .line 22
    int-to-float v1, v1

    .line 23
    div-float/2addr v0, v1

    .line 24
    add-float/2addr p0, v0

    .line 25
    return p0
.end method

.method public l()F
    .locals 0

    .line 1
    iget p0, p0, LX1/j;->z:F

    .line 2
    .line 3
    return p0
.end method

.method public m(ZZ)V
    .locals 7

    .line 1
    const/16 v5, 0x8

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v4, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move v2, p1

    .line 8
    move v3, p2

    .line 9
    invoke-static/range {v0 .. v6}, LX1/j;->E0(LX1/j;ZZZZILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->e:Lcom/android/launcher3/taskbar/N2;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "taskbarInsetsController"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public o()LX1/b$a;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/j;->w:LX1/b$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->p(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    if-nez v0, :cond_3

    .line 18
    .line 19
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-string p0, "bubbleBarViewController"

    .line 24
    .line 25
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->B0(Landroid/view/MotionEvent;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    return v1

    .line 37
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public final p0()F
    .locals 1

    .line 1
    iget-object v0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/A0;->m()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    int-to-float v0, v0

    .line 12
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 13
    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    const-string p0, "bubbleBarViewController"

    .line 17
    .line 18
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->Z()F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    div-float/2addr v0, p0

    .line 27
    return v0
.end method

.method public q()V
    .locals 0

    .line 1
    invoke-direct {p0}, LX1/j;->z0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, LX1/j;->t0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final q0()F
    .locals 1

    .line 1
    iget-object v0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/A0;->l()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    int-to-float v0, v0

    .line 12
    iget-object p0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 13
    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    const-string p0, "bubbleBarViewController"

    .line 17
    .line 18
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->Y()F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    div-float/2addr v0, p0

    .line 27
    return v0
.end method

.method public r(LN2/h;LN2/h;)V
    .locals 8

    .line 1
    const-string v0, "fromLocation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "toLocation"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, LX1/j;->s0(LN2/h;LN2/h;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v6, 0x4

    .line 18
    const/4 v7, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    move-object v1, p0

    .line 24
    invoke-static/range {v1 .. v7}, LX1/j;->E0(LX1/j;ZZZZILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    move-object v1, p0

    .line 29
    invoke-direct {v1}, LX1/j;->d0()V

    .line 30
    .line 31
    .line 32
    iget-object p0, v1, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 33
    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    const-string p0, "bubbleBarViewController"

    .line 37
    .line 38
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->H(LN2/h;LN2/h;)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    new-instance p1, LX1/j$h;

    .line 50
    .line 51
    invoke-direct {p1, v1}, LX1/j$h;-><init>(LX1/j;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-direct {v1, p2}, LX1/j;->h0(LN2/h;)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    filled-new-array {p2, p0}, [Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 74
    .line 75
    .line 76
    iput-object p1, v1, LX1/j;->t:Landroid/animation/AnimatorSet;

    .line 77
    .line 78
    return-void
.end method

.method public s()LM2/i;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LM2/i<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->j()LM2/i;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public t(Lcom/android/launcher3/taskbar/N2;Lcom/android/launcher3/taskbar/bubbles/g0;Lcom/android/launcher3/taskbar/bubbles/A0;LX1/b$c;)V
    .locals 1

    .line 1
    const-string v0, "taskbarInsetsController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bubbleBarViewController"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "controllersAfterInitAction"

    .line 12
    .line 13
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, LX1/j;->e:Lcom/android/launcher3/taskbar/N2;

    .line 17
    .line 18
    iput-object p2, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 19
    .line 20
    iput-object p3, p0, LX1/j;->g:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 21
    .line 22
    iput-object p4, p0, LX1/j;->f:LX1/b$c;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->l0()Lcom/android/launcher3/anim/d;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, LX1/j;->o:Lcom/android/launcher3/anim/d;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->o0()Lcom/android/launcher3/anim/d;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, LX1/j;->p:Lcom/android/launcher3/anim/d;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->S()Lcom/android/launcher3/util/v1;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 p4, 0x0

    .line 41
    invoke-virtual {p1, p4}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, LX1/j;->l:Lcom/android/launcher3/util/v1$c;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->X()Lcom/android/launcher3/anim/d;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, LX1/j;->m:Lcom/android/launcher3/anim/d;

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->T()Lcom/android/launcher3/anim/d;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, LX1/j;->n:Lcom/android/launcher3/anim/d;

    .line 58
    .line 59
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->U()Lcom/android/launcher3/anim/d;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, LX1/j;->q:Lcom/android/launcher3/anim/d;

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->V()Lcom/android/launcher3/anim/d;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, LX1/j;->r:Lcom/android/launcher3/anim/d;

    .line 70
    .line 71
    if-eqz p3, :cond_0

    .line 72
    .line 73
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/bubbles/A0;->l()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    goto :goto_0

    .line 78
    :cond_0
    move p1, p4

    .line 79
    :goto_0
    iput p1, p0, LX1/j;->k:I

    .line 80
    .line 81
    if-eqz p3, :cond_1

    .line 82
    .line 83
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/bubbles/A0;->k()Lcom/android/launcher3/util/v1;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    if-eqz p1, :cond_1

    .line 88
    .line 89
    invoke-virtual {p1, p4}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    goto :goto_1

    .line 94
    :cond_1
    const/4 p1, 0x0

    .line 95
    :goto_1
    iput-object p1, p0, LX1/j;->h:Lcom/android/launcher3/util/v1$c;

    .line 96
    .line 97
    return-void
.end method

.method public v()Z
    .locals 1

    .line 1
    iget-object v0, p0, LX1/j;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "bubbleBarViewController"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, LX1/j;->c()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LX1/j;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public w0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LX1/j;->v:Z

    .line 2
    .line 3
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    invoke-interface {p0}, LX1/b;->b()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, LX1/j;->x0(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x0(F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LX1/j;->y0(F)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, LX1/j;->t0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public y()F
    .locals 0

    .line 1
    iget p0, p0, LX1/j;->s:F

    .line 2
    .line 3
    neg-float p0, p0

    .line 4
    return p0
.end method

.method public z(I)V
    .locals 0

    .line 1
    iput p1, p0, LX1/j;->u:I

    .line 2
    .line 3
    return-void
.end method
