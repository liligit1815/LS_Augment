.class public Lk/c;
.super Lk/e;
.source "ArchTaskExecutor.java"


# static fields
.field private static volatile c:Lk/c;

.field private static final d:Ljava/util/concurrent/Executor;

.field private static final e:Ljava/util/concurrent/Executor;


# instance fields
.field private a:Lk/e;

.field private final b:Lk/e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lk/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lk/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lk/c;->d:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    new-instance v0, Lk/b;

    .line 9
    .line 10
    invoke-direct {v0}, Lk/b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lk/c;->e:Ljava/util/concurrent/Executor;

    .line 14
    .line 15
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lk/e;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lk/d;

    .line 5
    .line 6
    invoke-direct {v0}, Lk/d;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lk/c;->b:Lk/e;

    .line 10
    .line 11
    iput-object v0, p0, Lk/c;->a:Lk/e;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Lk/c;->f()Lk/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lk/c;->c(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Lk/c;->f()Lk/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lk/c;->a(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f()Lk/c;
    .locals 2

    .line 1
    sget-object v0, Lk/c;->c:Lk/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lk/c;->c:Lk/c;

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const-class v0, Lk/c;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    sget-object v1, Lk/c;->c:Lk/c;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Lk/c;

    .line 16
    .line 17
    invoke-direct {v1}, Lk/c;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lk/c;->c:Lk/c;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    sget-object v0, Lk/c;->c:Lk/c;

    .line 27
    .line 28
    return-object v0

    .line 29
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v1
.end method


# virtual methods
.method public a(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lk/c;->a:Lk/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lk/e;->a(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lk/c;->a:Lk/e;

    .line 2
    .line 3
    invoke-virtual {p0}, Lk/e;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lk/c;->a:Lk/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lk/e;->c(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
