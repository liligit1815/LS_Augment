.class Lcom/android/quickstep/TaskShortcutFactory$3;
.super Ljava/lang/Object;
.source "TaskShortcutFactory.java"

# interfaces
.implements Lcom/android/quickstep/TaskShortcutFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskShortcutFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getShortcuts(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            "Lcom/android/quickstep/views/TaskContainer;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    iget-boolean v2, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    const/4 v4, 0x1

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    move v2, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v2, v3

    .line 32
    :goto_0
    invoke-virtual {v0, p2}, Lcom/android/quickstep/views/RecentsView;->isTaskInExpectedScrollPosition(Lcom/android/quickstep/views/TaskView;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    if-eqz v5, :cond_2

    .line 39
    .line 40
    move v3, v4

    .line 41
    :cond_2
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->supportsAppPairs()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_5

    .line 46
    .line 47
    if-nez v3, :cond_5

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getAppPairsController()Lcom/android/quickstep/util/AppPairsController;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p2}, Lcom/android/quickstep/util/AppPairsController;->canSaveAppPair(Lcom/android/quickstep/views/TaskView;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->Q0:Z

    .line 65
    .line 66
    if-eqz p0, :cond_4

    .line 67
    .line 68
    const p0, 0x7f080d67

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    const p0, 0x7f080d68

    .line 73
    .line 74
    .line 75
    :goto_1
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$SaveAppPairSystemShortcut;

    .line 76
    .line 77
    check-cast p2, Lcom/android/quickstep/views/GroupedTaskView;

    .line 78
    .line 79
    invoke-direct {v0, p1, p2, p0}, Lcom/android/quickstep/TaskShortcutFactory$SaveAppPairSystemShortcut;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/GroupedTaskView;I)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_5
    :goto_2
    return-object v1
.end method

.method public showForGroupedTask()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
