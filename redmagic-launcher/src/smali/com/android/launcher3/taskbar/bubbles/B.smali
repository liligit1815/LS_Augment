.class public final Lcom/android/launcher3/taskbar/bubbles/B;
.super Ljava/lang/Object;
.source "BubbleBarSwipeController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/B$a;,
        Lcom/android/launcher3/taskbar/bubbles/B$b;,
        Lcom/android/launcher3/taskbar/bubbles/B$c;,
        Lcom/android/launcher3/taskbar/bubbles/B$d;,
        Lcom/android/launcher3/taskbar/bubbles/B$e;
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private b:Lcom/android/launcher3/taskbar/bubbles/A0;

.field private c:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private d:LX1/b;

.field private e:Landroid/animation/ValueAnimator;

.field private final f:Lcom/android/launcher3/anim/d;

.field private final g:I

.field private final h:I

.field private i:Lcom/android/launcher3/taskbar/bubbles/B$d;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/taskbar/bubbles/B$c;)V
    .locals 9

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "dimensionProvider"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Lcom/android/launcher3/anim/d;

    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/A;

    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/A;-><init>(Lcom/android/launcher3/taskbar/bubbles/B;)V

    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->f:Lcom/android/launcher3/anim/d;

    .line 4
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/B$d;

    sget-object v3, Lcom/android/launcher3/taskbar/bubbles/B$a;->g:Lcom/android/launcher3/taskbar/bubbles/B$a;

    const/16 v7, 0xe

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v8}, Lcom/android/launcher3/taskbar/bubbles/B$d;-><init>(Lcom/android/launcher3/taskbar/bubbles/B$a;Lcom/android/launcher3/taskbar/bubbles/B$a;ZZILkotlin/jvm/internal/j;)V

    iput-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->a:Landroid/content/Context;

    .line 6
    invoke-interface {p2}, Lcom/android/launcher3/taskbar/bubbles/B$c;->a()I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->g:I

    .line 7
    invoke-interface {p2}, Lcom/android/launcher3/taskbar/bubbles/B$c;->b()I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->h:I

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 1

    const-string v0, "tac"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/B$b;

    invoke-direct {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/B$b;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/B;-><init>(Landroid/content/Context;Lcom/android/launcher3/taskbar/bubbles/B$c;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/B;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/B;->j(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic b(Lcom/android/launcher3/taskbar/bubbles/B;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/B;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final c(F)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->c()Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/taskbar/bubbles/B$e;->a:[I

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    aget v0, v1, v0

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x1

    .line 18
    if-eq v0, v3, :cond_4

    .line 19
    .line 20
    const/4 p0, 0x2

    .line 21
    if-eq v0, p0, :cond_2

    .line 22
    .line 23
    const/4 p0, 0x3

    .line 24
    if-eq v0, p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x4

    .line 27
    if-ne v0, p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance p0, Lh4/j;

    .line 31
    .line 32
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 33
    .line 34
    .line 35
    throw p0

    .line 36
    :cond_1
    :goto_0
    return v2

    .line 37
    :cond_2
    cmpg-float p0, p1, v1

    .line 38
    .line 39
    if-gez p0, :cond_3

    .line 40
    .line 41
    return v3

    .line 42
    :cond_3
    return v2

    .line 43
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->a()Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/B$a;->i:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 50
    .line 51
    if-ne p0, v0, :cond_5

    .line 52
    .line 53
    return v3

    .line 54
    :cond_5
    cmpg-float p0, p1, v1

    .line 55
    .line 56
    if-gez p0, :cond_6

    .line 57
    .line 58
    return v3

    .line 59
    :cond_6
    return v2
.end method

.method private final d()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->c()Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/taskbar/bubbles/B$a;->h:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->a()Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/B$a;->i:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 18
    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private final e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->a()Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/B$a;->h:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private final i(F)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->g:I

    .line 2
    .line 3
    neg-int p0, p0

    .line 4
    int-to-float p0, p0

    .line 5
    cmpg-float p0, p1, p0

    .line 6
    .line 7
    if-gez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private final j(F)V
    .locals 1

    .line 1
    neg-float p1, p1

    .line 2
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->h:I

    .line 3
    .line 4
    invoke-static {p1, v0}, Lcom/android/launcher3/touch/B;->a(FI)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    int-to-float p1, p1

    .line 9
    neg-float p1, p1

    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->b:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->z(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-string p0, "bubbleBarViewController"

    .line 22
    .line 23
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->B1(F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private final k()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->f:Lcom/android/launcher3/anim/d;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->e:Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 27
    .line 28
    sget-object v2, Lcom/android/launcher3/taskbar/bubbles/B$a;->g:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 29
    .line 30
    const/16 v6, 0xe

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x0

    .line 35
    const/4 v5, 0x0

    .line 36
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/taskbar/bubbles/B$d;-><init>(Lcom/android/launcher3/taskbar/bubbles/B$a;Lcom/android/launcher3/taskbar/bubbles/B$a;ZZILkotlin/jvm/internal/j;)V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 40
    .line 41
    return-void
.end method

.method private final l()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/f0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->f:Lcom/android/launcher3/anim/d;

    .line 9
    .line 10
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/high16 v1, 0x3f000000    # 0.5f

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/high16 v1, 0x43480000    # 200.0f

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->f:Lcom/android/launcher3/anim/d;

    .line 34
    .line 35
    sget-object v2, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/B$f;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/B$f;-><init>(Lcom/android/launcher3/taskbar/bubbles/B;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->e:Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method


# virtual methods
.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/B$a;->h:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/taskbar/bubbles/B$a;->i:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 12
    .line 13
    filled-new-array {v0, v1}, [Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Li4/M;->e([Ljava/lang/Object;)Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/B$d;->c()Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->d:LX1/b;

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    const-string v0, "bubbleStashController"

    .line 38
    .line 39
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    :cond_0
    const/4 v1, 0x1

    .line 44
    invoke-interface {v0, v1, v1}, LX1/b;->m(ZZ)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->f:Lcom/android/launcher3/anim/d;

    .line 48
    .line 49
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    cmpg-float v0, v0, v1

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/B;->k()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/B;->l()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final g(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 2

    .line 1
    const-string v0, "bubbleControllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->d:Ljava/util/Optional;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->b:Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->d:LX1/b;

    .line 24
    .line 25
    return-void
.end method

.method public final h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final m()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/B;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->d:LX1/b;

    .line 9
    .line 10
    const-string v1, "bubbleStashController"

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    move-object v0, v2

    .line 19
    :cond_1
    invoke-interface {v0}, LX1/b;->c()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/B$a;->h:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 26
    .line 27
    :goto_0
    move-object v2, v0

    .line 28
    goto :goto_2

    .line 29
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    const-string v0, "bubbleBarViewController"

    .line 34
    .line 35
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    move-object v0, v2

    .line 39
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/B$a;->j:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->d:LX1/b;

    .line 49
    .line 50
    if-nez v0, :cond_5

    .line 51
    .line 52
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_5
    move-object v2, v0

    .line 57
    :goto_1
    invoke-interface {v2}, LX1/b;->v()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_6

    .line 62
    .line 63
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/B$a;->i:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_6
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/B$a;->g:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :goto_2
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 70
    .line 71
    const/16 v6, 0xc

    .line 72
    .line 73
    const/4 v7, 0x0

    .line 74
    const/4 v4, 0x0

    .line 75
    const/4 v5, 0x0

    .line 76
    move-object v3, v2

    .line 77
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/taskbar/bubbles/B$d;-><init>(Lcom/android/launcher3/taskbar/bubbles/B$a;Lcom/android/launcher3/taskbar/bubbles/B$a;ZZILkotlin/jvm/internal/j;)V

    .line 78
    .line 79
    .line 80
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 81
    .line 82
    return-void
.end method

.method public final n(F)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/B;->c(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->f:Lcom/android/launcher3/anim/d;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/B;->i(F)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/B$d;->f(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/B$d;->d()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x1

    .line 30
    const/4 v2, 0x0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->b()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move v0, v2

    .line 43
    goto :goto_1

    .line 44
    :cond_2
    :goto_0
    move v0, v1

    .line 45
    :goto_1
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/B$d;->g(Z)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/B;->e()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    const/4 v0, 0x0

    .line 53
    const-string v3, "bubbleStashController"

    .line 54
    .line 55
    if-eqz p1, :cond_4

    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/B$d;->b()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 66
    .line 67
    sget-object v4, Lcom/android/launcher3/taskbar/bubbles/B$a;->i:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 68
    .line 69
    invoke-virtual {p1, v4}, Lcom/android/launcher3/taskbar/bubbles/B$d;->e(Lcom/android/launcher3/taskbar/bubbles/B$a;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->d:LX1/b;

    .line 73
    .line 74
    if-nez p0, :cond_3

    .line 75
    .line 76
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_3
    move-object v0, p0

    .line 81
    :goto_2
    invoke-interface {v0, v2, v1}, LX1/b;->m(ZZ)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/B;->d()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_6

    .line 90
    .line 91
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/B$d;->b()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_6

    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/B;->i:Lcom/android/launcher3/taskbar/bubbles/B$d;

    .line 100
    .line 101
    sget-object v1, Lcom/android/launcher3/taskbar/bubbles/B$a;->h:Lcom/android/launcher3/taskbar/bubbles/B$a;

    .line 102
    .line 103
    invoke-virtual {p1, v1}, Lcom/android/launcher3/taskbar/bubbles/B$d;->e(Lcom/android/launcher3/taskbar/bubbles/B$a;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/B;->d:LX1/b;

    .line 107
    .line 108
    if-nez p0, :cond_5

    .line 109
    .line 110
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_5
    move-object v0, p0

    .line 115
    :goto_3
    invoke-interface {v0}, LX1/b;->J()V

    .line 116
    .line 117
    .line 118
    :cond_6
    :goto_4
    return-void
.end method
