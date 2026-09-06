.class public Lcom/android/launcher3/util/x2;
.super Landroid/content/BroadcastReceiver;
.source "SimpleBroadcastReceiver.java"


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/Handler;",
            "Ljava/util/function/Consumer<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 4
    iput-object p3, p0, Lcom/android/launcher3/util/x2;->b:Ljava/util/function/Consumer;

    .line 5
    iput-object p2, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/util/p1;",
            "Ljava/util/function/Consumer<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    move-result-object p2

    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/util/function/Consumer;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/x2;Ljava/lang/Runnable;I[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/util/x2;->i(Ljava/lang/Runnable;I[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/x2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/x2;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/util/x2;Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/util/x2;->j(Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/util/x2;Ljava/lang/Runnable;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/x2;->h(Ljava/lang/Runnable;[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/util/x2;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/x2;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static varargs f([Ljava/lang/String;)Landroid/content/IntentFilter;
    .locals 4

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length v1, p0

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_0

    .line 9
    .line 10
    aget-object v3, p0, v2

    .line 11
    .line 12
    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 p0, 0x3e8

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/content/IntentFilter;->setPriority(I)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static varargs g(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/IntentFilter;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/util/x2;->f([Ljava/lang/String;)Landroid/content/IntentFilter;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "package"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, p0, v0}, Landroid/content/IntentFilter;->addDataSchemeSpecificPart(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p1
.end method

.method private synthetic h(Ljava/lang/Runnable;[Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Lcom/android/launcher3/util/x2;->t(Landroid/content/Context;Ljava/lang/Runnable;[Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic i(Ljava/lang/Runnable;I[Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/android/launcher3/util/x2;->r(Landroid/content/Context;Ljava/lang/Runnable;I[Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic j(Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/x2;->s(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic k(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/android/launcher3/util/x2;->g(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/IntentFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x2

    .line 8
    invoke-virtual {v0, p0, p1, p2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/x2;->w(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private varargs r(Landroid/content/Context;Ljava/lang/Runnable;I[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p4}, Lcom/android/launcher3/util/x2;->f([Ljava/lang/String;)Landroid/content/IntentFilter;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p1, p0, p4, p3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private varargs s(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p5}, Lcom/android/launcher3/util/x2;->f([Ljava/lang/String;)Landroid/content/IntentFilter;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    const/4 v4, 0x0

    .line 6
    move-object v1, p0

    .line 7
    move-object v0, p1

    .line 8
    move-object v3, p3

    .line 9
    move v5, p4

    .line 10
    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private varargs t(Landroid/content/Context;Ljava/lang/Runnable;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/android/launcher3/util/x2;->f([Ljava/lang/String;)Landroid/content/IntentFilter;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const/4 v0, 0x2

    .line 6
    invoke-virtual {p1, p0, p3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private w(Landroid/content/Context;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method


# virtual methods
.method public varargs m(I[Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/launcher3/util/x2;->n(Ljava/lang/Runnable;I[Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public varargs n(Ljava/lang/Runnable;I[Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/android/launcher3/util/x2;->r(Landroid/content/Context;Ljava/lang/Runnable;I[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 20
    .line 21
    new-instance v1, Lcom/android/launcher3/util/w2;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/util/w2;-><init>(Lcom/android/launcher3/util/x2;Ljava/lang/Runnable;I[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public varargs o(Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v3, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 14
    .line 15
    move-object v2, p0

    .line 16
    move-object v4, p1

    .line 17
    move-object v5, p2

    .line 18
    move v6, p3

    .line 19
    move-object v7, p4

    .line 20
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/util/x2;->s(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    move-object v2, p0

    .line 25
    move-object v4, p1

    .line 26
    move-object v5, p2

    .line 27
    move v6, p3

    .line 28
    move-object v7, p4

    .line 29
    iget-object p0, v2, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 30
    .line 31
    move v8, v6

    .line 32
    move-object v6, v4

    .line 33
    new-instance v4, Lcom/android/launcher3/util/v2;

    .line 34
    .line 35
    move-object v9, v7

    .line 36
    move-object v7, v5

    .line 37
    move-object v5, v2

    .line 38
    invoke-direct/range {v4 .. v9}, Lcom/android/launcher3/util/v2;-><init>(Lcom/android/launcher3/util/x2;Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/x2;->b:Ljava/util/function/Consumer;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public varargs p(Ljava/lang/Runnable;[Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-direct {p0, v0, p1, p2}, Lcom/android/launcher3/util/x2;->t(Landroid/content/Context;Ljava/lang/Runnable;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 20
    .line 21
    new-instance v1, Lcom/android/launcher3/util/s2;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/util/s2;-><init>(Lcom/android/launcher3/util/x2;Ljava/lang/Runnable;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public varargs q([Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/x2;->p(Ljava/lang/Runnable;[Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public varargs u(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {p1, p2}, Lcom/android/launcher3/util/x2;->g(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/IntentFilter;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 p2, 0x2

    .line 20
    invoke-virtual {v0, p0, p1, p2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 25
    .line 26
    new-instance v1, Lcom/android/launcher3/util/u2;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/util/u2;-><init>(Lcom/android/launcher3/util/x2;Ljava/lang/String;[Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/x2;->w(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/x2;->c:Landroid/os/Handler;

    .line 20
    .line 21
    new-instance v1, Lcom/android/launcher3/util/t2;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/android/launcher3/util/t2;-><init>(Lcom/android/launcher3/util/x2;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method
