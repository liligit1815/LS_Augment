.class public final LE2/c;
.super Ljava/lang/Object;
.source "RotationChangeProvider.kt"

# interfaces
.implements LF2/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LE2/c$a;,
        LE2/c$b;,
        LE2/c$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LF2/d<",
        "LE2/c$c;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Landroid/hardware/display/DisplayManager;

.field private final h:Landroid/content/Context;

.field private final i:Landroid/os/Handler;

.field private final j:Landroid/os/Handler;

.field private final k:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "LE2/c$c;",
            ">;"
        }
    .end annotation
.end field

.field private final l:LE2/c$b;

.field private final m:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Landroid/hardware/display/DisplayManager;Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)V
    .locals 1

    .line 1
    const-string v0, "displayManager"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "context"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "bgHandler"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "callbackHandler"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, LE2/c;->g:Landroid/hardware/display/DisplayManager;

    .line 25
    .line 26
    iput-object p2, p0, LE2/c;->h:Landroid/content/Context;

    .line 27
    .line 28
    iput-object p3, p0, LE2/c;->i:Landroid/os/Handler;

    .line 29
    .line 30
    iput-object p4, p0, LE2/c;->j:Landroid/os/Handler;

    .line 31
    .line 32
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, LE2/c;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 38
    .line 39
    new-instance p1, LE2/c$b;

    .line 40
    .line 41
    invoke-direct {p1, p0}, LE2/c$b;-><init>(LE2/c;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, LE2/c;->l:LE2/c$b;

    .line 45
    .line 46
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 47
    .line 48
    const/4 p2, -0x1

    .line 49
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, LE2/c;->m:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 53
    .line 54
    return-void
.end method

.method public static synthetic a(LE2/c;LE2/c$c;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LE2/c;->g(LE2/c;LE2/c$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(LE2/c;LE2/c$c;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LE2/c;->i(LE2/c;LE2/c$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic c(LE2/c;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, LE2/c;->h:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(LE2/c;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 1
    iget-object p0, p0, LE2/c;->m:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic e(LE2/c;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, LE2/c;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method private static final g(LE2/c;LE2/c$c;)V
    .locals 1

    .line 1
    iget-object v0, p0, LE2/c;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, LE2/c;->j()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, LE2/c;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private static final i(LE2/c;LE2/c$c;)V
    .locals 1

    .line 1
    iget-object v0, p0, LE2/c;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LE2/c;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, LE2/c;->k()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, LE2/c;->m:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    const/4 p1, -0x1

    .line 20
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private final j()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, LE2/c;->g:Landroid/hardware/display/DisplayManager;

    .line 2
    .line 3
    iget-object v1, p0, LE2/c;->l:LE2/c$b;

    .line 4
    .line 5
    iget-object p0, p0, LE2/c;->j:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    throw p0
.end method

.method private final k()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, LE2/c;->g:Landroid/hardware/display/DisplayManager;

    .line 2
    .line 3
    iget-object p0, p0, LE2/c;->l:LE2/c$b;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    throw p0
.end method


# virtual methods
.method public f(LE2/c$c;)V
    .locals 2

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LE2/c;->i:Landroid/os/Handler;

    .line 7
    .line 8
    new-instance v1, LE2/a;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, LE2/a;-><init>(LE2/c;LE2/c$c;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public h(LE2/c$c;)V
    .locals 2

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LE2/c;->i:Landroid/os/Handler;

    .line 7
    .line 8
    new-instance v1, LE2/b;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, LE2/b;-><init>(LE2/c;LE2/c$c;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
