.class public Lz1/F0;
.super Ljava/lang/Object;
.source "CacheDataUpdatedTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:I

.field private final b:Landroid/os/UserHandle;

.field private final c:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILandroid/os/UserHandle;Ljava/util/HashSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/UserHandle;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lz1/F0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lz1/F0;->b:Landroid/os/UserHandle;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/F0;->c:Ljava/util/HashSet;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic b(Lz1/F0;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/F0;->i(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Lz1/F0;Lcom/android/launcher3/model/data/A;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/F0;->j(Lcom/android/launcher3/model/data/A;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/A;
    .locals 0

    .line 1
    check-cast p0, Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ls1/P;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/A;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    sget-object v1, Lt1/g;->d:Lt1/g;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ls1/P;->I0(Lcom/android/launcher3/model/data/B;Lt1/g;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f(Lz1/F0;Ls1/P;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lz1/F0;->h(Ls1/P;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h(Ls1/P;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Lz1/F0;->g(Lcom/android/launcher3/model/data/I;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lz1/F0;->c:Ljava/util/HashSet;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p3, p0}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method private synthetic i(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/F0;->b:Landroid/os/UserHandle;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private synthetic j(Lcom/android/launcher3/model/data/A;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/F0;->c:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lz1/o3;->W()Ls1/P;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    monitor-enter p2

    .line 11
    :try_start_0
    iget-object v2, p0, Lz1/F0;->b:Landroid/os/UserHandle;

    .line 12
    .line 13
    new-instance v3, Lz1/A0;

    .line 14
    .line 15
    invoke-direct {v3, p0, v0, v1}, Lz1/A0;-><init>(Lz1/F0;Ls1/P;Ljava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v2, v3}, Lz1/y0;->p(Landroid/os/UserHandle;Ljava/util/function/Consumer;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget-object v3, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 28
    .line 29
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    new-instance v3, Lz1/B0;

    .line 34
    .line 35
    invoke-direct {v3, p0}, Lz1/B0;-><init>(Lz1/F0;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-instance v3, Lz1/C0;

    .line 43
    .line 44
    invoke-direct {v3}, Lz1/C0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    new-instance v3, Lz1/D0;

    .line 52
    .line 53
    invoke-direct {v3, p0}, Lz1/D0;-><init>(Lz1/F0;)V

    .line 54
    .line 55
    .line 56
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    new-instance v3, Lz1/E0;

    .line 61
    .line 62
    invoke-direct {v3, v0, v1}, Lz1/E0;-><init>(Ls1/P;Ljava/util/ArrayList;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lz1/F0;->c:Ljava/util/HashSet;

    .line 69
    .line 70
    iget-object p0, p0, Lz1/F0;->b:Landroid/os/UserHandle;

    .line 71
    .line 72
    invoke-virtual {p3, v0, p0}, Lz1/m;->y(Ljava/util/HashSet;Landroid/os/UserHandle;)V

    .line 73
    .line 74
    .line 75
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    invoke-virtual {p1, v1}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Lz1/o3;->y()V

    .line 80
    .line 81
    .line 82
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_0

    .line 87
    .line 88
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Lcom/android/launcher3/globalsearch/s;->c()V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void

    .line 100
    :catchall_0
    move-exception p0

    .line 101
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    throw p0
.end method

.method public g(Lcom/android/launcher3/model/data/I;)Z
    .locals 1

    .line 1
    iget p0, p0, Lz1/F0;->a:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    return v0
.end method
