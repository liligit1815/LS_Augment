.class final Lcom/android/launcher3/taskbar/X2$g;
.super Ljava/lang/Object;
.source "TaskbarLauncherStateController.java"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/X2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "g"
.end annotation


# instance fields
.field private final g:Lcom/android/quickstep/RecentsAnimationCallbacks;

.field final synthetic h:Lcom/android/launcher3/taskbar/X2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/X2;Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2$g;->h:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/X2$g;->g:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/taskbar/X2$g;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2$g;->b(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b(ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p1, p2}, Lcom/android/launcher3/taskbar/X2$g;->c(ZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(ZZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$g;->g:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$g;->h:Lcom/android/launcher3/taskbar/X2;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/X2;->x(Lcom/android/launcher3/taskbar/X2;Lcom/android/launcher3/taskbar/X2$g;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$g;->h:Lcom/android/launcher3/taskbar/X2;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->j(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/taskbar/R1;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->k()Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setTaskLaunchListener(Lcom/android/quickstep/views/RecentsView$TaskLaunchListener;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$g;->h:Lcom/android/launcher3/taskbar/X2;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->p(Lcom/android/launcher3/taskbar/X2;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    if-nez p3, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$g;->h:Lcom/android/launcher3/taskbar/X2;

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/X2;->w(Lcom/android/launcher3/taskbar/X2;Z)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$g;->h:Lcom/android/launcher3/taskbar/X2;

    .line 47
    .line 48
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->A(Lcom/android/launcher3/taskbar/X2;ZZ)V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public onRecentsAnimationCanceled(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2$g;->h:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/taskbar/X2;->l(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x1

    .line 14
    xor-int/2addr p1, v0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/X2$g;->b(ZZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onRecentsAnimationFinished(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationController;->getFinishTargetIsLauncher()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationController;->getLauncherIsVisibleAtFinish()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {p0, v0, p1, v1}, Lcom/android/launcher3/taskbar/X2$g;->c(ZZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
