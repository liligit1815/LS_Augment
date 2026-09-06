.class public final Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;
.super Ljava/lang/Object;
.source "LauncherUnfoldTransitionController.kt"

# interfaces
.implements Lcom/android/launcher3/X3$b;
.implements Lcom/android/launcher3/util/a;
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController$Companion;

.field private static final TAG:Ljava/lang/String; = "LauncherUnfoldTransitionController"


# instance fields
.field private hasUnfoldTransitionStarted:Z

.field private isTablet:Ljava/lang/Boolean;

.field private final launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final progressProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

.field private final timeoutAlarm:Lcom/android/launcher3/c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->Companion:Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)V
    .locals 1

    .line 1
    const-string v0, "launcher"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "progressProvider"

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
    iput-object p1, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->progressProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 17
    .line 18
    new-instance p2, Lcom/android/launcher3/c;

    .line 19
    .line 20
    invoke-direct {p2}, Lcom/android/launcher3/c;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/android/quickstep/util/unfold/b;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/unfold/b;-><init>(Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, v0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 29
    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->timeoutAlarm:Lcom/android/launcher3/c;

    .line 32
    .line 33
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/app/Activity;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->onPrepareUnfoldAnimation(Lcom/android/launcher3/anim/V;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->timeoutAlarm$lambda$1$lambda$0(Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;Lcom/android/launcher3/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final onPrepareUnfoldAnimation(Lcom/android/launcher3/anim/V;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->n0()Lcom/android/launcher3/util/Z$c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget v1, v1, Lcom/android/launcher3/util/Z$c;->b:I

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 22
    :goto_1
    sget-object v2, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->INSTANCE:Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->n0()Lcom/android/launcher3/util/Z$c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 31
    .line 32
    const-string v3, "currentSize"

    .line 33
    .line 34
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, p0, v1, v0, p1}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->buildUnfoldAnimation(Lcom/android/launcher3/uioverrides/QuickstepLauncher;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private static final timeoutAlarm$lambda$1$lambda$0(Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->onTransitionFinished()V

    .line 2
    .line 3
    .line 4
    const-string p0, "LauncherUnfoldTransitionController#startedPreemptively"

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-static {p0, p1}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/util/a;->onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/util/a;->onActivityDestroyed(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->progressProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->removeCallback(LC2/i$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 1

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->progressProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->addCallback(LC2/i$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/util/a;->onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/util/a;->onActivityStarted(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/util/a;->onActivityStopped(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 4

    .line 1
    const-string v0, "dp"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->isTablet:Ljava/lang/Boolean;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 11
    .line 12
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->isTablet:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->progressProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->isActive()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->hasUnfoldTransitionStarted:Z

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->onTransitionStarted()V

    .line 42
    .line 43
    .line 44
    const-string v0, "LauncherUnfoldTransitionController#startedPreemptively"

    .line 45
    .line 46
    invoke-static {v0, v1}, Landroid/os/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->timeoutAlarm:Lcom/android/launcher3/c;

    .line 50
    .line 51
    const-wide/16 v2, 0x6a4

    .line 52
    .line 53
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/c;->d(J)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->hasUnfoldTransitionStarted:Z

    .line 61
    .line 62
    :cond_1
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 63
    .line 64
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->isTablet:Ljava/lang/Boolean;

    .line 69
    .line 70
    return-void
.end method

.method public onTransitionFinished()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->H1()Lcom/android/launcher3/util/B;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/B;->f(Ljava/lang/Object;)Lcom/android/launcher3/anim/q;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->x()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->timeoutAlarm:Lcom/android/launcher3/c;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/c;->b()V

    .line 19
    .line 20
    .line 21
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
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->hasUnfoldTransitionStarted:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->H1()Lcom/android/launcher3/util/B;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/B;->f(Ljava/lang/Object;)Lcom/android/launcher3/anim/q;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onTransitionStarted()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->hasUnfoldTransitionStarted:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->H1()Lcom/android/launcher3/util/B;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Lcom/android/quickstep/util/unfold/a;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/unfold/a;-><init>(Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v2, 0x3e8

    .line 16
    .line 17
    invoke-virtual {v0, p0, v1, v2, v3}, Lcom/android/launcher3/util/B;->k(Ljava/lang/Object;Ljava/util/function/Consumer;J)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;->timeoutAlarm:Lcom/android/launcher3/c;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/c;->b()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
