.class public final LM2/i;
.super Ljava/lang/Object;
.source "PhysicsAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LM2/i$a;,
        LM2/i$b;,
        LM2/i$c;,
        LM2/i$d;,
        LM2/i$e;,
        LM2/i$f;,
        LM2/i$g;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final n:LM2/i$b;

.field private static o:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "-",
            "LM2/i<",
            "*>;",
            "Ljava/lang/Object;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final b:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;",
            "Landroidx/dynamicanimation/animation/j;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;",
            "Landroidx/dynamicanimation/animation/f;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;",
            "LM2/i$f;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;",
            "LM2/i$d;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LM2/i$g<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LM2/i$c<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lu4/a<",
            "Lh4/t;",
            ">;>;"
        }
    .end annotation
.end field

.field private i:LM2/i$f;

.field private j:LM2/i$d;

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LM2/i<",
            "TT;>.e;>;"
        }
    .end annotation
.end field

.field private l:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private m:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "-",
            "Ljava/util/Set<",
            "+",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;>;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LM2/i$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LM2/i$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LM2/i;->n:LM2/i$b;

    .line 8
    .line 9
    new-instance v0, LM2/d;

    .line 10
    .line 11
    invoke-direct {v0}, LM2/d;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, LM2/i;->o:Lu4/p;

    .line 15
    .line 16
    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, LM2/i;->a:Ljava/lang/ref/WeakReference;

    .line 4
    new-instance p1, Landroid/util/ArrayMap;

    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    iput-object p1, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 5
    new-instance p1, Landroid/util/ArrayMap;

    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    iput-object p1, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 6
    new-instance p1, Landroid/util/ArrayMap;

    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    iput-object p1, p0, LM2/i;->d:Landroid/util/ArrayMap;

    .line 7
    new-instance p1, Landroid/util/ArrayMap;

    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    iput-object p1, p0, LM2/i;->e:Landroid/util/ArrayMap;

    .line 8
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LM2/i;->f:Ljava/util/ArrayList;

    .line 9
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LM2/i;->g:Ljava/util/ArrayList;

    .line 10
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LM2/i;->h:Ljava/util/ArrayList;

    .line 11
    invoke-static {}, LM2/j;->b()LM2/i$f;

    move-result-object p1

    iput-object p1, p0, LM2/i;->i:LM2/i$f;

    .line 12
    invoke-static {}, LM2/j;->a()LM2/i$d;

    move-result-object p1

    iput-object p1, p0, LM2/i;->j:LM2/i$d;

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LM2/i;->k:Ljava/util/ArrayList;

    .line 14
    new-instance p1, LM2/i$i;

    invoke-direct {p1, p0}, LM2/i$i;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, LM2/i;->l:Lu4/a;

    .line 15
    new-instance p1, LM2/i$h;

    invoke-direct {p1, p0}, LM2/i$h;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, LM2/i;->m:Lu4/l;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM2/i;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic E(LM2/i;Landroidx/dynamicanimation/animation/g;FFLM2/i$f;ILjava/lang/Object;)LM2/i;
    .locals 0

    .line 1
    and-int/lit8 p5, p5, 0x8

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    iget-object p4, p0, LM2/i;->i:LM2/i$f;

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, LM2/i;->C(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;)LM2/i;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private static final G(LM2/i$d;LM2/i;Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;F)Lh4/t;
    .locals 1

    .line 1
    invoke-virtual {p0}, LM2/i$d;->c()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p4, v0}, Ljava/lang/Math;->min(FF)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, LM2/i$d;->e(F)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, LM2/i$d;->b()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {p4, v0}, Ljava/lang/Math;->max(FF)F

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    invoke-virtual {p0, p4}, LM2/i$d;->d(F)V

    .line 21
    .line 22
    .line 23
    filled-new-array {p2}, [Landroidx/dynamicanimation/animation/g;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-virtual {p1, p4}, LM2/i;->l([Landroidx/dynamicanimation/animation/g;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p1, p2, p3}, LM2/i;->t(Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;)Landroidx/dynamicanimation/animation/f;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, LM2/i$d;->a(Landroidx/dynamicanimation/animation/f;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/e;->t()V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 41
    .line 42
    return-object p0
.end method

.method public static synthetic a(Landroidx/dynamicanimation/animation/g;ZFFLandroidx/dynamicanimation/animation/e;LM2/i$e;)Z
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, LM2/i;->r(Landroidx/dynamicanimation/animation/g;ZFFLandroidx/dynamicanimation/animation/e;LM2/i$e;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(LM2/i;Ljava/lang/Object;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LM2/i;->y(LM2/i;Ljava/lang/Object;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(LM2/i$d;LM2/i;Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;F)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, LM2/i;->G(LM2/i$d;LM2/i;Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;F)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, LM2/i;->p(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, LM2/i;->q(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic f()Lu4/p;
    .locals 1

    .line 1
    sget-object v0, LM2/i;->o:Lu4/p;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic g(LM2/i;Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LM2/i;->v(Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;)Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final n()V
    .locals 1

    .line 1
    iget-object v0, p0, LM2/i;->d:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/ArrayMap;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM2/i;->e:Landroid/util/ArrayMap;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/util/ArrayMap;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LM2/i;->f:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, LM2/i;->g:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, LM2/i;->h:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private final o(Landroidx/dynamicanimation/animation/e;Landroidx/dynamicanimation/animation/g;)Landroidx/dynamicanimation/animation/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/e<",
            "*>;",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;)",
            "Landroidx/dynamicanimation/animation/e<",
            "*>;"
        }
    .end annotation

    .line 1
    new-instance v0, LM2/f;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, LM2/f;-><init>(LM2/i;Landroidx/dynamicanimation/animation/g;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 7
    .line 8
    .line 9
    new-instance v0, LM2/g;

    .line 10
    .line 11
    invoke-direct {v0, p0, p2, p1}, LM2/g;-><init>(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 15
    .line 16
    .line 17
    return-object p1
.end method

.method private static final p(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 2

    .line 1
    iget-object p2, p0, LM2/i;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    if-ge v0, p2, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, LM2/i;->k:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, LM2/i$e;

    .line 17
    .line 18
    invoke-virtual {v1, p1, p3, p4}, LM2/i$e;->c(Landroidx/dynamicanimation/animation/g;FF)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method private static final q(LM2/i;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 6

    .line 1
    :try_start_0
    iget-object p3, p0, LM2/i;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, LM2/h;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move-object v5, p2

    .line 7
    move v2, p4

    .line 8
    move v3, p5

    .line 9
    move v4, p6

    .line 10
    :try_start_1
    invoke-direct/range {v0 .. v5}, LM2/h;-><init>(Landroidx/dynamicanimation/animation/g;ZFFLandroidx/dynamicanimation/animation/e;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p3, v0}, Li4/m;->D(Ljava/util/List;Lu4/l;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 14
    .line 15
    .line 16
    goto :goto_2

    .line 17
    :catch_0
    move-exception v0

    .line 18
    :goto_0
    move-object p1, v0

    .line 19
    goto :goto_1

    .line 20
    :catch_1
    move-exception v0

    .line 21
    move-object v1, p1

    .line 22
    move-object v5, p2

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    const-string p2, "PhysicsAnimator"

    .line 25
    .line 26
    const-string p3, "configureDynamicAnimation: "

    .line 27
    .line 28
    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    .line 30
    .line 31
    :goto_2
    iget-object p1, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1, v5}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1, v5}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    iget-object p0, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method private static final r(Landroidx/dynamicanimation/animation/g;ZFFLandroidx/dynamicanimation/animation/e;LM2/i$e;)Z
    .locals 2

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    instance-of p4, p4, Landroidx/dynamicanimation/animation/f;

    .line 7
    .line 8
    move v1, p1

    .line 9
    move-object p1, p0

    .line 10
    move-object p0, p5

    .line 11
    move p5, p4

    .line 12
    move p4, p3

    .line 13
    move p3, p2

    .line 14
    move p2, v1

    .line 15
    invoke-virtual/range {p0 .. p5}, LM2/i$e;->b(Landroidx/dynamicanimation/animation/g;ZFFZ)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method private final t(Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;)Landroidx/dynamicanimation/animation/f;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;TT;)",
            "Landroidx/dynamicanimation/animation/f;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Landroidx/dynamicanimation/animation/f;

    .line 10
    .line 11
    invoke-direct {v1, p2, p1}, Landroidx/dynamicanimation/animation/f;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v1, p1}, LM2/i;->o(Landroidx/dynamicanimation/animation/e;Landroidx/dynamicanimation/animation/g;)Landroidx/dynamicanimation/animation/e;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p2, "null cannot be cast to non-null type androidx.dynamicanimation.animation.FlingAnimation"

    .line 19
    .line 20
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    move-object v1, p0

    .line 24
    check-cast v1, Landroidx/dynamicanimation/animation/f;

    .line 25
    .line 26
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    :cond_0
    const-string p0, "getOrPut(...)"

    .line 30
    .line 31
    invoke-static {v1, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    check-cast v1, Landroidx/dynamicanimation/animation/f;

    .line 35
    .line 36
    return-object v1
.end method

.method public static final u(Ljava/lang/Object;)LM2/i;
    .locals 1
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
    sget-object v0, LM2/i;->n:LM2/i$b;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final v(Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;)Landroidx/dynamicanimation/animation/j;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;TT;)",
            "Landroidx/dynamicanimation/animation/j;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Landroidx/dynamicanimation/animation/j;

    .line 10
    .line 11
    invoke-direct {v1, p2, p1}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v1, p1}, LM2/i;->o(Landroidx/dynamicanimation/animation/e;Landroidx/dynamicanimation/animation/g;)Landroidx/dynamicanimation/animation/e;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p2, "null cannot be cast to non-null type androidx.dynamicanimation.animation.SpringAnimation"

    .line 19
    .line 20
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    move-object v1, p0

    .line 24
    check-cast v1, Landroidx/dynamicanimation/animation/j;

    .line 25
    .line 26
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    :cond_0
    const-string p0, "getOrPut(...)"

    .line 30
    .line 31
    invoke-static {v1, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    check-cast v1, Landroidx/dynamicanimation/animation/j;

    .line 35
    .line 36
    return-object v1
.end method

.method private static final y(LM2/i;Ljava/lang/Object;)Lh4/t;
    .locals 1

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public final A(Landroidx/dynamicanimation/animation/g;F)LM2/i;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;F)",
            "LM2/i<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "property"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 v6, 0x8

    .line 7
    .line 8
    const/4 v7, 0x0

    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v5, 0x0

    .line 11
    move-object v1, p0

    .line 12
    move-object v2, p1

    .line 13
    move v3, p2

    .line 14
    invoke-static/range {v1 .. v7}, LM2/i;->E(LM2/i;Landroidx/dynamicanimation/animation/g;FFLM2/i$f;ILjava/lang/Object;)LM2/i;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final B(Landroidx/dynamicanimation/animation/g;FFFF)LM2/i;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;FFFF)",
            "LM2/i<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "property"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, LM2/j;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v0, LM2/i;->n:LM2/i$b;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, LM2/i$b;->c(Landroidx/dynamicanimation/animation/g;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "Springing "

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, " to "

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, "."

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "PhysicsAnimator"

    .line 49
    .line 50
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object v0, p0, LM2/i;->d:Landroid/util/ArrayMap;

    .line 54
    .line 55
    new-instance v1, LM2/i$f;

    .line 56
    .line 57
    invoke-direct {v1, p4, p5, p3, p2}, LM2/i$f;-><init>(FFFF)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    return-object p0
.end method

.method public final C(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;)LM2/i;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;FF",
            "LM2/i$f;",
            ")",
            "LM2/i<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "property"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "config"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p4}, LM2/i$f;->d()F

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    invoke-virtual {p4}, LM2/i$f;->b()F

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    move-object v1, p0

    .line 20
    move-object v2, p1

    .line 21
    move v3, p2

    .line 22
    move v4, p3

    .line 23
    invoke-virtual/range {v1 .. v6}, LM2/i;->B(Landroidx/dynamicanimation/animation/g;FFFF)LM2/i;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final D(Landroidx/dynamicanimation/animation/g;FLM2/i$f;)LM2/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;F",
            "LM2/i$f;",
            ")",
            "LM2/i<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "property"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "config"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p1, p2, v0, p3}, LM2/i;->C(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;)LM2/i;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final F()V
    .locals 0

    .line 1
    iget-object p0, p0, LM2/i;->l:Lu4/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final H()V
    .locals 14

    .line 1
    iget-object v0, p0, LM2/i;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    if-nez v3, :cond_0

    .line 8
    .line 9
    const-string p0, "PhysicsAnimator"

    .line 10
    .line 11
    const-string v0, "Trying to animate a GC-ed object."

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, LM2/i;->s()Ljava/util/Set;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    move-object v4, v1

    .line 41
    check-cast v4, Landroidx/dynamicanimation/animation/g;

    .line 42
    .line 43
    iget-object v1, p0, LM2/i;->e:Landroid/util/ArrayMap;

    .line 44
    .line 45
    invoke-virtual {v1, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    move-object v2, v1

    .line 50
    check-cast v2, LM2/i$d;

    .line 51
    .line 52
    iget-object v1, p0, LM2/i;->d:Landroid/util/ArrayMap;

    .line 53
    .line 54
    invoke-virtual {v1, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    move-object v12, v1

    .line 59
    check-cast v12, LM2/i$f;

    .line 60
    .line 61
    invoke-virtual {v4, v3}, Landroidx/dynamicanimation/animation/g;->getValue(Ljava/lang/Object;)F

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    new-instance v1, LM2/e;

    .line 68
    .line 69
    move-object v5, v3

    .line 70
    move-object v3, p0

    .line 71
    invoke-direct/range {v1 .. v6}, LM2/e;-><init>(LM2/i$d;LM2/i;Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;F)V

    .line 72
    .line 73
    .line 74
    move-object p0, v1

    .line 75
    move-object v1, v2

    .line 76
    move-object v2, v3

    .line 77
    move-object v3, v5

    .line 78
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    move-object v1, v2

    .line 83
    move-object v2, p0

    .line 84
    :goto_1
    if-eqz v12, :cond_2

    .line 85
    .line 86
    if-nez v1, :cond_3

    .line 87
    .line 88
    invoke-direct {v2, v4, v3}, LM2/i;->v(Landroidx/dynamicanimation/animation/g;Ljava/lang/Object;)Landroidx/dynamicanimation/animation/j;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v12, p0}, LM2/i$f;->a(Landroidx/dynamicanimation/animation/j;)V

    .line 93
    .line 94
    .line 95
    new-instance v1, LM2/i$j;

    .line 96
    .line 97
    invoke-direct {v1, p0}, LM2/i$j;-><init>(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_2
    move-object p0, v2

    .line 104
    goto :goto_0

    .line 105
    :cond_3
    invoke-virtual {v1}, LM2/i$d;->c()F

    .line 106
    .line 107
    .line 108
    move-result v10

    .line 109
    invoke-virtual {v1}, LM2/i$d;->b()F

    .line 110
    .line 111
    .line 112
    move-result v11

    .line 113
    iget-object p0, v2, LM2/i;->g:Ljava/util/ArrayList;

    .line 114
    .line 115
    new-instance v8, LM2/i$k;

    .line 116
    .line 117
    move-object v13, v2

    .line 118
    move-object v9, v4

    .line 119
    invoke-direct/range {v8 .. v13}, LM2/i$k;-><init>(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;LM2/i;)V

    .line 120
    .line 121
    .line 122
    const/4 v1, 0x0

    .line 123
    invoke-virtual {p0, v1, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_4
    move-object v2, p0

    .line 128
    iget-object p0, v2, LM2/i;->k:Ljava/util/ArrayList;

    .line 129
    .line 130
    new-instance v1, LM2/i$e;

    .line 131
    .line 132
    invoke-virtual {v2}, LM2/i;->s()Ljava/util/Set;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    new-instance v5, Ljava/util/ArrayList;

    .line 137
    .line 138
    iget-object v6, v2, LM2/i;->f:Ljava/util/ArrayList;

    .line 139
    .line 140
    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 141
    .line 142
    .line 143
    new-instance v6, Ljava/util/ArrayList;

    .line 144
    .line 145
    iget-object v7, v2, LM2/i;->g:Ljava/util/ArrayList;

    .line 146
    .line 147
    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 148
    .line 149
    .line 150
    new-instance v7, Ljava/util/ArrayList;

    .line 151
    .line 152
    iget-object v8, v2, LM2/i;->h:Ljava/util/ArrayList;

    .line 153
    .line 154
    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 155
    .line 156
    .line 157
    invoke-direct/range {v1 .. v7}, LM2/i$e;-><init>(LM2/i;Ljava/lang/Object;Ljava/util/Set;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_5

    .line 172
    .line 173
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Lu4/a;

    .line 178
    .line 179
    invoke-interface {v0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_5
    invoke-direct {v2}, LM2/i;->n()V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public final varargs I([Lu4/a;)LM2/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lu4/a<",
            "Lh4/t;",
            ">;)",
            "LM2/i<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "endActions"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM2/i;->h:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-static {p1}, Li4/g;->H([Ljava/lang/Object;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public final h(LM2/i$c;)LM2/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LM2/i$c<",
            "TT;>;)",
            "LM2/i<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM2/i;->g:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final i(LM2/i$g;)LM2/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LM2/i$g<",
            "TT;>;)",
            "LM2/i<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM2/i;->f:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final j(Ljava/util/Set;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;>;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "properties"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroidx/dynamicanimation/animation/g;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, LM2/i;->w(Landroidx/dynamicanimation/animation/g;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_2
    return v0
.end method

.method public final k()V
    .locals 3

    .line 1
    iget-object v0, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "<get-keys>(...)"

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, LM2/i;->m:Lu4/l;

    .line 12
    .line 13
    iget-object v2, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v2}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-lez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, LM2/i;->m:Lu4/l;

    .line 34
    .line 35
    iget-object p0, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v0, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public final varargs l([Landroidx/dynamicanimation/animation/g;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "properties"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LM2/i;->m:Lu4/l;

    .line 7
    .line 8
    invoke-static {p1}, Li4/g;->d0([Ljava/lang/Object;)Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final m(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "properties"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroidx/dynamicanimation/animation/g;

    .line 21
    .line 22
    iget-object v1, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroidx/dynamicanimation/animation/f;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/e;->c()V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v1, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroidx/dynamicanimation/animation/j;

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    return-void
.end method

.method public final s()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LM2/i;->d:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "<get-keys>(...)"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, LM2/i;->e:Landroid/util/ArrayMap;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, p0}, Li4/m;->J0(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/Set;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final w(Landroidx/dynamicanimation/animation/g;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "property"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroidx/dynamicanimation/animation/j;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v1

    .line 23
    :goto_0
    if-nez v0, :cond_3

    .line 24
    .line 25
    iget-object p0, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Landroidx/dynamicanimation/animation/f;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move p0, v1

    .line 41
    :goto_1
    if-eqz p0, :cond_2

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    return v1

    .line 45
    :cond_3
    :goto_2
    const/4 p0, 0x1

    .line 46
    return p0
.end method

.method public final x()Z
    .locals 3

    .line 1
    iget-object v0, p0, LM2/i;->b:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "<get-keys>(...)"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, LM2/i;->c:Landroid/util/ArrayMap;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v2}, Li4/m;->J0(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/Set;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, LM2/i;->j(Ljava/util/Set;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public final z(LM2/i$f;)V
    .locals 1

    .line 1
    const-string v0, "defaultSpring"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LM2/i;->i:LM2/i$f;

    .line 7
    .line 8
    return-void
.end method
