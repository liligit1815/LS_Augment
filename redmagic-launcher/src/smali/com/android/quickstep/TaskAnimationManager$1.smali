.class Lcom/android/quickstep/TaskAnimationManager$1;
.super Ljava/lang/Object;
.source "TaskAnimationManager.java"

# interfaces
.implements Lcom/android/systemui/shared/system/TaskStackChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskAnimationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/TaskAnimationManager;


# direct methods
.method constructor <init>(Lcom/android/quickstep/TaskAnimationManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$1;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onActivityRestartAttempt(Landroid/app/ActivityManager$RunningTaskInfo;ZZZ)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/TaskAnimationManager$1;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$1;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/android/quickstep/TaskAnimationManager;->k(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/TaskAnimationManager$1;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 24
    .line 25
    invoke-static {p2}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Lcom/android/quickstep/BaseContainerInterface;->isInLiveTileMode()Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-eqz p3, :cond_1

    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    if-eqz p3, :cond_1

    .line 44
    .line 45
    sget-object p3, Lf1/a;->J:Lf1/a$a;

    .line 46
    .line 47
    invoke-virtual {p3}, Lf1/a$a;->c()Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-eqz p3, :cond_1

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 62
    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    iget p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Lcom/android/quickstep/views/RecentsView;->launchSideTaskInLiveTileModeForRestartedApp(I)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$1;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 75
    .line 76
    invoke-static {p0}, Lcom/android/quickstep/TaskAnimationManager;->k(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p1, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method
