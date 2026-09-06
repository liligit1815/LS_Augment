.class Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;
.super Lv2/c;
.source "QuickstepLauncher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/uioverrides/QuickstepLauncher;->registerBackDispatcher()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field n:Landroid/window/OnBackAnimationCallback;

.field final synthetic o:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->o:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-direct {p0}, Lv2/c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {v0}, Landroid/window/OnBackAnimationCallback;->onBackCancelled()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 11
    .line 12
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->o:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->o5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)Landroid/window/OnBackAnimationCallback;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 14
    .line 15
    invoke-interface {v0}, Landroid/window/OnBackAnimationCallback;->onBackInvoked()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 20
    .line 21
    const-string p0, "Main"

    .line 22
    .line 23
    const-string v0, "onBackInvoked"

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public g(Landroid/window/BackEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Landroid/window/OnBackAnimationCallback;->onBackProgressed(Landroid/window/BackEvent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h(Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Landroid/window/OnBackAnimationCallback;->onBackCancelled()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->o:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->n5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)Landroid/window/OnBackAnimationCallback;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;->n:Landroid/window/OnBackAnimationCallback;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Landroid/window/OnBackAnimationCallback;->onBackStarted(Landroid/window/BackEvent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
