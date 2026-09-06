.class public abstract Lcom/android/launcher3/statemanager/h;
.super Lcom/android/launcher3/v;
.source "StatefulActivity.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<STATE_TYPE::",
        "Lcom/android/launcher3/statemanager/a<",
        "TSTATE_TYPE;>;>",
        "Lcom/android/launcher3/v;",
        "Lcom/android/launcher3/statemanager/i<",
        "TSTATE_TYPE;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "StatefulActivity"


# instance fields
.field private mDeferredResumePending:Z

.field private final mHandleDeferredResume:Ljava/lang/Runnable;

.field public final mHandler:Landroid/os/Handler;

.field protected mOldConfig:Landroid/content/res/Configuration;

.field private mOldRotation:I

.field private mRootView:Lcom/android/launcher3/LauncherRootView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/v;-><init>()V

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
    iput-object v0, p0, Lcom/android/launcher3/statemanager/h;->mHandler:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/statemanager/g;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/statemanager/g;-><init>(Lcom/android/launcher3/statemanager/h;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/statemanager/h;->mHandleDeferredResume:Ljava/lang/Runnable;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b0(Lcom/android/launcher3/statemanager/h;Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/views/BaseDragLayer;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/statemanager/h;->lambda$onStop$0(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/views/BaseDragLayer;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c0(Lcom/android/launcher3/statemanager/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/statemanager/h;->handleDeferredResume()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private handleDeferredResume()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/a;->hasFlag(I)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    invoke-virtual {p0, v0}, Lcom/android/launcher3/v;->addActivityFlags(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/h;->onDeferredResumed()V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/android/launcher3/statemanager/h;->mDeferredResumePending:Z

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iput-boolean v1, p0, Lcom/android/launcher3/statemanager/h;->mDeferredResumePending:Z

    .line 34
    .line 35
    return-void
.end method

.method private synthetic lambda$onStop$0(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/views/BaseDragLayer;I)V
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/android/launcher3/statemanager/d;->P(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    cmpg-float p1, p1, v0

    .line 18
    .line 19
    if-ltz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eq p1, p3, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/h;->onUiChangedWhileSleeping()V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public checkStateIfGesture()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public abstract collectStateHandlers(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/statemanager/d$f<",
            "TSTATE_TYPE;>;>;)V"
        }
    .end annotation
.end method

.method public findViewById(I)Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/h;->mRootView:Lcom/android/launcher3/LauncherRootView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic getRootView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    move-result-object p0

    return-object p0
.end method

.method public final getRootView()Lcom/android/launcher3/LauncherRootView;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/launcher3/statemanager/h;->mRootView:Lcom/android/launcher3/LauncherRootView;

    return-object p0
.end method

.method public handleConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/h;->mOldConfig:Landroid/content/res/Configuration;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/res/Configuration;->diff(Landroid/content/res/Configuration;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget-object v1, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/android/launcher3/util/window/d;

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/window/d;->getRotation(Landroid/content/Context;)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    and-int/lit16 v0, v0, 0x480

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget v0, p0, Lcom/android/launcher3/statemanager/h;->mOldRotation:I

    .line 24
    .line 25
    if-eq v1, v0, :cond_1

    .line 26
    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/android/launcher3/statemanager/h;->onHandleConfigurationChanged(ZZZZ)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/h;->mOldConfig:Landroid/content/res/Configuration;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    .line 34
    .line 35
    .line 36
    iput v1, p0, Lcom/android/launcher3/statemanager/h;->mOldRotation:I

    .line 37
    .line 38
    return-void
.end method

.method protected inflateRootView(I)V
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/launcher3/LauncherRootView;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/statemanager/h;->mRootView:Lcom/android/launcher3/LauncherRootView;

    .line 13
    .line 14
    const/16 p0, 0x700

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->setSystemUiVisibility(I)V

    .line 17
    .line 18
    .line 19
    const-string p0, "StatefulActivity"

    .line 20
    .line 21
    const-string p1, "inflateRootView setSystemUiVisibility:1792"

    .line 22
    .line 23
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    const-string v0, "statefulActivity#onConfigurationChanged"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/h;->handleConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 7
    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/v;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/content/res/Configuration;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p1, v0}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/launcher3/statemanager/h;->mOldConfig:Landroid/content/res/Configuration;

    .line 18
    .line 19
    sget-object p1, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/android/launcher3/util/window/d;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/window/d;->getRotation(Landroid/content/Context;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Lcom/android/launcher3/statemanager/h;->mOldRotation:I

    .line 32
    .line 33
    return-void
.end method

.method protected onDeferredResumed()V
    .locals 0

    .line 1
    return-void
.end method

.method protected abstract onHandleConfigurationChanged(ZZZZ)V
.end method

.method protected onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/statemanager/h;->mHandler:Landroid/os/Handler;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/statemanager/h;->mHandleDeferredResume:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/statemanager/h;->mHandler:Landroid/os/Handler;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/statemanager/h;->mHandleDeferredResume:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-static {v0, p0}, Lcom/android/launcher3/N5;->R(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onStateSetStart(Lcom/android/launcher3/statemanager/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSTATE_TYPE;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/statemanager/h;->mDeferredResumePending:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/statemanager/h;->handleDeferredResume()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/i;->onStateSetStart(Lcom/android/launcher3/statemanager/a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected onStop()V
    .locals 5

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/v;->isUserActive()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-super {p0}, Lcom/android/launcher3/v;->onStop()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-nez v4, :cond_0

    .line 29
    .line 30
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v4}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 35
    .line 36
    .line 37
    :cond_0
    const/16 v4, 0x14

    .line 38
    .line 39
    invoke-virtual {p0, v4}, Landroid/app/Activity;->onTrimMemory(I)V

    .line 40
    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    new-instance v1, Lcom/android/launcher3/statemanager/f;

    .line 45
    .line 46
    invoke-direct {v1, p0, v2, v0, v3}, Lcom/android/launcher3/statemanager/f;-><init>(Lcom/android/launcher3/statemanager/h;Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/views/BaseDragLayer;I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public onUiChangedWhileSleeping()V
    .locals 0

    .line 1
    return-void
.end method

.method public reapplyUi()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/LauncherRootView;->f()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->a0(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public shouldAnimateStateChange()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->isForceInvisible()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/v;->isStarted()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
