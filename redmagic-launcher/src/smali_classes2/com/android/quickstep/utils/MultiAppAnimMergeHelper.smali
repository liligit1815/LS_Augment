.class public final Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;
.super Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;
.source "MultiAppAnimMergeHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MultiAppAnimMergeHelper"


# instance fields
.field private mOnTaskAppearedTarget:Landroid/view/RemoteAnimationTarget;

.field private mPreparingMultiAppOpenAnimCount:I

.field private mRecentsAnimFinished:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mRecentsAnimFinished:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public declared-synchronized multiAppOpenAnimStart()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mPreparingMultiAppOpenAnimCount:I

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    const-string v1, "MultiAppAnimMergeHelper"

    .line 7
    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v3, "multiAppOpenAnimStart, "

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mPreparingMultiAppOpenAnimCount:I

    .line 29
    .line 30
    add-int/lit8 v0, v0, -0x1

    .line 31
    .line 32
    iput v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mPreparingMultiAppOpenAnimCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    monitor-exit p0

    .line 38
    return-void

    .line 39
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw v0
.end method

.method public declared-synchronized prepareMultiAppOpenAnim()Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "MultiAppAnimMergeHelper"

    .line 3
    .line 4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v2, "prepareMultiAppOpenAnim, "

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget v2, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mPreparingMultiAppOpenAnimCount:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ", mRecentsAnimFinished = "

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-boolean v2, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mRecentsAnimFinished:Z

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-boolean v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mRecentsAnimFinished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    monitor-exit p0

    .line 41
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mPreparingMultiAppOpenAnimCount:I

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    add-int/2addr v0, v1

    .line 47
    iput v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mPreparingMultiAppOpenAnimCount:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    .line 49
    monitor-exit p0

    .line 50
    return v1

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    throw v0
.end method

.method public reset()V
    .locals 2

    .line 1
    const-string v0, "MultiAppAnimMergeHelper"

    .line 2
    .line 3
    const-string v1, "Reset."

    .line 4
    .line 5
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mPreparingMultiAppOpenAnimCount:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mRecentsAnimFinished:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->setOnTaskAppearedTarget(Landroid/view/RemoteAnimationTarget;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnTaskAppearedTarget(Landroid/view/RemoteAnimationTarget;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setOnTaskAppearedTarget = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "MultiAppAnimMergeHelper"

    .line 19
    .line 20
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mOnTaskAppearedTarget:Landroid/view/RemoteAnimationTarget;

    .line 24
    .line 25
    return-void
.end method

.method public declared-synchronized setRecentsAnimEndState(ZLjava/lang/String;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "reason"

    .line 3
    .line 4
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mRecentsAnimFinished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, p1, :cond_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return v1

    .line 14
    :cond_0
    if-eqz p1, :cond_1

    .line 15
    .line 16
    :try_start_1
    iget v0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mPreparingMultiAppOpenAnimCount:I

    .line 17
    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    const-string p1, "MultiAppAnimMergeHelper"

    .line 21
    .line 22
    const-string p2, "setHasFinishRecent fail: mPreparingMultiAppOpenAnimCount"

    .line 23
    .line 24
    invoke-static {p1, p2}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    .line 27
    monitor-exit p0

    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    :try_start_2
    const-string v0, "MultiAppAnimMergeHelper"

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v3, "setHasFinishRecent: "

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, ": "

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-static {v0, p2}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iput-boolean p1, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mRecentsAnimFinished:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    .line 64
    monitor-exit p0

    .line 65
    return v1

    .line 66
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 67
    throw p1
.end method

.method public updateRecentTargetsIfNeed(Lcom/android/quickstep/RecentsAnimationTargets;)Lcom/android/quickstep/RecentsAnimationTargets;
    .locals 12

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/utils/MultiAppAnimMergeHelper;->mOnTaskAppearedTarget:Landroid/view/RemoteAnimationTarget;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {p0, v1}, Lu2/s;->c(Landroid/view/RemoteAnimationTarget;I)Landroid/view/RemoteAnimationTarget;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v2, "changeMode(it, RemoteAni\u2026argetCompat.MODE_CLOSING)"

    .line 21
    .line 22
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object p0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->appsCompat:[Lu2/s;

    .line 29
    .line 30
    invoke-static {p0}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v2, "apps"

    .line 35
    .line 36
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    array-length v2, p0

    .line 40
    const/4 v3, 0x0

    .line 41
    move v4, v3

    .line 42
    :goto_0
    if-ge v4, v2, :cond_4

    .line 43
    .line 44
    aget-object v5, p0, v4

    .line 45
    .line 46
    iget-object v6, v5, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 47
    .line 48
    if-eqz v6, :cond_2

    .line 49
    .line 50
    invoke-virtual {v6}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    if-eq v6, v1, :cond_3

    .line 55
    .line 56
    :cond_2
    const-string v6, "app"

    .line 57
    .line 58
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    new-instance v5, Lcom/android/quickstep/RecentsAnimationTargets;

    .line 68
    .line 69
    new-array p0, v3, [Landroid/view/RemoteAnimationTarget;

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    move-object v6, p0

    .line 76
    check-cast v6, [Landroid/view/RemoteAnimationTarget;

    .line 77
    .line 78
    iget-object p0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->wallpapersCompat:[Lu2/s;

    .line 79
    .line 80
    invoke-static {p0}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    iget-object p0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->nonAppsCompat:[Lu2/s;

    .line 85
    .line 86
    invoke-static {p0}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 87
    .line 88
    .line 89
    move-result-object v8

    .line 90
    iget-object v9, p1, Lcom/android/quickstep/RecentsAnimationTargets;->homeContentInsets:Landroid/graphics/Rect;

    .line 91
    .line 92
    iget-object v10, p1, Lcom/android/quickstep/RecentsAnimationTargets;->minimizedHomeBounds:Landroid/graphics/Rect;

    .line 93
    .line 94
    new-instance v11, Landroid/os/Bundle;

    .line 95
    .line 96
    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-direct/range {v5 .. v11}, Lcom/android/quickstep/RecentsAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/os/Bundle;)V

    .line 100
    .line 101
    .line 102
    return-object v5
.end method
