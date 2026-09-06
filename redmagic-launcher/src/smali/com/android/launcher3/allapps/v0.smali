.class public abstract Lcom/android/launcher3/allapps/v0;
.super Ljava/lang/Object;
.source "UserProfileManager.java"


# instance fields
.field protected final g:Lcom/android/launcher3/logging/StatsLogManager;

.field protected final h:Landroid/os/UserManager;

.field protected final i:LD1/t;

.field private j:I


# direct methods
.method protected constructor <init>(Landroid/os/UserManager;Lcom/android/launcher3/logging/StatsLogManager;LD1/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/allapps/v0;->h:Landroid/os/UserManager;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/allapps/v0;->g:Lcom/android/launcher3/logging/StatsLogManager;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/allapps/v0;->i:LD1/t;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/allapps/v0;ZLandroid/content/Context;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/v0;->k(ZLandroid/content/Context;Landroid/os/UserHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/allapps/v0;ZLandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/v0;->l(ZLandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/allapps/v0;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/v0;->j(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic j(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->g()Ljava/util/function/Predicate;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private synthetic k(ZLandroid/content/Context;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p3, p2}, Lcom/android/launcher3/allapps/v0;->p(ZLandroid/os/UserHandle;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic l(ZLandroid/content/Context;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/v0;->i:LD1/t;

    .line 2
    .line 3
    invoke-virtual {v0}, LD1/t;->p()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->g()Ljava/util/function/Predicate;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Lcom/android/launcher3/allapps/u0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/allapps/u0;-><init>(Lcom/android/launcher3/allapps/v0;ZLandroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private p(ZLandroid/os/UserHandle;Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/v0;->h:Landroid/os/UserManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/os/UserManager;->requestQuietModeEnabled(ZLandroid/os/UserHandle;)Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    sget-object p0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/util/f;

    .line 14
    .line 15
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/f;->a(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/v0;->j:I

    .line 2
    .line 3
    return p0
.end method

.method protected e()Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/s0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/allapps/s0;-><init>(Lcom/android/launcher3/allapps/v0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public f()Landroid/os/UserHandle;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/v0;->i:LD1/t;

    .line 2
    .line 3
    invoke-virtual {v0}, LD1/t;->p()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->g()Ljava/util/function/Predicate;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {v0, p0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/stream/Stream;->findAny()Ljava/util/Optional;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Landroid/os/UserHandle;

    .line 29
    .line 30
    return-object p0
.end method

.method protected abstract g()Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/function/Predicate<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation
.end method

.method public h()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/v0;->j:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method protected m(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/v0;->g:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected n(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/v0;->j:I

    .line 2
    .line 3
    return-void
.end method

.method protected o(ZLandroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/allapps/t0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/allapps/t0;-><init>(Lcom/android/launcher3/allapps/v0;ZLandroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
