.class public final Lj0/a;
.super Ljava/lang/Object;
.source "FoldingFeatureObserver.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lj0/a$a;
    }
.end annotation


# instance fields
.field private final a:Lp0/f;

.field private final b:Ljava/util/concurrent/Executor;

.field private c:LF4/u0;

.field private d:Lj0/a$a;


# direct methods
.method public constructor <init>(Lp0/f;Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    const-string v0, "windowInfoTracker"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "executor"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lj0/a;->a:Lp0/f;

    .line 15
    .line 16
    iput-object p2, p0, Lj0/a;->b:Ljava/util/concurrent/Executor;

    .line 17
    .line 18
    return-void
.end method

.method public static final synthetic a(Lj0/a;Lp0/j;)Lp0/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lj0/a;->d(Lp0/j;)Lp0/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Lj0/a;)Lj0/a$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lj0/a;->d:Lj0/a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lj0/a;)Lp0/f;
    .locals 0

    .line 1
    iget-object p0, p0, Lj0/a;->a:Lp0/f;

    .line 2
    .line 3
    return-object p0
.end method

.method private final d(Lp0/j;)Lp0/c;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lp0/j;->a()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    move-object v1, p1

    .line 21
    check-cast v1, Lp0/a;

    .line 22
    .line 23
    instance-of v1, v1, Lp0/c;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move-object p1, v0

    .line 29
    :goto_0
    instance-of p0, p1, Lp0/c;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    check-cast p1, Lp0/c;

    .line 34
    .line 35
    return-object p1

    .line 36
    :cond_2
    return-object v0
.end method


# virtual methods
.method public final e(Landroid/app/Activity;)V
    .locals 8

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lj0/a;->c:LF4/u0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v2, 0x1

    .line 13
    invoke-static {v0, v1, v2, v1}, LF4/u0$a;->a(LF4/u0;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object v0, p0, Lj0/a;->b:Ljava/util/concurrent/Executor;

    .line 17
    .line 18
    invoke-static {v0}, LF4/o0;->a(Ljava/util/concurrent/Executor;)LF4/E;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, LF4/J;->a(Ll4/g;)LF4/I;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    new-instance v5, Lj0/a$b;

    .line 27
    .line 28
    invoke-direct {v5, p0, p1, v1}, Lj0/a$b;-><init>(Lj0/a;Landroid/app/Activity;Ll4/d;)V

    .line 29
    .line 30
    .line 31
    const/4 v6, 0x3

    .line 32
    const/4 v7, 0x0

    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-static/range {v2 .. v7}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lj0/a;->c:LF4/u0;

    .line 40
    .line 41
    return-void
.end method

.method public final f(Lj0/a$a;)V
    .locals 1

    .line 1
    const-string v0, "onFoldingFeatureChangeListener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lj0/a;->d:Lj0/a$a;

    .line 7
    .line 8
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object p0, p0, Lj0/a;->c:LF4/u0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v1, v0, v1}, LF4/u0$a;->a(LF4/u0;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
