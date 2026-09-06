.class final Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;
.super Ljava/lang/Object;
.source "ProxyUnfoldTransitionProvider.kt"

# interfaces
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ProcessedProgressListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;->this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;->this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->access$getTransitionStarted$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;->this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->access$setTransitionStarted$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;->this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->access$getListeners$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, LC2/i$a;

    .line 36
    .line 37
    invoke-interface {v0}, LC2/i$a;->onTransitionFinished()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method public bridge synthetic onTransitionFinishing()V
    .locals 0

    .line 1
    invoke-super {p0}, LC2/i$a;->onTransitionFinishing()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;->this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->access$getListeners$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, LC2/i$a;

    .line 22
    .line 23
    invoke-interface {v0, p1}, LC2/i$a;->onTransitionProgress(F)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public onTransitionStarted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;->this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->access$getTransitionStarted$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;->this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->access$setTransitionStarted$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider$ProcessedProgressListener;->this$0:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->access$getListeners$p(Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, LC2/i$a;

    .line 36
    .line 37
    invoke-interface {v0}, LC2/i$a;->onTransitionStarted()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method
