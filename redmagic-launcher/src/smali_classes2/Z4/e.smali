.class public LZ4/e;
.super Ljava/lang/Object;
.source "RxJavaSchedulersHook.java"


# static fields
.field private static final a:LZ4/e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LZ4/e;

    .line 2
    .line 3
    invoke-direct {v0}, LZ4/e;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LZ4/e;->a:LZ4/e;

    .line 7
    .line 8
    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lrx/e;
    .locals 2

    .line 1
    new-instance v0, LW4/e;

    .line 2
    .line 3
    const-string v1, "RxComputationScheduler-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, LW4/e;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, LZ4/e;->b(Ljava/util/concurrent/ThreadFactory;)Lrx/e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static b(Ljava/util/concurrent/ThreadFactory;)Lrx/e;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Lrx/internal/schedulers/b;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lrx/internal/schedulers/b;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 10
    .line 11
    const-string v0, "threadFactory == null"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public static c()Lrx/e;
    .locals 2

    .line 1
    new-instance v0, LW4/e;

    .line 2
    .line 3
    const-string v1, "RxIoScheduler-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, LW4/e;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, LZ4/e;->d(Ljava/util/concurrent/ThreadFactory;)Lrx/e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static d(Ljava/util/concurrent/ThreadFactory;)Lrx/e;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Lrx/internal/schedulers/a;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lrx/internal/schedulers/a;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 10
    .line 11
    const-string v0, "threadFactory == null"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public static e()Lrx/e;
    .locals 2

    .line 1
    new-instance v0, LW4/e;

    .line 2
    .line 3
    const-string v1, "RxNewThreadScheduler-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, LW4/e;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, LZ4/e;->f(Ljava/util/concurrent/ThreadFactory;)Lrx/e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static f(Ljava/util/concurrent/ThreadFactory;)Lrx/e;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Lrx/internal/schedulers/c;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lrx/internal/schedulers/c;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 10
    .line 11
    const-string v0, "threadFactory == null"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public static h()LZ4/e;
    .locals 1

    .line 1
    sget-object v0, LZ4/e;->a:LZ4/e;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public g()Lrx/e;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public i()Lrx/e;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j()Lrx/e;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k(LT4/a;)LT4/a;
    .locals 0

    .line 1
    return-object p1
.end method
