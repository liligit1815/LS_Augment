.class public final Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;
.super Ljava/lang/Object;
.source "OverviewCommandHelper.kt"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/OverviewCommandHelper;->executeWhenRecentsIsNotVisible(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lu4/a;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

.field final synthetic $containerInterface:Lcom/android/quickstep/BaseContainerInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/BaseContainerInterface<",
            "**>;"
        }
    .end annotation
.end field

.field final synthetic $interactionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic $recentsView:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/quickstep/OverviewCommandHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/BaseContainerInterface;Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/views/RecentsView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Lcom/android/quickstep/BaseContainerInterface<",
            "**>;",
            "Lcom/android/quickstep/OverviewCommandHelper;",
            "Lcom/android/quickstep/AbsSwipeUpHandler;",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$containerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$interactionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->onRecentsAnimationStart$lambda$1(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onRecentsAnimationStart$lambda$1(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "recents animation started - onInitBackgroundStateUI: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "OverviewCommandHelper"

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    new-instance p0, Landroid/graphics/PointF;

    .line 24
    .line 25
    invoke-direct {p0}, Landroid/graphics/PointF;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p1, v1, p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onGestureEnded(FLandroid/graphics/PointF;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public onRecentsAnimationCanceled(Ljava/util/HashMap;)V
    .locals 2
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
    const-string v0, "thumbnailDatas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "recents animation canceled: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "OverviewCommandHelper"

    .line 26
    .line 27
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$interactionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->onGestureCancelled()V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$containerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->onRecentsAnimationComplete()V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 1

    .line 1
    const-string p3, "controller"

    .line 2
    .line 3
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "targets"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 12
    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string p3, "recents animation started: "

    .line 19
    .line 20
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string p2, "OverviewCommandHelper"

    .line 31
    .line 32
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    sget-object p1, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$containerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    const/16 p2, 0xb

    .line 58
    .line 59
    invoke-static {p1, p2}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 63
    .line 64
    iget-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 65
    .line 66
    invoke-static {p1, p2}, Lcom/android/quickstep/OverviewCommandHelper;->access$updateRecentsViewFocus(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 70
    .line 71
    iget-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 72
    .line 73
    invoke-static {p1, p2}, Lcom/android/quickstep/OverviewCommandHelper;->access$logShowOverviewFrom(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$containerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 77
    .line 78
    iget-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 79
    .line 80
    iget-object p3, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$interactionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 81
    .line 82
    new-instance v0, Lcom/android/quickstep/L1;

    .line 83
    .line 84
    invoke-direct {v0, p2, p3}, Lcom/android/quickstep/L1;-><init>(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v0}, Lcom/android/quickstep/BaseContainerInterface;->runOnInitBackgroundStateUI(Ljava/lang/Runnable;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$executeWhenRecentsIsNotVisible$recentAnimListener$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
