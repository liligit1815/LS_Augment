.class public abstract Lcom/android/quickstep/SwipeUpAnimationLogic;
.super Ljava/lang/Object;
.source "SwipeUpAnimationLogic.java"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;,
        Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;,
        Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;
    }
.end annotation


# static fields
.field public static final MAX_PROGRESS_FACTOR_FOR_PAUSED_GESTURE:F = 0.4f

.field private static final TAG:Ljava/lang/String; = "SwipeUpAnimationLogic"

.field protected static final TEMP_RECT:Landroid/graphics/Rect;


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected mCurrentDisplacement:F

.field protected final mCurrentShift:Lcom/android/launcher3/anim/d;

.field protected mDp:Lcom/android/launcher3/h0;

.field protected mDragLengthFactor:F

.field public mDragLengthMaxRecentsFactor:F

.field protected final mGestureState:Lcom/android/quickstep/GestureState;

.field public mHomeAnimTargetViewType:I

.field protected mIsSwipeForSplit:Z

.field protected mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

.field protected final mTargetGluer:Lcom/android/quickstep/RemoteTargetGluer;

.field protected mTransitionDragLength:I


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
    sput-object v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->TEMP_RECT:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/GestureState;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/quickstep/F4;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/quickstep/F4;-><init>(Lcom/android/quickstep/SwipeUpAnimationLogic;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mHomeAnimTargetViewType:I

    .line 22
    .line 23
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthMaxRecentsFactor:F

    .line 24
    .line 25
    iput-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p1, v0, v1}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 32
    .line 33
    .line 34
    iput-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 35
    .line 36
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    array-length v0, v0

    .line 49
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SwipeUpAnimationLogic;->updateIsGestureForSplit(I)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Lcom/android/quickstep/RemoteTargetGluer;

    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/RemoteTargetGluer;-><init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTargetGluer:Lcom/android/quickstep/RemoteTargetGluer;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteTargetGluer;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    iput-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 68
    .line 69
    sget-object p2, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 70
    .line 71
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lcom/android/quickstep/RotationTouchHelper;

    .line 76
    .line 77
    new-instance p2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v0, "currentActiveRotation = "

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/android/quickstep/RotationTouchHelper;->getCurrentActiveRotation()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    const-string v0, "SwipeUpAnimationLogic"

    .line 99
    .line 100
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    new-instance p2, Lcom/android/quickstep/G4;

    .line 104
    .line 105
    invoke-direct {p2, p1}, Lcom/android/quickstep/G4;-><init>(Lcom/android/quickstep/RotationTouchHelper;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, p2}, Lcom/android/quickstep/SwipeUpAnimationLogic;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/RotationTouchHelper;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/RotationTouchHelper;->getCurrentActiveRotation()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/RotationTouchHelper;->getDisplayRotation()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {p1, v0, p0}, Lcom/android/quickstep/util/RecentsOrientedState;->update(II)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(I)[Lcom/android/quickstep/util/TaskViewSimulator;
    .locals 0

    .line 1
    new-array p0, p0, [Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    return-object p0
.end method

.method private getWindowAnimationToHomeInternal(Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Landroid/graphics/RectF;Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/TaskViewSimulator;Landroid/graphics/RectF;Landroid/graphics/Matrix;)Lcom/android/quickstep/util/RectFSpringAnim;
    .locals 14

    .line 1
    move-object/from16 v0, p5

    .line 2
    .line 3
    new-instance v3, Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-virtual/range {p4 .. p4}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCropRect()Landroid/graphics/RectF;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v3, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-boolean v1, v1, Lu2/e;->m:Z

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual/range {p4 .. p4}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCropRectInterrupt()Landroid/graphics/RectF;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v3, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    new-instance v1, Landroid/graphics/Matrix;

    .line 40
    .line 41
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getTargetTaskView()Lcom/android/quickstep/views/TaskView;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    aget-object v4, v4, v5

    .line 54
    .line 55
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v4}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v4}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 68
    .line 69
    invoke-interface {v4, v0, v5}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->fixBoundsForHomeAnimStartRect(Landroid/graphics/RectF;Lcom/android/launcher3/h0;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    move-object/from16 v4, p6

    .line 73
    .line 74
    invoke-virtual {v4, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 78
    .line 79
    .line 80
    new-instance v1, Landroid/graphics/RectF;

    .line 81
    .line 82
    invoke-direct {v1, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 83
    .line 84
    .line 85
    if-eqz v2, :cond_2

    .line 86
    .line 87
    new-instance v1, Landroid/graphics/Rect;

    .line 88
    .line 89
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 90
    .line 91
    .line 92
    const/4 v5, 0x1

    .line 93
    invoke-virtual {v2, v1, v5}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds(Landroid/graphics/Rect;Z)V

    .line 94
    .line 95
    .line 96
    new-instance v2, Landroid/graphics/RectF;

    .line 97
    .line 98
    invoke-direct {v2, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 99
    .line 100
    .line 101
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 102
    .line 103
    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 104
    .line 105
    int-to-float v5, v5

    .line 106
    invoke-virtual {v2, v0, v5}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 107
    .line 108
    .line 109
    new-instance v0, Landroid/graphics/RectF;

    .line 110
    .line 111
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 112
    .line 113
    .line 114
    move-object v1, v2

    .line 115
    :cond_2
    move-object v8, v0

    .line 116
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 117
    .line 118
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 119
    .line 120
    if-eqz v0, :cond_3

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isInHotseat()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    :cond_3
    new-instance v13, Lcom/android/quickstep/util/RectFSpringAnim;

    .line 127
    .line 128
    new-instance v5, Lcom/android/quickstep/util/RectFSpringAnim$MFVSpringConfig;

    .line 129
    .line 130
    iget-object v6, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 131
    .line 132
    iget-object v7, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isInHotseat()Z

    .line 135
    .line 136
    .line 137
    move-result v10

    .line 138
    sget v11, Lcom/android/launcher3/anim/x;->j:F

    .line 139
    .line 140
    iget v12, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mHomeAnimTargetViewType:I

    .line 141
    .line 142
    move-object/from16 v9, p2

    .line 143
    .line 144
    invoke-direct/range {v5 .. v12}, Lcom/android/quickstep/util/RectFSpringAnim$MFVSpringConfig;-><init>(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/RectF;Landroid/graphics/RectF;ZFI)V

    .line 145
    .line 146
    .line 147
    invoke-direct {v13, v5}, Lcom/android/quickstep/util/RectFSpringAnim;-><init>(Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1, v13}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 151
    .line 152
    .line 153
    new-instance v0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;

    .line 154
    .line 155
    move-object v2, p1

    .line 156
    move-object/from16 v5, p3

    .line 157
    .line 158
    move-object/from16 v6, p4

    .line 159
    .line 160
    move-object v7, v1

    .line 161
    move-object v1, p0

    .line 162
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;-><init>(Lcom/android/quickstep/SwipeUpAnimationLogic;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Landroid/graphics/RectF;Landroid/graphics/Matrix;Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/TaskViewSimulator;Landroid/graphics/RectF;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, v8}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->setInitPara(Landroid/graphics/RectF;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v13, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v13, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    .line 172
    .line 173
    .line 174
    return-object v13
.end method


# virtual methods
.method protected createWindowAnimationToHome(FLcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)[Lcom/android/quickstep/util/RectFSpringAnim;
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    new-array v1, v1, [Lcom/android/quickstep/util/RectFSpringAnim;

    .line 5
    .line 6
    array-length v0, v0

    .line 7
    new-array v0, v0, [Landroid/graphics/Matrix;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic;->updateProgressForStartRect([Landroid/graphics/Matrix;F)[Landroid/graphics/RectF;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v2, p2, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mStartRect:Landroid/graphics/RectF;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    aget-object v4, p1, v3

    .line 17
    .line 18
    invoke-virtual {v2, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    aget-object v2, p1, v3

    .line 26
    .line 27
    const/high16 v4, 0x3f800000    # 1.0f

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    invoke-virtual {p2, v2, v4, v5, v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->update(Landroid/graphics/RectF;FFI)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 34
    .line 35
    array-length v2, v2

    .line 36
    :goto_0
    if-ge v3, v2, :cond_0

    .line 37
    .line 38
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 39
    .line 40
    aget-object v4, v4, v3

    .line 41
    .line 42
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 43
    .line 44
    .line 45
    move-result-object v8

    .line 46
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 47
    .line 48
    .line 49
    move-result-object v9

    .line 50
    aget-object v10, p1, v3

    .line 51
    .line 52
    aget-object v11, v0, v3

    .line 53
    .line 54
    move-object v5, p0

    .line 55
    move-object v6, p2

    .line 56
    invoke-direct/range {v5 .. v11}, Lcom/android/quickstep/SwipeUpAnimationLogic;->getWindowAnimationToHomeInternal(Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Landroid/graphics/RectF;Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/TaskViewSimulator;Landroid/graphics/RectF;Landroid/graphics/Matrix;)Lcom/android/quickstep/util/RectFSpringAnim;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    aput-object p0, v1, v3

    .line 61
    .line 62
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    move-object p0, v5

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    return-object v1
.end method

.method protected getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method protected getRemoteTaskViewSimulators()[Lcom/android/quickstep/util/TaskViewSimulator;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/android/quickstep/H4;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/android/quickstep/H4;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/android/quickstep/I4;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/android/quickstep/I4;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, [Lcom/android/quickstep/util/TaskViewSimulator;

    .line 26
    .line 27
    return-object p0
.end method

.method protected initTransitionEndpoints(Lcom/android/launcher3/h0;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iput-object v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 6
    .line 7
    iget-object v2, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 8
    .line 9
    const/16 v3, 0xc8

    .line 10
    .line 11
    const-string v4, "SwipeUpAnimationLogic"

    .line 12
    .line 13
    if-eqz v2, :cond_3

    .line 14
    .line 15
    array-length v2, v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    goto/16 :goto_1

    .line 19
    .line 20
    :cond_0
    iget-object v2, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v5, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 27
    .line 28
    sget-object v6, Lcom/android/quickstep/SwipeUpAnimationLogic;->TEMP_RECT:Landroid/graphics/Rect;

    .line 29
    .line 30
    iget-object v7, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 31
    .line 32
    const/4 v8, 0x0

    .line 33
    aget-object v7, v7, v8

    .line 34
    .line 35
    invoke-virtual {v7}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    invoke-virtual {v7}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    invoke-virtual {v7}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    invoke-virtual {v2, v1, v5, v6, v7}, Lcom/android/quickstep/BaseContainerInterface;->getSwipeUpDestinationAndLength(Lcom/android/launcher3/h0;Landroid/content/Context;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    iput v2, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 52
    .line 53
    if-gez v2, :cond_1

    .line 54
    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v5, "initTransitionEndpoints, length error:"

    .line 61
    .line 62
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    iput v3, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 76
    .line 77
    :cond_1
    iget v2, v1, Lcom/android/launcher3/h0;->U0:I

    .line 78
    .line 79
    int-to-float v3, v2

    .line 80
    const v4, 0x3ecccccd    # 0.4f

    .line 81
    .line 82
    .line 83
    mul-float/2addr v3, v4

    .line 84
    iget v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 85
    .line 86
    int-to-float v5, v4

    .line 87
    div-float/2addr v3, v5

    .line 88
    iput v3, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthMaxRecentsFactor:F

    .line 89
    .line 90
    int-to-float v2, v2

    .line 91
    int-to-float v3, v4

    .line 92
    div-float/2addr v2, v3

    .line 93
    iput v2, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    .line 94
    .line 95
    iget-object v2, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 96
    .line 97
    array-length v3, v2

    .line 98
    :goto_0
    if-ge v8, v3, :cond_2

    .line 99
    .line 100
    aget-object v4, v2, v8

    .line 101
    .line 102
    new-instance v5, Lcom/android/launcher3/anim/V;

    .line 103
    .line 104
    iget v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 105
    .line 106
    mul-int/lit8 v6, v6, 0x2

    .line 107
    .line 108
    int-to-long v6, v6

    .line 109
    invoke-direct {v5, v6, v7}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    invoke-virtual {v6, v1}, Lcom/android/quickstep/util/TaskViewSimulator;->setDp(Lcom/android/launcher3/h0;)V

    .line 117
    .line 118
    .line 119
    sget-object v7, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 120
    .line 121
    invoke-virtual {v6, v5, v7}, Lcom/android/quickstep/util/TaskViewSimulator;->addAppToCarouselAnim(Lcom/android/launcher3/anim/V;Landroid/view/animation/Interpolator;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v5}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 125
    .line 126
    .line 127
    move-result-object v9

    .line 128
    iget-object v10, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 129
    .line 130
    invoke-virtual {v6}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 131
    .line 132
    .line 133
    move-result-object v11

    .line 134
    iget-object v12, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 135
    .line 136
    iget-object v13, v6, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScale:Lcom/android/launcher3/anim/d;

    .line 137
    .line 138
    sget-object v14, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 139
    .line 140
    iget-object v15, v6, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewSecondaryTranslation:Lcom/android/launcher3/anim/d;

    .line 141
    .line 142
    move-object/from16 v16, v14

    .line 143
    .line 144
    invoke-static/range {v9 .. v16}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->createForRecents(Lcom/android/launcher3/anim/q;Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;)Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    invoke-virtual {v4, v5}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->setPlaybackController(Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V

    .line 149
    .line 150
    .line 151
    add-int/lit8 v8, v8, 0x1

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_2
    return-void

    .line 155
    :cond_3
    :goto_1
    iput v3, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 156
    .line 157
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 158
    .line 159
    int-to-float v1, v1

    .line 160
    int-to-float v2, v3

    .line 161
    div-float/2addr v1, v2

    .line 162
    iput v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    .line 163
    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 167
    .line 168
    .line 169
    const-string v2, "initTransitionEndpoints, mRemoteTargetHandles error! mDragLengthFactor:"

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    iget v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    .line 175
    .line 176
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public abstract onCurrentShiftUpdated()V
.end method

.method protected overrideDisplacementForTransientTaskbar(F)F
    .locals 0

    .line 1
    return p1
.end method

.method protected runActionOnRemoteHandles(Ljava/util/function/Consumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-interface {p1, v2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public updateDisplacement(F)V
    .locals 3

    .line 1
    neg-float p1, p1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic;->overrideDisplacementForTransientTaskbar(F)F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentDisplacement:F

    .line 7
    .line 8
    iget v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 9
    .line 10
    int-to-float v1, v0

    .line 11
    iget v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    cmpl-float v1, p1, v1

    .line 15
    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    move v2, v0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    int-to-float v0, v1

    .line 33
    div-float/2addr p1, v0

    .line 34
    move v2, p1

    .line 35
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 36
    .line 37
    invoke-virtual {p0, v2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method protected updateIsGestureForSplit(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-le p1, v0, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    :goto_0
    iput-boolean v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mIsSwipeForSplit:Z

    .line 7
    .line 8
    return-void
.end method

.method protected updateProgressForStartRect([Landroid/graphics/Matrix;F)[Landroid/graphics/RectF;
    .locals 7

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 16
    .line 17
    invoke-virtual {v1, p2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 21
    .line 22
    array-length v2, v1

    .line 23
    new-array v2, v2, [Landroid/graphics/RectF;

    .line 24
    .line 25
    array-length v1, v1

    .line 26
    const/4 v3, 0x0

    .line 27
    :goto_0
    if-ge v3, v1, :cond_1

    .line 28
    .line 29
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 30
    .line 31
    aget-object v4, v4, v3

    .line 32
    .line 33
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4, p2}, Lcom/android/quickstep/util/TransformParams;->setProgress(F)Lcom/android/quickstep/util/TransformParams;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v5, v4}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;)V

    .line 46
    .line 47
    .line 48
    new-instance v4, Landroid/graphics/RectF;

    .line 49
    .line 50
    invoke-virtual {v5}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCropRect()Landroid/graphics/RectF;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-direct {v4, v6}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 55
    .line 56
    .line 57
    aput-object v4, v2, v3

    .line 58
    .line 59
    new-instance v4, Landroid/graphics/Matrix;

    .line 60
    .line 61
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 62
    .line 63
    .line 64
    aput-object v4, p1, v3

    .line 65
    .line 66
    invoke-virtual {v5, v4}, Lcom/android/quickstep/util/TaskViewSimulator;->applyWindowToHomeRotation(Landroid/graphics/Matrix;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v5}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentMatrix()Landroid/graphics/Matrix;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    aget-object v6, v2, v3

    .line 74
    .line 75
    invoke-virtual {v4, v6}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentInterrupt()Landroid/graphics/RectF;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    iget-boolean v5, v0, Lu2/e;->m:Z

    .line 83
    .line 84
    if-eqz v5, :cond_0

    .line 85
    .line 86
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    const/4 v6, 0x0

    .line 91
    cmpl-float v5, v5, v6

    .line 92
    .line 93
    if-eqz v5, :cond_0

    .line 94
    .line 95
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    cmpl-float v5, v5, v6

    .line 100
    .line 101
    if-eqz v5, :cond_0

    .line 102
    .line 103
    aget-object v5, v2, v3

    .line 104
    .line 105
    invoke-virtual {v5, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 106
    .line 107
    .line 108
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    return-object v2
.end method
