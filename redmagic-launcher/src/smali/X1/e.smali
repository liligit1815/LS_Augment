.class public final LX1/e;
.super Ljava/lang/Object;
.source "PersistentBubbleStashController.kt"

# interfaces
.implements LX1/b;


# instance fields
.field private final b:LX1/b$d;

.field private c:Lcom/android/launcher3/taskbar/N2;

.field private d:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private e:Lcom/android/launcher3/anim/d;

.field private f:Lcom/android/launcher3/util/v1$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation
.end field

.field private g:Lcom/android/launcher3/anim/d;

.field private h:LX1/b$c;

.field private i:I

.field private j:LX1/b$a;

.field private k:Z

.field private l:Z

.field private final m:Z

.field private final n:Z

.field private o:F


# direct methods
.method public constructor <init>(LX1/b$d;)V
    .locals 1

    .line 1
    const-string v0, "taskbarHotseatDimensionsProvider"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LX1/e;->b:LX1/b$d;

    .line 10
    .line 11
    sget-object p1, LX1/b$a;->i:LX1/b$a;

    .line 12
    .line 13
    iput-object p1, p0, LX1/e;->j:LX1/b$a;

    .line 14
    .line 15
    return-void
.end method

.method public static final synthetic K(LX1/e;)Lcom/android/launcher3/taskbar/N2;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/e;->c:Lcom/android/launcher3/taskbar/N2;

    .line 2
    .line 3
    return-object p0
.end method

.method private final L()V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, LX1/b;->u()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, LX1/b;->E()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_4

    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, LX1/e;->g:Lcom/android/launcher3/anim/d;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    const-string v1, "bubbleBarScaleAnimator"

    .line 24
    .line 25
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object v1, v2

    .line 29
    :cond_1
    const/high16 v3, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v4, p0, LX1/e;->e:Lcom/android/launcher3/anim/d;

    .line 36
    .line 37
    if-nez v4, :cond_2

    .line 38
    .line 39
    const-string v4, "bubbleBarTranslationYAnimator"

    .line 40
    .line 41
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    move-object v4, v2

    .line 45
    :cond_2
    invoke-virtual {p0}, LX1/e;->b()F

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-virtual {v4, v5}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    iget-object v5, p0, LX1/e;->f:Lcom/android/launcher3/util/v1$c;

    .line 54
    .line 55
    if-nez v5, :cond_3

    .line 56
    .line 57
    const-string v5, "bubbleBarAlphaAnimator"

    .line 58
    .line 59
    invoke-static {v5}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    move-object v2, v5

    .line 64
    :goto_0
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const/4 v3, 0x3

    .line 69
    new-array v3, v3, [Landroid/animation/Animator;

    .line 70
    .line 71
    const/4 v5, 0x0

    .line 72
    aput-object v1, v3, v5

    .line 73
    .line 74
    const/4 v1, 0x1

    .line 75
    aput-object v4, v3, v1

    .line 76
    .line 77
    const/4 v1, 0x2

    .line 78
    aput-object v2, v3, v1

    .line 79
    .line 80
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 81
    .line 82
    .line 83
    :cond_4
    invoke-direct {p0, v0}, LX1/e;->R(Landroid/animation/Animator;)V

    .line 84
    .line 85
    .line 86
    const-wide/16 v1, 0x12c

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method private final M()V
    .locals 3

    .line 1
    iget-object v0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

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
    invoke-virtual {p0}, LX1/e;->b()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v0}, LX1/e;->R(Landroid/animation/Animator;)V

    .line 27
    .line 28
    .line 29
    const-wide/16 v1, 0x12c

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private final P(ZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

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
    iget-object v0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move-object v0, v1

    .line 27
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eq v0, p1, :cond_5

    .line 32
    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    const/4 p2, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_3
    const/4 p2, 0x0

    .line 40
    :goto_0
    iget-object p0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 41
    .line 42
    if-nez p0, :cond_4

    .line 43
    .line 44
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_4
    move-object v1, p0

    .line 49
    :goto_1
    invoke-virtual {v1, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->v1(ZZ)V

    .line 50
    .line 51
    .line 52
    :cond_5
    :goto_2
    return-void
.end method

.method static synthetic Q(LX1/e;ZZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, LX1/e;->P(ZZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final R(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    new-instance v0, LX1/e$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LX1/e$a;-><init>(LX1/e;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final synthetic a(LX1/e;)LX1/b$c;
    .locals 0

    .line 1
    iget-object p0, p0, LX1/e;->h:LX1/b$c;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public C(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    const-string p0, "bounds"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D()I
    .locals 0

    .line 1
    iget p0, p0, LX1/e;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public F()I
    .locals 1

    .line 1
    invoke-virtual {p0}, LX1/e;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "bubbleBarViewController"

    .line 12
    .line 13
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->Y()F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    float-to-int p0, p0

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public G()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LX1/e;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public H(F)V
    .locals 3

    .line 1
    iget v0, p0, LX1/e;->o:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, LX1/e;->o:F

    .line 9
    .line 10
    invoke-virtual {p0}, LX1/e;->o()LX1/b$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, LX1/b$a;->h:LX1/b$a;

    .line 15
    .line 16
    if-ne v0, v1, :cond_7

    .line 17
    .line 18
    iget-object v0, p0, LX1/e;->e:Lcom/android/launcher3/anim/d;

    .line 19
    .line 20
    const-string v1, "bubbleBarTranslationYAnimator"

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object v0, v2

    .line 29
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->k()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, LX1/e;->e:Lcom/android/launcher3/anim/d;

    .line 36
    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    move-object v0, v2

    .line 43
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->h()V

    .line 44
    .line 45
    .line 46
    :cond_3
    iget-object v0, p0, LX1/e;->e:Lcom/android/launcher3/anim/d;

    .line 47
    .line 48
    if-nez v0, :cond_4

    .line 49
    .line 50
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    move-object v0, v2

    .line 54
    :cond_4
    invoke-virtual {p0}, LX1/e;->b()F

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    cmpg-float v0, p1, v0

    .line 63
    .line 64
    if-nez v0, :cond_5

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 68
    .line 69
    cmpg-float p1, p1, v0

    .line 70
    .line 71
    if-nez p1, :cond_7

    .line 72
    .line 73
    :goto_0
    iget-object p0, p0, LX1/e;->c:Lcom/android/launcher3/taskbar/N2;

    .line 74
    .line 75
    if-nez p0, :cond_6

    .line 76
    .line 77
    const-string p0, "taskbarInsetsController"

    .line 78
    .line 79
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_6
    move-object v2, p0

    .line 84
    :goto_1
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 85
    .line 86
    .line 87
    :cond_7
    return-void
.end method

.method public I(LN2/h;)V
    .locals 0

    .line 1
    const-string p0, "bubbleBarLocation"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-static {p0, v2, v2, v0, v1}, LX1/e;->Q(LX1/e;ZZILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public N()F
    .locals 0

    .line 1
    iget p0, p0, LX1/e;->o:F

    .line 2
    .line 3
    return p0
.end method

.method public O(F)V
    .locals 2

    .line 1
    iget-object v0, p0, LX1/e;->e:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "bubbleBarTranslationYAnimator"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, LX1/e;->f:Lcom/android/launcher3/util/v1$c;

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    const-string p1, "bubbleBarAlphaAnimator"

    .line 20
    .line 21
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    move-object p1, v1

    .line 25
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, LX1/e;->g:Lcom/android/launcher3/anim/d;

    .line 31
    .line 32
    if-nez p0, :cond_2

    .line 33
    .line 34
    const-string p0, "bubbleBarScaleAnimator"

    .line 35
    .line 36
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    move-object v1, p0

    .line 41
    :goto_0
    invoke-virtual {v1, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public b()F
    .locals 8

    .line 1
    invoke-virtual {p0}, LX1/e;->N()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, LX1/e;->o()LX1/b$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, LX1/b$a;->h:LX1/b$a;

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, LX1/e;->N()F

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p0}, LX1/e;->k()F

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    invoke-virtual {p0}, LX1/e;->l()F

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    sget-object v7, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    const/high16 v4, 0x3f800000    # 1.0f

    .line 34
    .line 35
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_0
    invoke-super {p0}, LX1/b;->b()F

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LX1/e;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public d(LX1/b$a;)V
    .locals 6

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LX1/e;->j:LX1/b$a;

    .line 7
    .line 8
    if-ne v0, p1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    sget-object v1, LX1/b$a;->h:LX1/b$a;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v2

    .line 19
    :goto_0
    iput-object p1, p0, LX1/e;->j:LX1/b$a;

    .line 20
    .line 21
    iget-object p1, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 22
    .line 23
    const-string v3, "bubbleBarViewController"

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    move-object p1, v4

    .line 32
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget-object v5, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 37
    .line 38
    if-nez v5, :cond_3

    .line 39
    .line 40
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    move-object v5, v4

    .line 44
    :cond_3
    invoke-virtual {v5, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->W0(Z)V

    .line 45
    .line 46
    .line 47
    if-nez p1, :cond_4

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_4
    const/4 p1, 0x2

    .line 51
    invoke-static {p0, v2, v2, p1, v4}, LX1/e;->Q(LX1/e;ZZILjava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    if-nez v0, :cond_6

    .line 55
    .line 56
    iget-object p1, p0, LX1/e;->j:LX1/b$a;

    .line 57
    .line 58
    if-ne p1, v1, :cond_5

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_5
    :goto_1
    return-void

    .line 62
    :cond_6
    :goto_2
    invoke-direct {p0}, LX1/e;->M()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public e(ZF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, LX1/e;->O(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, LX1/e;->k:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, LX1/e;->k:Z

    .line 7
    .line 8
    if-nez p1, :cond_2

    .line 9
    .line 10
    iget-object p1, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

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
    invoke-direct {p0}, LX1/e;->L()V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    return-void
.end method

.method public i()F
    .locals 1

    .line 1
    iget-object p0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "bubbleBarViewController"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->Y()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    neg-float p0, p0

    .line 16
    const/high16 v0, 0x40000000    # 2.0f

    .line 17
    .line 18
    div-float/2addr p0, v0

    .line 19
    return p0
.end method

.method public j()Ljava/lang/Float;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k()F
    .locals 2

    .line 1
    iget-object v0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

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
    invoke-virtual {p0}, LX1/e;->D()I

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
    .locals 2

    .line 1
    iget-object v0, p0, LX1/e;->b:LX1/b$d;

    .line 2
    .line 3
    invoke-interface {v0}, LX1/b$d;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v1, "bubbleBarViewController"

    .line 12
    .line 13
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->Y()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object p0, p0, LX1/e;->b:LX1/b$d;

    .line 22
    .line 23
    invoke-interface {p0}, LX1/b$d;->b()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    neg-int v0, v0

    .line 28
    int-to-float v0, v0

    .line 29
    int-to-float p0, p0

    .line 30
    sub-float/2addr p0, v1

    .line 31
    const/high16 v1, 0x40000000    # 2.0f

    .line 32
    .line 33
    div-float/2addr p0, v1

    .line 34
    sub-float/2addr v0, p0

    .line 35
    return v0
.end method

.method public m(ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LX1/e;->P(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    iget-object p0, p0, LX1/e;->c:Lcom/android/launcher3/taskbar/N2;

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
    iget-object p0, p0, LX1/e;->j:LX1/b$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const-string p0, "bubbleBarViewController"

    .line 11
    .line 12
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->B0(Landroid/view/MotionEvent;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public q()V
    .locals 0

    .line 1
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
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public t(Lcom/android/launcher3/taskbar/N2;Lcom/android/launcher3/taskbar/bubbles/g0;Lcom/android/launcher3/taskbar/bubbles/A0;LX1/b$c;)V
    .locals 0

    .line 1
    const-string p3, "taskbarInsetsController"

    .line 2
    .line 3
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p3, "bubbleBarViewController"

    .line 7
    .line 8
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p3, "controllersAfterInitAction"

    .line 12
    .line 13
    invoke-static {p4, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, LX1/e;->c:Lcom/android/launcher3/taskbar/N2;

    .line 17
    .line 18
    iput-object p2, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 19
    .line 20
    iput-object p4, p0, LX1/e;->h:LX1/b$c;

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->l0()Lcom/android/launcher3/anim/d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, LX1/e;->e:Lcom/android/launcher3/anim/d;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->S()Lcom/android/launcher3/util/v1;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 p3, 0x0

    .line 33
    invoke-virtual {p1, p3}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, LX1/e;->f:Lcom/android/launcher3/util/v1$c;

    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->j0()Lcom/android/launcher3/anim/d;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, LX1/e;->g:Lcom/android/launcher3/anim/d;

    .line 44
    .line 45
    return-void
.end method

.method public v()Z
    .locals 0

    .line 1
    iget-object p0, p0, LX1/e;->d:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "bubbleBarViewController"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LX1/e;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public x()V
    .locals 1

    .line 1
    invoke-virtual {p0}, LX1/e;->b()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, LX1/e;->O(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public z(I)V
    .locals 0

    .line 1
    iput p1, p0, LX1/e;->i:I

    .line 2
    .line 3
    return-void
.end method
