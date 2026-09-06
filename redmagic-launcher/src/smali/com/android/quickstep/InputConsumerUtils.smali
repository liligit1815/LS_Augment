.class public final Lcom/android/quickstep/InputConsumerUtils;
.super Ljava/lang/Object;
.source "InputConsumerUtils.kt"


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

.field private static final NEWLINE_PREFIX:Ljava/lang/String; = "\n\t\t\t-> "

.field private static final SUBSTRING_PREFIX:Ljava/lang/String; = "; "


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/InputConsumerUtils;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/InputConsumerUtils;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    .line 7
    .line 8
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

.method public static synthetic a(Lcom/android/launcher3/taskbar/g3;I)Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer$lambda$0(Lcom/android/launcher3/taskbar/g3;I)Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final createDeviceLockedInputConsumer(Landroid/content/Context;ZLcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;
    .locals 1

    .line 1
    invoke-virtual {p4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, "; "

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p5}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object p7, p5

    .line 17
    move-object p5, p4

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    invoke-virtual {p5}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const-string p0, "%sdevice is in gesture nav mode or 3-button mode with a trackpad gesture and running task != null, using DeviceLockedInputConsumer"

    .line 26
    .line 27
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p8, p0, p2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 32
    .line 33
    .line 34
    new-instance p3, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 35
    .line 36
    move-object p8, p7

    .line 37
    move-object p7, p5

    .line 38
    move-object p5, p4

    .line 39
    move-object p4, p1

    .line 40
    invoke-direct/range {p3 .. p8}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    .line 41
    .line 42
    .line 43
    return-object p3

    .line 44
    :goto_1
    invoke-virtual {p7}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {p5}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    invoke-virtual {p7}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_2

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    const-string p1, "%sdevice is not in gesture nav mode and it\'s not a trackpad gesture, trying to use default input consumer"

    .line 62
    .line 63
    goto :goto_3

    .line 64
    :cond_3
    :goto_2
    const-string p1, "%srunning task == null, trying to use default input consumer"

    .line 65
    .line 66
    :goto_3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p4

    .line 70
    invoke-virtual {p8, p1, p4}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string p4, "append(...)"

    .line 75
    .line 76
    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p0, p2, p6, p3, p1}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method

.method private final createOtherActivityInputConsumer(Landroid/content/Context;Lcom/android/quickstep/AbsSwipeUpHandler$Factory;Lcom/android/quickstep/OverviewComponentObserver;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Ljava/util/function/Consumer;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;)Lcom/android/quickstep/InputConsumer;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S::",
            "Lcom/android/launcher3/statemanager/a<",
            "TS;>;T::",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            ":",
            "Lcom/android/launcher3/statemanager/i<",
            "TS;>;>(",
            "Landroid/content/Context;",
            "Lcom/android/quickstep/AbsSwipeUpHandler$Factory;",
            "Lcom/android/quickstep/OverviewComponentObserver;",
            "Lcom/android/quickstep/RecentsAnimationDeviceState;",
            "Lcom/android/quickstep/TaskAnimationManager;",
            "Lcom/android/systemui/shared/system/InputMonitorCompat;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;",
            ">;",
            "Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;",
            "Lcom/android/quickstep/GestureState;",
            "Landroid/view/MotionEvent;",
            ")",
            "Lcom/android/quickstep/InputConsumer;"
        }
    .end annotation

    .line 1
    move-object/from16 p0, p10

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/android/quickstep/OverviewComponentObserver;->isHomeAndOverviewSame()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    invoke-virtual/range {p9 .. p9}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p3, p4, p0}, Lcom/android/quickstep/BaseContainerInterface;->deferStartingActivity(Lcom/android/quickstep/RecentsAnimationDeviceState;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/4 p3, 0x0

    .line 21
    :goto_0
    move v5, p3

    .line 22
    goto :goto_2

    .line 23
    :cond_1
    :goto_1
    const/4 p3, 0x1

    .line 24
    goto :goto_0

    .line 25
    :goto_2
    invoke-virtual {p4, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isInExclusionRegion(Landroid/view/MotionEvent;)Z

    .line 26
    .line 27
    .line 28
    move-result v9

    .line 29
    new-instance v0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;

    .line 30
    .line 31
    move-object v1, p1

    .line 32
    move-object v10, p2

    .line 33
    move-object v2, p4

    .line 34
    move-object/from16 v3, p5

    .line 35
    .line 36
    move-object/from16 v7, p6

    .line 37
    .line 38
    move-object/from16 v6, p7

    .line 39
    .line 40
    move-object/from16 v8, p8

    .line 41
    .line 42
    move-object/from16 v4, p9

    .line 43
    .line 44
    invoke-direct/range {v0 .. v10}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;ZLjava/util/function/Consumer;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;ZLcom/android/quickstep/AbsSwipeUpHandler$Factory;)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method private final createOverviewInputConsumer(ZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S::",
            "Lcom/android/launcher3/statemanager/a<",
            "TS;>;T::",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            ":",
            "Lcom/android/launcher3/statemanager/i<",
            "TS;>;>(Z",
            "Lcom/android/quickstep/TaskAnimationManager;",
            "Lcom/android/launcher3/taskbar/g3;",
            "Lcom/android/quickstep/RecentsAnimationDeviceState;",
            "Lcom/android/systemui/shared/system/InputMonitorCompat;",
            "Lcom/android/quickstep/GestureState;",
            "Lcom/android/quickstep/GestureState;",
            "Landroid/view/MotionEvent;",
            "Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;",
            ")",
            "Lcom/android/quickstep/InputConsumer;"
        }
    .end annotation

    .line 1
    invoke-virtual {p7}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "; "

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p7}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const-string p4, "%sactivity == null, trying to use default input consumer"

    .line 18
    .line 19
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p5

    .line 23
    invoke-virtual {p9, p4, p5}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    const-string p5, "append(...)"

    .line 28
    .line 29
    invoke-static {p4, p5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 p2, 0x0

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/view/View;->hasWindowFocus()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move p1, p2

    .line 50
    :goto_0
    invoke-virtual {p6}, Lcom/android/quickstep/GestureState;->isRunningAnimationToLauncher()Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    const/4 p6, 0x1

    .line 55
    if-nez p3, :cond_3

    .line 56
    .line 57
    invoke-virtual {p4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isPredictiveBackToHomeInProgress()Z

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    if-eqz p3, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    move p3, p2

    .line 65
    goto :goto_2

    .line 66
    :cond_3
    :goto_1
    move p3, p6

    .line 67
    :goto_2
    invoke-virtual {p7}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lcom/android/quickstep/BaseContainerInterface;->isInLiveTileMode()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_4

    .line 76
    .line 77
    sget-object v1, Lf1/a;->J:Lf1/a$a;

    .line 78
    .line 79
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_4

    .line 84
    .line 85
    move v1, p6

    .line 86
    goto :goto_3

    .line 87
    :cond_4
    move v1, p2

    .line 88
    :goto_3
    if-eqz p1, :cond_5

    .line 89
    .line 90
    const-string v2, "%sactivity has window focus"

    .line 91
    .line 92
    goto :goto_4

    .line 93
    :cond_5
    if-eqz p3, :cond_6

    .line 94
    .line 95
    const-string v2, "%sprevious gesture is still animating to launcher"

    .line 96
    .line 97
    goto :goto_4

    .line 98
    :cond_6
    if-eqz v1, :cond_7

    .line 99
    .line 100
    const-string v2, "%sdevice is in live mode"

    .line 101
    .line 102
    goto :goto_4

    .line 103
    :cond_7
    const-string v2, "%sall overview focus conditions failed"

    .line 104
    .line 105
    :goto_4
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {p9, v2, v3}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 110
    .line 111
    .line 112
    instance-of v2, p0, Lcom/android/launcher3/C2;

    .line 113
    .line 114
    if-eqz v2, :cond_8

    .line 115
    .line 116
    move-object v2, p0

    .line 117
    check-cast v2, Lcom/android/launcher3/C2;

    .line 118
    .line 119
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->R2()Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    if-nez v3, :cond_9

    .line 124
    .line 125
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->M2()Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_8

    .line 130
    .line 131
    goto :goto_5

    .line 132
    :cond_8
    move p6, p2

    .line 133
    :cond_9
    :goto_5
    if-nez p1, :cond_a

    .line 134
    .line 135
    if-nez p3, :cond_a

    .line 136
    .line 137
    if-eqz v1, :cond_b

    .line 138
    .line 139
    :cond_a
    if-nez p6, :cond_b

    .line 140
    .line 141
    const-string p1, "%soverview should have focus, using OverviewInputConsumer"

    .line 142
    .line 143
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p3

    .line 147
    invoke-virtual {p9, p1, p3}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 148
    .line 149
    .line 150
    new-instance p1, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;

    .line 151
    .line 152
    invoke-direct {p1, p7, p0, p5, p2}, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;-><init>(Lcom/android/quickstep/GestureState;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/systemui/shared/system/InputMonitorCompat;Z)V

    .line 153
    .line 154
    .line 155
    return-object p1

    .line 156
    :cond_b
    const-string p1, "%soverview shouldn\'t have focus, using OverviewWithoutFocusInputConsumer"

    .line 157
    .line 158
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {p9, p1, p2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p4, p8}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isInExclusionRegion(Landroid/view/MotionEvent;)Z

    .line 166
    .line 167
    .line 168
    move-result p8

    .line 169
    new-instance p3, Lcom/android/quickstep/inputconsumers/OverviewWithoutFocusInputConsumer;

    .line 170
    .line 171
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    move-object p6, p7

    .line 176
    move-object p7, p5

    .line 177
    move-object p5, p4

    .line 178
    move-object p4, p0

    .line 179
    invoke-direct/range {p3 .. p8}, Lcom/android/quickstep/inputconsumers/OverviewWithoutFocusInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/systemui/shared/system/InputMonitorCompat;Z)V

    .line 180
    .line 181
    .line 182
    return-object p3
.end method

.method public static final getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;
    .locals 1

    .line 1
    const-string v0, "reasonString"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "; "

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    const-string p1, "%sResetGestureInputConsumer available, using ResetGestureInputConsumer"

    .line 15
    .line 16
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p4, p1, v0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 21
    .line 22
    .line 23
    new-instance p1, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;

    .line 24
    .line 25
    new-instance p4, Lcom/android/quickstep/h1;

    .line 26
    .line 27
    invoke-direct {p4, p3, p0}, Lcom/android/quickstep/h1;-><init>(Lcom/android/launcher3/taskbar/g3;I)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p1, p0, p2, p4}, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;-><init>(ILcom/android/quickstep/TaskAnimationManager;Ljava/util/function/Supplier;)V

    .line 31
    .line 32
    .line 33
    return-object p1

    .line 34
    :cond_0
    if-eqz p1, :cond_1

    .line 35
    .line 36
    const-string p1, "user is locked"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    if-nez p2, :cond_2

    .line 40
    .line 41
    const-string p1, "taskAnimationManager is null"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const-string p1, "taskbarManager is null"

    .line 45
    .line 46
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string p3, "%s"

    .line 52
    .line 53
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p1, ", using no-op input consumer"

    .line 60
    .line 61
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p4, p1, p2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 73
    .line 74
    .line 75
    invoke-static {p0}, Lcom/android/quickstep/InputConsumer;->createNoOpInputConsumer(I)Lcom/android/quickstep/InputConsumer;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-object p0
.end method

.method private static final getDefaultInputConsumer$lambda$0(Lcom/android/launcher3/taskbar/g3;I)Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final handleOrientationSetup(Lcom/android/quickstep/InputConsumer;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Lcom/android/quickstep/InputConsumer;->notifyOrientationSetup()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final ignoreThreeFingerTrackpadForNavHandleLongPress(Lcom/android/quickstep/GestureState;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->l0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->isThreeFingerTrackpadGesture()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private final logInputConsumerSelectionReason(Lcom/android/quickstep/InputConsumer;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Lcom/android/quickstep/InputConsumer;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p0, p2}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logSetInputConsumer(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    and-int/lit8 p0, p0, 0x4

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 21
    .line 22
    sget-object p1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->FLAG_USING_OTHER_ACTIVITY_INPUT_CONSUMER:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/ActiveGestureLog;->trackEvent(Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static final newBaseConsumer(Landroid/content/Context;ZLcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/OverviewComponentObserver;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/AbsSwipeUpHandler$Factory;Ljava/util/function/Consumer;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;Landroid/view/MotionEvent;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S::",
            "Lcom/android/launcher3/statemanager/a<",
            "TS;>;T::",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            ":",
            "Lcom/android/launcher3/statemanager/i<",
            "TS;>;>(",
            "Landroid/content/Context;",
            "Z",
            "Lcom/android/launcher3/taskbar/g3;",
            "Lcom/android/quickstep/OverviewComponentObserver;",
            "Lcom/android/quickstep/RecentsAnimationDeviceState;",
            "Lcom/android/quickstep/GestureState;",
            "Lcom/android/quickstep/GestureState;",
            "Lcom/android/quickstep/TaskAnimationManager;",
            "Lcom/android/systemui/shared/system/InputMonitorCompat;",
            "Lcom/android/quickstep/AbsSwipeUpHandler$Factory;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;",
            ">;",
            "Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;",
            "Landroid/view/MotionEvent;",
            "Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;",
            ")",
            "Lcom/android/quickstep/InputConsumer;"
        }
    .end annotation

    move-object/from16 v3, p2

    move-object/from16 v4, p4

    move-object/from16 v7, p6

    move-object/from16 v2, p7

    move-object/from16 v0, p13

    const-string v1, "context"

    move-object/from16 v5, p0

    invoke-static {v5, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "taskbarManager"

    invoke-static {v3, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "overviewComponentObserver"

    move-object/from16 v6, p3

    invoke-static {v6, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "deviceState"

    invoke-static {v4, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "previousGestureState"

    move-object/from16 v8, p5

    invoke-static {v8, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "gestureState"

    invoke-static {v7, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "taskAnimationManager"

    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "inputMonitorCompat"

    move-object/from16 v9, p8

    invoke-static {v9, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "swipeUpHandlerFactory"

    move-object/from16 v10, p9

    invoke-static {v10, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "onCompleteCallback"

    move-object/from16 v11, p10

    invoke-static {v11, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "inputEventReceiver"

    move-object/from16 v12, p11

    invoke-static {v12, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "event"

    move-object/from16 v13, p12

    invoke-static {v13, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "reasonString"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isKeyguardShowingOccluded()Z

    move-result v1

    const-string v14, "append(...)"

    const-string v15, "; "

    if-eqz v1, :cond_0

    .line 2
    sget-object v1, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    .line 3
    const-string v6, "%skeyguard is showing occluded, trying to use device locked input consumer"

    .line 4
    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v8

    .line 5
    invoke-virtual {v0, v6, v8}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v8

    invoke-static {v8, v14}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, v1

    move-object v6, v2

    move-object v1, v5

    move-object v5, v7

    move-object v7, v9

    move/from16 v2, p1

    .line 6
    invoke-direct/range {v0 .. v8}, Lcom/android/quickstep/InputConsumerUtils;->createDeviceLockedInputConsumer(Landroid/content/Context;ZLcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v0

    return-object v0

    .line 7
    :cond_0
    const-string v1, "%skeyguard is not showing occluded"

    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 8
    invoke-virtual {v7}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    move-result-object v1

    .line 9
    invoke-virtual {v7}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->isStarted()Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    .line 10
    invoke-virtual {v1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->isRootChooseActivity()Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v4

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 11
    :goto_0
    invoke-static {}, LH2/c;->n()Z

    move-result v5

    if-nez v5, :cond_5

    if-eqz v1, :cond_2

    .line 12
    invoke-virtual {v1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getVisibleNonExcludedTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    move-result-object v5

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    :goto_1
    if-eqz v5, :cond_5

    .line 13
    invoke-virtual {v5}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const-string v16, "MISSING"

    if-nez v9, :cond_3

    move-object/from16 v9, v16

    .line 14
    :cond_3
    invoke-virtual {v1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPackageName()Ljava/lang/String;

    move-result-object v17

    if-nez v17, :cond_4

    move-object/from16 v3, v16

    goto :goto_2

    :cond_4
    move-object/from16 v3, v17

    .line 15
    :goto_2
    invoke-static {v9, v3}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logUpdateGestureStateRunningTask(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    invoke-virtual {v7, v5}, Lcom/android/quickstep/GestureState;->updateRunningTask(Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)V

    .line 17
    :cond_5
    invoke-virtual {v8}, Lcom/android/quickstep/GestureState;->isRunningAnimationToLauncher()Z

    move-result v3

    if-nez v3, :cond_7

    .line 18
    invoke-virtual/range {p4 .. p4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isPredictiveBackToHomeInProgress()Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_3

    :cond_6
    const/4 v3, 0x0

    goto :goto_4

    :cond_7
    :goto_3
    move v3, v4

    .line 19
    :goto_4
    invoke-virtual {v7}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/quickstep/BaseContainerInterface;->isResumed()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 20
    invoke-virtual {v8}, Lcom/android/quickstep/GestureState;->isRecentsAnimationRunning()Z

    move-result v5

    if-nez v5, :cond_8

    move v5, v4

    goto :goto_5

    :cond_8
    const/4 v5, 0x0

    .line 21
    :goto_5
    invoke-static {}, Lcom/android/launcher3/y0;->H0()Z

    move-result v9

    if-eqz v9, :cond_9

    if-eqz v1, :cond_9

    .line 22
    invoke-virtual {v1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->isHomeTask()Z

    move-result v9

    if-eqz v9, :cond_9

    .line 23
    invoke-virtual {v6}, Lcom/android/quickstep/OverviewComponentObserver;->isHomeAndOverviewSameActivity()Z

    move-result v9

    if-eqz v9, :cond_9

    if-nez v5, :cond_9

    .line 24
    invoke-virtual {v8}, Lcom/android/quickstep/GestureState;->isRecentsAnimationRunning()Z

    move-result v9

    if-nez v9, :cond_9

    goto :goto_6

    :cond_9
    const/4 v4, 0x0

    .line 25
    :goto_6
    sget-object v9, Lf1/a;->J:Lf1/a$a;

    invoke-virtual {v9}, Lf1/a$a;->c()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-virtual {v7}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/quickstep/BaseContainerInterface;->isInLiveTileMode()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 26
    sget-object v1, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    .line 27
    const-string v2, "%sis in live tile mode, trying to use overview input consumer"

    .line 28
    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v3

    .line 29
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v9

    invoke-static {v9, v14}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v3, p2

    move-object/from16 v4, p4

    move-object/from16 v2, p7

    move-object/from16 v5, p8

    move-object v0, v1

    move-object v6, v8

    move-object v8, v13

    move/from16 v1, p1

    .line 30
    invoke-direct/range {v0 .. v9}, Lcom/android/quickstep/InputConsumerUtils;->createOverviewInputConsumer(ZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v0

    return-object v0

    :cond_a
    move/from16 v7, p1

    move/from16 v16, v3

    move v9, v4

    move v8, v5

    move-object/from16 v3, p2

    move-object/from16 v4, p4

    move-object/from16 v5, p7

    if-nez v1, :cond_b

    .line 31
    const-string v1, "InputConsumerUtils"

    const-string v2, "Running task is null"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    invoke-virtual/range {p6 .. p6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v1

    .line 33
    const-string v2, "%srunning task == null"

    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    invoke-static {v0, v14}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    invoke-static {v1, v7, v5, v3, v0}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v0

    return-object v0

    :cond_b
    if-nez v16, :cond_c

    if-nez v8, :cond_c

    if-eqz v2, :cond_d

    :cond_c
    move-object v2, v5

    goto :goto_9

    .line 35
    :cond_d
    invoke-virtual {v4, v1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isGestureBlockedTask(Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Z

    move-result v1

    if-nez v1, :cond_e

    if-eqz v9, :cond_f

    :cond_e
    move-object v2, v5

    goto :goto_7

    .line 36
    :cond_f
    const-string v1, "%susing OtherActivityInputConsumer"

    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 37
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    move-object/from16 v1, p0

    move-object/from16 v9, p6

    move-object v3, v6

    move-object v2, v10

    move-object v7, v11

    move-object v8, v12

    move-object/from16 v6, p8

    move-object/from16 v10, p12

    invoke-direct/range {v0 .. v10}, Lcom/android/quickstep/InputConsumerUtils;->createOtherActivityInputConsumer(Landroid/content/Context;Lcom/android/quickstep/AbsSwipeUpHandler$Factory;Lcom/android/quickstep/OverviewComponentObserver;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Ljava/util/function/Consumer;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;)Lcom/android/quickstep/InputConsumer;

    move-result-object v0

    return-object v0

    .line 38
    :goto_7
    invoke-virtual/range {p6 .. p6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v1

    if-eqz v9, :cond_10

    .line 39
    const-string v4, "%sis launcher child-task, trying to use default input consumer"

    goto :goto_8

    .line 40
    :cond_10
    const-string v4, "%sis gesture-blocked task, trying to use default input consumer"

    .line 41
    :goto_8
    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v5

    .line 42
    invoke-virtual {v0, v4, v5}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    invoke-static {v0, v14}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    invoke-static {v1, v7, v2, v3, v0}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v0

    return-object v0

    .line 44
    :goto_9
    sget-object v1, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    if-eqz v16, :cond_11

    .line 45
    const-string v4, "%sprevious gesture animated to launcher, trying to use overview input consumer"

    goto :goto_a

    :cond_11
    if-eqz v8, :cond_12

    .line 46
    const-string v4, "%slauncher resumed through a shell transition, trying to use overview input consumer"

    goto :goto_a

    .line 47
    :cond_12
    const-string v4, "%sforceOverviewInputConsumer == true, trying to use overview input consumer"

    .line 48
    :goto_a
    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v5

    .line 49
    invoke-virtual {v0, v4, v5}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v9

    invoke-static {v9, v14}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v4, p4

    move-object/from16 v6, p5

    move-object/from16 v5, p8

    move-object/from16 v8, p12

    move-object v0, v1

    move v1, v7

    move-object/from16 v7, p6

    .line 50
    invoke-direct/range {v0 .. v9}, Lcom/android/quickstep/InputConsumerUtils;->createOverviewInputConsumer(ZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v0

    return-object v0
.end method

.method private final newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;
    .locals 1

    .line 1
    new-instance p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 2
    .line 3
    const-string v0, "\n\t\t\t-> "

    .line 4
    .line 5
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "%s%s"

    .line 10
    .line 11
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public static final newConsumer(Landroid/content/Context;ZLcom/android/quickstep/OverviewComponentObserver;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/AbsSwipeUpHandler$Factory;Ljava/util/function/Consumer;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;Lcom/android/launcher3/taskbar/g3;Ljava/util/function/Function;Lcom/android/quickstep/OverviewCommandHelper;Landroid/view/MotionEvent;Lcom/android/quickstep/RotationTouchHelper;)Lcom/android/quickstep/InputConsumer;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S::",
            "Lcom/android/launcher3/statemanager/a<",
            "TS;>;T::",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            ":",
            "Lcom/android/launcher3/statemanager/i<",
            "TS;>;>(",
            "Landroid/content/Context;",
            "Z",
            "Lcom/android/quickstep/OverviewComponentObserver;",
            "Lcom/android/quickstep/RecentsAnimationDeviceState;",
            "Lcom/android/quickstep/GestureState;",
            "Lcom/android/quickstep/GestureState;",
            "Lcom/android/quickstep/TaskAnimationManager;",
            "Lcom/android/systemui/shared/system/InputMonitorCompat;",
            "Lcom/android/quickstep/AbsSwipeUpHandler$Factory;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;",
            ">;",
            "Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;",
            "Lcom/android/launcher3/taskbar/g3;",
            "Ljava/util/function/Function<",
            "Lcom/android/quickstep/GestureState;",
            "Lcom/android/launcher3/anim/d;",
            ">;",
            "Lcom/android/quickstep/OverviewCommandHelper;",
            "Landroid/view/MotionEvent;",
            "Lcom/android/quickstep/RotationTouchHelper;",
            ")",
            "Lcom/android/quickstep/InputConsumer;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v3, p7

    move-object/from16 v2, p11

    move-object/from16 v0, p12

    move-object/from16 v12, p14

    move-object/from16 v14, p15

    const-string v5, "context"

    invoke-static {v1, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "overviewComponentObserver"

    move-object/from16 v8, p2

    invoke-static {v8, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "deviceState"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "previousGestureState"

    move-object/from16 v9, p4

    invoke-static {v9, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "gestureState"

    invoke-static {v6, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "taskAnimationManager"

    invoke-static {v7, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "inputMonitorCompat"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "swipeUpHandlerFactory"

    move-object/from16 v10, p8

    invoke-static {v10, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "onCompleteCallback"

    move-object/from16 v11, p9

    invoke-static {v11, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "inputEventReceiver"

    move-object/from16 v13, p10

    invoke-static {v13, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "taskbarManager"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "swipeUpProxyProvider"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "overviewCommandHelper"

    move-object/from16 v15, p13

    invoke-static {v15, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "event"

    invoke-static {v12, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "rotationTouchHelper"

    invoke-static {v14, v5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 2
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->q0()Lcom/android/launcher3/taskbar/bubbles/m0;

    move-result-object v16

    :goto_0
    move-object/from16 v2, v16

    goto :goto_1

    :cond_0
    const/16 v16, 0x0

    goto :goto_0

    :goto_1
    if-eqz v2, :cond_1

    .line 3
    invoke-static {v5, v12}, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->isEventOnBubbles(Lcom/android/launcher3/taskbar/I1;Landroid/view/MotionEvent;)Z

    move-result v16

    if-eqz v16, :cond_1

    .line 4
    new-instance v0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;

    .line 5
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v4

    .line 6
    invoke-direct {v0, v1, v4, v2, v3}, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;-><init>(Landroid/content/Context;ILcom/android/launcher3/taskbar/bubbles/m0;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    .line 7
    sget-object v1, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    .line 8
    const-string v2, "event is on bubbles, creating new input consumer"

    invoke-direct {v1, v2}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v2

    .line 9
    invoke-direct {v1, v0, v2}, Lcom/android/quickstep/InputConsumerUtils;->logInputConsumerSelectionReason(Lcom/android/quickstep/InputConsumer;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    return-object v0

    .line 10
    :cond_1
    invoke-interface {v0, v6}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/anim/d;

    if-eqz v0, :cond_3

    .line 11
    new-instance v2, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;

    move-object/from16 p13, v0

    move-object/from16 p9, v1

    move-object/from16 p8, v2

    move-object/from16 p12, v3

    move-object/from16 p11, v6

    move-object/from16 p10, v7

    invoke-direct/range {p8 .. p13}, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/launcher3/anim/d;)V

    move-object/from16 v0, p8

    .line 12
    sget-object v2, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    .line 13
    const-string v3, "mSwipeUpProxyProvider has been set, using ProgressDelegateInputConsumer"

    .line 14
    invoke-direct {v2, v3}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v3

    .line 15
    invoke-direct {v2, v0, v3}, Lcom/android/quickstep/InputConsumerUtils;->logInputConsumerSelectionReason(Lcom/android/quickstep/InputConsumer;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 16
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v12}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v14, v12}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    :cond_2
    return-object v0

    .line 18
    :cond_3
    invoke-virtual/range {p5 .. p5}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canStartTrackpadGesture()Z

    move-result v0

    :goto_2
    move/from16 v16, v0

    goto :goto_3

    .line 19
    :cond_4
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canStartSystemGesture()Z

    move-result v0

    goto :goto_2

    .line 20
    :goto_3
    sget-object v0, Lcom/android/launcher3/util/n1;->f:Lcom/android/launcher3/util/n1$a;

    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/n1$a;->a(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    move-result v0

    const-string v2, "; "

    if-nez v0, :cond_7

    .line 21
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    const-string v3, "device locked"

    invoke-direct {v0, v3}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v9

    .line 22
    const-string v3, "append(...)"

    if-eqz v16, :cond_5

    .line 23
    const-string v5, "%scan start system gesture"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v9, v5, v2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v8

    invoke-static {v8, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move/from16 v2, p1

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v3, p11

    .line 24
    invoke-direct/range {v0 .. v8}, Lcom/android/quickstep/InputConsumerUtils;->createDeviceLockedInputConsumer(Landroid/content/Context;ZLcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v2

    goto :goto_4

    :cond_5
    move/from16 v1, p1

    move-object/from16 v7, p6

    move-object v4, v2

    move-object/from16 v2, p11

    .line 25
    invoke-virtual/range {p5 .. p5}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v5

    .line 26
    const-string v6, "%scannot start system gesture"

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v9, v6, v4}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v4

    invoke-static {v4, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    invoke-static {v5, v1, v7, v2, v4}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v2

    .line 28
    :goto_4
    invoke-direct {v0, v2, v9}, Lcom/android/quickstep/InputConsumerUtils;->logInputConsumerSelectionReason(Lcom/android/quickstep/InputConsumer;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 29
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {v12}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v14, v12}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 30
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    move-result-object v0

    invoke-virtual {v0, v12}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    :cond_6
    return-object v2

    :cond_7
    move/from16 v1, p1

    move-object/from16 v7, p6

    move-object v4, v2

    move-object/from16 v2, p11

    .line 31
    invoke-virtual/range {p3 .. p3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    move-result v0

    const/16 v17, 0x1

    if-eqz v0, :cond_8

    .line 32
    invoke-virtual/range {p3 .. p3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isStatusBarHidden()Z

    move-result v0

    if-eqz v0, :cond_8

    move/from16 v18, v17

    goto :goto_5

    :cond_8
    move/from16 v18, v16

    :goto_5
    if-nez v18, :cond_a

    .line 33
    invoke-virtual {v9}, Lcom/android/quickstep/GestureState;->isRecentsAnimationRunning()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_7

    .line 34
    :cond_9
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    .line 35
    const-string v3, "cannot start system gesture and recents animation was not running, trying to use default input consumer"

    .line 36
    invoke-direct {v0, v3}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 37
    invoke-virtual/range {p5 .. p5}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v3

    .line 38
    invoke-static {v3, v1, v7, v2, v0}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v3

    move-object/from16 v20, v4

    move-object/from16 v19, v5

    move-object v9, v7

    move-object/from16 v4, p3

    move-object v7, v0

    :goto_6
    move v8, v1

    move-object v10, v2

    goto :goto_9

    .line 39
    :cond_a
    :goto_7
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    if-eqz v18, :cond_b

    .line 40
    const-string v3, "can start system gesture, trying to use base consumer"

    goto :goto_8

    .line 41
    :cond_b
    const-string v3, "recents animation was running, trying to use base consumer"

    .line 42
    :goto_8
    invoke-direct {v0, v3}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    move-object/from16 v6, p5

    move-object/from16 v20, v4

    move-object/from16 v19, v5

    move-object v3, v8

    move-object v5, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v13

    move-object/from16 v4, p3

    move-object/from16 v8, p7

    move-object v13, v0

    move-object/from16 v0, p0

    .line 43
    invoke-static/range {v0 .. v13}, Lcom/android/quickstep/InputConsumerUtils;->newBaseConsumer(Landroid/content/Context;ZLcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/OverviewComponentObserver;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/AbsSwipeUpHandler$Factory;Ljava/util/function/Consumer;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;Landroid/view/MotionEvent;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v3

    move-object v9, v7

    move-object v7, v13

    goto :goto_6

    .line 44
    :goto_9
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_c

    instance-of v0, v3, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;

    if-nez v0, :cond_c

    invoke-virtual {v12}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {v14, v12}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 45
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    move-result-object v0

    invoke-virtual {v0, v12}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    :cond_c
    if-eqz v18, :cond_d

    if-nez v16, :cond_d

    .line 46
    invoke-virtual/range {p4 .. p4}, Lcom/android/quickstep/GestureState;->isRecentsAnimationRunning()Z

    move-result v0

    if-nez v0, :cond_d

    .line 47
    invoke-interface {v3}, Lcom/android/quickstep/InputConsumer;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_d

    .line 48
    invoke-virtual/range {p5 .. p5}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v0

    .line 49
    invoke-static {v0, v8, v9, v10, v7}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v3

    .line 50
    :cond_d
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isGesturalNavMode()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual/range {p5 .. p5}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 51
    :cond_e
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v0, v3}, Lcom/android/quickstep/InputConsumerUtils;->handleOrientationSetup(Lcom/android/quickstep/InputConsumer;)V

    .line 52
    :cond_f
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    move-result v0

    const-string v11, "%s%s%sgesture can trigger one handed mode, using OneHandedModeInputConsumer"

    const-string v13, "\n\t\t\t-> "

    if-nez v0, :cond_10

    invoke-virtual/range {p5 .. p5}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v0

    if-eqz v0, :cond_11

    :cond_10
    move-object/from16 v14, v20

    goto :goto_b

    .line 53
    :cond_11
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isScreenPinningActive()Z

    move-result v0

    const-string v1, "device is not in gesture navigation mode"

    if-eqz v0, :cond_12

    .line 54
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v0, v1}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 55
    const-string v2, "%sscreen pinning is active, trying to use default input consumer"

    .line 56
    filled-new-array/range {v20 .. v20}, [Ljava/lang/Object;

    move-result-object v3

    .line 57
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v7

    .line 58
    invoke-virtual/range {p5 .. p5}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v0

    .line 59
    invoke-static {v0, v8, v9, v10, v7}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v3

    .line 60
    :cond_12
    invoke-virtual {v4, v12}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canTriggerOneHandedAction(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_21

    move-object/from16 v14, v20

    .line 61
    filled-new-array {v13, v1, v14}, [Ljava/lang/Object;

    move-result-object v0

    .line 62
    invoke-virtual {v7, v11, v0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 63
    new-instance v0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;

    .line 64
    invoke-virtual/range {p5 .. p5}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v1

    move-object/from16 p9, p0

    move-object/from16 p13, p7

    move-object/from16 p8, v0

    move/from16 p10, v1

    move-object/from16 p12, v3

    move-object/from16 p11, v4

    .line 65
    invoke-direct/range {p8 .. p13}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;-><init>(Landroid/content/Context;ILcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    :goto_a
    move-object/from16 v3, p8

    goto/16 :goto_16

    .line 66
    :goto_b
    invoke-virtual {v4, v12}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canTriggerAssistantAction(Landroid/view/MotionEvent;)Z

    move-result v0

    const-string v1, "device is in gesture navigation mode or 3-button mode with a trackpad gesture"

    if-eqz v0, :cond_13

    .line 67
    const-string v0, "%s%s%sgesture can trigger the assistant, trying to use assistant input consumer"

    .line 68
    filled-new-array {v13, v1, v14}, [Ljava/lang/Object;

    move-result-object v2

    .line 69
    invoke-virtual {v7, v0, v2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 70
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    move-object/from16 v5, p5

    move-object v2, v4

    move-object v6, v12

    move-object v12, v1

    move-object v4, v3

    move-object/from16 v1, p0

    move-object/from16 v3, p7

    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/InputConsumerUtils;->tryCreateAssistantInputConsumer(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/InputConsumer;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v0

    move-object v2, v0

    goto :goto_c

    :cond_13
    move-object v12, v1

    move-object v4, v3

    move-object v2, v4

    :goto_c
    const/4 v0, 0x0

    if-eqz v19, :cond_15

    .line 71
    instance-of v1, v2, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    if-nez v1, :cond_15

    .line 72
    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iget-boolean v1, v1, Lcom/android/launcher3/h0;->p3:Z

    if-eqz v1, :cond_14

    .line 73
    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    move-result v1

    if-nez v1, :cond_14

    .line 74
    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher3/taskbar/I1;->X0()Z

    move-result v1

    if-nez v1, :cond_14

    goto :goto_d

    :cond_14
    move/from16 v17, v0

    :goto_d
    if-eqz v18, :cond_15

    if-eqz v17, :cond_15

    .line 75
    const-string v1, "%s%s%sTaskbarActivityContext != null, using TaskbarUnstashInputConsumer"

    .line 76
    filled-new-array {v13, v12, v14}, [Ljava/lang/Object;

    move-result-object v3

    .line 77
    invoke-virtual {v7, v1, v3}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move v1, v0

    .line 78
    new-instance v0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;

    move-object/from16 v6, p5

    move-object/from16 v3, p7

    move-object/from16 v16, v7

    move-object v5, v15

    move-object/from16 v4, v19

    move-object/from16 v15, p14

    move v7, v1

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/launcher3/taskbar/I1;Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/GestureState;)V

    move-object v2, v0

    goto :goto_e

    :cond_15
    move-object/from16 v1, p0

    move-object/from16 v6, p5

    move-object/from16 v15, p14

    move-object/from16 v16, v7

    move v7, v0

    .line 79
    :goto_e
    invoke-static {}, LH2/c;->e()Z

    move-result v0

    const-string v3, "%sbubbles expanded, trying to use default input consumer"

    if-eqz v0, :cond_16

    .line 80
    invoke-virtual/range {p3 .. p3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isBubblesExpanded()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 81
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v0, v12}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 82
    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v2

    .line 83
    invoke-virtual {v0, v3, v2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 84
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v2

    .line 85
    invoke-static {v2, v8, v9, v10, v0}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v2

    goto :goto_f

    :cond_16
    move-object/from16 v0, v16

    :goto_f
    if-eqz v19, :cond_18

    .line 86
    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher3/taskbar/I1;->y0()Lcom/android/quickstep/NavHandle;

    move-result-object v4

    if-nez v4, :cond_17

    goto :goto_11

    :cond_17
    :goto_10
    move-object v5, v4

    goto :goto_12

    :cond_18
    :goto_11
    sget-object v4, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    invoke-virtual {v4, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/quickstep/NavHandle;

    goto :goto_10

    :goto_12
    if-eqz v18, :cond_1a

    .line 87
    invoke-virtual/range {p4 .. p4}, Lcom/android/quickstep/GestureState;->isRecentsAnimationRunning()Z

    move-result v4

    if-nez v4, :cond_1a

    .line 88
    invoke-interface {v5}, Lcom/android/quickstep/NavHandle;->canNavHandleBeLongPressed()Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 89
    sget-object v4, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v4, v6}, Lcom/android/quickstep/InputConsumerUtils;->ignoreThreeFingerTrackpadForNavHandleLongPress(Lcom/android/quickstep/GestureState;)Z

    move-result v4

    if-nez v4, :cond_1a

    .line 90
    const-string v4, "%s%s%sNot running recents animation, "

    .line 91
    filled-new-array {v13, v12, v14}, [Ljava/lang/Object;

    move-result-object v7

    .line 92
    invoke-virtual {v0, v4, v7}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    if-eqz v19, :cond_19

    .line 93
    invoke-virtual/range {v19 .. v19}, Lcom/android/launcher3/taskbar/I1;->y0()Lcom/android/quickstep/NavHandle;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/quickstep/NavHandle;->canNavHandleBeLongPressed()Z

    move-result v4

    if-eqz v4, :cond_19

    .line 94
    const-string v4, "stashed handle is long-pressable, "

    const/4 v7, 0x0

    new-array v1, v7, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    goto :goto_13

    :cond_19
    const/4 v7, 0x0

    .line 95
    :goto_13
    const-string v1, "using NavHandleLongPressInputConsumer"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-object/from16 v16, v0

    .line 96
    new-instance v0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressInputConsumer;

    move-object/from16 v1, p0

    move-object/from16 v4, p3

    move-object v7, v3

    move-object/from16 v3, p7

    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/inputconsumers/NavHandleLongPressInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/NavHandle;Lcom/android/quickstep/GestureState;)V

    move-object v2, v0

    goto :goto_14

    :cond_1a
    move-object/from16 v4, p3

    move-object/from16 v16, v0

    move-object v7, v3

    move-object/from16 v3, p7

    .line 97
    :goto_14
    invoke-static {}, LH2/c;->e()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 98
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isBubblesExpanded()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 99
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v0, v12}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 100
    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v2

    .line 101
    invoke-virtual {v0, v7, v2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 102
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v2

    .line 103
    invoke-static {v2, v8, v9, v10, v0}, Lcom/android/quickstep/InputConsumerUtils;->getDefaultInputConsumer(IZLcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object v2

    goto :goto_15

    :cond_1b
    move-object/from16 v0, v16

    .line 104
    :goto_15
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isSystemUiDialogShowing()Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 105
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v0, v12}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 106
    const-string v2, "%ssystem dialog is showing, using SysUiOverlayInputConsumer"

    .line 107
    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v5

    .line 108
    invoke-virtual {v0, v2, v5}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 109
    new-instance v2, Lcom/android/quickstep/inputconsumers/SysUiOverlayInputConsumer;

    .line 110
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v5

    .line 111
    invoke-direct {v2, v1, v5, v4, v3}, Lcom/android/quickstep/inputconsumers/SysUiOverlayInputConsumer;-><init>(Landroid/content/Context;ILcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    .line 112
    :cond_1c
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v5

    if-eqz v5, :cond_1d

    if-eqz v18, :cond_1d

    .line 113
    invoke-virtual/range {p4 .. p4}, Lcom/android/quickstep/GestureState;->isRecentsAnimationRunning()Z

    move-result v5

    if-nez v5, :cond_1d

    .line 114
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v0, v12}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 115
    const-string v5, "%sTrackpad 3-finger gesture, using TrackpadStatusBarInputConsumer"

    .line 116
    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v7

    .line 117
    invoke-virtual {v0, v5, v7}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 118
    new-instance v5, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;

    .line 119
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v7

    .line 120
    invoke-direct {v5, v1, v7, v2, v3}, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;-><init>(Landroid/content/Context;ILcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    move-object v2, v5

    .line 121
    :cond_1d
    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isScreenPinningActive()Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 122
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v0, v12}, Lcom/android/quickstep/InputConsumerUtils;->newCompoundString(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 123
    const-string v2, "%sscreen pinning is active, using ScreenPinnedInputConsumer"

    .line 124
    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v5

    .line 125
    invoke-virtual {v0, v2, v5}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v0

    .line 126
    new-instance v2, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;

    invoke-direct {v2, v1, v6}, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/GestureState;)V

    :cond_1e
    move-object v7, v0

    .line 127
    invoke-virtual {v4, v15}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canTriggerOneHandedAction(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 128
    filled-new-array {v13, v12, v14}, [Ljava/lang/Object;

    move-result-object v0

    .line 129
    invoke-virtual {v7, v11, v0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 130
    new-instance v0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;

    .line 131
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v5

    move-object/from16 p8, v0

    move-object/from16 p9, v1

    move-object/from16 p12, v2

    move-object/from16 p13, v3

    move-object/from16 p11, v4

    move/from16 p10, v5

    .line 132
    invoke-direct/range {p8 .. p13}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;-><init>(Landroid/content/Context;ILcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    move-object/from16 v2, p8

    .line 133
    :cond_1f
    invoke-virtual/range {p3 .. p3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isAccessibilityMenuAvailable()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 134
    const-string v0, "%s%s%saccessibility menu is available, using AccessibilityInputConsumer"

    .line 135
    filled-new-array {v13, v12, v14}, [Ljava/lang/Object;

    move-result-object v1

    .line 136
    invoke-virtual {v7, v0, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 137
    new-instance v0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;

    .line 138
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v1

    move-object/from16 p9, p0

    move-object/from16 p11, p3

    move-object/from16 p13, p7

    move-object/from16 p8, v0

    move/from16 p10, v1

    move-object/from16 p12, v2

    .line 139
    invoke-direct/range {p8 .. p13}, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;-><init>(Landroid/content/Context;ILcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    goto/16 :goto_a

    :cond_20
    move-object v3, v2

    .line 140
    :cond_21
    :goto_16
    sget-object v0, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    invoke-direct {v0, v3, v7}, Lcom/android/quickstep/InputConsumerUtils;->logInputConsumerSelectionReason(Lcom/android/quickstep/InputConsumer;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    return-object v3
.end method

.method public static final tryCreateAssistantInputConsumer(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;)Lcom/android/quickstep/InputConsumer;
    .locals 9

    const-string v0, "context"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "deviceState"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "inputMonitorCompat"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "gestureState"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "motionEvent"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    sget-object v1, Lcom/android/quickstep/InputConsumerUtils;->INSTANCE:Lcom/android/quickstep/InputConsumerUtils;

    .line 2
    invoke-virtual {p3}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result v0

    invoke-static {v0}, Lcom/android/quickstep/InputConsumer;->createNoOpInputConsumer(I)Lcom/android/quickstep/InputConsumer;

    move-result-object v5

    const-string v0, "createNoOpInputConsumer(...)"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    sget-object v8, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    const-string v0, "NO_OP"

    invoke-static {v8, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    .line 4
    invoke-direct/range {v1 .. v8}, Lcom/android/quickstep/InputConsumerUtils;->tryCreateAssistantInputConsumer(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/InputConsumer;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;

    move-result-object p0

    return-object p0
.end method

.method private final tryCreateAssistantInputConsumer(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/InputConsumer;Lcom/android/quickstep/GestureState;Landroid/view/MotionEvent;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/InputConsumer;
    .locals 2

    .line 5
    invoke-virtual {p5}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isGestureBlockedTask(Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Z

    move-result p0

    const-string v0, "; "

    if-eqz p0, :cond_0

    .line 6
    const-string p0, "%sis gesture-blocked task, using base input consumer"

    .line 7
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object p1

    .line 8
    invoke-virtual {p7, p0, p1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    return-object p4

    .line 9
    :cond_0
    const-string p0, "%susing AssistantInputConsumer"

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p7, p0, v0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-object p7, p6

    move-object p6, p2

    move-object p2, p1

    .line 10
    new-instance p1, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    move-object v1, p5

    move-object p5, p3

    move-object p3, v1

    invoke-direct/range {p1 .. p7}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;-><init>(Landroid/content/Context;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/RecentsAnimationDeviceState;Landroid/view/MotionEvent;)V

    return-object p1
.end method
