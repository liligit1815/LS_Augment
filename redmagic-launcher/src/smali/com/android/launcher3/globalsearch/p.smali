.class Lcom/android/launcher3/globalsearch/p;
.super Ljava/lang/Object;
.source "GSearchManager.java"

# interfaces
.implements Lcom/android/launcher3/globalsearch/s;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/globalsearch/p$a;
    }
.end annotation


# static fields
.field private static final i:Landroid/os/HandlerThread;

.field private static final j:Landroid/os/Handler;


# instance fields
.field private a:Lcom/android/launcher3/globalsearch/b;

.field private b:Lcom/android/launcher3/globalsearch/r$a;

.field private c:Lcom/android/launcher3/H5$b;

.field private d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation
.end field

.field private e:Lcom/android/launcher3/globalsearch/p$a;

.field private volatile f:Z

.field private g:Landroid/content/Context;

.field private volatile h:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    const-string v1, "search_thread"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/globalsearch/p;->i:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/os/Handler;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 20
    .line 21
    .line 22
    sput-object v1, Lcom/android/launcher3/globalsearch/p;->j:Landroid/os/Handler;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/globalsearch/i;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/globalsearch/i;-><init>(Lcom/android/launcher3/globalsearch/p;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/globalsearch/p;->c:Lcom/android/launcher3/H5$b;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    new-instance v1, Lcom/android/launcher3/globalsearch/p$a;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Lcom/android/launcher3/globalsearch/p$a;-><init>(Lcom/android/launcher3/globalsearch/q;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/android/launcher3/globalsearch/p;->e:Lcom/android/launcher3/globalsearch/p$a;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lcom/android/launcher3/globalsearch/p;->f:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/globalsearch/p;->h:Z

    .line 25
    .line 26
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/globalsearch/b;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Lcom/android/launcher3/globalsearch/b;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 34
    .line 35
    return-void
.end method

.method private synthetic A()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/g;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic B(Landroid/content/ComponentName;Landroid/os/UserHandle;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "startAppLocationAnim begin"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "Global_Search_GSearchManager"

    .line 22
    .line 23
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    new-instance v0, Lcom/android/launcher3/globalsearch/d;

    .line 27
    .line 28
    invoke-direct {v0}, Lcom/android/launcher3/globalsearch/d;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->e:Lcom/android/launcher3/globalsearch/p$a;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Lcom/android/launcher3/globalsearch/d;->r(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/globalsearch/d;->s(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private synthetic C(Landroid/content/Intent;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/globalsearch/g;->B(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private D(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onLauncherBGDataChanged: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "Global_Search_GSearchManager"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->b:Lcom/android/launcher3/globalsearch/r$a;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Lcom/android/launcher3/globalsearch/r$a;->a()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method static J(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/globalsearch/p;->i:Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadId()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {}, Landroid/os/Process;->myTid()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lcom/android/launcher3/globalsearch/p;->j:Landroid/os/Handler;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/globalsearch/p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/globalsearch/p;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/globalsearch/p;Landroid/content/Intent;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/globalsearch/p;->C(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/globalsearch/p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/globalsearch/p;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/globalsearch/p;Landroid/content/ComponentName;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/globalsearch/p;->B(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/globalsearch/p;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/p;->D(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/android/launcher3/globalsearch/p;[Ljava/lang/String;Landroid/os/UserHandle;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/globalsearch/p;->z([Ljava/lang/String;Landroid/os/UserHandle;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/globalsearch/p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/globalsearch/p;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static u()Lcom/android/launcher3/globalsearch/p;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/launcher3/globalsearch/p;

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    return-object v0
.end method

.method private synthetic x()V
    .locals 2

    .line 1
    const-string v0, "Global_Search_GSearchManager"

    .line 2
    .line 3
    const-string v1, "forceReload"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/globalsearch/g;->j()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/b;->e()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic y()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/globalsearch/b;->d()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/globalsearch/p;->K(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic z([Ljava/lang/String;Landroid/os/UserHandle;I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p1

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 8
    .line 9
    aget-object v2, p1, v0

    .line 10
    .line 11
    invoke-virtual {v1, v2, p2, p3}, Lcom/android/launcher3/globalsearch/g;->b(Ljava/lang/String;Landroid/os/UserHandle;I)V

    .line 12
    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public E(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public G(Ljava/lang/String;Z)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/globalsearch/GSearchItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/globalsearch/b;->g(Ljava/lang/String;Z)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public H(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/globalsearch/GSearchItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/globalsearch/b;->b(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public I(Landroid/content/Context;I)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/globalsearch/GSearchItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->a:Lcom/android/launcher3/globalsearch/b;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/android/launcher3/globalsearch/b;->h(I)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public K(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setHasInit: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Global_Search_GSearchManager"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/android/launcher3/globalsearch/p;->h:Z

    .line 24
    .line 25
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/globalsearch/p;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public M(Landroid/content/ComponentName;Landroid/os/UserHandle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "Global_Search_GSearchManager"

    .line 13
    .line 14
    const-string v1, "startAppLocationAnim,start home "

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/launcher3/C2;

    .line 26
    .line 27
    new-instance v1, Lcom/android/launcher3/globalsearch/j;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/globalsearch/j;-><init>(Lcom/android/launcher3/globalsearch/p;Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/C2;->v4(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/android/launcher3/C2;

    .line 42
    .line 43
    const/4 p2, 0x0

    .line 44
    invoke-virtual {p1, p2}, Lcom/android/launcher3/C2;->m1(Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 48
    .line 49
    new-instance p2, Landroid/content/Intent;

    .line 50
    .line 51
    const-string v0, "android.intent.action.MAIN"

    .line 52
    .line 53
    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    const-string v0, "android.intent.category.HOME"

    .line 67
    .line 68
    invoke-virtual {p2, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    const/high16 v0, 0x10000000

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    check-cast p0, Lcom/android/launcher3/C2;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    :goto_0
    return-void
.end method

.method public N()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->d:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "supportAppLocationAnim: "

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->C0()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, "="

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->M0()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v2, "Global_Search_GSearchManager"

    .line 61
    .line 62
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->C0()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->M0()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_1

    .line 84
    .line 85
    const/4 p0, 0x1

    .line 86
    return p0

    .line 87
    :cond_1
    :goto_0
    return v1
.end method

.method public varargs a(Landroid/os/UserHandle;I[Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    array-length v0, p3

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    new-instance v0, Lcom/android/launcher3/globalsearch/m;

    .line 8
    .line 9
    invoke-direct {v0, p0, p3, p1, p2}, Lcom/android/launcher3/globalsearch/m;-><init>(Lcom/android/launcher3/globalsearch/p;[Ljava/lang/String;Landroid/os/UserHandle;I)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/globalsearch/p;->J(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    const-string p0, "Global_Search_GSearchManager"

    .line 17
    .line 18
    const-string p1, "onPackageChanged pkgs is null, no need to update"

    .line 19
    .line 20
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/globalsearch/p;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/globalsearch/l;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/globalsearch/l;-><init>(Lcom/android/launcher3/globalsearch/p;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/globalsearch/p;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Lcom/android/launcher3/globalsearch/r$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lcom/android/launcher3/globalsearch/p;->c:Lcom/android/launcher3/H5$b;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lcom/android/launcher3/H5;->t0(Lcom/android/launcher3/H5$b;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/p;->c:Lcom/android/launcher3/H5$b;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->a(Lcom/android/launcher3/H5$b;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/p;->b:Lcom/android/launcher3/globalsearch/r$a;

    .line 31
    .line 32
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "com.zte.mifavor.zsearch"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public f(Landroid/content/Intent;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Lcom/android/launcher3/globalsearch/k;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/globalsearch/k;-><init>(Lcom/android/launcher3/globalsearch/p;Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/launcher3/globalsearch/p;->J(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    :goto_0
    const-string p0, "Global_Search_GSearchManager"

    .line 20
    .line 21
    const-string p1, "updateRecentOpenApp intent is null, no need to update"

    .line 22
    .line 23
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/globalsearch/n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/globalsearch/n;-><init>(Lcom/android/launcher3/globalsearch/p;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/globalsearch/p;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "initData foreInit "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " hasInit "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/android/launcher3/globalsearch/p;->h:Z

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Global_Search_GSearchManager"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    iget-boolean p1, p0, Lcom/android/launcher3/globalsearch/p;->h:Z

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    new-instance p1, Lcom/android/launcher3/globalsearch/o;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Lcom/android/launcher3/globalsearch/o;-><init>(Lcom/android/launcher3/globalsearch/p;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/globalsearch/p;->J(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 10

    .line 1
    const/4 p2, 0x4

    .line 2
    new-instance v0, Landroid/os/Bundle;

    .line 3
    .line 4
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "doCallAction method= "

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "Global_Search_GSearchManager"

    .line 25
    .line 26
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    const-string v1, "="

    .line 33
    .line 34
    const-string v3, "query_app_search_key"

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    const-string v5, "gs_items"

    .line 38
    .line 39
    const/4 v6, 0x1

    .line 40
    const/4 v7, 0x0

    .line 41
    const/4 v8, -0x1

    .line 42
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v9

    .line 46
    sparse-switch v9, :sswitch_data_0

    .line 47
    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :sswitch_0
    const-string v9, "start_app_location_anim"

    .line 52
    .line 53
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_0

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :cond_0
    const/16 v8, 0xb

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_1
    const-string v9, "clear_old_data"

    .line 66
    .line 67
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_1
    const/16 v8, 0xa

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :sswitch_2
    const-string v9, "query_current_gaussian_blur_state"

    .line 80
    .line 81
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_2

    .line 86
    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :cond_2
    const/16 v8, 0x9

    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :sswitch_3
    const-string v9, "query_app_detail"

    .line 94
    .line 95
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_3

    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :cond_3
    const/16 v8, 0x8

    .line 104
    .line 105
    goto/16 :goto_0

    .line 106
    .line 107
    :sswitch_4
    const-string v9, "query_recommend_app"

    .line 108
    .line 109
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_4

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_4
    const/4 v8, 0x7

    .line 117
    goto :goto_0

    .line 118
    :sswitch_5
    const-string v9, "get_app_icon"

    .line 119
    .line 120
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_5

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_5
    const/4 v8, 0x6

    .line 128
    goto :goto_0

    .line 129
    :sswitch_6
    const-string v9, "query_current_color"

    .line 130
    .line 131
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-nez p1, :cond_6

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_6
    const/4 v8, 0x5

    .line 139
    goto :goto_0

    .line 140
    :sswitch_7
    const-string v9, "get_switch_data"

    .line 141
    .line 142
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_7

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_7
    move v8, p2

    .line 150
    goto :goto_0

    .line 151
    :sswitch_8
    const-string v9, "start_recent_aty"

    .line 152
    .line 153
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-nez p1, :cond_8

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_8
    const/4 v8, 0x3

    .line 161
    goto :goto_0

    .line 162
    :sswitch_9
    const-string v9, "get_processed_icon"

    .line 163
    .line 164
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-nez p1, :cond_9

    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_9
    const/4 v8, 0x2

    .line 172
    goto :goto_0

    .line 173
    :sswitch_a
    const-string v9, "support_app_location_anim"

    .line 174
    .line 175
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-nez p1, :cond_a

    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_a
    move v8, v6

    .line 183
    goto :goto_0

    .line 184
    :sswitch_b
    const-string v9, "query_app"

    .line 185
    .line 186
    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-nez p1, :cond_b

    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_b
    move v8, v7

    .line 194
    :goto_0
    packed-switch v8, :pswitch_data_0

    .line 195
    .line 196
    .line 197
    goto/16 :goto_3

    .line 198
    .line 199
    :pswitch_0
    const-string p1, "start_app_location_anim_res"

    .line 200
    .line 201
    invoke-virtual {v0, p1, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/p;->N()Z

    .line 205
    .line 206
    .line 207
    move-result p2

    .line 208
    if-nez p2, :cond_c

    .line 209
    .line 210
    goto/16 :goto_3

    .line 211
    .line 212
    :cond_c
    if-eqz p3, :cond_e

    .line 213
    .line 214
    const-string p2, "start_app_location_anim_cm"

    .line 215
    .line 216
    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    const-string v1, "start_app_location_anim_user"

    .line 221
    .line 222
    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 223
    .line 224
    .line 225
    move-result p3

    .line 226
    invoke-static {p2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-virtual {v1, p3}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 235
    .line 236
    .line 237
    move-result-object p3

    .line 238
    if-eqz p2, :cond_18

    .line 239
    .line 240
    if-nez p3, :cond_d

    .line 241
    .line 242
    goto/16 :goto_3

    .line 243
    .line 244
    :cond_d
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/globalsearch/p;->M(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 245
    .line 246
    .line 247
    :cond_e
    invoke-virtual {v0, p1, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 248
    .line 249
    .line 250
    return-object v0

    .line 251
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/p;->q()Z

    .line 252
    .line 253
    .line 254
    const-string p0, "clear_old_data_res"

    .line 255
    .line 256
    invoke-virtual {v0, p0, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 257
    .line 258
    .line 259
    return-object v0

    .line 260
    :pswitch_2
    invoke-static {}, Lx1/O;->c0()Z

    .line 261
    .line 262
    .line 263
    move-result p0

    .line 264
    new-instance p1, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    const-string p2, "doCallAction: GS_METHOD_QUERY_DISPLAY_GAUSSIAN_BLUR_STATE guassianBlurState="

    .line 270
    .line 271
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    .line 283
    .line 284
    const-string p1, "query_current_gaussian_blur_state_result"

    .line 285
    .line 286
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 287
    .line 288
    .line 289
    return-object v0

    .line 290
    :pswitch_3
    if-eqz p3, :cond_f

    .line 291
    .line 292
    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    :cond_f
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    if-eqz p1, :cond_10

    .line 301
    .line 302
    goto/16 :goto_3

    .line 303
    .line 304
    :cond_10
    invoke-virtual {p0, v4}, Lcom/android/launcher3/globalsearch/p;->H(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    invoke-virtual {v0, v5, p0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 309
    .line 310
    .line 311
    return-object v0

    .line 312
    :pswitch_4
    const-string p1, "recommend_app_size"

    .line 313
    .line 314
    if-eqz p3, :cond_11

    .line 315
    .line 316
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v1

    .line 320
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 321
    .line 322
    .line 323
    move-result v1

    .line 324
    if-nez v1, :cond_11

    .line 325
    .line 326
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p2

    .line 330
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 331
    .line 332
    .line 333
    move-result p2

    .line 334
    :cond_11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 335
    .line 336
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    .line 338
    .line 339
    const-string v3, "recentTaskSize = "

    .line 340
    .line 341
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const-string v3, ", extras = "

    .line 348
    .line 349
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    if-nez p3, :cond_12

    .line 353
    .line 354
    const-string p1, "null"

    .line 355
    .line 356
    goto :goto_1

    .line 357
    :cond_12
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object p1

    .line 361
    :goto_1
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    .line 370
    .line 371
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 372
    .line 373
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/globalsearch/p;->I(Landroid/content/Context;I)Ljava/util/ArrayList;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    invoke-virtual {v0, v5, p0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 378
    .line 379
    .line 380
    return-object v0

    .line 381
    :pswitch_5
    const-string p1, "get_app_icon_res"

    .line 382
    .line 383
    invoke-virtual {v0, p1, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 384
    .line 385
    .line 386
    if-eqz p3, :cond_18

    .line 387
    .line 388
    const-string p2, "get_app_icon_intent"

    .line 389
    .line 390
    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object p2

    .line 394
    const-string v3, "get_app_icon_user"

    .line 395
    .line 396
    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 397
    .line 398
    .line 399
    move-result p3

    .line 400
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 401
    .line 402
    .line 403
    move-result-object v3

    .line 404
    invoke-virtual {v3, p3}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 405
    .line 406
    .line 407
    move-result-object p3

    .line 408
    :try_start_0
    invoke-static {p2, v7}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 409
    .line 410
    .line 411
    move-result-object v3

    .line 412
    if-eqz v3, :cond_18

    .line 413
    .line 414
    if-nez p3, :cond_13

    .line 415
    .line 416
    goto/16 :goto_3

    .line 417
    .line 418
    :cond_13
    new-instance v4, Ljava/lang/StringBuilder;

    .line 419
    .line 420
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 421
    .line 422
    .line 423
    const-string v5, "intent   ===="

    .line 424
    .line 425
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    .line 427
    .line 428
    invoke-virtual {v3}, Landroid/content/Intent;->toString()Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v5

    .line 432
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    .line 447
    .line 448
    invoke-virtual {p0, v3, p3}, Lcom/android/launcher3/globalsearch/p;->r(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/graphics/drawable/Drawable;

    .line 449
    .line 450
    .line 451
    move-result-object p0

    .line 452
    if-nez p0, :cond_14

    .line 453
    .line 454
    goto/16 :goto_3

    .line 455
    .line 456
    :cond_14
    invoke-static {p0}, Lx1/O;->I(Landroid/graphics/drawable/Drawable;)[B

    .line 457
    .line 458
    .line 459
    move-result-object p0

    .line 460
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 461
    .line 462
    .line 463
    return-object v0

    .line 464
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 465
    .line 466
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 467
    .line 468
    .line 469
    const-string p1, "Failed to parse intent "

    .line 470
    .line 471
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    .line 473
    .line 474
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object p0

    .line 481
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    .line 483
    .line 484
    goto/16 :goto_3

    .line 485
    .line 486
    :pswitch_6
    new-instance p1, Ljava/util/ArrayList;

    .line 487
    .line 488
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 489
    .line 490
    .line 491
    iget-object p2, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 492
    .line 493
    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 494
    .line 495
    .line 496
    move-result-object p2

    .line 497
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 498
    .line 499
    .line 500
    move-result-object p2

    .line 501
    invoke-virtual {p2}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 502
    .line 503
    .line 504
    move-result-object p2

    .line 505
    invoke-virtual {p2}, Lcom/android/launcher3/H5$g;->a()I

    .line 506
    .line 507
    .line 508
    move-result p2

    .line 509
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 510
    .line 511
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 512
    .line 513
    .line 514
    move-result-object p0

    .line 515
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 516
    .line 517
    .line 518
    move-result-object p0

    .line 519
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 520
    .line 521
    .line 522
    move-result-object p0

    .line 523
    invoke-virtual {p0}, Lcom/android/launcher3/H5$g;->f()I

    .line 524
    .line 525
    .line 526
    move-result p0

    .line 527
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 528
    .line 529
    .line 530
    move-result-object p3

    .line 531
    invoke-virtual {p1, v7, p3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 532
    .line 533
    .line 534
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 535
    .line 536
    .line 537
    move-result-object p3

    .line 538
    invoke-virtual {p1, v6, p3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 539
    .line 540
    .line 541
    new-instance p3, Ljava/lang/StringBuilder;

    .line 542
    .line 543
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 544
    .line 545
    .line 546
    const-string v1, "doCallAction: GS_METHOD_QUERY_CURRENT_COLOR foreColor="

    .line 547
    .line 548
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 552
    .line 553
    .line 554
    move-result-object p2

    .line 555
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 556
    .line 557
    .line 558
    const-string p2, ",   statusBarColor = "

    .line 559
    .line 560
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    .line 562
    .line 563
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object p0

    .line 567
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object p0

    .line 574
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 575
    .line 576
    .line 577
    const-string p0, "query_current_color_result"

    .line 578
    .line 579
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 580
    .line 581
    .line 582
    return-object v0

    .line 583
    :pswitch_7
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/p;->w()Ljava/util/Map;

    .line 584
    .line 585
    .line 586
    move-result-object p0

    .line 587
    new-instance p1, Ljava/lang/StringBuilder;

    .line 588
    .line 589
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 590
    .line 591
    .line 592
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 593
    .line 594
    .line 595
    move-result-object p2

    .line 596
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 597
    .line 598
    .line 599
    move-result-object p2

    .line 600
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 601
    .line 602
    .line 603
    move-result p3

    .line 604
    if-eqz p3, :cond_15

    .line 605
    .line 606
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 607
    .line 608
    .line 609
    move-result-object p3

    .line 610
    check-cast p3, Ljava/lang/String;

    .line 611
    .line 612
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 613
    .line 614
    .line 615
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    invoke-interface {p0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 619
    .line 620
    .line 621
    move-result-object p3

    .line 622
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 623
    .line 624
    .line 625
    const-string p3, "#"

    .line 626
    .line 627
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 628
    .line 629
    .line 630
    goto :goto_2

    .line 631
    :cond_15
    const-string p0, "get_switch_data_parcel_data"

    .line 632
    .line 633
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 634
    .line 635
    .line 636
    move-result-object p1

    .line 637
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    .line 639
    .line 640
    return-object v0

    .line 641
    :pswitch_8
    if-eqz p3, :cond_18

    .line 642
    .line 643
    const-string p1, "start_recent_aty_intent"

    .line 644
    .line 645
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object p1

    .line 649
    const-string p2, "start_recent_aty_user"

    .line 650
    .line 651
    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 652
    .line 653
    .line 654
    move-result p2

    .line 655
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 656
    .line 657
    .line 658
    move-result-object p3

    .line 659
    invoke-virtual {p3, p2}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 660
    .line 661
    .line 662
    move-result-object p2

    .line 663
    new-instance p3, Ljava/lang/StringBuilder;

    .line 664
    .line 665
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 666
    .line 667
    .line 668
    const-string v1, "doCallAction: GS_METHOD_START_RECENT_ATY"

    .line 669
    .line 670
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 671
    .line 672
    .line 673
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 674
    .line 675
    .line 676
    const-string v1, "///"

    .line 677
    .line 678
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 679
    .line 680
    .line 681
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 682
    .line 683
    .line 684
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 685
    .line 686
    .line 687
    move-result-object p3

    .line 688
    invoke-static {v2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    .line 690
    .line 691
    :try_start_1
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 692
    .line 693
    .line 694
    move-result-object p3

    .line 695
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 696
    .line 697
    invoke-static {p1, v7}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 698
    .line 699
    .line 700
    move-result-object p1

    .line 701
    invoke-virtual {p3, p0, p1, p2}, Lcom/android/launcher3/globalsearch/r;->i(Landroid/content/Context;Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_1

    .line 702
    .line 703
    .line 704
    return-object v0

    .line 705
    :catch_1
    const-string p0, "doCallAction: GS_METHOD_START_RECENT_ATY URISyntaxException "

    .line 706
    .line 707
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 708
    .line 709
    .line 710
    goto :goto_3

    .line 711
    :pswitch_9
    if-eqz p3, :cond_18

    .line 712
    .line 713
    :try_start_2
    const-string p1, "get_processed_icon_input"

    .line 714
    .line 715
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    .line 716
    .line 717
    .line 718
    move-result-object p1

    .line 719
    invoke-static {p1}, Lx1/O;->r([B)Landroid/graphics/Bitmap;

    .line 720
    .line 721
    .line 722
    move-result-object p1

    .line 723
    invoke-virtual {p0, p1}, Lcom/android/launcher3/globalsearch/p;->v(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 724
    .line 725
    .line 726
    move-result-object p0

    .line 727
    if-eqz p0, :cond_18

    .line 728
    .line 729
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 730
    .line 731
    .line 732
    move-result p1

    .line 733
    if-eqz p1, :cond_16

    .line 734
    .line 735
    goto :goto_3

    .line 736
    :cond_16
    const-string p1, "get_processed_icon_res"

    .line 737
    .line 738
    invoke-static {p0}, Lx1/O;->m(Landroid/graphics/Bitmap;)[B

    .line 739
    .line 740
    .line 741
    move-result-object p0

    .line 742
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 743
    .line 744
    .line 745
    return-object v0

    .line 746
    :catchall_0
    move-exception p0

    .line 747
    const-string p1, "doCallAction GS_METHOD_GET_PROCESSED_ICON error"

    .line 748
    .line 749
    invoke-static {v2, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 750
    .line 751
    .line 752
    goto :goto_3

    .line 753
    :pswitch_a
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/p;->N()Z

    .line 754
    .line 755
    .line 756
    move-result p0

    .line 757
    const-string p1, "support_app_location_anim_res"

    .line 758
    .line 759
    invoke-virtual {v0, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 760
    .line 761
    .line 762
    return-object v0

    .line 763
    :pswitch_b
    if-eqz p3, :cond_17

    .line 764
    .line 765
    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 766
    .line 767
    .line 768
    move-result-object v4

    .line 769
    :cond_17
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 770
    .line 771
    .line 772
    move-result p1

    .line 773
    if-eqz p1, :cond_19

    .line 774
    .line 775
    :cond_18
    :goto_3
    return-object v0

    .line 776
    :cond_19
    invoke-virtual {p0, v4, v7}, Lcom/android/launcher3/globalsearch/p;->G(Ljava/lang/String;Z)Ljava/util/ArrayList;

    .line 777
    .line 778
    .line 779
    move-result-object p0

    .line 780
    invoke-virtual {v0, v5, p0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 781
    .line 782
    .line 783
    return-object v0

    .line 784
    nop

    .line 785
    :sswitch_data_0
    .sparse-switch
        -0x6bade1d6 -> :sswitch_b
        -0x6b4b69b3 -> :sswitch_a
        -0x6126ed2d -> :sswitch_9
        -0x566b5541 -> :sswitch_8
        -0x4f081194 -> :sswitch_7
        -0x37e2821a -> :sswitch_6
        -0x2d08d560 -> :sswitch_5
        -0x152e1719 -> :sswitch_4
        0xb7b9406 -> :sswitch_3
        0x310ec8c0 -> :sswitch_2
        0x45b4fc74 -> :sswitch_1
        0x4e99fc20 -> :sswitch_0
    .end sparse-switch

    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public q()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "search_settings_preference_category"

    .line 12
    .line 13
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    const-string v0, "search_settings_preference_key_quikapp"

    .line 17
    .line 18
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 19
    .line 20
    .line 21
    const-string v0, "search_settings_preference_key_app"

    .line 22
    .line 23
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 24
    .line 25
    .line 26
    const-string v0, "search_settings_preference_key_contact"

    .line 27
    .line 28
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 29
    .line 30
    .line 31
    const-string v0, "search_settings_preference_key_sms"

    .line 32
    .line 33
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 34
    .line 35
    .line 36
    const-string v0, "search_settings_preference_key_calendar"

    .line 37
    .line 38
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 39
    .line 40
    .line 41
    const-string v0, "search_settings_preference_key_setting"

    .line 42
    .line 43
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 44
    .line 45
    .line 46
    const-string v0, "search_settings_preference_key_filemgr"

    .line 47
    .line 48
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 49
    .line 50
    .line 51
    const-string v0, "search_settings_preference_key_appstore"

    .line 52
    .line 53
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 54
    .line 55
    .line 56
    const-string v0, "search_settings_preference_key_heartyservice"

    .line 57
    .line 58
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 59
    .line 60
    .line 61
    const-string v0, "search_settings_preference_key_gallery"

    .line 62
    .line 63
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 64
    .line 65
    .line 66
    const-string v0, "search_settings_preference_key_browser"

    .line 67
    .line 68
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 69
    .line 70
    .line 71
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    return p0
.end method

.method public r(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/globalsearch/p;->t(Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p1, LI/d;->b:Ljava/lang/Object;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    check-cast p2, Landroid/graphics/Bitmap;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 20
    .line 21
    iget-object p1, p1, LI/d;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p1, Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-static {p0, p1}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public s()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public declared-synchronized t(Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Landroid/os/UserHandle;",
            ")",
            "LI/d<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/c1;->r(Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;

    .line 25
    .line 26
    .line 27
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    monitor-exit p0

    .line 29
    return-object p1

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/android/launcher3/c1;->n(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 43
    .line 44
    invoke-static {v1, p1, p2, v0}, Lcom/android/launcher3/c1;->t(Landroid/content/Context;Landroid/content/Intent;Landroid/os/UserHandle;Landroid/graphics/Bitmap;)LI/d;

    .line 45
    .line 46
    .line 47
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    monitor-exit p0

    .line 49
    return-object p1

    .line 50
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    throw p1
.end method

.method public v(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/H5;->c0(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public w()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/p;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "search_settings_preference_category"

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    const-string v1, "search_settings_preference_key_quikapp"

    .line 27
    .line 28
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    const-string v1, "search_settings_preference_key_app"

    .line 40
    .line 41
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-string v1, "search_settings_preference_key_contact"

    .line 53
    .line 54
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    const-string v1, "search_settings_preference_key_sms"

    .line 66
    .line 67
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    const-string v1, "search_settings_preference_key_calendar"

    .line 79
    .line 80
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    const-string v1, "search_settings_preference_key_setting"

    .line 92
    .line 93
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    const-string v1, "search_settings_preference_key_filemgr"

    .line 105
    .line 106
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    const-string v1, "search_settings_preference_key_appstore"

    .line 118
    .line 119
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    const-string v1, "search_settings_preference_key_heartyservice"

    .line 131
    .line 132
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    const-string v1, "search_settings_preference_key_gallery"

    .line 144
    .line 145
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    const-string v1, "search_settings_preference_key_browser"

    .line 157
    .line 158
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    return-object v0
.end method
