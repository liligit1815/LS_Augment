.class public final Lcom/android/quickstep/HighResLoadingState;
.super Ljava/lang/Object;
.source "HighResLoadingState.kt"

# interfaces
.implements Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;
    }
.end annotation


# instance fields
.field private final callbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private flingingFast:Z

.field private final forceHighResThumbnails:Z

.field private isEnabled:Z

.field private visible:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/HighResLoadingState;->supportsLowResThumbnails()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    xor-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/android/quickstep/HighResLoadingState;->forceHighResThumbnails:Z

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/quickstep/HighResLoadingState;->callbacks:Ljava/util/ArrayList;

    .line 18
    .line 19
    return-void
.end method

.method private final supportsLowResThumbnails()Z
    .locals 3

    .line 1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "dimen"

    .line 6
    .line 7
    const-string v1, "android"

    .line 8
    .line 9
    const-string v2, "config_lowResTaskSnapshotScale"

    .line 10
    .line 11
    invoke-virtual {p0, v2, v0, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getFloat(I)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    cmpg-float p0, v2, p0

    .line 24
    .line 25
    if-gez p0, :cond_0

    .line 26
    .line 27
    return v1

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    return v1
.end method

.method private final updateState()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/HighResLoadingState;->isEnabled:Z

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/HighResLoadingState;->forceHighResThumbnails:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/android/quickstep/HighResLoadingState;->visible:Z

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/quickstep/HighResLoadingState;->flingingFast:Z

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Lx1/O;->C2()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lx1/O;->l2()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v1, 0x0

    .line 30
    :goto_0
    iput-boolean v1, p0, Lcom/android/quickstep/HighResLoadingState;->isEnabled:Z

    .line 31
    .line 32
    if-eq v0, v1, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/HighResLoadingState;->callbacks:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-static {v0}, Li4/m;->J(Ljava/util/List;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;

    .line 55
    .line 56
    iget-boolean v2, p0, Lcom/android/quickstep/HighResLoadingState;->isEnabled:Z

    .line 57
    .line 58
    invoke-interface {v1, v2}, Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;->onHighResLoadingStateChanged(Z)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    return-void
.end method


# virtual methods
.method public addCallback(Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;)V
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/HighResLoadingState;->callbacks:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final getFlingingFast()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/HighResLoadingState;->flingingFast:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getVisible()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/HighResLoadingState;->visible:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/HighResLoadingState;->isEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public removeCallback(Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;)V
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/HighResLoadingState;->callbacks:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setFlingingFast(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/HighResLoadingState;->flingingFast:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/HighResLoadingState;->updateState()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final setVisible(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/HighResLoadingState;->visible:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/HighResLoadingState;->updateState()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
