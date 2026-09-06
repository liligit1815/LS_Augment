.class public final Lcom/android/quickstep/TaskViewUtils;
.super Ljava/lang/Object;
.source "TaskViewUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "TaskViewUtils"

.field public static final TASK_COUNT_0:I = 0x0

.field public static final TASK_COUNT_1:I = 0x1

.field public static final TASK_COUNT_2:I = 0x2

.field public static final TASK_COUNT_3:I = 0x3

.field public static final TASK_COUNT_4:I = 0x4

.field public static final TASK_COUNT_5:I = 0x5

.field public static final TASK_COUNT_6:I = 0x6

.field public static final TASK_COUNT_7:I = 0x7

.field private static final TEMP_FULLSCREEN_BOUNDS:Landroid/graphics/Rect;

.field private static final TEMP_PIVOT:Landroid/graphics/PointF;

.field private static final TEMP_TASK_DIMENSION:Landroid/graphics/PointF;

.field private static final TEMP_THUMBNAIL_BOUNDS:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/TaskViewUtils;->TEMP_THUMBNAIL_BOUNDS:Landroid/graphics/Rect;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/quickstep/TaskViewUtils;->TEMP_FULLSCREEN_BOUNDS:Landroid/graphics/Rect;

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/PointF;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/quickstep/TaskViewUtils;->TEMP_TASK_DIMENSION:Landroid/graphics/PointF;

    .line 21
    .line 22
    new-instance v0, Landroid/graphics/PointF;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/android/quickstep/TaskViewUtils;->TEMP_PIVOT:Landroid/graphics/PointF;

    .line 28
    .line 29
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/SurfaceControl;

    .line 20
    .line 21
    invoke-virtual {p1, v0, p2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic b(ILandroid/graphics/Matrix;[Landroid/graphics/Matrix;[Landroid/graphics/Matrix;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;[Landroid/graphics/Matrix;[Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p0, :cond_0

    .line 3
    .line 4
    aget-object v1, p2, v0

    .line 5
    .line 6
    invoke-virtual {p1, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 7
    .line 8
    .line 9
    aget-object v1, p3, v0

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 12
    .line 13
    .line 14
    aget-object v1, p4, v0

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentMatrix()Landroid/graphics/Matrix;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 25
    .line 26
    .line 27
    aget-object v1, p5, v0

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 30
    .line 31
    .line 32
    aget-object v1, p6, v0

    .line 33
    .line 34
    invoke-virtual {v1, p1}, Landroid/view/View;->setAnimationMatrix(Landroid/graphics/Matrix;)V

    .line 35
    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/anim/V;Landroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/V;->t()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x64

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static composeRecentsDesktopLaunchAnimator(Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/statemanager/d;LP1/h;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)Landroid/animation/AnimatorSet;
    .locals 10

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/quickstep/TaskViewUtils$8;

    .line 7
    .line 8
    invoke-direct {v1, p4, p5}, Lcom/android/quickstep/TaskViewUtils$8;-><init>(Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 12
    .line 13
    .line 14
    const/4 p5, 0x0

    .line 15
    invoke-static {p3, p4, p5}, Lu2/s;->m(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-static {p3, v1, p4, p5}, Lu2/s;->n(Landroid/window/TransitionInfo;ZLandroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p3, v1, p4, p5}, Lu2/s;->n(Landroid/window/TransitionInfo;ZLandroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    const/4 v5, 0x1

    .line 34
    move-object v1, p0

    .line 35
    move-object v6, p1

    .line 36
    move-object v8, p2

    .line 37
    move-object v9, p3

    .line 38
    invoke-static/range {v0 .. v9}, Lcom/android/quickstep/TaskViewUtils;->composeRecentsLaunchAnimator(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;ZLcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;LP1/h;Landroid/window/TransitionInfo;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method

.method public static composeRecentsLaunchAnimator(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;ZLcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;LP1/h;Landroid/window/TransitionInfo;)V
    .locals 14

    .line 1
    move-object/from16 v3, p2

    .line 2
    .line 3
    move-object/from16 v9, p6

    .line 4
    .line 5
    move-object/from16 v0, p7

    .line 6
    .line 7
    const/4 v10, 0x0

    .line 8
    const/4 v11, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "TaskViewUtils"

    .line 12
    .line 13
    const-string v0, "composeRecentsLaunchAnimator: recentsView is null, return!"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    xor-int/lit8 v2, p5, 0x1

    .line 20
    .line 21
    invoke-static {v0, p1, v3}, Lcom/android/quickstep/TaskViewUtils;->findTaskViewToLaunch(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;)Lcom/android/quickstep/views/TaskView;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v8, Lcom/android/launcher3/anim/V;

    .line 26
    .line 27
    const-wide/16 v12, 0x150

    .line 28
    .line 29
    invoke-direct {v8, v12, v13}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 30
    .line 31
    .line 32
    move-object/from16 v4, p3

    .line 33
    .line 34
    move-object/from16 v5, p4

    .line 35
    .line 36
    move-object/from16 v6, p8

    .line 37
    .line 38
    move-object/from16 v7, p9

    .line 39
    .line 40
    invoke-static/range {v0 .. v8}, Lcom/android/quickstep/TaskViewUtils;->createRecentsWindowAnimator(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Z[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;LP1/h;Landroid/window/TransitionInfo;Lcom/android/launcher3/anim/V;)V

    .line 41
    .line 42
    .line 43
    if-eqz p5, :cond_1

    .line 44
    .line 45
    new-instance v2, Lcom/android/quickstep/B5;

    .line 46
    .line 47
    invoke-direct {v2, v8}, Lcom/android/quickstep/B5;-><init>(Lcom/android/launcher3/anim/V;)V

    .line 48
    .line 49
    .line 50
    move-object/from16 v5, p4

    .line 51
    .line 52
    invoke-static {v5, v11, v2}, Lcom/android/quickstep/TaskViewUtils;->createSplitAuxiliarySurfacesAnimator([Landroid/view/RemoteAnimationTarget;ZLjava/util/function/Consumer;)Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    .line 55
    :cond_1
    if-eqz p5, :cond_4

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRecentsAnimationController()Lcom/android/quickstep/RecentsAnimationController;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    invoke-virtual {v2, v10}, Lcom/android/quickstep/RecentsAnimationController;->setWillFinishToHome(Z)V

    .line 64
    .line 65
    .line 66
    :cond_2
    instance-of v2, v1, Lcom/android/quickstep/views/GroupedTaskView;

    .line 67
    .line 68
    if-eqz v2, :cond_3

    .line 69
    .line 70
    move-object v2, v1

    .line 71
    check-cast v2, Lcom/android/quickstep/views/GroupedTaskView;

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/android/quickstep/views/GroupedTaskView;->ifTaskContainSplitActivity()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_3

    .line 78
    .line 79
    sget-object v1, Lcom/android/quickstep/views/RecentsView;->CONTENT_ALPHA:Landroid/util/FloatProperty;

    .line 80
    .line 81
    new-array v2, v11, [F

    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    aput v4, v2, v10

    .line 85
    .line 86
    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    goto :goto_0

    .line 91
    :cond_3
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->createAdjacentPageAnimForTaskLaunch(Lcom/android/quickstep/views/TaskView;)Landroid/animation/AnimatorSet;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    :goto_0
    sget-object v2, LJ0/h;->U:Landroid/view/animation/Interpolator;

    .line 96
    .line 97
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v12, v13}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    new-instance v2, Lcom/android/quickstep/TaskViewUtils$9;

    .line 104
    .line 105
    invoke-direct {v2, v0, v9, v3}, Lcom/android/quickstep/TaskViewUtils$9;-><init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/statemanager/d;[Landroid/view/RemoteAnimationTarget;)V

    .line 106
    .line 107
    .line 108
    const/4 v3, 0x0

    .line 109
    goto :goto_1

    .line 110
    :cond_4
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 111
    .line 112
    invoke-virtual {v9, v1, v12, v13}, Lcom/android/launcher3/statemanager/d;->n(Lcom/android/launcher3/statemanager/a;J)Lcom/android/launcher3/anim/q;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1, v12, v13}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    new-instance v2, Lcom/android/quickstep/TaskViewUtils$10;

    .line 132
    .line 133
    invoke-direct {v2, v0, v9}, Lcom/android/quickstep/TaskViewUtils$10;-><init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/statemanager/d;)V

    .line 134
    .line 135
    .line 136
    :goto_1
    invoke-virtual {v8, v1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 137
    .line 138
    .line 139
    sget-object v1, Lf1/a;->J:Lf1/a$a;

    .line 140
    .line 141
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_5

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    const/4 v4, -0x1

    .line 152
    if-eq v1, v4, :cond_5

    .line 153
    .line 154
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/f;

    .line 155
    .line 156
    invoke-direct {v1, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/f;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v8, v1}, Lcom/android/launcher3/anim/f;->h(Ljava/lang/Runnable;)V

    .line 160
    .line 161
    .line 162
    :cond_5
    invoke-virtual {v8}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 167
    .line 168
    .line 169
    new-array v0, v11, [Landroid/animation/Animator;

    .line 170
    .line 171
    aput-object v3, v0, v10

    .line 172
    .line 173
    invoke-virtual {v9, p0, v0}, Lcom/android/launcher3/statemanager/d;->d0(Landroid/animation/AnimatorSet;[Landroid/animation/Animator;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public static composeRecentsSplitLaunchAnimator(Lcom/android/quickstep/views/GroupedTaskView;Lcom/android/launcher3/statemanager/d;LP1/h;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V
    .locals 10

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/quickstep/TaskViewUtils$5;

    .line 7
    .line 8
    invoke-direct {v1, p5}, Lcom/android/quickstep/TaskViewUtils$5;-><init>(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 12
    .line 13
    .line 14
    const/4 p5, 0x0

    .line 15
    invoke-static {p3, p4, p5}, Lu2/s;->m(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-static {p3, v1, p4, p5}, Lu2/s;->n(Landroid/window/TransitionInfo;ZLandroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p3, v1, p4, p5}, Lu2/s;->n(Landroid/window/TransitionInfo;ZLandroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    const/4 v5, 0x1

    .line 34
    const/4 v9, 0x0

    .line 35
    move-object v1, p0

    .line 36
    move-object v6, p1

    .line 37
    move-object v8, p2

    .line 38
    invoke-static/range {v0 .. v9}, Lcom/android/quickstep/TaskViewUtils;->composeRecentsLaunchAnimator(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;ZLcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;LP1/h;Landroid/window/TransitionInfo;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p4}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static composeRecentsSplitLaunchAnimatorLegacy(Lcom/android/quickstep/views/GroupedTaskView;II[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/statemanager/d;LP1/h;Ljava/lang/Runnable;)V
    .locals 11
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    move-object/from16 v0, p8

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    new-instance p2, Lcom/android/quickstep/TaskViewUtils$6;

    .line 16
    .line 17
    invoke-direct {p2, v0}, Lcom/android/quickstep/TaskViewUtils$6;-><init>(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 21
    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    const/4 v9, 0x0

    .line 25
    move-object v1, p0

    .line 26
    move-object v0, p1

    .line 27
    move-object v2, p3

    .line 28
    move-object v3, p4

    .line 29
    move-object/from16 v4, p5

    .line 30
    .line 31
    move-object/from16 v6, p6

    .line 32
    .line 33
    move-object/from16 v8, p7

    .line 34
    .line 35
    invoke-static/range {v0 .. v9}, Lcom/android/quickstep/TaskViewUtils;->composeRecentsLaunchAnimator(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;ZLcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;LP1/h;Landroid/window/TransitionInfo;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    move-object/from16 v4, p5

    .line 43
    .line 44
    new-instance p0, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    new-instance v3, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    array-length v5, p3

    .line 55
    const/4 v6, 0x0

    .line 56
    move v7, v6

    .line 57
    :goto_0
    if-ge v7, v5, :cond_7

    .line 58
    .line 59
    aget-object v8, p3, v7

    .line 60
    .line 61
    iget-object v9, v8, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 62
    .line 63
    if-eqz v9, :cond_1

    .line 64
    .line 65
    iget v9, v9, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const/4 v9, -0x1

    .line 69
    :goto_1
    iget v10, v8, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 70
    .line 71
    iget-object v8, v8, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 72
    .line 73
    if-nez v8, :cond_2

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_2
    if-nez v10, :cond_3

    .line 77
    .line 78
    invoke-virtual {p0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_3
    if-eq v9, p1, :cond_5

    .line 83
    .line 84
    if-ne v9, p2, :cond_4

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_4
    if-ne v10, v1, :cond_6

    .line 88
    .line 89
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_5
    :goto_2
    new-instance v8, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string v9, "Expected task to be opening, but it is "

    .line 99
    .line 100
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v8

    .line 110
    const-string v9, "TaskViewUtils"

    .line 111
    .line 112
    invoke-static {v9, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    :cond_6
    :goto_3
    add-int/2addr v7, v1

    .line 116
    goto :goto_0

    .line 117
    :cond_7
    :goto_4
    array-length p1, v4

    .line 118
    if-ge v6, p1, :cond_9

    .line 119
    .line 120
    aget-object p1, v4, v6

    .line 121
    .line 122
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 123
    .line 124
    iget p1, p1, Landroid/view/RemoteAnimationTarget;->windowType:I

    .line 125
    .line 126
    const/16 v2, 0x7f2

    .line 127
    .line 128
    if-ne p1, v2, :cond_8

    .line 129
    .line 130
    if-eqz p2, :cond_8

    .line 131
    .line 132
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    :cond_8
    add-int/2addr v6, v1

    .line 136
    goto :goto_4

    .line 137
    :cond_9
    new-instance p1, Landroid/view/SurfaceControl$Transaction;

    .line 138
    .line 139
    invoke-direct {p1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 140
    .line 141
    .line 142
    const/4 p2, 0x2

    .line 143
    new-array p2, p2, [F

    .line 144
    .line 145
    fill-array-data p2, :array_0

    .line 146
    .line 147
    .line 148
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    const-wide/16 v1, 0x172

    .line 153
    .line 154
    invoke-virtual {p2, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 155
    .line 156
    .line 157
    new-instance v1, Lcom/android/quickstep/w5;

    .line 158
    .line 159
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/w5;-><init>(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 163
    .line 164
    .line 165
    new-instance v1, Lcom/android/quickstep/TaskViewUtils$7;

    .line 166
    .line 167
    invoke-direct {v1, p0, p1, v3, v0}, Lcom/android/quickstep/TaskViewUtils$7;-><init>(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;Ljava/util/ArrayList;Ljava/lang/Runnable;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p2, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->start()V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static createRecentsWindowAnimator(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Z[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;LP1/h;Landroid/window/TransitionInfo;Lcom/android/launcher3/anim/V;)V
    .locals 31
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            ":",
            "Lcom/android/launcher3/statemanager/i<",
            "*>;>(",
            "Lcom/android/quickstep/views/RecentsView<",
            "TT;*>;",
            "Lcom/android/quickstep/views/TaskView;",
            "Z[",
            "Landroid/view/RemoteAnimationTarget;",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            "LP1/h;",
            "Landroid/window/TransitionInfo;",
            "Lcom/android/launcher3/anim/V;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const/16 v16, 0x2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/16 v17, 0x1

    .line 9
    .line 10
    const-string v3, "TaskViewUtils"

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string v0, "createRecentsWindowAnimator, v is null"

    .line 15
    .line 16
    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isEndQuickSwitchCuj()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    invoke-virtual {v2, v1}, Lcom/android/quickstep/views/TaskView;->setEndQuickSwitchCuj(Z)V

    .line 25
    .line 26
    .line 27
    new-instance v5, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 28
    .line 29
    move-object/from16 v6, p3

    .line 30
    .line 31
    move-object/from16 v7, p4

    .line 32
    .line 33
    move-object/from16 v9, p5

    .line 34
    .line 35
    invoke-direct {v5, v6, v7, v9, v1}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v5}, Lcom/android/quickstep/RemoteAnimationTargets;->getNavBarRemoteAnimationTarget()Landroid/view/RemoteAnimationTarget;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    new-instance v7, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 43
    .line 44
    invoke-direct {v7, v2}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5, v7}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 51
    .line 52
    .line 53
    move-result-object v9

    .line 54
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 55
    .line 56
    .line 57
    move-result v10

    .line 58
    if-eqz v10, :cond_2

    .line 59
    .line 60
    if-eqz v9, :cond_2

    .line 61
    .line 62
    sget-object v10, Lf1/a;->J:Lf1/a$a;

    .line 63
    .line 64
    invoke-virtual {v10}, Lf1/a$a;->c()Z

    .line 65
    .line 66
    .line 67
    move-result v10

    .line 68
    if-eqz v10, :cond_2

    .line 69
    .line 70
    :cond_1
    :goto_0
    move-object v3, v9

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    instance-of v9, v2, Lcom/android/quickstep/views/DesktopTaskView;

    .line 73
    .line 74
    new-instance v10, Lcom/android/quickstep/RemoteTargetGluer;

    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v11

    .line 80
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSizeStrategy()Lcom/android/quickstep/BaseContainerInterface;

    .line 81
    .line 82
    .line 83
    move-result-object v12

    .line 84
    invoke-direct {v10, v11, v12, v5, v9}, Lcom/android/quickstep/RemoteTargetGluer;-><init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;Lcom/android/quickstep/RemoteAnimationTargets;Z)V

    .line 85
    .line 86
    .line 87
    if-eqz v9, :cond_3

    .line 88
    .line 89
    move-object/from16 v9, p7

    .line 90
    .line 91
    invoke-virtual {v10, v5, v9}, Lcom/android/quickstep/RemoteTargetGluer;->assignTargetsForDesktop(Lcom/android/quickstep/RemoteAnimationTargets;Landroid/window/TransitionInfo;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    const-string v10, "createRecentsWindowAnimator  taskView contains MultipleTasks !!"

    .line 96
    .line 97
    invoke-static {v3, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_1

    .line 105
    .line 106
    move-object v3, v2

    .line 107
    check-cast v3, Lcom/android/quickstep/views/DesktopTaskView;

    .line 108
    .line 109
    invoke-virtual {v3, v9}, Lcom/android/quickstep/views/DesktopTaskView;->setRemoteTargetHandles([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->containsMultipleTasks()Z

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    if-eqz v3, :cond_4

    .line 118
    .line 119
    move-object v3, v2

    .line 120
    check-cast v3, Lcom/android/quickstep/views/GroupedTaskView;

    .line 121
    .line 122
    invoke-virtual {v3}, Lcom/android/quickstep/views/GroupedTaskView;->getSplitBoundsConfig()Lcom/android/launcher3/util/y2$a;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v10, v5, v3}, Lcom/android/quickstep/RemoteTargetGluer;->assignTargetsForSplitScreen(Lcom/android/quickstep/RemoteAnimationTargets;Lcom/android/launcher3/util/y2$a;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    goto :goto_0

    .line 131
    :cond_4
    invoke-virtual {v10, v5}, Lcom/android/quickstep/RemoteTargetGluer;->assignTargets(Lcom/android/quickstep/RemoteAnimationTargets;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    goto :goto_0

    .line 136
    :goto_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 137
    .line 138
    .line 139
    move-result-object v9

    .line 140
    invoke-virtual {v9}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 141
    .line 142
    .line 143
    move-result v9

    .line 144
    array-length v10, v3

    .line 145
    move v11, v1

    .line 146
    :goto_2
    if-ge v11, v10, :cond_5

    .line 147
    .line 148
    aget-object v12, v3, v11

    .line 149
    .line 150
    invoke-virtual {v12}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 151
    .line 152
    .line 153
    move-result-object v13

    .line 154
    invoke-virtual {v13}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 155
    .line 156
    .line 157
    move-result-object v13

    .line 158
    invoke-virtual {v13, v9}, Lcom/android/quickstep/util/RecentsOrientedState;->setRecentsRotation(I)Z

    .line 159
    .line 160
    .line 161
    invoke-virtual {v12}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 162
    .line 163
    .line 164
    move-result-object v12

    .line 165
    invoke-virtual {v12, v7}, Lcom/android/quickstep/util/TransformParams;->setSyncTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)Lcom/android/quickstep/util/TransformParams;

    .line 166
    .line 167
    .line 168
    add-int/lit8 v11, v11, 0x1

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_5
    invoke-virtual/range {p0 .. p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 172
    .line 173
    .line 174
    move-result v9

    .line 175
    move-object/from16 v18, v5

    .line 176
    .line 177
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    move-object/from16 v19, v6

    .line 182
    .line 183
    invoke-static {v5}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    move-object v10, v6

    .line 188
    check-cast v10, Lcom/android/launcher3/views/k;

    .line 189
    .line 190
    invoke-interface {v10}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 191
    .line 192
    .line 193
    move-result-object v10

    .line 194
    invoke-virtual {v10}, Lcom/android/launcher3/X3;->b()Z

    .line 195
    .line 196
    .line 197
    move-result v11

    .line 198
    if-nez v11, :cond_6

    .line 199
    .line 200
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 201
    .line 202
    .line 203
    move-result v12

    .line 204
    if-eq v9, v12, :cond_6

    .line 205
    .line 206
    move/from16 v20, v17

    .line 207
    .line 208
    goto :goto_3

    .line 209
    :cond_6
    move/from16 v20, v1

    .line 210
    .line 211
    :goto_3
    invoke-virtual {v0, v9}, Lcom/android/quickstep/views/RecentsView;->getScrollOffset(I)I

    .line 212
    .line 213
    .line 214
    move-result v9

    .line 215
    if-eqz v11, :cond_7

    .line 216
    .line 217
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getGridTranslationSecondary()F

    .line 218
    .line 219
    .line 220
    move-result v12

    .line 221
    float-to-int v12, v12

    .line 222
    goto :goto_4

    .line 223
    :cond_7
    move v12, v1

    .line 224
    :goto_4
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 225
    .line 226
    .line 227
    move-result v13

    .line 228
    const/16 v21, 0x3

    .line 229
    .line 230
    move/from16 p3, v13

    .line 231
    .line 232
    if-eqz p3, :cond_9

    .line 233
    .line 234
    sget-object v22, Lf1/a;->J:Lf1/a$a;

    .line 235
    .line 236
    invoke-virtual/range {v22 .. v22}, Lf1/a$a;->c()Z

    .line 237
    .line 238
    .line 239
    move-result v22

    .line 240
    if-nez v22, :cond_8

    .line 241
    .line 242
    goto :goto_5

    .line 243
    :cond_8
    move-object/from16 v9, p8

    .line 244
    .line 245
    move v15, v11

    .line 246
    const/4 v8, 0x0

    .line 247
    goto/16 :goto_8

    .line 248
    .line 249
    :cond_9
    :goto_5
    array-length v1, v3

    .line 250
    const/4 v14, 0x0

    .line 251
    :goto_6
    if-ge v14, v1, :cond_8

    .line 252
    .line 253
    aget-object v23, v3, v14

    .line 254
    .line 255
    invoke-virtual/range {v23 .. v23}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 256
    .line 257
    .line 258
    move-result-object v15

    .line 259
    invoke-virtual {v15, v10}, Lcom/android/quickstep/util/TaskViewSimulator;->setDp(Lcom/android/launcher3/h0;)V

    .line 260
    .line 261
    .line 262
    sget-object v13, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 263
    .line 264
    invoke-virtual {v13, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v13

    .line 268
    check-cast v13, Lcom/android/launcher3/util/Z;

    .line 269
    .line 270
    invoke-virtual {v13}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 271
    .line 272
    .line 273
    move-result-object v13

    .line 274
    iget v13, v13, Lcom/android/launcher3/util/Z$c;->b:I

    .line 275
    .line 276
    move/from16 p7, v1

    .line 277
    .line 278
    invoke-virtual {v15}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    invoke-virtual {v1, v13, v13}, Lcom/android/quickstep/util/RecentsOrientedState;->update(II)Z

    .line 283
    .line 284
    .line 285
    iget-object v1, v15, Lcom/android/quickstep/util/TaskViewSimulator;->fullScreenProgress:Lcom/android/launcher3/anim/d;

    .line 286
    .line 287
    const/4 v13, 0x0

    .line 288
    iput v13, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 289
    .line 290
    iget-object v1, v15, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    .line 291
    .line 292
    const/high16 v13, 0x3f800000    # 1.0f

    .line 293
    .line 294
    iput v13, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 295
    .line 296
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    if-nez v1, :cond_a

    .line 301
    .line 302
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    invoke-virtual {v15, v1}, Lcom/android/quickstep/util/TaskViewSimulator;->setIsGridTask(Z)V

    .line 307
    .line 308
    .line 309
    :cond_a
    if-eqz v11, :cond_b

    .line 310
    .line 311
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-virtual {v15, v1}, Lcom/android/quickstep/util/TaskViewSimulator;->setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 316
    .line 317
    .line 318
    :cond_b
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    new-instance v13, Lcom/android/quickstep/y5;

    .line 323
    .line 324
    invoke-direct {v13}, Lcom/android/quickstep/y5;-><init>()V

    .line 325
    .line 326
    .line 327
    invoke-interface {v1, v15, v13, v9, v12}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->set(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;II)V

    .line 328
    .line 329
    .line 330
    instance-of v1, v2, Lcom/android/quickstep/views/DesktopTaskView;

    .line 331
    .line 332
    if-eqz v1, :cond_c

    .line 333
    .line 334
    invoke-virtual/range {v23 .. v23}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    const/high16 v13, 0x3f800000    # 1.0f

    .line 339
    .line 340
    invoke-virtual {v1, v13}, Lcom/android/quickstep/util/TransformParams;->setTargetAlpha(F)Lcom/android/quickstep/util/TransformParams;

    .line 341
    .line 342
    .line 343
    move v2, v9

    .line 344
    move-object v1, v10

    .line 345
    move v15, v11

    .line 346
    move/from16 v24, v12

    .line 347
    .line 348
    move/from16 v23, v14

    .line 349
    .line 350
    const/4 v8, 0x0

    .line 351
    move-object/from16 v9, p8

    .line 352
    .line 353
    goto :goto_7

    .line 354
    :cond_c
    invoke-virtual/range {v23 .. v23}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    move v13, v11

    .line 359
    sget-object v11, Lcom/android/quickstep/util/TransformParams;->TARGET_ALPHA:Landroid/util/FloatProperty;

    .line 360
    .line 361
    sget-object v15, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 362
    .line 363
    move-object/from16 v23, v1

    .line 364
    .line 365
    const v1, 0x3e4ccccd    # 0.2f

    .line 366
    .line 367
    .line 368
    const/4 v2, 0x0

    .line 369
    invoke-static {v15, v2, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 370
    .line 371
    .line 372
    move-result-object v15

    .line 373
    move/from16 v24, v12

    .line 374
    .line 375
    const/4 v12, 0x0

    .line 376
    move/from16 v25, v13

    .line 377
    .line 378
    const/high16 v13, 0x3f800000    # 1.0f

    .line 379
    .line 380
    move v8, v2

    .line 381
    move v2, v9

    .line 382
    move-object v1, v10

    .line 383
    move-object/from16 v10, v23

    .line 384
    .line 385
    move-object/from16 v9, p8

    .line 386
    .line 387
    move/from16 v23, v14

    .line 388
    .line 389
    move-object v14, v15

    .line 390
    move/from16 v15, v25

    .line 391
    .line 392
    invoke-virtual/range {v9 .. v14}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 393
    .line 394
    .line 395
    :goto_7
    add-int/lit8 v14, v23, 0x1

    .line 396
    .line 397
    move-object v10, v1

    .line 398
    move v9, v2

    .line 399
    move v11, v15

    .line 400
    move/from16 v12, v24

    .line 401
    .line 402
    move-object/from16 v2, p1

    .line 403
    .line 404
    move/from16 v1, p7

    .line 405
    .line 406
    goto/16 :goto_6

    .line 407
    .line 408
    :goto_8
    array-length v10, v3

    .line 409
    const/4 v1, 0x0

    .line 410
    move-object v11, v1

    .line 411
    const/4 v12, 0x0

    .line 412
    :goto_9
    if-ge v12, v10, :cond_f

    .line 413
    .line 414
    aget-object v1, v3, v12

    .line 415
    .line 416
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    iget-object v2, v1, Lcom/android/quickstep/util/TaskViewSimulator;->fullScreenProgress:Lcom/android/launcher3/anim/d;

    .line 421
    .line 422
    sget-object v11, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 423
    .line 424
    sget-object v13, LJ0/h;->U:Landroid/view/animation/Interpolator;

    .line 425
    .line 426
    const/high16 v14, 0x3f800000    # 1.0f

    .line 427
    .line 428
    invoke-virtual {v9, v2, v11, v14, v13}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 429
    .line 430
    .line 431
    iget-object v2, v1, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    .line 432
    .line 433
    invoke-virtual {v1}, Lcom/android/quickstep/util/TaskViewSimulator;->getFullScreenScale()F

    .line 434
    .line 435
    .line 436
    move-result v14

    .line 437
    invoke-virtual {v9, v2, v11, v14, v13}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 438
    .line 439
    .line 440
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 441
    .line 442
    .line 443
    move-result v2

    .line 444
    if-nez v2, :cond_d

    .line 445
    .line 446
    iget-object v2, v1, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 447
    .line 448
    invoke-virtual {v9, v2, v11, v8, v13}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 449
    .line 450
    .line 451
    :cond_d
    move-object v2, v3

    .line 452
    move-object v3, v7

    .line 453
    move-object v7, v1

    .line 454
    new-instance v1, Lcom/android/quickstep/TaskViewUtils$1;

    .line 455
    .line 456
    move-object v14, v2

    .line 457
    move v11, v4

    .line 458
    move-object/from16 v2, v18

    .line 459
    .line 460
    move-object/from16 v13, v19

    .line 461
    .line 462
    const/16 v22, 0x0

    .line 463
    .line 464
    move-object/from16 v4, p1

    .line 465
    .line 466
    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/TaskViewUtils$1;-><init>(Lcom/android/quickstep/RemoteAnimationTargets;Lcom/android/quickstep/util/SurfaceTransactionApplier;Lcom/android/quickstep/views/TaskView;Landroid/content/Context;Landroid/content/Context;Lcom/android/quickstep/util/TaskViewSimulator;)V

    .line 467
    .line 468
    .line 469
    move-object v7, v2

    .line 470
    invoke-virtual {v9, v1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 471
    .line 472
    .line 473
    new-instance v1, Lcom/android/quickstep/z5;

    .line 474
    .line 475
    invoke-direct {v1, v14, v15}, Lcom/android/quickstep/z5;-><init>([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;Z)V

    .line 476
    .line 477
    .line 478
    invoke-virtual {v9, v1}, Lcom/android/launcher3/anim/f;->h(Ljava/lang/Runnable;)V

    .line 479
    .line 480
    .line 481
    if-eqz v13, :cond_e

    .line 482
    .line 483
    new-instance v1, Landroid/graphics/Rect;

    .line 484
    .line 485
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 486
    .line 487
    .line 488
    new-instance v2, Lcom/android/quickstep/TaskViewUtils$2;

    .line 489
    .line 490
    invoke-direct {v2, v9, v14, v13, v1}, Lcom/android/quickstep/TaskViewUtils$2;-><init>(Lcom/android/launcher3/anim/V;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;Landroid/view/RemoteAnimationTarget;Landroid/graphics/Rect;)V

    .line 491
    .line 492
    .line 493
    invoke-virtual {v9, v2}, Lcom/android/launcher3/anim/f;->i(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 494
    .line 495
    .line 496
    :cond_e
    add-int/lit8 v12, v12, 0x1

    .line 497
    .line 498
    move-object/from16 v18, v7

    .line 499
    .line 500
    move v4, v11

    .line 501
    move-object/from16 v19, v13

    .line 502
    .line 503
    move-object v11, v14

    .line 504
    move-object v7, v3

    .line 505
    move-object v3, v11

    .line 506
    goto :goto_9

    .line 507
    :cond_f
    move-object v14, v3

    .line 508
    move v12, v4

    .line 509
    move-object/from16 v7, v18

    .line 510
    .line 511
    const/16 v22, 0x0

    .line 512
    .line 513
    if-nez p2, :cond_13

    .line 514
    .line 515
    if-eqz v20, :cond_13

    .line 516
    .line 517
    if-eqz v11, :cond_13

    .line 518
    .line 519
    array-length v1, v11

    .line 520
    if-lez v1, :cond_13

    .line 521
    .line 522
    sget-object v3, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 523
    .line 524
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 525
    .line 526
    const v2, 0x3ecccccd    # 0.4f

    .line 527
    .line 528
    .line 529
    const v4, 0x3e4ccccd    # 0.2f

    .line 530
    .line 531
    .line 532
    invoke-static {v1, v4, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 533
    .line 534
    .line 535
    move-result-object v1

    .line 536
    const/high16 v4, 0x3f800000    # 1.0f

    .line 537
    .line 538
    const/4 v5, 0x0

    .line 539
    move-object v2, v6

    .line 540
    move-object v6, v1

    .line 541
    move-object v1, v9

    .line 542
    move-object v9, v2

    .line 543
    move-object/from16 v2, p1

    .line 544
    .line 545
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 546
    .line 547
    .line 548
    array-length v1, v11

    .line 549
    move/from16 v2, v22

    .line 550
    .line 551
    :goto_a
    if-ge v2, v1, :cond_10

    .line 552
    .line 553
    aget-object v3, v11, v2

    .line 554
    .line 555
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 556
    .line 557
    .line 558
    move-result-object v4

    .line 559
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 560
    .line 561
    .line 562
    move-result-object v3

    .line 563
    xor-int/lit8 v5, v15, 0x1

    .line 564
    .line 565
    invoke-virtual {v4, v3, v5}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;Z)V

    .line 566
    .line 567
    .line 568
    add-int/lit8 v2, v2, 0x1

    .line 569
    .line 570
    goto :goto_a

    .line 571
    :cond_10
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/views/TaskView;->getSnapshotViews()[Landroid/view/View;

    .line 572
    .line 573
    .line 574
    move-result-object v10

    .line 575
    array-length v1, v11

    .line 576
    array-length v2, v10

    .line 577
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 578
    .line 579
    .line 580
    move-result v13

    .line 581
    new-array v15, v13, [Landroid/graphics/Matrix;

    .line 582
    .line 583
    new-array v1, v13, [Landroid/graphics/Matrix;

    .line 584
    .line 585
    move/from16 v2, v22

    .line 586
    .line 587
    :goto_b
    if-ge v2, v13, :cond_11

    .line 588
    .line 589
    move v3, v2

    .line 590
    aget-object v2, v10, v3

    .line 591
    .line 592
    new-instance v4, Landroid/graphics/RectF;

    .line 593
    .line 594
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 595
    .line 596
    .line 597
    move-result v5

    .line 598
    int-to-float v5, v5

    .line 599
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 600
    .line 601
    .line 602
    move-result v6

    .line 603
    int-to-float v6, v6

    .line 604
    invoke-direct {v4, v8, v8, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 605
    .line 606
    .line 607
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 608
    .line 609
    .line 610
    move-result v5

    .line 611
    int-to-float v5, v5

    .line 612
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 613
    .line 614
    .line 615
    move-result v6

    .line 616
    int-to-float v6, v6

    .line 617
    move/from16 p5, v8

    .line 618
    .line 619
    const/4 v8, 0x4

    .line 620
    new-array v8, v8, [F

    .line 621
    .line 622
    aput p5, v8, v22

    .line 623
    .line 624
    aput p5, v8, v17

    .line 625
    .line 626
    aput v5, v8, v16

    .line 627
    .line 628
    aput v6, v8, v21

    .line 629
    .line 630
    invoke-virtual {v2}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 631
    .line 632
    .line 633
    move-result-object v5

    .line 634
    move/from16 v6, v22

    .line 635
    .line 636
    invoke-static {v2, v5, v8, v6}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 637
    .line 638
    .line 639
    new-instance v5, Landroid/graphics/RectF;

    .line 640
    .line 641
    aget v6, v8, v22

    .line 642
    .line 643
    move-object/from16 v29, v1

    .line 644
    .line 645
    aget v1, v8, v17

    .line 646
    .line 647
    move-object/from16 p1, v2

    .line 648
    .line 649
    aget v2, v8, v16

    .line 650
    .line 651
    aget v8, v8, v21

    .line 652
    .line 653
    invoke-direct {v5, v6, v1, v2, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 654
    .line 655
    .line 656
    new-instance v1, Landroid/graphics/Matrix;

    .line 657
    .line 658
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 659
    .line 660
    .line 661
    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 662
    .line 663
    invoke-virtual {v1, v4, v5, v2}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 664
    .line 665
    .line 666
    aput-object v1, v15, v3

    .line 667
    .line 668
    new-instance v2, Landroid/graphics/Matrix;

    .line 669
    .line 670
    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 671
    .line 672
    .line 673
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 674
    .line 675
    .line 676
    aput-object v2, v29, v3

    .line 677
    .line 678
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTranslationY()F

    .line 679
    .line 680
    .line 681
    move-result v4

    .line 682
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTranslationX()F

    .line 683
    .line 684
    .line 685
    move-result v8

    .line 686
    aget-object v1, v11, v3

    .line 687
    .line 688
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 689
    .line 690
    .line 691
    move-result-object v1

    .line 692
    invoke-virtual {v1}, Lcom/android/quickstep/util/TaskViewSimulator;->getFullScreenScale()F

    .line 693
    .line 694
    .line 695
    move-result v18

    .line 696
    move v1, v3

    .line 697
    sget-object v3, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 698
    .line 699
    div-float v5, v4, v18

    .line 700
    .line 701
    sget-object v6, LJ0/h;->U:Landroid/view/animation/Interpolator;

    .line 702
    .line 703
    move-object/from16 v2, p1

    .line 704
    .line 705
    move/from16 v19, v22

    .line 706
    .line 707
    move/from16 v22, v1

    .line 708
    .line 709
    move-object/from16 v1, p8

    .line 710
    .line 711
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 712
    .line 713
    .line 714
    sget-object v3, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 715
    .line 716
    div-float v5, v8, v18

    .line 717
    .line 718
    move v4, v8

    .line 719
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 720
    .line 721
    .line 722
    add-int/lit8 v2, v22, 0x1

    .line 723
    .line 724
    move/from16 v8, p5

    .line 725
    .line 726
    move/from16 v22, v19

    .line 727
    .line 728
    move-object/from16 v1, v29

    .line 729
    .line 730
    goto/16 :goto_b

    .line 731
    .line 732
    :cond_11
    move-object/from16 v29, v1

    .line 733
    .line 734
    move/from16 v19, v22

    .line 735
    .line 736
    move-object/from16 v1, p8

    .line 737
    .line 738
    new-array v2, v13, [Landroid/graphics/Matrix;

    .line 739
    .line 740
    move/from16 v3, v19

    .line 741
    .line 742
    :goto_c
    if-ge v3, v13, :cond_12

    .line 743
    .line 744
    new-instance v4, Landroid/graphics/Matrix;

    .line 745
    .line 746
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 747
    .line 748
    .line 749
    aput-object v4, v2, v3

    .line 750
    .line 751
    aget-object v4, v11, v3

    .line 752
    .line 753
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 754
    .line 755
    .line 756
    move-result-object v4

    .line 757
    invoke-virtual {v4}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentMatrix()Landroid/graphics/Matrix;

    .line 758
    .line 759
    .line 760
    move-result-object v4

    .line 761
    aget-object v5, v2, v3

    .line 762
    .line 763
    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 764
    .line 765
    .line 766
    add-int/lit8 v3, v3, 0x1

    .line 767
    .line 768
    goto :goto_c

    .line 769
    :cond_12
    new-instance v25, Landroid/graphics/Matrix;

    .line 770
    .line 771
    invoke-direct/range {v25 .. v25}, Landroid/graphics/Matrix;-><init>()V

    .line 772
    .line 773
    .line 774
    new-instance v23, Lcom/android/quickstep/A5;

    .line 775
    .line 776
    move-object/from16 v27, v2

    .line 777
    .line 778
    move-object/from16 v30, v10

    .line 779
    .line 780
    move-object/from16 v28, v11

    .line 781
    .line 782
    move/from16 v24, v13

    .line 783
    .line 784
    move-object/from16 v26, v15

    .line 785
    .line 786
    invoke-direct/range {v23 .. v30}, Lcom/android/quickstep/A5;-><init>(ILandroid/graphics/Matrix;[Landroid/graphics/Matrix;[Landroid/graphics/Matrix;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;[Landroid/graphics/Matrix;[Landroid/view/View;)V

    .line 787
    .line 788
    .line 789
    move-object/from16 v3, v23

    .line 790
    .line 791
    move-object/from16 v2, v30

    .line 792
    .line 793
    invoke-virtual {v1, v3}, Lcom/android/launcher3/anim/f;->h(Ljava/lang/Runnable;)V

    .line 794
    .line 795
    .line 796
    new-instance v3, Lcom/android/quickstep/TaskViewUtils$3;

    .line 797
    .line 798
    invoke-direct {v3, v2}, Lcom/android/quickstep/TaskViewUtils$3;-><init>([Landroid/view/View;)V

    .line 799
    .line 800
    .line 801
    invoke-virtual {v1, v3}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 802
    .line 803
    .line 804
    goto :goto_d

    .line 805
    :cond_13
    move-object v1, v9

    .line 806
    move-object v9, v6

    .line 807
    :goto_d
    new-instance v2, Lcom/android/quickstep/TaskViewUtils$4;

    .line 808
    .line 809
    invoke-direct {v2, v0, v14, v12, v7}, Lcom/android/quickstep/TaskViewUtils$4;-><init>(Lcom/android/quickstep/views/RecentsView;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;ZLcom/android/quickstep/RemoteAnimationTargets;)V

    .line 810
    .line 811
    .line 812
    invoke-virtual {v1, v2}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 813
    .line 814
    .line 815
    if-eqz p6, :cond_14

    .line 816
    .line 817
    move-object/from16 v8, p6

    .line 818
    .line 819
    iget-object v0, v8, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 820
    .line 821
    sget-object v2, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 822
    .line 823
    sget-object v3, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 824
    .line 825
    invoke-virtual {v3, v9}, Lcom/android/launcher3/V3;->e(Landroid/content/Context;)F

    .line 826
    .line 827
    .line 828
    move-result v3

    .line 829
    sget-object v4, LJ0/h;->U:Landroid/view/animation/Interpolator;

    .line 830
    .line 831
    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 832
    .line 833
    .line 834
    :cond_14
    return-void
.end method

.method public static createSplitAuxiliarySurfacesAnimator([Landroid/view/RemoteAnimationTarget;ZLjava/util/function/Consumer;)Landroid/animation/ValueAnimator;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/view/RemoteAnimationTarget;",
            "Z",
            "Ljava/util/function/Consumer<",
            "Landroid/animation/ValueAnimator;",
            ">;)",
            "Landroid/animation/ValueAnimator;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_7

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    array-length v2, p0

    .line 14
    const/4 v3, 0x0

    .line 15
    :goto_0
    if-ge v3, v2, :cond_3

    .line 16
    .line 17
    aget-object v4, p0, v3

    .line 18
    .line 19
    iget-object v5, v4, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 20
    .line 21
    iget v4, v4, Landroid/view/RemoteAnimationTarget;->windowType:I

    .line 22
    .line 23
    const/16 v6, 0x7f2

    .line 24
    .line 25
    if-eq v4, v6, :cond_1

    .line 26
    .line 27
    const/16 v6, 0xbb8

    .line 28
    .line 29
    if-ne v4, v6, :cond_2

    .line 30
    .line 31
    :cond_1
    if-eqz v5, :cond_2

    .line 32
    .line 33
    invoke-virtual {v5}, Landroid/view/SurfaceControl;->isValid()Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_2

    .line 38
    .line 39
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    return-object v0

    .line 52
    :cond_4
    new-instance p0, Landroid/view/SurfaceControl$Transaction;

    .line 53
    .line 54
    invoke-direct {p0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 55
    .line 56
    .line 57
    if-nez p2, :cond_6

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_5

    .line 68
    .line 69
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Landroid/view/SurfaceControl;

    .line 74
    .line 75
    invoke-virtual {p0, v1, p1}, Landroid/view/SurfaceControl$Transaction;->setVisibility(Landroid/view/SurfaceControl;Z)Landroid/view/SurfaceControl$Transaction;

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_5
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->close()V

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    :cond_6
    const/4 v0, 0x2

    .line 87
    new-array v0, v0, [F

    .line 88
    .line 89
    fill-array-data v0, :array_0

    .line 90
    .line 91
    .line 92
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v2, Lcom/android/quickstep/x5;

    .line 97
    .line 98
    invoke-direct {v2, v1, p0, p1}, Lcom/android/quickstep/x5;-><init>(Ljava/util/List;Landroid/view/SurfaceControl$Transaction;Z)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 102
    .line 103
    .line 104
    new-instance v2, Lcom/android/quickstep/TaskViewUtils$11;

    .line 105
    .line 106
    invoke-direct {v2, p1, v1, p0}, Lcom/android/quickstep/TaskViewUtils$11;-><init>(ZLjava/util/List;Landroid/view/SurfaceControl$Transaction;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 110
    .line 111
    .line 112
    const-wide/16 p0, 0x64

    .line 113
    .line 114
    invoke-virtual {v0, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 115
    .line 116
    .line 117
    invoke-interface {p2, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    :cond_7
    :goto_2
    return-object v0

    .line 121
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic d([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;Z)V
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_0

    .line 4
    .line 5
    aget-object v2, p0, v1

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    xor-int/lit8 v4, p1, 0x1

    .line 16
    .line 17
    invoke-virtual {v3, v2, v4}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;Z)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic e(Ljava/util/List;Landroid/view/SurfaceControl$Transaction;ZLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/SurfaceControl;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    move v1, p3

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    .line 34
    .line 35
    sub-float/2addr v1, p3

    .line 36
    :goto_1
    invoke-virtual {p1, v0, v1}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static extractTargetsAndStates([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;JLandroid/graphics/PointF;)Landroid/util/Pair;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;",
            "J",
            "Landroid/graphics/PointF;",
            ")",
            "Landroid/util/Pair<",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            "[",
            "Landroid/window/WindowAnimationState;",
            ">;"
        }
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    new-array v0, v0, [Landroid/view/RemoteAnimationTarget;

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    new-array v1, v1, [Landroid/window/WindowAnimationState;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    array-length v3, p0

    .line 9
    if-ge v2, v3, :cond_0

    .line 10
    .line 11
    aget-object v3, p0, v2

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-object v3, v3, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 22
    .line 23
    aget-object v3, v3, v2

    .line 24
    .line 25
    aput-object v3, v0, v2

    .line 26
    .line 27
    aget-object v3, p0, v2

    .line 28
    .line 29
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentRect()Landroid/graphics/RectF;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v3}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCornerRadius()F

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    new-instance v5, Landroid/window/WindowAnimationState;

    .line 42
    .line 43
    invoke-direct {v5}, Landroid/window/WindowAnimationState;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-wide p1, v5, Landroid/window/WindowAnimationState;->timestamp:J

    .line 47
    .line 48
    new-instance v6, Landroid/graphics/RectF;

    .line 49
    .line 50
    iget v7, v4, Landroid/graphics/RectF;->left:F

    .line 51
    .line 52
    iget v8, v4, Landroid/graphics/RectF;->top:F

    .line 53
    .line 54
    iget v9, v4, Landroid/graphics/RectF;->right:F

    .line 55
    .line 56
    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    .line 57
    .line 58
    invoke-direct {v6, v7, v8, v9, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 59
    .line 60
    .line 61
    iput-object v6, v5, Landroid/window/WindowAnimationState;->bounds:Landroid/graphics/RectF;

    .line 62
    .line 63
    iput v3, v5, Landroid/window/WindowAnimationState;->topLeftRadius:F

    .line 64
    .line 65
    iput v3, v5, Landroid/window/WindowAnimationState;->topRightRadius:F

    .line 66
    .line 67
    iput v3, v5, Landroid/window/WindowAnimationState;->bottomRightRadius:F

    .line 68
    .line 69
    iput v3, v5, Landroid/window/WindowAnimationState;->bottomLeftRadius:F

    .line 70
    .line 71
    iput-object p3, v5, Landroid/window/WindowAnimationState;->velocityPxPerMs:Landroid/graphics/PointF;

    .line 72
    .line 73
    aput-object v5, v1, v2

    .line 74
    .line 75
    add-int/lit8 v2, v2, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    new-instance p0, Landroid/util/Pair;

    .line 79
    .line 80
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-object p0
.end method

.method static bridge synthetic f()Landroid/graphics/Rect;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TaskViewUtils;->TEMP_FULLSCREEN_BOUNDS:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object v0
.end method

.method public static findTaskViewToLaunch(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;)Lcom/android/quickstep/views/TaskView;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;",
            "Landroid/view/View;",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            ")",
            "Lcom/android/quickstep/views/TaskView;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    const-string p0, "TaskViewUtils"

    .line 5
    .line 6
    const-string p1, "findTaskViewToLaunch, recentsView is null!"

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    instance-of v1, p1, Lcom/android/quickstep/views/TaskView;

    .line 13
    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->isTaskViewVisible(Lcom/android/quickstep/views/TaskView;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_1
    return-object v0

    .line 26
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    instance-of v1, v1, Lcom/android/launcher3/model/data/y;

    .line 31
    .line 32
    if-eqz v1, :cond_4

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz v1, :cond_4

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_4

    .line 65
    .line 66
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Lcom/android/quickstep/views/TaskView;

    .line 71
    .line 72
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    if-eqz v4, :cond_3

    .line 77
    .line 78
    invoke-virtual {p0, v3}, Lcom/android/quickstep/views/RecentsView;->isTaskViewVisible(Lcom/android/quickstep/views/TaskView;)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v5, :cond_3

    .line 83
    .line 84
    iget-object v4, v4, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 85
    .line 86
    invoke-virtual {v4}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v1, v5}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-eqz v5, :cond_3

    .line 95
    .line 96
    iget v4, v4, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 97
    .line 98
    if-ne p1, v4, :cond_3

    .line 99
    .line 100
    return-object v3

    .line 101
    :cond_4
    if-nez p2, :cond_5

    .line 102
    .line 103
    return-object v0

    .line 104
    :cond_5
    array-length p1, p2

    .line 105
    const/4 v1, 0x0

    .line 106
    :goto_0
    const/4 v2, -0x1

    .line 107
    if-ge v1, p1, :cond_7

    .line 108
    .line 109
    aget-object v3, p2, v1

    .line 110
    .line 111
    iget v4, v3, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 112
    .line 113
    if-nez v4, :cond_6

    .line 114
    .line 115
    iget p1, v3, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_7
    move p1, v2

    .line 122
    :goto_1
    if-ne p1, v2, :cond_8

    .line 123
    .line 124
    return-object v0

    .line 125
    :cond_8
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    if-eqz p1, :cond_a

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->isTaskViewVisible(Lcom/android/quickstep/views/TaskView;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-nez p0, :cond_9

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_9
    return-object p1

    .line 139
    :cond_a
    :goto_2
    return-object v0
.end method

.method static bridge synthetic g()Landroid/graphics/PointF;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TaskViewUtils;->TEMP_PIVOT:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic h()Landroid/graphics/PointF;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TaskViewUtils;->TEMP_TASK_DIMENSION:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic i()Landroid/graphics/Rect;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TaskViewUtils;->TEMP_THUMBNAIL_BOUNDS:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object v0
.end method
