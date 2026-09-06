.class public LD1/t;
.super Ljava/lang/Object;
.source "UserCache.java"


# static fields
.field public static g:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "LD1/t;",
            ">;"
        }
    .end annotation
.end field

.field public static final h:Ljava/lang/String;

.field public static final i:Ljava/lang/String;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/function/BiConsumer<",
            "Landroid/os/UserHandle;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final b:Lcom/android/launcher3/util/x2;

.field private final c:Lcom/android/launcher3/util/f;

.field private d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/os/UserHandle;",
            "Lcom/android/launcher3/util/N2;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/os/UserHandle;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final f:Landroid/os/UserManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, LD1/l;

    .line 4
    .line 5
    invoke-direct {v1}, LD1/l;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    sget-boolean v0, Lcom/android/launcher3/N5;->g:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v1, "android.intent.action.PROFILE_ADDED"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v1, "android.intent.action.MANAGED_PROFILE_ADDED"

    .line 21
    .line 22
    :goto_0
    sput-object v1, LD1/t;->h:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v1, "android.intent.action.PROFILE_REMOVED"

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const-string v1, "android.intent.action.MANAGED_PROFILE_REMOVED"

    .line 30
    .line 31
    :goto_1
    sput-object v1, LD1/t;->i:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const-string v1, "android.intent.action.PROFILE_ACCESSIBLE"

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_2
    const-string v1, "android.intent.action.MANAGED_PROFILE_UNLOCKED"

    .line 39
    .line 40
    :goto_2
    sput-object v1, LD1/t;->j:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const-string v0, "android.intent.action.PROFILE_INACCESSIBLE"

    .line 45
    .line 46
    goto :goto_3

    .line 47
    :cond_3
    const-string v0, "android.intent.action.MANAGED_PROFILE_UNAVAILABLE"

    .line 48
    .line 49
    :goto_3
    sput-object v0, LD1/t;->k:Ljava/lang/String;

    .line 50
    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/f;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LD1/t;->a:Ljava/util/List;

    .line 10
    .line 11
    iput-object p3, p0, LD1/t;->c:Lcom/android/launcher3/util/f;

    .line 12
    .line 13
    new-instance p3, Lcom/android/launcher3/util/x2;

    .line 14
    .line 15
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 16
    .line 17
    new-instance v1, LD1/m;

    .line 18
    .line 19
    invoke-direct {v1, p0}, LD1/m;-><init>(LD1/t;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p3, p1, v0, v1}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 23
    .line 24
    .line 25
    iput-object p3, p0, LD1/t;->b:Lcom/android/launcher3/util/x2;

    .line 26
    .line 27
    sget-object p3, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 28
    .line 29
    iput-object p3, p0, LD1/t;->d:Ljava/util/Map;

    .line 30
    .line 31
    new-instance p3, LD1/n;

    .line 32
    .line 33
    invoke-direct {p3, p0}, LD1/n;-><init>(LD1/t;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    new-instance p3, LD1/o;

    .line 40
    .line 41
    invoke-direct {p3, p0}, LD1/o;-><init>(LD1/t;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 45
    .line 46
    .line 47
    const-class p2, Landroid/os/UserManager;

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Landroid/os/UserManager;

    .line 54
    .line 55
    iput-object p1, p0, LD1/t;->f:Landroid/os/UserManager;

    .line 56
    .line 57
    return-void
.end method

.method public static synthetic a(LD1/t;Ljava/util/Map;Landroid/os/UserHandle;Lcom/android/launcher3/util/N2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LD1/t;->t(Ljava/util/Map;Landroid/os/UserHandle;Lcom/android/launcher3/util/N2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(JLjava/util/Map$Entry;)Z
    .locals 2

    .line 1
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Lcom/android/launcher3/util/N2;

    .line 6
    .line 7
    iget-wide v0, p2, Lcom/android/launcher3/util/N2;->c:J

    .line 8
    .line 9
    cmp-long p0, p0, v0

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static synthetic c(LD1/t;Ljava/util/function/BiConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LD1/t;->s(Ljava/util/function/BiConsumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(LD1/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LD1/t;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(LD1/t;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LD1/t;->v(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(LD1/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LD1/t;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(LD1/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LD1/t;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Landroid/os/UserHandle;Ljava/lang/String;Ljava/util/function/BiConsumer;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Landroid/os/UserHandle;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LD1/t;->d:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v2, LD1/r;

    .line 9
    .line 10
    invoke-direct {v2, p0, v0}, LD1/r;-><init>(LD1/t;Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v1, v2}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static k(Landroid/content/Context;)LD1/t;
    .locals 1

    .line 1
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LD1/t;

    .line 8
    .line 9
    return-object p0
.end method

.method private q()V
    .locals 10

    .line 1
    iget-object v0, p0, LD1/t;->b:Lcom/android/launcher3/util/x2;

    .line 2
    .line 3
    sget-object v4, LD1/t;->h:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v5, LD1/t;->i:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v6, LD1/t;->j:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v7, LD1/t;->k:Ljava/lang/String;

    .line 10
    .line 11
    const-string v8, "android.intent.action.PROFILE_AVAILABLE"

    .line 12
    .line 13
    const-string v9, "android.intent.action.PROFILE_UNAVAILABLE"

    .line 14
    .line 15
    const-string v1, "android.intent.action.MANAGED_PROFILE_AVAILABLE"

    .line 16
    .line 17
    const-string v2, "android.intent.action.MANAGED_PROFILE_UNAVAILABLE"

    .line 18
    .line 19
    const-string v3, "android.intent.action.MANAGED_PROFILE_REMOVED"

    .line 20
    .line 21
    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/x2;->q([Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, LD1/t;->w()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic s(Ljava/util/function/BiConsumer;)V
    .locals 0

    .line 1
    iget-object p0, p0, LD1/t;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic t(Ljava/util/Map;Landroid/os/UserHandle;Lcom/android/launcher3/util/N2;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Lcom/android/launcher3/util/N2;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, LD1/t;->c:Lcom/android/launcher3/util/f;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/f;->h(Landroid/os/UserHandle;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic u()V
    .locals 0

    .line 1
    iget-object p0, p0, LD1/t;->b:Lcom/android/launcher3/util/x2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private v(Landroid/content/Intent;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, LD1/p;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LD1/p;-><init>(LD1/t;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "android.intent.extra.USER"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/os/UserHandle;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, LD1/t;->a:Ljava/util/List;

    .line 27
    .line 28
    new-instance v1, LD1/q;

    .line 29
    .line 30
    invoke-direct {v1, v0, p1}, LD1/q;-><init>(Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private w()V
    .locals 1

    .line 1
    iget-object v0, p0, LD1/t;->c:Lcom/android/launcher3/util/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/f;->m()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, LD1/t;->d:Ljava/util/Map;

    .line 8
    .line 9
    invoke-direct {p0}, LD1/t;->j()Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, LD1/t;->e:Ljava/util/Map;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public i(Ljava/util/function/BiConsumer;)Lcom/android/launcher3/util/a2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/BiConsumer<",
            "Landroid/os/UserHandle;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/android/launcher3/util/a2;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LD1/t;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    new-instance v0, LD1/s;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, LD1/s;-><init>(LD1/t;Ljava/util/function/BiConsumer;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public l(Landroid/os/UserHandle;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LD1/t;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public m(Landroid/os/UserHandle;)J
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-wide p0, p0, Lcom/android/launcher3/util/N2;->c:J

    .line 6
    .line 7
    return-wide p0
.end method

.method public n(J)Landroid/os/UserHandle;
    .locals 1

    .line 1
    iget-object p0, p0, LD1/t;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, LD1/j;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, LD1/j;-><init>(J)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, LD1/k;

    .line 25
    .line 26
    invoke-direct {p1}, LD1/k;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Landroid/os/UserHandle;

    .line 42
    .line 43
    return-object p0
.end method

.method public o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;
    .locals 1

    .line 1
    iget-object p0, p0, LD1/t;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/N2;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Lcom/android/launcher3/util/N2;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/util/N2;-><init>(Landroid/os/UserHandle;I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-object p0
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LD1/t;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ljava/util/List;->copyOf(Ljava/util/Collection;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public r(Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    iget-object p0, p0, LD1/t;->f:Landroid/os/UserManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/os/UserManager;->isUserUnlocked(Landroid/os/UserHandle;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
