.class Lcom/android/launcher3/C2$k;
.super Landroid/view/WindowInsetsAnimation$Callback;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/C2;->onDeferredResumed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/C2$k;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/view/WindowInsetsAnimation$Callback;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onEnd(Landroid/view/WindowInsetsAnimation;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/C2$k;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1, v0}, Landroid/view/WindowInsets;->isVisible(I)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/C2$k;->a:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->keyboardStateManager()Lcom/android/launcher3/logging/g;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    sget-object p1, Lcom/android/launcher3/logging/g$a;->h:Lcom/android/launcher3/logging/g$a;

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    sget-object p1, Lcom/android/launcher3/logging/g$a;->i:Lcom/android/launcher3/logging/g$a;

    .line 42
    .line 43
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/logging/g;->a(Lcom/android/launcher3/logging/g$a;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onProgress(Landroid/view/WindowInsets;Ljava/util/List;)Landroid/view/WindowInsets;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/WindowInsets;",
            "Ljava/util/List<",
            "Landroid/view/WindowInsetsAnimation;",
            ">;)",
            "Landroid/view/WindowInsets;"
        }
    .end annotation

    .line 1
    return-object p1
.end method
