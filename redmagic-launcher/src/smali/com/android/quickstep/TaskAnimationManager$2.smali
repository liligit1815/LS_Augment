.class Lcom/android/quickstep/TaskAnimationManager$2;
.super Ljava/lang/Object;
.source "TaskAnimationManager.java"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/TaskAnimationManager;->startRecentsAnimation(Lcom/android/quickstep/GestureState;Landroid/content/Intent;Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)Lcom/android/quickstep/RecentsAnimationCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/TaskAnimationManager;

.field final synthetic val$gestureState:Lcom/android/quickstep/GestureState;

.field final synthetic val$newCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;


# direct methods
.method constructor <init>(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/TaskAnimationManager$2;->val$gestureState:Lcom/android/quickstep/GestureState;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/TaskAnimationManager$2;->val$newCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/TaskAnimationManager$2;Lcom/android/quickstep/GestureState;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskAnimationManager$2;->lambda$onRecentsAnimationStart$0(Lcom/android/quickstep/GestureState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private isNonRecentsStartedTasksAppeared([Landroid/view/RemoteAnimationTarget;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/android/quickstep/GestureState;->mLastStartedTaskIdPredicate:Ljava/util/function/Predicate;

    .line 22
    .line 23
    invoke-static {p1, p0}, Lcom/android/internal/util/ArrayUtils;->find([Ljava/lang/Object;Ljava/util/function/Predicate;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private synthetic lambda$onRecentsAnimationStart$0(Lcom/android/quickstep/GestureState;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eq v0, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
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
    const-string p1, "Recent_Toggle"

    .line 2
    .line 3
    const-string v0, "onRecentsAnimationCanceled: "

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/y0;->z()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->l(Lcom/android/quickstep/TaskAnimationManager;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    const-string p1, "onRecentsAnimationCanceled"

    .line 23
    .line 24
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logStartRecentsAnimationCallback(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-static {p1, v0}, Lcom/android/quickstep/TaskAnimationManager;->p(Lcom/android/quickstep/TaskAnimationManager;Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->val$newCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 36
    .line 37
    invoke-static {p1, p0}, Lcom/android/quickstep/TaskAnimationManager;->t(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onRecentsAnimationFinished(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 1

    .line 1
    const-string p1, "Recent_Toggle"

    .line 2
    .line 3
    const-string v0, "onRecentsAnimationFinished: "

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/y0;->z()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->l(Lcom/android/quickstep/TaskAnimationManager;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    const-string p1, "onRecentsAnimationFinished"

    .line 23
    .line 24
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logStartRecentsAnimationCallback(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-static {p1, v0}, Lcom/android/quickstep/TaskAnimationManager;->p(Lcom/android/quickstep/TaskAnimationManager;Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->val$newCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 36
    .line 37
    invoke-static {p1, p0}, Lcom/android/quickstep/TaskAnimationManager;->t(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/quickstep/TaskAnimationManager;->l(Lcom/android/quickstep/TaskAnimationManager;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v0, "onRecentsAnimationStart"

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logStartRecentsAnimationCallback(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->p(Lcom/android/quickstep/TaskAnimationManager;Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/android/quickstep/TaskAnimationManager;->e(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto/16 :goto_2

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 37
    .line 38
    invoke-static {v0, p1}, Lcom/android/quickstep/TaskAnimationManager;->n(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/RecentsAnimationController;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 42
    .line 43
    invoke-static {p1, p2}, Lcom/android/quickstep/TaskAnimationManager;->r(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 47
    .line 48
    invoke-static {p1, p3}, Lcom/android/quickstep/TaskAnimationManager;->s(Lcom/android/quickstep/TaskAnimationManager;Landroid/window/TransitionInfo;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p2, p2, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 58
    .line 59
    array-length p2, p2

    .line 60
    const/4 p3, 0x1

    .line 61
    if-le p2, p3, :cond_2

    .line 62
    .line 63
    move p2, p3

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    move p2, v1

    .line 66
    :goto_0
    invoke-virtual {p1, p2}, Lcom/android/quickstep/GestureState;->getRunningTaskIds(Z)[I

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object p2, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 71
    .line 72
    array-length v0, p1

    .line 73
    new-array v0, v0, [Landroid/view/RemoteAnimationTarget;

    .line 74
    .line 75
    invoke-static {p2, v0}, Lcom/android/quickstep/TaskAnimationManager;->o(Lcom/android/quickstep/TaskAnimationManager;[Landroid/view/RemoteAnimationTarget;)V

    .line 76
    .line 77
    .line 78
    move p2, v1

    .line 79
    :goto_1
    array-length v0, p1

    .line 80
    if-ge p2, v0, :cond_3

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/android/quickstep/TaskAnimationManager;->m(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationTargets;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    aget v2, p1, p2

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Lcom/android/quickstep/RemoteAnimationTargets;->findTask(I)Landroid/view/RemoteAnimationTarget;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v2, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 95
    .line 96
    invoke-static {v2}, Lcom/android/quickstep/TaskAnimationManager;->i(Lcom/android/quickstep/TaskAnimationManager;)[Landroid/view/RemoteAnimationTarget;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    aput-object v0, v2, p2

    .line 101
    .line 102
    add-int/lit8 p2, p2, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 106
    .line 107
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p2, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 112
    .line 113
    invoke-static {p2}, Lcom/android/quickstep/TaskAnimationManager;->i(Lcom/android/quickstep/TaskAnimationManager;)[Landroid/view/RemoteAnimationTarget;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p1, p2}, Lcom/android/quickstep/GestureState;->updateLastAppearedTaskTargets([Landroid/view/RemoteAnimationTarget;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 121
    .line 122
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->m(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationTargets;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-boolean p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->hasRecents:Z

    .line 127
    .line 128
    if-eqz p1, :cond_4

    .line 129
    .line 130
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 131
    .line 132
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->m(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationTargets;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iget-object p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 137
    .line 138
    array-length p1, p1

    .line 139
    if-ne p1, p3, :cond_4

    .line 140
    .line 141
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 142
    .line 143
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->m(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationTargets;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iget-object p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 148
    .line 149
    aget-object p1, p1, v1

    .line 150
    .line 151
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    const/4 p2, 0x2

    .line 158
    if-ne p1, p2, :cond_4

    .line 159
    .line 160
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 161
    .line 162
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    sget p2, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 167
    .line 168
    iget-object p3, p0, Lcom/android/quickstep/TaskAnimationManager$2;->val$gestureState:Lcom/android/quickstep/GestureState;

    .line 169
    .line 170
    new-instance v0, Lcom/android/quickstep/Y4;

    .line 171
    .line 172
    invoke-direct {v0, p0, p3}, Lcom/android/quickstep/Y4;-><init>(Lcom/android/quickstep/TaskAnimationManager$2;Lcom/android/quickstep/GestureState;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, p2, v0}, Lcom/android/quickstep/GestureState;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 176
    .line 177
    .line 178
    :cond_4
    :goto_2
    return-void
.end method

.method public onTasksAppeared([Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p1, v0

    .line 3
    .line 4
    iget-object v2, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 5
    .line 6
    invoke-static {v2}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    array-length v3, p1

    .line 15
    move v4, v0

    .line 16
    :goto_0
    if-ge v4, v3, :cond_1

    .line 17
    .line 18
    aget-object v5, p1, v4

    .line 19
    .line 20
    iget-object v5, v5, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 21
    .line 22
    invoke-virtual {v5}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const/4 v6, 0x2

    .line 27
    if-ne v5, v6, :cond_0

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    instance-of v5, v5, Lcom/android/quickstep/RecentsActivity;

    .line 34
    .line 35
    if-eqz v5, :cond_0

    .line 36
    .line 37
    sget-object v5, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 38
    .line 39
    iget-object v6, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 40
    .line 41
    invoke-static {v6}, Lcom/android/quickstep/TaskAnimationManager;->g(Lcom/android/quickstep/TaskAnimationManager;)Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-virtual {v5, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    check-cast v5, Lcom/android/launcher3/util/Z;

    .line 50
    .line 51
    iget-object v6, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 52
    .line 53
    invoke-static {v6}, Lcom/android/quickstep/TaskAnimationManager;->h(Lcom/android/quickstep/TaskAnimationManager;)I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    invoke-virtual {v5, v6}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v5}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    sget-object v6, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 66
    .line 67
    if-eq v5, v6, :cond_0

    .line 68
    .line 69
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 78
    .line 79
    if-eqz p0, :cond_5

    .line 80
    .line 81
    const/4 p1, 0x0

    .line 82
    const/4 p2, 0x1

    .line 83
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    new-array v9, v0, [Landroid/view/RemoteAnimationTarget;

    .line 91
    .line 92
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->isInLiveTileMode()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-nez v3, :cond_3

    .line 97
    .line 98
    iget-object v3, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 99
    .line 100
    invoke-static {v3}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v3}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    sget-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 109
    .line 110
    if-eq v3, v4, :cond_3

    .line 111
    .line 112
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskAnimationManager$2;->isNonRecentsStartedTasksAppeared([Landroid/view/RemoteAnimationTarget;)Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-eqz v3, :cond_2

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_2
    move-object v7, p1

    .line 120
    goto :goto_2

    .line 121
    :cond_3
    :goto_1
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    if-eqz v3, :cond_2

    .line 126
    .line 127
    sget-object v3, Lf1/a;->J:Lf1/a$a;

    .line 128
    .line 129
    invoke-virtual {v3}, Lf1/a$a;->c()Z

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    if-eqz v3, :cond_2

    .line 134
    .line 135
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    move-object v5, v2

    .line 144
    check-cast v5, Lcom/android/quickstep/views/RecentsView;

    .line 145
    .line 146
    if-eqz v5, :cond_4

    .line 147
    .line 148
    iget p0, v1, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 149
    .line 150
    invoke-static {p0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logLaunchingSideTask(I)V

    .line 151
    .line 152
    .line 153
    iget v6, v1, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 154
    .line 155
    new-array v8, v0, [Landroid/view/RemoteAnimationTarget;

    .line 156
    .line 157
    move-object v7, p1

    .line 158
    move-object v10, p2

    .line 159
    invoke-virtual/range {v5 .. v10}, Lcom/android/quickstep/views/RecentsView;->launchSideTaskInLiveTileMode(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_4
    move-object v7, p1

    .line 164
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logLaunchingSideTaskFailed()V

    .line 165
    .line 166
    .line 167
    :goto_2
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 168
    .line 169
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->f(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationController;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    if-eqz p1, :cond_5

    .line 174
    .line 175
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 176
    .line 177
    invoke-static {p1, v7}, Lcom/android/quickstep/TaskAnimationManager;->o(Lcom/android/quickstep/TaskAnimationManager;[Landroid/view/RemoteAnimationTarget;)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 181
    .line 182
    invoke-static {p1}, Lcom/android/quickstep/TaskAnimationManager;->j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$2;->this$0:Lcom/android/quickstep/TaskAnimationManager;

    .line 187
    .line 188
    invoke-static {p0}, Lcom/android/quickstep/TaskAnimationManager;->i(Lcom/android/quickstep/TaskAnimationManager;)[Landroid/view/RemoteAnimationTarget;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-virtual {p1, p0}, Lcom/android/quickstep/GestureState;->updateLastAppearedTaskTargets([Landroid/view/RemoteAnimationTarget;)V

    .line 193
    .line 194
    .line 195
    :cond_5
    return-void
.end method
