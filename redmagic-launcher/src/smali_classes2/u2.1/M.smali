.class public final Lu2/M;
.super Ljava/lang/Object;
.source "ViewTransitionRegistry.kt"

# interfaces
.implements Lu2/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu2/M$a;,
        Lu2/M$b;
    }
.end annotation


# static fields
.field public static final c:Lu2/M$a;

.field private static final d:Lh4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lh4/e<",
            "Lu2/M;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lh4/e;

.field private final b:Lh4/e;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lu2/M$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lu2/M$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lu2/M;->c:Lu2/M$a;

    .line 8
    .line 9
    sget-object v0, Lh4/i;->g:Lh4/i;

    .line 10
    .line 11
    new-instance v1, Lu2/J;

    .line 12
    .line 13
    invoke-direct {v1}, Lu2/J;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lu2/M;->d:Lh4/e;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lu2/K;

    .line 5
    .line 6
    invoke-direct {v0}, Lu2/K;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lu2/M;->a:Lh4/e;

    .line 14
    .line 15
    new-instance v0, Lu2/L;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lu2/L;-><init>(Lu2/M;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lu2/M;->b:Lh4/e;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic d()Lu2/M;
    .locals 1

    .line 1
    invoke-static {}, Lu2/M;->m()Lu2/M;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic e()Ljava/util/Map;
    .locals 1

    .line 1
    invoke-static {}, Lu2/M;->p()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic f(Lu2/M;)Lu2/M$c;
    .locals 0

    .line 1
    invoke-static {p0}, Lu2/M;->n(Lu2/M;)Lu2/M$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic g()Lh4/e;
    .locals 1

    .line 1
    sget-object v0, Lu2/M;->d:Lh4/e;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic h(Lu2/M;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lu2/M;->q(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final i()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lu2/M;->k()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p0

    .line 10
    const-string p0, "transition_registry_view_count"

    .line 11
    .line 12
    invoke-static {p0, v0, v1}, Landroid/os/Trace;->setCounter(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private final j()Lu2/M$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/M;->b:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lu2/M$c;

    .line 8
    .line 9
    return-object p0
.end method

.method private final k()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lu2/N;",
            "Lu2/M$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lu2/M;->a:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Map;

    .line 8
    .line 9
    return-object p0
.end method

.method private static final m()Lu2/M;
    .locals 1

    .line 1
    new-instance v0, Lu2/M;

    .line 2
    .line 3
    invoke-direct {v0}, Lu2/M;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static final n(Lu2/M;)Lu2/M$c;
    .locals 1

    .line 1
    new-instance v0, Lu2/M$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lu2/M$c;-><init>(Lu2/M;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static final p()Ljava/util/Map;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private final q(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lu2/M;->k()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Lu2/N;->a(Ljava/lang/String;)Lu2/N;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lu2/M$b;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Lu2/M$b;->a()Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/view/View;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-direct {p0}, Lu2/M;->j()Lu2/M$c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 34
    .line 35
    .line 36
    sget v1, Lcom/android/systemui/animation/R$id;->tag_view_transition_token:I

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p1}, Lu2/M$b;->a()Ljava/lang/ref/WeakReference;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lu2/M;->o()V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Landroid/view/View;
    .locals 1

    .line 1
    const-string v0, "token"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lu2/M;->k()Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p1}, Lu2/N;->a(Ljava/lang/String;)Lu2/N;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lu2/M$b;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lu2/M$b;->a()Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Landroid/view/View;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public b(Landroid/view/View;)Ljava/lang/String;
    .locals 7

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lu2/M;->l(Landroid/view/View;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lu2/M;->k()Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {v0}, Lu2/N;->a(Ljava/lang/String;)Lu2/N;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lu2/M$b;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Lu2/M$b;->b()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-int/lit8 p1, p1, 0x1

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lu2/M$b;->c(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-object v0

    .line 38
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Lu2/N;->b(Ljava/lang/Class;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v1, Lcom/android/systemui/animation/R$id;->tag_view_transition_token:I

    .line 47
    .line 48
    invoke-static {v0}, Lu2/N;->a(Ljava/lang/String;)Lu2/N;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {p1, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Lu2/M;->j()Lu2/M$c;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {p1, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Lu2/N;->a(Ljava/lang/String;)Lu2/N;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-direct {p0}, Lu2/M;->k()Ljava/util/Map;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    new-instance v3, Lu2/M$b;

    .line 71
    .line 72
    new-instance v4, Ljava/lang/ref/WeakReference;

    .line 73
    .line 74
    invoke-direct {v4, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    const/4 p1, 0x2

    .line 78
    const/4 v5, 0x0

    .line 79
    const/4 v6, 0x0

    .line 80
    invoke-direct {v3, v4, v6, p1, v5}, Lu2/M$b;-><init>(Ljava/lang/ref/WeakReference;IILkotlin/jvm/internal/j;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lu2/M;->o()V

    .line 87
    .line 88
    .line 89
    return-object v0
.end method

.method public c(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "token"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lu2/M;->k()Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p1}, Lu2/N;->a(Ljava/lang/String;)Lu2/N;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lu2/M$b;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Lu2/M$b;->b()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/lit8 v1, v1, -0x1

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lu2/M$b;->c(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Lu2/M$b;->b()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lu2/M;->q(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public l(Landroid/view/View;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget v0, Lcom/android/systemui/animation/R$id;->tag_view_transition_token:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, v0, Lu2/N;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    check-cast v0, Lu2/N;

    .line 18
    .line 19
    invoke-virtual {v0}, Lu2/N;->g()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object v0, v2

    .line 25
    :goto_0
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lu2/M;->a(Ljava/lang/String;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    sget v1, Lcom/android/systemui/animation/R$id;->tag_view_transition_token:I

    .line 34
    .line 35
    invoke-virtual {p1, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0, v0}, Lu2/M;->q(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-object v2

    .line 42
    :cond_1
    return-object v0
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lu2/M;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
