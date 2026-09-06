.class public final Lcom/android/quickstep/util/AnimatorBackStateMulti;
.super Ljava/lang/Object;
.source "BackAnimState.kt"

# interfaces
.implements Lcom/android/quickstep/util/BackAnimState;


# instance fields
.field private final anim:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

.field private final springAnim:Lcom/android/quickstep/util/RectFSpringAnim;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/RectFSpringAnim;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatorBackStateMulti;->springAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/AnimatorBackStateMulti;->anim:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/AnimatorBackStateMulti;->addOnAnimCompleteCallback$lambda$0(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;)V

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
    iget-object v1, p0, Lcom/android/quickstep/util/AnimatorBackStateMulti;->springAnim:Lcom/android/quickstep/util/RectFSpringAnim;

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
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorBackStateMulti;->anim:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

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
    check-cast v1, Lcom/android/launcher3/anim/T;

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    new-instance v1, Lcom/android/launcher3/util/Y1;

    .line 58
    .line 59
    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/android/quickstep/util/AnimatorBackStateMulti;->springAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 63
    .line 64
    if-eqz v2, :cond_3

    .line 65
    .line 66
    new-instance v3, Lcom/android/launcher3/t;

    .line 67
    .line 68
    invoke-direct {v3, v1}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v3}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    invoke-virtual {v1}, Lcom/android/launcher3/util/Y1;->c()V

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorBackStateMulti;->anim:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 83
    .line 84
    if-eqz p0, :cond_4

    .line 85
    .line 86
    new-instance v2, Lcom/android/quickstep/util/i;

    .line 87
    .line 88
    invoke-direct {v2, v1, v0}, Lcom/android/quickstep/util/i;-><init>(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Lcom/android/launcher3/anim/T;

    .line 96
    .line 97
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    new-instance p0, Lcom/android/launcher3/t;

    .line 102
    .line 103
    invoke-direct {p0, v0}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    :goto_1
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 110
    .line 111
    .line 112
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
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorBackStateMulti;->anim:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p1, p0, p2, v0}, Lcom/android/launcher3/M2$a;->v2(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Ljava/lang/Runnable;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorBackStateMulti;->anim:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->start()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
