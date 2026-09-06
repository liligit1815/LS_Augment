.class public abstract Lcom/android/quickstep/BaseWindowInterface;
.super Lcom/android/quickstep/BaseContainerInterface;
.source "BaseWindowInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/BaseContainerInterface<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
        ">;"
    }
.end annotation


# instance fields
.field final TAG:Ljava/lang/String;

.field private mTargetState:Lcom/android/quickstep/fallback/RecentsState;


# direct methods
.method protected constructor <init>(Lcom/android/quickstep/fallback/RecentsState;Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/android/quickstep/BaseContainerInterface;-><init>(Lcom/android/launcher3/statemanager/a;)V

    .line 2
    .line 3
    .line 4
    const-string p2, "BaseWindowInterface"

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/BaseWindowInterface;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/quickstep/BaseWindowInterface;->mTargetState:Lcom/android/quickstep/fallback/RecentsState;

    .line 9
    .line 10
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/BaseWindowInterface;)Lcom/android/quickstep/fallback/RecentsState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface;->mTargetState:Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/BaseWindowInterface;Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/BaseWindowInterface;->mTargetState:Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public closeOverlay()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Lcom/android/quickstep/G0;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/android/quickstep/G0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public deferStartingActivity(Lcom/android/quickstep/RecentsAnimationDeviceState;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/o4;->s(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    move p0, v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move p0, v0

    .line 18
    :goto_0
    invoke-virtual {p1, p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isInDeferredGestureRegion(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isImeRenderingNavButtons()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    invoke-static {p2}, Lcom/android/launcher3/H4;->c(Landroid/view/MotionEvent;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    return v0

    .line 40
    :cond_2
    :goto_1
    return v1
.end method

.method public abstract getCreatedContainer()Lcom/android/quickstep/fallback/window/RecentsWindowManager;
.end method

.method public bridge synthetic getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseWindowInterface;->getCreatedContainer()Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    move-result-object p0

    return-object p0
.end method

.method public getDepthController()LP1/h;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final isResumed()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseWindowInterface;->isStarted()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final isStarted()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseWindowInterface;->getCreatedContainer()Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isStarted()Z

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

.method public switchRunningTaskViewToScreenshot(Ljava/util/HashMap;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseWindowInterface;->getCreatedContainer()Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getOverviewPanel()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    if-nez p0, :cond_2

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void

    .line 22
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/util/HashMap;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
