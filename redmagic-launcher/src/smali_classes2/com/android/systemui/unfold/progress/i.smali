.class public final Lcom/android/systemui/unfold/progress/i;
.super Lcom/android/systemui/unfold/progress/b$a;
.source "RemoteUnfoldTransitionReceiver.kt"

# interfaces
.implements LC2/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/unfold/progress/i$a;
    }
.end annotation


# instance fields
.field private final g:Ljava/util/concurrent/Executor;

.field private final h:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "LC2/i$a;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Lcom/android/systemui/unfold/progress/i$a;

.field private final j:LC2/i$a;


# direct methods
.method public constructor <init>(ZLjava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    const-string v0, "executor"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/systemui/unfold/progress/b$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/systemui/unfold/progress/i;->g:Ljava/util/concurrent/Executor;

    .line 10
    .line 11
    new-instance p2, Ljava/util/LinkedHashSet;

    .line 12
    .line 13
    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/systemui/unfold/progress/i;->h:Ljava/util/Set;

    .line 17
    .line 18
    new-instance p2, Lcom/android/systemui/unfold/progress/i$a;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Lcom/android/systemui/unfold/progress/i$a;-><init>(Lcom/android/systemui/unfold/progress/i;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lcom/android/systemui/unfold/progress/i;->i:Lcom/android/systemui/unfold/progress/i$a;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    new-instance p1, Lcom/android/systemui/unfold/progress/n;

    .line 28
    .line 29
    invoke-direct {p1, p2}, Lcom/android/systemui/unfold/progress/n;-><init>(LC2/i$a;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    :goto_0
    iput-object p1, p0, Lcom/android/systemui/unfold/progress/i;->j:LC2/i$a;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic o2(Lcom/android/systemui/unfold/progress/i;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/systemui/unfold/progress/i;->w2(Lcom/android/systemui/unfold/progress/i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(Lcom/android/systemui/unfold/progress/i;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/systemui/unfold/progress/i;->u2(Lcom/android/systemui/unfold/progress/i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2(Lcom/android/systemui/unfold/progress/i;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/systemui/unfold/progress/i;->v2(Lcom/android/systemui/unfold/progress/i;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic r2(Lcom/android/systemui/unfold/progress/i;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i;->h:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic s2(Lcom/android/systemui/unfold/progress/i;Lu4/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/systemui/unfold/progress/i;->t2(Lu4/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final t2(Lu4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/j;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "RemoteUnfoldReceiver"

    .line 14
    .line 15
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private static final u2(Lcom/android/systemui/unfold/progress/i;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i;->j:LC2/i$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, LC2/i$a;->onTransitionFinished()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i;->i:Lcom/android/systemui/unfold/progress/i$a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/systemui/unfold/progress/i$a;->onTransitionFinished()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static final v2(Lcom/android/systemui/unfold/progress/i;F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i;->j:LC2/i$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, LC2/i$a;->onTransitionProgress(F)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i;->i:Lcom/android/systemui/unfold/progress/i$a;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/systemui/unfold/progress/i$a;->onTransitionProgress(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static final w2(Lcom/android/systemui/unfold/progress/i;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i;->j:LC2/i$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, LC2/i$a;->onTransitionStarted()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i;->i:Lcom/android/systemui/unfold/progress/i$a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/systemui/unfold/progress/i$a;->onTransitionStarted()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public addCallback(LC2/i$a;)V
    .locals 1

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i;->h:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public bridge synthetic addCallback(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, LC2/i$a;

    invoke-virtual {p0, p1}, Lcom/android/systemui/unfold/progress/i;->addCallback(LC2/i$a;)V

    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i;->h:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onTransitionFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i;->g:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/systemui/unfold/progress/c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/systemui/unfold/progress/c;-><init>(Lcom/android/systemui/unfold/progress/i;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i;->g:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/systemui/unfold/progress/d;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/systemui/unfold/progress/d;-><init>(Lcom/android/systemui/unfold/progress/i;F)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTransitionStarted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i;->g:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/systemui/unfold/progress/e;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/systemui/unfold/progress/e;-><init>(Lcom/android/systemui/unfold/progress/i;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public removeCallback(LC2/i$a;)V
    .locals 1

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i;->h:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public bridge synthetic removeCallback(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, LC2/i$a;

    invoke-virtual {p0, p1}, Lcom/android/systemui/unfold/progress/i;->removeCallback(LC2/i$a;)V

    return-void
.end method
