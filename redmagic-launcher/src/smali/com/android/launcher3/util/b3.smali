.class public Lcom/android/launcher3/util/b3;
.super Ljava/lang/Object;
.source "ViewPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/b3$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ":",
        "Lcom/android/launcher3/util/b3$a;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final g:Ljava/lang/String; = "b3"


# instance fields
.field private final a:[Ljava/lang/Object;

.field private final b:Landroid/view/LayoutInflater;

.field private final c:Landroid/view/ViewGroup;

.field private final d:I

.field private e:I

.field private f:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;III)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/util/b3;-><init>(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;III)V

    return-void
.end method

.method constructor <init>(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;III)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/android/launcher3/util/b3;->e:I

    .line 4
    iput p3, p0, Lcom/android/launcher3/util/b3;->d:I

    .line 5
    iput-object p2, p0, Lcom/android/launcher3/util/b3;->c:Landroid/view/ViewGroup;

    .line 6
    iput-object p1, p0, Lcom/android/launcher3/util/b3;->b:Landroid/view/LayoutInflater;

    .line 7
    new-array p1, p4, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/android/launcher3/util/b3;->a:[Ljava/lang/Object;

    if-lez p5, :cond_0

    .line 8
    invoke-direct {p0, p5}, Lcom/android/launcher3/util/b3;->f(I)V

    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/b3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/b3;->h(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/b3;ILandroid/view/LayoutInflater;Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/util/b3;->i(ILandroid/view/LayoutInflater;Landroid/os/Handler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(Landroid/view/View;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/util/b3;->e:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/util/b3;->a:[Ljava/lang/Object;

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    if-lt v0, v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    aput-object p1, v1, v0

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    iput v0, p0, Lcom/android/launcher3/util/b3;->e:I

    .line 17
    .line 18
    return-void
.end method

.method private e(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/LayoutInflater;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/b3;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/b3;->c:Landroid/view/ViewGroup;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private f(I)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/util/b3;->b:Landroid/view/LayoutInflater;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ljava/lang/Thread;

    .line 20
    .line 21
    new-instance v3, Lcom/android/launcher3/util/Z2;

    .line 22
    .line 23
    invoke-direct {v3, p0, p1, v1, v0}, Lcom/android/launcher3/util/Z2;-><init>(Lcom/android/launcher3/util/b3;ILandroid/view/LayoutInflater;Landroid/os/Handler;)V

    .line 24
    .line 25
    .line 26
    const-string p1, "ViewPool-init"

    .line 27
    .line 28
    invoke-direct {v2, v3, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iput-object v2, p0, Lcom/android/launcher3/util/b3;->f:Ljava/lang/Thread;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/b3;->c(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i(ILandroid/view/LayoutInflater;Landroid/os/Handler;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p1, :cond_0

    .line 3
    .line 4
    invoke-direct {p0, p2}, Lcom/android/launcher3/util/b3;->e(Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    new-instance v2, Lcom/android/launcher3/util/a3;

    .line 9
    .line 10
    invoke-direct {v2, p0, v1}, Lcom/android/launcher3/util/a3;-><init>(Lcom/android/launcher3/util/b3;Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object p1, Lcom/android/launcher3/util/b3;->g:Ljava/lang/String;

    .line 20
    .line 21
    const-string p2, "initPool complete"

    .line 22
    .line 23
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput-object p1, p0, Lcom/android/launcher3/util/b3;->f:Ljava/lang/Thread;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public d()Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/util/b3;->e:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    iput v0, p0, Lcom/android/launcher3/util/b3;->e:I

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/util/b3;->a:[Ljava/lang/Object;

    .line 13
    .line 14
    aget-object p0, p0, v0

    .line 15
    .line 16
    check-cast p0, Landroid/view/View;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/b3;->b:Landroid/view/LayoutInflater;

    .line 20
    .line 21
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/b3;->e(Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public g()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/b3;->f:Ljava/lang/Thread;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    move-object v0, p1

    .line 5
    check-cast v0, Lcom/android/launcher3/util/b3$a;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/android/launcher3/util/b3$a;->onRecycle()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/b3;->c(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
