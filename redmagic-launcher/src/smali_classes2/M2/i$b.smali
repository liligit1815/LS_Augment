.class public final LM2/i$b;
.super Ljava/lang/Object;
.source "PhysicsAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LM2/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LM2/i$b;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)LM2/i;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "LM2/i<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "target"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, LM2/j;->e()Ljava/util/WeakHashMap;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, LM2/i;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, p1, v1}, LM2/i;-><init>(Ljava/lang/Object;Lkotlin/jvm/internal/j;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, LM2/i$b;->b()Lu4/p;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0, v0, p1}, Lu4/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    invoke-static {}, LM2/j;->e()Ljava/util/WeakHashMap;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-static {}, LM2/j;->e()Ljava/util/WeakHashMap;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "null cannot be cast to non-null type com.android.wm.shell.shared.animation.PhysicsAnimator<T of com.android.wm.shell.shared.animation.PhysicsAnimator.Companion.getInstance>"

    .line 45
    .line 46
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    check-cast p0, LM2/i;

    .line 50
    .line 51
    return-object p0
.end method

.method public final b()Lu4/p;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lu4/p<",
            "LM2/i<",
            "*>;",
            "Ljava/lang/Object;",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, LM2/i;->f()Lu4/p;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c(Landroidx/dynamicanimation/animation/g;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    const-string p0, "property"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Landroidx/dynamicanimation/animation/e;->n:Landroidx/dynamicanimation/animation/e$s;

    .line 7
    .line 8
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-string p0, "translationX"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    sget-object p0, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 18
    .line 19
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const-string p0, "translationY"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    sget-object p0, Landroidx/dynamicanimation/animation/e;->p:Landroidx/dynamicanimation/animation/e$s;

    .line 29
    .line 30
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    const-string p0, "translationZ"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    sget-object p0, Landroidx/dynamicanimation/animation/e;->q:Landroidx/dynamicanimation/animation/e$s;

    .line 40
    .line 41
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const-string p0, "scaleX"

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_3
    sget-object p0, Landroidx/dynamicanimation/animation/e;->r:Landroidx/dynamicanimation/animation/e$s;

    .line 51
    .line 52
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_4

    .line 57
    .line 58
    const-string p0, "scaleY"

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_4
    sget-object p0, Landroidx/dynamicanimation/animation/e;->s:Landroidx/dynamicanimation/animation/e$s;

    .line 62
    .line 63
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_5

    .line 68
    .line 69
    const-string p0, "rotation"

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_5
    sget-object p0, Landroidx/dynamicanimation/animation/e;->t:Landroidx/dynamicanimation/animation/e$s;

    .line 73
    .line 74
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_6

    .line 79
    .line 80
    const-string p0, "rotationX"

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_6
    sget-object p0, Landroidx/dynamicanimation/animation/e;->u:Landroidx/dynamicanimation/animation/e$s;

    .line 84
    .line 85
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_7

    .line 90
    .line 91
    const-string p0, "rotationY"

    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_7
    sget-object p0, Landroidx/dynamicanimation/animation/e;->z:Landroidx/dynamicanimation/animation/e$s;

    .line 95
    .line 96
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_8

    .line 101
    .line 102
    const-string p0, "scrollX"

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_8
    sget-object p0, Landroidx/dynamicanimation/animation/e;->A:Landroidx/dynamicanimation/animation/e$s;

    .line 106
    .line 107
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_9

    .line 112
    .line 113
    const-string p0, "scrollY"

    .line 114
    .line 115
    return-object p0

    .line 116
    :cond_9
    sget-object p0, Landroidx/dynamicanimation/animation/e;->y:Landroidx/dynamicanimation/animation/e$s;

    .line 117
    .line 118
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_a

    .line 123
    .line 124
    const-string p0, "alpha"

    .line 125
    .line 126
    return-object p0

    .line 127
    :cond_a
    const-string p0, "Custom FloatPropertyCompat instance"

    .line 128
    .line 129
    return-object p0
.end method
