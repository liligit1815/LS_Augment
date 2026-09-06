.class public abstract Lcom/android/launcher3/util/s;
.super Landroid/view/ContextThemeWrapper;
.source "BaseContext.kt"

# interfaces
.implements Lcom/android/launcher3/views/k;


# instance fields
.field private final cleanupSet:Lcom/android/launcher3/util/o3;

.field private final destroyOnDetach:Z

.field private final finishActions:Lcom/android/launcher3/util/Y1;

.field private final lifecycleRegistry:Landroidx/lifecycle/i;

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/X3$b;",
            ">;"
        }
    .end annotation
.end field

.field private final savedStateRegistryController:Le0/e;

.field private final viewCache:Lcom/android/launcher3/util/X2;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 7

    .line 1
    const-string v0, "base"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/util/s;-><init>(Landroid/content/Context;IZILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 1

    const-string v0, "base"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0, p1, p2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 4
    iput-boolean p3, p0, Lcom/android/launcher3/util/s;->destroyOnDetach:Z

    .line 5
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/util/s;->listeners:Ljava/util/List;

    .line 6
    sget-object p1, Le0/e;->d:Le0/e$a;

    invoke-virtual {p1, p0}, Le0/e$a;->a(Le0/f;)Le0/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/util/s;->savedStateRegistryController:Le0/e;

    .line 7
    new-instance p1, Landroidx/lifecycle/i;

    invoke-direct {p1, p0}, Landroidx/lifecycle/i;-><init>(LW/d;)V

    iput-object p1, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 8
    new-instance p1, Lcom/android/launcher3/util/o3;

    invoke-direct {p1, p0}, Lcom/android/launcher3/util/o3;-><init>(LW/d;)V

    iput-object p1, p0, Lcom/android/launcher3/util/s;->cleanupSet:Lcom/android/launcher3/util/o3;

    .line 9
    new-instance p1, Lcom/android/launcher3/util/X2;

    invoke-direct {p1}, Lcom/android/launcher3/util/X2;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/util/s;->viewCache:Lcom/android/launcher3/util/X2;

    .line 10
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    new-instance p2, Lcom/android/launcher3/util/m;

    invoke-direct {p2, p0}, Lcom/android/launcher3/util/m;-><init>(Lcom/android/launcher3/util/s;)V

    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 11
    new-instance p1, Lcom/android/launcher3/util/Y1;

    invoke-direct {p1}, Lcom/android/launcher3/util/Y1;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/util/s;->finishActions:Lcom/android/launcher3/util/Y1;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;IZILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x1

    .line 2
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/util/s;-><init>(Landroid/content/Context;IZ)V

    return-void
.end method

.method private static final _init_$lambda$0(Lcom/android/launcher3/util/s;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/s;->savedStateRegistryController:Le0/e;

    .line 2
    .line 3
    invoke-virtual {v0}, Le0/e;->c()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/s;->savedStateRegistryController:Le0/e;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Le0/e;->d(Landroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/s;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/s;->_init_$lambda$0(Lcom/android/launcher3/util/s;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getDestroyOnDetach$p(Lcom/android/launcher3/util/s;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/s;->destroyOnDetach:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getFinishActions$p(Lcom/android/launcher3/util/s;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/s;->finishActions:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getLifecycleRegistry$p(Lcom/android/launcher3/util/s;)Landroidx/lifecycle/i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$updateState(Lcom/android/launcher3/util/s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/s;->updateState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/view/View;Lcom/android/launcher3/util/s$a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/s;->onViewCreated$lambda$1(Landroid/view/View;Lcom/android/launcher3/util/s$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onViewCreated$lambda$1(Landroid/view/View;Lcom/android/launcher3/util/s$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final updateState()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/lifecycle/i;->b()Landroidx/lifecycle/g$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Landroidx/lifecycle/g$b;->i:Landroidx/lifecycle/g$b;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/lifecycle/g$b;->c(Landroidx/lifecycle/g$b;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Landroid/view/View;->getWindowVisibility()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->hasWindowFocus()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    sget-object v1, Landroidx/lifecycle/g$b;->j:Landroidx/lifecycle/g$b;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    sget-object v1, Landroidx/lifecycle/g$b;->k:Landroidx/lifecycle/g$b;

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/lifecycle/i;->m(Landroidx/lifecycle/g$b;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method


# virtual methods
.method public getLifecycle()Landroidx/lifecycle/g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOnDeviceProfileChangeListeners()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/X3$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/s;->listeners:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOwnerCleanupSet()Lcom/android/launcher3/util/o3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/s;->cleanupSet:Lcom/android/launcher3/util/o3;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSavedStateRegistry()Le0/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/s;->savedStateRegistryController:Le0/e;

    .line 2
    .line 3
    invoke-virtual {p0}, Le0/e;->b()Le0/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getViewCache()Lcom/android/launcher3/util/X2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/s;->viewCache:Lcom/android/launcher3/util/X2;

    .line 2
    .line 3
    return-object p0
.end method

.method public final onViewCreated()V
    .locals 4

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/util/s$a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/util/s$a;-><init>(Lcom/android/launcher3/util/s;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/util/s;->finishActions:Lcom/android/launcher3/util/Y1;

    .line 14
    .line 15
    new-instance v3, Lcom/android/launcher3/util/n;

    .line 16
    .line 17
    invoke-direct {v3, v0, v1}, Lcom/android/launcher3/util/n;-><init>(Landroid/view/View;Lcom/android/launcher3/util/s$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/s$a;->onViewAttachedToWindow(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/util/s;->updateState()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final onViewDestroyed()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/lifecycle/i;->b()Landroidx/lifecycle/g$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Landroidx/lifecycle/g$b;->i:Landroidx/lifecycle/g$b;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/lifecycle/g$b;->c(Landroidx/lifecycle/g$b;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/lifecycle/i;->b()Landroidx/lifecycle/g$b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v2, Landroidx/lifecycle/g$b;->g:Landroidx/lifecycle/g$b;

    .line 22
    .line 23
    if-eq v0, v2, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/lifecycle/i;->m(Landroidx/lifecycle/g$b;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/s;->lifecycleRegistry:Landroidx/lifecycle/i;

    .line 31
    .line 32
    sget-object v1, Landroidx/lifecycle/g$a;->ON_DESTROY:Landroidx/lifecycle/g$a;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/lifecycle/i;->h(Landroidx/lifecycle/g$a;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/util/s;->finishActions:Lcom/android/launcher3/util/Y1;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
