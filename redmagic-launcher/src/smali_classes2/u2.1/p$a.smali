.class Lu2/p$a;
.super Landroid/window/RemoteTransitionStub;
.source "RemoteAnimationRunnerCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lu2/p;->A2(Landroid/view/IRemoteAnimationRunner;)Landroid/window/RemoteTransitionStub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final g:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/os/IBinder;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/window/WindowContainerTransaction;

.field private i:Z

.field final j:Lu2/s$a;

.field final synthetic k:Landroid/view/IRemoteAnimationRunner;


# direct methods
.method constructor <init>(Landroid/view/IRemoteAnimationRunner;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/window/RemoteTransitionStub;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/util/ArrayMap;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lu2/p$a;->h:Landroid/window/WindowContainerTransaction;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lu2/p$a;->i:Z

    .line 18
    .line 19
    new-instance p1, Lu2/s$a;

    .line 20
    .line 21
    invoke-direct {p1}, Lu2/s$a;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lu2/p$a;->j:Lu2/s$a;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic o2(Lu2/p$a;Landroid/view/IRemoteAnimationRunner;Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo$Change;Lcom/android/wm/shell/shared/a;Lcom/android/wm/shell/shared/a;Landroid/window/TransitionInfo;Landroid/util/ArrayMap;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lu2/p$a;->r2(Landroid/view/IRemoteAnimationRunner;Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo$Change;Lcom/android/wm/shell/shared/a;Lcom/android/wm/shell/shared/a;Landroid/window/TransitionInfo;Landroid/util/ArrayMap;Landroid/window/IRemoteTransitionFinishedCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(Lu2/p$a;Landroid/os/IBinder;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lu2/p$a;->s2(Landroid/os/IBinder;Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q2(Landroid/window/TransitionInfo;)Lcom/android/wm/shell/recents/c;
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 3
    .line 4
    instance-of v0, p0, Lu2/p;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p0, Lu2/p;

    .line 9
    .line 10
    invoke-virtual {p0}, Lu2/p;->x2()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    :cond_0
    return-object p1
.end method

.method private synthetic r2(Landroid/view/IRemoteAnimationRunner;Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo$Change;Lcom/android/wm/shell/shared/a;Lcom/android/wm/shell/shared/a;Landroid/window/TransitionInfo;Landroid/util/ArrayMap;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 4
    .line 5
    .line 6
    instance-of v1, p1, Lu2/p;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    check-cast p1, Lu2/p;

    .line 11
    .line 12
    invoke-virtual {p1}, Lu2/p;->r2()Lu2/e;

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-boolean p1, p0, Lu2/p$a;->i:Z

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-eqz p2, :cond_2

    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Lu2/p$a;->j:Lu2/s$a;

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1, p2, v0}, Lu2/s$a;->a(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl$Transaction;)V

    .line 38
    .line 39
    .line 40
    if-eqz p3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->isValid()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/high16 p2, 0x3f800000    # 1.0f

    .line 57
    .line 58
    invoke-virtual {v0, p1, p2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p1, p2}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 67
    .line 68
    .line 69
    :cond_1
    const-string p1, "RemoteAnimRunnerCompat"

    .line 70
    .line 71
    const-string p2, "animationFinishedCallback run"

    .line 72
    .line 73
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object p1, p0, Lu2/p$a;->j:Lu2/s$a;

    .line 77
    .line 78
    const/4 p2, 0x1

    .line 79
    iput-boolean p2, p1, Lu2/s$a;->d:Z

    .line 80
    .line 81
    iget-boolean p1, p0, Lu2/p$a;->i:Z

    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    iput-boolean p1, p0, Lu2/p$a;->i:Z

    .line 87
    .line 88
    :cond_3
    new-instance p1, Landroid/view/SurfaceControl$Transaction;

    .line 89
    .line 90
    invoke-direct {p1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p4, p1}, Lcom/android/wm/shell/shared/a;->b(Landroid/view/SurfaceControl$Transaction;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p5, p1}, Lcom/android/wm/shell/shared/a;->b(Landroid/view/SurfaceControl$Transaction;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p6}, Landroid/window/TransitionInfo;->releaseAllSurfaces()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p7}, Landroid/util/ArrayMap;->clear()V

    .line 103
    .line 104
    .line 105
    :try_start_0
    sget-object p2, Lu2/p;->g:Ljava/util/List;

    .line 106
    .line 107
    monitor-enter p2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 108
    :try_start_1
    invoke-interface {p2, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :catchall_0
    move-exception p0

    .line 113
    goto :goto_1

    .line 114
    :catch_0
    :goto_0
    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    :try_start_3
    iget-object p2, p0, Lu2/p$a;->h:Landroid/window/WindowContainerTransaction;

    .line 116
    .line 117
    invoke-virtual {v0, p1}, Landroid/view/SurfaceControl$Transaction;->merge(Landroid/view/SurfaceControl$Transaction;)Landroid/view/SurfaceControl$Transaction;

    .line 118
    .line 119
    .line 120
    move-result-object p3

    .line 121
    invoke-interface {p8, p2, p3}, Landroid/window/IRemoteTransitionFinishedCallback;->onTransitionFinished(Landroid/window/WindowContainerTransaction;Landroid/view/SurfaceControl$Transaction;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->close()V

    .line 125
    .line 126
    .line 127
    const/4 p1, 0x0

    .line 128
    iput-object p1, p0, Lu2/p$a;->h:Landroid/window/WindowContainerTransaction;
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :goto_1
    :try_start_4
    monitor-exit p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 132
    :try_start_5
    throw p0
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 133
    :catch_1
    move-exception p0

    .line 134
    const-string p1, "RemoteAnimRunnerCompat"

    .line 135
    .line 136
    const-string p2, "Failed to call app controlled animation finished callback"

    .line 137
    .line 138
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 139
    .line 140
    .line 141
    :goto_2
    return-void
.end method

.method private synthetic s2(Landroid/os/IBinder;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    new-instance v0, Lu2/p$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lu2/p$a$a;-><init>(Lu2/p$a;Landroid/os/IBinder;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lu2/p$a$a;->onAnimationFinished()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private t2(Landroid/window/TransitionInfo;Lu2/s$a;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    sub-int/2addr v0, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    const/4 v4, 0x2

    .line 14
    if-ltz v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    check-cast v5, Landroid/window/TransitionInfo$Change;

    .line 25
    .line 26
    invoke-virtual {v5}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    if-eqz v6, :cond_2

    .line 31
    .line 32
    invoke-virtual {v5}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {v6}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-ne v6, v4, :cond_2

    .line 41
    .line 42
    invoke-virtual {v5}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eq v3, v1, :cond_0

    .line 47
    .line 48
    invoke-virtual {v5}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    const/4 v5, 0x3

    .line 53
    if-ne v3, v5, :cond_1

    .line 54
    .line 55
    :cond_0
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getType()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eq v3, v4, :cond_1

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getType()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eq v3, v1, :cond_1

    .line 66
    .line 67
    move v3, v1

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    move v3, v2

    .line 70
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    const-string v0, "RemoteAnimRunnerCompat"

    .line 74
    .line 75
    if-eqz v3, :cond_a

    .line 76
    .line 77
    iget-object p0, p0, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 78
    .line 79
    instance-of v3, p0, Lu2/p;

    .line 80
    .line 81
    if-eqz v3, :cond_a

    .line 82
    .line 83
    check-cast p0, Lu2/p;

    .line 84
    .line 85
    invoke-virtual {p0}, Lu2/p;->t2()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_a

    .line 90
    .line 91
    iget-boolean p0, p2, Lu2/s$a;->b:Z

    .line 92
    .line 93
    if-eqz p0, :cond_4

    .line 94
    .line 95
    goto/16 :goto_6

    .line 96
    .line 97
    :cond_4
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    sub-int/2addr p0, v1

    .line 106
    new-instance p2, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v3, "shouldInterrupt: "

    .line 109
    .line 110
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :goto_2
    if-gez p0, :cond_5

    .line 114
    .line 115
    const/4 p0, 0x0

    .line 116
    goto :goto_4

    .line 117
    :cond_5
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-interface {v3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Landroid/window/TransitionInfo$Change;

    .line 126
    .line 127
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    const-string v6, "-"

    .line 132
    .line 133
    if-nez v5, :cond_6

    .line 134
    .line 135
    const-string v3, "task info is null for task "

    .line 136
    .line 137
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    goto :goto_5

    .line 147
    :cond_6
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    iget-object v5, v5, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 152
    .line 153
    if-eqz v5, :cond_7

    .line 154
    .line 155
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    iget-object v5, v5, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 160
    .line 161
    invoke-virtual {v5}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    goto :goto_3

    .line 166
    :cond_7
    const-string v5, "null"

    .line 167
    .line 168
    :goto_3
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    iget v7, v7, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 173
    .line 174
    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v7, ", task = "

    .line 178
    .line 179
    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v5, ", activityType = "

    .line 186
    .line 187
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    invoke-virtual {v5}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    .line 195
    .line 196
    .line 197
    move-result v5

    .line 198
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 205
    .line 206
    .line 207
    move-result-object v5

    .line 208
    invoke-virtual {v5}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    if-ne v5, v4, :cond_9

    .line 213
    .line 214
    const-string p0, "Found launcher task"

    .line 215
    .line 216
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    .line 218
    .line 219
    move-object p0, v3

    .line 220
    :goto_4
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    .line 226
    .line 227
    if-eqz p0, :cond_8

    .line 228
    .line 229
    return v1

    .line 230
    :cond_8
    return v2

    .line 231
    :cond_9
    :goto_5
    add-int/lit8 p0, p0, -0x1

    .line 232
    .line 233
    goto :goto_2

    .line 234
    :cond_a
    :goto_6
    const-string p0, "shouldInterrupt: param for interrupt is null"

    .line 235
    .line 236
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    return v2
.end method


# virtual methods
.method public mergeAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/os/IBinder;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p2}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p0, "RemoteAnimRunnerCompat"

    .line 12
    .line 13
    const-string p1, "Null changes merge animation occur"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 20
    .line 21
    monitor-enter p1

    .line 22
    :try_start_0
    iget-object v0, p0, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 23
    .line 24
    invoke-virtual {v0, p4}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    check-cast p4, Ljava/lang/Runnable;

    .line 29
    .line 30
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    const/4 p1, 0x0

    .line 32
    const/4 v0, 0x1

    .line 33
    if-nez p4, :cond_1

    .line 34
    .line 35
    move v1, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move v1, p1

    .line 38
    :goto_0
    const/4 v2, 0x0

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    move-object v3, v2

    .line 42
    goto :goto_1

    .line 43
    :cond_2
    invoke-direct {p0, p2}, Lu2/p$a;->q2(Landroid/window/TransitionInfo;)Lcom/android/wm/shell/recents/c;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    :goto_1
    iget-object v4, p0, Lu2/p$a;->j:Lu2/s$a;

    .line 48
    .line 49
    invoke-direct {p0, p2, v4}, Lu2/p$a;->t2(Landroid/window/TransitionInfo;Lu2/s$a;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    new-instance v5, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v6, "shouldInterrupt = "

    .line 56
    .line 57
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v6, ", isFinished = "

    .line 64
    .line 65
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, ", rc = "

    .line 72
    .line 73
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v1, "RemoteAnimRunnerCompat"

    .line 80
    .line 81
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-static {v1, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    if-nez v3, :cond_3

    .line 89
    .line 90
    if-eqz v4, :cond_4

    .line 91
    .line 92
    :cond_3
    new-instance v1, Landroid/window/WindowContainerTransaction;

    .line 93
    .line 94
    invoke-direct {v1}, Landroid/window/WindowContainerTransaction;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v1, p0, Lu2/p$a;->h:Landroid/window/WindowContainerTransaction;

    .line 98
    .line 99
    :try_start_1
    invoke-static {v1}, LU2/a$a;->b(Landroid/window/WindowContainerTransaction;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_1 .. :try_end_1} :catch_0

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :catch_0
    move-exception v1

    .line 104
    const-string v4, "RemoteAnimRunnerCompat"

    .line 105
    .line 106
    const-string v5, "Error occur while notifyInterruptScene, "

    .line 107
    .line 108
    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 109
    .line 110
    .line 111
    :goto_2
    sput-boolean v0, Lu2/s;->A:Z

    .line 112
    .line 113
    iput-boolean v0, p0, Lu2/p$a;->i:Z

    .line 114
    .line 115
    :cond_4
    :try_start_2
    iget-object v1, p0, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 116
    .line 117
    instance-of v4, v1, Lu2/p;

    .line 118
    .line 119
    if-eqz v4, :cond_5

    .line 120
    .line 121
    check-cast v1, Lu2/p;

    .line 122
    .line 123
    iget-object v4, p0, Lu2/p$a;->j:Lu2/s$a;

    .line 124
    .line 125
    invoke-virtual {v1, p2, p3, v4, v3}, Lu2/p;->s2(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z

    .line 126
    .line 127
    .line 128
    move-result v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 129
    if-eqz v1, :cond_5

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :catch_1
    move-exception v0

    .line 133
    const-string v1, "RemoteAnimRunnerCompat"

    .line 134
    .line 135
    const-string v3, "mergeAnimation: error "

    .line 136
    .line 137
    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 138
    .line 139
    .line 140
    :cond_5
    move v0, p1

    .line 141
    :goto_3
    const-string v1, "RemoteAnimRunnerCompat"

    .line 142
    .line 143
    new-instance v3, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string v4, "handleMerged = "

    .line 149
    .line 150
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    if-eqz v0, :cond_7

    .line 164
    .line 165
    iput-boolean p1, p0, Lu2/p$a;->i:Z

    .line 166
    .line 167
    invoke-virtual {p3}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 171
    .line 172
    check-cast p1, Lu2/p;

    .line 173
    .line 174
    invoke-virtual {p1}, Landroid/view/IRemoteAnimationRunner$Stub;->onAnimationCancelled()V

    .line 175
    .line 176
    .line 177
    if-eqz p4, :cond_6

    .line 178
    .line 179
    iget-object p1, p0, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 180
    .line 181
    check-cast p1, Lu2/p;

    .line 182
    .line 183
    invoke-virtual {p1, p4}, Lu2/p;->z2(Ljava/lang/Runnable;)V

    .line 184
    .line 185
    .line 186
    :cond_6
    iget-object p0, p0, Lu2/p$a;->h:Landroid/window/WindowContainerTransaction;

    .line 187
    .line 188
    invoke-interface {p5, p0, v2}, Landroid/window/IRemoteTransitionFinishedCallback;->onTransitionFinished(Landroid/window/WindowContainerTransaction;Landroid/view/SurfaceControl$Transaction;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_7
    invoke-virtual {p3}, Landroid/view/SurfaceControl$Transaction;->close()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p2}, Landroid/window/TransitionInfo;->releaseAllSurfaces()V

    .line 196
    .line 197
    .line 198
    if-nez p4, :cond_8

    .line 199
    .line 200
    return-void

    .line 201
    :cond_8
    iget-object p0, p0, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 202
    .line 203
    invoke-interface {p0}, Landroid/view/IRemoteAnimationRunner;->onAnimationCancelled()V

    .line 204
    .line 205
    .line 206
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    :catchall_0
    move-exception p0

    .line 211
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 212
    throw p0
.end method

.method public onTransitionConsumed(Landroid/os/IBinder;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p2, p0, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 2
    .line 3
    monitor-enter p2

    .line 4
    :try_start_0
    iget-object v0, p0, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    iget-object p0, p0, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 11
    .line 12
    invoke-interface {p0}, Landroid/view/IRemoteAnimationRunner;->onAnimationCancelled()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p0
.end method

.method public startAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v10, p1

    .line 4
    .line 5
    move-object/from16 v7, p2

    .line 6
    .line 7
    move-object/from16 v12, p3

    .line 8
    .line 9
    new-instance v8, Landroid/util/ArrayMap;

    .line 10
    .line 11
    invoke-direct {v8}, Landroid/util/ArrayMap;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v7, v12, v8}, Lu2/s;->m(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 15
    .line 16
    .line 17
    move-result-object v17

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-static {v7, v0, v12, v8}, Lu2/s;->n(Landroid/window/TransitionInfo;ZLandroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-static {v7, v3, v12, v8}, Lu2/s;->n(Landroid/window/TransitionInfo;ZLandroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 25
    .line 26
    .line 27
    move-result-object v18

    .line 28
    sput-boolean v3, Lu2/s;->A:Z

    .line 29
    .line 30
    iget-object v4, v1, Lu2/p$a;->j:Lu2/s$a;

    .line 31
    .line 32
    invoke-virtual {v4}, Lu2/s$a;->b()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v7}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    sub-int/2addr v4, v0

    .line 44
    const/4 v5, 0x0

    .line 45
    const/4 v6, 0x0

    .line 46
    move v11, v3

    .line 47
    move v13, v11

    .line 48
    move v14, v13

    .line 49
    move-object v3, v5

    .line 50
    move v15, v6

    .line 51
    move/from16 v16, v15

    .line 52
    .line 53
    move-object v6, v3

    .line 54
    :goto_0
    if-ltz v4, :cond_8

    .line 55
    .line 56
    invoke-virtual {v7}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Landroid/window/TransitionInfo$Change;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    invoke-virtual {v8, v9}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v9

    .line 74
    if-nez v9, :cond_0

    .line 75
    .line 76
    goto/16 :goto_4

    .line 77
    .line 78
    :cond_0
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 79
    .line 80
    .line 81
    move-result-object v9

    .line 82
    if-eqz v9, :cond_3

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 85
    .line 86
    .line 87
    move-result-object v9

    .line 88
    invoke-virtual {v9}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    .line 89
    .line 90
    .line 91
    move-result v9

    .line 92
    move-object/from16 v23, v0

    .line 93
    .line 94
    const/4 v0, 0x2

    .line 95
    if-ne v9, v0, :cond_4

    .line 96
    .line 97
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    const/4 v5, 0x1

    .line 102
    if-eq v0, v5, :cond_2

    .line 103
    .line 104
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    const/4 v5, 0x3

    .line 109
    if-ne v0, v5, :cond_1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_1
    const/4 v13, 0x0

    .line 113
    goto :goto_2

    .line 114
    :cond_2
    :goto_1
    const/4 v13, 0x1

    .line 115
    :goto_2
    invoke-virtual {v7}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    sub-int v11, v0, v4

    .line 124
    .line 125
    move-object/from16 v5, v23

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_3
    move-object/from16 v23, v0

    .line 129
    .line 130
    :cond_4
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getFlags()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    const/16 v22, 0x2

    .line 135
    .line 136
    and-int/lit8 v0, v0, 0x2

    .line 137
    .line 138
    if-eqz v0, :cond_5

    .line 139
    .line 140
    move-object/from16 v6, v23

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_5
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    if-eqz v0, :cond_6

    .line 148
    .line 149
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    const/4 v9, 0x1

    .line 158
    if-ne v0, v9, :cond_6

    .line 159
    .line 160
    const-string v0, "RemoteAnimRunnerCompat"

    .line 161
    .line 162
    const-string v3, "Got tranisition app task"

    .line 163
    .line 164
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-object/from16 v3, v23

    .line 168
    .line 169
    :cond_6
    :goto_3
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    if-nez v0, :cond_7

    .line 174
    .line 175
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getEndRotation()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-ltz v0, :cond_7

    .line 180
    .line 181
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getEndRotation()I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getStartRotation()I

    .line 186
    .line 187
    .line 188
    move-result v9

    .line 189
    if-eq v0, v9, :cond_7

    .line 190
    .line 191
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getEndRotation()I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getStartRotation()I

    .line 196
    .line 197
    .line 198
    move-result v9

    .line 199
    sub-int v14, v0, v9

    .line 200
    .line 201
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    int-to-float v0, v0

    .line 210
    invoke-virtual/range {v23 .. v23}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 211
    .line 212
    .line 213
    move-result-object v9

    .line 214
    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    .line 215
    .line 216
    .line 217
    move-result v9

    .line 218
    int-to-float v9, v9

    .line 219
    move v15, v0

    .line 220
    move/from16 v16, v9

    .line 221
    .line 222
    :cond_7
    :goto_4
    add-int/lit8 v4, v4, -0x1

    .line 223
    .line 224
    const/4 v0, 0x1

    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :cond_8
    new-instance v0, Lcom/android/wm/shell/shared/a;

    .line 228
    .line 229
    invoke-direct {v0}, Lcom/android/wm/shell/shared/a;-><init>()V

    .line 230
    .line 231
    .line 232
    new-instance v4, Lcom/android/wm/shell/shared/a;

    .line 233
    .line 234
    invoke-direct {v4}, Lcom/android/wm/shell/shared/a;-><init>()V

    .line 235
    .line 236
    .line 237
    if-eqz v5, :cond_a

    .line 238
    .line 239
    if-eqz v14, :cond_a

    .line 240
    .line 241
    invoke-virtual {v5}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 242
    .line 243
    .line 244
    move-result-object v9

    .line 245
    if-eqz v9, :cond_a

    .line 246
    .line 247
    invoke-virtual {v5}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 248
    .line 249
    .line 250
    move-result-object v9

    .line 251
    invoke-virtual {v7, v9}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 252
    .line 253
    .line 254
    move-result-object v9

    .line 255
    if-eqz v9, :cond_9

    .line 256
    .line 257
    invoke-virtual {v9}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 258
    .line 259
    .line 260
    move-result-object v9

    .line 261
    move/from16 v24, v11

    .line 262
    .line 263
    move-object v11, v0

    .line 264
    move/from16 v0, v24

    .line 265
    .line 266
    move/from16 v24, v13

    .line 267
    .line 268
    move-object v13, v9

    .line 269
    move/from16 v9, v24

    .line 270
    .line 271
    invoke-virtual/range {v11 .. v16}, Lcom/android/wm/shell/shared/a;->d(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;IFF)V

    .line 272
    .line 273
    .line 274
    move-object/from16 v19, v3

    .line 275
    .line 276
    move-object/from16 v23, v4

    .line 277
    .line 278
    goto :goto_5

    .line 279
    :cond_9
    move v9, v11

    .line 280
    move-object v11, v0

    .line 281
    move v0, v9

    .line 282
    move v9, v13

    .line 283
    const-string v13, "RemoteAnimRunnerCompat"

    .line 284
    .line 285
    move-object/from16 v19, v3

    .line 286
    .line 287
    new-instance v3, Ljava/lang/StringBuilder;

    .line 288
    .line 289
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 290
    .line 291
    .line 292
    move-object/from16 v23, v4

    .line 293
    .line 294
    const-string v4, "Malformed: "

    .line 295
    .line 296
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    const-string v4, " has parent="

    .line 303
    .line 304
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v5}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 308
    .line 309
    .line 310
    move-result-object v4

    .line 311
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    const-string v4, " but it\'s not in info."

    .line 315
    .line 316
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    invoke-static {v13, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    .line 325
    .line 326
    :goto_5
    invoke-virtual {v11}, Lcom/android/wm/shell/shared/a;->c()Landroid/view/SurfaceControl;

    .line 327
    .line 328
    .line 329
    move-result-object v3

    .line 330
    if-eqz v3, :cond_b

    .line 331
    .line 332
    invoke-virtual {v11}, Lcom/android/wm/shell/shared/a;->c()Landroid/view/SurfaceControl;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    invoke-virtual {v12, v3, v0}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 337
    .line 338
    .line 339
    goto :goto_6

    .line 340
    :cond_a
    move-object v11, v0

    .line 341
    move-object/from16 v19, v3

    .line 342
    .line 343
    move-object/from16 v23, v4

    .line 344
    .line 345
    move v9, v13

    .line 346
    :cond_b
    :goto_6
    const-string v0, "RemoteAnimRunnerCompat"

    .line 347
    .line 348
    new-instance v3, Ljava/lang/StringBuilder;

    .line 349
    .line 350
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 351
    .line 352
    .line 353
    const-string v4, "trace_layer_alpha isReturnToHome:"

    .line 354
    .line 355
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    .line 367
    .line 368
    if-eqz v9, :cond_14

    .line 369
    .line 370
    invoke-virtual {v11}, Lcom/android/wm/shell/shared/a;->c()Landroid/view/SurfaceControl;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    if-eqz v0, :cond_c

    .line 375
    .line 376
    invoke-virtual {v11}, Lcom/android/wm/shell/shared/a;->c()Landroid/view/SurfaceControl;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {v7}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 381
    .line 382
    .line 383
    move-result-object v3

    .line 384
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    const/16 v20, 0x3

    .line 389
    .line 390
    mul-int/lit8 v3, v3, 0x3

    .line 391
    .line 392
    invoke-virtual {v12, v0, v3}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 393
    .line 394
    .line 395
    :cond_c
    invoke-virtual {v7}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 400
    .line 401
    .line 402
    move-result v0

    .line 403
    const/16 v21, 0x1

    .line 404
    .line 405
    add-int/lit8 v0, v0, -0x1

    .line 406
    .line 407
    :goto_7
    if-ltz v0, :cond_11

    .line 408
    .line 409
    invoke-virtual {v7}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 410
    .line 411
    .line 412
    move-result-object v3

    .line 413
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object v3

    .line 417
    check-cast v3, Landroid/window/TransitionInfo$Change;

    .line 418
    .line 419
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 420
    .line 421
    .line 422
    move-result-object v4

    .line 423
    invoke-virtual {v8, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    move-result-object v4

    .line 427
    check-cast v4, Landroid/view/SurfaceControl;

    .line 428
    .line 429
    if-nez v4, :cond_e

    .line 430
    .line 431
    :goto_8
    const/4 v3, 0x2

    .line 432
    :cond_d
    const/16 v20, 0x3

    .line 433
    .line 434
    goto :goto_9

    .line 435
    :cond_e
    invoke-virtual {v7}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 436
    .line 437
    .line 438
    move-result-object v9

    .line 439
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 440
    .line 441
    .line 442
    move-result-object v9

    .line 443
    check-cast v9, Landroid/window/TransitionInfo$Change;

    .line 444
    .line 445
    invoke-virtual {v9}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 446
    .line 447
    .line 448
    move-result v9

    .line 449
    invoke-static {v3, v7}, Landroid/window/TransitionInfo;->isIndependent(Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo;)Z

    .line 450
    .line 451
    .line 452
    move-result v3

    .line 453
    if-nez v3, :cond_f

    .line 454
    .line 455
    goto :goto_8

    .line 456
    :cond_f
    const/4 v3, 0x2

    .line 457
    if-eq v9, v3, :cond_10

    .line 458
    .line 459
    const/4 v13, 0x4

    .line 460
    if-ne v9, v13, :cond_d

    .line 461
    .line 462
    :cond_10
    invoke-virtual {v7}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 463
    .line 464
    .line 465
    move-result-object v9

    .line 466
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 467
    .line 468
    .line 469
    move-result v9

    .line 470
    const/16 v20, 0x3

    .line 471
    .line 472
    mul-int/lit8 v9, v9, 0x3

    .line 473
    .line 474
    sub-int/2addr v9, v0

    .line 475
    invoke-virtual {v12, v4, v9}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 476
    .line 477
    .line 478
    invoke-virtual {v11, v12, v4}, Lcom/android/wm/shell/shared/a;->a(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V

    .line 479
    .line 480
    .line 481
    :goto_9
    add-int/lit8 v0, v0, -0x1

    .line 482
    .line 483
    goto :goto_7

    .line 484
    :cond_11
    array-length v0, v2

    .line 485
    const/16 v21, 0x1

    .line 486
    .line 487
    add-int/lit8 v0, v0, -0x1

    .line 488
    .line 489
    :goto_a
    if-ltz v0, :cond_12

    .line 490
    .line 491
    aget-object v3, v2, v0

    .line 492
    .line 493
    iget-object v3, v3, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 494
    .line 495
    invoke-virtual {v12, v3}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 496
    .line 497
    .line 498
    aget-object v3, v2, v0

    .line 499
    .line 500
    iget-object v3, v3, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 501
    .line 502
    const/high16 v4, 0x3f800000    # 1.0f

    .line 503
    .line 504
    invoke-virtual {v12, v3, v4}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 505
    .line 506
    .line 507
    add-int/lit8 v0, v0, -0x1

    .line 508
    .line 509
    goto :goto_a

    .line 510
    :cond_12
    sget-object v0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_EXIT_TRANSITIONS_BUGFIX:Landroid/window/DesktopModeFlags;

    .line 511
    .line 512
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 513
    .line 514
    .line 515
    move-result v0

    .line 516
    if-eqz v0, :cond_13

    .line 517
    .line 518
    invoke-static {v7, v5, v8, v12}, Lu2/p;->p2(Landroid/window/TransitionInfo;Landroid/window/TransitionInfo$Change;Landroid/util/ArrayMap;Landroid/view/SurfaceControl$Transaction;)V

    .line 519
    .line 520
    .line 521
    :cond_13
    move-object v5, v11

    .line 522
    move-object/from16 v11, v23

    .line 523
    .line 524
    goto/16 :goto_c

    .line 525
    .line 526
    :cond_14
    invoke-static {v12, v2}, Lu2/p;->q2(Landroid/view/SurfaceControl$Transaction;[Landroid/view/RemoteAnimationTarget;)V

    .line 527
    .line 528
    .line 529
    if-eqz v5, :cond_15

    .line 530
    .line 531
    invoke-virtual {v5}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    invoke-virtual {v8, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    move-result-object v0

    .line 539
    check-cast v0, Landroid/view/SurfaceControl;

    .line 540
    .line 541
    invoke-virtual {v11, v12, v0}, Lcom/android/wm/shell/shared/a;->a(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V

    .line 542
    .line 543
    .line 544
    :cond_15
    if-eqz v6, :cond_13

    .line 545
    .line 546
    if-eqz v14, :cond_13

    .line 547
    .line 548
    invoke-virtual {v6}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 549
    .line 550
    .line 551
    move-result-object v0

    .line 552
    if-eqz v0, :cond_13

    .line 553
    .line 554
    invoke-virtual {v6}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    invoke-virtual {v7, v0}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 559
    .line 560
    .line 561
    move-result-object v0

    .line 562
    if-eqz v0, :cond_16

    .line 563
    .line 564
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 565
    .line 566
    .line 567
    move-result-object v13

    .line 568
    move-object v5, v11

    .line 569
    move-object/from16 v11, v23

    .line 570
    .line 571
    invoke-virtual/range {v11 .. v16}, Lcom/android/wm/shell/shared/a;->d(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;IFF)V

    .line 572
    .line 573
    .line 574
    goto :goto_b

    .line 575
    :cond_16
    move-object v5, v11

    .line 576
    move-object/from16 v11, v23

    .line 577
    .line 578
    const-string v0, "RemoteAnimRunnerCompat"

    .line 579
    .line 580
    new-instance v3, Ljava/lang/StringBuilder;

    .line 581
    .line 582
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 583
    .line 584
    .line 585
    const-string v4, "Malformed: "

    .line 586
    .line 587
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    .line 589
    .line 590
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 591
    .line 592
    .line 593
    const-string v4, " has parent="

    .line 594
    .line 595
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 596
    .line 597
    .line 598
    invoke-virtual {v6}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 599
    .line 600
    .line 601
    move-result-object v4

    .line 602
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 603
    .line 604
    .line 605
    const-string v4, " but it\'s not in info."

    .line 606
    .line 607
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 608
    .line 609
    .line 610
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 611
    .line 612
    .line 613
    move-result-object v3

    .line 614
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    .line 616
    .line 617
    :goto_b
    invoke-virtual {v11}, Lcom/android/wm/shell/shared/a;->c()Landroid/view/SurfaceControl;

    .line 618
    .line 619
    .line 620
    move-result-object v0

    .line 621
    if-eqz v0, :cond_17

    .line 622
    .line 623
    invoke-virtual {v11}, Lcom/android/wm/shell/shared/a;->c()Landroid/view/SurfaceControl;

    .line 624
    .line 625
    .line 626
    move-result-object v0

    .line 627
    const/4 v3, -0x1

    .line 628
    invoke-virtual {v12, v0, v3}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 629
    .line 630
    .line 631
    invoke-virtual {v6}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 632
    .line 633
    .line 634
    move-result-object v0

    .line 635
    invoke-virtual {v8, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    move-result-object v0

    .line 639
    check-cast v0, Landroid/view/SurfaceControl;

    .line 640
    .line 641
    invoke-virtual {v11, v12, v0}, Lcom/android/wm/shell/shared/a;->a(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V

    .line 642
    .line 643
    .line 644
    :cond_17
    :goto_c
    invoke-virtual {v12}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 645
    .line 646
    .line 647
    move-object v3, v2

    .line 648
    iget-object v2, v1, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 649
    .line 650
    new-instance v0, Lu2/n;

    .line 651
    .line 652
    move-object/from16 v9, p4

    .line 653
    .line 654
    move-object v4, v6

    .line 655
    move-object v6, v11

    .line 656
    move-object v11, v3

    .line 657
    move-object/from16 v3, v19

    .line 658
    .line 659
    invoke-direct/range {v0 .. v9}, Lu2/n;-><init>(Lu2/p$a;Landroid/view/IRemoteAnimationRunner;Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo$Change;Lcom/android/wm/shell/shared/a;Lcom/android/wm/shell/shared/a;Landroid/window/TransitionInfo;Landroid/util/ArrayMap;Landroid/window/IRemoteTransitionFinishedCallback;)V

    .line 660
    .line 661
    .line 662
    iget-object v2, v1, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 663
    .line 664
    monitor-enter v2

    .line 665
    :try_start_0
    iget-object v3, v1, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 666
    .line 667
    invoke-virtual {v3, v10, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    .line 669
    .line 670
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 671
    sget-object v3, Lu2/p;->g:Ljava/util/List;

    .line 672
    .line 673
    monitor-enter v3

    .line 674
    :try_start_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 675
    .line 676
    .line 677
    move-result v2

    .line 678
    const/16 v4, 0x14

    .line 679
    .line 680
    if-le v2, v4, :cond_18

    .line 681
    .line 682
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 683
    .line 684
    .line 685
    goto :goto_d

    .line 686
    :catchall_0
    move-exception v0

    .line 687
    goto :goto_e

    .line 688
    :cond_18
    :goto_d
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 689
    .line 690
    .line 691
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 692
    iget-object v2, v1, Lu2/p$a;->k:Landroid/view/IRemoteAnimationRunner;

    .line 693
    .line 694
    instance-of v3, v2, Lu2/p;

    .line 695
    .line 696
    if-eqz v3, :cond_19

    .line 697
    .line 698
    check-cast v2, Lu2/p;

    .line 699
    .line 700
    new-instance v5, Lu2/o;

    .line 701
    .line 702
    invoke-direct {v5, v1, v10, v0}, Lu2/o;-><init>(Lu2/p$a;Landroid/os/IBinder;Ljava/lang/Runnable;)V

    .line 703
    .line 704
    .line 705
    iget-object v6, v1, Lu2/p$a;->j:Lu2/s$a;

    .line 706
    .line 707
    const/4 v1, 0x0

    .line 708
    move-object v0, v2

    .line 709
    move-object v3, v11

    .line 710
    move-object/from16 v2, v17

    .line 711
    .line 712
    move-object/from16 v4, v18

    .line 713
    .line 714
    invoke-virtual/range {v0 .. v6}, Lu2/p;->u2(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Ljava/lang/Runnable;Lu2/s$a;)V

    .line 715
    .line 716
    .line 717
    return-void

    .line 718
    :cond_19
    move-object v5, v2

    .line 719
    move-object v3, v11

    .line 720
    move-object/from16 v2, v17

    .line 721
    .line 722
    move-object/from16 v4, v18

    .line 723
    .line 724
    new-instance v6, Lu2/p$a$b;

    .line 725
    .line 726
    invoke-direct {v6, v1, v10, v0}, Lu2/p$a$b;-><init>(Lu2/p$a;Landroid/os/IBinder;Ljava/lang/Runnable;)V

    .line 727
    .line 728
    .line 729
    const/4 v1, 0x0

    .line 730
    move-object v0, v5

    .line 731
    move-object v5, v6

    .line 732
    invoke-interface/range {v0 .. v5}, Landroid/view/IRemoteAnimationRunner;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 733
    .line 734
    .line 735
    return-void

    .line 736
    :goto_e
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 737
    throw v0

    .line 738
    :catchall_1
    move-exception v0

    .line 739
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 740
    throw v0
.end method

.method public takeOverAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/window/IRemoteTransitionFinishedCallback;[Landroid/window/WindowAnimationState;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string p0, "RemoteAnimRunnerCompat"

    .line 2
    .line 3
    const-string p1, "takeOverAnimation"

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method
