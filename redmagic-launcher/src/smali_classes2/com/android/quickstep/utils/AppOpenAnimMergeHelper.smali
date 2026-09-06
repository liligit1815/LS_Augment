.class public final Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;
.super Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;
.source "AppOpenAnimMergeHelper.java"


# static fields
.field private static final DEFAULT_MAX_LAYER_Z_ORDER:I = 0x6

.field private static final TAG:Ljava/lang/String; = "AppOpenAnimMergeHelper"


# instance fields
.field private mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

.field private final mRecentsAnimForOpenMergeStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsAnimForOpenMergeStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->lambda$cleanUpRecentsAnim$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/RemoteAnimationTargets;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->onRemoteAnimationMerged$lambda$0(Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final cleanUpRecentsAnim$lambda$4(Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;)V
    .locals 3

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->getAnimState()Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v2, "release mAppOpenTargets, animState="

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "AppOpenAnimMergeHelper"

    .line 34
    .line 35
    invoke-static {v2, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object v1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 39
    .line 40
    if-eq v0, v1, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 47
    .line 48
    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    iput-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method private synthetic lambda$cleanUpRecentsAnim$0()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->cleanUpRecentsAnim$lambda$4(Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final onRemoteAnimationMerged$lambda$0(Lcom/android/quickstep/RemoteAnimationTargets;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private final tryStartRecentsForOpenRemoteMerge(ZLcom/android/systemui/shared/system/RecentsAnimationControllerCompat;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "tryStartRecentsForOpenRemoteMerge: "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, ", size "

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, v0, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    array-length v0, v0

    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :goto_0
    move-object v0, v2

    .line 36
    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, ", recentsAnimationController "

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "AppOpenAnimMergeHelper"

    .line 52
    .line 53
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget-object v0, v0, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    move-object v0, v2

    .line 64
    :goto_2
    if-nez v0, :cond_3

    .line 65
    .line 66
    goto/16 :goto_6

    .line 67
    .line 68
    :cond_3
    array-length v3, v0

    .line 69
    new-array v6, v3, [Landroid/view/RemoteAnimationTarget;

    .line 70
    .line 71
    array-length v3, v0

    .line 72
    const/4 v4, 0x0

    .line 73
    move v5, v4

    .line 74
    :goto_3
    if-ge v5, v3, :cond_8

    .line 75
    .line 76
    aget-object v7, v0, v5

    .line 77
    .line 78
    new-instance v8, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v9, "oldTarget mode = "

    .line 84
    .line 85
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v9, v7, Lu2/s;->m:I

    .line 89
    .line 90
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v8

    .line 97
    invoke-static {v1, v8}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget v8, v7, Lu2/s;->m:I

    .line 101
    .line 102
    const/4 v9, 0x1

    .line 103
    if-eqz v8, :cond_6

    .line 104
    .line 105
    if-ne v8, v9, :cond_5

    .line 106
    .line 107
    if-nez p1, :cond_4

    .line 108
    .line 109
    move v8, v4

    .line 110
    :cond_4
    invoke-virtual {v7}, Lu2/s;->h()Landroid/view/RemoteAnimationTarget;

    .line 111
    .line 112
    .line 113
    move-result-object v10

    .line 114
    invoke-static {v10, v8}, Lu2/s;->c(Landroid/view/RemoteAnimationTarget;I)Landroid/view/RemoteAnimationTarget;

    .line 115
    .line 116
    .line 117
    move-result-object v10

    .line 118
    aput-object v10, v6, v5

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_5
    const/4 v10, 0x2

    .line 122
    if-eq v8, v10, :cond_6

    .line 123
    .line 124
    invoke-virtual {v7}, Lu2/s;->h()Landroid/view/RemoteAnimationTarget;

    .line 125
    .line 126
    .line 127
    move-result-object v10

    .line 128
    aput-object v10, v6, v5

    .line 129
    .line 130
    :cond_6
    :goto_4
    if-nez p1, :cond_7

    .line 131
    .line 132
    goto :goto_5

    .line 133
    :cond_7
    move v9, v8

    .line 134
    :goto_5
    invoke-virtual {v7}, Lu2/s;->h()Landroid/view/RemoteAnimationTarget;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    invoke-static {v7, v9}, Lu2/s;->c(Landroid/view/RemoteAnimationTarget;I)Landroid/view/RemoteAnimationTarget;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    aput-object v7, v6, v5

    .line 143
    .line 144
    add-int/lit8 v5, v5, 0x1

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_8
    iget-object p1, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 148
    .line 149
    if-eqz p1, :cond_a

    .line 150
    .line 151
    iget-object p0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 152
    .line 153
    if-eqz p0, :cond_9

    .line 154
    .line 155
    iget-object v2, p0, Lcom/android/quickstep/RemoteAnimationTargets;->wallpapersCompat:[Lu2/s;

    .line 156
    .line 157
    :cond_9
    invoke-static {v2}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 158
    .line 159
    .line 160
    move-result-object v7

    .line 161
    new-instance v8, Landroid/graphics/Rect;

    .line 162
    .line 163
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 164
    .line 165
    .line 166
    new-instance v9, Landroid/graphics/Rect;

    .line 167
    .line 168
    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    .line 169
    .line 170
    .line 171
    new-instance v10, Landroid/os/Bundle;

    .line 172
    .line 173
    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 174
    .line 175
    .line 176
    new-instance v11, Landroid/window/TransitionInfo;

    .line 177
    .line 178
    invoke-direct {v11, v4, v4}, Landroid/window/TransitionInfo;-><init>(II)V

    .line 179
    .line 180
    .line 181
    move-object v4, p1

    .line 182
    move-object v5, p2

    .line 183
    invoke-virtual/range {v4 .. v11}, Lcom/android/quickstep/RecentsAnimationCallbacks;->onAnimationStart(Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/os/Bundle;Landroid/window/TransitionInfo;)V

    .line 184
    .line 185
    .line 186
    :cond_a
    :goto_6
    return-void
.end method

.method public static tryStartRecentsForOpenRemoteMerge$default(Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;ZLcom/android/systemui/shared/system/RecentsAnimationControllerCompat;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x1

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->tryStartRecentsForOpenRemoteMerge(ZLcom/android/systemui/shared/system/RecentsAnimationControllerCompat;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public checkIfRecentsAnimStarted(Lcom/android/quickstep/RecentsAnimationCallbacks;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsAnimForOpenMergeStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 10
    .line 11
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public cleanUpRecentsAnim()V
    .locals 2

    .line 1
    const-string v0, "AppOpenAnimMergeHelper"

    .line 2
    .line 3
    const-string v1, "cleanUpRecentsAnim"

    .line 4
    .line 5
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsAnimForOpenMergeStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/utils/g;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/android/quickstep/utils/g;-><init>(Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v0}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public gestureTriggerRecentsAnim(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 2

    .line 1
    const-string v0, "recentsAnimationCallbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "AppOpenAnimMergeHelper"

    .line 7
    .line 8
    const-string v1, "gestureTriggerRecentsAnim"

    .line 9
    .line 10
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsAnimForOpenMergeStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 20
    .line 21
    return-void
.end method

.method public isRecentsMergeOpenRemote()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public onRecentsAnimStart(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string v0, "onRecentsAnimStart, equal = "

    .line 8
    .line 9
    const-string v1, "AppOpenAnimMergeHelper"

    .line 10
    .line 11
    invoke-static {v0, p1, v1}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsAnimForOpenMergeStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->cleanUpRecentsAnim()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onRemoteAnimationMerged(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z
    .locals 8

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "t"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "onRemoteAnimationMerged, info = "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, ", recentsController = "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, ", mRecentsCallback = "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, ", mAppOpenTargets = "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "AppOpenAnimMergeHelper"

    .line 57
    .line 58
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    if-eqz p4, :cond_9

    .line 63
    .line 64
    iget-object v2, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mRecentsCallback:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 65
    .line 66
    if-nez v2, :cond_0

    .line 67
    .line 68
    goto/16 :goto_5

    .line 69
    .line 70
    :cond_0
    iget-object v2, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 71
    .line 72
    const/4 v3, 0x1

    .line 73
    if-eqz v2, :cond_2

    .line 74
    .line 75
    iget-object v2, v2, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 76
    .line 77
    if-eqz v2, :cond_2

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    array-length v2, v2

    .line 88
    if-eq v4, v2, :cond_1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    move v1, v0

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 94
    .line 95
    const-string v4, "Recreate targets as count not match"

    .line 96
    .line 97
    invoke-static {v1, v4}, LM3/a;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance v1, Landroid/util/ArrayMap;

    .line 101
    .line 102
    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {p1, p2, v1}, Lu2/s;->m(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {v1}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    new-array v4, v0, [Lu2/s;

    .line 114
    .line 115
    sget-object v5, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 116
    .line 117
    new-instance v6, Lcom/android/quickstep/utils/h;

    .line 118
    .line 119
    invoke-direct {v6, v2}, Lcom/android/quickstep/utils/h;-><init>(Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v5, v6}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 123
    .line 124
    .line 125
    new-instance v2, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 126
    .line 127
    invoke-static {v1}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-static {v4}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-static {v4}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-direct {v2, v1, v5, v4, v3}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 140
    .line 141
    .line 142
    iput-object v2, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 143
    .line 144
    move v1, v3

    .line 145
    :goto_1
    iget-object v2, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 146
    .line 147
    if-eqz v2, :cond_9

    .line 148
    .line 149
    iget-object v2, v2, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 150
    .line 151
    if-eqz v2, :cond_9

    .line 152
    .line 153
    array-length v2, v2

    .line 154
    if-nez v2, :cond_9

    .line 155
    .line 156
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    check-cast v2, Landroid/window/TransitionInfo$Change;

    .line 165
    .line 166
    invoke-static {v2, p1}, Lcom/android/wm/shell/shared/n;->n(Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo;)I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    invoke-virtual {p1, v2}, Landroid/window/TransitionInfo;->getRoot(I)Landroid/window/TransitionInfo$Root;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v2}, Landroid/window/TransitionInfo$Root;->getLeash()Landroid/view/SurfaceControl;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    const-string v4, "info.getRoot(rootIdx).leash"

    .line 179
    .line 180
    invoke-static {v2, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    if-eqz v1, :cond_6

    .line 184
    .line 185
    iget-object p1, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 186
    .line 187
    if-eqz p1, :cond_8

    .line 188
    .line 189
    iget-object p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 190
    .line 191
    if-eqz p1, :cond_8

    .line 192
    .line 193
    array-length v4, p1

    .line 194
    :goto_2
    if-ge v0, v4, :cond_8

    .line 195
    .line 196
    aget-object v5, p1, v0

    .line 197
    .line 198
    iget-object v6, v5, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 199
    .line 200
    if-eqz v6, :cond_4

    .line 201
    .line 202
    invoke-virtual {v6}, Landroid/view/SurfaceControl;->isValid()Z

    .line 203
    .line 204
    .line 205
    move-result v6

    .line 206
    if-eqz v6, :cond_4

    .line 207
    .line 208
    iget v6, v5, Lu2/s;->a:I

    .line 209
    .line 210
    if-ne v3, v6, :cond_4

    .line 211
    .line 212
    if-eqz p3, :cond_3

    .line 213
    .line 214
    iget-object v6, v5, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 215
    .line 216
    invoke-virtual {p3, v6, p2}, Lu2/s$a;->a(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl$Transaction;)V

    .line 217
    .line 218
    .line 219
    :cond_3
    if-eqz p3, :cond_4

    .line 220
    .line 221
    iput-boolean v3, p3, Lu2/s$a;->d:Z

    .line 222
    .line 223
    :cond_4
    const/4 v6, 0x2

    .line 224
    iget v7, v5, Lu2/s;->a:I

    .line 225
    .line 226
    if-eq v6, v7, :cond_5

    .line 227
    .line 228
    iget-object v5, v5, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 229
    .line 230
    const/4 v6, 0x6

    .line 231
    invoke-virtual {p2, v5, v6}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 232
    .line 233
    .line 234
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 235
    .line 236
    goto :goto_2

    .line 237
    :cond_6
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    const-string p3, "info.changes"

    .line 242
    .line 243
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 251
    .line 252
    .line 253
    move-result p3

    .line 254
    if-eqz p3, :cond_7

    .line 255
    .line 256
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object p3

    .line 260
    check-cast p3, Landroid/window/TransitionInfo$Change;

    .line 261
    .line 262
    invoke-virtual {p3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    const/high16 v5, 0x3f800000    # 1.0f

    .line 267
    .line 268
    invoke-virtual {p2, v4, v5}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 269
    .line 270
    .line 271
    invoke-virtual {p3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 272
    .line 273
    .line 274
    move-result-object p3

    .line 275
    invoke-virtual {p2, p3}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 276
    .line 277
    .line 278
    goto :goto_3

    .line 279
    :cond_7
    iget-object p1, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 280
    .line 281
    if-eqz p1, :cond_8

    .line 282
    .line 283
    iget-object p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 284
    .line 285
    if-eqz p1, :cond_8

    .line 286
    .line 287
    array-length p3, p1

    .line 288
    :goto_4
    if-ge v0, p3, :cond_8

    .line 289
    .line 290
    aget-object v4, p1, v0

    .line 291
    .line 292
    iget-object v4, v4, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 293
    .line 294
    invoke-virtual {p2, v4, v2}, Landroid/view/SurfaceControl$Transaction;->reparent(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 295
    .line 296
    .line 297
    add-int/lit8 v0, v0, 0x1

    .line 298
    .line 299
    goto :goto_4

    .line 300
    :cond_8
    invoke-virtual {p2, v2}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 301
    .line 302
    .line 303
    new-instance p1, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 304
    .line 305
    invoke-direct {p1, p4}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;-><init>(Lcom/android/wm/shell/recents/c;)V

    .line 306
    .line 307
    .line 308
    invoke-direct {p0, v1, p1}, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->tryStartRecentsForOpenRemoteMerge(ZLcom/android/systemui/shared/system/RecentsAnimationControllerCompat;)V

    .line 309
    .line 310
    .line 311
    return v3

    .line 312
    :cond_9
    :goto_5
    return v0
.end method

.method public releaseOpenRemoteTargets()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-string v0, "AppOpenAnimMergeHelper"

    .line 6
    .line 7
    const-string v1, "releaseOpenRemoteTargets"

    .line 8
    .line 9
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public setAppOpenRemoteTargets(Lcom/android/quickstep/RemoteAnimationTargets;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setAppOpenRemoteTargets, targets = "

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
    const-string v1, "AppOpenAnimMergeHelper"

    .line 19
    .line 20
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/quickstep/utils/AppOpenAnimMergeHelper;->mAppOpenTargets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 24
    .line 25
    return-void
.end method
