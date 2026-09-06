.class Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;
.super Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.source "FallbackSwipeHandler.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/FallbackSwipeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FallbackHomeAnimationFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;",
        "Ljava/util/function/Consumer<",
        "Landroid/os/Message;",
        ">;"
    }
.end annotation


# instance fields
.field private mAnimationFinished:Z

.field private final mDuration:J

.field private final mHomeAlpha:Lcom/android/launcher3/anim/d;

.field private final mHomeAlphaParams:Lcom/android/quickstep/util/TransformParams;

.field private mOnFinishCallback:Landroid/os/Message;

.field private final mRecentsAlpha:Lcom/android/launcher3/anim/d;

.field private mSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;

.field private mSurfaceControl:Landroid/view/SurfaceControl;

.field private final mTargetRect:Landroid/graphics/RectF;

.field private final mTempRect:Landroid/graphics/Rect;

.field private final mVerticalShiftForScale:Lcom/android/launcher3/anim/d;

.field final synthetic this$0:Lcom/android/quickstep/FallbackSwipeHandler;


# direct methods
.method constructor <init>(Lcom/android/quickstep/FallbackSwipeHandler;J)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;-><init>(Lcom/android/quickstep/SwipeUpAnimationLogic;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mTempRect:Landroid/graphics/Rect;

    .line 12
    .line 13
    new-instance v0, Lcom/android/quickstep/util/TransformParams;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/android/quickstep/util/TransformParams;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mHomeAlphaParams:Lcom/android/quickstep/util/TransformParams;

    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mVerticalShiftForScale:Lcom/android/launcher3/anim/d;

    .line 26
    .line 27
    new-instance v2, Lcom/android/launcher3/anim/d;

    .line 28
    .line 29
    invoke-direct {v2}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mRecentsAlpha:Lcom/android/launcher3/anim/d;

    .line 33
    .line 34
    new-instance v3, Landroid/graphics/RectF;

    .line 35
    .line 36
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v3, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mTargetRect:Landroid/graphics/RectF;

    .line 40
    .line 41
    iput-wide p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mDuration:J

    .line 42
    .line 43
    invoke-static {p1}, Lcom/android/quickstep/FallbackSwipeHandler;->y0(Lcom/android/quickstep/FallbackSwipeHandler;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    const/4 p3, 0x0

    .line 48
    const/high16 v3, 0x3f800000    # 1.0f

    .line 49
    .line 50
    if-eqz p2, :cond_0

    .line 51
    .line 52
    new-instance p2, Lcom/android/launcher3/anim/d;

    .line 53
    .line 54
    invoke-direct {p2}, Lcom/android/launcher3/anim/d;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mHomeAlpha:Lcom/android/launcher3/anim/d;

    .line 58
    .line 59
    iget-object v0, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 60
    .line 61
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 62
    .line 63
    sub-float v0, v3, v0

    .line 64
    .line 65
    invoke-static {v0, p3, v3}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    iput p3, p2, Lcom/android/launcher3/anim/d;->d:F

    .line 70
    .line 71
    iget-object p2, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 72
    .line 73
    iget p2, p2, Lcom/android/launcher3/anim/d;->d:F

    .line 74
    .line 75
    iput p2, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 76
    .line 77
    new-instance p2, Lcom/android/quickstep/T0;

    .line 78
    .line 79
    invoke-direct {p2, p0}, Lcom/android/quickstep/T0;-><init>(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p2}, Lcom/android/quickstep/SwipeUpAnimationLogic;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    new-instance p2, Lcom/android/launcher3/anim/d;

    .line 87
    .line 88
    new-instance v1, Lcom/android/quickstep/U0;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Lcom/android/quickstep/U0;-><init>(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p2, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    iput-object p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mHomeAlpha:Lcom/android/launcher3/anim/d;

    .line 97
    .line 98
    iput p3, p2, Lcom/android/launcher3/anim/d;->d:F

    .line 99
    .line 100
    new-instance p2, Lcom/android/quickstep/V0;

    .line 101
    .line 102
    invoke-direct {p2, p0}, Lcom/android/quickstep/V0;-><init>(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p2}, Lcom/android/quickstep/util/TransformParams;->setHomeBuilderProxy(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/TransformParams;

    .line 106
    .line 107
    .line 108
    :goto_0
    iput v3, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 109
    .line 110
    new-instance p2, Lcom/android/quickstep/W0;

    .line 111
    .line 112
    invoke-direct {p2, p0}, Lcom/android/quickstep/W0;-><init>(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, p2}, Lcom/android/quickstep/SwipeUpAnimationLogic;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->lambda$new$1(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addGestureContract(Landroid/content/Intent;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/FallbackSwipeHandler;->y0(Lcom/android/quickstep/FallbackSwipeHandler;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 13
    .line 14
    invoke-direct {v0, p2}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    if-eqz p2, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/android/quickstep/FallbackSwipeHandler;->A0()Lcom/android/quickstep/FallbackSwipeHandler$StaticMessageReceiver;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    new-instance p2, Lcom/android/quickstep/FallbackSwipeHandler$StaticMessageReceiver;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-direct {p2, v1}, Lcom/android/quickstep/FallbackSwipeHandler$StaticMessageReceiver;-><init>(Lcom/android/quickstep/Z0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2}, Lcom/android/quickstep/FallbackSwipeHandler;->B0(Lcom/android/quickstep/FallbackSwipeHandler$StaticMessageReceiver;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    new-instance p2, Landroid/os/Bundle;

    .line 39
    .line 40
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v1, "android.intent.extra.COMPONENT_NAME"

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 50
    .line 51
    .line 52
    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 53
    .line 54
    invoke-static {v0}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "android.intent.extra.USER"

    .line 59
    .line 60
    invoke-virtual {p2, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/android/quickstep/FallbackSwipeHandler;->A0()Lcom/android/quickstep/FallbackSwipeHandler$StaticMessageReceiver;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, p0}, Lcom/android/quickstep/FallbackSwipeHandler$StaticMessageReceiver;->newCallback(Ljava/util/function/Consumer;)Landroid/os/Message;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v0, "android.intent.extra.REMOTE_CALLBACK"

    .line 72
    .line 73
    invoke-virtual {p2, v0, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 74
    .line 75
    .line 76
    const-string p0, "gesture_nav_contract_v1"

    .line 77
    .line 78
    invoke-virtual {p1, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->updateHomeAlpha()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->onRectAnimationEnd()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->updateRecentsActivityTransformDuringHomeAnim(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->lambda$new$0(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->updateHomeActivityTransformDuringHomeAnim(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;Landroid/content/Intent;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->addGestureContract(Landroid/content/Intent;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/android/quickstep/V0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/android/quickstep/V0;-><init>(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/TransformParams;->setHomeBuilderProxy(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/TransformParams;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic lambda$new$1(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/android/quickstep/X0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/android/quickstep/X0;-><init>(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/TransformParams;->setBaseBuilderProxy(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/TransformParams;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private maybeSendEndMessage()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mAnimationFinished:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mOnFinishCallback:Landroid/os/Message;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object v0, p0, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    const-string v0, "FallbackSwipeHandler"

    .line 17
    .line 18
    const-string v1, "Error sending icon position"

    .line 19
    .line 20
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private onRectAnimationEnd()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mAnimationFinished:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->maybeSendEndMessage()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private updateHomeActivityTransformDuringHomeAnim(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mVerticalShiftForScale:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mHomeAlpha:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 10
    .line 11
    invoke-static {p3, p1, p2, v0, p0}, Lcom/android/quickstep/FallbackSwipeHandler;->z0(Lcom/android/quickstep/FallbackSwipeHandler;Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;FF)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private updateHomeAlpha()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mHomeAlphaParams:Lcom/android/quickstep/util/TransformParams;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mHomeAlphaParams:Lcom/android/quickstep/util/TransformParams;

    .line 10
    .line 11
    sget-object v0, Lcom/android/quickstep/util/TransformParams$BuilderProxy;->NO_OP:Lcom/android/quickstep/util/TransformParams$BuilderProxy;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/TransformParams;->createSurfaceParams(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/SurfaceTransaction;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/TransformParams;->applySurfaceParams(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private updateRecentsActivityTransformDuringHomeAnim(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mRecentsAlpha:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public accept(Landroid/os/Message;)V
    .locals 2

    .line 2
    :try_start_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    .line 3
    const-string v0, "gesture_nav_contract_icon_position"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/RectF;

    .line 4
    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 5
    const-string v1, "gesture_nav_contract_surface_control"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/view/SurfaceControl;

    iput-object v1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mSurfaceControl:Landroid/view/SurfaceControl;

    .line 6
    iget-object v1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mTargetRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 7
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    if-eqz v0, :cond_0

    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/RectFSpringAnim;->onTargetPositionChanged()V

    .line 9
    :cond_0
    const-string v0, "gesture_nav_contract_finish_callback"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/os/Message;

    iput-object p1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mOnFinishCallback:Landroid/os/Message;

    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->maybeSendEndMessage()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/os/Message;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->accept(Landroid/os/Message;)V

    return-void
.end method

.method public createActivityAnimationToHome()Lcom/android/launcher3/anim/q;
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mDuration:J

    .line 4
    .line 5
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mRecentsAlpha:Lcom/android/launcher3/anim/d;

    .line 9
    .line 10
    sget-object v1, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    sget-object v3, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1, v2, v3}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getWindowTargetRect()Landroid/graphics/RectF;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mTargetRect:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mTargetRect:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-super {p0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mTargetRect:Landroid/graphics/RectF;

    .line 19
    .line 20
    return-object p0
.end method

.method public handleHomeTaskAppeared([Landroid/view/RemoteAnimationTarget;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p1, p1, v0

    .line 3
    .line 4
    iget-object v1, p1, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x2

    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    new-instance v1, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 14
    .line 15
    filled-new-array {p1}, [Landroid/view/RemoteAnimationTarget;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-array v3, v0, [Landroid/view/RemoteAnimationTarget;

    .line 20
    .line 21
    new-array v0, v0, [Landroid/view/RemoteAnimationTarget;

    .line 22
    .line 23
    iget p1, p1, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 24
    .line 25
    invoke-direct {v1, v2, v3, v0, p1}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mHomeAlphaParams:Lcom/android/quickstep/util/TransformParams;

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->updateHomeAlpha()V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    return v0
.end method

.method public playAtomicAnimation(FLandroid/animation/AnimatorSet;)V
    .locals 4

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mHomeAlpha:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, p2, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p2, v0, v1}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-wide v2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mDuration:J

    .line 12
    .line 13
    invoke-virtual {p2, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v2, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/animation/ObjectAnimator;->start()V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 26
    .line 27
    invoke-static {p2}, Lcom/android/quickstep/FallbackSwipeHandler;->y0(Lcom/android/quickstep/FallbackSwipeHandler;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    new-instance p2, Lcom/android/launcher3/anim/f0;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 38
    .line 39
    invoke-direct {p2, v0}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mVerticalShiftForScale:Lcom/android/launcher3/anim/d;

    .line 43
    .line 44
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const/4 v0, 0x0

    .line 51
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    neg-float p1, p1

    .line 56
    iget-object v0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 57
    .line 58
    iget v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 59
    .line 60
    int-to-float v0, v0

    .line 61
    div-float/2addr p1, v0

    .line 62
    invoke-virtual {p2, p1}, Lcom/android/launcher3/anim/f0;->r(F)Lcom/android/launcher3/anim/f0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->this$0:Lcom/android/quickstep/FallbackSwipeHandler;

    .line 67
    .line 68
    iget-object p2, p2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 69
    .line 70
    iget p2, p2, Lcom/android/launcher3/h0;->U0:I

    .line 71
    .line 72
    int-to-float p2, p2

    .line 73
    div-float/2addr v1, p2

    .line 74
    invoke-virtual {p1, v1}, Lcom/android/launcher3/anim/f0;->p(F)Lcom/android/launcher3/anim/f0;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const p2, 0x3f19999a    # 0.6f

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, p2}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const/high16 p2, 0x44480000    # 800.0f

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mVerticalShiftForScale:Lcom/android/launcher3/anim/d;

    .line 92
    .line 93
    sget-object p2, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 94
    .line 95
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 100
    .line 101
    .line 102
    :cond_0
    return-void
.end method

.method public setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 2
    .line 3
    new-instance v0, Lcom/android/quickstep/Y0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/quickstep/Y0;-><init>(Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public update(Landroid/graphics/RectF;FFI)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mSurfaceControl:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mTempRect:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Landroid/view/SurfaceControl$Transaction;

    .line 11
    .line 12
    invoke-direct {p1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    iget-object p2, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mSurfaceControl:Landroid/view/SurfaceControl;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/FallbackSwipeHandler$FallbackHomeAnimationFactory;->mTempRect:Landroid/graphics/Rect;

    .line 18
    .line 19
    const/4 p3, 0x0

    .line 20
    const/4 p4, 0x0

    .line 21
    invoke-virtual {p1, p2, p4, p0, p3}, Landroid/view/SurfaceControl$Transaction;->setGeometry(Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;I)Landroid/view/SurfaceControl$Transaction;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    :catch_0
    :cond_0
    return-void
.end method
