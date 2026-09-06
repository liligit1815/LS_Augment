.class public final enum Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
.super Ljava/lang/Enum;
.source "ActiveGestureErrorDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/ActiveGestureErrorDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GestureEvent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum CANCEL_CURRENT_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum CLEANUP_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum EXPECTING_TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum FLAG_USING_OTHER_ACTIVITY_INPUT_CONSUMER:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum INVALID_VELOCITY_ON_SWIPE_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum LAUNCHER_DESTROYED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum MOTION_DOWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum MOTION_MOVE:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum MOTION_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum NAVIGATION_MODE_SWITCHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum ON_CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum ON_FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum ON_SETTLED_ON_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum ON_START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum QUICK_SWITCH_FROM_HOME_FAILED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum QUICK_SWITCH_FROM_HOME_FALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum RECENTS_ANIMATION_START_PENDING:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum RECENT_TASKS_MISSING:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum SCROLLER_ANIMATION_ABORTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum SET_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum SET_END_TARGET_ALL_APPS:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum SET_END_TARGET_HOME:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum SET_END_TARGET_NEW_TASK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum SET_ON_PAGE_TRANSITION_END_CALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_CAPTURE_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_END_TARGET_ANIMATION_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_GESTURE_CANCELLED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_GESTURE_COMPLETED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_GESTURE_STARTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_HANDLER_INVALIDATED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_LAUNCHER_DRAWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_RECENTS_ANIMATION_CANCELED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_RECENTS_SCROLLING_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum STATE_SCREENSHOT_CAPTURED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

.field public static final enum TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;


# instance fields
.field public final mLogEvent:Z

.field public final mTrackEvent:Z


# direct methods
.method private static synthetic $values()[Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
    .locals 39

    .line 1
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_DOWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 2
    .line 3
    sget-object v2, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 4
    .line 5
    sget-object v3, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_MOVE:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 6
    .line 7
    sget-object v4, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 8
    .line 9
    sget-object v5, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET_HOME:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 10
    .line 11
    sget-object v6, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET_NEW_TASK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 12
    .line 13
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET_ALL_APPS:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 14
    .line 15
    sget-object v8, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_SETTLED_ON_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 16
    .line 17
    sget-object v9, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 18
    .line 19
    sget-object v10, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 20
    .line 21
    sget-object v11, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 22
    .line 23
    sget-object v12, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 24
    .line 25
    sget-object v13, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 26
    .line 27
    sget-object v14, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 28
    .line 29
    sget-object v15, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_ON_PAGE_TRANSITION_END_CALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 30
    .line 31
    sget-object v16, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CANCEL_CURRENT_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 32
    .line 33
    sget-object v17, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CLEANUP_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 34
    .line 35
    sget-object v18, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SCROLLER_ANIMATION_ABORTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 36
    .line 37
    sget-object v19, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 38
    .line 39
    sget-object v20, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->EXPECTING_TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 40
    .line 41
    sget-object v21, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->FLAG_USING_OTHER_ACTIVITY_INPUT_CONSUMER:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 42
    .line 43
    sget-object v22, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->LAUNCHER_DESTROYED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 44
    .line 45
    sget-object v23, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->RECENT_TASKS_MISSING:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 46
    .line 47
    sget-object v24, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->INVALID_VELOCITY_ON_SWIPE_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 48
    .line 49
    sget-object v25, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->RECENTS_ANIMATION_START_PENDING:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 50
    .line 51
    sget-object v26, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->QUICK_SWITCH_FROM_HOME_FALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 52
    .line 53
    sget-object v27, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->QUICK_SWITCH_FROM_HOME_FAILED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 54
    .line 55
    sget-object v28, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->NAVIGATION_MODE_SWITCHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 56
    .line 57
    sget-object v29, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_STARTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 58
    .line 59
    sget-object v30, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_COMPLETED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 60
    .line 61
    sget-object v31, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_CANCELLED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 62
    .line 63
    sget-object v32, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_END_TARGET_ANIMATION_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 64
    .line 65
    sget-object v33, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_RECENTS_SCROLLING_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 66
    .line 67
    sget-object v34, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_CAPTURE_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 68
    .line 69
    sget-object v35, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_SCREENSHOT_CAPTURED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 70
    .line 71
    sget-object v36, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_HANDLER_INVALIDATED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 72
    .line 73
    sget-object v37, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_RECENTS_ANIMATION_CANCELED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 74
    .line 75
    sget-object v38, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_LAUNCHER_DRAWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 76
    .line 77
    filled-new-array/range {v1 .. v38}, [Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 2
    .line 3
    const-string v1, "MOTION_DOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_DOWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 12
    .line 13
    const-string v1, "MOTION_UP"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v0, v1, v3}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 22
    .line 23
    const-string v1, "MOTION_MOVE"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->MOTION_MOVE:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 30
    .line 31
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 32
    .line 33
    const-string v1, "SET_END_TARGET"

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 40
    .line 41
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 42
    .line 43
    const-string v1, "SET_END_TARGET_HOME"

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET_HOME:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 50
    .line 51
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 52
    .line 53
    const-string v1, "SET_END_TARGET_NEW_TASK"

    .line 54
    .line 55
    const/4 v4, 0x5

    .line 56
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET_NEW_TASK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 60
    .line 61
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 62
    .line 63
    const-string v1, "SET_END_TARGET_ALL_APPS"

    .line 64
    .line 65
    const/4 v4, 0x6

    .line 66
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_END_TARGET_ALL_APPS:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 70
    .line 71
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 72
    .line 73
    const-string v1, "ON_SETTLED_ON_END_TARGET"

    .line 74
    .line 75
    const/4 v4, 0x7

    .line 76
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_SETTLED_ON_END_TARGET:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 80
    .line 81
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 82
    .line 83
    const-string v1, "ON_START_RECENTS_ANIMATION"

    .line 84
    .line 85
    const/16 v4, 0x8

    .line 86
    .line 87
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 91
    .line 92
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 93
    .line 94
    const-string v1, "ON_FINISH_RECENTS_ANIMATION"

    .line 95
    .line 96
    const/16 v4, 0x9

    .line 97
    .line 98
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 99
    .line 100
    .line 101
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 102
    .line 103
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 104
    .line 105
    const-string v1, "ON_CANCEL_RECENTS_ANIMATION"

    .line 106
    .line 107
    const/16 v4, 0xa

    .line 108
    .line 109
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->ON_CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 113
    .line 114
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 115
    .line 116
    const-string v1, "START_RECENTS_ANIMATION"

    .line 117
    .line 118
    const/16 v4, 0xb

    .line 119
    .line 120
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 121
    .line 122
    .line 123
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->START_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 124
    .line 125
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 126
    .line 127
    const-string v1, "FINISH_RECENTS_ANIMATION"

    .line 128
    .line 129
    const/16 v4, 0xc

    .line 130
    .line 131
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->FINISH_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 135
    .line 136
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 137
    .line 138
    const-string v1, "CANCEL_RECENTS_ANIMATION"

    .line 139
    .line 140
    const/16 v4, 0xd

    .line 141
    .line 142
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CANCEL_RECENTS_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 146
    .line 147
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 148
    .line 149
    const-string v1, "SET_ON_PAGE_TRANSITION_END_CALLBACK"

    .line 150
    .line 151
    const/16 v4, 0xe

    .line 152
    .line 153
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 154
    .line 155
    .line 156
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_ON_PAGE_TRANSITION_END_CALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 157
    .line 158
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 159
    .line 160
    const-string v1, "CANCEL_CURRENT_ANIMATION"

    .line 161
    .line 162
    const/16 v4, 0xf

    .line 163
    .line 164
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 165
    .line 166
    .line 167
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CANCEL_CURRENT_ANIMATION:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 168
    .line 169
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 170
    .line 171
    const-string v1, "CLEANUP_SCREENSHOT"

    .line 172
    .line 173
    const/16 v4, 0x10

    .line 174
    .line 175
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 176
    .line 177
    .line 178
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->CLEANUP_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 179
    .line 180
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 181
    .line 182
    const-string v1, "SCROLLER_ANIMATION_ABORTED"

    .line 183
    .line 184
    const/16 v4, 0x11

    .line 185
    .line 186
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 187
    .line 188
    .line 189
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SCROLLER_ANIMATION_ABORTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 190
    .line 191
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 192
    .line 193
    const-string v1, "TASK_APPEARED"

    .line 194
    .line 195
    const/16 v4, 0x12

    .line 196
    .line 197
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 198
    .line 199
    .line 200
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 201
    .line 202
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 203
    .line 204
    const-string v1, "EXPECTING_TASK_APPEARED"

    .line 205
    .line 206
    const/16 v4, 0x13

    .line 207
    .line 208
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 209
    .line 210
    .line 211
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->EXPECTING_TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 212
    .line 213
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 214
    .line 215
    const-string v1, "FLAG_USING_OTHER_ACTIVITY_INPUT_CONSUMER"

    .line 216
    .line 217
    const/16 v4, 0x14

    .line 218
    .line 219
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 220
    .line 221
    .line 222
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->FLAG_USING_OTHER_ACTIVITY_INPUT_CONSUMER:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 223
    .line 224
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 225
    .line 226
    const-string v1, "LAUNCHER_DESTROYED"

    .line 227
    .line 228
    const/16 v4, 0x15

    .line 229
    .line 230
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 231
    .line 232
    .line 233
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->LAUNCHER_DESTROYED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 234
    .line 235
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 236
    .line 237
    const-string v1, "RECENT_TASKS_MISSING"

    .line 238
    .line 239
    const/16 v4, 0x16

    .line 240
    .line 241
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 242
    .line 243
    .line 244
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->RECENT_TASKS_MISSING:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 245
    .line 246
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 247
    .line 248
    const-string v1, "INVALID_VELOCITY_ON_SWIPE_UP"

    .line 249
    .line 250
    const/16 v4, 0x17

    .line 251
    .line 252
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 253
    .line 254
    .line 255
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->INVALID_VELOCITY_ON_SWIPE_UP:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 256
    .line 257
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 258
    .line 259
    const-string v1, "RECENTS_ANIMATION_START_PENDING"

    .line 260
    .line 261
    const/16 v4, 0x18

    .line 262
    .line 263
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 264
    .line 265
    .line 266
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->RECENTS_ANIMATION_START_PENDING:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 267
    .line 268
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 269
    .line 270
    const-string v1, "QUICK_SWITCH_FROM_HOME_FALLBACK"

    .line 271
    .line 272
    const/16 v4, 0x19

    .line 273
    .line 274
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 275
    .line 276
    .line 277
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->QUICK_SWITCH_FROM_HOME_FALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 278
    .line 279
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 280
    .line 281
    const-string v1, "QUICK_SWITCH_FROM_HOME_FAILED"

    .line 282
    .line 283
    const/16 v4, 0x1a

    .line 284
    .line 285
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 286
    .line 287
    .line 288
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->QUICK_SWITCH_FROM_HOME_FAILED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 289
    .line 290
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 291
    .line 292
    const-string v1, "NAVIGATION_MODE_SWITCHED"

    .line 293
    .line 294
    const/16 v4, 0x1b

    .line 295
    .line 296
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 297
    .line 298
    .line 299
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->NAVIGATION_MODE_SWITCHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 300
    .line 301
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 302
    .line 303
    const-string v1, "STATE_GESTURE_STARTED"

    .line 304
    .line 305
    const/16 v4, 0x1c

    .line 306
    .line 307
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 308
    .line 309
    .line 310
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_STARTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 311
    .line 312
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 313
    .line 314
    const-string v1, "STATE_GESTURE_COMPLETED"

    .line 315
    .line 316
    const/16 v4, 0x1d

    .line 317
    .line 318
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 319
    .line 320
    .line 321
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_COMPLETED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 322
    .line 323
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 324
    .line 325
    const-string v1, "STATE_GESTURE_CANCELLED"

    .line 326
    .line 327
    const/16 v4, 0x1e

    .line 328
    .line 329
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 330
    .line 331
    .line 332
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_CANCELLED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 333
    .line 334
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 335
    .line 336
    const-string v1, "STATE_END_TARGET_ANIMATION_FINISHED"

    .line 337
    .line 338
    const/16 v4, 0x1f

    .line 339
    .line 340
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 341
    .line 342
    .line 343
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_END_TARGET_ANIMATION_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 344
    .line 345
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 346
    .line 347
    const-string v1, "STATE_RECENTS_SCROLLING_FINISHED"

    .line 348
    .line 349
    const/16 v4, 0x20

    .line 350
    .line 351
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 352
    .line 353
    .line 354
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_RECENTS_SCROLLING_FINISHED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 355
    .line 356
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 357
    .line 358
    const-string v1, "STATE_CAPTURE_SCREENSHOT"

    .line 359
    .line 360
    const/16 v4, 0x21

    .line 361
    .line 362
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 363
    .line 364
    .line 365
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_CAPTURE_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 366
    .line 367
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 368
    .line 369
    const-string v1, "STATE_SCREENSHOT_CAPTURED"

    .line 370
    .line 371
    const/16 v4, 0x22

    .line 372
    .line 373
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 374
    .line 375
    .line 376
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_SCREENSHOT_CAPTURED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 377
    .line 378
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 379
    .line 380
    const-string v1, "STATE_HANDLER_INVALIDATED"

    .line 381
    .line 382
    const/16 v4, 0x23

    .line 383
    .line 384
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 385
    .line 386
    .line 387
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_HANDLER_INVALIDATED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 388
    .line 389
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 390
    .line 391
    const-string v1, "STATE_RECENTS_ANIMATION_CANCELED"

    .line 392
    .line 393
    const/16 v4, 0x24

    .line 394
    .line 395
    invoke-direct {v0, v1, v4}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;I)V

    .line 396
    .line 397
    .line 398
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_RECENTS_ANIMATION_CANCELED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 399
    .line 400
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 401
    .line 402
    const-string v1, "STATE_LAUNCHER_DRAWN"

    .line 403
    .line 404
    const/16 v4, 0x25

    .line 405
    .line 406
    invoke-direct {v0, v1, v4, v3, v2}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;IZZ)V

    .line 407
    .line 408
    .line 409
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_LAUNCHER_DRAWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 410
    .line 411
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->$values()[Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->$VALUES:[Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 416
    .line 417
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 1
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;-><init>(Ljava/lang/String;IZZ)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 3
    iput-boolean p3, p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->mLogEvent:Z

    .line 4
    iput-boolean p4, p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->mTrackEvent:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->$VALUES:[Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 8
    .line 9
    return-object v0
.end method
