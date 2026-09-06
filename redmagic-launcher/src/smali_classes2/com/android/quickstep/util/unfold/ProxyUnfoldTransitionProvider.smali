.class public final Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;
.super Lcom/android/systemui/unfold/progress/b$a;
.source "ProxyUnfoldTransitionProvider.kt"

# interfaces
.implements LC2/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;
    }
.end annotation


# instance fields
.field private final delegate:Lcom/android/systemui/unfold/progress/n;

.field private isActive:Z

.field private final listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "LC2/i$a;",
            ">;"
        }
    .end annotation
.end field

.field private transitionStarted:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/unfold/progress/b$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->listeners:Ljava/util/Set;

    .line 10
    .line 11
    new-instance v0, Lcom/android/systemui/unfold/progress/n;

    .line 12
    .line 13
    new-instance v1, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;-><init>(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1}, Lcom/android/systemui/unfold/progress/n;-><init>(LC2/i$a;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->delegate:Lcom/android/systemui/unfold/progress/n;

    .line 22
    .line 23
    return-void
.end method

.method public static final synthetic access$getListeners$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->listeners:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getTransitionStarted$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->transitionStarted:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$setTransitionStarted$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->transitionStarted:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->onTransitionProgress$lambda$0(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onTransitionProgress$lambda$0(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->delegate:Lcom/android/systemui/unfold/progress/n;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/systemui/unfold/progress/n;->onTransitionProgress(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public addCallback(LC2/i$a;)V
    .locals 1

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->listeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 3
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->transitionStarted:Z

    if-eqz p0, :cond_0

    .line 4
    invoke-interface {p1}, LC2/i$a;->onTransitionStarted()V

    :cond_0
    return-void
.end method

.method public bridge synthetic addCallback(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, LC2/i$a;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->addCallback(LC2/i$a;)V

    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->listeners:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final isActive()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->isActive:Z

    .line 2
    .line 3
    return p0
.end method

.method public onTransitionFinished()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->delegate:Lcom/android/systemui/unfold/progress/n;

    .line 4
    .line 5
    new-instance v1, Lcom/android/quickstep/util/unfold/d;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/unfold/d;-><init>(Lcom/android/systemui/unfold/progress/n;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/unfold/e;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/util/unfold/e;-><init>(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTransitionStarted()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->delegate:Lcom/android/systemui/unfold/progress/n;

    .line 4
    .line 5
    new-instance v1, Lcom/android/quickstep/util/unfold/f;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/unfold/f;-><init>(Lcom/android/systemui/unfold/progress/n;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public removeCallback(LC2/i$a;)V
    .locals 1

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->listeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 3
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->transitionStarted:Z

    if-eqz p0, :cond_0

    .line 4
    invoke-interface {p1}, LC2/i$a;->onTransitionFinished()V

    :cond_0
    return-void
.end method

.method public bridge synthetic removeCallback(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, LC2/i$a;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->removeCallback(LC2/i$a;)V

    return-void
.end method

.method public final setActive(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->isActive:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->onTransitionFinished()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
