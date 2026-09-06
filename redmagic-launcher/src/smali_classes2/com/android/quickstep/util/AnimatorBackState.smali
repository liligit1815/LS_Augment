.class public final Lcom/android/quickstep/util/AnimatorBackState;
.super Ljava/lang/Object;
.source "BackAnimState.kt"

# interfaces
.implements Lcom/android/quickstep/util/BackAnimState;


# instance fields
.field private final anim:Landroid/animation/AnimatorSet;

.field private final springAnim:Lcom/android/quickstep/util/RectFSpringAnim;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/RectFSpringAnim;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatorBackState;->springAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/AnimatorBackState;->anim:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/AnimatorBackState;->addOnAnimCompleteCallback$lambda$0(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final addOnAnimCompleteCallback$lambda$0(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/t;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public addOnAnimCompleteCallback(Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    const-string v0, "r"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/quickstep/util/AnimatorBackState;->springAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    new-instance p0, Lcom/android/launcher3/t;

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v1, p0}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorBackState;->anim:Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    new-instance v1, Lcom/android/launcher3/t;

    .line 39
    .line 40
    invoke-direct {v1, v0}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    new-instance v1, Lcom/android/launcher3/util/Y1;

    .line 56
    .line 57
    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/quickstep/util/AnimatorBackState;->springAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 61
    .line 62
    if-eqz v2, :cond_3

    .line 63
    .line 64
    new-instance v3, Lcom/android/launcher3/t;

    .line 65
    .line 66
    invoke-direct {v3, v1}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v3}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    invoke-virtual {v1}, Lcom/android/launcher3/util/Y1;->c()V

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorBackState;->anim:Landroid/animation/AnimatorSet;

    .line 81
    .line 82
    if-eqz p0, :cond_4

    .line 83
    .line 84
    new-instance v2, Lcom/android/quickstep/util/h;

    .line 85
    .line 86
    invoke-direct {v2, v1, v0}, Lcom/android/quickstep/util/h;-><init>(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    new-instance p0, Lcom/android/launcher3/t;

    .line 98
    .line 99
    invoke-direct {p0, v0}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    :goto_1
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public applyToAnimationResult(Lcom/android/launcher3/M2$a;Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "result"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "c"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorBackState;->anim:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/M2$a;->t2(Landroid/animation/AnimatorSet;Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorBackState;->anim:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
