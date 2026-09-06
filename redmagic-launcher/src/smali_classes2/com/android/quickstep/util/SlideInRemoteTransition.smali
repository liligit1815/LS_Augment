.class public final Lcom/android/quickstep/util/SlideInRemoteTransition;
.super Landroid/window/RemoteTransitionStub;
.source "SlideInRemoteTransition.kt"


# instance fields
.field private final animationDurationMs:J

.field private final cornerRadius:F

.field private final interpolator:Landroid/animation/TimeInterpolator;

.field private final isRtl:Z

.field private final onFinishCallback:Ljava/lang/Runnable;

.field private final onStartCallback:Ljava/lang/Runnable;

.field private final pageSpacing:I


# direct methods
.method public constructor <init>(ZIFLandroid/animation/TimeInterpolator;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "interpolator"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onStartCallback"

    .line 7
    .line 8
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "onFinishCallback"

    .line 12
    .line 13
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Landroid/window/RemoteTransitionStub;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-boolean p1, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->isRtl:Z

    .line 20
    .line 21
    iput p2, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->pageSpacing:I

    .line 22
    .line 23
    iput p3, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->cornerRadius:F

    .line 24
    .line 25
    iput-object p4, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->interpolator:Landroid/animation/TimeInterpolator;

    .line 26
    .line 27
    iput-object p5, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->onStartCallback:Ljava/lang/Runnable;

    .line 28
    .line 29
    iput-object p6, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->onFinishCallback:Ljava/lang/Runnable;

    .line 30
    .line 31
    const-wide/16 p1, 0x1f4

    .line 32
    .line 33
    iput-wide p1, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->animationDurationMs:J

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic o2(Ljava/util/HashMap;Ljava/util/HashMap;Lcom/android/quickstep/util/SlideInRemoteTransition;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/SlideInRemoteTransition;->startAnimation$lambda$2(Ljava/util/HashMap;Ljava/util/HashMap;Lcom/android/quickstep/util/SlideInRemoteTransition;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(Landroid/window/IRemoteTransitionFinishedCallback;Lcom/android/quickstep/util/SlideInRemoteTransition;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/SlideInRemoteTransition;->startAnimation$lambda$3(Landroid/window/IRemoteTransitionFinishedCallback;Lcom/android/quickstep/util/SlideInRemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/SlideInRemoteTransition;->startAnimation$lambda$4(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final startAnimation$lambda$2(Ljava/util/HashMap;Ljava/util/HashMap;Lcom/android/quickstep/util/SlideInRemoteTransition;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 9

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p4, Landroid/view/SurfaceControl$Transaction;

    .line 7
    .line 8
    invoke-direct {p4}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "<get-keys>(...)"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v3, 0x0

    .line 29
    const-string v4, "null cannot be cast to non-null type kotlin.Float"

    .line 30
    .line 31
    const/4 v5, 0x1

    .line 32
    const/4 v6, -0x1

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroid/view/SurfaceControl;

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    check-cast v7, Landroid/graphics/Rect;

    .line 46
    .line 47
    iget-boolean v8, p2, Lcom/android/quickstep/util/SlideInRemoteTransition;->isRtl:Z

    .line 48
    .line 49
    if-eqz v8, :cond_0

    .line 50
    .line 51
    move v5, v6

    .line 52
    :cond_0
    invoke-static {v7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget v6, v7, Landroid/graphics/Rect;->right:I

    .line 56
    .line 57
    iget v7, p2, Lcom/android/quickstep/util/SlideInRemoteTransition;->pageSpacing:I

    .line 58
    .line 59
    add-int/2addr v6, v7

    .line 60
    mul-int/2addr v5, v6

    .line 61
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    invoke-static {v6, v4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    check-cast v6, Ljava/lang/Float;

    .line 69
    .line 70
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    int-to-float v5, v5

    .line 75
    mul-float/2addr v4, v5

    .line 76
    invoke-virtual {p4, v2, v4, v3}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Landroid/view/SurfaceControl;

    .line 102
    .line 103
    const/high16 v1, 0x3f800000    # 1.0f

    .line 104
    .line 105
    invoke-virtual {p4, v0, v1}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Landroid/graphics/Rect;

    .line 113
    .line 114
    iget-boolean v7, p2, Lcom/android/quickstep/util/SlideInRemoteTransition;->isRtl:Z

    .line 115
    .line 116
    if-eqz v7, :cond_2

    .line 117
    .line 118
    move v7, v6

    .line 119
    goto :goto_2

    .line 120
    :cond_2
    move v7, v5

    .line 121
    :goto_2
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 125
    .line 126
    iget v8, p2, Lcom/android/quickstep/util/SlideInRemoteTransition;->pageSpacing:I

    .line 127
    .line 128
    add-int/2addr v2, v8

    .line 129
    mul-int/2addr v7, v2

    .line 130
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-static {v2, v4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    check-cast v2, Ljava/lang/Float;

    .line 138
    .line 139
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    sub-float/2addr v1, v2

    .line 144
    neg-int v2, v7

    .line 145
    int-to-float v2, v2

    .line 146
    mul-float/2addr v1, v2

    .line 147
    invoke-virtual {p4, v0, v1, v3}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_3
    invoke-virtual {p4}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method private static final startAnimation$lambda$3(Landroid/window/IRemoteTransitionFinishedCallback;Lcom/android/quickstep/util/SlideInRemoteTransition;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    invoke-interface {p0, v1, v0}, Landroid/window/IRemoteTransitionFinishedCallback;->onTransitionFinished(Landroid/window/WindowContainerTransaction;Landroid/view/SurfaceControl$Transaction;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/android/quickstep/util/SlideInRemoteTransition;->onFinishCallback:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    return-void
.end method

.method private static final startAnimation$lambda$4(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public startAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 7

    .line 1
    const-string v0, "transition"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "info"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "startT"

    .line 12
    .line 13
    invoke-static {p3, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "finishCB"

    .line 17
    .line 18
    invoke-static {p4, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x2

    .line 22
    new-array v0, p1, [F

    .line 23
    .line 24
    fill-array-data v0, :array_0

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->interpolator:Landroid/animation/TimeInterpolator;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 34
    .line 35
    .line 36
    iget-wide v1, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->animationDurationMs:J

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    new-instance v1, Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_3

    .line 64
    .line 65
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Landroid/window/TransitionInfo$Change;

    .line 70
    .line 71
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const-string v5, "getLeash(...)"

    .line 76
    .line 77
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p3, v4}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    if-eqz v5, :cond_1

    .line 88
    .line 89
    invoke-virtual {v5}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    if-ne v6, p1, :cond_1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    if-eqz v5, :cond_0

    .line 97
    .line 98
    iget v5, v5, Landroid/app/ActivityManager$RunningTaskInfo;->parentTaskId:I

    .line 99
    .line 100
    const/4 v6, -0x1

    .line 101
    if-ne v5, v6, :cond_0

    .line 102
    .line 103
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    invoke-static {v5}, Lcom/android/wm/shell/shared/n;->d(I)Z

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    if-eqz v5, :cond_2

    .line 112
    .line 113
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    invoke-virtual {p3, v4, v5}, Landroid/view/SurfaceControl$Transaction;->setCrop(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)Landroid/view/SurfaceControl$Transaction;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    iget v6, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->cornerRadius:F

    .line 129
    .line 130
    invoke-virtual {v5, v4, v6}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 131
    .line 132
    .line 133
    :cond_2
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    invoke-static {v5}, Lcom/android/wm/shell/shared/n;->i(I)Z

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    if-eqz v5, :cond_0

    .line 142
    .line 143
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-virtual {p3, v4, v3}, Landroid/view/SurfaceControl$Transaction;->setCrop(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)Landroid/view/SurfaceControl$Transaction;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    iget v5, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->cornerRadius:F

    .line 159
    .line 160
    invoke-virtual {v3, v4, v5}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/util/SlideInRemoteTransition;->onStartCallback:Ljava/lang/Runnable;

    .line 165
    .line 166
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p3}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 170
    .line 171
    .line 172
    new-instance p1, Lcom/android/quickstep/util/I0;

    .line 173
    .line 174
    invoke-direct {p1, v1, v2, p0, v0}, Lcom/android/quickstep/util/I0;-><init>(Ljava/util/HashMap;Ljava/util/HashMap;Lcom/android/quickstep/util/SlideInRemoteTransition;Landroid/animation/ValueAnimator;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 178
    .line 179
    .line 180
    new-instance p1, Lcom/android/quickstep/util/J0;

    .line 181
    .line 182
    invoke-direct {p1, p4, p0}, Lcom/android/quickstep/util/J0;-><init>(Landroid/window/IRemoteTransitionFinishedCallback;Lcom/android/quickstep/util/SlideInRemoteTransition;)V

    .line 183
    .line 184
    .line 185
    invoke-static {p1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 190
    .line 191
    .line 192
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 193
    .line 194
    new-instance p1, Lcom/android/quickstep/util/K0;

    .line 195
    .line 196
    invoke-direct {p1, v0}, Lcom/android/quickstep/util/K0;-><init>(Landroid/animation/ValueAnimator;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
