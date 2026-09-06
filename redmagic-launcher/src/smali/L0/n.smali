.class public abstract LL0/n;
.super Ljava/lang/Object;
.source "ViewCapture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LL0/n$c;,
        LL0/n$a;,
        LL0/n$b;
    }
.end annotation


# static fields
.field private static final g:J

.field public static final h:LL0/a;


# instance fields
.field private final a:I

.field private final b:I

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LL0/n$c;",
            ">;"
        }
    .end annotation
.end field

.field protected final d:Ljava/util/concurrent/Executor;

.field private e:Z

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, LM0/a$c;->j:LM0/a$c;

    .line 2
    .line 3
    invoke-virtual {v0}, LM0/a$c;->getNumber()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-long v0, v0

    .line 8
    const/16 v2, 0x20

    .line 9
    .line 10
    shl-long/2addr v0, v2

    .line 11
    sget-object v2, LM0/a$c;->i:LM0/a$c;

    .line 12
    .line 13
    invoke-virtual {v2}, LM0/a$c;->getNumber()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    int-to-long v2, v2

    .line 18
    or-long/2addr v0, v2

    .line 19
    sput-wide v0, LL0/n;->g:J

    .line 20
    .line 21
    new-instance v0, LL0/a;

    .line 22
    .line 23
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, LL0/a;-><init>(Landroid/os/Looper;)V

    .line 28
    .line 29
    .line 30
    sput-object v0, LL0/n;->h:LL0/a;

    .line 31
    .line 32
    return-void
.end method

.method protected constructor <init>(IILjava/util/concurrent/Executor;)V
    .locals 1

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
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, LL0/n;->c:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, LL0/n;->e:Z

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, LL0/n;->f:Z

    .line 20
    .line 21
    iput p1, p0, LL0/n;->a:I

    .line 22
    .line 23
    iput-object p3, p0, LL0/n;->d:Ljava/util/concurrent/Executor;

    .line 24
    .line 25
    iput p2, p0, LL0/n;->b:I

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(LL0/n$c;)Z
    .locals 0

    .line 1
    invoke-static {p0}, LL0/n$c;->e(LL0/n$c;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(LL0/n;LL0/n$c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LL0/n;->n(LL0/n$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(LL0/n$a;Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-interface {p2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance v0, LL0/m;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, LL0/m;-><init>(LL0/n$a;Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p2, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/util/List;

    .line 23
    .line 24
    return-object p0
.end method

.method public static synthetic d(LL0/n$a;Ljava/util/ArrayList;LL0/n$c;)LM0/d;
    .locals 0

    .line 1
    invoke-static {p2, p0, p1}, LL0/n$c;->f(LL0/n$c;LL0/n$a;Ljava/util/ArrayList;)LM0/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(LL0/n;Ljava/util/function/Predicate;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LL0/n;->m(Ljava/util/function/Predicate;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic f(LL0/n;)I
    .locals 0

    .line 1
    iget p0, p0, LL0/n;->b:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(LL0/n;)I
    .locals 0

    .line 1
    iget p0, p0, LL0/n;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static h(Ljava/lang/String;I)LL0/a;
    .locals 1

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 7
    .line 8
    .line 9
    new-instance p0, LL0/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-direct {p0, p1}, LL0/a;-><init>(Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method private l(Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/function/Predicate;)Ljava/util/concurrent/CompletableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Class;",
            ">;",
            "Ljava/util/function/Predicate<",
            "LL0/n$c;",
            ">;)",
            "Ljava/util/concurrent/CompletableFuture<",
            "Ljava/util/List<",
            "LM0/d;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LL0/n$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, LL0/n$a;-><init>(Landroid/content/res/Resources;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, LL0/k;

    .line 11
    .line 12
    invoke-direct {p1, p0, p3}, LL0/k;-><init>(LL0/n;Ljava/util/function/Predicate;)V

    .line 13
    .line 14
    .line 15
    sget-object p3, LL0/n;->h:LL0/a;

    .line 16
    .line 17
    invoke-static {p1, p3}, Ljava/util/concurrent/CompletableFuture;->supplyAsync(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/CompletableFuture;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p3, LL0/l;

    .line 22
    .line 23
    invoke-direct {p3, v0, p2}, LL0/l;-><init>(LL0/n$a;Ljava/util/ArrayList;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, LL0/n;->d:Ljava/util/concurrent/Executor;

    .line 27
    .line 28
    invoke-virtual {p1, p3, p0}, Ljava/util/concurrent/CompletableFuture;->thenApplyAsync(Ljava/util/function/Function;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/CompletableFuture;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private synthetic m(Ljava/util/function/Predicate;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, LL0/n;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/util/List;

    .line 20
    .line 21
    return-object p0
.end method

.method private synthetic n(LL0/n$c;)V
    .locals 1

    .line 1
    iget-object v0, p1, LL0/n$c;->g:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, LL0/n$c;->g:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, LL0/n;->c:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, LL0/n$c;->l()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private static s(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, LL0/j;

    .line 6
    .line 7
    invoke-direct {v0}, LL0/j;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/util/List;

    .line 23
    .line 24
    return-object p0
.end method


# virtual methods
.method protected i(Ljava/io/OutputStream;Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-boolean v0, p0, LL0/n;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/io/DataOutputStream;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, LL0/n;->k(Landroid/content/Context;)LM0/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/y;->getSerializedSize()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/google/protobuf/a;->writeTo(Ljava/io/OutputStream;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method protected j(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, LL0/n;->e:Z

    .line 2
    .line 3
    iget-object p1, p0, LL0/n;->c:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, LL0/h;

    .line 6
    .line 7
    invoke-direct {v0}, LL0/h;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    iget-boolean p1, p0, LL0/n;->e:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, LL0/n;->c:Ljava/util/List;

    .line 18
    .line 19
    new-instance p1, LL0/i;

    .line 20
    .line 21
    invoke-direct {p1}, LL0/i;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p0, p1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public k(Landroid/content/Context;)LM0/a;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, LM0/a;->k()LM0/a$b;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget-wide v2, LL0/n;->g:J

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, LM0/a$b;->c(J)LM0/a$b;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, LM0/a$b;->d(Ljava/lang/String;)LM0/a$b;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, LL0/g;

    .line 25
    .line 26
    invoke-direct {v2}, LL0/g;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p1, v0, v2}, LL0/n;->l(Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/function/Predicate;)Ljava/util/concurrent/CompletableFuture;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ljava/util/concurrent/CompletableFuture;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Iterable;

    .line 38
    .line 39
    invoke-virtual {v1, p0}, LM0/a$b;->b(Ljava/lang/Iterable;)LM0/a$b;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v0}, LL0/n;->s(Ljava/util/List;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, LM0/a$b;->a(Ljava/lang/Iterable;)LM0/a$b;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 52
    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    sub-long/2addr v0, v2

    .line 66
    invoke-virtual {p0, v0, v1}, LM0/a$b;->f(J)LM0/a$b;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    check-cast p0, LM0/a;

    .line 75
    .line 76
    return-object p0
.end method

.method protected o(JLjava/lang/String;LL0/n$b;)V
    .locals 0

    .line 1
    return-void
.end method

.method p(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const-string p0, "ViewCapture"

    .line 4
    .line 5
    const-string p1, "Skipping run on UI thread. Provided view == null."

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-ne p0, v0, :cond_1

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-virtual {p2, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public q(Landroid/view/View;Ljava/lang/String;)Landroid/media/permission/SafeCloseable;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LL0/n;->f:Z

    .line 3
    .line 4
    new-instance v0, LL0/n$c;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2}, LL0/n$c;-><init>(LL0/n;Landroid/view/View;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-boolean p2, p0, LL0/n;->e:Z

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, LL0/n$c;->i()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p2, p0, LL0/n;->c:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, LL0/f;

    .line 29
    .line 30
    invoke-direct {p1, p0, v0}, LL0/f;-><init>(LL0/n;LL0/n$c;)V

    .line 31
    .line 32
    .line 33
    return-object p1
.end method

.method public r(Landroid/view/Window;)Landroid/media/permission/SafeCloseable;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1, v0}, LL0/n;->q(Landroid/view/View;Ljava/lang/String;)Landroid/media/permission/SafeCloseable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
