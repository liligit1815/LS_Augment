.class public Lcom/android/quickstep/RecentsAnimationDeviceState;
.super Ljava/lang/Object;
.source "RecentsAnimationDeviceState.java"

# interfaces
.implements Lcom/android/launcher3/util/Z$b;
.implements Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;


# static fields
.field private static final DB_KILL_GAME_LAUNCHER:Ljava/lang/String; = "gcs_need_kill_game_launcher"

.field private static final DISPLAY_GAUSSIAN_BLUR:Ljava/lang/String; = "display_gaussian_blur"

.field private static final FULLSCREEN_SLIDE_TWICE_OFF:I = 0x1

.field private static final FULLSCREEN_SLIDE_TWICE_ON:I = 0x0

.field private static final FULLSCREEN_SLIDE_TWICE_SWITCH:Ljava/lang/String; = "gesture_trigger_need_twice"

.field private static final GAME_MODE_KEY_LOCK:Ljava/lang/String; = "game_mode_key_lock"

.field private static final GESTURE_BOTTOM_INDICATOR:Ljava/lang/String; = "gesture_bottom_indicator"

.field public static INSTANCE:Lcom/android/launcher3/util/I; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/RecentsAnimationDeviceState;",
            ">;"
        }
    .end annotation
.end field

.field private static final LAUNCHER_HOME_RECENT_LOCK:Ljava/lang/String; = "launcher_home_recent_lock"

.field public static final LIMIT_BAN_INSTALL_APP:I = 0x4

.field public static final LIMIT_BAN_INSTALL_UNINSTALL_APP:I = 0x7

.field public static final LIMIT_BAN_OPEN_APP:I = 0x1

.field public static final LIMIT_BAN_UNINSTALL_APP:I = 0x2

.field private static final MINI_WINDOW_LIST:Ljava/lang/String; = "zte_global_wr_app_list"

.field public static final NO_LIMIT:I = 0x0

.field private static final ONE_HANDED_TYPE:Ljava/lang/String; = "one_handed_type"

.field public static final PACKAGE_NAME_ZHI_YUN_SH:Ljava/lang/String; = "com.zjkd.smartlauncher"

.field private static final QUICKSTEP_TOUCH_SLOP_RATIO_GESTURAL:F = 1.414f

.field private static final QUICKSTEP_TOUCH_SLOP_RATIO_TWO_BUTTON:F = 3.0f

.field public static final SETTINGS_HEALTHY_USE_PHONE:Landroid/net/Uri;

.field private static final SHIELD_FULL_SCREEN_GESTURE_ENABLE:Ljava/lang/String; = "shield_full_screen_gesture_enable"

.field private static final SUPER_POWER_SAVE:Ljava/lang/String; = "super_power_save_mode"

.field static final SUPPORT_ONE_HANDED_MODE:Ljava/lang/String; = "ro.support_one_handed_mode"

.field private static final TAG:Ljava/lang/String; = "RecentsAnimationDeviceState"

.field public static final USMART_LAUNCHER_PACKAGE:Ljava/lang/String; = "com.zte.usmartlauncher"

.field private static final VOICE_ASSISTANT:Ljava/lang/String; = "assist_touch_gesture_enabled"

.field private static final ZGESTURE_DOUBLE_TAP_TO_SCREEN_OFF:Ljava/lang/String; = "zgesture_double_tap_to_sleep"

.field private static final ZOOM_SINGLE_HAND_MODE:Ljava/lang/String; = "single_hand_mode"

.field public static volatile mCurrentDefaultHome:Ljava/lang/String;

.field private static mTriggerVoiceAssistant:Z


# instance fields
.field private GESTURE_BOTTOM_INDICATOR_DEFAULT_VALUE:I

.field private lastStatusBarState:Z

.field private mAssistantAvailable:Z

.field private mAssistantVisibility:F

.field private final mCanImeRenderGesturalNavButtons:Z

.field private final mContext:Landroid/content/Context;

.field private final mContextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

.field public mDalogNoZVoice:Landroid/app/Dialog;

.field protected mDefaultHomePackage:Ljava/lang/String;

.field private final mDeferredGestureRegion:Landroid/graphics/Region;

.field private final mDisplayController:Lcom/android/launcher3/util/Z;

.field private mExclusionListenerRegistered:Z

.field private final mExclusionManager:Lcom/android/quickstep/util/GestureExclusionManager;

.field private mExclusionRegion:Landroid/graphics/Region;

.field private mGestureBlockingTaskId:I

.field public mIfHalfOneHandedType:Z

.field protected mIgnorestylusGesture:Z

.field protected volatile mIsFullScreenSlideTwiceOn:Z

.field private mIsOneHandedModeEnabled:Z

.field private final mIsOneHandedModeSupported:Z

.field private mIsPredictiveBackToHomeInProgress:Z

.field private mIsSwipeToNotificationEnabled:Z

.field private mIsToastShown:Z

.field private mIsUserSetupComplete:Z

.field private mMode:Lcom/android/launcher3/util/C1;

.field private mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

.field protected volatile mNeedIgnoreFullScreenType:I

.field public mNubiaActiveMode:Z

.field private mPipIsActive:Z

.field private final mPipListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

.field private final mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

.field private mSettingsObserver:Lcom/android/launcher3/util/j2;

.field protected mStatusBarHidden:Z

.field private mSwipeMoveStartRecentsList:[Ljava/lang/String;

.field private final mSysUIStateFlagsPerDisplay:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mSystemUiStateFlags:J

.field private mTopActivity:Landroid/content/ComponentName;

.field private mTopActivityWeChat:Z

.field public mZoomOneHandedTriggered:Z

.field private sIgnoreApps:[Ljava/lang/String;

.field private sIgnorePackages:[Ljava/lang/String;

.field private sIgnoreSlideTwice:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/S3;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/S3;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    const-string v0, "healthy_use_ban_child_operation"

    .line 14
    .line 15
    invoke-static {v0}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->SETTINGS_HEALTHY_USE_PHONE:Landroid/net/Uri;

    .line 20
    .line 21
    invoke-static {}, Lx1/O;->n1()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    xor-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    sput-boolean v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTriggerVoiceAssistant:Z

    .line 28
    .line 29
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/quickstep/util/GestureExclusionManager;Lcom/android/launcher3/util/Z;Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/quickstep/RotationTouchHelper;Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/K;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p6

    .line 8
    .line 9
    move-object/from16 v4, p7

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Landroid/inputmethodservice/InputMethodService;->canImeRenderGesturalNavButtons()Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    iput-boolean v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mCanImeRenderGesturalNavButtons:Z

    .line 19
    .line 20
    const-wide/32 v5, 0x10000000

    .line 21
    .line 22
    .line 23
    iput-wide v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSystemUiStateFlags:J

    .line 24
    .line 25
    new-instance v5, Ljava/util/concurrent/ConcurrentHashMap;

    .line 26
    .line 27
    invoke-direct {v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSysUIStateFlagsPerDisplay:Ljava/util/Map;

    .line 31
    .line 32
    sget-object v5, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 33
    .line 34
    iput-object v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 35
    .line 36
    new-instance v5, Landroid/graphics/Region;

    .line 37
    .line 38
    invoke-direct {v5}, Landroid/graphics/Region;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDeferredGestureRegion:Landroid/graphics/Region;

    .line 42
    .line 43
    const/4 v5, -0x1

    .line 44
    iput v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mGestureBlockingTaskId:I

    .line 45
    .line 46
    sget-object v5, Lcom/android/quickstep/util/GestureExclusionManager;->EMPTY_REGION:Landroid/graphics/Region;

    .line 47
    .line 48
    iput-object v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionRegion:Landroid/graphics/Region;

    .line 49
    .line 50
    const/4 v5, 0x0

    .line 51
    iput-object v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 52
    .line 53
    const/4 v6, 0x0

    .line 54
    iput v6, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 55
    .line 56
    iput-boolean v6, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsFullScreenSlideTwiceOn:Z

    .line 57
    .line 58
    iput-boolean v6, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsToastShown:Z

    .line 59
    .line 60
    iput-boolean v6, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivityWeChat:Z

    .line 61
    .line 62
    iput-object v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 63
    .line 64
    const/4 v5, 0x1

    .line 65
    iput v5, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->GESTURE_BOTTOM_INDICATOR_DEFAULT_VALUE:I

    .line 66
    .line 67
    iput-boolean v6, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mStatusBarHidden:Z

    .line 68
    .line 69
    const-string v14, "com.example.apklocal/com.example.apklocal.TouchScreenActivity"

    .line 70
    .line 71
    const-string v15, "com.example.apklocal/com.example.apklocal.Keyboard620eActivity"

    .line 72
    .line 73
    const-string v7, "com.android.emergency/com.android.emergency.sos.PreStartSosActivity"

    .line 74
    .line 75
    const-string v8, "com.android.emergency/com.android.emergency.sos.EmergencyModeActivity"

    .line 76
    .line 77
    const-string v9, "com.zte.gesture.test/com.zte.gesture.test.MainActivity"

    .line 78
    .line 79
    const-string v10, "com.zte.powersavemode/com.zte.powersavemode.supermode.SuperModeActivity"

    .line 80
    .line 81
    const-string v11, "cn.nubia.keymapcenter/cn.nubia.keymapcenter.mirror.MirrorInputActivity"

    .line 82
    .line 83
    const-string v12, "com.example.apklocal/com.example.apklocal.MainActivity"

    .line 84
    .line 85
    const-string v13, "com.example.apklocal/com.example.apklocal.TouchPadActivity"

    .line 86
    .line 87
    filled-new-array/range {v7 .. v15}, [Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    iput-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->sIgnoreApps:[Ljava/lang/String;

    .line 92
    .line 93
    const-string v7, "com.cmcc.tvlauncher"

    .line 94
    .line 95
    const-string v8, "com.komect.ajlauncher"

    .line 96
    .line 97
    const-string v9, "com.zte.emode"

    .line 98
    .line 99
    const-string v10, "com.zte.burntest.camera"

    .line 100
    .line 101
    const-string v11, "com.zte.xr.gamelauncher"

    .line 102
    .line 103
    filled-new-array {v9, v10, v11, v7, v8}, [Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    iput-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->sIgnorePackages:[Ljava/lang/String;

    .line 108
    .line 109
    const-string v12, "com.android.calculator2"

    .line 110
    .line 111
    const-string v13, "com.zte.multscr"

    .line 112
    .line 113
    const-string v8, "com.android.gallery3d"

    .line 114
    .line 115
    const-string v9, "com.zte.videoplayer"

    .line 116
    .line 117
    const-string v10, "cn.nubia.gallery3d"

    .line 118
    .line 119
    const-string v11, "com.android.camera"

    .line 120
    .line 121
    filled-new-array/range {v8 .. v13}, [Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    iput-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->sIgnoreSlideTwice:[Ljava/lang/String;

    .line 126
    .line 127
    const-string v7, "com.zte.mifavor.variablewidget"

    .line 128
    .line 129
    const-string v8, "com.android.chrome"

    .line 130
    .line 131
    filled-new-array {v7, v8}, [Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v7

    .line 135
    iput-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSwipeMoveStartRecentsList:[Ljava/lang/String;

    .line 136
    .line 137
    iput-boolean v6, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->lastStatusBarState:Z

    .line 138
    .line 139
    iput-object v1, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 140
    .line 141
    iput-object v2, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 142
    .line 143
    move-object/from16 v7, p2

    .line 144
    .line 145
    iput-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionManager:Lcom/android/quickstep/util/GestureExclusionManager;

    .line 146
    .line 147
    move-object/from16 v7, p4

    .line 148
    .line 149
    iput-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 150
    .line 151
    move-object/from16 v7, p5

    .line 152
    .line 153
    iput-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 154
    .line 155
    const-string v7, "ro.support_one_handed_mode"

    .line 156
    .line 157
    invoke-static {v7, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    iput-boolean v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeSupported:Z

    .line 162
    .line 163
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getGestureBottomIndicatorStatus()V

    .line 164
    .line 165
    .line 166
    new-instance v8, Lcom/android/quickstep/e3;

    .line 167
    .line 168
    invoke-direct {v8, v0}, Lcom/android/quickstep/e3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v4, v8}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/Z;->o(Lcom/android/launcher3/util/Z$b;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v2}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    const/16 v8, 0xff

    .line 182
    .line 183
    invoke-virtual {v0, v1, v2, v8}, Lcom/android/quickstep/RecentsAnimationDeviceState;->onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V

    .line 184
    .line 185
    .line 186
    new-instance v2, Lcom/android/quickstep/g3;

    .line 187
    .line 188
    invoke-direct {v2, v0}, Lcom/android/quickstep/g3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 192
    .line 193
    .line 194
    new-instance v2, Lcom/android/quickstep/s3;

    .line 195
    .line 196
    invoke-direct {v2, v0}, Lcom/android/quickstep/s3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 200
    .line 201
    .line 202
    const-string v2, "RecentsAnimationDeviceState"

    .line 203
    .line 204
    if-eqz v7, :cond_0

    .line 205
    .line 206
    const-string v7, "one_handed_mode_enabled"

    .line 207
    .line 208
    invoke-static {v7}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 209
    .line 210
    .line 211
    move-result-object v7

    .line 212
    new-instance v8, Lcom/android/quickstep/E3;

    .line 213
    .line 214
    invoke-direct {v8, v0}, Lcom/android/quickstep/E3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v3, v7, v8}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v3, v7}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 221
    .line 222
    .line 223
    move-result v9

    .line 224
    iput-boolean v9, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 225
    .line 226
    new-instance v9, Lcom/android/quickstep/J3;

    .line 227
    .line 228
    invoke-direct {v9, v3, v7, v8}, Lcom/android/quickstep/J3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v4, v9}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 232
    .line 233
    .line 234
    new-instance v7, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 237
    .line 238
    .line 239
    const-string v8, "mIsOneHandedModeEnabled "

    .line 240
    .line 241
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    iget-boolean v8, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 245
    .line 246
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v7

    .line 253
    invoke-static {v2, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    const-string v7, "one_handed_type"

    .line 257
    .line 258
    invoke-static {v7}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 259
    .line 260
    .line 261
    move-result-object v7

    .line 262
    new-instance v8, Lcom/android/quickstep/K3;

    .line 263
    .line 264
    invoke-direct {v8, v0}, Lcom/android/quickstep/K3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v3, v7, v8}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v3, v7}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 271
    .line 272
    .line 273
    move-result v9

    .line 274
    iput-boolean v9, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIfHalfOneHandedType:Z

    .line 275
    .line 276
    new-instance v9, Ljava/lang/StringBuilder;

    .line 277
    .line 278
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 279
    .line 280
    .line 281
    const-string v10, "mIfHalfOneHandedType "

    .line 282
    .line 283
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    iget-boolean v10, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIfHalfOneHandedType:Z

    .line 287
    .line 288
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v9

    .line 295
    invoke-static {v2, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    new-instance v9, Lcom/android/quickstep/M3;

    .line 299
    .line 300
    invoke-direct {v9, v3, v7, v8}, Lcom/android/quickstep/M3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v4, v9}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 304
    .line 305
    .line 306
    const-string v7, "single_hand_mode"

    .line 307
    .line 308
    invoke-static {v7}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 309
    .line 310
    .line 311
    move-result-object v7

    .line 312
    new-instance v8, Lcom/android/quickstep/N3;

    .line 313
    .line 314
    invoke-direct {v8, v0}, Lcom/android/quickstep/N3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v3, v7, v8}, Lcom/android/launcher3/util/p2;->n(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v3, v7}, Lcom/android/launcher3/util/p2;->h(Landroid/net/Uri;)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v9

    .line 324
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 325
    .line 326
    .line 327
    move-result v9

    .line 328
    xor-int/2addr v9, v5

    .line 329
    iput-boolean v9, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mZoomOneHandedTriggered:Z

    .line 330
    .line 331
    new-instance v9, Ljava/lang/StringBuilder;

    .line 332
    .line 333
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 334
    .line 335
    .line 336
    const-string v10, "mZoomOneHandedTriggered "

    .line 337
    .line 338
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    iget-boolean v10, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mZoomOneHandedTriggered:Z

    .line 342
    .line 343
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v9

    .line 350
    invoke-static {v2, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    .line 352
    .line 353
    new-instance v9, Lcom/android/quickstep/O3;

    .line 354
    .line 355
    invoke-direct {v9, v3, v7, v8}, Lcom/android/quickstep/O3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v4, v9}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 359
    .line 360
    .line 361
    goto :goto_0

    .line 362
    :cond_0
    iput-boolean v6, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 363
    .line 364
    :goto_0
    const-string v7, "swipe_bottom_to_notification_enabled"

    .line 365
    .line 366
    invoke-static {v7}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 367
    .line 368
    .line 369
    move-result-object v7

    .line 370
    new-instance v8, Lcom/android/quickstep/P3;

    .line 371
    .line 372
    invoke-direct {v8, v0}, Lcom/android/quickstep/P3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v3, v7, v8}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 376
    .line 377
    .line 378
    invoke-virtual {v3, v7}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 379
    .line 380
    .line 381
    move-result v9

    .line 382
    iput-boolean v9, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsSwipeToNotificationEnabled:Z

    .line 383
    .line 384
    new-instance v9, Lcom/android/quickstep/p3;

    .line 385
    .line 386
    invoke-direct {v9, v3, v7, v8}, Lcom/android/quickstep/p3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {v4, v9}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 390
    .line 391
    .line 392
    const-string v7, "user_setup_complete"

    .line 393
    .line 394
    invoke-static {v7}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 395
    .line 396
    .line 397
    move-result-object v7

    .line 398
    invoke-virtual {v3, v7, v6}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 399
    .line 400
    .line 401
    move-result v8

    .line 402
    iput-boolean v8, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsUserSetupComplete:Z

    .line 403
    .line 404
    invoke-static {v8}, Lx1/O;->X4(Z)V

    .line 405
    .line 406
    .line 407
    iget-boolean v8, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsUserSetupComplete:Z

    .line 408
    .line 409
    if-nez v8, :cond_1

    .line 410
    .line 411
    new-instance v8, Lcom/android/quickstep/A3;

    .line 412
    .line 413
    invoke-direct {v8, v0}, Lcom/android/quickstep/A3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 414
    .line 415
    .line 416
    invoke-virtual {v3, v7, v8}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 417
    .line 418
    .line 419
    new-instance v9, Lcom/android/quickstep/L3;

    .line 420
    .line 421
    invoke-direct {v9, v3, v7, v8}, Lcom/android/quickstep/L3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 422
    .line 423
    .line 424
    invoke-virtual {v4, v9}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 425
    .line 426
    .line 427
    :cond_1
    const-string v7, "default_home"

    .line 428
    .line 429
    invoke-static {v7}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 430
    .line 431
    .line 432
    move-result-object v8

    .line 433
    new-instance v9, Lcom/android/quickstep/U3;

    .line 434
    .line 435
    invoke-direct {v9, v0}, Lcom/android/quickstep/U3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 436
    .line 437
    .line 438
    invoke-virtual {v3, v8, v9}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 439
    .line 440
    .line 441
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 442
    .line 443
    .line 444
    move-result-object v10

    .line 445
    invoke-static {v10, v7}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v7

    .line 449
    sput-object v7, Lcom/android/quickstep/RecentsAnimationDeviceState;->mCurrentDefaultHome:Ljava/lang/String;

    .line 450
    .line 451
    new-instance v7, Lcom/android/quickstep/V3;

    .line 452
    .line 453
    invoke-direct {v7, v3, v8, v9}, Lcom/android/quickstep/V3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 454
    .line 455
    .line 456
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 457
    .line 458
    .line 459
    :try_start_0
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    .line 460
    .line 461
    .line 462
    move-result-object v7

    .line 463
    const/4 v8, 0x2

    .line 464
    invoke-interface {v7, v8, v6}, Landroid/app/IActivityTaskManager;->getRootTaskInfo(II)Landroid/app/ActivityTaskManager$RootTaskInfo;

    .line 465
    .line 466
    .line 467
    move-result-object v7

    .line 468
    if-eqz v7, :cond_2

    .line 469
    .line 470
    move v7, v5

    .line 471
    goto :goto_1

    .line 472
    :cond_2
    move v7, v6

    .line 473
    :goto_1
    iput-boolean v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mPipIsActive:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 474
    .line 475
    :catch_0
    new-instance v7, Lcom/android/quickstep/RecentsAnimationDeviceState$1;

    .line 476
    .line 477
    invoke-direct {v7, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState$1;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 478
    .line 479
    .line 480
    iput-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mPipListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 481
    .line 482
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 483
    .line 484
    .line 485
    move-result-object v8

    .line 486
    invoke-virtual {v8, v7}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 487
    .line 488
    .line 489
    new-instance v7, Lcom/android/quickstep/W3;

    .line 490
    .line 491
    invoke-direct {v7, v0}, Lcom/android/quickstep/W3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 492
    .line 493
    .line 494
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 495
    .line 496
    .line 497
    iget-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 498
    .line 499
    invoke-virtual {v7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 500
    .line 501
    .line 502
    move-result-object v7

    .line 503
    invoke-direct {v0, v7}, Lcom/android/quickstep/RecentsAnimationDeviceState;->registerSettingObserver(Landroid/content/Context;)V

    .line 504
    .line 505
    .line 506
    invoke-static {}, Lx1/S;->o()Z

    .line 507
    .line 508
    .line 509
    move-result v7

    .line 510
    if-nez v7, :cond_3

    .line 511
    .line 512
    invoke-static {}, Lx1/S;->t()Z

    .line 513
    .line 514
    .line 515
    move-result v7

    .line 516
    if-eqz v7, :cond_4

    .line 517
    .line 518
    :cond_3
    const-string v7, "active_mode_on"

    .line 519
    .line 520
    invoke-static {v7}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 521
    .line 522
    .line 523
    move-result-object v7

    .line 524
    new-instance v8, Lcom/android/quickstep/X3;

    .line 525
    .line 526
    invoke-direct {v8, v0}, Lcom/android/quickstep/X3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 527
    .line 528
    .line 529
    invoke-virtual {v3, v7, v8}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 530
    .line 531
    .line 532
    invoke-virtual {v3, v7, v6}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 533
    .line 534
    .line 535
    move-result v9

    .line 536
    iput-boolean v9, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNubiaActiveMode:Z

    .line 537
    .line 538
    new-instance v9, Ljava/lang/StringBuilder;

    .line 539
    .line 540
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 541
    .line 542
    .line 543
    const-string v10, "mNubiaActiveMode "

    .line 544
    .line 545
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    .line 547
    .line 548
    iget-boolean v10, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNubiaActiveMode:Z

    .line 549
    .line 550
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 551
    .line 552
    .line 553
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object v9

    .line 557
    invoke-static {v2, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    .line 559
    .line 560
    new-instance v2, Lcom/android/quickstep/Y3;

    .line 561
    .line 562
    invoke-direct {v2, v3, v7, v8}, Lcom/android/quickstep/Y3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 563
    .line 564
    .line 565
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 566
    .line 567
    .line 568
    :cond_4
    invoke-static {}, Lx1/O;->V1()Z

    .line 569
    .line 570
    .line 571
    move-result v2

    .line 572
    if-eqz v2, :cond_5

    .line 573
    .line 574
    const-string v2, "dynamic_island_switch_state"

    .line 575
    .line 576
    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 577
    .line 578
    .line 579
    move-result-object v2

    .line 580
    sget-object v7, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 581
    .line 582
    invoke-virtual {v7, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 583
    .line 584
    .line 585
    move-result-object v7

    .line 586
    check-cast v7, Lcom/android/launcher3/anim/C;

    .line 587
    .line 588
    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    .line 590
    .line 591
    new-instance v8, Lcom/android/quickstep/Z3;

    .line 592
    .line 593
    invoke-direct {v8, v7}, Lcom/android/quickstep/Z3;-><init>(Lcom/android/launcher3/anim/C;)V

    .line 594
    .line 595
    .line 596
    invoke-virtual {v3, v2, v8}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 597
    .line 598
    .line 599
    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 600
    .line 601
    .line 602
    move-result v9

    .line 603
    invoke-virtual {v7, v9}, Lcom/android/launcher3/anim/C;->s0(Z)V

    .line 604
    .line 605
    .line 606
    new-instance v7, Lcom/android/quickstep/f3;

    .line 607
    .line 608
    invoke-direct {v7, v3, v2, v8}, Lcom/android/quickstep/f3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 609
    .line 610
    .line 611
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 612
    .line 613
    .line 614
    goto :goto_2

    .line 615
    :cond_5
    invoke-static {}, Lx1/O;->U1()Z

    .line 616
    .line 617
    .line 618
    move-result v2

    .line 619
    if-eqz v2, :cond_6

    .line 620
    .line 621
    const-string v2, "time_format_mode"

    .line 622
    .line 623
    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 624
    .line 625
    .line 626
    move-result-object v2

    .line 627
    sget-object v7, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 628
    .line 629
    invoke-virtual {v7, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v7

    .line 633
    check-cast v7, Lcom/android/launcher3/anim/C;

    .line 634
    .line 635
    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    new-instance v8, Lcom/android/quickstep/h3;

    .line 639
    .line 640
    invoke-direct {v8, v7}, Lcom/android/quickstep/h3;-><init>(Lcom/android/launcher3/anim/C;)V

    .line 641
    .line 642
    .line 643
    invoke-virtual {v3, v2, v8}, Lcom/android/launcher3/util/p2;->n(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 644
    .line 645
    .line 646
    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/p2;->h(Landroid/net/Uri;)Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object v9

    .line 650
    invoke-virtual {v7, v9}, Lcom/android/launcher3/anim/C;->t0(Ljava/lang/String;)V

    .line 651
    .line 652
    .line 653
    new-instance v7, Lcom/android/quickstep/i3;

    .line 654
    .line 655
    invoke-direct {v7, v3, v2, v8}, Lcom/android/quickstep/i3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 656
    .line 657
    .line 658
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 659
    .line 660
    .line 661
    :cond_6
    :goto_2
    invoke-static {}, Lx1/O;->L1()Z

    .line 662
    .line 663
    .line 664
    move-result v2

    .line 665
    if-eqz v2, :cond_7

    .line 666
    .line 667
    const-string v2, "zte_global_wr_app_list"

    .line 668
    .line 669
    invoke-static {v2}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 670
    .line 671
    .line 672
    move-result-object v2

    .line 673
    new-instance v7, Lcom/android/quickstep/j3;

    .line 674
    .line 675
    invoke-direct {v7, v1}, Lcom/android/quickstep/j3;-><init>(Landroid/content/Context;)V

    .line 676
    .line 677
    .line 678
    invoke-virtual {v3, v2, v7}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 679
    .line 680
    .line 681
    new-instance v1, Lcom/android/quickstep/k3;

    .line 682
    .line 683
    invoke-direct {v1, v3, v2, v7}, Lcom/android/quickstep/k3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 684
    .line 685
    .line 686
    invoke-virtual {v4, v1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 687
    .line 688
    .line 689
    :cond_7
    new-instance v1, Lcom/android/quickstep/l3;

    .line 690
    .line 691
    invoke-direct {v1, v0}, Lcom/android/quickstep/l3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 692
    .line 693
    .line 694
    sget-object v2, Lcom/android/quickstep/RecentsAnimationDeviceState;->SETTINGS_HEALTHY_USE_PHONE:Landroid/net/Uri;

    .line 695
    .line 696
    invoke-virtual {v3, v2, v1}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 697
    .line 698
    .line 699
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getHealthyUsePhoneState()V

    .line 700
    .line 701
    .line 702
    new-instance v2, Lcom/android/quickstep/m3;

    .line 703
    .line 704
    invoke-direct {v2, v3, v1}, Lcom/android/quickstep/m3;-><init>(Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/p2$a;)V

    .line 705
    .line 706
    .line 707
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 708
    .line 709
    .line 710
    invoke-static {}, Lx1/O;->L3()Z

    .line 711
    .line 712
    .line 713
    move-result v1

    .line 714
    if-eqz v1, :cond_8

    .line 715
    .line 716
    invoke-static {}, Lx1/O;->P1()Z

    .line 717
    .line 718
    .line 719
    move-result v1

    .line 720
    if-nez v1, :cond_8

    .line 721
    .line 722
    const-string v1, "mfv_unlock_reason_type"

    .line 723
    .line 724
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 725
    .line 726
    .line 727
    move-result-object v1

    .line 728
    new-instance v2, Lcom/android/quickstep/n3;

    .line 729
    .line 730
    invoke-direct {v2, v0}, Lcom/android/quickstep/n3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 731
    .line 732
    .line 733
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 734
    .line 735
    .line 736
    iget-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 737
    .line 738
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 739
    .line 740
    .line 741
    move-result-object v7

    .line 742
    invoke-static {v7}, Lx1/O;->v4(Landroid/content/ContentResolver;)I

    .line 743
    .line 744
    .line 745
    new-instance v7, Lcom/android/quickstep/o3;

    .line 746
    .line 747
    invoke-direct {v7, v3, v1, v2}, Lcom/android/quickstep/o3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 748
    .line 749
    .line 750
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 751
    .line 752
    .line 753
    :cond_8
    invoke-static {}, Lx1/O;->k5()Z

    .line 754
    .line 755
    .line 756
    move-result v1

    .line 757
    if-eqz v1, :cond_9

    .line 758
    .line 759
    const-string v1, "one_shot_state"

    .line 760
    .line 761
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 762
    .line 763
    .line 764
    move-result-object v1

    .line 765
    new-instance v2, Lcom/android/quickstep/q3;

    .line 766
    .line 767
    invoke-direct {v2, v0}, Lcom/android/quickstep/q3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 768
    .line 769
    .line 770
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 771
    .line 772
    .line 773
    iget-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 774
    .line 775
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 776
    .line 777
    .line 778
    move-result-object v7

    .line 779
    invoke-static {v7}, Lx1/O;->t4(Landroid/content/ContentResolver;)I

    .line 780
    .line 781
    .line 782
    new-instance v7, Lcom/android/quickstep/r3;

    .line 783
    .line 784
    invoke-direct {v7, v3, v1, v2}, Lcom/android/quickstep/r3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 785
    .line 786
    .line 787
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 788
    .line 789
    .line 790
    const-string v1, "one_shot_has_main_image"

    .line 791
    .line 792
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 793
    .line 794
    .line 795
    move-result-object v1

    .line 796
    new-instance v2, Lcom/android/quickstep/t3;

    .line 797
    .line 798
    invoke-direct {v2, v0}, Lcom/android/quickstep/t3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 799
    .line 800
    .line 801
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 802
    .line 803
    .line 804
    iget-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 805
    .line 806
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 807
    .line 808
    .line 809
    move-result-object v7

    .line 810
    invoke-static {v7}, Lx1/O;->s4(Landroid/content/ContentResolver;)Z

    .line 811
    .line 812
    .line 813
    new-instance v7, Lcom/android/quickstep/u3;

    .line 814
    .line 815
    invoke-direct {v7, v3, v1, v2}, Lcom/android/quickstep/u3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 816
    .line 817
    .line 818
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 819
    .line 820
    .line 821
    :cond_9
    const-string v1, "zte_float"

    .line 822
    .line 823
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 824
    .line 825
    .line 826
    move-result-object v1

    .line 827
    new-instance v2, Lcom/android/quickstep/v3;

    .line 828
    .line 829
    invoke-direct {v2, v0}, Lcom/android/quickstep/v3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 830
    .line 831
    .line 832
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 833
    .line 834
    .line 835
    iget-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 836
    .line 837
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 838
    .line 839
    .line 840
    move-result-object v7

    .line 841
    invoke-static {v7}, Lx1/O;->g0(Landroid/content/ContentResolver;)I

    .line 842
    .line 843
    .line 844
    new-instance v7, Lcom/android/quickstep/w3;

    .line 845
    .line 846
    invoke-direct {v7, v3, v1, v2}, Lcom/android/quickstep/w3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 847
    .line 848
    .line 849
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 850
    .line 851
    .line 852
    const-string v1, "start_floatassist_way"

    .line 853
    .line 854
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 855
    .line 856
    .line 857
    move-result-object v1

    .line 858
    new-instance v2, Lcom/android/quickstep/x3;

    .line 859
    .line 860
    invoke-direct {v2, v0}, Lcom/android/quickstep/x3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 861
    .line 862
    .line 863
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 864
    .line 865
    .line 866
    iget-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 867
    .line 868
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 869
    .line 870
    .line 871
    move-result-object v7

    .line 872
    invoke-static {v7}, Lx1/O;->I0(Landroid/content/ContentResolver;)I

    .line 873
    .line 874
    .line 875
    new-instance v7, Lcom/android/quickstep/y3;

    .line 876
    .line 877
    invoke-direct {v7, v3, v1, v2}, Lcom/android/quickstep/y3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 878
    .line 879
    .line 880
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 881
    .line 882
    .line 883
    invoke-static {}, Lx1/O;->D3()Z

    .line 884
    .line 885
    .line 886
    move-result v1

    .line 887
    if-eqz v1, :cond_a

    .line 888
    .line 889
    const-string v1, "allow_start_hover_apps"

    .line 890
    .line 891
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 892
    .line 893
    .line 894
    move-result-object v1

    .line 895
    new-instance v2, Lcom/android/quickstep/z3;

    .line 896
    .line 897
    invoke-direct {v2, v0}, Lcom/android/quickstep/z3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 898
    .line 899
    .line 900
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 901
    .line 902
    .line 903
    iget-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 904
    .line 905
    invoke-static {v7}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getAllowHoverApps(Landroid/content/Context;)V

    .line 906
    .line 907
    .line 908
    new-instance v7, Lcom/android/quickstep/B3;

    .line 909
    .line 910
    invoke-direct {v7, v3, v1, v2}, Lcom/android/quickstep/B3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 911
    .line 912
    .line 913
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 914
    .line 915
    .line 916
    const-string v1, "hover_mode_running_state"

    .line 917
    .line 918
    invoke-static {v1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 919
    .line 920
    .line 921
    move-result-object v1

    .line 922
    new-instance v2, Lcom/android/quickstep/C3;

    .line 923
    .line 924
    invoke-direct {v2, v0}, Lcom/android/quickstep/C3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 925
    .line 926
    .line 927
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 928
    .line 929
    .line 930
    iget-object v7, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 931
    .line 932
    invoke-static {v7}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getIsInHoverMode(Landroid/content/Context;)V

    .line 933
    .line 934
    .line 935
    new-instance v7, Lcom/android/quickstep/D3;

    .line 936
    .line 937
    invoke-direct {v7, v3, v1, v2}, Lcom/android/quickstep/D3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 938
    .line 939
    .line 940
    invoke-virtual {v4, v7}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 941
    .line 942
    .line 943
    :cond_a
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 944
    .line 945
    .line 946
    move-result-object v1

    .line 947
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 948
    .line 949
    .line 950
    move-result v1

    .line 951
    if-eqz v1, :cond_d

    .line 952
    .line 953
    const-string v1, "zte_nprivacy_setting_open"

    .line 954
    .line 955
    invoke-static {v1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 956
    .line 957
    .line 958
    move-result-object v2

    .line 959
    new-instance v7, Lcom/android/quickstep/F3;

    .line 960
    .line 961
    invoke-direct {v7, v0}, Lcom/android/quickstep/F3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 962
    .line 963
    .line 964
    invoke-virtual {v3, v2, v7}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 965
    .line 966
    .line 967
    iget-object v8, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 968
    .line 969
    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 970
    .line 971
    .line 972
    move-result-object v9

    .line 973
    invoke-static {v9, v1, v6}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 974
    .line 975
    .line 976
    move-result v1

    .line 977
    if-ne v1, v5, :cond_b

    .line 978
    .line 979
    move v1, v5

    .line 980
    goto :goto_3

    .line 981
    :cond_b
    move v1, v6

    .line 982
    :goto_3
    invoke-static {v8, v1}, Lx1/Y;->o(Landroid/content/Context;Z)V

    .line 983
    .line 984
    .line 985
    new-instance v1, Lcom/android/quickstep/G3;

    .line 986
    .line 987
    invoke-direct {v1, v3, v2, v7}, Lcom/android/quickstep/G3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 988
    .line 989
    .line 990
    invoke-virtual {v4, v1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 991
    .line 992
    .line 993
    const-string v1, "psmode_notify_to_launcher"

    .line 994
    .line 995
    invoke-static {v1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 996
    .line 997
    .line 998
    move-result-object v2

    .line 999
    new-instance v7, Lcom/android/quickstep/H3;

    .line 1000
    .line 1001
    invoke-direct {v7}, Lcom/android/quickstep/H3;-><init>()V

    .line 1002
    .line 1003
    .line 1004
    invoke-virtual {v3, v2, v7}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 1005
    .line 1006
    .line 1007
    iget-object v0, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 1008
    .line 1009
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 1010
    .line 1011
    .line 1012
    move-result-object v0

    .line 1013
    invoke-static {v0, v1, v5}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 1014
    .line 1015
    .line 1016
    move-result v0

    .line 1017
    if-ne v0, v5, :cond_c

    .line 1018
    .line 1019
    move v6, v5

    .line 1020
    :cond_c
    invoke-static {v6}, Lx1/Y;->n(Z)V

    .line 1021
    .line 1022
    .line 1023
    new-instance v0, Lcom/android/quickstep/I3;

    .line 1024
    .line 1025
    invoke-direct {v0, v3, v2, v7}, Lcom/android/quickstep/I3;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 1026
    .line 1027
    .line 1028
    invoke-virtual {v4, v0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 1029
    .line 1030
    .line 1031
    :cond_d
    return-void
.end method

.method public static synthetic A(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$21(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$8(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$4(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ljava/lang/Runnable;Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 0

    .line 1
    and-int/lit8 p1, p3, 0x10

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic E(Lcom/android/quickstep/RecentsAnimationDeviceState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$25(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Lcom/android/quickstep/RecentsAnimationDeviceState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic I(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getMiniWindowList(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/android/quickstep/RecentsAnimationDeviceState;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$6(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$2(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$31(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$12(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic R(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mPipIsActive:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic a(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "psModeNotifyToLauncherChange privacyMode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "RecentsAnimationDeviceState"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Lx1/Y;->n(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$29(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$33(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private canStartAnyGesture()Z
    .locals 10

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const-wide/16 v3, 0x100

    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    const-wide/16 v3, 0x0

    .line 13
    .line 14
    cmp-long v1, v1, v3

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v5, 0x0

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 21
    .line 22
    .line 23
    move-result-wide v6

    .line 24
    const-wide/16 v8, 0x80

    .line 25
    .line 26
    and-long/2addr v6, v8

    .line 27
    cmp-long v1, v6, v3

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v1, v5

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    move v1, v2

    .line 35
    :goto_1
    const-wide v6, 0x408081844L

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 41
    .line 42
    .line 43
    move-result-wide v8

    .line 44
    and-long/2addr v6, v8

    .line 45
    cmp-long v3, v6, v3

    .line 46
    .line 47
    if-nez v3, :cond_3

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->checkStateIfGesture()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    const-string v0, "com.zte.mifavor.zsearch"

    .line 60
    .line 61
    filled-new-array {v0}, [Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isSpecifiedPackageOnTop([Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_3

    .line 70
    .line 71
    :cond_2
    return v2

    .line 72
    :cond_3
    return v5
.end method

.method private checkNeedNotifyChange()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x4

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    move v0, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v0, v1

    .line 19
    :goto_0
    iget-boolean v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->lastStatusBarState:Z

    .line 20
    .line 21
    if-eq v0, v3, :cond_3

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v4, "NotificationPanelExpand: "

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const-string v4, "RecentsAnimationDeviceState"

    .line 41
    .line 42
    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    if-eqz v3, :cond_2

    .line 50
    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    sget-object v4, Lcom/android/launcher3/H5$c;->h:Lcom/android/launcher3/H5$c;

    .line 62
    .line 63
    if-ne v3, v4, :cond_1

    .line 64
    .line 65
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->c1()V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lcom/android/launcher3/notification/NotificationListener;->t()V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v3, v2, v1}, Lcom/android/launcher3/H5;->n1(ZZ)V

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_1
    iput-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->lastStatusBarState:Z

    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$10(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$23(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$35(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/RecentsAnimationDeviceState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$14()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static getAllowHoverApps(Landroid/content/Context;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "allow_start_hover_apps"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    :goto_0
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sput-object p0, Lx1/O;->I1:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private getFingerPrintQuickAppState()V
    .locals 3

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "underfinger_quick_open_app_onoff"

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v0, 0x1

    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    move v1, v0

    .line 22
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lx1/O;->O4(Ljava/lang/Boolean;)V

    .line 27
    .line 28
    .line 29
    const-string v0, "RecentsAnimationDeviceState"

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v2, "onChange getFingerPrintQuickAppState fingerPrintQuickAppStatus: "

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :catch_0
    move-exception p0

    .line 53
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static getIsInHoverMode(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const-string v1, "hover_mode_running_state"

    .line 7
    .line 8
    invoke-static {p0, v1, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-ne p0, v1, :cond_0

    .line 14
    .line 15
    move v0, v1

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    :cond_0
    :goto_0
    sput-boolean v0, Lx1/O;->J1:Z

    .line 22
    .line 23
    return-void
.end method

.method private static getMiniWindowList(Landroid/content/Context;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "zte_global_wr_app_list"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    :goto_0
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/android/launcher3/resource/u1;->s:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/android/launcher3/resource/u1;->s:Ljava/util/ArrayList;

    .line 25
    .line 26
    const-string v1, ";"

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->q(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$15(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private keyguardShowing()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x40

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v1, "keyguardShowing: "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "RecentsAnimationDeviceState"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, p0}, Lcom/android/launcher3/H5;->q1(Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/Z;->P(Lcom/android/launcher3/util/Z$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$new$1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->unRegisterSettingObserver(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$new$10(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsUserSetupComplete:Z

    .line 2
    .line 3
    invoke-static {p1}, Lx1/O;->X4(Z)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v0, "onChangeListener mIsUserSetupComplete = "

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsUserSetupComplete:Z

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "RecentsAnimationDeviceState"

    .line 26
    .line 27
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic lambda$new$12(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "default_home"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sput-object p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mCurrentDefaultHome:Ljava/lang/String;

    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string p1, "defaultHomeChangeListener mCurrentDefaultHome= "

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    sget-object p1, Lcom/android/quickstep/RecentsAnimationDeviceState;->mCurrentDefaultHome:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "RecentsAnimationDeviceState"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private synthetic lambda$new$14()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mPipListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$new$15(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNubiaActiveMode:Z

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "onChangeListenerActiveMode  mNubiaActiveMode= "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNubiaActiveMode:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "RecentsAnimationDeviceState"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic lambda$new$2(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "onChangeListener mIsOneHandedModeEnabled= "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "RecentsAnimationDeviceState"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic lambda$new$21(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getHealthyUsePhoneState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$23(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lx1/O;->v4(Landroid/content/ContentResolver;)I

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$new$25(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lx1/O;->t4(Landroid/content/ContentResolver;)I

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$new$27(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lx1/O;->s4(Landroid/content/ContentResolver;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$new$29(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lx1/O;->g0(Landroid/content/ContentResolver;)I

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$new$31(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lx1/O;->I0(Landroid/content/ContentResolver;)I

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$new$33(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getAllowHoverApps(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$new$35(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getIsInHoverMode(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$new$37(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "newPrivateSpaceOpenChange enabled: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "RecentsAnimationDeviceState"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {p0, p1}, Lx1/Y;->o(Landroid/content/Context;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic lambda$new$4(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIfHalfOneHandedType:Z

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "onTypeChangeListener mIfHalfOneHandedType= "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIfHalfOneHandedType:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "RecentsAnimationDeviceState"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic lambda$new$6(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mZoomOneHandedTriggered:Z

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v0, "onModeChangeListenerString mZoomOneHandedTriggered= \""

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, "\""

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "RecentsAnimationDeviceState"

    .line 32
    .line 33
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic lambda$new$8(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsSwipeToNotificationEnabled:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic lambda$showSlideTwiceMessage$42()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsToastShown:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$37(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->q(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private registerSettingObserver(Landroid/content/Context;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 2
    .line 3
    const-string v1, "RecentsAnimationDeviceState"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, "registerSettingObserver"

    .line 9
    .line 10
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/android/launcher3/util/j2;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    new-instance v4, Lcom/android/quickstep/T3;

    .line 20
    .line 21
    invoke-direct {v4, p0}, Lcom/android/quickstep/T3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 22
    .line 23
    .line 24
    const-string v5, "game_mode_key_lock"

    .line 25
    .line 26
    invoke-direct {v0, v3, v4, v5, v2}, Lcom/android/launcher3/util/j2;-><init>(Landroid/content/ContentResolver;Lcom/android/launcher3/util/j2$a;Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/util/j2;->d()V

    .line 32
    .line 33
    .line 34
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v3, "super_power_save_mode"

    .line 39
    .line 40
    invoke-static {v3}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 45
    .line 46
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v3, "assist_touch_gesture_enabled"

    .line 54
    .line 55
    invoke-static {v3}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 60
    .line 61
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v3, "launcher_home_recent_lock"

    .line 69
    .line 70
    invoke-static {v3}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 75
    .line 76
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const-string v3, "cc_game_mis_operate"

    .line 84
    .line 85
    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 90
    .line 91
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const-string v3, "nubia_game_ban_naviges"

    .line 99
    .line 100
    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 105
    .line 106
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    const-string v3, "nubia_game_scene"

    .line 114
    .line 115
    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 120
    .line 121
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-string v3, "app_mirror_status"

    .line 129
    .line 130
    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 135
    .line 136
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const-string v3, "cc_nubia_game_key"

    .line 144
    .line 145
    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 150
    .line 151
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    const-string v3, "default_home"

    .line 159
    .line 160
    invoke-static {v3}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 165
    .line 166
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const-string v3, "gesture_bottom_indicator"

    .line 174
    .line 175
    invoke-static {v3}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 180
    .line 181
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    const-string v3, "gesture_trigger_need_twice"

    .line 189
    .line 190
    invoke-static {v3}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 195
    .line 196
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const-string v3, "display_gaussian_blur"

    .line 204
    .line 205
    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 210
    .line 211
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    const-string v3, "zgesture_double_tap_to_sleep"

    .line 219
    .line 220
    invoke-static {v3}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 225
    .line 226
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 227
    .line 228
    .line 229
    sget-boolean v0, Lx1/O;->T:Z

    .line 230
    .line 231
    if-eqz v0, :cond_1

    .line 232
    .line 233
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    const-string v3, "shield_full_screen_gesture_enable"

    .line 238
    .line 239
    invoke-static {v3}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 244
    .line 245
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 246
    .line 247
    .line 248
    goto :goto_0

    .line 249
    :catch_0
    move-exception p0

    .line 250
    goto :goto_1

    .line 251
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    const-string v3, "split_screen_black_list"

    .line 256
    .line 257
    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 258
    .line 259
    .line 260
    move-result-object v3

    .line 261
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 262
    .line 263
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 264
    .line 265
    .line 266
    invoke-static {}, Lx1/S;->r()Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-eqz v0, :cond_2

    .line 271
    .line 272
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    if-nez v0, :cond_2

    .line 277
    .line 278
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    const-string v3, "gcs_need_kill_game_launcher"

    .line 283
    .line 284
    invoke-static {v3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 289
    .line 290
    invoke-virtual {v0, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 291
    .line 292
    .line 293
    :cond_2
    invoke-static {}, Lx1/O;->C2()Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_3

    .line 298
    .line 299
    sget-boolean v0, Lf1/c;->a:Z

    .line 300
    .line 301
    if-nez v0, :cond_3

    .line 302
    .line 303
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    const-string v0, "underfinger_quick_open_app_onoff"

    .line 308
    .line 309
    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 314
    .line 315
    invoke-virtual {p1, v0, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 316
    .line 317
    .line 318
    return-void

    .line 319
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 320
    .line 321
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 322
    .line 323
    .line 324
    const-string v0, "registerSettingObserver: "

    .line 325
    .line 326
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    .line 342
    .line 343
    :cond_3
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/android/quickstep/RecentsAnimationDeviceState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$showSlideTwiceMessage$42()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private unRegisterSettingObserver(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string p1, "unRegisterSettingObserver: "

    .line 2
    .line 3
    const-string v0, "RecentsAnimationDeviceState"

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSettingsObserver:Lcom/android/launcher3/util/j2;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/util/j2;->e()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static synthetic v(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/p2$a;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->SETTINGS_HEALTHY_USE_PHONE:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic z(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->lambda$new$27(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addNavigationModeChangedCallback(Ljava/lang/Runnable;)Lcom/android/launcher3/util/Z$b;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/Q3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/Q3;-><init>(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/Z;->o(Lcom/android/launcher3/util/Z$b;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public canStartSystemGesture()Z
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getSysuiStateFlag() = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "RecentsAnimationDeviceState"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    const-wide/16 v2, 0x2

    .line 35
    .line 36
    and-long/2addr v0, v2

    .line 37
    const-wide/16 v2, 0x0

    .line 38
    .line 39
    cmp-long v0, v0, v2

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    const-wide/32 v4, 0x20000

    .line 48
    .line 49
    .line 50
    and-long/2addr v0, v4

    .line 51
    cmp-long v0, v0, v2

    .line 52
    .line 53
    if-nez v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/quickstep/RotationTouchHelper;->isTaskListFrozen()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canStartAnyGesture()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_1

    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    return p0

    .line 71
    :cond_1
    const/4 p0, 0x0

    .line 72
    return p0
.end method

.method public canStartTrackpadGesture()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide v2, 0x200000000L

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v0, v2

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canStartAnyGesture()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public canTriggerAssistantAction(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "mAssistantAvailable = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mAssistantAvailable:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " isLockToAppActive = "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isLockToAppActive()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, " mTriggerVoiceAssistant = "

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    sget-boolean v1, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTriggerVoiceAssistant:Z

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "RecentsAnimationDeviceState"

    .line 43
    .line 44
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mAssistantAvailable:Z

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    invoke-static {v0, v1}, Lcom/android/systemui/shared/system/QuickStepContract;->isAssistantGestureDisabled(J)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Lcom/android/quickstep/RotationTouchHelper;->touchInAssistantRegion(Landroid/view/MotionEvent;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    invoke-static {p1}, Lcom/android/launcher3/H4;->d(Landroid/view/MotionEvent;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isLockToAppActive()Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-nez p0, :cond_1

    .line 80
    .line 81
    sget-boolean p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTriggerVoiceAssistant:Z

    .line 82
    .line 83
    if-eqz p0, :cond_1

    .line 84
    .line 85
    invoke-static {}, Lx1/O;->p1()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_0

    .line 90
    .line 91
    invoke-static {}, Lx1/O;->o1()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_1

    .line 96
    .line 97
    :cond_0
    invoke-static {}, Lf1/b;->a()Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_1

    .line 102
    .line 103
    const/4 p0, 0x1

    .line 104
    return p0

    .line 105
    :cond_1
    const/4 p0, 0x0

    .line 106
    return p0
.end method

.method public canTriggerAssistantActionForCourse(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->touchInAssistantRegion(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public canTriggerOneHandedAction(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeSupported:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isKeyguardShowingOrOccluded()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v3, "canTriggerOneHandedAction = "

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, " "

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v4, "RecentsAnimationDeviceState"

    .line 39
    .line 40
    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-boolean v2, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 44
    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v5, "canTriggerOneHandedAction "

    .line 61
    .line 62
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-object v5, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 66
    .line 67
    invoke-virtual {v5, p1}, Lcom/android/quickstep/RotationTouchHelper;->touchInOneHandedModeRegion(Landroid/view/MotionEvent;)Z

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v3, v0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->touchInOneHandedModeRegion(Landroid/view/MotionEvent;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_1

    .line 96
    .line 97
    iget-object p0, v0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 98
    .line 99
    iget p1, p0, Landroid/graphics/Point;->x:I

    .line 100
    .line 101
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 102
    .line 103
    if-ge p1, p0, :cond_1

    .line 104
    .line 105
    const/4 p0, 0x1

    .line 106
    return p0

    .line 107
    :cond_1
    return v1
.end method

.method public clearSysUIStateFlagsForDisplay(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSysUIStateFlagsPerDisplay:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public dump(Ljava/io/PrintWriter;)V
    .locals 6

    .line 1
    const-string v0, "DeviceState:"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "  canStartSystemGesture="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canStartSystemGesture()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v1, "  systemUiFlagsForDefaultDisplay="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v1, "  systemUiFlagsDesc="

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v1, "  assistantAvailable="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mAssistantAvailable:Z

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v1, "  assistantDisabled="

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 111
    .line 112
    .line 113
    move-result-wide v1

    .line 114
    invoke-static {v1, v2}, Lcom/android/systemui/shared/system/QuickStepContract;->isAssistantGestureDisabled(J)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    const-string v1, "  isOneHandedModeEnabled="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    const-string v1, "  isSwipeToNotificationEnabled="

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsSwipeToNotificationEnabled:Z

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    const-string v1, "  deferredGestureRegion="

    .line 178
    .line 179
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget-object v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDeferredGestureRegion:Landroid/graphics/Region;

    .line 183
    .line 184
    invoke-virtual {v1}, Landroid/graphics/Region;->getBounds()Landroid/graphics/Rect;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 201
    .line 202
    .line 203
    const-string v1, "  exclusionRegion="

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-object v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionRegion:Landroid/graphics/Region;

    .line 209
    .line 210
    invoke-virtual {v1}, Landroid/graphics/Region;->getBounds()Landroid/graphics/Rect;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .line 228
    .line 229
    const-string v1, "  pipIsActive="

    .line 230
    .line 231
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mPipIsActive:Z

    .line 235
    .line 236
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    new-instance v0, Ljava/lang/StringBuilder;

    .line 247
    .line 248
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 249
    .line 250
    .line 251
    const-string v1, "  predictiveBackToHomeInProgress="

    .line 252
    .line 253
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsPredictiveBackToHomeInProgress:Z

    .line 257
    .line 258
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSysUIStateFlagsPerDisplay:Ljava/util/Map;

    .line 269
    .line 270
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    if-eqz v1, :cond_0

    .line 283
    .line 284
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    check-cast v1, Ljava/lang/Integer;

    .line 289
    .line 290
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    new-instance v2, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 297
    .line 298
    .line 299
    const-string v3, "  systemUiFlagsForDisplay"

    .line 300
    .line 301
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    const-string v4, "="

    .line 308
    .line 309
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {p0, v1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateFlags(I)J

    .line 313
    .line 314
    .line 315
    move-result-wide v4

    .line 316
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    new-instance v2, Ljava/lang/StringBuilder;

    .line 327
    .line 328
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    const-string v3, "Desc="

    .line 338
    .line 339
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {p0, v1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateFlags(I)J

    .line 343
    .line 344
    .line 345
    move-result-wide v3

    .line 346
    invoke-virtual {p0, v3, v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateString(J)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    goto :goto_0

    .line 361
    :cond_0
    const-string v0, "  RotationTouchHelper:"

    .line 362
    .line 363
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 367
    .line 368
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->dump(Ljava/io/PrintWriter;)V

    .line 369
    .line 370
    .line 371
    return-void
.end method

.method public getAssistantVisibility()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mAssistantVisibility:F

    .line 2
    .line 3
    return p0
.end method

.method public getDisplayGaussianBlurState()V
    .locals 3

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "display_gaussian_blur"

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    :cond_0
    invoke-static {v1}, Lx1/O;->M4(Z)V

    .line 22
    .line 23
    .line 24
    const-string v0, "RecentsAnimationDeviceState"

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "getDisplayGaussianBlurState displayGaussianBlurState:"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public getDisplaysWithSysUIState()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSysUIStateFlagsPerDisplay:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDoubleTapToScreenOffState()V
    .locals 3

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "zgesture_double_tap_to_sleep"

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v0, 0x1

    .line 19
    if-ne v0, p0, :cond_0

    .line 20
    .line 21
    move v1, v0

    .line 22
    :cond_0
    invoke-static {v1}, Lx1/O;->N4(Z)V

    .line 23
    .line 24
    .line 25
    const-string v0, "RecentsAnimationDeviceState"

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v2, "getDoubleTapToScreenOffState doubleTapToScreenOffState:"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catch_0
    move-exception p0

    .line 49
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public getGestureBottomIndicatorStatus()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "gesture_bottom_indicator"

    .line 12
    .line 13
    iget p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->GESTURE_BOTTOM_INDICATOR_DEFAULT_VALUE:I

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Lx1/O;->V4(Z)V

    .line 25
    .line 26
    .line 27
    const-string v0, "RecentsAnimationDeviceState"

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v2, "getGestureBottomIndicatorStatus showGestureBottomIndicator: "

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    move-exception p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public getHealthyUsePhoneState()V
    .locals 3

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->SETTINGS_HEALTHY_USE_PHONE:Landroid/net/Uri;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v0, 0x7

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    if-ne p0, v0, :cond_1

    .line 23
    .line 24
    :cond_0
    const/4 v1, 0x1

    .line 25
    :cond_1
    invoke-static {v1}, Lx1/O;->Q4(Z)V

    .line 26
    .line 27
    .line 28
    const-string p0, "RecentsAnimationDeviceState"

    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v2, "getHealthyUsePhoneState: "

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catch_0
    move-exception p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public getIgnoreStylusGesture()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "shield_full_screen_gesture_enable"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    move v2, v1

    .line 22
    :cond_0
    iput-boolean v2, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIgnorestylusGesture:Z

    .line 23
    .line 24
    const-string p0, "RecentsAnimationDeviceState"

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "getIgnoreStylusGesture sheildStatus:"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public getIgnorestylusGesture()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIgnorestylusGesture:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMode()Lcom/android/launcher3/util/C1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNavBarPosition()Lcom/android/quickstep/util/NavBarPosition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRedMagicGameKeyState()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "gcs_need_kill_game_launcher"

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v2, 0x0

    .line 18
    :goto_0
    invoke-static {v2}, Lx1/S;->y(Z)V

    .line 19
    .line 20
    .line 21
    const-string v0, "RecentsAnimationDeviceState"

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v3, "getRedMagicGameKeyState gameKeyState: "

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, "-default_home "

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v2, "default_home"

    .line 48
    .line 49
    invoke-static {p0, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :catch_0
    move-exception p0

    .line 65
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public getSplitScreenBlackList()V
    .locals 3

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "split_screen_black_list"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->updateSplitBlackWhiteList(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "RecentsAnimationDeviceState"

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "getSplitScreenBlackList: "

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public getSquaredTouchSlop()F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getTouchSlop()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    mul-float/2addr p0, p0

    .line 6
    return p0
.end method

.method public getSystemUiStateFlags(I)J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSysUIStateFlagsPerDisplay:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-wide/32 v0, 0x10000000

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    return-wide p0
.end method

.method public getSystemUiStateString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSystemUiStateString(J)Ljava/lang/String;
    .locals 0

    .line 2
    invoke-static {p1, p2}, Lcom/android/systemui/shared/system/QuickStepContract;->getSystemUiStateString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSysuiStateFlag()J
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSystemUiStateFlags(I)J

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    return-wide v0
.end method

.method public getTouchSlop()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const v0, 0x3fb4fdf4    # 1.414f

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/high16 v0, 0x40400000    # 3.0f

    .line 12
    .line 13
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    iget-object v2, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPNHCustomSlopMultiplier()Ljava/util/Optional;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Ljava/util/Optional;->isPresent()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPNHCustomSlopMultiplier()Ljava/util/Optional;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/lang/Float;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    mul-float/2addr p0, v0

    .line 53
    mul-float/2addr p0, v1

    .line 54
    return p0

    .line 55
    :cond_1
    mul-float/2addr v0, v1

    .line 56
    return v0
.end method

.method public getVoiceAssistantStatus()V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lx1/O;->n1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-boolean v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTriggerVoiceAssistant:Z

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v1, "assist_touch_gesture_enabled"

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 v1, 0x1

    .line 28
    if-ne p0, v1, :cond_1

    .line 29
    .line 30
    move v2, v1

    .line 31
    :cond_1
    sput-boolean v2, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTriggerVoiceAssistant:Z

    .line 32
    .line 33
    const-string p0, "RecentsAnimationDeviceState"

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v2, "getVoiceAssistantStatus oldStatusTriggerVoiceAssistant: "

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v0, " mTriggerVoiceAssistant: "

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    sget-boolean v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTriggerVoiceAssistant:Z

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :catch_0
    move-exception p0

    .line 67
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 68
    .line 69
    .line 70
    :goto_0
    return-void
.end method

.method public ifIgnoreOtherActivityGesture()Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/RotationTouchHelper;->getCurrentActiveRotation()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifNeedHomeToGameLauncher()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "RecentsAnimationDeviceState"

    .line 12
    .line 13
    const/4 v3, 0x3

    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x1

    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsToastShown:Z

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 29
    .line 30
    if-ne p0, v3, :cond_6

    .line 31
    .line 32
    const-string p0, "RedMagic Need to swipe twice, and cancel the event"

    .line 33
    .line 34
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return v5

    .line 38
    :cond_1
    :goto_0
    return v4

    .line 39
    :cond_2
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsToastShown:Z

    .line 40
    .line 41
    if-nez v1, :cond_6

    .line 42
    .line 43
    iget v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    if-eq v1, v6, :cond_3

    .line 47
    .line 48
    invoke-static {}, Lx1/O;->r1()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_3

    .line 53
    .line 54
    if-eq v0, v3, :cond_3

    .line 55
    .line 56
    if-eq v0, v5, :cond_3

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isStatusBarHidden()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsFullScreenSlideTwiceOn:Z

    .line 66
    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->sIgnoreSlideTwice:[Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isSpecifiedPackageOnTop([Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_5

    .line 76
    .line 77
    :cond_4
    iget p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 78
    .line 79
    if-ne p0, v6, :cond_6

    .line 80
    .line 81
    :cond_5
    const-string p0, "Need to swipe twice, and cancel the event"

    .line 82
    .line 83
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    return v5

    .line 87
    :cond_6
    :goto_1
    return v4
.end method

.method public ifNeedHomeToGameLauncher()Z
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, La1/d;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "com.cmcc.tvlauncher"

    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDefaultHomePackage:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const-string v0, "com.komect.ajlauncher"

    .line 26
    .line 27
    iget-object v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDefaultHomePackage:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDefaultHomePackage:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    move v0, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move v0, v1

    .line 52
    :goto_0
    iget-object v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 53
    .line 54
    invoke-static {v3}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Lcom/android/launcher3/util/n1;->i()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_3

    .line 63
    .line 64
    iget v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 65
    .line 66
    const/4 v4, 0x2

    .line 67
    if-eq v3, v4, :cond_2

    .line 68
    .line 69
    iget p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 70
    .line 71
    const/4 v3, 0x3

    .line 72
    if-eq p0, v3, :cond_2

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    :cond_2
    return v2

    .line 77
    :cond_3
    return v1
.end method

.method public ifNeedIgnoreGestureFullScreen()Z
    .locals 3

    .line 1
    invoke-static {}, Lx1/S;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lx1/S;->o()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->refreshIgnoreFullScreen(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/launcher3/util/n1;->h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_6

    .line 33
    .line 34
    iget v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    if-eq v0, v1, :cond_5

    .line 38
    .line 39
    iget v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 40
    .line 41
    const/4 v2, 0x2

    .line 42
    if-eq v0, v2, :cond_2

    .line 43
    .line 44
    iget v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 45
    .line 46
    const/4 v2, 0x3

    .line 47
    if-ne v0, v2, :cond_3

    .line 48
    .line 49
    :cond_2
    const-string v0, "cn.nubia.gamelauncher"

    .line 50
    .line 51
    filled-new-array {v0}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isSpecifiedPackageOnTop([Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_5

    .line 60
    .line 61
    :cond_3
    const-string v0, "com.zjkd.smartlauncher"

    .line 62
    .line 63
    sget-object v2, Lcom/android/quickstep/RecentsAnimationDeviceState;->mCurrentDefaultHome:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    invoke-static {}, Lx1/O;->B3()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    :cond_4
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isIgnoreAppOnTop()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-nez p0, :cond_5

    .line 82
    .line 83
    const-string p0, "com.zte.usmartlauncher"

    .line 84
    .line 85
    sget-object v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mCurrentDefaultHome:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_6

    .line 92
    .line 93
    invoke-static {}, Lx1/O;->N3()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_6

    .line 98
    .line 99
    :cond_5
    return v1

    .line 100
    :cond_6
    const/4 p0, 0x0

    .line 101
    return p0
.end method

.method public ifSwipeMoveStartRecents()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lx1/S;->p(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    array-length v0, v0

    .line 25
    if-gt v0, v1, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSwipeMoveStartRecentsList:[Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isSpecifiedPackageOnTop([Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    :goto_0
    return v1
.end method

.method public isAccessibilityMenuAvailable()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x10

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isAccessibilityMenuShortcutAvailable()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x20

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isAssistantGestureIsConstrained()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x2000

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isBubblesExpanded()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x4000

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isButtonNavMode()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

.method public isFullyGesturalNavMode()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

.method public isGesturalNavMode()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/util/C1;->g:Z

    .line 4
    .line 5
    return p0
.end method

.method public isGestureBlockedTask(Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;)Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mGestureBlockingTaskId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return v2

    .line 8
    :cond_0
    invoke-static {}, LH2/c;->n()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mGestureBlockingTaskId:I

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->topGroupedTaskContainsTask(I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    return v2

    .line 27
    :cond_2
    if-eqz p1, :cond_3

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getTaskId()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mGestureBlockingTaskId:I

    .line 34
    .line 35
    if-ne p1, p0, :cond_3

    .line 36
    .line 37
    return v1

    .line 38
    :cond_3
    return v2
.end method

.method public isHomeDisabled()Z
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getSysuiStateFlag(): "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "RecentsAnimationDeviceState"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    const-wide/16 v2, 0x100

    .line 32
    .line 33
    and-long/2addr v0, v2

    .line 34
    const-wide/16 v2, 0x0

    .line 35
    .line 36
    cmp-long p0, v0, v2

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method protected isIgnoreAppOnTop()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->sIgnoreApps:[Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v2, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->sIgnorePackages:[Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 26
    .line 27
    invoke-virtual {v4}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return v1

    .line 45
    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v1, "isIgnoreAppOnTop? runningTaskInfo topAty "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string v0, "RecentsAnimationDeviceState"

    .line 65
    .line 66
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    return p0
.end method

.method public isImeRenderingNavButtons()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mCanImeRenderGesturalNavButtons:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/32 v2, 0x40000

    .line 16
    .line 17
    .line 18
    and-long/2addr v0, v2

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long p0, v0, v2

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public isInDeferredGestureRegion(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDeferredGestureRegion:Landroid/graphics/Region;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    float-to-int v0, v0

    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    float-to-int p1, p1

    .line 13
    invoke-virtual {p0, v0, p1}, Landroid/graphics/Region;->contains(II)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public isInExclusionRegion(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionRegion:Landroid/graphics/Region;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    float-to-int v0, v0

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    float-to-int p1, p1

    .line 19
    invoke-virtual {p0, v0, p1}, Landroid/graphics/Region;->contains(II)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public isKeyguardShowingOccluded()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x200

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isKeyguardShowingOrOccluded()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x240

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isLockToAppActive()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->isLockToAppActive()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isOneHandedModeActive()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/32 v2, 0x10000

    .line 6
    .line 7
    .line 8
    and-long/2addr v0, v2

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long p0, v0, v2

    .line 12
    .line 13
    if-eqz p0, :cond_0

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

.method public isOneHandedModeEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsOneHandedModeEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOverviewDisabled()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x80

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isPipActive()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mPipIsActive:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPredictiveBackToHomeInProgress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsPredictiveBackToHomeInProgress:Z

    .line 2
    .line 3
    return p0
.end method

.method public isScreenPinningActive()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public varargs isSpecifiedActivityOnTop([Landroid/content/ComponentName;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    array-length v0, p1

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_2

    .line 10
    .line 11
    aget-object v3, p1, v2

    .line 12
    .line 13
    if-eqz v3, :cond_1

    .line 14
    .line 15
    iget-object v4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 16
    .line 17
    invoke-virtual {v4, v3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    return v1
.end method

.method public varargs isSpecifiedPackageOnTop([Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    new-instance p1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v0, "isSpecifiedPackageOnTop? runningTaskInfo top package "

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "RecentsAnimationDeviceState"

    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_1
    return v0
.end method

.method public isStatusBarHidden()Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mStatusBarHidden:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x4

    .line 10
    .line 11
    and-long/2addr v0, v2

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    const-wide/16 v4, 0x800

    .line 23
    .line 24
    and-long/2addr v0, v4

    .line 25
    cmp-long v0, v0, v2

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    const-wide/16 v4, 0x100

    .line 34
    .line 35
    and-long/2addr v0, v4

    .line 36
    cmp-long v0, v0, v2

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    const-wide/16 v4, 0x80

    .line 45
    .line 46
    and-long/2addr v0, v4

    .line 47
    cmp-long p0, v0, v2

    .line 48
    .line 49
    if-nez p0, :cond_1

    .line 50
    .line 51
    :cond_0
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_1
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method public isSwipeToNotificationEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsSwipeToNotificationEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSystemUiDialogShowing()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/32 v2, 0x8000

    .line 6
    .line 7
    .line 8
    and-long/2addr v0, v2

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long p0, v0, v2

    .line 12
    .line 13
    if-eqz p0, :cond_0

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

.method public isTopActivityWeChat()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivityWeChat:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUserSetupComplete()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsUserSetupComplete:Z

    .line 2
    .line 3
    return p0
.end method

.method public mayTriggerFullScreenToWindow(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->C2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->y0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->e0:Z

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->G0()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->touchInLeftAssistantRegion(Landroid/view/MotionEvent;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 1

    .line 1
    and-int/lit8 p1, p3, 0x12

    .line 2
    .line 3
    const/4 p3, 0x1

    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 11
    .line 12
    sget-object p1, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/ActiveGestureLog;->setIsFullyGesturalNavMode(Z)V

    .line 19
    .line 20
    .line 21
    new-instance p1, Lcom/android/quickstep/util/NavBarPosition;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 24
    .line 25
    invoke-direct {p1, v0, p2}, Lcom/android/quickstep/util/NavBarPosition;-><init>(Lcom/android/launcher3/util/C1;Lcom/android/launcher3/util/Z$c;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 31
    .line 32
    sget-object p2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 33
    .line 34
    if-ne p1, p2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->registerExclusionListener()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->unregisterExclusionListener()V

    .line 41
    .line 42
    .line 43
    :goto_0
    sget-object p1, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 54
    .line 55
    if-ne v0, p2, :cond_1

    .line 56
    .line 57
    move p2, p3

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 p2, 0x0

    .line 60
    :goto_1
    invoke-virtual {p1, p2}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->handleNavigationGestureChanged(Z)V

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-virtual {p0, p3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->onSettingsChanged(Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public onGestureExclusionChanged(Landroid/graphics/Region;Landroid/graphics/Region;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    sget-object p1, Lcom/android/quickstep/util/GestureExclusionManager;->EMPTY_REGION:Landroid/graphics/Region;

    .line 5
    .line 6
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionRegion:Landroid/graphics/Region;

    .line 7
    .line 8
    return-void
.end method

.method public onOneHandedModeChanged(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->setGesturalHeight(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected onSettingsChanged(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getGestureBottomIndicatorStatus()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getVoiceAssistantStatus()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->refreshIgnoreFullScreen(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getDisplayGaussianBlurState()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getDoubleTapToScreenOffState()V

    .line 20
    .line 21
    .line 22
    sget-boolean p1, Lx1/O;->T:Z

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getIgnoreStylusGesture()V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSplitScreenBlackList()V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lx1/S;->r()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getRedMagicGameKeyState()V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-static {}, Lx1/O;->C2()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    sget-boolean p1, Lf1/c;->a:Z

    .line 54
    .line 55
    if-nez p1, :cond_2

    .line 56
    .line 57
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getFingerPrintQuickAppState()V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public refreshIgnoreFullScreen(Landroid/content/Context;)V
    .locals 10

    .line 1
    const-string v0, "RecentsAnimationDeviceState"

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "game_mode_key_lock"

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    move v4, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v4, v3

    .line 20
    :goto_0
    if-nez v4, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    const-string v5, "super_power_save_mode"

    .line 27
    .line 28
    invoke-static {v4, v5, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-ne v4, v2, :cond_1

    .line 33
    .line 34
    move v5, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v5, v3

    .line 37
    :goto_1
    move v9, v5

    .line 38
    move v5, v4

    .line 39
    move v4, v9

    .line 40
    goto :goto_2

    .line 41
    :catch_0
    move-exception p0

    .line 42
    goto/16 :goto_5

    .line 43
    .line 44
    :cond_2
    move v5, v3

    .line 45
    :goto_2
    if-nez v4, :cond_4

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    const-string v6, "launcher_home_recent_lock"

    .line 52
    .line 53
    invoke-static {v4, v6, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-ne v4, v2, :cond_3

    .line 58
    .line 59
    move v6, v2

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v6, v3

    .line 62
    goto :goto_3

    .line 63
    :cond_4
    move v6, v4

    .line 64
    move v4, v3

    .line 65
    :goto_3
    new-instance v7, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v8, "-gameLock-"

    .line 71
    .line 72
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v1, "-superPower-"

    .line 79
    .line 80
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v1, "-homeRecentLock-"

    .line 87
    .line 88
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 95
    .line 96
    sget-object v4, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 97
    .line 98
    if-ne v1, v4, :cond_5

    .line 99
    .line 100
    iget-object v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDefaultHomePackage:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p1, v6, v1, v7}, Lx1/S;->w(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/StringBuilder;)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    goto :goto_4

    .line 107
    :cond_5
    move v1, v3

    .line 108
    :goto_4
    iput v1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mNeedIgnoreFullScreenType:I

    .line 109
    .line 110
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    const-string v1, "gesture_trigger_need_twice"

    .line 115
    .line 116
    invoke-static {p1, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    const-string v1, "-secondSlideTouchStatus-"

    .line 121
    .line 122
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    if-nez p1, :cond_6

    .line 129
    .line 130
    iget-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mMode:Lcom/android/launcher3/util/C1;

    .line 131
    .line 132
    if-ne p1, v4, :cond_6

    .line 133
    .line 134
    iget-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 135
    .line 136
    invoke-static {p1}, Lx1/S;->p(Landroid/content/Context;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-nez p1, :cond_6

    .line 141
    .line 142
    move v3, v2

    .line 143
    :cond_6
    iput-boolean v3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsFullScreenSlideTwiceOn:Z

    .line 144
    .line 145
    new-instance p0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string p1, "refreshIgnoreFullScreen: "

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :goto_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .line 170
    .line 171
    const-string v1, "refreshIgnoreFullScreen exception:"

    .line 172
    .line 173
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public registerExclusionListener()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionListenerRegistered:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionManager:Lcom/android/quickstep/util/GestureExclusionManager;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/GestureExclusionManager;->addListener(Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionListenerRegistered:Z

    .line 13
    .line 14
    return-void
.end method

.method public removeDisplayInfoChangeListener(Lcom/android/launcher3/util/Z$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z;->P(Lcom/android/launcher3/util/Z$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAssistantAvailable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mAssistantAvailable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setAssistantVisibility(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mAssistantVisibility:F

    .line 2
    .line 3
    return-void
.end method

.method public setDefaultHomePackage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDefaultHomePackage:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDeferredGestureRegion(Landroid/graphics/Region;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDeferredGestureRegion:Landroid/graphics/Region;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Region;->set(Landroid/graphics/Region;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setGestureBlockingTaskId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mGestureBlockingTaskId:I

    .line 2
    .line 3
    return-void
.end method

.method public setPredictiveBackToHomeInProgress(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsPredictiveBackToHomeInProgress:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSysUIStateFlagsForDisplay(JI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mSysUIStateFlagsPerDisplay:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public showSlideTwiceMessage()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsToastShown:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIsToastShown:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {v0}, Lx1/S;->k(Landroid/content/Context;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mContext:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const v2, 0x7f140362

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 36
    .line 37
    .line 38
    :cond_1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Lcom/android/quickstep/R3;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Lcom/android/quickstep/R3;-><init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V

    .line 47
    .line 48
    .line 49
    const-wide/16 v2, 0x7d0

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public supportsAssistantGestureInButtonNav()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/Flags;->threeButtonCornerSwipe()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public unregisterExclusionListener()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionListenerRegistered:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionManager:Lcom/android/quickstep/util/GestureExclusionManager;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/GestureExclusionManager;->removeListener(Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mExclusionListenerRegistered:Z

    .line 13
    .line 14
    return-void
.end method

.method protected updateTopActivity(Landroid/app/TaskInfo;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Landroid/app/TaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 9
    .line 10
    new-instance p1, Landroid/content/ComponentName;

    .line 11
    .line 12
    const-string v0, "com.tencent.mm.ui.LauncherUI"

    .line 13
    .line 14
    const-string v1, "com.tencent.mm"

    .line 15
    .line 16
    invoke-direct {p1, v1, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/content/ComponentName;

    .line 20
    .line 21
    const-string v2, "com.tencent.mm.ui.chatting.ChattingUI"

    .line 22
    .line 23
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    filled-new-array {p1, v0}, [Landroid/content/ComponentName;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isSpecifiedActivityOnTop([Landroid/content/ComponentName;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivityWeChat:Z

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 38
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivity:Landroid/content/ComponentName;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mTopActivityWeChat:Z

    .line 42
    .line 43
    const-string p0, "RecentsAnimationDeviceState"

    .line 44
    .line 45
    const-string p1, "getActivityOnTop: taskInfo ref is null "

    .line 46
    .line 47
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method
