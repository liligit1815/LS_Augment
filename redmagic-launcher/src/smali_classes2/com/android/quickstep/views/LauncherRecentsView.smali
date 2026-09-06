.class public Lcom/android/quickstep/views/LauncherRecentsView;
.super Lcom/android/quickstep/views/RecentsView;
.source "LauncherRecentsView.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/views/RecentsView<",
        "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
        "Lcom/android/launcher3/V3;",
        ">;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LauncherRecentsView"


# instance fields
.field private mDrawingTaskRect:Z

.field private final mPaint:Landroid/graphics/Paint;

.field private mRedRectThicknes:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/LauncherRecentsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/views/LauncherRecentsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/quickstep/views/LauncherRecentsView;->mPaint:Landroid/graphics/Paint;

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    return-void
.end method


# virtual methods
.method public canLaunchFullscreenTask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method protected canStartHomeSafely()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->canStartHomeSafely()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/LauncherRecentsView;->mDrawingTaskRect:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/android/quickstep/BaseContainerInterface<",
            "Lcom/android/launcher3/V3;",
            "*>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/android/quickstep/LauncherActivityInterface;->INSTANCE:Lcom/android/quickstep/LauncherActivityInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getDepthController()LP1/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStateManager()Lcom/android/launcher3/statemanager/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/statemanager/d<",
            "Lcom/android/launcher3/V3;",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method protected handleStartHome(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->j0()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    and-int/2addr p1, v1

    .line 10
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 19
    .line 20
    check-cast v1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 21
    .line 22
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->o3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 25
    .line 26
    invoke-virtual {v3}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v0, v1, v2, v3}, Lcom/android/quickstep/util/AnimUtils;->goToNormalStateWithSplitDismissal(Lcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$e;Lcom/android/quickstep/util/SplitAnimationController;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 35
    .line 36
    new-instance v2, Lcom/android/quickstep/views/LauncherRecentsView$1;

    .line 37
    .line 38
    invoke-direct {v2, p0}, Lcom/android/quickstep/views/LauncherRecentsView$1;-><init>(Lcom/android/quickstep/views/LauncherRecentsView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1, p1, v2}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->g0:Z

    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 55
    .line 56
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 64
    .line 65
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 66
    .line 67
    invoke-static {p0, p1}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public ifScrollDisabled()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/quickstep/BaseContainerInterface;->mIfRunningTaskSupportMiniWindow:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public init(Lcom/android/quickstep/views/OverviewActionsView;Lcom/android/quickstep/util/SplitSelectStateController;Lj1/k;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView;->init(Lcom/android/quickstep/views/OverviewActionsView;Lcom/android/quickstep/util/SplitSelectStateController;Lj1/k;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setContentAlpha(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public initiateSplitSelect(Lcom/android/launcher3/util/y2$c;)V
    .locals 1

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/LauncherRecentsView;->initiateSplitSelectMFV(Lcom/android/launcher3/util/y2$c;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 5
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelect(Lcom/android/launcher3/util/y2$c;)V

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object p0

    sget-object p1, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    :cond_0
    return-void
.end method

.method public initiateSplitSelect(Lcom/android/quickstep/views/TaskContainer;ILcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object v1

    const/4 v4, 0x1

    const/4 v6, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move v3, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Lcom/android/quickstep/views/LauncherRecentsView;->initiateSplitSelectMFV(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;IZLcom/android/launcher3/logging/StatsLogManager$d;Z)Z

    move-result p0

    if-nez p0, :cond_0

    .line 2
    invoke-super {v0, p1, v3, v5}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelect(Lcom/android/quickstep/views/TaskContainer;ILcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object p0

    sget-object p1, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    :cond_0
    return-void
.end method

.method public initiateSplitSelectMFV(Lcom/android/launcher3/util/y2$c;)Z
    .locals 6

    .line 32
    sget-object v0, LF1/b;->n:Lcom/android/launcher3/util/I;

    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v1}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LF1/b;

    .line 33
    invoke-virtual {v0}, LF1/b;->d()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 34
    :cond_0
    iget-object v1, p1, Lcom/android/launcher3/util/y2$c;->c:Landroid/content/Intent;

    if-eqz v1, :cond_6

    .line 35
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 36
    iget-object v1, p1, Lcom/android/launcher3/util/y2$c;->c:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, LF1/b;->g(Ljava/lang/String;)V

    .line 37
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v1

    .line 38
    iget-object v2, p1, Lcom/android/launcher3/util/y2$c;->e:Lcom/android/launcher3/model/data/y;

    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-virtual {v0, v2}, LF1/b;->j(Landroid/os/UserHandle;)V

    .line 39
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.android.systemui.ACTION_LAUNCH_GROUP"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 40
    const-string v2, "com.android.systemui"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    invoke-virtual {v1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v1

    .line 42
    iget-object v2, p1, Lcom/android/launcher3/util/y2$c;->e:Lcom/android/launcher3/model/data/y;

    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    if-eqz v2, :cond_1

    .line 43
    invoke-virtual {v2}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v2

    goto :goto_0

    :cond_1
    move v2, v1

    .line 44
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v4, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-class v4, Lcom/android/quickstep/SplitActivity;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 45
    iget-object v4, p1, Lcom/android/launcher3/util/y2$c;->c:Landroid/content/Intent;

    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v4

    .line 46
    iget-object p1, p1, Lcom/android/launcher3/util/y2$c;->d:Lcom/android/launcher3/util/y2$b;

    iget p1, p1, Lcom/android/launcher3/util/y2$b;->c:I

    if-nez p1, :cond_2

    move-object v5, v4

    goto :goto_1

    :cond_2
    move-object v5, v3

    :goto_1
    if-nez p1, :cond_3

    goto :goto_2

    :cond_3
    move-object v3, v4

    :goto_2
    if-nez p1, :cond_4

    move v4, v2

    goto :goto_3

    :cond_4
    move v4, v1

    :goto_3
    if-nez p1, :cond_5

    goto :goto_4

    :cond_5
    move v1, v2

    .line 47
    :goto_4
    const-string p1, "shortcut_component_primary"

    invoke-virtual {v0, p1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    const-string p1, "shortcut_user_primary"

    invoke-virtual {v0, p1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 49
    const-string p1, "shortcut_component_secondary"

    invoke-virtual {v0, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    const-string p1, "shortcut_user_secondary"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 51
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "componentPrimary: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ,userPrimary: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ,componentSecondary: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ,userSecondary: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "LauncherRecentsView"

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v5, :cond_6

    if-eqz v3, :cond_6

    .line 52
    const-string p1, "sendBroadcast!"

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_6
    const/4 p0, 0x1

    return p0
.end method

.method public initiateSplitSelectMFV(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;IZLcom/android/launcher3/logging/StatsLogManager$d;Z)Z
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    sget-object v2, LF1/b;->n:Lcom/android/launcher3/util/I;

    iget-object v3, v0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v3}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LF1/b;

    .line 2
    invoke-virtual {v2}, LF1/b;->d()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_0

    return v4

    .line 3
    :cond_0
    sget-object v3, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    iget-object v5, v0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    invoke-virtual {v3, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/quickstep/TopTaskTracker;

    invoke-virtual {v3}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    move-result-object v3

    array-length v3, v3

    const/4 v5, 0x1

    if-le v3, v5, :cond_1

    move v3, v5

    goto :goto_0

    :cond_1
    move v3, v4

    :goto_0
    const/4 v6, 0x0

    if-eqz v1, :cond_2

    .line 4
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v7

    goto :goto_1

    :cond_2
    move-object v7, v6

    :goto_1
    if-eqz p2, :cond_3

    move-object/from16 v7, p2

    :cond_3
    if-eqz v7, :cond_9

    .line 5
    iget-object v8, v7, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    if-eqz v8, :cond_9

    if-nez v3, :cond_9

    if-nez p6, :cond_4

    .line 6
    iget-object v3, v0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object v3

    sget-object v8, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    invoke-virtual {v3, v8}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 7
    :cond_4
    iget-object v3, v7, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 8
    invoke-virtual {v7}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 9
    invoke-virtual {v7}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, LF1/b;->g(Ljava/lang/String;)V

    .line 10
    iget v8, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    invoke-static {v8}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v8

    invoke-virtual {v2, v8}, LF1/b;->j(Landroid/os/UserHandle;)V

    .line 11
    :cond_5
    new-instance v11, Landroid/content/Intent;

    invoke-direct {v11}, Landroid/content/Intent;-><init>()V

    if-eqz p6, :cond_6

    .line 12
    const-string v2, "com.android.systemui"

    const-string v8, "com.zte.feature.hover_mode.HoverModeToolsActivity"

    invoke-virtual {v11, v2, v8}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    invoke-virtual {v7}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v8, "dragPackageName"

    invoke-virtual {v11, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    .line 14
    :cond_6
    iget-object v2, v0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    const-class v8, Lcom/android/quickstep/SplitActivity;

    invoke-virtual {v11, v2, v8}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 15
    :goto_2
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 16
    iget-object v9, v0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    const/4 v13, 0x0

    .line 17
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v14

    const/4 v10, 0x0

    const/high16 v12, 0x3000000

    .line 18
    invoke-static/range {v9 .. v14}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object v8

    .line 19
    invoke-static {}, Lcom/android/quickstep/util/LogUtils;->getShellShareableInstanceId()Landroid/util/Pair;

    move-result-object v9

    if-eqz p4, :cond_8

    .line 20
    iput-object v1, v0, Lcom/android/quickstep/views/RecentsView;->mSplitHiddenTaskView:Lcom/android/quickstep/views/TaskView;

    .line 21
    iget-object v10, v0, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    if-eqz v1, :cond_7

    .line 22
    iget-object v2, v1, Lcom/android/quickstep/views/TaskView;->taskContainers:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    move-result-object v2

    move-object v13, v2

    goto :goto_3

    :cond_7
    move-object v13, v6

    :goto_3
    iget-object v2, v7, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    iget v15, v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    const/4 v11, 0x0

    move/from16 v12, p3

    move-object/from16 v14, p5

    .line 23
    invoke-virtual/range {v10 .. v15}, Lcom/android/quickstep/util/SplitSelectStateController;->setInitialTaskSelect(Landroid/content/Intent;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V

    .line 24
    iget-object v2, v0, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    new-instance v3, Lcom/android/launcher3/model/data/y;

    invoke-direct {v3}, Lcom/android/launcher3/model/data/y;-><init>()V

    invoke-virtual {v2, v8, v3}, Lcom/android/quickstep/util/SplitSelectStateController;->setSecondTask(Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)V

    .line 25
    iget-object v2, v0, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    invoke-virtual {v2, v5}, Lcom/android/quickstep/util/SplitSelectStateController;->setAnimateCurrentTaskDismissal(Z)V

    .line 26
    invoke-virtual/range {p0 .. p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    iput v1, v0, Lcom/android/quickstep/views/RecentsView;->mSplitHiddenTaskViewIndex:I

    .line 27
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    iget-object v1, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/logging/InstanceId;

    invoke-virtual {v0, v6, v4, v5, v1}, Lcom/android/quickstep/util/SplitSelectStateController;->launchTasks(Ljava/util/function/Consumer;ZILcom/android/internal/logging/InstanceId;)V

    goto :goto_4

    .line 28
    :cond_8
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    iget v1, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 29
    invoke-static/range {p3 .. p3}, Lcom/android/launcher3/util/y2;->b(I)I

    move-result v3

    iget-object v4, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Lcom/android/internal/logging/InstanceId;

    const/4 v6, 0x0

    move-object/from16 p0, v0

    move/from16 p2, v1

    move-object/from16 p3, v2

    move/from16 p4, v3

    move-object/from16 p6, v4

    move-object/from16 p5, v6

    move-object/from16 p1, v8

    .line 30
    invoke-virtual/range {p0 .. p6}, Lcom/android/quickstep/SystemUiProxy;->startIntent(Landroid/app/PendingIntent;ILandroid/content/Intent;ILandroid/os/Bundle;Lcom/android/internal/logging/InstanceId;)V

    goto :goto_4

    .line 31
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "task "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v7, :cond_a

    iget-object v6, v7, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    :cond_a
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LauncherRecentsView"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    return v5
.end method

.method protected onDismissAnimationEnds()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/views/RecentsView;->onDismissAnimationEnds()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    sget-object v1, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget v0, p0, Lcom/android/quickstep/views/RecentsView;->mTaskViewsPrimarySplitTranslation:F

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setTaskViewsPrimarySplitTranslation(F)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/android/quickstep/views/RecentsView;->mTaskViewsSecondarySplitTranslation:F

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setTaskViewsSecondarySplitTranslation(F)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public onGestureAnimationEnd()V
    .locals 4

    .line 1
    sget-object v0, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, LP1/k;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mCurrentGestureEndTarget:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 12
    .line 13
    sget-object v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 14
    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 18
    .line 19
    check-cast v2, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/app/Activity;->getDisplayId()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v0, v2}, LP1/k;->s(I)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v2, 0x0

    .line 34
    :goto_0
    invoke-super {p0}, Lcom/android/quickstep/views/RecentsView;->onGestureAnimationEnd()V

    .line 35
    .line 36
    .line 37
    sget-object v3, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_WALLPAPER_ACTIVITY:Landroid/window/DesktopModeFlags;

    .line 38
    .line 39
    invoke-virtual {v3}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0, v1}, LP1/k;->S(Lcom/android/quickstep/GestureState$GestureEndTarget;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    if-eqz v2, :cond_2

    .line 49
    .line 50
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 61
    .line 62
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplayId()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-virtual {v0, p0, v1}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApps(ILandroid/window/RemoteTransition;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    return-void
.end method

.method public onGestureAnimationStart(Lcom/android/wm/shell/shared/i;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->onGestureAnimationStart(Lcom/android/wm/shell/shared/i;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_WALLPAPER_ACTIVITY:Landroid/window/DesktopModeFlags;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    sget-object p1, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, LP1/k;

    .line 21
    .line 22
    invoke-virtual {p0}, LP1/k;->U()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public bridge synthetic onIsInDesktopModeChanged(IZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/util/window/d$a;->onIsInDesktopModeChanged(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStateTransitionComplete(Lcom/android/launcher3/V3;)V
    .locals 4

    .line 2
    sget-object v0, LP1/k;->o:Lcom/android/launcher3/util/I;

    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LP1/k;

    invoke-virtual {v0, p1}, LP1/k;->I(Lcom/android/launcher3/V3;)V

    .line 3
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/a;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 5
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setOverviewGridEnabled(Z)V

    .line 6
    :cond_0
    iget-boolean v0, p1, Lcom/android/launcher3/V3;->c:Z

    if-nez v0, :cond_1

    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->reset()V

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getCurNavMode()I

    move-result v0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    invoke-static {}, Lx1/O;->N1()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x7

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->loadVisibleTaskData(I)V

    .line 10
    :cond_2
    :goto_0
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_3

    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setSwipeUpToRecnetLockedApp(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 12
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mClearAllToRemove:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 13
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_4

    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v2

    invoke-static {v2}, Lh1/a;->q(I)V

    :cond_4
    const/4 v2, 0x1

    if-eq p1, v0, :cond_6

    .line 15
    sget-object v0, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_5

    goto :goto_1

    :cond_5
    move v0, v1

    goto :goto_2

    :cond_6
    :goto_1
    move v0, v2

    .line 16
    :goto_2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setOverlayEnabled(Z)V

    .line 17
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setFreezeViewVisibility(Z)V

    .line 18
    sget-object v3, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    if-eq p1, v3, :cond_7

    .line 19
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setOverviewSelectEnabled(Z)V

    .line 20
    :cond_7
    iget-boolean v1, p1, Lcom/android/launcher3/V3;->c:Z

    if-eqz v1, :cond_8

    if-eq p1, v3, :cond_8

    .line 21
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->setTaskBorderEnabled(Z)V

    :cond_8
    if-eqz v0, :cond_9

    .line 22
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mBlurUtils:Lcom/android/quickstep/views/BlurUtils;

    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/BlurUtils;->setDrawLiveTileBelowRecents(Z)V

    :cond_9
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/LauncherRecentsView;->onStateTransitionComplete(Lcom/android/launcher3/V3;)V

    return-void
.end method

.method public onStateTransitionStart(Lcom/android/launcher3/V3;)V
    .locals 4

    .line 2
    iget-boolean v0, p1, Lcom/android/launcher3/V3;->c:Z

    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/LauncherRecentsView;->setOverviewStateEnabled(Z)V

    .line 3
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/a;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setOverviewGridEnabled(Z)V

    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/a;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    move-result v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setOverviewGridEnabled(Z)V

    .line 9
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->n()F

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v2

    const/4 v2, 0x0

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setOverviewFullscreenEnabled(Z)V

    .line 10
    sget-object v0, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_3

    .line 11
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setOverviewSelectEnabled(Z)V

    goto :goto_2

    .line 12
    :cond_3
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->resetModalVisuals()V

    .line 13
    :goto_2
    iget-boolean v3, p1, Lcom/android/launcher3/V3;->c:Z

    if-eqz v3, :cond_4

    if-ne p1, v0, :cond_5

    .line 14
    :cond_4
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->setTaskBorderEnabled(Z)V

    .line 15
    :cond_5
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setFreezeViewVisibility(Z)V

    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/LauncherRecentsView;->onStateTransitionStart(Lcom/android/launcher3/V3;)V

    return-void
.end method

.method public onTaskIconChanged(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->onTaskIconChanged(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->E5()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 15
    .line 16
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->y5()Lcom/android/launcher3/util/P1;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/util/P1;->c()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-ne v1, p1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->getTaskContainerById(I)Lcom/android/quickstep/views/TaskContainer;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/util/P1;->b()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/util/P1;->a()Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, p1, v1, v0}, Lcom/android/quickstep/views/LauncherRecentsView;->initiateSplitSelect(Lcom/android/quickstep/views/TaskContainer;ILcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 50
    .line 51
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->q5()V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method protected onTaskLaunchAnimationEnd(Z)Lh4/t;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/launcher3/V3;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 22
    .line 23
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v0}, Lcom/android/launcher3/allapps/G;->x(Lcom/android/launcher3/V3;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->onTaskLaunchAnimationEnd(Z)Lh4/t;

    .line 33
    .line 34
    .line 35
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 36
    .line 37
    return-object p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/V3;

    .line 16
    .line 17
    iget-boolean p0, p0, Lcom/android/launcher3/V3;->c:Z

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public reset()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/views/RecentsView;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0, v0}, Lcom/android/quickstep/views/RecentsView;->setLayoutRotation(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setDrawingTaskRect(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/LauncherRecentsView;->mPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const v2, 0x7f060672

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const v1, 0x7f07082f

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/android/quickstep/views/LauncherRecentsView;->mRedRectThicknes:F

    .line 29
    .line 30
    iput-boolean p1, p0, Lcom/android/quickstep/views/LauncherRecentsView;->mDrawingTaskRect:Z

    .line 31
    .line 32
    return-void
.end method

.method public setModalStateEnabled(IZ)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setSelectedTask(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 18
    .line 19
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    sget-object v0, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object p1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public setOverviewStateEnabled(Z)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setOverviewStateEnabled(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/android/launcher3/V3;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 17
    .line 18
    check-cast v0, Lcom/android/launcher3/C2;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V3;->t(Lcom/android/launcher3/C2;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    and-int/lit8 v0, v0, 0x10

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v2, 0x1

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    move v0, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v0, v1

    .line 33
    :goto_0
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 34
    .line 35
    check-cast v3, Lcom/android/launcher3/C2;

    .line 36
    .line 37
    invoke-virtual {p1, v3}, Lcom/android/launcher3/V3;->t(Lcom/android/launcher3/C2;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    and-int/lit16 p1, p1, 0x100

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    move v1, v2

    .line 46
    :cond_1
    xor-int/lit8 p1, v0, 0x1

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setDisallowScrollToClearAll(Z)V

    .line 49
    .line 50
    .line 51
    xor-int/lit8 p1, v1, 0x1

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setDisallowScrollToAddDesk(Z)V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void
.end method

.method protected updateActionsViewFocusedScroll()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/views/LauncherRecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->y()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    and-int/lit8 v0, v0, 0x10

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    invoke-super {p0}, Lcom/android/quickstep/views/RecentsView;->updateActionsViewFocusedScroll()V

    .line 28
    .line 29
    .line 30
    return-void
.end method
