.class public Lcom/android/quickstep/TouchInteractionService;
.super Landroid/app/Service;
.source "TouchInteractionService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/TouchInteractionService$TISBinder;,
        Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;,
        Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;,
        Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;
    }
.end annotation


# static fields
.field private static final ANTI_PINCH_HAND_MODE_AREA_BEGIN:F = 595.0f

.field private static final ANTI_PINCH_HAND_MODE_RANGE:F = 170.0f

.field private static final ANTI_PINCH_HAND__MODE_AREA_END:F = 2195.0f

.field private static final ENABLE_GESTURE_NAV_ON_CONNECTED_DISPLAYS:Landroid/window/DesktopModeFlags$DesktopModeFlag;

.field private static final HAS_ENABLED_QUICKSTEP_ONCE:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final SUBSTRING_PREFIX:Ljava/lang/String; = "; "

.field private static final TAG:Ljava/lang/String; = "TouchInteractionService"


# instance fields
.field private mAllAppsActionManager:Lcom/android/quickstep/AllAppsActionManager;

.field mAngleListener:Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;

.field mAngleSensor:Landroid/hardware/Sensor;

.field mAngleSensorHandler:Landroid/os/Handler;

.field private mConsumer:Lcom/android/quickstep/InputConsumer;

.field mCurrentTouchY:F

.field private mDesktopAppLaunchTransitionManager:Lj1/j;

.field private mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

.field private mDisplayInfoChangeListener:Lcom/android/launcher3/util/Z$b;

.field private final mDownPos:Landroid/graphics/PointF;

.field private final mFallbackSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

.field private mGestureStartNavMode:Lcom/android/launcher3/util/C1;

.field private mGestureState:Lcom/android/quickstep/GestureState;

.field private mHasToggledMiniWindow:Z

.field private mInputConsumer:Lcom/android/systemui/shared/system/InputConsumerController;

.field private mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

.field private mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

.field private mInputMonitorDisplayModel:Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;

.field private mIsInHigherSwipeUpTouchRegion:Z

.field private mIsInSwipeUpTouchRegion:Z

.field mLastAngle:F

.field private final mLauncherSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

.field private mMainChoreographer:Landroid/view/Choreographer;

.field private final mNavCallbacks:Lcom/android/launcher3/taskbar/l3$a;

.field private final mOverviewChangeListener:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

.field private mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

.field private mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

.field private mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

.field private final mRecentsWindowSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

.field private mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

.field private final mScreenOnListener:Lcom/android/launcher3/util/h2$a;

.field mSensorManager:Landroid/hardware/SensorManager;

.field private mSwipeUpProxyProvider:Ljava/util/function/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Function<",
            "Lcom/android/quickstep/GestureState;",
            "Lcom/android/launcher3/anim/d;",
            ">;"
        }
    .end annotation
.end field

.field private mSystemDecorationChangeObserver:Lcom/android/quickstep/SystemDecorationChangeObserver;

.field private final mTISBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

.field private mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

.field private mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

.field private mTouchSlopSquared:F

.field private mTrackpadsConnected:Lcom/android/quickstep/util/ActiveTrackpadList;

.field private mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

.field private mUserUnlocked:Z

.field private final mUserUnlockedRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/r0;->g:Lcom/android/launcher3/r0;

    .line 4
    .line 5
    const-string v2, "launcher.has_enabled_quickstep_once"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Lcom/android/launcher3/J3;->e(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/android/quickstep/TouchInteractionService;->HAS_ENABLED_QUICKSTEP_ONCE:Lcom/android/launcher3/X;

    .line 12
    .line 13
    new-instance v0, Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 14
    .line 15
    new-instance v1, Lcom/android/quickstep/e6;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/android/quickstep/e6;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-direct {v0, v1, v2}, Landroid/window/DesktopModeFlags$DesktopModeFlag;-><init>(Ljava/util/function/BooleanSupplier;Z)V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/android/quickstep/TouchInteractionService;->ENABLE_GESTURE_NAV_ON_CONNECTED_DISPLAYS:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;-><init>(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/i7;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTISBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 11
    .line 12
    new-instance v0, Lcom/android/quickstep/j6;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/quickstep/j6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mLauncherSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 18
    .line 19
    new-instance v0, Lcom/android/quickstep/k6;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lcom/android/quickstep/k6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mFallbackSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 25
    .line 26
    new-instance v0, Lcom/android/quickstep/l6;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/android/quickstep/l6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsWindowSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 32
    .line 33
    new-instance v0, Lcom/android/quickstep/m6;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/android/quickstep/m6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mUserUnlockedRunnable:Ljava/lang/Runnable;

    .line 39
    .line 40
    new-instance v0, Lcom/android/quickstep/n6;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/android/quickstep/n6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mScreenOnListener:Lcom/android/launcher3/util/h2$a;

    .line 46
    .line 47
    new-instance v0, Lcom/android/quickstep/o6;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lcom/android/quickstep/o6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewChangeListener:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 53
    .line 54
    new-instance v0, Lcom/android/quickstep/TouchInteractionService$1;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lcom/android/quickstep/TouchInteractionService$1;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mNavCallbacks:Lcom/android/launcher3/taskbar/l3$a;

    .line 60
    .line 61
    sget-object v0, Lcom/android/quickstep/InputConsumer;->DEFAULT_NO_OP:Lcom/android/quickstep/InputConsumer;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    iput-boolean v0, p0, Lcom/android/quickstep/TouchInteractionService;->mUserUnlocked:Z

    .line 69
    .line 70
    sget-object v0, Lcom/android/quickstep/GestureState;->DEFAULT_STATE:Lcom/android/quickstep/GestureState;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 73
    .line 74
    new-instance v0, Lcom/android/quickstep/b6;

    .line 75
    .line 76
    invoke-direct {v0}, Lcom/android/quickstep/b6;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mSwipeUpProxyProvider:Ljava/util/function/Function;

    .line 80
    .line 81
    iput-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mGestureStartNavMode:Lcom/android/launcher3/util/C1;

    .line 82
    .line 83
    new-instance v0, Landroid/graphics/PointF;

    .line 84
    .line 85
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDownPos:Landroid/graphics/PointF;

    .line 89
    .line 90
    new-instance v0, Landroid/os/Handler;

    .line 91
    .line 92
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mAngleSensorHandler:Landroid/os/Handler;

    .line 96
    .line 97
    new-instance v0, Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mAngleListener:Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;

    .line 103
    .line 104
    return-void
.end method

.method static bridge synthetic A(Lcom/android/quickstep/TouchInteractionService;Landroid/view/InputEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->onInputEvent(Landroid/view/InputEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic B(Lcom/android/quickstep/TouchInteractionService;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->onOverviewTargetChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic C(Lcom/android/quickstep/TouchInteractionService;JI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/TouchInteractionService;->onSystemUiFlagsChanged(JI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic D(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->reInitAfteronUserUnlocked()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/TouchInteractionService;->createFallbackSwipeHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/TouchInteractionService;->createRecentsWindowSwipeHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->lambda$onCreate$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private createAllAppsPendingIntent()Landroid/app/PendingIntent;
    .locals 2

    .line 1
    new-instance v0, Landroid/app/PendingIntent;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/TouchInteractionService$2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/TouchInteractionService$2;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/app/PendingIntent;-><init>(Landroid/content/IIntentSender;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private createFallbackSwipeHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    new-instance v2, Lcom/android/quickstep/FallbackSwipeHandler;

    .line 12
    .line 13
    invoke-virtual {v4}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 14
    .line 15
    .line 16
    move-result v8

    .line 17
    iget-object v9, p0, Lcom/android/quickstep/TouchInteractionService;->mInputConsumer:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 18
    .line 19
    sget-object v0, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v10, v0

    .line 26
    check-cast v10, Lcom/android/launcher3/util/s1;

    .line 27
    .line 28
    move-object v3, p0

    .line 29
    move-object v5, p1

    .line 30
    move-wide v6, p2

    .line 31
    invoke-direct/range {v2 .. v10}, Lcom/android/quickstep/FallbackSwipeHandler;-><init>(Landroid/content/Context;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;JZLcom/android/systemui/shared/system/InputConsumerController;Lcom/android/launcher3/util/s1;)V

    .line 32
    .line 33
    .line 34
    return-object v2
.end method

.method private createGestureCourseInputConsumer(Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;)Lcom/android/quickstep/InputConsumer;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isInExclusionRegion(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v6

    .line 7
    new-instance v1, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 12
    .line 13
    move-object v2, p0

    .line 14
    move-object v4, p1

    .line 15
    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/systemui/shared/system/InputMonitorCompat;Z)V

    .line 16
    .line 17
    .line 18
    return-object v1
.end method

.method private createLauncherSwipeHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    new-instance v2, Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 12
    .line 13
    invoke-virtual {v4}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 14
    .line 15
    .line 16
    move-result v8

    .line 17
    iget-object v9, p0, Lcom/android/quickstep/TouchInteractionService;->mInputConsumer:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 18
    .line 19
    sget-object v0, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v10, v0

    .line 26
    check-cast v10, Lcom/android/launcher3/util/s1;

    .line 27
    .line 28
    move-object v3, p0

    .line 29
    move-object v5, p1

    .line 30
    move-wide v6, p2

    .line 31
    invoke-direct/range {v2 .. v10}, Lcom/android/quickstep/LauncherSwipeHandlerV2;-><init>(Landroid/content/Context;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;JZLcom/android/systemui/shared/system/InputConsumerController;Lcom/android/launcher3/util/s1;)V

    .line 32
    .line 33
    .line 34
    return-object v2
.end method

.method private createRecentsWindowSwipeHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    new-instance v2, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;

    .line 12
    .line 13
    invoke-virtual {v4}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 14
    .line 15
    .line 16
    move-result v8

    .line 17
    iget-object v9, p0, Lcom/android/quickstep/TouchInteractionService;->mInputConsumer:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 18
    .line 19
    sget-object v0, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v10, v0

    .line 26
    check-cast v10, Lcom/android/launcher3/util/s1;

    .line 27
    .line 28
    move-object v3, p0

    .line 29
    move-object v5, p1

    .line 30
    move-wide v6, p2

    .line 31
    invoke-direct/range {v2 .. v10}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;-><init>(Landroid/content/Context;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;JZLcom/android/systemui/shared/system/InputConsumerController;Lcom/android/launcher3/util/s1;)V

    .line 32
    .line 33
    .line 34
    return-object v2
.end method

.method public static synthetic d(Lcom/android/quickstep/TouchInteractionService;Landroid/view/InputEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->onInputEvent(Landroid/view/InputEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private disposeEventHandlers(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "disposeEventHandlers: Reason: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, " instance="

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "TouchInteractionService"

    .line 31
    .line 32
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    sget-object p1, Lcom/android/quickstep/TouchInteractionService;->ENABLE_GESTURE_NAV_ON_CONNECTED_DISPLAYS:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorDisplayModel:Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;

    .line 44
    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/DisplayModel;->destroy()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;->dispose()V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 61
    .line 62
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 63
    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    new-instance p1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v2, "disposeEventHandlers: dispose input monitor: "

    .line 72
    .line 73
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 77
    .line 78
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v2, ", service: "

    .line 82
    .line 83
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/android/systemui/shared/system/InputMonitorCompat;->dispose()V

    .line 99
    .line 100
    .line 101
    iput-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 102
    .line 103
    :cond_3
    :goto_0
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/GestureState;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic f(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/InputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->onConsumerInactive(Lcom/android/quickstep/InputConsumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/TouchInteractionService;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->onOverviewTargetChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getInputEventReceiver(I)Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TouchInteractionService;->ENABLE_GESTURE_NAV_ON_CONNECTED_DISPLAYS:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorDisplayModel:Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    move-object p0, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;

    .line 21
    .line 22
    :goto_0
    if-nez p0, :cond_1

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->b(Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;)Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 31
    .line 32
    return-object p0
.end method

.method private getInputMonitorCompat(I)Lcom/android/systemui/shared/system/InputMonitorCompat;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TouchInteractionService;->ENABLE_GESTURE_NAV_ON_CONNECTED_DISPLAYS:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorDisplayModel:Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    move-object p0, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;

    .line 21
    .line 22
    :goto_0
    if-nez p0, :cond_1

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;->c(Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;)Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 31
    .line 32
    return-object p0
.end method

.method private getureDataCollection(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 4
    .line 5
    if-ne v0, v1, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isKeyguardShowingOrOccluded()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isKeyguardShowingOccluded()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDownPos:Landroid/graphics/PointF;

    .line 28
    .line 29
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 30
    .line 31
    sub-float/2addr p1, v0

    .line 32
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-virtual {p0}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const v1, 0x7f070381

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    int-to-float v0, v0

    .line 48
    cmpl-float p1, p1, v0

    .line 49
    .line 50
    if-lez p1, :cond_1

    .line 51
    .line 52
    iget-boolean p1, p0, Lcom/android/quickstep/TouchInteractionService;->mIsInSwipeUpTouchRegion:Z

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iget-boolean p1, p0, Lcom/android/quickstep/TouchInteractionService;->mIsInHigherSwipeUpTouchRegion:Z

    .line 57
    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    const p1, 0x7f140138

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/app/Service;->getString(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mDownPos:Landroid/graphics/PointF;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/graphics/PointF;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p1, p0}, Lh1/a;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canStartSystemGesture()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-nez p1, :cond_2

    .line 84
    .line 85
    const p1, 0x7f140139

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p1}, Landroid/app/Service;->getString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {p1, p0}, Lh1/a;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    return-void
.end method

.method public static synthetic h(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/TouchInteractionService;->createLauncherSwipeHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->onNavigationModeChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private inAntiPinchHandModeArea(F)Z
    .locals 0

    .line 1
    const p0, 0x4414c000    # 595.0f

    .line 2
    .line 3
    .line 4
    cmpg-float p0, p0, p1

    .line 5
    .line 6
    if-gtz p0, :cond_0

    .line 7
    .line 8
    const p0, 0x45093000    # 2195.0f

    .line 9
    .line 10
    .line 11
    cmpg-float p0, p1, p0

    .line 12
    .line 13
    if-gtz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private inAntiPinchHandModeRange(F)Z
    .locals 0

    .line 1
    const/high16 p0, 0x432a0000    # 170.0f

    .line 2
    .line 3
    cmpg-float p0, p1, p0

    .line 4
    .line 5
    if-gtz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method private final inheritLastRecentParams(Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 16
    .line 17
    if-ne p2, v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getMaybeReverseGestureAnimation()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    invoke-virtual {p1, p0}, Lcom/android/quickstep/GestureState;->setReverseGestureAnimationRunning(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getIsReverseGestureAnimationRunning()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    xor-int/2addr p0, p1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method private initInputMonitor(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Initializing input monitor due to: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->disposeEventHandlers(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isButtonNavMode()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->supportsAssistantGestureInButtonNav()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mTrackpadsConnected:Lcom/android/quickstep/util/ActiveTrackpadList;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lx1/O;->b5()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    invoke-static {}, Lx1/O;->m5()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    invoke-static {p0}, Lx1/O;->j4(Landroid/content/Context;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_0

    .line 62
    .line 63
    const-string p1, "TouchInteractionService"

    .line 64
    .line 65
    const-string v0, "should support pinch hand tips, don\'t intercept the touch event !"

    .line 66
    .line 67
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    return-void

    .line 72
    :cond_1
    :goto_0
    sget-object p1, Lcom/android/quickstep/TouchInteractionService;->ENABLE_GESTURE_NAV_ON_CONNECTED_DISPLAYS:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    new-instance p1, Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;

    .line 81
    .line 82
    const/4 v0, 0x0

    .line 83
    invoke-direct {p1, p0, p0, v0}, Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;-><init>(Lcom/android/quickstep/TouchInteractionService;Landroid/content/Context;Lcom/android/quickstep/i7;)V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorDisplayModel:Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    new-instance p1, Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 90
    .line 91
    const-string v0, "swipe-up"

    .line 92
    .line 93
    const/4 v1, 0x0

    .line 94
    invoke-direct {p1, v0, v1}, Lcom/android/systemui/shared/system/InputMonitorCompat;-><init>(Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 98
    .line 99
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mMainChoreographer:Landroid/view/Choreographer;

    .line 104
    .line 105
    new-instance v2, Lcom/android/quickstep/i6;

    .line 106
    .line 107
    invoke-direct {v2, p0}, Lcom/android/quickstep/i6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v0, v1, v2}, Lcom/android/systemui/shared/system/InputMonitorCompat;->getInputReceiver(Landroid/os/Looper;Landroid/view/Choreographer;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventListener;)Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 115
    .line 116
    :goto_1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/android/quickstep/RotationTouchHelper;->updateGestureTouchRegions()V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method private isCursorHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->isHoverEvent()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/16 p1, 0x2002

    .line 12
    .line 13
    if-ne p0, p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private isHoverActionWithoutConsumer(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->p3:Z

    .line 24
    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    move v0, v2

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v0, v1

    .line 36
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->isHoverEvent()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 43
    .line 44
    invoke-interface {p0}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    and-int/lit16 p0, p0, 0x4000

    .line 49
    .line 50
    if-nez p0, :cond_2

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    return v2

    .line 55
    :cond_2
    return v1
.end method

.method private static isTablet(Landroid/content/res/Configuration;)Z
    .locals 1

    .line 1
    iget p0, p0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 2
    .line 3
    const/16 v0, 0x258

    .line 4
    .line 5
    if-lt p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic j(Lcom/android/quickstep/TouchInteractionService;)Landroid/app/PendingIntent;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->createAllAppsPendingIntent()Landroid/app/PendingIntent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->lambda$onInputEvent$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->lambda$onCreate$2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onCreate$1()V
    .locals 1

    .line 1
    const-string v0, "onTrackpadConnected()"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService;->initInputMonitor(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onCreate$2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTrackpadsConnected:Lcom/android/quickstep/util/ActiveTrackpadList;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 15
    .line 16
    new-instance v1, Lcom/android/quickstep/f6;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/quickstep/f6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic lambda$onInputEvent$3()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->toggleSmallWindowToMini(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic m(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/AllAppsActionManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mAllAppsActionManager:Lcom/android/quickstep/AllAppsActionManager;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/quickstep/TouchInteractionService;)Landroid/view/Choreographer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mMainChoreographer:Landroid/view/Choreographer;

    .line 2
    .line 3
    return-object p0
.end method

.method private onAssistantVisibilityChanged()V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getAssistantVisibility()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v0, p0}, Lcom/android/quickstep/BaseContainerInterface;->onAssistantVisibilityChanged(F)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private onConsumerInactive(Lcom/android/quickstep/InputConsumer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/quickstep/InputConsumer;->getActiveConsumerInHierarchy()Lcom/android/quickstep/InputConsumer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne v0, p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Lcom/android/quickstep/InputConsumer;->getDisplayId()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->reset(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private onInputConsumerEvent(Landroid/view/InputEvent;)Z
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "onInputConsumerEvent "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "TouchInteractionService"

    .line 19
    .line 20
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private onInputEvent(Landroid/view/InputEvent;)V
    .locals 28

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/InputEvent;->getDisplayId()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    instance-of v3, v0, Landroid/view/MotionEvent;

    .line 10
    .line 11
    if-nez v3, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v2, v0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logUnknownInputEvent(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    move-object v15, v0

    .line 22
    check-cast v15, Landroid/view/MotionEvent;

    .line 23
    .line 24
    invoke-static {}, Lx1/O;->b5()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v6, 0x2

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lx1/O;->m5()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-static {v1}, Lx1/O;->j4(Landroid/content/Context;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getAction()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    if-eq v0, v6, :cond_1

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    iput v0, v1, Lcom/android/quickstep/TouchInteractionService;->mCurrentTouchY:F

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getY()F

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, v1, Lcom/android/quickstep/TouchInteractionService;->mCurrentTouchY:F

    .line 60
    .line 61
    :cond_2
    :goto_0
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isButtonNavMode()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    goto/16 :goto_20

    .line 70
    .line 71
    :cond_3
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/4 v7, 0x3

    .line 80
    const/4 v8, 0x0

    .line 81
    const/4 v9, 0x1

    .line 82
    if-eqz v0, :cond_6

    .line 83
    .line 84
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_6

    .line 89
    .line 90
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/android/quickstep/RotationTouchHelper;->getDisplayRotation()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eq v0, v9, :cond_5

    .line 97
    .line 98
    if-ne v0, v7, :cond_4

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    move v0, v8

    .line 102
    goto :goto_2

    .line 103
    :cond_5
    :goto_1
    move v0, v9

    .line 104
    :goto_2
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-static {v3}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3, v0}, Lcom/android/quickstep/util/InputInjectHelper;->setLandscape(Z)V

    .line 113
    .line 114
    .line 115
    :cond_6
    const-string v0, "TouchInteractionService.onInputEvent"

    .line 116
    .line 117
    const-string v10, "TIS"

    .line 118
    .line 119
    invoke-static {v10, v0, v15}, Lcom/android/launcher3/testing/K;->e(Ljava/lang/String;Ljava/lang/String;Landroid/view/MotionEvent;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v1}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    const-string v3, "TouchInteractionService"

    .line 131
    .line 132
    if-nez v0, :cond_7

    .line 133
    .line 134
    invoke-static {v2}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnInputEventUserLocked(I)V

    .line 135
    .line 136
    .line 137
    const-string v0, "isUserUnlocked is not UserUnlocked "

    .line 138
    .line 139
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    invoke-direct {v1}, Lcom/android/quickstep/TouchInteractionService;->reInitAfteronUserUnlocked()V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_44

    .line 154
    .line 155
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-nez v0, :cond_44

    .line 160
    .line 161
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 162
    .line 163
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->setOrientationTransformIfNeeded(Landroid/view/MotionEvent;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 167
    .line 168
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_44

    .line 173
    .line 174
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_7
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getMode()Lcom/android/launcher3/util/C1;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureStartNavMode:Lcom/android/launcher3/util/C1;

    .line 193
    .line 194
    if-eqz v4, :cond_8

    .line 195
    .line 196
    if-eq v4, v0, :cond_8

    .line 197
    .line 198
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    invoke-static {v2, v4, v5}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnInputEventNavModeSwitched(ILjava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v15, v7}, Landroid/view/MotionEvent;->setAction(I)V

    .line 210
    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_8
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 214
    .line 215
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isButtonNavMode()Z

    .line 216
    .line 217
    .line 218
    move-result v4

    .line 219
    if-eqz v4, :cond_9

    .line 220
    .line 221
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 222
    .line 223
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->supportsAssistantGestureInButtonNav()Z

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    if-nez v4, :cond_9

    .line 228
    .line 229
    invoke-static {v15}, Lcom/android/launcher3/H4;->b(Landroid/view/MotionEvent;)Z

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    if-nez v4, :cond_9

    .line 234
    .line 235
    invoke-static {v2}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnInputEventThreeButtonNav(I)V

    .line 236
    .line 237
    .line 238
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-eqz v0, :cond_44

    .line 247
    .line 248
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-nez v0, :cond_44

    .line 253
    .line 254
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 255
    .line 256
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->setOrientationTransformIfNeeded(Landroid/view/MotionEvent;)V

    .line 257
    .line 258
    .line 259
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 260
    .line 261
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-eqz v0, :cond_44

    .line 266
    .line 267
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 276
    .line 277
    .line 278
    return-void

    .line 279
    :cond_9
    :goto_3
    sget-boolean v4, Lx1/O;->T:Z

    .line 280
    .line 281
    if-eqz v4, :cond_a

    .line 282
    .line 283
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 284
    .line 285
    iget-boolean v4, v4, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIgnorestylusGesture:Z

    .line 286
    .line 287
    if-eqz v4, :cond_a

    .line 288
    .line 289
    invoke-virtual {v15, v8}, Landroid/view/MotionEvent;->getToolType(I)I

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    if-ne v4, v6, :cond_a

    .line 294
    .line 295
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_44

    .line 304
    .line 305
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-nez v0, :cond_44

    .line 310
    .line 311
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 312
    .line 313
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->setOrientationTransformIfNeeded(Landroid/view/MotionEvent;)V

    .line 314
    .line 315
    .line 316
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 317
    .line 318
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    .line 319
    .line 320
    .line 321
    move-result v0

    .line 322
    if-eqz v0, :cond_44

    .line 323
    .line 324
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    :cond_a
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 337
    .line 338
    .line 339
    move-result v11

    .line 340
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    .line 341
    .line 342
    .line 343
    move-result v4

    .line 344
    if-eqz v4, :cond_b

    .line 345
    .line 346
    invoke-direct {v1, v15}, Lcom/android/quickstep/TouchInteractionService;->isHoverActionWithoutConsumer(Landroid/view/MotionEvent;)Z

    .line 347
    .line 348
    .line 349
    move-result v4

    .line 350
    if-eqz v4, :cond_b

    .line 351
    .line 352
    move v4, v9

    .line 353
    goto :goto_4

    .line 354
    :cond_b
    move v4, v8

    .line 355
    :goto_4
    iget-object v5, v1, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 356
    .line 357
    invoke-virtual {v5, v2}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 358
    .line 359
    .line 360
    move-result-object v5

    .line 361
    if-nez v5, :cond_c

    .line 362
    .line 363
    new-instance v0, Ljava/lang/StringBuilder;

    .line 364
    .line 365
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 366
    .line 367
    .line 368
    const-string v1, "TaskAnimationManager not available for displayId "

    .line 369
    .line 370
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    .line 382
    .line 383
    invoke-static {v2}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnTaskAnimationManagerNotAvailable(I)V

    .line 384
    .line 385
    .line 386
    return-void

    .line 387
    :cond_c
    invoke-static {}, Lcom/android/launcher3/y0;->z()Z

    .line 388
    .line 389
    .line 390
    move-result v12

    .line 391
    if-eqz v12, :cond_11

    .line 392
    .line 393
    if-eqz v11, :cond_d

    .line 394
    .line 395
    if-eqz v4, :cond_e

    .line 396
    .line 397
    :cond_d
    invoke-virtual {v5}, Lcom/android/quickstep/TaskAnimationManager;->notifyNewGestureStart()V

    .line 398
    .line 399
    .line 400
    :cond_e
    invoke-virtual {v5}, Lcom/android/quickstep/TaskAnimationManager;->shouldIgnoreMotionEvents()Z

    .line 401
    .line 402
    .line 403
    move-result v12

    .line 404
    if-eqz v12, :cond_11

    .line 405
    .line 406
    if-eqz v11, :cond_f

    .line 407
    .line 408
    if-eqz v4, :cond_10

    .line 409
    .line 410
    :cond_f
    invoke-static {v2}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnInputIgnoringFollowingEvents(I)V

    .line 411
    .line 412
    .line 413
    const-string v0, "shouldIgnoreMotionEvents"

    .line 414
    .line 415
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    .line 417
    .line 418
    const v0, 0x7f14013a

    .line 419
    .line 420
    .line 421
    invoke-virtual {v1, v0}, Landroid/app/Service;->getString(I)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    const-string v2, "true"

    .line 426
    .line 427
    invoke-static {v0, v2}, Lh1/a;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    :cond_10
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    if-eqz v0, :cond_44

    .line 439
    .line 440
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 441
    .line 442
    .line 443
    move-result v0

    .line 444
    if-nez v0, :cond_44

    .line 445
    .line 446
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 447
    .line 448
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->setOrientationTransformIfNeeded(Landroid/view/MotionEvent;)V

    .line 449
    .line 450
    .line 451
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 452
    .line 453
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    .line 454
    .line 455
    .line 456
    move-result v0

    .line 457
    if-eqz v0, :cond_44

    .line 458
    .line 459
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 464
    .line 465
    .line 466
    move-result-object v0

    .line 467
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 468
    .line 469
    .line 470
    return-void

    .line 471
    :cond_11
    move-object v12, v5

    .line 472
    invoke-direct {v1, v2}, Lcom/android/quickstep/TouchInteractionService;->getInputMonitorCompat(I)Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 473
    .line 474
    .line 475
    move-result-object v5

    .line 476
    invoke-direct {v1, v2}, Lcom/android/quickstep/TouchInteractionService;->getInputEventReceiver(I)Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 477
    .line 478
    .line 479
    move-result-object v13

    .line 480
    const/4 v14, 0x0

    .line 481
    if-eqz v11, :cond_14

    .line 482
    .line 483
    if-eqz v4, :cond_12

    .line 484
    .line 485
    goto :goto_5

    .line 486
    :cond_12
    if-eq v11, v9, :cond_13

    .line 487
    .line 488
    if-ne v11, v7, :cond_15

    .line 489
    .line 490
    :cond_13
    iput-object v14, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureStartNavMode:Lcom/android/launcher3/util/C1;

    .line 491
    .line 492
    goto :goto_6

    .line 493
    :cond_14
    :goto_5
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureStartNavMode:Lcom/android/launcher3/util/C1;

    .line 494
    .line 495
    :cond_15
    :goto_6
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 496
    .line 497
    const-string v14, "TIS.onInputEvent"

    .line 498
    .line 499
    invoke-virtual {v0, v14}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;)Lcom/android/launcher3/util/a2;

    .line 500
    .line 501
    .line 502
    move-result-object v17

    .line 503
    if-nez v11, :cond_16

    .line 504
    .line 505
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->newEmptyString()Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    :goto_7
    move-object v14, v0

    .line 510
    goto :goto_8

    .line 511
    :cond_16
    sget-object v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 512
    .line 513
    goto :goto_7

    .line 514
    :goto_8
    if-eqz v11, :cond_21

    .line 515
    .line 516
    if-eqz v4, :cond_17

    .line 517
    .line 518
    goto/16 :goto_c

    .line 519
    .line 520
    :cond_17
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 521
    .line 522
    invoke-interface {v0}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 523
    .line 524
    .line 525
    move-result v0

    .line 526
    if-eq v0, v9, :cond_18

    .line 527
    .line 528
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 529
    .line 530
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->setOrientationTransformIfNeeded(Landroid/view/MotionEvent;)V

    .line 531
    .line 532
    .line 533
    goto :goto_9

    .line 534
    :cond_18
    if-eq v11, v7, :cond_19

    .line 535
    .line 536
    if-ne v11, v9, :cond_1a

    .line 537
    .line 538
    :cond_19
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 539
    .line 540
    invoke-virtual {v0}, Lcom/android/quickstep/RotationTouchHelper;->resetLastRectTouched()V

    .line 541
    .line 542
    .line 543
    :cond_1a
    :goto_9
    iget-boolean v0, v1, Lcom/android/quickstep/TouchInteractionService;->mIsInSwipeUpTouchRegion:Z

    .line 544
    .line 545
    if-eqz v0, :cond_1e

    .line 546
    .line 547
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 548
    .line 549
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isKeyguardShowingOrOccluded()Z

    .line 550
    .line 551
    .line 552
    move-result v0

    .line 553
    if-nez v0, :cond_1e

    .line 554
    .line 555
    if-eq v11, v6, :cond_1b

    .line 556
    .line 557
    if-eq v11, v7, :cond_1b

    .line 558
    .line 559
    if-ne v11, v9, :cond_1e

    .line 560
    .line 561
    :cond_1b
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getX()F

    .line 562
    .line 563
    .line 564
    move-result v0

    .line 565
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mDownPos:Landroid/graphics/PointF;

    .line 566
    .line 567
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 568
    .line 569
    sub-float/2addr v0, v3

    .line 570
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getY()F

    .line 575
    .line 576
    .line 577
    move-result v3

    .line 578
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mDownPos:Landroid/graphics/PointF;

    .line 579
    .line 580
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 581
    .line 582
    sub-float/2addr v3, v4

    .line 583
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 584
    .line 585
    .line 586
    move-result v3

    .line 587
    invoke-static {v0, v3}, Lcom/android/launcher3/N5;->e0(FF)F

    .line 588
    .line 589
    .line 590
    move-result v0

    .line 591
    iget v3, v1, Lcom/android/quickstep/TouchInteractionService;->mTouchSlopSquared:F

    .line 592
    .line 593
    cmpl-float v0, v0, v3

    .line 594
    .line 595
    if-lez v0, :cond_1e

    .line 596
    .line 597
    iget-boolean v0, v1, Lcom/android/quickstep/TouchInteractionService;->mHasToggledMiniWindow:Z

    .line 598
    .line 599
    if-nez v0, :cond_1e

    .line 600
    .line 601
    invoke-static {}, Lx1/O;->T1()Z

    .line 602
    .line 603
    .line 604
    move-result v0

    .line 605
    if-eqz v0, :cond_1e

    .line 606
    .line 607
    invoke-static {}, Lx1/O;->C2()Z

    .line 608
    .line 609
    .line 610
    move-result v0

    .line 611
    if-eqz v0, :cond_1c

    .line 612
    .line 613
    invoke-static {}, Lx1/O;->k1()Z

    .line 614
    .line 615
    .line 616
    move-result v0

    .line 617
    if-eqz v0, :cond_1e

    .line 618
    .line 619
    :cond_1c
    invoke-static {}, Lx1/O;->I2()Z

    .line 620
    .line 621
    .line 622
    move-result v0

    .line 623
    if-eqz v0, :cond_1e

    .line 624
    .line 625
    invoke-static {v1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->y0()Z

    .line 630
    .line 631
    .line 632
    move-result v0

    .line 633
    if-eqz v0, :cond_1d

    .line 634
    .line 635
    invoke-virtual {v1}, Landroid/app/Service;->getBaseContext()Landroid/content/Context;

    .line 636
    .line 637
    .line 638
    move-result-object v0

    .line 639
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 640
    .line 641
    .line 642
    move-result-object v0

    .line 643
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->e0:Z

    .line 644
    .line 645
    if-eqz v0, :cond_1e

    .line 646
    .line 647
    :cond_1d
    invoke-static {v1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 648
    .line 649
    .line 650
    move-result-object v0

    .line 651
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->G0()Z

    .line 652
    .line 653
    .line 654
    move-result v0

    .line 655
    if-eqz v0, :cond_1e

    .line 656
    .line 657
    invoke-static {}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->isEnableFeatureSmallWindowToMini()Z

    .line 658
    .line 659
    .line 660
    move-result v0

    .line 661
    if-eqz v0, :cond_1e

    .line 662
    .line 663
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 664
    .line 665
    new-instance v3, Lcom/android/quickstep/d6;

    .line 666
    .line 667
    invoke-direct {v3, v1}, Lcom/android/quickstep/d6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 668
    .line 669
    .line 670
    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 671
    .line 672
    .line 673
    iput-boolean v9, v1, Lcom/android/quickstep/TouchInteractionService;->mHasToggledMiniWindow:Z

    .line 674
    .line 675
    :cond_1e
    if-eq v11, v7, :cond_20

    .line 676
    .line 677
    if-ne v11, v9, :cond_1f

    .line 678
    .line 679
    goto :goto_b

    .line 680
    :cond_1f
    :goto_a
    move/from16 v18, v2

    .line 681
    .line 682
    move-object/from16 v25, v10

    .line 683
    .line 684
    move/from16 v26, v11

    .line 685
    .line 686
    move-object/from16 v27, v14

    .line 687
    .line 688
    goto/16 :goto_18

    .line 689
    .line 690
    :cond_20
    :goto_b
    invoke-direct {v1, v15}, Lcom/android/quickstep/TouchInteractionService;->getureDataCollection(Landroid/view/MotionEvent;)V

    .line 691
    .line 692
    .line 693
    iput-boolean v8, v1, Lcom/android/quickstep/TouchInteractionService;->mHasToggledMiniWindow:Z

    .line 694
    .line 695
    goto :goto_a

    .line 696
    :cond_21
    :goto_c
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mDownPos:Landroid/graphics/PointF;

    .line 697
    .line 698
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getX()F

    .line 699
    .line 700
    .line 701
    move-result v6

    .line 702
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getY()F

    .line 703
    .line 704
    .line 705
    move-result v7

    .line 706
    invoke-virtual {v0, v6, v7}, Landroid/graphics/PointF;->set(FF)V

    .line 707
    .line 708
    .line 709
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 710
    .line 711
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RotationTouchHelper;->setOrientationTransformIfNeeded(Landroid/view/MotionEvent;)V

    .line 712
    .line 713
    .line 714
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 715
    .line 716
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isOneHandedModeActive()Z

    .line 717
    .line 718
    .line 719
    move-result v0

    .line 720
    iget-object v6, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 721
    .line 722
    invoke-virtual {v6, v15}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    .line 723
    .line 724
    .line 725
    move-result v6

    .line 726
    iget-object v7, v1, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 727
    .line 728
    if-eqz v7, :cond_22

    .line 729
    .line 730
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 731
    .line 732
    .line 733
    move-result-object v7

    .line 734
    goto :goto_d

    .line 735
    :cond_22
    const/4 v7, 0x0

    .line 736
    :goto_d
    if-eqz v7, :cond_23

    .line 737
    .line 738
    invoke-virtual {v7}, Lcom/android/launcher3/taskbar/I1;->q0()Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 739
    .line 740
    .line 741
    move-result-object v19

    .line 742
    goto :goto_e

    .line 743
    :cond_23
    const/16 v19, 0x0

    .line 744
    .line 745
    :goto_e
    if-eqz v19, :cond_24

    .line 746
    .line 747
    invoke-static {v7, v15}, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->isEventOnBubbles(Lcom/android/launcher3/taskbar/I1;Landroid/view/MotionEvent;)Z

    .line 748
    .line 749
    .line 750
    move-result v7

    .line 751
    if-eqz v7, :cond_24

    .line 752
    .line 753
    move v7, v9

    .line 754
    goto :goto_f

    .line 755
    :cond_24
    move v7, v8

    .line 756
    :goto_f
    iput-boolean v6, v1, Lcom/android/quickstep/TouchInteractionService;->mIsInSwipeUpTouchRegion:Z

    .line 757
    .line 758
    iget-object v9, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 759
    .line 760
    invoke-virtual {v9, v15}, Lcom/android/quickstep/RotationTouchHelper;->isInHigherSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    .line 761
    .line 762
    .line 763
    move-result v9

    .line 764
    iput-boolean v9, v1, Lcom/android/quickstep/TouchInteractionService;->mIsInHigherSwipeUpTouchRegion:Z

    .line 765
    .line 766
    if-eqz v6, :cond_26

    .line 767
    .line 768
    sget-object v9, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 769
    .line 770
    invoke-virtual {v9, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 771
    .line 772
    .line 773
    move-result-object v9

    .line 774
    check-cast v9, Lcom/android/quickstep/TopTaskTracker;

    .line 775
    .line 776
    move/from16 v20, v0

    .line 777
    .line 778
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 779
    .line 780
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 781
    .line 782
    .line 783
    move-result v0

    .line 784
    invoke-virtual {v9, v8, v0}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 785
    .line 786
    .line 787
    move-result-object v0

    .line 788
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getTopTask()Landroid/app/TaskInfo;

    .line 789
    .line 790
    .line 791
    move-result-object v9

    .line 792
    invoke-static {}, Lx1/O;->A1()Z

    .line 793
    .line 794
    .line 795
    move-result v21

    .line 796
    if-eqz v21, :cond_25

    .line 797
    .line 798
    new-instance v8, Ljava/lang/StringBuilder;

    .line 799
    .line 800
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 801
    .line 802
    .line 803
    move-object/from16 p1, v0

    .line 804
    .line 805
    const-string v0, "TouchInteractionService.onInputEvent, getRunningTask end. topTask = "

    .line 806
    .line 807
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 808
    .line 809
    .line 810
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 811
    .line 812
    .line 813
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 814
    .line 815
    .line 816
    move-result-object v0

    .line 817
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 818
    .line 819
    .line 820
    goto :goto_10

    .line 821
    :cond_25
    move-object/from16 p1, v0

    .line 822
    .line 823
    :goto_10
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 824
    .line 825
    invoke-virtual {v0, v9}, Lcom/android/quickstep/RecentsAnimationDeviceState;->updateTopActivity(Landroid/app/TaskInfo;)V

    .line 826
    .line 827
    .line 828
    move-object/from16 v0, p1

    .line 829
    .line 830
    goto :goto_11

    .line 831
    :cond_26
    move/from16 v20, v0

    .line 832
    .line 833
    const/4 v0, 0x0

    .line 834
    :goto_11
    if-eqz v6, :cond_27

    .line 835
    .line 836
    iget-object v8, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 837
    .line 838
    invoke-virtual {v8}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifNeedIgnoreGestureFullScreen()Z

    .line 839
    .line 840
    .line 841
    move-result v8

    .line 842
    if-eqz v8, :cond_27

    .line 843
    .line 844
    const-string v0, "ignore event by rq"

    .line 845
    .line 846
    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 847
    .line 848
    .line 849
    iget-boolean v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUserUnlocked:Z

    .line 850
    .line 851
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 852
    .line 853
    invoke-virtual {v3, v2}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 854
    .line 855
    .line 856
    move-result-object v3

    .line 857
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 858
    .line 859
    sget-object v5, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 860
    .line 861
    invoke-static {v2, v0, v3, v4, v5}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    .line 862
    .line 863
    .line 864
    move-result-object v0

    .line 865
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 866
    .line 867
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 868
    .line 869
    .line 870
    move-result-object v0

    .line 871
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 872
    .line 873
    .line 874
    move-result v0

    .line 875
    if-eqz v0, :cond_1f

    .line 876
    .line 877
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 878
    .line 879
    .line 880
    move-result v0

    .line 881
    if-nez v0, :cond_1f

    .line 882
    .line 883
    if-eqz v6, :cond_1f

    .line 884
    .line 885
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 886
    .line 887
    .line 888
    move-result-object v0

    .line 889
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 890
    .line 891
    .line 892
    move-result-object v0

    .line 893
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 894
    .line 895
    .line 896
    goto/16 :goto_a

    .line 897
    .line 898
    :cond_27
    invoke-static {v1}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 899
    .line 900
    .line 901
    move-result-object v8

    .line 902
    invoke-virtual {v8}, Lcom/android/launcher3/util/n1;->i()Z

    .line 903
    .line 904
    .line 905
    move-result v8

    .line 906
    if-eqz v8, :cond_29

    .line 907
    .line 908
    iget-object v8, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 909
    .line 910
    invoke-virtual {v8}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 911
    .line 912
    .line 913
    move-result v8

    .line 914
    if-eqz v8, :cond_29

    .line 915
    .line 916
    iget-object v8, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 917
    .line 918
    const-string v9, "com.android.systemui/com.zte.feature.fullscreen_gesture_try.GestureAttemptActivity"

    .line 919
    .line 920
    invoke-static {v9}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 921
    .line 922
    .line 923
    move-result-object v9

    .line 924
    filled-new-array {v9}, [Landroid/content/ComponentName;

    .line 925
    .line 926
    .line 927
    move-result-object v9

    .line 928
    invoke-virtual {v8, v9}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isSpecifiedActivityOnTop([Landroid/content/ComponentName;)Z

    .line 929
    .line 930
    .line 931
    move-result v8

    .line 932
    if-eqz v8, :cond_29

    .line 933
    .line 934
    if-eqz v6, :cond_28

    .line 935
    .line 936
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 937
    .line 938
    invoke-virtual {v3}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 939
    .line 940
    .line 941
    move-result v3

    .line 942
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 943
    .line 944
    invoke-static {v15}, Lcom/android/quickstep/GestureState$TrackpadGestureType;->getTrackpadGestureType(Landroid/view/MotionEvent;)Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 945
    .line 946
    .line 947
    move-result-object v5

    .line 948
    invoke-virtual {v1, v3, v4, v5, v0}, Lcom/android/quickstep/TouchInteractionService;->createGestureState(ILcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState$TrackpadGestureType;Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Lcom/android/quickstep/GestureState;

    .line 949
    .line 950
    .line 951
    move-result-object v0

    .line 952
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 953
    .line 954
    invoke-interface {v3}, Lcom/android/quickstep/InputConsumer;->onConsumerAboutToBeSwitched()V

    .line 955
    .line 956
    .line 957
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 958
    .line 959
    invoke-direct {v1, v0, v15}, Lcom/android/quickstep/TouchInteractionService;->createGestureCourseInputConsumer(Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;)Lcom/android/quickstep/InputConsumer;

    .line 960
    .line 961
    .line 962
    move-result-object v0

    .line 963
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 964
    .line 965
    sget-object v0, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 966
    .line 967
    new-instance v3, Ljava/lang/StringBuilder;

    .line 968
    .line 969
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 970
    .line 971
    .line 972
    const-string v4, "setInputConsumer: "

    .line 973
    .line 974
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 975
    .line 976
    .line 977
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 978
    .line 979
    invoke-interface {v4}, Lcom/android/quickstep/InputConsumer;->getName()Ljava/lang/String;

    .line 980
    .line 981
    .line 982
    move-result-object v4

    .line 983
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 984
    .line 985
    .line 986
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 987
    .line 988
    .line 989
    move-result-object v3

    .line 990
    invoke-virtual {v0, v3}, Lcom/android/quickstep/util/ActiveGestureLog;->addLog(Ljava/lang/String;)V

    .line 991
    .line 992
    .line 993
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 994
    .line 995
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 996
    .line 997
    const/4 v8, 0x1

    .line 998
    goto :goto_12

    .line 999
    :cond_28
    invoke-static {}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getGestureState()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 1000
    .line 1001
    .line 1002
    move-result-object v0

    .line 1003
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 1004
    .line 1005
    .line 1006
    move-result-object v3

    .line 1007
    const/4 v8, 0x1

    .line 1008
    invoke-virtual {v0, v3, v8}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 1009
    .line 1010
    .line 1011
    iget-boolean v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUserUnlocked:Z

    .line 1012
    .line 1013
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 1014
    .line 1015
    invoke-virtual {v3, v2}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 1016
    .line 1017
    .line 1018
    move-result-object v3

    .line 1019
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 1020
    .line 1021
    sget-object v5, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 1022
    .line 1023
    invoke-static {v2, v0, v3, v4, v5}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    .line 1024
    .line 1025
    .line 1026
    move-result-object v0

    .line 1027
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1028
    .line 1029
    :goto_12
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v0

    .line 1033
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1034
    .line 1035
    .line 1036
    move-result v0

    .line 1037
    if-eqz v0, :cond_1f

    .line 1038
    .line 1039
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 1040
    .line 1041
    .line 1042
    move-result v0

    .line 1043
    if-nez v0, :cond_1f

    .line 1044
    .line 1045
    if-eqz v6, :cond_1f

    .line 1046
    .line 1047
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v0

    .line 1051
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v0

    .line 1055
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 1056
    .line 1057
    .line 1058
    goto/16 :goto_a

    .line 1059
    .line 1060
    :cond_29
    const/4 v8, 0x1

    .line 1061
    iget-object v9, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1062
    .line 1063
    invoke-virtual {v9}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isButtonNavMode()Z

    .line 1064
    .line 1065
    .line 1066
    move-result v9

    .line 1067
    if-eqz v9, :cond_2b

    .line 1068
    .line 1069
    iget-object v9, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1070
    .line 1071
    invoke-virtual {v9}, Lcom/android/quickstep/RecentsAnimationDeviceState;->supportsAssistantGestureInButtonNav()Z

    .line 1072
    .line 1073
    .line 1074
    move-result v9

    .line 1075
    if-eqz v9, :cond_2b

    .line 1076
    .line 1077
    const-string v3, "in three button mode which supports Assistant gesture"

    .line 1078
    .line 1079
    const/4 v4, 0x0

    .line 1080
    new-array v6, v4, [Ljava/lang/Object;

    .line 1081
    .line 1082
    invoke-virtual {v14, v3, v6}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 1083
    .line 1084
    .line 1085
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1086
    .line 1087
    invoke-virtual {v3, v15}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canTriggerAssistantAction(Landroid/view/MotionEvent;)Z

    .line 1088
    .line 1089
    .line 1090
    move-result v3

    .line 1091
    if-eqz v3, :cond_2a

    .line 1092
    .line 1093
    const-string v3, " and event can trigger assistant action, consuming gesture for assistant action"

    .line 1094
    .line 1095
    new-array v6, v4, [Ljava/lang/Object;

    .line 1096
    .line 1097
    invoke-virtual {v14, v3, v6}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 1098
    .line 1099
    .line 1100
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1101
    .line 1102
    invoke-static {v15}, Lcom/android/quickstep/GestureState$TrackpadGestureType;->getTrackpadGestureType(Landroid/view/MotionEvent;)Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v6

    .line 1106
    invoke-virtual {v1, v2, v3, v6, v0}, Lcom/android/quickstep/TouchInteractionService;->createGestureState(ILcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState$TrackpadGestureType;Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Lcom/android/quickstep/GestureState;

    .line 1107
    .line 1108
    .line 1109
    move-result-object v0

    .line 1110
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1111
    .line 1112
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1113
    .line 1114
    invoke-static {v1, v3, v5, v0, v15}, Lcom/android/quickstep/InputConsumerUtils;->tryCreateAssistantInputConsumer(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;)Lcom/android/quickstep/InputConsumer;

    .line 1115
    .line 1116
    .line 1117
    move-result-object v0

    .line 1118
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1119
    .line 1120
    goto/16 :goto_a

    .line 1121
    .line 1122
    :cond_2a
    const-string v0, " but event cannot trigger Assistant, consuming gesture as no-op"

    .line 1123
    .line 1124
    new-array v3, v4, [Ljava/lang/Object;

    .line 1125
    .line 1126
    invoke-virtual {v14, v0, v3}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 1127
    .line 1128
    .line 1129
    invoke-static {v2}, Lcom/android/quickstep/InputConsumer;->createNoOpInputConsumer(I)Lcom/android/quickstep/InputConsumer;

    .line 1130
    .line 1131
    .line 1132
    move-result-object v0

    .line 1133
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1134
    .line 1135
    goto/16 :goto_a

    .line 1136
    .line 1137
    :cond_2b
    if-nez v20, :cond_2d

    .line 1138
    .line 1139
    if-eqz v6, :cond_2d

    .line 1140
    .line 1141
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 1142
    .line 1143
    .line 1144
    move-result-object v9

    .line 1145
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1146
    .line 1147
    .line 1148
    move-result v9

    .line 1149
    if-eqz v9, :cond_2c

    .line 1150
    .line 1151
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 1152
    .line 1153
    .line 1154
    move-result-object v9

    .line 1155
    invoke-static {v9}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 1156
    .line 1157
    .line 1158
    move-result-object v9

    .line 1159
    invoke-virtual {v9}, Lcom/android/quickstep/util/InputInjectHelper;->getLandscape()Z

    .line 1160
    .line 1161
    .line 1162
    move-result v9

    .line 1163
    if-eqz v9, :cond_33

    .line 1164
    .line 1165
    :cond_2c
    invoke-static {}, Lx1/O;->B2()Z

    .line 1166
    .line 1167
    .line 1168
    move-result v9

    .line 1169
    if-nez v9, :cond_33

    .line 1170
    .line 1171
    iget-object v9, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 1172
    .line 1173
    invoke-virtual {v9, v15}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegionWitYOffset(Landroid/view/MotionEvent;)Z

    .line 1174
    .line 1175
    .line 1176
    move-result v9

    .line 1177
    if-nez v9, :cond_33

    .line 1178
    .line 1179
    iget-object v9, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1180
    .line 1181
    invoke-virtual {v9}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isTopActivityWeChat()Z

    .line 1182
    .line 1183
    .line 1184
    move-result v9

    .line 1185
    if-eqz v9, :cond_33

    .line 1186
    .line 1187
    :cond_2d
    if-nez v4, :cond_33

    .line 1188
    .line 1189
    if-eqz v7, :cond_2e

    .line 1190
    .line 1191
    goto/16 :goto_15

    .line 1192
    .line 1193
    :cond_2e
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1194
    .line 1195
    invoke-virtual {v3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 1196
    .line 1197
    .line 1198
    move-result v3

    .line 1199
    if-nez v3, :cond_2f

    .line 1200
    .line 1201
    invoke-static {v15}, Lcom/android/launcher3/H4;->c(Landroid/view/MotionEvent;)Z

    .line 1202
    .line 1203
    .line 1204
    move-result v3

    .line 1205
    if-eqz v3, :cond_31

    .line 1206
    .line 1207
    :cond_2f
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1208
    .line 1209
    invoke-virtual {v3, v15}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canTriggerAssistantAction(Landroid/view/MotionEvent;)Z

    .line 1210
    .line 1211
    .line 1212
    move-result v3

    .line 1213
    if-eqz v3, :cond_31

    .line 1214
    .line 1215
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1216
    .line 1217
    invoke-virtual {v3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 1218
    .line 1219
    .line 1220
    move-result v3

    .line 1221
    if-eqz v3, :cond_30

    .line 1222
    .line 1223
    const-string v3, "using fully gestural nav and event can trigger assistant action, consuming gesture for assistant action"

    .line 1224
    .line 1225
    :goto_13
    const/4 v4, 0x0

    .line 1226
    goto :goto_14

    .line 1227
    :cond_30
    const-string v3, "event is a trackpad multi-finger swipe and event can trigger assistant action, consuming gesture for assistant action"

    .line 1228
    .line 1229
    goto :goto_13

    .line 1230
    :goto_14
    new-array v7, v4, [Ljava/lang/Object;

    .line 1231
    .line 1232
    invoke-virtual {v14, v3, v7}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 1233
    .line 1234
    .line 1235
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1236
    .line 1237
    invoke-static {v15}, Lcom/android/quickstep/GestureState$TrackpadGestureType;->getTrackpadGestureType(Landroid/view/MotionEvent;)Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 1238
    .line 1239
    .line 1240
    move-result-object v4

    .line 1241
    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/android/quickstep/TouchInteractionService;->createGestureState(ILcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState$TrackpadGestureType;Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Lcom/android/quickstep/GestureState;

    .line 1242
    .line 1243
    .line 1244
    move-result-object v0

    .line 1245
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1246
    .line 1247
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1248
    .line 1249
    invoke-static {v1, v3, v5, v0, v15}, Lcom/android/quickstep/InputConsumerUtils;->tryCreateAssistantInputConsumer(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;)Lcom/android/quickstep/InputConsumer;

    .line 1250
    .line 1251
    .line 1252
    move-result-object v0

    .line 1253
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1254
    .line 1255
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 1256
    .line 1257
    .line 1258
    move-result-object v0

    .line 1259
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1260
    .line 1261
    .line 1262
    move-result v0

    .line 1263
    if-eqz v0, :cond_1f

    .line 1264
    .line 1265
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 1266
    .line 1267
    .line 1268
    move-result v0

    .line 1269
    if-nez v0, :cond_1f

    .line 1270
    .line 1271
    if-eqz v6, :cond_1f

    .line 1272
    .line 1273
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 1274
    .line 1275
    .line 1276
    move-result-object v0

    .line 1277
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 1278
    .line 1279
    .line 1280
    move-result-object v0

    .line 1281
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 1282
    .line 1283
    .line 1284
    goto/16 :goto_a

    .line 1285
    .line 1286
    :cond_31
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1287
    .line 1288
    invoke-virtual {v0, v15}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canTriggerOneHandedAction(Landroid/view/MotionEvent;)Z

    .line 1289
    .line 1290
    .line 1291
    move-result v0

    .line 1292
    if-eqz v0, :cond_32

    .line 1293
    .line 1294
    const-string v0, "event can trigger one-handed action, consuming gesture for one-handed action"

    .line 1295
    .line 1296
    const/4 v4, 0x0

    .line 1297
    new-array v3, v4, [Ljava/lang/Object;

    .line 1298
    .line 1299
    invoke-virtual {v14, v0, v3}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 1300
    .line 1301
    .line 1302
    new-instance v0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;

    .line 1303
    .line 1304
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1305
    .line 1306
    invoke-static {v2}, Lcom/android/quickstep/InputConsumer;->createNoOpInputConsumer(I)Lcom/android/quickstep/InputConsumer;

    .line 1307
    .line 1308
    .line 1309
    move-result-object v4

    .line 1310
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;-><init>(Landroid/content/Context;ILcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    .line 1311
    .line 1312
    .line 1313
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1314
    .line 1315
    goto/16 :goto_a

    .line 1316
    .line 1317
    :cond_32
    invoke-static {v2}, Lcom/android/quickstep/InputConsumer;->createNoOpInputConsumer(I)Lcom/android/quickstep/InputConsumer;

    .line 1318
    .line 1319
    .line 1320
    move-result-object v0

    .line 1321
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1322
    .line 1323
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 1324
    .line 1325
    .line 1326
    move-result-object v0

    .line 1327
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1328
    .line 1329
    .line 1330
    move-result v0

    .line 1331
    if-eqz v0, :cond_1f

    .line 1332
    .line 1333
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 1334
    .line 1335
    .line 1336
    move-result v0

    .line 1337
    if-nez v0, :cond_1f

    .line 1338
    .line 1339
    if-eqz v6, :cond_1f

    .line 1340
    .line 1341
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 1342
    .line 1343
    .line 1344
    move-result-object v0

    .line 1345
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 1346
    .line 1347
    .line 1348
    move-result-object v0

    .line 1349
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 1350
    .line 1351
    .line 1352
    goto/16 :goto_a

    .line 1353
    .line 1354
    :cond_33
    :goto_15
    if-nez v20, :cond_34

    .line 1355
    .line 1356
    if-eqz v6, :cond_34

    .line 1357
    .line 1358
    const-string v4, "one handed mode is not active and event is in swipe up region, creating new input consumer"

    .line 1359
    .line 1360
    :goto_16
    const/4 v6, 0x0

    .line 1361
    goto :goto_17

    .line 1362
    :cond_34
    const-string v4, "isHoverActionWithoutConsumer == true, creating new input consumer"

    .line 1363
    .line 1364
    goto :goto_16

    .line 1365
    :goto_17
    new-array v7, v6, [Ljava/lang/Object;

    .line 1366
    .line 1367
    invoke-virtual {v14, v4, v7}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 1368
    .line 1369
    .line 1370
    move/from16 v19, v8

    .line 1371
    .line 1372
    move-object v8, v5

    .line 1373
    new-instance v5, Lcom/android/quickstep/GestureState;

    .line 1374
    .line 1375
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1376
    .line 1377
    invoke-direct {v5, v4}, Lcom/android/quickstep/GestureState;-><init>(Lcom/android/quickstep/GestureState;)V

    .line 1378
    .line 1379
    .line 1380
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1381
    .line 1382
    invoke-static {v15}, Lcom/android/quickstep/GestureState$TrackpadGestureType;->getTrackpadGestureType(Landroid/view/MotionEvent;)Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 1383
    .line 1384
    .line 1385
    move-result-object v7

    .line 1386
    invoke-virtual {v1, v2, v4, v7, v0}, Lcom/android/quickstep/TouchInteractionService;->createGestureState(ILcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState$TrackpadGestureType;Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Lcom/android/quickstep/GestureState;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v0

    .line 1390
    invoke-direct {v1, v0, v5}, Lcom/android/quickstep/TouchInteractionService;->inheritLastRecentParams(Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;)Z

    .line 1391
    .line 1392
    .line 1393
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1394
    .line 1395
    invoke-interface {v4}, Lcom/android/quickstep/InputConsumer;->onConsumerAboutToBeSwitched()V

    .line 1396
    .line 1397
    .line 1398
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1399
    .line 1400
    iget-boolean v4, v1, Lcom/android/quickstep/TouchInteractionService;->mUserUnlocked:Z

    .line 1401
    .line 1402
    move-object v7, v3

    .line 1403
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 1404
    .line 1405
    move v9, v4

    .line 1406
    iget-object v4, v1, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 1407
    .line 1408
    move/from16 v20, v9

    .line 1409
    .line 1410
    invoke-virtual {v1, v2}, Lcom/android/quickstep/TouchInteractionService;->getSwipeUpHandlerFactory(I)Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 1411
    .line 1412
    .line 1413
    move-result-object v9

    .line 1414
    move-object/from16 v21, v10

    .line 1415
    .line 1416
    new-instance v10, Lcom/android/quickstep/c6;

    .line 1417
    .line 1418
    invoke-direct {v10, v1}, Lcom/android/quickstep/c6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 1419
    .line 1420
    .line 1421
    move-object/from16 v22, v7

    .line 1422
    .line 1423
    move-object v7, v12

    .line 1424
    iget-object v12, v1, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 1425
    .line 1426
    move/from16 v23, v11

    .line 1427
    .line 1428
    move-object v11, v13

    .line 1429
    iget-object v13, v1, Lcom/android/quickstep/TouchInteractionService;->mSwipeUpProxyProvider:Ljava/util/function/Function;

    .line 1430
    .line 1431
    move-object/from16 v24, v14

    .line 1432
    .line 1433
    iget-object v14, v1, Lcom/android/quickstep/TouchInteractionService;->mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

    .line 1434
    .line 1435
    iget-object v6, v1, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 1436
    .line 1437
    move/from16 v18, v2

    .line 1438
    .line 1439
    move-object/from16 v16, v6

    .line 1440
    .line 1441
    move/from16 v2, v20

    .line 1442
    .line 1443
    move-object/from16 v25, v21

    .line 1444
    .line 1445
    move/from16 v26, v23

    .line 1446
    .line 1447
    move-object/from16 v27, v24

    .line 1448
    .line 1449
    move-object v6, v0

    .line 1450
    move-object/from16 v0, v22

    .line 1451
    .line 1452
    invoke-static/range {v1 .. v16}, Lcom/android/quickstep/InputConsumerUtils;->newConsumer(Landroid/content/Context;ZLcom/android/quickstep/OverviewComponentObserver;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/AbsSwipeUpHandler$Factory;Ljava/util/function/Consumer;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;Lcom/android/launcher3/taskbar/g3;Ljava/util/function/Function;Lcom/android/quickstep/OverviewCommandHelper;Landroid/view/MotionEvent;Lcom/android/quickstep/RotationTouchHelper;)Lcom/android/quickstep/InputConsumer;

    .line 1453
    .line 1454
    .line 1455
    move-result-object v2

    .line 1456
    iput-object v2, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1457
    .line 1458
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1459
    .line 1460
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1461
    .line 1462
    .line 1463
    const-string v3, "onInputEvent: mConsumer="

    .line 1464
    .line 1465
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1466
    .line 1467
    .line 1468
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1469
    .line 1470
    invoke-interface {v3}, Lcom/android/quickstep/InputConsumer;->getActiveConsumerInHierarchy()Lcom/android/quickstep/InputConsumer;

    .line 1471
    .line 1472
    .line 1473
    move-result-object v3

    .line 1474
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1475
    .line 1476
    .line 1477
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1478
    .line 1479
    .line 1480
    move-result-object v2

    .line 1481
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1482
    .line 1483
    .line 1484
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1485
    .line 1486
    iput-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1487
    .line 1488
    :goto_18
    iget-object v0, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1489
    .line 1490
    invoke-interface {v0}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 1491
    .line 1492
    .line 1493
    move-result v0

    .line 1494
    const/4 v8, 0x1

    .line 1495
    if-eq v0, v8, :cond_38

    .line 1496
    .line 1497
    move/from16 v0, v26

    .line 1498
    .line 1499
    if-eqz v0, :cond_37

    .line 1500
    .line 1501
    if-eq v0, v8, :cond_36

    .line 1502
    .line 1503
    const/4 v2, 0x2

    .line 1504
    if-eq v0, v2, :cond_35

    .line 1505
    .line 1506
    invoke-static {v0}, Landroid/view/MotionEvent;->actionToString(I)Ljava/lang/String;

    .line 1507
    .line 1508
    .line 1509
    move-result-object v2

    .line 1510
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getClassification()I

    .line 1511
    .line 1512
    .line 1513
    move-result v3

    .line 1514
    invoke-static {v3}, Landroid/view/MotionEvent;->classificationToString(I)Ljava/lang/String;

    .line 1515
    .line 1516
    .line 1517
    move-result-object v3

    .line 1518
    move/from16 v4, v18

    .line 1519
    .line 1520
    invoke-static {v2, v3, v4}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnInputEventGenericAction(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1521
    .line 1522
    .line 1523
    goto :goto_1a

    .line 1524
    :cond_35
    move/from16 v4, v18

    .line 1525
    .line 1526
    invoke-static {v0}, Landroid/view/MotionEvent;->actionToString(I)Ljava/lang/String;

    .line 1527
    .line 1528
    .line 1529
    move-result-object v2

    .line 1530
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getClassification()I

    .line 1531
    .line 1532
    .line 1533
    move-result v3

    .line 1534
    invoke-static {v3}, Landroid/view/MotionEvent;->classificationToString(I)Ljava/lang/String;

    .line 1535
    .line 1536
    .line 1537
    move-result-object v3

    .line 1538
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 1539
    .line 1540
    .line 1541
    move-result v5

    .line 1542
    invoke-static {v2, v3, v5, v4}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnInputEventActionMove(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1543
    .line 1544
    .line 1545
    goto :goto_1a

    .line 1546
    :cond_36
    move/from16 v4, v18

    .line 1547
    .line 1548
    goto :goto_19

    .line 1549
    :cond_37
    move/from16 v4, v18

    .line 1550
    .line 1551
    move-object/from16 v2, v27

    .line 1552
    .line 1553
    invoke-static {v4, v2}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnInputEventActionDown(ILcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 1554
    .line 1555
    .line 1556
    :goto_19
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getRawX()F

    .line 1557
    .line 1558
    .line 1559
    move-result v2

    .line 1560
    float-to-int v2, v2

    .line 1561
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getRawY()F

    .line 1562
    .line 1563
    .line 1564
    move-result v3

    .line 1565
    float-to-int v3, v3

    .line 1566
    invoke-virtual {v15}, Landroid/view/MotionEvent;->getClassification()I

    .line 1567
    .line 1568
    .line 1569
    move-result v5

    .line 1570
    invoke-static {v5}, Landroid/view/MotionEvent;->classificationToString(I)Ljava/lang/String;

    .line 1571
    .line 1572
    .line 1573
    move-result-object v5

    .line 1574
    invoke-static {v2, v3, v0, v5, v4}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnInputEventActionUp(IIILjava/lang/String;I)V

    .line 1575
    .line 1576
    .line 1577
    goto :goto_1a

    .line 1578
    :cond_38
    move/from16 v4, v18

    .line 1579
    .line 1580
    move/from16 v0, v26

    .line 1581
    .line 1582
    :goto_1a
    iget-object v2, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1583
    .line 1584
    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 1585
    .line 1586
    .line 1587
    move-result-object v2

    .line 1588
    if-eqz v2, :cond_39

    .line 1589
    .line 1590
    iget-object v2, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1591
    .line 1592
    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 1593
    .line 1594
    .line 1595
    move-result-object v2

    .line 1596
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->shouldCancelCurrentGesture()Z

    .line 1597
    .line 1598
    .line 1599
    move-result v2

    .line 1600
    if-eqz v2, :cond_39

    .line 1601
    .line 1602
    const/4 v8, 0x1

    .line 1603
    :goto_1b
    const/4 v2, 0x1

    .line 1604
    goto :goto_1c

    .line 1605
    :cond_39
    const/4 v8, 0x0

    .line 1606
    goto :goto_1b

    .line 1607
    :goto_1c
    if-eq v0, v2, :cond_3a

    .line 1608
    .line 1609
    const/4 v2, 0x3

    .line 1610
    if-eq v0, v2, :cond_3b

    .line 1611
    .line 1612
    if-eqz v8, :cond_3c

    .line 1613
    .line 1614
    goto :goto_1d

    .line 1615
    :cond_3a
    const/4 v2, 0x3

    .line 1616
    :cond_3b
    :goto_1d
    iget-object v3, v1, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1617
    .line 1618
    if-eqz v3, :cond_3c

    .line 1619
    .line 1620
    invoke-interface {v3}, Lcom/android/quickstep/InputConsumer;->getActiveConsumerInHierarchy()Lcom/android/quickstep/InputConsumer;

    .line 1621
    .line 1622
    .line 1623
    move-result-object v3

    .line 1624
    invoke-interface {v3}, Lcom/android/quickstep/InputConsumer;->isConsumerDetachedFromGesture()Z

    .line 1625
    .line 1626
    .line 1627
    move-result v3

    .line 1628
    if-nez v3, :cond_3c

    .line 1629
    .line 1630
    const/4 v3, 0x1

    .line 1631
    goto :goto_1e

    .line 1632
    :cond_3c
    const/4 v3, 0x0

    .line 1633
    :goto_1e
    if-eqz v8, :cond_3d

    .line 1634
    .line 1635
    invoke-virtual {v15, v2}, Landroid/view/MotionEvent;->setAction(I)V

    .line 1636
    .line 1637
    .line 1638
    :cond_3d
    iget-object v2, v1, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 1639
    .line 1640
    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 1641
    .line 1642
    .line 1643
    move-result v2

    .line 1644
    if-eqz v2, :cond_3e

    .line 1645
    .line 1646
    const/4 v2, 0x5

    .line 1647
    if-eq v0, v2, :cond_40

    .line 1648
    .line 1649
    const/4 v2, 0x6

    .line 1650
    if-ne v0, v2, :cond_3e

    .line 1651
    .line 1652
    goto :goto_1f

    .line 1653
    :cond_3e
    invoke-direct {v1, v15}, Lcom/android/quickstep/TouchInteractionService;->isCursorHoverEvent(Landroid/view/MotionEvent;)Z

    .line 1654
    .line 1655
    .line 1656
    move-result v2

    .line 1657
    if-eqz v2, :cond_3f

    .line 1658
    .line 1659
    iget-object v2, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1660
    .line 1661
    invoke-interface {v2, v15}, Lcom/android/quickstep/InputConsumer;->onHoverEvent(Landroid/view/MotionEvent;)V

    .line 1662
    .line 1663
    .line 1664
    goto :goto_1f

    .line 1665
    :cond_3f
    iget-object v2, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1666
    .line 1667
    invoke-interface {v2, v15}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 1668
    .line 1669
    .line 1670
    :cond_40
    :goto_1f
    if-eqz v3, :cond_41

    .line 1671
    .line 1672
    invoke-direct {v1, v4}, Lcom/android/quickstep/TouchInteractionService;->reset(I)V

    .line 1673
    .line 1674
    .line 1675
    :cond_41
    invoke-interface/range {v17 .. v17}, Lcom/android/launcher3/util/a2;->close()V

    .line 1676
    .line 1677
    .line 1678
    if-nez v0, :cond_43

    .line 1679
    .line 1680
    iget-object v2, v1, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 1681
    .line 1682
    invoke-interface {v2}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 1683
    .line 1684
    .line 1685
    move-result v2

    .line 1686
    const/16 v19, 0x2

    .line 1687
    .line 1688
    and-int/lit8 v2, v2, 0x2

    .line 1689
    .line 1690
    if-eqz v2, :cond_42

    .line 1691
    .line 1692
    iget-object v2, v1, Lcom/android/quickstep/TouchInteractionService;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 1693
    .line 1694
    if-eqz v2, :cond_42

    .line 1695
    .line 1696
    const/4 v4, 0x0

    .line 1697
    invoke-virtual {v2, v4}, Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;->setBatchingEnabled(Z)V

    .line 1698
    .line 1699
    .line 1700
    :cond_42
    const-string v2, "TouchInteractionService.onInputEvent Finish"

    .line 1701
    .line 1702
    move-object/from16 v3, v25

    .line 1703
    .line 1704
    invoke-static {v3, v2, v15}, Lcom/android/launcher3/testing/K;->e(Ljava/lang/String;Ljava/lang/String;Landroid/view/MotionEvent;)V

    .line 1705
    .line 1706
    .line 1707
    :cond_43
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 1708
    .line 1709
    .line 1710
    move-result-object v2

    .line 1711
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1712
    .line 1713
    .line 1714
    move-result v2

    .line 1715
    if-eqz v2, :cond_44

    .line 1716
    .line 1717
    const/4 v8, 0x1

    .line 1718
    if-ne v0, v8, :cond_44

    .line 1719
    .line 1720
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 1721
    .line 1722
    .line 1723
    move-result-object v0

    .line 1724
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 1725
    .line 1726
    .line 1727
    move-result-object v0

    .line 1728
    invoke-virtual {v0, v15}, Lcom/android/quickstep/util/InputInjectHelper;->injectUpImmediatelyOrNot(Landroid/view/MotionEvent;)V

    .line 1729
    .line 1730
    .line 1731
    :cond_44
    :goto_20
    return-void
.end method

.method private onNavigationModeChanged()V
    .locals 2

    .line 1
    const-string v0, "TouchInteractionService"

    .line 2
    .line 3
    const-string v1, "onNavigationModeChanged: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const-string v0, "onNavigationModeChanged()"

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService;->initInputMonitor(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->resetHomeBounceSeenOnQuickstepEnabledFirstTime()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isButtonNavMode()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/android/quickstep/InputConsumer;->getActiveConsumerInHierarchy()Lcom/android/quickstep/InputConsumer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    instance-of v0, v0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 37
    .line 38
    invoke-interface {p0}, Lcom/android/quickstep/InputConsumer;->onConsumerAboutToBeSwitched()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method private onOverviewTargetChanged(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mAllAppsActionManager:Lcom/android/quickstep/AllAppsActionManager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/AllAppsActionManager;->setHomeAndOverviewSame(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    instance-of v0, p1, Lcom/android/launcher3/statemanager/h;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    check-cast p1, Lcom/android/launcher3/statemanager/h;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->N0(Lcom/android/launcher3/statemanager/h;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->O0(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method private onSystemUiFlagsChanged(JI)V
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 12
    .line 13
    invoke-virtual {v0, p3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateFlags(I)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 18
    .line 19
    const-string v3, "TouchInteractionService"

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    const-string v2, "onSystemUiFlagsChanged: taskbar manager is null."

    .line 24
    .line 25
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v2, v0, v1, p3}, Lcom/android/launcher3/taskbar/g3;->A0(JI)V

    .line 30
    .line 31
    .line 32
    :goto_0
    if-nez p3, :cond_2

    .line 33
    .line 34
    sget-object v2, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 35
    .line 36
    invoke-virtual {v2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/android/quickstep/SystemUiProxy;

    .line 41
    .line 42
    invoke-virtual {v2, v0, v1}, Lcom/android/quickstep/SystemUiProxy;->setLastSystemUiStateFlags(J)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 46
    .line 47
    if-nez v2, :cond_1

    .line 48
    .line 49
    const-string v2, "onSystemUiFlagsChanged:  mOverviewComponentObserver is null."

    .line 50
    .line 51
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v3, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 56
    .line 57
    invoke-virtual {v3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isHomeDisabled()Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {v2, v3}, Lcom/android/quickstep/OverviewComponentObserver;->setHomeDisabled(Z)V

    .line 62
    .line 63
    .line 64
    :goto_1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 65
    .line 66
    invoke-virtual {p0, p3}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->onSystemUiFlagsChanged(JJ)V

    .line 73
    .line 74
    .line 75
    :cond_2
    return-void
.end method

.method static bridge synthetic p(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewCommandHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic q(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewComponentObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic r(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RotationTouchHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method private reInitAfteronUserUnlocked()V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lx1/O;->T3(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/n1;->n(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private registerAngleSensorListener()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mSensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mAngleSensor:Landroid/hardware/Sensor;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mAngleListener:Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mAngleSensorHandler:Landroid/os/Handler;

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1, v3, p0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    :goto_0
    const-string p0, "TouchInteractionService"

    .line 20
    .line 21
    const-string v0, "registerAngleSensorListener: Can\'t find sensor manager or angle sensor!!"

    .line 22
    .line 23
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private reset(I)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/TouchInteractionService;->mUserUnlocked:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 10
    .line 11
    sget-object v3, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 12
    .line 13
    invoke-static {p1, v0, v1, v2, v3}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mUncheckedConsumer:Lcom/android/quickstep/InputConsumer;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 20
    .line 21
    sget-object v0, Lcom/android/quickstep/GestureState;->DEFAULT_STATE:Lcom/android/quickstep/GestureState;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->getInputEventReceiver(I)Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;->setBatchingEnabled(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private resetHomeBounceSeenOnQuickstepEnabledFirstTime()V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isButtonNavMode()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget-object v0, Lcom/android/quickstep/TouchInteractionService;->HAS_ENABLED_QUICKSTEP_ONCE:Lcom/android/launcher3/X;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget-object v1, Lcom/android/launcher3/util/H1;->f:Lcom/android/launcher3/X;

    .line 45
    .line 46
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    filled-new-array {v0, v1}, [Lh4/l;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Lcom/android/launcher3/J3;->t([Lh4/l;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    return-void
.end method

.method static bridge synthetic s(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/SystemDecorationChangeObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mSystemDecorationChangeObserver:Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic t(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/launcher3/taskbar/g3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic u(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/util/ActiveTrackpadList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mTrackpadsConnected:Lcom/android/quickstep/util/ActiveTrackpadList;

    .line 2
    .line 3
    return-object p0
.end method

.method private unregisterAngleSensorListener()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mSensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mAngleSensor:Landroid/hardware/Sensor;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mAngleListener:Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    const-string p0, "TouchInteractionService"

    .line 17
    .line 18
    const-string v0, "unregisterAngleSensorListener: Can\'t find sensor manager or angle sensor!!"

    .line 19
    .line 20
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method static bridge synthetic v(Lcom/android/quickstep/TouchInteractionService;Ljava/util/function/Function;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mSwipeUpProxyProvider:Ljava/util/function/Function;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic w(Lcom/android/quickstep/TouchInteractionService;F)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->inAntiPinchHandModeArea(F)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic x(Lcom/android/quickstep/TouchInteractionService;F)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->inAntiPinchHandModeRange(F)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic y(Lcom/android/quickstep/TouchInteractionService;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->initInputMonitor(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic z(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->onAssistantVisibilityChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createGestureState(ILcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState$TrackpadGestureType;Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Lcom/android/quickstep/GestureState;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    new-instance p4, Lcom/android/quickstep/GestureState;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 19
    .line 20
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/quickstep/util/ActiveGestureLog;->getLogId()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-direct {p4, v0, p1, v2}, Lcom/android/quickstep/GestureState;-><init>(Lcom/android/quickstep/OverviewComponentObserver;II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 43
    .line 44
    invoke-virtual {v0, v1, p1}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :goto_0
    invoke-virtual {p4, v0}, Lcom/android/quickstep/GestureState;->updateRunningTask(Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getLastStartedTaskIds()[I

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p4, p1}, Lcom/android/quickstep/GestureState;->updateLastStartedTaskIds([I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getPreviouslyAppearedTaskIds()Ljava/util/Set;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p4, p1}, Lcom/android/quickstep/GestureState;->updatePreviouslyAppearedTaskIds(Ljava/util/Set;)V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_1
    new-instance p2, Lcom/android/quickstep/GestureState;

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 69
    .line 70
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/android/quickstep/util/ActiveGestureLog;->incrementLogId()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-direct {p2, v0, p1, v2}, Lcom/android/quickstep/GestureState;-><init>(Lcom/android/quickstep/OverviewComponentObserver;II)V

    .line 77
    .line 78
    .line 79
    if-eqz p4, :cond_2

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    sget-object p4, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 83
    .line 84
    invoke-virtual {p4, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p4

    .line 88
    check-cast p4, Lcom/android/quickstep/TopTaskTracker;

    .line 89
    .line 90
    invoke-virtual {p4, v1, p1}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 91
    .line 92
    .line 93
    move-result-object p4

    .line 94
    :goto_1
    invoke-virtual {p2, p4}, Lcom/android/quickstep/GestureState;->updateRunningTask(Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)V

    .line 95
    .line 96
    .line 97
    move-object v0, p4

    .line 98
    move-object p4, p2

    .line 99
    :goto_2
    invoke-virtual {p4, p3}, Lcom/android/quickstep/GestureState;->setTrackpadGestureType(Lcom/android/quickstep/GestureState$TrackpadGestureType;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPackageName()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logRunningTaskPackage(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-static {p0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logSysuiStateFlags(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-object p4
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/util/n1;->i()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/android/launcher3/util/T1;->a:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Service;->getBaseContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-virtual {p1, p3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/android/launcher3/util/T1;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/T1;->c(Ljava/io/PrintWriter;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->dump(Ljava/io/PrintWriter;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Lcom/android/quickstep/OverviewComponentObserver;->dump(Ljava/io/PrintWriter;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

    .line 39
    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Lcom/android/quickstep/OverviewCommandHelper;->dump(Ljava/io/PrintWriter;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 46
    .line 47
    const-string p3, ""

    .line 48
    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1, p3, p2}, Lcom/android/quickstep/GestureState;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    const-string p1, "Input state:"

    .line 55
    .line 56
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v0, "\tmInputMonitorCompat="

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v0, "\tmInputEventReceiver="

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mInputMonitorDisplayModel:Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;

    .line 104
    .line 105
    const-string v0, "\t"

    .line 106
    .line 107
    if-nez p1, :cond_4

    .line 108
    .line 109
    const-string p1, "\tmInputMonitorDisplayModel=null"

    .line 110
    .line 111
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_4
    invoke-virtual {p1, v0, p2}, Lcom/android/quickstep/DisplayModel;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 116
    .line 117
    .line 118
    :goto_0
    sget-object p1, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 119
    .line 120
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    check-cast p1, Lcom/android/launcher3/util/Z;

    .line 125
    .line 126
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/Z;->s(Ljava/io/PrintWriter;)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getActiveDisplayResources()Ljava/lang/Iterable;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_8

    .line 144
    .line 145
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast v1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 150
    .line 151
    invoke-virtual {v1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->getDisplayId()I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 156
    .line 157
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    const-string v5, "TouchState (displayId %d):"

    .line 166
    .line 167
    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object v3, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 175
    .line 176
    if-nez v3, :cond_5

    .line 177
    .line 178
    const/4 v3, 0x0

    .line 179
    goto :goto_2

    .line 180
    :cond_5
    invoke-virtual {v3, v2}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-virtual {v3}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    :goto_2
    iget-object v4, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 189
    .line 190
    if-eqz v4, :cond_6

    .line 191
    .line 192
    invoke-virtual {v4, v2}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->isResumed()Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-eqz v2, :cond_6

    .line 201
    .line 202
    const/4 v2, 0x1

    .line 203
    goto :goto_3

    .line 204
    :cond_6
    const/4 v2, 0x0

    .line 205
    :goto_3
    new-instance v4, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    .line 209
    .line 210
    const-string v5, "\tcreatedOverviewActivity="

    .line 211
    .line 212
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    new-instance v4, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    const-string v5, "\tresumed="

    .line 231
    .line 232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    if-eqz v3, :cond_7

    .line 246
    .line 247
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-virtual {v2, p0, p3, p2}, Lcom/android/launcher3/h0;->U(Landroid/content/Context;Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 252
    .line 253
    .line 254
    :cond_7
    invoke-virtual {v1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->getTaskAnimationManager()Lcom/android/quickstep/TaskAnimationManager;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-virtual {v1, v0, p2}, Lcom/android/quickstep/TaskAnimationManager;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 259
    .line 260
    .line 261
    goto :goto_1

    .line 262
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 263
    .line 264
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 265
    .line 266
    .line 267
    const-string v1, "\tmConsumer="

    .line 268
    .line 269
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mConsumer:Lcom/android/quickstep/InputConsumer;

    .line 273
    .line 274
    invoke-interface {v1}, Lcom/android/quickstep/InputConsumer;->getName()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    sget-object p1, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 289
    .line 290
    invoke-virtual {p1, p3, p2}, Lcom/android/quickstep/util/ActiveGestureLog;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 291
    .line 292
    .line 293
    sget-object p1, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 294
    .line 295
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    check-cast p1, Lcom/android/quickstep/RecentsModel;

    .line 300
    .line 301
    invoke-virtual {p1, p3, p2}, Lcom/android/quickstep/RecentsModel;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 302
    .line 303
    .line 304
    iget-object p1, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 305
    .line 306
    invoke-virtual {p1, p3, p2}, Lcom/android/launcher3/taskbar/g3;->W(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 307
    .line 308
    .line 309
    sget-object p1, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 310
    .line 311
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    check-cast p1, LP1/k;

    .line 316
    .line 317
    invoke-virtual {p1, p3, p2}, LP1/k;->n(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 318
    .line 319
    .line 320
    const-string p1, "ContextualSearchStateManager:"

    .line 321
    .line 322
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    sget-object p1, Lcom/android/quickstep/util/ContextualSearchStateManager;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 326
    .line 327
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    check-cast p1, Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 332
    .line 333
    invoke-virtual {p1, v0, p2}, Lcom/android/quickstep/util/ContextualSearchStateManager;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 334
    .line 335
    .line 336
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 337
    .line 338
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 343
    .line 344
    invoke-virtual {p1, p2}, Lcom/android/quickstep/SystemUiProxy;->dump(Ljava/io/PrintWriter;)V

    .line 345
    .line 346
    .line 347
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    const-string p3, "   "

    .line 352
    .line 353
    invoke-virtual {p1, p3, p2}, Lcom/android/quickstep/DeviceConfigWrapper;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 354
    .line 355
    .line 356
    sget-object p1, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 357
    .line 358
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object p0

    .line 362
    check-cast p0, Lcom/android/quickstep/TopTaskTracker;

    .line 363
    .line 364
    invoke-virtual {p0, p2}, Lcom/android/quickstep/TopTaskTracker;->dump(Ljava/io/PrintWriter;)V

    .line 365
    .line 366
    .line 367
    return-void
.end method

.method public getOverviewCommandHelper()Lcom/android/quickstep/OverviewCommandHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSwipeUpHandlerFactory(I)Lcom/android/quickstep/AbsSwipeUpHandler$Factory;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    instance-of v0, p1, Lcom/android/quickstep/FallbackWindowInterface;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsWindowSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    instance-of p1, p1, Lcom/android/quickstep/LauncherActivityInterface;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mLauncherSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mFallbackSwipeHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 22
    .line 23
    return-object p0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "onBind: user="

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Service;->getUserId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, " instance="

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "TouchInteractionService"

    .line 35
    .line 36
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mTISBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 40
    .line 41
    return-object p0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string p0, "TouchInteractionService"

    .line 17
    .line 18
    const-string p1, "onConfigurationChanged:  overview component observer is null."

    .line 19
    .line 20
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_5

    .line 34
    .line 35
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->isStarted()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2}, Lcom/android/quickstep/TouchInteractionService;->isTablet(Landroid/content/res/Configuration;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->isTablet(Landroid/content/res/Configuration;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eq v2, v3, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 66
    .line 67
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getComponentName()Landroid/content/ComponentName;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0, p1}, Landroid/content/res/Configuration;->diff(Landroid/content/res/Configuration;)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-virtual {v2, v3, p1}, Lcom/android/quickstep/OverviewComponentObserver;->canHandleConfigChanges(Landroid/content/ComponentName;I)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    const-string v0, "navigation_bar_gesture_height"

    .line 102
    .line 103
    invoke-static {v0, p1}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->onOneHandedModeChanged(I)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_4
    :goto_0
    invoke-static {p0, v1}, Lcom/android/quickstep/util/ActivityPreloadUtil;->preloadOverviewForTIS(Landroid/content/Context;Z)V

    .line 114
    .line 115
    .line 116
    :cond_5
    :goto_1
    return-void
.end method

.method public onCreate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "onCreate: user="

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Service;->getUserId()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " instance="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "TouchInteractionService"

    .line 38
    .line 39
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mMainChoreographer:Landroid/view/Choreographer;

    .line 47
    .line 48
    sget-object v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 55
    .line 56
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 57
    .line 58
    sget-object v0, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/android/quickstep/RotationTouchHelper;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 67
    .line 68
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 79
    .line 80
    invoke-static {}, Lcom/android/quickstep/SystemDecorationChangeObserver;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mSystemDecorationChangeObserver:Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 91
    .line 92
    new-instance v0, Lcom/android/quickstep/AllAppsActionManager;

    .line 93
    .line 94
    sget-object v2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 95
    .line 96
    new-instance v3, Lcom/android/quickstep/a6;

    .line 97
    .line 98
    invoke-direct {v3, p0}, Lcom/android/quickstep/a6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 99
    .line 100
    .line 101
    invoke-direct {v0, p0, v2, v3}, Lcom/android/quickstep/AllAppsActionManager;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Lu4/a;)V

    .line 102
    .line 103
    .line 104
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mAllAppsActionManager:Lcom/android/quickstep/AllAppsActionManager;

    .line 105
    .line 106
    new-instance v0, Lcom/android/quickstep/util/ActiveTrackpadList;

    .line 107
    .line 108
    new-instance v2, Lcom/android/quickstep/g6;

    .line 109
    .line 110
    invoke-direct {v2, p0}, Lcom/android/quickstep/g6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 111
    .line 112
    .line 113
    invoke-direct {v0, p0, v2}, Lcom/android/quickstep/util/ActiveTrackpadList;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTrackpadsConnected:Lcom/android/quickstep/util/ActiveTrackpadList;

    .line 117
    .line 118
    new-instance v0, Lcom/android/launcher3/taskbar/g3;

    .line 119
    .line 120
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mAllAppsActionManager:Lcom/android/quickstep/AllAppsActionManager;

    .line 121
    .line 122
    iget-object v3, p0, Lcom/android/quickstep/TouchInteractionService;->mNavCallbacks:Lcom/android/launcher3/taskbar/l3$a;

    .line 123
    .line 124
    iget-object v4, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 125
    .line 126
    invoke-direct {v0, p0, v2, v3, v4}, Lcom/android/launcher3/taskbar/g3;-><init>(Landroid/content/Context;Lcom/android/quickstep/AllAppsActionManager;Lcom/android/launcher3/taskbar/l3$a;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 130
    .line 131
    new-instance v0, Lj1/j;

    .line 132
    .line 133
    sget-object v2, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 134
    .line 135
    invoke-virtual {v2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Lcom/android/quickstep/SystemUiProxy;

    .line 140
    .line 141
    invoke-direct {v0, p0, v2}, Lj1/j;-><init>(Landroid/content/Context;Lcom/android/quickstep/SystemUiProxy;)V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDesktopAppLaunchTransitionManager:Lj1/j;

    .line 145
    .line 146
    invoke-virtual {v0}, Lj1/j;->a()V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Lcom/android/systemui/shared/system/InputConsumerController;->getRecentsAnimationInputConsumer()Lcom/android/systemui/shared/system/InputConsumerController;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputConsumer:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 154
    .line 155
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mUserUnlockedRunnable:Ljava/lang/Runnable;

    .line 160
    .line 161
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/n1;->m(Ljava/lang/Runnable;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 165
    .line 166
    new-instance v2, Lcom/android/quickstep/h6;

    .line 167
    .line 168
    invoke-direct {v2, p0}, Lcom/android/quickstep/h6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->addNavigationModeChangedCallback(Ljava/lang/Runnable;)Lcom/android/launcher3/util/Z$b;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDisplayInfoChangeListener:Lcom/android/launcher3/util/Z$b;

    .line 176
    .line 177
    sget-object v0, Lcom/android/launcher3/util/h2;->k:Lcom/android/launcher3/util/I;

    .line 178
    .line 179
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    check-cast v0, Lcom/android/launcher3/util/h2;

    .line 184
    .line 185
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mScreenOnListener:Lcom/android/launcher3/util/h2$a;

    .line 186
    .line 187
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/h2;->c(Lcom/android/launcher3/util/h2$a;)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 191
    .line 192
    const/4 v2, 0x1

    .line 193
    invoke-virtual {v0, v2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->onSettingsChanged(Z)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 197
    .line 198
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSquaredTouchSlop()F

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    iput v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTouchSlopSquared:F

    .line 203
    .line 204
    invoke-static {}, Lx1/O;->b5()Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-eqz v0, :cond_3

    .line 209
    .line 210
    invoke-static {}, Lx1/O;->m5()Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-eqz v0, :cond_3

    .line 215
    .line 216
    const-string v0, "sensor"

    .line 217
    .line 218
    invoke-virtual {p0, v0}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    check-cast v0, Landroid/hardware/SensorManager;

    .line 223
    .line 224
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mSensorManager:Landroid/hardware/SensorManager;

    .line 225
    .line 226
    if-eqz v0, :cond_2

    .line 227
    .line 228
    const/4 v1, -0x1

    .line 229
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_1

    .line 242
    .line 243
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    check-cast v1, Landroid/hardware/Sensor;

    .line 248
    .line 249
    invoke-virtual {v1}, Landroid/hardware/Sensor;->getStringType()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    const-string v3, "zte.sensor.zte_hinge_angle"

    .line 254
    .line 255
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    if-eqz v2, :cond_0

    .line 260
    .line 261
    iput-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mAngleSensor:Landroid/hardware/Sensor;

    .line 262
    .line 263
    goto :goto_0

    .line 264
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->registerAngleSensorListener()V

    .line 265
    .line 266
    .line 267
    return-void

    .line 268
    :cond_2
    const-string p0, "Can\'t find sensor manager!!"

    .line 269
    .line 270
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    :cond_3
    return-void
.end method

.method public onDestroy()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onDestroy: user="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Service;->getUserId()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " instance="

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "TouchInteractionService"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, 0x0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 51
    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    const/4 v2, 0x1

    .line 55
    invoke-virtual {v0, v2}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->unregisterRecentsAnimationResetReceiver()V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 64
    .line 65
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    iget-object v3, p0, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 71
    .line 72
    invoke-virtual {v3}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-virtual {v0, v3}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 83
    .line 84
    iget-object v3, p0, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 85
    .line 86
    invoke-virtual {v3}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {v0, v3}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v3, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 99
    .line 100
    invoke-virtual {v3}, Lcom/android/quickstep/OverviewComponentObserver;->isHomeAndOverviewSame()Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_2

    .line 105
    .line 106
    instance-of v3, v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 107
    .line 108
    if-eqz v3, :cond_2

    .line 109
    .line 110
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v3}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    sget-object v4, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 121
    .line 122
    if-eq v3, v4, :cond_1

    .line 123
    .line 124
    sget-object v4, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 125
    .line 126
    if-ne v3, v4, :cond_2

    .line 127
    .line 128
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 133
    .line 134
    invoke-virtual {v0, v3, v2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 135
    .line 136
    .line 137
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mInputConsumer:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/android/systemui/shared/system/InputConsumerController;->unregisterInputConsumer()V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 143
    .line 144
    if-eqz v0, :cond_3

    .line 145
    .line 146
    invoke-virtual {v0, v2}, Lcom/android/quickstep/OverviewComponentObserver;->setHomeDisabled(Z)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 150
    .line 151
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewChangeListener:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 152
    .line 153
    invoke-virtual {v0, v2}, Lcom/android/quickstep/OverviewComponentObserver;->removeOverviewChangeListener(Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;)V

    .line 154
    .line 155
    .line 156
    :cond_3
    const-string v0, "TouchInteractionService onDestroy()"

    .line 157
    .line 158
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService;->disposeEventHandlers(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 162
    .line 163
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 168
    .line 169
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->clearProxy()V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mAllAppsActionManager:Lcom/android/quickstep/AllAppsActionManager;

    .line 173
    .line 174
    invoke-virtual {v0}, Lcom/android/quickstep/AllAppsActionManager;->onDestroy()V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTrackpadsConnected:Lcom/android/quickstep/util/ActiveTrackpadList;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/android/quickstep/util/ActiveTrackpadList;->destroy()V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/g3;->S()V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDesktopAppLaunchTransitionManager:Lj1/j;

    .line 188
    .line 189
    if-eqz v0, :cond_4

    .line 190
    .line 191
    invoke-virtual {v0}, Lj1/j;->c()V

    .line 192
    .line 193
    .line 194
    :cond_4
    iput-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mDesktopAppLaunchTransitionManager:Lj1/j;

    .line 195
    .line 196
    iput-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 197
    .line 198
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 199
    .line 200
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mDisplayInfoChangeListener:Lcom/android/launcher3/util/Z$b;

    .line 201
    .line 202
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->removeDisplayInfoChangeListener(Lcom/android/launcher3/util/Z$b;)V

    .line 203
    .line 204
    .line 205
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mUserUnlockedRunnable:Ljava/lang/Runnable;

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/n1;->l(Ljava/lang/Runnable;)V

    .line 212
    .line 213
    .line 214
    sget-object v0, Lcom/android/launcher3/util/h2;->k:Lcom/android/launcher3/util/I;

    .line 215
    .line 216
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Lcom/android/launcher3/util/h2;

    .line 221
    .line 222
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService;->mScreenOnListener:Lcom/android/launcher3/util/h2$a;

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/h2;->n(Lcom/android/launcher3/util/h2$a;)V

    .line 225
    .line 226
    .line 227
    invoke-static {}, Lx1/O;->b5()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_5

    .line 232
    .line 233
    invoke-static {}, Lx1/O;->m5()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_5

    .line 238
    .line 239
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService;->unregisterAngleSensorListener()V

    .line 240
    .line 241
    .line 242
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTISBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 243
    .line 244
    invoke-virtual {v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->clearTisReference()V

    .line 245
    .line 246
    .line 247
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 248
    .line 249
    .line 250
    return-void
.end method

.method protected onScreenOnChanged(Z)V
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const/4 v6, 0x0

    .line 9
    const/4 v7, 0x0

    .line 10
    const/4 v4, 0x3

    .line 11
    const/4 v5, 0x0

    .line 12
    move-wide v2, v0

    .line 13
    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService;->onInputEvent(Landroid/view/InputEvent;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onUserUnlocked()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->q(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "onUserUnlocked: userId="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Service;->getUserId()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " instance="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "TouchInteractionService"

    .line 42
    .line 43
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-virtual {v0, v2}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 67
    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->registerRecentsAnimationResetReceiver()V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const-string v0, "onUserUnlocked: mTaskAnimationManager is null "

    .line 75
    .line 76
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    :goto_0
    sget-object v0, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lcom/android/quickstep/OverviewComponentObserver;

    .line 86
    .line 87
    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 88
    .line 89
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    move-object v7, v0

    .line 96
    check-cast v7, Lcom/android/quickstep/SystemUiProxy;

    .line 97
    .line 98
    new-instance v1, Lcom/android/quickstep/OverviewCommandHelper;

    .line 99
    .line 100
    iget-object v3, p0, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 101
    .line 102
    iget-object v4, p0, Lcom/android/quickstep/TouchInteractionService;->mRecentsDisplayModel:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 103
    .line 104
    invoke-virtual {v7}, Lcom/android/quickstep/SystemUiProxy;->getFocusState()Lcom/android/quickstep/FocusState;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    iget-object v6, p0, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 109
    .line 110
    move-object v2, p0

    .line 111
    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/OverviewCommandHelper;-><init>(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/OverviewComponentObserver;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/quickstep/FocusState;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/SystemUiProxy;)V

    .line 112
    .line 113
    .line 114
    iput-object v1, v2, Lcom/android/quickstep/TouchInteractionService;->mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

    .line 115
    .line 116
    const/4 p0, 0x1

    .line 117
    iput-boolean p0, v2, Lcom/android/quickstep/TouchInteractionService;->mUserUnlocked:Z

    .line 118
    .line 119
    iget-object p0, v2, Lcom/android/quickstep/TouchInteractionService;->mInputConsumer:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/android/systemui/shared/system/InputConsumerController;->registerInputConsumer()V

    .line 122
    .line 123
    .line 124
    iget-object p0, v2, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getDisplaysWithSysUIState()Ljava/util/Set;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_1

    .line 139
    .line 140
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Ljava/lang/Integer;

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    iget-object v1, v2, Lcom/android/quickstep/TouchInteractionService;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 151
    .line 152
    invoke-virtual {v1, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateFlags(I)J

    .line 153
    .line 154
    .line 155
    move-result-wide v3

    .line 156
    invoke-direct {v2, v3, v4, v0}, Lcom/android/quickstep/TouchInteractionService;->onSystemUiFlagsChanged(JI)V

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_1
    invoke-direct {v2}, Lcom/android/quickstep/TouchInteractionService;->onAssistantVisibilityChanged()V

    .line 161
    .line 162
    .line 163
    sget-object p0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 164
    .line 165
    invoke-virtual {p0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    invoke-direct {v2}, Lcom/android/quickstep/TouchInteractionService;->resetHomeBounceSeenOnQuickstepEnabledFirstTime()V

    .line 169
    .line 170
    .line 171
    iget-object p0, v2, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 172
    .line 173
    iget-object v0, v2, Lcom/android/quickstep/TouchInteractionService;->mOverviewChangeListener:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 174
    .line 175
    invoke-virtual {p0, v0}, Lcom/android/quickstep/OverviewComponentObserver;->addOverviewChangeListener(Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;)V

    .line 176
    .line 177
    .line 178
    iget-object p0, v2, Lcom/android/quickstep/TouchInteractionService;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewComponentObserver;->isHomeAndOverviewSame()Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    invoke-direct {v2, p0}, Lcom/android/quickstep/TouchInteractionService;->onOverviewTargetChanged(Z)V

    .line 185
    .line 186
    .line 187
    iget-object p0, v2, Lcom/android/quickstep/TouchInteractionService;->mTaskbarManager:Lcom/android/launcher3/taskbar/g3;

    .line 188
    .line 189
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->C0()V

    .line 190
    .line 191
    .line 192
    return-void
.end method
