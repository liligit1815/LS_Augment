.class final Lcom/android/systemui/unfold/progress/i$a;
.super Ljava/lang/Object;
.source "RemoteUnfoldTransitionReceiver.kt"

# interfaces
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/unfold/progress/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "a"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/systemui/unfold/progress/i;


# direct methods
.method public constructor <init>(Lcom/android/systemui/unfold/progress/i;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/systemui/unfold/progress/i$a;->g:Lcom/android/systemui/unfold/progress/i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/i$a;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic b()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/i$a;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic c()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/i$a;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private static final d()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "onTransitionFinished"

    .line 2
    .line 3
    return-object v0
.end method

.method private static final e()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "onTransitionProgress"

    .line 2
    .line 3
    return-object v0
.end method

.method private static final f()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "onTransitionStarted"

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i$a;->g:Lcom/android/systemui/unfold/progress/i;

    .line 2
    .line 3
    new-instance v1, Lcom/android/systemui/unfold/progress/g;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/systemui/unfold/progress/g;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/systemui/unfold/progress/i;->s2(Lcom/android/systemui/unfold/progress/i;Lu4/a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i$a;->g:Lcom/android/systemui/unfold/progress/i;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/systemui/unfold/progress/i;->r2(Lcom/android/systemui/unfold/progress/i;)Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, LC2/i$a;

    .line 32
    .line 33
    invoke-interface {v0}, LC2/i$a;->onTransitionFinished()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i$a;->g:Lcom/android/systemui/unfold/progress/i;

    .line 2
    .line 3
    new-instance v1, Lcom/android/systemui/unfold/progress/f;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/systemui/unfold/progress/f;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/systemui/unfold/progress/i;->s2(Lcom/android/systemui/unfold/progress/i;Lu4/a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i$a;->g:Lcom/android/systemui/unfold/progress/i;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/systemui/unfold/progress/i;->r2(Lcom/android/systemui/unfold/progress/i;)Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, LC2/i$a;

    .line 32
    .line 33
    invoke-interface {v0, p1}, LC2/i$a;->onTransitionProgress(F)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public onTransitionStarted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/i$a;->g:Lcom/android/systemui/unfold/progress/i;

    .line 2
    .line 3
    new-instance v1, Lcom/android/systemui/unfold/progress/h;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/systemui/unfold/progress/h;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/systemui/unfold/progress/i;->s2(Lcom/android/systemui/unfold/progress/i;Lu4/a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/i$a;->g:Lcom/android/systemui/unfold/progress/i;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/systemui/unfold/progress/i;->r2(Lcom/android/systemui/unfold/progress/i;)Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, LC2/i$a;

    .line 32
    .line 33
    invoke-interface {v0}, LC2/i$a;->onTransitionStarted()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method
